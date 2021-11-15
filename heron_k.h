#ifndef HERON_K_H
#define HERON_K_H 1

#include <stdlib.h>
#include <stdio.h>
/* Math functions usually need "-lm" as compiler argument: */
#include <math.h>
#include <assert.h>
#include <float.h>


/**
 ** @file
 ** @brief Implement a Heron process to approximate powers of `1/k`
 **/


/**
 ** @def FLT_RDXRDX
 ** @brief the radix base 2 of @c FLT_RADIX
 **
 ** This is needed internally for some of the code below.
 **/
#if FLT_RADIX == 2
# define FLT_RDXRDX 1
#elif FLT_RADIX == 4
# define FLT_RDXRDX 2
#elif FLT_RADIX == 8
# define FLT_RDXRDX 3
#elif FLT_RADIX == 16
# define FLT_RDXRDX 4
#else
# error "encoutered platform with unusual FLT_RADIX, please report"
/**
 ** @def FLT_RDXRDX
 ** @brief the radix base 2 of @c FLT_RADIX
 **
 ** This is needed internally for some of the code below.
 **/
# define FLT_RDXRDX something
#endif

/**
 ** @brief raise @a to the power of @a k
 **
 ** @warning manual implementation as an exercise, never use in
 ** production code
 **
 ** @pre @a k must be a power of 2.0
 **/
double expk2(double a, unsigned k);

/**
 ** @brief raise @a to the power of @a k
 **
 ** @warning manual implementation as an exercise, never use in
 ** production code
 **
 ** @pre @a a must be strictly greater than 0.
 **/
double expk_rec(double a, unsigned k);

/**
 ** @brief convert floating-point number to fractional and integral components
 **
 ** @warning manual implementation as an exercise, never use in
 ** production code
 **
 ** This implementation just repeatedly multiplies the input value by
 ** 2.0 or 0.5.
 **/
double frexp_np(double x, signed exp[static 1]);

/**
 ** @brief compute a good estimate for the Heron process for k=-1
 ** @return x is a power of 2 such that 0.5 <= x*a < 1.0
 ** @pre Supposes that a > 0
 **/
double heron1_estimate(double a);

/**
 ** @brief compute a good estimate for the Heron process for k=-1
 ** @return x is a power of 2 such that 0.5 <= x*a < 1.0
 ** @pre Supposes that 0 < a < 0.5
 **/
double heron1_estimate_dir_05(double a);

/**
 ** @brief compute a good estimate for the Heron process for k=-1
 ** @return x is a power of 2 such that 0.5 <= x*a < 1.0
 ** @pre Supposes that a > 1.0
 **/
double heron1_estimate_dir_10(double a);

/**
 ** @brief compute a good estimate for the Heron process for k=-1
 ** @return x is a power of 2 such that 0.5 <= x*a < 1.0
 ** @pre Supposes that a > 0.0
 **/
double heron1_estimate_dir(double a);

/**
 ** @brief use the Heron process to approximate 1.0/a
 ** @pre Supposes that a > 0.0
 **/
double heron1(double a);

/**
 ** @brief raise @a to the power of @a k
 **
 ** @warning manual implementation as an exercise, never use in
 ** production code
 **/
double expk(double a, signed k);

/**
 ** @brief use the Heron process to approximate @a a to the
 ** power of `1/k`
 **
 ** Or in other words this computes the @f$k^{th}@f$ root of @a a.
 ** As a special feature, if @a k is `-1` it computes the
 ** multiplicative inverse of @a a.
 **
 ** @param a must be greater than `0.0`
 ** @param k should not be `0` and otherwise be between
 ** `DBL_MIN_EXP*FLT_RDXRDX` and
 ** `DBL_MAX_EXP*FLT_RDXRDX`.
 **
 ** @see FLT_RDXRDX
 **/
double heron(double a, signed k);

#endif
