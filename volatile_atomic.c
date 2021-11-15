#include <stdatomic.h>

/**
 ** @brief A simple accumulation in a loop
 **
 ** Any decent optimizer should be able to figure out that the return
 ** value is @c 100 and that the only side effect is to store the
 ** value @c 10 into @c *count.
 **/
unsigned accu(unsigned*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 9) {
    tmp = (*count)++;
    ret += 2*tmp +1;
  }
  return ret;
}

/**
 ** @brief @c volatile qualification
 **
 ** @c volatile forces all stores to be effected. So this has side
 ** effects of storing @f$0, \ldots, 10@f$ into @c *count.
 **/
unsigned accuv(unsigned volatile*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 9) {
    tmp = (*count)++;
    ret += 2*tmp +1;
  }
  return ret;
}

/**
 ** @brief @c _Atomic specification
 **
 ** Here, because it is not @c volatile, none of the side effects
 ** would have to be made visible before returning. Only there is an
 ** ambiguous phrase in the C standard:
 **
 ** <quote>
 ** Atomic read-modify-write operations shall always read the last
 ** value (in the modification order) stored before the write
 ** associated with the read-modify-write operation.
 ** </quote>
 **
 ** This can be read that for read-modify-write operations the read
 ** and write operations *must* be effected.
 **/
unsigned accua(_Atomic(unsigned)*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 9) {
    tmp = (*count)++;
    ret += 2*tmp +1;
  }
  return ret;
}

unsigned accuav(_Atomic(unsigned) volatile*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 9) {
    tmp = (*count)++;
    ret += 2*tmp +1;
  }
  return ret;
}

unsigned accuar(_Atomic(unsigned)*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  atomic_store_explicit(count, 0, memory_order_relaxed);
  while (tmp < 9) {
    tmp = atomic_fetch_add_explicit(count, 1u, memory_order_relaxed);
    ret += 2*tmp +1;
  }
  return ret;
}

unsigned accuavr(_Atomic(unsigned) volatile*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  atomic_store_explicit(count, 0, memory_order_relaxed);
  while (tmp < 9) {
    tmp = atomic_fetch_add_explicit(count, 1u, memory_order_relaxed);
    ret += 2*tmp +1;
  }
  return ret;
}

unsigned accut(unsigned*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 10) {
    ret += 2*tmp +1;
    (*count) = ++tmp;
  }
  return ret;
}

unsigned accutv(unsigned volatile*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 10) {
    ret += 2*tmp +1;
    (*count) = ++tmp;
  }
  return ret;
}

unsigned accuta(_Atomic(unsigned)*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 10) {
    ret += 2*tmp +1;
    (*count) = ++tmp;
  }
  return ret;
}

unsigned accutav(_Atomic(unsigned) volatile*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  (*count) = 0;
  while (tmp < 10) {
    ret += 2*tmp +1;
    (*count) = ++tmp;
  }
  return ret;
}

unsigned accutar(_Atomic(unsigned)*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  atomic_store_explicit(count, 0, memory_order_relaxed);
  while (tmp < 10) {
    ret += 2*tmp +1;
    atomic_store_explicit(count, ++tmp, memory_order_relaxed);
  }
  return ret;
}

unsigned accutavr(_Atomic(unsigned) volatile*restrict count) {
  unsigned ret = 0;
  unsigned tmp = 0;
  atomic_store_explicit(count, 0, memory_order_relaxed);
  while (tmp < 10) {
    ret += 2*tmp +1;
    atomic_store_explicit(count, ++tmp, memory_order_relaxed);
  }
  return ret;
}
