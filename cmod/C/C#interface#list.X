// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼interface◼list

#pragma CMOD snippet none
#pragma CMOD slot T		= complete
#pragma CMOD slot instance	= complete

#pragma CMOD definition

inline T top(instance* l);
inline instance* push(instance* l, T data);
inline instance* drop(instance* l);
inline instance* next(instance* l);
