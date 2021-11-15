// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module thrd	=	C◼thrd
#pragma CMOD import tspec	= 	C◼time◼spec
#pragma CMOD import 			C◼noreturn

#pragma CMOD mimic !defined(__STDC_NO_THREADS__),<threads.h>

#pragma CMOD defexp NO_THREADS=◼__STDC_NO_THREADS__, __STDC_NO_THREADS__


#pragma CMOD defexp TIMEDOUT=◼ONCE_FLAG_INIT, thrd_timedout
#pragma CMOD defexp SUCCESS=◼ONCE_FLAG_INIT, thrd_success
#pragma CMOD defexp BUSY=◼ONCE_FLAG_INIT, thrd_busy
#pragma CMOD defexp ERROR=◼ONCE_FLAG_INIT, thrd_error
#pragma CMOD defexp NOMEM=◼ONCE_FLAG_INIT, thrd_nomem

#pragma CMOD typedef thrd=thrd_t
#pragma CMOD typedef start=thrd_start_t

#pragma CMOD alias create=thrd_create
#pragma CMOD alias current=thrd_current
#pragma CMOD alias detach=thrd_detach
#pragma CMOD alias equal=thrd_equal
#pragma CMOD alias exit=thrd_exit
#pragma CMOD alias join=thrd_join
#pragma CMOD alias sleep=thrd_sleep
#pragma CMOD alias yield=thrd_yield

#pragma CMOD defreg \2=\(thrd_\([a-z_0-9]*\)\)

#pragma CMOD declaration

#ifndef NO_THREADS

#define local	_Thread_local

enum constants {
  timedout = TIMEDOUT,
  success  = SUCCESS,
  busy     = BUSY,
  error    = ERROR,
  nomem    = NOMEM,
};

int create(thrd*, start, void*);
thrd current(void);
int detach(thrd);
int (equal)(thrd, thrd);
noreturn void exit(int);
int join(thrd, int*);
int sleep(tspec const*, tspec*);
void yield(void);


#endif
