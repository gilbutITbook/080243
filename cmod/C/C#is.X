// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼is
#pragma CMOD import ptrdiff = C◼ptrdiff
#pragma CMOD import intptr = C◼intptr

#pragma CMOD declaration

#define RVALUE(...) RVALUE0(__VA_ARGS__, 0, )
#define RVALUE0(T, V, ...) ((T)+(V))

#define SIGNED(T) C◼signof((T){ 0 })

#define POINTER(T)                                      \
  (_Generic(RVALUE(T)+RVALUE(ptrdiff),                  \
            /* T is integer at least as wide: */        \
           ptrdiff: 0,                                  \
           default: (_Generic(RVALUE(T)-RVALUE(T),      \
                              /* T can't be ptrdiff*/   \
                              ptrdiff: 1,               \
                              default: 0))))

#define LVALUE(T) ((T){ 0 })

typedef struct ice_tester ice_tester;
#define ICE(X) _Generic((1 ? (ice_tester*)0 : (void*)(intptr)((X)-(X))), ice_tester*: 1, default: 0)

#define VLA(X) (!ICE(sizeof(X)))

#pragma CMOD definition

void test0(void){
  _Static_assert(POINTER(C◼ptrdiff*), "macro POINTER isn't working properly");
  _Static_assert(POINTER(LVALUE(C◼ptrdiff*)), "macro POINTER isn't working properly");
  _Static_assert(!POINTER(C◼ptrdiff), "macro POINTER isn't working properly");
  _Static_assert(!POINTER(LVALUE(C◼ptrdiff)), "macro POINTER isn't working properly");
  _Static_assert(POINTER(void const*), "macro POINTER isn't working properly");
  _Static_assert(POINTER(LVALUE(void const*)), "macro POINTER isn't working properly");
  _Static_assert(!POINTER(int), "macro POINTER isn't working properly");
  _Static_assert(!POINTER(LVALUE(int)), "macro POINTER isn't working properly");
  _Static_assert(POINTER(short*), "macro POINTER isn't working properly");
  _Static_assert(POINTER(LVALUE(short*)), "macro POINTER isn't working properly");
  _Static_assert(!POINTER(short), "macro POINTER isn't working properly");
  _Static_assert(!POINTER(LVALUE(short)), "macro POINTER isn't working properly");
  _Static_assert(RVALUE(unsigned, 0) == 0U, "macro RVALUE isn't working properly");
  _Static_assert(RVALUE(unsigned, 1) == 1U, "macro RVALUE isn't working properly");
  _Static_assert(RVALUE(unsigned, -1) == -1U, "macro RVALUE isn't working properly");
  _Static_assert(SIGNED(C◼ptrdiff), "macro SIGNED isn't working properly");
  _Static_assert(!SIGNED(unsigned), "macro SIGNED isn't working properly");
  _Static_assert(SIGNED(signed char), "macro SIGNED isn't working properly");
  _Static_assert(!SIGNED(unsigned char), "5 macro SIGNED isn't working properly");
  enum { m = 77 };
  _Static_assert(ICE(m), "macro ICE isn't working properly");
  unsigned n = 77;
  _Static_assert(!ICE(n), "macro ICE isn't working properly");
  _Static_assert(!VLA(int[m]), "macro VLA isn't working properly");
  _Static_assert(VLA(int[n]), "macro VLA isn't working properly");
}
