#include "heron_k.h"

/**
 ** Simply works by repeated squaring.
 **/
double expk2(double a, unsigned k) {
  for (;;) {
    k /= 2u;
    if (!k) break;
    a *= a;
  }
  return a;
}

double expk_rec(double a, unsigned k) {
  switch (k)
  default: {
    if (k % 2u)
    case 3: {
      double ret = expk_rec(a, k/2u);
      ret *= ret;
      a *= ret;
    } else {
      /* If k is a power of 2, do something special. */
      if (k == (k & -k)) {
      case 4: a = expk2(a, k);
      } else {
        a = expk_rec(a, k/2u);
      case 2:
        a *= a;
      }
    }
  case 1:;
  }
  return a;
}

double frexp_np(double x, signed exp[static 1]) {
  if (x < 0.0) return -frexp_np(-x, exp);
  signed ret = 0;
  if (x > 0.0) {
    if (x < 0.5) {
      do {
        x *= 2.0;
        --ret;
      } while (x < 0.5);
    } else {
      while (x >= 1.0) {
        x *= 0.5;
        ++ret;
      }
    }
  }
  exp[0] = ret;
  return x;
}

double heron1_estimate(double a) {
  /* A first low quality estimate for the inverse. */
  signed e0; frexp_np(a, &e0);
  return
    (e0 <= 0
     ? expk_rec(2.0, 1-e0)
     : expk_rec(0.5, e0));
}

double heron1_estimate_dir_05(double a) {
  /* A table of double powers of 2. */
  /*Something like (2 << (2 << k)) if only that would be representable
     in an integer type. */
  double const tab[] = {
    0x1P+000,
    0x1P+001,
    0x1P+002,
    0x1P+004,
    0x1P+008,
    0x1P+016,
    0x1P+032,
    0x1P+064,
#if (DBL_MAX_EXP*FLT_RDXRDX) > 128
    0x1P+128,
#endif
#if (DBL_MAX_EXP*FLT_RDXRDX) > 256
    0x1P+256,
#endif
#if (DBL_MAX_EXP*FLT_RDXRDX) > 512
    0x1P+512,
#endif
#if (DBL_MAX_EXP*FLT_RDXRDX) > 1024
    0x1P+1024,
#endif
#if (DBL_MAX_EXP*FLT_RDXRDX) > 2048
    0x1P+2048,
#endif
#if (DBL_MAX_EXP*FLT_RDXRDX) > 4096
    0x1P+4096,
#endif
  };
  /* First estimate log2(log2(a)). This will be the most significant
     bit of the exponent that we are looking for. */
  enum { k_max = sizeof tab/sizeof tab[0], };
  unsigned k = 1u;
  while ((k < k_max) && (tab[k]*a < 1.0))
    ++k;
  double x = tab[k-1];
  a *= x;
  k -= 2u;
  /* Now test all the smaller bit positions in the exponent. */
  for (;k;--k) {
    if (tab[k]*a < 1.0) {
      a *= tab[k];
      x *= tab[k];
    }
  }
  return x;
}

double heron1_estimate_dir_10(double a) {
  /* A table of inverses of double powers of 2. */
  /* Something like 1.0/(2 << (2 << k)) if only that would be
     representable in an integer type. */
  double const tab[] = {
    0x1P-000,
    0x1P-001,
    0x1P-002,
    0x1P-004,
    0x1P-008,
    0x1P-016,
    0x1P-032,
    0x1P-064,
#if (DBL_MIN_EXP*FLT_RDXRDX) < -128
    0x1P-128,
#endif
#if (DBL_MIN_EXP*FLT_RDXRDX) < -256
    0x1P-256,
#endif
#if (DBL_MIN_EXP*FLT_RDXRDX) < -512
    0x1P-512,
#endif
#if (DBL_MIN_EXP*FLT_RDXRDX) < -1024
    0x1P-1024,
#endif
#if (DBL_MIN_EXP*FLT_RDXRDX) < -2048
    0x1P-2048,
#endif
#if (DBL_MIN_EXP*FLT_RDXRDX) < -4096
    0x1P-4096,
#endif
  };
  /* First estimate -log2(log2(a)). This will be the most significant
     bit of the exponent that we are looking for. */
  enum { k_max = sizeof tab/sizeof tab[0], };
  unsigned k = 1u;
  while ((k < k_max) && (tab[k]*a >= 0.5))
    ++k;
  double x = tab[k-1];
  a *= x;
  k -= 2u;
  /* Now test all the smaller bit positions in the exponent. */
  for (;k;--k) {
    if (tab[k]*a >= 0.5) {
      a *= tab[k];
      x *= tab[k];
    }
  }
  return x;
}

double heron1_estimate_dir(double a) {
  if (a < 0.5) return heron1_estimate_dir_05(a);
  else if (a >= 1.0) return heron1_estimate_dir_10(a);
  else return 1.0;
}

double heron1(double a) {
  double const epsP1 = 1.0 + 1E-9;
  double const epsM1 = 1.0 - 1E-9;
  double x = heron1_estimate_dir(a);
  /* We are close, correct with the Heron factor. */
  for (double prod = a*x;
       ((prod < epsM1) || (epsP1 < prod));
       prod = a*x) {
    x *= (2.0 - prod);
  }
  return x;
}

double expk(double a, signed k) {
  if (k < 0) return heron1(expk_rec(a, -k));
  if (k) return expk_rec(a, k);
  else return 1.0;
}

double heron(double a, signed k) {
  switch (k) {
  case 0: return 1.0;
  case 1: return a;
  }
  if (k < 0) return heron1(heron(a, -k));
  if (a <= 0.0) return 0.0;
  double const eps = 1E-12;
  double const k1 = heron1(k);
  double const a1 = heron1(a);
  double x = (1.0 + a)*k1;
  for (;;) {
    double xk1 = expk(x, k-1);
    double axk1 = a*heron1(xk1);
    if (fabs(1.0 - x*xk1*a1) < eps) break;
    x = ((k-1)*x + axk1)*k1;
  }
  return x;
}

/* A normal project would place the `main` in a different compilation
   unit. */
int main(int argc, char* argv[argc+1]) {
  /* Read the first command line argument for the exponent. */
  int k = strtol(argv[1], 0, 0);
  for (int i = 2; i < argc; ++i) {
    /* Read one command line argument as a double. */
    double const a = strtod(argv[i], 0);
    double const x = heron(a, k);
    signed e0; double m0 = frexp_np(x, &e0);
    signed e1; double m1 = frexp(x, &e1);
    printf("heron: a=%.5e,\tx=%.5e,\tx**k=%.20e, %gT%+d, %gT%+d\n",
           a, x, expk(x, k), m0, e0, m1, e1);
  }
  return EXIT_SUCCESS;
}
