// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module compar	=	C◼str◼compar
#pragma CMOD import str		=	C◼str

#pragma CMOD import 	inter		= C◼interface◼compar
#pragma CMOD fill	inter◼func	= C◼str◼compar

#pragma CMOD declaration

typedef char const* T;

inline
int compar(void const* av, void const* bv) {
  T const* a = av;
  T const* b = bv;
  return C◼str◼cmp(*a, *b);
}
