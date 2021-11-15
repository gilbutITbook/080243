#include "stats.h"

void stats_collect(stats* c, double val, unsigned moments);
void stats_collect0(stats* c, double val);
void stats_collect1(stats* c, double val);
void stats_collect2(stats* c, double val);
void stats_collect3(stats* c, double val);
double stats_samples(stats* c);
double stats_mean(stats* c);
double stats_var(stats* c);
double stats_sdev(stats* c);
double stats_rsdev(stats* c);
double stats_skew(stats* c);
double stats_var_unbiased(stats* c);
double stats_sdev_unbiased(stats* c);
double stats_rsdev_unbiased(stats* c);
