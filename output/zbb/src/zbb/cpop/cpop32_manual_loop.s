	.file	"cpop32_manual_loop.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	mv	a3,a0
	li	a5,0
	li	a0,0
	li	a2,32
.L3:
	sraw	a4,a3,a5
	andi	a4,a4,1
	addiw	a5,a5,1
	beq	a4,zero,.L2
	addiw	a0,a0,1
.L2:
	bne	a5,a2,.L3
	ret
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
