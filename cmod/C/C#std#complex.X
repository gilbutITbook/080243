// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼complex
#pragma CMOD import C◼complex◼double
#pragma CMOD import C◼complex◼float
#pragma CMOD import C◼complex◼ldouble

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define __STDC_NO_COMPLEX__ C◼complex◼NO_COMPLEX

#ifdef __STDC_NO_COMPLEX__

#ifdef C◼complex◼imaginary
# define imaginary C◼complex◼imaginary
#endif
#ifdef C◼complex
# define complex C◼complex
#endif
#ifdef C◼complex◼_Imaginary_I
# define _Imaginary_I C◼complex◼_Imaginary_I
#endif
#ifdef C◼complex◼_Complex_I
# define _Complex_I C◼complex◼_Complex_I
#endif
#ifdef C◼complex◼I
# define I C◼complex◼I
#endif

#define cacos C◼complex◼double◼acos
#define casin C◼complex◼double◼asin
#define catan C◼complex◼double◼atan
#define ccos C◼complex◼double◼cos
#define csin C◼complex◼double◼sin
#define ctan C◼complex◼double◼tan
#define cacosh C◼complex◼double◼acosh
#define casinh C◼complex◼double◼asinh
#define catanh C◼complex◼double◼atanh
#define ccosh C◼complex◼double◼cosh
#define csinh C◼complex◼double◼sinh
#define ctanh C◼complex◼double◼tanh
#define cexp C◼complex◼double◼exp
#define clog C◼complex◼double◼log
#define cabs C◼complex◼double◼abs
#define cpow C◼complex◼double◼pow
#define csqrt C◼complex◼double◼sqrt
#define carg C◼complex◼double◼arg
#define cimag C◼complex◼double◼imag
#define cconj C◼complex◼double◼conj
#define cproj C◼complex◼double◼proj
#define creal C◼complex◼double◼real
#define CMPLX C◼complex◼double◼CMPLX

#define cacosf C◼complex◼float◼acos
#define casinf C◼complex◼float◼asin
#define catanf C◼complex◼float◼atan
#define ccosf C◼complex◼float◼cos
#define csinf C◼complex◼float◼sin
#define ctanf C◼complex◼float◼tan
#define cacoshf C◼complex◼float◼acosh
#define casinhf C◼complex◼float◼asinh
#define catanhf C◼complex◼float◼atanh
#define ccoshf C◼complex◼float◼cosh
#define csinhf C◼complex◼float◼sinh
#define ctanhf C◼complex◼float◼tanh
#define cexpf C◼complex◼float◼exp
#define clogf C◼complex◼float◼log
#define cabsf C◼complex◼float◼abs
#define cpowf C◼complex◼float◼pow
#define csqrtf C◼complex◼float◼sqrt
#define cargf C◼complex◼float◼arg
#define cimagf C◼complex◼float◼imag
#define cconjf C◼complex◼float◼conj
#define cprojf C◼complex◼float◼proj
#define crealf C◼complex◼float◼real
#define CMPLXF C◼complex◼float◼CMPLX

#define cacosl C◼complex◼ldouble◼acos
#define casinl C◼complex◼ldouble◼asin
#define catanl C◼complex◼ldouble◼atan
#define ccosl C◼complex◼ldouble◼cos
#define csinl C◼complex◼ldouble◼sin
#define ctanl C◼complex◼ldouble◼tan
#define cacoshl C◼complex◼ldouble◼acosh
#define casinhl C◼complex◼ldouble◼asinh
#define catanhl C◼complex◼ldouble◼atanh
#define ccoshl C◼complex◼ldouble◼cosh
#define csinhl C◼complex◼ldouble◼sinh
#define ctanhl C◼complex◼ldouble◼tanh
#define cexpl C◼complex◼ldouble◼exp
#define clogl C◼complex◼ldouble◼log
#define cabsl C◼complex◼ldouble◼abs
#define cpowl C◼complex◼ldouble◼pow
#define csqrtl C◼complex◼ldouble◼sqrt
#define cargl C◼complex◼ldouble◼arg
#define cimagl C◼complex◼ldouble◼imag
#define cconjl C◼complex◼ldouble◼conj
#define cprojl C◼complex◼ldouble◼proj
#define creall C◼complex◼ldouble◼real
#define CMPLXL C◼complex◼ldouble◼CMPLX

#endif
