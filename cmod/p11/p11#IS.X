// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module IS   = p11◼IS
#pragma CMOD import IF   = p11◼IF
#pragma CMOD import ID10 = p11◼ID10
#pragma CMOD import NARG1= p11◼NARG1
#pragma CMOD import PASTE= p11◼PASTE

#pragma CMOD mimic "p99_generated.h"

#pragma CMOD defreg CASE_\2EQ_\3=\(P00_IS_\([0-9][0-9]\)_EQ_\([0-9][0-9]\)\)
#pragma CMOD defreg CASE_\2EQ_\3=\(P00_IS_\([0-9]\)_EQ_\([0-9]\)\)

#pragma CMOD declaration

#define CASE_00EQ_0 ,
#define CASE_01EQ_1 ,
#define CASE_02EQ_2 ,
#define CASE_03EQ_3 ,
#define CASE_04EQ_4 ,
#define CASE_05EQ_5 ,
#define CASE_06EQ_6 ,
#define CASE_07EQ_7 ,
#define CASE_08EQ_8 ,
#define CASE_09EQ_9 ,

#define CASE_00EQ_00 ,
#define CASE_01EQ_01 ,
#define CASE_02EQ_02 ,
#define CASE_03EQ_03 ,
#define CASE_04EQ_04 ,
#define CASE_05EQ_05 ,
#define CASE_06EQ_06 ,
#define CASE_07EQ_07 ,
#define CASE_08EQ_08 ,
#define CASE_09EQ_09 ,

#define EQD(A, B) IF(B, A, 1, 0)
#define EQC(A, B) EQD(PASTE(A, Q_), B)
#define EQB(A, M, B) EQC(ID10(A, M), B)
#define EQA(A, B) EQB(A, MODULE_PREFIX(11CASE_), B)
/** @brief Test to (small) decimal numbers for equality
 **
 ** @return 0 for false and 1 for true.
 **/
#define EQ(A, B) EQA(A, B)

#define NOTA(N)  IF◼IF0(N, 1, 0)
/** @brief Test (small) decimal number for equality to @c 0
 **
 ** @return 0 for false and 1 for true.
 **/
#define NOT(N) NOTA(N)

#define BOOLA(N)  IF◼IF0(N, 0, 1)
/** @brief Test (small) decimal number for inequality to @c 0
 **
 ** @return 0 for false and 1 for true.
 **/
#define BOOL(N) BOOLA(N)

#define NE0(X) NOT(X)
/** @brief Test two (small) decimal numbers for inequality
 **
 ** @return 0 for false and 1 for true.
 **/
#define NE(A, B) NE0(EQ(A, B))

#define OR1(M, N) IF(N, M, 0, 1)
#define OR0(M, A, B) OR1(M, PASTE(BOOL(A),BOOL(B)))
/** @brief Logical "or" of two (small) decimal numbers
 **
 ** @return 0 for false and 1 for true.
 **/
#define OR(A, B) OR0(MODULE_PREFIX(9CASE_OR), A, B)
#define CASE_OR00 ,

#define XOR1(M, N) IF(N, M, 0, 1)
#define XOR0(M, A, B) XOR1(M, PASTE(BOOL(A),BOOL(B)))
/** @brief Logical "exclusive or" of two (small) decimal numbers
 **
 ** @return 0 for false and 1 for true.
 **/
#define XOR(A, B) XOR0(MODULE_PREFIX(10CASE_XOR), A, B)
#define CASE_XOR10 ,
#define CASE_XOR01 ,

#define AND1(M, N) IF(N, M, 1, 0)
#define AND0(M, A, B) AND1(M, PASTE(BOOL(A),BOOL(B)))
/** @brief Logical "and" of two (small) decimal numbers
 **
 ** @return 0 for false and 1 for true.
 **/
#define AND(A, B) AND0(MODULE_PREFIX(10CASE_AND), A, B)
#define CASE_AND11 ,

#define IMPL1(M, N) IF(N, M, 0, 1)
#define IMPL0(M, A, B) IMPL1(M, PASTE(BOOL(A),BOOL(B)))
/** @brief Logical "implication" of two (small) decimal numbers
 **
 ** @return 0 for false and 1 for true.
 **/
#define IMPL(A, B) IMPL0(MODULE_PREFIX(11CASE_IMPL), A, B)
#define CASE_IMPL10 ,

#pragma CMOD definition

int test0(void) {
  return 0;
}
