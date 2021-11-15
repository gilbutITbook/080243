// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module getopt 	= p11◼getopt
#pragma CMOD import               C◼char
#pragma CMOD import str    	= C◼str
#pragma CMOD import mem    	= C◼mem
#pragma CMOD import bool    	= C◼bool
#pragma CMOD import io    	= C◼io
#pragma CMOD import lib    	= C◼lib
#pragma CMOD import math    	= C◼math
#pragma CMOD import mod    	= C◼mod
#pragma CMOD import locale    	= C◼locale
#pragma CMOD import Bool   	= p11◼impl◼getopt◼bool
#pragma CMOD import charp   	= p11◼impl◼getopt◼charp
#pragma CMOD import Char   	= p11◼impl◼getopt◼char
#pragma CMOD import schar   	= p11◼impl◼getopt◼schar
#pragma CMOD import Short   	= p11◼impl◼getopt◼short
#pragma CMOD import sc   	= p11◼impl◼getopt◼shortcut
#pragma CMOD import Signed   	= p11◼impl◼getopt◼signed
#pragma CMOD import Long   	= p11◼impl◼getopt◼long
#pragma CMOD import llong   	= p11◼impl◼getopt◼llong
#pragma CMOD import uchar   	= p11◼impl◼getopt◼uchar
#pragma CMOD import ushort   	= p11◼impl◼getopt◼ushort
#pragma CMOD import Unsigned   	= p11◼impl◼getopt◼unsigned
#pragma CMOD import ulong   	= p11◼impl◼getopt◼ulong
#pragma CMOD import ullong   	= p11◼impl◼getopt◼ullong
#pragma CMOD import Float   	= p11◼impl◼getopt◼float
#pragma CMOD import Double   	= p11◼impl◼getopt◼double
#pragma CMOD import ldouble   	= p11◼impl◼getopt◼ldouble
#pragma CMOD import               p11◼str
#pragma CMOD declaration


typedef int process_type(void*, char const*);
typedef int snprintf_type(char*, C◼size, void*);


struct getopt {
  void*const o;
  char c;
  process_type*const f;
  snprintf_type*const p;
  char const*const a;
  char const*const d;
  char const*const n;
  char const*const t;
  getopt const* next;
};

#define CHAR2(L, C) _ ## L ## _p11_getopt_ ## C
#define CHAR1(...) CHAR2(__VA_ARGS__)
#define CHAR(C) CHAR1(__LINE__, C)

#define DECLARE(C, NAME, ALIAS, DOC)                            \
  static getopt CHAR(NAME) = {                                  \
    .c = (C),                                                   \
    .o =  &(NAME),                                              \
    .f = _Generic(&NAME,                                        \
                    default: 0,                                 \
                    char**: charp◼process,                      \
                    char const**: charp◼process,                \
                    char*: Char◼process,                        \
                    _Bool*: Bool◼process,                       \
                    signed char*: schar◼process,                \
                    short*: Short◼process,                      \
                    signed*: Signed◼process,                    \
                    long*: Long◼process,                        \
                    long long*: llong◼process,                  \
                    unsigned char*: uchar◼process,              \
                    unsigned short*: ushort◼process,            \
                    unsigned*: Unsigned◼process,                \
                    unsigned long*: ulong◼process,              \
                    unsigned long long*: ullong◼process,        \
                    float*: Float◼process,                      \
                    double*: Double◼process,                    \
                    long double*: ldouble◼process               \
                    ),                                          \
    .p = _Generic(&NAME,                                        \
                    default: 0,                                 \
                    char**: charp◼snprintf,                     \
                    char const**: charp◼snprintf,               \
                    char*: Char◼snprintf,                       \
                    _Bool*: Bool◼snprintf,                      \
                    signed char*: schar◼snprintf,               \
                    short*: Short◼snprintf,                     \
                    signed*: Signed◼snprintf,                   \
                    long*: Long◼snprintf,                       \
                    long long*: llong◼snprintf,                 \
                    unsigned char*: uchar◼snprintf,             \
                    unsigned short*: ushort◼snprintf,           \
                    unsigned*: Unsigned◼snprintf,               \
                    unsigned long*: ulong◼snprintf,             \
                    unsigned long long*: ullong◼snprintf,       \
                    float*: Float◼snprintf,                     \
                    double*: Double◼snprintf,                   \
                    long double*: ldouble◼snprintf              \
                    ),                                          \
    .t = _Generic(&NAME,                                        \
                    default: 0,                                 \
                    char**: "char*",                            \
                    char const**: "char const*",                \
                    char*: "char",                              \
                    _Bool*: "bool",                             \
                    signed char*: "signed char",                \
                    short*: "short",                            \
                    signed*: "signed",                          \
                    long*: "long",                              \
                    long long*: "long long",                    \
                    unsigned char*: "unsigned char",            \
                    unsigned short*: "unsigned short",          \
                    unsigned*: "unsigned",                      \
                    unsigned long*: "unsigned long",            \
                    unsigned long long*: "unsigned long long",  \
                    float*: "float",                            \
                    double*: "double",                          \
                    long double*: "long double"                 \
                  ),                                            \
    .a = (ALIAS),                                               \
    .d = (DOC),                                                 \
    .n = #NAME,                                                 \
  };                                                            \
  CHAR(NAME).next = head;                                       \
  head = &CHAR(NAME)

#define SHORTCUT(C, ALIAS, VAL, DOC)            \
  static getopt CHAR(_shortcut) = {             \
    .c = (C),                                   \
    .o =  (VAL),                                \
    .f = shortcut,                              \
    .p = sc◼snprintf,                           \
    .t = "shortcut",                            \
    .a = (ALIAS),                               \
    .d = (DOC),                                 \
    .n = "",                                    \
  };                                            \
  CHAR(_shortcut).next = head;                  \
  head = &CHAR(_shortcut)


#define SEPARATOR(HEAD1, HEAD2, HEAD3)          \
  static getopt CHAR(_separator) = {            \
  .c = 0,                                       \
  .o = 0,                                       \
  .f = 0,                                       \
  .p = 0,                                       \
  .t = HEAD1,                                   \
  .a = 0,                                       \
  .d = HEAD3,                                   \
  .n = HEAD2,                                   \
  };                                            \
  CHAR(_separator).next = head;                 \
  head = &CHAR(_separator)


#define USAGE(...) usage((char const*[]){ __VA_ARGS__ "", 0 })

#pragma CMOD definition

int comp(void const* a, void const* b) {
  register getopt const*const*const A = a;
  register getopt const*const*const B = b;
  if (A && (*A) && (*A)->a)
    if (B && (*B) && (*B)->a)
      return str◼cmp((*A)->a, (*B)->a);
    else
      return -1;
  else if (B && (*B) && (*B)->a)
    return 1;
  else
    return 0;
}

int subcomp(void const* a, void const* b) {
  register getopt const*const*const A = a;
  register getopt const*const*const B = b;
  if (A && (*A) && (*A)->a)
    if (B && (*B) && (*B)->a) {
      C◼size n = str◼len((*A)->a);
      return str◼ncmp((*A)->a, (*B)->a, n);
    } else
      return -1;
  else if (B && (*B) && (*B)->a)
    return 1;
  else
    return 0;
}

char const* progname = 0;
bool verbose = 0;
static char const* synopsis_ = 0;
static char const** usage_ = 0;
static char const* author_ = 0;
char const* rights = "unspecified license: all rights reserved";

int copyright(void* o, char const* arg) {
  io◼fprintf(io◼err, "© %s, " __DATE__ "\n", author_);
  lib◼exit(lib◼FAILURE);
}

int license(void* o, char const* arg) {
  io◼fprintf(io◼err, "This program is distributed with %s, \n", rights);
  lib◼exit(lib◼FAILURE);
}

void
diagnostic(char const* err0, char const* err1, char const* err2) {
  io◼fprintf(io◼err, "Warning: %s for \"--%s\" with \"%s\"\n",
             err0,
             err1,
             err2);
}

void author(char const*s) {
  author_ = p11◼str◼dup(s);
  p11◼impl◼getopt◼insert(author_);
  static getopt copy = {
    .f = copyright,
    .a = "copyright",
    .d = "print a copyright notice",
    .n = "",
  };
  copy.next = head;
  head = &copy;
}

void synopsis(char const*s) {
  synopsis_ = p11◼str◼dup(s);
  p11◼impl◼getopt◼insert(synopsis_);
}

void usage(char const**u) {
  C◼size len = 0;
  while (u[len]) ++len;
  usage_ = lib◼malloc(sizeof(char*[len+1]));
  p11◼impl◼getopt◼insert(usage_);
  for (C◼size i = 0; i < len; ++i) {
    usage_[i] = p11◼str◼dup(u[i]);
    p11◼impl◼getopt◼insert(usage_[i]);
  }
  usage_[len] = 0;
}

getopt const*
find(char const* al, C◼size size, getopt const* A[size]) {
  /* Search for a matching alias in the array */
  getopt const*const el = &(getopt const) { .a = al, };
  register getopt const*const* p
    = lib◼bsearch(&el, A, size, sizeof *A, subcomp);
  if (p && (*p)) {
    /* Now search if there are several matches. */
    while (p != A && !subcomp(&el, p - 1)) --p;
    /* An exact match must always come first and is preferred.
       If the first is not an exact match, second shouldn't be
       a partial match. */
    if (!comp(&el, p) || (subcomp(&el, p+1) < 0))
      return *p;
  }
  return 0;
}

int initialize(int* argc, char*** argv) {
  char const* err0 = 0;
  char const* err1 = 0;
  char const* err2 = 0;

  // Produce a lookup table for short options
  C◼size len = 0;
  getopt const* B[C◼char◼MAX] = { 0 };
  for (getopt const* p = head; p; p = p->next) {
    if (p->c > 0) {
      unsigned i = p->c;
      if (!B[i])
        B[i] = p;
    }
    ++len;
  }

  // store all aliases in an array and sort it
  getopt const* A[len];
  C◼size i = 0;
  for (getopt const* p = head; p; p = p->next) {
    A[i] = p;
    ++i;
  }
  lib◼qsort(A, len, sizeof *A, comp);

  if (!progname) progname = (*argv)[0];
  /* Now comes the main processing loop. One character arguments may
     be aggregated into one option, that is why this loop looks a bit
     scary. */
  int arg = 1;
  for (; arg < *argc && (*argv)[arg]; ++arg) {
    /* All options must start with a dash, otherwise this finishes
       option processing. */
    if ((*argv)[arg][0] != '-') {
      goto REARANGE;
    } else {
      /* A "--" without anything else finishes option processing. */
      if ((*argv)[arg][1] == '-' && !(*argv)[arg][2]) {
        ++arg;
        goto REARANGE;
      }
      for (char const* s = (*argv)[arg] + 1; s && s[0];) {
        int used = -1;
        bool extra = false;
        int C = s[0];
        ++s;
        /* If there was nothing left in the option, take the next one
           as an argument. */
        if (!s[0]) {
          s = (*argv)[arg + 1];
          if (s) extra = true;
        }
        err1 = (char[2]){ [0] = C, };
        err2 = s;
        /* If the initial string was "--" this announces a long
           option. */
        if (C == '-') {
          /* First split up the option string into option and
             argument, if possible. */
          char al[str◼len(s) + 1];
          str◼cpy(al, s);
          char* ar = str◼chr(al, '=');
          if (ar) {
            *ar = 0;
            ++ar;
          } else {
            /* If not, suppose that the argument has been given in
               the next option. */
            ar = (*argv)[arg + 1];
            extra = true;
          }
          err0 = "no or ambiguous option alias";
          err1 = al;
          err2 = ar;
          /* Search for a matching alias in the array */
          getopt const* p = find(al, len, A);
          if (p) {
            used = p->f(p->o, ar);
            err0 = "unparsable argument";
          }
          if (used < 0) goto REARANGE;
        } else if (C > 0 && B[C]) {
          getopt const* p = B[C];
          used = p->f(p->o, s);
        }
        err0 = 0;
        /* If this used the option argument and the argument was found
           in the next element of argv, skip that. */
        if (used > 0) {
          arg += extra;
          break;
        } else
          /* Otherwise if this was a flag and we tried to obtain from
             the next element in argv, check that element again, it
             might be an option, too. */
          if (extra) break;
      }
    }
  }
REARANGE:
  if (err0) diagnostic(err0, err1, err2);
  /* At the end of the processing, shift all unused options down, such
     that they appear at front in the argv array. */
  *argc -= (arg - 1);
  /* Be sure to also copy the trailing null pointer. */
  for (int n = 1; n <= *argc; ++n) {
    (*argv)[n] = (*argv)[n + (arg - 1)];
  }
  return 0;
}

void help_count(getopt const*p,
                int ns[4]) {
  if (p) {
    if (p->a) ns[0] = math◼max(ns[0], str◼len(p->a));
    if (p->t) ns[1] = math◼max(ns[1], str◼len(p->t));
    if (p->n) ns[2] = math◼max(ns[2], lib◼mbstowcs(0, mod◼demangle(p->n), 0));
    if (p->o && p->p) ns[3] = math◼max(ns[3], p->p(0, 0, p->o));
  }
}

void help_case(getopt const*p, int const ns[4]) {
  if (p) {
    if (p->next) help_case(p->next, ns);
    char const*const d = p->d ? p->d : "   ";
    char const*const t = p->t ? p->t : "   ";
    char const*const n = p->n ? mod◼demangle(p->n) : "   ";
    char c = p->c;
    char const*const a = p->a;
    char v[21] = { 0 };
    if (p->o && p->p) p->p(v, 20, p->o);
    if (p->a)
      io◼fprintf(io◼err, "   %c%c  %s%-*s%-*s%-*s\t%-*s\t%s\n",
                 c ? '-' : ' ',
                 c ? c : ' ',
                 a ? "--" : "  ",
                 ns[0]+2,
                 a ? a : " ",
              ns[1]+2,
              t,
              ns[2]+2,
              n,
              ns[3]+2,
              v,
              d);
    else
      io◼fprintf(io◼err, "   %c%c    %-*s%-*s%-*s\t%-*s \t%s\n",
                 c ? '-' : ' ',
                 c ? c : ' ',
              ns[0]+2,
              "",
              ns[1]+2,
              t,
              ns[2]+2,
              n,
              ns[3]+2,
              v,
              d);
  }
}


int help(void* o, char const*c) {
  int ns[4] = { 0 };
  locale◼set(locale◼ALL, "");
  for (getopt const* p = head; p; p = p->next) {
    help_count(p, ns);
  }
  if (progname || synopsis_)
    io◼fprintf(io◼err, "%s%s%s\n\n",
            (progname ? progname : ""),
            (progname && synopsis_ ? " — " : ""),
            (synopsis_ ? synopsis_ : ""));
  io◼fprintf(io◼err, "short  %-*s%-*s%-*s\t%-*s \t%s\n",
          ns[0]+4,
          "long",
          ns[1]+2,
          "type",
          ns[2]+2,
          "variable",
          ns[3]+2,
          "value",
          "");
  help_case(head, ns);
  if (verbose && usage_) {
    io◼fputc('\n', io◼err);
    for (C◼size line = 0; usage_[line]; ++line) {
      io◼fputs(usage_[line], io◼err);
      io◼fputc('\n', io◼err);
    }
  }
  lib◼exit(lib◼FAILURE);
}

int shortcut(void* obj, char const* arg) {
  char* Obj = obj;
  int argc = 2;
  char** argv = (char*[]){ "dummy", Obj, 0, };
  initialize(&argc, &argv);
  return 0;
}

getopt const* head
= &(getopt const){
  .f = license,
  .a = "license",
  .d = "print a license notice",
  .n = "",
  .next = &(getopt const){
    .c = '?',
    .o = "-vh",
    .f = shortcut,
    .p = sc◼snprintf,
    .t = "shortcut",
    .a = "longhelp",
    .d = "print long help",
    .n = "",
    .next = &(getopt const){
      .c = 'h',
      .o = 0,
      .f = help,
      .t = "",
      .a = "help",
      .d = "print short help",
      .n = "",
      .next = &(getopt const){
        .c = 'v',
        .o = &verbose,
        .f = Bool◼process,
        .p = Bool◼snprintf,
        .t = "bool",
        .a = "verbose",
        .d = "increase verbosity",
        .n = "p11◼getopt◼verbose",
        .next = &(getopt const){
          .n = "--- p11◼getopt ---",
        },
      },
    },
  },
};
