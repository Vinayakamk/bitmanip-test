	.file	"ctz64_builtin.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__ctzdi2
	.align	1
	.globl	test
	.type	test, @function
test:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	__ctzdi2
	ld	ra,8(sp)
	sext.w	a0,a0
	addi	sp,sp,16
	jr	ra
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
