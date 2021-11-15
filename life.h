#include <stdbool.h>
#include <ctype.h>
#ifndef __STDC_NO_THREADS__
# include <threads.h>
#else
# error This needs C11 threads, aborting.
#endif
#include <stdatomic.h>


enum { life_maxit = 1ull << 23, };

typedef struct life life;
struct life {
  mtx_t mtx;    //< Mutex that protects Mv
  cnd_t draw;   //< cnd that controls drawing
  cnd_t acco;   //< cnd that controls accounting
  cnd_t upda;   //< cnd that controls updating

  void*restrict Mv;            //< bool M[n0][n1];
  bool (*visited)[life_maxit]; //< Hashing constellations

  // A bunch of parameters that are not subject to change
  size_t n0;    //< Number of rows
  size_t n1;    //< Number of columns
  size_t off0;  //< Start row
  size_t len0;  //< Number of rows to be handled
  size_t off1;  //< Start column
  size_t len1;  //< Number of columns to be handled
  void* restrict Bv;  //< Unsigned char B[len0][len1];


  // Parameters that are updated but that are protected by the mutex
  size_t iteration;   //< Current iteration
  size_t accounted;   //< Last accounted iteration
  size_t drawn;       //< Last drawn iteration
  size_t last;        //< Last iteration with new state
  size_t birth9;      //< Number of birth9 calls

  // Parameters that will dynamically be changed by
  // different threads
  _Atomic(size_t) constellations; //< Constellations visited
  _Atomic(size_t) x0;             //< Cursor position, row
  _Atomic(size_t) x1;             //< Cursor position, column
  _Atomic(size_t) frames;         //< FPS for display
  _Atomic(bool)   finished;       //< This game is finished.
};

inline
void life_advance(life* L, signed t0, signed t1) {
  if (t0) {
    size_t n = L->n0-2;
    L->x0 = ((L->x0-1)+n+t0)%n + 1;
  }
  if (t1) {
    size_t n = L->n1-2;
    L->x1 = ((L->x1-1)+n+t1)%n + 1;
  }
}

int life_wait(cnd_t*, mtx_t*);
void life_sleep(double s);

void life_birth9(life*);
size_t life_update(life*restrict L);
void life_count(life*restrict L);
void life_draw(life*);
void life_draw4(life*);
void life_account(life*);
life* life_init(life*, size_t _n, size_t _m, bool[_n][_m]);
void life_destroy(life* L);
void life_torus(life*);

#define LIFE_INITIALIZER                        \
{                                               \
    .visited = 0,                               \
    .birth9 = 1,                                \
    .x0 = 1,                                    \
    .x1 = 1,                                    \
    .frames = 20,                               \
    .finished = false,                          \
    .constellations = 1,                        \
    .birth9 = 1,                                \
}
