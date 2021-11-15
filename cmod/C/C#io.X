// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module io		=	C◼io
#pragma CMOD import va		=	C◼va
#pragma CMOD import 			C◼align
#pragma CMOD import 			C◼def
#pragma CMOD import			C◼int
#pragma CMOD import			C◼long
#pragma CMOD import 			C◼llong

#pragma CMOD mimic <stdio.h>
#pragma CMOD mimic <stdalign.h>

#pragma CMOD typedef io		=	FILE
/* fpos_t is usually not so easy to guess, so we will just emulate
   it. */
#pragma CMOD defexp FPOS_SIZE	=	sizeof(fpos_t)
#pragma CMOD defexp FPOS_ALIGN	=	alignof(fpos_t)

#pragma CMOD defexp			BUFSIZ
#pragma CMOD defexp			EOF
#pragma CMOD defexp			FILENAME_MAX
#pragma CMOD defexp			FOPEN_MAX
#pragma CMOD defexp			L_tmpnam
#pragma CMOD defexp CUR		=	SEEK_CUR
#pragma CMOD defexp END		=	SEEK_END
#pragma CMOD defexp SET		=	SEEK_SET
#pragma CMOD defexp			TMP_MAX
#pragma CMOD defexp FBF		=	_IOFBF
#pragma CMOD defexp LBF		=	_IOLBF
#pragma CMOD defexp NBF		=	_IONBF

#pragma CMOD define in		=	stdin
#pragma CMOD define out		=	stdout
#pragma CMOD define err		=	stderr
#pragma CMOD alias in		=	stdin
#pragma CMOD alias out		=	stdout
#pragma CMOD alias err		=	stderr

#pragma CMOD alias			clearerr
#pragma CMOD alias			fclose
#pragma CMOD alias			feof
#pragma CMOD alias			ferror
#pragma CMOD alias			fflush
#pragma CMOD alias			fgetc
#pragma CMOD alias			fgetpos
#pragma CMOD alias			fgets
#pragma CMOD alias			fopen
#pragma CMOD alias			fprintf
#pragma CMOD alias			fputc
#pragma CMOD alias			fputs
#pragma CMOD alias			fread
#pragma CMOD alias			freopen
#pragma CMOD alias			fscanf
#pragma CMOD alias			fseek
#pragma CMOD alias			fsetpos
#pragma CMOD alias			ftell
#pragma CMOD alias			fwrite
#pragma CMOD alias			getc
#pragma CMOD alias			getchar
#pragma CMOD alias			perror
#pragma CMOD alias			printf
#pragma CMOD alias			putc
#pragma CMOD alias			putchar
#pragma CMOD alias			puts
#pragma CMOD alias			remove
#pragma CMOD alias			rename
#pragma CMOD alias			rewind
#pragma CMOD alias			scanf
#pragma CMOD alias			setbuf
#pragma CMOD alias			setvbuf
#pragma CMOD alias			snprintf
#pragma CMOD alias			sprintf
#pragma CMOD alias			sscanf
#pragma CMOD alias			tmpfile
#pragma CMOD alias			tmpnam
#pragma CMOD alias			ungetc
#pragma CMOD alias			vfprintf
#pragma CMOD alias			vfscanf
#pragma CMOD alias			vprintf
#pragma CMOD alias			vscanf
#pragma CMOD alias			vsnprintf
#pragma CMOD alias			vsprintf
#pragma CMOD alias			vsscanf

#pragma CMOD declaration

/* fpos_t is usually not so easy to guess, so we will just emulate
   it. */
union fpos {
  char _invisible0[FPOS_SIZE];
#if FPOS_ALIGN == C◼int◼ALIGN
  int _invisible1;
#elif FPOS_ALIGN == C◼long◼ALIGN
  long _invisible2;
#elif FPOS_ALIGN == C◼llong◼ALIGN
  long long _invisible3;
#endif
};

typedef C◼size size;
#define NULL C◼NULL

extern io * in;
extern io * out;
extern io * err;

io *fopen(const char *restrict, const char *restrict);
io *freopen(const char *restrict, const char *restrict, io *restrict);
int fclose(io *);

int remove(const char *);
int rename(const char *, const char *);

int feof(io *);
int ferror(io *);
int fflush(io *);
void clearerr(io *);

int fseek(io *, long, int);
long ftell(io *);
void rewind(io *);

int fgetpos(io *restrict, fpos *restrict);
int fsetpos(io *, const fpos *);

size fread(void *restrict, size, size, io *restrict);
size fwrite(const void *restrict, size, size, io *restrict);

int fgetc(io *);
int getc(io *);
int getchar(void);
int ungetc(int, io *);

int fputc(int, io *);
int putc(int, io *);
int putchar(int);

char *fgets(char *restrict, int, io *restrict);
int fputs(const char *restrict, io *restrict);
int puts(const char *);

__attribute__((__format__(__printf__, 1, 2))) int printf(const char *restrict, ...);
__attribute__((__format__(__printf__, 2, 3))) int fprintf(io *restrict, const char *restrict, ...);
__attribute__((__format__(__printf__, 2, 3))) int sprintf(char *restrict, const char *restrict, ...);
__attribute__((__format__(__printf__, 3, 4))) int snprintf(char *restrict, size, const char *restrict, ...);

int vprintf(const char *restrict, va);
int vfprintf(io *restrict, const char *restrict, va);
int vsprintf(char *restrict, const char *restrict, va);
int vsnprintf(char *restrict, size, const char *restrict, va);

__attribute__((__format__(__scanf__, 1, 2))) int scanf(const char *restrict, ...);
__attribute__((__format__(__scanf__, 2, 3))) int fscanf(io *restrict, const char *restrict, ...);
__attribute__((__format__(__scanf__, 2, 3))) int sscanf(const char *restrict, const char *restrict, ...);
int vscanf(const char *restrict, va);
int vfscanf(io *restrict, const char *restrict, va);
int vsscanf(const char *restrict, const char *restrict, va);

void perror(const char *);

int setvbuf(io *restrict, char *restrict, int, size);
void setbuf(io *restrict, char *restrict);

char *tmpnam(char *);
io *tmpfile(void);

_STATIC_ASSERT(FPOS_SIZE == sizeof(fpos), "import of fpos to C◼fpos failed");
_STATIC_ASSERT(FPOS_ALIGN == alignof(fpos), "import of fpos to C◼fpos failed");
