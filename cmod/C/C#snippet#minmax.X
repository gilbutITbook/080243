// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module minmax	=	C◼snippet◼minmax
#pragma CMOD import 			C◼def

#pragma CMOD snippet T		=	complete

#pragma CMOD declaration

inline
T minv(C◼size n, T arr[n]) {
  T ret = arr[0];
  for (C◼size i = 1; i < n; ++i)
    if (arr[i] < ret) ret = arr[i];
  return ret;
}

#define min(...) minv(sizeof((T[]){ __VA_ARGS__ })/sizeof(T), (T[]){ __VA_ARGS__ })

inline
T maxv(C◼size n, T arr[n]) {
  T ret = arr[0];
  for (C◼size i = 1; i < n; ++i)
    if (arr[i] > ret) ret = arr[i];
  return ret;
}

#define max(...) maxv(sizeof((T[]){ __VA_ARGS__ })/sizeof(T), (T[]){ __VA_ARGS__ })
