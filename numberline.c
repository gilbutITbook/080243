#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>

/**
 ** @brief interpret string @a lbuf as a sequence of numbers
 ** represented with @a base
 **
 ** @return a newly allocated array of numbers as found in @a lbuf
 ** @param lbuf is supposed to be a string
 ** @param np if non-null, the count of numbers is stored in
 **   @c *np
 ** @param base value from 0 to 36, with the same interpretation
 **   as for @c strtoul
 **
 ** @remark The caller of this function is responsible to @c
 ** free the array that is returned.
 **/
size_t* numberline(size_t size, char const lbuf[restrict size],
                   size_t*restrict np, int base);

/**
 ** @brief read one text line of at most <code>size-1</code>
 ** bytes. The <code>'\n'</code> character is replaced by @c 0.
 **
 ** @return s if an entire line was read
 ** successfully. Otherwise, @c 0 is returned and @a s contains
 ** a maximal partial line that could be read. @a s is null
 ** terminated.
 **/
char* fgetline(size_t size, char s[restrict size],
               FILE*restrict stream);


#include <limits.h>
#include <errno.h>
#ifndef EFAULT
# define EFAULT EDOM
#endif
#ifndef EOVERFLOW
# define EOVERFLOW (EFAULT-EOF)
# if EOVERFLOW > INT_MAX
#  error EOVERFLOW constant is too large
# endif
#endif
#ifndef ENOMEM
# define ENOMEM (EOVERFLOW+EFAULT-EOF)
# if ENOMEM > INT_MAX
#  error ENOMEM constant is too large
# endif
#endif

/**
 ** @brief print a series of numbers @a nums on @a stream, using
 ** @c printf format @a form, separated by @a sep characters and
 ** terminated with a newline character.
 **
 ** @return the number of characters printed to @a stream, or a
 ** negative error value on error.
 **
 ** If @a len is @c 0, an empty line is printed and @c 1 is
 ** returned.
 **
 ** Possible error returns are:
 ** - <code>EOF</code> (which is negative) if @a stream was not
 **   ready to be written to
 ** - <code>-EOVERFLOW</code> if more than <code>INT_MAX</code>
 **   characters would have to be written, including the case
 **   that @a len is greater than <code>INT_MAX</code>.
 ** - <code>-EFAULT</code> if @a stream or @a numb are @c 0
 ** - <code>-ENOMEM</code> if a memory error occurred
 **
 ** This function leaves <code>errno</code> to the same value as
 ** occurred on entry.
 **/
int fprintnumbers(FILE*restrict stream,
                  char const form[restrict static 1],
                  char const sep[restrict static 1],
                  size_t len, size_t numb[restrict len]);

/**
 ** @brief print a series of numbers @a nums in @a buf, using @c
 ** printf format @a form, separated by @a sep characters and
 ** terminated with a newline character.
 **
 ** @return the number of characters printed to @a buf.
 **
 ** This supposes that @a tot and @a buf are big enough and
 ** that @a form is a format suitable to print @c size_t.
 **/
int sprintnumbers(size_t tot, char buf[restrict tot],
                  char const form[restrict static 1],
                  char const sep[restrict static 1],
                  size_t len, size_t nums[restrict len]);

static
size_t numberline_inner(char const*restrict act,
                        size_t numb[restrict], int base){
  size_t n = 0;
  for (char* next = 0; act[0]; act = next) {
    numb[n] = strtoull(act, &next, base);
    if (act == next) break;
    ++n;
  }
  return n;
}

size_t* numberline(size_t size, char const lbuf[restrict size],
                   size_t*restrict np, int base){
  size_t* ret = 0;
  size_t n = 0;
  /* Check for validity of the string, first. */
  if (memchr(lbuf, 0, size)) {
    /* The maximum number of integers encoded.
       To see that this may be as much look at
       the sequence 08 08 08 08 ... and suppose
       that base is 0. */
    ret = malloc(sizeof(size_t[1+(2*size)/3]));

    n = numberline_inner(lbuf, ret, base);

    /* Supposes that shrinking realloc will always succeed. */
    size_t len = n ? n : 1;
    ret = realloc(ret, sizeof(size_t[len]));
  }
  if (np) *np = n;
  return ret;
}

char* fgetline(size_t size, char s[restrict size],
               FILE*restrict stream){
  s[0] = 0;
  char* ret = fgets(s, size, stream);
  if (ret) {
    /* s is writable so can be pos. */
    char* pos = strchr(s, '\n');
    if (pos) *pos = 0;
    else ret = 0;
  }
  return ret;
}

static inline int error_cleanup(int err, int prev) {
  errno = prev;
  return -err;
}

int sprintnumbers(size_t tot, char buf[restrict tot],
                  char const form[restrict static 1],
                  char const sep[restrict static 1],
                  size_t len, size_t nums[restrict len]) {
  char* p = buf;   /* next position in buf */
  size_t const seplen = strlen(sep);
  if (len) {
    size_t i = 0;
    for (;;) {
      p += sprintf(p, form, nums[i]);
      ++i;
      if (i >= len) break;
      memcpy(p, sep, seplen);
      p += seplen;
    }
  }
  memcpy(p, "\n", 2);
  return (p-buf)+1;
}

int fprintnumbers(FILE*restrict stream,
                  char const form[restrict static 1],
                  char const sep[restrict static 1],
                  size_t len, size_t nums[restrict len]) {
  if (!stream)       return -EFAULT;
  if (len && !nums)  return -EFAULT;
  if (len > INT_MAX) return -EOVERFLOW;

  size_t tot = (len ? len : 1)*strlen(sep);
  int err = errno;
  char* buf = 0;

  if (len) {
    /* Count the chars for the numbers. */
    for (size_t i = 0; i < len; ++i)
      tot += snprintf(0, 0, form, nums[i]);
    /* We return int so we have to constrain the max size. */
    if (tot > INT_MAX) return error_cleanup(EOVERFLOW, err);
  }

  buf = malloc(tot+1);
  if (!buf) return error_cleanup(ENOMEM, err);

  sprintnumbers(tot, buf, form, sep, len, nums);
  /* print whole line in one go */
  if (fputs(buf, stream) == EOF) tot = EOF;
  free(buf);
  return tot;
}

int fprintnumbers_opt(FILE*restrict stream,
                  char const form[restrict static 1],
                  char const sep[restrict static 1],
                  size_t len, size_t nums[restrict len]) {
  if (!stream)       return -EFAULT;
  if (len && !nums)  return -EFAULT;
  if (len > INT_MAX) return -EOVERFLOW;

  int err = errno;
  size_t const seplen = strlen(sep);

  size_t tot = 0;
  size_t mtot = len*(seplen+10);
  char* buf = malloc(mtot);

  if (!buf) return error_cleanup(ENOMEM, err);

  for (size_t i = 0; i < len; ++i) {
    tot += sprintf(&buf[tot], form, nums[i]);
    ++i;
    if (i >= len) break;
    if (tot > mtot-20) {
      mtot *= 2;
      char* nbuf = realloc(buf, mtot);
      if (buf) {
        buf = nbuf;
      } else {
        tot = error_cleanup(ENOMEM, err);
        goto CLEANUP;
      }
    }
    memcpy(&buf[tot], sep, seplen);
    tot += seplen;
    if (tot > INT_MAX) {
      tot = error_cleanup(EOVERFLOW, err);
      goto CLEANUP;
    }
  }
  buf[tot] = 0;

  /* print whole line in one go */
  if (fputs(buf, stream) == EOF) tot = EOF;
 CLEANUP:
  free(buf);
  return tot;
}

int main(void) {
  char lbuf[256];
  for (;;) {
    if (fgetline(sizeof lbuf, lbuf, stdin)) {
      size_t n;
      size_t* nums = numberline(strlen(lbuf)+1, lbuf, &n, 0);
      int ret = fprintnumbers(stdout, "%#zX", ",\t", n, nums);
      if (ret < 0) return EXIT_FAILURE;
      free(nums);
    } else {
      if (lbuf[0]) {  /* a partial line has been read */
        for (;;) {
          int c = getc(stdin);
          if (c == EOF) return EXIT_FAILURE;
          if (c == '\n') {
            fprintf(stderr, "line too long: %s\n", lbuf);
            break;
          }
        }
      } else break;   /* regular end of input */
    }
  }
}
