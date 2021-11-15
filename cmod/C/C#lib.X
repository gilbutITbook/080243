// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module				C◼lib
#pragma CMOD import				C
#pragma CMOD import				C◼def
#pragma CMOD import 				C◼align
#pragma CMOD import				C◼noreturn
#pragma CMOD import 				C◼int
#pragma CMOD import 				C◼long
#pragma CMOD import 	llong	=		C◼llong

#pragma CMOD mimic <stdlib.h>
#pragma CMOD mimic <stdalign.h>
#pragma CMOD mimic <inttypes.h>

#pragma CMOD defexp FAILURE		=	EXIT_FAILURE
#pragma CMOD defexp SUCCESS		=	EXIT_SUCCESS
#pragma CMOD defexp				RAND_MAX

/* Some C libraries implement this as a runtime value. For the moment
we don't know how to do this generically. */
#pragma CMOD defexp				MB_CUR_MAX

#pragma CMOD defexp DIV_SIZE		=	sizeof(div_t)
#pragma CMOD defexp DIV_ALIGN		=	alignof(div_t)
#pragma CMOD defexp DIV_REM_OFFSET	=	offsetof(div_t, rem)
#pragma CMOD defexp DIV_QUOT_OFFSET	=	offsetof(div_t, quot)

#pragma CMOD defexp LDIV_SIZE		=	sizeof(ldiv_t)
#pragma CMOD defexp LDIV_ALIGN		=	alignof(ldiv_t)
#pragma CMOD defexp LDIV_REM_OFFSET	=	offsetof(ldiv_t, rem)
#pragma CMOD defexp LDIV_QUOT_OFFSET	=	offsetof(ldiv_t, quot)

#pragma CMOD defexp LLDIV_SIZE		=	sizeof(lldiv_t)
#pragma CMOD defexp LLDIV_ALIGN		=	alignof(lldiv_t)
#pragma CMOD defexp LLDIV_REM_OFFSET	=	offsetof(lldiv_t, rem)
#pragma CMOD defexp LLDIV_QUOT_OFFSET	=	offsetof(lldiv_t, quot)

#pragma CMOD defexp IMAXDIV_SIZE		=	sizeof(imaxdiv_t)
#pragma CMOD defexp IMAXDIV_ALIGN		=	alignof(imaxdiv_t)
#pragma CMOD defexp IMAXDIV_REM_OFFSET	=	offsetof(imaxdiv_t, rem)
#pragma CMOD defexp IMAXDIV_QUOT_OFFSET	=	offsetof(imaxdiv_t, quot)

#pragma CMOD alias				atof
#pragma CMOD alias				atoi
#pragma CMOD alias				atol
#pragma CMOD alias				atoll
#pragma CMOD alias				rand
#pragma CMOD alias				srand
#pragma CMOD alias				aligned_alloc
#pragma CMOD alias				calloc
#pragma CMOD alias				free
#pragma CMOD alias				malloc
#pragma CMOD alias				realloc
#pragma CMOD alias				abort
#pragma CMOD alias				atexit
#pragma CMOD alias				at_quick_exit
#pragma CMOD alias				exit
#pragma CMOD alias Exit			=	_Exit
#pragma CMOD alias				getenv
#pragma CMOD alias				quick_exit
#pragma CMOD alias				system

#pragma CMOD alias				bsearch
#pragma CMOD alias				qsort
#pragma CMOD alias				abs
#pragma CMOD alias				labs
#pragma CMOD alias				llabs
#pragma CMOD alias				imaxabs
#pragma CMOD alias				div
#pragma CMOD alias				ldiv
#pragma CMOD alias				lldiv
#pragma CMOD alias				imaxdiv
#pragma CMOD alias				mblen
#pragma CMOD alias				mbtowc
#pragma CMOD alias				wctomb
#pragma CMOD alias				mbstowcs
#pragma CMOD alias				wcstombs

#pragma CMOD declaration

typedef C◼size size;
typedef C◼wchar wchar;
#define NULL C◼NULL

double atof(const char*);
int atoi(char const*);
long int atol(char const*);
long long int atoll(char const*);

int rand(void);
void srand(unsigned int);
void* aligned_alloc(size, size);
void* calloc(size, size);
void free(void*);
void* malloc(size);
void* realloc(void*, size);
noreturn void abort(void);
int atexit(void (*)(void));
int at_quick_exit(void (*)(void));
noreturn void exit(int);
noreturn void Exit(int);
char* getenv(char const*);
noreturn void quick_exit(int);
int system(char const*);
void* bsearch(void const*, const void*, size, size, int (*)(void const*, void const*));
void qsort(void*, size, size, int (*)(void const*, const void*));
int (abs)(int);
long int (labs)(long int);
long long int (llabs)(long long int);
C◼intmax (imaxabs)(C◼intmax);
/* all signed types should go to one of the three functions, unsigned
   types should just do nothing.*/
#define abs(X) _Generic((+X), int: abs(X), long: labs(X), long long: llabs(X), default: (X))
div_t (div)(int, int);
ldiv_t (ldiv)(long int, long int);
lldiv_t (lldiv)(long long int, long long int);
imaxdiv_t (imaxdiv)(C◼intmax, C◼intmax);
#define div(X, Y) _Generic((X)+(Y), int: div, long: ldiv, long long: lldiv)((X), (Y))
int mblen(char const*, size);
int mbtowc(wchar* restrict, char const* restrict, size);
int wctomb(char*, wchar);
size mbstowcs(wchar* restrict, char const* restrict, size);
size wcstombs(char* restrict, wchar const* restrict, size);

struct div_t {
       union {
         char _invisible0[DIV_SIZE];
#if DIV_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif DIV_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif DIV_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
         struct {
#if DIV_REM_OFFSET > 0
           char _invisible4[DIV_REM_OFFSET];
#endif
           int rem;
         };
         struct {
#if DIV_QUOT_OFFSET > 0
           char _invisible5[DIV_QUOT_OFFSET];
#endif
           int quot;
         };
       };
};

struct ldiv_t {
       union {
         char _invisible0[LDIV_SIZE];
#if LDIV_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif LDIV_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif LDIV_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
         struct {
#if LDIV_REM_OFFSET > 0
           char _invisible4[LDIV_REM_OFFSET];
#endif
           long rem;
         };
         struct {
#if LDIV_QUOT_OFFSET > 0
           char _invisible5[LDIV_QUOT_OFFSET];
#endif
           long quot;
         };
       };
};

struct lldiv_t {
       union {
         char _invisible0[LLDIV_SIZE];
#if LLDIV_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif LLDIV_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif LLDIV_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
         struct {
#if LLDIV_REM_OFFSET > 0
           char _invisible4[LLDIV_REM_OFFSET];
#endif
           long long rem;
         };
         struct {
#if LLDIV_QUOT_OFFSET > 0
           char _invisible5[LLDIV_QUOT_OFFSET];
#endif
           long long quot;
         };
       };
};

struct imaxdiv_t {
       union {
         char _invisible0[IMAXDIV_SIZE];
#if IMAXDIV_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif IMAXDIV_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif IMAXDIV_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
         struct {
#if IMAXDIV_REM_OFFSET > 0
           char _invisible4[IMAXDIV_REM_OFFSET];
#endif
           C◼intmax rem;
         };
         struct {
#if IMAXDIV_QUOT_OFFSET > 0
           char _invisible5[IMAXDIV_QUOT_OFFSET];
#endif
           C◼intmax quot;
         };
       };
};


_STATIC_ASSERT(DIV_SIZE == sizeof(div_t), "import of div_t to C◼lib◼div_t failed");
_STATIC_ASSERT(DIV_ALIGN == alignof(div_t), "import of div_t to C◼lib◼div_t failed");
_STATIC_ASSERT(DIV_REM_OFFSET == offsetof(div_t, rem), "import of div_t to C◼lib◼div_t failed");
_STATIC_ASSERT(DIV_QUOT_OFFSET == offsetof(div_t, quot), "import of div_t to C◼lib◼div_t failed");

_STATIC_ASSERT(LDIV_SIZE == sizeof(ldiv_t), "import of ldiv_t to C◼lib◼ldiv_t failed");
_STATIC_ASSERT(LDIV_ALIGN == alignof(ldiv_t), "import of ldiv_t to C◼lib◼ldiv_t failed");
_STATIC_ASSERT(LDIV_REM_OFFSET == offsetof(ldiv_t, rem), "import of ldiv_t to C◼lib◼ldiv_t failed");
_STATIC_ASSERT(LDIV_QUOT_OFFSET == offsetof(ldiv_t, quot), "import of ldiv_t to C◼lib◼ldiv_t failed");

_STATIC_ASSERT(LLDIV_SIZE == sizeof(lldiv_t), "import of lldiv_t to C◼lib◼lldiv_t failed");
_STATIC_ASSERT(LLDIV_ALIGN == alignof(lldiv_t), "import of lldiv_t to C◼lib◼lldiv_t failed");
_STATIC_ASSERT(LLDIV_REM_OFFSET == offsetof(lldiv_t, rem), "import of lldiv_t to C◼lib◼lldiv_t failed");
_STATIC_ASSERT(LLDIV_QUOT_OFFSET == offsetof(lldiv_t, quot), "import of lldiv_t to C◼lib◼lldiv_t failed");

_STATIC_ASSERT(IMAXDIV_SIZE == sizeof(imaxdiv_t), "import of imaxdiv_t to C◼lib◼imaxdiv_t failed");
_STATIC_ASSERT(IMAXDIV_ALIGN == alignof(imaxdiv_t), "import of imaxdiv_t to C◼lib◼imaxdiv_t failed");
_STATIC_ASSERT(IMAXDIV_REM_OFFSET == offsetof(imaxdiv_t, rem), "import of imaxdiv_t to C◼lib◼imaxdiv_t failed");
_STATIC_ASSERT(IMAXDIV_QUOT_OFFSET == offsetof(imaxdiv_t, quot), "import of imaxdiv_t to C◼lib◼imaxdiv_t failed");
