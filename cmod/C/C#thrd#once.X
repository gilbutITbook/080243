// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module once = C◼thrd◼once


#pragma CMOD mimic !defined(__STDC_NO_THREADS__),<threads.h>

#pragma CMOD typedef once=once_flag

#pragma CMOD define INIT=ONCE_FLAG_INIT

#pragma CMOD alias call=call_once
#pragma CMOD define call=call_once

#pragma CMOD declaration

#ifndef C◼thrd◼NO_THREADS

void (call)(once*, void (*)(void));


#endif
