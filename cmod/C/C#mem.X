// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼mem
#pragma CMOD import C◼def

#pragma CMOD mimic <string.h>
#pragma CMOD mimic <wchar.h>

#pragma CMOD alias chr=memchr
#pragma CMOD alias cmp=memcmp
#pragma CMOD alias cpy=memcpy
#pragma CMOD alias move=memmove
#pragma CMOD alias set=memset

#pragma CMOD alias wchr=wmemchr
#pragma CMOD alias wcmp=wmemcmp
#pragma CMOD alias wcpy=wmemcpy
#pragma CMOD alias wmove=wmemmove
#pragma CMOD alias wset=wmemset

#pragma CMOD declaration

void* cpy(void* restrict, const void* restrict, size);
void* move(void*, const void*, size);
int cmp(const void*, const void*, size);
void* chr(const void*, int, size);
void* set(void*, int, size);

wchar* wcpy(wchar*restrict, wchar const*restrict, size);
wchar* wmove(wchar*, wchar const*, size);
int wcmp(wchar const*, wchar const*, size);
wchar* wchr(wchar const*, wchar, size);
wchar* wset(wchar*, wchar, size);
