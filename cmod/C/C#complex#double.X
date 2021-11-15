// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼complex◼double

#pragma CMOD mimic !defined(__STDC_NO_COMPLEX__), <complex.h>

#pragma CMOD define CMPLX

//#pragma CMOD alias acos
#pragma CMOD alias acos=cacos
#pragma CMOD alias asin=casin
#pragma CMOD alias atan=catan
#pragma CMOD alias cos=ccos
#pragma CMOD alias sin=csin
#pragma CMOD alias tan=ctan
#pragma CMOD alias acosh=cacosh
#pragma CMOD alias asinh=casinh
#pragma CMOD alias atanh=catanh
#pragma CMOD alias cosh=ccosh
#pragma CMOD alias sinh=csinh
#pragma CMOD alias tanh=ctanh
#pragma CMOD alias exp=cexp
#pragma CMOD alias log=clog
#pragma CMOD alias abs=cabs
#pragma CMOD alias pow=cpow
#pragma CMOD alias sqrt=csqrt
#pragma CMOD alias arg=carg
#pragma CMOD alias imag=cimag
#pragma CMOD alias conj=cconj
#pragma CMOD alias proj=cproj
#pragma CMOD alias real=creal

#pragma CMOD declaration

#ifndef C◼complex◼NO_COMPLEX

typedef double _Complex C◼complex◼double;

double _Complex acos(double _Complex);
double _Complex asin(double _Complex);
double _Complex atan(double _Complex);
double _Complex cos(double _Complex);
double _Complex sin(double _Complex);
double _Complex tan(double _Complex);
double _Complex acosh(double _Complex);
double _Complex asinh(double _Complex);
double _Complex atanh(double _Complex);
double _Complex cosh(double _Complex);
double _Complex sinh(double _Complex);
double _Complex tanh(double _Complex);
double _Complex exp(double _Complex);
double _Complex log(double _Complex);
double abs(double _Complex);
double _Complex pow(double _Complex, double _Complex);
double _Complex sqrt(double _Complex);
double (arg)(double _Complex);
double (imag)(double _Complex);
double _Complex (conj)(double _Complex);
double _Complex (proj)(double _Complex);
double (real)(double _Complex);

#if defined(C◼complex◼__CMPLX)
# define __CMPLX C◼complex◼__CMPLX
#endif
#ifndef CMPLX
/* clang have their special syntax for complex literal */
# if defined(__clang__)
#  define CMPLX(X, Y) ((double _Complex){ (X), (Y), })
# elif defined(__GNUC__)
#  define CMPLX(X, Y) __builtin_complex((double)(X), (double)(Y))
# else
#  define CMPLX(X, Y) ((double)(X) + I*(double)(Y))
# endif
#endif

#endif
