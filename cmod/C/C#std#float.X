// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼float
#pragma CMOD import C◼real◼float
#pragma CMOD import C◼real◼double
#pragma CMOD import C◼real◼ldouble

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#DEFINE FLT_RADIX	C◼real◼RADIX
#DEFINE FLT_ROUNDS	C◼real◼ROUNDS
#DEFINE FLT_EVAL_METHOD	C◼real◼EVAL_METHOD
#DEFINE DECIMAL_DIG	C◼real◼DECIMAL_DIG

#DEFINE DBL_DECIMAL_DIG	C◼real◼double◼DECIMAL_DIG
#DEFINE DBL_DIG		C◼real◼double◼DIG
#DEFINE DBL_EPSILON	C◼real◼double◼EPSILON
#DEFINE DBL_HAS_SUBNORM	C◼real◼double◼HAS_SUBNORM
#DEFINE DBL_MANT_DIG	C◼real◼double◼MANT_DIG
#DEFINE DBL_MAX		C◼real◼double◼MAX
#DEFINE DBL_MAX_10_EXP	C◼real◼double◼MAX_10_EXP
#DEFINE DBL_MAX_EXP	C◼real◼double◼MAX_EXP
#DEFINE DBL_MIN		C◼real◼double◼MIN
#DEFINE DBL_MIN_10_EXP	C◼real◼double◼MIN_10_EXP
#DEFINE DBL_MIN_EXP	C◼real◼double◼MIN_EXP
#DEFINE DBL_TRUE_MIN	C◼real◼double◼TRUE_MIN

#DEFINE FLT_DECIMAL_DIG	C◼real◼float◼DECIMAL_DIG
#DEFINE FLT_DIG		C◼real◼float◼DIG
#DEFINE FLT_EPSILON	C◼real◼float◼EPSILON
#DEFINE FLT_HAS_SUBNORM	C◼real◼float◼HAS_SUBNORM
#DEFINE FLT_MANT_DIG	C◼real◼float◼MANT_DIG
#DEFINE FLT_MAX		C◼real◼float◼MAX
#DEFINE FLT_MAX_10_EXP	C◼real◼float◼MAX_10_EXP
#DEFINE FLT_MAX_EXP	C◼real◼float◼MAX_EXP
#DEFINE FLT_MIN		C◼real◼float◼MIN
#DEFINE FLT_MIN_10_EXP	C◼real◼float◼MIN_10_EXP
#DEFINE FLT_MIN_EXP	C◼real◼float◼MIN_EXP
#DEFINE FLT_TRUE_MIN	C◼real◼float◼TRUE_MIN

#DEFINE LDBL_DECIMAL_DIG	C◼real◼ldouble◼DECIMAL_DIG
#DEFINE LDBL_DIG	C◼real◼ldouble◼DIG
#DEFINE LDBL_EPSILON	C◼real◼ldouble◼EPSILON
#DEFINE LDBL_HAS_SUBNORM	C◼real◼ldouble◼HAS_SUBNORM
#DEFINE LDBL_MANT_DIG	C◼real◼ldouble◼MANT_DIG
#DEFINE LDBL_MAX	C◼real◼ldouble◼MAX
#DEFINE LDBL_MAX_10_EXP	C◼real◼ldouble◼MAX_10_EXP
#DEFINE LDBL_MAX_EXP	C◼real◼ldouble◼MAX_EXP
#DEFINE LDBL_MIN	C◼real◼ldouble◼MIN
#DEFINE LDBL_MIN_10_EXP	C◼real◼ldouble◼MIN_10_EXP
#DEFINE LDBL_MIN_EXP	C◼real◼ldouble◼MIN_EXP
#DEFINE LDBL_TRUE_MIN	C◼real◼ldouble◼TRUE_MIN
