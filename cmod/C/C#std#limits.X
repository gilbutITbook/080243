// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼limits
#pragma CMOD import C◼limits
#pragma CMOD import C◼char
#pragma CMOD import C◼schar
#pragma CMOD import C◼uchar
#pragma CMOD import C◼short
#pragma CMOD import C◼ushort
#pragma CMOD import C◼int
#pragma CMOD import C◼unsigned
#pragma CMOD import C◼long
#pragma CMOD import C◼ulong
#pragma CMOD import C◼llong
#pragma CMOD import C◼ullong

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define CHAR_BIT	C◼CHAR_BIT
#define CHAR_MAX	C◼char◼MAX
#define INT_MIN		C◼int◼MIN
#define ULONG_MAX	C◼unsigned◼MAX
#define SCHAR_MIN	C◼schar◼MIN
#define MB_LEN_MAX	C◼MB_LEN_MAX
#define INT_MAX		C◼int◼MAX
#define LLONG_MIN	C◼llong◼MIN
#define SCHAR_MAX	C◼schar◼MAX
#define SHRT_MIN	C◼short◼MIN
#define UINT_MAX	C◼unsigned◼MAX
#define LLONG_MAX	C◼llong◼MAX
#define UCHAR_MAX	C◼uchar◼MAX
#define SHRT_MAX	C◼short◼MAX
#define LONG_MIN	C◼long◼MIN
#define ULLONG_MAX	C◼ullong◼MAX
#define CHAR_MIN	C◼char◼MIN
#define USHRT_MAX	C◼ushort◼MAX
#define LONG_MAX	C◼long◼MAX
