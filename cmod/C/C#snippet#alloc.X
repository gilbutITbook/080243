// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module 			C◼snippet◼alloc
#pragma CMOD import 			C◼def
#pragma CMOD import lib		=	C◼lib
#pragma CMOD import mem		=	C◼mem
#pragma CMOD import sig		=	C◼sig
#pragma CMOD import mod		=	C◼mod

#pragma CMOD snippet T=none

#pragma CMOD declaration

_STATIC_ASSERT(sizeof((T){0}), "T is required to be a complete type.");

#pragma CMOD definition

T* alloc(C◼size nlen, T*restrict prev) {
  /* This is used to trace the identity of this module. */
  void (*const here)(void) = (void(*)(void))alloc;
  static const unsigned char zer0[sizeof(T)];
  static const T zero;
  static sig◼atomic isinitialized;
  if (!isinitialized) {
    isinitialized = 1 + !mem◼cmp(&zero, &zer0, sizeof zero);
  }
  typedef struct helper helper;
  struct helper {
    C◼size len;
    void(*id)(void);
    T data[];
  };
  helper*restrict old
    = prev
    ? (void*)((char*)prev-offsetof(helper, data))
    : C◼nullptr;
  if (!nlen) {
    if (old) {
      lib◼free(old);
      return C◼nullptr;
    } else {
      nlen = 1;
    }
  }
  if (old && old->id != here) return 0;
  C◼size olen = old ? old->len : 0;
  helper* ret = lib◼realloc(old, sizeof(T[nlen])+offsetof(helper, data));
  if (!ret) return 0;
  *ret = (helper){ .len = nlen, .id = here, };
  if (olen < nlen) {
    C◼size olenb = olen ? sizeof(T[olen]) : 0;
    switch (isinitialized) {
    case 2:
      mem◼set(ret->data+olenb, 0, sizeof(T[nlen-olen]));
      break;
    case 1:
      for (C◼size i = olen; i < nlen; ++i)
        ret->data[i] = (const T){ 0 };
      break;
    }
  }
  return ret->data;
}

