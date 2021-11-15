// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module T = p11◼impl◼getopt◼bool
#pragma CMOD import io= C◼io

#pragma CMOD declaration

typedef _Bool T;

#pragma CMOD definition

int process(void* o, char const*c) {
  T*O = o;
  *O = !*O;
  return 0;
}

int snprintf(char* str, C◼size size, void* arg) {
  T*p = arg;
  return io◼snprintf(str, size, "%s", *p ? "true" : "false");
}
