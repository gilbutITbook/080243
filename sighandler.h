#ifndef SIGHANDLER_H
#define SIGHANDLER_H 1

#include <signal.h>
#include <stdio.h>
#ifndef __STDC_NO_ATOMIC__
# include <stdatomic.h>
#endif

/**
 ** @brief A pair of strings to hold signal information
 **/
typedef struct sh_pair sh_pair;
struct sh_pair {
  char const* name;
  char const* desc;
};

/**
 ** @brief For each possible signal, this holds a pair of strings with
 ** signal information.
 **
 ** The size of this array can be queried with ::sh_known.
 **
 ** @see SH_PRINT to use that information.
 **/
extern sh_pair const sh_pairs[];

extern size_t const sh_known;

#if ATOMIC_LONG_LOCK_FREE > 1
/**
 ** @brief Keep track of the number of calls into a
 **  signal handler for each possible signal.
 **
 ** Don't use this array directly.
 **
 ** @see sh_count to update this information.
 ** @see SH_PRINT to use that information.
 **/
extern _Atomic(unsigned long) sh_counts[];

/**
 ** @brief Use this in your signal handler to keep track of the
 ** number of calls to the signal @a sig.
 **
 ** @see sh_counted to use that information.
 **/
inline
void sh_count(int sig) {
  if (sig < sh_known) ++sh_counts[sig];
}

inline
unsigned long sh_counted(int sig){
  return (sig < sh_known) ? sh_counts[sig] : 0;
}

#else
inline
void sh_count(int sig) {
  // empty
}

inline
unsigned long sh_counted(int sig){
  return 0;
}
#endif

/**
 ** @brief Prototype of signal handlers
 **/
typedef void sh_handler(int);

/**
 ** @brief Pretty-prints signal information
 **
 ** @see PRINT_SIG for a convenient user interface
 **/
void sh_print(FILE* io, int sig,
              char const* filename, size_t line,
              char const* string);

/**
 ** @brief Pretty-prints signal information
 **
 ** This prints signal information @a STRING for signal @a SIG to
 ** stream @a IO.
 **/
#define SH_PRINT(IO, SIG, STRING) sh_print(IO, SIG, __FILE__, __LINE__, STRING)

/**
 ** @ brief Enables a signal handler and catches the errors
 **/
sh_handler* sh_enable(int sig, sh_handler* hnd);


#endif
