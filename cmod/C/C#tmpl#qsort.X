// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module qsort	=	C◼tmpl◼qsort
#pragma CMOD import lib		=	C◼lib


#pragma CMOD snippet none
#pragma CMOD slot T		=	typedef
#pragma CMOD slot func		=	extern void func(T* base, C◼size nmemb)
#pragma CMOD slot compar	=	extern int compar(void const*a, void const*b)

#pragma CMOD declaration

inline
void func(T* base, C◼size nmemb) {
  lib◼qsort(base, nmemb, sizeof(base[0]), compar);
}
