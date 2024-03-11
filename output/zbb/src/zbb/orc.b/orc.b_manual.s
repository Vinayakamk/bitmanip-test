	.file	"orc.b_manual.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	test
	.type	test, @function
test:
	andi	a4,a0,0xff
	mv	a5,a0
	li	a0,0
	beq	a4,zero,.L2
	li	a0,255
.L2:
	srliw	a4,a5,8
	andi	a4,a4,0xff
	beq	a4,zero,.L3
	li	a4,65536
	addi	a4,a4,-256
	or	a0,a0,a4
.L3:
	srliw	a4,a5,16
	andi	a4,a4,0xff
	beq	a4,zero,.L4
	li	a4,16711680
	or	a0,a0,a4
.L4:
	srliw	a5,a5,24
	beq	a5,zero,.L5
	li	a5,-16777216
	or	a0,a0,a5
.L5:
	ret
	.size	test, .-test
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
