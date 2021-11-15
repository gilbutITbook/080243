// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module rwlock =	C◼atomic◼rwlock
#pragma CMOD import ato   =	C◼atomic
#pragma CMOD import		C◼bool
#pragma CMOD import io	=	C◼io
#pragma CMOD import sig	=	C◼sig

/**
 ** @file
 **
 ** @brief Implement a simple rw lock that can be used thread safe.
 **
 ** @remark This function is implemented by means of a lock-free
 ** atomic, if the platform supports this.
 **
 ** If the platform doesn't support any lock-free atomic @c int, this
 ** data structure might not be lock-free, either. Operations
 ** tryrdlock() or trywrlock(), are guaranteed to have obtained the
 ** lock completely if they return @c true, so they are safe to use in
 ** the context of a signal handler or initialization function if they
 ** are undone by unrdlock() or unwrlock(), respectively, before
 ** returning from that function.
 **
 ** If they return @c false, there can be different reasons:
 **
 ** - The lock is already taken.
 ** - Somebody, maybe the same thread in case of a signal handler, is
 **   in the middle of modifying the object. This can only happen if
 **   not lock-free.
 ** - There are already more than unsigned◼MAX/2 readers.
 **
 ** In particular, in the not lock-free case if calls to tryrdlock()
 ** and trywrlock() are interlaced, both calls may fail and no lock
 ** will be taken.
 **
 ** @warning rdlock() and wrlock() are active waits.
 **
 ** In total this interface supplies six different functions,
 ** {rd|wr}lock(), try{rd|wr}lock() and un{rd|wr}lock(). Versions with
 ** @c rd are for read-only access, the others for exclusive write.
 **
 ** @remark This interface is somewhat unconventional as there is a
 ** distinction in two different unlock functions. This is intended to
 ** ease the implementation and to force the user of this to be always
 ** clear if this has been locked read-only or exclusive-write.
 **
 ** If the macro ::C◼atomic◼rwlock◼LOCK_FREE evaluates to @c 2 this
 ** data structure is lock-free.
 **/


#pragma CMOD declaration

#ifndef C◼atomic◼NO_ATOMICS

#define LOCK_FREE C◼atomic◼INT_LOCK_FREE

/* This has just the highest bit 1 and all others 0. */
# define HIGHBIT ((-1U)/2U+1U)
# define HIGHBIT1 ((-1U)/2U)

struct rwlock {
  unsigned  volatile _Atomic lck;
};

#define INIT { ato◼INIT(0), }

inline bool trywrlock(rwlock* lck) {
  signed used = 0;
  return ato◼compare_exchange_weak(&lck->lck, &used, HIGHBIT);
}

inline void unwrlock(rwlock* lck) {
  lck->lck ^= HIGHBIT;
}

inline void wrlock(rwlock* lck) {
  do { /* spin */ } while (!trywrlock(lck));
}

inline bool tryrdlock(rwlock* lck) {
  unsigned used = lck->lck;
  return (used < HIGHBIT1) && ato◼compare_exchange_weak(&lck->lck, &used, used+1);
}

inline void unrdlock(rwlock* lck) {
  lck->lck--;
}

inline void rdlock(rwlock* lck) {
  do { /* spin */ } while (!tryrdlock(lck));
}

#endif
