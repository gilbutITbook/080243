#ifndef EUCLID_H
# define EUCLID_H 1

# include <stdlib.h>
# include <stdio.h>
# include <assert.h>

size_t gcd2(size_t a, size_t b) {
  assert(a <= b);                 /*@\label{gcd2-precondition}*/
  if (!a) return b;               /*@\label{gcd2-bottom}*/
  size_t rem = b % a;             /*@\label{gcd2-remainder}*/
  return gcd2(rem, a);            /*@\label{gcd2-recurse}*/
}

size_t gcd(size_t a, size_t b) {
  assert(a);
  assert(b);
  if (a < b)
    return gcd2(a, b);
  else
    return gcd2(b, a);
}

#endif
