// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module locale		=	C◼locale
#pragma CMOD import 				C◼align
#pragma CMOD import 				C◼int
#pragma CMOD import 				C◼long
#pragma CMOD import 				C◼def
#pragma CMOD import llong 		=	C◼llong
#pragma CMOD import lib			=	C◼lib
#pragma CMOD import str			=	C◼str
#pragma CMOD import mem			=	C◼mem

#pragma CMOD mimic <locale.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD init init
#pragma CMOD atexit atexit
#pragma CMOD at_quick_exit atexit

#pragma CMOD defreg \2=\(LC_\([a-zA-Z_0-9]*\)\)

#pragma CMOD defexp C			=	setlocale(LC_ALL, 0)


#pragma CMOD defexp LCONV_SIZE		=	sizeof(struct lconv)
#pragma CMOD defexp LCONV_ALIGN		=	alignof(struct lconv)

#pragma CMOD defexp LCONV_decimal_point		=	offsetof(struct lconv, decimal_point)
#pragma CMOD defexp LCONV_thousands_sep		=	offsetof(struct lconv, thousands_sep)
#pragma CMOD defexp LCONV_grouping		=	offsetof(struct lconv, grouping)
#pragma CMOD defexp LCONV_mon_decimal_point	=	offsetof(struct lconv, mon_decimal_point)
#pragma CMOD defexp LCONV_mon_thousands_sep	=	offsetof(struct lconv, mon_thousands_sep)
#pragma CMOD defexp LCONV_mon_grouping		=	offsetof(struct lconv, mon_grouping)
#pragma CMOD defexp LCONV_positive_sign		=	offsetof(struct lconv, positive_sign)
#pragma CMOD defexp LCONV_negative_sign		=	offsetof(struct lconv, negative_sign)
#pragma CMOD defexp LCONV_currency_symbol	=	offsetof(struct lconv, currency_symbol)
#pragma CMOD defexp LCONV_frac_digits		=	offsetof(struct lconv, frac_digits)
#pragma CMOD defexp LCONV_p_cs_precedes		=	offsetof(struct lconv, p_cs_precedes)
#pragma CMOD defexp LCONV_n_cs_precedes		=	offsetof(struct lconv, n_cs_precedes)
#pragma CMOD defexp LCONV_p_sep_by_space	=	offsetof(struct lconv, p_sep_by_space)
#pragma CMOD defexp LCONV_n_sep_by_space	=	offsetof(struct lconv, n_sep_by_space)
#pragma CMOD defexp LCONV_p_sign_posn		=	offsetof(struct lconv, p_sign_posn)
#pragma CMOD defexp LCONV_n_sign_posn		=	offsetof(struct lconv, n_sign_posn)
#pragma CMOD defexp LCONV_int_curr_symbol	=	offsetof(struct lconv, int_curr_symbol)
#pragma CMOD defexp LCONV_int_frac_digits	=	offsetof(struct lconv, int_frac_digits)
#pragma CMOD defexp LCONV_int_p_cs_precedes	=	offsetof(struct lconv, int_p_cs_precedes)
#pragma CMOD defexp LCONV_int_n_cs_precedes	=	offsetof(struct lconv, int_n_cs_precedes)
#pragma CMOD defexp LCONV_int_p_sep_by_space	=	offsetof(struct lconv, int_p_sep_by_space)
#pragma CMOD defexp LCONV_int_n_sep_by_space	=	offsetof(struct lconv, int_n_sep_by_space)
#pragma CMOD defexp LCONV_int_p_sign_posn	=	offsetof(struct lconv, int_p_sign_posn)
#pragma CMOD defexp LCONV_int_n_sign_posn	=	offsetof(struct lconv, int_n_sign_posn)


#pragma CMOD alias set		=	setlocale
#pragma CMOD alias conv		=	localeconv

#pragma CMOD declaration

char* set(int, char const*);
locale* conv(void);


struct locale {
  union {
    char _invisible0[LCONV_SIZE];
#if LCONV_ALIGN == C◼int◼ALIGN
    int _invisible1;
#elif LCONV_ALIGN == C◼long◼ALIGN
    long _invisible2;
#elif LCONV_ALIGN == C◼llong◼ALIGN
    long long _invisible3;
#endif
    struct {
#if LCONV_decimal_point > 0
      char _invisible_decimal_point[LCONV_decimal_point];
#endif
      char* decimal_point;
    };
    struct {
#if LCONV_thousands_sep > 0
      char _invisible_thousands_sep[LCONV_thousands_sep];
#endif
      char* thousands_sep;
    };
    struct {
#if LCONV_grouping > 0
      char _invisible_grouping[LCONV_grouping];
#endif
      char* grouping;
    };
    struct {
#if LCONV_mon_decimal_point > 0
      char _invisible_mon_decimal_point[LCONV_mon_decimal_point];
#endif
      char* mon_decimal_point;
    };
    struct {
#if LCONV_mon_thousands_sep > 0
      char _invisible_mon_thousands_sep[LCONV_mon_thousands_sep];
#endif
      char* mon_thousands_sep;
    };
    struct {
#if LCONV_mon_grouping > 0
      char _invisible_mon_grouping[LCONV_mon_grouping];
#endif
      char* mon_grouping;
    };
    struct {
#if LCONV_positive_sign > 0
      char _invisible_positive_sign[LCONV_positive_sign];
#endif
      char* positive_sign;
    };
    struct {
#if LCONV_negative_sign > 0
      char _invisible_negative_sign[LCONV_negative_sign];
#endif
      char* negative_sign;
    };
    struct {
#if LCONV_currency_symbol > 0
      char _invisible_currency_symbol[LCONV_currency_symbol];
#endif
      char* currency_symbol;
    };
    struct {
#if LCONV_frac_digits > 0
      char _invisible_frac_digits[LCONV_frac_digits];
#endif
      char frac_digits;
    };
    struct {
#if LCONV_p_cs_precedes > 0
      char _invisible_p_cs_precedes[LCONV_p_cs_precedes];
#endif
      char p_cs_precedes;
    };
    struct {
#if LCONV_n_cs_precedes > 0
      char _invisible_n_cs_precedes[LCONV_n_cs_precedes];
#endif
      char n_cs_precedes;
    };
    struct {
#if LCONV_p_sep_by_space > 0
      char _invisible_p_sep_by_space[LCONV_p_sep_by_space];
#endif
      char p_sep_by_space;
    };
    struct {
#if LCONV_n_sep_by_space > 0
      char _invisible_n_sep_by_space[LCONV_n_sep_by_space];
#endif
      char n_sep_by_space;
    };
    struct {
#if LCONV_p_sign_posn > 0
      char _invisible_p_sign_posn[LCONV_p_sign_posn];
#endif
      char p_sign_posn;
    };
    struct {
#if LCONV_n_sign_posn > 0
      char _invisible_n_sign_posn[LCONV_n_sign_posn];
#endif
      char n_sign_posn;
    };
    struct {
#if LCONV_int_curr_symbol > 0
      char _invisible_int_curr_symbol[LCONV_int_curr_symbol];
#endif
      char* int_curr_symbol;
    };
    struct {
#if LCONV_int_frac_digits > 0
      char _invisible_int_frac_digits[LCONV_int_frac_digits];
#endif
      char int_frac_digits;
    };
    struct {
#if LCONV_int_p_cs_precedes > 0
      char _invisible_int_p_cs_precedes[LCONV_int_p_cs_precedes];
#endif
      char int_p_cs_precedes;
    };
    struct {
#if LCONV_int_n_cs_precedes > 0
      char _invisible_int_n_cs_precedes[LCONV_int_n_cs_precedes];
#endif
      char int_n_cs_precedes;
    };
    struct {
#if LCONV_int_p_sep_by_space > 0
      char _invisible_int_p_sep_by_space[LCONV_int_p_sep_by_space];
#endif
      char int_p_sep_by_space;
    };
    struct {
#if LCONV_int_n_sep_by_space > 0
      char _invisible_int_n_sep_by_space[LCONV_int_n_sep_by_space];
#endif
      char int_n_sep_by_space;
    };
    struct {
#if LCONV_int_p_sign_posn > 0
      char _invisible_int_p_sign_posn[LCONV_int_p_sign_posn];
#endif
      char int_p_sign_posn;
    };
    struct {
#if LCONV_int_n_sign_posn > 0
      char _invisible_int_n_sign_posn[LCONV_int_n_sign_posn];
#endif
      char int_n_sign_posn;
    };
  };
};

_STATIC_ASSERT(LCONV_SIZE == sizeof(locale), "import of struct lconf to C◼locale failed");
_STATIC_ASSERT(LCONV_ALIGN == alignof(locale), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_decimal_point == offsetof(locale, decimal_point), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_thousands_sep == offsetof(locale, thousands_sep), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_grouping == offsetof(locale, grouping), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_mon_decimal_point == offsetof(locale, mon_decimal_point), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_mon_thousands_sep == offsetof(locale, mon_thousands_sep), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_mon_grouping == offsetof(locale, mon_grouping), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_positive_sign == offsetof(locale, positive_sign), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_negative_sign == offsetof(locale, negative_sign), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_currency_symbol == offsetof(locale, currency_symbol), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_frac_digits == offsetof(locale, frac_digits), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_p_cs_precedes == offsetof(locale, p_cs_precedes), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_n_cs_precedes == offsetof(locale, n_cs_precedes), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_p_sep_by_space == offsetof(locale, p_sep_by_space), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_n_sep_by_space == offsetof(locale, n_sep_by_space), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_p_sign_posn == offsetof(locale, p_sign_posn), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_n_sign_posn == offsetof(locale, n_sign_posn), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_curr_symbol == offsetof(locale, int_curr_symbol), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_frac_digits == offsetof(locale, int_frac_digits), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_p_cs_precedes == offsetof(locale, int_p_cs_precedes), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_n_cs_precedes == offsetof(locale, int_n_cs_precedes), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_p_sep_by_space == offsetof(locale, int_p_sep_by_space), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_n_sep_by_space == offsetof(locale, int_n_sep_by_space), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_p_sign_posn == offsetof(locale, int_p_sign_posn), "import of struct lconv to C◼locale failed");
_STATIC_ASSERT(LCONV_int_n_sign_posn == offsetof(locale, int_n_sign_posn), "import of struct lconv to C◼locale failed");

/* The following five lines define an alias that is exported from this
   module with a slightly different name and type than defined. The
   idea is that the variable _def receives a string (with the native
   locale) during initialization time, but that this variable should
   not be visible as modifiable by importers*/
/**
 ** @brief the identifier of the native locale
 **
 ** This is initialized at module startup and will not change through
 ** the whole execution.
 **
 ** @see C◼locale◼C
 **/
extern char const*const def;
#pragma CMOD definition
#pragma CMOD alias def_=C◼locale◼def
static char const* def_ = 0;

void init(void) {
  char* backup = set(ALL, "");
  char* found = set(ALL, 0);
  if (found) {
    C◼size len = str◼len(found)+1;
    def_ = mem◼cpy(lib◼malloc(len), found, len);
  }
  set(ALL, backup);
}

void atexit(void) {
  lib◼free((void*)def_);
  def_ = 0;
}
