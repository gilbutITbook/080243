// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module p11◼snippet◼getopt◼unsigned
#pragma CMOD import str    = C◼str

#pragma CMOD declaration
#pragma CMOD snippet T = complete

int process(void* o, char const* c) {
  T*O = o;
  if (c && c[0]) {
    char* endptr = 0;
    *O = str◼toull(c, &endptr, 0);
    if (endptr) return str◼len(c);
  }
  return -1;
}
