/*	$OpenBSD: strrchr.S,v 1.7 2015/08/31 02:53:56 guenther Exp $ */
/*
 * Written by J.T. Conklin <jtc@netbsd.org>.
 * Public domain.
 */

#include "SYS.h"

WEAK_ALIAS(rindex, strrchr)

ENTRY(strrchr)
	pushl	%ebx
	movl	8(%esp),%edx
	movb	12(%esp),%cl
	xorl	%eax,%eax		/* init pointer to null */
	.align 2,0x90
L1:
	movb	(%edx),%bl
	cmpb	%bl,%cl
	jne	L2
	movl	%edx,%eax
L2:
	incl	%edx
	testb	%bl,%bl			/* null terminator??? */
	jnz	L1
	popl	%ebx
	ret
END_STRONG(strrchr)
