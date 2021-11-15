#include <stdio.h>

/**
 ** @file
 **
 ** This plays with gcc features to define a weird macro that emulates
 ** anonymous functions that can be used as closures. Don't use that
 ** seriously, this is only meant to prove that this is syntactically
 ** not a big deal, and that the ideas necessary for it can be found
 ** in modern compilers.
 **
 **/

/**
 ** @def ANONYMOUS(RET)
 ** @brief Use this to define an anonymous function with return type @a RET.
 **
 ** The @c ... argument list is the parameter list of the
 ** function. This the expects the code of the function in <code>({
 ** })</code> parenthesis. A simple example would be
 **
 ** @code
 ** // Function header
 ** ANONYMOUS(int) (double a, unsigned b)
 ** // Function body
 ** ({
 **    return printf("we found %g for %u, average %g\n", a, b, a/b);
 ** })
 ** // Function arguments
 ** (x, 23);
 ** @endcode
 **
 ** Of course you would usually put such things inside a macro. See
 ** MAX() for a more complicated example.
 **/
#ifdef __clang__
# define ANONYMOUS(RET) (^ RET ANON_PART2
# define ANON_PART2(...) (__VA_ARGS__) ANON_PART3
# define ANON_PART3(...) __VA_ARGS__)
#else
# define ANONYMOUS(RET) ({ RET __anon_func ANON_PART2
# define ANON_PART2(...) (__VA_ARGS__) ANON_PART3
# define ANON_PART3(...) __VA_ARGS__ __anon_func; })
#endif

#define MAXU(A, B)                              \
ANONYMOUS(uintmax_t) (uintmax_t a, uintmax_t b) \
({                                              \
    if (a < b) return b;                        \
    else return a;                              \
})                                              \
((A), (B))

#define MAX(A, B)                               \
/* function header */                           \
  /* return type */                             \
ANONYMOUS(__typeof__(1 ? (A) : (B)))            \
 /*and then argument list */                    \
(__typeof__(A) a, __typeof__(B) b)              \
/* function body */                             \
({                                              \
  if (a < b) return b;                          \
  else return a;                                \
 })                                             \
/* function call */                             \
((A), (B))

/**
 ** Test to see if that even works when such functions are nested.
 **/

typedef void df(unsigned);

df* Df[5] = { 0 };

void g(unsigned level, unsigned depth) {
  Df[depth%5] =
    ANONYMOUS(void) (register unsigned a)
    ({
      printf("from level %u, depth %u found in position %u\n",
             level, depth,
             MAX(2*a, depth)
             );
      return;
    });
  if (level)
    g(level-1, depth+1);
  else
    for (unsigned i = 0; i < 5; ++i)
      if (Df[i]) Df[i](i);
}


int main(int argc, char* argv[]) {
  g(argc, 0);
}
