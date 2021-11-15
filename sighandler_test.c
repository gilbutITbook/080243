#include <signal.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include "sighandler.h"

#ifndef SIGNALS
#define SIGNALS sh_known
#endif

/**
 ** @brief A simple signal handler mechanism.
 **
 ** This just raises a flag when a signal is caught.
 **
 ** All real processing of the signal has to be done
 ** in an event loop.
 **/
static sig_atomic_t volatile received;

static void signal_handler(int sig) {
  received = sig;
  switch (sig) {
#ifdef SIGQUIT
  case SIGQUIT: exit(EXIT_FAILURE);
#endif
  case SIGTERM: quick_exit(EXIT_FAILURE);
  case SIGABRT: _Exit(EXIT_FAILURE);
  default:
    /* reset the handling to its default */
    signal(sig, SIG_DFL);
    return;
  case SIGINT:  return;
  }
}

static
void signal_atexit(void) {
  SH_PRINT(stderr, received, "atexit handler");
}

static
void signal_at_quick_exit(void) {
  SH_PRINT(stderr, received, "at_quick_exit handler");
}

int main(int argc, char* argv[argc+1]) {
  atexit(signal_atexit);
  at_quick_exit(signal_at_quick_exit);
  for (unsigned i = 1; i < SIGNALS; ++i)
    sh_enable(i, signal_handler);
  SH_PRINT(stderr, SIGNALS-1, "highest known signal number");

  size_t const Gi = (1ull<<30);
  for(size_t step = 0; step < 10*Gi; ++step) {
    if (!(step%Gi)) printf("step %zu\n", step);
    switch (received) {
    case SIGINT:
      fprintf(stderr, "\ryou called?\n");
      received = 0;
    case 0:
      continue;
    }
    SH_PRINT(stderr, received, "is somebody trying to kill us?");
    raise(received);
    break;
  }
  SH_PRINT(stderr, received, "we survived");
  return EXIT_SUCCESS;
}
