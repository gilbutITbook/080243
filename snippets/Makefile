.SUFFIXES: .tex

FUNCTIONS =					\
	ANONYMOUS				\
	FLT_RDXRDX				\
	HBAR					\
	TOPLEFT					\
	TOPRIGHT				\
	VBAR					\
	circular				\
	circular_init				\
	circular_destroy                        \
	circular_new				\
	circular_delete				\
	circular_append				\
	circular_pop				\
	circular_element			\
	circular_getlength			\
	circular_resize				\
	circular_fput				\
	draw_sep				\
	enable_aligmnent_check                  \
	fgetline				\
	fprintnumbers				\
	heron					\
	mbrtow					\
	mbsrdup					\
	mbsrlen					\
	mbsrwc					\
	numberline				\
	sprintnumbers

TEXS = ${FUNCTIONS:=.tex}

doxygrep=../sed/doxygrep

%.tex :
	${doxygrep} $* $^ > $@

texs : ${TEXS}

ANONYMOUS.tex : ../latex/anonymous_function_8c.tex

numberline.tex fgetline.tex fprintnumbers.tex sprintnumbers.tex : ../latex/numberline_8c.tex

mbsrdup.tex mbsrlen.tex mbsrwc.tex mbrtow.tex : ../latex/mbstrings_8h.tex

VBAR.tex HBAR.tex TOPLEFT.tex TOPRIGHT.tex draw_sep.tex : ../latex/mbstrings-main_8c.tex

heron.tex FLT_RDXRDX.tex : ../latex/heron__k_8h.tex

enable_aligmnent_check.tex : ../latex/crash_8h.tex

circular.tex circular_init.tex circular_destroy.tex circular_new.tex circular_delete.tex circular_append.tex circular_pop.tex circular_element.tex circular_getlength.tex circular_resize.tex circular_fput.tex : ../latex/circular_8h.tex

${TEXS} : Makefile ${doxygrep}
