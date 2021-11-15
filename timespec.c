#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <tgmath.h>

#include "stats.h"

/**
 ** @brief compute a time difference
 **
 ** This uses a @c double to compute the time. If we want to
 ** be able to track times without further loss of precision
 ** and have @c double with 52 bit mantissa, this
 ** corresponds to a maximal time difference of about 4.5E6
 ** seconds, or 52 days.
 **
 **/
double timespec_diff(struct timespec const* later,
                     struct timespec const* sooner){
  /* Be careful: tv_sec could be an unsigned type */
  if (later->tv_sec < sooner->tv_sec)
    return -timespec_diff(sooner, later);
  else
    return
      (later->tv_sec - sooner->tv_sec)
      /* tv_nsec is known to be a signed type. */
      + (later->tv_nsec - sooner->tv_nsec) * 1E-9;
}

uint64_t volatile s;

int main(int argc, char* argv[argc+1]) {
  if (argc < 2) {
    fprintf(stderr, "Usage: %s NNN, NNN iterations\n",
            argv[0]);
    return EXIT_FAILURE;
  }
  enum { probes = 10, loops = 7, };
  uint64_t iterations = strtoull(argv[1], 0, 0);
  uint64_t upper = iterations*iterations;

  stats statistic[loops] = { 0 };

  struct timespec tdummy;
  stats sdummy[4] = { 0 };

  for (unsigned probe = 0; probe < probes; ++probe) {
    uint64_t accu0 = 0;
    uint64_t accu1 = 0;
    struct timespec t[loops+1] = { 0 };
    timespec_get(&t[0], TIME_UTC);
    /* Volatile for i ensures that the loop is effected */
    for (uint64_t volatile i = 0; i < iterations; ++i) {
      /* do nothing */
    }
    timespec_get(&t[1], TIME_UTC);
    /* s must be volatile to ensure that the loop is effected */
    for (uint64_t i = 0; i < iterations; ++i) {
      s = i;
    }
    timespec_get(&t[2], TIME_UTC);
    /* Opaque computation ensures that the loop is effected */
    for (uint64_t i = 1; accu0 < upper; i += 2) {
      accu0 += i;
    }
    timespec_get(&t[3], TIME_UTC);
    /* A function call can usually not be optimized out. */
    for (uint64_t i = 0; i < iterations; ++i) {/*@\label{ln:accumulate}*/
      timespec_get(&tdummy, TIME_UTC);
      accu1 += tdummy.tv_nsec;
    }
    timespec_get(&t[4], TIME_UTC);
    /* A function call can usually not be optimized out, but
       an inline function can. */
    for (uint64_t i = 0; i < iterations; ++i) {/*@\label{ln:collect1}*/
      timespec_get(&tdummy, TIME_UTC);
      stats_collect1(&sdummy[1], tdummy.tv_nsec);
    }
    timespec_get(&t[5], TIME_UTC);
    for (uint64_t i = 0; i < iterations; ++i) {/*@\label{ln:collect2}*/
      timespec_get(&tdummy, TIME_UTC);
      stats_collect2(&sdummy[2], tdummy.tv_nsec);
    }
    timespec_get(&t[6], TIME_UTC);
    for (uint64_t i = 0; i < iterations; ++i) {/*@\label{ln:collect3}*/
      timespec_get(&tdummy, TIME_UTC);
      stats_collect3(&sdummy[3], tdummy.tv_nsec);
    }
    timespec_get(&t[7], TIME_UTC);
    /* make sure to use values of volatiles after the loop */
    printf("s, %zu iterations, accu0 %zx, accu1 %zx\n", s, accu0, accu1);
    for (size_t moment = 1; moment < 4; ++moment) {
      double mean = stats_mean(&sdummy[moment]);
      double sdev  = stats_rsdev_unbiased(&sdummy[moment]);
      double skew  = stats_skew(&sdummy[moment]);
      printf("%zu moments: average value of nsec\t%5.4g\t± %g%% (%g skew)\n",
             moment, mean, 100.0*sdev, skew);
    }

    for (unsigned i = 0; i < loops; i++) {
      double diff = timespec_diff(&t[i+1], &t[i]);
      stats_collect2(&statistic[i], diff);
    }

  }

  for (unsigned i = 0; i < loops; i++) {
    double mean = stats_mean(&statistic[i]);
    double rsdev  = stats_rsdev_unbiased(&statistic[i]);
    printf("loop %u: E(t) (sec):\t%5.2e ± %4.02f%%,\tloop body %5.2e\n",
           i, mean, 100.0*rsdev, mean/iterations);
  }


  return EXIT_SUCCESS;
}
