
TARGET = cmod\#test libcmod.a libC.a

CMOD=./Cmod
MAKEHEADER=./makeheader

TOOLS = ${CMOD} ${MAKEHEADER}

CMODEP = ${CMOD} -M

CFLAGS	?= -std=c11 -Wall -O3 -march=native -fno-common -fdata-sections -ffunction-sections
LDFLAGS ?= -Wl,--gc-sections -L. -lC

.SECONDEXPANSION:
target : ${TARGET} $${DEPENDCIES} # ${OBJECTS}

libC.a :
	${MAKE} -C C libC.a
	mv C/libC.a .

libcmod.a : libC.a
	${MAKE} -C example libcmod.a
	mv example/libcmod.a .

cmod\#test : libC.a libcmod.a
	CMOD_ARCHIVES=./libC.a ${CMOD}  libcmod.a -o cmod\#test ${CFLAGS} ${LDFLAGS}

makeheaders.a : makeheaders.X libC.a Cmod
	CMOD_ARCHIVES=./libC.a ${CMOD}  -c ${CFLAGS} ${LDFLAGS} makeheaders.X

makeheaders2 : libC.a makeheaders.a
	CMOD_ARCHIVES=./libC.a ${CMOD}  makeheaders.a -o makeheaders2 ${CFLAGS} ${LDFLAGS}

all : depend ${OBJECTS}

clean :
	make -C C clean
	make -C example clean
	rm -f ${SOURCES:.X=.dep} ${OBJECTS} ${TARGET}

depend : ${SOURCES:.X=.dep}

-include ${SOURCES:.X=.dep} $${DEPENDCIES}
