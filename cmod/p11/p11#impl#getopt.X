// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module getopt = p11◼impl◼getopt
#pragma CMOD import str    = C◼str
#pragma CMOD import lib    = C◼lib
#pragma CMOD import io    = C◼io

#pragma CMOD atexit atexit

static void const** allocations;
static void const** allocations_base;
static C◼size allocations_len = 0;

void insert(void const* p) {
  C◼size len = allocations - allocations_base;
  if (len >= allocations_len) {
    void const** pb = lib◼realloc(allocations_base, sizeof(void**[2*allocations_len + 1]));
    if (!pb) return;
    allocations_base = pb;
    allocations_len = 2*allocations_len + 1;
    allocations = allocations_base + len;
    for (;len < allocations_len;++len)
      allocations_base[len] = 0;
  }
  *allocations = p;
  ++allocations;
}

void atexit(void) {
  C◼size len = allocations - allocations_base;
  void const** tmp = allocations_base;
  allocations = 0;
  allocations_base = 0;
  for (C◼size i = 0; i < len; ++i) {
    lib◼free((void*)tmp[i]);
  }
  lib◼free((void*)tmp);
}
