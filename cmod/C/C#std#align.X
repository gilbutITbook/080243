// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼align
#pragma CMOD import C◼align

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define alignas			C◼align◼as
#define alignof			C◼align◼of
#define __alignas_is_defined	C◼align◼as_is_defined
#define __alignof_is_defined	C◼align◼of_is_defined
