	.file	"lifetime.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.L_STR_NE:
	.string	"unequal"
.L_STR_FRMT:
	.string	"%u: p and q are %s, *p is %u\n"
.L_STR_EQ:
	.string	"equal"
	.text
	.p2align 4,,15
	.globl	fgoto
	.type	fgoto, @function
fgoto:
	pushq	%rbp               # Save base pointer
	pushq	%rbx               # Save rbx register
	subq	$8, %rsp           # Adjust stack pointer
	movl	%edi, %ebp         # fgoto#0 => n
	movl	$1, %ebx           # init j, start with 1
	xorl	%ecx, %ecx         # 0    ==> printf#3
	movl	$.L_STR_NE, %edx   # "ne" ==> printf#2
	testl	%edi, %edi         # if (n > 0)
	jne	.L_N_GT_0
	jmp	.L_END
.L_AGAIN:
	movl	%eax, %ebx         # j+1  ==> j
.L_N_GT_0:
	movl	%ebx, %esi         # j    ==> printf#1
	movl	$.L_STR_FRMT, %edi # frmt ==> printf#0
	xorl	%eax, %eax         # Clear eax
	call	printf
	leal	1(%rbx), %eax      # j+1  ==> eax
	movl	$.L_STR_EQ, %edx   # "eq" ==> printf#2
	movl	%ebx, %ecx         # j    ==> printf#3
	cmpl	%ebp, %eax         # if (j <= n)
	jbe	.L_AGAIN           # goto AGAIN
.L_END:
	addq	$8, %rsp           # Rewind stack
	popq	%rbx               # Restore rbx
	popq	%rbp               # Restore rbp
	ret                        # return statement
.LFE11:
	.size	fgoto, .-fgoto
	.p2align 4,,15
	.globl	fgotoblock
	.type	fgotoblock, @function
fgotoblock:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%ecx, %ecx
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$.L_STR_NE, %edx
	movl	$1, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testl	%edi, %edi
	jne	.L14
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L13:
	movl	%eax, %ebx
.L14:
	movl	%ebx, %esi
	movl	$.L_STR_FRMT, %edi
	xorl	%eax, %eax
	call	printf
	leal	1(%rbx), %eax
	cmpl	%ebp, %eax
	movl	$.L_STR_EQ, %edx
	movl	%ebx, %ecx
	jbe	.L13
.L9:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	fgotoblock, .-fgotoblock
	.globl	ffor
	.type	ffor, @function
ffor:
	pushq	%rbp
	movl	%edi, %ebp
	pushq	%rbx
	subq	$8, %rsp
	testl	%edi, %edi
	jne	.L22
.L16:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L22:
	xorl	%ecx, %ecx
	movl	$.LC0, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	cmpl	$1, %ebp
	jbe	.L16
	movl	$2, %ebx
.L19:
	leal	-1(%rbx), %ecx
	movl	$.LC2, %edx
	movl	%ebx, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	addl	$1, %ebx
	cmpl	%ebx, %ebp
	jae	.L19
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.LFE13:
	.size	ffor, .-ffor
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	call	fgoto
	movl	$2, %edi
	call	fgotoblock
	movl	$2, %edi
	call	ffor
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
