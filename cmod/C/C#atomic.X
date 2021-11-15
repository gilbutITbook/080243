// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module atomic = C◼atomic

#pragma CMOD mimic !defined(__STDC_NO_ATOMICS__),<stdatomic.h>

#pragma CMOD defexp NO_ATOMICS=◼__STDC_NO_ATOMICS__, __STDC_NO_ATOMICS__

#pragma CMOD define INIT=ATOMIC_VAR_INIT
#pragma CMOD define kill_dependency
#pragma CMOD define thread_fence=atomic_thread_fence
#pragma CMOD define signal_fence=atomic_signal_fence
#pragma CMOD define is_lock_free=atomic_is_lock_free

#pragma CMOD define store_explicit=atomic_store_explicit
#pragma CMOD define load_explicit=atomic_load_explicit
#pragma CMOD define exchange_explicit=atomic_exchange_explicit
#pragma CMOD define compare_exchange_strong_explicit=atomic_compare_exchange_strong_explicit
#pragma CMOD define compare_exchange_weak_explicit=atomic_compare_exchange_weak_explicit
#pragma CMOD define add_explicit=atomic_add_explicit
#pragma CMOD define sub_explicit=atomic_sub_explicit
#pragma CMOD define or_explicit=atomic_or_explicit
#pragma CMOD define and_explicit=atomic_and_explicit
#pragma CMOD define xor_explicit=atomic_xor_explicit

/* We really want these evaluated during compile time, here. So we
   can't use defreg. */
#pragma CMOD defexp RELAXED=◼ATOMIC_VAR_INIT, memory_order_relaxed
#pragma CMOD defexp CONSUME=◼ATOMIC_VAR_INIT, memory_order_consume
#pragma CMOD defexp ACQUIRE=◼ATOMIC_VAR_INIT, memory_order_acquire
#pragma CMOD defexp RELEASE=◼ATOMIC_VAR_INIT, memory_order_release
#pragma CMOD defexp ACQ_REL=◼ATOMIC_VAR_INIT, memory_order_acq_rel
#pragma CMOD defexp SEQ_CST=◼ATOMIC_VAR_INIT, memory_order_seq_cst

#pragma CMOD typedef bool=atomic_bool
#pragma CMOD typedef atomic_char
#pragma CMOD typedef schar=atomic_schar
#pragma CMOD typedef uchar=atomic_uchar
#pragma CMOD typedef atomic_short
#pragma CMOD typedef ushort=atomic_ushort
#pragma CMOD typedef atomic_int
#pragma CMOD typedef uint=atomic_uint
#pragma CMOD typedef atomic_long
#pragma CMOD typedef ulong=atomic_ulong
#pragma CMOD typedef llong=atomic_llong
#pragma CMOD typedef ullong=atomic_ullong
#pragma CMOD typedef char16=atomic_char16_t
#pragma CMOD typedef char32=atomic_char32_t
#pragma CMOD typedef wchar=atomic_wchar_t
#pragma CMOD typedef ileast8=atomic_int_least8_t
#pragma CMOD typedef uleast8=atomic_uint_least8_t
#pragma CMOD typedef ileast16=atomic_int_least16_t
#pragma CMOD typedef uleast16=atomic_uint_least16_t
#pragma CMOD typedef ileast32=atomic_int_least32_t
#pragma CMOD typedef uleast32=atomic_uint_least32_t
#pragma CMOD typedef ileast64=atomic_int_least64_t
#pragma CMOD typedef uleast64=atomic_uint_least64_t
#pragma CMOD typedef ifast8=atomic_int_fast8_t
#pragma CMOD typedef ufast8=atomic_uint_fast8_t
#pragma CMOD typedef ifast16=atomic_int_fast16_t
#pragma CMOD typedef ufast16=atomic_uint_fast16_t
#pragma CMOD typedef ifast32=atomic_int_fast32_t
#pragma CMOD typedef ufast32=atomic_uint_fast32_t
#pragma CMOD typedef ifast64=atomic_int_fast64_t
#pragma CMOD typedef ufast64=atomic_uint_fast64_t
#pragma CMOD typedef intptr=atomic_intptr_t
#pragma CMOD typedef uintptr=atomic_uintptr_t
#pragma CMOD typedef size=atomic_size_t
#pragma CMOD typedef ptrdiff=atomic_ptrdiff_t
#pragma CMOD typedef intmax=atomic_intmax_t
#pragma CMOD typedef uintmax=atomic_uintmax_t

#pragma CMOD defexp BOOL_LOCK_FREE=◼ATOMIC_BOOL_LOCK_FREE
#pragma CMOD defexp CHAR_LOCK_FREE=◼ATOMIC_CHAR_LOCK_FREE
#pragma CMOD defexp CHAR16_T_LOCK_FREE=◼ATOMIC_CHAR16_T_LOCK_FREE
#pragma CMOD defexp CHAR32_T_LOCK_FREE=◼ATOMIC_CHAR32_T_LOCK_FREE
#pragma CMOD defexp WCHAR_T_LOCK_FREE=◼ATOMIC_WCHAR_T_LOCK_FREE
#pragma CMOD defexp SHORT_LOCK_FREE=◼ATOMIC_SHORT_LOCK_FREE
#pragma CMOD defexp INT_LOCK_FREE=◼ATOMIC_INT_LOCK_FREE
#pragma CMOD defexp LONG_LOCK_FREE=◼ATOMIC_LONG_LOCK_FREE
#pragma CMOD defexp LLONG_LOCK_FREE=◼ATOMIC_LLONG_LOCK_FREE
#pragma CMOD defexp POINTER_LOCK_FREE=◼ATOMIC_POINTER_LOCK_FREE

#pragma CMOD alias thread_fence=atomic_thread_fence
#pragma CMOD alias signal_fence=atomic_signal_fence


#pragma CMOD declaration

#ifndef NO_ATOMICS

typedef atomic_char atomic◼char;
typedef atomic_short atomic◼short;
typedef atomic_int atomic◼int;
typedef atomic_long atomic◼long;


enum memory_order {
   relaxed=RELAXED,
   consume=CONSUME,
   acquire=ACQUIRE,
   release=RELEASE,
   acq_rel=ACQ_REL,
   seq_cst=SEQ_CST,
};

#define atomic◼store(O, D) atomic◼store_explicit((O), (D), seq_cst)
#define atomic◼load(O) atomic◼load_explicit((O), seq_cst)
#define atomic◼exchange(O, D) atomic◼exchange_explicit((O), (D), seq_cst)
#define atomic◼compare_exchange_strong(O, E, D) atomic◼compare_exchange_strong_explicit((O), (E), (D), seq_cst, seq_cst)
#define atomic◼compare_exchange_weak(O, E, D) atomic◼compare_exchange_weak_explicit((O), (E), (D), seq_cst, seq_cst)
#define atomic◼add(O, D) atomic◼add_explicit((O), (D), seq_cst)
#define atomic◼sub(O, D) atomic◼sub_explicit((O), (D), seq_cst)
#define atomic◼or(O, D) atomic◼or_explicit((O), (D), seq_cst)
#define atomic◼and(O, D) atomic◼and_explicit((O), (D), seq_cst)
#define atomic◼xor(O, D) atomic◼xor_explicit((O), (D), seq_cst)

void (thread_fence)(memory_order);
void (signal_fence)(memory_order);

/* atomic_flag has its own module */

#endif
