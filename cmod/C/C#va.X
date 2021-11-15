// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module va	=	C◼va

#pragma CMOD mimic <stdarg.h>

#pragma CMOD defreg \2=\(va_\([a-z_0-9]*\)\)

#pragma CMOD alias end=va_end
#pragma CMOD alias copy=va_copy

#pragma CMOD typedef va=va_list

/* glibc needs this */
#pragma CMOD typedef __gnuc_va_list

#pragma CMOD declaration

/* These two may be external symbols. */
void (copy)(va dest, va src);
void (end)(va ap);
