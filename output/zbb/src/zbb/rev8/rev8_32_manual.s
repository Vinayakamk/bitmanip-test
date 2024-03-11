	.file	"rev8_32_manual.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	srliw	a3,a0,8
	slliw	a4,a0,24
	srliw	a1,a0,24
	slliw	a3,a3,16
	srliw	a5,a0,16
	li	a2,65536
	or	a0,a4,a1
	li	a4,16711680
	and	a4,a3,a4
	addi	a2,a2,-256
	slliw	a5,a5,8
	or	a0,a0,a4
	and	a5,a5,a2
	or	a0,a0,a5
	sext.w	a0,a0
	ret
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
