// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module hop		=	cmod◼hop
/* Import library */
#pragma CMOD import def		=	C◼def
#pragma CMOD import io		=	C◼io
#pragma CMOD import printf	=	C◼io◼printf
#pragma CMOD import fputs	=	C◼io◼fputs
#pragma CMOD import va		=	C◼va
#pragma CMOD import lib		=	C◼lib
/* Import code snippets */
#pragma CMOD import INIT	=	C◼snippet◼INITIALIZER
#pragma CMOD import ini		=	C◼snippet◼init
#pragma CMOD import allo	=	C◼snippet◼alloc
/* Import other stuff */
#pragma CMOD import symb	=	cmod◼symbols


#pragma CMOD declaration

struct hop {
  unsigned a;
  double b;
}

#pragma CMOD definition

int func(symb◼ttt a) {
  int c;
  hop A = { .b = symb◼oo_b+symb◼func(a), };
  lib◼srand((C◼ptrdiff)(void*)&c);
  return printf("hop: %g %d\n", A.b, lib◼rand());
}

int vfprintf(hop* h, io *stream, const char *format, va ap) {
  io◼fprintf(stream, "----- %s: hop of %u and %g -------------------\n", __MODULE__, h->a, h->b);
  int ret = io◼vfprintf(stream, format, ap);
  fputs("-------------------------------------------\n", stream);
  return ret;
}

int fprintf(hop* h, io *stream, const char *format, ...) {
  va ap;
  va◼start(ap, format);
  int ret = vfprintf(h, stream, format, ap);
  va◼end(ap);
  return ret;
}
