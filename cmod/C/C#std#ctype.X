// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼ctype
#pragma CMOD import C◼char

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define isalnum C◼char◼alnum
#define isalpha C◼char◼alpha
#define isblank C◼char◼blank
#define iscntrl C◼char◼cntrl
#define isdigit C◼char◼digit
#define isgraph C◼char◼graph
#define islower C◼char◼lower
#define isprint C◼char◼print
#define ispunct C◼char◼punct
#define isspace C◼char◼space
#define isupper C◼char◼upper
#define isxdigit C◼char◼xdigit
#define tolower C◼char◼tolower
#define toupper C◼char◼toupper
