#include<stdio.h>

unsigned add(unsigned* x, unsigned const* y) {
  return *x += *y;
}
int main(void) {
  unsigned a = 3;
  unsigned b = 5; 
  printf("a = %u, b = %u\n", add(&a, &b), add(&b, &a));
}
