	.file	"rev8_64_manual.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	mv	a2,a0
	li	a4,0
	li	a0,0
	li	a6,56
	li	a1,64
.L2:
	srl	a5,a2,a4
	subw	a3,a6,a4
	andi	a5,a5,255
	sll	a5,a5,a3
	addiw	a4,a4,8
	or	a0,a0,a5
	bne	a4,a1,.L2
	ret
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
