#include "tgstring.h"
#include <stdio.h>

#define putws(S) do { printf("%ls\n", S); } while(0)

int main(void) {
  char const carray[] = "some characters";
  // this should produce a diagnostic
  char * capnc = strchr(carray, 'c');
  capnc = memchr(carray, 'c', sizeof carray);
  // this shouldn't produce a diagnostic
  char const* capc = strchr(carray, 't');
  capc = memchr(carray, 't', sizeof carray);
  printf("%s | %s\n", capnc, capc);
  // this shouldn't produce a diagnostic
  char cannc[] = "90 first text";
  char* cnextnc = memchr(cannc, 't', sizeof cannc);
  printf("reading value %lu, followed by", strtoul(cannc, &cnextnc)); puts(cnextnc);
  printf("reading value %g, followed by", strtod(cannc, &cnextnc)); puts(cnextnc);
  // this shouldn't produce a diagnostic
  char const canc[] = "11 second text";
  char const* cnextc = memchr(canc, 't', sizeof canc);
  printf("reading value %jd, followed by", strtoimax(canc, &cnextc)); puts(cnextc);
  printf("reading value %Lg, followed by", strtold(canc, &cnextc)); puts(cnextc);
  printf("reading value %lu, followed by", strtoul(cannc, &cnextc)); puts(cnextc);
  printf("reading value %g, followed by", strtod(cannc, &cnextc)); puts(cnextc);
  // these two should produce diagnostics
  printf("reading value %ju, followed by", strtoumax(canc, &cnextnc)); puts(cnextnc);
  printf("reading value %Lg, followed by", strtold(canc, &cnextnc)); puts(cnextnc);
  wchar_t const warray[] = L"some wide characters";
  // this should produce a diagnostic
  wchar_t * wapnc = strchr(warray, L'c');
  wapnc = wmemchr(warray, L'c', sizeof warray/sizeof warray[0]);
  // this shouldn't produce a diagnostic
  wchar_t const* wapc = strchr(warray, L't');
  wapc = wmemchr(warray, L't', sizeof warray/sizeof warray[0]);
  printf("%ls | %ls\n", wapnc, wapc);
  // this shouldn't produce a diagnostic
  wchar_t wcnnc[] = L"5 first text";
  wchar_t* wnextnc = 0;
  printf("reading value %lu, followed by", wcstoul(wcnnc, &wnextnc, 0)); putws(wnextnc);
  printf("reading value %g, followed by", wcstod(wcnnc, &wnextnc)); putws(wnextnc);
  // this shouldn't produce a diagnostic
  wchar_t const wcnc[] = L"37 second text";
  wchar_t const* wnextc = 0;
  printf("reading value %jd, followed by", strtoimax(wcnc, &wnextc)); putws(wnextc);
  printf("reading value %Lg, followed by", strtold(wcnc, &wnextc)); putws(wnextc);
  printf("reading value %lu, followed by", strtoul(wcnnc, &wnextc)); putws(wnextc);
  printf("reading value %g, followed by", strtod(wcnnc, &wnextc)); putws(wnextc);
  // these two should produce diagnostics
  printf("reading value %ju, followed by", strtoumax(wcnc, &wnextnc)); putws(wnextnc);
  printf("reading value %Lg, followed by", strtold(wcnc, &wnextnc)); putws(wnextnc);
}
