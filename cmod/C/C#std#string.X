// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼string
#pragma CMOD import C◼str
#pragma CMOD import C◼mem
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

typedef C◼size	size_t;
#define NULL	C◼NULL

#define memchr	C◼mem◼chr
#define memcmp	C◼mem◼cmp
#define memcpy	C◼mem◼cpy
#define memmove	C◼mem◼move
#define memset	C◼mem◼set

#define strcat	C◼str◼cat
#define strchr	C◼str◼chr
#define strcmp	C◼str◼cmp
#define strcoll	C◼str◼coll
#define strcpy	C◼str◼cpy
#define strcspn	C◼str◼cspn
#define strlen	C◼str◼len
#define strncat	C◼str◼ncat
#define strncmp	C◼str◼ncmp
#define strncpy	C◼str◼ncpy
#define strpbrk	C◼str◼pbrk
#define strrchr	C◼str◼rchr
#define strspn	C◼str◼spn
#define strstr	C◼str◼str
#define strtok	C◼str◼tok
#define strerror	C◼errno◼tostr
#define strxfrm	C◼str◼xfrm
