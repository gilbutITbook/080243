// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼char

#pragma CMOD mimic <ctype.h>
#pragma CMOD mimic <limits.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp SIZE=sizeof(char)
#pragma CMOD defexp MAX=CHAR_MAX
#pragma CMOD defexp MIN=CHAR_MIN
#pragma CMOD defexp ALIGN=alignof(char)
#pragma CMOD defexp RANK=RANK((char)+0)

#pragma CMOD defexp HT='\t'



#pragma CMOD defreg \2=\(is\([a-z0-9]*\)\)
#pragma CMOD defreg \1=\(to\([a-z0-9]*\)\)

#pragma CMOD alias alnum=isalnum
#pragma CMOD alias alpha=isalpha
#pragma CMOD alias blank=isblank
#pragma CMOD alias cntrl=iscntrl
#pragma CMOD alias digit=isdigit
#pragma CMOD alias graph=isgraph
#pragma CMOD alias lower=islower
#pragma CMOD alias print=isprint
#pragma CMOD alias punct=ispunct
#pragma CMOD alias space=isspace
#pragma CMOD alias upper=isupper
#pragma CMOD alias xdigit=isxdigit
#pragma CMOD alias tolower
#pragma CMOD alias toupper


#pragma CMOD declaration

#define WIDTH C◼CHAR_WIDTH
typedef char C◼char;

int (alnum)(int c);
int (alpha)(int c);
int (blank)(int c);
int (cntrl)(int c);
int (digit)(int c);
int (graph)(int c);
int (lower)(int c);
int (print)(int c);
int (punct)(int c);
int (space)(int c);
int (upper)(int c);
int (xdigit)(int c);
int (tolower)(int c);
int (toupper)(int c);

/* map the glibc implementation */

#pragma CMOD define __isctype
#pragma CMOD alias __isctype
#pragma CMOD alias __ctype_b_loc
#pragma CMOD alias __ctype_tolower_loc
#pragma CMOD alias __ctype_toupper_loc

#pragma CMOD typedef __int32_t

#pragma CMOD defexp _ISupper=◼_ISupper
#pragma CMOD defexp _ISlower=◼_ISlower
#pragma CMOD defexp _ISalpha=◼_ISalpha
#pragma CMOD defexp _ISdigit=◼_ISdigit
#pragma CMOD defexp _ISxdigit=◼_ISxdigit
#pragma CMOD defexp _ISspace=◼_ISspace
#pragma CMOD defexp _ISprint=◼_ISprint
#pragma CMOD defexp _ISgraph=◼_ISgraph
#pragma CMOD defexp _ISblank=◼_ISblank
#pragma CMOD defexp _IScntrl=◼_IScntrl
#pragma CMOD defexp _ISpunct=◼_ISpunct
#pragma CMOD defexp _ISalnum=◼_ISalnum

#ifdef __GLIBC__
extern const unsigned short int **__ctype_b_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
#endif

/* musl */

#define  __isspace(a)  __extension__ ({ unsigned _c = (a);  _c == ' ' || _c-'\t' < 5; })
