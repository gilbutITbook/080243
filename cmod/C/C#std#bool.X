// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼bool
#pragma CMOD import C◼bool

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define bool				C◼bool
#define false				C◼bool◼false
#define true				C◼bool◼true
#define __true_false_are_defined	C◼bool◼true_false_are_defined
