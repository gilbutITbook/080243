// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼snippet◼init
#pragma CMOD import INITIALIZER = C◼snippet◼INITIALIZER

#pragma CMOD snippet T=none
enum _Dummy_init { _Dummy_init = sizeof((T){0}), };

#pragma CMOD declaration
/* _T is required to be a type. */
_STATIC_ASSERT(sizeof((T){0}), "T is required to be a type.");

inline
T* init(T* x, C◼size n){
  if (x) {
    for (C◼size i = 0; i < n; ++i) {
      x[i] = (T)INITIALIZER();
    }
  }
  return x;
}
