// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module time	=	C◼time

#pragma CMOD mimic <time.h>

#pragma CMOD alias get=time
#pragma CMOD alias diff=difftime
#pragma CMOD alias tostr=ctime
#pragma CMOD alias local=localtime
#pragma CMOD alias gm=gmtime

#pragma CMOD typedef time=time_t

#pragma CMOD declaration

/* Forward declarations of struct that are declared in submodules. */
typedef struct cal cal;
typedef struct spec spec;

time get(time*);
double diff(time, time);
cal* local(const time*);
cal* gm(const time*);
char* tostr(const time*);
