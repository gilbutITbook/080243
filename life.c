#include "life.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "termin.h"


void life_sleep(double s) {
  struct timespec duration = {
    .tv_sec = s,
    .tv_nsec = (s-(size_t)s)*1E9,
  };
  while (thrd_sleep(&duration, &duration)) {
    // Empty
  }
}

int life_wait(cnd_t* cnd, mtx_t* mtx) {
  struct timespec now;
  timespec_get(&now, TIME_UTC);
  now.tv_sec += 1;
  return cnd_timedwait(cnd, mtx, &now);
}

void life_advance(life* L, signed t0, signed t1);

static
bool life_alive(bool l, unsigned x) {
  return x == 3 || (l && x ==2);
}

// Computes the number of neighbors and stores them in B
void life_count(life* L) {
  size_t const n1 = L->n1;
  bool (*const restrict M)[n1] = (void*)L->Mv;
  size_t const off0 = L->off0;
  size_t const off1 = L->off1;
  size_t const len0 = L->len0;
  size_t const len1 = L->len1;
  if (!L->Bv) L->Bv =  malloc(sizeof(unsigned char[len0][len1]));
  unsigned char (*restrict B)[len1] = L->Bv;
  for (size_t j0 = 0; j0 < len0; ++j0) {
    size_t i0 = off0 + j0;
    for (size_t j1 = 0; j1 < len1; ++j1) {
      size_t i1 = off1 + j1;
      B[j0][j1] =
        + M[i0-1][i1-1] + M[i0-1][i1] + M[i0-1][i1+1]
        + M[i0  ][i1-1] + 0           + M[i0  ][i1+1]
        + M[i0+1][i1-1] + M[i0+1][i1] + M[i0+1][i1+1];
    }
  }
}

size_t life_update(life* L) {
  size_t const n1 = L->n1;
  bool (*const restrict M)[n1] = (void*)L->Mv;
  size_t const off0 = L->off0;
  size_t const off1 = L->off1;
  size_t const len0 = L->len0;
  size_t const len1 = L->len1;
  unsigned char (*restrict B)[len1] = L->Bv;
  size_t changed = 0;
  if (B) {
    for (size_t j0 = 0; j0 < len0; ++j0) {
      size_t i0 = off0 + j0;
      for (size_t j1 = 0; j1 < len1; ++j1) {
        size_t i1 = off1 + j1;
        bool newval = life_alive(M[i0][i1], B[j0][j1]);
        changed += (M[i0][i1] != newval);
        M[i0][i1] = newval;
      }
    }
  }
  L->Bv = 0;
  free(B);
  return changed;
}

void life_torus(life* L) {
  size_t const n0 = L->n0;
  size_t const n1 = L->n1;
  bool (*const restrict M)[n1] = L->Mv;
  for (size_t i0 = 1; i0 < n0; ++i0) {
    M[i0][0]    = M[i0][n1-2];
    M[i0][n1-1] = M[i0][1];
  }
  for (size_t i1 = 1; i1 < n1; ++i1) {
    M[0]   [i1] = M[n0-2][i1];
    M[n0-1][i1] = M[1]   [i1];
  }
  M[0]   [0]    = M[n0-2][n1-2];
  M[n0-1][0]    = M[1]   [n1-2];
  M[0]   [n1-1] = M[n0-2][1];
  M[n0-1][n1-1] = M[1]   [1];
}



#define DOT "⦿"
#define SPACE " "
#define WROOK ESC_TBLUE "♖" ESC_NORMAL
#define BROOK ESC_TBLUE "♜" ESC_NORMAL

static
void border(size_t m, int b) {
  fputs(ESC_TRED, stdout);
  fputs(ESC_BORDER[b & ~esc_right], stdout);
  for (size_t j = 0; j < m; ++j)
    fputs("━", stdout);
  fputs(ESC_BORDER[b & ~esc_left], stdout);
  fputs(ESC_NORMAL, stdout);
  esc_move(stdout, 1, -(m+2));
}

void life_draw(life* L) {
  size_t const n1 = L->n1;
  bool (*const restrict M)[n1] = L->Mv;
  size_t const x0 = L->x0;
  size_t const x1 = L->x1;
  size_t const off0 = L->off0;
  size_t const off1 = L->off1;
  size_t const len0 = L->len0;
  size_t const len1 = L->len1;

  fputs(ESC_SAVE ESC_HOME ESC_HIDE, stdout);
  border(len1, esc_top|esc_right|esc_left);
  for (size_t i0 = off0; i0 < off0+len0; ++i0) {
    fputs(ESC_TRED, stdout);
    fputs(ESC_BORDER[esc_left], stdout);
    fputs(ESC_NORMAL, stdout);
    for (size_t i1 = off1; i1 < off1+len1; ++i1) {
      if (i1 == x1 && x0 == i0) fputs(M[i0][i1] ? WROOK : BROOK, stdout);
      else fputs(M[i0][i1] ? DOT : SPACE, stdout);
    }
    fputs(ESC_TRED, stdout);
    fputs(ESC_BORDER[esc_right], stdout);
    fputs(ESC_NORMAL, stdout);
    esc_move(stdout, 1, -(len1+2));
  }
  border(len1, esc_bottom|esc_right|esc_left);
  esc_goto(stdout, len0+3, 1);
  fprintf(stdout, ESC_CLEAR "%3zu FPS, %5zu iterations, %5zu birth9, %5zu constellations, " ESC_BOLD "%6.2f" ESC_NORMAL " quotient",
          L->frames, L->iteration, L->birth9, L->constellations, L->constellations*1.0/L->birth9);
  fputs(ESC_RESTORE ESC_SHOW, stdout);
  esc_goto(stdout, len0+4, 1);
}

void life_draw4(life* L) {
  size_t const n1 = L->n1;
  bool (*const restrict M)[n1] = L->Mv;
  size_t const x0 = L->x0;
  size_t const x1 = L->x1;
  size_t const off0 = L->off0;
  size_t const off1 = L->off1;
  size_t const len0 = L->len0;
  size_t const len1 = L->len1;

  fputs(ESC_SAVE ESC_HOME ESC_HIDE, stdout);
  border(len1/2, esc_top|esc_right|esc_left);
  for (size_t i0 = off0; i0 < off0+len0; i0 += 2) {
    fputs(ESC_TRED, stdout);
    fputs(ESC_BORDER[esc_left], stdout);
    fputs(ESC_NORMAL, stdout);
    for (size_t i1 = off1; i1 < off1+len1; i1 += 2) {
      char const* str = 0;
      if ((i1 == x1 || i1+1 == x1) && (x0 == i0 || x0 == i0+1)) {
        // The cursor is a blue dot in the correct position, but the
        // three cell positions are also hidden. We grey them out.
        static char const*const corner[4] = {
          [0] = ESC_TBLUE ESC_BGREY "▗" ESC_NORMAL,
          [1] = ESC_TBLUE ESC_BGREY "▖" ESC_NORMAL,
          [2] = ESC_TBLUE ESC_BGREY "▝" ESC_NORMAL,
          [3] = ESC_TBLUE ESC_BGREY "▘" ESC_NORMAL,
        };
        unsigned ty = (x0%2)<<1 | (x1%2);
        str = corner[ty];
      } else {
        unsigned val = M[i0][i1]
          | (M[i0][i1+1] << 1)
          | (M[i0+1][i1] << 2)
          | (M[i0+1][i1+1] << 3);
        str = ESC_BLOCK[val];
      }
      fputs(str, stdout);
    }
    fputs(ESC_TRED, stdout);
    fputs(ESC_BORDER[esc_right], stdout);
    fputs(ESC_NORMAL, stdout);
    esc_move(stdout, 1, -(len1/2+2));
  }
  border(len1/2, esc_bottom|esc_right|esc_left);
  esc_goto(stdout, len0/2+3, 1);
  fprintf(stdout, ESC_CLEAR "%3zu FPS, %5zu iterations, %5zu birth9, %5zu constellations, " ESC_BOLD "%6.2f" ESC_NORMAL " quotient",
          L->frames, L->iteration, L->birth9, L->constellations, L->constellations*1.0/L->birth9);
  fputs(ESC_RESTORE ESC_SHOW, stdout);
  esc_goto(stdout, len0+4, 1);
}

static
bool hashin(bool (*visited)[life_maxit], size_t hash) {
  bool ret = false;
  hash %= life_maxit;
  if (!(*visited)[hash]) {
    (*visited)[hash] = true;
    ret = true;
  }
  return ret;
}

void life_account(life* L) {
  size_t const n = L->n0;
  size_t const m = L->n1;
  bool (*const restrict M)[m] = L->Mv;
  // Computes a hash of the new state
  size_t hash = 0;
  for (size_t i = 1; i < n-2; ++i) {
    for (size_t j = 1; j < m-2; ++j) {
      hash = 37*hash + M[i][j] + 7;
    }
  }
  bool is_new = hashin(L->visited, hash);
  if (is_new) {
    L->constellations++;
    L->last = L->accounted;
  }
  L->accounted++;
}

void life_birth9(life* L) {
  size_t const n0 = L->n0;
  size_t const n1 = L->n1;
  size_t const x = L->x0;
  size_t const y = L->x1;
  bool (*const restrict M)[n1] = L->Mv;
  for (size_t i = n0-4; i < n0-1; ++i) {
    size_t xi = ((x+i)%(n0-2)) + 1;
    for (int j = n1-4; j < n1-1; ++j) {
      size_t yj = ((y+j)%(n1-2)) + 1;
      M[xi][yj] = true;
    }
  }
  L->birth9++;
}

life* life_init(life* L, size_t n, size_t m, bool mat[static n][m]) {
  if (L) {
    L->n0 = n;
    L->n1 = m;
    L->off0 = 1;
    L->len0 = n-2;
    L->off1 = 1;
    L->len1 = m-2;
    L->visited = calloc(sizeof(bool), life_maxit);
    L->Mv = mat;
    mtx_init(&L->mtx, mtx_plain);
    cnd_init(&L->draw);
    cnd_init(&L->acco);
    cnd_init(&L->upda);
  }
  return L;
}

void life_destroy(life* L) {
  if (L) free(L->visited);
}
