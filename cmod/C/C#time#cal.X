// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module cool	=	C◼time◼cal
#pragma CMOD import 			C◼time
#pragma CMOD import 			C◼int
#pragma CMOD import 			C◼long
#pragma CMOD import 			C◼def
#pragma CMOD import 			C◼align
#pragma CMOD import 		=	C◼llong


#pragma CMOD mimic <time.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD defexp TM_SIZE		=	sizeof(struct tm)
#pragma CMOD defexp TM_ALIGN		=	alignof(struct tm)
#pragma CMOD defexp TM_SEC_OFFSET	=	offsetof(struct tm, tm_sec)
#pragma CMOD defexp TM_MIN_OFFSET	=	offsetof(struct tm, tm_min)
#pragma CMOD defexp TM_HOUR_OFFSET	=	offsetof(struct tm, tm_hour)
#pragma CMOD defexp TM_MDAY_OFFSET	=	offsetof(struct tm, tm_mday)
#pragma CMOD defexp TM_MON_OFFSET	=	offsetof(struct tm, tm_mon)
#pragma CMOD defexp TM_YEAR_OFFSET	=	offsetof(struct tm, tm_year)
#pragma CMOD defexp TM_WDAY_OFFSET	=	offsetof(struct tm, tm_wday)
#pragma CMOD defexp TM_YDAY_OFFSET	=	offsetof(struct tm, tm_yday)
#pragma CMOD defexp TM_ISDST_OFFSET	=	offsetof(struct tm, tm_isdst)

#pragma CMOD alias 				mktime
#pragma CMOD alias format		=	strftime
#pragma CMOD alias tostr		=	asctime


#pragma CMOD declaration

C◼time mktime(cool*);
char* tostr(const cool*);
C◼size format(char*restrict, C◼size, const char*restrict, const cool*restrict);

struct cool {
       union {
         char _invisible0[TM_SIZE];
#if TM_ALIGN == C◼int◼ALIGN
         int _invisible1;
#elif TM_ALIGN == C◼long◼ALIGN
         long _invisible2;
#elif TM_ALIGN == C◼llong◼ALIGN
         long long _invisible3;
#endif
         struct {
#if TM_SEC_OFFSET > 0
           char _invisible_tm_sec[TM_SEC_OFFSET];
#endif
           int tm_sec;
         };
         struct {
#if TM_MIN_OFFSET > 0
           char _invisible_tm_min[TM_MIN_OFFSET];
#endif
           int tm_min;
         };
         struct {
#if TM_HOUR_OFFSET > 0
           char _invisible_tm_hour[TM_HOUR_OFFSET];
#endif
           int tm_hour;
         };
         struct {
#if TM_MDAY_OFFSET > 0
           char _invisible_tm_mday[TM_MDAY_OFFSET];
#endif
           int tm_mday;
         };
         struct {
#if TM_MON_OFFSET > 0
           char _invisible_tm_mon[TM_MON_OFFSET];
#endif
           int tm_mon;
         };
         struct {
#if TM_YEAR_OFFSET > 0
           char _invisible_tm_year[TM_YEAR_OFFSET];
#endif
           int tm_year;
         };
         struct {
#if TM_WDAY_OFFSET > 0
           char _invisible_tm_wday[TM_WDAY_OFFSET];
#endif
           int tm_wday;
         };
         struct {
#if TM_YDAY_OFFSET > 0
           char _invisible_tm_yday[TM_YDAY_OFFSET];
#endif
           int tm_yday;
         };
         struct {
#if TM_ISDST_OFFSET > 0
           char _invisible_tm_isdst[TM_ISDST_OFFSET];
#endif
           int tm_isdst;
         };
       };
};

_STATIC_ASSERT(TM_SIZE == sizeof(cool), "import of struct tm to C◼time◼spec failed");
_STATIC_ASSERT(TM_ALIGN == alignof(cool), "import of struct tm to C◼time◼spec failed");
_STATIC_ASSERT(TM_SEC_OFFSET == offsetof(cool, tm_sec), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_MIN_OFFSET == offsetof(cool, tm_min), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_HOUR_OFFSET == offsetof(cool, tm_hour), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_MDAY_OFFSET == offsetof(cool, tm_mday), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_MON_OFFSET == offsetof(cool, tm_mon), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_YEAR_OFFSET == offsetof(cool, tm_year), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_WDAY_OFFSET == offsetof(cool, tm_wday), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_YDAY_OFFSET == offsetof(cool, tm_yday), "import of struct tm to C◼time◼cal failed");
_STATIC_ASSERT(TM_ISDST_OFFSET == offsetof(cool, tm_isdst), "import of struct tm to C◼time◼cal failed");

