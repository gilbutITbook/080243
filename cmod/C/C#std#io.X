// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module C◼std◼io
#pragma CMOD import C◼io

/**
 ** @brief A module hierarchy that imports C library features one to
 ** one directly into the name space of the importer.
 **
 ** You only want to use these transitionally when migrating existing
 ** C source to Modular C.
 **/

#pragma CMOD snippet none
#pragma CMOD declaration

#define BUFSIZ	C◼io◼BUFSIZ
#define EOF	C◼io◼EOF
#define FILE	C◼io
#define FILENAME_MAX	C◼io◼FILENAME_MAX
#define FOPEN_MAX	C◼io◼FOPEN_MAX
#define L_tmpnam	C◼io◼L_tmpnam
#define NULL	C◼NULL
#define SEEK_CUR	C◼io◼CUR
#define SEEK_END	C◼io◼END
#define SEEK_SET	C◼io◼SET
#define TMP_MAX	C◼io◼TMP_MAX
#define _IOFBF	C◼io◼FBF
#define _IOLBF	C◼io◼LBF
#define _IONBF	C◼io◼NBF
#define stderr	C◼io◼err
#define stdin	C◼io◼in
#define stdout	C◼io◼out

typedef C◼io◼fpos fpos_t;
typedef C◼size size_t;

#define clearerr	C◼io◼clearerr
#define fclose	C◼io◼fclose
#define feof	C◼io◼feof
#define ferror	C◼io◼ferror
#define fflush	C◼io◼fflush
#define fgetc	C◼io◼fgetc
#define fgetpos	C◼io◼fgetpos
#define fgets	C◼io◼fgets
#define fopen	C◼io◼fopen
#define fprintf	C◼io◼fprintf
#define fputc	C◼io◼fputc
#define fputs	C◼io◼fputs
#define fread	C◼io◼fread
#define freopen	C◼io◼freopen
#define fscanf	C◼io◼fscanf
#define fseek	C◼io◼fseek
#define fsetpos	C◼io◼fsetpos
#define ftell	C◼io◼ftell
#define fwrite	C◼io◼fwrite
#define getc	C◼io◼getc
#define getchar	C◼io◼getchar
#define perror	C◼io◼perror
#define printf	C◼io◼printf
#define putc	C◼io◼putc
#define putchar	C◼io◼putchar
#define puts	C◼io◼puts
#define remove	C◼io◼remove
#define rename	C◼io◼rename
#define rewind	C◼io◼rewind
#define scanf	C◼io◼scanf
#define setbuf	C◼io◼setbuf
#define setvbuf	C◼io◼setvbuf
#define snprintf	C◼io◼snprintf
#define sprintf	C◼io◼sprintf
#define sscanf	C◼io◼sscanf
#define tmpfile	C◼io◼tmpfile
#define tmpnam	C◼io◼tmpnam
#define ungetc	C◼io◼ungetc
#define vfprintf	C◼io◼vfprintf
#define vfscanf	C◼io◼vfscanf
#define vprintf	C◼io◼vprintf
#define vscanf	C◼io◼vscanf
#define vsnprintf	C◼io◼vsnprintf
#define vsprintf	C◼io◼vsprintf
#define vsscanf	C◼io◼vsscanf
