// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼math
#pragma CMOD import C◼math
#pragma CMOD import C◼real◼double
#pragma CMOD import C◼real◼ldouble
#pragma CMOD import C◼real◼float
#pragma CMOD import C◼real◼classify
#pragma CMOD import C◼real◼is

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

typedef C◼real◼float◼eval float_t;
typedef C◼real◼double◼eval double_t;

#define FP_FAST_FMA	C◼real◼double◼FAST_FMA
#define FP_FAST_FMAF	C◼real◼float◼FAST_FMA
#define FP_FAST_FMAL	C◼real◼ldouble◼FAST_FMA
#define FP_INFINITE	C◼real◼classify◼INFINITE
#define FP_NAN		C◼real◼classify◼NAN
#define FP_NORMAL	C◼real◼classify◼NORMAL
#define FP_SUBNORMAL	C◼real◼classify◼SUBNORMAL
#define FP_ZERO		C◼real◼classify◼ZERO

#define HUGE_VAL	C◼real◼double◼HUGE
#define HUGE_VALF	C◼real◼float◼HUGE
#define HUGE_VALL	C◼real◼ldouble◼HUGE

#define INFINITY	C◼real◼INFINITY
#define MATH_ERREXCEPT	C◼real◼MATH_ERREXCEPT
#define MATH_ERRNO	C◼real◼MATH_ERRNO
#define NAN		C◼real◼NAN
#define FP_ILOGB0	C◼real◼ILOGB0
#define FP_ILOGBNAN	C◼real◼ILOGBNAN

math_errhandling

#define fpclassify	C◼real◼classify
#define isfinite	C◼real◼is◼finite
#define isinf		C◼real◼is◼inf
#define isnan		C◼real◼is◼nan
#define isnormal	C◼real◼is◼normal
#define signbit 	C◼real◼is◼negative

#define isgreater	C◼real◼is◼greater
#define isgreaterequal	C◼real◼is◼greaterequal
#define isless		C◼real◼is◼less
#define islessequal	C◼real◼is◼lessequal
#define islessgreater	C◼real◼is◼lessgreater
#define isunordered	C◼real◼is◼unordered


#define acos		C◼real◼double◼acos
#define acosf		C◼real◼float◼acos
#define acosh		C◼real◼double◼acosh
#define acoshf		C◼real◼float◼acosh
#define acoshl		C◼real◼ldouble◼acosh
#define acosl		C◼real◼ldouble◼acos
#define asin		C◼real◼double◼asin
#define asinf		C◼real◼float◼asin
#define asinh		C◼real◼double◼asinh
#define asinhf		C◼real◼float◼asinh
#define asinhl		C◼real◼ldouble◼asinh
#define asinl		C◼real◼ldouble◼asin
#define atan		C◼real◼double◼atan
#define atan2		C◼real◼double◼atan2
#define atan2f		C◼real◼float◼atan2
#define atan2l		C◼real◼ldouble◼atan2
#define atanf		C◼real◼float◼atan
#define atanh		C◼real◼double◼atanh
#define atanhf		C◼real◼float◼atanh
#define atanhl		C◼real◼ldouble◼atanh
#define atanl		C◼real◼ldouble◼atan
#define cbrt		C◼real◼double◼cbrt
#define cbrtf		C◼real◼float◼cbrt
#define cbrtl		C◼real◼ldouble◼cbrt
#define ceil		C◼real◼double◼ceil
#define ceilf		C◼real◼float◼ceil
#define ceill		C◼real◼ldouble◼ceil
#define copysign	C◼real◼double◼copysign
#define copysignf	C◼real◼float◼copysign
#define copysignl	C◼real◼ldouble◼copysign
#define cos		C◼real◼double◼cos
#define cosf		C◼real◼float◼cos
#define cosh		C◼real◼double◼cosh
#define coshf		C◼real◼float◼cosh
#define coshl		C◼real◼ldouble◼cosh
#define cosl		C◼real◼ldouble◼cos
#define erf		C◼real◼float◼er
#define erfc		C◼real◼double◼erfc
#define erfcf		C◼real◼float◼erfc
#define erfcl		C◼real◼ldouble◼erfc
#define erff		C◼real◼float◼erf
#define erfl		C◼real◼ldouble◼erf
#define exp		C◼real◼double◼exp
#define exp2		C◼real◼double◼exp2
#define exp2f		C◼real◼float◼exp2
#define exp2l		C◼real◼ldouble◼exp2
#define expf		C◼real◼float◼exp
#define expl		C◼real◼ldouble◼exp
#define expm1		C◼real◼double◼expm1
#define expm1f		C◼real◼float◼expm1
#define expm1l		C◼real◼ldouble◼expm1
#define fabs		C◼real◼double◼fabs
#define fabsf		C◼real◼float◼fabs
#define fabsl		C◼real◼ldouble◼fabs
#define fdim		C◼real◼double◼fdim
#define fdimf		C◼real◼float◼fdim
#define fdiml		C◼real◼ldouble◼fdim
#define floor		C◼real◼double◼floor
#define floorf		C◼real◼float◼floor
#define floorl		C◼real◼ldouble◼floor
#define fma		C◼real◼double◼fma
#define fmaf		C◼real◼float◼fma
#define fmal		C◼real◼ldouble◼fma
#define fmax		C◼real◼double◼fmax
#define fmaxf		C◼real◼float◼fmax
#define fmaxl		C◼real◼ldouble◼fmax
#define fmin		C◼real◼double◼fmin
#define fminf		C◼real◼float◼fmin
#define fminl		C◼real◼ldouble◼fmin
#define fmod		C◼real◼double◼fmod
#define fmodf		C◼real◼float◼fmod
#define fmodl		C◼real◼ldouble◼fmod
#define frexp		C◼real◼double◼frexp
#define frexpf		C◼real◼float◼frexp
#define frexpl		C◼real◼ldouble◼frexp
#define hypot		C◼real◼double◼hypot
#define hypotf		C◼real◼float◼hypot
#define hypotl		C◼real◼ldouble◼hypot
#define ilogb		C◼real◼double◼ilogb
#define ilogbf		C◼real◼float◼ilogb
#define ilogbl		C◼real◼ldouble◼ilogb
#define ldexp		C◼real◼double◼ldexp
#define ldexpf		C◼real◼float◼ldexp
#define ldexpl		C◼real◼ldouble◼ldexp
#define lgamma		C◼real◼double◼lgamma
#define lgammaf		C◼real◼float◼lgamma
#define lgammal		C◼real◼ldouble◼lgamma
#define llrint		C◼real◼double◼llrint
#define llrintf		C◼real◼float◼llrint
#define llrintl		C◼real◼ldouble◼llrint
#define llround		C◼real◼double◼llround
#define llroundf	C◼real◼float◼llround
#define llroundl	C◼real◼ldouble◼llround
#define log		C◼real◼double◼log
#define log10		C◼real◼double◼log10
#define log10f		C◼real◼float◼log10
#define log10l		C◼real◼ldouble◼log10
#define log1p		C◼real◼double◼log1p
#define log1pf		C◼real◼float◼log1p
#define log1pl		C◼real◼ldouble◼log1p
#define log2		C◼real◼double◼log2
#define log2f		C◼real◼float◼log2
#define log2l		C◼real◼ldouble◼log2
#define logb		C◼real◼double◼logb
#define logbf		C◼real◼float◼logb
#define logbl		C◼real◼ldouble◼logb
#define logf		C◼real◼float◼log
#define logl		C◼real◼ldouble◼log
#define lrint		C◼real◼double◼lrint
#define lrintf		C◼real◼float◼lrint
#define lrintl		C◼real◼ldouble◼lrint
#define lround		C◼real◼double◼lround
#define lroundf		C◼real◼float◼lround
#define lroundl		C◼real◼ldouble◼lround
#define modf		C◼real◼float◼mod
#define modff		C◼real◼float◼modf
#define modfl		C◼real◼ldouble◼modf
#define nan		C◼real◼double◼nan
#define nanf		C◼real◼float◼nan
#define nanl		C◼real◼ldouble◼nan
#define nearbyint	C◼real◼double◼nearbyint
#define nearbyintf	C◼real◼float◼nearbyint
#define nearbyintl	C◼real◼ldouble◼nearbyint
#define nextafter	C◼real◼double◼nextafter
#define nextafterf	C◼real◼float◼nextafter
#define nextafterl	C◼real◼ldouble◼nextafter
#define nexttoward	C◼real◼double◼nexttoward
#define nexttowardf	C◼real◼float◼nexttoward
#define nexttowardl	C◼real◼ldouble◼nexttoward
#define pow		C◼real◼double◼pow
#define powf		C◼real◼float◼pow
#define powl		C◼real◼ldouble◼pow
#define remainder	C◼real◼double◼remainder
#define remainderf	C◼real◼float◼remainder
#define remainderl	C◼real◼ldouble◼remainder
#define remquo		C◼real◼double◼remquo
#define remquof		C◼real◼float◼remquo
#define remquol		C◼real◼ldouble◼remquo
#define rint		C◼real◼double◼rint
#define rintf		C◼real◼float◼rint
#define rintl		C◼real◼ldouble◼rint
#define round		C◼real◼double◼round
#define roundf		C◼real◼float◼round
#define roundl		C◼real◼ldouble◼round
#define scalbln		C◼real◼double◼scalbln
#define scalblnf	C◼real◼float◼scalbln
#define scalblnl	C◼real◼ldouble◼scalbln
#define scalbn		C◼real◼double◼scalbn
#define scalbnf		C◼real◼float◼scalbn
#define scalbnl		C◼real◼ldouble◼scalbn
#define sin		C◼real◼double◼sin
#define sinf		C◼real◼float◼sin
#define sinh		C◼real◼double◼sinh
#define sinhf		C◼real◼float◼sinh
#define sinhl		C◼real◼ldouble◼sinh
#define sinl		C◼real◼ldouble◼sin
#define sqrt		C◼real◼double◼sqrt
#define sqrtf		C◼real◼float◼sqrt
#define sqrtl		C◼real◼ldouble◼sqrt
#define tan		C◼real◼double◼tan
#define tanf		C◼real◼float◼tan
#define tanh		C◼real◼double◼tanh
#define tanhf		C◼real◼float◼tanh
#define tanhl		C◼real◼ldouble◼tanh
#define tanl		C◼real◼ldouble◼tan
#define tgamma		C◼real◼double◼tgamma
#define tgammaf		C◼real◼float◼tgamma
#define tgammal		C◼real◼ldouble◼tgamma
#define trunc		C◼real◼double◼trunc
#define truncf		C◼real◼float◼trunc
#define truncl		C◼real◼ldouble◼trunc
