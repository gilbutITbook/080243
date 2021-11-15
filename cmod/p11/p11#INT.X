// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module INT = p11◼INT
#pragma CMOD import ARG = p11◼NARG1
#pragma CMOD import IS  = p11◼IS
#pragma CMOD import REP = p11◼REP
#pragma CMOD import SKIP= p11◼SKIP

#pragma CMOD declaration

#define COM(A) REP(A,,)
/** @brief Add two (small) decimal numbers
 **
 **/
#define ADD(A, B) ARG◼NCOMMA(COM(A)COM(B))
/** @brief Subtract two (small) decimal numbers
 **
 ** If @a A is less than or equal to @B this returns @c 0.
 **/
#define SUB(A, B) ARG◼NCOMMA(SKIP(B, COM(A)))
/** @brief Multiply two (small) decimal numbers
 **
 **/
#define MUL(A, B) ARG◼NCOMMA(REP(A, COM(B)))

#define GE0(A, B) IS◼OR(IS◼EQ(A, B), IS◼BOOL(SUB(A, B)))
/** @brief Test two (small) decimal numbers for greater than or equal
 **
 ** @return 0 for false and 1 for true.
 **/
#define GE(...) GE0(__VA_ARGS__)
/** @brief Test two (small) decimal numbers for less than or equal
 **
 ** @return 0 for false and 1 for true.
 **/
#define LE(A, B) GE(B, A)

#define GT0(A, B) IS◼NOT(LE(A, B))
/** @brief Test two (small) decimal numbers for greater than
 **
 ** @return 0 for false and 1 for true.
 **/
#define GT(...) GT0(__VA_ARGS__)
/** @brief Test two (small) decimal numbers for less than
 **
 ** @return 0 for false and 1 for true.
 **/
#define LT(A, B) GT(B, A)

#pragma CMOD definition
