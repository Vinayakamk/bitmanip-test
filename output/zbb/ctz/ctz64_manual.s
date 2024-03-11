	.file	"ctz64_manual.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	andi	a5,a0,1
	bne	a5,zero,.L5
	li	a3,64
.L3:
	addiw	a5,a5,1
	beq	a5,a3,.L9
	bext	a4,a0,a5
	beq	a4,zero,.L3
	mv	a0,a5
	ret
.L9:
	li	a0,64
	ret
.L5:
	li	a0,0
	ret
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
