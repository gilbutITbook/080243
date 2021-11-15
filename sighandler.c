#include <signal.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include "sighandler.h"

#define SH_PAIR(X, D) [X] = { .name = #X, .desc = "" D "", }

/**
 ** @brief Array that holds names and descriptions of the
 ** standard C signals
 **
 ** Conditionally, we also add some commonly used signals.
 **/
sh_pair const sh_pairs[] = {
  /* Execution errors */
  SH_PAIR(SIGFPE, "erroneous arithmetic operation"),
  SH_PAIR(SIGILL, "invalid instruction"),
  SH_PAIR(SIGSEGV, "invalid access to storage"),
#ifdef SIGBUS
  SH_PAIR(SIGBUS, "bad address"),
#endif
  /* Job control */
  SH_PAIR(SIGABRT, "abnormal termination"),
  SH_PAIR(SIGINT, "interactive attention signal"),
  SH_PAIR(SIGTERM, "termination request"),
#ifdef SIGKILL
  SH_PAIR(SIGKILL, "kill signal"),
#endif
#ifdef SIGQUIT
  SH_PAIR(SIGQUIT, "keyboard quit"),
#endif
#ifdef SIGSTOP
  SH_PAIR(SIGSTOP, "stop process"),
#endif
#ifdef SIGCONT
  SH_PAIR(SIGCONT, "continue if stopped"),
#endif
#ifdef SIGINFO
  SH_PAIR(SIGINFO, "status information request"),
#endif
};

size_t const sh_known = (sizeof sh_pairs/sizeof sh_pairs[0]);

#if ATOMIC_LONG_LOCK_FREE > 1
_Atomic(unsigned long) sh_counts[sizeof sh_pairs/sizeof sh_pairs[0]];
# define SH_COU " (%lu times),"
#else
# define SH_COU "%0.0lu,"
#endif

void sh_count(int);
unsigned long sh_counted(int);

#define SH_HEAD "\r%s:%zu: "
#define SH_DOC "\t%s,\t%s"


void sh_print(FILE* io, int sig,
              char const* filename, size_t line,
              char const* string) {
  char const* doc =
    (sig < sh_known && sh_pairs[sig].name)
    ? sh_pairs[sig].desc
    : "unknown signal number";
  if (errno) {
    char const* err = strerror(errno);
    errno = 0;
    if (!sig)
      fprintf(io, SH_HEAD "\t%s:\t%s\n", filename, line,
              string, err);
    else if (sig < sh_known && sh_pairs[sig].name)
      fprintf(io, SH_HEAD "%s" SH_COU SH_DOC ":\t%s\n", filename, line,
              sh_pairs[sig].name, sh_counted(sig), doc, string, err);
    else
      fprintf(io, SH_HEAD "#%d" SH_COU SH_DOC ":\t%s\n", filename, line,
              sig, sh_counted(sig), doc, string, err);
  } else {
    if (!sig)
      fprintf(io, SH_HEAD "\t%s\n", filename, line,
              string);
    else if (sig < sh_known && sh_pairs[sig].name)
      fprintf(io, SH_HEAD "%s" SH_COU SH_DOC "\n", filename, line,
              sh_pairs[sig].name, sh_counted(sig), doc, string);
    else
      fprintf(io, SH_HEAD "#%d" SH_COU SH_DOC "\n", filename, line,
              sig, sh_counted(sig), doc, string);
  }
}

/**
 ** @ brief Enables a signal handler and catches the errors
 **/
sh_handler* sh_enable(int sig, sh_handler* hnd) {
  sh_handler* ret = signal(sig, hnd);
  if (ret == SIG_ERR) {
    SH_PRINT(stderr, sig, "failed");
    errno = 0;
  } else if (ret == SIG_IGN) {
    SH_PRINT(stderr, sig, "previously ignored");
  } else if (ret && ret != SIG_DFL) {
    SH_PRINT(stderr, sig, "previously set otherwise");
  } else {
      SH_PRINT(stderr, sig, "ok");
  }
  return ret;
}
