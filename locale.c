#include <locale.h>
#include <stdio.h>

/* You may have to unset the LANGUAGE environment variable for this to
   work properly. */

int main(int argc, char* argv[argc+1]) {
  perror("With C locale");
  if (!setlocale(LC_ALL, ""))
    perror("couldn't set locale");
  else
    perror("With default locale");
  if (!setlocale(LC_MESSAGES, "C"))
    perror("couldn't set locale");
  else
    perror("C locale, again");
  if (argv[1] && !setlocale(LC_MESSAGES, argv[1]))
    perror("couldn't set locale");
  else
    perror("new locale");
  printf("commandline argument was '%s'\n", argv[1]);
}
