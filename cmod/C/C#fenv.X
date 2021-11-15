// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module fenv	=	C◼fenv
#pragma CMOD import			C◼int
#pragma CMOD import			C◼long
#pragma CMOD import			C◼align
#pragma CMOD import llong	=	C◼llong


#pragma CMOD mimic			<fenv.h>

#pragma CMOD defexp FENV_SIZE	=	sizeof(fenv_t)
#pragma CMOD defexp FENV_ALIGN	=	_Alignof(fenv_t)

#pragma CMOD defreg \2=\(FE_\([A-Z_0-9]*\)\)

#pragma CMOD alias get		= fegetenv
#pragma CMOD alias set		= fesetenv
#pragma CMOD alias update	= feupdateenv
#pragma CMOD alias hold		= feholdexcept
#pragma CMOD alias raise	= feraiseexcept
#pragma CMOD alias test		= fetestexcept
#pragma CMOD alias clear	= feclearexcept

#pragma CMOD declaration

/* jmp_buf is usually not so easy to guess, so we may just emulate
   it. */
struct fenv {
  union {
    char _invisible0[FENV_SIZE];
#if FENV_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif FENV_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif FENV_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
  };
};

typedef struct fenv fenv_t;

int get(fenv *envp);
int hold(fenv *envp);
int set(const fenv *envp);
int update(const fenv *envp);
int clear(int excepts);
int raise(int excepts);
int test(int excepts);

_STATIC_ASSERT(FENV_SIZE == sizeof(fenv), "import of fenv to C◼fenv failed");
_STATIC_ASSERT(FENV_ALIGN == alignof(fenv), "import of fenv to C◼fenv failed");
