// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼errno
#pragma CMOD import C◼errno

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define errno	C◼errno
#define EDOM	C◼errno◼DOM
#define EILSEQ	C◼errno◼ILSEQ
#define ERANGE	C◼errno◼RANGE
