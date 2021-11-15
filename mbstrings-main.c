#include <errno.h>
#include <limits.h>
#include <locale.h>
#include <stdbool.h>
#include <stdio.h>

#include "mbstrings.h"

enum {
  g_l = 1,
  g_r = 2,
  g_u = 4,
  g_d = 8,
};

#define MONTH(X)                                \
 (char const*[]){                               \
   [1] = "Jan",                                 \
     [2] = "Feb",                               \
     [3] = "Mar",                               \
     [4] = "Apr",                               \
     [5] = "Mai",                               \
     [6] = "Jun",                               \
     [7] = "Jul",                               \
     [8] = "Aug",                               \
     [9] = "Sep",                               \
     [10] = "Oct",                              \
     [11] = "Nov",                              \
     [12] = "Dec",                              \
     }[(X)%100]

#define STRINGIFY_(X) #X
#define STRINGIFY(X) STRINGIFY_(X)

#define YEAR(X)                                 \
(char const[5]){                                \
  STRINGIFY(X)[0],                              \
  STRINGIFY(X)[1],                              \
  STRINGIFY(X)[2],                              \
  STRINGIFY(X)[3],                              \
    }

#define VBAR "\u2502"      /**< a vertical bar character   */
#define HBAR "\u2500"      /**< a horizontal bar character */
#define TOPLEFT "\u250c"   /**< topleft corner character   */
#define TOPRIGHT "\u2510"  /**< topright corner character  */

/**
 ** @brief Draw multibyte strings @a start and @a end separated
 ** by a horizontal line.
 **/
void draw_sep(char const start[static 1],
              char const end[static 1]) {
  fputs(start, stdout);
  size_t slen = mbsrlen(start, 0);
  size_t elen = 90 - mbsrlen(end, 0);
  for (size_t i = slen; i < elen; ++i) fputs(HBAR, stdout);
  fputs(end, stdout);
  fputc('\n', stdout);
}

char const* g_table[] = {
  [0] = " ",
  [g_l] = "\u2574",
  [g_r] = "\u2576",
  [g_l|g_r] = "\u2500",
  [g_u] = "\u2575",
  [g_l|g_u] = "\u2518",
  [g_r|g_u] = "\u2514",
  [g_l|g_r|g_u] = "\u2534",
  [g_d] = "\u2577",
  [g_l|g_d] = "\u2510",
  [g_r|g_d] = "\u250c",
  [g_l|g_r|g_d] = "\u252c",
  [g_u|g_d] = "\u2502",
  [g_l|g_u|g_d] = "\u2524",
  [g_r|g_u|g_d] = "\u251c",
  [g_l|g_r|g_u|g_d] = "\u253c",
};

int main(void) {
  /* The first action of the executable should be locale switch. */
  char const* locC_ = setlocale(LC_CTYPE, 0);
  char locC[strlen(locC_)+1];
  strcpy(locC, locC_);

  setlocale(LC_ALL, "");
  /* Multibyte character printing only works after the locale
     has been switched. */
  draw_sep(TOPLEFT " © 2014 jɛnz ˈgʊzˌtɛt ", TOPRIGHT);

  char const* locLoc_ = setlocale(LC_CTYPE, 0);
  char locLoc[strlen(locLoc_)+1];
  strcpy(locLoc, locLoc_);
  char const strhello[] = "Hä\u0131łłö";
  char const u8hello[] = u8"Hä\u0131łłö";
  wchar_t const wcshello[] = L"Hä\u0131łłö";
  char const strvowel[] = "aeiouäëïöüáéíóúàèìòùæœ\u0131";
  char const u8vowel[] = u8"aeiouäëïöüáéíóúàèìòùæœ\u0131";
  wchar_t const wcsvowel[] = L"aeiouäëïöüáéíóúàèìòùæœ\u0131";
  char16_t c16butterfly[] = u"\U000272CA";
  char32_t c32butterfly[] = U"\U000272CA";
  wchar_t wbutterfly[] = L"\U000272CA";
  char u8butterfly[] = u8"\U000272CA";
  bool mbs_u8
    = (sizeof strvowel == sizeof u8vowel)
    && (!strcmp(strvowel, u8vowel))
    && (!strcmp("\U000272CA", u8"\U000272CA"));
  printf(VBAR "%ls world: switched \"%s\" \u21E8 \"%s\", multibyte strings are%s utf8, state%s\n",
         wcshello, locC, locLoc,
         mbs_u8 ? "" : " not",
         mblen(0, 0) ? "full" : "less");
  printf(VBAR "wchar_t (%ssigned) is %zu bit, wint_t (%ssigned) is %zu bit, WEOF is ",
         (WCHAR_MIN ? "" : "un"), sizeof(wchar_t)*CHAR_BIT,
         (WINT_MIN ? "" : "un"), sizeof(wint_t)*CHAR_BIT);
  if (WINT_MIN) printf("%lld\n", (long long)WEOF);
  else printf("%#llx\n", (unsigned long long)WEOF);
  printf(VBAR "wchar_t are Unicode code points as of %s %s, ",
# ifdef __STDC_ISO_10646__
         MONTH(__STDC_ISO_10646__),
         YEAR(__STDC_ISO_10646__)
# else
         "<unknown>",
         "<unknown>"
# endif
         );
# ifdef __STDC_MB_MIGHT_NEQ_WC__
  fputs("the basic character set is not extended to wchar_t\n", stdout);
# else
  fputs("wchar_t extends the basic character set\n", stdout);
# endif
#ifdef __STDC_UTF_16__
  fputs(VBAR "char16_t is UTF-16, ", stdout);
#else
  fputs("char16_t is not UTF-16, ", stdout);
#endif
#ifdef __STDC_UTF_32__
  fputs("char32_t is UTF-32\n", stdout);
#else
  fputs(VBAR "char32_t is not UTF-32\n", stdout);
#endif
  draw_sep(g_table[g_u|g_d|g_r], g_table[g_l|g_u|g_d]);
  printf(VBAR "testing character %ls, codepoint U+%lX, utf8 %hhx %hhx %hhx %hhx %hhx:\n",
         wbutterfly, 0x272CALU,
         u8butterfly[0], u8butterfly[1], u8butterfly[2], u8butterfly[3], u8butterfly[4]);
  printf(VBAR "\twchar_t,\tlength %zu,\t%s\n",
         (sizeof(wbutterfly)/sizeof(wbutterfly[0])) - 1,
         (sizeof(wbutterfly)/sizeof(wbutterfly[0])) == 2
         ? "one word encoding" : "surrogate encoding");
  printf(VBAR "\tchar32_t,\tlength %zu,\t%s\n",
         (sizeof(c32butterfly)/sizeof(c32butterfly[0])) - 1,
         (sizeof(c32butterfly)/sizeof(c32butterfly[0])) == 2
         ? "one word encoding" : "surrogate encoding");
  printf(VBAR "\tchar16_t,\tlength %zu,\t%s\n",
         (sizeof(c16butterfly)/sizeof(c16butterfly[0])) - 1,
         (sizeof(c16butterfly)/sizeof(c16butterfly[0])) == 2
         ? "one word encoding" : "surrogate encoding");
  if (sizeof(wchar_t) == sizeof(char32_t))
    printf(VBAR "\twchar_t and char32_t encoding %s\n",
           (sizeof(c32butterfly) == sizeof(wbutterfly)
            && c32butterfly[0] == wbutterfly[0]
            && c32butterfly[1] == wbutterfly[1]) ? "are equal" : "differ");
  else if (sizeof(wchar_t) == sizeof(char16_t))
    printf(VBAR "\twchar_t and char16_t encoding %s\n",
           (sizeof(c16butterfly) == sizeof(wbutterfly)
            && c16butterfly[0] == wbutterfly[0]
            && c16butterfly[1] == wbutterfly[1]) ? "are equal" : "differ");
  else
    printf(VBAR "\twchar_t, char32_t and char16_t types and encodings all differ\n");
  char const mbs0[] = u8"ł";
  char const* pos0 = mbsrmb(u8hello, 0, mbs0, 0);
  draw_sep(g_table[g_u|g_d|g_r], g_table[g_l|g_u|g_d]);
  printf(VBAR "search first:\tfound \"%s\",\tposition %td, %s\n", mbs0, pos0-u8hello, pos0);
  pos0 = mbsrmb(u8hello, 0, mbs0, 1);
  printf(VBAR "search second:\tfound \"%s\",\tposition %td, %s\n", mbs0, pos0-u8hello, pos0);
  char const mbs1[] = u8"ł";
  char const* pos1 = mbsrrmb(u8hello, 0, mbs1);
  printf(VBAR "search last:\tfound \"%s\",\tposition %td, %s\n", mbs1, pos1-u8hello, pos1);
  char const mbs2[] = u8"łö";
  char const* pos2 = mbsrmbs(u8hello, 0, mbs2);
  printf(VBAR "search needle:\tfound \"%s\",\tposition %td, %s\n", mbs2, pos2-u8hello, pos2);
  char const mbs3[] = u8" \u2003\u2002—";
  size_t pos3 = mbsspn_class(mbs3, iswspace);
  printf(VBAR "skip space:\tfound \"%s\",\tposition %zu, %s\n", mbs3, pos3, mbs3+pos3);
  draw_sep(g_table[g_u|g_d|g_r], g_table[g_l|g_u|g_d]);
  printf(VBAR "floats (locale):\t%g (C with .)\t%g (C with ,)\t%g (with .)\t%g (with ,)\n",
         strtod("9.3", 0), strtod("9,3", 0),
         mbsrtod("\u20039.3", 0, 0), mbsrtod("\u20039,3", 0, 0));
  draw_sep(g_table[g_u|g_d|g_r], g_table[g_l|g_u|g_d]);
  printf(VBAR "vowels\t%ls\n", wcsvowel);
  char u8vowel2[MB_LEN_MAX + sizeof u8vowel];
  char* partial = mbsrncpy(sizeof u8vowel-2, u8vowel2, 0, u8vowel, 0);
  if (partial[0]) partial[0] = 0;
  printf(VBAR "partial\t%s\n", u8vowel2);
  for (char const* s = strhello; s && s[0];) {
    s += mbscspn(s, strvowel);
    int vowels = mbsspn(s, strvowel);
    if (!vowels) {
      printf("bizarre, no vowels in remaining string %s", s);
      break;
    }
    printf(VBAR "%d bytes for vowel(s) %.*s\n", vowels, vowels, s);
    s += vowels;
  }
  draw_sep(g_table[g_u|g_r], g_table[g_l|g_u]);
}
