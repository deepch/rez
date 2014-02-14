DATA	zero_0<>+0x00(SB)/8, $0x0000000000000000
DATA	zero_0<>+0x08(SB)/8, $0x0000000000000000
GLOBL	zero_0<>(SB), $16
DATA	hbits_1<>+0x00(SB)/8, $0x0000200000002000
DATA	hbits_1<>+0x08(SB)/8, $0x0000200000002000
GLOBL	hbits_1<>(SB), $16

TEXT ·v8scale2(SB),4,$40-136
		MOVQ	dp+120(FP), BX
		MOVQ	width+104(FP), CX
		MOVQ	CX, DX
		SUBQ	CX, BX
		ANDQ	$31, DX
		SHRQ	$5, CX
		MOVQ	BX, dstoff+-24(SP)
		MOVQ	CX, maxroll+-32(SP)
		MOVQ	DX, AX
		ANDQ	$15, AX
		JE	norollback_0
		SUBQ	$32, AX
		NEGQ	AX
norollback_0:
		MOVQ	AX, backroll+-40(SP)
		MOVQ	off+72(FP), CX
		MOVQ	CX, offref+-16(SP)
		MOVO	zero_0<>(SB), X14
		MOVO	hbits_1<>(SB), X13
		MOVQ	src+24(FP), SI
		MOVQ	SI, srcref+-8(SP)
		MOVQ	dst+0(FP), DI
		MOVQ	cof+48(FP), BP
		MOVQ	sp+128(FP), BX
yloop_1:
		MOVQ	srcref+-8(SP), SI
		MOVQ	offref+-16(SP), DX
		MOVQ	(DX), AX
		MULQ	BX
		ADDQ	AX, SI
		MOVQ	SI, srcref+-8(SP)
		MOVQ	maxroll+-32(SP), CX
		ORQ	CX, CX
		JE	nomaxloop_2
maxloop_3:
		MOVOU	(BP), X12
		MOVOU	(SI), X0
		MOVOU	16(SI), X4
		MOVOU	(SI)(BX*1), X3
		MOVOU	16(SI)(BX*1), X7
		MOVO	X0, X2
		MOVO	X4, X6
		PUNPCKLBW	X3, X0
		PUNPCKLBW	X7, X4
		PUNPCKHBW	X3, X2
		PUNPCKHBW	X7, X6
		MOVO	X0, X1
		MOVO	X4, X5
		MOVO	X2, X3
		MOVO	X6, X7
		PUNPCKLBW	X14, X0
		PUNPCKHBW	X14, X1
		PUNPCKLBW	X14, X4
		PUNPCKHBW	X14, X5
		PUNPCKLBW	X14, X2
		PUNPCKHBW	X14, X3
		PUNPCKLBW	X14, X6
		PUNPCKHBW	X14, X7
		PMADDWL	X12, X0
		PMADDWL	X12, X1
		PMADDWL	X12, X4
		PMADDWL	X12, X5
		PMADDWL	X12, X2
		PMADDWL	X12, X3
		PMADDWL	X12, X6
		PMADDWL	X12, X7
		PADDL	X13, X0
		PADDL	X13, X1
		PADDL	X13, X4
		PADDL	X13, X5
		PADDL	X13, X2
		PADDL	X13, X3
		PADDL	X13, X6
		PADDL	X13, X7
		PSRAL	$14, X0
		PSRAL	$14, X1
		PSRAL	$14, X4
		PSRAL	$14, X5
		PSRAL	$14, X2
		PSRAL	$14, X3
		PSRAL	$14, X6
		PSRAL	$14, X7
		PACKSSLW	X1, X0
		PACKSSLW	X5, X4
		PACKSSLW	X3, X2
		PACKSSLW	X7, X6
		PACKUSWB	X2, X0
		PACKUSWB	X6, X4
		MOVOU	X0, (DI)
		MOVOU	X4, 16(DI)
		ADDQ	$32, SI
		ADDQ	$32, DI
		SUBQ	$1, CX
		JNE	maxloop_3
nomaxloop_2:
		MOVQ	backroll+-40(SP), CX
		SUBQ	backroll+-40(SP), SI
		SUBQ	backroll+-40(SP), DI
		ORQ	CX, CX
		JE	nobackroll_4
		MOVOU	(BP), X12
		MOVOU	(SI), X0
		MOVOU	16(SI), X4
		MOVOU	(SI)(BX*1), X3
		MOVOU	16(SI)(BX*1), X7
		MOVO	X0, X2
		MOVO	X4, X6
		PUNPCKLBW	X3, X0
		PUNPCKLBW	X7, X4
		PUNPCKHBW	X3, X2
		PUNPCKHBW	X7, X6
		MOVO	X0, X1
		MOVO	X4, X5
		MOVO	X2, X3
		MOVO	X6, X7
		PUNPCKLBW	X14, X0
		PUNPCKHBW	X14, X1
		PUNPCKLBW	X14, X4
		PUNPCKHBW	X14, X5
		PUNPCKLBW	X14, X2
		PUNPCKHBW	X14, X3
		PUNPCKLBW	X14, X6
		PUNPCKHBW	X14, X7
		PMADDWL	X12, X0
		PMADDWL	X12, X1
		PMADDWL	X12, X4
		PMADDWL	X12, X5
		PMADDWL	X12, X2
		PMADDWL	X12, X3
		PMADDWL	X12, X6
		PMADDWL	X12, X7
		PADDL	X13, X0
		PADDL	X13, X1
		PADDL	X13, X4
		PADDL	X13, X5
		PADDL	X13, X2
		PADDL	X13, X3
		PADDL	X13, X6
		PADDL	X13, X7
		PSRAL	$14, X0
		PSRAL	$14, X1
		PSRAL	$14, X4
		PSRAL	$14, X5
		PSRAL	$14, X2
		PSRAL	$14, X3
		PSRAL	$14, X6
		PSRAL	$14, X7
		PACKSSLW	X1, X0
		PACKSSLW	X5, X4
		PACKSSLW	X3, X2
		PACKSSLW	X7, X6
		PACKUSWB	X2, X0
		PACKUSWB	X6, X4
		MOVOU	X0, (DI)
		MOVOU	X4, 16(DI)
		ADDQ	$32, SI
		ADDQ	$32, DI
		SUBQ	$1, CX
nobackroll_4:
		ADDQ	dstoff+-24(SP), DI
		ADDQ	$32, BP
		ADDQ	$8, offref+-16(SP)
		SUBQ	$1, height+112(FP)
		JNE	yloop_1
		RET

TEXT ·v8scale4(SB),4,$40-136
		MOVQ	dp+120(FP), BX
		MOVQ	width+104(FP), CX
		MOVQ	CX, DX
		SUBQ	CX, BX
		ANDQ	$15, DX
		SHRQ	$4, CX
		MOVQ	BX, dstoff+-24(SP)
		MOVQ	CX, maxroll+-32(SP)
		MOVQ	DX, AX
		ANDQ	$7, AX
		JE	norollback_5
		SUBQ	$16, AX
		NEGQ	AX
norollback_5:
		MOVQ	AX, backroll+-40(SP)
		MOVQ	off+72(FP), CX
		MOVQ	CX, offref+-16(SP)
		MOVO	zero_0<>(SB), X14
		MOVO	hbits_1<>(SB), X13
		MOVQ	src+24(FP), SI
		MOVQ	SI, srcref+-8(SP)
		MOVQ	dst+0(FP), DI
		MOVQ	cof+48(FP), BP
		MOVQ	sp+128(FP), BX
yloop_6:
		MOVQ	srcref+-8(SP), SI
		MOVQ	offref+-16(SP), DX
		MOVQ	(DX), AX
		MULQ	BX
		ADDQ	AX, SI
		MOVQ	SI, srcref+-8(SP)
		MOVQ	maxroll+-32(SP), CX
		ORQ	CX, CX
		JE	nomaxloop_7
maxloop_8:
		MOVOU	(BP), X10
		MOVOU	32(BP), X11
		MOVOU	(SI), X0
		MOVOU	(SI)(BX*2), X4
		ADDQ	BX, SI
		MOVO	X0, X2
		MOVO	X4, X6
		MOVOU	(SI), X3
		MOVOU	(SI)(BX*2), X7
		PUNPCKLBW	X3, X0
		PUNPCKLBW	X7, X4
		PUNPCKHBW	X3, X2
		PUNPCKHBW	X7, X6
		MOVO	X0, X1
		MOVO	X4, X5
		MOVO	X2, X3
		MOVO	X6, X7
		SUBQ	BX, SI
		PUNPCKLBW	X14, X0
		PUNPCKHBW	X14, X1
		PUNPCKLBW	X14, X4
		PUNPCKHBW	X14, X5
		PUNPCKLBW	X14, X2
		PUNPCKHBW	X14, X3
		PUNPCKLBW	X14, X6
		PUNPCKHBW	X14, X7
		PMADDWL	X10, X0
		PMADDWL	X10, X1
		PMADDWL	X11, X4
		PMADDWL	X11, X5
		PMADDWL	X10, X2
		PMADDWL	X10, X3
		PMADDWL	X11, X6
		PMADDWL	X11, X7
		PADDL	X4, X0
		PADDL	X5, X1
		PADDL	X6, X2
		PADDL	X7, X3
		PADDL	X13, X0
		PADDL	X13, X1
		PADDL	X13, X2
		PADDL	X13, X3
		PSRAL	$14, X0
		PSRAL	$14, X1
		PSRAL	$14, X2
		PSRAL	$14, X3
		PACKSSLW	X1, X0
		PACKSSLW	X3, X2
		PACKUSWB	X2, X0
		MOVOU	X0, (DI)
		ADDQ	$16, SI
		ADDQ	$16, DI
		SUBQ	$1, CX
		JNE	maxloop_8
nomaxloop_7:
		MOVQ	backroll+-40(SP), CX
		SUBQ	backroll+-40(SP), SI
		SUBQ	backroll+-40(SP), DI
		ORQ	CX, CX
		JE	nobackroll_9
		MOVOU	(BP), X10
		MOVOU	32(BP), X11
		MOVOU	(SI), X0
		MOVOU	(SI)(BX*2), X4
		ADDQ	BX, SI
		MOVO	X0, X2
		MOVO	X4, X6
		MOVOU	(SI), X3
		MOVOU	(SI)(BX*2), X7
		PUNPCKLBW	X3, X0
		PUNPCKLBW	X7, X4
		PUNPCKHBW	X3, X2
		PUNPCKHBW	X7, X6
		MOVO	X0, X1
		MOVO	X4, X5
		MOVO	X2, X3
		MOVO	X6, X7
		SUBQ	BX, SI
		PUNPCKLBW	X14, X0
		PUNPCKHBW	X14, X1
		PUNPCKLBW	X14, X4
		PUNPCKHBW	X14, X5
		PUNPCKLBW	X14, X2
		PUNPCKHBW	X14, X3
		PUNPCKLBW	X14, X6
		PUNPCKHBW	X14, X7
		PMADDWL	X10, X0
		PMADDWL	X10, X1
		PMADDWL	X11, X4
		PMADDWL	X11, X5
		PMADDWL	X10, X2
		PMADDWL	X10, X3
		PMADDWL	X11, X6
		PMADDWL	X11, X7
		PADDL	X4, X0
		PADDL	X5, X1
		PADDL	X6, X2
		PADDL	X7, X3
		PADDL	X13, X0
		PADDL	X13, X1
		PADDL	X13, X2
		PADDL	X13, X3
		PSRAL	$14, X0
		PSRAL	$14, X1
		PSRAL	$14, X2
		PSRAL	$14, X3
		PACKSSLW	X1, X0
		PACKSSLW	X3, X2
		PACKUSWB	X2, X0
		MOVOU	X0, (DI)
		ADDQ	$16, SI
		ADDQ	$16, DI
		SUBQ	$1, CX
nobackroll_9:
		ADDQ	dstoff+-24(SP), DI
		ADDQ	$64, BP
		ADDQ	$8, offref+-16(SP)
		SUBQ	$1, height+112(FP)
		JNE	yloop_6
		RET