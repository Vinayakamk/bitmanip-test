	.file	"rol64.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	andi	a1,a1,63
	negw	a5,a1
	sll	a1,a0,a1
	srl	a0,a0,a5
	or	a0,a0,a1
	ret
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
