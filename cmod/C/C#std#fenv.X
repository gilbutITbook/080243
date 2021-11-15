// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼fenv
#pragma CMOD import C◼fenv◼round
#pragma CMOD import C◼fenv◼except

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define FE_DOWNWARD C◼fenv◼DOWNWARD
#define FE_TONEAREST C◼fenv◼TONEAREST
#define FE_TOWARDZERO C◼fenv◼TOWARDZERO
#define FE_UPWARD C◼fenv◼UPWARD

#ifdef C◼fenv◼DIVBYZERO
# define FE_DIVBYZERO C◼fenv◼DIVBYZERO
#endif
#ifdef C◼fenv◼INEXACT
# define FE_INEXACT C◼fenv◼INEXACT
#endif
#ifdef C◼fenv◼INVALID
# define FE_INVALID C◼fenv◼INVALID
#endif
#ifdef C◼fenv◼OVERFLOW
# define FE_OVERFLOW C◼fenv◼OVERFLOW
#endif
#ifdef C◼fenv◼UNDERFLOW
# define FE_UNDERFLOW C◼fenv◼UNDERFLOW
#endif

#define FE_ALL_EXCEPT C◼fenv◼ALL_EXCEPT

typedef C◼fenv fenv_t;
typedef C◼fenv◼except feexcept_t;

#define feclearexcept	C◼fenv◼clear
#define fegetexceptflag	C◼fenv◼except◼get
#define feraiseexcept	C◼fenv◼raise
#define fesetexceptflag	C◼fenv◼except◼set
#define fetestexcept	C◼fenv◼test
#define fegetround	C◼fenv◼round◼get
#define fesetround	C◼fenv◼round◼set
#define fegetenv	C◼fenv◼get
#define feholdexcept	C◼fenv◼hold
#define fesetenv	C◼fenv◼set
#define feupdateenv	C◼fenv◼update
