// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼fenv◼round

#pragma CMOD mimic			<fenv.h>

#pragma CMOD alias get	= fegetround
#pragma CMOD alias set	= fesetround


#pragma CMOD declaration

int get(void);
int set(int);
