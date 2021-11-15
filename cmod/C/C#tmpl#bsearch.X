// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module bsearch	=	C◼tmpl◼bsearch
#pragma CMOD import lib		=	C◼lib

#pragma CMOD snippet MACRO	=	none
#pragma CMOD slot T		=	typedef
#pragma CMOD slot compar	=	extern int compar(void const*, void const*)

#pragma CMOD declaration

#define MACRO(K, B, S)                                          \
_Generic((B)+0,                                                 \
         T const*: _Generic((K)+0, T: vunmut, default: unmut),  \
         T*: _Generic((K)+0, T: vmut, default: mut)             \
         )                                                      \
 ((K), (B), (S))

inline
T const* unmut(T const* key, T const* base, C◼size nmemb) {
  return lib◼bsearch(key, base, nmemb, sizeof(base[0]), compar);
}

inline
T const* vunmut(T key, T const* base, C◼size nmemb) {
  return unmut(&key, base, nmemb);
}

inline
T* mut(T const* key, T* base, C◼size nmemb) {
  return (T*)unmut(key, base, nmemb);
}

inline
T* vmut(T key, T* base, C◼size nmemb) {
  return mut(&key, base, nmemb);
}
