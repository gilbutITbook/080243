// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼complex◼ldouble

#pragma CMOD mimic !defined(__STDC_NO_COMPLEX__), <complex.h>

#pragma CMOD define CMPLX=CMPLXL

//#pragma CMOD alias acos
#pragma CMOD alias acos=cacosl
#pragma CMOD alias asin=casinl
#pragma CMOD alias atan=catanl
#pragma CMOD alias cos=ccosl
#pragma CMOD alias sin=csinl
#pragma CMOD alias tan=ctanl
#pragma CMOD alias acosh=cacoshl
#pragma CMOD alias asinh=casinhl
#pragma CMOD alias atanh=catanhl
#pragma CMOD alias cosh=ccoshl
#pragma CMOD alias sinh=csinhl
#pragma CMOD alias tanh=ctanhl
#pragma CMOD alias exp=cexpl
#pragma CMOD alias log=clogl
#pragma CMOD alias abs=cabsl
#pragma CMOD alias pow=cpowl
#pragma CMOD alias sqrt=csqrtl
#pragma CMOD alias arg=cargl
#pragma CMOD alias imag=cimagl
#pragma CMOD alias conj=conjl
#pragma CMOD alias proj=cprojl
#pragma CMOD alias real=creall

#pragma CMOD declaration

#ifndef C◼complex◼NO_COMPLEX

typedef long double _Complex C◼complex◼ldouble;

long double _Complex acos(long double _Complex);
long double _Complex asin(long double _Complex);
long double _Complex atan(long double _Complex);
long double _Complex cos(long double _Complex);
long double _Complex sin(long double _Complex);
long double _Complex tan(long double _Complex);
long double _Complex acosh(long double _Complex);
long double _Complex asinh(long double _Complex);
long double _Complex atanh(long double _Complex);
long double _Complex cosh(long double _Complex);
long double _Complex sinh(long double _Complex);
long double _Complex tanh(long double _Complex);
long double _Complex exp(long double _Complex);
long double _Complex log(long double _Complex);
long double abs(long double _Complex);
long double _Complex pow(long double _Complex, long double _Complex);
long double _Complex sqrt(long double _Complex);
long double (arg)(long double _Complex);
long double (imag)(long double _Complex);
long double _Complex (conj)(long double _Complex);
long double _Complex (proj)(long double _Complex);
long double (real)(long double _Complex);

#if defined(C◼complex◼__CMPLX)
# define __CMPLX C◼complex◼__CMPLX
#endif
#ifndef CMPLX
/* clang have their special syntax for complex literal */
# if defined(__clang__)
#  define CMPLX(X, Y) ((long double _Complex){ (X), (Y), })
# elif defined(__GNUC__)
#  define CMPLX(X, Y) __builtin_complex((long double)(X), (long double)(Y))
# else
#  define CMPLX(X, Y) ((long double){ (X) } + I*(long double){ (Y) })
# endif
#endif

#endif
