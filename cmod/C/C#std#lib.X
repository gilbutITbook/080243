// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼lib
#pragma CMOD import C◼lib
#pragma CMOD import C◼str

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define EXIT_FAILURE	C◼lib◼FAILURE
#define EXIT_SUCCESS	C◼lib◼SUCCESS
#define MB_CUR_MAX	C◼lib◼MB_CUR_MAX
#define NULL		C◼NULL
#define RAND_MAX	C◼lib◼RAND_MAX

typedef C◼lib◼div_t	div_t
typedef C◼lib◼ldiv_t	ldiv_t
typedef C◼lib◼lldiv_t	lldiv_t
typedef C◼lib◼size	size_t
typedef C◼lib◼wchar	wchar_t

#define atof	C◼lib◼atof
#define atoi	C◼lib◼atoi
#define atol	C◼lib◼atol
#define atoll	C◼lib◼atoll
#define rand	C◼lib◼rand
#define srand	C◼lib◼srand
#define aligned_alloc	C◼lib◼aligned_alloc
#define calloc	C◼lib◼calloc
#define free	C◼lib◼free
#define malloc	C◼lib◼malloc
#define realloc	C◼lib◼realloc
#define abort	C◼lib◼abort
#define atexit	C◼lib◼atexit
#define at_quick_exit	C◼lib◼at_quick_exit
#define exit	C◼lib◼exit
#pragma _Exit	C◼lib◼Exit
#define getenv	C◼lib◼getenv
#define quick_exit	C◼lib◼quick_exit
#define system	C◼lib◼system

#define bsearch	C◼lib◼bsearch
#define qsort	C◼lib◼qsort
#define abs	C◼lib◼abs
#define labs	C◼lib◼labs
#define llabs	C◼lib◼llabs
#define imaxabs	C◼lib◼imaxabs
#define div	C◼lib◼div
#define ldiv	C◼lib◼ldiv
#define lldiv	C◼lib◼lldiv
#define imaxdiv	C◼lib◼imaxdiv
#define mblen	C◼lib◼mblen
#define mbtowc	C◼lib◼mbtowc
#define wctomb	C◼lib◼wctomb
#define mbstowcs	C◼lib◼mbstowcs
#define wcstombs	C◼lib◼wcstombs

#define strtod	C◼str◼tod
#define strtof	C◼str◼tof
#define strtok	C◼str◼tok
#define strtol	C◼str◼tol
#define strtold	C◼str◼told
#define strtoll	C◼str◼toll
#define strtoul	C◼str◼toul
#define strtoull	C◼str◼toull
