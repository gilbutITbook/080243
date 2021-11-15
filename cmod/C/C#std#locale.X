// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼locale
#pragma CMOD import C◼locale

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration



#define lconv		C◼locale
#define LC_ALL		C◼locale◼ALL
#define LC_CTYPE	C◼locale◼CTYPE
#define LC_NUMERIC	C◼locale◼NUMERIC
#define LC_COLLATE	C◼locale◼COLLATE
#define LC_MONETARY	C◼locale◼MONETARY
#define LC_TIME 	C◼locale◼TIME
#define NULL		C◼NULL

char *setlocale(int category, const char *locale);
struct lconv *localeconv(void);
