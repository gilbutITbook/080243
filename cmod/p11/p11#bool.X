// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module here = p11◼bool

#pragma CMOD import ENUM    = p11◼ENUM
#pragma CMOD fill ENUM◼LIST = p11◼bool◼NAMES
#pragma CMOD fill ENUM◼T    = here

/**
 ** @file
 **
 ** @brief provide a simple interface for using @c bool names
 **/

#pragma CMOD declaration

/* Unfortunately it seems that this macro can't just use the local
   name NAMES for the moment. The constants, here, are local and will
   just remain as such. */
#define here◼NAMES false, true

/**
 ** @brief this is just a dummy type such that we may produce the
 ** functions.
 **/
enum here {
  false, true,
};
