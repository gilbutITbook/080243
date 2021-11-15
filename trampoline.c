#include "trampoline.h"

#define _GNU_SOURCE
#include <signal.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdatomic.h>
#include <ucontext.h>
#include <string.h>

#ifdef __x86_64__
# define TRAMP_IP REG_RIP
# define TRAMP_SP REG_RSP
#else
# define TRAMP_IP REG_EIP
# define TRAMP_SP REG_ESP
#endif

static FILE* trp_debug = 0;
static trampoline_type** trp_table = 0;
static size_t* trp_size = 0;
static struct sigaction const* trp_old = 0;
static _Thread_local _Atomic(void const*) trp_data = 0;
static _Atomic(size_t) trp_act = 0;
static _Atomic(size_t) trp_max = 0;

/* Instantiation */
void* trampoline_sink(void* d);

#define TRACE(F, ...)                           \
  (trp_debug                                    \
   ? fprintf(trp_debug,                         \
             "%s:%lu:\t" F "\n",                \
             __func__, __LINE__+0UL,            \
             __VA_ARGS__)                       \
   : 0)

void const* trampoline_context(void* x) {
  return atomic_exchange(&trp_data, x);
}


void trampoline_reserve(size_t n) {
  trp_max += n;
}

size_t trampoline_index(_Atomic(size_t)* loc, trampoline_type* f, size_t s) {
  size_t val = 0;
  TRACE("starting: %p, %zu, %zu", (void*)f, *loc, val);
  if (atomic_compare_exchange_strong(loc, &val, SIZE_MAX)) {
    val = ++trp_act;
    *loc = val;
    trp_table[val] = f;
    trp_size[val] = s;
    TRACE("we are first: %zu", val);
  } else {
    // busy loop
    while(val == SIZE_MAX)
      val = *loc;
    if (trp_table[val] != f || trp_size[val] != s)
      raise(SIGILL);
    TRACE("we came late: %zu", val);
  }
  return val;
}

static
int sigprint(int signo, siginfo_t *si, ucontext_t* context) {
  char const* sp = context->uc_stack.ss_sp;
  size_t size = context->uc_stack.ss_size;
  bool si_onStack = (sp <= (char*)si->si_addr) && ((char*)si->si_addr < sp+size);
  char const* SP = (char const*)context->uc_mcontext.gregs[TRAMP_SP];
  bool SP_onStack = (sp <= SP) && (SP < sp+size);
  return
    TRACE("signal %d, (%d, %d), address %p", signo, si->si_signo, si->si_code, si->si_addr)
    + TRACE("IP is %#llx", (unsigned long long){ context->uc_mcontext.gregs[TRAMP_IP] })
    + TRACE("SP is %#llx", (unsigned long long){ context->uc_mcontext.gregs[TRAMP_SP] })
    + TRACE("stack is located %p -> %p", sp, sp+size)
    + TRACE("si_addr is %s stack", (si_onStack ? "on" : "outside"))
    + TRACE("SP is %s stack", (SP_onStack ? "on" : "outside"));
}

#define SIGPRINT(NO, SI, CO) (trp_debug ? sigprint(NO, SI, CO) : 0)

static
void sighandler_report(int signo, siginfo_t *si, void* c) {
  sigaction(signo, (struct sigaction[1]){ [0] = *trp_old, }, 0);
  fputs("severe error during trampoline setup", stderr);
  ucontext_t* context = c;
  SIGPRINT(signo, si, context);
}

#define ACTION ((struct sigaction){                                     \
   .sa_sigaction = sighandler,                                          \
   .sa_flags = SA_ONSTACK | SA_SIGINFO | SA_RESTART | SA_RESETHAND,     \
   })

static
void sighandler(int signo, siginfo_t *si, void* c) {
  ucontext_t* context = c;
  SIGPRINT(signo, si, context);
  size_t* idxp = si->si_addr;
  TRACE("trampoline index %zu", *idxp);
  if (context->uc_mcontext.gregs[TRAMP_IP] == (greg_t)si->si_addr) {
    /* We know now that we faulted because rip was not
       accessible. Check if this is one of the validated contexts. */
    TRACE("trampoline found %p", idxp);
    if (si->si_code == SEGV_ACCERR) {
      if (idxp && *idxp <= trp_act) {
        TRACE("trampoline index %zu, %p", *idxp, *(int**)(idxp+1));
        trp_data = idxp;
        /* change the instruction pointer to the function that we
           found, reestablish the signal handler for future use and
           return to the fault. This should now execute our desired
           function. */
        context->uc_mcontext.gregs[TRAMP_IP] = (greg_t)trp_table[*idxp];
        SIGPRINT(signo, si, context);
        sigaction(signo, &ACTION, 0);
      } else {
        TRACE("trampoline %p is invalid", idxp);
      }
    } else {
      TRACE("trampoline %p is not mapped?", idxp);
    }
    TRACE("trampoline %p, returing", idxp);
    return;
  } else {
    /* This is not an fault of calling the pointer. Try to invoke the
       previous signal handler if possible. Otherwise the default
       handler kicks in. */
    if (trp_old) {
        if (trp_old->sa_sigaction && (trp_old->sa_flags&SA_SIGINFO)) {
          if (trp_debug) fputs("calling previous sigaction", trp_debug);
          trp_old->sa_sigaction(signo, si, c);
        } else if (trp_old->sa_handler) {
          if (trp_debug) fputs("calling previous handler", trp_debug);
          trp_old->sa_handler(signo);
        }
    } else {
      char volatile* addr = si->si_addr;
      /* Reproduce the same access fault for exactly the same
         address. Now the default handler should kick in. It may e.g
         repair the fault by mapping a new page at the address. */
      TRACE("trampoline reissue fault at %p without establishing a handler", addr);
      (void)addr[0];
    }
  }
  /* If we survived all this reestablish our handler and return. At
     the original point of failure this shouldn't fault anymore. */
  sigaction(signo, &ACTION, 0);
}

static
void trp_stop(void) {
  TRACE("stopping %zu registered trampoline%s",
                   trp_act,
                   trp_act == 1 ? "" : "s");
  if (trp_old) {
    TRACE("reestablish previous handler, %p", trp_old);
    sigaction(SIGSEGV, (struct sigaction[1]){ [0] = *trp_old, }, 0);
    free((void*)trp_old);
  } else {
    TRACE("%s", "switching back to default handler");
    signal(SIGSEGV, SIG_DFL);
  }
  free(trp_table);
  free(trp_size);
}

__attribute__((constructor(1002)))
static
void trp_start(void) {
  atexit(trp_stop);
#ifdef DEBUG
  trp_debug = stderr;
#endif
  stack_t prev;
  /* If there is not yet an alternative signal stack, create it. */
  sigaltstack(0, &prev);
  if (!prev.ss_sp) {
    enum { trampoline_stksz = 10*SIGSTKSZ, };
    static
      char trampoline_stk[trampoline_stksz] = { 0 };

    stack_t alt = {
      .ss_sp = &trampoline_stk[0],
      .ss_size = 10*SIGSTKSZ,
    };
    sigaltstack(&alt, 0);
  }
  TRACE("max trampoline: %zu",  trp_max);
  trp_table = calloc(trp_max, sizeof *trp_table);
  trp_size = calloc(trp_max, sizeof *trp_size);
  struct sigaction* ttrp_old = malloc(sizeof *ttrp_old);
  sigaction(SIGSEGV, &ACTION, ttrp_old);
  if (ttrp_old->sa_sigaction || ttrp_old->sa_sigaction)
    trp_old = ttrp_old;
  else
    free((void*)ttrp_old);
  TRACE("trp_old handler: %p",  trp_old);
}

/* Just some small test code. */

TRAMPOLINE_DECLARE({
    int val;
    double vol;
  })
(int, fun, val, vol)
(void);

TRAMPOLINE_DEFINE(int, fun, void) ({
    TRACE("val %d, vol %g", TRAM(val), TRAM(vol));
    TRAM(vol) += 1;
    return TRAM(val);
})

TRAMPOLINE_DECLARE({
    int val;
    double vol;
  })
(int, fin, val, vol)
(void);

TRAMPOLINE_DEFINE(int, fin, void) ({
    TRACE("val %d, vol %g", TRAM(val), TRAM(vol));
    return TRAM(val);
})

int main(int argc,char ** argv)
{
  enum { early = 1, sec = 2, crash = 4 };
  unsigned long cntrl = (argc > 1 ? strtoul(argv[1], 0, 0) : 0);
  if (cntrl & early) return 0;
  int val = 67;
  double vol = 55;
  __typeof__(fun)* fan = TRAMPOLINE_POINTER(fun, val, vol);
  printf("%d\n", fan());
  val = 34;
  if (!(cntrl & sec))
    printf("%d\n", TRAMPOLINE_POINTER(fun, val, vol)());
  else
    printf("%d\n", TRAMPOLINE_POINTER(fin, val, vol)());
  printf("%d\n", fan());
  /* This should segfault normally because there is no defined
     context. */
  if (cntrl & crash) printf("%d\n", fun());
  return 0;
}
