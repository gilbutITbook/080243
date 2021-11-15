#include <stdio.h>

void fgoto(unsigned n) {
  unsigned j = 0;
  unsigned* p = 0;
  unsigned* q;
 AGAIN:
  if (p) printf("%u: p and q are %s, *p is %u\n",
                j,
                (q == p) ? "equal" : "unequal",
                *p);
  q = p;
  p = &((unsigned){ j, });
  ++j;
  if (j <= n) goto AGAIN;
}

void fgotoblock(unsigned n) {
  unsigned j = 0;
  unsigned* p = 0;
  unsigned* q;
 AGAIN:
  {
    if (p) printf("%u: p and q are %s, *p is %u\n",
                  j,
                  (q == p) ? "equal" : "unequal",
                  *p);
    q = p;
    p = &((unsigned){ j, });
    ++j;
    if (j <= n) goto AGAIN;
  }
}

__attribute__((noinline))
void ffor1(void) {
  unsigned j = 1;
  printf("%u: p and q are %s, *p is %u\n",
         j,
         "unequal",
         j-1);
}

__attribute__((noinline))
void fforn(unsigned n) {
  ffor1();
  for (unsigned j = 2; j <= n; ++j) {
    printf("%u: p and q are %s, *p is %u\n",
           j,
           "equal",
           j-1);
  }
}

void ffor(unsigned n) {
  switch (n) {
  case 0: break;
  case 1: ffor1(); break;
  default: fforn(n); break;
  }
}

void fVLA(unsigned n) {
  unsigned volatile j = 0;
  unsigned* p = 0;
  unsigned* q;
 AGAIN:
  {
    if (p) printf("%u: p and q are %s\n",
                  j,
                  (q == p) ? "equal" : "unequal");
    q = p;
    unsigned VLA[j+1];
    for (unsigned i = 0; i <= j; ++i)
      VLA[i] = j;
    p = VLA;
    ++j;
    if (j <= n) goto AGAIN;
  }
}



int main(int argc, char* argv[]) {
  fgoto(argc+1);
  fgotoblock(argc+1);
  ffor(argc+1);
}
