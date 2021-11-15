// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼sig

#pragma CMOD mimic <signal.h>

#pragma CMOD define DFL=SIG_DFL
#pragma CMOD define ERR=SIG_ERR
#pragma CMOD define IGN=SIG_IGN

#pragma CMOD defexp ABRT=SIGABRT
#pragma CMOD defexp FPE=SIGFPE
#pragma CMOD defexp ILL=SIGILL
#pragma CMOD defexp INT=SIGINT
#pragma CMOD defexp SEGV=SIGSEGV
#pragma CMOD defexp TERM=SIGTERM

#pragma CMOD alias signal
#pragma CMOD alias raise

#pragma CMOD typedef atomic=sig_atomic_t

#pragma CMOD declaration

void (*signal(int, void (*)(int)))(int);
int raise(int);
