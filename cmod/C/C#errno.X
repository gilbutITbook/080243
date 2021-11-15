// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module errno	=	C◼errno
#pragma CMOD mimic <errno.h>
#pragma CMOD mimic <string.h>
#pragma CMOD alias tostr	=	strerror

#pragma CMOD define errno
#pragma CMOD defexp DOM		= EDOM
#pragma CMOD defexp ILSEQ	= EILSEQ
#pragma CMOD defexp RANGE	= ERANGE

#pragma CMOD declaration

extern char* tostr(int);

#pragma CMOD alias 			__errno_location
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __const__));

