// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module			C◼math
#pragma CMOD import rf		=	C◼real◼float
#pragma CMOD import r		=	C◼real◼double
#pragma CMOD import rl		=	C◼real◼ldouble

#pragma CMOD import c		=	C◼complex
#pragma CMOD import cf		=	C◼complex◼float
#pragma CMOD import cd		=	C◼complex◼double
#pragma CMOD import cl		=	C◼complex◼ldouble

#pragma CMOD import u		=	C◼unsigned
#pragma CMOD import ul		=	C◼ulong
#pragma CMOD import ull		=	C◼ullong

#pragma CMOD import s		=	C◼int
#pragma CMOD import l		=	C◼long
#pragma CMOD import ll		=	C◼llong

#pragma CMOD import generic	=	C◼generic

#pragma CMOD declaration

typedef signed _s;
typedef signed long _sl;
typedef signed long long _sll;
typedef unsigned _u;
typedef unsigned long _ul;
typedef unsigned long long _ull;


#define _TGR1(X, F, D, L) _Generic(+(X), rf: (F), default: (D), rl: (L))(X)
#define _TGR12(X, Y, F, D, L) _Generic(+(X), rf: (F), default: (D), rl: (L))((X), (Y))
#define _TGR2(X, Y, F, D, L) _Generic((X)+(Y), rf: (F), default: (D), rl: (L))((X), (Y))
#define _TGR23(X, Y, Z, F, D, L) _Generic((X)+(Y), rf: (F), default: (D), rl: (L))((X), (Y), (Z))
#define _TGR3(X, Y, Z, F, D, L) _Generic((X)+(Y)+(Z), rf: (F), default: (D), rl: (L))((X), (Y), (Z))
#define _TGC1(X, F, D, L, FC, DC, LC) _Generic(+(X), rf: (F), default: (D), rl: (L), cf: (FC), c: (DC), cl: (LC))(X)
#define _TGC2(X, Y, F, D, L, FC, DC, LC) _Generic((X)+(Y), rf: (F), default: (D), rl: (L), cf: (FC), c: (DC), cl: (LC))((X), (Y))

#define acos(X) _TGC1((X), rf◼acos, r◼acos, rl◼acos, cf◼acos, cd◼acos, cl◼acos)
#define acosh(X) _TGC1((X), rf◼acosh, r◼acosh, rl◼acosh, cf◼acosh, cd◼acosh, cl◼acosh)
#define asin(X) _TGC1((X), rf◼asin, r◼asin, rl◼asin, cf◼asin, cd◼asin, cl◼asin)
#define asinh(X) _TGC1((X), rf◼asinh, r◼asinh, rl◼asinh, cf◼asinh, cd◼asinh, cl◼asinh)
#define atan(X) _TGC1((X), rf◼atan, r◼atan, rl◼atan, cf◼atan, cd◼atan, cl◼atan)
#define atanh(X) _TGC1((X), rf◼atanh, r◼atanh, rl◼atanh, cf◼atanh, cd◼atanh, cl◼atanh)
#define cos(X) _TGC1((X), rf◼cos, r◼cos, rl◼cos, cf◼cos, cd◼cos, cl◼cos)
#define cosh(X) _TGC1((X), rf◼cosh, r◼cosh, rl◼cosh, cf◼cosh, cd◼cosh, cl◼cosh)
#define exp(X) _TGC1((X), rf◼exp, r◼exp, rl◼exp, cf◼exp, cd◼exp, cl◼exp)
#define log(X) _TGC1((X), rf◼log, r◼log, rl◼log, cf◼log, cd◼log, cl◼log)
#define sin(X) _TGC1((X), rf◼sin, r◼sin, rl◼sin, cf◼sin, cd◼sin, cl◼sin)
#define sinh(X) _TGC1((X), rf◼sinh, r◼sinh, rl◼sinh, cf◼sinh, cd◼sinh, cl◼sinh)
#define sqrt(X) _TGC1((X), rf◼sqrt, r◼sqrt, rl◼sqrt, cf◼sqrt, cd◼sqrt, cl◼sqrt)
#define tan(X) _TGC1((X), rf◼tan, r◼tan, rl◼tan, cf◼tan, cd◼tan, cl◼tan)
#define tanh(X) _TGC1((X), rf◼tanh, r◼tanh, rl◼tanh, cf◼tanh, cd◼tanh, cl◼tanh)

#define pow(X, Y) _TGC2((X), (Y), rf◼pow, r◼pow, rl◼pow, cf◼pow, cd◼pow, cl◼pow)

#define atan2(X, Y) _TGR2((X), (Y), rf◼atan2, r◼atan2, rl◼atan2)
#define cbrt(X) _TGR1((X), rf◼cbrt, r◼cbrt, rl◼cbrt)
#define ceil(X) _TGR1((X), rf◼ceil, r◼ceil, rl◼ceil)
#define copysign(X, Y) _TGR2((X), (Y), rf◼copysign, r◼copysign, rl◼copysign)
#define erf(X) _TGR1((X), rf◼erf, r◼erf, rl◼erf)
#define erfc(X) _TGR1((X), rf◼erfc, r◼erfc, rl◼erfc)
#define exp2(X) _TGR1((X), rf◼exp2, r◼exp2, rl◼exp2)
#define expm1(X) _TGR1((X), rf◼expm1, r◼expm1, rl◼expm1)
#define fdim(X, Y) _TGR2((X), (Y), rf◼fdim, r◼fdim, rl◼fdim)
#define floor(X) _TGR1((X), rf◼floor, r◼floor, rl◼floor)
#define fma(X, Y, Z) _TGR3((X), (Y), (Z), rf◼fma, r◼fma, rl◼fma)
#define fmax(X, Y) _TGR2((X), (Y), rf◼fmax, r◼fmax, rl◼fmax)
#define fmin(X, Y) _TGR2((X), (Y), rf◼fmin, r◼fmin, rl◼fmin)
#define fmod(X, Y) _TGR2((X), (Y), rf◼fmod, r◼fmod, rl◼fmod)
#define frexp(X, Y) _TGR12((X), (Y), rf◼frexp, r◼frexp, rl◼frexp)
#define hypot(X, Y) _TGR2((X), (Y), rf◼hypot, r◼hypot, rl◼hypot)
#define ilogb(X) _TGR1((X), rf◼ilogb, r◼ilogb, rl◼ilogb)
#define ldexp(X, Y) _TGR12((X), (Y), rf◼ldexp, r◼ldexp, rl◼ldexp)
#define lgamma(X) _TGR1((X), rf◼lgamma, r◼lgamma, rl◼lgamma)
#define llrint(X) _TGR1((X), rf◼llrint, r◼llrint, rl◼llrint)
#define llround(X) _TGR1((X), rf◼llround, r◼llround, rl◼llround)
#define log10(X) _TGR1((X), rf◼log10, r◼log10, rl◼log10)
#define log1p(X) _TGR1((X), rf◼log1p, r◼log1p, rl◼log1p)
#define log2(X) _TGR1((X), rf◼log2, r◼log2, rl◼log2)
#define logb(X) _TGR1((X), rf◼logb, r◼logb, rl◼logb)
#define lrint(X) _TGR1((X), rf◼lrint, r◼lrint, rl◼lrint)
#define lround(X) _TGR1((X), rf◼lround, r◼lround, rl◼lround)
#define nearbyint(X) _TGR1((X), rf◼nearbyint, r◼nearbyint, rl◼nearbyint)
#define nextafter(X, Y) _TGR2((X), (Y), rf◼nextafter, r◼nextafter, rl◼nextafter)
#define nexttoward(X, Y) _TGR2((X), (Y), rf◼nexttoward, r◼nexttoward, rl◼nexttoward)
#define remainder(X, Y) _TGR2((X), (Y), rf◼remainder, r◼remainder, rl◼remainder)
#define remquo(X, Y, Z) _TGR23((X), (Y), (Z), rf◼remquo, r◼remquo, rl◼remquo)
#define rint(X) _TGR1((X), rf◼rint, r◼rint, rl◼rint)
#define round(X) _TGR1((X), rf◼round, r◼round, rl◼round)
#define scalbln(X, Y) _TGR12((X), (Y), rf◼scalbln, r◼scalbln, rl◼scalbln)
#define scalbn(X, Y) _TGR12((X), (Y), rf◼scalbn, r◼scalbn, rl◼scalbn)
#define tgamma(X) _TGR1((X), rf◼tgamma, r◼tgamma, rl◼tgamma)
#define trunc(X) _TGR1((X), rf◼trunc, r◼trunc, rl◼trunc)

/** a type generic macro for complex values */
#define cmplx(X, Y) _Generic(((X)+(Y)), float: cf◼CMPLX((X), (Y)), long double: cl◼CMPLX((X), (Y)), default: cd◼CMPLX((X), (Y)))

/* type generic macros for functions that only are defined for complex values */
#define arg(Z) _Generic((Z)*c◼_Complex_I, float complex: cf◼arg, long double complex: cl◼arg, default: cd◼arg)(Z)
#define imag(Z) _Generic((Z)*c◼_Complex_I, float complex: cf◼imag, long double complex: cl◼imag, default: cd◼imag)(Z)
#define conj(Z) _Generic((Z)*c◼_Complex_I, float complex: cf◼conj, long double complex: cl◼conj, default: cd◼conj)(Z)
#define proj(Z) _Generic((Z)*c◼_Complex_I, float complex: cf◼proj, long double complex: cl◼proj, default: cd◼proj)(Z)
#define real(Z) _Generic((Z)*c◼_Complex_I, float complex: cf◼real, long double complex: cl◼real, default: cl◼real)(Z)

/**
 ** @brief Compute the absolute value of an arithmetic quantity
 **
 ** For floating point types, this type generic macro assembles the
 ** six fabs and cabs functions and chooses the one corresponding to
 ** the input type.
 **
 ** For the six wide integer types, the result always has the
 ** corresponding @c unsigned type.
 **
 ** Narrow integer types are first promoted.
 **
 ** @remark On almost all platforms abs(X) of any valid value is representable.
 **
 ** The only exception of that would be platforms that have two's
 ** complement representation @b and that just mask out the sign bit
 ** to have the corresponding @c unsigned type.
 **/
#define abs(X) _Generic(+(X), rf: rf◼fabs, r: r◼fabs, rl: rl◼fabs, cf: cf◼abs, c: cd◼abs, cl: cl◼abs, u: u◼abs, ul: ul◼abs, ull: ull◼abs, s: s◼abs, l: l◼abs, ll: ll◼abs)(X)

#define min(...) _Generic(generic◼COMBINED64(__VA_ARGS__), rf: rf◼min(__VA_ARGS__), r: r◼min(__VA_ARGS__), rl: rl◼min(__VA_ARGS__), u: u◼min(__VA_ARGS__), ul: ul◼min(__VA_ARGS__), ull: ull◼min(__VA_ARGS__), s: s◼min(__VA_ARGS__), l: l◼min(__VA_ARGS__), ll: ll◼min(__VA_ARGS__))

#define max(...) _Generic(generic◼COMBINED64(__VA_ARGS__), rf: rf◼max(__VA_ARGS__), r: r◼max(__VA_ARGS__), rl: rl◼max(__VA_ARGS__), u: u◼max(__VA_ARGS__), ul: ul◼max(__VA_ARGS__), ull: ull◼max(__VA_ARGS__), s: s◼max(__VA_ARGS__), l: l◼max(__VA_ARGS__), ll: ll◼max(__VA_ARGS__))

#pragma CMOD instantiation

_STATIC_ASSERT(sizeof(acos(1.0)) == sizeof(1.0), "check for acos type generic macro failed");
_STATIC_ASSERT(sizeof(acosh(1.0)) == sizeof(1.0), "check for acosh type generic macro failed");
_STATIC_ASSERT(sizeof(asin(1.0)) == sizeof(1.0), "check for asin type generic macro failed");
_STATIC_ASSERT(sizeof(asinh(1.0)) == sizeof(1.0), "check for asinh type generic macro failed");
_STATIC_ASSERT(sizeof(atan(1.0)) == sizeof(1.0), "check for atan type generic macro failed");
_STATIC_ASSERT(sizeof(cos(1.0)) == sizeof(1.0), "check for cos type generic macro failed");
_STATIC_ASSERT(sizeof(cosh(1.0)) == sizeof(1.0), "check for cosh type generic macro failed");
_STATIC_ASSERT(sizeof(exp(1.0)) == sizeof(1.0), "check for exp type generic macro failed");
_STATIC_ASSERT(sizeof(log(1.0)) == sizeof(1.0), "check for log type generic macro failed");
_STATIC_ASSERT(sizeof(sin(1.0)) == sizeof(1.0), "check for sin type generic macro failed");
_STATIC_ASSERT(sizeof(sinh(1.0)) == sizeof(1.0), "check for sinh type generic macro failed");
_STATIC_ASSERT(sizeof(sqrt(1.0)) == sizeof(1.0), "check for sqrt type generic macro failed");
_STATIC_ASSERT(sizeof(tan(1.0)) == sizeof(1.0), "check for tan type generic macro failed");
_STATIC_ASSERT(sizeof(tanh(1.0)) == sizeof(1.0), "check for tanh type generic macro failed");
_STATIC_ASSERT(sizeof(pow(1.0, 1.0)) == sizeof(1.0), "check for pow type generic macro failed");
_STATIC_ASSERT(sizeof(abs(1.0)) == sizeof(1.0), "check for abs type generic macro failed");
_STATIC_ASSERT(sizeof(min(1, 1.0L, 0.5)) == sizeof(1.0L), "check for min type generic macro failed");
_STATIC_ASSERT(sizeof(max(1, 1.0L, 0.5)) == sizeof(1.0L), "check for min type generic macro failed");
_STATIC_ASSERT(sizeof(acos(c◼I)) == sizeof(c◼_Complex_I), "check for acos type generic macro failed");
_STATIC_ASSERT(sizeof(acosh(c◼I)) == sizeof(c◼_Complex_I), "check for acosh type generic macro failed");
_STATIC_ASSERT(sizeof(asin(c◼I)) == sizeof(c◼_Complex_I), "check for asin type generic macro failed");
_STATIC_ASSERT(sizeof(asinh(c◼I)) == sizeof(c◼_Complex_I), "check for asinh type generic macro failed");
_STATIC_ASSERT(sizeof(atan(c◼I)) == sizeof(c◼_Complex_I), "check for atan type generic macro failed");
_STATIC_ASSERT(sizeof(cos(c◼I)) == sizeof(c◼_Complex_I), "check for cos type generic macro failed");
_STATIC_ASSERT(sizeof(cosh(c◼I)) == sizeof(c◼_Complex_I), "check for cosh type generic macro failed");
_STATIC_ASSERT(sizeof(exp(c◼I)) == sizeof(c◼_Complex_I), "check for exp type generic macro failed");
_STATIC_ASSERT(sizeof(log(c◼I)) == sizeof(c◼_Complex_I), "check for log type generic macro failed");
_STATIC_ASSERT(sizeof(sin(c◼I)) == sizeof(c◼_Complex_I), "check for sin type generic macro failed");
_STATIC_ASSERT(sizeof(sinh(c◼I)) == sizeof(c◼_Complex_I), "check for sinh type generic macro failed");
_STATIC_ASSERT(sizeof(sqrt(c◼I)) == sizeof(c◼_Complex_I), "check for sqrt type generic macro failed");
_STATIC_ASSERT(sizeof(tan(c◼I)) == sizeof(c◼_Complex_I), "check for tan type generic macro failed");
_STATIC_ASSERT(sizeof(tanh(c◼I)) == sizeof(c◼_Complex_I), "check for tanh type generic macro failed");
_STATIC_ASSERT(sizeof(pow(1.0f, c◼I)) == sizeof(c◼_Complex_I), "check for pow type generic macro failed");
_STATIC_ASSERT(sizeof(arg(c◼I)) == sizeof(c◼_Complex_I)/2, "check for arg type generic macro failed");
_STATIC_ASSERT(sizeof(imag(c◼I)) == sizeof(c◼_Complex_I)/2, "check for imag type generic macro failed");
_STATIC_ASSERT(sizeof(real(c◼I)) == sizeof(c◼_Complex_I)/2, "check for real type generic macro failed");

_STATIC_ASSERT(sizeof(atan2(1.0F, 1.0L)) == sizeof(1.0L), "check for atan2 type generic macro failed");
_STATIC_ASSERT(sizeof(cbrt(1.0L)) == sizeof(1.0L), "check for cbrt type generic macro failed");
_STATIC_ASSERT(sizeof(ceil(1.0L)) == sizeof(1.0L), "check for ceil type generic macro failed");
_STATIC_ASSERT(sizeof(copysign(1.0F, 1.0L)) == sizeof(1.0L), "check for copysign type generic macro failed");
_STATIC_ASSERT(sizeof(erf(1.0L)) == sizeof(1.0L), "check for erf type generic macro failed");
_STATIC_ASSERT(sizeof(erfc(1.0L)) == sizeof(1.0L), "check for erfc type generic macro failed");
_STATIC_ASSERT(sizeof(exp2(1.0L)) == sizeof(1.0L), "check for exp2 type generic macro failed");
_STATIC_ASSERT(sizeof(expm1(1.0L)) == sizeof(1.0L), "check for expm1 type generic macro failed");
_STATIC_ASSERT(sizeof(fdim(1.0F, 1.0L)) == sizeof(1.0L), "check for fdim type generic macro failed");
_STATIC_ASSERT(sizeof(floor(1.0L)) == sizeof(1.0L), "check for floor type generic macro failed");
_STATIC_ASSERT(sizeof(fma(1.0F, 1.0F, 1.0L)) == sizeof(1.0L), "check for fma type generic macro failed");
_STATIC_ASSERT(sizeof(fmax(1.0F, 1.0L)) == sizeof(1.0L), "check for fmax type generic macro failed");
_STATIC_ASSERT(sizeof(fmin(1.0F, 1.0L)) == sizeof(1.0L), "check for fmin type generic macro failed");
_STATIC_ASSERT(sizeof(fmod(1.0F, 1.0L)) == sizeof(1.0L), "check for fmod type generic macro failed");
_STATIC_ASSERT(sizeof(frexp(1.0L, 0)) == sizeof(1.0L), "check for frexp type generic macro failed");
_STATIC_ASSERT(sizeof(hypot(1.0F, 1.0L)) == sizeof(1.0L), "check for hypot type generic macro failed");
_STATIC_ASSERT(sizeof(ilogb(1.0L)) == sizeof(int), "check for ilogb type generic macro failed");
_STATIC_ASSERT(sizeof(ldexp(1.0L, 3)) == sizeof(1.0L), "check for ldexp type generic macro failed");
_STATIC_ASSERT(sizeof(lgamma(1.0L)) == sizeof(1.0L), "check for lgamma type generic macro failed");
_STATIC_ASSERT(sizeof(llrint(1.0L)) == sizeof(long long), "check for llrint type generic macro failed");
_STATIC_ASSERT(sizeof(llround(1.0L)) == sizeof(long long), "check for llround type generic macro failed");
_STATIC_ASSERT(sizeof(log10(1.0L)) == sizeof(1.0L), "check for log10 type generic macro failed");
_STATIC_ASSERT(sizeof(log1p(1.0L)) == sizeof(1.0L), "check for log1p type generic macro failed");
_STATIC_ASSERT(sizeof(log2(1.0L)) == sizeof(1.0L), "check for log2 type generic macro failed");
_STATIC_ASSERT(sizeof(logb(1.0L)) == sizeof(1.0L), "check for logb type generic macro failed");
_STATIC_ASSERT(sizeof(lrint(1.0L)) == sizeof(long), "check for lrint type generic macro failed");
_STATIC_ASSERT(sizeof(lround(1.0L)) == sizeof(long), "check for lround type generic macro failed");
_STATIC_ASSERT(sizeof(nearbyint(1.0L)) == sizeof(1.0L), "check for nearbyint type generic macro failed");
_STATIC_ASSERT(sizeof(nextafter(1.0L, 1.0)) == sizeof(1.0L), "check for nextafter type generic macro failed");
_STATIC_ASSERT(sizeof(nexttoward(1.0L, 1.0)) == sizeof(1.0L), "check for nexttoward type generic macro failed");
_STATIC_ASSERT(sizeof(remainder(1.0F, 1.0L)) == sizeof(1.0L), "check for remainder type generic macro failed");
_STATIC_ASSERT(sizeof(remquo(1.0F, 1.0L, 0)) == sizeof(1.0L), "check for remquo type generic macro failed");
_STATIC_ASSERT(sizeof(rint(1.0L)) == sizeof(1.0L), "check for rint type generic macro failed");
_STATIC_ASSERT(sizeof(round(1.0L)) == sizeof(1.0L), "check for round type generic macro failed");
_STATIC_ASSERT(sizeof(scalbln(1.0L, 3)) == sizeof(1.0L), "check for scalbln type generic macro failed");
_STATIC_ASSERT(sizeof(scalbn(1.0L, 4)) == sizeof(1.0L), "check for scalbn type generic macro failed");
_STATIC_ASSERT(sizeof(tgamma(1.0L)) == sizeof(1.0L), "check for tgamma type generic macro failed");
_STATIC_ASSERT(sizeof(trunc(1.0L)) == sizeof(1.0L), "check for trunc type generic macro failed");
