// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module          p11◼snippet◼getopt
#pragma CMOD import io = C◼io

#pragma CMOD declaration
#pragma CMOD snippet T = complete

int snprintf(char* str, C◼size size, void* arg) {
  T*p = arg;
  return io◼snprintf(str, size,
                     _Generic(p,
                     default: 0,
                              char**: "%s",
                              char const**: "%s",
                              char*: "%c",
                              _Bool*: "%d",
                              signed char*: "%hhd",
                              short*: "%hd",
                              signed*: "%d",
                              long*: "%ld",
                              long long*: "%lld",
                              unsigned char*: "%hhu",
                              unsigned short*: "%hu",
                              unsigned*: "%u",
                              unsigned long*: "%lu",
                              unsigned long long*: "%llu",
                              float*: "%.8g",
                              double*: "%.8g",
                              long double*: "%.8Lg"
                              ),
                     *p);
}
