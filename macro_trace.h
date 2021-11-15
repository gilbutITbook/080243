#ifndef MACRO_TRACE_H
#define MACRO_TRACE_H 1
#include <stdio.h>
#include <stdbool.h>

/**
 ** @file
 **
 ** @brief A sequence of macros for tracing execution
 **/

/**
 ** @brief A simple version of the macro that just does
 ** a @c fprintf or nothing
 **/
#if NDEBUG
# define TRACE_PRINT0(F, X) do { /* nothing */ } while (false)
#else
# define TRACE_PRINT0(F, X) fprintf(stderr, F, X)
#endif

/**
 ** @brief A simple version of the macro that ensures that the @c
 ** fprintf format is a string literal
 **
 ** As an extra, it also adds a newline to the printout, so
 ** the user doesn't have to specify it each time.
 **/
#if NDEBUG
# define TRACE_PRINT1(F, X) do { /* nothing */ } while (false)
#else
# define TRACE_PRINT1(F, X) fprintf(stderr, "" F "\n", X)
#endif

/**
 ** @brief A macro that resolves to @c 0 or @c 1 according to @c
 ** NDEBUG being set
 **/
#ifdef NDEBUG
# define TRACE_ON 0
#else
# define TRACE_ON 1
#endif

/**
 ** @brief A simple version of the macro that ensures that the @c
 ** fprintf call is always evaluated
 **/
#define TRACE_PRINT2(F, X)                                      \
do { if (TRACE_ON) fprintf(stderr, "" F "\n", X); } while (false)

/**
 ** @brief Traces a value without having to specify a format
 **/
#define TRACE_VALUE0(HEAD, X) TRACE_PRINT2(HEAD " %Lg", (X)+0.0L)

/**
 ** @brief Traces a pointer without having to specify a format
 **
 ** @warning Uses a cast of @a X to @c void*
 **/
#define TRACE_PTR0(HEAD, X)  TRACE_PRINT2(HEAD " %p", (void*)(X))

/**
 ** @brief Traces a pointer without specifying a format
 **/
#define TRACE_PTR1(HEAD, X)                     \
TRACE_PRINT2(HEAD " %p", ((void*){ 0 } = (X)))

/**
 ** @brief Adds the current line number to the trace
 **/
#define TRACE_PRINT3(F, X)                              \
do {                                                    \
  if (TRACE_ON)                                         \
    fprintf(stderr, "%lu: " F "\n", __LINE__+0UL, X);   \
} while (false)

/**
 ** @brief Adds the name of the current function to the trace
 **/
#define TRACE_PRINT4(F, X)                      \
do {                                            \
  if (TRACE_ON)                                 \
   fprintf(stderr, "%s:%lu: " F "\n",           \
           __func__, __LINE__+0UL, X);          \
} while (false)

#define STRINGIFY(X) #X
#define STRGY(X) STRINGIFY(X)
/**
 ** @brief Adds a textual version of the expression that is evaluated
 **/
#define TRACE_PRINT5(F, X)                                      \
do {                                                            \
 if (TRACE_ON)                                                  \
  fprintf(stderr, "%s:" STRGY(__LINE__) ":(" #X "): " F "\n",   \
          __func__, X);                                         \
} while (false)

/**
 ** @brief Allows multiple arguments to be printed in the
 ** same trace
 **/
#define TRACE_PRINT6(F, ...)                            \
do {                                                    \
  if (TRACE_ON)                                         \
    fprintf(stderr, "%s:" STRGY(__LINE__) ": " F "\n",  \
            __func__, __VA_ARGS__);                     \
} while (false)

/**
 ** @brief Only traces with a text message; no values printed
 **/
#define TRACE_PRINT7(...)                                     \
do {                                                          \
 if (TRACE_ON)                                                \
  fprintf(stderr, "%s:" STRGY(__LINE__) ": " __VA_ARGS__ "\n",\
          __func__);                                          \
} while (false)

/**
 ** @brief Extracts the first argument from a list of arguments
 **/
#define TRACE_FIRST(...) TRACE_FIRST0(__VA_ARGS__, 0)
#define TRACE_FIRST0(_0, ...) _0

/**
 ** @brief Removes the first argument from a list of arguments
 **
 ** @remark This is only suitable in our context,
 ** since this adds an artificial last argument.
 **/
#define TRACE_LAST(...) TRACE_LAST0(__VA_ARGS__, 0)
#define TRACE_LAST0(_0, ...) __VA_ARGS__

/**
 ** @brief Traces with or without values
 **
 ** This implementation has the particularity of adding a format
 ** @c "%.0d" to skip the last element of the list, which was
 ** artificially added.
 **/
#define TRACE_PRINT8(...)                       \
TRACE_PRINT6(TRACE_FIRST(__VA_ARGS__) "%.0d",   \
             TRACE_LAST(__VA_ARGS__))

/**
 ** @brief Traces by first giving a textual representation of the
 ** arguments
 **/
#define TRACE_PRINT9(F, ...)                            \
TRACE_PRINT6("(" #__VA_ARGS__ ") " F, __VA_ARGS__)

inline
char const* trace_skip(char const expr[static 1]){
  for (char const* p = expr+1; *p; ++p) {
    // at the end of head we expect the 3 chars ``", ''
    if (p[0] == '"') return p+3;
    // watch out for escaped " characters
    if (p[0] == '\\' && p[1] == '"') ++p;
  }
  return 0;
}

/**
 ** @brief A function to print a list of values
 **
 ** @remark Only call this through the macro ::TRACE_VALUES,
 ** which will provide the necessary contextual information.
 **/
inline
void trace_values(FILE* s,
                  char const func[static 1],
                  char const line[static 1],
                  char const expr[static 1],
                  char const head[static 1],
                  size_t len, long double const arr[len]) {
  fprintf(s, "%s:%s:(%s) %s %Lg", func, line,
          trace_skip(expr), head, arr[0]);
  for (size_t i = 1; i < len-1; ++i)
    fprintf(s, ", %Lg", arr[i]);
  fputc('\n', s);
}

/**
 ** @brief Returns the number of arguments in the ... list
 **
 ** This version works for lists with up to 31 elements.
 **
 ** @remark An empty argument list is taken as one (empty) argument.
 **/
#define ALEN(...) ALEN0(__VA_ARGS__,                    \
  0x1E, 0x1F, 0x1D, 0x1C, 0x1B, 0x1A, 0x19, 0x18,       \
  0x17, 0x16, 0x15, 0x14, 0x13, 0x12, 0x11, 0x10,       \
  0x0E, 0x0F, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,       \
  0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00)

#define ALEN0(_00, _01, _02, _03, _04, _05, _06, _07,           \
              _08, _09, _0A, _0B, _0C, _0D, _0F, _0E,           \
              _10, _11, _12, _13, _14, _15, _16, _17,           \
              _18, _19, _1A, _1B, _1C, _1D, _1F, _1E, ...) _1E

/**
 ** @brief Traces a list of arguments without having to specify
 ** the type of each argument
 **
 ** @remark This constructs a temporary array with the arguments
 ** all converted to @c long double. Thereby implicit conversion
 ** to that type is always guaranteed.
 **/
#define TRACE_VALUES(...)                       \
TRACE_VALUES0(ALEN(__VA_ARGS__),                \
              #__VA_ARGS__,                     \
              __VA_ARGS__,                      \
              0                                 \
              )

#define TRACE_VALUES0(NARGS, EXPR, HEAD, ...)                   \
do {                                                            \
  if (TRACE_ON) {                                               \
    if (NARGS > 1)                                              \
      trace_values(stderr, __func__, STRGY(__LINE__),           \
                   "" EXPR "", "" HEAD "", NARGS,               \
                   (long double const[NARGS]){ __VA_ARGS__ });  \
    else                                                        \
      fprintf(stderr, "%s:" STRGY(__LINE__) ": %s\n",           \
              __func__, HEAD);                                  \
  }                                                             \
 } while (false)

/**
 ** @brief Returns a format that is suitable for @c fprintf
 **
 ** @return The argument @a F must be a string literal,
 ** so the return value will be.
 **
 **/
#define TRACE_FORMAT(F, X)                      \
_Generic((X)+0LL,                               \
         unsigned long long: "" F " %llu\n",    \
         long long: "" F " %lld\n",             \
         float: "" F " %.8f\n",                 \
         double: "" F " %.12f\n",               \
         long double: "" F " %.20Lf\n",         \
         default: "" F " %p\n")

/**
 ** @brief Returns a value that forcibly can be interpreted as
 ** pointer value
 **
 ** That is, any pointer will be returned as such, but other
 ** arithmetic values will result in a @c 0.
 **/
#define TRACE_POINTER(X)                        \
_Generic((X)+0LL,                               \
         unsigned long long: 0,                 \
         long long: 0,                          \
         float: 0,                              \
         double: 0,                             \
         long double: 0,                        \
         default: (X))

/**
 ** @brief Returns a value that is promoted either to a wide
 ** integer, to a floating point, or to a @c void* if @a X is a
 ** pointer
 **/
#define TRACE_CONVERT(X)                                \
_Generic((X)+0LL,                                       \
         unsigned long long: (X)+0LL,                   \
         long long: (X)+0LL,                            \
         float: (X)+0LL,                                \
         double: (X)+0LL,                               \
         long double: (X)+0LL,                          \
         default: ((void*){ 0 } = TRACE_POINTER(X)))

/**
 ** @brief Traces a value without having to specify a format
 **
 ** This variant works correctly with pointers.
 **
 ** The formats are tunable by changing the specifiers in
 ** ::TRACE_FORMAT.
 **/
#define TRACE_VALUE1(F, X)                                      \
  do {                                                          \
    if (TRACE_ON)                                               \
      fprintf(stderr,                                           \
              TRACE_FORMAT("%s:" STRGY(__LINE__) ": " F, X),    \
              __func__, TRACE_CONVERT(X));                      \
  } while (false)

#endif
