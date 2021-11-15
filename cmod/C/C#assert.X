// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module assert	=	C◼assert
#pragma CMOD mimic <assert.h>

/* The glibc implementation needs these special macros */
#pragma CMOD define __ASSERT_VOID_CAST
#pragma CMOD define __ASSERT_FUNCTION
#pragma CMOD define __STRING

#pragma CMOD alias __assert_fail


/* Get whatever platform definition of assert there is */
#pragma CMOD define debug_assert=assert

#pragma CMOD declaration

#define static_assert _Static_assert

#ifdef NDEBUG
#define assert(X) ((void)0)
#else
#define assert(X) debug_assert(X)
#endif

void __assert_fail (const char *, const char *, int, const char *);

