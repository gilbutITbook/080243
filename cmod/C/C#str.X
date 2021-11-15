// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼str

#pragma CMOD mimic <string.h>
#pragma CMOD mimic <stdlib.h>
#pragma CMOD mimic <wchar.h>
#pragma CMOD mimic <inttypes.h>

#pragma CMOD alias cat=strcat
#pragma CMOD alias chr=strchr
#pragma CMOD alias cmp=strcmp
#pragma CMOD alias coll=strcoll
#pragma CMOD alias cpy=strcpy
#pragma CMOD alias cspn=strcspn
#pragma CMOD alias toimax=strtoimax
#pragma CMOD alias len=strlen
#pragma CMOD alias ncat=strncat
#pragma CMOD alias ncmp=strncmp
#pragma CMOD alias ncpy=strncpy
#pragma CMOD alias pbrk=strpbrk
#pragma CMOD alias rchr=strrchr
#pragma CMOD alias spn=strspn
#pragma CMOD alias str=strstr
#pragma CMOD alias tod=strtod
#pragma CMOD alias tof=strtof
#pragma CMOD alias tok=strtok
#pragma CMOD alias tol=strtol
#pragma CMOD alias told=strtold
#pragma CMOD alias toll=strtoll
#pragma CMOD alias toul=strtoul
#pragma CMOD alias toull=strtoull
#pragma CMOD alias toumax=strtoumax
#pragma CMOD alias xfrm=strxfrm

#pragma CMOD alias wcscat
#pragma CMOD alias wcschr
#pragma CMOD alias wcscmp
#pragma CMOD alias wcscoll
#pragma CMOD alias wcscpy
#pragma CMOD alias wcscspn
#pragma CMOD alias wcslen
#pragma CMOD alias wcsncat
#pragma CMOD alias wcsncmp
#pragma CMOD alias wcsncpy
#pragma CMOD alias wcspbrk
#pragma CMOD alias wcsrchr
#pragma CMOD alias wcsspn
#pragma CMOD alias wcsstr
#pragma CMOD alias wcstod
#pragma CMOD alias wcstof
#pragma CMOD alias wcstok
#pragma CMOD alias wcstol
#pragma CMOD alias wcstold
#pragma CMOD alias wcstoll
#pragma CMOD alias wcstoul
#pragma CMOD alias wcstoimax
#pragma CMOD alias wcstoull
#pragma CMOD alias wcstoumax
#pragma CMOD alias wcsxfrm

#pragma CMOD declaration

double (tod)(char const*restrict, char**restrict);
float (tof)(char const* restrict, char**restrict);
long double (told)(char const*restrict , char**restrict);
long int (tol)(char const*restrict , char**restrict, int);
long long int (toll)(char const*restrict, char**restrict, int);
C◼intmax (toimax)(char const*restrict, char**restrict, int);
unsigned long int (toul)(char const*restrict, char**restrict, int);
unsigned long long int (toull)(char const*restrict, char**restrict, int);
C◼uintmax (toumax)(char const*restrict, char**restrict, int);

/* the only reason to use C◼charp here is a
   restriction of the parser */
C◼charp (cpy)(char* restrict, char const* restrict);
C◼charp (ncpy)(char* restrict, char const* restrict, C◼size);
C◼charp (cat)(char* restrict, char const* restrict);
C◼charp (ncat)(char* restrict, char const* restrict, C◼size);
int (cmp)(char const*, char const*);
int (coll)(char const*, char const*);
int (ncmp)(char const*, char const*, C◼size);
C◼size (xfrm)(char* restrict, char const* restrict, C◼size);
C◼charp (chr)(char const*, int);
C◼size (cspn)(char const*, char const*);
C◼charp (pbrk)(char const*, char const*);
C◼charp (rchr)(char const*, int);
C◼size (spn)(char const*, char const*);
C◼charp (str)(char const*, char const*);
C◼charp (tok)(char* restrict, char const* restrict);
C◼size (len)(char const*);

double wcstod(C◼wchar const*restrict, C◼wchar**restrict);
float wcstof(C◼wchar const*restrict, C◼wchar**restrict);
long double wcstold(C◼wchar const*restrict, C◼wchar**restrict);
long int wcstol(C◼wchar const*restrict,C◼wchar ** restrict, int);
long long int wcstoll(C◼wchar const*restrict,C◼wchar ** restrict, int);
C◼intmax wcstoimax(C◼wchar const*restrict,C◼wchar ** restrict, int);
unsigned long int wcstoul(C◼wchar const*restrict,C◼wchar ** restrict, int);
unsigned long long int wcstoull(C◼wchar const*restrict,C◼wchar ** restrict, int);
C◼uintmax wcstoumax(C◼wchar const*restrict,C◼wchar ** restrict, int);
C◼wchar* wcscpy(C◼wchar*restrict, C◼wchar const*restrict);
C◼wchar* wcsncpy(C◼wchar*restrict, C◼wchar const*restrict, C◼size);
C◼wchar* wcscat(C◼wchar*restrict, C◼wchar const*restrict);
C◼wchar* wcsncat(C◼wchar*restrict, C◼wchar const*restrict, C◼size);
int wcscmp(C◼wchar const*, C◼wchar const*);
int wcscoll(C◼wchar const*, C◼wchar const*);
int wcsncmp(C◼wchar const*, C◼wchar const*, C◼size);
C◼size wcsxfrm(C◼wchar*restrict, C◼wchar const*restrict, C◼size);
C◼wchar* wcschr(C◼wchar const*, C◼wchar);
C◼size wcscspn(C◼wchar const*, C◼wchar const*);
C◼wchar* wcspbrk(C◼wchar const*, C◼wchar const*);
C◼wchar* wcsrchr(C◼wchar const*, C◼wchar);
C◼size wcsspn(C◼wchar const*, C◼wchar const*);
C◼wchar* wcsstr(C◼wchar const*, C◼wchar const*);
C◼wchar* wcstok(C◼wchar*restrict, C◼wchar const*restrict, C◼wchar**restrict);
C◼size wcslen(C◼wchar const*);

#define cat(S, ...) _Generic((S)+0, char*: cat, C◼wchar*: wcscat)(S, __VA_ARGS__)
#define ncat(S, ...) _Generic((S)+0, char*: ncat, C◼wchar*: wcsncat)(S, __VA_ARGS__)
#define xfrm(S, ...) _Generic((S)+0, char*: xfrm, C◼wchar*: wcsxfrm)(S, __VA_ARGS__)
#define tok(S, ...) _Generic((S)+0, char*: tok, C◼wchar*: wcstok)(S, __VA_ARGS__)
#define cpy(S, ...) _Generic((S)+0, char*: cpy, C◼wchar*: wcscpy)(S, __VA_ARGS__)
#define ncpy(S, ...) _Generic((S)+0, char*: ncpy, C◼wchar*: wcsncpy)(S, __VA_ARGS__)

#define chr(S, ...) _Generic((S)+0, char const*: chr, char*: chr, C◼wchar const*: wcschr, C◼wchar*: wcschr)(S, __VA_ARGS__)
#define cmp(S, ...) _Generic((S)+0, char const*: cmp, char*: cmp, C◼wchar const*: wcscmp, C◼wchar*: wcscmp)(S, __VA_ARGS__)
#define coll(S, ...) _Generic((S)+0, char const*: coll, char*: coll, C◼wchar const*: wcscoll, C◼wchar*: wcscoll)(S, __VA_ARGS__)
#define cspn(S, ...) _Generic((S)+0, char const*: cspn, char*: cspn, C◼wchar const*: wcscspn, C◼wchar*: wcscspn)(S, __VA_ARGS__)
#define len(S) _Generic((S)+0, char const*: len, char*: len, C◼wchar const*: wcslen, C◼wchar*: wcslen)(S)
#define ncmp(S, ...) _Generic((S)+0, char const*: ncmp, char*: ncmp, C◼wchar const*: wcsncmp, C◼wchar*: wcsncmp)(S, __VA_ARGS__)
#define pbrk(S, ...) _Generic((S)+0, char const*: pbrk, char*: pbrk, C◼wchar const*: wcspbrk, C◼wchar*: wcspbrk)(S, __VA_ARGS__)
#define rchr(S, ...) _Generic((S)+0, char const*: rchr, char*: rchr, C◼wchar const*: wcsrchr, C◼wchar*: wcsrchr)(S, __VA_ARGS__)
#define spn(S, ...) _Generic((S)+0, char const*: spn, char*: spn, C◼wchar const*: wcsspn, C◼wchar*: wcsspn)(S, __VA_ARGS__)
#define str(S, ...) _Generic((S)+0, char const*: str, char*: str, C◼wchar const*: wcsstr, C◼wchar*: wcsstr)(S, __VA_ARGS__)
#define tod(S, ...) _Generic((S)+0, char const*: tod, char*: tod, C◼wchar const*: wcstod, C◼wchar*: wcstod)(S, __VA_ARGS__)
#define tof(S, ...) _Generic((S)+0, char const*: tof, char*: tof, C◼wchar const*: wcstof, C◼wchar*: wcstof)(S, __VA_ARGS__)
#define tol(S, ...) _Generic((S)+0, char const*: tol, char*: tol, C◼wchar const*: wcstol, C◼wchar*: wcstol)(S, __VA_ARGS__)
#define told(S, ...) _Generic((S)+0, char const*: told, char*: told, C◼wchar const*: wcstold, C◼wchar*: wcstold)(S, __VA_ARGS__)
#define toll(S, ...) _Generic((S)+0, char const*: toll, char*: toll, C◼wchar const*: wcstoll, C◼wchar*: wcstoll)(S, __VA_ARGS__)
#define toimax(S, ...) _Generic((S)+0, char const*: toimax, char*: toimax, C◼wchar const*: wcstoimax, C◼wchar*: wcstoimax)(S, __VA_ARGS__)
#define toul(S, ...) _Generic((S)+0, char const*: toul, char*: toul, C◼wchar const*: wcstoul, C◼wchar*: wcstoul)(S, __VA_ARGS__)
#define toull(S, ...) _Generic((S)+0, char const*: toull, char*: toull, C◼wchar const*: wcstoull, C◼wchar*: wcstoull)(S, __VA_ARGS__)
#define toumax(S, ...) _Generic((S)+0, char const*: toumax, char*: toumax, C◼wchar const*: wcstoumax, C◼wchar*: wcstoumax)(S, __VA_ARGS__)
