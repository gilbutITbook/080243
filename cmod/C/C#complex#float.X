// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼complex◼float

#pragma CMOD mimic !defined(__STDC_NO_COMPLEX__), <complex.h>

#pragma CMOD define CMPLX=CMPLXF

//#pragma CMOD alias acos
#pragma CMOD alias acos=cacosf
#pragma CMOD alias asin=casinf
#pragma CMOD alias atan=catanf
#pragma CMOD alias cos=ccosf
#pragma CMOD alias sin=csinf
#pragma CMOD alias tan=ctanf
#pragma CMOD alias acosh=cacoshf
#pragma CMOD alias asinh=casinhf
#pragma CMOD alias atanh=catanhf
#pragma CMOD alias cosh=ccoshf
#pragma CMOD alias sinh=csinhf
#pragma CMOD alias tanh=ctanhf
#pragma CMOD alias exp=cexpf
#pragma CMOD alias log=clogf
#pragma CMOD alias abs=cabsf
#pragma CMOD alias pow=cpowf
#pragma CMOD alias sqrt=csqrtf
#pragma CMOD alias arg=cargf
#pragma CMOD alias imag=cimagf
#pragma CMOD alias conj=conjf
#pragma CMOD alias proj=cprojf
#pragma CMOD alias real=crealf

#pragma CMOD declaration

#ifndef C◼complex◼NO_COMPLEX

typedef float _Complex C◼complex◼float;

float _Complex acos(float _Complex);
float _Complex asin(float _Complex);
float _Complex atan(float _Complex);
float _Complex cos(float _Complex);
float _Complex sin(float _Complex);
float _Complex tan(float _Complex);
float _Complex acosh(float _Complex);
float _Complex asinh(float _Complex);
float _Complex atanh(float _Complex);
float _Complex cosh(float _Complex);
float _Complex sinh(float _Complex);
float _Complex tanh(float _Complex);
float _Complex exp(float _Complex);
float _Complex log(float _Complex);
float abs(float _Complex);
float _Complex pow(float _Complex, float _Complex);
float _Complex sqrt(float _Complex);
float (arg)(float _Complex);
float (imag)(float _Complex);
float _Complex (conj)(float _Complex);
float _Complex (proj)(float _Complex);
float (real)(float _Complex);

#if defined(C◼complex◼__CMPLX)
# define __CMPLX C◼complex◼__CMPLX
#endif
#ifndef CMPLX
/* clang have their special syntax for complex literal */
# if defined(__clang__)
#  define CMPLX(X, Y) ((float _Complex){ (X), (Y), })
# elif defined(__GNUC__)
#  define CMPLX(X, Y) __builtin_complex((float)(X), (float)(Y))
# else
#  define CMPLX(X, Y) ((float){ (X) } + I*(float){ (Y) })
# endif
#endif

#endif
