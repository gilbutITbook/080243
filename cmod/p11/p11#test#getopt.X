// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module          p11◼test◼getopt
#pragma CMOD import getopt = p11◼getopt
#pragma CMOD import str    = C◼str
#pragma CMOD import assert = C◼assert
#pragma CMOD import bool   = C◼bool
#pragma CMOD import io     = C◼io
#pragma CMOD import lib    = C◼lib

#pragma CMOD init init
#pragma CMOD entry getopt◼initialize
#pragma CMOD entry main

#pragma CMOD definition

unsigned u = 13u;
double x = 0;
bool flag = 0;
char const* ofile = 0;
char const* ifile = "super";


void init(void) {
  getopt◼synopsis(" a test for the getopt feature (" __MODULE__  ")");
  getopt◼author("Jens Gustedt");
  getopt◼SEPARATOR(0, 0, 0);
  getopt◼SEPARATOR(0, "--- test getopt ---", "all is here:");
  getopt◼DECLARE('u', u, "unsigned", "an unsigned");
  getopt◼DECLARE('f', flag, "toggle", "a Boolean flag");
  getopt◼DECLARE('x', x, "long", "a double for demonstrational purposes");
  getopt◼DECLARE('o', ofile, "out", "a string");
  getopt◼DECLARE('i', ifile, "ins", "a string");
  getopt◼SHORTCUT('s', 0, "--ins=toto", "predefined with only short option");
  getopt◼SHORTCUT(0, "inx", "--long=8999", "predefined with only long option");
  getopt◼USAGE(
        "Here you may tell them anything",
        "you like about your program.",
        "",
        "© Jens Gustedt, " __DATE__,
        );
}

int main(int argc, char* argv[argc+1]) {
  io◼printf("u is %u\n", u);
  io◼printf("flag is %d\n", flag);
  io◼printf("x is %g\n", x);
  io◼printf("ofile is %s\n", ofile);
  io◼printf("ifile is %s\n", ifile);
  for (C◼size i = 0; i < argc; ++i)
    io◼printf("argv[%zu] is %s\n", i, argv[i]);
  assert(!argv[argc]);
  return 0;
}
