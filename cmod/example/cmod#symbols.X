// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module cmod◼symbols
#pragma CMOD import io=C◼io
#pragma CMOD import stderr	=	C◼io◼err
#pragma CMOD import fprintf	=	C◼io◼fprintf
#pragma CMOD import str		=	C◼str
#pragma CMOD import bool	=	C◼bool
#pragma CMOD import mod		=	C◼mod

#pragma CMOD init static_init
#pragma CMOD atexit atexit


#pragma CMOD declaration


#define forty 40
#define take(X) mod◼demangle(#X)

enum oo { oo_a = 27, oo_b = oo_a + 1, };

struct ttt {
  int eins;
};

typedef int (*function0)(int a, int B);
typedef int (*function1)(int a, int B(void));
typedef int (*function2)(int a, int (*B)(double, int));
typedef int (*function3)(int a, int (*B)(double (*)(void)));
typedef int (*array0)[23];
typedef int (*const array1[17])[23];

#pragma CMOD definition

bool hei;

oo b;

ttt zero = { 0 };
ttt zer0;

int func(ttt a, int i) {
  return fprintf(stderr, "symbols: %s %d\n", take(a), a.eins);
}

int funk(ttt a) {
  return 2*a.eins;
}

void static_init(void) {
  b = 5;
  fprintf(stderr, "%s says hello\n", mod◼demangle(__func__));
}

void atexit(void) {
  fprintf(stderr, "%s says bye bye\n", mod◼demangle(__func__));
}

void module_at_quick_exit(void) {
  fprintf(stderr, "%s says bye\n", mod◼demangle(__func__));
}

#pragma CMOD declaration
/* Provide a macro "func" that provides a default argument to the
   function "func */
#define func_intern(A, B, ...) func(A, B)
#define func(...) func_intern(__VA_ARGS__, 0, 0)
