// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module cenv	=	C◼cenv
#pragma CMOD import 			C◼noreturn
#pragma CMOD import 			C◼align
#pragma CMOD import			C◼int
#pragma CMOD import			C◼long
#pragma CMOD import llong	=	C◼llong

#pragma CMOD mimic			<setjmp.h>
#pragma CMOD mimic			<stdalign.h>

/* jmp_buf is usually not so easy to guess, so we may just emulate
   it. */
#pragma CMOD defexp CENV_SIZE	=	sizeof(jmp_buf)
#pragma CMOD defexp CENV_ALIGN	=	alignof(jmp_buf)

#pragma CMOD alias set		=	setjmp
#pragma CMOD alias 			_setjmp
#pragma CMOD define set		=	setjmp

#pragma CMOD alias jmp		=	longjmp

#pragma CMOD declaration

/* jmp_buf is usually not so easy to guess, so we may just emulate
   it. */
struct __jmp_buf_tag {
  union {
    char _invisible0[CENV_SIZE];
#if CENV_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif CENV_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif CENV_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
  };
};

/* jmp_buf must be an array type */
typedef struct __jmp_buf_tag cenv[1];

extern noreturn void jmp(cenv, int);

extern int _setjmp (cenv) __attribute__ ((__nothrow__));
extern int set(cenv) __attribute__ ((__nothrow__));



_STATIC_ASSERT(CENV_SIZE == sizeof(cenv), "import of jmp_buf to C◼cenv failed");
_STATIC_ASSERT(CENV_ALIGN == alignof(cenv), "import of jmp_buf to C◼cenv failed");
