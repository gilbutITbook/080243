// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module ID10 = p11◼ID10
#pragma CMOD import IF = p11◼IF

#pragma CMOD declaration

#define CASE_0 ,
#define CASE_1 ,
#define CASE_2 ,
#define CASE_3 ,
#define CASE_4 ,
#define CASE_5 ,
#define CASE_6 ,
#define CASE_7 ,
#define CASE_8 ,
#define CASE_9 ,

#define E(N, M, A) IF(N, M, A ## 0 ## N ## E, A ## N ## E)
#define ID10(N, A) E(N, MODULE_PREFIX(6CASE_), A)

#pragma CMOD definition
