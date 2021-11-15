// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module NARG  = p11◼NARG
#pragma CMOD import DUPL  = p11◼DUPL
#pragma CMOD import EMPTY = p11◼EMPTY
#pragma CMOD import FOR   = p11◼FOR
#pragma CMOD import IF    = p11◼IF
#pragma CMOD import INT   = p11◼INT
#pragma CMOD import IS    = p11◼IS
#pragma CMOD import MAP   = p11◼MAP
#pragma CMOD import NARG1 = p11◼NARG1
#pragma CMOD import PASTE = p11◼PASTE
#pragma CMOD import PRED  = p11◼PRED
#pragma CMOD import SKIP  = p11◼SKIP

#pragma CMOD declaration

#define EMPTY1 ,
#define EXPB(...) IF(__VA_ARGS__)
#define EXPA(E, M, N) EXPB(E, M, 0, N)
#define NARG(...) EXPA(EMPTY(__VA_ARGS__), MODULE_PREFIX(6EMPTY), NARG1(__VA_ARGS__))

#define NARG◼COPY_A2B(I) B[I] = AB[I]
enum hola { one, two, three } ;
#define NARG◼ENUM_INIT(X) [X] = p11◼STRINGIFY(X)


#pragma CMOD definition

char const* names[] = { MAP◼SEQ(NARG◼ENUM_INIT, one, two, three) };

int test0(void) {
  int PASTE(A, B)[] = { DUPL(10, 0), SKIP(2, 1, 2, 3, 4, 5), SKIP(1, 6)};
  int B[7];
  FOR◼UNROLL(NARG◼COPY_A2B, 7);
  return B[3];
  return INT◼MUL(7, 5);
  return INT◼MUL(0, 5);
  return INT◼MUL(7, 0);
  return INT◼ADD(7, 5);
  return INT◼SUB(7, 5);
  return INT◼SUB(5, 7);

  return INT◼GE(5, 7);
  return INT◼LE(5, 7);
  return INT◼GE(5, 5);
  return INT◼LE(5, 5);

  return INT◼GT(5, 7);
  return INT◼LT(5, 7);
  return INT◼GT(5, 5);
  return INT◼LT(5, 5);

  return EMPTY();
  return EMPTY(a);

  return IS◼OR(1, 0);
  return IS◼OR(0, 0);
  return IS◼OR(1, 1);

  return IS◼EQ(2, 2);
  return IS◼EQ(20, 21);
  return IS◼NE(2, 2);
  return IS◼NE(20, 21);
  return IS◼NOT(IS◼EQ(2, 2));
  return IS◼NOT(IS◼EQ(20, 21));

  return PRED(47);
}
