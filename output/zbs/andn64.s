	.file	"andn64.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	not	a1,a1
	and	a0,a1,a0
	ret
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
