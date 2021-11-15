	.section	.rodata
.L_STR_EQ:
	.string	"equal"
.L_STR_NE:
	.string	"unequal"
.L_STR_FRMT:
	.string	"%u: p and q are %s, *p is %u\n"
	.text
	.globl	fgoto
	.type	fgoto, @function
fgoto:
	pushq	%rbp               # Save base pointer
	movq	%rsp, %rbp         # Load stack pointer
	subq	$48, %rsp          # Adjust stack pointer
	movl	%edi, -36(%rbp)    # fgoto#0 => n
	movl	$0, -4(%rbp)       # init j
	movq	$0, -16(%rbp)      # init p
.L_AGAIN:
	cmpq	$0, -16(%rbp)      # if (p)
	je	.L_ELSE
	movq	-16(%rbp), %rax    #  p ==> rax
	movl	(%rax), %edx       # *p ==> edx
	movq	-24(%rbp), %rax    # (   == q)?
	cmpq	-16(%rbp), %rax    # (p  ==  )?
	jne	.L_YES
	movl	$.L_STR_EQ, %eax   # Yes
	jmp	.L_NO
.L_YES:
	movl	$.L_STR_NE, %eax   # No
.L_NO:
	movl	-4(%rbp), %esi     # j     ==> printf#1
	movl	%edx, %ecx         # *p    ==> printf#3
	movq	%rax, %rdx         # eq/ne ==> printf#2
	movl	$.L_STR_FRMT, %edi # frmt  ==> printf#0
	movl	$0, %eax           # clear eax
	call	printf
.L_ELSE:
	movq	-16(%rbp), %rax    # p ==|
	movq	%rax, -24(%rbp)    #      ==> q
	movl	-4(%rbp), %eax     # j ==|
	movl	%eax, -28(%rbp)    #      ==> cmp_lit
	leaq	-28(%rbp), %rax    # &cmp_lit ==|
	movq	%rax, -16(%rbp)    #             ==> p
	addl	$1, -4(%rbp)       # ++j
	movl	-4(%rbp), %eax     # if (j
	cmpl	-36(%rbp), %eax    #       <= n)
	jbe	.L_AGAIN           # goto AGAIN
	leave                      # Rearange stack
	ret                        # return statement
.LFE0:
	.size	fgoto, .-fgoto
	.globl	fgotoblock
	.type	fgotoblock, @function
fgotoblock:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	$0, -4(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L9
.L14:
	nop
.L9:
	cmpq	$0, -16(%rbp)
	je	.L10
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jne	.L11
	movl	$.L_STR_EQ, %eax
	jmp	.L12
.L11:
	movl	$.L_STR_NE, %eax
.L12:
	movl	-4(%rbp), %esi
	movl	%edx, %ecx
	movq	%rax, %rdx
	movl	$.L_STR_FRMT, %edi
	movl	$0, %eax
	call	printf
.L10:
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -28(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, -16(%rbp)
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jbe	.L14
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	fgotoblock, .-fgotoblock
	.globl	ffor
	.type	ffor, @function
ffor:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	$0, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L16
.L20:
	cmpq	$0, -8(%rbp)
	je	.L17
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jne	.L18
	movl	$.L_STR_EQ, %eax
	jmp	.L19
.L18:
	movl	$.L_STR_NE, %eax
.L19:
	movl	-20(%rbp), %esi
	movl	%edx, %ecx
	movq	%rax, %rdx
	movl	$.L_STR_FRMT, %edi
	movl	$0, %eax
	call	printf
.L17:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	addl	$1, -20(%rbp)
.L16:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jbe	.L20
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	ffor, .-ffor
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$2, %edi
	call	fgoto
	movl	$2, %edi
	call	fgotoblock
	movl	$2, %edi
	call	ffor
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
