#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "p99_constraint.h"

/*
   terran multiplicative factors between units that are fixed for
   Lunar, Day, Hour, Minute, Second
*/
enum { dl = 28, hd = 24, mh = 60, sm = 60, sh = mh*sm, sd = hd * mh * sm, };

/*
  There is a long term period of 128 years, that has exactly 31 leap
  years. This amounts to 46751 days.
*/
enum { dy = 365, yp = 128, dp = yp*dy + 31, };

/*
   Then, periods of four years are grouped together, that have either
   0 or 1 leap year.
*/
enum { yq = 4, dq0 = yq*dy, dq1 = dq0 + 1, };

time_t isotime(char const t[static 1]) {
  struct tm date[1] = {
    [0] = { .tm_year = 1900,.tm_mon = 1, },
  };
  int retscan = sscanf(t, "%i-%i-%i %i:%i:%i",
                       &date->tm_year, &date->tm_mon, &date->tm_mday,
                       &date->tm_hour, &date->tm_min, &date->tm_sec);
  if (retscan <= 0) {
    if (errno) perror("can't scan");
    return 0;
  }
  date->tm_year -= 1900;
  date->tm_mon -= 1;
  return mktime(date);
  /* gmtime_s(&ret, date); */
  /* return mktime(date); */
}

void time2terran(time_t t) {
  /* Provide us with the terran epoch. This is not as easy as it may
     appear as a first site, since it is difficult to express a UTC
     timestamp in a struct tm: we have convert back and forth with
     mktime and gmtime to obtain the correct timestamp at 1969-12-22 0:0:0.
   */
  struct tm terranEpoch[1] = {
    {
      .tm_year = 69, // year starts at 1900
      .tm_mon = 11,  // mon starts at 0
      .tm_mday = 23, // mday starts at 1
    },
  };
  time_t epoch = mktime(terranEpoch);
  struct tm terranEpoch2[1];
  gmtime_s(&epoch, terranEpoch2);
  time_t epoch2 = mktime(terranEpoch2);
  terranEpoch[0].tm_sec += difftime(epoch2, epoch);
  epoch = mktime(terranEpoch);

  /* Now that we have the appropriate epoch, look how many seconds
     have passed since then.
  */
  long secs = difftime(t, epoch);
  long days = secs/sd;
  secs -= days*sd;

  /*
    adjust with respect to the 128 year periods
   */
  long per = days / dp;
  if (days < 0) {
    per -= 1;
  }
  long year = per * yp;
  days -= per*dp;

  // the first four years aren't leap years
  if (days < dq0) {
    year += (days / dy);
    days -= (days / dy) * dy;
  } else {
    // correct for the first 4 years
    year += yq;
    days -= dq0;
    /*
       In the remaining period every fourth year starting with year 0
       is a leap year. Compute the amount of such 4 year periods and
       adjust
    */
    long const qer = days / dq1;
    year += qer*yq;
    days %= dq1;
    // the first year is a leap year
    if (days > dy+1) {
      // adjust for that leap year
      year += 1;
      days -= (dy+1);
      // compute the remaining days
      year += (days / dy);
      days %= dy;
    }
  }
  size_t const lunar = days / dl;
  days %= dl;
  while (secs < 0) secs += sd;
  size_t hour = secs / sh;
  secs -= hour*sh;
  size_t min = secs / sm;
  secs %= sm;
  printf("%ld.%ld.%ld,%ld:%ld:%ld TC\n", year, lunar, days, hour, min, secs);
}

int main (int argc, char* argv[argc+1]) {
  time_t now = time(0);
  time2terran(now);
  for (int i = 1; i < argc; ++i)
    time2terran(isotime(argv[i]));
  return EXIT_SUCCESS;
}
