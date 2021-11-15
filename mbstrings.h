#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>
#include <wctype.h>
#include <ctype.h>

/**
 ** @file
 ** @brief Helper functions for multibyte strings.
 **
 ** These functions try to ease the use of multibyte strings. Most of
 ** the time they pass through wide character functions to achieve
 ** their goal. This has only use that is somewhat limited if on
 ** platform wide characters are not of fixed width but use
 ** surrogates. For such surrogate characters the classification
 ** functions will fail erratically.
 **
 ** @warning this implementations supposes that @c wchar_t supports
 ** some form of Unicode.
 **/

#ifndef __STDC_ISO_10646__
# error "wchar_t wide characters have to be Unicode code points"
#endif
#ifdef __STDC_MB_MIGHT_NEQ_WC__
# error "basic character codes must agree on char and wchar_t"
#endif

/**
 ** @brief A type for 16 bit characters as provided by "uchar.h"
 **
 ** This is the base type of strings that are prefixed with @c u, such
 ** as in <code>u"string"</code>.
 **
 ** There are good chances that on most platforms this is the UCS-2
 ** encoding, thus an encoding that has surrogates.
 **
 ** @remark This should be provided by the header file, but the type
 ** is fixed as is given here, and C11 compilers should tolerate a
 ** repetition of a @c typedef, as long as it is consistent.
 **/
typedef uint_least16_t char16_t;

/**
 ** @brief A type for 32 bit characters as provided by "uchar.h"
 **
 ** This is the base type of strings that are prefixed with @c U, such
 ** as in <code>U"string"</code>.
 **
 ** There are good chances that on most platforms this is the UCS-4
 ** encoding, thus an encoding without surrogates.
 **
 ** @remark This should be provided by the header file, but the type
 ** is fixed as is given here, and C11 compilers should tolerate a
 ** repetition of a @c typedef, as long as it is consistent.
 **/
typedef uint_least32_t char32_t;

/**
 ** @brief A helper type to ensure proper initialization of @c
 ** mbstate_t variables
 **
 ** Not to be used directly
 ** @see MBSTATE
 **/
union mbstate_t_ {
  unsigned char bytes[sizeof(mbstate_t)];
  mbstate_t state;
} mbstate_t_;

/**
 ** @brief Provide a pointer to a properly initialized @c mbstate_t
 **
 ** This uses the union type to ensure that the state is initialized
 ** with all bytes set to @c 0.
 **/
#define MBSTATE (&(union mbstate_t_){ .bytes = { 0 }}.state)

/**
 ** @brief For functions that receive a wide character classification
 ** function as an argument.
 **/
typedef int (*wcclass_t)(wint_t);

/**
 ** @brief Interpret a sequence of bytes in @a c as mb character
 ** and return that as wide character through @a C
 **
 ** @return the length of the mb character or @c -1 if an
 ** encoding error occured.
 **
 ** This function can be integrated into a sequence of such
 ** searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions.
 **
 ** @remark @a state of @c 0 indicates that @a c can be scanned
 ** without considering any context.
 **/
size_t mbrtow(wchar_t*restrict C, char const c[restrict static 1],
              mbstate_t*restrict state);

/**
 ** @brief Interpret a sequence of bytes in @a c as mb character and
 ** return that as wide character.
 **
 ** @return the wide character converted to @c wint_t or @c WEOF if an
 ** encoding error occurred.
 **
 ** This function should only be used for strings containing one
 ** single mb character. It cannot be integrated into a sequence of
 ** searches through a string with more characters since the @c
 ** mbstate_t is not kept.
 **/
wint_t mbtow(char const*c);

/**
 ** @brief Interpret a mb string in @a mbs and return its
 ** length when interpreted as a wide character string
 **
 ** @return the length of the mb string or @c -1 if an
 ** encoding error occured.
 **
 ** This function can be integrated into a sequence of searches
 ** through a string, as long as a @a state argument is passed to
 ** this function that is consistent with the mb character
 ** starting in @a mbs. The state itself is not modified by this
 ** function.
 **
 ** @remark @a state of @c 0 indicates that @a mbs can be scanned
 ** without considering any context.
 **/
size_t mbsrlen(char const*restrict mbs,
               mbstate_t const*restrict state);

/**
 ** @brief Interpret a sequence of bytes in @a s as mb string and
 ** convert it to a wide character string.
 **
 ** @return a newly malloc'ed wide character string of the
 ** appropriate length, @c 0 if an encoding error occurred.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as a @a state
 ** argument is passed to this function that is consistent with
 ** the mb character starting in @a c. The state itself is not
 ** modified by this function.
 **
 ** @remark @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
wchar_t* mbsrdup(char const*s, mbstate_t const*restrict state);

/**
 ** @brief Copy at most @a n bytes of the mb string @a s to @a t.
 **
 ** This is meant to be an efficient variant of ::mbsrncpy for
 ** the case the copy operation can be done with ::memcpy.
 **
 ** Mb string @a s is supposed to be a complete mb string in
 ** initial shift state. If it has no @c 0 character in the first
 ** @a n bytes, the copy operation fails and the function returns
 ** @c 0.
 **
 ** The mb string that is produced in @a t may be the
 ** continuation of an existing prefix who's conversion state is
 ** described by @a state.
 **
 ** If @a s can not completely be copied because the adjustment
 ** of the shift state would leave less than
 ** <code>strlen(s)+1</code> space in @a t, the copy operation is
 ** aborted and @c 0 is returned.
 **
 ** @return the address of the terminating null character in @a t
 ** if the copy operation succeeded, @c 0 otherwise. In case of
 ** success, @a t is in an initial shift state for the returned
 ** position.
 **/
char* mbsrmbsncpy(size_t n, char t[restrict n], mbstate_t const*restrict state,
                  char const s [restrict static 1]);


/**
 ** @brief Copy at most @a n bytes of the mb string @a s to @a t.
 **
 ** This is a safe variant of ::mbsrmbsncpy that covers all
 ** cases.
 **
 ** Mb string @a s is supposed to be a mb string in state @a
 ** sstate. If it has no @c 0 character in the first @a n bytes,
 ** the copy operation will be partial up to that point.
 **
 ** The mb string that is produced in @a t may be the continuation of
 ** an existing prefix who's conversion state is described by @a
 ** sstate.
 **
 ** This function copies complete mb characters as long as they
 ** fit into the target array. To be able to do so, the
 ** conversion state of @a t might have to be adapted to be in
 ** sync with @a s. By that the copied part may be longer than
 ** <code>strlen(s)+1</code>.
 **
 ** @return The address of the first byte in @a t after the copy
 ** is returned; that byte is null if the whole @a s could be
 ** copied. If nothing could be copied, @a t is returned. In that
 ** case @c *t is not written to and @a tstate is unchanged.
 **/
char* mbsrncpy(size_t n, char t[restrict n], mbstate_t*restrict tstate,
               char const s [restrict static 1], mbstate_t const*restrict sstate);


/**
 ** @brief Interpret a sequence of bytes in @a s as mb string and
 ** search for wide character @a C
 **
 ** @return the @a occurrence'th position in @a s that starts a
 ** mb sequence corresponding to @a C or @c 0 if an encoding
 ** error occurred.
 **
 ** If the number of occurrences is less than @a occurrence the
 ** last such position is returned. So in particular using @c
 ** SIZE_MAX (or @c -1) will always return the last occurrence.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrwc(char const s[restrict static 1],
                   mbstate_t*restrict state,
                   wchar_t C, size_t occurrence);

/**
 ** @brief Interpret a sequence of bytes in @a s as mb string and
 ** search for mb character represented by @a c
 **
 ** @return the @a occurrence'th position in @a s that starts a
 ** mb sequence corresponding to @a c or @c 0 if an encoding
 ** error occurred.
 **
 ** If the number of occurrences is less than @a occurrence the
 ** last such position is returned. So in particular using @c
 ** SIZE_MAX (or @c -1) will always return the last occurrence.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrmb(char const s[static 1], mbstate_t*restrict state,
                   char const c[static 1], size_t occurence);

/**
 ** @brief Interpret a sequence of bytes in @a s as mb string and
 ** and reverse search for wide character @a C
 **
 ** @return the maximal position in @a s that starts a mb
 ** sequence corresponding to @a C or @c 0 if an encoding error
 ** occured.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrrwc(char const s[restrict static 1], mbstate_t*restrict state,
                    wchar_t C);

/**
 ** @brief Interpret a sequence of bytes in @a s as mb string and
 ** reverse search for mb character represented by @a c
 **
 ** @return the maximal position in @a s that starts a mb
 ** sequence corresponding to @a c or @c 0 if an encoding error
 ** occured.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrrmb(char const s[static 1], mbstate_t*restrict state,
                    char const c[static 1]);

/**
 ** @brief In mb string @a s1 jump over the initial segment
 ** corresponding to wide character string @a S2.
 **
 ** @return the position in @a s1 after the initial segment if @a
 ** S2 is found or @c 0 otherwise.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark A @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrwcjump(char const s1[static 1], mbstate_t*restrict state,
                       size_t S2len, wchar_t const S2[S2len]);

/**
 ** @brief In mb string @a s1 find a segment corresponding to
 ** wide character string @a S2.
 **
 ** @return the position in @a s1 that starts the first such
 ** segment if @a S2 is found or @c 0 otherwise.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark A @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrwcs(char const s1[static 1], mbstate_t*restrict state,
                    wchar_t const S2[static 1]);

/**
 ** @brief In mb string @a s1 find a segment corresponding to mb
 ** string @a s2.
 **
 ** @return the position in @a s1 that starts the first such
 ** segment if @a s2 is found or @c 0 otherwise.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark A @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrmbs(char const s1[static 1], mbstate_t*restrict state,
                    char const s2[static 1]);

/**
 ** @brief In mb string @a s1 skip over the initial part of the
 ** string that corresponds to wide characters in string @a S2.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching wide character in @a S2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @a state is updated to correspond to the returned position.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark A @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrwcsskip(char const s1[static 1], mbstate_t*restrict state,
                        wchar_t const* S2);

/**
 ** @brief In mb string @a s1 skip over the initial part of the
 ** string that corresponds to mb characters in string @a s2.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching mb character in @a s2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @a state is updated to correspond to the returned position.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark A @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrskip(char const s1[static 1], mbstate_t*restrict state,
                     char const* s2);

/**
 ** @brief In mb string @a s1 return the length of the initial
 ** part of the string that corresponds to mb characters in
 ** string @a s2.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching mb character in @a s2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @remark This function supposes that @a s1 can be scanned
 ** without context, that is it starts in an initial shift state.
 **/
size_t mbsspn(char const* s1, char const* s2);

/**
 ** @brief In mb string @a s1 skip over the initial part of the
 ** string that verifies classification @a func.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching mb character in @a s2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @a state is updated to correspond to the returned position.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark A @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrskip_class(char const s1[static 1], mbstate_t*restrict state,
                           wcclass_t func);

/**
 ** @brief In mb string @a s1 return the length of the initial
 ** part of the string that verifies classification @a func.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching mb character in @a s2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @remark This function supposes that @a s1 can be scanned
 ** without context, that is it starts in an initial shift state.
 **/
size_t mbsspn_class(char const* s1, wcclass_t func);

/**
 ** @brief In mb string @a s1 skip over the initial part of the
 ** string that verifies type @a type.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching mb character in @a s2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @a state is updated to correspond to the returned position.
 **
 ** @remark This function can be integrated into a sequence of
 ** such searches through a string, as long as the same @a state
 ** argument passed to all calls to this or similar functions and
 ** as long as the continuation of the search starts at the
 ** position that is returned by this function.
 **
 ** @remark A @a state of @c 0 indicates that @a s can be scanned
 ** without considering any context.
 **/
char const* mbsrskip_type(char const s1[static 1], mbstate_t*restrict state, wctype_t type);

/**
 ** @brief In mb string @a s1 return the length of the initial
 ** part of the string that verifies type @a type.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching mb character in @a s2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @remark This function supposes that @a s1 can be scanned
 ** without context, that is it starts in an initial shift state.
 **/
size_t mbsspn_type(char const* s1, wctype_t type);

/**
 ** @brief In mb string @a s1 return the length of the initial
 ** part of the string who's type corresponds to category @a
 ** name.
 **
 ** Predefined standard names are @c "alnum", @c "alpha", @c
 ** "blank", @c "cntrl", @c "digit", @c "graph", @c "lower", @c
 ** "print", @c "punct", @c "space", @c "upper", and @c
 ** "xdigit". Others may be provided by your platform.
 **
 ** @return the position in @a s1 that corresponds to the the
 ** first non-matching mb character in @a s2, which may be the
 ** terminating @c 0 character or a position that produces an
 ** encoding error.
 **
 ** @remark This function supposes that @a s1 can be scanned
 ** without context, that is it starts in an initial shift state.
 **/
size_t mbsspn_name(char const* s1, char const name[static 1]);

/**
 ** @brief In mb string @a s1 skip over the initial part of the
 ** string that doesn't correspond to wide characters in string
 ** @a S2.
 **
 ** @see mbsrwcsskip 
 **/
char const* mbsrwcscskip(char const s1[static 1], mbstate_t*restrict state, wchar_t const* S2);

/**
 ** @brief In mb string @a s1 skip over the initial part of the
 ** string that doesn't correspond to mb characters in string @a
 ** s2.
 **
 ** @see mbsrskip
 **/
char const* mbsrcskip(char const* s1, mbstate_t*restrict state, char const* s2);

/**
 ** @brief In mb string @a s1 skip over the initial part of the
 ** string that doesn't correspond to mb characters in string @a
 ** s2.
 **
 ** @see mbsrskip
 **/
size_t mbscspn(char const* s1, char const* s2);

/**
 ** @brief Convert mb string @a s1 to @c double.
 **
 ** @see strtod
 **/
double mbsrtod(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr);

/**
 ** @brief Convert mb string @a s1 to <code>long double</code>.
 **
 ** @see strtold
 **/
long double mbsrtold(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr);

/**
 ** @brief Convert mb string @a s1 to <code>long</code> according
 ** to base @a base.
 **
 ** @see strtol
 **/
long mbsrtol(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base);

/**
 ** @brief Convert mb string @a s1 to <code>long long</code> according
 ** to base @a base.
 **
 ** @see strtoll
 **/
long long mbsrtoll(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base);

/**
 ** @brief Convert mb string @a s1 to <code>unsigned long</code>
 ** according to base @a base.
 **
 ** @see strtoul
 **/
unsigned long mbsrtoul(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base);

/**
 ** @brief Convert mb string @a s1 to <code>unsigned long
 ** long</code> according to base @a base.
 **
 ** @see strtoull
 **/
unsigned long long mbsrtoull(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base);

