// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module compar	=	C◼tmpl◼compar

#pragma CMOD snippet none
#pragma CMOD slot func		=	extern int func(void const*a, void const*b)
#pragma CMOD slot T		=	complete

#pragma CMOD declaration

inline
int func(void const*av, void const*bv) {
  T const*a = av;
  T const*b = bv;
  if (*a < *b) return -1;
  else if (*a > *b) return 1;
  else return 0;
}
