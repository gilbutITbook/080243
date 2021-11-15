// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼integer
#pragma CMOD mimic <stdint.h>
#pragma CMOD mimic <inttypes.h>

#pragma CMOD typedef u8=uint8_t
#pragma CMOD typedef i8=int8_t
#pragma CMOD typedef u16=uint16_t
#pragma CMOD typedef i16=int16_t
#pragma CMOD typedef u24=uint24_t
#pragma CMOD typedef i24=int24_t
#pragma CMOD typedef u32=uint32_t
#pragma CMOD typedef i32=int32_t
#pragma CMOD typedef u48=uint48_t
#pragma CMOD typedef i48=int48_t
#pragma CMOD typedef u64=uint64_t
#pragma CMOD typedef i64=int64_t
#pragma CMOD typedef u96=uint96_t
#pragma CMOD typedef i96=int96_t
#pragma CMOD typedef u128=uint128_t
#pragma CMOD typedef i128=int128_t


#pragma CMOD typedef uleast8=uint_least8_t
#pragma CMOD typedef ileast8=int_least8_t
#pragma CMOD typedef uleast16=uint_least16_t
#pragma CMOD typedef ileast16=int_least16_t
#pragma CMOD typedef uleast24=uint_least24_t
#pragma CMOD typedef ileast24=int_least24_t
#pragma CMOD typedef uleast32=uint_least32_t
#pragma CMOD typedef ileast32=int_least32_t
#pragma CMOD typedef uleast48=uint_least48_t
#pragma CMOD typedef ileast48=int_least48_t
#pragma CMOD typedef uleast64=uint_least64_t
#pragma CMOD typedef ileast64=int_least64_t
#pragma CMOD typedef uleast96=uint_least96_t
#pragma CMOD typedef ileast96=int_least96_t
#pragma CMOD typedef uleast128=uint_least128_t
#pragma CMOD typedef ileast128=int_least128_t

#pragma CMOD typedef ufast8=uint_fast8_t
#pragma CMOD typedef ifast8=int_fast8_t
#pragma CMOD typedef ufast16=uint_fast16_t
#pragma CMOD typedef ifast16=int_fast16_t
#pragma CMOD typedef ufast24=uint_fast24_t
#pragma CMOD typedef ifast24=int_fast24_t
#pragma CMOD typedef ufast32=uint_fast32_t
#pragma CMOD typedef ifast32=int_fast32_t
#pragma CMOD typedef ufast48=uint_fast48_t
#pragma CMOD typedef ifast48=int_fast48_t
#pragma CMOD typedef ufast64=uint_fast64_t
#pragma CMOD typedef ifast64=int_fast64_t
#pragma CMOD typedef ufast96=uint_fast96_t
#pragma CMOD typedef ifast96=int_fast96_t
#pragma CMOD typedef ufast128=uint_fast128_t
#pragma CMOD typedef ifast128=int_fast128_t


#pragma CMOD defreg \1=\<\(UINT[A-Z_0-9]*_\(MAX\|MIN\|C\)\)
#pragma CMOD defreg \1=\<\(INT[A-Z_0-9]*_\(MAX\|MIN\|C\)\)
#pragma CMOD defreg \1=\<\(PRI[a-zX][a-zA-Z_0-9]*\)
#pragma CMOD defreg \1=\<\(SCN[a-zX][a-zA-Z_0-9]*\)

/* musl has these */
#pragma CMOD define _UINTEGER_C
#pragma CMOD define _INTEGER_C

/* musl and glibc need these */
#pragma CMOD defreg \1=\<\(__PRI[a-zA-Z_0-9]*\)
#pragma CMOD defreg \1=\<\(__SCN[a-zA-Z_0-9]*\)


#pragma CMOD declaration


#pragma CMOD snippet none
#pragma CMOD declaration

typedef C◼uintptr uintptr;
typedef C◼intptr intptr;
typedef C◼uintmax uintmax;
typedef C◼intmax intmax;
