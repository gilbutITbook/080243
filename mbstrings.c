#include <errno.h>
#include <limits.h>
#include <locale.h>
#include <stdbool.h>
#include <stdio.h>

#include "mbstrings.h"

/**
 ** @file
 ** @brief implement multibyte character string helpers
 **/

size_t mbrtow(wchar_t*restrict C, char const c[restrict static 1],
              mbstate_t*restrict state) {
  if (!state) state = MBSTATE;
  size_t len = -2;
  for (size_t maxlen = MB_LEN_MAX; len == -2; maxlen *= 2)
    len = mbrtowc(C, c, maxlen, state);
  if (len == -1) errno = 0;
  return len;
}

wint_t mbtow(char const*c) {
  wchar_t C = 0;
  size_t len = mbrtow(&C, c, MBSTATE);
  return (len == -1) ? WEOF : C;
}

size_t mbsrlen(char const*s, mbstate_t const*restrict state) {
  if (!state) state = MBSTATE;
  mbstate_t st = *state;
  size_t mblen = mbsrtowcs(0, &s, 0, &st);
  if (mblen == -1) errno = 0;
  return mblen;
}

wchar_t* mbsrdup(char const*s, mbstate_t const*restrict state) {
  size_t mblen = mbsrlen(s, state);
  if (mblen == -1) return 0;
  mbstate_t st =  state ? *state : *MBSTATE;
  wchar_t* S = malloc(sizeof(wchar_t[mblen+1]));
  /* We know that s converts well, so no error check */
  if (S) mbsrtowcs(S, &s, mblen+1, &st);
  return S;
}

#define SURROG0 0xD800L
#define SURROG1 (SURROG0 + 1024)
#define SURROG2 (SURROG1 + 1024)

int iswhighsurrogate(wint_t x) {
  return (SURROG0 <= x) && (x < SURROG1);
}

int iswlowsurrogate(wint_t x) {
  return (SURROG1 <= x) && (x < SURROG2);
}

int iswsurrogate(wint_t x) {
  return (SURROG0 <= x) && (x < SURROG2);
}

int iswvalid(wint_t x) {
  return x && x != WEOF && !iswsurrogate(x);
}

char const* mbsrwc(char const s[restrict static 1], mbstate_t*restrict state,
                   wchar_t C, size_t occurrence) {
  if (!C || C == WEOF) return 0;
  if (!state) state = MBSTATE;
  char const* ret = 0;

  mbstate_t st = *state;
  for (size_t len = 0; s[0]; s += len) {
    mbstate_t backup = st;
    wchar_t S = 0;
    len = mbrtow(&S, s, &st);
    if (!S) break;
    if (C == S) {
      *state = backup;
      ret = s;
      if (!occurrence) break;
      --occurrence;
    }
  }
  return ret;
}

char const* mbsrmb(char const s[static 1], mbstate_t*restrict state,
                   char const c[static 1], size_t occurrence) {
  if (!state) state = MBSTATE;
  wint_t C = mbtow(c);
  return mbsrwc(s, state, C, occurrence);
}

char const* mbsrrwc(char const s[restrict static 1], mbstate_t*restrict state,
                    wchar_t C) {
  return mbsrwc(s, state, C, -1);
}

char const* mbsrrmb(char const s[static 1], mbstate_t*restrict state,
                    char const c[static 1]) {
  return mbsrmb(s, state, c, -1);
}

char const* mbsrwcjump(char const s1[static 1], mbstate_t*restrict state,
                       size_t S2len, wchar_t const S2[S2len]) {
  if (!state) state = MBSTATE;
  mbstate_t st = *state;
  for (size_t i = 0; i < S2len; ++i) {
    wchar_t S1 = 0;
    s1 += mbrtow(&S1, s1, &st);
    if (S1 != S2[i]) return 0;
  }
  *state = st;
  return s1;
}


char const* mbsrwcs(char const s1[static 1], mbstate_t*restrict state,
                    wchar_t const S2[static 1]) {
  if (!state) state = MBSTATE;
  size_t S2len = wcslen(S2);
  switch (S2len) {
  case 0: return 0;
  case 1: return mbsrwc(s1, state, S2[0], 0);
  default:;
    /* Don't modify shift state until we found it. */
    mbstate_t rstate = *state;
    while (s1 && s1[0]) {
      s1 = mbsrwc(s1, &rstate, S2[0], 0);
      if (s1 && s1[0]) {
        /* s1 now is at a potential starting point */
        char const* ret = s1;
        mbstate_t tstate = rstate;
        if (mbsrwcjump(s1, &tstate, S2len, S2)) {
          *state = rstate;
          return ret;
        }
        /* Advance s1 to the next mb character. */
        s1 += mbrtow(0, s1, &rstate);
      }
    }
  }
  return 0;
}

char const* mbsrmbs(char const s1[static 1], mbstate_t*restrict state,
                    char const s2[static 1]) {
  if (!state) state = MBSTATE;
  wchar_t*restrict S2 = mbsrdup(s2, 0);
  if (!S2 || !S2[0]) return 0;
  s1 = mbsrwcs(s1, state, S2);
  free(S2);
  return s1;
}

char const* mbsrwcsskip(char const s1[static 1], mbstate_t*restrict state,
                        wchar_t const* S2){
  if (S2) {
    if (!state) state = MBSTATE;
    mbstate_t st = *state;
    for (size_t len; s1[0]; *state = st, s1 += len) {
      wchar_t S1[3] = { 0 };
      len = mbrtow(&S1[0], s1, &st);
      if (!S1[0]) break;
      if (!iswlowsurrogate(S1[0])) {
        if (!wcschr(S2, S1[0])) break;
      } else {
        len += mbrtow(&S1[1], s1, &st);
        if (!wcsstr(S2, S1)) break;
      }
    }
    *state = st;
  }
  return s1;
}

char const* mbsrskip(char const s1[static 1], mbstate_t*restrict state,
                     char const* s2) {
  if (!state) state = MBSTATE;
  wchar_t*restrict S2 = mbsrdup(s2, 0);
  s1 = mbsrwcsskip(s1, state, S2);
  free(S2);
  return s1;
}

size_t mbsspn(char const* s1, char const* s2) {
  return s1 ? mbsrskip(s1, 0, s2)-s1 : 0;
}

char const* mbsrskip_class(char const s1[static 1], mbstate_t*restrict state,
                           wcclass_t func) {
  if (!state) state = MBSTATE;
  for (size_t len; s1[0]; s1 += len) {
    wchar_t S1 = 0;
    len = mbrtow(&S1, s1, state);
    if (!S1 || !func(S1)) break;
  }
  return s1;
}

size_t mbsspn_class(char const* s1, wcclass_t func) {
  return s1 ? mbsrskip_class(s1, 0, func)-s1 : 0;
}

char const* mbsrskip_type(char const s1[static 1], mbstate_t*restrict state, wctype_t type) {
  if (!state) state = MBSTATE;
  for (size_t len; s1[0]; s1 += len) {
    wchar_t S1 = 0;
    len = mbrtow(&S1, s1, state);
    if (!S1 || !iswctype(S1, type)) break;
  }
  return s1;
}

size_t mbsspn_type(char const* s1, wctype_t type) {
  return s1 ? mbsrskip_type(s1, 0, type)-s1 : 0;
}

size_t mbsspn_name(char const* s1, char const name[static 1]) {
  return mbsspn_type(s1, wctype(name));
}

char const* mbsrwcscskip(char const s1[static 1], mbstate_t*restrict state,
                         wchar_t const* S2) {
  if (!state) state = MBSTATE;
  if (S2) {
    mbstate_t st = *state;
    for (size_t len; s1[0]; s1 += len) {
      wchar_t S1[3] = { 0 };
      len = mbrtow(&S1[0], s1, &st);
      if (!S1[0]) break;
      if (!iswlowsurrogate(S1[0])) {
        if (wcschr(S2, S1[0])) break;
      } else {
        len += mbrtow(&S1[1], s1, &st);
        if (wcsstr(S2, S1)) break;
      }
    }
    *state = st;
  }
  return s1;
}

char const* mbsrcskip(char const* s1, mbstate_t*restrict state, char const* s2) {
  if (!state) state = MBSTATE;
  wchar_t*restrict S2 = mbsrdup(s2, 0);
  s1 = mbsrwcscskip(s1, state, S2);
  free(S2);
  return s1;
}

size_t mbscspn(char const* s1, char const* s2) {
  return (s1 && s2) ? mbsrcskip(s1, 0, s2)-s1 : 0;
}


double mbsrtod(char const*restrict s1, mbstate_t*restrict state,
              char**restrict endptr) {
  if (!state) state = MBSTATE;
  return strtod(mbsrskip_class(s1, state, iswspace), endptr);
}

long double mbsrtold(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr) {
  if (!state) state = MBSTATE;
  return strtold(mbsrskip_class(s1, state, iswspace), endptr);
}

long mbsrtol(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base) {
  if (!state) state = MBSTATE;
  return strtol(mbsrskip_class(s1, state, iswspace), endptr, base);
}

long long mbsrtoll(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base) {
  if (!state) state = MBSTATE;
  return strtoll(mbsrskip_class(s1, state, iswspace), endptr, base);
}

unsigned long mbsrtoul(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base) {
  if (!state) state = MBSTATE;
  return strtoul(mbsrskip_class(s1, state, iswspace), endptr, base);
}

unsigned long long mbsrtoull(char const*restrict s1, mbstate_t*restrict state, char**restrict endptr, int base) {
  if (!state) state = MBSTATE;
  return strtoull(mbsrskip_class(s1, state, iswspace), endptr, base);
}



char* mbsrmbsncpy(size_t n, char t[restrict n], mbstate_t const*restrict state,
                  char const s [restrict static 1]) {
  /* Don't do anything if s wouldn't fit entirely into t */
  char const* ep = memchr(s, 0, n);
  if (!ep) return 0;
  size_t slen = ep - s;
  /* If the target is in non-initial state, try to reset it. */
  if (!mbsinit(state)) {
    /* Now state is known to be non-null. */
    char buf[2*MB_LEN_MAX];
    mbstate_t st = *state;
    size_t len = wcrtomb(buf, 0, &st);
    /* See if shift characters plus s will fit into t. */
    if (slen+len >= n) return 0;
    /* write the bytes that end the shift state */
    memcpy(t, buf, len);
    t += len-1;
    n -= len-1;
  }
  if (slen >= n) return 0;
  memcpy(t, s, slen+1);
  return t + slen;
}

char* mbsrncpy(size_t n, char t[restrict n], mbstate_t*restrict tstate,
               char const s [restrict static 1], mbstate_t const*restrict sstate) {
  /* First check if the bytes can just be copied over. */
  if (mbsinit(sstate)) {
    char* ret = mbsrmbsncpy(n, t, tstate, s);
    if (ret) return ret;
  }
  char* tt = t;
  if (!tstate) tstate = MBSTATE;
  if (!sstate) sstate = MBSTATE;
  mbstate_t sst = *sstate;
  char buf[2*MB_LEN_MAX];
  for (size_t slen = 0; s[0] && n; s += slen) {
    wchar_t S[2] = { 0 };
    slen = mbrtowc(S, s, n, &sst);
    /* Here, wcsrtombs can't fail, but because of the different state
       of t, tlen may be larger than slen. */
    wchar_t const* Sp = S;
    mbstate_t tst = *tstate;
    size_t tlen = wcsrtombs(buf, &Sp, n, &tst);
    if (tlen > n) break;
    *tstate = tst;
    memcpy(tt, buf, tlen);
    if (!S[0]) break;
    tt += tlen;
    n -= tlen;
  }
  return tt;
}
