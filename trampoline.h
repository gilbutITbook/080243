#ifndef TRAMPOLINE_H
#define TRAMPOLINE_H 1
#include <stddef.h>

typedef void trampoline_type(void);

/**
 ** @brief A little function needed to pretend that the address of an
 ** object has leaked that thus the initialization of that object may
 ** not be optimized out.
 **/
inline
void* trampoline_sink(void* d) {
  __asm__ ("# do nothing" : : "g" (d) );
  return d;
}

/**
 ** @brief The maximum number of trampolines defined for this
 ** particular TU.
 **
 ** If this is not big enough compile with something like
 ** "-DTRAMPOLINE_MAX_PER_TU=XXX"
 **/
#if TRAMPOLINE_MAX_PER_TU <= 0
# define TRAMPOLINE_MAX_PER_TU 20
#endif

/**
 ** @brief Initialize a TU
 **
 ** This code is executed by gcc magic at the beginning of the run for
 ** each TU. Don't use it directly
 **/
__attribute__((__deprecated__("Function should not be called manually.")))
void trampoline_reserve(size_t n);

#if __GNUC__
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#endif

/**
 ** @brief Initialize this TU
 **
 ** This code is executed by gcc magic at the beginning of the run. Don't use it directly
 **/
__attribute__((__constructor__(1001), __deprecated__("Function should not be called manually.")))
static
void trampoline_init(void){
  trampoline_reserve(TRAMPOLINE_MAX_PER_TU);
}

#if __GNUC__
# pragma GCC diagnostic pop
#endif

/**
 ** @brief the usual suspect to apply a macro successively to a whole
 ** list of arguments.
 **
 ** If the list has length N, noted in hex, the macro 'BASE ## N' is
 ** called with arguments @c (NAME, ARG1, ARG3, ... , ARGN, extra
 ** args). Make sure that it only uses the ones up to @c ARGN and
 ** ignores the extra arguments.
 **/
#define TRAMPOLINE_NARG(BASE, NAME, ...)                                \
  TRAMPOLINE_NARGS(BASE, NAME, __VA_ARGS__,                             \
                  F, E, D, C, B, A, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, )

#define TRAMPOLINE_NARGS(BASE, NAME, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _A, _B, _C, _D, _E, _F, ...) \
TRAMPOLINE_NARG_ ## _F(BASE, NAME, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _A, _B, _C, _D, _E, _F, __VA_ARGS__)

#define TRAMPOLINE_NARG_1(BASE, NAME, X, ...) BASE(NAME, X)
#define TRAMPOLINE_NARG_2(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_1(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_3(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_2(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_4(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_3(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_5(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_4(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_6(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_5(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_7(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_6(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_8(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_7(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_9(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_8(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_A(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_9(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_B(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_A(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_C(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_B(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_D(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_C(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_E(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_D(BASE, NAME, __VA_ARGS__)
#define TRAMPOLINE_NARG_F(BASE, NAME, X, ...) BASE(NAME, X) TRAMPOLINE_NARG_E(BASE, NAME, __VA_ARGS__)


#define TRAMPOLINE_TYPEOF(NAME, X) __typeof__(trampoline_ ## NAME ## _struct->X)*const restrict X;

extern void const* trampoline_context(void*);                           \

/**
 ** @brief Define a trampoline.
 **
 ** This should be of the form
 ** <code>
 ** TRAMPOLINE_DEFINE(int, fun, void) ({
 **    ... your code goes here ...
 ** })
 ** </code>
 **
 ** Here, @c int is the return type of the function, @c fun is its
 ** name and @c void is the parameter list. Please observe the use of
 ** @c ({ }) parenthesis.
 **
 ** By using ::TRAMP the body of the function can access the variables
 ** in the context that have been tagged in the declaration by means
 ** of ::TRAMPOLINE_DECLARE
 **
 ** A function defined like this is not usable by itself, it will
 ** segfault during its initialization phase. By using
 ** ::TRAMPOLINE_POINTER the function can be contextualized and thus
 ** activated, and subsequently used through that pointer.
 **/
#define TRAMPOLINE_DEFINE(RET, FUN, ...)                                \
size_t trampoline_ ## FUN ## _index(void) {                             \
extern size_t trampoline_index(_Atomic(size_t)* loc,                    \
                                 trampoline_type* f,                    \
                                 size_t size);                          \
  static _Atomic(size_t) _idx = 0;                                      \
  return                                                                \
    trampoline_index(&_idx,                                             \
                     (trampoline_type*) (FUN),                          \
                     sizeof(trampoline_ ## FUN ## _ctxt));              \
}                                                                       \
RET FUN (__VA_ARGS__) {                                                 \
 trampoline_ ## FUN ## _ctxt const trampoline_ctxt                      \
   = *(trampoline_ ## FUN ## _ctxt*)trampoline_context(0);              \
TRAMP_PART2

#define TRAMP_PART2(...) __VA_ARGS__ }

/**
 ** @brief Declare a trampoline.
 **
 ** This should be of the form
 ** <code>
 ** TRAMPOLINE_DECLARE({
 **     int val;
 **     double vol;
 **   })
 ** (int, fun, val, vol)
 ** (void);
 ** </code>
 **
 ** That is it receives three parenthesized list. The first is of the
 ** form @c ({ }) and contains the types and names of the environment
 ** of the trampoline that are to be propagated. The names must match
 ** exactly those of the variables.
 **
 ** The second list is of the form @c (RET, FUN, ...) where @c RET and
 ** @c FUN are the return type and name of the function,
 ** respectively. The @c ... list is a list of the names of the
 ** propagated variables as they were given previously
 **
 ** The last @c () list is just the usual parameter list of the
 ** function.
 **
 ** By using ::TRAMP the body of the function can access the variables
 ** in the context that have been tagged in the declaration by means
 ** of ::TRAMPOLINE_DECLARE
 **
 ** A function declared like that is not usable by itself, it will
 ** segfault during its initialization phase. By using
 ** ::TRAMPOLINE_POINTER the function can be contextualized and thus
 ** activated, and subsequently used through that pointer.
 **/
#define TRAMPOLINE_DECLARE extern struct TRAMP_DPART1

#define TRAMP_DPART1(...) __VA_ARGS__ TRAMP_DPART2

#define TRAMP_DPART2(RET, FUN, ...)                             \
* trampoline_ ## FUN ## _struct;                                \
typedef struct {                                                \
  /* must be first element */                                   \
  size_t _0;                                                    \
  TRAMPOLINE_NARG(TRAMPOLINE_TYPEOF, FUN, __VA_ARGS__);         \
} trampoline_ ## FUN ## _ctxt;                                  \
extern size_t trampoline_ ## FUN ## _index(void);               \
extern RET FUN

#define TRAMPOLINE_INIT(FUN, X) .X = &X,


/**
 ** @brief Contextualize a trampoline.
 **
 ** Instantiate a dynamic version of function @a FUN that has access
 ** to the context. The variables that this function wants to access
 ** through ::TRAM must be listed in the @c ... list. Only variables
 ** that have previously been declared in ::TRAMPOLINE_DECLARE can be
 ** used in the list.
 **
 ** Variables that are not in the list cannot be accessed. Trying to
 ** do so will result in a segfault.
 **/
#define TRAMPOLINE_POINTER(FUN, ...)                                    \
((__typeof__(*(FUN))*)                                                  \
 /* the sink ensures that the compound literal is really created */     \
trampoline_sink                                                         \
((trampoline_ ## FUN ## _ctxt[1])                                       \
{{                                                                      \
/* The first element must always be the index. */                       \
trampoline_ ## FUN ## _index(),                                         \
  TRAMPOLINE_NARG(TRAMPOLINE_INIT, , __VA_ARGS__)                       \
  }}                                                                    \
 ))

/**
 ** @brief Access the propagated variable @a F.
 **
 ** This is only valid inside a function that has been defined with
 ** ::TRAMPOLINE_DEFINE.
 **/
#define TRAM(F) (*(trampoline_ctxt.F))


#endif
