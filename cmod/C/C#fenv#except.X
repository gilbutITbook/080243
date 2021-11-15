// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module except	=	C◼fenv◼except
#pragma CMOD import			C◼short
#pragma CMOD import			C◼int
#pragma CMOD import			C◼long
#pragma CMOD import			C◼align
#pragma CMOD import llong	=	C◼llong

#pragma CMOD mimic			<fenv.h>

/* jmp_buf is usually not so easy to guess, so we may just emulate
   it. */
#pragma CMOD defexp EXCEPT_SIZE		=	sizeof(fexcept_t)
#pragma CMOD defexp EXCEPT_ALIGN	=	_Alignof(fexcept_t)

#pragma CMOD alias get		= fegetexceptflag
#pragma CMOD alias set		= fesetexceptflag

#pragma CMOD declaration

/* jmp_buf is usually not so easy to guess, so we may just emulate
   it. */
struct except {
  union {
    char _invisible0[EXCEPT_SIZE];
#if EXCEPT_ALIGN == C◼short◼ALIGN
         short _invisible1;
#elif EXCEPT_ALIGN == C◼int◼ALIGN
         int _invisible2;
#elif EXCEPT_ALIGN == C◼long◼ALIGN
         long _invisible3;
#elif EXCEPT_ALIGN == C◼llong◼ALIGN
         long long _invisible4;
#endif
  };
};

int get(except *flagp, int excepts);
int set(const except *flagp, int excepts);

_STATIC_ASSERT(EXCEPT_SIZE == sizeof(except), "import of except to C◼fenv◼except failed");
_STATIC_ASSERT(EXCEPT_ALIGN == alignof(except), "import of except to C◼fenv◼except failed");
