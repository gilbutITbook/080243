// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module ldouble=C◼real◼ldouble
#pragma CMOD import minmax	= C◼snippet◼minmax

#pragma CMOD mimic <math.h>
#pragma CMOD mimic <float.h>


#pragma CMOD defexp HAS_SUBNORM=◼LDBL_HAS_SUBNORM
#pragma CMOD defexp MANT_DIG=◼LDBL_MANT_DIG
#pragma CMOD defexp DECIMAL_DIG=◼LDBL_DECIMAL_DIG
#pragma CMOD defexp DIG=◼LDBL_DIG
#pragma CMOD define HUGE=HUGE_VALL
#pragma CMOD defexp MIN_EXP=◼LDBL_MIN_EXP
#pragma CMOD defexp MIN_10_EXP=◼LDBL_MIN_10_EXP
#pragma CMOD defexp MAX_EXP=◼LDBL_MAX_EXP
#pragma CMOD defexp MAX_10_EXP=◼LDBL_MAX_10_EXP
#pragma CMOD defexp MAX=◼LDBL_MAX
#pragma CMOD defexp MIN=◼LDBL_MIN
#pragma CMOD defexp TRUE_MIN=◼LDBL_TRUE_MIN
#pragma CMOD defexp EPSILON=◼LDBL_EPSILON
#pragma CMOD define FAST_FMA=FP_FAST_FMAL

#pragma CMOD defexp PI=4.0L*atanl(1.0L)

#pragma CMOD alias acos=acosl
#pragma CMOD alias acosh=acoshl
#pragma CMOD alias asin=asinl
#pragma CMOD alias asinh=asinhl
#pragma CMOD alias atan=atanl
#pragma CMOD alias atan2=atan2l
#pragma CMOD alias atanh=atanhl
#pragma CMOD alias ceil=ceill
#pragma CMOD alias cbrt=cbrtl
#pragma CMOD alias copysign=copysignl
#pragma CMOD alias cos=cosl
#pragma CMOD alias cosh=coshl
#pragma CMOD alias erf=erfl
#pragma CMOD alias erfc=erfcl
#pragma CMOD alias exp=expl
#pragma CMOD alias exp2=exp2l
#pragma CMOD alias expm1=expm1l
#pragma CMOD alias fabs=fabsl
#pragma CMOD alias fdim=fdiml
#pragma CMOD alias floor=floorl
#pragma CMOD alias fma=fmal
#pragma CMOD alias fmax=fmaxl
#pragma CMOD alias fmin=fminl
#pragma CMOD alias fmod=fmodl
#pragma CMOD alias frexp=frexpl
#pragma CMOD alias hypot=hypotl
#pragma CMOD alias ilogb=ilogbl
#pragma CMOD alias ldexp=ldexpl
#pragma CMOD alias lgamma=lgammal
#pragma CMOD alias llrint=llrintl
#pragma CMOD alias llround=llroundl
#pragma CMOD alias log=logl
#pragma CMOD alias log10=log10l
#pragma CMOD alias log1p=log1pl
#pragma CMOD alias log2=log2l
#pragma CMOD alias logb=logbl
#pragma CMOD alias lrint=lrintl
#pragma CMOD alias lround=lroundl
#pragma CMOD alias modf=modfl
#pragma CMOD alias nan=nanl
#pragma CMOD alias nearbyint=nearbyintl
#pragma CMOD alias nextafter=nextafterl
#pragma CMOD alias nexttoward=nexttowardl
#pragma CMOD alias pow=powl
#pragma CMOD alias remainder=remainderl
#pragma CMOD alias remquo=remquol
#pragma CMOD alias rint=rintl
#pragma CMOD alias round=roundl
#pragma CMOD alias scalbln=scalblnl
#pragma CMOD alias scalbn=scalbnl
#pragma CMOD alias sin=sinl
#pragma CMOD alias sinh=sinhl
#pragma CMOD alias sqrt=sqrtl
#pragma CMOD alias tan=tanl
#pragma CMOD alias tanh=tanhl
#pragma CMOD alias tgamma=tgammal
#pragma CMOD alias trunc=truncl

#pragma CMOD declaration
typedef long double eval;
typedef long double ldouble;

long double (acos)(long double);
long double (acosh)(long double);
long double (asin)(long double);
long double (asinh)(long double);
long double (atan)(long double);
long double (atan2)(long double, long double);
long double (atanh)(long double);
long double (cbrt)(long double);
long double (copysign)(long double, long double);
long double (cos)(long double);
long double (cosh)(long double);
long double (erf)(long double);
long double (erfc)(long double);
long double (exp)(long double);
long double (exp2)(long double);
long double (expm1)(long double);
long double (fabs)(long double);
long double (fdim)(long double, long double);
long double (ceil)(long double);
long double (floor)(long double);
long double (fma)(long double, long double, long double);
long double (fmax)(long double, long double);
long double (fmin)(long double, long double);
long double (fmod)(long double, long double);
long double (frexp)(long double, int*);
long double (hypot)(long double, long double);
long double (ldexp)(long double, int);
long double (lgamma)(long double);
long double (log)(long double);
long double (log10)(long double);
long double (log1p)(long double);
long double (log2)(long double);
long double (logb)(long double);
long double (modf)(long double, long double*);
long double (nan)(const char*);
long double (nearbyint)(long double);
long double (nextafter)(long double, long double);
long double (nexttoward)(long double, long double);
long double (pow)(long double, long double);
long double (remainder)(long double, long double);
long double (remquo)(long double, long double, int*);
long double (rint)(long double);
long double (round)(long double);
long double (scalbln)(long double, long int);
long double (scalbn)(long double, int);
long double (sin)(long double);
long double (sinh)(long double);
long double (sqrt)(long double);
long double (tan)(long double);
long double (tanh)(long double);
long double (tgamma)(long double);
long double (trunc)(long double);
int (ilogb)(long double);
long int (lrint)(long double);
long int (lround)(long double);
long long int (llrint)(long double);
long long int (llround)(long double);

#pragma CMOD snippet none
#pragma CMOD declaration
typedef C◼ldouble ldouble;
