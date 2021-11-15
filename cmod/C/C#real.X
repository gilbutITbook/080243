// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module real = C◼real

#pragma CMOD mimic <math.h>
#pragma CMOD mimic <float.h>
#pragma CMOD link -lm

#pragma CMOD defexp ROUNDS=FLT_ROUNDS

#pragma CMOD defexp DECIMAL_DIG
#pragma CMOD defexp RADIX=FLT_RADIX
#pragma CMOD defexp EVAL_METHOD=FLT_EVAL_METHOD

#pragma CMOD defexp ILOGB0=◼FP_ILOGB0
#pragma CMOD defexp ILOGBNAN=◼FP_ILOGBNAN
#pragma CMOD defexp ERREXCEPT=◼MATH_ERREXCEPT
#pragma CMOD defexp ERRNO=◼MATH_ERRNO

/* These are of type float */
#pragma CMOD define INFINITY
#pragma CMOD define NAN


#pragma CMOD declaration


/* ``It is unspecified whether math_errhandling is a macro or an
   identifier with external linkage.''

   To cope with that situation we distinguish three cases. If
   math_errhandling is defined and is an ICE everything is fine. If it
   is not defined it must be an external variable, also
   fine. Otherwise it might be some weird expression that we don't
   know much about. Cross fingers and use that one directly. */
#pragma CMOD defexp errhandling=#math_errhandling, ICE(math_errhandling, math_errhandling, 0)
#pragma CMOD define errhandling_expr=math_errhandling
#pragma CMOD alias errhandling=math_errhandling
#if defined(errhandling)
# if errhandling == 0
#  undef errhandling
#  define errhandling errhandling_expr
# endif
#else
extern int const errhandling;
#endif
