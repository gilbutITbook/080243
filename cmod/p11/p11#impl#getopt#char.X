// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module T = p11◼impl◼getopt◼char
#pragma CMOD import p11◼snippet◼getopt

#pragma CMOD declaration

typedef char T;

#pragma CMOD definition

int process(void* o, char const*c) {
  T*O = o;
  if (c && c[0]) {
    *O = c[0];
    return 1;
  }
  return -1;
}
