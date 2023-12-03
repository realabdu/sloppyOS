	.file	"kernel.c"
	.text
	.globl	_start
	.type	_start, @function
_start:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$753664, -4(%ebp)
	movl	-4(%ebp), %eax
	movb	$88, (%eax)
	nop
	leave
	ret
	.size	_start, .-_start
	.ident	"GCC: (GNU) 13.2.0"
