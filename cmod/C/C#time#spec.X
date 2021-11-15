// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module spec			=	C◼time◼spec
#pragma CMOD import time			=	C◼time
#pragma CMOD import					C◼int
#pragma CMOD import					C◼long
#pragma CMOD import					C◼align
#pragma CMOD import llong			=	C◼llong
#pragma CMOD import def				=	C◼def


#pragma CMOD mimic <time.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp TIMESPEC_SIZE		=	sizeof(struct timespec)
#pragma CMOD defexp TIMESPEC_ALIGN		=	alignof(struct timespec)
#pragma CMOD defexp TIMESPEC_SEC_OFFSET		=	offsetof(struct timespec, tv_sec)
#pragma CMOD defexp TIMESPEC_NSEC_OFFSET	=	offsetof(struct timespec, tv_nsec)

#pragma CMOD alias get				=	timespec_get

#pragma CMOD declaration

int get(spec, int);

/* timespec is usually not so easy to guess, so we may just emulate
   it. */
struct spec {
       union {
         char _invisible0[TIMESPEC_SIZE];
#if TIMESPEC_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif TIMESPEC_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif TIMESPEC_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
         struct {
#if TIMESPEC_SEC_OFFSET > 0
           char _invisible_tv_sec[TIMESPEC_SEC_OFFSET];
#endif
           time tv_sec;
         };
         struct {
#if TIMESPEC_NSEC_OFFSET > 0
           char _invisible_tv_nsec[TIMESPEC_NSEC_OFFSET];
#endif
           long tv_nsec;
         };
       };
};

_STATIC_ASSERT(TIMESPEC_SIZE == sizeof(spec), "import of struct tm to C◼time◼spec failed");
_STATIC_ASSERT(TIMESPEC_ALIGN == alignof(spec), "import of struct tm to C◼time◼spec failed");
_STATIC_ASSERT(TIMESPEC_SEC_OFFSET == offsetof(spec, tv_sec), "import of struct tm to C◼time◼spec failed");
_STATIC_ASSERT(TIMESPEC_NSEC_OFFSET == offsetof(spec, tv_nsec), "import of struct tm to C◼time◼spec failed");

