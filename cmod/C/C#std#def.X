// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼def
#pragma CMOD import C◼def

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/
#pragma CMOD snippet none
#pragma CMOD declaration

#define NULL			C◼NULL
#define offsetof		C◼offsetof
typedef C◼max_align		max_align_t;
typedef C◼size			size_t;
typedef C◼ptrdiff		ptrdiff_t;
typedef C◼wchar			wchar_t;
