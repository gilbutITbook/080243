#ifndef GENERIC_H
#define GENERIC_H 1
#include <stdbool.h>
#include <limits.h>
#include <float.h>

inline
double min(double a, double b) {
  return a < b ? a : b;
}

inline
long double minl(long double a, long double b) {
  return a < b ? a : b;
}

inline
float minf(float a, float b) {
  return a < b ? a : b;
}

/**
 ** @brief Type-generic minimum for floating-point values
 **/
#define min(A, B)                               \
_Generic((A)+(B),                               \
         float: minf,                           \
         long double: minl,                     \
         default: min)((A), (B))

/**
 ** @brief The maximum value for the type of @a X
 **/
#define MAXVAL(X)                                       \
_Generic((X),                                           \
         bool: (bool)+1,                                \
         char: (char)+CHAR_MAX,                         \
         signed char: (signed char)+SCHAR_MAX,          \
         unsigned char: (unsigned char)+UCHAR_MAX,      \
         signed short: (signed short)+SHRT_MAX,         \
         unsigned short: (unsigned short)+USHRT_MAX,    \
         signed: INT_MAX,                               \
         unsigned: UINT_MAX,                            \
         signed long: LONG_MAX,                         \
         unsigned long: ULONG_MAX,                      \
         signed long long: LLONG_MAX,                   \
         unsigned long long: ULLONG_MAX,                \
         float: FLT_MAX,                                \
         double: DBL_MAX,                               \
         long double: LDBL_MAX)

/**
 ** @brief The maximum promoted value for @a XT, where XT
 ** can be an expression or a type name
 **
 ** So this is the maximum value when fed to an arithmetic
 ** operation such as @c +.
 **
 ** @remark Narrow types are promoted, usually to @c signed,
 ** or maybe to @c unsigned on rare architectures.
 **/
#define maxof(XT)                               \
_Generic(0+(XT)+0,                              \
         signed: INT_MAX,                       \
         unsigned: UINT_MAX,                    \
         signed long: LONG_MAX,                 \
         unsigned long: ULONG_MAX,              \
         signed long long: LLONG_MAX,           \
         unsigned long long: ULLONG_MAX,        \
         float: FLT_MAX,                        \
         double: DBL_MAX,                       \
         long double: LDBL_MAX)

#define MINVAL(X)                               \
_Generic((X),                                   \
         bool: (bool)+0,                        \
         char: (char)+CHAR_MIN,                 \
         signed char: (signed char)+SCHAR_MIN,  \
         unsigned char: (unsigned char)+0,      \
         signed short: (signed short)+SHRT_MIN, \
         unsigned short: (unsigned short)+0,    \
         signed: INT_MIN,                       \
         unsigned: 0U,                          \
         signed long: LONG_MIN,                 \
         unsigned long: 0UL,                    \
         signed long long: LLONG_MIN,           \
         unsigned long long: 0ULL,              \
         float: -FLT_MAX,                       \
         double: -DBL_MAX,                      \
         long double: -LDBL_MAX)

#define minof(XT)                               \
_Generic(0+(XT)+0,                              \
         signed: INT_MIN,                       \
         unsigned: 0U,                          \
         signed long: LONG_MIN,                 \
         unsigned long: 0UL,                    \
         signed long long: LLONG_MIN,           \
         unsigned long long: 0ULL,              \
         float: -FLT_MAX,                       \
         double: -DBL_MAX,                      \
         long double: -LDBL_MAX)

/**
 ** @brief Calls a two-parameter function with default arguments set to
 ** 0
 **/
#define ZERO_DEFAULT2(...) ZERO_DEFAULT2_0(__VA_ARGS__, 0, )
#define ZERO_DEFAULT2_0(FUNC, _0, _1, ...) FUNC(_0, _1)

#define strtod(...) ZERO_DEFAULT2(strtod, __VA_ARGS__)
#define strtof(...) ZERO_DEFAULT2(strtof, __VA_ARGS__)
#define strtold(...) ZERO_DEFAULT2(strtold, __VA_ARGS__)

/**
 ** @brief Calls a three-parameter function with default arguments
 ** set to 0
 **/
#define ZERO_DEFAULT3(...) ZERO_DEFAULT3_0(__VA_ARGS__, 0, 0, )
#define ZERO_DEFAULT3_0(FUNC, _0, _1, _2, ...) FUNC(_0, _1, _2)

#define strtoul(...) ZERO_DEFAULT3(strtoul, __VA_ARGS__)
#define strtoull(...) ZERO_DEFAULT3(strtoull, __VA_ARGS__)
#define strtol(...) ZERO_DEFAULT3(strtol, __VA_ARGS__)
#define strtoll(...) ZERO_DEFAULT3(strtoll, __VA_ARGS__)

typedef struct placeholder placeholder;
#define PLH ((placeholder*)0)

/**
 ** @brief Default value for the second argument of @c strtoXX
 ** functions
 **/
#define STRTO2ND(X) _Generic((X), placeholder*: 0, default: (X))

/**
 ** @brief Default value for the third argument of @c strtoXX
 ** functions
 **/
#define STRTO3RD(X) _Generic((X), placeholder*: 10, default: (X))

/**
 ** @brief Calls a three-parameter function with default arguments set to
 ** specific values
 **
 ** @see strtoull10 for an example
 **/
#define DEFAULT3(...) DEFAULT3_0(__VA_ARGS__, PLH, PLH, PLH)
#define DEFAULT3_0(FUNC, DEF1, DEF2, _0, _1, _2, ...) FUNC(_0, DEF1(_1), DEF2(_2))

#define strtoul10(...) DEFAULT3(strtoul, STRTO2ND, STRTO3RD, __VA_ARGS__)
#define strtoull10(...) DEFAULT3(strtoull, STRTO2ND, STRTO3RD, __VA_ARGS__)
#define strtol10(...) DEFAULT3(strtol, STRTO2ND, STRTO3RD, __VA_ARGS__)
#define strtoll10(...) DEFAULT3(strtoll, STRTO2ND, STRTO3RD, __VA_ARGS__)

#define PROMOTE(XT, A)                                  \
  _Generic(0+(XT)+0,                                    \
           signed: (signed)(A),                         \
           unsigned: (unsigned)(A),                     \
           signed long: (signed long)(A),               \
           unsigned long: (unsigned long)(A),           \
           signed long long: (signed long long)(A),     \
           unsigned long long: (unsigned long long)(A), \
           float: (float)(A),                           \
           double: (double)(A),                         \
           long double: (long double)(A))

#define SIGNEDNESS(XT) (PROMOTE(XT, -1) < PROMOTE(XT, 0))

inline
signed maxs(signed a, signed b) {
  return a < b ? b : a;
}

inline
unsigned maxu(unsigned a, unsigned b) {
  return a < b ? b : a;
}

inline
unsigned maxus(unsigned a, signed b) {
  return b < 0 ? a : maxu(a, b);
}

inline
unsigned maxsu(signed a, unsigned b) {
  return a < 0 ? b : maxu(a, b);
}

inline
signed long maxsl(signed long a, signed long b) {
  return a < b ? b : a;
}

inline
unsigned long maxul(unsigned long a, unsigned long b) {
  return a < b ? b : a;
}

inline
unsigned long maxusl(unsigned long a, signed long b) {
  return b < 0 ? a : maxul(a, b);
}

inline
unsigned long maxsul(signed long a, unsigned long b) {
  return a < 0 ? b : maxul(a, b);
}

inline
signed long long maxsll(signed long long a, signed long long b) {
  return a < b ? b : a;
}

inline
unsigned long long maxull(unsigned long long a, unsigned long long b) {
  return a < b ? b : a;
}

inline
unsigned long long maxusll(unsigned long long a, signed long long b) {
  return b < 0 ? a : maxull(a, b);
}

inline
unsigned long long maxsull(signed long long a, unsigned long long b) {
  return a < 0 ? b : maxull(a, b);
}

#define  MAX(X, Y)                              \
_Generic((X)+(Y),                               \
         signed: maxs,                          \
         unsigned: maxu,                        \
         signed long: maxsl,                    \
         unsigned long: maxul,                  \
         signed long long: maxsll,              \
         unsigned long long: maxull)((X), (Y))

#define MAXUS(X, Y)                             \
_Generic((X)+(Y),                               \
         signed: maxus,                         \
         unsigned: maxus,                       \
         signed long: maxusl,                   \
         unsigned long: maxusl,                 \
         signed long long: maxusll,             \
         unsigned long long: maxusll)((X), (Y))

#define MAXSU(X, Y)                             \
_Generic((X)+(Y),                               \
         signed: maxsu,                         \
         unsigned: maxsu,                       \
         signed long: maxsul,                   \
         unsigned long: maxsul,                 \
         signed long long: maxsull,             \
         unsigned long long: maxsull)((X), (Y))

#define mix(X, Y)                                       \
_Generic(&(char[SIGNEDNESS(X)-SIGNEDNESS(Y)+2]){ 0 },   \
         char(*)[1]: MAXUS((X), (Y)),                   \
         char(*)[2]: MAX((X), (Y)),                     \
         char(*)[3]: MAXSU((X), (Y)))


#endif
