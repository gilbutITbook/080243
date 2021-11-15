#include "life.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdatomic.h>
#include <limits.h>
#include "termin.h"

// The keys that are used for cursor movement
// Other keys that are used are:
// b, B, space for birth9
// -, + to slow down and accelerate
// q, Q to quit
#define GO_UP 'k'
#define GO_DOWN 'l'
#define GO_RIGHT ';'
#define GO_LEFT 'j'
#define GO_HOME 'h'

// We translate escape sequences that we may receive to these standard
// characters for further processing.

#define ESCAPE '\e'

char const*const termin_trans[UCHAR_MAX+1] = {
  [GO_UP] = ESC_UP,
  [GO_DOWN] = ESC_DOWN,
  [GO_RIGHT] = ESC_FRWD,
  [GO_LEFT] = ESC_BKWD,
  [GO_HOME] = ESC_HOME,
};

static
int update_thread(void* Lv) {
  life*restrict L = Lv;
  size_t changed = 1;
  size_t birth9 = 0;
  while (!L->finished && changed) {
    // Blocks until there is work
    mtx_lock(&L->mtx);
    while (!L->finished && (L->accounted < L->iteration))
      life_wait(&L->upda, &L->mtx);

    // VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    if (birth9 != L->birth9) life_torus(L);
    life_count(L);
    changed = life_update(L);
    life_torus(L);
    birth9 = L->birth9;
    L->iteration++;
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    cnd_signal(&L->acco);
    cnd_signal(&L->draw);
    mtx_unlock(&L->mtx);

    life_sleep(1.0/L->frames);
  }
  return 0;
}

static
int draw_thread(void* Lv) {
  life*restrict L = Lv;
  size_t x0 = 0;
  size_t x1 = 0;
  fputs(ESC_CLEAR ESC_CLRSCR, stdout);
  while (!L->finished) {
    // Blocks until there is work
    mtx_lock(&L->mtx);
    while (!L->finished
           && (L->iteration <= L->drawn)
           && (x0 == L->x0)
           && (x1 == L->x1)) {
      life_wait(&L->draw, &L->mtx);
    }
    // VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    if (L->n0 <= 30) life_draw(L);
    else life_draw4(L);
    L->drawn++;
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    mtx_unlock(&L->mtx);

    x0 = L->x0;
    x1 = L->x1;
    // No need to draw too quickly
    life_sleep(1.0/40);
  }
  return 0;
}

// This number of consecutive states that are already known (that is,
// hashed in) decides that this sequence of states is cyclic
enum { repetition = 10, };

static
int account_thread(void* Lv) {
  life*restrict L = Lv;
  while (!L->finished) {
    // Blocks until there is work
    mtx_lock(&L->mtx);
    while (!L->finished && (L->accounted == L->iteration))
      life_wait(&L->acco, &L->mtx);

    // VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    life_account(L);
    if ((L->last + repetition) < L->accounted) {
      L->finished = true;
    }
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    cnd_signal(&L->upda);
    mtx_unlock(&L->mtx);
  }
  return 0;
}

static
int input_thread(void* Lv) {
  termin_unbuffered();
  life*restrict L = Lv;
  enum { len = 32, };
  char command[len];
  do {
    int c = getchar();
    command[0] = c;
    switch(c) {
    case GO_LEFT : life_advance(L,  0, -1); break;
    case GO_RIGHT: life_advance(L,  0, +1); break;
    case GO_UP   : life_advance(L, -1,  0); break;
    case GO_DOWN : life_advance(L, +1,  0); break;
    case GO_HOME : L->x0 = 1; L->x1 = 1;    break;
    case ESCAPE  :
      ungetc(termin_translate(termin_read_esc(len, command)), stdin);
      continue;
    case '+':      if (L->frames < 128) L->frames++; continue;
    case '-':      if (L->frames > 1)   L->frames--; continue;
    case ' ':
    case 'b':
    case 'B':
      mtx_lock(&L->mtx);
      // VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
      life_birth9(L); /*@\label{lab:birth9}*/
      // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      cnd_signal(&L->draw);
      mtx_unlock(&L->mtx);
      continue;
    case 'q':
    case 'Q':
    case EOF:      goto FINISH;
    }
    cnd_signal(&L->draw);  /*@\label{lab:signal}*/
  } while (!(L->finished || feof(stdin)));
 FINISH:
  L->finished = true;
  return 0;
}

enum { n = 60, m = 160 };

bool M[n][m] = {
 { 0 },
 { 0 },
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
 { 0 },
 { 0 },
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0 },
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, },
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, },
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, },
 { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0 },
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0 },
 { 0 },
 { 0 },
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
 { 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
 { 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0 },
 { 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
 { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0 },
 { 0 },
};

int main(int argc, char* argv[argc+1]) {
  /* Uses command-line arguments for the size of the board */
  size_t n0 = 30;
  size_t n1 = 80;
  if (argc > 1) n0 = strtoull(argv[1], 0, 0);
  if (argc > 2) n1 = strtoull(argv[2], 0, 0);
  /* Create an object that holds the game's data. */
  life L = LIFE_INITIALIZER;
  life_init(&L, n0, n1, M);
  /* Creates four threads that all operate on that same object
     and collects their IDs in "thrd" */
  thrd_t thrd[4];
  thrd_create(&thrd[0], update_thread,  &L);
  thrd_create(&thrd[1], draw_thread,    &L);
  thrd_create(&thrd[2], input_thread,   &L);
  thrd_create(&thrd[3], account_thread, &L);
  /* Waits for the update thread to terminate */
  thrd_join(thrd[0], 0);
  /* Tells everybody that the game is over */
  L.finished = true;
  ungetc('q', stdin);
  /* Waits for the other threads */
  thrd_join(thrd[1], 0);
  thrd_join(thrd[2], 0);
  thrd_join(thrd[3], 0);
  /* Puts the board in a nice final picture */
  L.iteration = L.last;
  life_draw(&L);
  life_destroy(&L);
}
