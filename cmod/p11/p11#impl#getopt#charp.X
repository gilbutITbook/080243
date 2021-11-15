// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module T      = p11◼impl◼getopt◼charp
#pragma CMOD import          p11◼snippet◼getopt
#pragma CMOD import getopt = p11◼impl◼getopt
#pragma CMOD import          p11◼str
#pragma CMOD import str    = C◼str
#pragma CMOD import mem    = C◼mem
#pragma CMOD import lib    = C◼lib

#pragma CMOD declaration

typedef char const* T;

#pragma CMOD definition

int process(void* o, char const*c) {
  T*O = o;
  if (c) {
    C◼size len = str◼len(c)+1;
    *O = mem◼cpy(lib◼malloc(len), c, len);
    getopt◼insert(*O);
    return len;
  }
  return -1;
}
