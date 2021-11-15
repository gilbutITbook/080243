
# A file to describe dependencies for compilations used by the POSIX
# "make" utility, see http://pubs.opengroup.org/onlinepubs/9699919799/

# Ensure that we use strict POSIX make rules.
.POSIX :

# empty the list of suffixes
.SUFFIXES :
# C files, sources
.SUFFIXES : .c .h
# products, object files, make dependencies, assembler
.SUFFIXES : .o .d .s

# The choice of the compiler. Commonly available on POSIX systems are
# compilers called clang, gcc, icc or c99. Try them in this order if
# the following does not work for you.
#
# Here we used a "wrapper" for gcc that comes with the "musl" C
# library. This has the advatage to provide full support for C11
# threads that we need for the "experience" level. On some Linux
# distributions musl is available as packages 'musl', 'musl-dev',
# 'musl-tools'. Other Linux distributions such as Alpine directly ship
# with musl as their C library.
CC = /usr/local/musl/bin/musl-gcc
#CC = clang
#CC = gcc
#CC = icc
#CC = c99

# A collection of typical flags on a Linux box with gcc or clang

# First a choice of a C standard to which your code is conforming. The
# following should be the default for a recent compiler (2018). Other
# options could be -std=c11 or -std=gnu11.
STD = -std=gnu17

# Warning options. It is important that the compiler gives you all
# that he knows.
WAR = -Wall

# Optimization options. The ones here are my favorite, maximal
# optimization for the machine on which we are compiling and maximal
# separation of functions and data into different sections.
OPT = -O3 -march=native -fdata-sections -ffunction-sections

# For the gcc and friends the addition of this flag produces a make
# dependency file with suffix .d
DEP = -MD

# One source (terran.c) also needs my macro library P99. If you
# comment the following lines out, the compilation of that file will
# not work.  Adapt to the path on your system.
P99 = ../../orwl/p99-source/p99
INC = -I${P99}

CFLAGS = ${OPT} ${WAR} ${STD} ${INC} ${DEP}

# The linker flags. Here this corresponds to eliminate all of the
# collected sections that are finally not needed in the executable.
LDFLAGS = -Wl,--gc-sections
# in the link step we need our own library
LDLIBS = -L. -lmodernC
# sometime we will need the "math" library and also "real time"
LDLIBS = -lm -lrt

# C sources that produce an executable
ROURCES =					\
	basic_blocks.c				\
	basic_blocks2.c				\
	cat.c					\
	crash.c					\
	endianess.c				\
	euclid.c				\
	extern.c				\
	fibonacci2.c				\
	fibonacci3.c				\
	fibonacci4.c				\
	fibonacci5.c				\
	fibonacci6.c				\
	fibonacci.c				\
	fibonacciCache.c			\
	fibonacciRet.c				\
	generic.c				\
	getting-started.c			\
	heron.c					\
	heron-expanded.c			\
	heron_k.c				\
	lifetime.c				\
	locale.c				\
	macro_trace.c				\
	mbstrings-main.c			\
	numberline.c				\
	precision.c				\
	rationals.c				\
	shadow.c				\
	sighandler_test.c			\
	strcpy.c				\
	strtoul.c				\
	tendots.c				\
	terran.c				\
	test_circular.c				\
	timespec.c				\
	va_arg.c				\
	yday.c


# Comment this out if your platform does not support the C11 thread model
TOURCES = B9.c B9-detach.c trampoline.c

SOURCES = ${ROURCES} ${TOURCES}

# Translation units (TU) that provide functionality that can be used
# by others. These are collected into the library libmodernC.a
RSOURCES =					\
	circular.c				\
	literals.c				\
	mbstrings.c				\
	sighandler.c				\
	stats.c

# Comment this out if your platform does not support the C11 thread model
TSOURCES = esc.c life.c termin.c

LSOURCES = ${RSOURCES} ${TSOURCES}

# TU that just prove a point.
OSOURCES =					\
	anonymous_function.c			\
	atomic_or_struct.c			\
	volatile_atomic.c

# Examples of bad TU that produce diagnostics when compiled
BSOURCES =					\
	getting-started-badly.c			\
	tgstring_test.c

# The following lines use the above to create new lists of files where
# the .c suffixes are replaced.
OBJECTS = ${SOURCES:.c=.o}

LOBJECTS = ${LSOURCES:.c=.o}

BOBJECTS = ${BSOURCES:.c=.o}

OOBJECTS = ${OSOURCES:.c=.o}

BINARIES = ${SOURCES:.c=}

DEPENDS = ${SOURCES:.c=.d} ${LSOURCES:.c=.d}

# This implicit rule tells how make is supposed to produce an object
# file (.o suffix) from a C file (.c suffix). This is needed to
# produce an executable file from your program.
#
# Here the make-special variable $< expands and to the dependency (the
# .o object file).
.c.o :
	${CC} ${CFLAGS} -c $<

# This implicit rule tells how make is supposed to produce an assembly
# file (.s suffix) from a C file (.c suffix). This is only needed if
# you want to inspect what your compiler produces from your code.
.c.s :
	${CC} ${CFLAGS} -S $<

# This implicit rule tells make that the dependency file (.d suffix)
# itself depends on the object file. This is a bit of a lie, because
# we will produce them along (see DEP above) when normally compiling.
.d.o :

# This implicit rule tells make that the final executable file (no
# suffix) depends on the object file (.o suffix). If your platform has
# a suffix for executables, e.g .exe, you'd have to add it here. On
# POSIX systems it is common to use the same compiler command (here
# ${CC}) also for linking.
#
# The additional make-special variable $@ expands to the target name
# (the executable).
.o :
	${CC} -o $@ ${LDFLAGS} $< ${LDLIBS}

# This is the first explicit target, so per default make will try to
# produce it. It is only here for the dependencies to all our
# executables, so all of these will be created, if possible.  Since
# this target has no rule of its own, a file named "binaries" will
# never be produced.
binaries : ${BINARIES}

# This rule tells make that all our executable files also depend on
# the archive 'libmodernC.a'.
${BINARIES} : libmodernC.a

# That archive depends on all the "LOBJECTS"
libmodernC.a : ${LOBJECTS}
	${AR} crf $@ $^

# This target needs some special command line arguments so it has its
# own production line.
tgstring.o : tgstring.h
	${CC} -D_TG_INLINE= -c -x c ${CFLAGS} -o tgstring.o tgstring.h

# An alternative target that just has all sources compiled.
objects : ${OBJECTS} ${LOBJECTS} ${OOBJECTS}

# Compilation of the "bad" objects will produce a lot of
# diagnostics. These are for demonstrative purposes, only.
bad : ${BOBJECTS}

# Linkage of the "bad" objects may produce executables that have
# unforseeable effects if they are run.
#
# ***** DO NOT USE THESE ****
#
# These are for demonstrative purposes, only.
verybad : ${BOBJECTS:.o=}

# They also depend on the library.
${BOBJECTS:.o=} : libmodernC.a

# Cleanup the directory from all files that we produce
clean :
	rm -f libmodernC.a ${DEPENDS} ${OBJECTS} ${LOBJECTS} ${OOBJECTS} ${BOBJECTS} ${BINARIES} ${BOBJECTS:.o=}

# Include all the produced dependency files. In POSIX, it is
# unspecified if "include" works with more than one file, but usually
# it does.
#
# The "-" in front tells make not to complain, if the dependency files
# to not exist, yet. If they are missing, make looks into its rules to
# see how to produce them, produces them and reads them.
#
# If the initial generation of make dependency files does not work for
# you, you could launch a compilation of all objects with
#
# make -i
-include ${DEPENDS}
