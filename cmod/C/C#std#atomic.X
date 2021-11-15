// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼atomic
#pragma CMOD import C◼atomic◼flag

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define __STDC_NO_ATOMICS__ C◼atomic◼NO_ATOMICS

#ifndef C◼atomic◼NO_ATOMICS
#define ATOMIC_BOOL_LOCK_FREE C◼atomic◼BOOL_LOCK_FREE
#define ATOMIC_CHAR_LOCK_FREE C◼atomic◼CHAR_LOCK_FREE
#define ATOMIC_CHAR16_T_LOCK_FREE C◼atomic◼CHAR16_T_LOCK_FREE
#define ATOMIC_CHAR32_T_LOCK_FREE C◼atomic◼CHAR32_T_LOCK_FREE
#define ATOMIC_WCHAR_T_LOCK_FREE C◼atomic◼WCHAR_T_LOCK_FREE
#define ATOMIC_SHORT_LOCK_FREE C◼atomic◼SHORT_LOCK_FREE
#define ATOMIC_INT_LOCK_FREE C◼atomic◼INT_LOCK_FREE
#define ATOMIC_LONG_LOCK_FREE C◼atomic◼LONG_LOCK_FREE
#define ATOMIC_LLONG_LOCK_FREE C◼atomic◼LLONG_LOCK_FREE
#define ATOMIC_POINTER_LOCK_FREE C◼atomic◼POINTER_LOCK_FREE
#define ATOMIC_FLAG_INIT C◼atomic◼flag◼INIT
#define ATOMIC_VAR_INIT C◼atomic◼INIT

typedef C◼atomic◼flag atomic_flag;

#define memory_order C◼atomic◼memory_order

enum memory_order_again {
   memory_order_relaxed=C◼atomic◼relaxed,
   memory_order_consume=C◼atomic◼consume,
   memory_order_acquire=C◼atomic◼acquire,
   memory_order_release=C◼atomic◼release,
   memory_order_acq_rel=C◼atomic◼acq_rel,
   memory_order_seq_cst=C◼atomic◼seq_cst,
};

typedef C◼atomic◼bool atomic_bool;
typedef C◼atomic◼char atomic_char;
typedef C◼atomic◼schar atomic_schar;
typedef C◼atomic◼uchar atomic_uchar;
typedef C◼atomic◼short atomic_short;
typedef C◼atomic◼ushort atomic_ushort;
typedef C◼atomic◼int atomic_int;
typedef C◼atomic◼uint atomic_uint;
typedef C◼atomic◼long atomic_long;
typedef C◼atomic◼ulong atomic_ulong;
typedef C◼atomic◼llong atomic_llong;
typedef C◼atomic◼ullong atomic_ullong;
typedef C◼atomic◼char16_t atomic_char16_t;
typedef C◼atomic◼char32_t atomic_char32_t;
typedef C◼atomic◼wchar_t atomic_wchar_t;
typedef C◼atomic◼int_least8_t atomic_int_least8_t;
typedef C◼atomic◼uint_least8_t atomic_uint_least8_t;
typedef C◼atomic◼int_least16_t atomic_int_least16_t;
typedef C◼atomic◼uint_least16_t atomic_uint_least16_t;
typedef C◼atomic◼int_least32_t atomic_int_least32_t;
typedef C◼atomic◼uint_least32_t atomic_uint_least32_t;
typedef C◼atomic◼int_least64_t atomic_int_least64_t;
typedef C◼atomic◼uint_least64_t atomic_uint_least64_t;
typedef C◼atomic◼int_fast8_t atomic_int_fast8_t;
typedef C◼atomic◼uint_fast8_t atomic_uint_fast8_t;
typedef C◼atomic◼int_fast16_t atomic_int_fast16_t;
typedef C◼atomic◼uint_fast16_t atomic_uint_fast16_t;
typedef C◼atomic◼int_fast32_t atomic_int_fast32_t;
typedef C◼atomic◼uint_fast32_t atomic_uint_fast32_t;
typedef C◼atomic◼int_fast64_t atomic_int_fast64_t;
typedef C◼atomic◼uint_fast64_t atomic_uint_fast64_t;
typedef C◼atomic◼intptr_t atomic_intptr_t;
typedef C◼atomic◼uintptr_t atomic_uintptr_t;
typedef C◼atomic◼size_t atomic_size_t;
typedef C◼atomic◼ptrdiff_t atomic_ptrdiff_t;
typedef C◼atomic◼intmax_t atomic_intmax_t;
typedef C◼atomic◼uintmax_t atomic_uintmax_t;


#define kill_dependency C◼atomic◼kill_dependency

#define atomic_init	C◼atomic◼init
#define atomic_thread_fence	C◼atomic◼thread_fence
#define atomic_signal_fence	C◼atomic◼signal_fence
#define atomic_is_lock_free	C◼atomic◼is_lock_free
#define atomic_store	C◼atomic◼store
#define atomic_store_explicit	C◼atomic◼store_explicit
#define atomic_load	C◼atomic◼load
#define atomic_load_explicit	C◼atomic◼load_explicit
#define atomic_exchange	C◼atomic◼exchange
#define atomic_exchange_explicit	C◼atomic◼exchange_explicit
#define atomic_compare_exchange_strong	C◼atomic◼compare_exchange_strong
#define atomic_compare_exchange_strong_explicit	C◼atomic◼compare_exchange_strong_explicit
#define atomic_compare_exchange_weak	C◼atomic◼compare_exchange_weak
#define atomic_compare_exchange_weak_explicit	C◼atomic◼compare_exchange_weak_explicit
#define atomic_fetch_add	C◼atomic◼fetch_add
#define atomic_fetch_add_explicit	C◼atomic◼fetch_add_explicit
#define atomic_fetch_sub	C◼atomic◼fetch_sub
#define atomic_fetch_sub_explicit	C◼atomic◼fetch_sub_explicit
#define atomic_fetch_or	C◼atomic◼fetch_or
#define atomic_fetch_or_explicit	C◼atomic◼fetch_or_explicit
#define atomic_fetch_and	C◼atomic◼fetch_and
#define atomic_fetch_and_explicit	C◼atomic◼fetch_and_explicit
#define atomic_fetch_xor	C◼atomic◼fetch_xor
#define atomic_fetch_xor_explicit	C◼atomic◼fetch_xor_explicit

#define atomic_flag_test_and_set	C◼atomic◼flag◼test_and_set
#define atomic_flag_test_and_set_explicit	C◼atomic◼flag◼test_and_set_explicit
#define atomic_flag_clear	C◼atomic◼flag◼clear
#define atomic_flag_clear_explicit	C◼atomic◼flag◼clear_explicit

#endif
