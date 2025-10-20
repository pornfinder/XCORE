	.file	"kernel.cpp"
	.text
	.globl	kernel_entry
	.def	kernel_entry;	.scl	2;	.type	32;	.endef
	.seh_proc	kernel_entry
kernel_entry:
.LFB0:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	_start
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z13char_to_digitc
	.def	_Z13char_to_digitc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13char_to_digitc
_Z13char_to_digitc:
.LFB1:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, %eax
	movb	%al, 16(%rbp)
	cmpb	$47, 16(%rbp)
	jle	.L3
	cmpb	$57, 16(%rbp)
	jg	.L3
	movsbl	16(%rbp), %eax
	subl	$48, %eax
	jmp	.L4
.L3:
	cmpb	$96, 16(%rbp)
	jle	.L5
	cmpb	$122, 16(%rbp)
	jg	.L5
	movsbl	16(%rbp), %eax
	subl	$87, %eax
	jmp	.L4
.L5:
	cmpb	$64, 16(%rbp)
	jle	.L6
	cmpb	$90, 16(%rbp)
	jg	.L6
	movsbl	16(%rbp), %eax
	subl	$55, %eax
	jmp	.L4
.L6:
	movl	$-1, %eax
.L4:
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z10str_to_intPKcPPci
	.def	_Z10str_to_intPKcPPci;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10str_to_intPKcPPci
_Z10str_to_intPKcPPci:
.LFB2:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	jmp	.L8
.L9:
	addq	$1, 16(%rbp)
.L8:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L9
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	je	.L9
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L9
	movl	$1, -4(%rbp)
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L10
	movl	$-1, -4(%rbp)
	addq	$1, 16(%rbp)
	jmp	.L11
.L10:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$43, %al
	jne	.L11
	addq	$1, 16(%rbp)
.L11:
	cmpl	$0, 32(%rbp)
	jne	.L12
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L13
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$120, %al
	je	.L14
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$88, %al
	jne	.L15
.L14:
	movl	$16, 32(%rbp)
	addq	$2, 16(%rbp)
	jmp	.L12
.L15:
	movl	$8, 32(%rbp)
	addq	$1, 16(%rbp)
	jmp	.L12
.L13:
	movl	$10, 32(%rbp)
.L12:
	cmpl	$16, 32(%rbp)
	jne	.L17
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L17
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$120, %al
	je	.L18
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$88, %al
	jne	.L17
.L18:
	addq	$2, 16(%rbp)
.L17:
	movl	$0, -8(%rbp)
	jmp	.L19
.L22:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	_Z13char_to_digitc
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	js	.L20
	movl	-12(%rbp), %eax
	cmpl	32(%rbp), %eax
	jge	.L20
	movl	$2147483647, %eax
	subl	-12(%rbp), %eax
	cltd
	idivl	32(%rbp)
	cmpl	%eax, -8(%rbp)
	jle	.L21
	movl	$2147483647, -8(%rbp)
	jmp	.L20
.L21:
	movl	-8(%rbp), %eax
	imull	32(%rbp), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
	addq	$1, 16(%rbp)
.L19:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L22
.L20:
	cmpq	$0, 24(%rbp)
	je	.L23
	movq	24(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
.L23:
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z4atoiPKc
	.def	_Z4atoiPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4atoiPKc
_Z4atoiPKc:
.LFB3:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	$10, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z10str_to_intPKcPPci
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8atoi_hexPKc
	.def	_Z8atoi_hexPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8atoi_hexPKc
_Z8atoi_hexPKc:
.LFB4:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	$16, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z10str_to_intPKcPPci
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8atoi_binPKc
	.def	_Z8atoi_binPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8atoi_binPKc
_Z8atoi_binPKc:
.LFB5:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	$2, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z10str_to_intPKcPPci
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z13digit_to_chari
	.def	_Z13digit_to_chari;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13digit_to_chari
_Z13digit_to_chari:
.LFB6:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$0, 16(%rbp)
	js	.L32
	cmpl	$9, 16(%rbp)
	jg	.L32
	movl	16(%rbp), %eax
	addl	$48, %eax
	jmp	.L33
.L32:
	cmpl	$9, 16(%rbp)
	jle	.L34
	cmpl	$35, 16(%rbp)
	jg	.L34
	movl	16(%rbp), %eax
	addl	$87, %eax
	jmp	.L33
.L34:
	movl	$63, %eax
.L33:
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z4itoaiPci
	.def	_Z4itoaiPci;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4itoaiPci
_Z4itoaiPci:
.LFB7:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	cmpl	$1, 32(%rbp)
	jle	.L36
	cmpl	$36, 32(%rbp)
	jle	.L37
.L36:
	movq	24(%rbp), %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
	jmp	.L46
.L37:
	cmpl	$0, 16(%rbp)
	jne	.L39
	movq	24(%rbp), %rax
	movb	$48, (%rax)
	movq	24(%rbp), %rax
	addq	$1, %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
	jmp	.L46
.L39:
	movl	$0, -4(%rbp)
	movb	$0, -5(%rbp)
	cmpl	$0, 16(%rbp)
	jns	.L40
	cmpl	$10, 32(%rbp)
	jne	.L40
	movb	$1, -5(%rbp)
	movl	16(%rbp), %eax
	negl	%eax
	movl	%eax, -12(%rbp)
	jmp	.L42
.L40:
	movl	16(%rbp), %eax
	movl	%eax, -12(%rbp)
.L42:
	movl	32(%rbp), %ecx
	movl	-12(%rbp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %ecx
	movl	%ecx, %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	call	_Z13digit_to_chari
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	cltq
	movb	%dl, -64(%rbp,%rax)
	movl	32(%rbp), %ecx
	movl	-12(%rbp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L42
	cmpb	$0, -5(%rbp)
	je	.L43
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	cltq
	movb	$45, -64(%rbp,%rax)
.L43:
	movl	$0, -16(%rbp)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.L44
.L45:
	movl	-20(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %edx
	movq	24(%rbp), %r8
	movl	-16(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -16(%rbp)
	cltq
	addq	%r8, %rax
	movb	%dl, (%rax)
	subl	$1, -20(%rbp)
.L44:
	cmpl	$0, -20(%rbp)
	jns	.L45
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
.L46:
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8itoa_deciPc
	.def	_Z8itoa_deciPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8itoa_deciPc
_Z8itoa_deciPc:
.LFB8:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rdx
	movl	16(%rbp), %eax
	movl	$10, %r8d
	movl	%eax, %ecx
	call	_Z4itoaiPci
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8itoa_hexiPc
	.def	_Z8itoa_hexiPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8itoa_hexiPc
_Z8itoa_hexiPc:
.LFB9:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rdx
	movl	16(%rbp), %eax
	movl	$16, %r8d
	movl	%eax, %ecx
	call	_Z4itoaiPci
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8itoa_biniPc
	.def	_Z8itoa_biniPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8itoa_biniPc
_Z8itoa_biniPc:
.LFB10:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rdx
	movl	16(%rbp), %eax
	movl	$2, %r8d
	movl	%eax, %ecx
	call	_Z4itoaiPci
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z4utoajPci
	.def	_Z4utoajPci;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4utoajPci
_Z4utoajPci:
.LFB11:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	cmpl	$1, 32(%rbp)
	jle	.L54
	cmpl	$36, 32(%rbp)
	jle	.L55
.L54:
	movq	24(%rbp), %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
	jmp	.L61
.L55:
	cmpl	$0, 16(%rbp)
	jne	.L57
	movq	24(%rbp), %rax
	movb	$48, (%rax)
	movq	24(%rbp), %rax
	addq	$1, %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
	jmp	.L61
.L57:
	movl	$0, -4(%rbp)
.L58:
	movl	32(%rbp), %ecx
	movl	16(%rbp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %ecx
	call	_Z13digit_to_chari
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	cltq
	movb	%dl, -48(%rbp,%rax)
	movl	32(%rbp), %ecx
	movl	16(%rbp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, 16(%rbp)
	cmpl	$0, 16(%rbp)
	jne	.L58
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L59
.L60:
	movl	-12(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %edx
	movq	24(%rbp), %r8
	movl	-8(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -8(%rbp)
	cltq
	addq	%r8, %rax
	movb	%dl, (%rax)
	subl	$1, -12(%rbp)
.L59:
	cmpl	$0, -12(%rbp)
	jns	.L60
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	24(%rbp), %rax
.L61:
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z3minii
	.def	_Z3minii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3minii
_Z3minii:
.LFB12:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %eax
	cmpl	24(%rbp), %eax
	jge	.L63
	movl	16(%rbp), %eax
	jmp	.L65
.L63:
	movl	24(%rbp), %eax
.L65:
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z3maxii
	.def	_Z3maxii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3maxii
_Z3maxii:
.LFB13:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %eax
	cmpl	24(%rbp), %eax
	jle	.L67
	movl	16(%rbp), %eax
	jmp	.L69
.L67:
	movl	24(%rbp), %eax
.L69:
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z3absi
	.def	_Z3absi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3absi
_Z3absi:
.LFB14:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z4signi
	.def	_Z4signi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4signi
_Z4signi:
.LFB15:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$0, 16(%rbp)
	jns	.L73
	movl	$-1, %eax
	jmp	.L75
.L73:
	movl	$1, %eax
.L75:
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6strlenPKc
	.def	_Z6strlenPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6strlenPKc
_Z6strlenPKc:
.LFB16:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L77
	movl	$0, %eax
	jmp	.L78
.L77:
	movl	$0, -4(%rbp)
	jmp	.L79
.L80:
	addl	$1, -4(%rbp)
.L79:
	movl	-4(%rbp), %edx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L80
	movl	-4(%rbp), %eax
.L78:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_Z10int_to_hexjPc,"x"
	.linkonce discard
	.globl	_Z10int_to_hexjPc
	.def	_Z10int_to_hexjPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10int_to_hexjPc
_Z10int_to_hexjPc:
.LFB17:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movabsq	$3978425819141910832, %rax
	movabsq	$5063528411713059128, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movb	$0, -32(%rbp)
	movl	$0, -4(%rbp)
	movl	$28, -8(%rbp)
	jmp	.L82
.L85:
	movl	-8(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	andl	$15, %eax
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L89
	subl	$4, -8(%rbp)
.L82:
	cmpl	$0, -8(%rbp)
	jg	.L85
	jmp	.L86
.L89:
	nop
	jmp	.L86
.L87:
	movl	-8(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	andl	$15, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %edx
	movq	24(%rbp), %r8
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	cltq
	addq	%r8, %rax
	movb	%dl, (%rax)
	subl	$4, -8(%rbp)
.L86:
	cmpl	$0, -8(%rbp)
	jns	.L87
	cmpl	$0, -4(%rbp)
	jne	.L88
	movq	24(%rbp), %rcx
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	cltq
	addq	%rcx, %rax
	movb	$48, (%rax)
.L88:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7ConsoleC1EPt,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7ConsoleC1EPt
	.def	_ZN7ConsoleC1EPt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7ConsoleC1EPt
_ZN7ConsoleC1EPt:
.LFB20:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	movb	$0, _ZN7Console13shift_pressedE(%rip)
	movb	$0, _ZN7Console9caps_lockE(%rip)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console20init_scancode_tablesEv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7ConsoleC1Ei,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7ConsoleC1Ei
	.def	_ZN7ConsoleC1Ei;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7ConsoleC1Ei
_ZN7ConsoleC1Ei:
.LFB23:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	cltq
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	movb	$0, _ZN7Console13shift_pressedE(%rip)
	movb	$0, _ZN7Console9caps_lockE(%rip)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console20init_scancode_tablesEv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7Console20init_scancode_tablesEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console20init_scancode_tablesEv
	.def	_ZN7Console20init_scancode_tablesEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console20init_scancode_tablesEv
_ZN7Console20init_scancode_tablesEv:
.LFB24:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$272, %rsp
	.seh_stackalloc	272
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 160(%rbp)
	movabsq	$3906085646303828736, %rax
	movabsq	$650837410446915639, %rdx
	movq	%rax, 0(%rbp)
	movq	%rdx, 8(%rbp)
	movabsq	$7599113487299999601, %rax
	movabsq	$8313926431618592879, %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movabsq	$4281915450484811364, %rax
	movabsq	$8530794586094723111, %rdx
	movq	%rax, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movabsq	$3026470824953343586, %rax
	movl	$8192, %edx
	movq	%rax, 48(%rbp)
	movq	%rdx, 56(%rbp)
	movl	$0, %eax
	movabsq	$49478023249920, %rdx
	movq	%rax, 64(%rbp)
	movq	%rdx, 72(%rbp)
	movq	$11008, 80(%rbp)
	movq	$0, 88(%rbp)
	movq	$0, 96(%rbp)
	movq	$0, 104(%rbp)
	movq	$0, 112(%rbp)
	movq	$0, 120(%rbp)
	movabsq	$6783868147521886976, %r8
	movabsq	$650817833867422246, %r9
	movq	%r8, -128(%rbp)
	movq	%r9, -120(%rbp)
	movabsq	$5284227956481546065, %r10
	movabsq	$5999076223689117775, %r11
	movq	%r10, -112(%rbp)
	movq	%r11, -104(%rbp)
	movabsq	$4200815334842123844, %r8
	movabsq	$6215909056352124450, %r9
	movq	%r8, -96(%rbp)
	movq	%r9, -88(%rbp)
	movabsq	$3026488486125194818, %r10
	movl	$8192, %r11d
	movq	%r10, -80(%rbp)
	movq	%r11, -72(%rbp)
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$11008, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movl	$0, 140(%rbp)
	jmp	.L93
.L94:
	movl	140(%rbp), %eax
	cltq
	movzbl	0(%rbp,%rax), %edx
	movl	140(%rbp), %eax
	cltq
	leaq	_ZN7Console15scancode_normalE(%rip), %rcx
	movb	%dl, (%rax,%rcx)
	movl	140(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %edx
	movl	140(%rbp), %eax
	cltq
	leaq	_ZN7Console14scancode_shiftE(%rip), %rcx
	movb	%dl, (%rax,%rcx)
	addl	$1, 140(%rbp)
.L93:
	cmpl	$127, 140(%rbp)
	jle	.L94
	nop
	nop
	addq	$272, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7Console6scrollEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console6scrollEv
	.def	_ZN7Console6scrollEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console6scrollEv
_ZN7Console6scrollEv:
.LFB32:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L96
.L97:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$80, %rdx
	addq	%rdx, %rdx
	leaq	(%rax,%rdx), %rcx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rax, %rdx
	movzwl	(%rcx), %eax
	movw	%ax, (%rdx)
	addl	$1, -4(%rbp)
.L96:
	cmpl	$1919, -4(%rbp)
	jle	.L97
	movl	$1920, -8(%rbp)
	jmp	.L98
.L99:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movw	$1824, (%rax)
	addl	$1, -8(%rbp)
.L98:
	cmpl	$1999, -8(%rbp)
	jle	.L99
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7Console5clearEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console5clearEv
	.def	_ZN7Console5clearEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console5clearEv
_ZN7Console5clearEv:
.LFB33:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L101
.L102:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movw	$1824, (%rax)
	addl	$1, -4(%rbp)
.L101:
	cmpl	$1999, -4(%rbp)
	jle	.L102
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7Console5writeEPKc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console5writeEPKc
	.def	_ZN7Console5writeEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console5writeEPKc
_ZN7Console5writeEPKc:
.LFB35:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L104
.L107:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L105
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	$24, %eax
	jle	.L106
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console6scrollEv
	movq	16(%rbp), %rax
	movl	$24, 12(%rax)
	jmp	.L106
.L105:
	movq	16(%rbp), %rax
	movl	12(%rax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cbtw
	orb	$7, %ah
	movl	%eax, %ecx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movl	%ecx, %edx
	movw	%dx, (%rax)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$79, %eax
	jle	.L106
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	$24, %eax
	jle	.L106
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console6scrollEv
	movq	16(%rbp), %rax
	movl	$24, 12(%rax)
.L106:
	addl	$1, -4(%rbp)
.L104:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L107
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7Console5writeEi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console5writeEi
	.def	_ZN7Console5writeEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console5writeEi
_ZN7Console5writeEi:
.LFB36:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	leaq	-16(%rbp), %rdx
	movl	24(%rbp), %eax
	movl	$10, %r8d
	movl	%eax, %ecx
	call	_Z4itoaiPci
	leaq	-16(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7Console8writeHexEib,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console8writeHexEib
	.def	_ZN7Console8writeHexEib;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console8writeHexEib
_ZN7Console8writeHexEib:
.LFB37:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, %eax
	movb	%al, 32(%rbp)
	movzbl	32(%rbp), %r8d
	leaq	-16(%rbp), %rcx
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movl	%r8d, %r9d
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7Console18writeHexFromBufferEiPcb
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "0x\0"
	.section	.text$_ZN7Console18writeHexFromBufferEiPcb,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console18writeHexFromBufferEiPcb
	.def	_ZN7Console18writeHexFromBufferEiPcb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console18writeHexFromBufferEiPcb
_ZN7Console18writeHexFromBufferEiPcb:
.LFB38:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	%r9d, %eax
	movb	%al, 40(%rbp)
	movl	24(%rbp), %eax
	movq	32(%rbp), %rdx
	movl	%eax, %ecx
	call	_Z10int_to_hexjPc
	cmpb	$0, 40(%rbp)
	je	.L111
	movq	16(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
.L111:
	movq	32(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "\12\0"
	.section	.text$_ZN7Console9writeLineEPKc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7Console9writeLineEPKc
	.def	_ZN7Console9writeLineEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7Console9writeLineEPKc
_ZN7Console9writeLineEPKc:
.LFB39:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_ZN7Console15scancode_normalE
	.data
	.align 32
_ZN7Console15scancode_normalE:
	.ascii "\0\33"
	.ascii "1234567890-=\10\11qwertyuiop[]\12\0asdfghjkl;'`\0\\zxcvbnm,./\0*\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0-\0\0\0+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
	.space 24
	.globl	_ZN7Console14scancode_shiftE
	.align 32
_ZN7Console14scancode_shiftE:
	.ascii "\0\33!@#$%^&*()_+\10\11QWERTYUIOP{}\12\0ASDFGHJKL:\"~\0|ZXCVBNM<>?\0*\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0-\0\0\0+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
	.space 24
	.globl	_ZN7Console13shift_pressedE
	.bss
_ZN7Console13shift_pressedE:
	.space 1
	.globl	_ZN7Console9caps_lockE
_ZN7Console9caps_lockE:
	.space 1
	.text
	.globl	get_all_registers
	.def	get_all_registers;	.scl	2;	.type	32;	.endef
	.seh_proc	get_all_registers
get_all_registers:
.LFB47:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L116
/APP
 # 24 "os/kernel/cpu/registers.cpp" 1
	mov %eax, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, (%rax)
/APP
 # 25 "os/kernel/cpu/registers.cpp" 1
	mov %ebx, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 4(%rax)
/APP
 # 26 "os/kernel/cpu/registers.cpp" 1
	mov %ecx, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
/APP
 # 27 "os/kernel/cpu/registers.cpp" 1
	mov %edx, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
/APP
 # 28 "os/kernel/cpu/registers.cpp" 1
	mov %esi, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 16(%rax)
/APP
 # 29 "os/kernel/cpu/registers.cpp" 1
	mov %edi, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 20(%rax)
/APP
 # 30 "os/kernel/cpu/registers.cpp" 1
	mov %ebp, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 24(%rax)
/APP
 # 31 "os/kernel/cpu/registers.cpp" 1
	mov %esp, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 28(%rax)
/APP
 # 33 "os/kernel/cpu/registers.cpp" 1
	mov %cs, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 32(%rax)
/APP
 # 34 "os/kernel/cpu/registers.cpp" 1
	mov %ds, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 36(%rax)
/APP
 # 35 "os/kernel/cpu/registers.cpp" 1
	mov %es, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 40(%rax)
/APP
 # 36 "os/kernel/cpu/registers.cpp" 1
	mov %fs, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 44(%rax)
/APP
 # 37 "os/kernel/cpu/registers.cpp" 1
	mov %gs, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 48(%rax)
/APP
 # 38 "os/kernel/cpu/registers.cpp" 1
	mov %ss, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 52(%rax)
/APP
 # 40 "os/kernel/cpu/registers.cpp" 1
	call 1f
	1: pop %edx
	
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 56(%rax)
	movq	16(%rbp), %rax
	movl	56(%rax), %eax
	leal	-5(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 56(%rax)
/APP
 # 47 "os/kernel/cpu/registers.cpp" 1
	pushf
	pop %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 60(%rax)
/APP
 # 49 "os/kernel/cpu/registers.cpp" 1
	mov %cr0, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 64(%rax)
/APP
 # 50 "os/kernel/cpu/registers.cpp" 1
	mov %cr2, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 68(%rax)
/APP
 # 51 "os/kernel/cpu/registers.cpp" 1
	mov %cr3, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 72(%rax)
/APP
 # 52 "os/kernel/cpu/registers.cpp" 1
	mov %cr4, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 76(%rax)
	jmp	.L113
.L116:
	nop
.L113:
	popq	%rbp
	ret
	.seh_endproc
	.globl	get_basic_registers
	.def	get_basic_registers;	.scl	2;	.type	32;	.endef
	.seh_proc	get_basic_registers
get_basic_registers:
.LFB48:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L120
/APP
 # 58 "os/kernel/cpu/registers.cpp" 1
	mov %eax, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, (%rax)
/APP
 # 59 "os/kernel/cpu/registers.cpp" 1
	mov %ebx, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 4(%rax)
/APP
 # 60 "os/kernel/cpu/registers.cpp" 1
	mov %ecx, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
/APP
 # 61 "os/kernel/cpu/registers.cpp" 1
	mov %edx, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
/APP
 # 62 "os/kernel/cpu/registers.cpp" 1
	mov %esi, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 16(%rax)
/APP
 # 63 "os/kernel/cpu/registers.cpp" 1
	mov %edi, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 20(%rax)
/APP
 # 64 "os/kernel/cpu/registers.cpp" 1
	mov %ebp, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 24(%rax)
/APP
 # 65 "os/kernel/cpu/registers.cpp" 1
	mov %esp, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 28(%rax)
/APP
 # 67 "os/kernel/cpu/registers.cpp" 1
	mov %cs, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 32(%rax)
/APP
 # 68 "os/kernel/cpu/registers.cpp" 1
	mov %ds, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 36(%rax)
/APP
 # 70 "os/kernel/cpu/registers.cpp" 1
	call 1f
	1: pop %edx
	
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 56(%rax)
	movq	16(%rbp), %rax
	movl	56(%rax), %eax
	leal	-5(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 56(%rax)
/APP
 # 77 "os/kernel/cpu/registers.cpp" 1
	pushf
	pop %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 60(%rax)
/APP
 # 78 "os/kernel/cpu/registers.cpp" 1
	mov %cr2, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 68(%rax)
	jmp	.L117
.L120:
	nop
.L117:
	popq	%rbp
	ret
	.seh_endproc
	.globl	get_registers_safe
	.def	get_registers_safe;	.scl	2;	.type	32;	.endef
	.seh_proc	get_registers_safe
get_registers_safe:
.LFB49:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L124
	movq	16(%rbp), %rax
/APP
 # 84 "os/kernel/cpu/registers.cpp" 1
	movl %eax, 0(%rax)
	movl %ebx, 4(%rax)
	movl %ecx, 8(%rax)
	movl %edx, 12(%rax)
	movl %esi, 16(%rax)
	movl %edi, 20(%rax)
	movl %ebp, 24(%rax)
	movl %esp, 28(%rax)
	
 # 0 "" 2
 # 98 "os/kernel/cpu/registers.cpp" 1
	mov %cs, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 32(%rax)
/APP
 # 99 "os/kernel/cpu/registers.cpp" 1
	mov %ds, %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 36(%rax)
/APP
 # 101 "os/kernel/cpu/registers.cpp" 1
	call 1f
	1: pop %edx
	
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 56(%rax)
	movq	16(%rbp), %rax
	movl	56(%rax), %eax
	leal	-5(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 56(%rax)
/APP
 # 108 "os/kernel/cpu/registers.cpp" 1
	pushf
	pop %edx
 # 0 "" 2
/NO_APP
	movq	16(%rbp), %rax
	movl	%edx, 60(%rax)
	jmp	.L121
.L124:
	nop
.L121:
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "\12Stack trace:\0"
.LC3:
	.ascii "  #\0"
.LC4:
	.ascii ": [EBP=\0"
.LC5:
	.ascii "] RET=\0"
.LC6:
	.ascii " <-- INTERRUPT\0"
.LC7:
	.ascii "\0"
	.text
	.globl	debug_print_stacktrace
	.def	debug_print_stacktrace;	.scl	2;	.type	32;	.endef
	.seh_proc	debug_print_stacktrace
debug_print_stacktrace:
.LFB50:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movl	%r8d, 32(%rbp)
	movb	%al, 24(%rbp)
	movq	16(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
/APP
 # 13 "os/kernel/cpu/stacktrace.cpp" 1
	mov %ebp, %rax
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movb	$0, -9(%rbp)
	movl	$4, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L126
.L132:
	cmpb	$0, 24(%rbp)
	je	.L127
	cmpl	$0, -16(%rbp)
	je	.L127
	subl	$1, -16(%rbp)
	subl	$1, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L128
.L127:
	movq	16(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movl	-20(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEi
	movq	16(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	-8(%rbp), %rax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	16(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	cmpb	$0, -9(%rbp)
	je	.L129
	movq	16(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movb	$0, -9(%rbp)
.L129:
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$6, %eax
	jne	.L130
	movb	$1, -9(%rbp)
.L130:
	movq	16(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L133
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$65535, %eax
	jbe	.L133
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$655359, %eax
	ja	.L133
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L128:
	addl	$1, -20(%rbp)
.L126:
	cmpq	$0, -8(%rbp)
	je	.L133
	movl	-20(%rbp), %eax
	cmpl	32(%rbp), %eax
	jb	.L132
.L133:
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "\12=== FULL EXCEPTION CONTEXT ===\0"
.LC9:
	.ascii "EAX: \0"
.LC10:
	.ascii " EBX: \0"
.LC11:
	.ascii " ECX: \0"
.LC12:
	.ascii " EDX: \0"
.LC13:
	.ascii "ESP: \0"
.LC14:
	.ascii " EBP: \0"
.LC15:
	.ascii " EIP: \0"
.LC16:
	.ascii "\12Stack around EBP:\0"
.LC17:
	.ascii "  [\0"
.LC18:
	.ascii "] = \0"
.LC19:
	.ascii " <-- EBP\0"
.LC20:
	.ascii " <-- EIP\0"
	.text
	.globl	debug_dump_full_context
	.def	debug_dump_full_context;	.scl	2;	.type	32;	.endef
	.seh_proc	debug_dump_full_context
debug_dump_full_context:
.LFB51:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	movq	24(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	movq	24(%rbp), %rax
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	movl	28(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	movl	56(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	movq	24(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %eax
	andl	$4294967280, %eax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L135
.L138:
	movq	24(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	-8(%rbp), %rax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	24(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %eax
	cmpq	%rax, -8(%rbp)
	jne	.L136
	movq	24(%rbp), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	jmp	.L137
.L136:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	16(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	%eax, %edx
	jne	.L137
	movq	24(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
.L137:
	movq	24(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	addq	$4, -8(%rbp)
	addl	$1, -12(%rbp)
.L135:
	cmpl	$7, -12(%rbp)
	jle	.L138
	movq	24(%rbp), %rax
	movl	$10, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	debug_print_stacktrace
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN6memory4initEv,"x"
	.linkonce discard
	.globl	_ZN6memory4initEv
	.def	_ZN6memory4initEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6memory4initEv
_ZN6memory4initEv:
.LFB52:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	_ZN6memory5firstE(%rip), %rax
	movl	$1048544, 24(%rax)
	movq	_ZN6memory5firstE(%rip), %rax
	movb	$0, (%rax)
	movq	_ZN6memory5firstE(%rip), %rax
	movq	$0, 8(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN6memory10align_sizeEj,"x"
	.linkonce discard
	.globl	_ZN6memory10align_sizeEj
	.def	_ZN6memory10align_sizeEj;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6memory10align_sizeEj
_ZN6memory10align_sizeEj:
.LFB53:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$15, 16(%rbp)
	ja	.L141
	movl	$16, 16(%rbp)
.L141:
	movl	16(%rbp), %eax
	addl	$15, %eax
	andl	$-16, %eax
	movl	%eax, 16(%rbp)
	movl	16(%rbp), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	_ZN6memory4heapE
	.bss
	.align 32
_ZN6memory4heapE:
	.space 1048576
	.globl	_ZN6memory5firstE
	.data
	.align 8
_ZN6memory5firstE:
	.quad	_ZN6memory4heapE
	.text
	.globl	_Z6memchrPKvij
	.def	_Z6memchrPKvij;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6memchrPKvij
_Z6memchrPKvij:
.LFB54:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	24(%rbp), %eax
	movb	%al, -17(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L144
.L147:
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, -17(%rbp)
	jne	.L145
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	jmp	.L146
.L145:
	addl	$1, -4(%rbp)
.L144:
	movl	-4(%rbp), %eax
	cmpl	32(%rbp), %eax
	jb	.L147
	movl	$0, %eax
.L146:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6memcrtPvccj
	.def	_Z6memcrtPvccj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6memcrtPvccj
_Z6memcrtPvccj:
.LFB55:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movl	%r8d, %edx
	movl	%r9d, 40(%rbp)
	movb	%al, 24(%rbp)
	movl	%edx, %eax
	movb	%al, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L149
.L151:
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movsbl	24(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L150
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movzbl	32(%rbp), %eax
	movb	%al, (%rdx)
.L150:
	addl	$1, -4(%rbp)
.L149:
	movl	-4(%rbp), %eax
	cmpl	40(%rbp), %eax
	jb	.L151
	movl	$0, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6memcmpPKvS0_j
	.def	_Z6memcmpPKvS0_j;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6memcmpPKvS0_j
_Z6memcmpPKvS0_j:
.LFB56:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L154
.L157:
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-4(%rbp), %ecx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L155
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-4(%rbp), %ecx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	jmp	.L156
.L155:
	addl	$1, -4(%rbp)
.L154:
	movl	-4(%rbp), %eax
	cmpl	32(%rbp), %eax
	jb	.L157
	movl	$0, %edx
.L156:
	movl	%edx, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6memcpyPvPKvj
	.def	_Z6memcpyPvPKvj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6memcpyPvPKvj
_Z6memcpyPvPKvj:
.LFB57:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpl	$3, 32(%rbp)
	jbe	.L165
	jmp	.L160
.L162:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -8(%rbp)
	movb	%dl, (%rax)
	subl	$1, 32(%rbp)
.L160:
	movq	-8(%rbp), %rax
	andl	$3, %eax
	testl	%eax, %eax
	je	.L161
	cmpl	$0, 32(%rbp)
	jne	.L162
.L161:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L163
.L164:
	movq	-32(%rbp), %rax
	leaq	4(%rax), %rdx
	movq	%rdx, -32(%rbp)
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, -24(%rbp)
	movl	%edx, (%rax)
	subl	$4, 32(%rbp)
.L163:
	cmpl	$3, 32(%rbp)
	ja	.L164
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L165
.L166:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -8(%rbp)
	movb	%dl, (%rax)
	subl	$1, 32(%rbp)
.L165:
	cmpl	$0, 32(%rbp)
	jne	.L166
	nop
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z7memmovePvPKvj
	.def	_Z7memmovePvPKvj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7memmovePvPKvj
_Z7memmovePvPKvj:
.LFB58:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jnb	.L168
	movl	32(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -8(%rbp)
	jnb	.L168
	movl	32(%rbp), %eax
	addq	%rax, -8(%rbp)
	movl	32(%rbp), %eax
	addq	%rax, -16(%rbp)
	jmp	.L169
.L170:
	subq	$1, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %edx
	subq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	subl	$1, 32(%rbp)
.L169:
	cmpl	$0, 32(%rbp)
	jne	.L170
	jmp	.L171
.L168:
	movl	$0, -20(%rbp)
	jmp	.L172
.L173:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-20(%rbp), %ecx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -20(%rbp)
.L172:
	movl	-20(%rbp), %eax
	cmpl	32(%rbp), %eax
	jb	.L173
	nop
.L171:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6memsetPvij
	.def	_Z6memsetPvij;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6memsetPvij
_Z6memsetPvij:
.LFB59:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	24(%rbp), %eax
	movb	%al, -17(%rbp)
	cmpl	$3, 32(%rbp)
	jbe	.L181
	movzbl	-17(%rbp), %edx
	movl	%edx, %eax
	sall	$8, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movzbl	-17(%rbp), %eax
	sall	$16, %eax
	orl	%eax, %edx
	movzbl	-17(%rbp), %eax
	sall	$24, %eax
	orl	%edx, %eax
	movl	%eax, -24(%rbp)
	jmp	.L176
.L178:
	movzbl	-17(%rbp), %edx
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -8(%rbp)
	movb	%dl, (%rax)
	subl	$1, 32(%rbp)
.L176:
	movq	-8(%rbp), %rax
	andl	$3, %eax
	testl	%eax, %eax
	je	.L177
	cmpl	$0, 32(%rbp)
	jne	.L178
.L177:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L179
.L180:
	movl	-24(%rbp), %edx
	movq	-16(%rbp), %rax
	leaq	4(%rax), %rcx
	movq	%rcx, -16(%rbp)
	movl	%edx, (%rax)
	subl	$4, 32(%rbp)
.L179:
	cmpl	$3, 32(%rbp)
	ja	.L180
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L181
.L182:
	movzbl	-17(%rbp), %edx
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -8(%rbp)
	movb	%dl, (%rax)
	subl	$1, 32(%rbp)
.L181:
	cmpl	$0, 32(%rbp)
	jne	.L182
	nop
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z7memzeroPvj
	.def	_Z7memzeroPvj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7memzeroPvj
_Z7memzeroPvj:
.LFB60:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movl	%edx, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z6memsetPvij
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8allocatej
	.def	_Z8allocatej;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8allocatej
_Z8allocatej:
.LFB61:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$0, 16(%rbp)
	jne	.L185
	movl	$0, %eax
	jmp	.L186
.L185:
	movl	16(%rbp), %eax
	movl	%eax, %ecx
	call	_ZN6memory10align_sizeEj
	movl	%eax, 16(%rbp)
	movq	_ZN6memory5firstE(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L187
.L189:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L188
	movl	$0, %eax
	jmp	.L186
.L188:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L187:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L189
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	16(%rbp), %eax
	jb	.L189
	movq	-8(%rbp), %rax
	movb	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	subl	16(%rbp), %eax
	movl	%eax, -12(%rbp)
	cmpl	$47, -12(%rbp)
	jbe	.L190
	movl	16(%rbp), %eax
	leaq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movl	-12(%rbp), %eax
	leal	-32(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-24(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L190:
	movq	-8(%rbp), %rax
	addq	$32, %rax
.L186:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6callocjj
	.def	_Z6callocjj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6callocjj
_Z6callocjj:
.LFB62:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %eax
	imull	24(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	_Z8allocatej
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L192
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_Z7memzeroPvj
.L192:
	movq	-16(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z4freePv
	.def	_Z4freePv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4freePv
_Z4freePv:
.LFB63:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L199
	movq	16(%rbp), %rax
	subq	$32, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L197
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L197
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	24(%rax), %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	addl	$32, %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L198
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
.L198:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L197:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L194
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L194
	movq	-8(%rbp), %rax
	movl	24(%rax), %edx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	24(%rax), %eax
	addl	%edx, %eax
	leal	32(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L194
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L194
.L199:
	nop
.L194:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z7reallocPvj
	.def	_Z7reallocPvj;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7reallocPvj
_Z7reallocPvj:
.LFB64:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L201
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	_Z8allocatej
	jmp	.L202
.L201:
	cmpl	$0, 24(%rbp)
	jne	.L203
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	$0, %eax
	jmp	.L202
.L203:
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	_ZN6memory10align_sizeEj
	movl	%eax, 24(%rbp)
	movq	16(%rbp), %rax
	subq	$32, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	24(%rbp), %eax
	jb	.L204
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	subl	24(%rbp), %eax
	movl	%eax, -40(%rbp)
	cmpl	$47, -40(%rbp)
	jbe	.L205
	movl	24(%rbp), %eax
	leaq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -48(%rbp)
	movl	-40(%rbp), %eax
	leal	-32(%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-48(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-48(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L206
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L206:
	movq	-8(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L205:
	movq	16(%rbp), %rax
	jmp	.L202
.L204:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L207
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L207
	movq	-8(%rbp), %rax
	movl	24(%rax), %edx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	24(%rax), %eax
	addl	%edx, %eax
	addl	$32, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	cmpl	24(%rbp), %eax
	jb	.L207
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L208
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L208:
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	subl	24(%rbp), %eax
	cmpl	$47, %eax
	jbe	.L209
	movl	24(%rbp), %eax
	leaq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	subl	24(%rbp), %eax
	leal	-32(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-24(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L210
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L210:
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 24(%rax)
.L209:
	movq	16(%rbp), %rax
	jmp	.L202
.L207:
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	_Z8allocatej
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L211
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	24(%rbp), %eax
	jnb	.L212
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	jmp	.L213
.L212:
	movl	24(%rbp), %eax
.L213:
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %ecx
	movq	16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	_Z6memcpyPvPKvj
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
.L211:
	movq	-32(%rbp), %rax
.L202:
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN14FunctionTracer14enter_functionEPKcj,"x"
	.linkonce discard
	.globl	_ZN14FunctionTracer14enter_functionEPKcj
	.def	_ZN14FunctionTracer14enter_functionEPKcj;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN14FunctionTracer14enter_functionEPKcj
_ZN14FunctionTracer14enter_functionEPKcj:
.LFB66:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movl	%edx, 40(%rbp)
	movl	_ZN14FunctionTracer11trace_countE(%rip), %eax
	cmpl	$999, %eax
	jg	.L217
	movl	_ZN14FunctionTracer11trace_countE(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	_ZN14FunctionTracer6tracesE(%rip), %rdx
	movq	32(%rbp), %rax
	movq	%rax, (%rcx,%rdx)
	movl	_ZN14FunctionTracer11trace_countE(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	8+_ZN14FunctionTracer6tracesE(%rip), %rdx
	movl	40(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	movl	_ZN14FunctionTracer11trace_countE(%rip), %ebx
	call	_ZN14FunctionTracer10read_timerEv
	movl	%eax, %ecx
	movslq	%ebx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	12+_ZN14FunctionTracer6tracesE(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	_ZN14FunctionTracer13current_depthE(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, _ZN14FunctionTracer13current_depthE(%rip)
	movl	_ZN14FunctionTracer11trace_countE(%rip), %edx
	movl	%eax, %ecx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	16+_ZN14FunctionTracer6tracesE(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	_ZN14FunctionTracer11trace_countE(%rip), %eax
	addl	$1, %eax
	movl	%eax, _ZN14FunctionTracer11trace_countE(%rip)
	jmp	.L214
.L217:
	nop
.L214:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN14FunctionTracer13exit_functionEv,"x"
	.linkonce discard
	.globl	_ZN14FunctionTracer13exit_functionEv
	.def	_ZN14FunctionTracer13exit_functionEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN14FunctionTracer13exit_functionEv
_ZN14FunctionTracer13exit_functionEv:
.LFB67:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	_ZN14FunctionTracer13current_depthE(%rip), %eax
	testl	%eax, %eax
	jle	.L220
	movl	_ZN14FunctionTracer13current_depthE(%rip), %eax
	subl	$1, %eax
	movl	%eax, _ZN14FunctionTracer13current_depthE(%rip)
.L220:
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC21:
	.ascii "  \0"
.LC22:
	.ascii "[\0"
.LC23:
	.ascii "] \0"
.LC24:
	.ascii " @ \0"
.LC25:
	.ascii " T+\0"
	.section	.text$_ZN14FunctionTracer10dump_traceER7Consoleb,"x"
	.linkonce discard
	.globl	_ZN14FunctionTracer10dump_traceER7Consoleb
	.def	_ZN14FunctionTracer10dump_traceER7Consoleb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN14FunctionTracer10dump_traceER7Consoleb
_ZN14FunctionTracer10dump_traceER7Consoleb:
.LFB68:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movl	$4, -12(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L222
.L227:
	cmpb	$0, 24(%rbp)
	je	.L223
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L228
.L223:
	movl	$0, -8(%rbp)
	jmp	.L225
.L226:
	movq	16(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	addl	$1, -8(%rbp)
.L225:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	16+_ZN14FunctionTracer6tracesE(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	-8(%rbp), %edx
	cmpl	%eax, %edx
	jb	.L226
	movq	16(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	16+_ZN14FunctionTracer6tracesE(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEi
	movq	16(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	_ZN14FunctionTracer6tracesE(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	8+_ZN14FunctionTracer6tracesE(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	movq	16(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	12+_ZN14FunctionTracer6tracesE(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEi
	movq	16(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	jmp	.L224
.L228:
	nop
.L224:
	addl	$1, -4(%rbp)
.L222:
	movl	_ZN14FunctionTracer11trace_countE(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L227
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_ZZN14FunctionTracer10read_timerEvE5ticks
	.section	.data$_ZZN14FunctionTracer10read_timerEvE5ticks,"w"
	.linkonce same_size
	.align 4
_ZZN14FunctionTracer10read_timerEvE5ticks:
	.space 4
	.section	.text$_ZN14FunctionTracer10read_timerEv,"x"
	.linkonce discard
	.globl	_ZN14FunctionTracer10read_timerEv
	.def	_ZN14FunctionTracer10read_timerEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN14FunctionTracer10read_timerEv
_ZN14FunctionTracer10read_timerEv:
.LFB69:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	_ZZN14FunctionTracer10read_timerEvE5ticks(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, _ZZN14FunctionTracer10read_timerEvE5ticks(%rip)
	popq	%rbp
	ret
	.seh_endproc
	.globl	_ZN14FunctionTracer6tracesE
	.bss
	.align 32
_ZN14FunctionTracer6tracesE:
	.space 24000
	.globl	_ZN14FunctionTracer11trace_countE
	.align 4
_ZN14FunctionTracer11trace_countE:
	.space 4
	.globl	_ZN14FunctionTracer13current_depthE
	.align 4
_ZN14FunctionTracer13current_depthE:
	.space 4
	.section .rdata,"dr"
.LC26:
	.ascii "instrumented\0"
	.text
	.globl	__cyg_profile_func_enter
	.def	__cyg_profile_func_enter;	.scl	2;	.type	32;	.endef
	.seh_proc	__cyg_profile_func_enter
__cyg_profile_func_enter:
.LFB76:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	_ZN14FunctionTracer14enter_functionEPKcj
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	__cyg_profile_func_exit
	.def	__cyg_profile_func_exit;	.scl	2;	.type	32;	.endef
	.seh_proc	__cyg_profile_func_exit
__cyg_profile_func_exit:
.LFB77:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	_ZN14FunctionTracer13exit_functionEv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Unwind_Resume
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.seh_proc	_Unwind_Resume
_Unwind_Resume:
.LFB78:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
.L234:
	jmp	.L234
	.seh_endproc
	.globl	__gxx_personality_v0
	.def	__gxx_personality_v0;	.scl	2;	.type	32;	.endef
	.seh_proc	__gxx_personality_v0
__gxx_personality_v0:
.LFB79:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
.L236:
	jmp	.L236
	.seh_endproc
	.def	_ZL4outbth;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZL4outbth
_ZL4outbth:
.LFB81:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%edx, %eax
	movl	%ecx, %edx
	movw	%dx, 16(%rbp)
	movb	%al, 24(%rbp)
	movzbl	24(%rbp), %eax
	movzwl	16(%rbp), %edx
/APP
 # 14 "os/kernel/cpu/ports.cpp" 1
	outb %al, %dx
 # 0 "" 2
/NO_APP
	nop
	popq	%rbp
	ret
	.seh_endproc
	.def	_ZL4outwtt;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZL4outwtt
_ZL4outwtt:
.LFB83:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%edx, %eax
	movl	%ecx, %edx
	movw	%dx, 16(%rbp)
	movw	%ax, 24(%rbp)
	movzwl	24(%rbp), %eax
	movzwl	16(%rbp), %edx
/APP
 # 28 "os/kernel/cpu/ports.cpp" 1
	outw %ax, %dx
 # 0 "" 2
/NO_APP
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9exception4initEv,"x"
	.linkonce discard
	.globl	_ZN9exception4initEv
	.def	_ZN9exception4initEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9exception4initEv
_ZN9exception4initEv:
.LFB84:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	_Z8init_idtv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC27:
	.ascii "KERNEL PANIC: \0"
.LC28:
	.ascii "System halted\0"
	.text
	.globl	_Z5panicPKc
	.def	_Z5panicPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5panicPKc
_Z5panicPKc:
.LFB85:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	-16(%rbp), %rax
	movl	$753664, %edx
	movq	%rax, %rcx
	call	_ZN7ConsoleC1Ei
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5clearEv
	leaq	-16(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movq	16(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	leaq	-16(%rbp), %rax
	movl	$10, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	debug_print_stacktrace
	leaq	-16(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN14FunctionTracer10dump_traceER7Consoleb
	leaq	-16(%rbp), %rax
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
.L241:
/APP
 # 33 "os/kernel/cpu/exceptions/exceptions.cpp" 1
	hlt
 # 0 "" 2
/NO_APP
	jmp	.L241
	.seh_endproc
	.globl	_ZN9exception8messagesE
	.section .rdata,"dr"
.LC29:
	.ascii "Division By Zero\0"
.LC30:
	.ascii "Debug\0"
.LC31:
	.ascii "Non Maskable Interrupt\0"
.LC32:
	.ascii "Breakpoint\0"
.LC33:
	.ascii "Into Detected Overflow\0"
.LC34:
	.ascii "Out of Bounds\0"
.LC35:
	.ascii "Invalid Opcode\0"
.LC36:
	.ascii "No Coprocessor\0"
.LC37:
	.ascii "Double Fault\0"
.LC38:
	.ascii "Coprocessor Segment Overrun\0"
.LC39:
	.ascii "Bad TSS\0"
.LC40:
	.ascii "Segment Not Present\0"
.LC41:
	.ascii "Stack Fault\0"
.LC42:
	.ascii "General Protection Fault\0"
.LC43:
	.ascii "Page Fault\0"
.LC44:
	.ascii "Unknown Interrupt\0"
.LC45:
	.ascii "Coprocessor Fault\0"
.LC46:
	.ascii "Alignment Check\0"
.LC47:
	.ascii "Machine Check\0"
.LC48:
	.ascii "Reserved\0"
	.data
	.align 32
_ZN9exception8messagesE:
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.quad	.LC32
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	.LC36
	.quad	.LC37
	.quad	.LC38
	.quad	.LC39
	.quad	.LC40
	.quad	.LC41
	.quad	.LC42
	.quad	.LC43
	.quad	.LC44
	.quad	.LC45
	.quad	.LC46
	.quad	.LC47
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.quad	.LC48
	.globl	_ZN9exception18interrupt_handlersE
	.bss
	.align 32
_ZN9exception18interrupt_handlersE:
	.space 2048
	.section .rdata,"dr"
.LC49:
	.ascii "Found UD2 at: \0"
	.text
	.globl	_Z18find_ud2_in_memory7Console
	.def	_Z18find_ud2_in_memory7Console;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z18find_ud2_in_memory7Console
_Z18find_ud2_in_memory7Console:
.LFB86:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rbx), %rax
	movq	8(%rbx), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$65536, -16(%rbp)
	movl	$65536, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L243
.L245:
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$15, %al
	jne	.L244
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$11, %al
	jne	.L244
	leaq	-48(%rbp), %rax
	leaq	.LC49(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movl	-4(%rbp), %eax
	addl	$65536, %eax
	movl	%eax, %edx
	leaq	-48(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	leaq	-48(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
.L244:
	addl	$1, -4(%rbp)
.L243:
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jb	.L245
	nop
	nop
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z13fault_handlerP11registers_t
	.def	_Z13fault_handlerP11registers_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13fault_handlerP11registers_t
_Z13fault_handlerP11registers_t:
.LFB87:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	-32(%rbp), %rax
	movl	$753664, %edx
	movq	%rax, %rcx
	call	_ZN7ConsoleC1Ei
/APP
 # 28 "os/kernel/cpu/exceptions/fault.cpp" 1
	mov 8(%esp), %eax
	
 # 0 "" 2
/NO_APP
	movl	%eax, -4(%rbp)
	movq	16(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, 56(%rax)
	movq	16(%rbp), %rax
	movl	80(%rax), %eax
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	leaq	_ZN9exception8messagesE(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC50:
	.ascii "Page Fault at \0"
	.text
	.def	_ZL18page_fault_handlerP11registers_t;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZL18page_fault_handlerP11registers_t
_ZL18page_fault_handlerP11registers_t:
.LFB88:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
/APP
 # 42 "os/kernel/cpu/exceptions/fault.cpp" 1
	mov %cr2, %eax
 # 0 "" 2
/NO_APP
	movl	%eax, -4(%rbp)
	leaq	-32(%rbp), %rax
	movl	$753664, %edx
	movq	%rax, %rcx
	call	_ZN7ConsoleC1Ei
	leaq	-32(%rbp), %rax
	leaq	.LC50(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	movl	-4(%rbp), %edx
	leaq	-32(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZN7Console8writeHexEib
	leaq	-32(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
.L248:
/APP
 # 49 "os/kernel/cpu/exceptions/fault.cpp" 1
	hlt
 # 0 "" 2
/NO_APP
	jmp	.L248
	.seh_endproc
	.globl	universal_fault_handler
	.def	universal_fault_handler;	.scl	2;	.type	32;	.endef
	.seh_proc	universal_fault_handler
universal_fault_handler:
.LFB89:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	subq	$152, %rsp
	.seh_stackalloc	152
	leaq	144(%rsp), %rbp
	.seh_setframe	%rbp, 144
	.seh_endprologue
	movl	%ecx, 32(%rbp)
	movl	%edx, 40(%rbp)
	leaq	-112(%rbp), %rdx
	movl	$0, %eax
	movl	$11, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	get_basic_registers
	movl	32(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	40(%rbp), %eax
	movl	%eax, -28(%rbp)
/APP
 # 16 "os/kernel/cpu/exceptions/handlers.cpp" 1
	mov %esp, %eax
 # 0 "" 2
/NO_APP
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-4(%rbp), %eax
	movq	%rax, -16(%rbp)
	cmpl	$8, 32(%rbp)
	je	.L250
	cmpl	$9, 32(%rbp)
	jbe	.L251
	cmpl	$14, 32(%rbp)
	jbe	.L250
.L251:
	cmpl	$17, 32(%rbp)
	jne	.L252
.L250:
	movl	$1, %eax
	jmp	.L253
.L252:
	movl	$0, %eax
.L253:
	movb	%al, -17(%rbp)
	cmpb	$0, -17(%rbp)
	je	.L254
	movq	-16(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -56(%rbp)
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -80(%rbp)
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, -52(%rbp)
	jmp	.L255
.L254:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -56(%rbp)
	movq	-16(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -80(%rbp)
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -52(%rbp)
.L255:
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	_Z13fault_handlerP11registers_t
.L256:
/APP
 # 37 "os/kernel/cpu/exceptions/handlers.cpp" 1
	hlt
 # 0 "" 2
/NO_APP
	jmp	.L256
	.seh_endproc
	.globl	isr_common
	.def	isr_common;	.scl	2;	.type	32;	.endef
	.seh_proc	isr_common
isr_common:
.LFB90:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 60 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pusha
	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs
	movw $0x10, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %fs
	movw %ax, %gs
	pushl %esp
	call universal_fault_handler
	addl $4, %esp
	popl %gs
	popl %fs
	popl %es
	popl %ds
	popa
	addl $8, %esp
	iret
 # 0 "" 2
/NO_APP
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr0
	.def	isr0;	.scl	2;	.type	32;	.endef
	.seh_proc	isr0
isr0:
.LFB91:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 87 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $0
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr1
	.def	isr1;	.scl	2;	.type	32;	.endef
	.seh_proc	isr1
isr1:
.LFB92:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 88 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $1
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr2
	.def	isr2;	.scl	2;	.type	32;	.endef
	.seh_proc	isr2
isr2:
.LFB93:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 89 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $2
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr3
	.def	isr3;	.scl	2;	.type	32;	.endef
	.seh_proc	isr3
isr3:
.LFB94:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 90 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $3
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr4
	.def	isr4;	.scl	2;	.type	32;	.endef
	.seh_proc	isr4
isr4:
.LFB95:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 91 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $4
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr5
	.def	isr5;	.scl	2;	.type	32;	.endef
	.seh_proc	isr5
isr5:
.LFB96:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 92 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $5
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr6
	.def	isr6;	.scl	2;	.type	32;	.endef
	.seh_proc	isr6
isr6:
.LFB97:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 93 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $6
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr7
	.def	isr7;	.scl	2;	.type	32;	.endef
	.seh_proc	isr7
isr7:
.LFB98:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 94 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $7
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr9
	.def	isr9;	.scl	2;	.type	32;	.endef
	.seh_proc	isr9
isr9:
.LFB99:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 95 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $9
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr15
	.def	isr15;	.scl	2;	.type	32;	.endef
	.seh_proc	isr15
isr15:
.LFB100:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 96 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $15
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr16
	.def	isr16;	.scl	2;	.type	32;	.endef
	.seh_proc	isr16
isr16:
.LFB101:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 97 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $16
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr18
	.def	isr18;	.scl	2;	.type	32;	.endef
	.seh_proc	isr18
isr18:
.LFB102:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 98 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $18
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr19
	.def	isr19;	.scl	2;	.type	32;	.endef
	.seh_proc	isr19
isr19:
.LFB103:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 99 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $19
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr20
	.def	isr20;	.scl	2;	.type	32;	.endef
	.seh_proc	isr20
isr20:
.LFB104:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 100 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $20
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr21
	.def	isr21;	.scl	2;	.type	32;	.endef
	.seh_proc	isr21
isr21:
.LFB105:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 101 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $21
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr22
	.def	isr22;	.scl	2;	.type	32;	.endef
	.seh_proc	isr22
isr22:
.LFB106:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 102 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $22
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr23
	.def	isr23;	.scl	2;	.type	32;	.endef
	.seh_proc	isr23
isr23:
.LFB107:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 103 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $23
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr24
	.def	isr24;	.scl	2;	.type	32;	.endef
	.seh_proc	isr24
isr24:
.LFB108:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 104 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $24
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr25
	.def	isr25;	.scl	2;	.type	32;	.endef
	.seh_proc	isr25
isr25:
.LFB109:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 105 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $25
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr26
	.def	isr26;	.scl	2;	.type	32;	.endef
	.seh_proc	isr26
isr26:
.LFB110:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 106 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $26
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr27
	.def	isr27;	.scl	2;	.type	32;	.endef
	.seh_proc	isr27
isr27:
.LFB111:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 107 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $27
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr28
	.def	isr28;	.scl	2;	.type	32;	.endef
	.seh_proc	isr28
isr28:
.LFB112:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 108 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $28
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr29
	.def	isr29;	.scl	2;	.type	32;	.endef
	.seh_proc	isr29
isr29:
.LFB113:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 109 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $29
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr30
	.def	isr30;	.scl	2;	.type	32;	.endef
	.seh_proc	isr30
isr30:
.LFB114:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 110 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $30
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr31
	.def	isr31;	.scl	2;	.type	32;	.endef
	.seh_proc	isr31
isr31:
.LFB115:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 111 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $0
	pushl $31
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr8
	.def	isr8;	.scl	2;	.type	32;	.endef
	.seh_proc	isr8
isr8:
.LFB116:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 113 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $8
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr10
	.def	isr10;	.scl	2;	.type	32;	.endef
	.seh_proc	isr10
isr10:
.LFB117:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 114 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $10
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr11
	.def	isr11;	.scl	2;	.type	32;	.endef
	.seh_proc	isr11
isr11:
.LFB118:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 115 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $11
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr12
	.def	isr12;	.scl	2;	.type	32;	.endef
	.seh_proc	isr12
isr12:
.LFB119:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 116 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $12
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr13
	.def	isr13;	.scl	2;	.type	32;	.endef
	.seh_proc	isr13
isr13:
.LFB120:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 117 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $13
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr14
	.def	isr14;	.scl	2;	.type	32;	.endef
	.seh_proc	isr14
isr14:
.LFB121:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 118 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $14
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	isr17
	.def	isr17;	.scl	2;	.type	32;	.endef
	.seh_proc	isr17
isr17:
.LFB122:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
/APP
 # 119 "os/kernel/cpu/exceptions/handlers.cpp" 1
	pushl $17
	jmp isr_common
 # 0 "" 2
/NO_APP
	popq	%rbp
	ret
	.seh_endproc
	.globl	idt
	.bss
	.align 32
idt:
	.space 2048
	.globl	idtp
idtp:
	.space 6
	.text
	.globl	_Z12idt_set_gatehjth
	.def	_Z12idt_set_gatehjth;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12idt_set_gatehjth
_Z12idt_set_gatehjth:
.LFB123:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, %eax
	movl	%edx, 24(%rbp)
	movl	%r8d, %ecx
	movl	%r9d, %edx
	movb	%al, 16(%rbp)
	movl	%ecx, %eax
	movw	%ax, 32(%rbp)
	movl	%edx, %eax
	movb	%al, 40(%rbp)
	movzbl	16(%rbp), %eax
	movl	24(%rbp), %edx
	movl	%edx, %ecx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	idt(%rip), %rax
	movw	%cx, (%rdx,%rax)
	movl	24(%rbp), %eax
	shrl	$16, %eax
	movl	%eax, %edx
	movzbl	16(%rbp), %eax
	movl	%edx, %ecx
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	6+idt(%rip), %rax
	movw	%cx, (%rdx,%rax)
	movzbl	16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	2+idt(%rip), %rdx
	movzwl	32(%rbp), %eax
	movw	%ax, (%rcx,%rdx)
	movzbl	16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+idt(%rip), %rax
	movb	$0, (%rdx,%rax)
	movzbl	16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	5+idt(%rip), %rdx
	movzbl	40(%rbp), %eax
	movb	%al, (%rcx,%rdx)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z26register_interrupt_handlerhPFvP11registers_tE
	.def	_Z26register_interrupt_handlerhPFvP11registers_tE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z26register_interrupt_handlerhPFvP11registers_tE
_Z26register_interrupt_handlerhPFvP11registers_tE:
.LFB124:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, %eax
	movq	%rdx, 24(%rbp)
	movb	%al, 16(%rbp)
	movzbl	16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	_ZN9exception18interrupt_handlersE(%rip), %rdx
	movq	24(%rbp), %rax
	movq	%rax, (%rcx,%rdx)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8init_idtv
	.def	_Z8init_idtv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8init_idtv
_Z8init_idtv:
.LFB125:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movw	$2047, idtp(%rip)
	leaq	idt(%rip), %rax
	movl	%eax, 2+idtp(%rip)
	movl	$0, -4(%rbp)
	jmp	.L293
.L294:
	movl	-4(%rbp), %eax
	movzbl	%al, %eax
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	%eax, %ecx
	call	_Z12idt_set_gatehjth
	addl	$1, -4(%rbp)
.L293:
	cmpl	$255, -4(%rbp)
	jle	.L294
	leaq	isr0(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$0, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr1(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$1, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr2(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$2, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr3(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$3, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr4(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$4, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr5(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$5, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr6(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$6, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr7(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$7, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr8(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$8, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr9(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$9, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr10(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$10, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr11(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$11, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr12(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$12, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr13(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$13, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr14(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$14, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr15(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$15, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr16(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$16, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr17(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$17, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr18(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$18, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr19(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$19, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr20(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$20, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr21(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$21, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr22(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$22, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr23(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$23, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr24(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$24, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr25(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$25, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr26(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$26, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr27(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$27, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr28(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$28, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr29(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$29, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr30(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$30, %ecx
	call	_Z12idt_set_gatehjth
	leaq	isr31(%rip), %rax
	movl	$142, %r9d
	movl	$8, %r8d
	movl	%eax, %edx
	movl	$31, %ecx
	call	_Z12idt_set_gatehjth
	movl	$0, -8(%rbp)
	jmp	.L295
.L296:
	movl	-8(%rbp), %eax
	movzbl	%al, %eax
	leaq	_Z13fault_handlerP11registers_t(%rip), %rdx
	movl	%eax, %ecx
	call	_Z26register_interrupt_handlerhPFvP11registers_tE
	addl	$1, -8(%rbp)
.L295:
	cmpl	$31, -8(%rbp)
	jle	.L296
/APP
 # 83 "os/kernel/cpu/exceptions/idt.cpp" 1
	lidt idtp(%rip)
 # 0 "" 2
/NO_APP
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6rebootPPc
	.def	_Z6rebootPPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6rebootPPc
_Z6rebootPPc:
.LFB126:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$254, %edx
	movl	$100, %ecx
	call	_ZL4outbth
	movl	$14, %edx
	movl	$3321, %ecx
	call	_ZL4outbth
/APP
 # 10 "os/kernel/cmd/basic.cpp" 1
	int $0xFF
 # 0 "" 2
 # 11 "os/kernel/cmd/basic.cpp" 1
	hlt
 # 0 "" 2
/NO_APP
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8shutdownPPc
	.def	_Z8shutdownPPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8shutdownPPc
_Z8shutdownPPc:
.LFB127:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	$1038, -8(%rbp)
	movq	$1028, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, %ecx
	call	_ZL4outbth
	movl	$0, -20(%rbp)
	jmp	.L299
.L300:
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
.L299:
	movl	-20(%rbp), %eax
	cmpl	$99999, %eax
	setle	%al
	testb	%al, %al
	jne	.L300
	movl	$8192, %edx
	movl	$1540, %ecx
	call	_ZL4outwtt
	movl	$8192, %edx
	movl	$45060, %ecx
	call	_ZL4outwtt
	movl	$13312, %edx
	movl	$16388, %ecx
	call	_ZL4outwtt
	movl	$0, %edx
	movl	$21252, %ecx
	call	_ZL4outwtt
	movl	$0, %edx
	movl	$21249, %ecx
	call	_ZL4outwtt
	movl	$1, %edx
	movl	$21256, %ecx
	call	_ZL4outwtt
	movl	$0, %edx
	movl	$21262, %ecx
	call	_ZL4outwtt
	movl	$1, %edx
	movl	$21263, %ecx
	call	_ZL4outwtt
	movl	$3, %edx
	movl	$21255, %ecx
	call	_ZL4outwtt
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	_ZL4outbth
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z9parse_cmdPKcPPci
	.def	_Z9parse_cmdPKcPPci;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9parse_cmdPKcPPci
_Z9parse_cmdPKcPPci:
.LFB128:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movl	%r8d, 48(%rbp)
	cmpq	$0, 32(%rbp)
	je	.L322
	cmpq	$0, 40(%rbp)
	je	.L322
	cmpl	$0, 48(%rbp)
	jle	.L322
	movl	$0, -4(%rbp)
	jmp	.L305
.L306:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	40(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	addl	$1, -4(%rbp)
.L305:
	movl	-4(%rbp), %eax
	cmpl	48(%rbp), %eax
	jl	.L306
	movl	$0, -8(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movb	$0, -17(%rbp)
	jmp	.L307
.L310:
	addq	$1, 32(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, -16(%rbp)
.L308:
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L309
	movzbl	-17(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	.L310
.L309:
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L323
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L313
	xorb	$1, -17(%rbp)
	movq	32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	addq	$1, 32(%rbp)
	jmp	.L307
.L313:
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L314
	movzbl	-17(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	.L315
.L314:
	movq	32(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L316
.L315:
	movq	32(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	32(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L317
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L317
	movq	32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
.L317:
	movq	-32(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jnb	.L318
	movq	-32(%rbp), %rax
	subq	-16(%rbp), %rax
	movl	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	call	_Z8allocatej
	movq	%rax, (%rbx)
	movl	$0, -36(%rbp)
	jmp	.L319
.L320:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rcx
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -36(%rbp)
.L319:
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L320
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-40(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$1, -8(%rbp)
.L318:
	movq	32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
.L316:
	addq	$1, 32(%rbp)
.L307:
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L312
	movl	48(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jl	.L308
	jmp	.L312
.L323:
	nop
.L312:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	40(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	jmp	.L301
.L322:
	nop
.L301:
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	_ZN3cmd8commandsE
	.bss
	.align 32
_ZN3cmd8commandsE:
	.space 512
	.globl	_ZN3cmd13command_countE
	.align 4
_ZN3cmd13command_countE:
	.space 4
	.section .rdata,"dr"
.LC51:
	.ascii "Basic allocation\0"
.LC52:
	.ascii "Multiple unique blocks\0"
.LC53:
	.ascii "Zero size returns null\0"
.LC54:
	.ascii "Memory reuse\0"
.LC55:
	.ascii "memcpy basic function\0"
.LC56:
	.ascii "memcmp basic function\0"
.LC57:
	.ascii "Different sizes work\0"
.LC58:
	.ascii "memcpy data integrity\0"
	.align 8
.LC59:
	.ascii "realloc enlarge with data preservation\0"
	.align 8
.LC60:
	.ascii "realloc shrink with data preservation\0"
.LC61:
	.ascii "memchr finds byte\0"
.LC62:
	.ascii "memchr not found\0"
.LC63:
	.ascii "memmove overlap right\0"
.LC64:
	.ascii "memset patterns\0"
.LC65:
	.ascii "calloc zeros memory\0"
.LC66:
	.ascii "Double free safety\0"
.LC67:
	.ascii "Free nullptr safety\0"
.LC68:
	.ascii "Fragmentation handling\0"
.LC69:
	.ascii "Memory alignment\0"
.LC70:
	.ascii "Boundary access\0"
	.text
	.globl	_Z7memtestP10TestResult
	.def	_Z7memtestP10TestResult;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7memtestP10TestResult
_Z7memtestP10TestResult:
.LFB133:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$360, %rsp
	.seh_stackalloc	360
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 256(%rbp)
	movl	$0, 172(%rbp)
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC51(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 160(%rbp)
	cmpq	$0, 160(%rbp)
	setne	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	160(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC52(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 152(%rbp)
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 144(%rbp)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, %rbx
	movl	$32, %ecx
	call	_Z8allocatej
	cmpq	%rax, %rbx
	setne	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	152(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	144(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC53(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$0, %ecx
	call	_Z8allocatej
	movq	%rax, 136(%rbp)
	cmpq	$0, 136(%rbp)
	sete	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	136(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC54(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 128(%rbp)
	movq	128(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 120(%rbp)
	movq	128(%rbp), %rax
	cmpq	120(%rbp), %rax
	sete	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	120(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC55(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 112(%rbp)
	movq	$0, 104(%rbp)
	movq	104(%rbp), %rdx
	movq	112(%rbp), %rax
	movl	$64, %r8d
	movq	%rax, %rcx
	call	_Z6memcpyPvPKvj
	movb	$1, 223(%rbp)
	movl	$0, 216(%rbp)
	jmp	.L325
.L328:
	cmpb	$0, 223(%rbp)
	je	.L326
	movl	216(%rbp), %eax
	movslq	%eax, %rdx
	movq	112(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	216(%rbp), %eax
	movslq	%eax, %rcx
	movq	104(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L326
	movl	$1, %eax
	jmp	.L327
.L326:
	movl	$0, %eax
.L327:
	movb	%al, 223(%rbp)
	addl	$1, 216(%rbp)
.L325:
	cmpl	$63, 216(%rbp)
	jle	.L328
	movzbl	223(%rbp), %edx
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%dl, (%rax)
	movq	112(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC56(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 96(%rbp)
	movq	96(%rbp), %rax
	movq	%rax, 88(%rbp)
	movq	88(%rbp), %rdx
	movq	96(%rbp), %rax
	movl	$64, %r8d
	movq	%rax, %rcx
	call	_Z6memcmpPKvS0_j
	testl	%eax, %eax
	jne	.L329
	movq	96(%rbp), %rax
	movl	$64, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z6memcmpPKvS0_j
	testl	%eax, %eax
	jne	.L329
	movl	$1, %r8d
	jmp	.L330
.L329:
	movl	$0, %r8d
.L330:
	movq	256(%rbp), %rcx
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movq	96(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC57(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$1, %ecx
	call	_Z8allocatej
	movq	%rax, 80(%rbp)
	movl	$512, %ecx
	call	_Z8allocatej
	movq	%rax, 72(%rbp)
	movl	$2048, %ecx
	call	_Z8allocatej
	movq	%rax, 64(%rbp)
	cmpq	$0, 80(%rbp)
	je	.L331
	cmpq	$0, 72(%rbp)
	je	.L331
	cmpq	$0, 64(%rbp)
	je	.L331
	movl	$1, %r8d
	jmp	.L332
.L331:
	movl	$0, %r8d
.L332:
	movq	256(%rbp), %rcx
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movq	80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	72(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	64(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC58(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, 56(%rbp)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, 48(%rbp)
	movl	$0, 212(%rbp)
	jmp	.L333
.L334:
	movl	212(%rbp), %eax
	movslq	%eax, %rdx
	movq	56(%rbp), %rax
	addq	%rdx, %rax
	movl	212(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, 212(%rbp)
.L333:
	cmpl	$31, 212(%rbp)
	jle	.L334
	movq	56(%rbp), %rdx
	movq	48(%rbp), %rax
	movl	$32, %r8d
	movq	%rax, %rcx
	call	_Z6memcpyPvPKvj
	movb	$1, 211(%rbp)
	movl	$0, 204(%rbp)
	jmp	.L335
.L338:
	cmpb	$0, 211(%rbp)
	je	.L336
	movl	204(%rbp), %eax
	movslq	%eax, %rdx
	movq	48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, 204(%rbp)
	jne	.L336
	movl	$1, %eax
	jmp	.L337
.L336:
	movl	$0, %eax
.L337:
	movb	%al, 211(%rbp)
	addl	$1, 204(%rbp)
.L335:
	cmpl	$31, 204(%rbp)
	jle	.L338
	movzbl	211(%rbp), %edx
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%dl, (%rax)
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	48(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC59(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, 40(%rbp)
	movq	40(%rbp), %rax
	movl	$32, %r8d
	movl	$10, %edx
	movq	%rax, %rcx
	call	_Z6memsetPvij
	movq	40(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rcx
	call	_Z7reallocPvj
	movq	%rax, 32(%rbp)
	cmpq	$0, 32(%rbp)
	je	.L339
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L339
	movq	32(%rbp), %rax
	addq	$31, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L339
	movl	$1, %eax
	jmp	.L340
.L339:
	movl	$0, %eax
.L340:
	movb	%al, 31(%rbp)
	movzbl	31(%rbp), %edx
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%dl, (%rax)
	cmpq	$0, 32(%rbp)
	je	.L341
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
.L341:
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC60(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$64, %ecx
	call	_Z8allocatej
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	movl	$64, %r8d
	movl	$11, %edx
	movq	%rax, %rcx
	call	_Z6memsetPvij
	movq	16(%rbp), %rax
	movl	$32, %edx
	movq	%rax, %rcx
	call	_Z7reallocPvj
	movq	%rax, 8(%rbp)
	cmpq	$0, 8(%rbp)
	je	.L342
	movq	8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$11, %al
	jne	.L342
	movq	8(%rbp), %rax
	addq	$15, %rax
	movzbl	(%rax), %eax
	cmpb	$11, %al
	jne	.L342
	movl	$1, %eax
	jmp	.L343
.L342:
	movl	$0, %eax
.L343:
	movb	%al, 7(%rbp)
	movzbl	7(%rbp), %edx
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%dl, (%rax)
	cmpq	$0, 8(%rbp)
	je	.L344
	movq	8(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
.L344:
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC61(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$50, %ecx
	call	_Z8allocatej
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$50, %r8d
	movl	$65, %edx
	movq	%rax, %rcx
	call	_Z6memsetPvij
	movq	-8(%rbp), %rax
	addq	$25, %rax
	movb	$88, (%rax)
	movq	-8(%rbp), %rax
	movl	$50, %r8d
	movl	$88, %edx
	movq	%rax, %rcx
	call	_Z6memchrPKvij
	movq	-8(%rbp), %rdx
	addq	$25, %rdx
	cmpq	%rdx, %rax
	sete	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC62(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$50, %ecx
	call	_Z8allocatej
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$50, %r8d
	movl	$65, %edx
	movq	%rax, %rcx
	call	_Z6memsetPvij
	movq	-16(%rbp), %rax
	movl	$50, %r8d
	movl	$66, %edx
	movq	%rax, %rcx
	call	_Z6memchrPKvij
	testq	%rax, %rax
	sete	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC63(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$50, %ecx
	call	_Z8allocatej
	movq	%rax, -24(%rbp)
	movl	$0, 200(%rbp)
	jmp	.L345
.L346:
	movl	200(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	200(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, 200(%rbp)
.L345:
	cmpl	$49, 200(%rbp)
	jle	.L346
	movq	-24(%rbp), %rax
	leaq	10(%rax), %rcx
	movq	-24(%rbp), %rax
	movl	$20, %r8d
	movq	%rax, %rdx
	call	_Z7memmovePvPKvj
	movb	$1, 199(%rbp)
	movl	$0, 192(%rbp)
	jmp	.L347
.L350:
	cmpb	$0, 199(%rbp)
	je	.L348
	movl	192(%rbp), %eax
	addl	$10, %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, 192(%rbp)
	jne	.L348
	movl	$1, %eax
	jmp	.L349
.L348:
	movl	$0, %eax
.L349:
	movb	%al, 199(%rbp)
	addl	$1, 192(%rbp)
.L347:
	cmpl	$19, 192(%rbp)
	jle	.L350
	movzbl	199(%rbp), %edx
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%dl, (%rax)
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC64(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$32, %r8d
	movl	$85, %edx
	movq	%rax, %rcx
	call	_Z6memsetPvij
	movb	$1, 191(%rbp)
	movl	$0, 184(%rbp)
	jmp	.L351
.L354:
	cmpb	$0, 191(%rbp)
	je	.L352
	movl	184(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$85, %al
	jne	.L352
	movl	$1, %eax
	jmp	.L353
.L352:
	movl	$0, %eax
.L353:
	movb	%al, 191(%rbp)
	addl	$1, 184(%rbp)
.L351:
	cmpl	$31, 184(%rbp)
	jle	.L354
	movzbl	191(%rbp), %edx
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%dl, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC65(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$4, %edx
	movl	$10, %ecx
	call	_Z6callocjj
	movq	%rax, -40(%rbp)
	movb	$1, 183(%rbp)
	movl	$0, 176(%rbp)
	jmp	.L355
.L358:
	cmpb	$0, 183(%rbp)
	je	.L356
	movl	176(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L356
	movl	$1, %eax
	jmp	.L357
.L356:
	movl	$0, %eax
.L357:
	movb	%al, 183(%rbp)
	addl	$1, 176(%rbp)
.L355:
	cmpl	$9, 176(%rbp)
	jle	.L358
	movzbl	183(%rbp), %edx
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%dl, (%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC66(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$16, %ecx
	call	_Z8allocatej
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	256(%rbp), %rcx
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	$1, (%rax)
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC67(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$0, %ecx
	call	_Z4freePv
	movq	256(%rbp), %rcx
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	$1, (%rax)
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC68(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, -56(%rbp)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, -64(%rbp)
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, -72(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	$32, %ecx
	call	_Z8allocatej
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	setne	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC69(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$17, %ecx
	call	_Z8allocatej
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	andl	$15, %eax
	testl	%eax, %eax
	sete	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC70(%rip), %rdx
	movq	%rdx, 8(%rax)
	movl	$8, %ecx
	call	_Z8allocatej
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	addq	$7, %rax
	movb	$15, (%rax)
	movq	-96(%rbp), %rax
	addq	$7, %rax
	movzbl	(%rax), %eax
	cmpb	$15, %al
	sete	%cl
	movq	256(%rbp), %r8
	movl	172(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 172(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	movl	172(%rbp), %eax
	addq	$360, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN6stringC1EPKc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN6stringC1EPKc
	.def	_ZN6stringC1EPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6stringC1EPKc
_ZN6stringC1EPKc:
.LFB168:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcEC2Ev
	movq	32(%rbp), %rax
	movb	$1, 16(%rax)
	jmp	.L361
.L362:
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 40(%rbp)
	movq	%rax, %rdx
.LEHB0:
	call	_ZN7managedIcE9push_backERKc
.LEHE0:
.L361:
	movq	40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L362
	jmp	.L365
.L364:
	movq	%rax, %rbx
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED2Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB1:
	call	_Unwind_Resume
	nop
.LEHE1:
.L365:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA168:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE168-.LLSDACSB168
.LLSDACSB168:
	.uleb128 .LEHB0-.LFB168
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L364-.LFB168
	.uleb128 0
	.uleb128 .LEHB1-.LFB168
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE168:
	.section	.text$_ZN6stringC1EPKc,"x"
	.linkonce discard
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC71:
	.ascii "Basic int creation and push_back\0"
.LC72:
	.ascii "Char insertion at position\0"
.LC73:
	.ascii "Double element removal\0"
.LC77:
	.ascii "Int array subscript operator\0"
	.align 8
.LC78:
	.ascii "Float operator+ with single element\0"
	.align 8
.LC81:
	.ascii "Int operator+ with another managed\0"
.LC82:
	.ascii "Char operator+= with element\0"
	.align 8
.LC83:
	.ascii "Double operator+= with another managed\0"
.LC86:
	.ascii "Int capacity auto-expansion\0"
	.align 8
.LC87:
	.ascii "Float data() method returns correct pointer\0"
.LC90:
	.ascii "Destructor safety\0"
.LC91:
	.ascii "Out of bounds access safety\0"
	.align 8
.LC92:
	.ascii "Large number of elements (stress test)\0"
	.align 8
.LC93:
	.ascii "Multiple type instances coexistence\0"
.LC95:
	.ascii "Initial capacity and size\0"
	.text
	.globl	_Z7mngtestP10TestResult
	.def	_Z7mngtestP10TestResult;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7mngtestP10TestResult
_Z7mngtestP10TestResult:
.LFB169:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$920, %rsp
	.seh_stackalloc	920
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 816(%rbp)
	movl	$0, 776(%rbp)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC71(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	592(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movl	$42, 620(%rbp)
	leaq	620(%rbp), %rdx
	leaq	592(%rbp), %rax
	movq	%rax, %rcx
.LEHB2:
	call	_ZN7managedIiE9push_backEOi
	movl	$123, 624(%rbp)
	leaq	624(%rbp), %rdx
	leaq	592(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE9push_backEOi
	leaq	592(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
	movl	(%rax), %eax
	cmpl	$42, %eax
	jne	.L367
	leaq	592(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
.LEHE2:
	movl	(%rax), %eax
	cmpl	$123, %eax
	jne	.L367
	leaq	592(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIiE4sizeEv
	cmpl	$2, %eax
	jne	.L367
	movl	$1, %r8d
	jmp	.L368
.L367:
	movl	$0, %r8d
.L368:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC72(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	560(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcEC1Ev
	movb	$65, 629(%rbp)
	leaq	629(%rbp), %rdx
	leaq	560(%rbp), %rax
	movq	%rax, %rcx
.LEHB3:
	call	_ZN7managedIcE9push_backEOc
	movb	$67, 630(%rbp)
	leaq	630(%rbp), %rdx
	leaq	560(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcE9push_backEOc
	movb	$66, 631(%rbp)
	leaq	631(%rbp), %rdx
	leaq	560(%rbp), %rax
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIcE6insertEiRKc
	leaq	560(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIcEixEi
	movzbl	(%rax), %eax
	cmpb	$65, %al
	jne	.L369
	leaq	560(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIcEixEi
	movzbl	(%rax), %eax
	cmpb	$66, %al
	jne	.L369
	leaq	560(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	_ZN7managedIcEixEi
.LEHE3:
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jne	.L369
	leaq	560(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIcE4sizeEv
	cmpl	$3, %eax
	jne	.L369
	movl	$1, %r8d
	jmp	.L370
.L369:
	movl	$0, %r8d
.L370:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC73(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	528(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdEC1Ev
	movsd	.LC74(%rip), %xmm0
	movsd	%xmm0, 632(%rbp)
	leaq	632(%rbp), %rdx
	leaq	528(%rbp), %rax
	movq	%rax, %rcx
.LEHB4:
	call	_ZN7managedIdE9push_backEOd
	movsd	.LC75(%rip), %xmm0
	movsd	%xmm0, 640(%rbp)
	leaq	640(%rbp), %rdx
	leaq	528(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdE9push_backEOd
	movsd	.LC76(%rip), %xmm0
	movsd	%xmm0, 648(%rbp)
	leaq	648(%rbp), %rdx
	leaq	528(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdE9push_backEOd
	leaq	528(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIdE6removeEi
	leaq	528(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIdEixEi
	movsd	(%rax), %xmm0
	ucomisd	.LC74(%rip), %xmm0
	jp	.L371
	ucomisd	.LC74(%rip), %xmm0
	jne	.L371
	leaq	528(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIdEixEi
.LEHE4:
	movsd	(%rax), %xmm0
	ucomisd	.LC76(%rip), %xmm0
	jp	.L371
	ucomisd	.LC76(%rip), %xmm0
	jne	.L371
	leaq	528(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIdE4sizeEv
	cmpl	$2, %eax
	jne	.L371
	movl	$1, %r8d
	jmp	.L374
.L371:
	movl	$0, %r8d
.L374:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC77(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	496(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movl	$10, 660(%rbp)
	leaq	660(%rbp), %rdx
	leaq	496(%rbp), %rax
	movq	%rax, %rcx
.LEHB5:
	call	_ZN7managedIiE9push_backEOi
	movl	$20, 664(%rbp)
	leaq	664(%rbp), %rdx
	leaq	496(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE9push_backEOi
	leaq	496(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
	movl	$100, (%rax)
	leaq	496(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
	movl	$200, (%rax)
	leaq	496(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
	movl	(%rax), %eax
	cmpl	$100, %eax
	jne	.L375
	leaq	496(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
.LEHE5:
	movl	(%rax), %eax
	cmpl	$200, %eax
	jne	.L375
	movl	$1, %r8d
	jmp	.L376
.L375:
	movl	$0, %r8d
.L376:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC78(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	464(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfEC1Ev
	movss	.LC79(%rip), %xmm0
	movss	%xmm0, 668(%rbp)
	leaq	668(%rbp), %rdx
	leaq	464(%rbp), %rax
	movq	%rax, %rcx
.LEHB6:
	call	_ZN7managedIfE9push_backEOf
	movss	.LC80(%rip), %xmm0
	movss	%xmm0, 672(%rbp)
	leaq	432(%rbp), %rax
	leaq	672(%rbp), %rcx
	leaq	464(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZNK7managedIfEplERKf
.LEHE6:
	leaq	432(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIfE4sizeEv
	cmpl	$2, %eax
	jne	.L377
	leaq	432(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
.LEHB7:
	call	_ZN7managedIfEixEi
	movss	(%rax), %xmm0
	ucomiss	.LC79(%rip), %xmm0
	jp	.L377
	ucomiss	.LC79(%rip), %xmm0
	jne	.L377
	leaq	432(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIfEixEi
.LEHE7:
	movss	(%rax), %xmm0
	ucomiss	.LC80(%rip), %xmm0
	jp	.L377
	ucomiss	.LC80(%rip), %xmm0
	jne	.L377
	movl	$1, %r8d
	jmp	.L380
.L377:
	movl	$0, %r8d
.L380:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC81(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	400(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movl	$1, 676(%rbp)
	leaq	676(%rbp), %rdx
	leaq	400(%rbp), %rax
	movq	%rax, %rcx
.LEHB8:
	call	_ZN7managedIiE9push_backEOi
	movl	$2, 680(%rbp)
	leaq	680(%rbp), %rdx
	leaq	400(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE9push_backEOi
.LEHE8:
	leaq	368(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movl	$3, 684(%rbp)
	leaq	684(%rbp), %rdx
	leaq	368(%rbp), %rax
	movq	%rax, %rcx
.LEHB9:
	call	_ZN7managedIiE9push_backEOi
	movl	$4, 688(%rbp)
	leaq	688(%rbp), %rdx
	leaq	368(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE9push_backEOi
.LEHE9:
	leaq	336(%rbp), %rax
	leaq	368(%rbp), %rcx
	leaq	400(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZNK7managedIiEplERKS0_
	leaq	336(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIiE4sizeEv
	cmpl	$4, %eax
	jne	.L381
	leaq	336(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
.LEHB10:
	call	_ZN7managedIiEixEi
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L381
	leaq	336(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
	movl	(%rax), %eax
	cmpl	$2, %eax
	jne	.L381
	leaq	336(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	.L381
	leaq	336(%rbp), %rax
	movl	$3, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
.LEHE10:
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L381
	movl	$1, %r8d
	jmp	.L382
.L381:
	movl	$0, %r8d
.L382:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC82(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	304(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcEC1Ev
	movb	$88, 694(%rbp)
	leaq	694(%rbp), %rdx
	leaq	304(%rbp), %rax
	movq	%rax, %rcx
.LEHB11:
	call	_ZN7managedIcEpLEOKc
	movb	$89, 695(%rbp)
	leaq	695(%rbp), %rdx
	leaq	304(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcEpLEOKc
	leaq	304(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIcE4sizeEv
	cmpl	$2, %eax
	jne	.L383
	leaq	304(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIcEixEi
	movzbl	(%rax), %eax
	cmpb	$88, %al
	jne	.L383
	leaq	304(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIcEixEi
.LEHE11:
	movzbl	(%rax), %eax
	cmpb	$89, %al
	jne	.L383
	movl	$1, %r8d
	jmp	.L384
.L383:
	movl	$0, %r8d
.L384:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC83(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	272(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdEC1Ev
	movsd	.LC84(%rip), %xmm0
	movsd	%xmm0, 696(%rbp)
	leaq	696(%rbp), %rdx
	leaq	272(%rbp), %rax
	movq	%rax, %rcx
.LEHB12:
	call	_ZN7managedIdE9push_backEOd
.LEHE12:
	leaq	240(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdEC1Ev
	movsd	.LC85(%rip), %xmm0
	movsd	%xmm0, 704(%rbp)
	leaq	704(%rbp), %rdx
	leaq	240(%rbp), %rax
	movq	%rax, %rcx
.LEHB13:
	call	_ZN7managedIdE9push_backEOd
	leaq	240(%rbp), %rdx
	leaq	272(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdEpLERKS0_
	leaq	272(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIdE4sizeEv
	cmpl	$2, %eax
	jne	.L385
	leaq	272(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIdEixEi
	movsd	(%rax), %xmm0
	movsd	.LC84(%rip), %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L385
	movsd	.LC84(%rip), %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L385
	leaq	272(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZN7managedIdEixEi
.LEHE13:
	movsd	(%rax), %xmm0
	ucomisd	.LC85(%rip), %xmm0
	jp	.L385
	ucomisd	.LC85(%rip), %xmm0
	jne	.L385
	movl	$1, %r8d
	jmp	.L388
.L385:
	movl	$0, %r8d
.L388:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC86(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	208(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ei
	movl	$1, 716(%rbp)
	leaq	716(%rbp), %rdx
	leaq	208(%rbp), %rax
	movq	%rax, %rcx
.LEHB14:
	call	_ZN7managedIiE9push_backEOi
	movl	$2, 720(%rbp)
	leaq	720(%rbp), %rdx
	leaq	208(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE9push_backEOi
	movl	$3, 724(%rbp)
	leaq	724(%rbp), %rdx
	leaq	208(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE9push_backEOi
.LEHE14:
	leaq	208(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIiE4sizeEv
	cmpl	$3, %eax
	jne	.L389
	leaq	208(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIiE8capacityEv
	cmpl	$2, %eax
	jle	.L389
	movl	$1, %r8d
	jmp	.L390
.L389:
	movl	$0, %r8d
.L390:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC87(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	176(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfEC1Ev
	movss	.LC88(%rip), %xmm0
	movss	%xmm0, 728(%rbp)
	leaq	728(%rbp), %rdx
	leaq	176(%rbp), %rax
	movq	%rax, %rcx
.LEHB15:
	call	_ZN7managedIfE9push_backEOf
	movss	.LC89(%rip), %xmm0
	movss	%xmm0, 732(%rbp)
	leaq	732(%rbp), %rdx
	leaq	176(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfE9push_backEOf
.LEHE15:
	leaq	176(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfE4dataEv
	movq	%rax, 768(%rbp)
	movq	768(%rbp), %rax
	movss	(%rax), %xmm0
	ucomiss	.LC88(%rip), %xmm0
	jp	.L391
	ucomiss	.LC88(%rip), %xmm0
	jne	.L391
	movq	768(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	ucomiss	.LC89(%rip), %xmm0
	jp	.L391
	ucomiss	.LC89(%rip), %xmm0
	jne	.L391
	movl	$1, %r8d
	jmp	.L394
.L391:
	movl	$0, %r8d
.L394:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC90(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movl	$1, 736(%rbp)
	leaq	736(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
.LEHB16:
	call	_ZN7managedIiE9push_backEOi
	movl	$2, 740(%rbp)
	leaq	740(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE9push_backEOi
.LEHE16:
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	144(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movl	$3, 744(%rbp)
	leaq	744(%rbp), %rdx
	leaq	144(%rbp), %rax
	movq	%rax, %rcx
.LEHB17:
	call	_ZN7managedIiE9push_backEOi
	leaq	144(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
.LEHE17:
	movl	(%rax), %eax
	cmpl	$3, %eax
	sete	%cl
	movq	816(%rbp), %r8
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%r8, %rax
	movb	%cl, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC91(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	112(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movl	$1, 748(%rbp)
	leaq	748(%rbp), %rdx
	leaq	112(%rbp), %rax
	movq	%rax, %rcx
.LEHB18:
	call	_ZN7managedIiE9push_backEOi
.LEHE18:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	$1, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC92(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movb	$1, 783(%rbp)
	movl	$0, -84(%rbp)
	jmp	.L395
.L398:
	leaq	-84(%rbp), %rdx
	leaq	80(%rbp), %rax
	movq	%rax, %rcx
.LEHB19:
	call	_ZN7managedIiE9push_backERKi
	movl	-84(%rbp), %edx
	leaq	80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
.LEHE19:
	movl	(%rax), %edx
	movl	-84(%rbp), %eax
	cmpl	%eax, %edx
	setne	%al
	testb	%al, %al
	je	.L396
	movb	$0, 783(%rbp)
	jmp	.L397
.L396:
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
.L395:
	movl	-84(%rbp), %eax
	cmpl	$99, %eax
	jle	.L398
.L397:
	cmpb	$0, 783(%rbp)
	je	.L399
	leaq	80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIiE4sizeEv
	cmpl	$100, %eax
	jne	.L399
	movl	$1, %r8d
	jmp	.L400
.L399:
	movl	$0, %r8d
.L400:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC93(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	leaq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcEC1Ev
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdEC1Ev
	movl	$100, 752(%rbp)
	leaq	752(%rbp), %rdx
	leaq	48(%rbp), %rax
	movq	%rax, %rcx
.LEHB20:
	call	_ZN7managedIiE9push_backEOi
	movb	$90, 759(%rbp)
	leaq	759(%rbp), %rdx
	leaq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcE9push_backEOc
	movsd	.LC94(%rip), %xmm0
	movsd	%xmm0, 760(%rbp)
	leaq	760(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdE9push_backEOd
	leaq	48(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEixEi
	movl	(%rax), %eax
	cmpl	$100, %eax
	jne	.L401
	leaq	16(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIcEixEi
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jne	.L401
	leaq	-16(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZN7managedIdEixEi
.LEHE20:
	movsd	(%rax), %xmm0
	ucomisd	.LC94(%rip), %xmm0
	jp	.L401
	ucomisd	.LC94(%rip), %xmm0
	jne	.L401
	movl	$1, %r8d
	jmp	.L403
.L401:
	movl	$0, %r8d
.L403:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	816(%rbp), %rax
	addq	%rdx, %rax
	leaq	.LC95(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	-48(%rbp), %rax
	movl	$32, %edx
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ei
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIiE4sizeEv
	testl	%eax, %eax
	jne	.L404
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNK7managedIiE8capacityEv
	cmpl	$32, %eax
	jne	.L404
	movl	$1, %r8d
	jmp	.L405
.L404:
	movl	$0, %r8d
.L405:
	movq	816(%rbp), %rcx
	movl	776(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, 776(%rbp)
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movb	%r8b, (%rax)
	movl	776(%rbp), %ebx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	leaq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED1Ev
	leaq	48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	112(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	144(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	176(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfED1Ev
	leaq	208(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	240(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	leaq	272(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	leaq	304(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED1Ev
	leaq	336(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	368(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	400(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	432(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfED1Ev
	leaq	464(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfED1Ev
	leaq	496(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	leaq	528(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	leaq	560(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED1Ev
	leaq	592(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	movl	%ebx, %eax
	jmp	.L454
.L440:
	movq	%rax, %rbx
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L408
.L444:
	movq	%rax, %rbx
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	leaq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED1Ev
	leaq	48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L410
.L443:
	movq	%rax, %rbx
.L410:
	leaq	80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L411
.L442:
	movq	%rax, %rbx
.L411:
	leaq	112(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L412
.L441:
	movq	%rax, %rbx
.L412:
	leaq	144(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L408
.L439:
	movq	%rax, %rbx
.L408:
	leaq	176(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfED1Ev
	jmp	.L413
.L438:
	movq	%rax, %rbx
.L413:
	leaq	208(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L414
.L437:
	movq	%rax, %rbx
.L414:
	leaq	240(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	jmp	.L415
.L436:
	movq	%rax, %rbx
.L415:
	leaq	272(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	jmp	.L416
.L435:
	movq	%rax, %rbx
.L416:
	leaq	304(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED1Ev
	jmp	.L417
.L434:
	movq	%rax, %rbx
.L417:
	leaq	336(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L418
.L433:
	movq	%rax, %rbx
.L418:
	leaq	368(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L419
.L432:
	movq	%rax, %rbx
.L419:
	leaq	400(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L420
.L431:
	movq	%rax, %rbx
.L420:
	leaq	432(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfED1Ev
	jmp	.L421
.L430:
	movq	%rax, %rbx
.L421:
	leaq	464(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfED1Ev
	jmp	.L422
.L429:
	movq	%rax, %rbx
.L422:
	leaq	496(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	jmp	.L423
.L428:
	movq	%rax, %rbx
.L423:
	leaq	528(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdED1Ev
	jmp	.L424
.L427:
	movq	%rax, %rbx
.L424:
	leaq	560(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED1Ev
	jmp	.L425
.L426:
	movq	%rax, %rbx
.L425:
	leaq	592(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB21:
	call	_Unwind_Resume
.LEHE21:
.L454:
	addq	$920, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA169:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE169-.LLSDACSB169
.LLSDACSB169:
	.uleb128 .LEHB2-.LFB169
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L426-.LFB169
	.uleb128 0
	.uleb128 .LEHB3-.LFB169
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L427-.LFB169
	.uleb128 0
	.uleb128 .LEHB4-.LFB169
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L428-.LFB169
	.uleb128 0
	.uleb128 .LEHB5-.LFB169
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L429-.LFB169
	.uleb128 0
	.uleb128 .LEHB6-.LFB169
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L430-.LFB169
	.uleb128 0
	.uleb128 .LEHB7-.LFB169
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L431-.LFB169
	.uleb128 0
	.uleb128 .LEHB8-.LFB169
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L432-.LFB169
	.uleb128 0
	.uleb128 .LEHB9-.LFB169
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L433-.LFB169
	.uleb128 0
	.uleb128 .LEHB10-.LFB169
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L434-.LFB169
	.uleb128 0
	.uleb128 .LEHB11-.LFB169
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L435-.LFB169
	.uleb128 0
	.uleb128 .LEHB12-.LFB169
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L436-.LFB169
	.uleb128 0
	.uleb128 .LEHB13-.LFB169
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L437-.LFB169
	.uleb128 0
	.uleb128 .LEHB14-.LFB169
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L438-.LFB169
	.uleb128 0
	.uleb128 .LEHB15-.LFB169
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L439-.LFB169
	.uleb128 0
	.uleb128 .LEHB16-.LFB169
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L440-.LFB169
	.uleb128 0
	.uleb128 .LEHB17-.LFB169
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L441-.LFB169
	.uleb128 0
	.uleb128 .LEHB18-.LFB169
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L442-.LFB169
	.uleb128 0
	.uleb128 .LEHB19-.LFB169
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L443-.LFB169
	.uleb128 0
	.uleb128 .LEHB20-.LFB169
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L444-.LFB169
	.uleb128 0
	.uleb128 .LEHB21-.LFB169
	.uleb128 .LEHE21-.LEHB21
	.uleb128 0
	.uleb128 0
.LLSDACSE169:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC96:
	.ascii "[----] \0"
.LC97:
	.ascii "[FAIL] \0"
	.text
	.globl	_Z5checkP10TestResultPt7Consolei
	.def	_Z5checkP10TestResultPt7Consolei;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5checkP10TestResultPt7Consolei
_Z5checkP10TestResultPt7Consolei:
.LFB170:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	64(%rsp), %rbp
	.seh_setframe	%rbp, 64
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, %rbx
	movq	(%rbx), %rax
	movq	8(%rbx), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%r9d, 56(%rbp)
	movb	$1, -1(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L456
.L461:
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L457
	addl	$1, -8(%rbp)
.L457:
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L458
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L459
	leaq	.LC96(%rip), %rax
	jmp	.L460
.L459:
	leaq	.LC97(%rip), %rax
.L460:
	leaq	-32(%rbp), %rcx
	movq	%rax, %rdx
	call	_ZN7Console5writeEPKc
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	movb	$0, -1(%rbp)
.L458:
	addl	$1, -12(%rbp)
.L456:
	movl	-12(%rbp), %eax
	cmpl	56(%rbp), %eax
	jl	.L461
	movzbl	-1(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L463
	movq	40(%rbp), %rax
	movl	$4000, %r8d
	movq	%rax, %rdx
	movl	$753664, %ecx
	call	_Z6memcpyPvPKvj
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L463:
	nop
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC98:
	.ascii "KERNEL PANIC\12\0"
.LC99:
	.ascii "AUTOTEST FAILED\0"
.LC100:
	.ascii "MEMORY TEST\0"
	.text
	.globl	_Z8autotestv
	.def	_Z8autotestv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8autotestv
_Z8autotestv:
.LFB171:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	movl	$8392, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	8392
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	256(%rbp), %rdx
	leaq	240(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7ConsoleC1EPt
	leaq	240(%rbp), %rax
	leaq	.LC98(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	leaq	240(%rbp), %rax
	leaq	.LC99(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	leaq	-80(%rbp), %rdx
	movl	$0, %eax
	movl	$40, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	240(%rbp), %rax
	leaq	.LC100(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN7Console9writeLineEPKc
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z7memtestP10TestResult
	movl	%eax, %ecx
	movq	240(%rbp), %rax
	movq	248(%rbp), %rdx
	movq	%rax, -96(%rbp)
	movq	%rdx, -88(%rbp)
	leaq	-96(%rbp), %r8
	leaq	256(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	_Z5checkP10TestResultPt7Consolei
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z7mngtestP10TestResult
	movl	%eax, %ecx
	movq	240(%rbp), %rax
	movq	248(%rbp), %rdx
	movq	%rax, -96(%rbp)
	movq	%rdx, -88(%rbp)
	leaq	-96(%rbp), %r8
	leaq	256(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movl	%ecx, %r9d
	movq	%rax, %rcx
	call	_Z5checkP10TestResultPt7Consolei
	nop
	addq	$8392, %rsp
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN6stringD1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN6stringD1Ev
	.def	_ZN6stringD1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6stringD1Ev
_ZN6stringD1Ev:
.LFB175:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC101:
	.ascii "Hello,\0"
.LC102:
	.ascii " world\0"
	.text
	.globl	_start
	.def	_start;	.scl	2;	.type	32;	.endef
	.seh_proc	_start
_start:
.LFB172:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	leaq	96(%rsp), %rbp
	.seh_setframe	%rbp, 96
	.seh_endprologue
	call	_ZN9exception4initEv
	call	_ZN6memory4initEv
.LEHB22:
	call	_Z8autotestv
	leaq	-32(%rbp), %rax
	movl	$753664, %edx
	movq	%rax, %rcx
	call	_ZN7ConsoleC1Ei
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5clearEv
	leaq	-64(%rbp), %rax
	leaq	.LC101(%rip), %rdx
	movq	%rax, %rcx
	call	_ZN6stringC1EPKc
.LEHE22:
	leaq	-64(%rbp), %rax
	leaq	.LC102(%rip), %rdx
	movq	%rax, %rcx
.LEHB23:
	call	_ZN7managedIcEpLILj7EEERS0_RAT__Kc
	movb	$33, -1(%rbp)
	leaq	-1(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcEpLEOKc
.LEHE23:
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcE4dataEv
	movq	%rax, %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7Console5writeEPKc
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN6stringD1Ev
	jmp	.L469
.L468:
	movq	%rax, %rbx
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN6stringD1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB24:
	call	_Unwind_Resume
	nop
.LEHE24:
.L469:
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA172:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE172-.LLSDACSB172
.LLSDACSB172:
	.uleb128 .LEHB22-.LFB172
	.uleb128 .LEHE22-.LEHB22
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB23-.LFB172
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L468-.LFB172
	.uleb128 0
	.uleb128 .LEHB24-.LFB172
	.uleb128 .LEHE24-.LEHB24
	.uleb128 0
	.uleb128 0
.LLSDACSE172:
	.text
	.seh_endproc
	.section	.text$_ZN7managedIcEC2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcEC2Ev
	.def	_ZN7managedIcEC2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcEC2Ev
_ZN7managedIcEC2Ev:
.LFB177:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	movq	16(%rbp), %rax
	movb	$0, 16(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcEC1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcEC1Ev
	.def	_ZN7managedIcEC1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcEC1Ev
_ZN7managedIcEC1Ev:
.LFB178:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	movq	16(%rbp), %rax
	movb	$0, 16(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcED2Ev
	.def	_ZN7managedIcED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcED2Ev
_ZN7managedIcED2Ev:
.LFB180:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcED1Ev
	.def	_ZN7managedIcED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcED1Ev
_ZN7managedIcED1Ev:
.LFB181:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcE9push_backERKc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcE9push_backERKc
	.def	_ZN7managedIcE9push_backERKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcE9push_backERKc
_ZN7managedIcE9push_backERKc:
.LFB182:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7managedIcE6insertEiRKc
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIiEC1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiEC1Ev
	.def	_ZN7managedIiEC1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiEC1Ev
_ZN7managedIiEC1Ev:
.LFB185:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	movq	16(%rbp), %rax
	movb	$0, 16(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIiED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiED1Ev
	.def	_ZN7managedIiED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiED1Ev
_ZN7managedIiED1Ev:
.LFB188:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIiE9push_backEOi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiE9push_backEOi
	.def	_ZN7managedIiE9push_backEOi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiE9push_backEOi
_ZN7managedIiE9push_backEOi:
.LFB189:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7managedIiE6insertEiRKi
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC103:
	.ascii "Index out of range\0"
	.section	.text$_ZN7managedIiEixEi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiEixEi
	.def	_ZN7managedIiEixEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiEixEi
_ZN7managedIiEixEi:
.LFB190:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L479
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jl	.L480
.L479:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L480:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNK7managedIiE4sizeEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK7managedIiE4sizeEv
	.def	_ZNK7managedIiE4sizeEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7managedIiE4sizeEv
_ZNK7managedIiE4sizeEv:
.LFB191:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcE9push_backEOc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcE9push_backEOc
	.def	_ZN7managedIcE9push_backEOc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcE9push_backEOc
_ZN7managedIcE9push_backEOc:
.LFB192:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7managedIcE6insertEiRKc
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcE6insertEiRKc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcE6insertEiRKc
	.def	_ZN7managedIcE6insertEiRKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcE6insertEiRKc
_ZN7managedIcE6insertEiRKc:
.LFB193:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L486
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jle	.L487
.L486:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L487:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcE14grow_if_neededEv
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L488
.L489:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	leaq	(%rax,%rdx), %rcx
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movzbl	(%rcx), %eax
	movb	%al, (%rdx)
	subl	$1, -4(%rbp)
.L488:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jg	.L489
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	24(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcEixEi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcEixEi
	.def	_ZN7managedIcEixEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcEixEi
_ZN7managedIcEixEi:
.LFB194:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L491
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jl	.L492
.L491:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L492:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	24(%rbp), %eax
	cltq
	addq	%rdx, %rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNK7managedIcE4sizeEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK7managedIcE4sizeEv
	.def	_ZNK7managedIcE4sizeEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7managedIcE4sizeEv
_ZNK7managedIcE4sizeEv:
.LFB195:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdEC1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdEC1Ev
	.def	_ZN7managedIdEC1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdEC1Ev
_ZN7managedIdEC1Ev:
.LFB198:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	movq	16(%rbp), %rax
	movb	$0, 16(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdED1Ev
	.def	_ZN7managedIdED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdED1Ev
_ZN7managedIdED1Ev:
.LFB201:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdE9push_backEOd,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdE9push_backEOd
	.def	_ZN7managedIdE9push_backEOd;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdE9push_backEOd
_ZN7managedIdE9push_backEOd:
.LFB202:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7managedIdE6insertEiRKd
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdE6removeEi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdE6removeEi
	.def	_ZN7managedIdE6removeEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdE6removeEi
_ZN7managedIdE6removeEi:
.LFB203:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L500
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jl	.L501
.L500:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L501:
	movl	24(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L502
.L503:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L502:
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L503
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	leal	-1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdEixEi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdEixEi
	.def	_ZN7managedIdEixEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdEixEi
_ZN7managedIdEixEi:
.LFB204:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L505
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jl	.L506
.L505:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L506:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNK7managedIdE4sizeEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK7managedIdE4sizeEv
	.def	_ZNK7managedIdE4sizeEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7managedIdE4sizeEv
_ZNK7managedIdE4sizeEv:
.LFB205:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfEC1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfEC1Ev
	.def	_ZN7managedIfEC1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfEC1Ev
_ZN7managedIfEC1Ev:
.LFB208:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$0, 12(%rax)
	movq	16(%rbp), %rax
	movb	$0, 16(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfED1Ev
	.def	_ZN7managedIfED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfED1Ev
_ZN7managedIfED1Ev:
.LFB211:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z4freePv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfE9push_backEOf,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfE9push_backEOf
	.def	_ZN7managedIfE9push_backEOf;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfE9push_backEOf
_ZN7managedIfE9push_backEOf:
.LFB212:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7managedIfE6insertEiRKf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNK7managedIfEplERKf,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK7managedIfEplERKf
	.def	_ZNK7managedIfEplERKf;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7managedIfEplERKf
_ZNK7managedIfEplERKf:
.LFB213:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	40(%rbp), %rdx
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfEC1ERKS0_
	movq	48(%rbp), %rdx
	movq	32(%rbp), %rax
	movq	%rax, %rcx
.LEHB25:
	call	_ZN7managedIfE9push_backERKf
.LEHE25:
	jmp	.L517
.L516:
	movq	%rax, %rbx
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB26:
	call	_Unwind_Resume
.LEHE26:
.L517:
	movq	32(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA213:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE213-.LLSDACSB213
.LLSDACSB213:
	.uleb128 .LEHB25-.LFB213
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L516-.LFB213
	.uleb128 0
	.uleb128 .LEHB26-.LFB213
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
.LLSDACSE213:
	.section	.text$_ZNK7managedIfEplERKf,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNK7managedIfE4sizeEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK7managedIfE4sizeEv
	.def	_ZNK7managedIfE4sizeEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7managedIfE4sizeEv
_ZNK7managedIfE4sizeEv:
.LFB214:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfEixEi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfEixEi
	.def	_ZN7managedIfEixEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfEixEi
_ZN7managedIfEixEi:
.LFB215:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L521
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jl	.L522
.L521:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L522:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNK7managedIiEplERKS0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK7managedIiEplERKS0_
	.def	_ZNK7managedIiEplERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7managedIiEplERKS0_
_ZNK7managedIiEplERKS0_:
.LFB216:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiEC1Ev
	movq	24(%rbp), %rax
	movl	8(%rax), %edx
	movq	32(%rbp), %rax
	movl	8(%rax), %eax
	addl	%eax, %edx
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	movl	$4, %edx
	movl	%eax, %ecx
	call	_Z6callocjj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	24(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jle	.L525
	movq	24(%rbp), %rax
	movl	8(%rax), %eax
	leal	0(,%rax,4), %ecx
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	_Z6memcpyPvPKvj
.L525:
	movq	32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jle	.L526
	movq	32(%rbp), %rax
	movl	8(%rax), %eax
	leal	0(,%rax,4), %r8d
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	24(%rbp), %rdx
	movl	8(%rdx), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	call	_Z6memcpyPvPKvj
.L526:
	movq	24(%rbp), %rax
	movl	8(%rax), %edx
	movq	32(%rbp), %rax
	movl	8(%rax), %eax
	addl	%eax, %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcEpLEOKc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcEpLEOKc
	.def	_ZN7managedIcEpLEOKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcEpLEOKc
_ZN7managedIcEpLEOKc:
.LFB217:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcE9push_backERKc
	movq	16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdEpLERKS0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdEpLERKS0_
	.def	_ZN7managedIdEpLERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdEpLERKS0_
_ZN7managedIdEpLERKS0_:
.LFB218:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rax
	movl	8(%rax), %eax
	addl	%eax, %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	%eax, %edx
	jle	.L531
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	0(,%rax,8), %edx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z7reallocPvj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
.L531:
	movq	24(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jle	.L532
	movq	24(%rbp), %rax
	movl	8(%rax), %eax
	leal	0(,%rax,8), %r8d
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	call	_Z6memcpyPvPKvj
.L532:
	movq	16(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIiEC1Ei,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiEC1Ei
	.def	_ZN7managedIiEC1Ei;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiEC1Ei
_ZN7managedIiEC1Ei:
.LFB221:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$16, 12(%rax)
	movq	16(%rbp), %rax
	movb	$0, 16(%rax)
	cmpl	$0, 24(%rbp)
	jle	.L535
	movl	24(%rbp), %eax
	jmp	.L536
.L535:
	movl	$16, %eax
.L536:
	movq	16(%rbp), %rdx
	movl	%eax, 12(%rdx)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	movl	$4, %edx
	movl	%eax, %ecx
	call	_Z6callocjj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNK7managedIiE8capacityEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK7managedIiE8capacityEv
	.def	_ZNK7managedIiE8capacityEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7managedIiE8capacityEv
_ZNK7managedIiE8capacityEv:
.LFB222:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfE4dataEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfE4dataEv
	.def	_ZN7managedIfE4dataEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfE4dataEv
_ZN7managedIfE4dataEv:
.LFB223:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIiE9push_backERKi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiE9push_backERKi
	.def	_ZN7managedIiE9push_backERKi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiE9push_backERKi
_ZN7managedIiE9push_backERKi:
.LFB224:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7managedIiE6insertEiRKi
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcEpLILj7EEERS0_RAT__Kc,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcEpLILj7EEERS0_RAT__Kc
	.def	_ZN7managedIcEpLILj7EEERS0_RAT__Kc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcEpLILj7EEERS0_RAT__Kc
_ZN7managedIcEpLILj7EEERS0_RAT__Kc:
.LFB225:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L543
.L546:
	movl	-4(%rbp), %edx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIcE9push_backERKc
	addl	$1, -4(%rbp)
.L543:
	movq	16(%rbp), %rax
	movzbl	16(%rax), %eax
	testb	%al, %al
	je	.L544
	movl	$6, %eax
	jmp	.L545
.L544:
	movl	$7, %eax
.L545:
	cmpl	%eax, -4(%rbp)
	jb	.L546
	movq	16(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcE4dataEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcE4dataEv
	.def	_ZN7managedIcE4dataEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcE4dataEv
_ZN7managedIcE4dataEv:
.LFB226:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIiE6insertEiRKi,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiE6insertEiRKi
	.def	_ZN7managedIiE6insertEiRKi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiE6insertEiRKi
_ZN7managedIiE6insertEiRKi:
.LFB227:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L551
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jle	.L552
.L551:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L552:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIiE14grow_if_neededEv
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L553
.L554:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	leaq	(%rax,%rdx), %rcx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
	subl	$1, -4(%rbp)
.L553:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jg	.L554
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIcE14grow_if_neededEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIcE14grow_if_neededEv
	.def	_ZN7managedIcE14grow_if_neededEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIcE14grow_if_neededEv
_ZN7managedIcE14grow_if_neededEv:
.LFB228:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	%eax, %edx
	jl	.L559
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L557
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rax,%rax), %edx
	jmp	.L558
.L557:
	movl	$16, %edx
.L558:
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z7reallocPvj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
.L559:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdE6insertEiRKd,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdE6insertEiRKd
	.def	_ZN7managedIdE6insertEiRKd;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdE6insertEiRKd
_ZN7managedIdE6insertEiRKd:
.LFB229:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L561
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jle	.L562
.L561:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L562:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIdE14grow_if_neededEv
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L563
.L564:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	subl	$1, -4(%rbp)
.L563:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jg	.L564
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, (%rdx)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfE6insertEiRKf,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfE6insertEiRKf
	.def	_ZN7managedIfE6insertEiRKf;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfE6insertEiRKf
_ZN7managedIfE6insertEiRKf:
.LFB230:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpl	$0, 24(%rbp)
	js	.L566
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jle	.L567
.L566:
	leaq	.LC103(%rip), %rax
	movq	%rax, %rcx
	call	_Z5panicPKc
.L567:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN7managedIfE14grow_if_neededEv
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L568
.L569:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
	subl	$1, -4(%rbp)
.L568:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jg	.L569
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movss	(%rax), %xmm0
	movss	%xmm0, (%rdx)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfEC1ERKS0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfEC1ERKS0_
	.def	_ZN7managedIfEC1ERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfEC1ERKS0_
_ZN7managedIfEC1ERKS0_:
.LFB233:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movl	$16, 12(%rax)
	movq	16(%rbp), %rax
	movb	$0, 16(%rax)
	movq	24(%rbp), %rax
	movl	12(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	24(%rbp), %rax
	movl	8(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	movl	$4, %edx
	movl	%eax, %ecx
	call	_Z6callocjj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	leal	0(,%rax,4), %ecx
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	_Z6memcpyPvPKvj
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfE9push_backERKf,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfE9push_backERKf
	.def	_ZN7managedIfE9push_backERKf;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfE9push_backERKf
_ZN7managedIfE9push_backERKf:
.LFB234:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_ZN7managedIfE6insertEiRKf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIiE14grow_if_neededEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIiE14grow_if_neededEv
	.def	_ZN7managedIiE14grow_if_neededEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIiE14grow_if_neededEv
_ZN7managedIiE14grow_if_neededEv:
.LFB241:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	%eax, %edx
	jl	.L576
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L574
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rax,%rax), %edx
	jmp	.L575
.L574:
	movl	$16, %edx
.L575:
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	0(,%rax,4), %edx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z7reallocPvj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
.L576:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIdE14grow_if_neededEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIdE14grow_if_neededEv
	.def	_ZN7managedIdE14grow_if_neededEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIdE14grow_if_neededEv
_ZN7managedIdE14grow_if_neededEv:
.LFB242:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	%eax, %edx
	jl	.L581
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L579
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rax,%rax), %edx
	jmp	.L580
.L579:
	movl	$16, %edx
.L580:
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	0(,%rax,8), %edx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z7reallocPvj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
.L581:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7managedIfE14grow_if_neededEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN7managedIfE14grow_if_neededEv
	.def	_ZN7managedIfE14grow_if_neededEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7managedIfE14grow_if_neededEv
_ZN7managedIfE14grow_if_neededEv:
.LFB243:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	8(%rax), %edx
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	%eax, %edx
	jl	.L586
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L584
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rax,%rax), %edx
	jmp	.L585
.L584:
	movl	$16, %edx
.L585:
	movq	16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	16(%rbp), %rax
	movl	12(%rax), %eax
	leal	0(,%rax,4), %edx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z7reallocPvj
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
.L586:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC74:
	.long	-1717986918
	.long	1072798105
	.align 8
.LC75:
	.long	-1717986918
	.long	1073846681
	.align 8
.LC76:
	.long	1717986918
	.long	1074423398
	.align 4
.LC79:
	.long	1069547520
	.align 4
.LC80:
	.long	1075838976
	.align 8
.LC84:
	.long	0
	.long	1072693248
	.align 8
.LC85:
	.long	0
	.long	1073741824
	.align 4
.LC88:
	.long	1066192077
	.align 4
.LC89:
	.long	1074580685
	.align 8
.LC94:
	.long	-266631570
	.long	1074340345
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 14.1.0"
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
