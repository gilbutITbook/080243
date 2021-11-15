// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module 		p11◼str
#pragma CMOD import str		= C◼str
#pragma CMOD import mem		= C◼mem
#pragma CMOD import malloc	= C◼lib◼malloc

#pragma CMOD import STRTOLL   = p11◼DEFARG
#pragma CMOD fill STRTOLL◼func= C◼str◼toll
#pragma CMOD fill STRTOLL◼FUNC= toll
#pragma CMOD fill STRTOLL◼DEFS= p11◼strtoll◼INT_DEF

#pragma CMOD import STRTOL   = p11◼DEFARG
#pragma CMOD fill STRTOL◼func= C◼str◼tol
#pragma CMOD fill STRTOL◼FUNC= tol
#pragma CMOD fill STRTOL◼DEFS= p11◼strtoll◼INT_DEF

#pragma CMOD import STRTOULL   = p11◼DEFARG
#pragma CMOD fill STRTOULL◼func= C◼str◼toull
#pragma CMOD fill STRTOULL◼FUNC= toull
#pragma CMOD fill STRTOULL◼DEFS= p11◼str◼INT_DEF

#pragma CMOD import STRTOUL   = p11◼DEFARG
#pragma CMOD fill STRTOUL◼func= C◼str◼toul
#pragma CMOD fill STRTOUL◼FUNC= toul
#pragma CMOD fill STRTOUL◼DEFS= p11◼str◼INT_DEF

#pragma CMOD import STRTOUMAX   = p11◼DEFARG
#pragma CMOD fill STRTOUMAX◼func= C◼str◼toumax
#pragma CMOD fill STRTOUMAX◼FUNC= toumax
#pragma CMOD fill STRTOUMAX◼DEFS= p11◼str◼INT_DEF

#pragma CMOD import STRTOIMAX   = p11◼DEFARG
#pragma CMOD fill STRTOIMAX◼func= C◼str◼toimax
#pragma CMOD fill STRTOIMAX◼FUNC= toimax
#pragma CMOD fill STRTOIMAX◼DEFS= p11◼str◼INT_DEF

#pragma CMOD import STRTOLD   = p11◼DEFARG
#pragma CMOD fill STRTOLD◼func= C◼str◼told
#pragma CMOD fill STRTOLD◼FUNC= told
#pragma CMOD fill STRTOLD◼DEFS= p11◼str◼FLOAT_DEF

#pragma CMOD import STRTOD   = p11◼DEFARG
#pragma CMOD fill STRTOD◼func= C◼str◼tod
#pragma CMOD fill STRTOD◼FUNC= tod
#pragma CMOD fill STRTOD◼DEFS= p11◼str◼FLOAT_DEF

#pragma CMOD import STRTOF   = p11◼DEFARG
#pragma CMOD fill STRTOF◼func= C◼str◼tof
#pragma CMOD fill STRTOF◼FUNC= tof
#pragma CMOD fill STRTOF◼DEFS= p11◼str◼FLOAT_DEF

#pragma CMOD declaration

#define INT_DEF , 0, 0
#define FLOAT_DEF , 0

inline
char* dup(char const* s) {
  C◼size len = str◼len(s);
  char* ret = malloc(len+1);
  return ret ? mem◼cpy(ret, s, len+1) : 0;
}


#pragma CMOD definition

unsigned long long test0(void) {
  return toull("0890", 0, 2);
  return toull("0890",  , 3);
  return toull("0890", 0,  );
  return toull("0890", 0   );
  return toull("0890"      );
  return 0;
}
