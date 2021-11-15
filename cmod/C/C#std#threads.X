// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼threads
#pragma CMOD import C◼thrd
#pragma CMOD import C◼thrd◼once
#pragma CMOD import C◼thrd◼mtx
#pragma CMOD import C◼thrd◼cnd
#pragma CMOD import C◼thrd◼tss

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#ifdef C◼thrd◼NO_THREADS
# define __STDC_NO_THREADS__ C◼thrd◼NO_THREADS
#else

#define thread_local	C◼thrd◼local

typedef C◼thrd◼once	once_flag;
#define ONCE_FLAG_INIT	C◼thrd◼once◼INIT

#define call_once	C◼thrd◼once◼call

typedef C◼thrd◼cnd cnd_t;

#define cnd_broadcast	C◼thrd◼cnd◼broadcast
#define cnd_destroy	C◼thrd◼cnd◼destroy
#define cnd_init	C◼thrd◼cnd◼init
#define cnd_signal	C◼thrd◼cnd◼signal
#define cnd_timedwait	C◼thrd◼cnd◼timedwait
#define cnd_wait	C◼thrd◼cnd◼wait


typedef C◼thrd◼mtx mtx_t;

#define mtx_plain	C◼thrd◼mtx◼plain
#define mtx_recursive	C◼thrd◼mtx◼recursive
#define mtx_timed	C◼thrd◼mtx◼timed


#define 	mtx_destroy	C◼thrd◼mtx◼destroy
#define 	mtx_init	C◼thrd◼mtx◼init
#define 	mtx_lock	C◼thrd◼mtx◼lock
#define 	mtx_timedlock	C◼thrd◼mtx◼timedlock
#define 	mtx_trylock	C◼thrd◼mtx◼trylock
#define 	mtx_unlock	C◼thrd◼mtx◼unlock


typedef C◼thrd thrd_t;
typedef C◼thrd◼start thrd_start_t;

#define thrd_busy	C◼thrd◼busy
#define thrd_error	C◼thrd◼error
#define thrd_nomem	C◼thrd◼nomem
#define thrd_success	C◼thrd◼success
#define thrd_timedout	C◼thrd◼timedout

#define thrd_create	C◼thrd◼create
#define thrd_current	C◼thrd◼current
#define thrd_detach	C◼thrd◼detach
#define thrd_equal	C◼thrd◼equal
#define thrd_exit	C◼thrd◼exit
#define thrd_join	C◼thrd◼join
#define thrd_sleep	C◼thrd◼sleep
#define thrd_yield	C◼thrd◼yield


typedef C◼thrd◼tss◼dtor tss_dtor_t;
typedef C◼thrd◼tss	tss_t;
#define TSS_DTOR_ITERATIONS	C◼thrd◼tss◼DTOR_ITERATIONS

#define tss_create	C◼thrd◼tss◼create
#define tss_delete	C◼thrd◼tss◼delete
#define tss_get	C◼thrd◼tss◼get
#define tss_set	C◼thrd◼tss◼set

#endif
