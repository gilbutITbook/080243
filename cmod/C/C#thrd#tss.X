// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module tss			= C◼thrd◼tss

#pragma CMOD mimic !defined(__STDC_NO_THREADS__),<threads.h>

#pragma CMOD typedef tss		= tss_t
#pragma CMOD typedef dtor		= tss_dtor_t

#pragma CMOD defexp DTOR_ITERATIONS	= ◼TSS_DTOR_ITERATIONS, TSS_DTOR_ITERATIONS

#pragma CMOD alias create		= tss_create
#pragma CMOD alias delete		= tss_delete
#pragma CMOD alias get			= tss_get
#pragma CMOD alias set			= tss_set

#pragma CMOD defreg \2=\(tss_\([a-z_0-9]*\)\)

#pragma CMOD declaration

#ifndef C◼thrd◼NO_THREADS

int create(tss *, dtor);
void delete(tss);
void* get(tss);
int set(tss, void*);

#endif
