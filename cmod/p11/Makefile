
SOURCES =					\
	p11.X					\
	p11\#DEFARG.X				\
	p11\#DUPL.X				\
	p11\#EMPTY.X				\
	p11\#ENUM.X				\
	p11\#FOR.X				\
	p11\#ID10.X				\
	p11\#IF.X				\
	p11\#INT.X				\
	p11\#IS.X				\
	p11\#MAP.X				\
	p11\#NARG.X				\
	p11\#NARG1.X				\
	p11\#PASTE.X				\
	p11\#PRED.X				\
	p11\#PREF.X				\
	p11\#REP.X				\
	p11\#bool.X				\
	p11\#getopt.X				\
	p11\#impl.X				\
	p11\#impl\#getopt.X			\
	p11\#impl\#getopt\#bool.X		\
	p11\#impl\#getopt\#char.X		\
	p11\#impl\#getopt\#charp.X		\
	p11\#impl\#getopt\#double.X		\
	p11\#impl\#getopt\#float.X		\
	p11\#impl\#getopt\#ldouble.X		\
	p11\#impl\#getopt\#llong.X		\
	p11\#impl\#getopt\#long.X		\
	p11\#impl\#getopt\#schar.X		\
	p11\#impl\#getopt\#short.X		\
	p11\#impl\#getopt\#shortcut.X		\
	p11\#impl\#getopt\#signed.X		\
	p11\#impl\#getopt\#uchar.X		\
	p11\#impl\#getopt\#ullong.X		\
	p11\#impl\#getopt\#ulong.X		\
	p11\#impl\#getopt\#unsigned.X		\
	p11\#impl\#getopt\#ushort.X		\
	p11\#snippet.X				\
	p11\#snippet\#getopt.X			\
	p11\#snippet\#getopt\#float.X		\
	p11\#snippet\#getopt\#signed.X		\
	p11\#snippet\#getopt\#unsigned.X	\
	p11\#str.X				\
	p11\#test.X				\
	p11\#test\#getopt.X			\
	p11\#SKIP.X

OBJECTS = ${SOURCES:.X=.a}

TARGET = libp11.a
P99 = ${HOME}/build/orwl/p99-source/p99

CMOD=../Cmod
MAKEHEADER=../makeheader

TOOLS = ${CMOD} ${MAKEHEADER}

CMODEP = ${CMOD} -M

export CMOD_LEGSEP = _

CFLAGS	?= -I${P99} -std=c11 -Wall -O3 -g -march=native -fno-common -fdata-sections -ffunction-sections
LDFLAGS ?= -Wl,--gc-sections -L.. -lC


%.dep : %.X Makefile ../libC.a
	@CMOD_ARCHIVES=../libC.a ${CMODEP} $*.X -o $*.dep

%.a : %.dep %.X ${CMOD}
	CMOD_ARCHIVES=../libC.a ${CMOD} -c ${CFLAGS} ${LDFLAGS} $*.X

% : %.dep %.a ${CMOD}
	CMOD_ARCHIVES=../libC.a ${CMOD}  $*.a -o $* ${CFLAGS} ${LDFLAGS}

.SECONDEXPANSION:
target : ${TARGET} $${DEPENDCIES} # ${OBJECTS}

libp11.a : ${OBJECTS}
	$(shell TMP=$$(mktemp -d) ;                   \
	 cp ${OBJECTS} $${TMP} ;                      \
	 cd $${TMP} ;                                 \
	 for f in *.a ; do ar x $$f ; rm $$f ; done ; \
	 ar rs $(shell pwd)/libp11.a * ;              \
	 rm * ;                                       \
	 cd .. ;                                      \
	 rmdir $${TMP})

libp11.dep : ${DEPS}
	cat ${DEPS} > libp11.dep


all : depend ${OBJECTS}

clean :
	rm -f ${SOURCES:.X=.dep} ${OBJECTS} ${TARGET}

depend : ${SOURCES:.X=.dep}

-include ${SOURCES:.X=.dep} $${DEPENDCIES}
