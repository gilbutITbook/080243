// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module                     cmod◼test
#pragma CMOD import integer	=	C◼integer
#pragma CMOD import cenv	=	C◼cenv
#pragma CMOD import errno 	=	C◼errno
#pragma CMOD import bool	=	C◼bool
#pragma CMOD import io		=	C◼io
#pragma CMOD import printf	=	C◼io◼printf
#pragma CMOD import puts	=	C◼io◼puts
#pragma CMOD import lib		=	C◼lib
#pragma CMOD import str		=	C◼str
#pragma CMOD import stringsort	=	C◼str◼qsort
#pragma CMOD import stringsearch=	C◼str◼bsearch
#pragma CMOD import usearch	=	C◼unsigned◼bsearch
#pragma CMOD import assert	=	C◼assert
#pragma CMOD import atomic	=	C◼atomic
#pragma CMOD import flag	=	C◼atomic◼flag
#pragma CMOD import time	=	C◼time
#pragma CMOD import cal		=	C◼time◼cal
#pragma CMOD import locale	=	C◼locale
#pragma CMOD import float	=	C◼real◼float
#pragma CMOD import double	=	C◼real◼double
#pragma CMOD import ldouble	=	C◼real◼ldouble
#pragma CMOD import complex	=	C◼complex
#pragma CMOD import cf		=	C◼complex◼float
#pragma CMOD import cd		=	C◼complex◼double
#pragma CMOD import cl		=	C◼complex◼ldouble
#pragma CMOD import math	=	C◼math
#pragma CMOD import size	=	C◼size
#pragma CMOD import sizesort	=	C◼size◼qsort
#pragma CMOD import list	=	C◼size◼list
#pragma CMOD import thrd	=	C◼thrd
#pragma CMOD import mtx		=	C◼thrd◼mtx
#pragma CMOD import mod		=	C◼mod
#pragma CMOD import symb	=	cmod◼symbols
#pragma CMOD import hop		=	cmod◼hop

#pragma CMOD init init
#pragma CMOD atexit atexit
#pragma CMOD entry main


#ifndef atomic◼NO_ATOMICS
flag myflag = flag◼INIT;
_Atomic size counter = atomic◼INIT(0);
#endif

#ifndef thrd◼NO_THREADS
mtx bottleneck;
int thread(void* arg) {
  unsigned* Arg = arg;
#ifndef atomic◼NO_ATOMICS
  if (!flag◼test_and_set(&myflag)) {
    printf("the thread was the first on the flag, %zu\n", ++counter);
  } else {
    printf("the thread was the second on the flag, %zu\n", ++counter);
  }
#endif
  mtx◼lock(&bottleneck);
  printf("we received argument %u\n", *Arg);
  mtx◼unlock(&bottleneck);
  return *Arg/2;
}

void init(void) {
  printf("initializing module %s\n", __MODULE__);
  mtx◼init(&bottleneck, mtx◼plain);
}
void atexit(void) {
  mtx◼destroy(&bottleneck);
  printf("cleanup for module %s\n", __MODULE__);
}
void module_at_quick_exit(void) {
  mtx◼destroy(&bottleneck);
}
#endif

void header(char const* title) {
  for(size len = printf("\n+++++ %s ", title);
      len < 80;
      ++len)
    io◼putc('+', io◼out);
  io◼putc('\n', io◼out);
}


/* This is almost like a normal "main" */
int main(int argc, char* argv[]) {

  header("programming environment");
  printf("C locale is identified by	%s\n", locale◼C);
  printf("available native locale is	%s\n", locale◼def);
  locale◼set(locale◼ALL, "");
  printf("used locale◼set to switch to the native locale\n");
  ++symb◼zero.eins;
  symb◼oo oo = 1;
  hop* h = hop◼alloc(3, 0);
  mod◼set("➕" __SEPARATOR__);

  header("some math");
  printf("type generic abs is %sworking for floating point and integers: %lu\n",
            (sizeof math◼abs(I) == sizeof(float) ? "" : "not "),
            math◼abs(-42L));
  printf("type generic min is %sworking: %g\n",
            (math◼min(0.1, 1, 7, 0.01, 0.011) == 0.01 ? "" : "not "),
            math◼min(0.1, 1, 7, 0.01, 0.011));
  printf("different precisions of \u03C0: %.20g, %.20g, %.40Lg\n",
            float◼PI, double◼PI, ldouble◼PI);
  complex◼double C = math◼cmplx(7.f, 8);
  printf("line %d, printing a complex number %g%+g*I\n", C◼LINE, cd◼real(C), cd◼imag(C));

  header("other modules");
  for (size i = 0; i < 3; ++i) {
    h[i].a = i;
    h[i].b = i*double◼PI;
    printf("In line %d, accessing different module functions found %s: %d %d %d %#lX %g\n",
              C◼LINE,
              symb◼take(symb◼func),
              symb◼func(symb◼zero),
              hop◼func(symb◼zero),
              oo,
              str◼toul("-33", 0, 0),
              h[i].b);
  }

  header("sorting and searching");
  printf("check sort for an array partially produced with rand, and with multiple 0: ");
  size V[10] = { 0, 7, 3, lib◼rand(), lib◼rand(), 5, };
  sizesort(V, 10);
  for (size i = 0; i < 10; ++i) {
    printf("%zu ", V[i]);
  }
  puts("");

  puts("check string sorting:");
  char const* names[10] = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", };
  stringsort(names, 10);
  for (size i = 0; i < 10; ++i) {
    printf("%s ", names[i]);
  }
  puts("");

  puts("check string searching:");
  char const*const seek[] = { "three", "hundred", };
  size threepos = stringsearch(seek[0], names, 10) - names;
  printf("position of %s is %zu, n", seek[0], threepos);
  if (stringsearch(seek[1], names, 10)) {
    printf("string %s is in names, but it shouldn't\n", seek[1]);
  } else {
    printf("string %s is not in names, good\n", seek[1]);
  }

  puts("check unsigned searching, respect constness:");
  unsigned const uar[] = { 3, 6, 7, 9, 234, };
  unsigned const useek[] = { 9, 13, };
  unsigned const* upos = usearch(useek[0], uar, sizeof uar/sizeof uar[0]);
  printf("%u gives %u, ", 9u, *upos);
  if (usearch(useek[1], uar, sizeof uar/sizeof uar[0])) {
    printf("number %u is in uar, but it shouldn't, pointing to %u\n", useek[1], *upos);
  } else {
    printf("number %u is not in uar, good\n", useek[1]);
  }

  header("lists");
  list* head = 0;
  for (size i = 0; i < 10; ++i) {
    head = list◼push(head, 2*i);
  }
  while (head) {
    printf("%zu, ", list◼top(head));
    head = list◼drop(head);
  }
  printf("finished\n");

  header("call environment");
  C◼cenv callEnvironment;
  switch (C◼cenv◼set(callEnvironment)) {
  case 0:
    puts("before jmp.");
    C◼cenv◼jmp(callEnvironment, C◼errno◼RANGE);
  default:
    io◼fputs("we should never have come here\n", io◼err);
    break;
  case C◼errno◼RANGE:
    errno = C◼errno◼RANGE;
    puts("after jmp.");

    header("check errors through module function");
    hop◼fprintf(h, io◼err, "some numbers %g %hd: %s\n",
                8.8, (short)10,
                C◼errno◼tostr(C◼errno◼ILSEQ));
    io◼perror("what is that");
    errno = 0;
    break;
  }
  h = hop◼alloc(0, h);

  header("time");
  time t = time◼get(0);
  printf("current time: %s\n", time◼tostr(&t));
  cal* gm = time◼gm(&t);
  printf("current gm time: %s\n", cal◼tostr(gm));
  header("threads");
#ifndef thrd◼NO_THREADS
  mtx◼lock(&bottleneck);
  thrd id;
  unsigned arg = lib◼rand();
  int ret = thrd◼create(&id, thread, &arg);
  printf("started thread, %d\n", ret);
#ifndef atomic◼NO_ATOMICS
  header("atomics");
  if (!flag◼test_and_set(&myflag)) {
    printf("main was the first on the flag, %zu\n", ++counter);
  } else {
    printf("main was the second on the flag, %zu\n", ++counter);
  }
#endif
  mtx◼unlock(&bottleneck);
  thrd◼join(id, &ret);
  printf("thread joined, %d\n", ret);
#else
  printf("thread interface is not implemented, test skipped\n");
#endif
  header("assertions");
  puts("The following assertion should never trigger.");
  assert(1);
  puts("Ok.");
  puts("The following assertion should only be ignored when compiled with NDEBUG.");
  assert(0);
  puts("We only should see this if NDEBUG had been defined.");
  return 0;
}
