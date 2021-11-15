
SOURCES =					\
	cmod.X					\
	cmod\#hop.X				\
	cmod\#symbols.X				\
	cmod\#test.X

OBJECTS = ${SOURCES:.X=.a}

TARGET = libcmod.a

CMOD=../Cmod
MAKEHEADER=../makeheader

TOOLS = ${CMOD} ${MAKEHEADER}

CMODEP = ${CMOD} -M

export CMOD_LEGSEP ?= _

CFLAGS	?= -std=c11 -Wall -O3 -march=native -fno-common -fdata-sections -ffunction-sections ${COPTS}
LDFLAGS ?= -Wl,--gc-sections -L. -lC

%.dep : %.X Makefile ../libC.a
	@CMOD_ARCHIVES=../libC.a ${CMODEP} $*.X -o $*.dep

%.a : %.dep %.X ${CMOD}
	CMOD_ARCHIVES=../libC.a ${CMOD} -c ${CFLAGS} ${LDFLAGS} $*.X

% : %.dep %.a ${CMOD}
	CMOD_ARCHIVES=../libC.a ${CMOD}  $*.a -o $* ${CFLAGS} ${LDFLAGS}

.SECONDEXPANSION:
target : ${TARGET} $${DEPENDCIES} # ${OBJECTS}

libcmod.a : ${OBJECTS}
	$(shell TMP=$$(mktemp -d) ;                   \
	 cp ${OBJECTS} $${TMP} ;                      \
	 cd $${TMP} ;                                 \
	 for f in *.a ; do ar x $$f ; rm $$f ; done ; \
	 ar rs $(shell pwd)/libcmod.a * ;             \
	 rm * ;                                       \
	 cd .. ;                                      \
	 rmdir $${TMP})

libcmod.dep : ${DEPS}
	cat ${DEPS} > libcmod.dep


all : depend ${OBJECTS}

clean :
	rm -f ${SOURCES:.X=.dep} ${OBJECTS} ${TARGET}

depend : ${SOURCES:.X=.dep}

-include ${SOURCES:.X=.dep} $${DEPENDCIES}
