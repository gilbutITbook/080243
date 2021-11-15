// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module mtx = C◼thrd◼mtx
#pragma CMOD import tspec = C◼time◼spec


#pragma CMOD mimic !defined(__STDC_NO_THREADS__),<threads.h>

#pragma CMOD typedef mtx=mtx_t


#pragma CMOD defexp PLAIN	=◼ONCE_FLAG_INIT, mtx_plain
#pragma CMOD defexp RECURSIVE	=◼ONCE_FLAG_INIT, mtx_recursive
#pragma CMOD defexp TIMED	=◼ONCE_FLAG_INIT, mtx_timed

#pragma CMOD alias destroy	=	mtx_destroy
#pragma CMOD alias init		=	mtx_init
#pragma CMOD alias lock		=	mtx_lock
#pragma CMOD alias timedlock	=	mtx_timedlock
#pragma CMOD alias trylock	=	mtx_trylock
#pragma CMOD alias unlock	=	mtx_unlock

#pragma CMOD defreg \2=\(mtx_\([a-z_0-9]*\)\)

#pragma CMOD declaration

#ifndef C◼thrd◼NO_THREADS

enum constants {
  plain		= PLAIN,
  recursive	= RECURSIVE,
  timed		= TIMED,
};


void destroy(mtx*);
int init(mtx*, int);
int lock(mtx*);
int timedlock(mtx*restrict,  tspec const*restrict);
int trylock(mtx*);
int unlock(mtx*);


#endif
