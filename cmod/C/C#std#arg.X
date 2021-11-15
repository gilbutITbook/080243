// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼arg
#pragma CMOD import C◼va

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

typedef C◼va va_list;

#define va_arg		C◼va◼arg
#define va_start	C◼va◼start

/* These two may be macros and/or external symbols, we captured that
   in C#va already. */
#define va_copy		C◼va◼copy
#define va_end		C◼va◼end
