// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module cnd = C◼thrd◼cnd
#pragma CMOD import mtx = C◼thrd◼mtx
#pragma CMOD import tspec = C◼time◼spec


#pragma CMOD mimic !defined(__STDC_NO_THREADS__),<threads.h>

#pragma CMOD typedef cnd=cnd_t

#pragma CMOD alias broadcast	=	cnd_broadcast
#pragma CMOD alias destroy	=	cnd_destroy
#pragma CMOD alias init		=	cnd_init
#pragma CMOD alias signal	=	cnd_signal
#pragma CMOD alias timedwait	=	cnd_timedwait
#pragma CMOD alias wait		=	cnd_wait

#pragma CMOD defreg \2=\(cnd_\([a-z_0-9]*\)\)

#pragma CMOD declaration

#ifndef C◼thrd◼NO_THREADS

int broadcast(cnd*);
void destroy(cnd*);
int init(cnd*);
int signal(cnd*);
int timedwait(cnd*restrict, mtx*restrict, tspec const*restrict);
int wait(cnd*, mtx*);

#endif
