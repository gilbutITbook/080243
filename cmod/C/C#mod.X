// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module 		C◼mod
#pragma CMOD import str	=	C◼str
#pragma CMOD import lib	=	C◼lib
#pragma CMOD import mem	=	C◼mem
#pragma CMOD import rwlock=	C◼atomic◼rwlock
#pragma CMOD import		C◼bool
#pragma CMOD import io	=	C◼io

/**
 ** @file
 ** @brief Implement module facilities.
 **
 ** These are features that have no correspondence in the C standard
 ** library, since this concerns utilities for Modular C.
 **/


#pragma CMOD init init
#pragma CMOD atexit atexit
#pragma CMOD at_quick_exit atexit

#ifndef C◼atomic◼NO_ATOMICS
static rwlock readers     = rwlock◼INIT;
#endif

static char* separator = 0;
static char const def[] = "◼";

/**
 ** @brief Set an execution wide separator for demangling composed
 ** identifiers.
 **
 ** Although this changes global state this procedure is thread safe
 ** if the platform supports atomics. It is asynchronous signal safe,
 ** if in addition atomic @c int is lock-free.
 **
 ** @return rep, if successful. Otherwise, if there are too many
 ** active calls for demangling, the global state is not changed, and
 ** @c 0 is returned.
 **
 ** This function never promulgates its global state.
 **
 ** @param rep is a pointer to a string. The function copies the value
 ** of that string, @a sep can safely be overwritten or freed
 ** afterwards.
 **/
char const* set(char const* rep) {
#ifndef C◼atomic◼NO_ATOMICS
  if (!rwlock◼trywrlock(&readers)) return 0;
#endif
  // replace the contents
  if (!rep) rep = def;
  C◼size const len = str◼len(rep);
  char* ret = lib◼malloc(len + 1);
  if (ret) {
    mem◼cpy(ret, rep, len+1);
    lib◼free(separator);
    separator = ret;
  }
#ifndef C◼atomic◼NO_ATOMICS
  rwlock◼unwrlock(&readers);
#endif
  return ret ? rep : 0;
}

void init(void) {
  set(0);
}

void atexit(void) {
#ifndef C◼atomic◼NO_ATOMICS
  rwlock◼wrlock(&readers);
#endif
  // doit
  lib◼free(separator);
  separator = 0;
#ifndef C◼atomic◼NO_ATOMICS
  rwlock◼unwrlock(&readers);
#endif
}


/**
 ** @brief Demangle a mangled composed identifier into its components.
 **
 ** Similar to ::demangle but with finer control of the buffer to
 ** which the demangled string is written.
 **
 ** @return If all goes well returns @a target, otherwise @a source.
 **/
char const* demangle4(C◼size tlen, char target[tlen], char const source[], char const sep0[]) {
  static char const pref[] = "_ZN2_C";
  static char const suff[] = "E";
  char const* ret = source;
  char const* sep = sep0;
  /* If no separator is provided, use the default. Therefore we must
     place a read-lock on the default separator, such nobody frees it
     while we are working with it. */
  if (!sep) {
    // take a read lock
#ifndef C◼atomic◼NO_ATOMICS
    if (!rwlock◼tryrdlock(&readers)) {
      return ret;
    } else
#endif
      {
      if (separator) {
        sep = separator;
      } else {
        goto CLEANUP;
      }
    }
  }
  char* stop = target+tlen-1;
  if (str◼len(source) > (sizeof pref) && !mem◼cmp(source, pref, (sizeof pref)-1)) {
    char* t = target;
    for (char const*p = source-1 + sizeof pref; t < stop; ) {
      char* q = 0;
      C◼size len = str◼toull(p, &q, 10);
      if (q) p = q;
      else break;
      if (t+len >= stop)
        len = stop-t;
      mem◼cpy(t, p, len);
      t += len;
      p += len;
      if (t >= stop)
        break;
      if (!str◼cmp(p, suff)) {
        t[0] = 0;
        break;
      } else {
        for (char const*s = sep; t < stop && *s; ++s, ++t)
          t[0] = s[0];
      }
    }
    t[0] = 0;
    ret = target;
  }
  CLEANUP:
  // release the read lock if we had taken it
#ifndef C◼atomic◼NO_ATOMICS
  if (!sep0) rwlock◼unrdlock(&readers);
#endif
  return ret;
}

#pragma CMOD declaration


#define demangle_(SOUR, SEP, ...) demangle4(256, (char[256]){ 0 }, (SOUR), (SEP))

/**
 ** @brief Demangle a mangled composed identifier into its components.
 **
 ** This returns a string that has the components of its first
 ** argument separated by a separator. This separator can either be
 ** given as the second argument, or, if that is @c 0 or omitted, is
 ** chosen from a per process default value that can be set with
 ** ::C◼mod◼set.
 **
 ** To ensure that setting the separator doesn't result in a race
 ** condition, this function uses a lock to protect that separator. If
 ** this lock can't be acquired, this function returns the source
 ** argument.
 **
 ** If all goes well, this returns the string in a temporary buffer
 ** that is valid in the scope where the call to this macro is found.
 **
 ** @see demangle4 if you need finer control of the target buffer
 **/
#define demangle(...) demangle_(__VA_ARGS__, 0,)
