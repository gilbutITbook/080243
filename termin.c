#include "termin.h"
#include <termios.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#ifndef __STDC_NO_THREADS__
# include <threads.h>
#endif
#include <ctype.h>
#include <string.h>

/* Store the flags as they were set before termin_unbuffered. */
static tcflag_t termin_echo;

/* The flags that we manipulate. */
#define TERMIN_FLAGS (ECHO | ECHONL | ICANON)

void termin_reset(void) {
  struct termios term;
  tcgetattr(0, &term);
  term.c_lflag |= termin_echo;
  tcsetattr(0, TCSAFLUSH, &term);
}

void termin_unbuffered(void) {
  // have stdin unbuffered on stdio level
  setvbuf(stdin, 0, _IONBF, 0);
  // store the terminal settings with respect to the flags
  struct termios term;
  tcgetattr(0, &term);
  termin_echo = term.c_lflag & TERMIN_FLAGS;
  // install exit handlers
  atexit(termin_reset);
  at_quick_exit(termin_reset);
  // change the terminal settings to raw mode
  term.c_lflag &= ~TERMIN_FLAGS;
  tcsetattr(0, TCSAFLUSH, &term);
}

static unsigned minc = 0;
static unsigned maxc = UCHAR_MAX;

static
void term_init(void) {
  while (!termin_trans[minc]) ++minc;
  while (!termin_trans[maxc]) --maxc;
}

#ifndef __STDC_NO_THREADS__
static once_flag term_once = ONCE_FLAG_INIT;
#endif

static
bool termin_read_csi(size_t len, char command[len]) {
  for (char *p = command, *stop = command+len-1; p < stop; ++p) {
    int c = getchar();
    // catch all: EOF, 0, control characters
    if (c < ' ') return false;
    p[0] = c;
    if ('@' <= c && c <= '~') {
      p[1] = 0;
      return true;
    }
  }
  return false;
}

char const* termin_read_esc(size_t len, char command[len]) {
  command[1] = getchar();
  switch (command[1]) {
  case '[':
    return
      termin_read_csi(len-2, command+2)
      ? command
      : 0;
  case 'N':
  case 'O':
  case 'Z':
  case '%':
    command[2] = getchar();
    command[3] = 0;
    return command;
  default:
    ungetc(command[1], stdin);
    return 0;
  }
}

char termin_translate(char const* command) {
  call_once(&term_once, term_init);
  for (unsigned c = minc; c <= maxc; ++c) {
    if (termin_trans[c] && !strcmp(command, termin_trans[c])) {
      return c;
    }
  }
  return 0;
}
