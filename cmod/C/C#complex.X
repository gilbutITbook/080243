// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module _Exporter=C◼complex

#pragma CMOD mimic !defined(__STDC_NO_COMPLEX__), <complex.h>
#pragma CMOD link -lm

#pragma CMOD defexp NO_COMPLEX=◼__STDC_NO_COMPLEX__, __STDC_NO_COMPLEX__
#pragma CMOD define _Complex_I
#pragma CMOD define imaginary
#pragma CMOD define _Imaginary_I
#pragma CMOD define I

/* musl uses this */
#pragma CMOD define __CMPLX

#pragma CMOD declaration

#pragma CMOD snippet none
#pragma CMOD declaration

#ifndef _Exporter◼NO_COMPLEX
# define complex _Complex
# define I _Exporter◼I
# define _Complex_I _Exporter◼_Complex_I
# ifdef _Exporter◼imaginary
#  define imaginary _Exporter◼imaginary
# endif
# ifdef _Exporter◼_Imaginary_I
#  define _Imaginary_I _Exporter◼_Imaginary_I
# endif
#endif
