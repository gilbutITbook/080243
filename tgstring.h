#ifndef __STDC_TGSTRING__
# define __STDC_TGSTRING__ 201610L

/**
 ** @file
 ** @brief Type generic string interfaces
 **
 ** @copyright 2016 Jens Gustedt
 **
 ** @remark This code is distributed under a Creative Commons
 ** Attribution 4.0 International License.
 **
 ** @warning This code is provided as is, use at your own risk.
 **
 ** This header file provides type generic replacements for the C
 ** library string functions that are "const-aware" and that chose
 ** the right alternative between narrow and wide string
 ** functions.
 **
 ** Generally this interfaces (and replaces) all the C standard
 ** functions with names starting with `str`. These are
 **
 ** - `strcat`
 ** - `strchr`
 ** - `strcmp`
 ** - `strcoll`
 ** - `strcpy`
 ** - `strcspn`
 ** - `strlen`
 ** - `strncat`
 ** - `strncmp`
 ** - `strncpy`
 ** - `strntok`
 ** - `strpbrk`
 ** - `strrchr`
 ** - `strspn`
 ** - `strstr`
 ** - `strtod`
 ** - `strtof`
 ** - `strtoimax`
 ** - `strtol`
 ** - `strtold`
 ** - `strtoll`
 ** - `strtoul`
 ** - `strtoull`
 ** - `strtoumax`
 ** - `strxfrm`
 **
 ** The interfaces that are prefixed with `mem` are more difficult
 ** to match, since the types of parameters of the existing `mem`
 ** and `wmem` functions are not consistent: the `mem` functions
 ** work with `void*`, thus on @b bytes, whereas the `wmem`
 ** functions work with `wchar_t`, thus on wide characters. The
 ** first can receive any pointer argument whereas the second can
 ** only receive wide character arrays. Generally the semantics of
 ** a type generic interface that mixes bytes and wide characters
 ** would not be clear since also the interpretation of a length
 ** parameter would change.
 **
 ** Out of these functions only the functions `memchr` and
 ** `wmemchr` have the const-awareness problem, so we provide
 ** these. Because for `wmemchr` the parameter is fixed to be
 ** derived from `wchar_t`, this one is not very difficult.
 **
 ** `memchr` is a bit tricky, because the original receives a
 ** `void const*` that might come from any data pointer. We have
 ** to do some black magic to decide if the target type is
 ** `const`-qualified.
 **
 ** This uses a lot of small stub functions that usually will be
 ** inlined. If you are a C library provider that wants to
 ** integrate this, see the discussion of ::_TG_INLINE.
 **/

# if __STDC_VERSION__ < 201112L
#  error "tgstring.h needs a C11 conforming compiler"
# endif

# include <inttypes.h>
# include <stdlib.h>
# include <stdio.h>
# include <string.h>
# include <wchar.h>

/* We define a bunch of inline functions that have the only
   purpose of providing conversions to the their arguments and
   then to pass them on to the corresponding standard function. We
   use the same names as the standard function and append "_const"
   to them. This use is covered by the standard since all of the
   "str" and "wcs" names are reserved, anyhow. */

/**
 ** @def _TG_INLINE
 **
 ** We would like to have all the stubs as `inline` functions. The
 ** problem is, that if we do so, and the compiler decides not to
 ** inline the function (because of command line arguments,
 ** whatever), the symbol would be missing and the program would
 ** not link.
 **
 ** The alternatives would be
 **
 ** - `static inline`, but then the functions could not be
 **   included in other `inline` functions that are themselves not
 **   `static`.
 **
 ** - `inline` and provide all stubs in the C library.
 **
 ** - compiler magic similar to the gcc attribute as shown below
 **
 ** - `register`, if this would be included in the future
 **   standard. This would be an ideal candidate.
 **
 ** If you have such specific magic, I'd be happy to integrate
 ** your two lines, here.  If you don't, you'd have to compile
 ** this file with something equivalent to
 ** @code
 ** cc -D_TG_INLINE= -x c -o tgstring.o tgstring.h
 ** @endcode
 ** to produce an object file `tgstring.o` that you add to your C
 ** library.
 **/
#ifndef _TG_INLINE
# if __STDC_REGISTER_IN_FILE_SCOPE__
#  define _TG_INLINE register
/* Otherwise, have your platform specific definition, here*/
# elif __GNUC__
#  define _TG_INLINE __attribute__((always_inline)) inline
/* Fall back to inline, if none of that worked */
# else
#  define _TG_INLINE inline
# endif
#endif

// void *memchr(void const *s, int c, size_t n);

_TG_INLINE
void const*memchr_const(void const* _s,
                        int _c, size_t _n) {
  return memchr(_s, _c, _n);
}

# undef memchr
/**
 ** Because `wchar_t` is only a `typedef`, we can't map to the
 ** wide character version. Since the original C library interface
 ** has a `void const*` parameter, all types must be valid.
 **
 ** This uses black magic to decide if the pointer target of the
 ** first argument is `const`-qualified. Namely a conditional
 ** expression is used that aggregates type information from @a _0
 ** and a `void*`. The resulting type then is a pointer to `void`
 ** with the collection of the qualifications of the two.  The
 ** alternative part of the conditional expression must not be
 ** `(void*)0`, because that would be a null pointer constant and
 ** so the resulting type would be the original type of `_0`.
 **/
# define memchr(_0, _1, _2)                     \
_Generic(1 ? (_0) : (void*)1,                   \
         void*: memchr,                         \
         void const*: memchr_const)             \
((_0), (_1), (_2))


/**
 ** @brief An internal macro to select a const conserving string
 ** function.
 **
 ** This macro simply selects the function that corresponds to the
 ** type of argument @a X. It is not meant to be used directly but
 ** to be integrated in specific macros that overload C library
 ** functions.
 **
 ** The argument @a X must correspond to an array or pointer,
 ** otherwise an error is triggered in the controlling expression.
 **
 ** If any of the 4 cases makes no sense for the type generic
 ** interface in question, that case can be switched off by
 ** passing a 0 instead of a function. A use of that case in user
 ** code then results in a compile time error.
 **
 ** @see strchr on how to integrate this into a type generic user
 ** interface
 **/
# define _TG_TO_CONST(SN, SC, WN, WC, X, ...)   \
_Generic(&(X[0]),                               \
         char*:          SN,                    \
         char const*:    SC,                    \
         wchar_t*:       WN,                    \
         wchar_t const*: WC                     \
         )((X), __VA_ARGS__)

_TG_INLINE
wchar_t const*wmemchr_const(wchar_t const _s[static 1],
                            wchar_t _c, size_t _n) {
  return wmemchr(_s, _c, _n);
}


# undef wmemchr
/**
 ** This function only makes sense if it receives a `wchar_t`
 ** argument.
 **/
# define wmemchr(...)                                   \
  _TG_TO_CONST(0,              /* char*: error   */     \
               0,              /* const char*:error */  \
               wmemchr,        /* wchar_t*       */     \
               wmemchr_const,  /* const wchar_t* */     \
               __VA_ARGS__)

// char *strchr(char const *s, int c);

_TG_INLINE
char const*strchr_const(char const *_s, int _c) {
  return strchr(_s, _c);
}

_TG_INLINE
wchar_t const*wcschr_const(wchar_t const *_s, wchar_t _c) {
  return wcschr(_s, _c);
}

# undef strchr
# define strchr(...)                                            \
  _TG_TO_CONST(strchr, strchr_const, wcschr, wcschr_const,      \
               __VA_ARGS__)

// char *strpbrk(char const *_s, char const *_t);

_TG_INLINE
char const*strpbrk_const(char const *_s, char const *_t) {
  return strpbrk(_s, _t);
}

_TG_INLINE
wchar_t const*wcspbrk_const(wchar_t const *_s, wchar_t const *_t) {
  return wcspbrk(_s, _t);
}

# undef strpbrk
# define strpbrk(...)                                           \
  _TG_TO_CONST(strpbrk, strpbrk_const, wcspbrk, wcspbrk_const,  \
               __VA_ARGS__)

// char *strrchr(char const *s, int c);

_TG_INLINE
char const* strrchr_const(char const *_s, int _c) {
  return strrchr(_s, _c);
}

_TG_INLINE
wchar_t const* wcsrchr_const(wchar_t const *_s, wchar_t _c) {
  return wcsrchr(_s, _c);
}

# undef strrchr
# define strrchr(...)                                           \
  _TG_TO_CONST(strrchr, strrchr_const, wcsrchr, wcsrchr_const,  \
               __VA_ARGS__)


// char *strstr(char const *_s, const char *_t);

_TG_INLINE
char const*strstr_const(char const *_s, char const *_t) {
  return strstr(_s, _t);
}

_TG_INLINE
wchar_t const*wcsstr_const(wchar_t const *_s, wchar_t const *_t) {
  return wcsstr(_s, _t);
}

# undef strstr
# define strstr(...)                                            \
  _TG_TO_CONST(strstr,         /* char*               */        \
               strstr_const,   /* const char*         */        \
               wcsstr,         /* wchar_t*            */        \
               wcsstr_const,   /* const wchar_t*      */        \
               __VA_ARGS__)

/**
 ** @brief An internal macro to select a string function according
 ** to the base type `char` or `wchar_t`.
 **
 ** This macro simply adds the "wcs" prefix to the name of the
 ** function, if a `wchar_t` function is to be called. Traditional
 ** `char` strings are mapped to `char`.
 **
 ** There is no default case, because these functions need a
 ** string and not some arbitrary bytes.
 **
 ** The argument @a X must correspond to an array or pointer,
 ** otherwise an error is triggered in the controlling expression.
 **
 ** No precaution is made concerning `const`. If a `const`
 ** qualified pointer type is passed in and the function that is
 ** selected does not accept such an argument, an error is
 ** diagnosed as if the corresponding function would have been
 ** used directly.
 **
 ** @see strcpy on how to integrate this into a type generic user
 ** interface
 **/
# define _TG_STR(NAME, X, ...)                  \
_Generic(&(X[0]),                               \
         char*: str ## NAME,                    \
         char const*: str ## NAME,              \
         wchar_t*: wcs ## NAME,                 \
         wchar_t const*: wcs ## NAME            \
         )((X), __VA_ARGS__)

# undef strcpy
# define strcpy(...) _TG_STR(cpy, __VA_ARGS__)
# undef strncpy
# define strncpy(...) _TG_STR(ncpy, __VA_ARGS__)
# undef strcat
# define strcat(...) _TG_STR(cat, __VA_ARGS__)
# undef strncat
# define strncat(...) _TG_STR(ncat, __VA_ARGS__)
# undef strcmp
# define strcmp(...) _TG_STR(cmp, __VA_ARGS__)
# undef strcoll
# define strcoll(...) _TG_STR(coll, __VA_ARGS__)
# undef strncmp
# define strncmp(...) _TG_STR(ncmp, __VA_ARGS__)
# undef strxfrm
# define strxfrm(...) _TG_STR(xfrm, __VA_ARGS__)
# undef strcspn
# define strcspn(...) _TG_STR(cspn, __VA_ARGS__)
# undef strspn
# define strspn(...) _TG_STR(spn, __VA_ARGS__)
# undef strntok
# define strntok(...) _TG_STR(ntok, __VA_ARGS__)
# undef strlen
# define strlen(...) _TG_STR(len, __VA_ARGS__)


/**
 ** @brief An internal Xmacro to generate const conserving string
 ** to floating point conversion function.
 **
 ** In the case of the string to number functions the original C
 ** library functions cannot be used directly, because their
 ** second argument is an unqualified pointer to pointer.
 **
 ** @param T is the target type of the conversion
 ** @param C is the base type of the string, so `char` or `wchar_t`
 ** @param NAME is the base name for the function
 **/
#define _TG_STR2F_FUNC_(T, C, NAME)                             \
_TG_INLINE                                                      \
T _TG_ ## NAME ## _c(C const* _p, C const** _e) {               \
  return NAME(_p, (C**)_e);                                     \
}                                                               \
_TG_INLINE                                                      \
T _TG_ ## NAME ## _nc(C* _p, C** _e) {                          \
  return NAME(_p, _e);                                          \
}                                                               \
typedef T _TG_ ## NAME ## _c_ftype(C const*, C const**);        \
typedef T _TG_ ## NAME ## _nc_ftype(C*, C**)

/**
 ** @brief An internal Xmacro to generate const conserving string
 ** to floating point conversion function.
 **
 ** This macro just assembles _TG_STR2F_FUNC_() for the two cases
 ** of @a C being `char` or `wchar_t`.
 **
 ** @param T is the target type of the conversion
 ** @param NAME is the base name for the function
 **/
#define _TG_STR2F_FUNC(T, NAME)                 \
  _TG_STR2F_FUNC_(T, char, str ## NAME);        \
  _TG_STR2F_FUNC_(T, wchar_t, wcs ## NAME)


/* generate the three groups of floating point conversion functions */
_TG_STR2F_FUNC(float, tof);
_TG_STR2F_FUNC(double, tod);
_TG_STR2F_FUNC(long double, told);



/**
 ** @brief An internal Xmacro to generate const conserving string
 ** to integer conversion function.
 **/
#define _TG_STR2I_FUNC_(T, C, NAME)                             \
_TG_INLINE                                                      \
T _TG_ ## NAME ## _c(C const* _p, C const** _e, int _b) {       \
  return NAME(_p, (C**)_e, _b);                                 \
}                                                               \
_TG_INLINE                                                      \
T _TG_ ## NAME ## _nc(C* _p, C** _e, int _b) {                  \
  return NAME(_p, _e, _b);                                      \
}                                                               \
typedef T _TG_ ## NAME ## _c_ftype(C const*, C const**, int);   \
typedef T _TG_ ## NAME ## _nc_ftype(C*, C**, int)


/**
 ** @brief An internal Xmacro to generate const conserving string
 ** to integer conversion function.
 **
 ** This macro just assembles _TG_STR2I_FUNC_() for the two case
 ** of `being` `char` or `wchar_t`.
 **
 ** @param T is the target type of the conversion
 ** @param NAME is the base name for the function
 **/
#define _TG_STR2I_FUNC(T, NAME)                 \
  _TG_STR2I_FUNC_(T, char, str ## NAME);        \
  _TG_STR2I_FUNC_(T, wchar_t, wcs ## NAME)


/* generate the six groups of integer conversion functions */
_TG_STR2I_FUNC(long, tol);
_TG_STR2I_FUNC(long long, toll);
_TG_STR2I_FUNC(unsigned long, toul);
_TG_STR2I_FUNC(unsigned long long, toull);
_TG_STR2I_FUNC(intmax_t, toimax);
_TG_STR2I_FUNC(uintmax_t, toumax);

/**
 ** @brief An internal macro to select a const conserving string
 ** to integer conversion function.
 **
 ** This macro simply selects the function that corresponds to
 ** the type of argument @a X. It is not meant to be used
 ** directly but to be integrated in specific macros that
 ** overload C library functions.
 **
 ** The argument @a X must correspond to an array or pointer,
 ** otherwise an error is triggered in the controlling
 ** expression.
 **
 ** There is no default case, because these functions need a
 ** string and not some arbitrary bytes.
 **
 ** @see strtol on how to integrate this into a type generic user
 ** interface
 **/
# define _TG_STR_FUNC3(NAME, X, P, B, ...)              \
_Generic(&((*P)[0]),                                    \
         char*:          _TG_str ## NAME ## _nc,        \
         char const*:    _TG_str ## NAME ## _c,         \
         wchar_t*:       _TG_wcs ## NAME ## _nc,        \
         wchar_t const*: _TG_wcs ## NAME ## _c          \
         )((X), (P), (B))

/**
 ** @brief An internal macro to select a const conserving string
 ** to floating point conversion function.
 **
 ** @see _TG_STR_FUNC3 for a complete description of the strategy
 **/
# define _TG_STR_FUNC2(NAME, X, P, ...)                 \
_Generic(&((*P)[0]),                                    \
         char*:          _TG_str ## NAME ## _nc,        \
         char const*:    _TG_str ## NAME ## _c,         \
         wchar_t*:       _TG_wcs ## NAME ## _nc,        \
         wchar_t const*: _TG_wcs ## NAME ## _c          \
         )((X), (P))

# undef strtod
# define strtod(...) _TG_STR_FUNC2(tod, __VA_ARGS__, 0, 0, 0)
# undef strtof
# define strtof(...) _TG_STR_FUNC2(tof, __VA_ARGS__, 0, 0, 0)
# undef strtold
# define strtold(...) _TG_STR_FUNC2(told, __VA_ARGS__, 0, 0, 0)
# undef strtol
# define strtol(...) _TG_STR_FUNC3(tol, __VA_ARGS__, 0, 0, 0)
# undef strtoll
# define strtoll(...) _TG_STR_FUNC3(toll, __VA_ARGS__, 0, 0, 0)
# undef strtoul
# define strtoul(...) _TG_STR_FUNC3(toul, __VA_ARGS__, 0, 0, 0)
# undef strtoull
# define strtoull(...) _TG_STR_FUNC3(toull, __VA_ARGS__, 0, 0, 0)
# undef strtoimax
# define strtoimax(...) _TG_STR_FUNC3(toimax, __VA_ARGS__, 0, 0, 0)
# undef strtoumax
# define strtoumax(...) _TG_STR_FUNC3(toumax, __VA_ARGS__, 0, 0, 0)


#endif
