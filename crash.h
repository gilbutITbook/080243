#ifndef CRASH_H
#define CRASH_H 1

/**
 ** @brief enable alignment check for i386 processors
 **
 ** Intel's i386 processor family is quite tolerant in accepting
 ** misalignment of data. This can lead to irritating bugs when ported
 ** to other architectures that are not as tolerant.
 **
 ** This function enables a check for this problem also for this
 ** family or processors, such that you can be sure to detect this
 ** problem early.
 **
 ** I found that code on Ygdrasil's blog:
 ** http://orchistro.tistory.com/206
 **/

inline
void enable_alignment_check(void) {
#if defined(__GNUC__)
# if defined(__x86_64__)
  __asm__("pushf\n"
          "\torl $0x40000, (%%rsp)\n"
          "\tpopf"
          : : : "cc");
# elif defined(__i386__)
  __asm__("pushf\n"
          "\torl $0x40000, (%%esp)\n"
          "\tpopf"
          : : : "cc");
# endif
#endif
}


#endif
