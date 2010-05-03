
openbeacon-brn-test.elf:     Dateiformat elf32-littlearm

Disassemblierung der Sektion startup:

00100000 <bootloader>:
  100000:	ea0003fe 	b	101000 <start>
  100004:	ea0003fe 	b	101004 <start+0x4>
  100008:	ea0003fe 	b	101008 <start+0x8>
  10000c:	ea0003fe 	b	10100c <start+0xc>
  100010:	ea0003fe 	b	101010 <start+0x10>
  100014:	e1a00000 	nop			(mov r0,r0)
  100018:	e51fff20 	ldr	pc, [pc, #-3872]	; ff100 <IRQ_STACK_SIZE+0xfed00>
  10001c:	ea0003fe 	b	10101c <start+0x1c>
  100020:	e3a0d004 	mov	sp, #4	; 0x4
  100024:	e58bd128 	str	sp, [fp, #296]
  100028:	e59ad04c 	ldr	sp, [sl, #76]
  10002c:	e59cd004 	ldr	sp, [ip, #4]
  100030:	e21dd001 	ands	sp, sp, #1	; 0x1
  100034:	125ef004 	subnes	pc, lr, #4	; 0x4
  100038:	e59ad03c 	ldr	sp, [sl, #60]
  10003c:	e21ddf80 	ands	sp, sp, #512	; 0x200
  100040:	01cc80b0 	streqh	r8, [ip]
  100044:	11cc80b2 	strneh	r8, [ip, #2]
  100048:	13a0d001 	movne	sp, #1	; 0x1
  10004c:	158cd004 	strne	sp, [ip, #4]
  100050:	e25ef004 	subs	pc, lr, #4	; 0x4
  100054:	e10f0000 	mrs	r0, CPSR
  100058:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
  10005c:	e28f200c 	add	r2, pc, #12	; 0xc
  100060:	e8921e00 	ldmia	r2, {r9, sl, fp, ip}
  100064:	e3c00040 	bic	r0, r0, #64	; 0x40
  100068:	e121f000 	msr	CPSR_c, r0
  10006c:	ea000003 	b	100080 <bootloader+0x80>
  100070:	fffcc000 	swinv	0x00fcc000
  100074:	fffff400 	swinv	0x00fff400
  100078:	fffff000 	swinv	0x00fff000
  10007c:	00200f44 	eoreq	r0, r0, r4, asr #30
  100080:	e59fd0f4 	ldr	sp, [pc, #244]	; 10017c <bootloader+0x17c>
  100084:	e3e010ff 	mvn	r1, #255	; 0xff
  100088:	e59f00f0 	ldr	r0, [pc, #240]	; 100180 <bootloader+0x180>
  10008c:	e5810060 	str	r0, [r1, #96]
  100090:	e59f10ec 	ldr	r1, [pc, #236]	; 100184 <bootloader+0x184>
  100094:	e3a00002 	mov	r0, #2	; 0x2
  100098:	e5810020 	str	r0, [r1, #32]
  10009c:	e3a0002d 	mov	r0, #45	; 0x2d
  1000a0:	e2500001 	subs	r0, r0, #1	; 0x1
  1000a4:	8afffffd 	bhi	1000a0 <bootloader+0xa0>
  1000a8:	e3a04b40 	mov	r4, #65536	; 0x10000
  1000ac:	e5913024 	ldr	r3, [r1, #36]
  1000b0:	e0043003 	and	r3, r4, r3
  1000b4:	e3530b40 	cmp	r3, #65536	; 0x10000
  1000b8:	0a000006 	beq	1000d8 <bootloader+0xd8>
  1000bc:	e59f00c4 	ldr	r0, [pc, #196]	; 100188 <bootloader+0x188>
  1000c0:	e5810020 	str	r0, [r1, #32]
  1000c4:	e3a04001 	mov	r4, #1	; 0x1
  1000c8:	e5913068 	ldr	r3, [r1, #104]
  1000cc:	e0043003 	and	r3, r4, r3
  1000d0:	e3530001 	cmp	r3, #1	; 0x1
  1000d4:	1afffffb 	bne	1000c8 <bootloader+0xc8>
  1000d8:	e3a00001 	mov	r0, #1	; 0x1
  1000dc:	e5810030 	str	r0, [r1, #48]
  1000e0:	e3a04008 	mov	r4, #8	; 0x8
  1000e4:	e5913068 	ldr	r3, [r1, #104]
  1000e8:	e0043003 	and	r3, r4, r3
  1000ec:	e3530008 	cmp	r3, #8	; 0x8
  1000f0:	1afffffb 	bne	1000e4 <bootloader+0xe4>
  1000f4:	e3a00000 	mov	r0, #0	; 0x0
  1000f8:	e3a01d50 	mov	r1, #5120	; 0x1400
  1000fc:	e3a02980 	mov	r2, #2097152	; 0x200000
  100100:	e490a004 	ldr	sl, [r0], #4
  100104:	e482a004 	str	sl, [r2], #4
  100108:	e1500001 	cmp	r0, r1
  10010c:	3afffffb 	bcc	100100 <bootloader+0x100>
  100110:	e28f202c 	add	r2, pc, #44	; 0x2c
  100114:	e892001b 	ldmia	r2, {r0, r1, r3, r4}
  100118:	e1500001 	cmp	r0, r1
  10011c:	0a000003 	beq	100130 <bootloader+0x130>
  100120:	e1510003 	cmp	r1, r3
  100124:	34902004 	ldrcc	r2, [r0], #4
  100128:	34812004 	strcc	r2, [r1], #4
  10012c:	3afffffb 	bcc	100120 <bootloader+0x120>
  100130:	e3a02000 	mov	r2, #0	; 0x0
  100134:	e1530004 	cmp	r3, r4
  100138:	34832004 	strcc	r2, [r3], #4
  10013c:	3afffffc 	bcc	100134 <bootloader+0x134>
  100140:	ea000003 	b	100154 <bootloader+0x154>
  100144:	00200f2c 	eoreq	r0, r0, ip, lsr #30
  100148:	00200f2c 	eoreq	r0, r0, ip, lsr #30
  10014c:	00200f3c 	eoreq	r0, r0, ip, lsr pc
  100150:	00200f84 	eoreq	r0, r0, r4, lsl #31
  100154:	e59f0030 	ldr	r0, [pc, #48]	; 10018c <bootloader+0x18c>
  100158:	e1a0e00f 	mov	lr, pc
  10015c:	e12fff10 	bx	r0
  100160:	e59f0028 	ldr	r0, [pc, #40]	; 100190 <bootloader+0x190>
  100164:	e1a0e00f 	mov	lr, pc
  100168:	e12fff10 	bx	r0
  10016c:	eafffffe 	b	10016c <bootloader+0x16c>
  100170:	e59fe01c 	ldr	lr, [pc, #28]	; 100194 <bootloader+0x194>
  100174:	e12fff10 	bx	r0
  100178:	eafffffe 	b	100178 <bootloader+0x178>
  10017c:	00202000 	eoreq	r2, r0, r0
  100180:	00340100 	eoreqs	r0, r4, r0, lsl #2
  100184:	fffffc00 	swinv	0x00fffc00
  100188:	00004001 	andeq	r4, r0, r1
  10018c:	0020038d 	eoreq	r0, r0, sp, lsl #7
  100190:	00200c9b 	mlaeq	r0, fp, ip, r0
  100194:	00200160 	eoreq	r0, r0, r0, ror #2
  100198:	b4104998 	ldrlt	r4, [r0], #-2456
  10019c:	60882001 	addvs	r2, r8, r1
  1001a0:	22004897 	andcs	r4, r0, #9895936	; 0x970000
  1001a4:	20016082 	andcs	r6, r1, r2, lsl #1
  1001a8:	42430280 	submi	r0, r3, #8	; 0x8
  1001ac:	48956158 	ldmmiia	r5, {r3, r4, r6, r8, sp, lr}
  1001b0:	62812104 	addvs	r2, r1, #1	; 0x1
  1001b4:	68446804 	stmvsda	r4, {r2, fp, sp, lr}^
  1001b8:	009c6302 	addeqs	r6, ip, r2, lsl #6
  1001bc:	4a9160a2 	bmi	fe55844c <__stack_end__+0xfe354450>
  1001c0:	60513240 	subvss	r3, r1, r0, asr #4
  1001c4:	4a906241 	bmi	fe518ad0 <__stack_end__+0xfe314ad4>
  1001c8:	605001c8 	subvss	r0, r0, r8, asr #3
  1001cc:	bc106159 	ldflts	f6, [r0], {89}
  1001d0:	b4f04770 	ldrltbt	r4, [r0], #1904
  1001d4:	6843488d 	stmvsda	r3, {r0, r2, r3, r7, fp, lr}^
  1001d8:	2504488b 	strcs	r4, [r4, #-2187]
  1001dc:	3c401c04 	mcrrcc	12, 0, r1, r0, cr4
  1001e0:	2b002201 	blcs	1089ec <__data_beg_src__+0x2d48>
  1001e4:	d11d498a 	tstle	sp, sl, lsl #19
  1001e8:	610b424b 	tstvs	fp, fp, asr #4
  1001ec:	0c034e84 	stceq	14, cr4, [r3], {132}
  1001f0:	4b8260b3 	blmi	fe1984c4 <__stack_end__+0xfdf944c8>
  1001f4:	1c0b605a 	stcne	0, cr6, [fp], {90}
  1001f8:	0253611d 	subeqs	r6, r3, #1073741831	; 0x40000007
  1001fc:	60236163 	eorvs	r6, r3, r3, ror #2
  100200:	6306424e 	tstvs	r6, #-536870908	; 0xe0000004
  100204:	4f836066 	swimi	0x00836066
  100208:	60fe1306 	rscvss	r1, lr, r6, lsl #6
  10020c:	008f2620 	addeq	r2, pc, r0, lsr #12
  100210:	4e7c60be 	mrcmi	0, 3, r6, cr12, cr14, {5}
  100214:	60353640 	eorvss	r3, r5, r0, asr #12
  100218:	62354e7a 	eorvss	r4, r5, #1952	; 0x7a0
  10021c:	600368c6 	andvs	r6, r3, r6, asr #17
  100220:	605a4b7a 	subvss	r4, sl, sl, ror fp
  100224:	685e4b79 	ldmvsda	lr, {r0, r3, r4, r5, r6, r8, r9, fp, lr}^
  100228:	37084f78 	smlsdxcc	r8, r8, pc, r4
  10022c:	d1692e01 	cmnle	r9, r1, lsl #28
  100230:	1c3c6878 	ldcne	8, cr6, [ip], #-480
  100234:	d0642800 	rsble	r2, r4, r0, lsl #16
  100238:	1c3d8860 	ldcne	8, cr8, [sp], #-384
  10023c:	1b40882d 	blne	11222f8 <__stack_end__+0xf1e2fc>
  100240:	4d730400 	cfldrdmi	mvd0, [r3]
  100244:	27ad0c00 	strcs	r0, [sp, r0, lsl #24]!
  100248:	354000ff 	strccb	r0, [r0, #-255]
  10024c:	801842b8 	ldrhih	r4, [r8], -r8
  100250:	d2464e71 	suble	r4, r6, #1808	; 0x710
  100254:	d2012888 	andle	r2, r1, #8912896	; 0x880000
  100258:	e0234870 	eor	r4, r3, r0, ror r8
  10025c:	3a881c02 	bcc	fe30726c <__stack_end__+0xfe103270>
  100260:	d2012a48 	andle	r2, r1, #294912	; 0x48000
  100264:	e01d486e 	ands	r4, sp, lr, ror #16
  100268:	3ad01c02 	bcc	ff507278 <__stack_end__+0xff30327c>
  10026c:	d2012ad0 	andle	r2, r1, #851968	; 0xd0000
  100270:	e017486c 	ands	r4, r7, ip, ror #16
  100274:	3aff1c02 	bcc	c7284 <IRQ_STACK_SIZE+0xc6e84>
  100278:	2a883aa1 	bcs	fe30ed04 <__stack_end__+0xfe10ad08>
  10027c:	486ad201 	stmmida	sl!, {r0, r9, ip, lr, pc}^
  100280:	2245e010 	subcs	lr, r5, #16	; 0x10
  100284:	27ff00d2 	undefined
  100288:	1a8237e9 	bne	fe18e234 <__stack_end__+0xfdf8a238>
  10028c:	d20142ba 	andle	r4, r1, #-1610612725	; 0xa000000b
  100290:	e0074866 	and	r4, r7, r6, ror #16
  100294:	01122241 	tsteq	r2, r1, asr #4
  100298:	22ff1a80 	rsccss	r1, pc, #524288	; 0x80000
  10029c:	42903259 	addmis	r3, r0, #-1879048187	; 0x90000005
  1002a0:	4863d201 	stmmida	r3!, {r0, r9, ip, lr, pc}^
  1002a4:	200062c8 	andcs	r6, r0, r8, asr #5
  1002a8:	07526aaa 	ldreqb	r6, [r2, -sl, lsr #21]
  1002ac:	1c02d403 	cfstrsne	mvf13, [r2], {3}
  1002b0:	42b23001 	adcmis	r3, r2, #1	; 0x1
  1002b4:	2009d3f8 	strcsd	sp, [r9], -r8
  1002b8:	20006308 	andcs	r6, r0, r8, lsl #6
  1002bc:	07126aaa 	ldreq	r6, [r2, -sl, lsr #21]
  1002c0:	1c02d403 	cfstrsne	mvf13, [r2], {3}
  1002c4:	42b23001 	adcmis	r3, r2, #1	; 0x1
  1002c8:	200bd3f8 	strcsd	sp, [fp], -r8
  1002cc:	20006308 	andcs	r6, r0, r8, lsl #6
  1002d0:	07096aa9 	streq	r6, [r9, -r9, lsr #21]
  1002d4:	1c01d403 	cfstrsne	mvf13, [r1], {3}
  1002d8:	42b13001 	adcmis	r3, r1, #1	; 0x1
  1002dc:	2002d3f8 	strcsd	sp, [r2], -r8
  1002e0:	630ae00c 	tstvs	sl, #12	; 0xc
  1002e4:	6aaa2000 	bvs	feb882ec <__stack_end__+0xfe9842f0>
  1002e8:	d4030712 	strle	r0, [r3], #-1810
  1002ec:	30011c02 	andcc	r1, r1, r2, lsl #24
  1002f0:	d3f842b2 	mvnles	r4, #536870923	; 0x2000000b
  1002f4:	0200203f 	andeq	r2, r0, #63	; 0x3f
  1002f8:	200362c8 	andcs	r6, r3, r8, asr #5
  1002fc:	20006058 	andcs	r6, r0, r8, asr r0
  100300:	e0406060 	sub	r6, r0, r0, rrx
  100304:	6859e7ff 	ldmvsda	r9, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, sp, lr, pc}^
  100308:	d10a2902 	tstle	sl, r2, lsl #18
  10030c:	28006878 	stmcsda	r0, {r3, r4, r5, r6, fp, sp, lr}
  100310:	8878d039 	ldmhida	r8!, {r0, r3, r4, r5, ip, lr, pc}^
  100314:	1a408839 	bne	1122400 <__stack_end__+0xf1e404>
  100318:	20008018 	andcs	r8, r0, r8, lsl r0
  10031c:	20036078 	andcs	r6, r3, r8, ror r0
  100320:	6859e02c 	ldmvsda	r9, {r2, r3, r5, sp, lr, pc}^
  100324:	d1102903 	tstle	r0, r3, lsl #18
  100328:	63010249 	tstvs	r1, #-1879048188	; 0x90000004
  10032c:	48396061 	ldmmida	r9!, {r0, r5, r6, sp, lr}
  100330:	600121ac 	andvs	r2, r1, ip, lsr #3
  100334:	31408819 	cmpcc	r0, r9, lsl r8
  100338:	620109c9 	andvs	r0, r1, #3293184	; 0x324000
  10033c:	01892123 	orreq	r2, r9, r3, lsr #2
  100340:	21506041 	cmpcs	r0, r1, asr #32
  100344:	605d6001 	subvss	r6, sp, r1
  100348:	6858e01d 	ldmvsda	r8, {r0, r2, r3, r4, sp, lr, pc}^
  10034c:	d11a2804 	tstle	sl, r4, lsl #16
  100350:	69484930 	stmvsdb	r8, {r4, r5, r8, fp, lr}^
  100354:	0f400600 	swieq	0x00400600
  100358:	6988d004 	stmvsib	r8, {r2, ip, lr, pc}
  10035c:	300120ff 	strccd	r2, [r1], -pc
  100360:	e00f6008 	and	r6, pc, r8
  100364:	07c06948 	streqb	r6, [r0, r8, asr #18]
  100368:	6988d50d 	stmvsib	r8, {r0, r2, r3, r8, sl, ip, lr, pc}
  10036c:	d1072823 	tstle	r7, r3, lsr #16
  100370:	07806948 	streq	r6, [r0, r8, asr #18]
  100374:	203ed5fc 	ldrcssh	sp, [lr], -ip
  100378:	200561c8 	andcs	r6, r5, r8, asr #3
  10037c:	e0026058 	and	r6, r2, r8, asr r0
  100380:	d0002880 	andle	r2, r0, r0, lsl #17
  100384:	6858605a 	ldmvsda	r8, {r1, r3, r4, r6, sp, lr}^
  100388:	4770bcf0 	undefined
  10038c:	4829b510 	stmmida	r9!, {r4, r8, sl, ip, sp, pc}
  100390:	2400491f 	strcs	r4, [r0], #-2335
  100394:	4a1e62c8 	bmi	898ebc <__stack_end__+0x694ec0>
  100398:	32404b1f 	subcc	r4, r0, #31744	; 0x7c00
  10039c:	07406a90 	undefined
  1003a0:	1c20d403 	cfstrsne	mvf13, [r0], #-12
  1003a4:	42983401 	addmis	r3, r8, #16777216	; 0x1000000
  1003a8:	2001d3f8 	strcsd	sp, [r1], -r8
  1003ac:	03c04a22 	biceq	r4, r0, #139264	; 0x22000
  1003b0:	4a216050 	bmi	9584f8 <__stack_end__+0x7544fc>
  1003b4:	3a404821 	bcc	1112440 <__stack_end__+0xf0e444>
  1003b8:	48166090 	ldmmida	r6, {r4, r7, sp, lr}
  1003bc:	68003040 	stmvsda	r0, {r6, ip, sp}
  1003c0:	42904a1f 	addmis	r4, r0, #126976	; 0x1f000
  1003c4:	2080d009 	addcs	sp, r0, r9
  1003c8:	01006008 	tsteq	r0, r8
  1003cc:	490e6108 	stmmidb	lr, {r3, r8, sp, lr}
  1003d0:	39400140 	stmccdb	r0, {r6, r8}^
  1003d4:	61086008 	tstvs	r8, r8
  1003d8:	490c6348 	stmmidb	ip, {r3, r6, r8, r9, sp, lr}
  1003dc:	31082000 	tstcc	r8, r0
  1003e0:	80488008 	subhi	r8, r8, r8
  1003e4:	48176048 	ldmmida	r7, {r3, r6, sp, lr}
  1003e8:	f92bf000 	stmnvdb	fp!, {ip, sp, lr, pc}
  1003ec:	48174916 	ldmmida	r7, {r1, r2, r4, r8, fp, lr}
  1003f0:	fb2bf000 	blx	bfc3fa <__stack_end__+0x9f83fe>
  1003f4:	bc08bc10 	stclt	12, cr11, [r8], {16}
  1003f8:	00004718 	andeq	r4, r0, r8, lsl r7
  1003fc:	fffcc000 	swinv	0x00fcc000
  100400:	fffcc200 	swinv	0x00fcc200
  100404:	fffff100 	swinv	0x00fff100
  100408:	fffff440 	swinv	0x00fff440
  10040c:	00200f3c 	eoreq	r0, r0, ip, lsr pc
  100410:	fffffc00 	swinv	0x00fffc00
  100414:	fffff200 	swinv	0x00fff200
  100418:	000f4240 	andeq	r4, pc, r0, asr #4
  10041c:	004f3f01 	subeq	r3, pc, r1, lsl #30
  100420:	00273f01 	eoreq	r3, r7, r1, lsl #30
  100424:	001a3f01 	andeqs	r3, sl, r1, lsl #30
  100428:	001abf01 	andeqs	fp, sl, r1, lsl #30
  10042c:	00093f01 	andeq	r3, r9, r1, lsl #30
  100430:	0009bf01 	andeq	fp, r9, r1, lsl #30
  100434:	10483f0e 	subne	r3, r8, lr, lsl #30
  100438:	fffffd40 	swinv	0x00fffd40
  10043c:	a5000401 	strge	r0, [r0, #-1025]
  100440:	27080340 	strcs	r0, [r8, -r0, asr #6]
  100444:	00200f64 	eoreq	r0, r0, r4, ror #30
  100448:	fffb0000 	swinv	0x00fb0000
  10044c:	00200f6c 	eoreq	r0, r0, ip, ror #30
  100450:	40480200 	submi	r0, r8, r0, lsl #4
  100454:	21004ab3 	strcsh	r4, [r0, -r3]
  100458:	d5020403 	strle	r0, [r2, #-1027]
  10045c:	40500040 	submis	r0, r0, r0, asr #32
  100460:	0040e000 	subeq	lr, r0, r0
  100464:	04093101 	streq	r3, [r9], #-257
  100468:	0c000400 	cfstrseq	mvf0, [r0], {0}
  10046c:	29080c09 	stmcsdb	r8, {r0, r3, sl, fp}
  100470:	4770d3f2 	undefined
  100474:	694a49ac 	stmvsdb	sl, {r2, r3, r5, r7, r8, fp, lr}^
  100478:	d5fc0792 	ldrleb	r0, [ip, #1938]!
  10047c:	477061c8 	ldrmib	r6, [r0, -r8, asr #3]!
  100480:	49a948aa 	stmmiib	r9!, {r1, r3, r5, r7, fp, lr}
  100484:	3801e000 	stmccda	r1, {sp, lr, pc}
  100488:	07d2694a 	ldreqb	r6, [r2, sl, asr #18]
  10048c:	2800d402 	stmcsda	r0, {r1, sl, ip, lr, pc}
  100490:	e005d1f9 	strd	sp, [r5], -r9
  100494:	d0032800 	andle	r2, r3, r0, lsl #16
  100498:	06006988 	streq	r6, [r0], -r8, lsl #19
  10049c:	47700e00 	ldrmib	r0, [r0, -r0, lsl #28]!
  1004a0:	200149a3 	andcs	r4, r1, r3, lsr #19
  1004a4:	20ff7048 	rsccss	r7, pc, r8, asr #32
  1004a8:	b5f34770 	ldrltb	r4, [r3, #1904]!
  1004ac:	26001c0f 	strcs	r1, [r0], -pc, lsl #24
  1004b0:	e01e2400 	ands	r2, lr, r0, lsl #8
  1004b4:	ffe4f7ff 	swinv	0x00e4f7ff
  1004b8:	1c054a9d 	stcne	10, cr4, [r5], {157}
  1004bc:	28007850 	stmcsda	r0, {r4, r6, fp, ip, sp, lr}
  1004c0:	2001d003 	andcs	sp, r1, r3
  1004c4:	bc08bcfc 	stclt	12, cr11, [r8], {252}
  1004c8:	1c314718 	ldcne	7, cr4, [r1], #-96
  1004cc:	f7ff1c28 	ldrnvb	r1, [pc, r8, lsr #24]!
  1004d0:	4a97ffbf 	bmi	fe7003d4 <__stack_end__+0xfe4fc3d8>
  1004d4:	78111c06 	ldmvcda	r1, {r1, r2, sl, fp, ip}
  1004d8:	43086850 	tstmi	r8, #5242880	; 0x500000
  1004dc:	9800d008 	stmlsda	r0, {r3, ip, lr, pc}
  1004e0:	30017005 	andcc	r7, r1, r5
  1004e4:	2f809000 	swics	0x00809000
  1004e8:	6850d102 	ldmvsda	r0, {r1, r8, ip, lr, pc}^
  1004ec:	60503801 	subvss	r3, r0, r1, lsl #16
  1004f0:	42bc3401 	adcmis	r3, ip, #16777216	; 0x1000000
  1004f4:	1c30d3de 	ldcne	3, cr13, [r0], #-888
  1004f8:	b5f8e7e4 	ldrltb	lr, [r8, #2020]!
  1004fc:	20001c06 	andcs	r1, r0, r6, lsl #24
  100500:	1c0c4f8b 	stcne	15, cr4, [ip], {139}
  100504:	70782900 	rsbvcs	r2, r8, r0, lsl #18
  100508:	2101d102 	tstcs	r1, r2, lsl #2
  10050c:	e0017039 	and	r7, r1, r9, lsr r0
  100510:	7038607c 	eorvcs	r6, r8, ip, ror r0
  100514:	d0030661 	andle	r0, r3, r1, ror #12
  100518:	31801c21 	orrcc	r1, r0, r1, lsr #24
  10051c:	01e409cc 	mvneq	r0, ip, asr #19
  100520:	f7ff2500 	ldrnvb	r2, [pc, r0, lsl #10]!
  100524:	4f82ffad 	swimi	0x0082ffad
  100528:	29007879 	stmcsdb	r0, {r0, r3, r4, r5, r6, fp, ip, sp, lr}
  10052c:	2000d00b 	andcs	sp, r0, fp
  100530:	f7ff7078 	undefined
  100534:	7879ffa5 	ldmvcda	r9!, {r0, r2, r5, r7, r8, r9, sl, fp, ip, sp, lr, pc}^
  100538:	d0042900 	andle	r2, r4, r0, lsl #18
  10053c:	70782000 	rsbvcs	r2, r8, r0
  100540:	bc08bcf8 	stclt	12, cr11, [r8], {248}
  100544:	28154718 	ldmcsda	r5, {r3, r4, r8, r9, sl, lr}
  100548:	2843d005 	stmcsda	r3, {r0, r2, ip, lr, pc}^
  10054c:	2871d003 	ldmcsda	r1!, {r0, r1, ip, lr, pc}^
  100550:	2d00d0f6 	stccs	0, cr13, [r0, #-984]
  100554:	2700d0e5 	strcs	sp, [r0, -r5, ror #1]
  100558:	1c292501 	cfstr32ne	mvfx2, [r9], #-4
  10055c:	f0001c30 	andnv	r1, r0, r0, lsr ip
  100560:	4973f878 	ldmmidb	r3!, {r3, r4, r5, r6, fp, ip, sp, lr, pc}^
  100564:	78490600 	stmvcda	r9, {r9, sl}^
  100568:	29000e00 	stmcsdb	r0, {r9, sl, fp}
  10056c:	4970d003 	ldmmidb	r0!, {r0, r1, ip, lr, pc}^
  100570:	70482000 	subvc	r2, r8, r0
  100574:	2804e7e4 	stmcsda	r4, {r2, r5, r6, r7, r8, r9, sl, sp, lr, pc}
  100578:	2806d003 	stmcsda	r6, {r0, r1, ip, lr, pc}
  10057c:	2815d00b 	ldmcsda	r5, {r0, r1, r3, ip, lr, pc}
  100580:	2700d001 	strcs	sp, [r0, -r1]
  100584:	2c0043ff 	stccs	3, cr4, [r0], {255}
  100588:	2004d10b 	andcs	sp, r4, fp, lsl #2
  10058c:	ff72f7ff 	swinv	0x0072f7ff
  100590:	ff76f7ff 	swinv	0x0076f7ff
  100594:	3501e007 	strcc	lr, [r1, #-7]
  100598:	0e2d062d 	cfmadda32eq	mvax1, mvax0, mvfx13, mvfx13
  10059c:	36803c80 	strcc	r3, [r0], r0, lsl #25
  1005a0:	2f00e7f1 	swics	0x0000e7f1
  1005a4:	4962d0d9 	stmmidb	r2!, {r0, r3, r4, r6, r7, ip, lr, pc}^
  1005a8:	70082000 	andvc	r2, r8, r0
  1005ac:	b5f8e7c8 	ldrltb	lr, [r8, #1992]!
  1005b0:	485e1c06 	ldmmida	lr, {r1, r2, sl, fp, ip}^
  1005b4:	90004a5e 	andls	r4, r0, lr, asr sl
  1005b8:	27642000 	strcsb	r2, [r4, -r0]!
  1005bc:	24002501 	strcs	r2, [r0], #-1281
  1005c0:	70502900 	subvcs	r2, r0, r0, lsl #18
  1005c4:	2001d101 	andcs	sp, r1, r1, lsl #2
  1005c8:	4a59e002 	bmi	17785d8 <__stack_end__+0x15745dc>
  1005cc:	60512000 	subvss	r2, r1, r0
  1005d0:	20437010 	subcs	r7, r3, r0, lsl r0
  1005d4:	ff4ef7ff 	swinv	0x004ef7ff
  1005d8:	98004a53 	stmlsda	r0, {r0, r1, r4, r6, r9, fp, lr}
  1005dc:	3801e000 	stmccda	r1, {sp, lr, pc}
  1005e0:	07c96951 	undefined
  1005e4:	2800d402 	stmcsda	r0, {r1, sl, ip, lr, pc}
  1005e8:	e001d1f9 	strd	sp, [r1], -r9
  1005ec:	d1042800 	tstle	r4, r0, lsl #16
  1005f0:	d1ee3f01 	mvnle	r3, r1, lsl #30
  1005f4:	bc08bcf8 	stclt	12, cr11, [r8], {248}
  1005f8:	4f4d4718 	swimi	0x004d4718
  1005fc:	ff40f7ff 	swinv	0x0040f7ff
  100600:	29007879 	stmcsdb	r0, {r0, r3, r4, r5, r6, fp, ip, sp, lr}
  100604:	2801d112 	stmcsda	r1, {r1, r4, r8, ip, lr, pc}
  100608:	2804d009 	stmcsda	r4, {r0, r3, ip, lr, pc}
  10060c:	2006d104 	andcs	sp, r6, r4, lsl #2
  100610:	ff30f7ff 	swinv	0x0030f7ff
  100614:	d0f12c00 	rscles	r2, r1, r0, lsl #24
  100618:	70382000 	eorvcs	r2, r8, r0
  10061c:	1c29e7ea 	stcne	7, cr14, [r9], #-936
  100620:	f0001c30 	andnv	r1, r0, r0, lsr ip
  100624:	7879f848 	ldmvcda	r9!, {r3, r6, fp, ip, sp, lr, pc}^
  100628:	d0022900 	andle	r2, r2, r0, lsl #18
  10062c:	70782000 	rsbvcs	r2, r8, r0
  100630:	2800e7e0 	stmcsda	r0, {r5, r6, r7, r8, r9, sl, sp, lr, pc}
  100634:	3501d1f0 	strcc	sp, [r1, #-496]
  100638:	0e2d062d 	cfmadda32eq	mvax1, mvax0, mvfx13, mvfx13
  10063c:	34803680 	strcc	r3, [r0], #1664
  100640:	493ce7dc 	ldmmidb	ip!, {r2, r3, r4, r6, r7, r8, r9, sl, sp, lr, pc}
  100644:	60014a3a 	andvs	r4, r1, sl, lsr sl
  100648:	6041493b 	subvs	r4, r1, fp, lsr r9
  10064c:	70512100 	subvcs	r2, r1, r0, lsl #2
  100650:	b5f04770 	ldrltb	r4, [r0, #1904]!
  100654:	1c0c1c07 	stcne	12, cr1, [ip], {7}
  100658:	20012600 	andcs	r2, r1, r0, lsl #12
  10065c:	ff0af7ff 	swinv	0x000af7ff
  100660:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  100664:	43e0ff07 	mvnmi	pc, #28	; 0x1c
  100668:	0e000600 	cfmadd32eq	mvax0, mvfx0, mvfx0, mvfx0
  10066c:	ff02f7ff 	swinv	0x0002f7ff
  100670:	492f2500 	stmmidb	pc!, {r8, sl, sp}
  100674:	6848780a 	stmvsda	r8, {r1, r3, fp, ip, sp, lr}^
  100678:	d0044302 	andle	r4, r4, r2, lsl #6
  10067c:	3701783c 	smladxcc	r1, ip, r8, r7
  100680:	60483801 	subvs	r3, r8, r1, lsl #16
  100684:	2400e000 	strcs	lr, [r0]
  100688:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  10068c:	1c31fef3 	ldcne	14, cr15, [r1], #-972
  100690:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  100694:	1c06fedd 	stcne	14, cr15, [r6], {221}
  100698:	2d803501 	cfstr32cs	mvfx3, [r0, #4]
  10069c:	0a30dbe9 	beq	d37648 <__stack_end__+0xb3364c>
  1006a0:	fee8f7ff 	mcr2	7, 7, pc, cr8, cr15, {7}
  1006a4:	0e000630 	cfmadd32eq	mvax1, mvfx0, mvfx0, mvfx0
  1006a8:	fee4f7ff 	mcr2	7, 7, pc, cr4, cr15, {7}
  1006ac:	fee8f7ff 	mcr2	7, 7, pc, cr8, cr15, {7}
  1006b0:	bc08bcf0 	stclt	12, cr11, [r8], {240}
  1006b4:	b5f84718 	ldrltb	r4, [r8, #1816]!
  1006b8:	1c0c1c05 	stcne	12, cr1, [ip], {5}
  1006bc:	46682102 	strmibt	r2, [r8], -r2, lsl #2
  1006c0:	fef3f7ff 	mrc2	7, 7, pc, cr3, cr15, {7}
  1006c4:	1c282180 	stfnes	f2, [r8], #-512
  1006c8:	feeff7ff 	mcr2	7, 7, pc, cr15, cr15, {7}
  1006cc:	1c064918 	stcne	9, cr4, [r6], {24}
  1006d0:	25007848 	strcs	r7, [r0, #-2120]
  1006d4:	280043ed 	stmcsda	r0, {r0, r2, r3, r5, r6, r7, r8, r9, lr}
  1006d8:	f7ffd10b 	ldrnvb	sp, [pc, fp, lsl #2]!
  1006dc:	0207fed1 	andeq	pc, r7, #3344	; 0xd10
  1006e0:	fecef7ff 	mcr2	7, 6, pc, cr14, cr15, {7}
  1006e4:	19c04912 	stmneib	r0, {r1, r4, r8, fp, lr}^
  1006e8:	04007849 	streq	r7, [r0], #-2121
  1006ec:	29010c00 	stmcsdb	r1, {sl, fp}
  1006f0:	1c28d103 	stfned	f5, [r8], #-12
  1006f4:	bc08bcf8 	stclt	12, cr11, [r8], {248}
  1006f8:	42b04718 	adcmis	r4, r0, #6291456	; 0x600000
  1006fc:	ab00d109 	blge	134b28 <__data_beg_src__+0x2ee84>
  100700:	42a07818 	adcmi	r7, r0, #1572864	; 0x180000
  100704:	7858d105 	ldmvcda	r8, {r0, r2, r8, ip, lr, pc}^
  100708:	060943e1 	streq	r4, [r9], -r1, ror #7
  10070c:	42880e09 	addmi	r0, r8, #144	; 0x90
  100710:	2018d003 	andcss	sp, r8, r3
  100714:	feaef7ff 	mcr2	7, 5, pc, cr14, cr15, {7}
  100718:	2006e7eb 	andcs	lr, r6, fp, ror #15
  10071c:	feaaf7ff 	mcr2	7, 5, pc, cr10, cr15, {7}
  100720:	e7e72000 	strb	r2, [r7, r0]!
  100724:	00001021 	andeq	r1, r0, r1, lsr #32
  100728:	fffff200 	swinv	0x00fff200
  10072c:	00186a00 	andeqs	r6, r8, r0, lsl #20
  100730:	00200f4c 	eoreq	r0, r0, ip, asr #30
  100734:	002004fb 	streqd	r0, [r0], -fp
  100738:	002005af 	eoreq	r0, r0, pc, lsr #11
  10073c:	22206b01 	eorcs	r6, r0, #1024	; 0x400
  100740:	63014311 	tstvs	r1, #1140850688	; 0x44000000
  100744:	07096b01 	streq	r6, [r9, -r1, lsl #22]
  100748:	6b01d5fc 	blvs	175f40 <__data_beg_src__+0x7029c>
  10074c:	43912228 	orrmis	r2, r1, #-2147483646	; 0x80000002
  100750:	6b016301 	blvs	15935c <__data_beg_src__+0x536b8>
  100754:	d1fc4011 	mvnles	r4, r1, lsl r0
  100758:	6b014770 	blvs	152520 <__data_beg_src__+0x4c87c>
  10075c:	43112210 	tstmi	r1, #1	; 0x1
  100760:	6b016301 	blvs	15936c <__data_beg_src__+0x536c8>
  100764:	d5fc07c9 	ldrleb	r0, [ip, #1993]!
  100768:	08496b01 	stmeqda	r9, {r0, r8, r9, fp, sp, lr}^
  10076c:	63010049 	tstvs	r1, #73	; 0x49
  100770:	07c96b01 	streqb	r6, [r9, r1, lsl #22]
  100774:	4770d4fc 	undefined
  100778:	2508b470 	strcs	fp, [r8, #-1136]
  10077c:	1c2c2610 	stcne	6, cr2, [ip], #-64
  100780:	d2002a08 	andle	r2, r0, #32768	; 0x8000
  100784:	1b121c14 	blne	5877dc <__stack_end__+0x3837e0>
  100788:	780be002 	stmvcda	fp, {r1, sp, lr, pc}
  10078c:	65033101 	strvs	r3, [r3, #-257]
  100790:	d2fa3c01 	rscles	r3, sl, #256	; 0x100
  100794:	07db6b03 	ldreqb	r6, [fp, r3, lsl #22]
  100798:	6b03d506 	blvs	1f5bb8 <__data_beg_src__+0xeff14>
  10079c:	005b085b 	subeqs	r0, fp, fp, asr r8
  1007a0:	6b036303 	blvs	1d93b4 <__data_beg_src__+0xd3710>
  1007a4:	d4fc07db 	ldrlebt	r0, [ip], #2011
  1007a8:	43336b03 	teqmi	r3, #3072	; 0xc00
  1007ac:	6b036303 	blvs	1d93c0 <__data_beg_src__+0xd371c>
  1007b0:	d505079c 	strle	r0, [r5, #-1948]
  1007b4:	22026b01 	andcs	r6, r2, #1024	; 0x400
  1007b8:	63014391 	tstvs	r1, #1140850690	; 0x44000002
  1007bc:	4770bc70 	undefined
  1007c0:	d5f407db 	ldrleb	r0, [r4, #2011]!
  1007c4:	d1da2a00 	bicles	r2, sl, r0, lsl #20
  1007c8:	07c96b01 	streqb	r6, [r9, r1, lsl #22]
  1007cc:	6b01d5f6 	blvs	175fac <__data_beg_src__+0x70308>
  1007d0:	00490849 	subeq	r0, r9, r9, asr #16
  1007d4:	6b016301 	blvs	1593e0 <__data_beg_src__+0x5373c>
  1007d8:	d4fc07c9 	ldrlebt	r0, [ip], #1993
  1007dc:	b5f8e7ee 	ldrltb	lr, [r8, #2030]!
  1007e0:	6b216804 	blvs	95a7f8 <__stack_end__+0x7567fc>
  1007e4:	d56f0749 	strleb	r0, [pc, #-1865]!	; 1000a3 <bootloader+0xa3>
  1007e8:	060a6d21 	streq	r6, [sl], -r1, lsr #26
  1007ec:	0e126d21 	cdpeq	13, 1, cr6, cr2, cr1, {1}
  1007f0:	0e1b060b 	cfmsub32eq	mvax0, mvfx0, mvfx11, mvfx11
  1007f4:	469c6d21 	ldrmi	r6, [ip], r1, lsr #26
  1007f8:	6d230609 	stcvs	6, cr0, [r3, #-36]!
  1007fc:	021b0e09 	andeqs	r0, fp, #144	; 0x90
  100800:	040d4319 	streq	r4, [sp], #-793
  100804:	0c2d6d21 	stceq	13, cr6, [sp], #-132
  100808:	6d230609 	stcvs	6, cr0, [r3, #-36]!
  10080c:	021b0e09 	andeqs	r0, fp, #144	; 0x90
  100810:	040e4319 	streq	r4, [lr], #-793
  100814:	0c366d21 	ldceq	13, cr6, [r6], #-132
  100818:	6d230609 	stcvs	6, cr0, [r3, #-36]!
  10081c:	021b0e09 	andeqs	r0, fp, #144	; 0x90
  100820:	04094319 	streq	r4, [r9], #-793
  100824:	06130c09 	ldreq	r0, [r3], -r9, lsl #24
  100828:	6b23d506 	blvs	9f5c48 <__stack_end__+0x7f1c4c>
  10082c:	433b2780 	teqmi	fp, #33554432	; 0x2000000
  100830:	6b236323 	blvs	9d94c4 <__stack_end__+0x7d54c8>
  100834:	d5fc061b 	ldrleb	r0, [ip, #1563]!
  100838:	27046b23 	strcs	r6, [r4, -r3, lsr #22]
  10083c:	632343bb 	teqvs	r3, #-335544318	; 0xec000002
  100840:	075b6b23 	ldreqb	r6, [fp, -r3, lsr #22]
  100844:	4663d4fc 	undefined
  100848:	431a021b 	tstmi	sl, #-1342177279	; 0xb0000001
  10084c:	27004bc1 	strcs	r4, [r0, -r1, asr #23]
  100850:	d06a429a 	strleb	r4, [sl], #-42
  100854:	23ffdc23 	mvncss	sp, #8960	; 0x2300
  100858:	429a3302 	addmis	r3, sl, #134217728	; 0x8000000
  10085c:	dc12d040 	ldcle	0, cr13, [r2], {64}
  100860:	d0632a80 	rsble	r2, r3, r0, lsl #21
  100864:	d0612a81 	rsble	r2, r1, r1, lsl #21
  100868:	d1712a82 	cmnle	r1, r2, lsl #21
  10086c:	801fab00 	andhis	sl, pc, r0, lsl #22
  100870:	07306861 	ldreq	r6, [r0, -r1, ror #16]!
  100874:	07890f00 	streq	r0, [r9, r0, lsl #30]
  100878:	2803d56b 	stmcsda	r3, {r0, r1, r3, r5, r6, r8, sl, ip, lr, pc}
  10087c:	0080d869 	addeq	sp, r0, r9, ror #16
  100880:	6b001900 	blvs	106c88 <__data_beg_src__+0xfe4>
  100884:	23ffe07b 	mvncss	lr, #123	; 0x7b
  100888:	429a3303 	addmis	r3, sl, #201326592	; 0xc000000
  10088c:	2303d06d 	tstcs	r3, #109	; 0x6d
  100890:	429a021b 	addmis	r0, sl, #-1342177279	; 0xb0000001
  100894:	3301d05c 	tstcc	r1, #92	; 0x5c
  100898:	d021429a 	mlale	r1, sl, r2, r4
  10089c:	2309e058 	tstcs	r9, #88	; 0x58
  1008a0:	2602021b 	undefined
  1008a4:	d042429a 	umaalle	r4, r2, sl, r2
  1008a8:	2305dc0f 	tstcs	r5, #3840	; 0xf00
  1008ac:	429a021b 	addmis	r0, sl, #-1342177279	; 0xb0000001
  1008b0:	230dd02c 	tstcs	sp, #44	; 0x2c
  1008b4:	429a01db 	addmis	r0, sl, #-1073741770	; 0xc0000036
  1008b8:	2311d013 	tstcs	r1, #19	; 0x13
  1008bc:	429a01db 	addmis	r0, sl, #-1073741770	; 0xc0000036
  1008c0:	2201d146 	andcs	sp, r1, #-2147483631	; 0x80000011
  1008c4:	e0991d01 	adds	r1, r9, r1, lsl #26
  1008c8:	4ba3e02c 	blmi	fe9f8980 <__stack_end__+0xfe7f4984>
  1008cc:	d06a429a 	strleb	r4, [sl], #-42
  1008d0:	429a4ba2 	addmis	r4, sl, #165888	; 0x28800
  1008d4:	4ba1d068 	blmi	fe974a7c <__stack_end__+0xfe770a80>
  1008d8:	429a3380 	addmis	r3, sl, #2	; 0x2
  1008dc:	7145d138 	cmpvc	r5, r8, lsr r1
  1008e0:	1c28e083 	stcne	0, cr14, [r8], #-524
  1008e4:	380138ff 	stmccda	r1, {r0, r1, r2, r3, r4, r5, r6, r7, fp, ip, sp}
  1008e8:	2212d105 	andcss	sp, r2, #1073741825	; 0x40000001
  1008ec:	d8002912 	stmleda	r0, {r1, r4, r8, fp, sp}
  1008f0:	499b1c0a 	ldmmiib	fp, {r1, r3, sl, fp, ip}
  1008f4:	2001e082 	andcs	lr, r1, r2, lsl #1
  1008f8:	42850240 	addmi	r0, r5, #4	; 0x4
  1008fc:	2243d128 	subcs	sp, r3, #10	; 0xa
  100900:	d8002943 	stmleda	r0, {r0, r1, r6, r8, fp, sp}
  100904:	49961c0a 	ldmmiib	r6, {r1, r3, sl, fp, ip}
  100908:	e0773112 	rsbs	r3, r7, r2, lsl r1
  10090c:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  100910:	20ffff24 	rsccss	pc, pc, r4, lsr #30
  100914:	43283001 	teqmi	r8, #1	; 0x1
  100918:	200160a0 	andcs	r6, r1, r0, lsr #1
  10091c:	d1002d00 	tstle	r0, r0, lsl #26
  100920:	60602000 	rsbvs	r2, r0, r0
  100924:	bc08bcf8 	stclt	12, cr11, [r8], {248}
  100928:	e0304718 	eors	r4, r0, r8, lsl r7
  10092c:	7105e01e 	tstvc	r5, lr, lsl r0
  100930:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  100934:	2d00ff12 	stccs	15, cr15, [r0, #-72]
  100938:	2601d100 	strcs	sp, [r1], -r0, lsl #2
  10093c:	20416066 	subcs	r6, r1, r6, rrx
  100940:	2d000240 	sfmcs	f0, 4, [r0, #-256]
  100944:	2000d100 	andcs	sp, r0, r0, lsl #2
  100948:	20436360 	subcs	r6, r3, r0, ror #6
  10094c:	e0010240 	and	r0, r1, r0, asr #4
  100950:	e00ee058 	and	lr, lr, r8, asr r0
  100954:	d1002d00 	tstle	r0, r0, lsl #26
  100958:	63a02000 	movvs	r2, #0	; 0x0
  10095c:	02002085 	andeq	r2, r0, #133	; 0x85
  100960:	d1002d00 	tstle	r0, r0, lsl #26
  100964:	63e02000 	mvnvs	r2, #0	; 0x0
  100968:	e01ee7dc 	ldrsb	lr, [lr], -ip
  10096c:	801fab00 	andhis	sl, pc, r0, lsl #22
  100970:	6861e00a 	stmvsda	r1!, {r1, r3, sp, lr, pc}^
  100974:	d54507c9 	strleb	r0, [r5, #-1993]
  100978:	d1432800 	cmple	r3, r0, lsl #16
  10097c:	04006b20 	streq	r6, [r0], #-2848
  100980:	300117c0 	andcc	r1, r1, r0, asr #15
  100984:	8018ab00 	andhis	sl, r8, r0, lsl #22
  100988:	46692202 	strmibt	r2, [r9], -r2, lsl #4
  10098c:	0730e036 	undefined
  100990:	2d000f00 	stccs	15, cr0, [r0]
  100994:	2800d136 	stmcsda	r0, {r1, r2, r4, r5, r8, ip, lr, pc}
  100998:	2803d034 	stmcsda	r3, {r2, r4, r5, ip, lr, pc}
  10099c:	0080d832 	addeq	sp, r0, r2, lsr r8
  1009a0:	63071900 	tstvs	r7, #0	; 0x0
  1009a4:	e01ae021 	ands	lr, sl, r1, lsr #32
  1009a8:	0730e023 	ldreq	lr, [r0, -r3, lsr #32]!
  1009ac:	2d000f00 	stccs	15, cr0, [r0]
  1009b0:	2800d128 	stmcsda	r0, {r3, r5, r8, ip, lr, pc}
  1009b4:	2803d026 	stmcsda	r3, {r1, r2, r5, ip, lr, pc}
  1009b8:	2801d824 	stmcsda	r1, {r2, r5, fp, ip, lr, pc}
  1009bc:	2041d103 	subcs	sp, r1, r3, lsl #2
  1009c0:	63600240 	cmnvs	r0, #4	; 0x4
  1009c4:	2802e011 	stmcsda	r2, {r0, r4, sp, lr, pc}
  1009c8:	2043d103 	subcs	sp, r3, r3, lsl #2
  1009cc:	63a00240 	movvs	r0, #4	; 0x4
  1009d0:	2803e00b 	stmcsda	r3, {r0, r1, r3, sp, lr, pc}
  1009d4:	2085d109 	addcs	sp, r5, r9, lsl #2
  1009d8:	63e00200 	mvnvs	r0, #0	; 0x0
  1009dc:	6b20e005 	blvs	9389f8 <__stack_end__+0x7349fc>
  1009e0:	d5fc0780 	ldrleb	r0, [ip, #1920]!
  1009e4:	43b06b20 	movmis	r6, #32768	; 0x8000
  1009e8:	1c206320 	stcne	3, cr6, [r0], #-128
  1009ec:	feb5f7ff 	mrc2	7, 5, pc, cr5, cr15, {7}
  1009f0:	2208e798 	andcs	lr, r8, #39845888	; 0x2600000
  1009f4:	d8002908 	stmleda	r0, {r3, r8, fp, sp}
  1009f8:	495a1c0a 	ldmmidb	sl, {r1, r3, sl, fp, ip}^
  1009fc:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  100a00:	e78ffebb 	undefined
  100a04:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  100a08:	e78bfe99 	undefined
  100a0c:	1c04b510 	cfstr32ne	mvfx11, [r4], {16}
  100a10:	69c16800 	stmvsib	r1, {fp, sp, lr}^
  100a14:	d50d04ca 	strle	r0, [sp, #-1226]
  100a18:	03092101 	tsteq	r9, #1073741824	; 0x40000000
  100a1c:	21006201 	tstcs	r0, r1, lsl #4
  100a20:	628143c9 	addvs	r4, r1, #603979779	; 0x24000003
  100a24:	62812100 	addvs	r2, r1, #0	; 0x0
  100a28:	310121ff 	strccd	r2, [r1, -pc]
  100a2c:	01c96081 	biceq	r6, r9, r1, lsl #1
  100a30:	e0066301 	and	r6, r6, r1, lsl #6
  100a34:	d50407c9 	strle	r0, [r4, #-1993]
  100a38:	62012101 	andvs	r2, r1, #1073741824	; 0x40000000
  100a3c:	f7ff1c20 	ldrnvb	r1, [pc, r0, lsr #24]!
  100a40:	7920fece 	stmvcdb	r0!, {r1, r2, r3, r6, r7, r9, sl, fp, ip, sp, lr, pc}
  100a44:	bc08bc10 	stclt	12, cr11, [r8], {16}
  100a48:	60014718 	andvs	r4, r1, r8, lsl r7
  100a4c:	71012100 	tstvc	r1, r0, lsl #2
  100a50:	21027141 	tstcs	r2, r1, asr #2
  100a54:	49446081 	stmmidb	r4, {r0, r7, sp, lr}^
  100a58:	494460c1 	stmmidb	r4, {r0, r6, r7, sp, lr}^
  100a5c:	49446101 	stmmidb	r4, {r0, r8, sp, lr}^
  100a60:	47706141 	ldrmib	r6, [r0, -r1, asr #2]!
  100a64:	6804b5f7 	stmvsda	r4, {r0, r1, r2, r4, r5, r6, r7, r8, sl, ip, sp, pc}
  100a68:	1c076885 	stcne	8, cr6, [r7], {133}
  100a6c:	1c382600 	ldcne	6, cr2, [r8]
  100a70:	ffccf7ff 	swinv	0x00ccf7ff
  100a74:	d01d2800 	andles	r2, sp, r0, lsl #16
  100a78:	40286b60 	eormi	r6, r8, r0, ror #22
  100a7c:	6b60d018 	blvs	1934ae4 <__stack_end__+0x1730ae8>
  100a80:	0c009902 	stceq	9, cr9, [r0], {2}
  100a84:	d2024288 	andle	r4, r2, #-2147483640	; 0x80000008
  100a88:	0c006b60 	stceq	11, cr6, [r0], {96}
  100a8c:	9802e006 	stmlsda	r2, {r1, r2, sp, lr, pc}
  100a90:	6d62e004 	stcvsl	0, cr14, [r2, #-16]!
  100a94:	9b011c31 	blls	147b60 <__data_beg_src__+0x41ebc>
  100a98:	545a3601 	ldrplb	r3, [sl], #-1537
  100a9c:	d2f83801 	rscles	r3, r8, #65536	; 0x10000
  100aa0:	43a86b60 	movmi	r6, #98304	; 0x18000
  100aa4:	2d026360 	stccs	3, cr6, [r2, #-384]
  100aa8:	2540d101 	strcsb	sp, [r0, #-257]
  100aac:	2502e000 	strcs	lr, [r2]
  100ab0:	d0dc2e00 	sbcles	r2, ip, r0, lsl #28
  100ab4:	60bd1c30 	adcvss	r1, sp, r0, lsr ip
  100ab8:	bc08bcfe 	stclt	12, cr11, [r8], {254}
  100abc:	b5f04718 	ldrltb	r4, [r0, #1816]!
  100ac0:	21401c0e 	cmpcs	r0, lr, lsl #24
  100ac4:	1c076804 	stcne	8, cr6, [r7], {4}
  100ac8:	2a401c08 	bcs	1107af0 <__stack_end__+0xf03af4>
  100acc:	1c10d200 	lfmne	f5, 1, [r0], {0}
  100ad0:	e0021a15 	and	r1, r2, r5, lsl sl
  100ad4:	36017832 	undefined
  100ad8:	380165a2 	stmccda	r1, {r1, r5, r7, r8, sl, sp, lr}
  100adc:	6ba2d2fa 	blvs	fe9b56cc <__stack_end__+0xfe7b16d0>
  100ae0:	43022010 	tstmi	r2, #16	; 0x10
  100ae4:	e01e63a2 	ands	r6, lr, r2, lsr #7
  100ae8:	2d402040 	stccsl	0, cr2, [r0, #-256]
  100aec:	1c28d200 	sfmne	f5, 1, [r8]
  100af0:	e0021a2d 	and	r1, r2, sp, lsr #20
  100af4:	36017831 	undefined
  100af8:	380165a1 	stmccda	r1, {r0, r5, r7, r8, sl, sp, lr}
  100afc:	e004d2fa 	strd	sp, [r4], -sl
  100b00:	f7ff1c38 	undefined
  100b04:	2800ff83 	stmcsda	r0, {r0, r1, r7, r8, r9, sl, fp, ip, sp, lr, pc}
  100b08:	6ba0d01f 	blvs	fe934b8c <__stack_end__+0xfe730b90>
  100b0c:	d5f707c0 	ldrleb	r0, [r7, #1984]!
  100b10:	08406ba0 	stmeqda	r0, {r5, r7, r8, r9, fp, sp, lr}^
  100b14:	63a00040 	movvs	r0, #64	; 0x40
  100b18:	07c06ba0 	streqb	r6, [r0, r0, lsr #23]
  100b1c:	6ba0d4fc 	blvs	fe935f14 <__stack_end__+0xfe731f18>
  100b20:	43082110 	tstmi	r8, #4	; 0x4
  100b24:	2d0063a0 	stccs	3, cr6, [r0, #-640]
  100b28:	e004d1de 	ldrd	sp, [r4], -lr
  100b2c:	f7ff1c38 	undefined
  100b30:	2800ff6d 	stmcsda	r0, {r0, r2, r3, r5, r6, r8, r9, sl, fp, ip, sp, lr, pc}
  100b34:	6ba0d009 	blvs	fe934b60 <__stack_end__+0xfe730b64>
  100b38:	d5f707c0 	ldrleb	r0, [r7, #1984]!
  100b3c:	08406ba0 	stmeqda	r0, {r5, r7, r8, r9, fp, sp, lr}^
  100b40:	63a00040 	movvs	r0, #64	; 0x40
  100b44:	07c06ba0 	streqb	r6, [r0, r0, lsr #23]
  100b48:	1c28d4fc 	cfstrsne	mvf13, [r8], #-1008
  100b4c:	bc08bcf0 	stclt	12, cr11, [r8], {240}
  100b50:	00004718 	andeq	r4, r0, r8, lsl r7
  100b54:	00000302 	andeq	r0, r0, r2, lsl #6
  100b58:	00002021 	andeq	r2, r0, r1, lsr #32
  100b5c:	000021a1 	andeq	r2, r0, r1, lsr #3
  100b60:	00200ed0 	ldreqd	r0, [r0], -r0
  100b64:	00200f2c 	eoreq	r0, r0, ip, lsr #30
  100b68:	00200a0d 	eoreq	r0, r0, sp, lsl #20
  100b6c:	00200abf 	streqh	r0, [r0], -pc
  100b70:	00200a65 	eoreq	r0, r0, r5, ror #20
  100b74:	4abfb5fe 	bmi	ff0ee374 <__stack_end__+0xfeeea378>
  100b78:	4abf7813 	bmi	ff0debcc <__stack_end__+0xfeedabd0>
  100b7c:	d0312b00 	eorles	r2, r1, r0, lsl #22
  100b80:	d1012904 	tstle	r1, r4, lsl #18
  100b84:	e0066803 	and	r6, r6, r3, lsl #16
  100b88:	d1032902 	tstle	r3, r2, lsl #18
  100b8c:	5ec02300 	cdppl	3, 12, cr2, cr0, cr0, {0}
  100b90:	e0001c03 	and	r1, r0, r3, lsl #24
  100b94:	ac007803 	stcge	8, cr7, [r0], {3}
  100b98:	00483402 	subeq	r3, r8, r2, lsl #8
  100b9c:	39011901 	stmccdb	r1, {r0, r8, fp, ip}
  100ba0:	26302500 	ldrcst	r2, [r0], -r0, lsl #10
  100ba4:	071ce00a 	ldreq	lr, [ip, -sl]
  100ba8:	2c090f24 	stccs	15, cr0, [r9], {36}
  100bac:	4334d801 	teqmi	r4, #65536	; 0x10000
  100bb0:	3437e000 	ldrcct	lr, [r7]
  100bb4:	3901700c 	stmccdb	r1, {r2, r3, ip, sp, lr}
  100bb8:	3501111b 	strcc	r1, [r1, #-283]
  100bbc:	d8f242a8 	ldmleia	r2!, {r3, r5, r7, r9, lr}^
  100bc0:	701eab00 	andvcs	sl, lr, r0, lsl #22
  100bc4:	70592178 	subvcs	r2, r9, r8, ror r1
  100bc8:	44691c01 	strmibt	r1, [r9], #-3073
  100bcc:	708b230a 	addvc	r2, fp, sl, lsl #6
  100bd0:	70cb230d 	sbcvc	r2, fp, sp, lsl #6
  100bd4:	46681d01 	strmibt	r1, [r8], -r1, lsl #26
  100bd8:	f0006892 	mulnv	r0, r2, r8
  100bdc:	bcfef96f 	ldcltl	9, cr15, [lr], #444
  100be0:	4718bc08 	ldrmi	fp, [r8, -r8, lsl #24]
  100be4:	f0006892 	mulnv	r0, r2, r8
  100be8:	e7f8f969 	ldrb	pc, [r8, r9, ror #18]!
  100bec:	1c04b510 	cfstr32ne	mvfx11, [r4], {16}
  100bf0:	fc46f7ff 	mcrr2	7, 15, pc, r6, cr15
  100bf4:	bc107020 	ldclt	0, cr7, [r0], {32}
  100bf8:	2001bc08 	andcs	fp, r1, r8, lsl #24
  100bfc:	b5704718 	ldrltb	r4, [r0, #-1816]!
  100c00:	1c0e1c05 	stcne	12, cr1, [lr], {5}
  100c04:	e0042400 	and	r2, r4, r0, lsl #8
  100c08:	35017828 	strcc	r7, [r1, #-2088]
  100c0c:	fc32f7ff 	ldc2	7, cr15, [r2], #-1020
  100c10:	42b43401 	adcmis	r3, r4, #16777216	; 0x1000000
  100c14:	bc70d3f8 	ldcltl	3, cr13, [r0], #-992
  100c18:	4718bc08 	ldrmi	fp, [r8, -r8, lsl #24]
  100c1c:	4c96b510 	cfldr32mi	mvfx11, [r6], {16}
  100c20:	34181c0a 	ldrcc	r1, [r8], #-3082
  100c24:	1c201c01 	stcne	12, cr1, [r0], #-4
  100c28:	f0006923 	andnv	r6, r0, r3, lsr #18
  100c2c:	bc10f948 	ldclt	9, cr15, [r0], {72}
  100c30:	4718bc08 	ldrmi	fp, [r8, -r8, lsl #24]
  100c34:	4c90b510 	cfldr32mi	mvfx11, [r0], {16}
  100c38:	34181c0a 	ldrcc	r1, [r8], #-3082
  100c3c:	1c201c01 	stcne	12, cr1, [r0], #-4
  100c40:	f0006963 	andnv	r6, r0, r3, ror #18
  100c44:	bc10f93c 	ldclt	9, cr15, [r0], {60}
  100c48:	4718bc08 	ldrmi	fp, [r8, -r8, lsl #24]
  100c4c:	1c06b5f8 	cfstr32ne	mvfx11, [r6], {248}
  100c50:	27401c0c 	strcsb	r1, [r0, -ip, lsl #24]
  100c54:	1c3de009 	ldcne	0, cr14, [sp], #-36
  100c58:	d2002c40 	andle	r2, r0, #16384	; 0x4000
  100c5c:	1c291c25 	stcne	12, cr1, [r9], #-148
  100c60:	f7ff1c30 	undefined
  100c64:	1b64ffdb 	blne	1a40bd8 <__stack_end__+0x183cbdc>
  100c68:	2c001976 	stccs	9, cr1, [r0], {118}
  100c6c:	bcf8d1f3 	ldfltp	f5, [r8], #972
  100c70:	4718bc08 	ldrmi	fp, [r8, -r8, lsl #24]
  100c74:	1c05b570 	cfstr32ne	mvfx11, [r5], {112}
  100c78:	26401c0c 	strcsb	r1, [r0], -ip, lsl #24
  100c7c:	1c31e008 	ldcne	0, cr14, [r1], #-32
  100c80:	d2002c40 	andle	r2, r0, #16384	; 0x4000
  100c84:	1c281c21 	stcne	12, cr1, [r8], #-132
  100c88:	ffd4f7ff 	swinv	0x00d4f7ff
  100c8c:	182d1a24 	stmneda	sp!, {r2, r5, r9, fp, ip}
  100c90:	d1f42c00 	mvnles	r2, r0, lsl #24
  100c94:	bc08bc70 	stclt	12, cr11, [r8], {112}
  100c98:	b5f04718 	ldrltb	r4, [r0, #1816]!
  100c9c:	4d764f76 	ldcmil	15, cr4, [r6, #-472]!
  100ca0:	3718b093 	undefined
  100ca4:	68f91c38 	ldmvsia	r9!, {r3, r4, r5, sl, fp, ip}^
  100ca8:	f907f000 	stmnvdb	r7, {ip, sp, lr, pc}
  100cac:	d0072800 	andle	r2, r7, r0, lsl #16
  100cb0:	60284872 	eorvs	r4, r8, r2, ror r8
  100cb4:	60684872 	rsbvs	r4, r8, r2, ror r8
  100cb8:	60a84872 	adcvs	r4, r8, r2, ror r8
  100cbc:	e00c4872 	and	r4, ip, r2, ror r8
  100cc0:	fa87f7ff 	blx	fe2fecc4 <__stack_end__+0xfe0facc8>
  100cc4:	d1ed2805 	mvnle	r2, r5, lsl #16
  100cc8:	3110496b 	tstcc	r0, fp, ror #18
  100ccc:	60286808 	eorvs	r6, r8, r8, lsl #16
  100cd0:	60686848 	rsbvs	r6, r8, r8, asr #16
  100cd4:	60a8486d 	adcvs	r4, r8, sp, ror #16
  100cd8:	60e8486d 	rscvs	r4, r8, sp, ror #16
  100cdc:	fa5cf7ff 	blx	183ece0 <__stack_end__+0x163ace4>
  100ce0:	21404a65 	cmpcs	r0, r5, ror #20
  100ce4:	68d2a801 	ldmvsia	r2, {r0, fp, sp, pc}^
  100ce8:	f8e8f000 	stmnvia	r8!, {ip, sp, lr, pc}^
  100cec:	af019011 	swige	0x00019011
  100cf0:	e0ba2500 	adcs	r2, sl, r0, lsl #10
  100cf4:	28ff7838 	ldmcsia	pc!, {r3, r4, r5, fp, ip, sp, lr}^
  100cf8:	2823d066 	stmcsda	r3!, {r1, r2, r5, r6, ip, lr, pc}
  100cfc:	485dd165 	ldmmida	sp, {r0, r2, r5, r6, r8, ip, lr, pc}^
  100d00:	28007800 	stmcsda	r0, {fp, ip, sp, lr}
  100d04:	4a5cd005 	bmi	1834d20 <__stack_end__+0x1630d24>
  100d08:	a0622102 	rsbge	r2, r2, r2, lsl #2
  100d0c:	f0006892 	mulnv	r0, r2, r8
  100d10:	2c53f8d5 	mrrccs	8, 13, pc, r3, cr5
  100d14:	4a58d106 	bmi	1735134 <__stack_end__+0x1531138>
  100d18:	68529912 	ldmvsda	r2, {r1, r4, r8, fp, ip, pc}^
  100d1c:	f0001c30 	andnv	r1, r0, r0, lsr ip
  100d20:	e072f8cd 	rsbs	pc, r2, sp, asr #17
  100d24:	d1062c52 	tstle	r6, r2, asr ip
  100d28:	99124a53 	ldmlsdb	r2, {r0, r1, r4, r6, r9, fp, lr}
  100d2c:	1c306812 	ldcne	8, cr6, [r0], #-72
  100d30:	f8c4f000 	stmnvia	r4, {ip, sp, lr, pc}^
  100d34:	2c4fe069 	mcrrcs	0, 6, lr, pc, cr9
  100d38:	9812d102 	ldmlsda	r2, {r1, r8, ip, lr, pc}
  100d3c:	e0647030 	rsb	r7, r4, r0, lsr r0
  100d40:	d1022c48 	tstle	r2, r8, asr #24
  100d44:	80309812 	eorhis	r9, r0, r2, lsl r8
  100d48:	2c57e05f 	mrrccs	0, 5, lr, r7, cr15
  100d4c:	9812d102 	ldmlsda	r2, {r1, r8, ip, lr, pc}
  100d50:	e05a6030 	subs	r6, sl, r0, lsr r0
  100d54:	d1022c6f 	tstle	r2, pc, ror #24
  100d58:	1c302101 	ldfnes	f2, [r0], #-4
  100d5c:	2c68e00c 	stccsl	0, cr14, [r8], #-48
  100d60:	2300d104 	tstcs	r0, #1	; 0x1
  100d64:	21025ef0 	strcsd	r5, [r2, -r0]
  100d68:	e0049012 	and	r9, r4, r2, lsl r0
  100d6c:	d1062c77 	tstle	r6, r7, ror ip
  100d70:	21046830 	tstcs	r4, r0, lsr r8
  100d74:	a8129012 	ldmgeda	r2, {r1, r4, ip, pc}
  100d78:	fefcf7ff 	mrc2	7, 7, pc, cr12, cr15, {7}
  100d7c:	2c47e045 	mcrrcs	0, 4, lr, r7, cr5
  100d80:	9812d103 	ldmlsda	r2, {r0, r1, r8, ip, lr, pc}
  100d84:	f8a0f000 	stmnvia	r0!, {ip, sp, lr, pc}
  100d88:	2c54e03f 	mrrccs	0, 3, lr, r4, cr15
  100d8c:	4939d109 	ldmmidb	r9!, {r0, r3, r8, ip, lr, pc}
  100d90:	70082001 	andvc	r2, r8, r1
  100d94:	21024a38 	tstcs	r2, r8, lsr sl
  100d98:	6892a03e 	ldmvsia	r2, {r1, r2, r3, r4, r5, sp, pc}
  100d9c:	f88ef000 	stmnvia	lr, {ip, sp, lr, pc}
  100da0:	2c4ee033 	mcrrcs	0, 3, lr, lr, cr3
  100da4:	4933d103 	ldmmidb	r3!, {r0, r1, r8, ip, lr, pc}
  100da8:	70082000 	andvc	r2, r8, r0
  100dac:	2c56e02d 	mrrccs	0, 2, lr, r6, cr13
  100db0:	4830d12b 	ldmmida	r0!, {r0, r1, r3, r5, r8, ip, lr, pc}
  100db4:	68404c30 	stmvsda	r0, {r4, r5, sl, fp, lr}^
  100db8:	210568a2 	smlatbcs	r5, r2, r8, r6
  100dbc:	f87ef000 	ldmnvda	lr!, {ip, sp, lr, pc}^
  100dc0:	1c292500 	cfstr32ne	mvfx2, [r9]
  100dc4:	e002a034 	and	sl, r2, r4, lsr r0
  100dc8:	e02ce04d 	eor	lr, ip, sp, asr #32
  100dcc:	78023101 	stmvcda	r2, {r0, r8, ip, sp}
  100dd0:	2a003001 	bcs	10cddc <__data_beg_src__+0x7138>
  100dd4:	a030d1fa 	ldrgesh	sp, [r0], -sl
  100dd8:	f00068a2 	andnv	r6, r0, r2, lsr #17
  100ddc:	2101f86f 	tstcsp	r1, pc, ror #16
  100de0:	68a2a030 	stmvsia	r2!, {r4, r5, sp, pc}
  100de4:	f86af000 	stmnvda	sl!, {ip, sp, lr, pc}^
  100de8:	e000a72f 	and	sl, r0, pc, lsr #14
  100dec:	78383501 	ldmvcda	r8!, {r0, r8, sl, ip, sp}
  100df0:	28003701 	stmcsda	r0, {r0, r8, r9, sl, ip, sp}
  100df4:	1c29d1fa 	stfned	f5, [r9], #-1000
  100df8:	68a2a02b 	stmvsia	r2!, {r0, r1, r3, r5, sp, pc}
  100dfc:	f85ef000 	ldmnvda	lr, {ip, sp, lr, pc}^
  100e00:	a0242102 	eorge	r2, r4, r2, lsl #2
  100e04:	f00068a2 	andnv	r6, r0, r2, lsr #17
  100e08:	2000f859 	andcs	pc, r0, r9, asr r8
  100e0c:	48199012 	ldmmida	r9, {r1, r4, ip, pc}
  100e10:	7800247a 	stmvcda	r0, {r1, r3, r4, r5, r6, sl, sp}
  100e14:	d0262800 	eorle	r2, r6, r0, lsl #16
  100e18:	21014a17 	tstcs	r1, r7, lsl sl
  100e1c:	6892a025 	ldmvsia	r2, {r0, r2, r5, sp, pc}
  100e20:	f84cf000 	stmnvda	ip, {ip, sp, lr, pc}^
  100e24:	1c01e01f 	stcne	0, cr14, [r1], {31}
  100e28:	29093930 	stmcsdb	r9, {r4, r5, r8, fp, ip, sp}
  100e2c:	9812d803 	ldmlsda	r2, {r0, r1, fp, ip, lr, pc}
  100e30:	43080100 	tstmi	r8, #0	; 0x0
  100e34:	1c01e016 	stcne	0, cr14, [r1], {22}
  100e38:	29053941 	stmcsdb	r5, {r0, r6, r8, fp, ip, sp}
  100e3c:	9912d803 	ldmlsdb	r2, {r0, r1, fp, ip, lr, pc}
  100e40:	38370109 	ldmccda	r7!, {r0, r3, r8}
  100e44:	1c01e006 	stcne	0, cr14, [r1], {6}
  100e48:	29053961 	stmcsdb	r5, {r0, r5, r6, r8, fp, ip, sp}
  100e4c:	9912d804 	ldmlsdb	r2, {r2, fp, ip, lr, pc}
  100e50:	38570109 	ldmccda	r7, {r0, r3, r8}^
  100e54:	e0054308 	and	r4, r5, r8, lsl #6
  100e58:	d101282c 	tstle	r1, ip, lsr #16
  100e5c:	e0009e12 	and	r9, r0, r2, lsl lr
  100e60:	20001c04 	andcs	r1, r0, r4, lsl #24
  100e64:	37019012 	smladcc	r1, r2, r0, r9
  100e68:	98113501 	ldmlsda	r1, {r0, r8, sl, ip, sp}
  100e6c:	da004285 	ble	111888 <__data_beg_src__+0xbbe4>
  100e70:	e735e740 	ldr	lr, [r5, -r0, asr #14]!
  100e74:	00200f34 	eoreq	r0, r0, r4, lsr pc
  100e78:	00200f54 	eoreq	r0, r0, r4, asr pc
  100e7c:	00200c4d 	eoreq	r0, r0, sp, asr #24
  100e80:	00200c75 	eoreq	r0, r0, r5, ror ip
  100e84:	00200c1d 	eoreq	r0, r0, sp, lsl ip
  100e88:	00200c35 	eoreq	r0, r0, r5, lsr ip
  100e8c:	00200bff 	streqd	r0, [r0], -pc
  100e90:	00200bed 	eoreq	r0, r0, sp, ror #23
  100e94:	00000d0a 	andeq	r0, r0, sl, lsl #26
  100e98:	20766f4e 	rsbcss	r6, r6, lr, asr #30
  100e9c:	32203031 	eorcc	r3, r0, #49	; 0x31
  100ea0:	00343030 	eoreqs	r3, r4, r0, lsr r0
  100ea4:	00000020 	andeq	r0, r0, r0, lsr #32
  100ea8:	343a3431 	ldrcct	r3, [sl], #-1073
  100eac:	33333a39 	teqcc	r3, #233472	; 0x39000
  100eb0:	00000000 	andeq	r0, r0, r0
  100eb4:	0000003e 	andeq	r0, r0, lr, lsr r0
  100eb8:	47084700 	strmi	r4, [r8, -r0, lsl #14]
  100ebc:	47184710 	undefined
  100ec0:	47284720 	strmi	r4, [r8, -r0, lsr #14]!
  100ec4:	47384730 	undefined
  100ec8:	46c04778 	undefined
  100ecc:	eafffca7 	b	100170 <bootloader+0x170>
  100ed0:	01100112 	tsteq	r0, r2, lsl r1
  100ed4:	08000002 	stmeqda	r0, {r1}
  100ed8:	612403eb 	smulwtvs	r4, fp, r3
  100edc:	00000110 	andeq	r0, r0, r0, lsl r1
  100ee0:	02090100 	andeq	r0, r9, #0	; 0x0
  100ee4:	01020043 	tsteq	r2, r3, asr #32
  100ee8:	0900c000 	stmeqdb	r0, {lr, pc}
  100eec:	01000004 	tsteq	r0, r4
  100ef0:	00000202 	andeq	r0, r0, r2, lsl #4
  100ef4:	10002405 	andne	r2, r0, r5, lsl #8
  100ef8:	02240401 	eoreq	r0, r4, #16777216	; 0x1000000
  100efc:	06240500 	streqt	r0, [r4], -r0, lsl #10
  100f00:	24050100 	strcs	r0, [r5], #-256
  100f04:	07010001 	streq	r0, [r1, -r1]
  100f08:	08038305 	stmeqda	r3, {r0, r2, r8, r9, pc}
  100f0c:	0409ff00 	streq	pc, [r9], #-3840
  100f10:	0a020001 	beq	180f1c <__data_beg_src__+0x7b278>
  100f14:	07000000 	streq	r0, [r0, -r0]
  100f18:	40020105 	andmi	r0, r2, r5, lsl #2
  100f1c:	05070000 	streq	r0, [r7]
  100f20:	00400282 	subeq	r0, r0, r2, lsl #5
  100f24:	2e317600 	cfmsuba32cs	mvax0, mvax7, mvfx1, mvfx0
  100f28:	00002034 	andeq	r2, r0, r4, lsr r0
  100f2c:	0001c200 	andeq	ip, r1, r0, lsl #4
  100f30:	00080000 	andeq	r0, r8, r0
  100f34:	00000001 	andeq	r0, r0, r1
  100f38:	00200f25 	eoreq	r0, r0, r5, lsr #30
  100f3c:	ffffffff 	swinv	0x00ffffff
  100f40:	ffffffff 	swinv	0x00ffffff
  100f44:	ffffffff 	swinv	0x00ffffff
  100f48:	ffffffff 	swinv	0x00ffffff
  100f4c:	ffffffff 	swinv	0x00ffffff
  100f50:	ffffffff 	swinv	0x00ffffff
  100f54:	ffffffff 	swinv	0x00ffffff
  100f58:	ffffffff 	swinv	0x00ffffff
  100f5c:	ffffffff 	swinv	0x00ffffff
  100f60:	ffffffff 	swinv	0x00ffffff
  100f64:	ffffffff 	swinv	0x00ffffff
  100f68:	ffffffff 	swinv	0x00ffffff
  100f6c:	ffffffff 	swinv	0x00ffffff
  100f70:	ffffffff 	swinv	0x00ffffff
  100f74:	ffffffff 	swinv	0x00ffffff
  100f78:	ffffffff 	swinv	0x00ffffff
  100f7c:	ffffffff 	swinv	0x00ffffff
  100f80:	ffffffff 	swinv	0x00ffffff
  100f84:	ffffffff 	swinv	0x00ffffff
  100f88:	ffffffff 	swinv	0x00ffffff
  100f8c:	ffffffff 	swinv	0x00ffffff
  100f90:	ffffffff 	swinv	0x00ffffff
  100f94:	ffffffff 	swinv	0x00ffffff
  100f98:	ffffffff 	swinv	0x00ffffff
  100f9c:	ffffffff 	swinv	0x00ffffff
  100fa0:	ffffffff 	swinv	0x00ffffff
  100fa4:	ffffffff 	swinv	0x00ffffff
  100fa8:	ffffffff 	swinv	0x00ffffff
  100fac:	ffffffff 	swinv	0x00ffffff
  100fb0:	ffffffff 	swinv	0x00ffffff
  100fb4:	ffffffff 	swinv	0x00ffffff
  100fb8:	ffffffff 	swinv	0x00ffffff
  100fbc:	ffffffff 	swinv	0x00ffffff
  100fc0:	ffffffff 	swinv	0x00ffffff
  100fc4:	ffffffff 	swinv	0x00ffffff
  100fc8:	ffffffff 	swinv	0x00ffffff
  100fcc:	ffffffff 	swinv	0x00ffffff
  100fd0:	ffffffff 	swinv	0x00ffffff
  100fd4:	ffffffff 	swinv	0x00ffffff
  100fd8:	ffffffff 	swinv	0x00ffffff
  100fdc:	ffffffff 	swinv	0x00ffffff
  100fe0:	ffffffff 	swinv	0x00ffffff
  100fe4:	ffffffff 	swinv	0x00ffffff
  100fe8:	ffffffff 	swinv	0x00ffffff
  100fec:	ffffffff 	swinv	0x00ffffff
  100ff0:	ffffffff 	swinv	0x00ffffff
  100ff4:	ffffffff 	swinv	0x00ffffff
  100ff8:	ffffffff 	swinv	0x00ffffff
  100ffc:	ffffffff 	swinv	0x00ffffff

00101000 <start>:
  101000:	ea00000f 	b	101044 <_reset>
  101004:	e59ff014 	ldr	pc, [pc, #20]	; 101020 <_undf>
  101008:	e59ff014 	ldr	pc, [pc, #20]	; 101024 <_swi>
  10100c:	e59ff014 	ldr	pc, [pc, #20]	; 101028 <_pabt>
  101010:	e59ff014 	ldr	pc, [pc, #20]	; 10102c <_dabt>
  101014:	e1a00000 	nop			(mov r0,r0)
  101018:	e51fff20 	ldr	pc, [pc, #-3872]	; 100100 <bootloader+0x100>
  10101c:	e59ff00c 	ldr	pc, [pc, #12]	; 101030 <_fiq>

00101020 <_undf>:
  101020:	00101034 	andeqs	r1, r0, r4, lsr r0

00101024 <_swi>:
  101024:	00104380 	andeqs	r4, r0, r0, lsl #7

00101028 <_pabt>:
  101028:	00101038 	andeqs	r1, r0, r8, lsr r0

0010102c <_dabt>:
  10102c:	0010103c 	andeqs	r1, r0, ip, lsr r0

00101030 <_fiq>:
  101030:	00101040 	andeqs	r1, r0, r0, asr #32

00101034 <__undf>:
  101034:	eafffffe 	b	101034 <__undf>

00101038 <__pabt>:
  101038:	eafffffe 	b	101038 <__pabt>

0010103c <__dabt>:
  10103c:	eafffffe 	b	10103c <__dabt>

00101040 <__fiq>:
  101040:	eafffffe 	b	101040 <__fiq>
Disassemblierung der Sektion prog:

00101044 <_reset>:
  101044:	e59f00c0 	ldr	r0, [pc, #192]	; 10110c <prog+0xc8>
  101048:	e321f0db 	msr	CPSR_c, #219	; 0xdb
  10104c:	e1a0d000 	mov	sp, r0
  101050:	e2400004 	sub	r0, r0, #4	; 0x4
  101054:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
  101058:	e1a0d000 	mov	sp, r0
  10105c:	e2400004 	sub	r0, r0, #4	; 0x4
  101060:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
  101064:	e1a0d000 	mov	sp, r0
  101068:	e2400004 	sub	r0, r0, #4	; 0x4
  10106c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
  101070:	e1a0d000 	mov	sp, r0
  101074:	e2400b01 	sub	r0, r0, #1024	; 0x400
  101078:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
  10107c:	e1a0d000 	mov	sp, r0
  101080:	e2400b01 	sub	r0, r0, #1024	; 0x400
  101084:	e321f0df 	msr	CPSR_c, #223	; 0xdf
  101088:	e1a0d000 	mov	sp, r0
  10108c:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
  101090:	eb00077f 	bl	102e94 <AT91F_LowLevelInit>
  101094:	e3a01000 	mov	r1, #0	; 0x0
  101098:	e1a0b001 	mov	fp, r1
  10109c:	e1a07001 	mov	r7, r1
  1010a0:	e59f1050 	ldr	r1, [pc, #80]	; 1010f8 <prog+0xb4>
  1010a4:	e59f3050 	ldr	r3, [pc, #80]	; 1010fc <prog+0xb8>
  1010a8:	e0533001 	subs	r3, r3, r1
  1010ac:	0a000003 	beq	1010c0 <.end_clear_loop>
  1010b0:	e3a02000 	mov	r2, #0	; 0x0

001010b4 <.clear_loop>:
  1010b4:	e4c12001 	strb	r2, [r1], #1
  1010b8:	e2533001 	subs	r3, r3, #1	; 0x1
  1010bc:	cafffffc 	bgt	1010b4 <.clear_loop>

001010c0 <.end_clear_loop>:
  1010c0:	e59f1038 	ldr	r1, [pc, #56]	; 101100 <prog+0xbc>
  1010c4:	e59f2038 	ldr	r2, [pc, #56]	; 101104 <prog+0xc0>
  1010c8:	e59f3038 	ldr	r3, [pc, #56]	; 101108 <prog+0xc4>
  1010cc:	e0533001 	subs	r3, r3, r1
  1010d0:	0a000003 	beq	1010e4 <.end_set_loop>

001010d4 <.set_loop>:
  1010d4:	e4d24001 	ldrb	r4, [r2], #1
  1010d8:	e4c14001 	strb	r4, [r1], #1
  1010dc:	e2533001 	subs	r3, r3, #1	; 0x1
  1010e0:	cafffffb 	bgt	1010d4 <.set_loop>

001010e4 <.end_set_loop>:
  1010e4:	e3a00000 	mov	r0, #0	; 0x0
  1010e8:	e3a01000 	mov	r1, #0	; 0x0
  1010ec:	e59fe01c 	ldr	lr, [pc, #28]	; 101110 <prog+0xcc>
  1010f0:	e12fff1e 	bx	lr

001010f4 <endless_loop>:
  1010f4:	eafffffe 	b	1010f4 <endless_loop>
  1010f8:	002009a8 	eoreq	r0, r0, r8, lsr #19
  1010fc:	00201354 	eoreq	r1, r0, r4, asr r3
  101100:	00200000 	eoreq	r0, r0, r0
  101104:	00105ca4 	andeqs	r5, r0, r4, lsr #25
  101108:	002009a8 	eoreq	r0, r0, r8, lsr #19
  10110c:	00203ffc 	streqd	r3, [r0], -ip
  101110:	00101db8 	ldreqh	r1, [r0], -r8

00101114 <malloc>:
  101114:	e59f3008 	ldr	r3, [pc, #8]	; 101124 <prog+0xe0>
  101118:	e1a01000 	mov	r1, r0
  10111c:	e5930000 	ldr	r0, [r3]
  101120:	ea000005 	b	10113c <_malloc_r>
  101124:	00200830 	eoreq	r0, r0, r0, lsr r8

00101128 <free>:
  101128:	e59f3008 	ldr	r3, [pc, #8]	; 101138 <prog+0xf4>
  10112c:	e1a01000 	mov	r1, r0
  101130:	e5930000 	ldr	r0, [r3]
  101134:	ea000272 	b	101b04 <_free_r>
  101138:	00200830 	eoreq	r0, r0, r0, lsr r8

0010113c <_malloc_r>:
  10113c:	e1a0c00d 	mov	ip, sp
  101140:	e92ddff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
  101144:	e281200b 	add	r2, r1, #11	; 0xb
  101148:	e3520016 	cmp	r2, #22	; 0x16
  10114c:	83c25007 	bichi	r5, r2, #7	; 0x7
  101150:	93a05010 	movls	r5, #16	; 0x10
  101154:	e1550001 	cmp	r5, r1
  101158:	23a03000 	movcs	r3, #0	; 0x0
  10115c:	33a03001 	movcc	r3, #1	; 0x1
  101160:	e1933fa5 	orrs	r3, r3, r5, lsr #31
  101164:	e1a08000 	mov	r8, r0
  101168:	e24cb004 	sub	fp, ip, #4	; 0x4
  10116c:	e24dd004 	sub	sp, sp, #4	; 0x4
  101170:	13a0300c 	movne	r3, #12	; 0xc
  101174:	13a00000 	movne	r0, #0	; 0x0
  101178:	15883000 	strne	r3, [r8]
  10117c:	189daff8 	ldmneia	sp, {r3, r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  101180:	e1a00008 	mov	r0, r8
  101184:	eb0001e0 	bl	10190c <__malloc_lock>
  101188:	e3550f7e 	cmp	r5, #504	; 0x1f8
  10118c:	2a000013 	bcs	1011e0 <_malloc_r+0xa4>
  101190:	e59f164c 	ldr	r1, [pc, #1612]	; 1017e4 <prog+0x7a0>
  101194:	e1a061a5 	mov	r6, r5, lsr #3
  101198:	e081e186 	add	lr, r1, r6, lsl #3
  10119c:	e59e400c 	ldr	r4, [lr, #12]
  1011a0:	e154000e 	cmp	r4, lr
  1011a4:	0a00006d 	beq	101360 <_malloc_r+0x224>
  1011a8:	e5943004 	ldr	r3, [r4, #4]
  1011ac:	e594e00c 	ldr	lr, [r4, #12]
  1011b0:	e3c30003 	bic	r0, r3, #3	; 0x3
  1011b4:	e0842000 	add	r2, r4, r0
  1011b8:	e5923004 	ldr	r3, [r2, #4]
  1011bc:	e594c008 	ldr	ip, [r4, #8]
  1011c0:	e3833001 	orr	r3, r3, #1	; 0x1
  1011c4:	e58ec008 	str	ip, [lr, #8]
  1011c8:	e5823004 	str	r3, [r2, #4]
  1011cc:	e58ce00c 	str	lr, [ip, #12]
  1011d0:	e1a00008 	mov	r0, r8
  1011d4:	eb0001cd 	bl	101910 <__malloc_unlock>
  1011d8:	e2840008 	add	r0, r4, #8	; 0x8
  1011dc:	e89daff8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  1011e0:	e1b024a5 	movs	r2, r5, lsr #9
  1011e4:	01a061a5 	moveq	r6, r5, lsr #3
  1011e8:	1a000023 	bne	10127c <_malloc_r+0x140>
  1011ec:	e59f25f0 	ldr	r2, [pc, #1520]	; 1017e4 <prog+0x7a0>
  1011f0:	e082c186 	add	ip, r2, r6, lsl #3
  1011f4:	e59c400c 	ldr	r4, [ip, #12]
  1011f8:	ea000007 	b	10121c <_malloc_r+0xe0>
  1011fc:	e5943004 	ldr	r3, [r4, #4]
  101200:	e3c30003 	bic	r0, r3, #3	; 0x3
  101204:	e0651000 	rsb	r1, r5, r0
  101208:	e351000f 	cmp	r1, #15	; 0xf
  10120c:	ca0000ef 	bgt	1015d0 <_malloc_r+0x494>
  101210:	e3510000 	cmp	r1, #0	; 0x0
  101214:	aa0000ef 	bge	1015d8 <_malloc_r+0x49c>
  101218:	e594400c 	ldr	r4, [r4, #12]
  10121c:	e154000c 	cmp	r4, ip
  101220:	1afffff5 	bne	1011fc <_malloc_r+0xc0>
  101224:	e2866001 	add	r6, r6, #1	; 0x1
  101228:	e59fa5b8 	ldr	sl, [pc, #1464]	; 1017e8 <prog+0x7a4>
  10122c:	e59a4008 	ldr	r4, [sl, #8]
  101230:	e154000a 	cmp	r4, sl
  101234:	0a000035 	beq	101310 <_malloc_r+0x1d4>
  101238:	e5943004 	ldr	r3, [r4, #4]
  10123c:	e3c30003 	bic	r0, r3, #3	; 0x3
  101240:	e0651000 	rsb	r1, r5, r0
  101244:	e351000f 	cmp	r1, #15	; 0xf
  101248:	ca00004a 	bgt	101378 <_malloc_r+0x23c>
  10124c:	e3510000 	cmp	r1, #0	; 0x0
  101250:	e58aa00c 	str	sl, [sl, #12]
  101254:	e58aa008 	str	sl, [sl, #8]
  101258:	ba00001c 	blt	1012d0 <_malloc_r+0x194>
  10125c:	e0842000 	add	r2, r4, r0
  101260:	e5923004 	ldr	r3, [r2, #4]
  101264:	e1a00008 	mov	r0, r8
  101268:	e3833001 	orr	r3, r3, #1	; 0x1
  10126c:	e5823004 	str	r3, [r2, #4]
  101270:	eb0001a6 	bl	101910 <__malloc_unlock>
  101274:	e2840008 	add	r0, r4, #8	; 0x8
  101278:	e89daff8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  10127c:	e3520004 	cmp	r2, #4	; 0x4
  101280:	91a03325 	movls	r3, r5, lsr #6
  101284:	92836038 	addls	r6, r3, #56	; 0x38
  101288:	9affffd7 	bls	1011ec <_malloc_r+0xb0>
  10128c:	e3520014 	cmp	r2, #20	; 0x14
  101290:	9282605b 	addls	r6, r2, #91	; 0x5b
  101294:	9affffd4 	bls	1011ec <_malloc_r+0xb0>
  101298:	e3520054 	cmp	r2, #84	; 0x54
  10129c:	91a03625 	movls	r3, r5, lsr #12
  1012a0:	9283606e 	addls	r6, r3, #110	; 0x6e
  1012a4:	9affffd0 	bls	1011ec <_malloc_r+0xb0>
  1012a8:	e3520f55 	cmp	r2, #340	; 0x154
  1012ac:	91a037a5 	movls	r3, r5, lsr #15
  1012b0:	92836077 	addls	r6, r3, #119	; 0x77
  1012b4:	9affffcc 	bls	1011ec <_malloc_r+0xb0>
  1012b8:	e59f352c 	ldr	r3, [pc, #1324]	; 1017ec <prog+0x7a8>
  1012bc:	e1520003 	cmp	r2, r3
  1012c0:	91a03925 	movls	r3, r5, lsr #18
  1012c4:	9283607c 	addls	r6, r3, #124	; 0x7c
  1012c8:	83a0607e 	movhi	r6, #126	; 0x7e
  1012cc:	eaffffc6 	b	1011ec <_malloc_r+0xb0>
  1012d0:	e3500c02 	cmp	r0, #512	; 0x200
  1012d4:	2a000070 	bcs	10149c <_malloc_r+0x360>
  1012d8:	e59f3504 	ldr	r3, [pc, #1284]	; 1017e4 <prog+0x7a0>
  1012dc:	e1a011a0 	mov	r1, r0, lsr #3
  1012e0:	e083e181 	add	lr, r3, r1, lsl #3
  1012e4:	e59ec008 	ldr	ip, [lr, #8]
  1012e8:	e5933004 	ldr	r3, [r3, #4]
  1012ec:	e1a01121 	mov	r1, r1, lsr #2
  1012f0:	e3a02001 	mov	r2, #1	; 0x1
  1012f4:	e1833112 	orr	r3, r3, r2, lsl r1
  1012f8:	e59f14e4 	ldr	r1, [pc, #1252]	; 1017e4 <prog+0x7a0>
  1012fc:	e5813004 	str	r3, [r1, #4]
  101300:	e584e00c 	str	lr, [r4, #12]
  101304:	e584c008 	str	ip, [r4, #8]
  101308:	e58c400c 	str	r4, [ip, #12]
  10130c:	e58e4008 	str	r4, [lr, #8]
  101310:	e59f24cc 	ldr	r2, [pc, #1228]	; 1017e4 <prog+0x7a0>
  101314:	e1a03fc6 	mov	r3, r6, asr #31
  101318:	e0863f23 	add	r3, r6, r3, lsr #30
  10131c:	e5921004 	ldr	r1, [r2, #4]
  101320:	e1a03143 	mov	r3, r3, asr #2
  101324:	e3a02001 	mov	r2, #1	; 0x1
  101328:	e1a02312 	mov	r2, r2, lsl r3
  10132c:	e1520001 	cmp	r2, r1
  101330:	8a00001a 	bhi	1013a0 <_malloc_r+0x264>
  101334:	e1110002 	tst	r1, r2
  101338:	1a00007c 	bne	101530 <_malloc_r+0x3f4>
  10133c:	e1a02082 	mov	r2, r2, lsl #1
  101340:	e3c63003 	bic	r3, r6, #3	; 0x3
  101344:	e1110002 	tst	r1, r2
  101348:	e2836004 	add	r6, r3, #4	; 0x4
  10134c:	1a000077 	bne	101530 <_malloc_r+0x3f4>
  101350:	e1a02082 	mov	r2, r2, lsl #1
  101354:	e1110002 	tst	r1, r2
  101358:	e2866004 	add	r6, r6, #4	; 0x4
  10135c:	eafffffa 	b	10134c <_malloc_r+0x210>
  101360:	e284e008 	add	lr, r4, #8	; 0x8
  101364:	e59e400c 	ldr	r4, [lr, #12]
  101368:	e154000e 	cmp	r4, lr
  10136c:	1affff8d 	bne	1011a8 <_malloc_r+0x6c>
  101370:	e2866002 	add	r6, r6, #2	; 0x2
  101374:	eaffffab 	b	101228 <_malloc_r+0xec>
  101378:	e3852001 	orr	r2, r5, #1	; 0x1
  10137c:	e3813001 	orr	r3, r1, #1	; 0x1
  101380:	e0845005 	add	r5, r4, r5
  101384:	e5842004 	str	r2, [r4, #4]
  101388:	e58a500c 	str	r5, [sl, #12]
  10138c:	e58a5008 	str	r5, [sl, #8]
  101390:	e7851001 	str	r1, [r5, r1]
  101394:	e9850408 	stmib	r5, {r3, sl}
  101398:	e585a00c 	str	sl, [r5, #12]
  10139c:	eaffff8b 	b	1011d0 <_malloc_r+0x94>
  1013a0:	e59f243c 	ldr	r2, [pc, #1084]	; 1017e4 <prog+0x7a0>
  1013a4:	e592a008 	ldr	sl, [r2, #8]
  1013a8:	e59a3004 	ldr	r3, [sl, #4]
  1013ac:	e3c33003 	bic	r3, r3, #3	; 0x3
  1013b0:	e50b302c 	str	r3, [fp, #-44]
  1013b4:	e0651003 	rsb	r1, r5, r3
  1013b8:	e51b202c 	ldr	r2, [fp, #-44]
  1013bc:	e351000f 	cmp	r1, #15	; 0xf
  1013c0:	c3a03000 	movgt	r3, #0	; 0x0
  1013c4:	d3a03001 	movle	r3, #1	; 0x1
  1013c8:	e1520005 	cmp	r2, r5
  1013cc:	33833001 	orrcc	r3, r3, #1	; 0x1
  1013d0:	e3530000 	cmp	r3, #0	; 0x0
  1013d4:	0a000023 	beq	101468 <_malloc_r+0x32c>
  1013d8:	e59f3410 	ldr	r3, [pc, #1040]	; 1017f0 <prog+0x7ac>
  1013dc:	e1a00008 	mov	r0, r8
  1013e0:	e5932000 	ldr	r2, [r3]
  1013e4:	e59f3408 	ldr	r3, [pc, #1032]	; 1017f4 <prog+0x7b0>
  1013e8:	e0852002 	add	r2, r5, r2
  1013ec:	e5931000 	ldr	r1, [r3]
  1013f0:	e2826010 	add	r6, r2, #16	; 0x10
  1013f4:	e3710001 	cmn	r1, #1	; 0x1
  1013f8:	12863eff 	addne	r3, r6, #4080	; 0xff0
  1013fc:	1283300f 	addne	r3, r3, #15	; 0xf
  101400:	13c36eff 	bicne	r6, r3, #4080	; 0xff0
  101404:	13c6600f 	bicne	r6, r6, #15	; 0xf
  101408:	e1a01006 	mov	r1, r6
  10140c:	e51b902c 	ldr	r9, [fp, #-44]
  101410:	eb00058f 	bl	102a54 <_sbrk_r>
  101414:	e3700001 	cmn	r0, #1	; 0x1
  101418:	e08a7009 	add	r7, sl, r9
  10141c:	e1a04000 	mov	r4, r0
  101420:	0a000004 	beq	101438 <_malloc_r+0x2fc>
  101424:	e1500007 	cmp	r0, r7
  101428:	2a000089 	bcs	101654 <_malloc_r+0x518>
  10142c:	e59f13b0 	ldr	r1, [pc, #944]	; 1017e4 <prog+0x7a0>
  101430:	e15a0001 	cmp	sl, r1
  101434:	0a000086 	beq	101654 <_malloc_r+0x518>
  101438:	e59f13a4 	ldr	r1, [pc, #932]	; 1017e4 <prog+0x7a0>
  10143c:	e5913008 	ldr	r3, [r1, #8]
  101440:	e5932004 	ldr	r2, [r3, #4]
  101444:	e3c22003 	bic	r2, r2, #3	; 0x3
  101448:	e0651002 	rsb	r1, r5, r2
  10144c:	e351000f 	cmp	r1, #15	; 0xf
  101450:	c3a03000 	movgt	r3, #0	; 0x0
  101454:	d3a03001 	movle	r3, #1	; 0x1
  101458:	e1520005 	cmp	r2, r5
  10145c:	33833001 	orrcc	r3, r3, #1	; 0x1
  101460:	e3530000 	cmp	r3, #0	; 0x0
  101464:	1a0000da 	bne	1017d4 <_malloc_r+0x698>
  101468:	e59f2374 	ldr	r2, [pc, #884]	; 1017e4 <prog+0x7a0>
  10146c:	e3853001 	orr	r3, r5, #1	; 0x1
  101470:	e5924008 	ldr	r4, [r2, #8]
  101474:	e3811001 	orr	r1, r1, #1	; 0x1
  101478:	e5843004 	str	r3, [r4, #4]
  10147c:	e59f3360 	ldr	r3, [pc, #864]	; 1017e4 <prog+0x7a0>
  101480:	e0842005 	add	r2, r4, r5
  101484:	e1a00008 	mov	r0, r8
  101488:	e5821004 	str	r1, [r2, #4]
  10148c:	e5832008 	str	r2, [r3, #8]
  101490:	eb00011e 	bl	101910 <__malloc_unlock>
  101494:	e2840008 	add	r0, r4, #8	; 0x8
  101498:	e89daff8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  10149c:	e1b014a0 	movs	r1, r0, lsr #9
  1014a0:	01a011a0 	moveq	r1, r0, lsr #3
  1014a4:	0a000013 	beq	1014f8 <_malloc_r+0x3bc>
  1014a8:	e3510004 	cmp	r1, #4	; 0x4
  1014ac:	91a03320 	movls	r3, r0, lsr #6
  1014b0:	92831038 	addls	r1, r3, #56	; 0x38
  1014b4:	9a00000f 	bls	1014f8 <_malloc_r+0x3bc>
  1014b8:	e3510014 	cmp	r1, #20	; 0x14
  1014bc:	9281105b 	addls	r1, r1, #91	; 0x5b
  1014c0:	9a00000c 	bls	1014f8 <_malloc_r+0x3bc>
  1014c4:	e3510054 	cmp	r1, #84	; 0x54
  1014c8:	91a03620 	movls	r3, r0, lsr #12
  1014cc:	9283106e 	addls	r1, r3, #110	; 0x6e
  1014d0:	9a000008 	bls	1014f8 <_malloc_r+0x3bc>
  1014d4:	e3510f55 	cmp	r1, #340	; 0x154
  1014d8:	91a037a0 	movls	r3, r0, lsr #15
  1014dc:	92831077 	addls	r1, r3, #119	; 0x77
  1014e0:	9a000004 	bls	1014f8 <_malloc_r+0x3bc>
  1014e4:	e59f3300 	ldr	r3, [pc, #768]	; 1017ec <prog+0x7a8>
  1014e8:	e1510003 	cmp	r1, r3
  1014ec:	91a03920 	movls	r3, r0, lsr #18
  1014f0:	9283107c 	addls	r1, r3, #124	; 0x7c
  1014f4:	83a0107e 	movhi	r1, #126	; 0x7e
  1014f8:	e59f22e4 	ldr	r2, [pc, #740]	; 1017e4 <prog+0x7a0>
  1014fc:	e082e181 	add	lr, r2, r1, lsl #3
  101500:	e59ec008 	ldr	ip, [lr, #8]
  101504:	e15c000e 	cmp	ip, lr
  101508:	0a00009a 	beq	101778 <_malloc_r+0x63c>
  10150c:	e59c3004 	ldr	r3, [ip, #4]
  101510:	e3c33003 	bic	r3, r3, #3	; 0x3
  101514:	e1530000 	cmp	r3, r0
  101518:	9a000002 	bls	101528 <_malloc_r+0x3ec>
  10151c:	e59cc008 	ldr	ip, [ip, #8]
  101520:	e15c000e 	cmp	ip, lr
  101524:	1afffff8 	bne	10150c <_malloc_r+0x3d0>
  101528:	e59ce00c 	ldr	lr, [ip, #12]
  10152c:	eaffff73 	b	101300 <_malloc_r+0x1c4>
  101530:	e59f32ac 	ldr	r3, [pc, #684]	; 1017e4 <prog+0x7a0>
  101534:	e1a07006 	mov	r7, r6
  101538:	e083e186 	add	lr, r3, r6, lsl #3
  10153c:	e1a0c00e 	mov	ip, lr
  101540:	e59c400c 	ldr	r4, [ip, #12]
  101544:	ea000007 	b	101568 <_malloc_r+0x42c>
  101548:	e5943004 	ldr	r3, [r4, #4]
  10154c:	e3c30003 	bic	r0, r3, #3	; 0x3
  101550:	e0651000 	rsb	r1, r5, r0
  101554:	e351000f 	cmp	r1, #15	; 0xf
  101558:	ca000022 	bgt	1015e8 <_malloc_r+0x4ac>
  10155c:	e3510000 	cmp	r1, #0	; 0x0
  101560:	aa000031 	bge	10162c <_malloc_r+0x4f0>
  101564:	e594400c 	ldr	r4, [r4, #12]
  101568:	e154000c 	cmp	r4, ip
  10156c:	1afffff5 	bne	101548 <_malloc_r+0x40c>
  101570:	e2866001 	add	r6, r6, #1	; 0x1
  101574:	e3160003 	tst	r6, #3	; 0x3
  101578:	e28cc008 	add	ip, ip, #8	; 0x8
  10157c:	1affffef 	bne	101540 <_malloc_r+0x404>
  101580:	e3170003 	tst	r7, #3	; 0x3
  101584:	e24ee008 	sub	lr, lr, #8	; 0x8
  101588:	e2477001 	sub	r7, r7, #1	; 0x1
  10158c:	0a00007b 	beq	101780 <_malloc_r+0x644>
  101590:	e59e3008 	ldr	r3, [lr, #8]
  101594:	e153000e 	cmp	r3, lr
  101598:	0afffff8 	beq	101580 <_malloc_r+0x444>
  10159c:	e59f1240 	ldr	r1, [pc, #576]	; 1017e4 <prog+0x7a0>
  1015a0:	e1a02082 	mov	r2, r2, lsl #1
  1015a4:	e5913004 	ldr	r3, [r1, #4]
  1015a8:	e1520003 	cmp	r2, r3
  1015ac:	8affff7b 	bhi	1013a0 <_malloc_r+0x264>
  1015b0:	e3520000 	cmp	r2, #0	; 0x0
  1015b4:	0affff79 	beq	1013a0 <_malloc_r+0x264>
  1015b8:	e1130002 	tst	r3, r2
  1015bc:	1affffdb 	bne	101530 <_malloc_r+0x3f4>
  1015c0:	e1a02082 	mov	r2, r2, lsl #1
  1015c4:	e1130002 	tst	r3, r2
  1015c8:	e2866004 	add	r6, r6, #4	; 0x4
  1015cc:	eafffffa 	b	1015bc <_malloc_r+0x480>
  1015d0:	e2466001 	sub	r6, r6, #1	; 0x1
  1015d4:	eaffff12 	b	101224 <_malloc_r+0xe8>
  1015d8:	e0842000 	add	r2, r4, r0
  1015dc:	e5923004 	ldr	r3, [r2, #4]
  1015e0:	e594e00c 	ldr	lr, [r4, #12]
  1015e4:	eafffef4 	b	1011bc <_malloc_r+0x80>
  1015e8:	e3853001 	orr	r3, r5, #1	; 0x1
  1015ec:	e594e00c 	ldr	lr, [r4, #12]
  1015f0:	e0845005 	add	r5, r4, r5
  1015f4:	e5843004 	str	r3, [r4, #4]
  1015f8:	e5b4c008 	ldr	ip, [r4, #8]!
  1015fc:	e3813001 	orr	r3, r1, #1	; 0x1
  101600:	e58ec008 	str	ip, [lr, #8]
  101604:	e58ce00c 	str	lr, [ip, #12]
  101608:	e58a5008 	str	r5, [sl, #8]
  10160c:	e58a500c 	str	r5, [sl, #12]
  101610:	e7851001 	str	r1, [r5, r1]
  101614:	e9850408 	stmib	r5, {r3, sl}
  101618:	e1a00008 	mov	r0, r8
  10161c:	e585a00c 	str	sl, [r5, #12]
  101620:	eb0000ba 	bl	101910 <__malloc_unlock>
  101624:	e1a00004 	mov	r0, r4
  101628:	e89daff8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  10162c:	e0842000 	add	r2, r4, r0
  101630:	e5923004 	ldr	r3, [r2, #4]
  101634:	e594e00c 	ldr	lr, [r4, #12]
  101638:	e5b4c008 	ldr	ip, [r4, #8]!
  10163c:	e3833001 	orr	r3, r3, #1	; 0x1
  101640:	e1a00008 	mov	r0, r8
  101644:	e5823004 	str	r3, [r2, #4]
  101648:	e58ec008 	str	ip, [lr, #8]
  10164c:	e58ce00c 	str	lr, [ip, #12]
  101650:	eafffff2 	b	101620 <_malloc_r+0x4e4>
  101654:	e59f219c 	ldr	r2, [pc, #412]	; 1017f8 <prog+0x7b4>
  101658:	e1540007 	cmp	r4, r7
  10165c:	e5923000 	ldr	r3, [r2]
  101660:	e0833006 	add	r3, r3, r6
  101664:	e5823000 	str	r3, [r2]
  101668:	0a000049 	beq	101794 <_malloc_r+0x658>
  10166c:	e59f1180 	ldr	r1, [pc, #384]	; 1017f4 <prog+0x7b0>
  101670:	e1a00008 	mov	r0, r8
  101674:	e5913000 	ldr	r3, [r1]
  101678:	e3730001 	cmn	r3, #1	; 0x1
  10167c:	159f2174 	ldrne	r2, [pc, #372]	; 1017f8 <prog+0x7b4>
  101680:	159f1170 	ldrne	r1, [pc, #368]	; 1017f8 <prog+0x7b4>
  101684:	15923000 	ldrne	r3, [r2]
  101688:	10672004 	rsbne	r2, r7, r4
  10168c:	10833002 	addne	r3, r3, r2
  101690:	05814000 	streq	r4, [r1]
  101694:	15813000 	strne	r3, [r1]
  101698:	e2141007 	ands	r1, r4, #7	; 0x7
  10169c:	12617008 	rsbne	r7, r1, #8	; 0x8
  1016a0:	10844007 	addne	r4, r4, r7
  1016a4:	e0843006 	add	r3, r4, r6
  1016a8:	e1a03a03 	mov	r3, r3, lsl #20
  1016ac:	e1a03a23 	mov	r3, r3, lsr #20
  1016b0:	01a07001 	moveq	r7, r1
  1016b4:	e2633a01 	rsb	r3, r3, #4096	; 0x1000
  1016b8:	e0877003 	add	r7, r7, r3
  1016bc:	e1a01007 	mov	r1, r7
  1016c0:	eb0004e3 	bl	102a54 <_sbrk_r>
  1016c4:	e59f312c 	ldr	r3, [pc, #300]	; 1017f8 <prog+0x7b4>
  1016c8:	e3700001 	cmn	r0, #1	; 0x1
  1016cc:	01a00004 	moveq	r0, r4
  1016d0:	03a07000 	moveq	r7, #0	; 0x0
  1016d4:	e5932000 	ldr	r2, [r3]
  1016d8:	e59f1104 	ldr	r1, [pc, #260]	; 1017e4 <prog+0x7a0>
  1016dc:	e0643000 	rsb	r3, r4, r0
  1016e0:	e0830007 	add	r0, r3, r7
  1016e4:	e59f310c 	ldr	r3, [pc, #268]	; 1017f8 <prog+0x7b4>
  1016e8:	e0822007 	add	r2, r2, r7
  1016ec:	e15a0001 	cmp	sl, r1
  1016f0:	e5832000 	str	r2, [r3]
  1016f4:	e5814008 	str	r4, [r1, #8]
  1016f8:	e3800001 	orr	r0, r0, #1	; 0x1
  1016fc:	0a00002e 	beq	1017bc <_malloc_r+0x680>
  101700:	e51b102c 	ldr	r1, [fp, #-44]
  101704:	e351000f 	cmp	r1, #15	; 0xf
  101708:	93a03001 	movls	r3, #1	; 0x1
  10170c:	95843004 	strls	r3, [r4, #4]
  101710:	9affff48 	bls	101438 <_malloc_r+0x2fc>
  101714:	e5840004 	str	r0, [r4, #4]
  101718:	e51b102c 	ldr	r1, [fp, #-44]
  10171c:	e59a2004 	ldr	r2, [sl, #4]
  101720:	e241300c 	sub	r3, r1, #12	; 0xc
  101724:	e3c39007 	bic	r9, r3, #7	; 0x7
  101728:	e2022001 	and	r2, r2, #1	; 0x1
  10172c:	e08a1009 	add	r1, sl, r9
  101730:	e3a03005 	mov	r3, #5	; 0x5
  101734:	e1822009 	orr	r2, r2, r9
  101738:	e359000f 	cmp	r9, #15	; 0xf
  10173c:	e58a2004 	str	r2, [sl, #4]
  101740:	e5813008 	str	r3, [r1, #8]
  101744:	e5813004 	str	r3, [r1, #4]
  101748:	8a00001d 	bhi	1017c4 <_malloc_r+0x688>
  10174c:	e59f10a8 	ldr	r1, [pc, #168]	; 1017fc <prog+0x7b8>
  101750:	e59f30a0 	ldr	r3, [pc, #160]	; 1017f8 <prog+0x7b4>
  101754:	e5932000 	ldr	r2, [r3]
  101758:	e5913000 	ldr	r3, [r1]
  10175c:	e1520003 	cmp	r2, r3
  101760:	85812000 	strhi	r2, [r1]
  101764:	e59f1094 	ldr	r1, [pc, #148]	; 101800 <prog+0x7bc>
  101768:	e5913000 	ldr	r3, [r1]
  10176c:	e1520003 	cmp	r2, r3
  101770:	85812000 	strhi	r2, [r1]
  101774:	eaffff2f 	b	101438 <_malloc_r+0x2fc>
  101778:	e5923004 	ldr	r3, [r2, #4]
  10177c:	eafffeda 	b	1012ec <_malloc_r+0x1b0>
  101780:	e59f105c 	ldr	r1, [pc, #92]	; 1017e4 <prog+0x7a0>
  101784:	e5913004 	ldr	r3, [r1, #4]
  101788:	e1c33002 	bic	r3, r3, r2
  10178c:	e5813004 	str	r3, [r1, #4]
  101790:	eaffff81 	b	10159c <_malloc_r+0x460>
  101794:	e1a03a04 	mov	r3, r4, lsl #20
  101798:	e1a03a23 	mov	r3, r3, lsr #20
  10179c:	e3530000 	cmp	r3, #0	; 0x0
  1017a0:	1affffb1 	bne	10166c <_malloc_r+0x530>
  1017a4:	e59f3038 	ldr	r3, [pc, #56]	; 1017e4 <prog+0x7a0>
  1017a8:	e0860009 	add	r0, r6, r9
  1017ac:	e5932008 	ldr	r2, [r3, #8]
  1017b0:	e3803001 	orr	r3, r0, #1	; 0x1
  1017b4:	e5823004 	str	r3, [r2, #4]
  1017b8:	eaffffe3 	b	10174c <_malloc_r+0x610>
  1017bc:	e5840004 	str	r0, [r4, #4]
  1017c0:	eaffffe1 	b	10174c <_malloc_r+0x610>
  1017c4:	e28a1008 	add	r1, sl, #8	; 0x8
  1017c8:	e1a00008 	mov	r0, r8
  1017cc:	eb0000cc 	bl	101b04 <_free_r>
  1017d0:	eaffffdd 	b	10174c <_malloc_r+0x610>
  1017d4:	e1a00008 	mov	r0, r8
  1017d8:	eb00004c 	bl	101910 <__malloc_unlock>
  1017dc:	e3a00000 	mov	r0, #0	; 0x0
  1017e0:	e89daff8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  1017e4:	00200028 	eoreq	r0, r0, r8, lsr #32
  1017e8:	00200030 	eoreq	r0, r0, r0, lsr r0
  1017ec:	00000554 	andeq	r0, r0, r4, asr r5
  1017f0:	002009d8 	ldreqd	r0, [r0], -r8
  1017f4:	00200020 	eoreq	r0, r0, r0, lsr #32
  1017f8:	002009a8 	eoreq	r0, r0, r8, lsr #19
  1017fc:	002009d4 	ldreqd	r0, [r0], -r4
  101800:	002009d0 	ldreqd	r0, [r0], -r0

00101804 <memcpy>:
  101804:	e352000f 	cmp	r2, #15	; 0xf
  101808:	e1a0c002 	mov	ip, r2
  10180c:	e52de004 	str	lr, [sp, #-4]!
  101810:	e1a02000 	mov	r2, r0
  101814:	9a000016 	bls	101874 <memcpy+0x70>
  101818:	e1813000 	orr	r3, r1, r0
  10181c:	e3130003 	tst	r3, #3	; 0x3
  101820:	1a000013 	bne	101874 <memcpy+0x70>
  101824:	e1a0e000 	mov	lr, r0
  101828:	e4913004 	ldr	r3, [r1], #4
  10182c:	e24cc010 	sub	ip, ip, #16	; 0x10
  101830:	e48e3004 	str	r3, [lr], #4
  101834:	e4912004 	ldr	r2, [r1], #4
  101838:	e35c000f 	cmp	ip, #15	; 0xf
  10183c:	e48e2004 	str	r2, [lr], #4
  101840:	e4913004 	ldr	r3, [r1], #4
  101844:	e48e3004 	str	r3, [lr], #4
  101848:	e4912004 	ldr	r2, [r1], #4
  10184c:	e48e2004 	str	r2, [lr], #4
  101850:	8afffff4 	bhi	101828 <memcpy+0x24>
  101854:	e35c0003 	cmp	ip, #3	; 0x3
  101858:	9a000004 	bls	101870 <memcpy+0x6c>
  10185c:	e4913004 	ldr	r3, [r1], #4
  101860:	e24cc004 	sub	ip, ip, #4	; 0x4
  101864:	e35c0003 	cmp	ip, #3	; 0x3
  101868:	e48e3004 	str	r3, [lr], #4
  10186c:	8afffffa 	bhi	10185c <memcpy+0x58>
  101870:	e1a0200e 	mov	r2, lr
  101874:	e25cc001 	subs	ip, ip, #1	; 0x1
  101878:	349df004 	ldrcc	pc, [sp], #4
  10187c:	e24cc001 	sub	ip, ip, #1	; 0x1
  101880:	e4d13001 	ldrb	r3, [r1], #1
  101884:	e37c0001 	cmn	ip, #1	; 0x1
  101888:	e4c23001 	strb	r3, [r2], #1
  10188c:	1afffffa 	bne	10187c <memcpy+0x78>
  101890:	e49df004 	ldr	pc, [sp], #4

00101894 <memset>:
  101894:	e3520003 	cmp	r2, #3	; 0x3
  101898:	e20110ff 	and	r1, r1, #255	; 0xff
  10189c:	e1a03000 	mov	r3, r0
  1018a0:	9a000001 	bls	1018ac <memset+0x18>
  1018a4:	e3100003 	tst	r0, #3	; 0x3
  1018a8:	0a000006 	beq	1018c8 <memset+0x34>
  1018ac:	e2522001 	subs	r2, r2, #1	; 0x1
  1018b0:	31a0f00e 	movcc	pc, lr
  1018b4:	e2422001 	sub	r2, r2, #1	; 0x1
  1018b8:	e3720001 	cmn	r2, #1	; 0x1
  1018bc:	e4c31001 	strb	r1, [r3], #1
  1018c0:	1afffffb 	bne	1018b4 <memset+0x20>
  1018c4:	e1a0f00e 	mov	pc, lr
  1018c8:	e181c401 	orr	ip, r1, r1, lsl #8
  1018cc:	e18cc80c 	orr	ip, ip, ip, lsl #16
  1018d0:	e352000f 	cmp	r2, #15	; 0xf
  1018d4:	9a000006 	bls	1018f4 <memset+0x60>
  1018d8:	e483c004 	str	ip, [r3], #4
  1018dc:	e483c004 	str	ip, [r3], #4
  1018e0:	e2422010 	sub	r2, r2, #16	; 0x10
  1018e4:	e483c004 	str	ip, [r3], #4
  1018e8:	e352000f 	cmp	r2, #15	; 0xf
  1018ec:	e483c004 	str	ip, [r3], #4
  1018f0:	8afffff8 	bhi	1018d8 <memset+0x44>
  1018f4:	e3520003 	cmp	r2, #3	; 0x3
  1018f8:	9affffeb 	bls	1018ac <memset+0x18>
  1018fc:	e2422004 	sub	r2, r2, #4	; 0x4
  101900:	e3520003 	cmp	r2, #3	; 0x3
  101904:	e483c004 	str	ip, [r3], #4
  101908:	eafffffa 	b	1018f8 <memset+0x64>

0010190c <__malloc_lock>:
  10190c:	e1a0f00e 	mov	pc, lr

00101910 <__malloc_unlock>:
  101910:	e1a0f00e 	mov	pc, lr

00101914 <strncpy>:
  101914:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  101918:	e1a0e001 	mov	lr, r1
  10191c:	e1811000 	orr	r1, r1, r0
  101920:	e3110003 	tst	r1, #3	; 0x3
  101924:	13a03000 	movne	r3, #0	; 0x0
  101928:	03a03001 	moveq	r3, #1	; 0x1
  10192c:	e3520003 	cmp	r2, #3	; 0x3
  101930:	93a03000 	movls	r3, #0	; 0x0
  101934:	82033001 	andhi	r3, r3, #1	; 0x1
  101938:	e3530000 	cmp	r3, #0	; 0x0
  10193c:	e1a0c002 	mov	ip, r2
  101940:	e1a05000 	mov	r5, r0
  101944:	e1a02000 	mov	r2, r0
  101948:	0a00001a 	beq	1019b8 <strncpy+0xa4>
  10194c:	e35c0003 	cmp	ip, #3	; 0x3
  101950:	e1a04000 	mov	r4, r0
  101954:	e1a0000e 	mov	r0, lr
  101958:	9a000014 	bls	1019b0 <strncpy+0x9c>
  10195c:	e59e1000 	ldr	r1, [lr]
  101960:	e59f3090 	ldr	r3, [pc, #144]	; 1019f8 <prog+0x9b4>
  101964:	e59f2090 	ldr	r2, [pc, #144]	; 1019fc <prog+0x9b8>
  101968:	e0813003 	add	r3, r1, r3
  10196c:	e1c33001 	bic	r3, r3, r1
  101970:	e0032002 	and	r2, r3, r2
  101974:	e3520000 	cmp	r2, #0	; 0x0
  101978:	1a00000c 	bne	1019b0 <strncpy+0x9c>
  10197c:	e24cc004 	sub	ip, ip, #4	; 0x4
  101980:	e35c0003 	cmp	ip, #3	; 0x3
  101984:	e59f306c 	ldr	r3, [pc, #108]	; 1019f8 <prog+0x9b4>
  101988:	e59f206c 	ldr	r2, [pc, #108]	; 1019fc <prog+0x9b8>
  10198c:	e4841004 	str	r1, [r4], #4
  101990:	e2800004 	add	r0, r0, #4	; 0x4
  101994:	9a000005 	bls	1019b0 <strncpy+0x9c>
  101998:	e5901000 	ldr	r1, [r0]
  10199c:	e0813003 	add	r3, r1, r3
  1019a0:	e1c33001 	bic	r3, r3, r1
  1019a4:	e0032002 	and	r2, r3, r2
  1019a8:	e3520000 	cmp	r2, #0	; 0x0
  1019ac:	0afffff2 	beq	10197c <strncpy+0x68>
  1019b0:	e1a02004 	mov	r2, r4
  1019b4:	e1a0e000 	mov	lr, r0
  1019b8:	e35c0000 	cmp	ip, #0	; 0x0
  1019bc:	0a000004 	beq	1019d4 <strncpy+0xc0>
  1019c0:	e4de3001 	ldrb	r3, [lr], #1
  1019c4:	e24cc001 	sub	ip, ip, #1	; 0x1
  1019c8:	e3530000 	cmp	r3, #0	; 0x0
  1019cc:	e4c23001 	strb	r3, [r2], #1
  1019d0:	1afffff8 	bne	1019b8 <strncpy+0xa4>
  1019d4:	e25cc001 	subs	ip, ip, #1	; 0x1
  1019d8:	3a000004 	bcc	1019f0 <strncpy+0xdc>
  1019dc:	e3a03000 	mov	r3, #0	; 0x0
  1019e0:	e24cc001 	sub	ip, ip, #1	; 0x1
  1019e4:	e37c0001 	cmn	ip, #1	; 0x1
  1019e8:	e4c23001 	strb	r3, [r2], #1
  1019ec:	1afffffb 	bne	1019e0 <strncpy+0xcc>
  1019f0:	e1a00005 	mov	r0, r5
  1019f4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1019f8:	fefefeff 	mrc2	14, 7, pc, cr14, cr15, {7}
  1019fc:	80808080 	addhi	r8, r0, r0, lsl #1

00101a00 <_malloc_trim_r>:
  101a00:	e1a0c00d 	mov	ip, sp
  101a04:	e92dd8f0 	stmdb	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
  101a08:	e59f70e8 	ldr	r7, [pc, #232]	; 101af8 <prog+0xab4>
  101a0c:	e24cb004 	sub	fp, ip, #4	; 0x4
  101a10:	e1a04001 	mov	r4, r1
  101a14:	e1a05000 	mov	r5, r0
  101a18:	ebffffbb 	bl	10190c <__malloc_lock>
  101a1c:	e5973008 	ldr	r3, [r7, #8]
  101a20:	e3a01000 	mov	r1, #0	; 0x0
  101a24:	e5932004 	ldr	r2, [r3, #4]
  101a28:	e1a00005 	mov	r0, r5
  101a2c:	e3c26003 	bic	r6, r2, #3	; 0x3
  101a30:	e0644006 	rsb	r4, r4, r6
  101a34:	e2844efe 	add	r4, r4, #4064	; 0xfe0
  101a38:	e284400f 	add	r4, r4, #15	; 0xf
  101a3c:	e3c44eff 	bic	r4, r4, #4080	; 0xff0
  101a40:	e3c4400f 	bic	r4, r4, #15	; 0xf
  101a44:	e2444a01 	sub	r4, r4, #4096	; 0x1000
  101a48:	e3540a01 	cmp	r4, #4096	; 0x1000
  101a4c:	ba000006 	blt	101a6c <_malloc_trim_r+0x6c>
  101a50:	eb0003ff 	bl	102a54 <_sbrk_r>
  101a54:	e5973008 	ldr	r3, [r7, #8]
  101a58:	e2641000 	rsb	r1, r4, #0	; 0x0
  101a5c:	e0833006 	add	r3, r3, r6
  101a60:	e1530000 	cmp	r3, r0
  101a64:	e1a00005 	mov	r0, r5
  101a68:	0a000002 	beq	101a78 <_malloc_trim_r+0x78>
  101a6c:	ebffffa7 	bl	101910 <__malloc_unlock>
  101a70:	e3a00000 	mov	r0, #0	; 0x0
  101a74:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  101a78:	eb0003f5 	bl	102a54 <_sbrk_r>
  101a7c:	e0643006 	rsb	r3, r4, r6
  101a80:	e3700001 	cmn	r0, #1	; 0x1
  101a84:	e3a01000 	mov	r1, #0	; 0x0
  101a88:	e59fe06c 	ldr	lr, [pc, #108]	; 101afc <prog+0xab8>
  101a8c:	e383c001 	orr	ip, r3, #1	; 0x1
  101a90:	e1a00005 	mov	r0, r5
  101a94:	0a000008 	beq	101abc <_malloc_trim_r+0xbc>
  101a98:	e59e3000 	ldr	r3, [lr]
  101a9c:	e5972008 	ldr	r2, [r7, #8]
  101aa0:	e0643003 	rsb	r3, r4, r3
  101aa4:	e1a00005 	mov	r0, r5
  101aa8:	e582c004 	str	ip, [r2, #4]
  101aac:	e58e3000 	str	r3, [lr]
  101ab0:	ebffff96 	bl	101910 <__malloc_unlock>
  101ab4:	e3a00001 	mov	r0, #1	; 0x1
  101ab8:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  101abc:	eb0003e4 	bl	102a54 <_sbrk_r>
  101ac0:	e5971008 	ldr	r1, [r7, #8]
  101ac4:	e1a0c000 	mov	ip, r0
  101ac8:	e061600c 	rsb	r6, r1, ip
  101acc:	e356000f 	cmp	r6, #15	; 0xf
  101ad0:	e1a00005 	mov	r0, r5
  101ad4:	e3864001 	orr	r4, r6, #1	; 0x1
  101ad8:	daffffe3 	ble	101a6c <_malloc_trim_r+0x6c>
  101adc:	e59f301c 	ldr	r3, [pc, #28]	; 101b00 <prog+0xabc>
  101ae0:	e5814004 	str	r4, [r1, #4]
  101ae4:	e5932000 	ldr	r2, [r3]
  101ae8:	e59f300c 	ldr	r3, [pc, #12]	; 101afc <prog+0xab8>
  101aec:	e062200c 	rsb	r2, r2, ip
  101af0:	e5832000 	str	r2, [r3]
  101af4:	eaffffdc 	b	101a6c <_malloc_trim_r+0x6c>
  101af8:	00200028 	eoreq	r0, r0, r8, lsr #32
  101afc:	002009a8 	eoreq	r0, r0, r8, lsr #19
  101b00:	00200020 	eoreq	r0, r0, r0, lsr #32

00101b04 <_free_r>:
  101b04:	e1a0c00d 	mov	ip, sp
  101b08:	e92ddff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
  101b0c:	e2515000 	subs	r5, r1, #0	; 0x0
  101b10:	e24cb004 	sub	fp, ip, #4	; 0x4
  101b14:	e1a09000 	mov	r9, r0
  101b18:	089daff0 	ldmeqia	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  101b1c:	e2457008 	sub	r7, r5, #8	; 0x8
  101b20:	ebffff79 	bl	10190c <__malloc_lock>
  101b24:	e5971004 	ldr	r1, [r7, #4]
  101b28:	e59fa1f4 	ldr	sl, [pc, #500]	; 101d24 <prog+0xce0>
  101b2c:	e3c14001 	bic	r4, r1, #1	; 0x1
  101b30:	e087c004 	add	ip, r7, r4
  101b34:	e59a3008 	ldr	r3, [sl, #8]
  101b38:	e59c2004 	ldr	r2, [ip, #4]
  101b3c:	e153000c 	cmp	r3, ip
  101b40:	e3c26003 	bic	r6, r2, #3	; 0x3
  101b44:	0a000050 	beq	101c8c <_free_r+0x188>
  101b48:	e3110001 	tst	r1, #1	; 0x1
  101b4c:	e58c6004 	str	r6, [ip, #4]
  101b50:	e3a08000 	mov	r8, #0	; 0x0
  101b54:	0a000016 	beq	101bb4 <_free_r+0xb0>
  101b58:	e08c3006 	add	r3, ip, r6
  101b5c:	e5932004 	ldr	r2, [r3, #4]
  101b60:	e3120001 	tst	r2, #1	; 0x1
  101b64:	1a00000a 	bne	101b94 <_free_r+0x90>
  101b68:	e3580000 	cmp	r8, #0	; 0x0
  101b6c:	e0844006 	add	r4, r4, r6
  101b70:	159c2008 	ldrne	r2, [ip, #8]
  101b74:	1a000003 	bne	101b88 <_free_r+0x84>
  101b78:	e59c2008 	ldr	r2, [ip, #8]
  101b7c:	e59f31a4 	ldr	r3, [pc, #420]	; 101d28 <prog+0xce4>
  101b80:	e1520003 	cmp	r2, r3
  101b84:	0a000060 	beq	101d0c <_free_r+0x208>
  101b88:	e59ce00c 	ldr	lr, [ip, #12]
  101b8c:	e58e2008 	str	r2, [lr, #8]
  101b90:	e582e00c 	str	lr, [r2, #12]
  101b94:	e3843001 	orr	r3, r4, #1	; 0x1
  101b98:	e3580000 	cmp	r8, #0	; 0x0
  101b9c:	e5873004 	str	r3, [r7, #4]
  101ba0:	e7874004 	str	r4, [r7, r4]
  101ba4:	0a00000e 	beq	101be4 <_free_r+0xe0>
  101ba8:	e1a00009 	mov	r0, r9
  101bac:	e89d6ff0 	ldmia	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
  101bb0:	eaffff56 	b	101910 <__malloc_unlock>
  101bb4:	e5151008 	ldr	r1, [r5, #-8]
  101bb8:	e28a3008 	add	r3, sl, #8	; 0x8
  101bbc:	e0617007 	rsb	r7, r1, r7
  101bc0:	e5972008 	ldr	r2, [r7, #8]
  101bc4:	e0844001 	add	r4, r4, r1
  101bc8:	e1520003 	cmp	r2, r3
  101bcc:	1597e00c 	ldrne	lr, [r7, #12]
  101bd0:	11a00002 	movne	r0, r2
  101bd4:	02888001 	addeq	r8, r8, #1	; 0x1
  101bd8:	158e0008 	strne	r0, [lr, #8]
  101bdc:	1580e00c 	strne	lr, [r0, #12]
  101be0:	eaffffdc 	b	101b58 <_free_r+0x54>
  101be4:	e3540c02 	cmp	r4, #512	; 0x200
  101be8:	31a011a4 	movcc	r1, r4, lsr #3
  101bec:	308ae181 	addcc	lr, sl, r1, lsl #3
  101bf0:	359a3004 	ldrcc	r3, [sl, #4]
  101bf4:	359e0008 	ldrcc	r0, [lr, #8]
  101bf8:	3a00003a 	bcc	101ce8 <_free_r+0x1e4>
  101bfc:	e1b014a4 	movs	r1, r4, lsr #9
  101c00:	01a011a4 	moveq	r1, r4, lsr #3
  101c04:	0a000013 	beq	101c58 <_free_r+0x154>
  101c08:	e3510004 	cmp	r1, #4	; 0x4
  101c0c:	91a03324 	movls	r3, r4, lsr #6
  101c10:	92831038 	addls	r1, r3, #56	; 0x38
  101c14:	9a00000f 	bls	101c58 <_free_r+0x154>
  101c18:	e3510014 	cmp	r1, #20	; 0x14
  101c1c:	9281105b 	addls	r1, r1, #91	; 0x5b
  101c20:	9a00000c 	bls	101c58 <_free_r+0x154>
  101c24:	e3510054 	cmp	r1, #84	; 0x54
  101c28:	91a03624 	movls	r3, r4, lsr #12
  101c2c:	9283106e 	addls	r1, r3, #110	; 0x6e
  101c30:	9a000008 	bls	101c58 <_free_r+0x154>
  101c34:	e3510f55 	cmp	r1, #340	; 0x154
  101c38:	91a037a4 	movls	r3, r4, lsr #15
  101c3c:	92831077 	addls	r1, r3, #119	; 0x77
  101c40:	9a000004 	bls	101c58 <_free_r+0x154>
  101c44:	e59f30e0 	ldr	r3, [pc, #224]	; 101d2c <prog+0xce8>
  101c48:	e1510003 	cmp	r1, r3
  101c4c:	91a03924 	movls	r3, r4, lsr #18
  101c50:	9283107c 	addls	r1, r3, #124	; 0x7c
  101c54:	83a0107e 	movhi	r1, #126	; 0x7e
  101c58:	e08ae181 	add	lr, sl, r1, lsl #3
  101c5c:	e59e0008 	ldr	r0, [lr, #8]
  101c60:	e150000e 	cmp	r0, lr
  101c64:	0a00001e 	beq	101ce4 <_free_r+0x1e0>
  101c68:	e5903004 	ldr	r3, [r0, #4]
  101c6c:	e3c33003 	bic	r3, r3, #3	; 0x3
  101c70:	e1530004 	cmp	r3, r4
  101c74:	9a000002 	bls	101c84 <_free_r+0x180>
  101c78:	e5900008 	ldr	r0, [r0, #8]
  101c7c:	e150000e 	cmp	r0, lr
  101c80:	1afffff8 	bne	101c68 <_free_r+0x164>
  101c84:	e590e00c 	ldr	lr, [r0, #12]
  101c88:	ea00001a 	b	101cf8 <_free_r+0x1f4>
  101c8c:	e3110001 	tst	r1, #1	; 0x1
  101c90:	e0844006 	add	r4, r4, r6
  101c94:	1a000006 	bne	101cb4 <_free_r+0x1b0>
  101c98:	e5151008 	ldr	r1, [r5, #-8]
  101c9c:	e0617007 	rsb	r7, r1, r7
  101ca0:	e597e00c 	ldr	lr, [r7, #12]
  101ca4:	e5970008 	ldr	r0, [r7, #8]
  101ca8:	e0844001 	add	r4, r4, r1
  101cac:	e58e0008 	str	r0, [lr, #8]
  101cb0:	e580e00c 	str	lr, [r0, #12]
  101cb4:	e59f2074 	ldr	r2, [pc, #116]	; 101d30 <prog+0xcec>
  101cb8:	e3843001 	orr	r3, r4, #1	; 0x1
  101cbc:	e5921000 	ldr	r1, [r2]
  101cc0:	e58a7008 	str	r7, [sl, #8]
  101cc4:	e1540001 	cmp	r4, r1
  101cc8:	e5873004 	str	r3, [r7, #4]
  101ccc:	3affffb5 	bcc	101ba8 <_free_r+0xa4>
  101cd0:	e59f305c 	ldr	r3, [pc, #92]	; 101d34 <prog+0xcf0>
  101cd4:	e1a00009 	mov	r0, r9
  101cd8:	e5931000 	ldr	r1, [r3]
  101cdc:	ebffff47 	bl	101a00 <_malloc_trim_r>
  101ce0:	eaffffb0 	b	101ba8 <_free_r+0xa4>
  101ce4:	e59a3004 	ldr	r3, [sl, #4]
  101ce8:	e1a01121 	mov	r1, r1, lsr #2
  101cec:	e3a02001 	mov	r2, #1	; 0x1
  101cf0:	e1833112 	orr	r3, r3, r2, lsl r1
  101cf4:	e58a3004 	str	r3, [sl, #4]
  101cf8:	e587e00c 	str	lr, [r7, #12]
  101cfc:	e5870008 	str	r0, [r7, #8]
  101d00:	e580700c 	str	r7, [r0, #12]
  101d04:	e58e7008 	str	r7, [lr, #8]
  101d08:	eaffffa6 	b	101ba8 <_free_r+0xa4>
  101d0c:	e2888001 	add	r8, r8, #1	; 0x1
  101d10:	e582700c 	str	r7, [r2, #12]
  101d14:	e5827008 	str	r7, [r2, #8]
  101d18:	e587200c 	str	r2, [r7, #12]
  101d1c:	e5872008 	str	r2, [r7, #8]
  101d20:	eaffff9b 	b	101b94 <_free_r+0x90>
  101d24:	00200028 	eoreq	r0, r0, r8, lsr #32
  101d28:	00200030 	eoreq	r0, r0, r0, lsr r0
  101d2c:	00000554 	andeq	r0, r0, r4, asr r5
  101d30:	00200024 	eoreq	r0, r0, r4, lsr #32
  101d34:	002009d8 	ldreqd	r0, [r0], -r8

00101d38 <vResetEnv>:
  101d38:	e1a0c00d 	mov	ip, sp
  101d3c:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  101d40:	e59f4050 	ldr	r4, [pc, #80]	; 101d98 <prog+0xd54>
  101d44:	e24cb004 	sub	fp, ip, #4	; 0x4
  101d48:	e3a01000 	mov	r1, #0	; 0x0
  101d4c:	e1a00004 	mov	r0, r4
  101d50:	e3a02080 	mov	r2, #128	; 0x80
  101d54:	ebfffece 	bl	101894 <memset>
  101d58:	e59fc03c 	ldr	ip, [pc, #60]	; 101d9c <prog+0xd58>
  101d5c:	e3a01000 	mov	r1, #0	; 0x0
  101d60:	e3a0000f 	mov	r0, #15	; 0xf
  101d64:	e0c3219c 	smull	r2, r3, ip, r1
  101d68:	e1a02fc1 	mov	r2, r1, asr #31
  101d6c:	e0833001 	add	r3, r3, r1
  101d70:	e06221c3 	rsb	r2, r2, r3, asr #3
  101d74:	e2822e7d 	add	r2, r2, #2000	; 0x7d0
  101d78:	e1a03422 	mov	r3, r2, lsr #8
  101d7c:	e2500001 	subs	r0, r0, #1	; 0x1
  101d80:	e5c43011 	strb	r3, [r4, #17]
  101d84:	e5c42010 	strb	r2, [r4, #16]
  101d88:	e2811d7d 	add	r1, r1, #8000	; 0x1f40
  101d8c:	e2844002 	add	r4, r4, #2	; 0x2
  101d90:	5afffff3 	bpl	101d64 <vResetEnv+0x2c>
  101d94:	e89da810 	ldmia	sp, {r4, fp, sp, pc}
  101d98:	0020104c 	eoreq	r1, r0, ip, asr #32
  101d9c:	88888889 	stmhiia	r8, {r0, r3, r7, fp, pc}

00101da0 <vApplicationIdleHook>:
  101da0:	e3a0232a 	mov	r2, #-1476395008	; 0xa8000000
  101da4:	e3a034a5 	mov	r3, #-1526726656	; 0xa5000000
  101da8:	e1a02ac2 	mov	r2, r2, asr #21
  101dac:	e2833001 	add	r3, r3, #1	; 0x1
  101db0:	e5823000 	str	r3, [r2]
  101db4:	e1a0f00e 	mov	pc, lr

00101db8 <mainloop>:
  101db8:	e1a0c00d 	mov	ip, sp
  101dbc:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  101dc0:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
  101dc4:	e1a01003 	mov	r1, r3
  101dc8:	e24cb004 	sub	fp, ip, #4	; 0x4
  101dcc:	e24dd008 	sub	sp, sp, #8	; 0x8
  101dd0:	e1a039c3 	mov	r3, r3, asr #19
  101dd4:	e1a01ac1 	mov	r1, r1, asr #21
  101dd8:	e3a0200c 	mov	r2, #12	; 0xc
  101ddc:	e3a04000 	mov	r4, #0	; 0x0
  101de0:	e5834130 	str	r4, [r3, #304]
  101de4:	e5812010 	str	r2, [r1, #16]
  101de8:	eb00032b 	bl	102a9c <led_init>
  101dec:	eb0003ab 	bl	102ca0 <env_init>
  101df0:	eb000374 	bl	102bc8 <env_load>
  101df4:	e1500004 	cmp	r0, r4
  101df8:	0a000013 	beq	101e4c <mainloop+0x94>
  101dfc:	e59f1058 	ldr	r1, [pc, #88]	; 101e5c <prog+0xe18>
  101e00:	e5d12035 	ldrb	r2, [r1, #53]
  101e04:	e5d13034 	ldrb	r3, [r1, #52]
  101e08:	e1833402 	orr	r3, r3, r2, lsl #8
  101e0c:	e3530ffa 	cmp	r3, #1000	; 0x3e8
  101e10:	85c14035 	strhib	r4, [r1, #53]
  101e14:	85c14034 	strhib	r4, [r1, #52]
  101e18:	e3a0c002 	mov	ip, #2	; 0x2
  101e1c:	e1a03004 	mov	r3, r4
  101e20:	e59f1038 	ldr	r1, [pc, #56]	; 101e60 <prog+0xe1c>
  101e24:	e3a02c02 	mov	r2, #512	; 0x200
  101e28:	e59f0034 	ldr	r0, [pc, #52]	; 101e64 <prog+0xe20>
  101e2c:	e58dc000 	str	ip, [sp]
  101e30:	e58d4004 	str	r4, [sp, #4]
  101e34:	eb00083b 	bl	103f28 <xTaskCreate>
  101e38:	eb0002a8 	bl	1028e0 <vUSBShellInit>
  101e3c:	e3a00001 	mov	r0, #1	; 0x1
  101e40:	eb00030d 	bl	102a7c <led_set_green>
  101e44:	eb0008c5 	bl	104160 <vTaskStartScheduler>
  101e48:	eafffffe 	b	101e48 <mainloop+0x90>
  101e4c:	e59f0014 	ldr	r0, [pc, #20]	; 101e68 <prog+0xe24>
  101e50:	eb0002e5 	bl	1029ec <DumpStringToUSB>
  101e54:	ebffffb7 	bl	101d38 <vResetEnv>
  101e58:	eaffffe7 	b	101dfc <mainloop+0x44>
  101e5c:	0020104c 	eoreq	r1, r0, ip, asr #32
  101e60:	00105594 	muleqs	r0, r4, r5
  101e64:	00104908 	andeqs	r4, r0, r8, lsl #18
  101e68:	00105598 	muleqs	r0, r8, r5

00101e6c <PtUpdateWmcuId>:
  101e6c:	e1a0c00d 	mov	ip, sp
  101e70:	e59f3034 	ldr	r3, [pc, #52]	; 101eac <prog+0xe68>
  101e74:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  101e78:	e20040ff 	and	r4, r0, #255	; 0xff
  101e7c:	e5c34004 	strb	r4, [r3, #4]
  101e80:	e1a00003 	mov	r0, r3
  101e84:	e24cb004 	sub	fp, ip, #4	; 0x4
  101e88:	e3a01005 	mov	r1, #5	; 0x5
  101e8c:	eb0003a6 	bl	102d2c <nRFAPI_SetTxMAC>
  101e90:	e59f3018 	ldr	r3, [pc, #24]	; 101eb0 <prog+0xe6c>
  101e94:	e3a01005 	mov	r1, #5	; 0x5
  101e98:	e1a00003 	mov	r0, r3
  101e9c:	e3a02001 	mov	r2, #1	; 0x1
  101ea0:	e5c34004 	strb	r4, [r3, #4]
  101ea4:	e89d6810 	ldmia	sp, {r4, fp, sp, lr}
  101ea8:	ea000381 	b	102cb4 <nRFAPI_SetRxMAC>
  101eac:	00200851 	eoreq	r0, r0, r1, asr r8
  101eb0:	0020084c 	eoreq	r0, r0, ip, asr #16

00101eb4 <PtInitNrfFrontend>:
  101eb4:	e59f3004 	ldr	r3, [pc, #4]	; 101ec0 <prog+0xe7c>
  101eb8:	e5830000 	str	r0, [r3]
  101ebc:	e1a0f00e 	mov	pc, lr
  101ec0:	00200848 	eoreq	r0, r0, r8, asr #16

00101ec4 <PtDumpNrfRegisters>:
  101ec4:	e59f3008 	ldr	r3, [pc, #8]	; 101ed4 <prog+0xe90>
  101ec8:	e3a02001 	mov	r2, #1	; 0x1
  101ecc:	e5832000 	str	r2, [r3]
  101ed0:	e1a0f00e 	mov	pc, lr
  101ed4:	00200844 	eoreq	r0, r0, r4, asr #16

00101ed8 <vGetDimmerJitterUS>:
  101ed8:	e59f303c 	ldr	r3, [pc, #60]	; 101f1c <prog+0xed8>
  101edc:	e5d31031 	ldrb	r1, [r3, #49]
  101ee0:	e5d32030 	ldrb	r2, [r3, #48]
  101ee4:	e5d3c032 	ldrb	ip, [r3, #50]
  101ee8:	e5d30033 	ldrb	r0, [r3, #51]
  101eec:	e1822401 	orr	r2, r2, r1, lsl #8
  101ef0:	e182280c 	orr	r2, r2, ip, lsl #16
  101ef4:	e1822c00 	orr	r2, r2, r0, lsl #24
  101ef8:	e0623282 	rsb	r3, r2, r2, lsl #5
  101efc:	e0633303 	rsb	r3, r3, r3, lsl #6
  101f00:	e0822183 	add	r2, r2, r3, lsl #3
  101f04:	e59f3014 	ldr	r3, [pc, #20]	; 101f20 <prog+0xedc>
  101f08:	e1a02302 	mov	r2, r2, lsl #6
  101f0c:	e0801293 	umull	r1, r0, r3, r2
  101f10:	e1a00aa0 	mov	r0, r0, lsr #21
  101f14:	e20000ff 	and	r0, r0, #255	; 0xff
  101f18:	e1a0f00e 	mov	pc, lr
  101f1c:	0020104c 	eoreq	r1, r0, ip, asr #32
  101f20:	599f338d 	ldmplib	pc, {r0, r2, r3, r7, r8, r9, ip, sp}

00101f24 <vUpdateDimmer>:
  101f24:	e350000f 	cmp	r0, #15	; 0xf
  101f28:	c3a0000f 	movgt	r0, #15	; 0xf
  101f2c:	ca000001 	bgt	101f38 <vUpdateDimmer+0x14>
  101f30:	e3500000 	cmp	r0, #0	; 0x0
  101f34:	b3a00000 	movlt	r0, #0	; 0x0
  101f38:	e59f3004 	ldr	r3, [pc, #4]	; 101f44 <prog+0xf00>
  101f3c:	e5830000 	str	r0, [r3]
  101f40:	e1a0f00e 	mov	pc, lr
  101f44:	002009e0 	eoreq	r0, r0, r0, ror #19

00101f48 <vGetDimmerStep>:
  101f48:	e59f3004 	ldr	r3, [pc, #4]	; 101f54 <prog+0xf10>
  101f4c:	e5930000 	ldr	r0, [r3]
  101f50:	e1a0f00e 	mov	pc, lr
  101f54:	002009e0 	eoreq	r0, r0, r0, ror #19

00101f58 <vGetEmiPulses>:
  101f58:	e59f3004 	ldr	r3, [pc, #4]	; 101f64 <prog+0xf20>
  101f5c:	e5930000 	ldr	r0, [r3]
  101f60:	e1a0f00e 	mov	pc, lr
  101f64:	002009e4 	eoreq	r0, r0, r4, ror #19

00101f68 <vGetDimmerOff>:
  101f68:	e59f3004 	ldr	r3, [pc, #4]	; 101f74 <prog+0xf30>
  101f6c:	e5930000 	ldr	r0, [r3]
  101f70:	e1a0f00e 	mov	pc, lr
  101f74:	00200858 	eoreq	r0, r0, r8, asr r8

00101f78 <DeviceRevertToUpdateMode>:
  101f78:	e1a0c00d 	mov	ip, sp
  101f7c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  101f80:	e59f0054 	ldr	r0, [pc, #84]	; 101fdc <prog+0xf98>
  101f84:	e24cb004 	sub	fp, ip, #4	; 0x4
  101f88:	eb000297 	bl	1029ec <DumpStringToUSB>
  101f8c:	e3a00f7d 	mov	r0, #500	; 0x1f4
  101f90:	eb0006dc 	bl	103b08 <vTaskDelay>
  101f94:	eb0005f1 	bl	103760 <vTaskSuspendAll>
  101f98:	eb000954 	bl	1044f0 <vPortEnterCritical>
  101f9c:	e3a00001 	mov	r0, #1	; 0x1
  101fa0:	eb0002b5 	bl	102a7c <led_set_green>
  101fa4:	e59f1034 	ldr	r1, [pc, #52]	; 101fe0 <prog+0xf9c>
  101fa8:	e3a02080 	mov	r2, #128	; 0x80
  101fac:	e59f0030 	ldr	r0, [pc, #48]	; 101fe4 <prog+0xfa0>
  101fb0:	ebfffe13 	bl	101804 <memcpy>
  101fb4:	e59f102c 	ldr	r1, [pc, #44]	; 101fe8 <prog+0xfa4>
  101fb8:	e59f202c 	ldr	r2, [pc, #44]	; 101fec <prog+0xfa8>
  101fbc:	e59f0020 	ldr	r0, [pc, #32]	; 101fe4 <prog+0xfa0>
  101fc0:	e0612002 	rsb	r2, r1, r2
  101fc4:	ebfffe0e 	bl	101804 <memcpy>
  101fc8:	e59f0010 	ldr	r0, [pc, #16]	; 101fe0 <prog+0xf9c>
  101fcc:	e59f301c 	ldr	r3, [pc, #28]	; 101ff0 <prog+0xfac>
  101fd0:	e1a0e00f 	mov	lr, pc
  101fd4:	e1a0f003 	mov	pc, r3
  101fd8:	eafffffe 	b	101fd8 <DeviceRevertToUpdateMode+0x60>
  101fdc:	001055cc 	andeqs	r5, r0, ip, asr #11
  101fe0:	00100000 	andeqs	r0, r0, r0
  101fe4:	0020104c 	eoreq	r1, r0, ip, asr #32
  101fe8:	00200000 	eoreq	r0, r0, r0
  101fec:	00200020 	eoreq	r0, r0, r0, lsr #32
  101ff0:	00200924 	eoreq	r0, r0, r4, lsr #18

00101ff4 <cmd_status>:
  101ff4:	e1a0c00d 	mov	ip, sp
  101ff8:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  101ffc:	e59f01b4 	ldr	r0, [pc, #436]	; 1021b8 <prog+0x1174>
  102000:	e24cb004 	sub	fp, ip, #4	; 0x4
  102004:	e59f41b0 	ldr	r4, [pc, #432]	; 1021bc <prog+0x1178>
  102008:	eb000277 	bl	1029ec <DumpStringToUSB>
  10200c:	e59f01ac 	ldr	r0, [pc, #428]	; 1021c0 <prog+0x117c>
  102010:	eb000275 	bl	1029ec <DumpStringToUSB>
  102014:	e5d4300c 	ldrb	r3, [r4, #12]
  102018:	e5d4000d 	ldrb	r0, [r4, #13]
  10201c:	e3a01002 	mov	r1, #2	; 0x2
  102020:	e1830400 	orr	r0, r3, r0, lsl #8
  102024:	eb00025e 	bl	1029a4 <DumpHexToUSB>
  102028:	e59f0194 	ldr	r0, [pc, #404]	; 1021c4 <prog+0x1180>
  10202c:	eb00026e 	bl	1029ec <DumpStringToUSB>
  102030:	e59f0190 	ldr	r0, [pc, #400]	; 1021c8 <prog+0x1184>
  102034:	eb00026c 	bl	1029ec <DumpStringToUSB>
  102038:	e5d4000e 	ldrb	r0, [r4, #14]
  10203c:	eb000237 	bl	102920 <DumpUIntToUSB>
  102040:	e59f017c 	ldr	r0, [pc, #380]	; 1021c4 <prog+0x1180>
  102044:	eb000268 	bl	1029ec <DumpStringToUSB>
  102048:	e59f017c 	ldr	r0, [pc, #380]	; 1021cc <prog+0x1188>
  10204c:	eb000266 	bl	1029ec <DumpStringToUSB>
  102050:	e5d4000f 	ldrb	r0, [r4, #15]
  102054:	eb000231 	bl	102920 <DumpUIntToUSB>
  102058:	e59f0164 	ldr	r0, [pc, #356]	; 1021c4 <prog+0x1180>
  10205c:	eb000262 	bl	1029ec <DumpStringToUSB>
  102060:	e59f0168 	ldr	r0, [pc, #360]	; 1021d0 <prog+0x118c>
  102064:	eb000260 	bl	1029ec <DumpStringToUSB>
  102068:	ebffffb6 	bl	101f48 <vGetDimmerStep>
  10206c:	eb00022b 	bl	102920 <DumpUIntToUSB>
  102070:	e59f014c 	ldr	r0, [pc, #332]	; 1021c4 <prog+0x1180>
  102074:	eb00025c 	bl	1029ec <DumpStringToUSB>
  102078:	ebffffba 	bl	101f68 <vGetDimmerOff>
  10207c:	e3500000 	cmp	r0, #0	; 0x0
  102080:	159f014c 	ldrne	r0, [pc, #332]	; 1021d4 <prog+0x1190>
  102084:	059f014c 	ldreq	r0, [pc, #332]	; 1021d8 <prog+0x1194>
  102088:	eb000257 	bl	1029ec <DumpStringToUSB>
  10208c:	e59f0148 	ldr	r0, [pc, #328]	; 1021dc <prog+0x1198>
  102090:	eb000255 	bl	1029ec <DumpStringToUSB>
  102094:	ebffff8f 	bl	101ed8 <vGetDimmerJitterUS>
  102098:	e20000ff 	and	r0, r0, #255	; 0xff
  10209c:	eb00021f 	bl	102920 <DumpUIntToUSB>
  1020a0:	e59f011c 	ldr	r0, [pc, #284]	; 1021c4 <prog+0x1180>
  1020a4:	eb000250 	bl	1029ec <DumpStringToUSB>
  1020a8:	e59f0130 	ldr	r0, [pc, #304]	; 1021e0 <prog+0x119c>
  1020ac:	eb00024e 	bl	1029ec <DumpStringToUSB>
  1020b0:	ebffffa8 	bl	101f58 <vGetEmiPulses>
  1020b4:	eb000219 	bl	102920 <DumpUIntToUSB>
  1020b8:	e59f0104 	ldr	r0, [pc, #260]	; 1021c4 <prog+0x1180>
  1020bc:	eb00024a 	bl	1029ec <DumpStringToUSB>
  1020c0:	e59f011c 	ldr	r0, [pc, #284]	; 1021e4 <prog+0x11a0>
  1020c4:	eb000248 	bl	1029ec <DumpStringToUSB>
  1020c8:	e59f3118 	ldr	r3, [pc, #280]	; 1021e8 <prog+0x11a4>
  1020cc:	e5930000 	ldr	r0, [r3]
  1020d0:	eb000212 	bl	102920 <DumpUIntToUSB>
  1020d4:	e59f00e8 	ldr	r0, [pc, #232]	; 1021c4 <prog+0x1180>
  1020d8:	eb000243 	bl	1029ec <DumpStringToUSB>
  1020dc:	e59f0108 	ldr	r0, [pc, #264]	; 1021ec <prog+0x11a8>
  1020e0:	eb000241 	bl	1029ec <DumpStringToUSB>
  1020e4:	e59f3104 	ldr	r3, [pc, #260]	; 1021f0 <prog+0x11ac>
  1020e8:	e5930000 	ldr	r0, [r3]
  1020ec:	eb00020b 	bl	102920 <DumpUIntToUSB>
  1020f0:	e59f00cc 	ldr	r0, [pc, #204]	; 1021c4 <prog+0x1180>
  1020f4:	eb00023c 	bl	1029ec <DumpStringToUSB>
  1020f8:	e59f00f4 	ldr	r0, [pc, #244]	; 1021f4 <prog+0x11b0>
  1020fc:	eb00023a 	bl	1029ec <DumpStringToUSB>
  102100:	e59f30f0 	ldr	r3, [pc, #240]	; 1021f8 <prog+0x11b4>
  102104:	e5930000 	ldr	r0, [r3]
  102108:	eb000204 	bl	102920 <DumpUIntToUSB>
  10210c:	e59f00e8 	ldr	r0, [pc, #232]	; 1021fc <prog+0x11b8>
  102110:	eb000235 	bl	1029ec <DumpStringToUSB>
  102114:	e59f30e4 	ldr	r3, [pc, #228]	; 102200 <prog+0x11bc>
  102118:	e5930000 	ldr	r0, [r3]
  10211c:	eb0001ff 	bl	102920 <DumpUIntToUSB>
  102120:	e59f009c 	ldr	r0, [pc, #156]	; 1021c4 <prog+0x1180>
  102124:	eb000230 	bl	1029ec <DumpStringToUSB>
  102128:	e59f00d4 	ldr	r0, [pc, #212]	; 102204 <prog+0x11c0>
  10212c:	eb00022e 	bl	1029ec <DumpStringToUSB>
  102130:	e5d43035 	ldrb	r3, [r4, #53]
  102134:	e5d40034 	ldrb	r0, [r4, #52]
  102138:	e1800403 	orr	r0, r0, r3, lsl #8
  10213c:	eb0001f7 	bl	102920 <DumpUIntToUSB>
  102140:	e59f00c0 	ldr	r0, [pc, #192]	; 102208 <prog+0x11c4>
  102144:	eb000228 	bl	1029ec <DumpStringToUSB>
  102148:	e59f00bc 	ldr	r0, [pc, #188]	; 10220c <prog+0x11c8>
  10214c:	eb000226 	bl	1029ec <DumpStringToUSB>
  102150:	e59f5064 	ldr	r5, [pc, #100]	; 1021bc <prog+0x1178>
  102154:	e3a04000 	mov	r4, #0	; 0x0
  102158:	ea000001 	b	102164 <cmd_status+0x170>
  10215c:	e354000f 	cmp	r4, #15	; 0xf
  102160:	ca000011 	bgt	1021ac <cmd_status+0x1b8>
  102164:	e5d53010 	ldrb	r3, [r5, #16]
  102168:	e5d50011 	ldrb	r0, [r5, #17]
  10216c:	e1830400 	orr	r0, r3, r0, lsl #8
  102170:	eb0001ea 	bl	102920 <DumpUIntToUSB>
  102174:	e59f0094 	ldr	r0, [pc, #148]	; 102210 <prog+0x11cc>
  102178:	eb00021b 	bl	1029ec <DumpStringToUSB>
  10217c:	e1a03fc4 	mov	r3, r4, asr #31
  102180:	e0843ea3 	add	r3, r4, r3, lsr #29
  102184:	e3c33007 	bic	r3, r3, #7	; 0x7
  102188:	e0633004 	rsb	r3, r3, r4
  10218c:	e3530007 	cmp	r3, #7	; 0x7
  102190:	e2844001 	add	r4, r4, #1	; 0x1
  102194:	e2855002 	add	r5, r5, #2	; 0x2
  102198:	e59f0074 	ldr	r0, [pc, #116]	; 102214 <prog+0x11d0>
  10219c:	1affffee 	bne	10215c <cmd_status+0x168>
  1021a0:	eb000211 	bl	1029ec <DumpStringToUSB>
  1021a4:	e354000f 	cmp	r4, #15	; 0xf
  1021a8:	daffffed 	ble	102164 <cmd_status+0x170>
  1021ac:	e59f0010 	ldr	r0, [pc, #16]	; 1021c4 <prog+0x1180>
  1021b0:	e89d6830 	ldmia	sp, {r4, r5, fp, sp, lr}
  1021b4:	ea00020c 	b	1029ec <DumpStringToUSB>
  1021b8:	00105664 	andeqs	r5, r0, r4, ror #12
  1021bc:	0020104c 	eoreq	r1, r0, ip, asr #32
  1021c0:	00105688 	andeqs	r5, r0, r8, lsl #13
  1021c4:	00105a54 	andeqs	r5, r0, r4, asr sl
  1021c8:	00105694 	muleqs	r0, r4, r6
  1021cc:	001056a4 	andeqs	r5, r0, r4, lsr #13
  1021d0:	001056b4 	ldreqh	r5, [r0], -r4
  1021d4:	001056cc 	andeqs	r5, r0, ip, asr #13
  1021d8:	001056f0 	ldreqsh	r5, [r0], -r0
  1021dc:	0010570c 	andeqs	r5, r0, ip, lsl #14
  1021e0:	00105720 	andeqs	r5, r0, r0, lsr #14
  1021e4:	00105734 	andeqs	r5, r0, r4, lsr r7
  1021e8:	002009dc 	ldreqd	r0, [r0], -ip
  1021ec:	00105748 	andeqs	r5, r0, r8, asr #14
  1021f0:	0020083c 	eoreq	r0, r0, ip, lsr r8
  1021f4:	00105764 	andeqs	r5, r0, r4, ror #14
  1021f8:	00200838 	eoreq	r0, r0, r8, lsr r8
  1021fc:	00105778 	andeqs	r5, r0, r8, ror r7
  102200:	00200840 	eoreq	r0, r0, r0, asr #16
  102204:	00105780 	andeqs	r5, r0, r0, lsl #15
  102208:	00105794 	muleqs	r0, r4, r7
  10220c:	0010579c 	muleqs	r0, ip, r7
  102210:	001056a0 	andeqs	r5, r0, r0, lsr #13
  102214:	001057b0 	ldreqh	r5, [r0], -r0

00102218 <cmd_reset>:
  102218:	e1a0c00d 	mov	ip, sp
  10221c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  102220:	e24cb004 	sub	fp, ip, #4	; 0x4
  102224:	ebfffec3 	bl	101d38 <vResetEnv>
  102228:	e89d6800 	ldmia	sp, {fp, sp, lr}
  10222c:	ea00023a 	b	102b1c <env_store>

00102230 <cmd_help>:
  102230:	e1a0c00d 	mov	ip, sp
  102234:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  102238:	e59f0078 	ldr	r0, [pc, #120]	; 1022b8 <prog+0x1274>
  10223c:	e24cb004 	sub	fp, ip, #4	; 0x4
  102240:	eb0001e9 	bl	1029ec <DumpStringToUSB>
  102244:	e59f0070 	ldr	r0, [pc, #112]	; 1022bc <prog+0x1278>
  102248:	eb0001e7 	bl	1029ec <DumpStringToUSB>
  10224c:	e59f006c 	ldr	r0, [pc, #108]	; 1022c0 <prog+0x127c>
  102250:	eb0001e5 	bl	1029ec <DumpStringToUSB>
  102254:	e59f0068 	ldr	r0, [pc, #104]	; 1022c4 <prog+0x1280>
  102258:	eb0001e3 	bl	1029ec <DumpStringToUSB>
  10225c:	e59f0064 	ldr	r0, [pc, #100]	; 1022c8 <prog+0x1284>
  102260:	eb0001e1 	bl	1029ec <DumpStringToUSB>
  102264:	e59f0060 	ldr	r0, [pc, #96]	; 1022cc <prog+0x1288>
  102268:	eb0001df 	bl	1029ec <DumpStringToUSB>
  10226c:	e59f005c 	ldr	r0, [pc, #92]	; 1022d0 <prog+0x128c>
  102270:	eb0001dd 	bl	1029ec <DumpStringToUSB>
  102274:	e59f0058 	ldr	r0, [pc, #88]	; 1022d4 <prog+0x1290>
  102278:	eb0001db 	bl	1029ec <DumpStringToUSB>
  10227c:	e59f0054 	ldr	r0, [pc, #84]	; 1022d8 <prog+0x1294>
  102280:	eb0001d9 	bl	1029ec <DumpStringToUSB>
  102284:	e59f0050 	ldr	r0, [pc, #80]	; 1022dc <prog+0x1298>
  102288:	eb0001d7 	bl	1029ec <DumpStringToUSB>
  10228c:	e59f004c 	ldr	r0, [pc, #76]	; 1022e0 <prog+0x129c>
  102290:	eb0001d5 	bl	1029ec <DumpStringToUSB>
  102294:	e59f0048 	ldr	r0, [pc, #72]	; 1022e4 <prog+0x12a0>
  102298:	eb0001d3 	bl	1029ec <DumpStringToUSB>
  10229c:	e59f0044 	ldr	r0, [pc, #68]	; 1022e8 <prog+0x12a4>
  1022a0:	eb0001d1 	bl	1029ec <DumpStringToUSB>
  1022a4:	e59f0040 	ldr	r0, [pc, #64]	; 1022ec <prog+0x12a8>
  1022a8:	eb0001cf 	bl	1029ec <DumpStringToUSB>
  1022ac:	e59f003c 	ldr	r0, [pc, #60]	; 1022f0 <prog+0x12ac>
  1022b0:	e89d6800 	ldmia	sp, {fp, sp, lr}
  1022b4:	ea0001cc 	b	1029ec <DumpStringToUSB>
  1022b8:	001057b4 	ldreqh	r5, [r0], -r4
  1022bc:	001057d8 	ldreqsb	r5, [r0], -r8
  1022c0:	00105a54 	andeqs	r5, r0, r4, asr sl
  1022c4:	001057fc 	ldreqsh	r5, [r0], -ip
  1022c8:	00105828 	andeqs	r5, r0, r8, lsr #16
  1022cc:	00105864 	andeqs	r5, r0, r4, ror #16
  1022d0:	0010587c 	andeqs	r5, r0, ip, ror r8
  1022d4:	001058a8 	andeqs	r5, r0, r8, lsr #17
  1022d8:	001058dc 	ldreqsb	r5, [r0], -ip
  1022dc:	00105914 	andeqs	r5, r0, r4, lsl r9
  1022e0:	00105950 	andeqs	r5, r0, r0, asr r9
  1022e4:	00105984 	andeqs	r5, r0, r4, lsl #19
  1022e8:	001059b0 	ldreqh	r5, [r0], -r0
  1022ec:	001059e8 	andeqs	r5, r0, r8, ror #19
  1022f0:	00105a1c 	andeqs	r5, r0, ip, lsl sl

001022f4 <hex_to_int>:
  1022f4:	e52de004 	str	lr, [sp, #-4]!
  1022f8:	e5d02000 	ldrb	r2, [r0]
  1022fc:	e2421041 	sub	r1, r2, #65	; 0x41
  102300:	e20130ff 	and	r3, r1, #255	; 0xff
  102304:	e242e061 	sub	lr, r2, #97	; 0x61
  102308:	e3530005 	cmp	r3, #5	; 0x5
  10230c:	e20ec0ff 	and	ip, lr, #255	; 0xff
  102310:	95c01000 	strlsb	r1, [r0]
  102314:	9a00000b 	bls	102348 <hex_to_int+0x54>
  102318:	e2422030 	sub	r2, r2, #48	; 0x30
  10231c:	e35c0005 	cmp	ip, #5	; 0x5
  102320:	e20230ff 	and	r3, r2, #255	; 0xff
  102324:	9a000006 	bls	102344 <hex_to_int+0x50>
  102328:	e3530009 	cmp	r3, #9	; 0x9
  10232c:	e3e03000 	mvn	r3, #0	; 0x0
  102330:	8a000001 	bhi	10233c <hex_to_int+0x48>
  102334:	e5c02000 	strb	r2, [r0]
  102338:	e3a03000 	mov	r3, #0	; 0x0
  10233c:	e1a00003 	mov	r0, r3
  102340:	e49df004 	ldr	pc, [sp], #4
  102344:	e5c0e000 	strb	lr, [r0]
  102348:	e5d03000 	ldrb	r3, [r0]
  10234c:	e283300a 	add	r3, r3, #10	; 0xa
  102350:	e5c03000 	strb	r3, [r0]
  102354:	eafffff7 	b	102338 <hex_to_int+0x44>

00102358 <cmd_mac>:
  102358:	e1a0c00d 	mov	ip, sp
  10235c:	e92dd9f0 	stmdb	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
  102360:	e24cb004 	sub	fp, ip, #4	; 0x4
  102364:	e24dd004 	sub	sp, sp, #4	; 0x4
  102368:	e5d03000 	ldrb	r3, [r0]
  10236c:	e1a04000 	mov	r4, r0
  102370:	ea000000 	b	102378 <cmd_mac+0x20>
  102374:	e5f43001 	ldrb	r3, [r4, #1]!
  102378:	e3530000 	cmp	r3, #0	; 0x0
  10237c:	13530020 	cmpne	r3, #32	; 0x20
  102380:	1afffffb 	bne	102374 <cmd_mac+0x1c>
  102384:	e2844001 	add	r4, r4, #1	; 0x1
  102388:	e3a02000 	mov	r2, #0	; 0x0
  10238c:	e24b1024 	sub	r1, fp, #36	; 0x24
  102390:	e5d43000 	ldrb	r3, [r4]
  102394:	e3530000 	cmp	r3, #0	; 0x0
  102398:	e2822001 	add	r2, r2, #1	; 0x1
  10239c:	e2844001 	add	r4, r4, #1	; 0x1
  1023a0:	0a000029 	beq	10244c <cmd_mac+0xf4>
  1023a4:	e3520003 	cmp	r2, #3	; 0x3
  1023a8:	e4c13001 	strb	r3, [r1], #1
  1023ac:	9afffff7 	bls	102390 <cmd_mac+0x38>
  1023b0:	e24b5024 	sub	r5, fp, #36	; 0x24
  1023b4:	e1a00005 	mov	r0, r5
  1023b8:	ebffffcd 	bl	1022f4 <hex_to_int>
  1023bc:	e3500000 	cmp	r0, #0	; 0x0
  1023c0:	ba00001e 	blt	102440 <cmd_mac+0xe8>
  1023c4:	e24b6023 	sub	r6, fp, #35	; 0x23
  1023c8:	e1a00006 	mov	r0, r6
  1023cc:	ebffffc8 	bl	1022f4 <hex_to_int>
  1023d0:	e3500000 	cmp	r0, #0	; 0x0
  1023d4:	ba000019 	blt	102440 <cmd_mac+0xe8>
  1023d8:	e24b0022 	sub	r0, fp, #34	; 0x22
  1023dc:	ebffffc4 	bl	1022f4 <hex_to_int>
  1023e0:	e3500000 	cmp	r0, #0	; 0x0
  1023e4:	ba000015 	blt	102440 <cmd_mac+0xe8>
  1023e8:	e24b0021 	sub	r0, fp, #33	; 0x21
  1023ec:	ebffffc0 	bl	1022f4 <hex_to_int>
  1023f0:	e3500000 	cmp	r0, #0	; 0x0
  1023f4:	ba000011 	blt	102440 <cmd_mac+0xe8>
  1023f8:	e55bc024 	ldrb	ip, [fp, #-36]
  1023fc:	e55b2023 	ldrb	r2, [fp, #-35]
  102400:	e55b0022 	ldrb	r0, [fp, #-34]
  102404:	e55b3021 	ldrb	r3, [fp, #-33]
  102408:	e4d41001 	ldrb	r1, [r4], #1
  10240c:	e182220c 	orr	r2, r2, ip, lsl #4
  102410:	e1833200 	orr	r3, r3, r0, lsl #4
  102414:	e3510020 	cmp	r1, #32	; 0x20
  102418:	e20280ff 	and	r8, r2, #255	; 0xff
  10241c:	e20370ff 	and	r7, r3, #255	; 0xff
  102420:	1a000019 	bne	10248c <cmd_mac+0x134>
  102424:	e4d43001 	ldrb	r3, [r4], #1
  102428:	e5d42000 	ldrb	r2, [r4]
  10242c:	e3520000 	cmp	r2, #0	; 0x0
  102430:	e54b3024 	strb	r3, [fp, #-36]
  102434:	1a000007 	bne	102458 <cmd_mac+0x100>
  102438:	e59f0078 	ldr	r0, [pc, #120]	; 1024b8 <prog+0x1474>
  10243c:	ea000000 	b	102444 <cmd_mac+0xec>
  102440:	e59f0074 	ldr	r0, [pc, #116]	; 1024bc <prog+0x1478>
  102444:	eb000168 	bl	1029ec <DumpStringToUSB>
  102448:	e89da9f8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, fp, sp, pc}
  10244c:	e59f006c 	ldr	r0, [pc, #108]	; 1024c0 <prog+0x147c>
  102450:	eb000165 	bl	1029ec <DumpStringToUSB>
  102454:	e89da9f8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, fp, sp, pc}
  102458:	e1a00005 	mov	r0, r5
  10245c:	e54b2023 	strb	r2, [fp, #-35]
  102460:	ebffffa3 	bl	1022f4 <hex_to_int>
  102464:	e1a00006 	mov	r0, r6
  102468:	ebffffa1 	bl	1022f4 <hex_to_int>
  10246c:	e55b3024 	ldrb	r3, [fp, #-36]
  102470:	e55b2023 	ldrb	r2, [fp, #-35]
  102474:	e1822203 	orr	r2, r2, r3, lsl #4
  102478:	e20220ff 	and	r2, r2, #255	; 0xff
  10247c:	e0273008 	eor	r3, r7, r8
  102480:	e1530002 	cmp	r3, r2
  102484:	159f0038 	ldrne	r0, [pc, #56]	; 1024c4 <prog+0x1480>
  102488:	1affffed 	bne	102444 <cmd_mac+0xec>
  10248c:	e59f0034 	ldr	r0, [pc, #52]	; 1024c8 <prog+0x1484>
  102490:	eb000155 	bl	1029ec <DumpStringToUSB>
  102494:	e59f0030 	ldr	r0, [pc, #48]	; 1024cc <prog+0x1488>
  102498:	eb000153 	bl	1029ec <DumpStringToUSB>
  10249c:	e1871408 	orr	r1, r7, r8, lsl #8
  1024a0:	e59f2028 	ldr	r2, [pc, #40]	; 1024d0 <prog+0x148c>
  1024a4:	e1a03421 	mov	r3, r1, lsr #8
  1024a8:	e5c2300d 	strb	r3, [r2, #13]
  1024ac:	e5c2100c 	strb	r1, [r2, #12]
  1024b0:	eb000199 	bl	102b1c <env_store>
  1024b4:	e89da9f8 	ldmia	sp, {r3, r4, r5, r6, r7, r8, fp, sp, pc}
  1024b8:	00105a34 	andeqs	r5, r0, r4, lsr sl
  1024bc:	00105a48 	andeqs	r5, r0, r8, asr #20
  1024c0:	00105a58 	andeqs	r5, r0, r8, asr sl
  1024c4:	00105a68 	andeqs	r5, r0, r8, ror #20
  1024c8:	00105a8c 	andeqs	r5, r0, ip, lsl #21
  1024cc:	00105aa0 	andeqs	r5, r0, r0, lsr #21
  1024d0:	0020104c 	eoreq	r1, r0, ip, asr #32

001024d4 <cmd_dim>:
  1024d4:	e1a0c00d 	mov	ip, sp
  1024d8:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  1024dc:	e5d03000 	ldrb	r3, [r0]
  1024e0:	e3530000 	cmp	r3, #0	; 0x0
  1024e4:	13530020 	cmpne	r3, #32	; 0x20
  1024e8:	e24cb004 	sub	fp, ip, #4	; 0x4
  1024ec:	e3a02000 	mov	r2, #0	; 0x0
  1024f0:	0a000003 	beq	102504 <cmd_dim+0x30>
  1024f4:	e5f03001 	ldrb	r3, [r0, #1]!
  1024f8:	e3530000 	cmp	r3, #0	; 0x0
  1024fc:	13530020 	cmpne	r3, #32	; 0x20
  102500:	1afffffb 	bne	1024f4 <cmd_dim+0x20>
  102504:	e5f01001 	ldrb	r1, [r0, #1]!
  102508:	e2413030 	sub	r3, r1, #48	; 0x30
  10250c:	e3530009 	cmp	r3, #9	; 0x9
  102510:	8a000006 	bhi	102530 <cmd_dim+0x5c>
  102514:	e0822102 	add	r2, r2, r2, lsl #2
  102518:	e0812082 	add	r2, r1, r2, lsl #1
  10251c:	e5f01001 	ldrb	r1, [r0, #1]!
  102520:	e2413030 	sub	r3, r1, #48	; 0x30
  102524:	e3530009 	cmp	r3, #9	; 0x9
  102528:	e2422030 	sub	r2, r2, #48	; 0x30
  10252c:	9afffff8 	bls	102514 <cmd_dim+0x40>
  102530:	e1a00002 	mov	r0, r2
  102534:	ebfffe7a 	bl	101f24 <vUpdateDimmer>
  102538:	e59f0014 	ldr	r0, [pc, #20]	; 102554 <prog+0x1510>
  10253c:	eb00012a 	bl	1029ec <DumpStringToUSB>
  102540:	ebfffe80 	bl	101f48 <vGetDimmerStep>
  102544:	eb0000f5 	bl	102920 <DumpUIntToUSB>
  102548:	e59f0008 	ldr	r0, [pc, #8]	; 102558 <prog+0x1514>
  10254c:	e89d6800 	ldmia	sp, {fp, sp, lr}
  102550:	ea000125 	b	1029ec <DumpStringToUSB>
  102554:	00105ae0 	andeqs	r5, r0, r0, ror #21
  102558:	00105a54 	andeqs	r5, r0, r4, asr sl

0010255c <cmd_rfstatus>:
  10255c:	e1a0c00d 	mov	ip, sp
  102560:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  102564:	e3a00001 	mov	r0, #1	; 0x1
  102568:	e24cb004 	sub	fp, ip, #4	; 0x4
  10256c:	eb000142 	bl	102a7c <led_set_green>
  102570:	e59f0040 	ldr	r0, [pc, #64]	; 1025b8 <prog+0x1574>
  102574:	eb00011c 	bl	1029ec <DumpStringToUSB>
  102578:	e59f003c 	ldr	r0, [pc, #60]	; 1025bc <prog+0x1578>
  10257c:	eb00011a 	bl	1029ec <DumpStringToUSB>
  102580:	eb0001f8 	bl	102d68 <nRFAPI_CarrierDetect>
  102584:	e59f4034 	ldr	r4, [pc, #52]	; 1025c0 <prog+0x157c>
  102588:	e20000ff 	and	r0, r0, #255	; 0xff
  10258c:	eb0000e3 	bl	102920 <DumpUIntToUSB>
  102590:	e1a00004 	mov	r0, r4
  102594:	eb000114 	bl	1029ec <DumpStringToUSB>
  102598:	e59f0024 	ldr	r0, [pc, #36]	; 1025c4 <prog+0x1580>
  10259c:	eb000112 	bl	1029ec <DumpStringToUSB>
  1025a0:	eb0001e9 	bl	102d4c <nRFAPI_GetChannel>
  1025a4:	e20000ff 	and	r0, r0, #255	; 0xff
  1025a8:	eb0000dc 	bl	102920 <DumpUIntToUSB>
  1025ac:	e1a00004 	mov	r0, r4
  1025b0:	e89d6810 	ldmia	sp, {r4, fp, sp, lr}
  1025b4:	ea00010c 	b	1029ec <DumpStringToUSB>
  1025b8:	00105afc 	ldreqsh	r5, [r0], -ip
  1025bc:	00105b04 	andeqs	r5, r0, r4, lsl #22
  1025c0:	00105a54 	andeqs	r5, r0, r4, asr sl
  1025c4:	00105b10 	andeqs	r5, r0, r0, lsl fp

001025c8 <cmd_fire>:
  1025c8:	e1a0c00d 	mov	ip, sp
  1025cc:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  1025d0:	e3a02000 	mov	r2, #0	; 0x0
  1025d4:	e24cb004 	sub	fp, ip, #4	; 0x4
  1025d8:	e24dd004 	sub	sp, sp, #4	; 0x4
  1025dc:	e3e0c000 	mvn	ip, #0	; 0x0
  1025e0:	e3a01ffb 	mov	r1, #1004	; 0x3ec
  1025e4:	e1a03002 	mov	r3, r2
  1025e8:	e59f0008 	ldr	r0, [pc, #8]	; 1025f8 <prog+0x15b4>
  1025ec:	e58dc000 	str	ip, [sp]
  1025f0:	eb000806 	bl	104610 <usb_send_buffer_zero_copy>
  1025f4:	e89da808 	ldmia	sp, {r3, fp, sp, pc}
  1025f8:	00200a69 	eoreq	r0, r0, r9, ror #20

001025fc <cmd_id>:
  1025fc:	e1a0c00d 	mov	ip, sp
  102600:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  102604:	e5d03000 	ldrb	r3, [r0]
  102608:	e3a05000 	mov	r5, #0	; 0x0
  10260c:	e3530000 	cmp	r3, #0	; 0x0
  102610:	13530020 	cmpne	r3, #32	; 0x20
  102614:	e24cb004 	sub	fp, ip, #4	; 0x4
  102618:	e1a04005 	mov	r4, r5
  10261c:	0a000003 	beq	102630 <cmd_id+0x34>
  102620:	e5f03001 	ldrb	r3, [r0, #1]!
  102624:	e3530000 	cmp	r3, #0	; 0x0
  102628:	13530020 	cmpne	r3, #32	; 0x20
  10262c:	1afffffb 	bne	102620 <cmd_id+0x24>
  102630:	e5f01001 	ldrb	r1, [r0, #1]!
  102634:	e2413030 	sub	r3, r1, #48	; 0x30
  102638:	e3530009 	cmp	r3, #9	; 0x9
  10263c:	8a000006 	bhi	10265c <cmd_id+0x60>
  102640:	e0842104 	add	r2, r4, r4, lsl #2
  102644:	e0812082 	add	r2, r1, r2, lsl #1
  102648:	e5f01001 	ldrb	r1, [r0, #1]!
  10264c:	e2413030 	sub	r3, r1, #48	; 0x30
  102650:	e3530009 	cmp	r3, #9	; 0x9
  102654:	e2424030 	sub	r4, r2, #48	; 0x30
  102658:	9afffff8 	bls	102640 <cmd_id+0x44>
  10265c:	e3510020 	cmp	r1, #32	; 0x20
  102660:	159f00a8 	ldrne	r0, [pc, #168]	; 102710 <prog+0x16cc>
  102664:	0a000001 	beq	102670 <cmd_id+0x74>
  102668:	e89d6830 	ldmia	sp, {r4, r5, fp, sp, lr}
  10266c:	ea0000de 	b	1029ec <DumpStringToUSB>
  102670:	e5f01001 	ldrb	r1, [r0, #1]!
  102674:	e2413030 	sub	r3, r1, #48	; 0x30
  102678:	e3530009 	cmp	r3, #9	; 0x9
  10267c:	8a000006 	bhi	10269c <cmd_id+0xa0>
  102680:	e0852105 	add	r2, r5, r5, lsl #2
  102684:	e0812082 	add	r2, r1, r2, lsl #1
  102688:	e5f01001 	ldrb	r1, [r0, #1]!
  10268c:	e2413030 	sub	r3, r1, #48	; 0x30
  102690:	e3530009 	cmp	r3, #9	; 0x9
  102694:	e2425030 	sub	r5, r2, #48	; 0x30
  102698:	9afffff8 	bls	102680 <cmd_id+0x84>
  10269c:	e59f0070 	ldr	r0, [pc, #112]	; 102714 <prog+0x16d0>
  1026a0:	eb0000d1 	bl	1029ec <DumpStringToUSB>
  1026a4:	e1a00004 	mov	r0, r4
  1026a8:	eb00009c 	bl	102920 <DumpUIntToUSB>
  1026ac:	e59f0064 	ldr	r0, [pc, #100]	; 102718 <prog+0x16d4>
  1026b0:	eb0000cd 	bl	1029ec <DumpStringToUSB>
  1026b4:	e1a00005 	mov	r0, r5
  1026b8:	eb000098 	bl	102920 <DumpUIntToUSB>
  1026bc:	e59f0058 	ldr	r0, [pc, #88]	; 10271c <prog+0x16d8>
  1026c0:	eb0000c9 	bl	1029ec <DumpStringToUSB>
  1026c4:	e59f2054 	ldr	r2, [pc, #84]	; 102720 <prog+0x16dc>
  1026c8:	e5d2300f 	ldrb	r3, [r2, #15]
  1026cc:	e1530004 	cmp	r3, r4
  1026d0:	0a000009 	beq	1026fc <cmd_id+0x100>
  1026d4:	e5c2400f 	strb	r4, [r2, #15]
  1026d8:	e5c2500e 	strb	r5, [r2, #14]
  1026dc:	e5d2000f 	ldrb	r0, [r2, #15]
  1026e0:	ebfffde1 	bl	101e6c <PtUpdateWmcuId>
  1026e4:	e3a00064 	mov	r0, #100	; 0x64
  1026e8:	eb000506 	bl	103b08 <vTaskDelay>
  1026ec:	e59f0030 	ldr	r0, [pc, #48]	; 102724 <prog+0x16e0>
  1026f0:	eb0000bd 	bl	1029ec <DumpStringToUSB>
  1026f4:	e89d6830 	ldmia	sp, {r4, r5, fp, sp, lr}
  1026f8:	ea000107 	b	102b1c <env_store>
  1026fc:	e5d2300e 	ldrb	r3, [r2, #14]
  102700:	e1530005 	cmp	r3, r5
  102704:	1afffff2 	bne	1026d4 <cmd_id+0xd8>
  102708:	e59f0018 	ldr	r0, [pc, #24]	; 102728 <prog+0x16e4>
  10270c:	eaffffd5 	b	102668 <cmd_id+0x6c>
  102710:	00105b1c 	andeqs	r5, r0, ip, lsl fp
  102714:	00105b30 	andeqs	r5, r0, r0, lsr fp
  102718:	00105b44 	andeqs	r5, r0, r4, asr #22
  10271c:	00105a54 	andeqs	r5, r0, r4, asr sl
  102720:	0020104c 	eoreq	r1, r0, ip, asr #32
  102724:	00105b50 	andeqs	r5, r0, r0, asr fp
  102728:	00105b5c 	andeqs	r5, r0, ip, asr fp

0010272c <cmd_debug>:
  10272c:	e1a0c00d 	mov	ip, sp
  102730:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  102734:	e5d03000 	ldrb	r3, [r0]
  102738:	e24cb004 	sub	fp, ip, #4	; 0x4
  10273c:	ea000000 	b	102744 <cmd_debug+0x18>
  102740:	e5f03001 	ldrb	r3, [r0, #1]!
  102744:	e3530000 	cmp	r3, #0	; 0x0
  102748:	13530020 	cmpne	r3, #32	; 0x20
  10274c:	1afffffb 	bne	102740 <cmd_debug+0x14>
  102750:	e5d00001 	ldrb	r0, [r0, #1]
  102754:	e2403030 	sub	r3, r0, #48	; 0x30
  102758:	e3530009 	cmp	r3, #9	; 0x9
  10275c:	889da810 	ldmhiia	sp, {r4, fp, sp, pc}
  102760:	e2404030 	sub	r4, r0, #48	; 0x30
  102764:	e59f001c 	ldr	r0, [pc, #28]	; 102788 <prog+0x1744>
  102768:	eb00009f 	bl	1029ec <DumpStringToUSB>
  10276c:	e1a00004 	mov	r0, r4
  102770:	eb00006a 	bl	102920 <DumpUIntToUSB>
  102774:	e59f0010 	ldr	r0, [pc, #16]	; 10278c <prog+0x1748>
  102778:	eb00009b 	bl	1029ec <DumpStringToUSB>
  10277c:	e59f300c 	ldr	r3, [pc, #12]	; 102790 <prog+0x174c>
  102780:	e5834000 	str	r4, [r3]
  102784:	e89da810 	ldmia	sp, {r4, fp, sp, pc}
  102788:	00105b80 	andeqs	r5, r0, r0, lsl #23
  10278c:	00105a54 	andeqs	r5, r0, r4, asr sl
  102790:	00200834 	eoreq	r0, r0, r4, lsr r8

00102794 <cmd_update>:
  102794:	eafffdf7 	b	101f78 <DeviceRevertToUpdateMode>

00102798 <cmd_nrf_dump>:
  102798:	eafffdc9 	b	101ec4 <PtDumpNrfRegisters>

0010279c <cmd_nrf_init>:
  10279c:	e3a00002 	mov	r0, #2	; 0x2
  1027a0:	eafffdc3 	b	101eb4 <PtInitNrfFrontend>

001027a4 <cmd_nrf_reset>:
  1027a4:	e3a00001 	mov	r0, #1	; 0x1
  1027a8:	eafffdc1 	b	101eb4 <PtInitNrfFrontend>

001027ac <usbshell_task>:
  1027ac:	e1a0c00d 	mov	ip, sp
  1027b0:	e92dd9f0 	stmdb	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
  1027b4:	e59f3110 	ldr	r3, [pc, #272]	; 1028cc <prog+0x1888>
  1027b8:	e59f6110 	ldr	r6, [pc, #272]	; 1028d0 <prog+0x188c>
  1027bc:	e3a04000 	mov	r4, #0	; 0x0
  1027c0:	e3a02e5d 	mov	r2, #1488	; 0x5d0
  1027c4:	e282200c 	add	r2, r2, #12	; 0xc
  1027c8:	e24cb004 	sub	fp, ip, #4	; 0x4
  1027cc:	e1a00006 	mov	r0, r6
  1027d0:	e1a01004 	mov	r1, r4
  1027d4:	e5834000 	str	r4, [r3]
  1027d8:	ebfffc2d 	bl	101894 <memset>
  1027dc:	e3a02e5d 	mov	r2, #1488	; 0x5d0
  1027e0:	e282200b 	add	r2, r2, #11	; 0xb
  1027e4:	e1a03fc4 	mov	r3, r4, asr #31
  1027e8:	e0843d23 	add	r3, r4, r3, lsr #26
  1027ec:	e3c3303f 	bic	r3, r3, #63	; 0x3f
  1027f0:	e0633004 	rsb	r3, r3, r4
  1027f4:	e2833020 	add	r3, r3, #32	; 0x20
  1027f8:	e7c63004 	strb	r3, [r6, r4]
  1027fc:	e2844001 	add	r4, r4, #1	; 0x1
  102800:	e1540002 	cmp	r4, r2
  102804:	dafffff6 	ble	1027e4 <usbshell_task+0x38>
  102808:	e3a01ffa 	mov	r1, #1000	; 0x3e8
  10280c:	e3e03000 	mvn	r3, #0	; 0x0
  102810:	e3e02017 	mvn	r2, #23	; 0x17
  102814:	e2811003 	add	r1, r1, #3	; 0x3
  102818:	e59f50b4 	ldr	r5, [pc, #180]	; 1028d4 <prog+0x1890>
  10281c:	e59f70b4 	ldr	r7, [pc, #180]	; 1028d8 <prog+0x1894>
  102820:	e7c63001 	strb	r3, [r6, r1]
  102824:	e5c62000 	strb	r2, [r6]
  102828:	e2833004 	add	r3, r3, #4	; 0x4
  10282c:	e2822019 	add	r2, r2, #25	; 0x19
  102830:	e59f40a4 	ldr	r4, [pc, #164]	; 1028dc <prog+0x1898>
  102834:	e5c63001 	strb	r3, [r6, #1]
  102838:	e5c62002 	strb	r2, [r6, #2]
  10283c:	e1a08005 	mov	r8, r5
  102840:	e287607f 	add	r6, r7, #127	; 0x7f
  102844:	e3a01001 	mov	r1, #1	; 0x1
  102848:	e3a02064 	mov	r2, #100	; 0x64
  10284c:	e59f0080 	ldr	r0, [pc, #128]	; 1028d4 <prog+0x1890>
  102850:	eb000781 	bl	10465c <vUSBRecvByte>
  102854:	e3500000 	cmp	r0, #0	; 0x0
  102858:	0afffff9 	beq	102844 <usbshell_task+0x98>
  10285c:	e5d51000 	ldrb	r1, [r5]
  102860:	e20130ff 	and	r3, r1, #255	; 0xff
  102864:	e3a02000 	mov	r2, #0	; 0x0
  102868:	e353000d 	cmp	r3, #13	; 0xd
  10286c:	1353000a 	cmpne	r3, #10	; 0xa
  102870:	e1a00002 	mov	r0, r2
  102874:	13a0c000 	movne	ip, #0	; 0x0
  102878:	03a0c001 	moveq	ip, #1	; 0x1
  10287c:	0a00000d 	beq	1028b8 <usbshell_task+0x10c>
  102880:	e353001f 	cmp	r3, #31	; 0x1f
  102884:	9affffee 	bls	102844 <usbshell_task+0x98>
  102888:	e5942000 	ldr	r2, [r4]
  10288c:	e1520006 	cmp	r2, r6
  102890:	e1a03002 	mov	r3, r2
  102894:	0242207f 	subeq	r2, r2, #127	; 0x7f
  102898:	05842000 	streq	r2, [r4]
  10289c:	0543c07f 	streqb	ip, [r3, #-127]
  1028a0:	05942000 	ldreq	r2, [r4]
  1028a4:	05d81000 	ldreqb	r1, [r8]
  1028a8:	e59f302c 	ldr	r3, [pc, #44]	; 1028dc <prog+0x1898>
  1028ac:	e4c21001 	strb	r1, [r2], #1
  1028b0:	e5832000 	str	r2, [r3]
  1028b4:	eaffffe2 	b	102844 <usbshell_task+0x98>
  1028b8:	e5943000 	ldr	r3, [r4]
  1028bc:	e5c32000 	strb	r2, [r3]
  1028c0:	ebffff40 	bl	1025c8 <cmd_fire>
  1028c4:	e5847000 	str	r7, [r4]
  1028c8:	eaffffdd 	b	102844 <usbshell_task+0x98>
  1028cc:	002008d8 	ldreqd	r0, [r0], -r8
  1028d0:	00200a69 	eoreq	r0, r0, r9, ror #20
  1028d4:	00200a68 	eoreq	r0, r0, r8, ror #20
  1028d8:	002009e8 	eoreq	r0, r0, r8, ror #19
  1028dc:	002008d4 	ldreqd	r0, [r0], -r4

001028e0 <vUSBShellInit>:
  1028e0:	e1a0c00d 	mov	ip, sp
  1028e4:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  1028e8:	e24cb004 	sub	fp, ip, #4	; 0x4
  1028ec:	e24dd008 	sub	sp, sp, #8	; 0x8
  1028f0:	e3a0c000 	mov	ip, #0	; 0x0
  1028f4:	e1a0300c 	mov	r3, ip
  1028f8:	e59f1018 	ldr	r1, [pc, #24]	; 102918 <prog+0x18d4>
  1028fc:	e3a02c02 	mov	r2, #512	; 0x200
  102900:	e59f0014 	ldr	r0, [pc, #20]	; 10291c <prog+0x18d8>
  102904:	e58dc000 	str	ip, [sp]
  102908:	e58dc004 	str	ip, [sp, #4]
  10290c:	eb000585 	bl	103f28 <xTaskCreate>
  102910:	e24bd00c 	sub	sp, fp, #12	; 0xc
  102914:	e89da800 	ldmia	sp, {fp, sp, pc}
  102918:	00105b98 	muleqs	r0, r8, fp
  10291c:	001027ac 	andeqs	r2, r0, ip, lsr #15

00102920 <DumpUIntToUSB>:
  102920:	e1a0c00d 	mov	ip, sp
  102924:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  102928:	e59f1058 	ldr	r1, [pc, #88]	; 102988 <prog+0x1944>
  10292c:	e24cb004 	sub	fp, ip, #4	; 0x4
  102930:	e24dd00c 	sub	sp, sp, #12	; 0xc
  102934:	e3a04000 	mov	r4, #0	; 0x0
  102938:	e24b5016 	sub	r5, fp, #22	; 0x16
  10293c:	e0832091 	umull	r2, r3, r1, r0
  102940:	e1a031a3 	mov	r3, r3, lsr #3
  102944:	e0832103 	add	r2, r3, r3, lsl #2
  102948:	e0402082 	sub	r2, r0, r2, lsl #1
  10294c:	e2822030 	add	r2, r2, #48	; 0x30
  102950:	e3530000 	cmp	r3, #0	; 0x0
  102954:	e1a00003 	mov	r0, r3
  102958:	e5652001 	strb	r2, [r5, #-1]!
  10295c:	e2844001 	add	r4, r4, #1	; 0x1
  102960:	1afffff5 	bne	10293c <DumpUIntToUSB+0x1c>
  102964:	e2444001 	sub	r4, r4, #1	; 0x1
  102968:	ea000002 	b	102978 <DumpUIntToUSB+0x58>
  10296c:	e4d50001 	ldrb	r0, [r5], #1
  102970:	e2444001 	sub	r4, r4, #1	; 0x1
  102974:	eb000715 	bl	1045d0 <vUSBSendByte>
  102978:	e3740001 	cmn	r4, #1	; 0x1
  10297c:	1afffffa 	bne	10296c <DumpUIntToUSB+0x4c>
  102980:	e24bd014 	sub	sp, fp, #20	; 0x14
  102984:	e89da830 	ldmia	sp, {r4, r5, fp, sp, pc}
  102988:	cccccccd 	stcgtl	12, cr12, [ip], {205}

0010298c <printnibble>:
  10298c:	e200000f 	and	r0, r0, #15	; 0xf
  102990:	e3500009 	cmp	r0, #9	; 0x9
  102994:	e2803057 	add	r3, r0, #87	; 0x57
  102998:	92803030 	addls	r3, r0, #48	; 0x30
  10299c:	e1a00003 	mov	r0, r3
  1029a0:	ea00070a 	b	1045d0 <vUSBSendByte>

001029a4 <DumpHexToUSB>:
  1029a4:	e1a0c00d 	mov	ip, sp
  1029a8:	e92dd870 	stmdb	sp!, {r4, r5, r6, fp, ip, lr, pc}
  1029ac:	e21150ff 	ands	r5, r1, #255	; 0xff
  1029b0:	e24cb004 	sub	fp, ip, #4	; 0x4
  1029b4:	e1a06000 	mov	r6, r0
  1029b8:	089da870 	ldmeqia	sp, {r4, r5, r6, fp, sp, pc}
  1029bc:	e1a04185 	mov	r4, r5, lsl #3
  1029c0:	e2444008 	sub	r4, r4, #8	; 0x8
  1029c4:	e1a04436 	mov	r4, r6, lsr r4
  1029c8:	e20440ff 	and	r4, r4, #255	; 0xff
  1029cc:	e1a00224 	mov	r0, r4, lsr #4
  1029d0:	ebffffed 	bl	10298c <printnibble>
  1029d4:	e1a00004 	mov	r0, r4
  1029d8:	ebffffeb 	bl	10298c <printnibble>
  1029dc:	e2453001 	sub	r3, r5, #1	; 0x1
  1029e0:	e21350ff 	ands	r5, r3, #255	; 0xff
  1029e4:	1afffff4 	bne	1029bc <DumpHexToUSB+0x18>
  1029e8:	e89da870 	ldmia	sp, {r4, r5, r6, fp, sp, pc}

001029ec <DumpStringToUSB>:
  1029ec:	e1a0c00d 	mov	ip, sp
  1029f0:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  1029f4:	e2505000 	subs	r5, r0, #0	; 0x0
  1029f8:	e24cb004 	sub	fp, ip, #4	; 0x4
  1029fc:	089da830 	ldmeqia	sp, {r4, r5, fp, sp, pc}
  102a00:	e4d54001 	ldrb	r4, [r5], #1
  102a04:	e3540000 	cmp	r4, #0	; 0x0
  102a08:	089da830 	ldmeqia	sp, {r4, r5, fp, sp, pc}
  102a0c:	e1a00004 	mov	r0, r4
  102a10:	eb0006ee 	bl	1045d0 <vUSBSendByte>
  102a14:	e354000a 	cmp	r4, #10	; 0xa
  102a18:	e3a0000d 	mov	r0, #13	; 0xd
  102a1c:	0a000007 	beq	102a40 <DumpStringToUSB+0x54>
  102a20:	e4d54001 	ldrb	r4, [r5], #1
  102a24:	e3540000 	cmp	r4, #0	; 0x0
  102a28:	0a000008 	beq	102a50 <DumpStringToUSB+0x64>
  102a2c:	e1a00004 	mov	r0, r4
  102a30:	eb0006e6 	bl	1045d0 <vUSBSendByte>
  102a34:	e354000a 	cmp	r4, #10	; 0xa
  102a38:	e3a0000d 	mov	r0, #13	; 0xd
  102a3c:	1afffff7 	bne	102a20 <DumpStringToUSB+0x34>
  102a40:	eb0006e2 	bl	1045d0 <vUSBSendByte>
  102a44:	e4d54001 	ldrb	r4, [r5], #1
  102a48:	e3540000 	cmp	r4, #0	; 0x0
  102a4c:	1afffff6 	bne	102a2c <DumpStringToUSB+0x40>
  102a50:	e89da830 	ldmia	sp, {r4, r5, fp, sp, pc}

00102a54 <_sbrk_r>:
  102a54:	e59f2018 	ldr	r2, [pc, #24]	; 102a74 <prog+0x1a30>
  102a58:	e5920000 	ldr	r0, [r2]
  102a5c:	e3500000 	cmp	r0, #0	; 0x0
  102a60:	059f0010 	ldreq	r0, [pc, #16]	; 102a78 <prog+0x1a34>
  102a64:	e0803001 	add	r3, r0, r1
  102a68:	05820000 	streq	r0, [r2]
  102a6c:	e5823000 	str	r3, [r2]
  102a70:	e1a0f00e 	mov	pc, lr
  102a74:	00201048 	eoreq	r1, r0, r8, asr #32
  102a78:	00201354 	eoreq	r1, r0, r4, asr r3

00102a7c <led_set_green>:
  102a7c:	e31000ff 	tst	r0, #255	; 0xff
  102a80:	e3a0220a 	mov	r2, #-1610612736	; 0xa0000000
  102a84:	e1a029c2 	mov	r2, r2, asr #19
  102a88:	13a03501 	movne	r3, #4194304	; 0x400000
  102a8c:	03a03501 	moveq	r3, #4194304	; 0x400000
  102a90:	15823034 	strne	r3, [r2, #52]
  102a94:	05823030 	streq	r3, [r2, #48]
  102a98:	e1a0f00e 	mov	pc, lr

00102a9c <led_init>:
  102a9c:	e3a0220a 	mov	r2, #-1610612736	; 0xa0000000
  102aa0:	e1a029c2 	mov	r2, r2, asr #19
  102aa4:	e3a03501 	mov	r3, #4194304	; 0x400000
  102aa8:	e5823000 	str	r3, [r2]
  102aac:	e5823010 	str	r3, [r2, #16]
  102ab0:	e5823030 	str	r3, [r2, #48]
  102ab4:	e1a0f00e 	mov	pc, lr

00102ab8 <env_crc16>:
  102ab8:	e52de004 	str	lr, [sp, #-4]!
  102abc:	e3500000 	cmp	r0, #0	; 0x0
  102ac0:	13510000 	cmpne	r1, #0	; 0x0
  102ac4:	e1a0e000 	mov	lr, r0
  102ac8:	e3a00cff 	mov	r0, #65280	; 0xff00
  102acc:	e28000ff 	add	r0, r0, #255	; 0xff
  102ad0:	049df004 	ldreq	pc, [sp], #4
  102ad4:	e251c001 	subs	ip, r1, #1	; 0x1
  102ad8:	349df004 	ldrcc	pc, [sp], #4
  102adc:	e1a03400 	mov	r3, r0, lsl #8
  102ae0:	e1833420 	orr	r3, r3, r0, lsr #8
  102ae4:	e4de1001 	ldrb	r1, [lr], #1
  102ae8:	e1a03803 	mov	r3, r3, lsl #16
  102aec:	e0210823 	eor	r0, r1, r3, lsr #16
  102af0:	e20020ff 	and	r2, r0, #255	; 0xff
  102af4:	e0200222 	eor	r0, r0, r2, lsr #4
  102af8:	e0203600 	eor	r3, r0, r0, lsl #12
  102afc:	e1a03803 	mov	r3, r3, lsl #16
  102b00:	e1a00823 	mov	r0, r3, lsr #16
  102b04:	e24cc001 	sub	ip, ip, #1	; 0x1
  102b08:	e20030ff 	and	r3, r0, #255	; 0xff
  102b0c:	e37c0001 	cmn	ip, #1	; 0x1
  102b10:	e0200283 	eor	r0, r0, r3, lsl #5
  102b14:	1afffff0 	bne	102adc <env_crc16+0x24>
  102b18:	e49df004 	ldr	pc, [sp], #4

00102b1c <env_store>:
  102b1c:	e1a0c00d 	mov	ip, sp
  102b20:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  102b24:	e59f4098 	ldr	r4, [pc, #152]	; 102bc4 <prog+0x1b80>
  102b28:	e24cb004 	sub	fp, ip, #4	; 0x4
  102b2c:	eb00030b 	bl	103760 <vTaskSuspendAll>
  102b30:	eb00066e 	bl	1044f0 <vPortEnterCritical>
  102b34:	e3e03010 	mvn	r3, #16	; 0x10
  102b38:	e3a0c000 	mov	ip, #0	; 0x0
  102b3c:	e5c43000 	strb	r3, [r4]
  102b40:	e2433023 	sub	r3, r3, #35	; 0x23
  102b44:	e38ce00c 	orr	lr, ip, #12	; 0xc
  102b48:	e3e02041 	mvn	r2, #65	; 0x41
  102b4c:	e5c43002 	strb	r3, [r4, #2]
  102b50:	e3a01080 	mov	r1, #128	; 0x80
  102b54:	e243304c 	sub	r3, r3, #76	; 0x4c
  102b58:	e1a00004 	mov	r0, r4
  102b5c:	e5c4e003 	strb	lr, [r4, #3]
  102b60:	e5c4c007 	strb	ip, [r4, #7]
  102b64:	e5c4c008 	strb	ip, [r4, #8]
  102b68:	e5c4c009 	strb	ip, [r4, #9]
  102b6c:	e5c4c00a 	strb	ip, [r4, #10]
  102b70:	e5c4c00b 	strb	ip, [r4, #11]
  102b74:	e5c4c005 	strb	ip, [r4, #5]
  102b78:	e5c4c006 	strb	ip, [r4, #6]
  102b7c:	e5c42001 	strb	r2, [r4, #1]
  102b80:	e5c43004 	strb	r3, [r4, #4]
  102b84:	ebffffcb 	bl	102ab8 <env_crc16>
  102b88:	e1a02800 	mov	r2, r0, lsl #16
  102b8c:	e1a01822 	mov	r1, r2, lsr #16
  102b90:	e1a03c21 	mov	r3, r1, lsr #24
  102b94:	e3a0094f 	mov	r0, #1294336	; 0x13c000
  102b98:	e1a02c22 	mov	r2, r2, lsr #24
  102b9c:	e2800a03 	add	r0, r0, #12288	; 0x3000
  102ba0:	e5c4300b 	strb	r3, [r4, #11]
  102ba4:	e3a03000 	mov	r3, #0	; 0x0
  102ba8:	e5c42009 	strb	r2, [r4, #9]
  102bac:	e5c4300a 	strb	r3, [r4, #10]
  102bb0:	e5c41008 	strb	r1, [r4, #8]
  102bb4:	eb03f75a 	bl	200924 <env_flash_to>
  102bb8:	eb000657 	bl	10451c <vPortExitCritical>
  102bbc:	e89d6810 	ldmia	sp, {r4, fp, sp, lr}
  102bc0:	ea00033c 	b	1038b8 <xTaskResumeAll>
  102bc4:	0020104c 	eoreq	r1, r0, ip, asr #32

00102bc8 <env_load>:
  102bc8:	e1a0c00d 	mov	ip, sp
  102bcc:	e92dd870 	stmdb	sp!, {r4, r5, r6, fp, ip, lr, pc}
  102bd0:	e59f50c4 	ldr	r5, [pc, #196]	; 102c9c <prog+0x1c58>
  102bd4:	e3a0194f 	mov	r1, #1294336	; 0x13c000
  102bd8:	e2811a03 	add	r1, r1, #12288	; 0x3000
  102bdc:	e3a02080 	mov	r2, #128	; 0x80
  102be0:	e24cb004 	sub	fp, ip, #4	; 0x4
  102be4:	e1a00005 	mov	r0, r5
  102be8:	ebfffb05 	bl	101804 <memcpy>
  102bec:	e5d52001 	ldrb	r2, [r5, #1]
  102bf0:	e5d53000 	ldrb	r3, [r5]
  102bf4:	e5d51002 	ldrb	r1, [r5, #2]
  102bf8:	e1833402 	orr	r3, r3, r2, lsl #8
  102bfc:	e5d50003 	ldrb	r0, [r5, #3]
  102c00:	e3e024f3 	mvn	r2, #-218103808	; 0xf3000000
  102c04:	e1833801 	orr	r3, r3, r1, lsl #16
  102c08:	e24229cd 	sub	r2, r2, #3358720	; 0x334000
  102c0c:	e1833c00 	orr	r3, r3, r0, lsl #24
  102c10:	e2422e11 	sub	r2, r2, #272	; 0x110
  102c14:	e1530002 	cmp	r3, r2
  102c18:	e3a0e000 	mov	lr, #0	; 0x0
  102c1c:	0a000001 	beq	102c28 <env_load+0x60>
  102c20:	e1a0000e 	mov	r0, lr
  102c24:	e89da870 	ldmia	sp, {r4, r5, r6, fp, sp, pc}
  102c28:	e5d53004 	ldrb	r3, [r5, #4]
  102c2c:	e5d52005 	ldrb	r2, [r5, #5]
  102c30:	e5d5c006 	ldrb	ip, [r5, #6]
  102c34:	e5d51007 	ldrb	r1, [r5, #7]
  102c38:	e1833402 	orr	r3, r3, r2, lsl #8
  102c3c:	e183380c 	orr	r3, r3, ip, lsl #16
  102c40:	e1833c01 	orr	r3, r3, r1, lsl #24
  102c44:	e3530080 	cmp	r3, #128	; 0x80
  102c48:	e1a00005 	mov	r0, r5
  102c4c:	e1a0600e 	mov	r6, lr
  102c50:	e1a01003 	mov	r1, r3
  102c54:	1afffff1 	bne	102c20 <env_load+0x58>
  102c58:	e5d54008 	ldrb	r4, [r5, #8]
  102c5c:	e5d53009 	ldrb	r3, [r5, #9]
  102c60:	e5d5200a 	ldrb	r2, [r5, #10]
  102c64:	e5d5c00b 	ldrb	ip, [r5, #11]
  102c68:	e1844403 	orr	r4, r4, r3, lsl #8
  102c6c:	e1844802 	orr	r4, r4, r2, lsl #16
  102c70:	e5c5e00b 	strb	lr, [r5, #11]
  102c74:	e1844c0c 	orr	r4, r4, ip, lsl #24
  102c78:	e5c5e008 	strb	lr, [r5, #8]
  102c7c:	e5c5e009 	strb	lr, [r5, #9]
  102c80:	e5c5e00a 	strb	lr, [r5, #10]
  102c84:	ebffff8b 	bl	102ab8 <env_crc16>
  102c88:	e1a00800 	mov	r0, r0, lsl #16
  102c8c:	e1540820 	cmp	r4, r0, lsr #16
  102c90:	13a0e000 	movne	lr, #0	; 0x0
  102c94:	03a0e001 	moveq	lr, #1	; 0x1
  102c98:	eaffffe0 	b	102c20 <env_load+0x58>
  102c9c:	0020104c 	eoreq	r1, r0, ip, asr #32

00102ca0 <env_init>:
  102ca0:	e3a03831 	mov	r3, #3211264	; 0x310000
  102ca4:	e2833c03 	add	r3, r3, #768	; 0x300
  102ca8:	e3e020ff 	mvn	r2, #255	; 0xff
  102cac:	e5823060 	str	r3, [r2, #96]
  102cb0:	e1a0f00e 	mov	pc, lr

00102cb4 <nRFAPI_SetRxMAC>:
  102cb4:	e1a03002 	mov	r3, r2
  102cb8:	e92d4010 	stmdb	sp!, {r4, lr}
  102cbc:	e201e0ff 	and	lr, r1, #255	; 0xff
  102cc0:	e20340ff 	and	r4, r3, #255	; 0xff
  102cc4:	e3540001 	cmp	r4, #1	; 0x1
  102cc8:	83a03000 	movhi	r3, #0	; 0x0
  102ccc:	93a03001 	movls	r3, #1	; 0x1
  102cd0:	e35e0002 	cmp	lr, #2	; 0x2
  102cd4:	e284c00a 	add	ip, r4, #10	; 0xa
  102cd8:	93a03000 	movls	r3, #0	; 0x0
  102cdc:	e38cc020 	orr	ip, ip, #32	; 0x20
  102ce0:	e3530000 	cmp	r3, #0	; 0x0
  102ce4:	e1a01000 	mov	r1, r0
  102ce8:	e1a0200e 	mov	r2, lr
  102cec:	e20c00ff 	and	r0, ip, #255	; 0xff
  102cf0:	0a000003 	beq	102d04 <nRFAPI_SetRxMAC+0x50>
  102cf4:	e35e0005 	cmp	lr, #5	; 0x5
  102cf8:	8a000001 	bhi	102d04 <nRFAPI_SetRxMAC+0x50>
  102cfc:	e8bd4010 	ldmia	sp!, {r4, lr}
  102d00:	ea000050 	b	102e48 <nRFCMD_RegWriteBuf>
  102d04:	e35e0001 	cmp	lr, #1	; 0x1
  102d08:	13a03000 	movne	r3, #0	; 0x0
  102d0c:	03a03001 	moveq	r3, #1	; 0x1
  102d10:	e3540001 	cmp	r4, #1	; 0x1
  102d14:	93a03000 	movls	r3, #0	; 0x0
  102d18:	e3530000 	cmp	r3, #0	; 0x0
  102d1c:	08bd8010 	ldmeqia	sp!, {r4, pc}
  102d20:	e3540005 	cmp	r4, #5	; 0x5
  102d24:	9afffff4 	bls	102cfc <nRFAPI_SetRxMAC+0x48>
  102d28:	e8bd8010 	ldmia	sp!, {r4, pc}

00102d2c <nRFAPI_SetTxMAC>:
  102d2c:	e20110ff 	and	r1, r1, #255	; 0xff
  102d30:	e1a02001 	mov	r2, r1
  102d34:	e2411003 	sub	r1, r1, #3	; 0x3
  102d38:	e3510002 	cmp	r1, #2	; 0x2
  102d3c:	e1a01000 	mov	r1, r0
  102d40:	e3a00030 	mov	r0, #48	; 0x30
  102d44:	81a0f00e 	movhi	pc, lr
  102d48:	ea00003e 	b	102e48 <nRFCMD_RegWriteBuf>

00102d4c <nRFAPI_GetChannel>:
  102d4c:	e1a0c00d 	mov	ip, sp
  102d50:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  102d54:	e3a00005 	mov	r0, #5	; 0x5
  102d58:	e24cb004 	sub	fp, ip, #4	; 0x4
  102d5c:	eb000029 	bl	102e08 <nRFCMD_RegRead>
  102d60:	e200007f 	and	r0, r0, #127	; 0x7f
  102d64:	e89da800 	ldmia	sp, {fp, sp, pc}

00102d68 <nRFAPI_CarrierDetect>:
  102d68:	e1a0c00d 	mov	ip, sp
  102d6c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  102d70:	e3a00009 	mov	r0, #9	; 0x9
  102d74:	e24cb004 	sub	fp, ip, #4	; 0x4
  102d78:	eb000022 	bl	102e08 <nRFCMD_RegRead>
  102d7c:	e20000ff 	and	r0, r0, #255	; 0xff
  102d80:	e89da800 	ldmia	sp, {fp, sp, pc}

00102d84 <nRFCMD_ReadWriteBuffer>:
  102d84:	e1a0c00d 	mov	ip, sp
  102d88:	e92dd8f0 	stmdb	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
  102d8c:	e3a044ff 	mov	r4, #-16777216	; 0xff000000
  102d90:	e28448fe 	add	r4, r4, #16646144	; 0xfe0000
  102d94:	e24dd004 	sub	sp, sp, #4	; 0x4
  102d98:	e3a05000 	mov	r5, #0	; 0x0
  102d9c:	e24cb004 	sub	fp, ip, #4	; 0x4
  102da0:	e2844c01 	add	r4, r4, #256	; 0x100
  102da4:	e1a06000 	mov	r6, r0
  102da8:	e1a07002 	mov	r7, r2
  102dac:	e1a03005 	mov	r3, r5
  102db0:	e1a00004 	mov	r0, r4
  102db4:	e58d5000 	str	r5, [sp]
  102db8:	eb00005a 	bl	102f28 <AT91F_PDC_ReceiveFrame>
  102dbc:	e1a01006 	mov	r1, r6
  102dc0:	e1a02007 	mov	r2, r7
  102dc4:	e1a03005 	mov	r3, r5
  102dc8:	e1a00004 	mov	r0, r4
  102dcc:	e58d5000 	str	r5, [sp]
  102dd0:	eb000068 	bl	102f78 <AT91F_PDC_SendFrame>
  102dd4:	e59f2028 	ldr	r2, [pc, #40]	; 102e04 <prog+0x1dc0>
  102dd8:	e3a03c01 	mov	r3, #256	; 0x100
  102ddc:	e2833001 	add	r3, r3, #1	; 0x1
  102de0:	e5843020 	str	r3, [r4, #32]
  102de4:	e1a01005 	mov	r1, r5
  102de8:	e5920000 	ldr	r0, [r2]
  102dec:	e1a03005 	mov	r3, r5
  102df0:	e3a02064 	mov	r2, #100	; 0x64
  102df4:	eb00017e 	bl	1033f4 <xQueueGenericReceive>
  102df8:	e2500001 	subs	r0, r0, #1	; 0x1
  102dfc:	13a00001 	movne	r0, #1	; 0x1
  102e00:	e89da8f8 	ldmia	sp, {r3, r4, r5, r6, r7, fp, sp, pc}
  102e04:	00201110 	eoreq	r1, r0, r0, lsl r1

00102e08 <nRFCMD_RegRead>:
  102e08:	e1a0c00d 	mov	ip, sp
  102e0c:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  102e10:	e59f3028 	ldr	r3, [pc, #40]	; 102e40 <prog+0x1dfc>
  102e14:	e59f4028 	ldr	r4, [pc, #40]	; 102e44 <prog+0x1e00>
  102e18:	e24cb004 	sub	fp, ip, #4	; 0x4
  102e1c:	e3a0c000 	mov	ip, #0	; 0x0
  102e20:	e5c30000 	strb	r0, [r3]
  102e24:	e1a01004 	mov	r1, r4
  102e28:	e1a00003 	mov	r0, r3
  102e2c:	e3a02002 	mov	r2, #2	; 0x2
  102e30:	e5c3c001 	strb	ip, [r3, #1]
  102e34:	ebffffd2 	bl	102d84 <nRFCMD_ReadWriteBuffer>
  102e38:	e5d40001 	ldrb	r0, [r4, #1]
  102e3c:	e89da810 	ldmia	sp, {r4, fp, sp, pc}
  102e40:	002010cc 	eoreq	r1, r0, ip, asr #1
  102e44:	002010ed 	eoreq	r1, r0, sp, ror #1

00102e48 <nRFCMD_RegWriteBuf>:
  102e48:	e1a0c00d 	mov	ip, sp
  102e4c:	e92dd870 	stmdb	sp!, {r4, r5, r6, fp, ip, lr, pc}
  102e50:	e59f6034 	ldr	r6, [pc, #52]	; 102e8c <prog+0x1e48>
  102e54:	e1a03006 	mov	r3, r6
  102e58:	e4c30001 	strb	r0, [r3], #1
  102e5c:	e20240ff 	and	r4, r2, #255	; 0xff
  102e60:	e59f5028 	ldr	r5, [pc, #40]	; 102e90 <prog+0x1e4c>
  102e64:	e24cb004 	sub	fp, ip, #4	; 0x4
  102e68:	e1a00003 	mov	r0, r3
  102e6c:	e1a02004 	mov	r2, r4
  102e70:	ebfffa63 	bl	101804 <memcpy>
  102e74:	e1a00006 	mov	r0, r6
  102e78:	e2842001 	add	r2, r4, #1	; 0x1
  102e7c:	e1a01005 	mov	r1, r5
  102e80:	ebffffbf 	bl	102d84 <nRFCMD_ReadWriteBuffer>
  102e84:	e5d50000 	ldrb	r0, [r5]
  102e88:	e89da870 	ldmia	sp, {r4, r5, r6, fp, sp, pc}
  102e8c:	002010cc 	eoreq	r1, r0, ip, asr #1
  102e90:	002010ed 	eoreq	r1, r0, sp, ror #1

00102e94 <AT91F_LowLevelInit>:
  102e94:	e52de004 	str	lr, [sp, #-4]!
  102e98:	e3a0084b 	mov	r0, #4915200	; 0x4b0000
  102e9c:	e3a0e102 	mov	lr, #-2147483648	; 0x80000000
  102ea0:	e3a0c32a 	mov	ip, #-1476395008	; 0xa8000000
  102ea4:	e3a02502 	mov	r2, #8388608	; 0x800000
  102ea8:	e3a01c06 	mov	r1, #1536	; 0x600
  102eac:	e1a0eace 	mov	lr, lr, asr #21
  102eb0:	e2800c01 	add	r0, r0, #256	; 0x100
  102eb4:	e1a0cacc 	mov	ip, ip, asr #21
  102eb8:	e2822d82 	add	r2, r2, #8320	; 0x2080
  102ebc:	e2811001 	add	r1, r1, #1	; 0x1
  102ec0:	e3e030ff 	mvn	r3, #255	; 0xff
  102ec4:	e5830060 	str	r0, [r3, #96]
  102ec8:	e58c2004 	str	r2, [ip, #4]
  102ecc:	e58e1020 	str	r1, [lr, #32]
  102ed0:	e59e3068 	ldr	r3, [lr, #104]
  102ed4:	e3130001 	tst	r3, #1	; 0x1
  102ed8:	0afffffc 	beq	102ed0 <AT91F_LowLevelInit+0x3c>
  102edc:	e3a03819 	mov	r3, #1638400	; 0x190000
  102ee0:	e2833b07 	add	r3, r3, #7168	; 0x1c00
  102ee4:	e2833005 	add	r3, r3, #5	; 0x5
  102ee8:	e58e302c 	str	r3, [lr, #44]
  102eec:	e59e3068 	ldr	r3, [lr, #104]
  102ef0:	e3130004 	tst	r3, #4	; 0x4
  102ef4:	0afffffc 	beq	102eec <AT91F_LowLevelInit+0x58>
  102ef8:	e3a03004 	mov	r3, #4	; 0x4
  102efc:	e58e3030 	str	r3, [lr, #48]
  102f00:	e59e3068 	ldr	r3, [lr, #104]
  102f04:	e3130008 	tst	r3, #8	; 0x8
  102f08:	0afffffc 	beq	102f00 <AT91F_LowLevelInit+0x6c>
  102f0c:	e59e3030 	ldr	r3, [lr, #48]
  102f10:	e3833003 	orr	r3, r3, #3	; 0x3
  102f14:	e58e3030 	str	r3, [lr, #48]
  102f18:	e59e3068 	ldr	r3, [lr, #104]
  102f1c:	e3130008 	tst	r3, #8	; 0x8
  102f20:	0afffffc 	beq	102f18 <AT91F_LowLevelInit+0x84>
  102f24:	e49df004 	ldr	pc, [sp], #4

00102f28 <AT91F_PDC_ReceiveFrame>:
  102f28:	e1a0c000 	mov	ip, r0
  102f2c:	e5900004 	ldr	r0, [r0, #4]
  102f30:	e3500000 	cmp	r0, #0	; 0x0
  102f34:	e3a00002 	mov	r0, #2	; 0x2
  102f38:	0a000008 	beq	102f60 <AT91F_PDC_ReceiveFrame+0x38>
  102f3c:	e59c3014 	ldr	r3, [ip, #20]
  102f40:	e2733001 	rsbs	r3, r3, #1	; 0x1
  102f44:	33a03000 	movcc	r3, #0	; 0x0
  102f48:	e3530000 	cmp	r3, #0	; 0x0
  102f4c:	e3a00001 	mov	r0, #1	; 0x1
  102f50:	01a00003 	moveq	r0, r3
  102f54:	158c1010 	strne	r1, [ip, #16]
  102f58:	158c2014 	strne	r2, [ip, #20]
  102f5c:	e1a0f00e 	mov	pc, lr
  102f60:	e58c1000 	str	r1, [ip]
  102f64:	e58c2004 	str	r2, [ip, #4]
  102f68:	e58c3010 	str	r3, [ip, #16]
  102f6c:	e59d3000 	ldr	r3, [sp]
  102f70:	e58c3014 	str	r3, [ip, #20]
  102f74:	e1a0f00e 	mov	pc, lr

00102f78 <AT91F_PDC_SendFrame>:
  102f78:	e1a0c000 	mov	ip, r0
  102f7c:	e590000c 	ldr	r0, [r0, #12]
  102f80:	e3500000 	cmp	r0, #0	; 0x0
  102f84:	e3a00002 	mov	r0, #2	; 0x2
  102f88:	0a000008 	beq	102fb0 <AT91F_PDC_SendFrame+0x38>
  102f8c:	e59c301c 	ldr	r3, [ip, #28]
  102f90:	e2733001 	rsbs	r3, r3, #1	; 0x1
  102f94:	33a03000 	movcc	r3, #0	; 0x0
  102f98:	e3530000 	cmp	r3, #0	; 0x0
  102f9c:	e3a00001 	mov	r0, #1	; 0x1
  102fa0:	01a00003 	moveq	r0, r3
  102fa4:	158c1018 	strne	r1, [ip, #24]
  102fa8:	158c201c 	strne	r2, [ip, #28]
  102fac:	e1a0f00e 	mov	pc, lr
  102fb0:	e58c1008 	str	r1, [ip, #8]
  102fb4:	e58c200c 	str	r2, [ip, #12]
  102fb8:	e58c3018 	str	r3, [ip, #24]
  102fbc:	e59d3000 	ldr	r3, [sp]
  102fc0:	e58c301c 	str	r3, [ip, #28]
  102fc4:	e1a0f00e 	mov	pc, lr

00102fc8 <AT91F_AIC_ConfigureIt>:
  102fc8:	e92d4010 	stmdb	sp!, {r4, lr}
  102fcc:	e1822001 	orr	r2, r2, r1
  102fd0:	e1a0e100 	mov	lr, r0, lsl #2
  102fd4:	e3a0c102 	mov	ip, #-2147483648	; 0x80000000
  102fd8:	e3a01001 	mov	r1, #1	; 0x1
  102fdc:	e1a0c9cc 	mov	ip, ip, asr #19
  102fe0:	e1a01011 	mov	r1, r1, lsl r0
  102fe4:	e1a04000 	mov	r4, r0
  102fe8:	e51e0f80 	ldr	r0, [lr, #-3968]
  102fec:	e1a00003 	mov	r0, r3
  102ff0:	e58c1124 	str	r1, [ip, #292]
  102ff4:	e50e3f80 	str	r3, [lr, #-3968]
  102ff8:	e78c2104 	str	r2, [ip, r4, lsl #2]
  102ffc:	e58c1128 	str	r1, [ip, #296]
  103000:	e8bd8010 	ldmia	sp!, {r4, pc}

00103004 <vListInitialise>:
  103004:	e3e03000 	mvn	r3, #0	; 0x0
  103008:	e5803008 	str	r3, [r0, #8]
  10300c:	e2802008 	add	r2, r0, #8	; 0x8
  103010:	e2833001 	add	r3, r3, #1	; 0x1
  103014:	e580200c 	str	r2, [r0, #12]
  103018:	e5802010 	str	r2, [r0, #16]
  10301c:	e5802004 	str	r2, [r0, #4]
  103020:	e5803000 	str	r3, [r0]
  103024:	e1a0f00e 	mov	pc, lr

00103028 <vListInitialiseItem>:
  103028:	e3a03000 	mov	r3, #0	; 0x0
  10302c:	e5803010 	str	r3, [r0, #16]
  103030:	e1a0f00e 	mov	pc, lr

00103034 <vListInsertEnd>:
  103034:	e5902004 	ldr	r2, [r0, #4]
  103038:	e5923004 	ldr	r3, [r2, #4]
  10303c:	e5813004 	str	r3, [r1, #4]
  103040:	e592c004 	ldr	ip, [r2, #4]
  103044:	e5903004 	ldr	r3, [r0, #4]
  103048:	e5813008 	str	r3, [r1, #8]
  10304c:	e58c1008 	str	r1, [ip, #8]
  103050:	e5821004 	str	r1, [r2, #4]
  103054:	e5903000 	ldr	r3, [r0]
  103058:	e2833001 	add	r3, r3, #1	; 0x1
  10305c:	e5803000 	str	r3, [r0]
  103060:	e5810010 	str	r0, [r1, #16]
  103064:	e5801004 	str	r1, [r0, #4]
  103068:	e1a0f00e 	mov	pc, lr

0010306c <vListInsert>:
  10306c:	e52de004 	str	lr, [sp, #-4]!
  103070:	e591e000 	ldr	lr, [r1]
  103074:	e37e0001 	cmn	lr, #1	; 0x1
  103078:	0590c010 	ldreq	ip, [r0, #16]
  10307c:	0a000006 	beq	10309c <vListInsert+0x30>
  103080:	e280c008 	add	ip, r0, #8	; 0x8
  103084:	ea000000 	b	10308c <vListInsert+0x20>
  103088:	e59cc004 	ldr	ip, [ip, #4]
  10308c:	e59c3004 	ldr	r3, [ip, #4]
  103090:	e5932000 	ldr	r2, [r3]
  103094:	e152000e 	cmp	r2, lr
  103098:	9afffffa 	bls	103088 <vListInsert+0x1c>
  10309c:	e59c3004 	ldr	r3, [ip, #4]
  1030a0:	e5831008 	str	r1, [r3, #8]
  1030a4:	e5813004 	str	r3, [r1, #4]
  1030a8:	e58c1004 	str	r1, [ip, #4]
  1030ac:	e5903000 	ldr	r3, [r0]
  1030b0:	e2833001 	add	r3, r3, #1	; 0x1
  1030b4:	e5803000 	str	r3, [r0]
  1030b8:	e5810010 	str	r0, [r1, #16]
  1030bc:	e581c008 	str	ip, [r1, #8]
  1030c0:	e49df004 	ldr	pc, [sp], #4

001030c4 <vListRemove>:
  1030c4:	e5903004 	ldr	r3, [r0, #4]
  1030c8:	e5902008 	ldr	r2, [r0, #8]
  1030cc:	e5832008 	str	r2, [r3, #8]
  1030d0:	e5902008 	ldr	r2, [r0, #8]
  1030d4:	e5901010 	ldr	r1, [r0, #16]
  1030d8:	e5823004 	str	r3, [r2, #4]
  1030dc:	e5913004 	ldr	r3, [r1, #4]
  1030e0:	e1530000 	cmp	r3, r0
  1030e4:	e5913000 	ldr	r3, [r1]
  1030e8:	05812004 	streq	r2, [r1, #4]
  1030ec:	e2433001 	sub	r3, r3, #1	; 0x1
  1030f0:	e3a02000 	mov	r2, #0	; 0x0
  1030f4:	e5802010 	str	r2, [r0, #16]
  1030f8:	e5813000 	str	r3, [r1]
  1030fc:	e1a0f00e 	mov	pc, lr

00103100 <xQueueCreate>:
  103100:	e1a0c00d 	mov	ip, sp
  103104:	e92dd8f0 	stmdb	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
  103108:	e2506000 	subs	r6, r0, #0	; 0x0
  10310c:	e24cb004 	sub	fp, ip, #4	; 0x4
  103110:	e3a0004c 	mov	r0, #76	; 0x4c
  103114:	e1a07001 	mov	r7, r1
  103118:	0a00000f 	beq	10315c <xQueueCreate+0x5c>
  10311c:	eb00050f 	bl	104560 <pvPortMalloc>
  103120:	e2505000 	subs	r5, r0, #0	; 0x0
  103124:	0a00000c 	beq	10315c <xQueueCreate+0x5c>
  103128:	e0040697 	mul	r4, r7, r6
  10312c:	e2840001 	add	r0, r4, #1	; 0x1
  103130:	eb00050a 	bl	104560 <pvPortMalloc>
  103134:	e1a01000 	mov	r1, r0
  103138:	e3510000 	cmp	r1, #0	; 0x0
  10313c:	e0803004 	add	r3, r0, r4
  103140:	e2462001 	sub	r2, r6, #1	; 0x1
  103144:	e3e0c000 	mvn	ip, #0	; 0x0
  103148:	e2850010 	add	r0, r5, #16	; 0x10
  10314c:	e5851000 	str	r1, [r5]
  103150:	1a000003 	bne	103164 <xQueueCreate+0x64>
  103154:	e1a00005 	mov	r0, r5
  103158:	eb00050b 	bl	10458c <vPortFree>
  10315c:	e3a00000 	mov	r0, #0	; 0x0
  103160:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103164:	e0221297 	mla	r2, r7, r2, r1
  103168:	e5853004 	str	r3, [r5, #4]
  10316c:	e3a03000 	mov	r3, #0	; 0x0
  103170:	e5853038 	str	r3, [r5, #56]
  103174:	e585200c 	str	r2, [r5, #12]
  103178:	e585c048 	str	ip, [r5, #72]
  10317c:	e5851008 	str	r1, [r5, #8]
  103180:	e585c044 	str	ip, [r5, #68]
  103184:	e585603c 	str	r6, [r5, #60]
  103188:	e5857040 	str	r7, [r5, #64]
  10318c:	ebffff9c 	bl	103004 <vListInitialise>
  103190:	e2850024 	add	r0, r5, #36	; 0x24
  103194:	ebffff9a 	bl	103004 <vListInitialise>
  103198:	e1a00005 	mov	r0, r5
  10319c:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}

001031a0 <uxQueueMessagesWaiting>:
  1031a0:	e1a0c00d 	mov	ip, sp
  1031a4:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  1031a8:	e1a04000 	mov	r4, r0
  1031ac:	e24cb004 	sub	fp, ip, #4	; 0x4
  1031b0:	eb0004ce 	bl	1044f0 <vPortEnterCritical>
  1031b4:	e5945038 	ldr	r5, [r4, #56]
  1031b8:	eb0004d7 	bl	10451c <vPortExitCritical>
  1031bc:	e1a00005 	mov	r0, r5
  1031c0:	e89da830 	ldmia	sp, {r4, r5, fp, sp, pc}

001031c4 <prvCopyDataFromQueue>:
  1031c4:	e92d4010 	stmdb	sp!, {r4, lr}
  1031c8:	e590c000 	ldr	ip, [r0]
  1031cc:	e35c0000 	cmp	ip, #0	; 0x0
  1031d0:	e1a04001 	mov	r4, r1
  1031d4:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1031d8:	e590200c 	ldr	r2, [r0, #12]
  1031dc:	e590e040 	ldr	lr, [r0, #64]
  1031e0:	e5903004 	ldr	r3, [r0, #4]
  1031e4:	e082100e 	add	r1, r2, lr
  1031e8:	e1510003 	cmp	r1, r3
  1031ec:	21a0100c 	movcs	r1, ip
  1031f0:	e580100c 	str	r1, [r0, #12]
  1031f4:	e1a0200e 	mov	r2, lr
  1031f8:	e1a00004 	mov	r0, r4
  1031fc:	e8bd4010 	ldmia	sp!, {r4, lr}
  103200:	eafff97f 	b	101804 <memcpy>

00103204 <prvCopyDataToQueue>:
  103204:	e1a0c00d 	mov	ip, sp
  103208:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  10320c:	e5903040 	ldr	r3, [r0, #64]
  103210:	e3530000 	cmp	r3, #0	; 0x0
  103214:	e1a04000 	mov	r4, r0
  103218:	e24cb004 	sub	fp, ip, #4	; 0x4
  10321c:	e1a00002 	mov	r0, r2
  103220:	0a00000b 	beq	103254 <prvCopyDataToQueue+0x50>
  103224:	e3500000 	cmp	r0, #0	; 0x0
  103228:	e1a02003 	mov	r2, r3
  10322c:	1a00000c 	bne	103264 <prvCopyDataToQueue+0x60>
  103230:	e5940008 	ldr	r0, [r4, #8]
  103234:	ebfff972 	bl	101804 <memcpy>
  103238:	e5943008 	ldr	r3, [r4, #8]
  10323c:	e5942040 	ldr	r2, [r4, #64]
  103240:	e5941004 	ldr	r1, [r4, #4]
  103244:	e0833002 	add	r3, r3, r2
  103248:	e1530001 	cmp	r3, r1
  10324c:	25943000 	ldrcs	r3, [r4]
  103250:	e5843008 	str	r3, [r4, #8]
  103254:	e5943038 	ldr	r3, [r4, #56]
  103258:	e2833001 	add	r3, r3, #1	; 0x1
  10325c:	e5843038 	str	r3, [r4, #56]
  103260:	e89da810 	ldmia	sp, {r4, fp, sp, pc}
  103264:	e1a02003 	mov	r2, r3
  103268:	e594000c 	ldr	r0, [r4, #12]
  10326c:	ebfff964 	bl	101804 <memcpy>
  103270:	e594200c 	ldr	r2, [r4, #12]
  103274:	e5941040 	ldr	r1, [r4, #64]
  103278:	e5943000 	ldr	r3, [r4]
  10327c:	e0612002 	rsb	r2, r1, r2
  103280:	e1520003 	cmp	r2, r3
  103284:	35943004 	ldrcc	r3, [r4, #4]
  103288:	30613003 	rsbcc	r3, r1, r3
  10328c:	3584300c 	strcc	r3, [r4, #12]
  103290:	3affffef 	bcc	103254 <prvCopyDataToQueue+0x50>
  103294:	e5943038 	ldr	r3, [r4, #56]
  103298:	e2833001 	add	r3, r3, #1	; 0x1
  10329c:	e584200c 	str	r2, [r4, #12]
  1032a0:	e5843038 	str	r3, [r4, #56]
  1032a4:	e89da810 	ldmia	sp, {r4, fp, sp, pc}

001032a8 <xQueueGenericSendFromISR>:
  1032a8:	e1a0c00d 	mov	ip, sp
  1032ac:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  1032b0:	e24cb004 	sub	fp, ip, #4	; 0x4
  1032b4:	e590e03c 	ldr	lr, [r0, #60]
  1032b8:	e590c038 	ldr	ip, [r0, #56]
  1032bc:	e15c000e 	cmp	ip, lr
  1032c0:	e1a04000 	mov	r4, r0
  1032c4:	e1a05002 	mov	r5, r2
  1032c8:	23a00000 	movcs	r0, #0	; 0x0
  1032cc:	e1a02003 	mov	r2, r3
  1032d0:	289da830 	ldmcsia	sp, {r4, r5, fp, sp, pc}
  1032d4:	ebffffca 	bl	103204 <prvCopyDataToQueue>
  1032d8:	e5943048 	ldr	r3, [r4, #72]
  1032dc:	e3730001 	cmn	r3, #1	; 0x1
  1032e0:	e2833001 	add	r3, r3, #1	; 0x1
  1032e4:	15843048 	strne	r3, [r4, #72]
  1032e8:	0a000001 	beq	1032f4 <xQueueGenericSendFromISR+0x4c>
  1032ec:	e3a00001 	mov	r0, #1	; 0x1
  1032f0:	e89da830 	ldmia	sp, {r4, r5, fp, sp, pc}
  1032f4:	e5943024 	ldr	r3, [r4, #36]
  1032f8:	e3530000 	cmp	r3, #0	; 0x0
  1032fc:	e2840024 	add	r0, r4, #36	; 0x24
  103300:	0afffff9 	beq	1032ec <xQueueGenericSendFromISR+0x44>
  103304:	eb000271 	bl	103cd0 <xTaskRemoveFromEventList>
  103308:	e3500000 	cmp	r0, #0	; 0x0
  10330c:	13a03001 	movne	r3, #1	; 0x1
  103310:	15853000 	strne	r3, [r5]
  103314:	eafffff4 	b	1032ec <xQueueGenericSendFromISR+0x44>

00103318 <prvUnlockQueue>:
  103318:	e1a0c00d 	mov	ip, sp
  10331c:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  103320:	e1a04000 	mov	r4, r0
  103324:	e24cb004 	sub	fp, ip, #4	; 0x4
  103328:	eb000470 	bl	1044f0 <vPortEnterCritical>
  10332c:	e5943048 	ldr	r3, [r4, #72]
  103330:	e3530000 	cmp	r3, #0	; 0x0
  103334:	ca000005 	bgt	103350 <prvUnlockQueue+0x38>
  103338:	ea000010 	b	103380 <prvUnlockQueue+0x68>
  10333c:	e5943048 	ldr	r3, [r4, #72]
  103340:	e2433001 	sub	r3, r3, #1	; 0x1
  103344:	e3530000 	cmp	r3, #0	; 0x0
  103348:	da00000c 	ble	103380 <prvUnlockQueue+0x68>
  10334c:	e5843048 	str	r3, [r4, #72]
  103350:	e5943024 	ldr	r3, [r4, #36]
  103354:	e3530000 	cmp	r3, #0	; 0x0
  103358:	e2840024 	add	r0, r4, #36	; 0x24
  10335c:	0a000007 	beq	103380 <prvUnlockQueue+0x68>
  103360:	eb00025a 	bl	103cd0 <xTaskRemoveFromEventList>
  103364:	e3500000 	cmp	r0, #0	; 0x0
  103368:	0afffff3 	beq	10333c <prvUnlockQueue+0x24>
  10336c:	eb0002b6 	bl	103e4c <vTaskMissedYield>
  103370:	e5943048 	ldr	r3, [r4, #72]
  103374:	e2433001 	sub	r3, r3, #1	; 0x1
  103378:	e3530000 	cmp	r3, #0	; 0x0
  10337c:	cafffff2 	bgt	10334c <prvUnlockQueue+0x34>
  103380:	e3e03000 	mvn	r3, #0	; 0x0
  103384:	e5843048 	str	r3, [r4, #72]
  103388:	eb000463 	bl	10451c <vPortExitCritical>
  10338c:	eb000457 	bl	1044f0 <vPortEnterCritical>
  103390:	e5943044 	ldr	r3, [r4, #68]
  103394:	e3530000 	cmp	r3, #0	; 0x0
  103398:	ca000005 	bgt	1033b4 <prvUnlockQueue+0x9c>
  10339c:	ea000010 	b	1033e4 <prvUnlockQueue+0xcc>
  1033a0:	e5943044 	ldr	r3, [r4, #68]
  1033a4:	e2433001 	sub	r3, r3, #1	; 0x1
  1033a8:	e3530000 	cmp	r3, #0	; 0x0
  1033ac:	da00000c 	ble	1033e4 <prvUnlockQueue+0xcc>
  1033b0:	e5843044 	str	r3, [r4, #68]
  1033b4:	e5943010 	ldr	r3, [r4, #16]
  1033b8:	e3530000 	cmp	r3, #0	; 0x0
  1033bc:	e2840010 	add	r0, r4, #16	; 0x10
  1033c0:	0a000007 	beq	1033e4 <prvUnlockQueue+0xcc>
  1033c4:	eb000241 	bl	103cd0 <xTaskRemoveFromEventList>
  1033c8:	e3500000 	cmp	r0, #0	; 0x0
  1033cc:	0afffff3 	beq	1033a0 <prvUnlockQueue+0x88>
  1033d0:	eb00029d 	bl	103e4c <vTaskMissedYield>
  1033d4:	e5943044 	ldr	r3, [r4, #68]
  1033d8:	e2433001 	sub	r3, r3, #1	; 0x1
  1033dc:	e3530000 	cmp	r3, #0	; 0x0
  1033e0:	cafffff2 	bgt	1033b0 <prvUnlockQueue+0x98>
  1033e4:	e3e03000 	mvn	r3, #0	; 0x0
  1033e8:	e5843044 	str	r3, [r4, #68]
  1033ec:	e89d6810 	ldmia	sp, {r4, fp, sp, lr}
  1033f0:	ea000449 	b	10451c <vPortExitCritical>

001033f4 <xQueueGenericReceive>:
  1033f4:	e1a0c00d 	mov	ip, sp
  1033f8:	e92dd8f0 	stmdb	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
  1033fc:	e24cb004 	sub	fp, ip, #4	; 0x4
  103400:	e24dd00c 	sub	sp, sp, #12	; 0xc
  103404:	e50b2028 	str	r2, [fp, #-40]
  103408:	e1a05000 	mov	r5, r0
  10340c:	e1a07001 	mov	r7, r1
  103410:	e1a06003 	mov	r6, r3
  103414:	e3a04001 	mov	r4, #1	; 0x1
  103418:	e51b3028 	ldr	r3, [fp, #-40]
  10341c:	e3530000 	cmp	r3, #0	; 0x0
  103420:	1a000013 	bne	103474 <xQueueGenericReceive+0x80>
  103424:	eb000431 	bl	1044f0 <vPortEnterCritical>
  103428:	e5950038 	ldr	r0, [r5, #56]
  10342c:	e3500000 	cmp	r0, #0	; 0x0
  103430:	01a04000 	moveq	r4, r0
  103434:	1a000035 	bne	103510 <xQueueGenericReceive+0x11c>
  103438:	eb000437 	bl	10451c <vPortExitCritical>
  10343c:	e3540000 	cmp	r4, #0	; 0x0
  103440:	1a000042 	bne	103550 <xQueueGenericReceive+0x15c>
  103444:	e51b3028 	ldr	r3, [fp, #-40]
  103448:	e3530000 	cmp	r3, #0	; 0x0
  10344c:	0a000041 	beq	103558 <xQueueGenericReceive+0x164>
  103450:	e24b0024 	sub	r0, fp, #36	; 0x24
  103454:	e24b1028 	sub	r1, fp, #40	; 0x28
  103458:	eb000250 	bl	103da0 <xTaskCheckForTimeOut>
  10345c:	e3500000 	cmp	r0, #0	; 0x0
  103460:	1a00003c 	bne	103558 <xQueueGenericReceive+0x164>
  103464:	e51b3028 	ldr	r3, [fp, #-40]
  103468:	e3530000 	cmp	r3, #0	; 0x0
  10346c:	e2444001 	sub	r4, r4, #1	; 0x1
  103470:	0affffeb 	beq	103424 <xQueueGenericReceive+0x30>
  103474:	eb0000b9 	bl	103760 <vTaskSuspendAll>
  103478:	eb00041c 	bl	1044f0 <vPortEnterCritical>
  10347c:	e5953044 	ldr	r3, [r5, #68]
  103480:	e3730001 	cmn	r3, #1	; 0x1
  103484:	02833001 	addeq	r3, r3, #1	; 0x1
  103488:	05853044 	streq	r3, [r5, #68]
  10348c:	e5953048 	ldr	r3, [r5, #72]
  103490:	e3730001 	cmn	r3, #1	; 0x1
  103494:	02833001 	addeq	r3, r3, #1	; 0x1
  103498:	05853048 	streq	r3, [r5, #72]
  10349c:	eb00041e 	bl	10451c <vPortExitCritical>
  1034a0:	e3540001 	cmp	r4, #1	; 0x1
  1034a4:	0a000043 	beq	1035b8 <xQueueGenericReceive+0x1c4>
  1034a8:	eb000410 	bl	1044f0 <vPortEnterCritical>
  1034ac:	e5954038 	ldr	r4, [r5, #56]
  1034b0:	e2744001 	rsbs	r4, r4, #1	; 0x1
  1034b4:	33a04000 	movcc	r4, #0	; 0x0
  1034b8:	eb000417 	bl	10451c <vPortExitCritical>
  1034bc:	e3540000 	cmp	r4, #0	; 0x0
  1034c0:	0a00002e 	beq	103580 <xQueueGenericReceive+0x18c>
  1034c4:	e24b0024 	sub	r0, fp, #36	; 0x24
  1034c8:	e24b1028 	sub	r1, fp, #40	; 0x28
  1034cc:	eb000233 	bl	103da0 <xTaskCheckForTimeOut>
  1034d0:	e3500000 	cmp	r0, #0	; 0x0
  1034d4:	1a000029 	bne	103580 <xQueueGenericReceive+0x18c>
  1034d8:	e51b1028 	ldr	r1, [fp, #-40]
  1034dc:	e2850024 	add	r0, r5, #36	; 0x24
  1034e0:	eb0001d5 	bl	103c3c <vTaskPlaceOnEventList>
  1034e4:	e1a00005 	mov	r0, r5
  1034e8:	ebffff8a 	bl	103318 <prvUnlockQueue>
  1034ec:	eb0000f1 	bl	1038b8 <xTaskResumeAll>
  1034f0:	e3500000 	cmp	r0, #0	; 0x0
  1034f4:	1affffca 	bne	103424 <xQueueGenericReceive+0x30>
  1034f8:	ef000000 	swi	0x00000000
  1034fc:	eb0003fb 	bl	1044f0 <vPortEnterCritical>
  103500:	e5950038 	ldr	r0, [r5, #56]
  103504:	e3500000 	cmp	r0, #0	; 0x0
  103508:	01a04000 	moveq	r4, r0
  10350c:	0affffc9 	beq	103438 <xQueueGenericReceive+0x44>
  103510:	e1a00005 	mov	r0, r5
  103514:	e1a01007 	mov	r1, r7
  103518:	e595400c 	ldr	r4, [r5, #12]
  10351c:	ebffff28 	bl	1031c4 <prvCopyDataFromQueue>
  103520:	e3560000 	cmp	r6, #0	; 0x0
  103524:	1a000019 	bne	103590 <xQueueGenericReceive+0x19c>
  103528:	e5953038 	ldr	r3, [r5, #56]
  10352c:	e2433001 	sub	r3, r3, #1	; 0x1
  103530:	e5853038 	str	r3, [r5, #56]
  103534:	e5952010 	ldr	r2, [r5, #16]
  103538:	e3520000 	cmp	r2, #0	; 0x0
  10353c:	1a000008 	bne	103564 <xQueueGenericReceive+0x170>
  103540:	e3a04001 	mov	r4, #1	; 0x1
  103544:	eb0003f4 	bl	10451c <vPortExitCritical>
  103548:	e3540000 	cmp	r4, #0	; 0x0
  10354c:	0affffbc 	beq	103444 <xQueueGenericReceive+0x50>
  103550:	e3740001 	cmn	r4, #1	; 0x1
  103554:	0affffaf 	beq	103418 <xQueueGenericReceive+0x24>
  103558:	e1a00004 	mov	r0, r4
  10355c:	e24bd01c 	sub	sp, fp, #28	; 0x1c
  103560:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103564:	e2850010 	add	r0, r5, #16	; 0x10
  103568:	eb0001d8 	bl	103cd0 <xTaskRemoveFromEventList>
  10356c:	e3500001 	cmp	r0, #1	; 0x1
  103570:	1afffff2 	bne	103540 <xQueueGenericReceive+0x14c>
  103574:	ef000000 	swi	0x00000000
  103578:	e3a04001 	mov	r4, #1	; 0x1
  10357c:	eafffff0 	b	103544 <xQueueGenericReceive+0x150>
  103580:	e1a00005 	mov	r0, r5
  103584:	ebffff63 	bl	103318 <prvUnlockQueue>
  103588:	eb0000ca 	bl	1038b8 <xTaskResumeAll>
  10358c:	eaffffa4 	b	103424 <xQueueGenericReceive+0x30>
  103590:	e5953024 	ldr	r3, [r5, #36]
  103594:	e3530000 	cmp	r3, #0	; 0x0
  103598:	e585400c 	str	r4, [r5, #12]
  10359c:	0affffe7 	beq	103540 <xQueueGenericReceive+0x14c>
  1035a0:	e2850024 	add	r0, r5, #36	; 0x24
  1035a4:	eb0001c9 	bl	103cd0 <xTaskRemoveFromEventList>
  1035a8:	e3500000 	cmp	r0, #0	; 0x0
  1035ac:	0affffe3 	beq	103540 <xQueueGenericReceive+0x14c>
  1035b0:	ef000000 	swi	0x00000000
  1035b4:	eaffffef 	b	103578 <xQueueGenericReceive+0x184>
  1035b8:	e24b0024 	sub	r0, fp, #36	; 0x24
  1035bc:	eb0001ef 	bl	103d80 <vTaskSetTimeOutState>
  1035c0:	eaffffb8 	b	1034a8 <xQueueGenericReceive+0xb4>

001035c4 <xQueueGenericSend>:
  1035c4:	e1a0c00d 	mov	ip, sp
  1035c8:	e92dd8f0 	stmdb	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
  1035cc:	e24cb004 	sub	fp, ip, #4	; 0x4
  1035d0:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1035d4:	e50b2028 	str	r2, [fp, #-40]
  1035d8:	e1a05000 	mov	r5, r0
  1035dc:	e1a06001 	mov	r6, r1
  1035e0:	e1a07003 	mov	r7, r3
  1035e4:	e3a04001 	mov	r4, #1	; 0x1
  1035e8:	e51b3028 	ldr	r3, [fp, #-40]
  1035ec:	e3530000 	cmp	r3, #0	; 0x0
  1035f0:	1a000014 	bne	103648 <xQueueGenericSend+0x84>
  1035f4:	eb0003bd 	bl	1044f0 <vPortEnterCritical>
  1035f8:	e5952038 	ldr	r2, [r5, #56]
  1035fc:	e595303c 	ldr	r3, [r5, #60]
  103600:	e1520003 	cmp	r2, r3
  103604:	23a04000 	movcs	r4, #0	; 0x0
  103608:	3a000038 	bcc	1036f0 <xQueueGenericSend+0x12c>
  10360c:	eb0003c2 	bl	10451c <vPortExitCritical>
  103610:	e3540000 	cmp	r4, #0	; 0x0
  103614:	1a000045 	bne	103730 <xQueueGenericSend+0x16c>
  103618:	e51b3028 	ldr	r3, [fp, #-40]
  10361c:	e3530000 	cmp	r3, #0	; 0x0
  103620:	0a000044 	beq	103738 <xQueueGenericSend+0x174>
  103624:	e24b0024 	sub	r0, fp, #36	; 0x24
  103628:	e24b1028 	sub	r1, fp, #40	; 0x28
  10362c:	eb0001db 	bl	103da0 <xTaskCheckForTimeOut>
  103630:	e3500000 	cmp	r0, #0	; 0x0
  103634:	1a00003f 	bne	103738 <xQueueGenericSend+0x174>
  103638:	e51b3028 	ldr	r3, [fp, #-40]
  10363c:	e3530000 	cmp	r3, #0	; 0x0
  103640:	e2444001 	sub	r4, r4, #1	; 0x1
  103644:	0affffea 	beq	1035f4 <xQueueGenericSend+0x30>
  103648:	eb000044 	bl	103760 <vTaskSuspendAll>
  10364c:	eb0003a7 	bl	1044f0 <vPortEnterCritical>
  103650:	e5953044 	ldr	r3, [r5, #68]
  103654:	e3730001 	cmn	r3, #1	; 0x1
  103658:	02833001 	addeq	r3, r3, #1	; 0x1
  10365c:	05853044 	streq	r3, [r5, #68]
  103660:	e5953048 	ldr	r3, [r5, #72]
  103664:	e3730001 	cmn	r3, #1	; 0x1
  103668:	02833001 	addeq	r3, r3, #1	; 0x1
  10366c:	05853048 	streq	r3, [r5, #72]
  103670:	eb0003a9 	bl	10451c <vPortExitCritical>
  103674:	e3540001 	cmp	r4, #1	; 0x1
  103678:	0a000035 	beq	103754 <xQueueGenericSend+0x190>
  10367c:	eb00039b 	bl	1044f0 <vPortEnterCritical>
  103680:	e5954038 	ldr	r4, [r5, #56]
  103684:	e595303c 	ldr	r3, [r5, #60]
  103688:	e1540003 	cmp	r4, r3
  10368c:	13a04000 	movne	r4, #0	; 0x0
  103690:	03a04001 	moveq	r4, #1	; 0x1
  103694:	eb0003a0 	bl	10451c <vPortExitCritical>
  103698:	e3540000 	cmp	r4, #0	; 0x0
  10369c:	0a000028 	beq	103744 <xQueueGenericSend+0x180>
  1036a0:	e24b0024 	sub	r0, fp, #36	; 0x24
  1036a4:	e24b1028 	sub	r1, fp, #40	; 0x28
  1036a8:	eb0001bc 	bl	103da0 <xTaskCheckForTimeOut>
  1036ac:	e3500000 	cmp	r0, #0	; 0x0
  1036b0:	1a000023 	bne	103744 <xQueueGenericSend+0x180>
  1036b4:	e51b1028 	ldr	r1, [fp, #-40]
  1036b8:	e2850010 	add	r0, r5, #16	; 0x10
  1036bc:	eb00015e 	bl	103c3c <vTaskPlaceOnEventList>
  1036c0:	e1a00005 	mov	r0, r5
  1036c4:	ebffff13 	bl	103318 <prvUnlockQueue>
  1036c8:	eb00007a 	bl	1038b8 <xTaskResumeAll>
  1036cc:	e3500000 	cmp	r0, #0	; 0x0
  1036d0:	1affffc7 	bne	1035f4 <xQueueGenericSend+0x30>
  1036d4:	ef000000 	swi	0x00000000
  1036d8:	eb000384 	bl	1044f0 <vPortEnterCritical>
  1036dc:	e5952038 	ldr	r2, [r5, #56]
  1036e0:	e595303c 	ldr	r3, [r5, #60]
  1036e4:	e1520003 	cmp	r2, r3
  1036e8:	23a04000 	movcs	r4, #0	; 0x0
  1036ec:	2affffc6 	bcs	10360c <xQueueGenericSend+0x48>
  1036f0:	e1a00005 	mov	r0, r5
  1036f4:	e1a01006 	mov	r1, r6
  1036f8:	e1a02007 	mov	r2, r7
  1036fc:	ebfffec0 	bl	103204 <prvCopyDataToQueue>
  103700:	e5953024 	ldr	r3, [r5, #36]
  103704:	e3530000 	cmp	r3, #0	; 0x0
  103708:	e3a04001 	mov	r4, #1	; 0x1
  10370c:	0affffbe 	beq	10360c <xQueueGenericSend+0x48>
  103710:	e2850024 	add	r0, r5, #36	; 0x24
  103714:	eb00016d 	bl	103cd0 <xTaskRemoveFromEventList>
  103718:	e1500004 	cmp	r0, r4
  10371c:	1affffba 	bne	10360c <xQueueGenericSend+0x48>
  103720:	ef000000 	swi	0x00000000
  103724:	eb00037c 	bl	10451c <vPortExitCritical>
  103728:	e3540000 	cmp	r4, #0	; 0x0
  10372c:	0affffb9 	beq	103618 <xQueueGenericSend+0x54>
  103730:	e3740001 	cmn	r4, #1	; 0x1
  103734:	0affffab 	beq	1035e8 <xQueueGenericSend+0x24>
  103738:	e1a00004 	mov	r0, r4
  10373c:	e24bd01c 	sub	sp, fp, #28	; 0x1c
  103740:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103744:	e1a00005 	mov	r0, r5
  103748:	ebfffef2 	bl	103318 <prvUnlockQueue>
  10374c:	eb000059 	bl	1038b8 <xTaskResumeAll>
  103750:	eaffffa7 	b	1035f4 <xQueueGenericSend+0x30>
  103754:	e24b0024 	sub	r0, fp, #36	; 0x24
  103758:	eb000188 	bl	103d80 <vTaskSetTimeOutState>
  10375c:	eaffffc6 	b	10367c <xQueueGenericSend+0xb8>

00103760 <vTaskSuspendAll>:
  103760:	e1a0c00d 	mov	ip, sp
  103764:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  103768:	e24cb004 	sub	fp, ip, #4	; 0x4
  10376c:	eb00035f 	bl	1044f0 <vPortEnterCritical>
  103770:	e59f2010 	ldr	r2, [pc, #16]	; 103788 <prog+0x2744>
  103774:	e5923000 	ldr	r3, [r2]
  103778:	e2833001 	add	r3, r3, #1	; 0x1
  10377c:	e5823000 	str	r3, [r2]
  103780:	e89d6800 	ldmia	sp, {fp, sp, lr}
  103784:	ea000364 	b	10451c <vPortExitCritical>
  103788:	002008f0 	streqd	r0, [r0], -r0

0010378c <vTaskIncrementTick>:
  10378c:	e1a0c00d 	mov	ip, sp
  103790:	e92dd8f0 	stmdb	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
  103794:	e59f30fc 	ldr	r3, [pc, #252]	; 103898 <prog+0x2854>
  103798:	e5932000 	ldr	r2, [r3]
  10379c:	e3520000 	cmp	r2, #0	; 0x0
  1037a0:	159f20f4 	ldrne	r2, [pc, #244]	; 10389c <prog+0x2858>
  1037a4:	15923000 	ldrne	r3, [r2]
  1037a8:	12833001 	addne	r3, r3, #1	; 0x1
  1037ac:	e24cb004 	sub	fp, ip, #4	; 0x4
  1037b0:	15823000 	strne	r3, [r2]
  1037b4:	189da8f0 	ldmneia	sp, {r4, r5, r6, r7, fp, sp, pc}
  1037b8:	e59f60e0 	ldr	r6, [pc, #224]	; 1038a0 <prog+0x285c>
  1037bc:	e5963000 	ldr	r3, [r6]
  1037c0:	e2833001 	add	r3, r3, #1	; 0x1
  1037c4:	e5863000 	str	r3, [r6]
  1037c8:	e5962000 	ldr	r2, [r6]
  1037cc:	e3520000 	cmp	r2, #0	; 0x0
  1037d0:	159f70cc 	ldrne	r7, [pc, #204]	; 1038a4 <prog+0x2860>
  1037d4:	1a000019 	bne	103840 <vTaskIncrementTick+0xb4>
  1037d8:	e59f70c4 	ldr	r7, [pc, #196]	; 1038a4 <prog+0x2860>
  1037dc:	e59f10c4 	ldr	r1, [pc, #196]	; 1038a8 <prog+0x2864>
  1037e0:	e5970000 	ldr	r0, [r7]
  1037e4:	e5913000 	ldr	r3, [r1]
  1037e8:	e59f20bc 	ldr	r2, [pc, #188]	; 1038ac <prog+0x2868>
  1037ec:	e5873000 	str	r3, [r7]
  1037f0:	e5810000 	str	r0, [r1]
  1037f4:	e5923000 	ldr	r3, [r2]
  1037f8:	e2833001 	add	r3, r3, #1	; 0x1
  1037fc:	e5823000 	str	r3, [r2]
  103800:	e5973000 	ldr	r3, [r7]
  103804:	e5932000 	ldr	r2, [r3]
  103808:	e3520000 	cmp	r2, #0	; 0x0
  10380c:	1a00000f 	bne	103850 <vTaskIncrementTick+0xc4>
  103810:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103814:	ebfffe2a 	bl	1030c4 <vListRemove>
  103818:	e59fe090 	ldr	lr, [pc, #144]	; 1038b0 <prog+0x286c>
  10381c:	e594c02c 	ldr	ip, [r4, #44]
  103820:	e59e2000 	ldr	r2, [lr]
  103824:	e59f0088 	ldr	r0, [pc, #136]	; 1038b4 <prog+0x2870>
  103828:	e08c310c 	add	r3, ip, ip, lsl #2
  10382c:	e15c0002 	cmp	ip, r2
  103830:	e1a01005 	mov	r1, r5
  103834:	e0800103 	add	r0, r0, r3, lsl #2
  103838:	858ec000 	strhi	ip, [lr]
  10383c:	ebfffdfc 	bl	103034 <vListInsertEnd>
  103840:	e5973000 	ldr	r3, [r7]
  103844:	e5932000 	ldr	r2, [r3]
  103848:	e3520000 	cmp	r2, #0	; 0x0
  10384c:	089da8f0 	ldmeqia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103850:	e5973000 	ldr	r3, [r7]
  103854:	e593200c 	ldr	r2, [r3, #12]
  103858:	e592400c 	ldr	r4, [r2, #12]
  10385c:	e2845004 	add	r5, r4, #4	; 0x4
  103860:	e3540000 	cmp	r4, #0	; 0x0
  103864:	e1a00005 	mov	r0, r5
  103868:	0a000009 	beq	103894 <vTaskIncrementTick+0x108>
  10386c:	e5942004 	ldr	r2, [r4, #4]
  103870:	e5963000 	ldr	r3, [r6]
  103874:	e1520003 	cmp	r2, r3
  103878:	889da8f0 	ldmhiia	sp, {r4, r5, r6, r7, fp, sp, pc}
  10387c:	ebfffe10 	bl	1030c4 <vListRemove>
  103880:	e5943028 	ldr	r3, [r4, #40]
  103884:	e3530000 	cmp	r3, #0	; 0x0
  103888:	e2840018 	add	r0, r4, #24	; 0x18
  10388c:	0affffe1 	beq	103818 <vTaskIncrementTick+0x8c>
  103890:	eaffffdf 	b	103814 <vTaskIncrementTick+0x88>
  103894:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103898:	002008f0 	streqd	r0, [r0], -r0
  10389c:	002008f4 	streqd	r0, [r0], -r4
  1038a0:	002008e4 	eoreq	r0, r0, r4, ror #17
  1038a4:	002011a0 	eoreq	r1, r0, r0, lsr #3
  1038a8:	002011a4 	eoreq	r1, r0, r4, lsr #3
  1038ac:	002008e8 	eoreq	r0, r0, r8, ror #17
  1038b0:	002008ec 	eoreq	r0, r0, ip, ror #17
  1038b4:	00201114 	eoreq	r1, r0, r4, lsl r1

001038b8 <xTaskResumeAll>:
  1038b8:	e1a0c00d 	mov	ip, sp
  1038bc:	e92dddf0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, ip, lr, pc}
  1038c0:	e59fa20c 	ldr	sl, [pc, #524]	; 103ad4 <prog+0x2a90>
  1038c4:	e24cb004 	sub	fp, ip, #4	; 0x4
  1038c8:	eb000308 	bl	1044f0 <vPortEnterCritical>
  1038cc:	e59a3000 	ldr	r3, [sl]
  1038d0:	e2433001 	sub	r3, r3, #1	; 0x1
  1038d4:	e58a3000 	str	r3, [sl]
  1038d8:	e59a2000 	ldr	r2, [sl]
  1038dc:	e3520000 	cmp	r2, #0	; 0x0
  1038e0:	e3a07000 	mov	r7, #0	; 0x0
  1038e4:	1a000005 	bne	103900 <xTaskResumeAll+0x48>
  1038e8:	e59f31e8 	ldr	r3, [pc, #488]	; 103ad8 <prog+0x2a94>
  1038ec:	e5932000 	ldr	r2, [r3]
  1038f0:	e1520007 	cmp	r2, r7
  1038f4:	11a06007 	movne	r6, r7
  1038f8:	159f81dc 	ldrne	r8, [pc, #476]	; 103adc <prog+0x2a98>
  1038fc:	1a00001c 	bne	103974 <xTaskResumeAll+0xbc>
  103900:	eb000305 	bl	10451c <vPortExitCritical>
  103904:	e1a00007 	mov	r0, r7
  103908:	e89dadf0 	ldmia	sp, {r4, r5, r6, r7, r8, sl, fp, sp, pc}
  10390c:	e59f31cc 	ldr	r3, [pc, #460]	; 103ae0 <prog+0x2a9c>
  103910:	e5932004 	ldr	r2, [r3, #4]
  103914:	e592400c 	ldr	r4, [r2, #12]
  103918:	e3540000 	cmp	r4, #0	; 0x0
  10391c:	e2840018 	add	r0, r4, #24	; 0x18
  103920:	e2845004 	add	r5, r4, #4	; 0x4
  103924:	0a000015 	beq	103980 <xTaskResumeAll+0xc8>
  103928:	ebfffde5 	bl	1030c4 <vListRemove>
  10392c:	e1a00005 	mov	r0, r5
  103930:	ebfffde3 	bl	1030c4 <vListRemove>
  103934:	e59fe1a8 	ldr	lr, [pc, #424]	; 103ae4 <prog+0x2aa0>
  103938:	e594c02c 	ldr	ip, [r4, #44]
  10393c:	e59e2000 	ldr	r2, [lr]
  103940:	e59f01a0 	ldr	r0, [pc, #416]	; 103ae8 <prog+0x2aa4>
  103944:	e15c0002 	cmp	ip, r2
  103948:	e08c310c 	add	r3, ip, ip, lsl #2
  10394c:	e1a01005 	mov	r1, r5
  103950:	e0800103 	add	r0, r0, r3, lsl #2
  103954:	858ec000 	strhi	ip, [lr]
  103958:	ebfffdb5 	bl	103034 <vListInsertEnd>
  10395c:	e59f3188 	ldr	r3, [pc, #392]	; 103aec <prog+0x2aa8>
  103960:	e5932000 	ldr	r2, [r3]
  103964:	e594102c 	ldr	r1, [r4, #44]
  103968:	e592302c 	ldr	r3, [r2, #44]
  10396c:	e1510003 	cmp	r1, r3
  103970:	23a06001 	movcs	r6, #1	; 0x1
  103974:	e5983000 	ldr	r3, [r8]
  103978:	e3530000 	cmp	r3, #0	; 0x0
  10397c:	1affffe2 	bne	10390c <xTaskResumeAll+0x54>
  103980:	e59f8168 	ldr	r8, [pc, #360]	; 103af0 <prog+0x2aac>
  103984:	e5983000 	ldr	r3, [r8]
  103988:	e3530000 	cmp	r3, #0	; 0x0
  10398c:	0a000049 	beq	103ab8 <xTaskResumeAll+0x200>
  103990:	e5983000 	ldr	r3, [r8]
  103994:	e3530000 	cmp	r3, #0	; 0x0
  103998:	0a00003e 	beq	103a98 <xTaskResumeAll+0x1e0>
  10399c:	e59a3000 	ldr	r3, [sl]
  1039a0:	e3530000 	cmp	r3, #0	; 0x0
  1039a4:	15983000 	ldrne	r3, [r8]
  1039a8:	12833001 	addne	r3, r3, #1	; 0x1
  1039ac:	15883000 	strne	r3, [r8]
  1039b0:	1a000032 	bne	103a80 <xTaskResumeAll+0x1c8>
  1039b4:	e59f6138 	ldr	r6, [pc, #312]	; 103af4 <prog+0x2ab0>
  1039b8:	e5963000 	ldr	r3, [r6]
  1039bc:	e2833001 	add	r3, r3, #1	; 0x1
  1039c0:	e5863000 	str	r3, [r6]
  1039c4:	e5962000 	ldr	r2, [r6]
  1039c8:	e3520000 	cmp	r2, #0	; 0x0
  1039cc:	159f7124 	ldrne	r7, [pc, #292]	; 103af8 <prog+0x2ab4>
  1039d0:	1a000014 	bne	103a28 <xTaskResumeAll+0x170>
  1039d4:	e59f711c 	ldr	r7, [pc, #284]	; 103af8 <prog+0x2ab4>
  1039d8:	e59f111c 	ldr	r1, [pc, #284]	; 103afc <prog+0x2ab8>
  1039dc:	e5970000 	ldr	r0, [r7]
  1039e0:	e5913000 	ldr	r3, [r1]
  1039e4:	e59f2114 	ldr	r2, [pc, #276]	; 103b00 <prog+0x2abc>
  1039e8:	e5873000 	str	r3, [r7]
  1039ec:	e5810000 	str	r0, [r1]
  1039f0:	e5923000 	ldr	r3, [r2]
  1039f4:	e2833001 	add	r3, r3, #1	; 0x1
  1039f8:	e5823000 	str	r3, [r2]
  1039fc:	ea000009 	b	103a28 <xTaskResumeAll+0x170>
  103a00:	e59fe0dc 	ldr	lr, [pc, #220]	; 103ae4 <prog+0x2aa0>
  103a04:	e594c02c 	ldr	ip, [r4, #44]
  103a08:	e59e2000 	ldr	r2, [lr]
  103a0c:	e59f00d4 	ldr	r0, [pc, #212]	; 103ae8 <prog+0x2aa4>
  103a10:	e08c310c 	add	r3, ip, ip, lsl #2
  103a14:	e15c0002 	cmp	ip, r2
  103a18:	e1a01005 	mov	r1, r5
  103a1c:	e0800103 	add	r0, r0, r3, lsl #2
  103a20:	858ec000 	strhi	ip, [lr]
  103a24:	ebfffd82 	bl	103034 <vListInsertEnd>
  103a28:	e5973000 	ldr	r3, [r7]
  103a2c:	e5932000 	ldr	r2, [r3]
  103a30:	e3520000 	cmp	r2, #0	; 0x0
  103a34:	0a000011 	beq	103a80 <xTaskResumeAll+0x1c8>
  103a38:	e5973000 	ldr	r3, [r7]
  103a3c:	e593200c 	ldr	r2, [r3, #12]
  103a40:	e592400c 	ldr	r4, [r2, #12]
  103a44:	e2845004 	add	r5, r4, #4	; 0x4
  103a48:	e3540000 	cmp	r4, #0	; 0x0
  103a4c:	e1a00005 	mov	r0, r5
  103a50:	0a00000a 	beq	103a80 <xTaskResumeAll+0x1c8>
  103a54:	e5942004 	ldr	r2, [r4, #4]
  103a58:	e5963000 	ldr	r3, [r6]
  103a5c:	e1520003 	cmp	r2, r3
  103a60:	8a000006 	bhi	103a80 <xTaskResumeAll+0x1c8>
  103a64:	ebfffd96 	bl	1030c4 <vListRemove>
  103a68:	e5943028 	ldr	r3, [r4, #40]
  103a6c:	e3530000 	cmp	r3, #0	; 0x0
  103a70:	e2840018 	add	r0, r4, #24	; 0x18
  103a74:	0affffe1 	beq	103a00 <xTaskResumeAll+0x148>
  103a78:	ebfffd91 	bl	1030c4 <vListRemove>
  103a7c:	eaffffdf 	b	103a00 <xTaskResumeAll+0x148>
  103a80:	e5983000 	ldr	r3, [r8]
  103a84:	e2433001 	sub	r3, r3, #1	; 0x1
  103a88:	e5883000 	str	r3, [r8]
  103a8c:	e5982000 	ldr	r2, [r8]
  103a90:	e3520000 	cmp	r2, #0	; 0x0
  103a94:	1affffc0 	bne	10399c <xTaskResumeAll+0xe4>
  103a98:	e59f2064 	ldr	r2, [pc, #100]	; 103b04 <prog+0x2ac0>
  103a9c:	e3a03000 	mov	r3, #0	; 0x0
  103aa0:	e5823000 	str	r3, [r2]
  103aa4:	e3a07001 	mov	r7, #1	; 0x1
  103aa8:	ef000000 	swi	0x00000000
  103aac:	eb00029a 	bl	10451c <vPortExitCritical>
  103ab0:	e1a00007 	mov	r0, r7
  103ab4:	e89dadf0 	ldmia	sp, {r4, r5, r6, r7, r8, sl, fp, sp, pc}
  103ab8:	e3560001 	cmp	r6, #1	; 0x1
  103abc:	0afffff5 	beq	103a98 <xTaskResumeAll+0x1e0>
  103ac0:	e59f203c 	ldr	r2, [pc, #60]	; 103b04 <prog+0x2ac0>
  103ac4:	e5923000 	ldr	r3, [r2]
  103ac8:	e3530001 	cmp	r3, #1	; 0x1
  103acc:	1affff8b 	bne	103900 <xTaskResumeAll+0x48>
  103ad0:	eafffff1 	b	103a9c <xTaskResumeAll+0x1e4>
  103ad4:	002008f0 	streqd	r0, [r0], -r0
  103ad8:	002008f8 	streqd	r0, [r0], -r8
  103adc:	002011a8 	eoreq	r1, r0, r8, lsr #3
  103ae0:	002011b0 	streqh	r1, [r0], -r0
  103ae4:	002008ec 	eoreq	r0, r0, ip, ror #17
  103ae8:	00201114 	eoreq	r1, r0, r4, lsl r1
  103aec:	002008dc 	ldreqd	r0, [r0], -ip
  103af0:	002008f4 	streqd	r0, [r0], -r4
  103af4:	002008e4 	eoreq	r0, r0, r4, ror #17
  103af8:	002011a0 	eoreq	r1, r0, r0, lsr #3
  103afc:	002011a4 	eoreq	r1, r0, r4, lsr #3
  103b00:	002008e8 	eoreq	r0, r0, r8, ror #17
  103b04:	002008e0 	eoreq	r0, r0, r0, ror #17

00103b08 <vTaskDelay>:
  103b08:	e1a0c00d 	mov	ip, sp
  103b0c:	e92dd8f0 	stmdb	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
  103b10:	e2505000 	subs	r5, r0, #0	; 0x0
  103b14:	e24cb004 	sub	fp, ip, #4	; 0x4
  103b18:	e59f6060 	ldr	r6, [pc, #96]	; 103b80 <prog+0x2b3c>
  103b1c:	e59f7060 	ldr	r7, [pc, #96]	; 103b84 <prog+0x2b40>
  103b20:	1a000001 	bne	103b2c <vTaskDelay+0x24>
  103b24:	ef000000 	swi	0x00000000
  103b28:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103b2c:	ebffff0b 	bl	103760 <vTaskSuspendAll>
  103b30:	e5974000 	ldr	r4, [r7]
  103b34:	e5960000 	ldr	r0, [r6]
  103b38:	e2800004 	add	r0, r0, #4	; 0x4
  103b3c:	ebfffd60 	bl	1030c4 <vListRemove>
  103b40:	e5962000 	ldr	r2, [r6]
  103b44:	e5973000 	ldr	r3, [r7]
  103b48:	e0844005 	add	r4, r4, r5
  103b4c:	e1540003 	cmp	r4, r3
  103b50:	359f3030 	ldrcc	r3, [pc, #48]	; 103b88 <prog+0x2b44>
  103b54:	259f3030 	ldrcs	r3, [pc, #48]	; 103b8c <prog+0x2b48>
  103b58:	e5930000 	ldr	r0, [r3]
  103b5c:	e5961000 	ldr	r1, [r6]
  103b60:	e5824004 	str	r4, [r2, #4]
  103b64:	e2811004 	add	r1, r1, #4	; 0x4
  103b68:	ebfffd3f 	bl	10306c <vListInsert>
  103b6c:	ebffff51 	bl	1038b8 <xTaskResumeAll>
  103b70:	e3500000 	cmp	r0, #0	; 0x0
  103b74:	189da8f0 	ldmneia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103b78:	ef000000 	swi	0x00000000
  103b7c:	e89da8f0 	ldmia	sp, {r4, r5, r6, r7, fp, sp, pc}
  103b80:	002008dc 	ldreqd	r0, [r0], -ip
  103b84:	002008e4 	eoreq	r0, r0, r4, ror #17
  103b88:	002011a4 	eoreq	r1, r0, r4, lsr #3
  103b8c:	002011a0 	eoreq	r1, r0, r0, lsr #3

00103b90 <vTaskSwitchContext>:
  103b90:	e59f3090 	ldr	r3, [pc, #144]	; 103c28 <prog+0x2be4>
  103b94:	e5932000 	ldr	r2, [r3]
  103b98:	e3520000 	cmp	r2, #0	; 0x0
  103b9c:	13a02001 	movne	r2, #1	; 0x1
  103ba0:	159f3084 	ldrne	r3, [pc, #132]	; 103c2c <prog+0x2be8>
  103ba4:	1a00001d 	bne	103c20 <vTaskSwitchContext+0x90>
  103ba8:	e59f1080 	ldr	r1, [pc, #128]	; 103c30 <prog+0x2bec>
  103bac:	e5913000 	ldr	r3, [r1]
  103bb0:	e59fc07c 	ldr	ip, [pc, #124]	; 103c34 <prog+0x2bf0>
  103bb4:	e0833103 	add	r3, r3, r3, lsl #2
  103bb8:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  103bbc:	e3520000 	cmp	r2, #0	; 0x0
  103bc0:	e1a0000c 	mov	r0, ip
  103bc4:	e1a02001 	mov	r2, r1
  103bc8:	1a000008 	bne	103bf0 <vTaskSwitchContext+0x60>
  103bcc:	e5923000 	ldr	r3, [r2]
  103bd0:	e2433001 	sub	r3, r3, #1	; 0x1
  103bd4:	e5823000 	str	r3, [r2]
  103bd8:	e5912000 	ldr	r2, [r1]
  103bdc:	e0822102 	add	r2, r2, r2, lsl #2
  103be0:	e7903102 	ldr	r3, [r0, r2, lsl #2]
  103be4:	e59f2044 	ldr	r2, [pc, #68]	; 103c30 <prog+0x2bec>
  103be8:	e3530000 	cmp	r3, #0	; 0x0
  103bec:	0afffff6 	beq	103bcc <vTaskSwitchContext+0x3c>
  103bf0:	e5913000 	ldr	r3, [r1]
  103bf4:	e0833103 	add	r3, r3, r3, lsl #2
  103bf8:	e08c1103 	add	r1, ip, r3, lsl #2
  103bfc:	e5912004 	ldr	r2, [r1, #4]
  103c00:	e5922004 	ldr	r2, [r2, #4]
  103c04:	e2813008 	add	r3, r1, #8	; 0x8
  103c08:	e5812004 	str	r2, [r1, #4]
  103c0c:	e1520003 	cmp	r2, r3
  103c10:	05922004 	ldreq	r2, [r2, #4]
  103c14:	e59f301c 	ldr	r3, [pc, #28]	; 103c38 <prog+0x2bf4>
  103c18:	05812004 	streq	r2, [r1, #4]
  103c1c:	e592200c 	ldr	r2, [r2, #12]
  103c20:	e5832000 	str	r2, [r3]
  103c24:	e1a0f00e 	mov	pc, lr
  103c28:	002008f0 	streqd	r0, [r0], -r0
  103c2c:	002008e0 	eoreq	r0, r0, r0, ror #17
  103c30:	002008ec 	eoreq	r0, r0, ip, ror #17
  103c34:	00201114 	eoreq	r1, r0, r4, lsl r1
  103c38:	002008dc 	ldreqd	r0, [r0], -ip

00103c3c <vTaskPlaceOnEventList>:
  103c3c:	e1a0c00d 	mov	ip, sp
  103c40:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  103c44:	e59f4070 	ldr	r4, [pc, #112]	; 103cbc <prog+0x2c78>
  103c48:	e5943000 	ldr	r3, [r4]
  103c4c:	e24cb004 	sub	fp, ip, #4	; 0x4
  103c50:	e1a05001 	mov	r5, r1
  103c54:	e2831018 	add	r1, r3, #24	; 0x18
  103c58:	ebfffd03 	bl	10306c <vListInsert>
  103c5c:	e5940000 	ldr	r0, [r4]
  103c60:	e2800004 	add	r0, r0, #4	; 0x4
  103c64:	ebfffd16 	bl	1030c4 <vListRemove>
  103c68:	e3750001 	cmn	r5, #1	; 0x1
  103c6c:	e59f004c 	ldr	r0, [pc, #76]	; 103cc0 <prog+0x2c7c>
  103c70:	e59f204c 	ldr	r2, [pc, #76]	; 103cc4 <prog+0x2c80>
  103c74:	0a00000c 	beq	103cac <vTaskPlaceOnEventList+0x70>
  103c78:	e5923000 	ldr	r3, [r2]
  103c7c:	e5941000 	ldr	r1, [r4]
  103c80:	e5922000 	ldr	r2, [r2]
  103c84:	e0833005 	add	r3, r3, r5
  103c88:	e1530002 	cmp	r3, r2
  103c8c:	e5813004 	str	r3, [r1, #4]
  103c90:	359f3030 	ldrcc	r3, [pc, #48]	; 103cc8 <prog+0x2c84>
  103c94:	259f3030 	ldrcs	r3, [pc, #48]	; 103ccc <prog+0x2c88>
  103c98:	e5930000 	ldr	r0, [r3]
  103c9c:	e5941000 	ldr	r1, [r4]
  103ca0:	e2811004 	add	r1, r1, #4	; 0x4
  103ca4:	e89d6830 	ldmia	sp, {r4, r5, fp, sp, lr}
  103ca8:	eafffcef 	b	10306c <vListInsert>
  103cac:	e5941000 	ldr	r1, [r4]
  103cb0:	e2811004 	add	r1, r1, #4	; 0x4
  103cb4:	e89d6830 	ldmia	sp, {r4, r5, fp, sp, lr}
  103cb8:	eafffcdd 	b	103034 <vListInsertEnd>
  103cbc:	002008dc 	ldreqd	r0, [r0], -ip
  103cc0:	002011d0 	ldreqd	r1, [r0], -r0
  103cc4:	002008e4 	eoreq	r0, r0, r4, ror #17
  103cc8:	002011a4 	eoreq	r1, r0, r4, lsr #3
  103ccc:	002011a0 	eoreq	r1, r0, r0, lsr #3

00103cd0 <xTaskRemoveFromEventList>:
  103cd0:	e1a0c00d 	mov	ip, sp
  103cd4:	e92dd870 	stmdb	sp!, {r4, r5, r6, fp, ip, lr, pc}
  103cd8:	e1a03000 	mov	r3, r0
  103cdc:	e5900000 	ldr	r0, [r0]
  103ce0:	e3500000 	cmp	r0, #0	; 0x0
  103ce4:	1593300c 	ldrne	r3, [r3, #12]
  103ce8:	1593500c 	ldrne	r5, [r3, #12]
  103cec:	01a05000 	moveq	r5, r0
  103cf0:	e2854018 	add	r4, r5, #24	; 0x18
  103cf4:	e1a00004 	mov	r0, r4
  103cf8:	e24cb004 	sub	fp, ip, #4	; 0x4
  103cfc:	ebfffcf0 	bl	1030c4 <vListRemove>
  103d00:	e59f3064 	ldr	r3, [pc, #100]	; 103d6c <prog+0x2d28>
  103d04:	e5932000 	ldr	r2, [r3]
  103d08:	e2856004 	add	r6, r5, #4	; 0x4
  103d0c:	e3520000 	cmp	r2, #0	; 0x0
  103d10:	e1a00006 	mov	r0, r6
  103d14:	e1a01004 	mov	r1, r4
  103d18:	159f0050 	ldrne	r0, [pc, #80]	; 103d70 <prog+0x2d2c>
  103d1c:	1a000009 	bne	103d48 <xTaskRemoveFromEventList+0x78>
  103d20:	ebfffce7 	bl	1030c4 <vListRemove>
  103d24:	e59fe048 	ldr	lr, [pc, #72]	; 103d74 <prog+0x2d30>
  103d28:	e595c02c 	ldr	ip, [r5, #44]
  103d2c:	e59e2000 	ldr	r2, [lr]
  103d30:	e59f0040 	ldr	r0, [pc, #64]	; 103d78 <prog+0x2d34>
  103d34:	e15c0002 	cmp	ip, r2
  103d38:	e08c310c 	add	r3, ip, ip, lsl #2
  103d3c:	858ec000 	strhi	ip, [lr]
  103d40:	e1a01006 	mov	r1, r6
  103d44:	e0800103 	add	r0, r0, r3, lsl #2
  103d48:	ebfffcb9 	bl	103034 <vListInsertEnd>
  103d4c:	e59f3028 	ldr	r3, [pc, #40]	; 103d7c <prog+0x2d38>
  103d50:	e5932000 	ldr	r2, [r3]
  103d54:	e595102c 	ldr	r1, [r5, #44]
  103d58:	e592002c 	ldr	r0, [r2, #44]
  103d5c:	e1510000 	cmp	r1, r0
  103d60:	33a00000 	movcc	r0, #0	; 0x0
  103d64:	23a00001 	movcs	r0, #1	; 0x1
  103d68:	e89da870 	ldmia	sp, {r4, r5, r6, fp, sp, pc}
  103d6c:	002008f0 	streqd	r0, [r0], -r0
  103d70:	002011a8 	eoreq	r1, r0, r8, lsr #3
  103d74:	002008ec 	eoreq	r0, r0, ip, ror #17
  103d78:	00201114 	eoreq	r1, r0, r4, lsl r1
  103d7c:	002008dc 	ldreqd	r0, [r0], -ip

00103d80 <vTaskSetTimeOutState>:
  103d80:	e59f3010 	ldr	r3, [pc, #16]	; 103d98 <prog+0x2d54>
  103d84:	e59f2010 	ldr	r2, [pc, #16]	; 103d9c <prog+0x2d58>
  103d88:	e5931000 	ldr	r1, [r3]
  103d8c:	e5923000 	ldr	r3, [r2]
  103d90:	e880000a 	stmia	r0, {r1, r3}
  103d94:	e1a0f00e 	mov	pc, lr
  103d98:	002008e8 	eoreq	r0, r0, r8, ror #17
  103d9c:	002008e4 	eoreq	r0, r0, r4, ror #17

00103da0 <xTaskCheckForTimeOut>:
  103da0:	e1a0c00d 	mov	ip, sp
  103da4:	e92dd870 	stmdb	sp!, {r4, r5, r6, fp, ip, lr, pc}
  103da8:	e24cb004 	sub	fp, ip, #4	; 0x4
  103dac:	e1a06001 	mov	r6, r1
  103db0:	e1a04000 	mov	r4, r0
  103db4:	eb0001cd 	bl	1044f0 <vPortEnterCritical>
  103db8:	e596c000 	ldr	ip, [r6]
  103dbc:	e37c0001 	cmn	ip, #1	; 0x1
  103dc0:	e3a05000 	mov	r5, #0	; 0x0
  103dc4:	0a00000a 	beq	103df4 <xTaskCheckForTimeOut+0x54>
  103dc8:	e59f3074 	ldr	r3, [pc, #116]	; 103e44 <prog+0x2e00>
  103dcc:	e5942000 	ldr	r2, [r4]
  103dd0:	e5931000 	ldr	r1, [r3]
  103dd4:	e1520001 	cmp	r2, r1
  103dd8:	e59fe068 	ldr	lr, [pc, #104]	; 103e48 <prog+0x2e04>
  103ddc:	0a000007 	beq	103e00 <xTaskCheckForTimeOut+0x60>
  103de0:	e59e3000 	ldr	r3, [lr]
  103de4:	e5942004 	ldr	r2, [r4, #4]
  103de8:	e1520003 	cmp	r2, r3
  103dec:	e3a05001 	mov	r5, #1	; 0x1
  103df0:	8a000004 	bhi	103e08 <xTaskCheckForTimeOut+0x68>
  103df4:	eb0001c8 	bl	10451c <vPortExitCritical>
  103df8:	e1a00005 	mov	r0, r5
  103dfc:	e89da870 	ldmia	sp, {r4, r5, r6, fp, sp, pc}
  103e00:	e5942004 	ldr	r2, [r4, #4]
  103e04:	e59fe03c 	ldr	lr, [pc, #60]	; 103e48 <prog+0x2e04>
  103e08:	e59e3000 	ldr	r3, [lr]
  103e0c:	e0623003 	rsb	r3, r2, r3
  103e10:	e153000c 	cmp	r3, ip
  103e14:	e3a05000 	mov	r5, #0	; 0x0
  103e18:	e1a00004 	mov	r0, r4
  103e1c:	23a05001 	movcs	r5, #1	; 0x1
  103e20:	2afffff3 	bcs	103df4 <xTaskCheckForTimeOut+0x54>
  103e24:	e59e3000 	ldr	r3, [lr]
  103e28:	e0623003 	rsb	r3, r2, r3
  103e2c:	e063300c 	rsb	r3, r3, ip
  103e30:	e5863000 	str	r3, [r6]
  103e34:	ebffffd1 	bl	103d80 <vTaskSetTimeOutState>
  103e38:	eb0001b7 	bl	10451c <vPortExitCritical>
  103e3c:	e1a00005 	mov	r0, r5
  103e40:	e89da870 	ldmia	sp, {r4, r5, r6, fp, sp, pc}
  103e44:	002008e8 	eoreq	r0, r0, r8, ror #17
  103e48:	002008e4 	eoreq	r0, r0, r4, ror #17

00103e4c <vTaskMissedYield>:
  103e4c:	e59f3008 	ldr	r3, [pc, #8]	; 103e5c <prog+0x2e18>
  103e50:	e3a02001 	mov	r2, #1	; 0x1
  103e54:	e5832000 	str	r2, [r3]
  103e58:	e1a0f00e 	mov	pc, lr
  103e5c:	002008e0 	eoreq	r0, r0, r0, ror #17

00103e60 <prvIdleTask>:
  103e60:	e1a0c00d 	mov	ip, sp
  103e64:	e92dddf0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, ip, lr, pc}
  103e68:	e59f50a8 	ldr	r5, [pc, #168]	; 103f18 <prog+0x2ed4>
  103e6c:	e5953000 	ldr	r3, [r5]
  103e70:	e59f70a4 	ldr	r7, [pc, #164]	; 103f1c <prog+0x2ed8>
  103e74:	e3530000 	cmp	r3, #0	; 0x0
  103e78:	e24cb004 	sub	fp, ip, #4	; 0x4
  103e7c:	e59f809c 	ldr	r8, [pc, #156]	; 103f20 <prog+0x2edc>
  103e80:	e59f609c 	ldr	r6, [pc, #156]	; 103f24 <prog+0x2ee0>
  103e84:	e287a008 	add	sl, r7, #8	; 0x8
  103e88:	1a000007 	bne	103eac <prvIdleTask+0x4c>
  103e8c:	e5963000 	ldr	r3, [r6]
  103e90:	e3530001 	cmp	r3, #1	; 0x1
  103e94:	9a000000 	bls	103e9c <prvIdleTask+0x3c>
  103e98:	ef000000 	swi	0x00000000
  103e9c:	ebfff7bf 	bl	101da0 <vApplicationIdleHook>
  103ea0:	e5953000 	ldr	r3, [r5]
  103ea4:	e3530000 	cmp	r3, #0	; 0x0
  103ea8:	0afffff7 	beq	103e8c <prvIdleTask+0x2c>
  103eac:	ebfffe2b 	bl	103760 <vTaskSuspendAll>
  103eb0:	e5974000 	ldr	r4, [r7]
  103eb4:	e2744001 	rsbs	r4, r4, #1	; 0x1
  103eb8:	33a04000 	movcc	r4, #0	; 0x0
  103ebc:	ebfffe7d 	bl	1038b8 <xTaskResumeAll>
  103ec0:	e3540000 	cmp	r4, #0	; 0x0
  103ec4:	1afffff0 	bne	103e8c <prvIdleTask+0x2c>
  103ec8:	eb000188 	bl	1044f0 <vPortEnterCritical>
  103ecc:	e5970000 	ldr	r0, [r7]
  103ed0:	e3500000 	cmp	r0, #0	; 0x0
  103ed4:	159a3004 	ldrne	r3, [sl, #4]
  103ed8:	1593400c 	ldrne	r4, [r3, #12]
  103edc:	01a04000 	moveq	r4, r0
  103ee0:	e2840004 	add	r0, r4, #4	; 0x4
  103ee4:	ebfffc76 	bl	1030c4 <vListRemove>
  103ee8:	e5983000 	ldr	r3, [r8]
  103eec:	e2433001 	sub	r3, r3, #1	; 0x1
  103ef0:	e5883000 	str	r3, [r8]
  103ef4:	e5952000 	ldr	r2, [r5]
  103ef8:	e2422001 	sub	r2, r2, #1	; 0x1
  103efc:	e5852000 	str	r2, [r5]
  103f00:	eb000185 	bl	10451c <vPortExitCritical>
  103f04:	e5940030 	ldr	r0, [r4, #48]
  103f08:	eb00019f 	bl	10458c <vPortFree>
  103f0c:	e1a00004 	mov	r0, r4
  103f10:	eb00019d 	bl	10458c <vPortFree>
  103f14:	eaffffdc 	b	103e8c <prvIdleTask+0x2c>
  103f18:	00200900 	eoreq	r0, r0, r0, lsl #18
  103f1c:	002011bc 	streqh	r1, [r0], -ip
  103f20:	002008f8 	streqd	r0, [r0], -r8
  103f24:	00201114 	eoreq	r1, r0, r4, lsl r1

00103f28 <xTaskCreate>:
  103f28:	e1a0c00d 	mov	ip, sp
  103f2c:	e92ddff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
  103f30:	e1a02802 	mov	r2, r2, lsl #16
  103f34:	e24cb004 	sub	fp, ip, #4	; 0x4
  103f38:	e1a0a000 	mov	sl, r0
  103f3c:	e3a00044 	mov	r0, #68	; 0x44
  103f40:	e1a07001 	mov	r7, r1
  103f44:	e1a08003 	mov	r8, r3
  103f48:	e1a04822 	mov	r4, r2, lsr #16
  103f4c:	e59b9004 	ldr	r9, [fp, #4]
  103f50:	eb000182 	bl	104560 <pvPortMalloc>
  103f54:	e2506000 	subs	r6, r0, #0	; 0x0
  103f58:	0a000007 	beq	103f7c <xTaskCreate+0x54>
  103f5c:	e1a05104 	mov	r5, r4, lsl #2
  103f60:	e1a00005 	mov	r0, r5
  103f64:	eb00017d 	bl	104560 <pvPortMalloc>
  103f68:	e3500000 	cmp	r0, #0	; 0x0
  103f6c:	e5860030 	str	r0, [r6, #48]
  103f70:	1a000003 	bne	103f84 <xTaskCreate+0x5c>
  103f74:	e1a00006 	mov	r0, r6
  103f78:	eb000183 	bl	10458c <vPortFree>
  103f7c:	e3e00000 	mvn	r0, #0	; 0x0
  103f80:	e89daff0 	ldmia	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  103f84:	e3a010a5 	mov	r1, #165	; 0xa5
  103f88:	e1a02005 	mov	r2, r5
  103f8c:	ebfff640 	bl	101894 <memset>
  103f90:	e1a01007 	mov	r1, r7
  103f94:	e3a02010 	mov	r2, #16	; 0x10
  103f98:	e2860034 	add	r0, r6, #52	; 0x34
  103f9c:	ebfff65c 	bl	101914 <strncpy>
  103fa0:	e3590004 	cmp	r9, #4	; 0x4
  103fa4:	31a04009 	movcc	r4, r9
  103fa8:	23a04004 	movcs	r4, #4	; 0x4
  103fac:	e3a03000 	mov	r3, #0	; 0x0
  103fb0:	e2867004 	add	r7, r6, #4	; 0x4
  103fb4:	e5c63043 	strb	r3, [r6, #67]
  103fb8:	e1a00007 	mov	r0, r7
  103fbc:	e586402c 	str	r4, [r6, #44]
  103fc0:	ebfffc18 	bl	103028 <vListInitialiseItem>
  103fc4:	e2860018 	add	r0, r6, #24	; 0x18
  103fc8:	ebfffc16 	bl	103028 <vListInitialiseItem>
  103fcc:	e5960030 	ldr	r0, [r6, #48]
  103fd0:	e2643005 	rsb	r3, r4, #5	; 0x5
  103fd4:	e0800005 	add	r0, r0, r5
  103fd8:	e5863018 	str	r3, [r6, #24]
  103fdc:	e1a0100a 	mov	r1, sl
  103fe0:	e1a02008 	mov	r2, r8
  103fe4:	e5866010 	str	r6, [r6, #16]
  103fe8:	e5866024 	str	r6, [r6, #36]
  103fec:	e2400004 	sub	r0, r0, #4	; 0x4
  103ff0:	eb000079 	bl	1041dc <pxPortInitialiseStack>
  103ff4:	e5860000 	str	r0, [r6]
  103ff8:	eb00013c 	bl	1044f0 <vPortEnterCritical>
  103ffc:	e59f2128 	ldr	r2, [pc, #296]	; 10412c <prog+0x30e8>
  104000:	e5923000 	ldr	r3, [r2]
  104004:	e2833001 	add	r3, r3, #1	; 0x1
  104008:	e5823000 	str	r3, [r2]
  10400c:	e5921000 	ldr	r1, [r2]
  104010:	e3510001 	cmp	r1, #1	; 0x1
  104014:	0a000029 	beq	1040c0 <xTaskCreate+0x198>
  104018:	e59f3110 	ldr	r3, [pc, #272]	; 104130 <prog+0x30ec>
  10401c:	e5932000 	ldr	r2, [r3]
  104020:	e3520000 	cmp	r2, #0	; 0x0
  104024:	0a00001d 	beq	1040a0 <xTaskCreate+0x178>
  104028:	e59f8104 	ldr	r8, [pc, #260]	; 104134 <prog+0x30f0>
  10402c:	e59f2104 	ldr	r2, [pc, #260]	; 104138 <prog+0x30f4>
  104030:	e596402c 	ldr	r4, [r6, #44]
  104034:	e5923000 	ldr	r3, [r2]
  104038:	e1540003 	cmp	r4, r3
  10403c:	85824000 	strhi	r4, [r2]
  104040:	e59f20f4 	ldr	r2, [pc, #244]	; 10413c <prog+0x30f8>
  104044:	e5923000 	ldr	r3, [r2]
  104048:	e0840104 	add	r0, r4, r4, lsl #2
  10404c:	e1540003 	cmp	r4, r3
  104050:	85824000 	strhi	r4, [r2]
  104054:	e0880100 	add	r0, r8, r0, lsl #2
  104058:	e1a01007 	mov	r1, r7
  10405c:	ebfffbf4 	bl	103034 <vListInsertEnd>
  104060:	eb00012d 	bl	10451c <vPortExitCritical>
  104064:	e59b3008 	ldr	r3, [fp, #8]
  104068:	e3530000 	cmp	r3, #0	; 0x0
  10406c:	15836000 	strne	r6, [r3]
  104070:	e59f30b8 	ldr	r3, [pc, #184]	; 104130 <prog+0x30ec>
  104074:	e5932000 	ldr	r2, [r3]
  104078:	e3520000 	cmp	r2, #0	; 0x0
  10407c:	e3a00001 	mov	r0, #1	; 0x1
  104080:	089daff0 	ldmeqia	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  104084:	e59f30b4 	ldr	r3, [pc, #180]	; 104140 <prog+0x30fc>
  104088:	e5932000 	ldr	r2, [r3]
  10408c:	e592102c 	ldr	r1, [r2, #44]
  104090:	e1510009 	cmp	r1, r9
  104094:	289daff0 	ldmcsia	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  104098:	ef000000 	swi	0x00000000
  10409c:	e89daff0 	ldmia	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, pc}
  1040a0:	e59f1098 	ldr	r1, [pc, #152]	; 104140 <prog+0x30fc>
  1040a4:	e5913000 	ldr	r3, [r1]
  1040a8:	e593202c 	ldr	r2, [r3, #44]
  1040ac:	e1520009 	cmp	r2, r9
  1040b0:	959f807c 	ldrls	r8, [pc, #124]	; 104134 <prog+0x30f0>
  1040b4:	95816000 	strls	r6, [r1]
  1040b8:	9affffdb 	bls	10402c <xTaskCreate+0x104>
  1040bc:	eaffffd9 	b	104028 <xTaskCreate+0x100>
  1040c0:	e59f3078 	ldr	r3, [pc, #120]	; 104140 <prog+0x30fc>
  1040c4:	e59f8068 	ldr	r8, [pc, #104]	; 104134 <prog+0x30f0>
  1040c8:	e5836000 	str	r6, [r3]
  1040cc:	e1a05008 	mov	r5, r8
  1040d0:	e3a04004 	mov	r4, #4	; 0x4
  1040d4:	e1a00005 	mov	r0, r5
  1040d8:	ebfffbc9 	bl	103004 <vListInitialise>
  1040dc:	e2544001 	subs	r4, r4, #1	; 0x1
  1040e0:	e2855014 	add	r5, r5, #20	; 0x14
  1040e4:	5afffffa 	bpl	1040d4 <xTaskCreate+0x1ac>
  1040e8:	e59f4054 	ldr	r4, [pc, #84]	; 104144 <prog+0x3100>
  1040ec:	e59f5054 	ldr	r5, [pc, #84]	; 104148 <prog+0x3104>
  1040f0:	e1a00004 	mov	r0, r4
  1040f4:	ebfffbc2 	bl	103004 <vListInitialise>
  1040f8:	e1a00005 	mov	r0, r5
  1040fc:	ebfffbc0 	bl	103004 <vListInitialise>
  104100:	e59f0044 	ldr	r0, [pc, #68]	; 10414c <prog+0x3108>
  104104:	ebfffbbe 	bl	103004 <vListInitialise>
  104108:	e59f0040 	ldr	r0, [pc, #64]	; 104150 <prog+0x310c>
  10410c:	ebfffbbc 	bl	103004 <vListInitialise>
  104110:	e59f003c 	ldr	r0, [pc, #60]	; 104154 <prog+0x3110>
  104114:	ebfffbba 	bl	103004 <vListInitialise>
  104118:	e59f3038 	ldr	r3, [pc, #56]	; 104158 <prog+0x3114>
  10411c:	e59f2038 	ldr	r2, [pc, #56]	; 10415c <prog+0x3118>
  104120:	e5834000 	str	r4, [r3]
  104124:	e5825000 	str	r5, [r2]
  104128:	eaffffbf 	b	10402c <xTaskCreate+0x104>
  10412c:	002008f8 	streqd	r0, [r0], -r8
  104130:	002008fc 	streqd	r0, [r0], -ip
  104134:	00201114 	eoreq	r1, r0, r4, lsl r1
  104138:	00200904 	eoreq	r0, r0, r4, lsl #18
  10413c:	002008ec 	eoreq	r0, r0, ip, ror #17
  104140:	002008dc 	ldreqd	r0, [r0], -ip
  104144:	00201178 	eoreq	r1, r0, r8, ror r1
  104148:	0020118c 	eoreq	r1, r0, ip, lsl #3
  10414c:	002011a8 	eoreq	r1, r0, r8, lsr #3
  104150:	002011bc 	streqh	r1, [r0], -ip
  104154:	002011d0 	ldreqd	r1, [r0], -r0
  104158:	002011a0 	eoreq	r1, r0, r0, lsr #3
  10415c:	002011a4 	eoreq	r1, r0, r4, lsr #3

00104160 <vTaskStartScheduler>:
  104160:	e1a0c00d 	mov	ip, sp
  104164:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  104168:	e3a04000 	mov	r4, #0	; 0x0
  10416c:	e24dd008 	sub	sp, sp, #8	; 0x8
  104170:	e24cb004 	sub	fp, ip, #4	; 0x4
  104174:	e59f1050 	ldr	r1, [pc, #80]	; 1041cc <prog+0x3188>
  104178:	e3a0206e 	mov	r2, #110	; 0x6e
  10417c:	e1a03004 	mov	r3, r4
  104180:	e59f0048 	ldr	r0, [pc, #72]	; 1041d0 <prog+0x318c>
  104184:	e58d4000 	str	r4, [sp]
  104188:	e58d4004 	str	r4, [sp, #4]
  10418c:	ebffff65 	bl	103f28 <xTaskCreate>
  104190:	e3500001 	cmp	r0, #1	; 0x1
  104194:	0a000001 	beq	1041a0 <vTaskStartScheduler+0x40>
  104198:	e24bd010 	sub	sp, fp, #16	; 0x10
  10419c:	e89da810 	ldmia	sp, {r4, fp, sp, pc}
  1041a0:	e92d0001 	stmdb	sp!, {r0}
  1041a4:	e10f0000 	mrs	r0, CPSR
  1041a8:	e38000c0 	orr	r0, r0, #192	; 0xc0
  1041ac:	e129f000 	msr	CPSR_fc, r0
  1041b0:	e8bd0001 	ldmia	sp!, {r0}
  1041b4:	e59f3018 	ldr	r3, [pc, #24]	; 1041d4 <prog+0x3190>
  1041b8:	e59f2018 	ldr	r2, [pc, #24]	; 1041d8 <prog+0x3194>
  1041bc:	e5830000 	str	r0, [r3]
  1041c0:	e5824000 	str	r4, [r2]
  1041c4:	eb000042 	bl	1042d4 <xPortStartScheduler>
  1041c8:	eafffff2 	b	104198 <vTaskStartScheduler+0x38>
  1041cc:	00105ba4 	andeqs	r5, r0, r4, lsr #23
  1041d0:	00103e60 	andeqs	r3, r0, r0, ror #28
  1041d4:	002008fc 	streqd	r0, [r0], -ip
  1041d8:	002008e4 	eoreq	r0, r0, r4, ror #17

001041dc <pxPortInitialiseStack>:
  1041dc:	e3a0ccaa 	mov	ip, #43520	; 0xaa00
  1041e0:	e28cc0aa 	add	ip, ip, #170	; 0xaa
  1041e4:	e2811004 	add	r1, r1, #4	; 0x4
  1041e8:	e18cc80c 	orr	ip, ip, ip, lsl #16
  1041ec:	e5801000 	str	r1, [r0]
  1041f0:	e1a01000 	mov	r1, r0
  1041f4:	e520c004 	str	ip, [r0, #-4]!
  1041f8:	e3a03c12 	mov	r3, #4608	; 0x1200
  1041fc:	e5201004 	str	r1, [r0, #-4]!
  104200:	e2833012 	add	r3, r3, #18	; 0x12
  104204:	e1833803 	orr	r3, r3, r3, lsl #16
  104208:	e3a01c11 	mov	r1, #4352	; 0x1100
  10420c:	e5203004 	str	r3, [r0, #-4]!
  104210:	e2811011 	add	r1, r1, #17	; 0x11
  104214:	e1811801 	orr	r1, r1, r1, lsl #16
  104218:	e3a03a01 	mov	r3, #4096	; 0x1000
  10421c:	e5201004 	str	r1, [r0, #-4]!
  104220:	e2833010 	add	r3, r3, #16	; 0x10
  104224:	e1833803 	orr	r3, r3, r3, lsl #16
  104228:	e3a01c09 	mov	r1, #2304	; 0x900
  10422c:	e5203004 	str	r3, [r0, #-4]!
  104230:	e2811009 	add	r1, r1, #9	; 0x9
  104234:	e1811801 	orr	r1, r1, r1, lsl #16
  104238:	e3a03b02 	mov	r3, #2048	; 0x800
  10423c:	e5201004 	str	r1, [r0, #-4]!
  104240:	e2833008 	add	r3, r3, #8	; 0x8
  104244:	e1833803 	orr	r3, r3, r3, lsl #16
  104248:	e3a01c07 	mov	r1, #1792	; 0x700
  10424c:	e5203004 	str	r3, [r0, #-4]!
  104250:	e2811007 	add	r1, r1, #7	; 0x7
  104254:	e1811801 	orr	r1, r1, r1, lsl #16
  104258:	e3a03c06 	mov	r3, #1536	; 0x600
  10425c:	e5201004 	str	r1, [r0, #-4]!
  104260:	e2833006 	add	r3, r3, #6	; 0x6
  104264:	e1833803 	orr	r3, r3, r3, lsl #16
  104268:	e3a01c05 	mov	r1, #1280	; 0x500
  10426c:	e5203004 	str	r3, [r0, #-4]!
  104270:	e2811005 	add	r1, r1, #5	; 0x5
  104274:	e1811801 	orr	r1, r1, r1, lsl #16
  104278:	e3a03b01 	mov	r3, #1024	; 0x400
  10427c:	e5201004 	str	r1, [r0, #-4]!
  104280:	e2833004 	add	r3, r3, #4	; 0x4
  104284:	e1833803 	orr	r3, r3, r3, lsl #16
  104288:	e3a01c03 	mov	r1, #768	; 0x300
  10428c:	e5203004 	str	r3, [r0, #-4]!
  104290:	e2811003 	add	r1, r1, #3	; 0x3
  104294:	e1811801 	orr	r1, r1, r1, lsl #16
  104298:	e3a0cc02 	mov	ip, #512	; 0x200
  10429c:	e5201004 	str	r1, [r0, #-4]!
  1042a0:	e28cc002 	add	ip, ip, #2	; 0x2
  1042a4:	e18cc80c 	orr	ip, ip, ip, lsl #16
  1042a8:	e3a03c01 	mov	r3, #256	; 0x100
  1042ac:	e520c004 	str	ip, [r0, #-4]!
  1042b0:	e2833001 	add	r3, r3, #1	; 0x1
  1042b4:	e1833803 	orr	r3, r3, r3, lsl #16
  1042b8:	e5203004 	str	r3, [r0, #-4]!
  1042bc:	e5202004 	str	r2, [r0, #-4]!
  1042c0:	e3a0301f 	mov	r3, #31	; 0x1f
  1042c4:	e5203004 	str	r3, [r0, #-4]!
  1042c8:	e3a02000 	mov	r2, #0	; 0x0
  1042cc:	e5202004 	str	r2, [r0, #-4]!
  1042d0:	e1a0f00e 	mov	pc, lr

001042d4 <xPortStartScheduler>:
  1042d4:	e1a0c00d 	mov	ip, sp
  1042d8:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  1042dc:	e3a01007 	mov	r1, #7	; 0x7
  1042e0:	e24cb004 	sub	fp, ip, #4	; 0x4
  1042e4:	e3a02000 	mov	r2, #0	; 0x0
  1042e8:	e59f3038 	ldr	r3, [pc, #56]	; 104328 <prog+0x32e4>
  1042ec:	e3a00001 	mov	r0, #1	; 0x1
  1042f0:	ebfffb34 	bl	102fc8 <AT91F_AIC_ConfigureIt>
  1042f4:	e3a02403 	mov	r2, #50331648	; 0x3000000
  1042f8:	e2822ebb 	add	r2, r2, #2992	; 0xbb0
  1042fc:	e3a014a6 	mov	r1, #-1509949440	; 0xa6000000
  104300:	e3a00102 	mov	r0, #-2147483648	; 0x80000000
  104304:	e2822003 	add	r2, r2, #3	; 0x3
  104308:	e1a009c0 	mov	r0, r0, asr #19
  10430c:	e1a01ac1 	mov	r1, r1, asr #21
  104310:	e3a03002 	mov	r3, #2	; 0x2
  104314:	e5812000 	str	r2, [r1]
  104318:	e5803120 	str	r3, [r0, #288]
  10431c:	eb000002 	bl	10432c <vPortISRStartFirstTask>
  104320:	e3a00000 	mov	r0, #0	; 0x0
  104324:	e89da800 	ldmia	sp, {fp, sp, pc}
  104328:	0010442c 	andeqs	r4, r0, ip, lsr #8

0010432c <vPortISRStartFirstTask>:
  10432c:	e59f0044 	ldr	r0, [pc, #68]	; 104378 <prog+0x3334>
  104330:	e5900000 	ldr	r0, [r0]
  104334:	e590e000 	ldr	lr, [r0]
  104338:	e59f003c 	ldr	r0, [pc, #60]	; 10437c <prog+0x3338>
  10433c:	e8be0002 	ldmia	lr!, {r1}
  104340:	e5801000 	str	r1, [r0]
  104344:	e8be0001 	ldmia	lr!, {r0}
  104348:	e169f000 	msr	SPSR_fc, r0
  10434c:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  104350:	e1a00000 	nop			(mov r0,r0)
  104354:	e59ee03c 	ldr	lr, [lr, #60]
  104358:	e25ef004 	subs	pc, lr, #4	; 0x4
  10435c:	e59f300c 	ldr	r3, [pc, #12]	; 104370 <prog+0x332c>
  104360:	e59f200c 	ldr	r2, [pc, #12]	; 104374 <prog+0x3330>
  104364:	e5931000 	ldr	r1, [r3]
  104368:	e5923000 	ldr	r3, [r2]
  10436c:	e1a0f00e 	mov	pc, lr
  104370:	00200908 	eoreq	r0, r0, r8, lsl #18
  104374:	002008dc 	ldreqd	r0, [r0], -ip
  104378:	002008dc 	ldreqd	r0, [r0], -ip
  10437c:	00200908 	eoreq	r0, r0, r8, lsl #18

00104380 <swi_handler>:
  104380:	e28ee004 	add	lr, lr, #4	; 0x4
  104384:	e92d0001 	stmdb	sp!, {r0}
  104388:	e94d2000 	stmdb	sp, {sp}^
  10438c:	e1a00000 	nop			(mov r0,r0)
  104390:	e24dd004 	sub	sp, sp, #4	; 0x4
  104394:	e8bd0001 	ldmia	sp!, {r0}
  104398:	e9204000 	stmdb	r0!, {lr}
  10439c:	e1a0e000 	mov	lr, r0
  1043a0:	e8bd0001 	ldmia	sp!, {r0}
  1043a4:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1043a8:	e1a00000 	nop			(mov r0,r0)
  1043ac:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  1043b0:	e14f0000 	mrs	r0, SPSR
  1043b4:	e92e0001 	stmdb	lr!, {r0}
  1043b8:	e59f0064 	ldr	r0, [pc, #100]	; 104424 <prog+0x33e0>
  1043bc:	e5900000 	ldr	r0, [r0]
  1043c0:	e92e0001 	stmdb	lr!, {r0}
  1043c4:	e59f005c 	ldr	r0, [pc, #92]	; 104428 <prog+0x33e4>
  1043c8:	e5900000 	ldr	r0, [r0]
  1043cc:	e580e000 	str	lr, [r0]
  1043d0:	e59f4044 	ldr	r4, [pc, #68]	; 10441c <prog+0x33d8>
  1043d4:	e59f5044 	ldr	r5, [pc, #68]	; 104420 <prog+0x33dc>
  1043d8:	e5943000 	ldr	r3, [r4]
  1043dc:	e5952000 	ldr	r2, [r5]
  1043e0:	ebfffdea 	bl	103b90 <vTaskSwitchContext>
  1043e4:	e59f003c 	ldr	r0, [pc, #60]	; 104428 <prog+0x33e4>
  1043e8:	e5900000 	ldr	r0, [r0]
  1043ec:	e590e000 	ldr	lr, [r0]
  1043f0:	e59f002c 	ldr	r0, [pc, #44]	; 104424 <prog+0x33e0>
  1043f4:	e8be0002 	ldmia	lr!, {r1}
  1043f8:	e5801000 	str	r1, [r0]
  1043fc:	e8be0001 	ldmia	lr!, {r0}
  104400:	e169f000 	msr	SPSR_fc, r0
  104404:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  104408:	e1a00000 	nop			(mov r0,r0)
  10440c:	e59ee03c 	ldr	lr, [lr, #60]
  104410:	e25ef004 	subs	pc, lr, #4	; 0x4
  104414:	e5943000 	ldr	r3, [r4]
  104418:	e5952000 	ldr	r2, [r5]
  10441c:	00200908 	eoreq	r0, r0, r8, lsl #18
  104420:	002008dc 	ldreqd	r0, [r0], -ip
  104424:	00200908 	eoreq	r0, r0, r8, lsl #18
  104428:	002008dc 	ldreqd	r0, [r0], -ip

0010442c <vPreemptiveTick>:
  10442c:	e92d0001 	stmdb	sp!, {r0}
  104430:	e94d2000 	stmdb	sp, {sp}^
  104434:	e1a00000 	nop			(mov r0,r0)
  104438:	e24dd004 	sub	sp, sp, #4	; 0x4
  10443c:	e8bd0001 	ldmia	sp!, {r0}
  104440:	e9204000 	stmdb	r0!, {lr}
  104444:	e1a0e000 	mov	lr, r0
  104448:	e8bd0001 	ldmia	sp!, {r0}
  10444c:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  104450:	e1a00000 	nop			(mov r0,r0)
  104454:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  104458:	e14f0000 	mrs	r0, SPSR
  10445c:	e92e0001 	stmdb	lr!, {r0}
  104460:	e59f0080 	ldr	r0, [pc, #128]	; 1044e8 <prog+0x34a4>
  104464:	e5900000 	ldr	r0, [r0]
  104468:	e92e0001 	stmdb	lr!, {r0}
  10446c:	e59f0078 	ldr	r0, [pc, #120]	; 1044ec <prog+0x34a8>
  104470:	e5900000 	ldr	r0, [r0]
  104474:	e580e000 	str	lr, [r0]
  104478:	e59f4060 	ldr	r4, [pc, #96]	; 1044e0 <prog+0x349c>
  10447c:	e59f5060 	ldr	r5, [pc, #96]	; 1044e4 <prog+0x34a0>
  104480:	e5943000 	ldr	r3, [r4]
  104484:	e5952000 	ldr	r2, [r5]
  104488:	ebfffcbf 	bl	10378c <vTaskIncrementTick>
  10448c:	ebfffdbf 	bl	103b90 <vTaskSwitchContext>
  104490:	e3a034a6 	mov	r3, #-1509949440	; 0xa6000000
  104494:	e1a03ac3 	mov	r3, r3, asr #21
  104498:	e5931008 	ldr	r1, [r3, #8]
  10449c:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
  1044a0:	e1a029c2 	mov	r2, r2, asr #19
  1044a4:	e5821130 	str	r1, [r2, #304]
  1044a8:	e59f003c 	ldr	r0, [pc, #60]	; 1044ec <prog+0x34a8>
  1044ac:	e5900000 	ldr	r0, [r0]
  1044b0:	e590e000 	ldr	lr, [r0]
  1044b4:	e59f002c 	ldr	r0, [pc, #44]	; 1044e8 <prog+0x34a4>
  1044b8:	e8be0002 	ldmia	lr!, {r1}
  1044bc:	e5801000 	str	r1, [r0]
  1044c0:	e8be0001 	ldmia	lr!, {r0}
  1044c4:	e169f000 	msr	SPSR_fc, r0
  1044c8:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1044cc:	e1a00000 	nop			(mov r0,r0)
  1044d0:	e59ee03c 	ldr	lr, [lr, #60]
  1044d4:	e25ef004 	subs	pc, lr, #4	; 0x4
  1044d8:	e5943000 	ldr	r3, [r4]
  1044dc:	e5952000 	ldr	r2, [r5]
  1044e0:	00200908 	eoreq	r0, r0, r8, lsl #18
  1044e4:	002008dc 	ldreqd	r0, [r0], -ip
  1044e8:	00200908 	eoreq	r0, r0, r8, lsl #18
  1044ec:	002008dc 	ldreqd	r0, [r0], -ip

001044f0 <vPortEnterCritical>:
  1044f0:	e92d0001 	stmdb	sp!, {r0}
  1044f4:	e10f0000 	mrs	r0, CPSR
  1044f8:	e38000c0 	orr	r0, r0, #192	; 0xc0
  1044fc:	e129f000 	msr	CPSR_fc, r0
  104500:	e8bd0001 	ldmia	sp!, {r0}
  104504:	e59f200c 	ldr	r2, [pc, #12]	; 104518 <prog+0x34d4>
  104508:	e5923000 	ldr	r3, [r2]
  10450c:	e2833001 	add	r3, r3, #1	; 0x1
  104510:	e5823000 	str	r3, [r2]
  104514:	e1a0f00e 	mov	pc, lr
  104518:	00200908 	eoreq	r0, r0, r8, lsl #18

0010451c <vPortExitCritical>:
  10451c:	e59f2038 	ldr	r2, [pc, #56]	; 10455c <prog+0x3518>
  104520:	e5923000 	ldr	r3, [r2]
  104524:	e3530000 	cmp	r3, #0	; 0x0
  104528:	01a0f00e 	moveq	pc, lr
  10452c:	e5923000 	ldr	r3, [r2]
  104530:	e2433001 	sub	r3, r3, #1	; 0x1
  104534:	e5823000 	str	r3, [r2]
  104538:	e5922000 	ldr	r2, [r2]
  10453c:	e3520000 	cmp	r2, #0	; 0x0
  104540:	11a0f00e 	movne	pc, lr
  104544:	e92d0001 	stmdb	sp!, {r0}
  104548:	e10f0000 	mrs	r0, CPSR
  10454c:	e3c000c0 	bic	r0, r0, #192	; 0xc0
  104550:	e129f000 	msr	CPSR_fc, r0
  104554:	e8bd0001 	ldmia	sp!, {r0}
  104558:	e1a0f00e 	mov	pc, lr
  10455c:	00200908 	eoreq	r0, r0, r8, lsl #18

00104560 <pvPortMalloc>:
  104560:	e1a0c00d 	mov	ip, sp
  104564:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  104568:	e24cb004 	sub	fp, ip, #4	; 0x4
  10456c:	e1a04000 	mov	r4, r0
  104570:	ebfffc7a 	bl	103760 <vTaskSuspendAll>
  104574:	e1a00004 	mov	r0, r4
  104578:	ebfff2e5 	bl	101114 <malloc>
  10457c:	e1a04000 	mov	r4, r0
  104580:	ebfffccc 	bl	1038b8 <xTaskResumeAll>
  104584:	e1a00004 	mov	r0, r4
  104588:	e89da810 	ldmia	sp, {r4, fp, sp, pc}

0010458c <vPortFree>:
  10458c:	e1a0c00d 	mov	ip, sp
  104590:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  104594:	e2504000 	subs	r4, r0, #0	; 0x0
  104598:	e24cb004 	sub	fp, ip, #4	; 0x4
  10459c:	089da810 	ldmeqia	sp, {r4, fp, sp, pc}
  1045a0:	ebfffc6e 	bl	103760 <vTaskSuspendAll>
  1045a4:	e1a00004 	mov	r0, r4
  1045a8:	ebfff2de 	bl	101128 <free>
  1045ac:	e89d6810 	ldmia	sp, {r4, fp, sp, lr}
  1045b0:	eafffcc0 	b	1038b8 <xTaskResumeAll>

001045b4 <vDetachUSBInterface>:
  1045b4:	e3a0220a 	mov	r2, #-1610612736	; 0xa0000000
  1045b8:	e1a029c2 	mov	r2, r2, asr #19
  1045bc:	e3a03801 	mov	r3, #65536	; 0x10000
  1045c0:	e5823000 	str	r3, [r2]
  1045c4:	e5823010 	str	r3, [r2, #16]
  1045c8:	e5823030 	str	r3, [r2, #48]
  1045cc:	e1a0f00e 	mov	pc, lr

001045d0 <vUSBSendByte>:
  1045d0:	e1a0c00d 	mov	ip, sp
  1045d4:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  1045d8:	e59f302c 	ldr	r3, [pc, #44]	; 10460c <prog+0x35c8>
  1045dc:	e24cb004 	sub	fp, ip, #4	; 0x4
  1045e0:	e24dd008 	sub	sp, sp, #8	; 0x8
  1045e4:	e3a02000 	mov	r2, #0	; 0x0
  1045e8:	e54b0013 	strb	r0, [fp, #-19]
  1045ec:	e3a0c001 	mov	ip, #1	; 0x1
  1045f0:	e5930000 	ldr	r0, [r3]
  1045f4:	e24b1014 	sub	r1, fp, #20	; 0x14
  1045f8:	e1a03002 	mov	r3, r2
  1045fc:	e54bc014 	strb	ip, [fp, #-20]
  104600:	ebfffbef 	bl	1035c4 <xQueueGenericSend>
  104604:	e24bd00c 	sub	sp, fp, #12	; 0xc
  104608:	e89da800 	ldmia	sp, {fp, sp, pc}
  10460c:	00201304 	eoreq	r1, r0, r4, lsl #6

00104610 <usb_send_buffer_zero_copy>:
  104610:	e1a0c00d 	mov	ip, sp
  104614:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  104618:	e24cb004 	sub	fp, ip, #4	; 0x4
  10461c:	e24dd014 	sub	sp, sp, #20	; 0x14
  104620:	e50b3010 	str	r3, [fp, #-16]
  104624:	e59f302c 	ldr	r3, [pc, #44]	; 104658 <prog+0x3614>
  104628:	e3a0c000 	mov	ip, #0	; 0x0
  10462c:	e50b0020 	str	r0, [fp, #-32]
  104630:	e50b101c 	str	r1, [fp, #-28]
  104634:	e50b2014 	str	r2, [fp, #-20]
  104638:	e5930000 	ldr	r0, [r3]
  10463c:	e59b2004 	ldr	r2, [fp, #4]
  104640:	e1a0300c 	mov	r3, ip
  104644:	e24b1020 	sub	r1, fp, #32	; 0x20
  104648:	e50bc018 	str	ip, [fp, #-24]
  10464c:	ebfffbdc 	bl	1035c4 <xQueueGenericSend>
  104650:	e24bd00c 	sub	sp, fp, #12	; 0xc
  104654:	e89da800 	ldmia	sp, {fp, sp, pc}
  104658:	00201308 	eoreq	r1, r0, r8, lsl #6

0010465c <vUSBRecvByte>:
  10465c:	e1a0c00d 	mov	ip, sp
  104660:	e3500000 	cmp	r0, #0	; 0x0
  104664:	13510000 	cmpne	r1, #0	; 0x0
  104668:	e92dd9f0 	stmdb	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
  10466c:	e1a05001 	mov	r5, r1
  104670:	e24cb004 	sub	fp, ip, #4	; 0x4
  104674:	e1a04000 	mov	r4, r0
  104678:	c3a01000 	movgt	r1, #0	; 0x0
  10467c:	d3a01001 	movle	r1, #1	; 0x1
  104680:	e1a07002 	mov	r7, r2
  104684:	da000004 	ble	10469c <vUSBRecvByte+0x40>
  104688:	e59f804c 	ldr	r8, [pc, #76]	; 1046dc <prog+0x3698>
  10468c:	e5983000 	ldr	r3, [r8]
  104690:	e3530000 	cmp	r3, #0	; 0x0
  104694:	11a06001 	movne	r6, r1
  104698:	1a000006 	bne	1046b8 <vUSBRecvByte+0x5c>
  10469c:	e3a00000 	mov	r0, #0	; 0x0
  1046a0:	e89da9f0 	ldmia	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
  1046a4:	e5980000 	ldr	r0, [r8]
  1046a8:	ebfffb51 	bl	1033f4 <xQueueGenericReceive>
  1046ac:	e3500000 	cmp	r0, #0	; 0x0
  1046b0:	0a000007 	beq	1046d4 <vUSBRecvByte+0x78>
  1046b4:	e2866001 	add	r6, r6, #1	; 0x1
  1046b8:	e2455001 	sub	r5, r5, #1	; 0x1
  1046bc:	e3750001 	cmn	r5, #1	; 0x1
  1046c0:	e1a01004 	mov	r1, r4
  1046c4:	e1a02007 	mov	r2, r7
  1046c8:	e3a03000 	mov	r3, #0	; 0x0
  1046cc:	e2844001 	add	r4, r4, #1	; 0x1
  1046d0:	1afffff3 	bne	1046a4 <vUSBRecvByte+0x48>
  1046d4:	e1a00006 	mov	r0, r6
  1046d8:	e89da9f0 	ldmia	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
  1046dc:	00201300 	eoreq	r1, r0, r0, lsl #6

001046e0 <prvSendZLP>:
  1046e0:	e1a0c00d 	mov	ip, sp
  1046e4:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
  1046e8:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  1046ec:	e1a02642 	mov	r2, r2, asr #12
  1046f0:	e5923030 	ldr	r3, [r2, #48]
  1046f4:	e3130010 	tst	r3, #16	; 0x10
  1046f8:	e24cb004 	sub	fp, ip, #4	; 0x4
  1046fc:	0a000005 	beq	104718 <prvSendZLP+0x38>
  104700:	e1a04002 	mov	r4, r2
  104704:	e3a00001 	mov	r0, #1	; 0x1
  104708:	ebfffcfe 	bl	103b08 <vTaskDelay>
  10470c:	e5943030 	ldr	r3, [r4, #48]
  104710:	e3130010 	tst	r3, #16	; 0x10
  104714:	1afffffa 	bne	104704 <prvSendZLP+0x24>
  104718:	ebffff74 	bl	1044f0 <vPortEnterCritical>
  10471c:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  104720:	e1a02642 	mov	r2, r2, asr #12
  104724:	e5923030 	ldr	r3, [r2, #48]
  104728:	e59f0018 	ldr	r0, [pc, #24]	; 104748 <prog+0x3704>
  10472c:	e3c33020 	bic	r3, r3, #32	; 0x20
  104730:	e5901080 	ldr	r1, [r0, #128]
  104734:	e383305f 	orr	r3, r3, #95	; 0x5f
  104738:	e5823030 	str	r3, [r2, #48]
  10473c:	e5801084 	str	r1, [r0, #132]
  104740:	e89d6810 	ldmia	sp, {r4, fp, sp, lr}
  104744:	eaffff74 	b	10451c <vPortExitCritical>
  104748:	002011ec 	eoreq	r1, r0, ip, ror #3

0010474c <prvSendStall>:
  10474c:	e1a0c00d 	mov	ip, sp
  104750:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  104754:	e24cb004 	sub	fp, ip, #4	; 0x4
  104758:	ebffff64 	bl	1044f0 <vPortEnterCritical>
  10475c:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  104760:	e1a02642 	mov	r2, r2, asr #12
  104764:	e5923030 	ldr	r3, [r2, #48]
  104768:	e3c33010 	bic	r3, r3, #16	; 0x10
  10476c:	e383306f 	orr	r3, r3, #111	; 0x6f
  104770:	e5823030 	str	r3, [r2, #48]
  104774:	e89d6800 	ldmia	sp, {fp, sp, lr}
  104778:	eaffff67 	b	10451c <vPortExitCritical>

0010477c <prvSendNextSegment>:
  10477c:	e1a0c00d 	mov	ip, sp
  104780:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  104784:	e59f50f4 	ldr	r5, [pc, #244]	; 104880 <prog+0x383c>
  104788:	e24cb004 	sub	fp, ip, #4	; 0x4
  10478c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  104790:	e5952084 	ldr	r2, [r5, #132]
  104794:	e5953080 	ldr	r3, [r5, #128]
  104798:	e1520003 	cmp	r2, r3
  10479c:	9a00002f 	bls	104860 <prvSendNextSegment+0xe4>
  1047a0:	e0633002 	rsb	r3, r3, r2
  1047a4:	e50b3020 	str	r3, [fp, #-32]
  1047a8:	e51b2020 	ldr	r2, [fp, #-32]
  1047ac:	e3520008 	cmp	r2, #8	; 0x8
  1047b0:	951b3020 	ldrls	r3, [fp, #-32]
  1047b4:	83a03008 	movhi	r3, #8	; 0x8
  1047b8:	e50b3018 	str	r3, [fp, #-24]
  1047bc:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  1047c0:	e1a02642 	mov	r2, r2, asr #12
  1047c4:	e5923030 	ldr	r3, [r2, #48]
  1047c8:	e3130010 	tst	r3, #16	; 0x10
  1047cc:	0a000005 	beq	1047e8 <prvSendNextSegment+0x6c>
  1047d0:	e1a04002 	mov	r4, r2
  1047d4:	e3a00001 	mov	r0, #1	; 0x1
  1047d8:	ebfffcca 	bl	103b08 <vTaskDelay>
  1047dc:	e5943030 	ldr	r3, [r4, #48]
  1047e0:	e3130010 	tst	r3, #16	; 0x10
  1047e4:	1afffffa 	bne	1047d4 <prvSendNextSegment+0x58>
  1047e8:	e51b3018 	ldr	r3, [fp, #-24]
  1047ec:	e3530000 	cmp	r3, #0	; 0x0
  1047f0:	0a00000c 	beq	104828 <prvSendNextSegment+0xac>
  1047f4:	e3a0020b 	mov	r0, #-1342177280	; 0xb0000000
  1047f8:	e5951080 	ldr	r1, [r5, #128]
  1047fc:	e1a00640 	mov	r0, r0, asr #12
  104800:	e7d53001 	ldrb	r3, [r5, r1]
  104804:	e5803050 	str	r3, [r0, #80]
  104808:	e51b2018 	ldr	r2, [fp, #-24]
  10480c:	e2422001 	sub	r2, r2, #1	; 0x1
  104810:	e50b2018 	str	r2, [fp, #-24]
  104814:	e51b3018 	ldr	r3, [fp, #-24]
  104818:	e3530000 	cmp	r3, #0	; 0x0
  10481c:	e2811001 	add	r1, r1, #1	; 0x1
  104820:	1afffff6 	bne	104800 <prvSendNextSegment+0x84>
  104824:	e5851080 	str	r1, [r5, #128]
  104828:	ebffff30 	bl	1044f0 <vPortEnterCritical>
  10482c:	e3a0120b 	mov	r1, #-1342177280	; 0xb0000000
  104830:	e1a01641 	mov	r1, r1, asr #12
  104834:	e5912030 	ldr	r2, [r1, #48]
  104838:	e50b201c 	str	r2, [fp, #-28]
  10483c:	e51b301c 	ldr	r3, [fp, #-28]
  104840:	e3c33020 	bic	r3, r3, #32	; 0x20
  104844:	e383305f 	orr	r3, r3, #95	; 0x5f
  104848:	e50b301c 	str	r3, [fp, #-28]
  10484c:	e51b201c 	ldr	r2, [fp, #-28]
  104850:	e5812030 	str	r2, [r1, #48]
  104854:	ebffff30 	bl	10451c <vPortExitCritical>
  104858:	e24bd014 	sub	sp, fp, #20	; 0x14
  10485c:	e89da830 	ldmia	sp, {r4, r5, fp, sp, pc}
  104860:	e59f401c 	ldr	r4, [pc, #28]	; 104884 <prog+0x3840>
  104864:	e5943000 	ldr	r3, [r4]
  104868:	e3530004 	cmp	r3, #4	; 0x4
  10486c:	1afffff9 	bne	104858 <prvSendNextSegment+0xdc>
  104870:	ebffff9a 	bl	1046e0 <prvSendZLP>
  104874:	e3a03000 	mov	r3, #0	; 0x0
  104878:	e5843000 	str	r3, [r4]
  10487c:	eafffff5 	b	104858 <prvSendNextSegment+0xdc>
  104880:	002011ec 	eoreq	r1, r0, ip, ror #3
  104884:	00200918 	eoreq	r0, r0, r8, lsl r9

00104888 <prvSendControlData>:
  104888:	e1a01801 	mov	r1, r1, lsl #16
  10488c:	e1a01821 	mov	r1, r1, lsr #16
  104890:	e1a0c00d 	mov	ip, sp
  104894:	e1510002 	cmp	r1, r2
  104898:	e92dd830 	stmdb	sp!, {r4, r5, fp, ip, lr, pc}
  10489c:	e1a05002 	mov	r5, r2
  1048a0:	e24cb004 	sub	fp, ip, #4	; 0x4
  1048a4:	93a02000 	movls	r2, #0	; 0x0
  1048a8:	83a02001 	movhi	r2, #1	; 0x1
  1048ac:	31a05001 	movcc	r5, r1
  1048b0:	3a000008 	bcc	1048d8 <prvSendControlData+0x50>
  1048b4:	e3530000 	cmp	r3, #0	; 0x0
  1048b8:	03a03000 	moveq	r3, #0	; 0x0
  1048bc:	12023001 	andne	r3, r2, #1	; 0x1
  1048c0:	e3530000 	cmp	r3, #0	; 0x0
  1048c4:	0a000003 	beq	1048d8 <prvSendControlData+0x50>
  1048c8:	e3150007 	tst	r5, #7	; 0x7
  1048cc:	059f302c 	ldreq	r3, [pc, #44]	; 104900 <prog+0x38bc>
  1048d0:	03a02004 	moveq	r2, #4	; 0x4
  1048d4:	05832000 	streq	r2, [r3]
  1048d8:	e59f4024 	ldr	r4, [pc, #36]	; 104904 <prog+0x38c0>
  1048dc:	e1a01000 	mov	r1, r0
  1048e0:	e1a02005 	mov	r2, r5
  1048e4:	e1a00004 	mov	r0, r4
  1048e8:	ebfff3c5 	bl	101804 <memcpy>
  1048ec:	e3a03000 	mov	r3, #0	; 0x0
  1048f0:	e5843080 	str	r3, [r4, #128]
  1048f4:	e5845084 	str	r5, [r4, #132]
  1048f8:	e89d6830 	ldmia	sp, {r4, r5, fp, sp, lr}
  1048fc:	eaffff9e 	b	10477c <prvSendNextSegment>
  104900:	00200918 	eoreq	r0, r0, r8, lsl r9
  104904:	002011ec 	eoreq	r1, r0, ip, ror #3

00104908 <vUSBCDCTask>:
  104908:	e1a0c00d 	mov	ip, sp
  10490c:	e92ddff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
  104910:	e24cb004 	sub	fp, ip, #4	; 0x4
  104914:	e24dd028 	sub	sp, sp, #40	; 0x28
  104918:	e3a0a000 	mov	sl, #0	; 0x0
  10491c:	e50ba048 	str	sl, [fp, #-72]
  104920:	e50ba044 	str	sl, [fp, #-68]
  104924:	e50ba040 	str	sl, [fp, #-64]
  104928:	e50ba03c 	str	sl, [fp, #-60]
  10492c:	e50ba038 	str	sl, [fp, #-56]
  104930:	ebfffeee 	bl	1044f0 <vPortEnterCritical>
  104934:	ebffff1e 	bl	1045b4 <vDetachUSBInterface>
  104938:	ebfffef7 	bl	10451c <vPortExitCritical>
  10493c:	e3a0003c 	mov	r0, #60	; 0x3c
  104940:	ebfffc70 	bl	103b08 <vTaskDelay>
  104944:	ebfffee9 	bl	1044f0 <vPortEnterCritical>
  104948:	e3a00004 	mov	r0, #4	; 0x4
  10494c:	e1a01000 	mov	r1, r0
  104950:	ebfff9ea 	bl	103100 <xQueueCreate>
  104954:	e59f1964 	ldr	r1, [pc, #2404]	; 1052c0 <prog+0x427c>
  104958:	e5810000 	str	r0, [r1]
  10495c:	e3a01001 	mov	r1, #1	; 0x1
  104960:	e3a00b01 	mov	r0, #1024	; 0x400
  104964:	ebfff9e5 	bl	103100 <xQueueCreate>
  104968:	e59f8954 	ldr	r8, [pc, #2388]	; 1052c4 <prog+0x4280>
  10496c:	e3a01005 	mov	r1, #5	; 0x5
  104970:	e5880000 	str	r0, [r8]
  104974:	e3a000cd 	mov	r0, #205	; 0xcd
  104978:	ebfff9e0 	bl	103100 <xQueueCreate>
  10497c:	e59f2944 	ldr	r2, [pc, #2372]	; 1052c8 <prog+0x4284>
  104980:	e3a01014 	mov	r1, #20	; 0x14
  104984:	e5820000 	str	r0, [r2]
  104988:	e3a00040 	mov	r0, #64	; 0x40
  10498c:	ebfff9db 	bl	103100 <xQueueCreate>
  104990:	e59fc928 	ldr	ip, [pc, #2344]	; 1052c0 <prog+0x427c>
  104994:	e59c3000 	ldr	r3, [ip]
  104998:	e59f192c 	ldr	r1, [pc, #2348]	; 1052cc <prog+0x4288>
  10499c:	e153000a 	cmp	r3, sl
  1049a0:	e5810000 	str	r0, [r1]
  1049a4:	0a00003f 	beq	104aa8 <vUSBCDCTask+0x1a0>
  1049a8:	e5983000 	ldr	r3, [r8]
  1049ac:	e153000a 	cmp	r3, sl
  1049b0:	0a00003c 	beq	104aa8 <vUSBCDCTask+0x1a0>
  1049b4:	e59f290c 	ldr	r2, [pc, #2316]	; 1052c8 <prog+0x4284>
  1049b8:	e5923000 	ldr	r3, [r2]
  1049bc:	e153000a 	cmp	r3, sl
  1049c0:	0a000038 	beq	104aa8 <vUSBCDCTask+0x1a0>
  1049c4:	e150000a 	cmp	r0, sl
  1049c8:	0a000036 	beq	104aa8 <vUSBCDCTask+0x1a0>
  1049cc:	e59fc8fc 	ldr	ip, [pc, #2300]	; 1052d0 <prog+0x428c>
  1049d0:	e59f08fc 	ldr	r0, [pc, #2300]	; 1052d4 <prog+0x4290>
  1049d4:	e59f18fc 	ldr	r1, [pc, #2300]	; 1052d8 <prog+0x4294>
  1049d8:	e3a03002 	mov	r3, #2	; 0x2
  1049dc:	e58c3000 	str	r3, [ip]
  1049e0:	e5c0a000 	strb	sl, [r0]
  1049e4:	e5c1a000 	strb	sl, [r1]
  1049e8:	e3a00321 	mov	r0, #-2080374784	; 0x84000000
  1049ec:	e1a00ac0 	mov	r0, r0, asr #21
  1049f0:	e590c00c 	ldr	ip, [r0, #12]
  1049f4:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
  1049f8:	e1a02ac2 	mov	r2, r2, asr #21
  1049fc:	e38cc201 	orr	ip, ip, #268435456	; 0x10000000
  104a00:	e3a07b02 	mov	r7, #2048	; 0x800
  104a04:	e283307e 	add	r3, r3, #126	; 0x7e
  104a08:	e580c00c 	str	ip, [r0, #12]
  104a0c:	e3a0420a 	mov	r4, #-1610612736	; 0xa0000000
  104a10:	e5823000 	str	r3, [r2]
  104a14:	e59fc8c0 	ldr	ip, [pc, #2240]	; 1052dc <prog+0x4298>
  104a18:	e5827010 	str	r7, [r2, #16]
  104a1c:	e59f38bc 	ldr	r3, [pc, #2236]	; 1052e0 <prog+0x429c>
  104a20:	e59f28bc 	ldr	r2, [pc, #2236]	; 1052e4 <prog+0x42a0>
  104a24:	e3a0120b 	mov	r1, #-1342177280	; 0xb0000000
  104a28:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  104a2c:	e1a01641 	mov	r1, r1, asr #12
  104a30:	e1a049c4 	mov	r4, r4, asr #19
  104a34:	e3a05801 	mov	r5, #65536	; 0x10000
  104a38:	e24eed3e 	sub	lr, lr, #3968	; 0xf80
  104a3c:	e3e06000 	mvn	r6, #0	; 0x0
  104a40:	e5845000 	str	r5, [r4]
  104a44:	e582a080 	str	sl, [r2, #128]
  104a48:	e5845010 	str	r5, [r4, #16]
  104a4c:	e583a080 	str	sl, [r3, #128]
  104a50:	e5845030 	str	r5, [r4, #48]
  104a54:	e50ea00b 	str	sl, [lr, #-11]
  104a58:	e5816014 	str	r6, [r1, #20]
  104a5c:	e1a0200a 	mov	r2, sl
  104a60:	e5816020 	str	r6, [r1, #32]
  104a64:	e58ca000 	str	sl, [ip]
  104a68:	e581a030 	str	sl, [r1, #48]
  104a6c:	e59f3874 	ldr	r3, [pc, #2164]	; 1052e8 <prog+0x42a4>
  104a70:	e581a034 	str	sl, [r1, #52]
  104a74:	e3a0000b 	mov	r0, #11	; 0xb
  104a78:	e581a038 	str	sl, [r1, #56]
  104a7c:	e581a03c 	str	sl, [r1, #60]
  104a80:	e581a004 	str	sl, [r1, #4]
  104a84:	e581a008 	str	sl, [r1, #8]
  104a88:	e3a01003 	mov	r1, #3	; 0x3
  104a8c:	ebfff94d 	bl	102fc8 <AT91F_AIC_ConfigureIt>
  104a90:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
  104a94:	e1a039c3 	mov	r3, r3, asr #19
  104a98:	e5837120 	str	r7, [r3, #288]
  104a9c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
  104aa0:	ebfffc18 	bl	103b08 <vTaskDelay>
  104aa4:	e5845034 	str	r5, [r4, #52]
  104aa8:	ebfffe9b 	bl	10451c <vPortExitCritical>
  104aac:	e3a0a20b 	mov	sl, #-1342177280	; 0xb0000000
  104ab0:	e1a0a64a 	mov	sl, sl, asr #12
  104ab4:	e24b9029 	sub	r9, fp, #41	; 0x29
  104ab8:	e24b2044 	sub	r2, fp, #68	; 0x44
  104abc:	e892000c 	ldmia	r2, {r2, r3}
  104ac0:	e59f17f8 	ldr	r1, [pc, #2040]	; 1052c0 <prog+0x427c>
  104ac4:	e1530002 	cmp	r3, r2
  104ac8:	33a02000 	movcc	r2, #0	; 0x0
  104acc:	23a02001 	movcs	r2, #1	; 0x1
  104ad0:	e5910000 	ldr	r0, [r1]
  104ad4:	e3a03000 	mov	r3, #0	; 0x0
  104ad8:	e24b1050 	sub	r1, fp, #80	; 0x50
  104adc:	ebfffa44 	bl	1033f4 <xQueueGenericReceive>
  104ae0:	e3500000 	cmp	r0, #0	; 0x0
  104ae4:	0a00002e 	beq	104ba4 <vUSBCDCTask+0x29c>
  104ae8:	e51b4050 	ldr	r4, [fp, #-80]
  104aec:	e5943000 	ldr	r3, [r4]
  104af0:	e3130001 	tst	r3, #1	; 0x1
  104af4:	0a000027 	beq	104b98 <vUSBCDCTask+0x290>
  104af8:	e5941004 	ldr	r1, [r4, #4]
  104afc:	e1a06821 	mov	r6, r1, lsr #16
  104b00:	e1a06a86 	mov	r6, r6, lsl #21
  104b04:	e3110001 	tst	r1, #1	; 0x1
  104b08:	e1a06aa6 	mov	r6, r6, lsr #21
  104b0c:	0a000011 	beq	104b58 <vUSBCDCTask+0x250>
  104b10:	e59f27c4 	ldr	r2, [pc, #1988]	; 1052dc <prog+0x4298>
  104b14:	e5925000 	ldr	r5, [r2]
  104b18:	e3550002 	cmp	r5, #2	; 0x2
  104b1c:	0a00016d 	beq	1050d8 <prog+0x4094>
  104b20:	e3550003 	cmp	r5, #3	; 0x3
  104b24:	1a0000f6 	bne	104f04 <prog+0x3ec0>
  104b28:	e59f07bc 	ldr	r0, [pc, #1980]	; 1052ec <prog+0x42a8>
  104b2c:	e5903000 	ldr	r3, [r0]
  104b30:	e59f27b4 	ldr	r2, [pc, #1972]	; 1052ec <prog+0x42a8>
  104b34:	e3530000 	cmp	r3, #0	; 0x0
  104b38:	13a03001 	movne	r3, #1	; 0x1
  104b3c:	e58a3004 	str	r3, [sl, #4]
  104b40:	e5923000 	ldr	r3, [r2]
  104b44:	e3833c01 	orr	r3, r3, #256	; 0x100
  104b48:	e58a3008 	str	r3, [sl, #8]
  104b4c:	e59f3788 	ldr	r3, [pc, #1928]	; 1052dc <prog+0x4298>
  104b50:	e3a02000 	mov	r2, #0	; 0x0
  104b54:	e5832000 	str	r2, [r3]
  104b58:	e3110002 	tst	r1, #2	; 0x2
  104b5c:	0a0000a2 	beq	104dec <vUSBCDCTask+0x4e4>
  104b60:	e59fc778 	ldr	ip, [pc, #1912]	; 1052e0 <prog+0x429c>
  104b64:	e28cc084 	add	ip, ip, #132	; 0x84
  104b68:	e81c1008 	ldmda	ip, {r3, ip}
  104b6c:	e04c3003 	sub	r3, ip, r3
  104b70:	e59f076c 	ldr	r0, [pc, #1900]	; 1052e4 <prog+0x42a0>
  104b74:	e20350ff 	and	r5, r3, #255	; 0xff
  104b78:	e1550006 	cmp	r5, r6
  104b7c:	e5902084 	ldr	r2, [r0, #132]
  104b80:	820650ff 	andhi	r5, r6, #255	; 0xff
  104b84:	e3550000 	cmp	r5, #0	; 0x0
  104b88:	e5802080 	str	r2, [r0, #128]
  104b8c:	e59f774c 	ldr	r7, [pc, #1868]	; 1052e0 <prog+0x429c>
  104b90:	1a00008d 	bne	104dcc <vUSBCDCTask+0x4c4>
  104b94:	e51b4050 	ldr	r4, [fp, #-80]
  104b98:	e5943000 	ldr	r3, [r4]
  104b9c:	e3130a01 	tst	r3, #4096	; 0x1000
  104ba0:	1a000135 	bne	10507c <prog+0x4038>
  104ba4:	e59f1730 	ldr	r1, [pc, #1840]	; 1052dc <prog+0x4298>
  104ba8:	e5913000 	ldr	r3, [r1]
  104bac:	e3530005 	cmp	r3, #5	; 0x5
  104bb0:	1affffc0 	bne	104ab8 <vUSBCDCTask+0x1b0>
  104bb4:	e59f271c 	ldr	r2, [pc, #1820]	; 1052d8 <prog+0x4294>
  104bb8:	e5d23000 	ldrb	r3, [r2]
  104bbc:	e3530000 	cmp	r3, #0	; 0x0
  104bc0:	0affffbc 	beq	104ab8 <vUSBCDCTask+0x1b0>
  104bc4:	e59a3038 	ldr	r3, [sl, #56]
  104bc8:	e3130010 	tst	r3, #16	; 0x10
  104bcc:	1a000049 	bne	104cf8 <vUSBCDCTask+0x3f0>
  104bd0:	e51b0040 	ldr	r0, [fp, #-64]
  104bd4:	e51b3044 	ldr	r3, [fp, #-68]
  104bd8:	e1500003 	cmp	r0, r3
  104bdc:	2a0000cb 	bcs	104f10 <prog+0x3ecc>
  104be0:	e1500003 	cmp	r0, r3
  104be4:	e3a04000 	mov	r4, #0	; 0x0
  104be8:	3a00002a 	bcc	104c98 <vUSBCDCTask+0x390>
  104bec:	e59f16d8 	ldr	r1, [pc, #1752]	; 1052cc <prog+0x4288>
  104bf0:	e3a02000 	mov	r2, #0	; 0x0
  104bf4:	e5910000 	ldr	r0, [r1]
  104bf8:	e1a03002 	mov	r3, r2
  104bfc:	e24b1048 	sub	r1, fp, #72	; 0x48
  104c00:	ebfff9fb 	bl	1033f4 <xQueueGenericReceive>
  104c04:	e3500000 	cmp	r0, #0	; 0x0
  104c08:	050b0044 	streq	r0, [fp, #-68]
  104c0c:	050b0040 	streq	r0, [fp, #-64]
  104c10:	0a000003 	beq	104c24 <vUSBCDCTask+0x31c>
  104c14:	e51b0040 	ldr	r0, [fp, #-64]
  104c18:	e51b3044 	ldr	r3, [fp, #-68]
  104c1c:	e1500003 	cmp	r0, r3
  104c20:	3a00001c 	bcc	104c98 <vUSBCDCTask+0x390>
  104c24:	e59f369c 	ldr	r3, [pc, #1692]	; 1052c8 <prog+0x4284>
  104c28:	e3a02000 	mov	r2, #0	; 0x0
  104c2c:	e5930000 	ldr	r0, [r3]
  104c30:	e24b1034 	sub	r1, fp, #52	; 0x34
  104c34:	e1a03002 	mov	r3, r2
  104c38:	ebfff9ed 	bl	1033f4 <xQueueGenericReceive>
  104c3c:	e3500000 	cmp	r0, #0	; 0x0
  104c40:	0a000029 	beq	104cec <vUSBCDCTask+0x3e4>
  104c44:	e55b3034 	ldrb	r3, [fp, #-52]
  104c48:	e3530000 	cmp	r3, #0	; 0x0
  104c4c:	e3a01000 	mov	r1, #0	; 0x0
  104c50:	da000009 	ble	104c7c <vUSBCDCTask+0x374>
  104c54:	e3a0020b 	mov	r0, #-1342177280	; 0xb0000000
  104c58:	e1a00640 	mov	r0, r0, asr #12
  104c5c:	e24bc033 	sub	ip, fp, #51	; 0x33
  104c60:	e4dc3001 	ldrb	r3, [ip], #1
  104c64:	e5803058 	str	r3, [r0, #88]
  104c68:	e55b2034 	ldrb	r2, [fp, #-52]
  104c6c:	e2811001 	add	r1, r1, #1	; 0x1
  104c70:	e1520001 	cmp	r2, r1
  104c74:	e2844001 	add	r4, r4, #1	; 0x1
  104c78:	cafffff8 	bgt	104c60 <vUSBCDCTask+0x358>
  104c7c:	e2844001 	add	r4, r4, #1	; 0x1
  104c80:	e354003b 	cmp	r4, #59	; 0x3b
  104c84:	ca000018 	bgt	104cec <vUSBCDCTask+0x3e4>
  104c88:	e51b0040 	ldr	r0, [fp, #-64]
  104c8c:	e51b3044 	ldr	r3, [fp, #-68]
  104c90:	e1500003 	cmp	r0, r3
  104c94:	2affffd4 	bcs	104bec <vUSBCDCTask+0x2e4>
  104c98:	e354003f 	cmp	r4, #63	; 0x3f
  104c9c:	ca00015c 	bgt	105214 <prog+0x41d0>
  104ca0:	e51b1048 	ldr	r1, [fp, #-72]
  104ca4:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  104ca8:	e1a02642 	mov	r2, r2, asr #12
  104cac:	e7d03001 	ldrb	r3, [r0, r1]
  104cb0:	e2844001 	add	r4, r4, #1	; 0x1
  104cb4:	e2800001 	add	r0, r0, #1	; 0x1
  104cb8:	e354003f 	cmp	r4, #63	; 0x3f
  104cbc:	e50b0040 	str	r0, [fp, #-64]
  104cc0:	e5823058 	str	r3, [r2, #88]
  104cc4:	ca000150 	bgt	10520c <prog+0x41c8>
  104cc8:	e51b0040 	ldr	r0, [fp, #-64]
  104ccc:	e51b3044 	ldr	r3, [fp, #-68]
  104cd0:	e1500003 	cmp	r0, r3
  104cd4:	3afffff4 	bcc	104cac <vUSBCDCTask+0x3a4>
  104cd8:	e51b303c 	ldr	r3, [fp, #-60]
  104cdc:	e3530000 	cmp	r3, #0	; 0x0
  104ce0:	151b0038 	ldrne	r0, [fp, #-56]
  104ce4:	11a0e00f 	movne	lr, pc
  104ce8:	11a0f003 	movne	pc, r3
  104cec:	e59a3038 	ldr	r3, [sl, #56]
  104cf0:	e3833010 	orr	r3, r3, #16	; 0x10
  104cf4:	e58a3038 	str	r3, [sl, #56]
  104cf8:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  104cfc:	e1a02642 	mov	r2, r2, asr #12
  104d00:	e5923034 	ldr	r3, [r2, #52]
  104d04:	e3130042 	tst	r3, #66	; 0x42
  104d08:	0affff6a 	beq	104ab8 <vUSBCDCTask+0x1b0>
  104d0c:	e1a06002 	mov	r6, r2
  104d10:	e5923034 	ldr	r3, [r2, #52]
  104d14:	e5980000 	ldr	r0, [r8]
  104d18:	e1a03823 	mov	r3, r3, lsr #16
  104d1c:	e1a04a83 	mov	r4, r3, lsl #21
  104d20:	ebfff91e 	bl	1031a0 <uxQueueMessagesWaiting>
  104d24:	e1a04aa4 	mov	r4, r4, lsr #21
  104d28:	e2600b01 	rsb	r0, r0, #1024	; 0x400
  104d2c:	e1500004 	cmp	r0, r4
  104d30:	9affff60 	bls	104ab8 <vUSBCDCTask+0x1b0>
  104d34:	e2544001 	subs	r4, r4, #1	; 0x1
  104d38:	3a00000b 	bcc	104d6c <vUSBCDCTask+0x464>
  104d3c:	e3a0520b 	mov	r5, #-1342177280	; 0xb0000000
  104d40:	e1a05645 	mov	r5, r5, asr #12
  104d44:	e595c054 	ldr	ip, [r5, #84]
  104d48:	e3a02000 	mov	r2, #0	; 0x0
  104d4c:	e2444001 	sub	r4, r4, #1	; 0x1
  104d50:	e5980000 	ldr	r0, [r8]
  104d54:	e1a01009 	mov	r1, r9
  104d58:	e1a03002 	mov	r3, r2
  104d5c:	e54bc029 	strb	ip, [fp, #-41]
  104d60:	ebfffa17 	bl	1035c4 <xQueueGenericSend>
  104d64:	e3740001 	cmn	r4, #1	; 0x1
  104d68:	1afffff5 	bne	104d44 <vUSBCDCTask+0x43c>
  104d6c:	ebfffddf 	bl	1044f0 <vPortEnterCritical>
  104d70:	e5963034 	ldr	r3, [r6, #52]
  104d74:	e59fc554 	ldr	ip, [pc, #1364]	; 1052d0 <prog+0x428c>
  104d78:	e383304f 	orr	r3, r3, #79	; 0x4f
  104d7c:	e59c2000 	ldr	r2, [ip]
  104d80:	e3c33030 	bic	r3, r3, #48	; 0x30
  104d84:	e1c33002 	bic	r3, r3, r2
  104d88:	e5863034 	str	r3, [r6, #52]
  104d8c:	ebfffde2 	bl	10451c <vPortExitCritical>
  104d90:	e3a02002 	mov	r2, #2	; 0x2
  104d94:	e5862010 	str	r2, [r6, #16]
  104d98:	e59f0530 	ldr	r0, [pc, #1328]	; 1052d0 <prog+0x428c>
  104d9c:	e5903000 	ldr	r3, [r0]
  104da0:	e1530002 	cmp	r3, r2
  104da4:	159f3524 	ldrne	r3, [pc, #1316]	; 1052d0 <prog+0x428c>
  104da8:	03a03040 	moveq	r3, #64	; 0x40
  104dac:	15832000 	strne	r2, [r3]
  104db0:	05803000 	streq	r3, [r0]
  104db4:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  104db8:	e1a02642 	mov	r2, r2, asr #12
  104dbc:	e5923034 	ldr	r3, [r2, #52]
  104dc0:	e3130042 	tst	r3, #66	; 0x42
  104dc4:	1affffd1 	bne	104d10 <vUSBCDCTask+0x408>
  104dc8:	eaffff3a 	b	104ab8 <vUSBCDCTask+0x1b0>
  104dcc:	e2841008 	add	r1, r4, #8	; 0x8
  104dd0:	e1a00007 	mov	r0, r7
  104dd4:	e1a02005 	mov	r2, r5
  104dd8:	ebfff289 	bl	101804 <memcpy>
  104ddc:	e5973080 	ldr	r3, [r7, #128]
  104de0:	e0833005 	add	r3, r3, r5
  104de4:	e5873080 	str	r3, [r7, #128]
  104de8:	e5941004 	ldr	r1, [r4, #4]
  104dec:	e3110004 	tst	r1, #4	; 0x4
  104df0:	0a00002e 	beq	104eb0 <vUSBCDCTask+0x5a8>
  104df4:	e3560007 	cmp	r6, #7	; 0x7
  104df8:	9a00002c 	bls	104eb0 <vUSBCDCTask+0x5a8>
  104dfc:	e5d43008 	ldrb	r3, [r4, #8]
  104e00:	e59f14e8 	ldr	r1, [pc, #1256]	; 1052f0 <prog+0x42ac>
  104e04:	e5c13000 	strb	r3, [r1]
  104e08:	e5d42009 	ldrb	r2, [r4, #9]
  104e0c:	e5c12001 	strb	r2, [r1, #1]
  104e10:	e59f24d8 	ldr	r2, [pc, #1240]	; 1052f0 <prog+0x42ac>
  104e14:	e5d4100b 	ldrb	r1, [r4, #11]
  104e18:	e1c210b2 	strh	r1, [r2, #2]
  104e1c:	e1d230b2 	ldrh	r3, [r2, #2]
  104e20:	e1a03403 	mov	r3, r3, lsl #8
  104e24:	e59fc4c4 	ldr	ip, [pc, #1220]	; 1052f0 <prog+0x42ac>
  104e28:	e1c230b2 	strh	r3, [r2, #2]
  104e2c:	e5d4200a 	ldrb	r2, [r4, #10]
  104e30:	e1dc30b2 	ldrh	r3, [ip, #2]
  104e34:	e1833002 	orr	r3, r3, r2
  104e38:	e1cc30b2 	strh	r3, [ip, #2]
  104e3c:	e5d4200d 	ldrb	r2, [r4, #13]
  104e40:	e1cc20b4 	strh	r2, [ip, #4]
  104e44:	e1dc30b4 	ldrh	r3, [ip, #4]
  104e48:	e1a03403 	mov	r3, r3, lsl #8
  104e4c:	e1cc30b4 	strh	r3, [ip, #4]
  104e50:	e5d4200c 	ldrb	r2, [r4, #12]
  104e54:	e1dc30b4 	ldrh	r3, [ip, #4]
  104e58:	e1833002 	orr	r3, r3, r2
  104e5c:	e1cc30b4 	strh	r3, [ip, #4]
  104e60:	e5d4200f 	ldrb	r2, [r4, #15]
  104e64:	e1cc20b6 	strh	r2, [ip, #6]
  104e68:	e1dc30b6 	ldrh	r3, [ip, #6]
  104e6c:	e1a03403 	mov	r3, r3, lsl #8
  104e70:	e1cc30b6 	strh	r3, [ip, #6]
  104e74:	e1dc20d0 	ldrsb	r2, [ip]
  104e78:	e5d4100e 	ldrb	r1, [r4, #14]
  104e7c:	e1dc30b6 	ldrh	r3, [ip, #6]
  104e80:	e59f0458 	ldr	r0, [pc, #1112]	; 1052e0 <prog+0x429c>
  104e84:	e3520000 	cmp	r2, #0	; 0x0
  104e88:	e1833001 	orr	r3, r3, r1
  104e8c:	e3a02000 	mov	r2, #0	; 0x0
  104e90:	e1cc30b6 	strh	r3, [ip, #6]
  104e94:	e5802080 	str	r2, [r0, #128]
  104e98:	ba0000a8 	blt	105140 <prog+0x40fc>
  104e9c:	e1dc30b6 	ldrh	r3, [ip, #6]
  104ea0:	e3530080 	cmp	r3, #128	; 0x80
  104ea4:	95803084 	strls	r3, [r0, #132]
  104ea8:	8a000029 	bhi	104f54 <prog+0x3f10>
  104eac:	e5941004 	ldr	r1, [r4, #4]
  104eb0:	e3110006 	tst	r1, #6	; 0x6
  104eb4:	0affff36 	beq	104b94 <vUSBCDCTask+0x28c>
  104eb8:	e59f1420 	ldr	r1, [pc, #1056]	; 1052e0 <prog+0x429c>
  104ebc:	e2812080 	add	r2, r1, #128	; 0x80
  104ec0:	e892000c 	ldmia	r2, {r2, r3}
  104ec4:	e1520003 	cmp	r2, r3
  104ec8:	3affff31 	bcc	104b94 <vUSBCDCTask+0x28c>
  104ecc:	e59f241c 	ldr	r2, [pc, #1052]	; 1052f0 <prog+0x42ac>
  104ed0:	e5d23000 	ldrb	r3, [r2]
  104ed4:	e2032003 	and	r2, r3, #3	; 0x3
  104ed8:	e2033060 	and	r3, r3, #96	; 0x60
  104edc:	e18221a3 	orr	r2, r2, r3, lsr #3
  104ee0:	e3520005 	cmp	r2, #5	; 0x5
  104ee4:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
  104ee8:	ea000019 	b	104f54 <prog+0x3f10>
  104eec:	00105000 	andeqs	r5, r0, r0
  104ef0:	00104f30 	andeqs	r4, r0, r0, lsr pc
  104ef4:	00104f54 	andeqs	r4, r0, r4, asr pc
  104ef8:	00104f54 	andeqs	r4, r0, r4, asr pc
  104efc:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f00:	00104f5c 	andeqs	r4, r0, ip, asr pc
  104f04:	ebfffe1c 	bl	10477c <prvSendNextSegment>
  104f08:	e5941004 	ldr	r1, [r4, #4]
  104f0c:	eaffff11 	b	104b58 <vUSBCDCTask+0x250>
  104f10:	e59f33b0 	ldr	r3, [pc, #944]	; 1052c8 <prog+0x4284>
  104f14:	e5930000 	ldr	r0, [r3]
  104f18:	ebfff8a0 	bl	1031a0 <uxQueueMessagesWaiting>
  104f1c:	e3500000 	cmp	r0, #0	; 0x0
  104f20:	0a000088 	beq	105148 <prog+0x4104>
  104f24:	e51b0040 	ldr	r0, [fp, #-64]
  104f28:	e51b3044 	ldr	r3, [fp, #-68]
  104f2c:	eaffff2b 	b	104be0 <vUSBCDCTask+0x2d8>
  104f30:	e59fc3b8 	ldr	ip, [pc, #952]	; 1052f0 <prog+0x42ac>
  104f34:	e5dc3001 	ldrb	r3, [ip, #1]
  104f38:	e3530000 	cmp	r3, #0	; 0x0
  104f3c:	e3a00000 	mov	r0, #0	; 0x0
  104f40:	03a01002 	moveq	r1, #2	; 0x2
  104f44:	e14b04bc 	strh	r0, [fp, #-76]
  104f48:	01a02001 	moveq	r2, r1
  104f4c:	024b004c 	subeq	r0, fp, #76	; 0x4c
  104f50:	0a000047 	beq	105074 <prog+0x4030>
  104f54:	ebfffdfc 	bl	10474c <prvSendStall>
  104f58:	eaffff0d 	b	104b94 <vUSBCDCTask+0x28c>
  104f5c:	e59f138c 	ldr	r1, [pc, #908]	; 1052f0 <prog+0x42ac>
  104f60:	e5d13001 	ldrb	r3, [r1, #1]
  104f64:	e1a04001 	mov	r4, r1
  104f68:	e3530022 	cmp	r3, #34	; 0x22
  104f6c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  104f70:	eafffff7 	b	104f54 <prog+0x3f10>
  104f74:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f78:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f7c:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f80:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f84:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f88:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f8c:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f90:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f94:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f98:	00104f54 	andeqs	r4, r0, r4, asr pc
  104f9c:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fa0:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fa4:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fa8:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fac:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fb0:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fb4:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fb8:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fbc:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fc0:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fc4:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fc8:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fcc:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fd0:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fd4:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fd8:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fdc:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fe0:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fe4:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fe8:	00104f54 	andeqs	r4, r0, r4, asr pc
  104fec:	00104f54 	andeqs	r4, r0, r4, asr pc
  104ff0:	00104f54 	andeqs	r4, r0, r4, asr pc
  104ff4:	001051f4 	ldreqsh	r5, [r0], -r4
  104ff8:	001051e0 	andeqs	r5, r0, r0, ror #3
  104ffc:	001051cc 	andeqs	r5, r0, ip, asr #3
  105000:	e59fc2e8 	ldr	ip, [pc, #744]	; 1052f0 <prog+0x42ac>
  105004:	e5dc3001 	ldrb	r3, [ip, #1]
  105008:	e3a00000 	mov	r0, #0	; 0x0
  10500c:	e14b04ba 	strh	r0, [fp, #-74]
  105010:	e1a0400c 	mov	r4, ip
  105014:	e3530009 	cmp	r3, #9	; 0x9
  105018:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10501c:	eaffffcc 	b	104f54 <prog+0x3f10>
  105020:	001051bc 	ldreqh	r5, [r0], -ip
  105024:	00104f54 	andeqs	r4, r0, r4, asr pc
  105028:	00104f54 	andeqs	r4, r0, r4, asr pc
  10502c:	00105178 	andeqs	r5, r0, r8, ror r1
  105030:	00104f54 	andeqs	r4, r0, r4, asr pc
  105034:	00105180 	andeqs	r5, r0, r0, lsl #3
  105038:	00105048 	andeqs	r5, r0, r8, asr #32
  10503c:	00104f54 	andeqs	r4, r0, r4, asr pc
  105040:	001051a4 	andeqs	r5, r0, r4, lsr #3
  105044:	00105160 	andeqs	r5, r0, r0, ror #2
  105048:	e1dc20b2 	ldrh	r2, [ip, #2]
  10504c:	e1a03422 	mov	r3, r2, lsr #8
  105050:	e3530002 	cmp	r3, #2	; 0x2
  105054:	e59f1294 	ldr	r1, [pc, #660]	; 1052f0 <prog+0x42ac>
  105058:	0a00007e 	beq	105258 <prog+0x4214>
  10505c:	ca000072 	bgt	10522c <prog+0x41e8>
  105060:	e3530001 	cmp	r3, #1	; 0x1
  105064:	1affffba 	bne	104f54 <prog+0x3f10>
  105068:	e1dc10b6 	ldrh	r1, [ip, #6]
  10506c:	e59f0280 	ldr	r0, [pc, #640]	; 1052f4 <prog+0x42b0>
  105070:	e3a02012 	mov	r2, #18	; 0x12
  105074:	ebfffe03 	bl	104888 <prvSendControlData>
  105078:	eafffec5 	b	104b94 <vUSBCDCTask+0x28c>
  10507c:	e59f3254 	ldr	r3, [pc, #596]	; 1052d8 <prog+0x4294>
  105080:	e3a02000 	mov	r2, #0	; 0x0
  105084:	e5c32000 	strb	r2, [r3]
  105088:	e59fc24c 	ldr	ip, [pc, #588]	; 1052dc <prog+0x4298>
  10508c:	e3a0300f 	mov	r3, #15	; 0xf
  105090:	e58a3028 	str	r3, [sl, #40]
  105094:	e3a04001 	mov	r4, #1	; 0x1
  105098:	e28330f1 	add	r3, r3, #241	; 0xf1
  10509c:	e58a2028 	str	r2, [sl, #40]
  1050a0:	e58c4000 	str	r4, [ip]
  1050a4:	e58a3008 	str	r3, [sl, #8]
  1050a8:	ebfffd10 	bl	1044f0 <vPortEnterCritical>
  1050ac:	e59a3030 	ldr	r3, [sl, #48]
  1050b0:	e3c33030 	bic	r3, r3, #48	; 0x30
  1050b4:	e3833902 	orr	r3, r3, #32768	; 0x8000
  1050b8:	e383304f 	orr	r3, r3, #79	; 0x4f
  1050bc:	e58a3030 	str	r3, [sl, #48]
  1050c0:	e58a4010 	str	r4, [sl, #16]
  1050c4:	ebfffd14 	bl	10451c <vPortExitCritical>
  1050c8:	e59f0200 	ldr	r0, [pc, #512]	; 1052d0 <prog+0x428c>
  1050cc:	e3a03002 	mov	r3, #2	; 0x2
  1050d0:	e5803000 	str	r3, [r0]
  1050d4:	eafffeb2 	b	104ba4 <vUSBCDCTask+0x29c>
  1050d8:	e58a5004 	str	r5, [sl, #4]
  1050dc:	ebfffd03 	bl	1044f0 <vPortEnterCritical>
  1050e0:	e59a3034 	ldr	r3, [sl, #52]
  1050e4:	e3c33030 	bic	r3, r3, #48	; 0x30
  1050e8:	e3833c82 	orr	r3, r3, #33280	; 0x8200
  1050ec:	e383304f 	orr	r3, r3, #79	; 0x4f
  1050f0:	e58a3034 	str	r3, [sl, #52]
  1050f4:	e58a5010 	str	r5, [sl, #16]
  1050f8:	e59a3038 	ldr	r3, [sl, #56]
  1050fc:	e3c33030 	bic	r3, r3, #48	; 0x30
  105100:	e3833c86 	orr	r3, r3, #34304	; 0x8600
  105104:	e383304f 	orr	r3, r3, #79	; 0x4f
  105108:	e3a02004 	mov	r2, #4	; 0x4
  10510c:	e58a3038 	str	r3, [sl, #56]
  105110:	e58a2010 	str	r2, [sl, #16]
  105114:	e59a303c 	ldr	r3, [sl, #60]
  105118:	e3c33030 	bic	r3, r3, #48	; 0x30
  10511c:	e3833c87 	orr	r3, r3, #34560	; 0x8700
  105120:	e383304f 	orr	r3, r3, #79	; 0x4f
  105124:	e58a303c 	str	r3, [sl, #60]
  105128:	ebfffcfb 	bl	10451c <vPortExitCritical>
  10512c:	e59fc1a8 	ldr	ip, [pc, #424]	; 1052dc <prog+0x4298>
  105130:	e5941004 	ldr	r1, [r4, #4]
  105134:	e3a03005 	mov	r3, #5	; 0x5
  105138:	e58c3000 	str	r3, [ip]
  10513c:	eafffe85 	b	104b58 <vUSBCDCTask+0x250>
  105140:	e5802084 	str	r2, [r0, #132]
  105144:	eaffff58 	b	104eac <vUSBCDCTask+0x5a4>
  105148:	e59fc17c 	ldr	ip, [pc, #380]	; 1052cc <prog+0x4288>
  10514c:	e59c0000 	ldr	r0, [ip]
  105150:	ebfff812 	bl	1031a0 <uxQueueMessagesWaiting>
  105154:	e3500000 	cmp	r0, #0	; 0x0
  105158:	0afffee6 	beq	104cf8 <vUSBCDCTask+0x3f0>
  10515c:	eaffff70 	b	104f24 <prog+0x3ee0>
  105160:	e1dc30b2 	ldrh	r3, [ip, #2]
  105164:	e59f2168 	ldr	r2, [pc, #360]	; 1052d4 <prog+0x4290>
  105168:	e5c23000 	strb	r3, [r2]
  10516c:	e59f3168 	ldr	r3, [pc, #360]	; 1052dc <prog+0x4298>
  105170:	e3a02002 	mov	r2, #2	; 0x2
  105174:	e5832000 	str	r2, [r3]
  105178:	ebfffd58 	bl	1046e0 <prvSendZLP>
  10517c:	eafffe84 	b	104b94 <vUSBCDCTask+0x28c>
  105180:	ebfffd56 	bl	1046e0 <prvSendZLP>
  105184:	e1d420b2 	ldrh	r2, [r4, #2]
  105188:	e59f014c 	ldr	r0, [pc, #332]	; 1052dc <prog+0x4298>
  10518c:	e59f1158 	ldr	r1, [pc, #344]	; 1052ec <prog+0x42a8>
  105190:	e51b4050 	ldr	r4, [fp, #-80]
  105194:	e3a03003 	mov	r3, #3	; 0x3
  105198:	e5803000 	str	r3, [r0]
  10519c:	e5812000 	str	r2, [r1]
  1051a0:	eafffe7c 	b	104b98 <vUSBCDCTask+0x290>
  1051a4:	e3a01001 	mov	r1, #1	; 0x1
  1051a8:	e59f0124 	ldr	r0, [pc, #292]	; 1052d4 <prog+0x4290>
  1051ac:	e1a02001 	mov	r2, r1
  1051b0:	e3a03000 	mov	r3, #0	; 0x0
  1051b4:	ebfffdb3 	bl	104888 <prvSendControlData>
  1051b8:	eafffe75 	b	104b94 <vUSBCDCTask+0x28c>
  1051bc:	e3a01002 	mov	r1, #2	; 0x2
  1051c0:	e24b004a 	sub	r0, fp, #74	; 0x4a
  1051c4:	e1a02001 	mov	r2, r1
  1051c8:	eafffff8 	b	1051b0 <prog+0x416c>
  1051cc:	ebfffd43 	bl	1046e0 <prvSendZLP>
  1051d0:	e1d430b2 	ldrh	r3, [r4, #2]
  1051d4:	e59f20fc 	ldr	r2, [pc, #252]	; 1052d8 <prog+0x4294>
  1051d8:	e5c23000 	strb	r3, [r2]
  1051dc:	eafffe6c 	b	104b94 <vUSBCDCTask+0x28c>
  1051e0:	e1d110b6 	ldrh	r1, [r1, #6]
  1051e4:	e59f010c 	ldr	r0, [pc, #268]	; 1052f8 <prog+0x42b4>
  1051e8:	e3a02007 	mov	r2, #7	; 0x7
  1051ec:	e3a03000 	mov	r3, #0	; 0x0
  1051f0:	eaffffef 	b	1051b4 <prog+0x4170>
  1051f4:	ebfffd39 	bl	1046e0 <prvSendZLP>
  1051f8:	e59f10e0 	ldr	r1, [pc, #224]	; 1052e0 <prog+0x429c>
  1051fc:	e3a02007 	mov	r2, #7	; 0x7
  105200:	e59f00f0 	ldr	r0, [pc, #240]	; 1052f8 <prog+0x42b4>
  105204:	ebfff17e 	bl	101804 <memcpy>
  105208:	eafffe61 	b	104b94 <vUSBCDCTask+0x28c>
  10520c:	e51b0040 	ldr	r0, [fp, #-64]
  105210:	e51b3044 	ldr	r3, [fp, #-68]
  105214:	e1500003 	cmp	r0, r3
  105218:	2afffeae 	bcs	104cd8 <vUSBCDCTask+0x3d0>
  10521c:	e59a3038 	ldr	r3, [sl, #56]
  105220:	e3833010 	orr	r3, r3, #16	; 0x10
  105224:	e58a3038 	str	r3, [sl, #56]
  105228:	eafffeb2 	b	104cf8 <vUSBCDCTask+0x3f0>
  10522c:	e3530003 	cmp	r3, #3	; 0x3
  105230:	1affff47 	bne	104f54 <prog+0x3f10>
  105234:	e20230ff 	and	r3, r2, #255	; 0xff
  105238:	e3530004 	cmp	r3, #4	; 0x4
  10523c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  105240:	eaffff43 	b	104f54 <prog+0x3f10>
  105244:	001052ac 	andeqs	r5, r0, ip, lsr #5
  105248:	00105298 	muleqs	r0, r8, r2
  10524c:	00105284 	andeqs	r5, r0, r4, lsl #5
  105250:	00105284 	andeqs	r5, r0, r4, lsl #5
  105254:	00105284 	andeqs	r5, r0, r4, lsl #5
  105258:	e20230ff 	and	r3, r2, #255	; 0xff
  10525c:	e1dc10b6 	ldrh	r1, [ip, #6]
  105260:	e59fc094 	ldr	ip, [pc, #148]	; 1052fc <prog+0x42b8>
  105264:	e3530002 	cmp	r3, #2	; 0x2
  105268:	23a03002 	movcs	r3, #2	; 0x2
  10526c:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  105270:	e59fc088 	ldr	ip, [pc, #136]	; 105300 <prog+0x42bc>
  105274:	e79c0103 	ldr	r0, [ip, r3, lsl #2]
  105278:	e3a03001 	mov	r3, #1	; 0x1
  10527c:	ebfffd81 	bl	104888 <prvSendControlData>
  105280:	eafffe43 	b	104b94 <vUSBCDCTask+0x28c>
  105284:	e1d110b6 	ldrh	r1, [r1, #6]
  105288:	e59f0074 	ldr	r0, [pc, #116]	; 105304 <prog+0x42c0>
  10528c:	e3a0202c 	mov	r2, #44	; 0x2c
  105290:	e3a03001 	mov	r3, #1	; 0x1
  105294:	eafffff8 	b	10527c <prog+0x4238>
  105298:	e1d110b6 	ldrh	r1, [r1, #6]
  10529c:	e59f0064 	ldr	r0, [pc, #100]	; 105308 <prog+0x42c4>
  1052a0:	e3a0201c 	mov	r2, #28	; 0x1c
  1052a4:	e3a03001 	mov	r3, #1	; 0x1
  1052a8:	eafffff3 	b	10527c <prog+0x4238>
  1052ac:	e1d110b6 	ldrh	r1, [r1, #6]
  1052b0:	e59f0054 	ldr	r0, [pc, #84]	; 10530c <prog+0x42c8>
  1052b4:	e3a02004 	mov	r2, #4	; 0x4
  1052b8:	e3a03001 	mov	r3, #1	; 0x1
  1052bc:	eaffffee 	b	10527c <prog+0x4238>
  1052c0:	002012fc 	streqd	r1, [r0], -ip
  1052c4:	00201300 	eoreq	r1, r0, r0, lsl #6
  1052c8:	00201304 	eoreq	r1, r0, r4, lsl #6
  1052cc:	00201308 	eoreq	r1, r0, r8, lsl #6
  1052d0:	00201310 	eoreq	r1, r0, r0, lsl r3
  1052d4:	00200914 	eoreq	r0, r0, r4, lsl r9
  1052d8:	0020130c 	eoreq	r1, r0, ip, lsl #6
  1052dc:	00200918 	eoreq	r0, r0, r8, lsl r9
  1052e0:	00201274 	eoreq	r1, r0, r4, ror r2
  1052e4:	002011ec 	eoreq	r1, r0, ip, ror #3
  1052e8:	001054ec 	andeqs	r5, r0, ip, ror #9
  1052ec:	0020091c 	eoreq	r0, r0, ip, lsl r9
  1052f0:	002011e4 	eoreq	r1, r0, r4, ror #3
  1052f4:	00105ba9 	andeqs	r5, r0, r9, lsr #23
  1052f8:	00105c96 	muleqs	r0, r6, ip
  1052fc:	00105bbc 	ldreqh	r5, [r0], -ip
  105300:	0020090c 	eoreq	r0, r0, ip, lsl #18
  105304:	00105c4a 	andeqs	r5, r0, sl, asr #24
  105308:	00105c76 	andeqs	r5, r0, r6, ror ip
  10530c:	00105c92 	muleqs	r0, r2, ip

00105310 <vUSB_ISR_Handler>:
  105310:	e1a0c00d 	mov	ip, sp
  105314:	e92dd870 	stmdb	sp!, {r4, r5, r6, fp, ip, lr, pc}
  105318:	e59f21c0 	ldr	r2, [pc, #448]	; 1054e0 <prog+0x449c>
  10531c:	e24cb004 	sub	fp, ip, #4	; 0x4
  105320:	e24dd008 	sub	sp, sp, #8	; 0x8
  105324:	e5921000 	ldr	r1, [r2]
  105328:	e5923000 	ldr	r3, [r2]
  10532c:	e2833001 	add	r3, r3, #1	; 0x1
  105330:	e5823000 	str	r3, [r2]
  105334:	e3a0520b 	mov	r5, #-1342177280	; 0xb0000000
  105338:	e1a05645 	mov	r5, r5, asr #12
  10533c:	e595e01c 	ldr	lr, [r5, #28]
  105340:	e5950030 	ldr	r0, [r5, #48]
  105344:	e59fc198 	ldr	ip, [pc, #408]	; 1054e4 <prog+0x44a0>
  105348:	e5953018 	ldr	r3, [r5, #24]
  10534c:	e2011003 	and	r1, r1, #3	; 0x3
  105350:	e1a01201 	mov	r1, r1, lsl #4
  105354:	e1a02820 	mov	r2, r0, lsr #16
  105358:	e1a04a82 	mov	r4, r2, lsl #21
  10535c:	e3833a01 	orr	r3, r3, #4096	; 0x1000
  105360:	e081200c 	add	r2, r1, ip
  105364:	e3a06000 	mov	r6, #0	; 0x0
  105368:	e3100006 	tst	r0, #6	; 0x6
  10536c:	e781e00c 	str	lr, [r1, ip]
  105370:	e5853020 	str	r3, [r5, #32]
  105374:	e50b6020 	str	r6, [fp, #-32]
  105378:	e50b201c 	str	r2, [fp, #-28]
  10537c:	e5820004 	str	r0, [r2, #4]
  105380:	e1a04aa4 	mov	r4, r4, lsr #21
  105384:	0a000016 	beq	1053e4 <vUSB_ISR_Handler+0xd4>
  105388:	e1560004 	cmp	r6, r4
  10538c:	e1a00006 	mov	r0, r6
  105390:	31a0c005 	movcc	ip, r5
  105394:	3a000034 	bcc	10546c <vUSB_ISR_Handler+0x15c>
  105398:	e3a0120b 	mov	r1, #-1342177280	; 0xb0000000
  10539c:	e1a01641 	mov	r1, r1, asr #12
  1053a0:	e5913030 	ldr	r3, [r1, #48]
  1053a4:	e3130004 	tst	r3, #4	; 0x4
  1053a8:	05913030 	ldreq	r3, [r1, #48]
  1053ac:	03c33002 	biceq	r3, r3, #2	; 0x2
  1053b0:	05813030 	streq	r3, [r1, #48]
  1053b4:	01a02001 	moveq	r2, r1
  1053b8:	0a000033 	beq	10548c <vUSB_ISR_Handler+0x17c>
  1053bc:	e3540000 	cmp	r4, #0	; 0x0
  1053c0:	1a00003a 	bne	1054b0 <vUSB_ISR_Handler+0x1a0>
  1053c4:	e3a0220b 	mov	r2, #-1342177280	; 0xb0000000
  1053c8:	e1a02642 	mov	r2, r2, asr #12
  1053cc:	e5923030 	ldr	r3, [r2, #48]
  1053d0:	e3c33004 	bic	r3, r3, #4	; 0x4
  1053d4:	e5823030 	str	r3, [r2, #48]
  1053d8:	e5923030 	ldr	r3, [r2, #48]
  1053dc:	e3130004 	tst	r3, #4	; 0x4
  1053e0:	1afffffc 	bne	1053d8 <vUSB_ISR_Handler+0xc8>
  1053e4:	e3a0120b 	mov	r1, #-1342177280	; 0xb0000000
  1053e8:	e1a01641 	mov	r1, r1, asr #12
  1053ec:	e5913034 	ldr	r3, [r1, #52]
  1053f0:	e3130042 	tst	r3, #66	; 0x42
  1053f4:	13a03002 	movne	r3, #2	; 0x2
  1053f8:	15813014 	strne	r3, [r1, #20]
  1053fc:	e5913030 	ldr	r3, [r1, #48]
  105400:	e3c33009 	bic	r3, r3, #9	; 0x9
  105404:	e5813030 	str	r3, [r1, #48]
  105408:	e5912034 	ldr	r2, [r1, #52]
  10540c:	e3c2200d 	bic	r2, r2, #13	; 0xd
  105410:	e5812034 	str	r2, [r1, #52]
  105414:	e5913038 	ldr	r3, [r1, #56]
  105418:	e3c3304f 	bic	r3, r3, #79	; 0x4f
  10541c:	e5813038 	str	r3, [r1, #56]
  105420:	e591203c 	ldr	r2, [r1, #60]
  105424:	e59f30bc 	ldr	r3, [pc, #188]	; 1054e8 <prog+0x44a4>
  105428:	e3c2204f 	bic	r2, r2, #79	; 0x4f
  10542c:	e581203c 	str	r2, [r1, #60]
  105430:	e5930000 	ldr	r0, [r3]
  105434:	e24b2020 	sub	r2, fp, #32	; 0x20
  105438:	e3a03000 	mov	r3, #0	; 0x0
  10543c:	e24b101c 	sub	r1, fp, #28	; 0x1c
  105440:	ebfff798 	bl	1032a8 <xQueueGenericSendFromISR>
  105444:	e51b3020 	ldr	r3, [fp, #-32]
  105448:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
  10544c:	e3530000 	cmp	r3, #0	; 0x0
  105450:	e1a029c2 	mov	r2, r2, asr #19
  105454:	e3a03000 	mov	r3, #0	; 0x0
  105458:	e5823130 	str	r3, [r2, #304]
  10545c:	1a000011 	bne	1054a8 <vUSB_ISR_Handler+0x198>
  105460:	e24bd018 	sub	sp, fp, #24	; 0x18
  105464:	e89da870 	ldmia	sp, {r4, r5, r6, fp, sp, pc}
  105468:	e51b201c 	ldr	r2, [fp, #-28]
  10546c:	e2803001 	add	r3, r0, #1	; 0x1
  105470:	e0801002 	add	r1, r0, r2
  105474:	e20300ff 	and	r0, r3, #255	; 0xff
  105478:	e59c2050 	ldr	r2, [ip, #80]
  10547c:	e1500004 	cmp	r0, r4
  105480:	e5c12008 	strb	r2, [r1, #8]
  105484:	3afffff7 	bcc	105468 <vUSB_ISR_Handler+0x158>
  105488:	eaffffc2 	b	105398 <vUSB_ISR_Handler+0x88>
  10548c:	e5923030 	ldr	r3, [r2, #48]
  105490:	e3130002 	tst	r3, #2	; 0x2
  105494:	0affffd2 	beq	1053e4 <vUSB_ISR_Handler+0xd4>
  105498:	e5923030 	ldr	r3, [r2, #48]
  10549c:	e3130002 	tst	r3, #2	; 0x2
  1054a0:	1afffff9 	bne	10548c <vUSB_ISR_Handler+0x17c>
  1054a4:	eaffffce 	b	1053e4 <vUSB_ISR_Handler+0xd4>
  1054a8:	ebfff9b8 	bl	103b90 <vTaskSwitchContext>
  1054ac:	eaffffeb 	b	105460 <vUSB_ISR_Handler+0x150>
  1054b0:	e51b301c 	ldr	r3, [fp, #-28]
  1054b4:	e1d320d8 	ldrsb	r2, [r3, #8]
  1054b8:	e3520000 	cmp	r2, #0	; 0x0
  1054bc:	aaffffc0 	bge	1053c4 <vUSB_ISR_Handler+0xb4>
  1054c0:	e5913030 	ldr	r3, [r1, #48]
  1054c4:	e3833080 	orr	r3, r3, #128	; 0x80
  1054c8:	e5813030 	str	r3, [r1, #48]
  1054cc:	e1a02001 	mov	r2, r1
  1054d0:	e5923030 	ldr	r3, [r2, #48]
  1054d4:	e3130080 	tst	r3, #128	; 0x80
  1054d8:	0afffffc 	beq	1054d0 <vUSB_ISR_Handler+0x1c0>
  1054dc:	eaffffb8 	b	1053c4 <vUSB_ISR_Handler+0xb4>
  1054e0:	00200920 	eoreq	r0, r0, r0, lsr #18
  1054e4:	00201314 	eoreq	r1, r0, r4, lsl r3
  1054e8:	002012fc 	streqd	r1, [r0], -ip

001054ec <vUSB_ISR_Wrapper>:
  1054ec:	e92d0001 	stmdb	sp!, {r0}
  1054f0:	e94d2000 	stmdb	sp, {sp}^
  1054f4:	e1a00000 	nop			(mov r0,r0)
  1054f8:	e24dd004 	sub	sp, sp, #4	; 0x4
  1054fc:	e8bd0001 	ldmia	sp!, {r0}
  105500:	e9204000 	stmdb	r0!, {lr}
  105504:	e1a0e000 	mov	lr, r0
  105508:	e8bd0001 	ldmia	sp!, {r0}
  10550c:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  105510:	e1a00000 	nop			(mov r0,r0)
  105514:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  105518:	e14f0000 	mrs	r0, SPSR
  10551c:	e92e0001 	stmdb	lr!, {r0}
  105520:	e59f0064 	ldr	r0, [pc, #100]	; 10558c <prog+0x4548>
  105524:	e5900000 	ldr	r0, [r0]
  105528:	e92e0001 	stmdb	lr!, {r0}
  10552c:	e59f005c 	ldr	r0, [pc, #92]	; 105590 <prog+0x454c>
  105530:	e5900000 	ldr	r0, [r0]
  105534:	e580e000 	str	lr, [r0]
  105538:	e59f4044 	ldr	r4, [pc, #68]	; 105584 <prog+0x4540>
  10553c:	e59f5044 	ldr	r5, [pc, #68]	; 105588 <prog+0x4544>
  105540:	e5943000 	ldr	r3, [r4]
  105544:	e5952000 	ldr	r2, [r5]
  105548:	ebffff70 	bl	105310 <vUSB_ISR_Handler>
  10554c:	e59f003c 	ldr	r0, [pc, #60]	; 105590 <prog+0x454c>
  105550:	e5900000 	ldr	r0, [r0]
  105554:	e590e000 	ldr	lr, [r0]
  105558:	e59f002c 	ldr	r0, [pc, #44]	; 10558c <prog+0x4548>
  10555c:	e8be0002 	ldmia	lr!, {r1}
  105560:	e5801000 	str	r1, [r0]
  105564:	e8be0001 	ldmia	lr!, {r0}
  105568:	e169f000 	msr	SPSR_fc, r0
  10556c:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  105570:	e1a00000 	nop			(mov r0,r0)
  105574:	e59ee03c 	ldr	lr, [lr, #60]
  105578:	e25ef004 	subs	pc, lr, #4	; 0x4
  10557c:	e5943000 	ldr	r3, [r4]
  105580:	e5952000 	ldr	r2, [r5]
  105584:	00200908 	eoreq	r0, r0, r8, lsl #18
  105588:	002008dc 	ldreqd	r0, [r0], -ip
  10558c:	00200908 	eoreq	r0, r0, r8, lsl #18
  105590:	002008dc 	ldreqd	r0, [r0], -ip
  105594:	00425355 	subeq	r5, r2, r5, asr r3
  105598:	62616e75 	rsbvs	r6, r1, #1872	; 0x750
  10559c:	7420656c 	strvct	r6, [r0], #-1388
  1055a0:	6f6c206f 	swivs	0x006c206f
  1055a4:	65206461 	strvs	r6, [r0, #-1121]!
  1055a8:	7269766e 	rsbvc	r7, r9, #115343360	; 0x6e00000
  1055ac:	656d6e6f 	strvsb	r6, [sp, #-3695]!
  1055b0:	202c746e 	eorcs	r7, ip, lr, ror #8
  1055b4:	65736572 	ldrvsb	r6, [r3, #-1394]!
  1055b8:	6e697474 	mcrvs	4, 3, r7, cr9, cr4, {3}
  1055bc:	6f742067 	swivs	0x00742067
  1055c0:	66656420 	strvsbt	r6, [r5], -r0, lsr #8
  1055c4:	746c7561 	strvcbt	r7, [ip], #-1377
  1055c8:	00000a73 	andeq	r0, r0, r3, ror sl
  1055cc:	65736572 	ldrvsb	r6, [r3, #-1394]!
  1055d0:	6e697474 	mcrvs	4, 3, r7, cr9, cr4, {3}
  1055d4:	6f742067 	swivs	0x00742067
  1055d8:	66656420 	strvsbt	r6, [r5], -r0, lsr #8
  1055dc:	746c7561 	strvcbt	r7, [ip], #-1377
  1055e0:	6f6f6220 	swivs	0x006f6220
  1055e4:	616f6c74 	smivs	63172
  1055e8:	20726564 	rsbcss	r6, r2, r4, ror #10
  1055ec:	75206e69 	strvc	r6, [r0, #-3689]!
  1055f0:	74616470 	strvcbt	r6, [r1], #-1136
  1055f4:	6f6d2065 	swivs	0x006d2065
  1055f8:	000a6564 	andeq	r6, sl, r4, ror #10
  1055fc:	65726966 	ldrvsb	r6, [r2, #-2406]!
  105600:	00000000 	andeq	r0, r0, r0
  105604:	75626564 	strvcb	r6, [r2, #-1380]!
  105608:	00000067 	andeq	r0, r0, r7, rrx
  10560c:	006d6964 	rsbeq	r6, sp, r4, ror #18
  105610:	706c6568 	rsbvc	r6, ip, r8, ror #10
  105614:	00000000 	andeq	r0, r0, r0
  105618:	00006469 	andeq	r6, r0, r9, ror #8
  10561c:	5f66726e 	swipl	0x0066726e
  105620:	706d7564 	rsbvc	r7, sp, r4, ror #10
  105624:	00000000 	andeq	r0, r0, r0
  105628:	5f66726e 	swipl	0x0066726e
  10562c:	74696e69 	strvcbt	r6, [r9], #-3689
  105630:	00000000 	andeq	r0, r0, r0
  105634:	5f66726e 	swipl	0x0066726e
  105638:	65736572 	ldrvsb	r6, [r3, #-1394]!
  10563c:	00000074 	andeq	r0, r0, r4, ror r0
  105640:	74617473 	strvcbt	r7, [r1], #-1139
  105644:	00007375 	andeq	r7, r0, r5, ror r3
  105648:	61647075 	smivs	18181
  10564c:	00006574 	andeq	r6, r0, r4, ror r5
  105650:	0063616d 	rsbeq	r6, r3, sp, ror #2
  105654:	0043414d 	subeq	r4, r3, sp, asr #2
  105658:	532d4652 	teqpl	sp, #85983232	; 0x5200000
  10565c:	75746174 	ldrvcb	r6, [r4, #-372]!
  105660:	00000073 	andeq	r0, r0, r3, ror r0
  105664:	4d494457 	cfstrdmi	mvd4, [r9, #-348]
  105668:	61747320 	cmnvs	r4, r0, lsr #6
  10566c:	202c6574 	eorcs	r6, ip, r4, ror r5
  105670:	6d726966 	ldcvsl	9, cr6, [r2, #-408]!
  105674:	65726177 	ldrvsb	r6, [r2, #-375]!
  105678:	72657620 	rsbvc	r7, r5, #33554432	; 0x2000000
  10567c:	6e6f6973 	mcrvs	9, 3, r6, cr15, cr3, {3}
  105680:	302e3120 	eorcc	r3, lr, r0, lsr #2
  105684:	0000000a 	andeq	r0, r0, sl
  105688:	4d202020 	stcmi	0, cr2, [r0, #-128]!
  10568c:	3d204341 	stccc	3, cr4, [r0, #-260]!
  105690:	00783020 	rsbeqs	r3, r8, r0, lsr #32
  105694:	4c202020 	stcmi	0, cr2, [r0], #-128
  105698:	20504d41 	subcss	r4, r0, r1, asr #26
  10569c:	3d204449 	cfstrscc	mvf4, [r0, #-292]!
  1056a0:	00000020 	andeq	r0, r0, r0, lsr #32
  1056a4:	57202020 	strpl	r2, [r0, -r0, lsr #32]!
  1056a8:	2055434d 	subcss	r4, r5, sp, asr #6
  1056ac:	3d204449 	cfstrscc	mvf4, [r0, #-292]!
  1056b0:	00000020 	andeq	r0, r0, r0, lsr #32
  1056b4:	63202020 	teqvs	r0, #32	; 0x20
  1056b8:	65727275 	ldrvsb	r7, [r2, #-629]!
  1056bc:	6420746e 	strvst	r7, [r0], #-1134
  1056c0:	76206d69 	strvct	r6, [r0], -r9, ror #26
  1056c4:	65756c61 	ldrvsb	r6, [r5, #-3169]!
  1056c8:	00203d20 	eoreq	r3, r0, r0, lsr #26
  1056cc:	44202020 	strmit	r2, [r0], #-32
  1056d0:	454d4d49 	strmib	r4, [sp, #-3401]
  1056d4:	53492052 	cmppl	r9, #82	; 0x52
  1056d8:	52554320 	subpls	r4, r5, #-2147483648	; 0x80000000
  1056dc:	544e4552 	strplb	r4, [lr], #-1362
  1056e0:	4620594c 	strmit	r5, [r0], -ip, asr #18
  1056e4:	4543524f 	strmib	r5, [r3, #-591]
  1056e8:	464f2044 	strmib	r2, [pc], -r4, asr #32
  1056ec:	000a2146 	andeq	r2, sl, r6, asr #2
  1056f0:	64202020 	strvst	r2, [r0], #-32
  1056f4:	656d6d69 	strvsb	r6, [sp, #-3433]!
  1056f8:	6f6e2072 	swivs	0x006e2072
  1056fc:	6f662074 	swivs	0x00662074
  105700:	64656372 	strvsbt	r6, [r5], #-882
  105704:	66666f20 	strvsbt	r6, [r6], -r0, lsr #30
  105708:	00000a2e 	andeq	r0, r0, lr, lsr #20
  10570c:	64202020 	strvst	r2, [r0], #-32
  105710:	656d6d69 	strvsb	r6, [sp, #-3433]!
  105714:	696a2072 	stmvsdb	sl!, {r1, r4, r5, r6, sp}^
  105718:	72657474 	rsbvc	r7, r5, #1946157056	; 0x74000000
  10571c:	00203d20 	eoreq	r3, r0, r0, lsr #26
  105720:	45202020 	strmi	r2, [r0, #-32]!
  105724:	7020494d 	eorvc	r4, r0, sp, asr #18
  105728:	65736c75 	ldrvsb	r6, [r3, #-3189]!
  10572c:	203d2073 	eorcss	r2, sp, r3, ror r0
  105730:	00000000 	andeq	r0, r0, r0
  105734:	70202020 	eorvc	r2, r0, r0, lsr #32
  105738:	656b6361 	strvsb	r6, [fp, #-865]!
  10573c:	6f632074 	swivs	0x00632074
  105740:	20746e75 	rsbcss	r6, r4, r5, ror lr
  105744:	0000203d 	andeq	r2, r0, sp, lsr r0
  105748:	6c202020 	stcvs	0, cr2, [r0], #-128
  10574c:	20747361 	rsbcss	r7, r4, r1, ror #6
  105750:	75716573 	ldrvcb	r6, [r1, #-1395]!
  105754:	65636e65 	strvsb	r6, [r3, #-3685]!
  105758:	6d756e20 	ldcvsl	14, cr6, [r5, #-128]!
  10575c:	20726562 	rsbcss	r6, r2, r2, ror #10
  105760:	0000203d 	andeq	r2, r0, sp, lsr r0
  105764:	70202020 	eorvc	r2, r0, r0, lsr #32
  105768:	73676e69 	cmnvc	r7, #1680	; 0x690
  10576c:	616c203a 	cmnvs	ip, sl, lsr r0
  105770:	73207473 	teqvc	r0, #1929379840	; 0x73000000
  105774:	00207165 	eoreq	r7, r0, r5, ror #2
  105778:	6f6c202c 	swivs	0x006c202c
  10577c:	00207473 	eoreq	r7, r0, r3, ror r4
  105780:	64202020 	strvst	r2, [r0], #-32
  105784:	656d6d69 	strvsb	r6, [sp, #-3433]!
  105788:	65642072 	strvsb	r2, [r4, #-114]!
  10578c:	2079616c 	rsbcss	r6, r9, ip, ror #2
  105790:	0000203d 	andeq	r2, r0, sp, lsr r0
  105794:	0a736d20 	beq	1de0c1c <__stack_end__+0x1bdcc20>
  105798:	00000000 	andeq	r0, r0, r0
  10579c:	47202020 	strmi	r2, [r0, -r0, lsr #32]!
  1057a0:	414d4d41 	cmpmi	sp, r1, asr #26
  1057a4:	62617420 	rsbvs	r7, r1, #536870912	; 0x20000000
  1057a8:	093a656c 	ldmeqdb	sl!, {r2, r3, r5, r6, r8, sl, sp, lr}
  1057ac:	00000000 	andeq	r0, r0, r0
  1057b0:	0009090a 	andeq	r0, r9, sl, lsl #18
  1057b4:	6e696c42 	cdpvs	12, 6, cr6, cr9, cr2, {2}
  1057b8:	6c6e656b 	cfstr64vs	mvdx6, [lr], #-428
  1057bc:	74686769 	strvcbt	r6, [r8], #-1897
  1057c0:	6f632073 	swivs	0x00632073
  1057c4:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
  1057c8:	68732064 	ldmvsda	r3!, {r2, r5, r6, sp}^
  1057cc:	206c6c65 	rsbcs	r6, ip, r5, ror #24
  1057d0:	706c6568 	rsbvc	r6, ip, r8, ror #10
  1057d4:	00000a2e 	andeq	r0, r0, lr, lsr #20
  1057d8:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057dc:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057e0:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057e4:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057e8:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057ec:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057f0:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057f4:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!
  1057f8:	00000a2d 	andeq	r0, r0, sp, lsr #20
  1057fc:	62655b64 	rsbvs	r5, r5, #102400	; 0x19000
  105800:	205d6775 	subcss	r6, sp, r5, ror r7
  105804:	76656c3c 	undefined
  105808:	093e6c65 	ldmeqdb	lr!, {r0, r2, r5, r6, sl, fp, sp, lr}
  10580c:	65440909 	strvsb	r0, [r4, #-2313]
  105810:	656e6966 	strvsb	r6, [lr, #-2406]!
  105814:	65687420 	strvsb	r7, [r8, #-1056]!
  105818:	62656420 	rsbvs	r6, r5, #536870912	; 0x20000000
  10581c:	6c206775 	stcvs	7, cr6, [r0], #-468
  105820:	6c657665 	stcvsl	6, cr7, [r5], #-404
  105824:	0000000a 	andeq	r0, r0, sl
  105828:	206d6964 	rsbcs	r6, sp, r4, ror #18
  10582c:	6c61763c 	stcvsl	6, cr7, [r1], #-240
  105830:	093e6575 	ldmeqdb	lr!, {r0, r2, r4, r5, r6, r8, sl, sp, lr}
  105834:	65530909 	ldrvsb	r0, [r3, #-2313]
  105838:	68742074 	ldmvsda	r4!, {r2, r4, r5, r6, sp}^
  10583c:	69642065 	stmvsdb	r4!, {r0, r2, r5, r6, sp}^
  105840:	72656d6d 	rsbvc	r6, r5, #6976	; 0x1b40
  105844:	206f7420 	rsbcs	r7, pc, r0, lsr #8
  105848:	61762061 	cmnvs	r6, r1, rrx
  10584c:	2065756c 	rsbcs	r7, r5, ip, ror #10
  105850:	74656228 	strvcbt	r6, [r5], #-552
  105854:	6e656577 	mcrvs	5, 3, r6, cr5, cr7, {3}
  105858:	61203020 	teqvs	r0, r0, lsr #32
  10585c:	3120646e 	teqcc	r0, lr, ror #8
  105860:	000a2935 	andeq	r2, sl, r5, lsr r9
  105864:	706c6568 	rsbvc	r6, ip, r8, ror #10
  105868:	09090909 	stmeqdb	r9, {r0, r3, r8, fp}
  10586c:	73696854 	cmnvc	r9, #5505024	; 0x540000
  105870:	72637320 	rsbvc	r7, r3, #-2147483648	; 0x80000000
  105874:	0a6e6565 	beq	1c9ee10 <__stack_end__+0x1a9ae14>
  105878:	00000000 	andeq	r0, r0, r0
  10587c:	3c206469 	cfstrscc	mvf6, [r0], #-420
  105880:	5f75636d 	swipl	0x0075636d
  105884:	203e6469 	eorcss	r6, lr, r9, ror #8
  105888:	6d616c3c 	stcvsl	12, cr6, [r1, #-240]!
  10588c:	64695f70 	strvsbt	r5, [r9], #-3952
  105890:	5309093e 	tstpl	r9, #1015808	; 0xf8000
  105894:	6d207465 	cfstrsvs	mvf7, [r0, #-404]!
  105898:	61207563 	teqvs	r0, r3, ror #10
  10589c:	6c20646e 	cfstrsvs	mvf6, [r0], #-440
  1058a0:	20706d61 	rsbcss	r6, r0, r1, ror #26
  1058a4:	000a6469 	andeq	r6, sl, r9, ror #8
  1058a8:	65736572 	ldrvsb	r6, [r3, #-1394]!
  1058ac:	09090974 	stmeqdb	r9, {r2, r4, r5, r6, r8, fp}
  1058b0:	73655209 	cmnvc	r5, #-1879048192	; 0x90000000
  1058b4:	74207465 	strvct	r7, [r0], #-1125
  1058b8:	6e206568 	cfsh64vs	mvdx6, mvdx0, #56
  1058bc:	762d6e6f 	strvct	r6, [sp], -pc, ror #28
  1058c0:	74616c6f 	strvcbt	r6, [r1], #-3183
  1058c4:	20656c69 	rsbcs	r6, r5, r9, ror #24
  1058c8:	73616c66 	cmnvc	r1, #26112	; 0x6600
  1058cc:	6f742068 	swivs	0x00742068
  1058d0:	66656420 	strvsbt	r6, [r5], -r0, lsr #8
  1058d4:	746c7561 	strvcbt	r7, [ip], #-1377
  1058d8:	00000a73 	andeq	r0, r0, r3, ror sl
  1058dc:	2063616d 	rsbcs	r6, r3, sp, ror #2
  1058e0:	7978783c 	ldmvcdb	r8!, {r2, r3, r4, r5, fp, ip, sp, lr}^
  1058e4:	5b203e79 	blpl	9152d0 <__stack_end__+0x7112d4>
  1058e8:	6372633c 	cmnvs	r2, #-268435456	; 0xf0000000
  1058ec:	09095d3e 	stmeqdb	r9, {r1, r2, r3, r4, r5, r8, sl, fp, ip, lr}
  1058f0:	20746553 	rsbcss	r6, r4, r3, asr r5
  1058f4:	20656874 	rsbcs	r6, r5, r4, ror r8
  1058f8:	2043414d 	subcs	r4, r3, sp, asr #2
  1058fc:	72646461 	rsbvc	r6, r4, #1627389952	; 0x61000000
  105900:	20737365 	rsbcss	r7, r3, r5, ror #6
  105904:	7420666f 	strvct	r6, [r0], #-1647
  105908:	20736968 	rsbcss	r6, r3, r8, ror #18
  10590c:	74696e75 	strvcbt	r6, [r9], #-3701
  105910:	00000a2e 	andeq	r0, r0, lr, lsr #20
  105914:	5f66726e 	swipl	0x0066726e
  105918:	706d7564 	rsbvc	r7, sp, r4, ror #10
  10591c:	64090909 	strvs	r0, [r9], #-2313
  105920:	73706d75 	cmnvc	r0, #7488	; 0x1d40
  105924:	342e3220 	strcct	r3, [lr], #-544
  105928:	207a4847 	rsbcss	r4, sl, r7, asr #16
  10592c:	6e6f7266 	cdpvs	2, 6, cr7, cr15, cr6, {3}
  105930:	646e6574 	strvsbt	r6, [lr], #-1396
  105934:	526e2820 	rsbpl	r2, lr, #2097152	; 0x200000
  105938:	4c343246 	lfmmi	f3, 4, [r4], #-280
  10593c:	20293130 	eorcs	r3, r9, r0, lsr r1
  105940:	69676572 	stmvsdb	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
  105944:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
  105948:	74657320 	strvcbt	r7, [r5], #-800
  10594c:	0000000a 	andeq	r0, r0, sl
  105950:	5f66726e 	swipl	0x0066726e
  105954:	74696e69 	strvcbt	r6, [r9], #-3689
  105958:	49090909 	stmmidb	r9, {r0, r3, r8, fp}
  10595c:	6974696e 	ldmvsdb	r4!, {r1, r2, r3, r5, r6, r8, fp, sp, lr}^
  105960:	7a696c61 	bvc	1b60aec <__stack_end__+0x195caf0>
  105964:	2e322065 	cdpcs	0, 3, cr2, cr2, cr5, {3}
  105968:	7a484734 	bvc	1317640 <__stack_end__+0x1113644>
  10596c:	6f726620 	swivs	0x00726620
  105970:	6e65746e 	cdpvs	4, 6, cr7, cr5, cr14, {3}
  105974:	72662064 	rsbvc	r2, r6, #100	; 0x64
  105978:	73206d6f 	teqvc	r0, #7104	; 0x1bc0
  10597c:	74617263 	strvcbt	r7, [r1], #-611
  105980:	000a6863 	andeq	r6, sl, r3, ror #16
  105984:	5f66726e 	swipl	0x0066726e
  105988:	65736572 	ldrvsb	r6, [r3, #-1394]!
  10598c:	09090974 	stmeqdb	r9, {r2, r4, r5, r6, r8, fp}
  105990:	65736572 	ldrvsb	r6, [r3, #-1394]!
  105994:	2e322074 	mrccs	0, 1, r2, cr2, cr4, {3}
  105998:	7a484734 	bvc	1317670 <__stack_end__+0x1113674>
  10599c:	6f726620 	swivs	0x00726620
  1059a0:	6e65746e 	cdpvs	4, 6, cr7, cr5, cr14, {3}
  1059a4:	49462064 	stmmidb	r6, {r2, r5, r6, sp}^
  1059a8:	0a734f46 	beq	1dd96c8 <__stack_end__+0x1bd56cc>
  1059ac:	00000000 	andeq	r0, r0, r0
  1059b0:	74617473 	strvcbt	r7, [r1], #-1139
  1059b4:	09097375 	stmeqdb	r9, {r0, r2, r4, r5, r6, r8, r9, ip, sp, lr}
  1059b8:	72500909 	subvcs	r0, r0, #147456	; 0x24000
  1059bc:	20746e69 	rsbcss	r6, r4, r9, ror #28
  1059c0:	74617473 	strvcbt	r7, [r1], #-1139
  1059c4:	69207375 	stmvsdb	r0!, {r0, r2, r4, r5, r6, r8, r9, ip, sp, lr}
  1059c8:	726f666e 	rsbvc	r6, pc, #115343360	; 0x6e00000
  1059cc:	6974616d 	ldmvsdb	r4!, {r0, r2, r3, r5, r6, r8, sp, lr}^
  1059d0:	61206e6f 	teqvs	r0, pc, ror #28
  1059d4:	74756f62 	ldrvcbt	r6, [r5], #-3938
  1059d8:	69687420 	stmvsdb	r8!, {r5, sl, ip, sp, lr}^
  1059dc:	6e752073 	mrcvs	0, 3, r2, cr5, cr3, {3}
  1059e0:	0a2e7469 	beq	ca2b8c <__stack_end__+0xa9eb90>
  1059e4:	00000000 	andeq	r0, r0, r0
  1059e8:	61647075 	smivs	18181
  1059ec:	09096574 	stmeqdb	r9, {r2, r4, r5, r6, r8, sl, sp, lr}
  1059f0:	6e450909 	cdpvs	9, 4, cr0, cr5, cr9, {0}
  1059f4:	20726574 	rsbcss	r6, r2, r4, ror r5
  1059f8:	61647075 	smivs	18181
  1059fc:	6d206574 	cfstr32vs	mvfx6, [r0, #-464]!
  105a00:	2065646f 	rsbcs	r6, r5, pc, ror #8
  105a04:	4f44202d 	swimi	0x0044202d
  105a08:	544f4e20 	strplb	r4, [pc], #3616	; 105a10 <prog+0x49cc>
  105a0c:	45535520 	ldrmib	r5, [r3, #-1312]
  105a10:	524f4620 	subpl	r4, pc, #33554432	; 0x2000000
  105a14:	4e554620 	cdpmi	6, 5, cr4, cr5, cr0, {1}
  105a18:	0000000a 	andeq	r0, r0, sl
  105a1c:	532d4652 	teqpl	sp, #85983232	; 0x5200000
  105a20:	75746174 	ldrvcb	r6, [r4, #-372]!
  105a24:	67202073 	undefined
  105a28:	67676767 	strvsb	r6, [r7, -r7, ror #14]!
  105a2c:	0a676767 	beq	1adf7d0 <__stack_end__+0x18db7d4>
  105a30:	00000000 	andeq	r0, r0, r0
  105a34:	75676f62 	strvcb	r6, [r7, #-3938]!
  105a38:	68632073 	stmvsda	r3!, {r0, r1, r4, r5, r6, sp}^
  105a3c:	736b6365 	cmnvc	fp, #-1811939327	; 0x94000001
  105a40:	0a216d75 	beq	96101c <__stack_end__+0x75d020>
  105a44:	00000000 	andeq	r0, r0, r0
  105a48:	61766e69 	cmnvs	r6, r9, ror #28
  105a4c:	2064696c 	rsbcs	r6, r4, ip, ror #18
  105a50:	2163616d 	cmncs	r3, sp, ror #2
  105a54:	0000000a 	andeq	r0, r0, sl
  105a58:	75676f62 	strvcb	r6, [r7, #-3938]!
  105a5c:	6f632073 	swivs	0x00632073
  105a60:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
  105a64:	000a2e64 	andeq	r2, sl, r4, ror #28
  105a68:	61766e69 	cmnvs	r6, r9, ror #28
  105a6c:	2064696c 	rsbcs	r6, r4, ip, ror #18
  105a70:	63656863 	cmnvs	r5, #6488064	; 0x630000
  105a74:	6d75736b 	ldcvsl	3, cr7, [r5, #-428]!
  105a78:	63202d20 	teqvs	r0, #2048	; 0x800
  105a7c:	616d6d6f 	cmnvs	sp, pc, ror #26
  105a80:	6920646e 	stmvsdb	r0!, {r1, r2, r3, r5, r6, sl, sp, lr}
  105a84:	726f6e67 	rsbvc	r6, pc, #1648	; 0x670
  105a88:	000a6465 	andeq	r6, sl, r5, ror #8
  105a8c:	74746573 	ldrvcbt	r6, [r4], #-1395
  105a90:	20676e69 	rsbcs	r6, r7, r9, ror #28
  105a94:	2077656e 	rsbcss	r6, r7, lr, ror #10
  105a98:	2e43414d 	dvfcssm	f4, f3, #5.0
  105a9c:	0000000a 	andeq	r0, r0, sl
  105aa0:	61656c50 	cmnvs	r5, r0, asr ip
  105aa4:	70206573 	eorvc	r6, r0, r3, ror r5
  105aa8:	7265776f 	rsbvc	r7, r5, #29097984	; 0x1bc0000
  105aac:	6379632d 	cmnvs	r9, #-1275068416	; 0xb4000000
  105ab0:	7420656c 	strvct	r6, [r0], #-1388
  105ab4:	64206568 	strvst	r6, [r0], #-1384
  105ab8:	63697665 	cmnvs	r9, #105906176	; 0x6500000
  105abc:	6f742065 	swivs	0x00742065
  105ac0:	6b616d20 	blvs	1960f48 <__stack_end__+0x175cf4c>
  105ac4:	68742065 	ldmvsda	r4!, {r0, r2, r5, r6, sp}^
  105ac8:	63207369 	teqvs	r0, #-1543503871	; 0xa4000001
  105acc:	676e6168 	strvsb	r6, [lr, -r8, ror #2]!
  105ad0:	61742065 	cmnvs	r4, r5, rrx
  105ad4:	7020656b 	eorvc	r6, r0, fp, ror #10
  105ad8:	6563616c 	strvsb	r6, [r3, #-364]!
  105adc:	00000a2e 	andeq	r0, r0, lr, lsr #20
  105ae0:	74746573 	ldrvcbt	r6, [r4], #-1395
  105ae4:	20676e69 	rsbcs	r6, r7, r9, ror #28
  105ae8:	6d6d6964 	stcvsl	9, cr6, [sp, #-400]!
  105aec:	74207265 	strvct	r7, [r0], #-613
  105af0:	6176206f 	cmnvs	r6, pc, rrx
  105af4:	2065756c 	rsbcs	r7, r5, ip, ror #10
  105af8:	00000000 	andeq	r0, r0, r0
  105afc:	74617453 	strvcbt	r7, [r1], #-1107
  105b00:	000a7375 	andeq	r7, sl, r5, ror r3
  105b04:	52524143 	subpls	r4, r2, #-1073741808	; 0xc0000010
  105b08:	3a524549 	bcc	1597034 <__stack_end__+0x1393038>
  105b0c:	00000a20 	andeq	r0, r0, r0, lsr #20
  105b10:	6e616843 	cdpvs	8, 6, cr6, cr1, cr3, {2}
  105b14:	3a6c656e 	bcc	1c1f0d4 <__stack_end__+0x1a1b0d8>
  105b18:	00000a20 	andeq	r0, r0, r0, lsr #20
  105b1c:	61726170 	cmnvs	r2, r0, ror r1
  105b20:	6574656d 	ldrvsb	r6, [r4, #-1389]!
  105b24:	696d2072 	stmvsdb	sp!, {r1, r4, r5, r6, sp}^
  105b28:	6e697373 	mcrvs	3, 3, r7, cr9, cr3, {3}
  105b2c:	00000a67 	andeq	r0, r0, r7, ror #20
  105b30:	74746573 	ldrvcbt	r6, [r4], #-1395
  105b34:	20676e69 	rsbcs	r6, r7, r9, ror #28
  105b38:	75636d77 	strvcb	r6, [r3, #-3447]!
  105b3c:	20646920 	rsbcs	r6, r4, r0, lsr #18
  105b40:	00000000 	andeq	r0, r0, r0
  105b44:	616c202c 	cmnvs	ip, ip, lsr #32
  105b48:	6920706d 	stmvsdb	r0!, {r0, r2, r3, r5, r6, ip, sp, lr}
  105b4c:	00002064 	andeq	r2, r0, r4, rrx
  105b50:	726f7473 	rsbvc	r7, pc, #1929379840	; 0x73000000
  105b54:	2e676e69 	cdpcs	14, 6, cr6, cr7, cr9, {3}
  105b58:	0000000a 	andeq	r0, r0, sl
  105b5c:	20746f6e 	rsbcss	r6, r4, lr, ror #30
  105b60:	726f7473 	rsbvc	r7, pc, #1929379840	; 0x73000000
  105b64:	2c676e69 	stccsl	14, cr6, [r7], #-420
  105b68:	6c617620 	stcvsl	6, cr7, [r1], #-128
  105b6c:	20736575 	rsbcss	r6, r3, r5, ror r5
  105b70:	20657261 	rsbcs	r7, r5, r1, ror #4
  105b74:	20656874 	rsbcs	r6, r5, r4, ror r8
  105b78:	656d6173 	strvsb	r6, [sp, #-371]!
  105b7c:	00000a2e 	andeq	r0, r0, lr, lsr #20
  105b80:	74746573 	ldrvcbt	r6, [r4], #-1395
  105b84:	20676e69 	rsbcs	r6, r7, r9, ror #28
  105b88:	75626564 	strvcb	r6, [r2, #-1380]!
  105b8c:	656c2067 	strvsb	r2, [ip, #-103]!
  105b90:	206c6576 	rsbcs	r6, ip, r6, ror r5
  105b94:	00206f74 	eoreq	r6, r0, r4, ror pc
  105b98:	53425355 	cmppl	r2, #1409286145	; 0x54000001
  105b9c:	4c4c4548 	cfstr64mi	mvdx4, [ip], {72}
  105ba0:	00000000 	andeq	r0, r0, r0
  105ba4:	454c4449 	strmib	r4, [ip, #-1097]
	...

00105ba9 <pxDeviceDescriptor>:
  105ba9:	01100112 08000002 08af16c0 02010110     ................
  105bb9:	43000200                                         ...

00105bbc <pxConfigDescriptorSizes>:
  105bbc:	00000043 00000043                       C...C...

00105bc4 <pxConfigDescriptor2>:
  105bc4:	00430209 80030202 00040932 02020100     ..C.....2.......
  105bd4:	24050401 04011000 05000224 01000624     ...$....$...$...
  105be4:	00012405 83050701 ff000803 00010409     .$..............
  105bf4:	00000a02 01050700 00004002 02820507     .........@......
  105c04:	09000040                                         @..

00105c07 <pxConfigDescriptor1>:
  105c07:	00430209 80030102 000409fa 02020100     ..C.............
  105c17:	24050401 04011000 05000224 01000624     ...$....$...$...
  105c27:	00012405 83050701 ff000803 00010409     .$..............
  105c37:	00000a02 01050700 00004002 02820507     .........@......
  105c47:	28000040                                         @..

00105c4a <pxProductStringDescriptor>:
  105c4a:	004f0328 00650070 0042006e 00610065     (.O.p.e.n.B.e.a.
  105c5a:	006f0063 0020006e 006c0042 006e0069     c.o.n. .B.l.i.n.
  105c6a:	0065006b 006c006e 00000067              k.e.n.l.g...

00105c76 <pxManufacturerStringDescriptor>:
  105c76:	0062031c 00740069 0061006d 0075006e     ..b.i.t.m.a.n.u.
  105c86:	00610066 0074006b 00720075              f.a.k.t.u.r.

00105c92 <pxLanguageStringDescriptor>:
  105c92:	04090304                                ....

00105c96 <pxLineCoding>:
  105c96:	0001c200 00080000 00430000 00000000              ..........C...
Disassemblierung der Sektion .data:

00200000 <__data_beg__>:
  200000:	ea000013 	b	200054 <__malloc_av_+0x2c>
  200004:	eafffffe 	b	200004 <__data_beg__+0x4>
  200008:	ea000054 	b	200160 <__malloc_av_+0x138>
  20000c:	eafffffe 	b	20000c <__data_beg__+0xc>
  200010:	eafffffe 	b	200010 <__data_beg__+0x10>
  200014:	eafffffe 	b	200014 <__data_beg__+0x14>
  200018:	eafffffe 	b	200018 <__data_beg__+0x18>
  20001c:	e599820c 	ldr	r8, [r9, #524]

00200020 <__malloc_sbrk_base>:
  200020:	ffffffff                                ....

00200024 <__malloc_trim_threshold>:
  200024:	00020000                                ....

00200028 <__malloc_av_>:
	...
  200030:	00200028 00200028 00200030 00200030     (. .(. .0. .0. .
  200040:	00200038 00200038 00200040 00200040     8. .8. .@. .@. .
  200050:	00200048 00200048 00200050 00200050     H. .H. .P. .P. .
  200060:	00200058 00200058 00200060 00200060     X. .X. .`. .`. .
  200070:	00200068 00200068 00200070 00200070     h. .h. .p. .p. .
  200080:	00200078 00200078 00200080 00200080     x. .x. ... ... .
  200090:	00200088 00200088 00200090 00200090     .. ... ... ... .
  2000a0:	00200098 00200098 002000a0 002000a0     .. ... ... ... .
  2000b0:	002000a8 002000a8 002000b0 002000b0     .. ... ... ... .
  2000c0:	002000b8 002000b8 002000c0 002000c0     .. ... ... ... .
  2000d0:	002000c8 002000c8 002000d0 002000d0     .. ... ... ... .
  2000e0:	002000d8 002000d8 002000e0 002000e0     .. ... ... ... .
  2000f0:	002000e8 002000e8 002000f0 002000f0     .. ... ... ... .
  200100:	002000f8 002000f8 00200100 00200100     .. ... ... ... .
  200110:	00200108 00200108 00200110 00200110     .. ... ... ... .
  200120:	00200118 00200118 00200120 00200120     .. ... . . . . .
  200130:	00200128 00200128 00200130 00200130     (. .(. .0. .0. .
  200140:	00200138 00200138 00200140 00200140     8. .8. .@. .@. .
  200150:	00200148 00200148 00200150 00200150     H. .H. .P. .P. .
  200160:	00200158 00200158 00200160 00200160     X. .X. .`. .`. .
  200170:	00200168 00200168 00200170 00200170     h. .h. .p. .p. .
  200180:	00200178 00200178 00200180 00200180     x. .x. ... ... .
  200190:	00200188 00200188 00200190 00200190     .. ... ... ... .
  2001a0:	00200198 00200198 002001a0 002001a0     .. ... ... ... .
  2001b0:	002001a8 002001a8 002001b0 002001b0     .. ... ... ... .
  2001c0:	002001b8 002001b8 002001c0 002001c0     .. ... ... ... .
  2001d0:	002001c8 002001c8 002001d0 002001d0     .. ... ... ... .
  2001e0:	002001d8 002001d8 002001e0 002001e0     .. ... ... ... .
  2001f0:	002001e8 002001e8 002001f0 002001f0     .. ... ... ... .
  200200:	002001f8 002001f8 00200200 00200200     .. ... ... ... .
  200210:	00200208 00200208 00200210 00200210     .. ... ... ... .
  200220:	00200218 00200218 00200220 00200220     .. ... . . . . .
  200230:	00200228 00200228 00200230 00200230     (. .(. .0. .0. .
  200240:	00200238 00200238 00200240 00200240     8. .8. .@. .@. .
  200250:	00200248 00200248 00200250 00200250     H. .H. .P. .P. .
  200260:	00200258 00200258 00200260 00200260     X. .X. .`. .`. .
  200270:	00200268 00200268 00200270 00200270     h. .h. .p. .p. .
  200280:	00200278 00200278 00200280 00200280     x. .x. ... ... .
  200290:	00200288 00200288 00200290 00200290     .. ... ... ... .
  2002a0:	00200298 00200298 002002a0 002002a0     .. ... ... ... .
  2002b0:	002002a8 002002a8 002002b0 002002b0     .. ... ... ... .
  2002c0:	002002b8 002002b8 002002c0 002002c0     .. ... ... ... .
  2002d0:	002002c8 002002c8 002002d0 002002d0     .. ... ... ... .
  2002e0:	002002d8 002002d8 002002e0 002002e0     .. ... ... ... .
  2002f0:	002002e8 002002e8 002002f0 002002f0     .. ... ... ... .
  200300:	002002f8 002002f8 00200300 00200300     .. ... ... ... .
  200310:	00200308 00200308 00200310 00200310     .. ... ... ... .
  200320:	00200318 00200318 00200320 00200320     .. ... . . . . .
  200330:	00200328 00200328 00200330 00200330     (. .(. .0. .0. .
  200340:	00200338 00200338 00200340 00200340     8. .8. .@. .@. .
  200350:	00200348 00200348 00200350 00200350     H. .H. .P. .P. .
  200360:	00200358 00200358 00200360 00200360     X. .X. .`. .`. .
  200370:	00200368 00200368 00200370 00200370     h. .h. .p. .p. .
  200380:	00200378 00200378 00200380 00200380     x. .x. ... ... .
  200390:	00200388 00200388 00200390 00200390     .. ... ... ... .
  2003a0:	00200398 00200398 002003a0 002003a0     .. ... ... ... .
  2003b0:	002003a8 002003a8 002003b0 002003b0     .. ... ... ... .
  2003c0:	002003b8 002003b8 002003c0 002003c0     .. ... ... ... .
  2003d0:	002003c8 002003c8 002003d0 002003d0     .. ... ... ... .
  2003e0:	002003d8 002003d8 002003e0 002003e0     .. ... ... ... .
  2003f0:	002003e8 002003e8 002003f0 002003f0     .. ... ... ... .
  200400:	002003f8 002003f8 00200400 00200400     .. ... ... ... .
  200410:	00200408 00200408 00200410 00200410     .. ... ... ... .
  200420:	00200418 00200418 00200420 00200420     .. ... . . . . .

00200430 <impure_data>:
  200430:	00000000 0020071c 00200778 002007d4     ...... .x. ... .
	...
  200464:	00105ca0 00000000 00000000 00000000     .\..............
	...
  2004d4:	00000001 00000000 abcd330e e66d1234     .........3..4.m.
  2004e4:	0005deec 0000000b 00000000 00000000     ................
	...

00200830 <_impure_ptr>:
  200830:	00200430                                0. .

00200834 <debug>:
  200834:	00000000                                ....

00200838 <last_ping_seq>:
  200838:	00000000                                ....

0020083c <last_sequence>:
  20083c:	00000000                                ....

00200840 <pings_lost>:
  200840:	00000000                                ....

00200844 <pt_dump_registers>:
  200844:	00000000                                ....

00200848 <pt_reset_type>:
  200848:	00000000                                ....

0020084c <jam_mac>:
  20084c:	4d4d414a 434d5700                                JAMM.

00200851 <wmcu_mac>:
  200851:	55434d57 00000000                                WMCU...

00200858 <dimmer_off>:
  200858:	00000000                                ....

0020085c <commands>:
  20085c:	001055fc 001025c8 00105604 0010272c     .U...%...V..,'..
  20086c:	0010560c 001024d4 00105610 00102230     .V...$...V..0"..
  20087c:	00105618 001025fc 0010561c 00102798     .V...%...V...'..
  20088c:	00105628 0010279c 00105634 001027a4     (V...'..4V...'..
  20089c:	00105638 00102218 00105640 00101ff4     8V..."..@V......
  2008ac:	00105648 00102794 00105650 00102358     HV...'..PV..X#..
  2008bc:	00105654 00102358 00105658 0010255c     TV..X#..XV..\%..
	...

002008d4 <p.2>:
  2008d4:	002009e8                                .. .

002008d8 <n.3>:
  2008d8:	0020085c                                \. .

002008dc <pxCurrentTCB>:
  2008dc:	00000000                                ....

002008e0 <xMissedYield>:
  2008e0:	00000000                                ....

002008e4 <xTickCount>:
  2008e4:	00000000                                ....

002008e8 <xNumOfOverflows>:
  2008e8:	00000000                                ....

002008ec <uxTopReadyPriority>:
  2008ec:	00000000                                ....

002008f0 <uxSchedulerSuspended>:
  2008f0:	00000000                                ....

002008f4 <uxMissedTicks>:
  2008f4:	00000000                                ....

002008f8 <uxCurrentNumberOfTasks>:
  2008f8:	00000000                                ....

002008fc <xSchedulerRunning>:
  2008fc:	00000000                                ....

00200900 <uxTasksDeleted>:
  200900:	00000000                                ....

00200904 <uxTopUsedPriority>:
  200904:	00000000                                ....

00200908 <ulCriticalNesting>:
  200908:	0000270f                                .'..

0020090c <pxConfigDescriptorList>:
  20090c:	00105c07 00105bc4                       .\...[..

00200914 <ucUSBConfig>:
  200914:	00000000                                ....

00200918 <eDriverState>:
  200918:	00000000                                ....

0020091c <ulReceivedAddress>:
  20091c:	00000000                                ....

00200920 <ulNextMessage.0>:
  200920:	00000000                                ....

00200924 <env_flash_to>:
  200924:	e59fc078 	ldr	ip, [pc, #120]	; 2009a4 <.data+0x9a4>
  200928:	e1a01000 	mov	r1, r0
  20092c:	e3a0201f 	mov	r2, #31	; 0x1f
  200930:	e49c3004 	ldr	r3, [ip], #4
  200934:	e2522001 	subs	r2, r2, #1	; 0x1
  200938:	e4813004 	str	r3, [r1], #4
  20093c:	5afffffb 	bpl	200930 <env_flash_to+0xc>
  200940:	e1a03780 	mov	r3, r0, lsl #15
  200944:	e3e010ff 	mvn	r1, #255	; 0xff
  200948:	e1a00b23 	mov	r0, r3, lsr #22
  20094c:	e5912068 	ldr	r2, [r1, #104]
  200950:	e1a032a0 	mov	r3, r0, lsr #5
  200954:	e0123803 	ands	r3, r2, r3, lsl #16
  200958:	0a000007 	beq	20097c <env_flash_to+0x58>
  20095c:	e1a03400 	mov	r3, r0, lsl #8
  200960:	e383345a 	orr	r3, r3, #1509949440	; 0x5a000000
  200964:	e3833004 	orr	r3, r3, #4	; 0x4
  200968:	e5813064 	str	r3, [r1, #100]
  20096c:	e3e02097 	mvn	r2, #151	; 0x97
  200970:	e5923000 	ldr	r3, [r2]
  200974:	e3130001 	tst	r3, #1	; 0x1
  200978:	0afffffc 	beq	200970 <env_flash_to+0x4c>
  20097c:	e1a03400 	mov	r3, r0, lsl #8
  200980:	e383345a 	orr	r3, r3, #1509949440	; 0x5a000000
  200984:	e3e020ff 	mvn	r2, #255	; 0xff
  200988:	e3833001 	orr	r3, r3, #1	; 0x1
  20098c:	e5823064 	str	r3, [r2, #100]
  200990:	e2822068 	add	r2, r2, #104	; 0x68
  200994:	e5923000 	ldr	r3, [r2]
  200998:	e3130001 	tst	r3, #1	; 0x1
  20099c:	0afffffc 	beq	200994 <env_flash_to+0x70>
  2009a0:	e1a0f00e 	mov	pc, lr
  2009a4:	0020104c 	eoreq	r1, r0, ip, asr #32
