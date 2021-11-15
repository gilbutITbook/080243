// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C
#pragma CMOD mimic <stddef.h>
#pragma CMOD mimic <stdint.h>
#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <wchar.h>
#pragma CMOD link -lc


#pragma CMOD declaration

/* Return types of core language operators */
#pragma CMOD typedef size=size_t
#pragma CMOD typedef ptrdiff=ptrdiff_t
#pragma CMOD typedef max_align=max_align_t
#pragma CMOD typedef wchar=wchar_t

#pragma CMOD typedef uintptr=uintptr_t
#pragma CMOD typedef intptr=intptr_t
#pragma CMOD typedef uintmax=uintmax_t
#pragma CMOD typedef intmax=intmax_t



/* Language features that are implemented through macros. */
#define nullptr ((void*)+0)
#pragma CMOD define NULL
#pragma CMOD define offsetof

/* Predefined global macro features. */
#define DATE __DATE__
#define FILE __FILE__
#define LINE __LINE__
#define TIME __TIME__

#pragma CMOD defexp STDC=__STDC__
#pragma CMOD defreg \2=\(__STDC_\([A-Z_0-9]*\)__\)

#ifndef ISO_10646
# define ISO_10646 000000L
#endif
#if ISO_10646 != __STDC_ISO_10646__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_ISO_10646__ with precompiled C library");
#endif
#ifndef MB_MIGHT_NEQ_WC
# define MB_MIGHT_NEQ_WC 0
#endif
#if MB_MIGHT_NEQ_WC != __STDC_MB_MIGHT_NEQ_WC__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_MB_MIGHT_NEQ_WC__ with precompiled C library");
#endif
#ifndef UTF_16
# define UTF_16 0
#endif
#if UTF_16 != __STDC_UTF_16__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_UTF_16__ with precompiled C library");
#endif
#ifndef UTF_32
# define UTF_32 0
#endif
#if UTF_32 != __STDC_UTF_32__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_UTF_32__ with precompiled C library");
#endif
#ifndef ANALYZABLE
# define ANALYZABLE 0
#endif
#if ANALYZABLE != __STDC_ANALYZABLE__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_ANALYZABLE__ with precompiled C library");
#endif
#ifndef IEC_559
# define IEC_559 0
#endif
#if IEC_559 != __STDC_IEC_559__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_IEC_559__ with precompiled C library");
#endif
#ifndef IEC_559_COMPLEX
# define IEC_559_COMPLEX 0
#endif
#if IEC_559_COMPLEX != __STDC_IEC_559_COMPLEX__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_IEC_559_COMPLEX__ with precompiled C library");
#endif
#ifndef LIB_EXT1
# define LIB_EXT1 000000L
#endif
#if LIB_EXT1 != __STDC_LIB_EXT1__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_LIB_EXT1__ with precompiled C library");
#endif
#ifndef NO_ATOMICS
# define NO_ATOMICS 0
#endif
#if NO_ATOMICS != __STDC_NO_ATOMICS__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_NO_ATOMICS__ with precompiled C library");
#endif
#ifndef NO_COMPLEX
# define NO_COMPLEX 0
#endif
#if NO_COMPLEX != __STDC_NO_COMPLEX__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_NO_COMPLEX__ with precompiled C library");
#endif
#ifndef NO_THREADS
# define NO_THREADS 0
#endif
#if NO_THREADS != __STDC_NO_THREADS__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_NO_THREADS__ with precompiled C library");
#endif
#ifndef NO_VLA
# define NO_VLA 0
#endif
#if NO_VLA != __STDC_NO_VLA__
_STATIC_ASSERT(0, "inconsistent setting of __STDC_NO_VLA__ with precompiled C library");
#endif


/* abbreviations for language constructs */
/* complex.h */
#define complex _Complex
/* stdnoreturn.h */
#define noreturn _Noreturn
/* stdalign.h */
#define alignas _Alignas
#define alignof _Alignof
/* stdbool.h */
#define bool	_Bool
#define false	0
#define true	1
/* iso646.h */
#define and	&&
#define	bitand	&
#define bitor	|
#define compl	~
#define not	!
#define or	||
#define xor	^
#define not_eq	!=
#define or_eq	|=
#define and_eq	&=
#define xor_eq	^=

/* ABI fixed type choice */
#pragma CMOD typedef wint=wint_t

/* Return the integer rank of an expression. */
#define rankof(X)                                       \
_Generic((X),                                           \
  /* Narrow types can't be rvalued with +0, so we */    \
  /* have to distinguish all qualifications. */         \
         _Bool: 0,                                      \
         _Bool const: 0,                                \
         _Bool volatile: 0,                             \
         _Bool volatile const: 0,                       \
         char: 1,                                       \
         char const: 1,                                 \
         char volatile: 1,                              \
         char volatile const: 1,                        \
         unsigned char: 1,                              \
         unsigned char const: 1,                        \
         unsigned char volatile: 1,                     \
         unsigned char volatile const: 1,               \
         signed char: 1,                                \
         signed char const: 1,                          \
         signed char volatile: 1,                       \
         signed char volatile const: 1,                 \
         unsigned short: 2,                             \
         unsigned short const: 2,                       \
         unsigned short volatile: 2,                    \
         unsigned short volatile const: 2,              \
         signed short: 2,                               \
         signed short const: 2,                         \
         signed short volatile: 2,                      \
         signed short volatile const: 2,                \
         default:                                       \
         _Generic((X)+0,                                \
           unsigned: 3,                                 \
           signed: 3,                                   \
           unsigned long: 4,                            \
           signed long: 4,                              \
           unsigned long long: 5,                       \
           signed long long: 5,                         \
           default: 6))

/**
 ** @brief the significant bits of a @c bool
 **
 ** This value is special, because we have to find out if a bit
 ** pattern with a higher order bit set, may evaluate to true.
 **
 ** This can't be done with conversion to @c bool, since this would
 ** immediately map to @c 1. So we have to ensure that we create a bit
 ** pattern with the LSB set to 0. The @c volatile ensures that this
 ** is really loaded from memory.
 **/
#pragma CMOD defexp BOOL_WIDTH=(int)((&(volatile union { unsigned char bits[sizeof(_Bool)]; _Bool val; }){ .bits[0] = UCHAR_MAX-1, })->val ? sizeof(_Bool)*CHAR_BIT : 1)
/**
 ** @brief The number of significant bits in a @c char
 **
 ** Since character types are not supposed to have padding bits, this
 ** @b must be the same as ::CHAR_BIT.
 **/
#pragma CMOD defexp CHAR_WIDTH=(int)(msb(CHAR_MAX)+!!CHAR_MIN)
#pragma CMOD defexp CHAR_BIT
#pragma CMOD defexp CHAR_SIGN=(!CHAR_MIN)

#pragma CMOD defexp UCHAR_WIDTH=(int)msb(UCHAR_MAX)
#pragma CMOD defexp USHRT_WIDTH=(int)msb(USHRT_MAX)
#pragma CMOD defexp UINT_WIDTH=(int)msb(UINT_MAX)
#pragma CMOD defexp ULONG_WIDTH=(int)msb(ULONG_MAX)
#pragma CMOD defexp ULLONG_WIDTH=(int)msb(ULLONG_MAX)

#pragma CMOD defexp SCHAR_WIDTH=(int)(msb(SCHAR_MAX)+(SCHAR_MAX < UCHAR_MAX))
#pragma CMOD defexp SHRT_WIDTH=(int)(msb(SHRT_MAX)+(SHRT_MAX < USHRT_MAX))
#pragma CMOD defexp INT_WIDTH=(int)(msb(INT_MAX)+(INT_MAX < UINT_MAX))
#pragma CMOD defexp LONG_WIDTH=(int)(msb(LONG_MAX)+(LONG_MAX < ULONG_MAX))
#pragma CMOD defexp LLONG_WIDTH=(int)(msb(LLONG_MAX)+(LLONG_MAX < ULLONG_MAX))

#pragma CMOD defexp MB_LEN_MAX


/* Return the width of an expression, that is the number of bits that
   the underlying type uses effectively, not counting padding bits. */
#define widthof(X)                                      \
_Generic((X),                                           \
  /* Narrow types can't be rvalued with +0, so we */    \
  /* have to distinguish all qualifications. */         \
         char: CHAR_WIDTH,                              \
         char const: CHAR_WIDTH,                        \
         char volatile: CHAR_WIDTH,                     \
         char volatile const: CHAR_WIDTH,               \
         _Bool: BOOL_WIDTH,                             \
         _Bool const: BOOL_WIDTH,                       \
         _Bool volatile: BOOL_WIDTH,                    \
         _Bool volatile const: BOOL_WIDTH,              \
         unsigned char: UCHAR_WIDTH,                    \
         unsigned char const: UCHAR_WIDTH,              \
         unsigned char volatile: UCHAR_WIDTH,           \
         unsigned char volatile const: UCHAR_WIDTH,     \
         unsigned short: USHRT_WIDTH,                   \
         unsigned short const: USHRT_WIDTH,             \
         unsigned short volatile: USHRT_WIDTH,          \
         unsigned short volatile const: USHRT_WIDTH,    \
         signed char: SCHAR_WIDTH,                      \
         signed char const: SCHAR_WIDTH,                \
         signed char volatile: SCHAR_WIDTH,             \
         signed char volatile const: SCHAR_WIDTH,       \
         signed short: SHRT_WIDTH,                      \
         signed short const: SHRT_WIDTH,                \
         signed short volatile: SHRT_WIDTH,             \
         signed short volatile const: SHRT_WIDTH,       \
         default:                                       \
         _Generic((X)+0,                                \
                  unsigned: UINT_WIDTH,                 \
                  signed: INT_WIDTH,                    \
                  unsigned long: ULONG_WIDTH,           \
                  signed long: LONG_WIDTH,              \
                  unsigned long long: ULLONG_WIDTH,     \
                  signed long long: LLONG_WIDTH,        \
                  default: sizeof(X)*CHAR_WIDTH))

/* Return the signedness (not the sign!) of an expression, that is if
   -1 converted to the same type as X is less than 0 or not */
#define signof(X)                                       \
_Generic((X),                                           \
  /* Narrow types can't be rvalued with +0, so we */    \
  /* have to distinguish all qualifications. */         \
         char: CHAR_SIGN,                               \
         char const: CHAR_SIGN,                         \
         char volatile: CHAR_SIGN,                      \
         char volatile const: CHAR_SIGN,                \
         _Bool: 0,                                      \
         _Bool const: 0,                                \
         _Bool volatile: 0,                             \
         _Bool volatile const: 0,                       \
         unsigned char: 0,                              \
         unsigned char const: 0,                        \
         unsigned char volatile: 0,                     \
         unsigned char volatile const: 0,               \
         unsigned short: 0,                             \
         unsigned short const: 0,                       \
         unsigned short volatile: 0,                    \
         unsigned short volatile const: 0,              \
         signed char: 1,                                \
         signed char const: 1,                          \
         signed char volatile: 1,                       \
         signed char volatile const: 1,                 \
         signed short: 1,                               \
         signed short const: 1,                         \
         signed short volatile: 1,                      \
         signed short volatile const: 1,                \
         default:                                       \
         _Generic((X)+0,                                \
                  unsigned int: 0,                      \
                  signed int: 1,                        \
                  unsigned long: 0,                     \
                  signed long: 1,                       \
                  unsigned long long: 0,                \
                  signed long long: 1,                  \
         /* This should never error out, if used in */  \
         /* a dead branch, e.g for pointers. */         \
         default: 0))


/* Additional macros for ABI characterization */
#pragma CMOD defexp SIZE_RANK	=	RANK(sizeof(int))
#pragma CMOD defexp PTRDIFF_RANK=	RANK((char*)0-(char*)0)
#pragma CMOD defexp WCHAR_RANK	=	RANK(L'a')
#pragma CMOD defexp WINT_RANK	=	RANK((wint_t)0)

#pragma CMOD defexp SIZE_WIDTH	=	msb(SIZE_MAX)
#pragma CMOD defexp PTRDIFF_WIDTH=	(msb(PTRDIFF_MAX)+1)
#pragma CMOD defexp WCHAR_WIDTH	=	(msb(WCHAR_MAX)+((1 ? -1 : WCHAR_MAX) < 0))
#pragma CMOD defexp WINT_WIDTH	=	(msb(WINT_MAX)+((1 ? -1 : WINT_MAX) < 0))

#pragma CMOD defexp MODULE_ABI	= "#define _ZN2_C7_Intern1C9SIGNATUREE %1$#.016llx\n#define MODULE_ABI _ZN2_C7_Intern1C28module_abi%1$#.016llxE", \
  /* characteristics of short types */                          \
  (sizeof(short)-1ull)                                          \
  | ((CHAR_BIT*sizeof(short)-msb(SHRT_MAX)+0ull)<<6)            \
  | ((CHAR_BIT*sizeof(short)-msb(USHRT_MAX)+0ull)<<9)           \
  | (((SHRT_MIN==-SHRT_MAX)+0ull)<<12)                          \
  /* characteristics of int types */                            \
  | ((sizeof(int)-1ull)<<13)                                    \
  | ((CHAR_BIT*sizeof(int)-msb(INT_MAX)+0ull)<<19)              \
  | ((CHAR_BIT*sizeof(int)-msb(UINT_MAX)+0ull)<<22)             \
  | (((INT_MIN==-INT_MAX)+0ull)<<25)                            \
  /* characteristics of long types */                           \
  | ((sizeof(long)-1ull)<<26)                                   \
  | ((CHAR_BIT*sizeof(long)-msb(LONG_MAX)+0ull)<<32)            \
  | ((CHAR_BIT*sizeof(long)-msb(ULONG_MAX)+0ull)<<35)           \
  | (((LONG_MIN==-LONG_MAX)+0ull)<<38)                          \
  /* characteristics of long long types */                      \
  | ((sizeof(long long)-1ull)<<39)                              \
  | ((CHAR_BIT*sizeof(long long)-msb(LLONG_MAX)+0ull)<<45)      \
  | ((CHAR_BIT*sizeof(long long)-msb(ULLONG_MAX)+0ull)<<48)     \
  | (((LLONG_MIN==-LLONG_MAX)+0ull)<<51)                        \
  /* characteristics of char types */                           \
  | ((CHAR_BIT-1ull)<<52)                                       \
  | (((!!CHAR_MIN)+0ull)<<59)                                   \
  /* sign representation */                                     \
  | (((-1&3)+0ull)<<60)


#define FEATURE12_(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _A, _B)  \
  _ZN2_C7_Intern1C51module_features                             \
  ## _ ## _0 ## _ ##  _1 ## _ ##  _2 ## _ ##  _3                \
  ## _ ## _4 ## _ ##  _5 ## _ ##  _6 ## _ ##  _7                \
  ## _ ## _8 ## _ ##  _9 ## _ ##  _A ## _ ##  _B                \
  ##E
#define FEATURE12(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _A, _B) \
  FEATURE12_(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _A, _B)

#define MODULE_FEATURES FEATURE12(              \
                             ISO_10646,         \
                             MB_MIGHT_NEQ_WC,   \
                             UTF_16,            \
                             UTF_32,            \
                             ANALYZABLE,        \
                             IEC_559,           \
                             IEC_559_COMPLEX,   \
                             LIB_EXT1,          \
                             NO_ATOMICS,        \
                             NO_COMPLEX,        \
                             NO_THREADS,        \
                             NO_VLA)


/* Convenience typedef's for standard types with composed names. */
typedef signed char schar;
typedef unsigned char uchar;
typedef unsigned short ushort;
typedef unsigned long ulong;
typedef signed long long llong;
typedef unsigned long long ullong;
typedef long double ldouble;
typedef char* charp;

#define STRINGIFY(...) STRINGIFY0(__VA_ARGS__)
#define STRINGIFY0(...) # __VA_ARGS__

#define JOIN(A, B) JOIN0(A, B)
#define JOIN0(A, B) A ## B

#pragma CMOD definition

unsigned long long volatile const MODULE_ABI[] = { _ZN2_C7_Intern1C9SIGNATUREE, };

unsigned long long const volatile FEATURE12(
                                       ISO_10646,
                                       MB_MIGHT_NEQ_WC,
                                       UTF_16,
                                       UTF_32,
                                       ANALYZABLE,
                                       IEC_559,
                                       IEC_559_COMPLEX,
                                       LIB_EXT1,
                                       NO_ATOMICS,
                                       NO_COMPLEX,
                                       NO_THREADS,
                                       NO_VLA);


void module_assert(void) {
  _Static_assert(widthof((char)0) == CHAR_BIT, "the widths of character types must agree");
  _Static_assert(CHAR_WIDTH == widthof((unsigned char)0), "the widths of character types must agree");
  _Static_assert(CHAR_WIDTH == widthof((signed char)0), "the widths of character types must agree");
  _Static_assert(rankof((unsigned char)0) < rankof(0U), "rankof not working properly");
}
