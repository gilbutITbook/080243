// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼signal
#pragma CMOD import C◼sig

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

typedef C◼sig◼atomic sig_atomic_t;

#define SIGABRT	C◼sig◼ABRT
#define SIGFPE	C◼sig◼FPE
#define SIGILL	C◼sig◼ILL
#define SIGINT	C◼sig◼INT
#define SIGSEGV	C◼sig◼SEGV
#define SIGTERM	C◼sig◼TERM
#define SIG_DFL	C◼sig◼DFL
#define SIG_ERR	C◼sig◼ERR
#define SIG_IGN	C◼sig◼IGN

#define signal	C◼sig◼signal
#define raise	C◼sig◼raise
