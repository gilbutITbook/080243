// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼int
#pragma CMOD import C◼integer

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#ifdef C◼integer◼UINT8_MAX
#define UINT8_C		C◼integer◼UINT8_C
#define UINT8_MAX	C◼integer◼UINT8_MAX
typedef C◼integer◼u8	uint8_t
typedef C◼integer◼uleast8	uint_least8_t
typedef C◼integer◼ufast8	uint_fast8_t
#endif
#ifdef C◼integer◼INT8_MAX
#define INT8_C	C◼integer◼INT8_C
#define INT8_MAX	C◼integer◼INT8_MAX
#define INT8_MIN	C◼integer◼INT8_MIN
typedef C◼integer◼i8 int8_t
typedef C◼integer◼ileast8 int_least8_t
typedef C◼integer◼ifast8 int_fast8_t
#endif

#ifdef C◼integer◼UINT16_MAX
#define UINT16_C	C◼integer◼UINT16_C
#define UINT16_MAX	C◼integer◼UINT16_MAX
typedef C◼integer◼u16 uint16_t
typedef C◼integer◼uleast16 uint_least16_t
typedef C◼integer◼ufast16 uint_fast16_t
#endif
#ifdef C◼integer◼INT16_MAX
#define INT16_C	C◼integer◼INT16_C
#define INT16_MAX	C◼integer◼INT16_MAX
#define INT16_MIN	C◼integer◼INT16_MIN
typedef C◼integer◼i16 int16_t
typedef C◼integer◼ileast16 int_least16_t
typedef C◼integer◼ifast16 int_fast16_t
#endif

#ifdef C◼integer◼UINT24_MAX
#define UINT24_C	C◼integer◼UINT24_C
#define UINT24_MAX	C◼integer◼UINT24_MAX
typedef C◼integer◼u24 uint24_t
typedef C◼integer◼uleast24 uint_least24_t
typedef C◼integer◼ufast24 uint_fast24_t
#endif
#ifdef C◼integer◼INT24_MAX
#define INT24_C	C◼integer◼INT24_C
#define INT24_MAX	C◼integer◼INT24_MAX
#define INT24_MIN	C◼integer◼INT24_MIN
typedef C◼integer◼i24 int24_t
typedef C◼integer◼ileast24 int_least24_t
typedef C◼integer◼ifast24 int_fast24_t
#endif

#ifdef C◼integer◼UINT32_MAX
#define UINT32_C	C◼integer◼UINT32_C
#define UINT32_MAX	C◼integer◼UINT32_MAX
typedef C◼integer◼u32 uint32_t
typedef C◼integer◼uleast32 uint_least32_t
typedef C◼integer◼ufast32 uint_fast32_t
#endif
#ifdef C◼integer◼INT32_MAX
#define INT32_C	C◼integer◼INT32_C
#define INT32_MAX	C◼integer◼INT32_MAX
#define INT32_MIN	C◼integer◼INT32_MIN
typedef C◼integer◼i32 int32_t
typedef C◼integer◼ileast32 int_least32_t
typedef C◼integer◼ifast32 int_fast32_t
#endif

#ifdef C◼integer◼UINT48_MAX
#define UINT48_C	C◼integer◼UINT48_C
#define UINT48_MAX	C◼integer◼UINT48_MAX
typedef C◼integer◼u48 uint48_t
typedef C◼integer◼uleast48 uint_least48_t
typedef C◼integer◼ufast48 uint_fast48_t
#endif
#ifdef C◼integer◼INT48_MAX
#define INT48_C	C◼integer◼INT48_C
#define INT48_MAX	C◼integer◼INT48_MAX
#define INT48_MIN	C◼integer◼INT48_MIN
typedef C◼integer◼i48 int48_t
typedef C◼integer◼ileast48 int_least48_t
typedef C◼integer◼ifast48 int_fast48_t
#endif

#ifdef C◼integer◼UINT64_MAX
#define UINT64_C	C◼integer◼UINT64_C
#define UINT64_MAX	C◼integer◼UINT64_MAX
typedef C◼integer◼u64 uint64_t
typedef C◼integer◼uleast64 uint_least64_t
typedef C◼integer◼ufast64 uint_fast64_t
#endif
#ifdef C◼integer◼INT64_MAX
#define INT64_C	C◼integer◼INT64_C
#define INT64_MAX	C◼integer◼INT64_MAX
#define INT64_MIN	C◼integer◼INT64_MIN
typedef C◼integer◼i64 int64_t
typedef C◼integer◼ileast64 int_least64_t
typedef C◼integer◼ifast64 int_fast64_t
#endif

#ifdef C◼integer◼UINT96_MAX
#define UINT96_C	C◼integer◼UINT96_C
#define UINT96_MAX	C◼integer◼UINT96_MAX
typedef C◼integer◼u96 uint96_t
typedef C◼integer◼uleast96 uint_least96_t
typedef C◼integer◼ufast96 uint_fast96_t
#endif
#ifdef C◼integer◼INT96_MAX
#define INT96_C	C◼integer◼INT96_C
#define INT96_MAX	C◼integer◼INT96_MAX
#define INT96_MIN	C◼integer◼INT96_MIN
typedef C◼integer◼i96 int96_t
typedef C◼integer◼ileast96 int_least96_t
typedef C◼integer◼ifast96 int_fast96_t
#endif

#ifdef C◼integer◼UINT128_MAX
#define UINT128_C	C◼integer◼UINT128_C
#define UINT128_MAX	C◼integer◼UINT128_MAX
typedef C◼integer◼u128 uint128_t
typedef C◼integer◼uleast128 uint_least128_t
typedef C◼integer◼ufast128 uint_fast128_t
#endif
#ifdef C◼integer◼INT128_MAX
#define INT128_C	C◼integer◼INT128_C
#define INT128_MAX	C◼integer◼INT128_MAX
#define INT128_MIN	C◼integer◼INT128_MIN
typedef C◼integer◼i128 int128_t
typedef C◼integer◼ileast128 int_least128_t
typedef C◼integer◼ifast128 int_fast128_t
#endif

typedef C◼uintptr uintptr;
typedef C◼intptr intptr;
typedef C◼uintmax uintmax;
typedef C◼intmax intmax;

#define UINTMAX_C	C◼integer◼UINTMAX_C
#define UINTMAX_MAX	C◼integer◼UINTMAX_MAX
#define INTMAX_C	C◼integer◼INTMAX_C
#define INTMAX_MAX	C◼integer◼INTMAX_MAX
#define INTMAX_MIN	C◼integer◼INTMAX_MIN
#define UINTPTR_MAX	C◼integer◼UINTPTR_MAX
#define INTPTR_MAX	C◼integer◼INTPTR_MAX
#define INTPTR_MIN	C◼integer◼INTPTR_MIN
#define PTRDIFF_MAX	C◼integer◼PTRDIFF_MAX
#define PTRDIFF_MIN	C◼integer◼PTRDIFF_MIN
