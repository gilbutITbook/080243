// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module flag = C◼atomic◼flag
#pragma CMOD import atomic = C◼atomic
#pragma CMOD import C◼align
#pragma CMOD import C◼char
#pragma CMOD import C◼short
#pragma CMOD import C◼int
#pragma CMOD import C◼long
#pragma CMOD import llong  = C◼llong

#pragma CMOD mimic !defined(__STDC_NO_ATOMICS__),<stdatomic.h>
#pragma CMOD mimic <string.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp SIZE	=	◼ATOMIC_FLAG_INIT, sizeof(atomic_flag)
#pragma CMOD defexp ALIGN	=	◼ATOMIC_FLAG_INIT, alignof(atomic_flag)
#pragma CMOD defexp ZERO_INIT	=	◼ATOMIC_FLAG_INIT, !memcmp(({static atomic_flag f[1]; atomic_flag_clear(f); f; }), (char[sizeof(atomic_flag[1])]){ 0 }, sizeof(atomic_flag[1]))



#pragma CMOD define _INIT=ATOMIC_FLAG_INIT

#pragma CMOD defreg \2=\(atomic_flag_\([a-z_0-9]*\)\)

#pragma CMOD alias test_and_set=atomic_flag_test_and_set
#pragma CMOD alias test_and_set_explicit=atomic_flag_test_and_set_explicit
#pragma CMOD alias clear=atomic_flag_clear
#pragma CMOD alias clear_explicit=atomic_flag_clear_explicit

#pragma CMOD declaration

#ifndef atomic◼NO_ATOMICS

typedef struct {
  union {
    char _invisible0[SIZE];
#if ALIGN == C◼char◼ALIGN
    char _invisible1;
#elif ALIGN == C◼short◼ALIGN
    short _invisible2;
#elif ALIGN == C◼int◼ALIGN
    int _invisible3;
#elif ALIGN == C◼long◼ALIGN
    long _invisible4;
#elif ALIGN == C◼llong◼ALIGN
    long long _invisible5;
#endif
  };
} flag;

#if ZERO_INIT
#define INIT { { { 0 } } }
#else
#define INIT _INIT
#endif



_Bool (test_and_set)(flag volatile*);
_Bool (test_and_set_explicit)(flag volatile*, atomic◼memory_order);
void (clear)(flag volatile*);
void (clear_explicit)(flag volatile*, atomic◼memory_order)

_STATIC_ASSERT(SIZE == sizeof(flag), "import of atomic_flag to C◼atomic◼flag failed");
_STATIC_ASSERT(ALIGN == alignof(flag), "import of atomic_flag to C◼atomic◼flag failed");


#endif
