
openbeacon-debug.elf:     file format elf32-littlearm

Disassembly of section startup:

00100000 <start>:
  100000:	ea00000f 	b	100044 <_reset>
  100004:	e59ff014 	ldr	pc, [pc, #20]	; 100020 <_undf>
  100008:	e59ff014 	ldr	pc, [pc, #20]	; 100024 <_swi>
  10000c:	e59ff014 	ldr	pc, [pc, #20]	; 100028 <_pabt>
  100010:	e59ff014 	ldr	pc, [pc, #20]	; 10002c <_dabt>
  100014:	e1a00000 	nop			(mov r0,r0)
  100018:	e51fff20 	ldr	pc, [pc, #-3872]	; ff100 <IRQ_STACK_SIZE+0xfed00>
  10001c:	e59ff00c 	ldr	pc, [pc, #12]	; 100030 <_fiq>

00100020 <_undf>:
  100020:	00100034 	andeqs	r0, r0, r4, lsr r0

00100024 <_swi>:
  100024:	0010292c 	andeqs	r2, r0, ip, lsr #18

00100028 <_pabt>:
  100028:	00100038 	andeqs	r0, r0, r8, lsr r0

0010002c <_dabt>:
  10002c:	0010003c 	andeqs	r0, r0, ip, lsr r0

00100030 <_fiq>:
  100030:	00100040 	andeqs	r0, r0, r0, asr #32

00100034 <__undf>:
  100034:	eafffffe 	b	100034 <__undf>

00100038 <__pabt>:
  100038:	eafffffe 	b	100038 <__pabt>

0010003c <__dabt>:
  10003c:	eafffffe 	b	10003c <__dabt>

00100040 <__fiq>:
  100040:	eafffffe 	b	100040 <__fiq>
Disassembly of section prog:

00100044 <_reset>:
  100044:	e59f00c0 	ldr	r0, [pc, #192]	; 10010c <prog+0xc8>
  100048:	e321f0db 	msr	CPSR_c, #219	; 0xdb
  10004c:	e1a0d000 	mov	sp, r0
  100050:	e2400004 	sub	r0, r0, #4	; 0x4
  100054:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
  100058:	e1a0d000 	mov	sp, r0
  10005c:	e2400004 	sub	r0, r0, #4	; 0x4
  100060:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
  100064:	e1a0d000 	mov	sp, r0
  100068:	e2400004 	sub	r0, r0, #4	; 0x4
  10006c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
  100070:	e1a0d000 	mov	sp, r0
  100074:	e2400b01 	sub	r0, r0, #1024	; 0x400
  100078:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
  10007c:	e1a0d000 	mov	sp, r0
  100080:	e2400b01 	sub	r0, r0, #1024	; 0x400
  100084:	e321f0df 	msr	CPSR_c, #223	; 0xdf
  100088:	e1a0d000 	mov	sp, r0
  10008c:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
  100090:	eb00048b 	bl	1012c4 <AT91F_LowLevelInit>
  100094:	e3a01000 	mov	r1, #0	; 0x0
  100098:	e1a0b001 	mov	fp, r1
  10009c:	e1a07001 	mov	r7, r1
  1000a0:	e59f1050 	ldr	r1, [pc, #80]	; 1000f8 <prog+0xb4>
  1000a4:	e59f3050 	ldr	r3, [pc, #80]	; 1000fc <prog+0xb8>
  1000a8:	e0533001 	subs	r3, r3, r1
  1000ac:	0a000003 	beq	1000c0 <.end_clear_loop>
  1000b0:	e3a02000 	mov	r2, #0	; 0x0

001000b4 <.clear_loop>:
  1000b4:	e4c12001 	strb	r2, [r1], #1
  1000b8:	e2533001 	subs	r3, r3, #1	; 0x1
  1000bc:	cafffffc 	bgt	1000b4 <.clear_loop>

001000c0 <.end_clear_loop>:
  1000c0:	e59f1038 	ldr	r1, [pc, #56]	; 100100 <prog+0xbc>
  1000c4:	e59f2038 	ldr	r2, [pc, #56]	; 100104 <prog+0xc0>
  1000c8:	e59f3038 	ldr	r3, [pc, #56]	; 100108 <prog+0xc4>
  1000cc:	e0533001 	subs	r3, r3, r1
  1000d0:	0a000003 	beq	1000e4 <.end_set_loop>

001000d4 <.set_loop>:
  1000d4:	e4d24001 	ldrb	r4, [r2], #1
  1000d8:	e4c14001 	strb	r4, [r1], #1
  1000dc:	e2533001 	subs	r3, r3, #1	; 0x1
  1000e0:	cafffffb 	bgt	1000d4 <.set_loop>

001000e4 <.end_set_loop>:
  1000e4:	e3a00000 	mov	r0, #0	; 0x0
  1000e8:	e3a01000 	mov	r1, #0	; 0x0
  1000ec:	e59fe01c 	ldr	lr, [pc, #28]	; 100110 <prog+0xcc>
  1000f0:	e12fff1e 	bx	lr

001000f4 <endless_loop>:
  1000f4:	eafffffe 	b	1000f4 <endless_loop>
  1000f8:	00200820 	eoreq	r0, r0, r0, lsr #16
  1000fc:	00201130 	eoreq	r1, r0, r0, lsr r1
  100100:	00200000 	eoreq	r0, r0, r0
  100104:	00103a30 	andeqs	r3, r0, r0, lsr sl
  100108:	00200820 	eoreq	r0, r0, r0, lsr #16
  10010c:	00203ffc 	streqd	r3, [r0], -ip
  100110:	00100f54 	andeqs	r0, r0, r4, asr pc

00100114 <free>:
  100114:	e59f3008 	ldr	r3, [pc, #8]	; 100124 <prog+0xe0>
  100118:	e1a01000 	mov	r1, r0
  10011c:	e5930000 	ldr	r0, [r3]
  100120:	ea0002d9 	b	100c8c <_free_r>
  100124:	00200410 	eoreq	r0, r0, r0, lsl r4

00100128 <malloc>:
  100128:	e59f3008 	ldr	r3, [pc, #8]	; 100138 <prog+0xf4>
  10012c:	e1a01000 	mov	r1, r0
  100130:	e5930000 	ldr	r0, [r3]
  100134:	ea000000 	b	10013c <_malloc_r>
  100138:	00200410 	eoreq	r0, r0, r0, lsl r4

0010013c <_malloc_r>:
  10013c:	e281300b 	add	r3, r1, #11	; 0xb
  100140:	e3530016 	cmp	r3, #22	; 0x16
  100144:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  100148:	83c35007 	bichi	r5, r3, #7	; 0x7
  10014c:	93a05010 	movls	r5, #16	; 0x10
  100150:	93a03000 	movls	r3, #0	; 0x0
  100154:	81a03fa5 	movhi	r3, r5, lsr #31
  100158:	e1550001 	cmp	r5, r1
  10015c:	33833001 	orrcc	r3, r3, #1	; 0x1
  100160:	e3530000 	cmp	r3, #0	; 0x0
  100164:	e1a07000 	mov	r7, r0
  100168:	13a0300c 	movne	r3, #12	; 0xc
  10016c:	e24dd004 	sub	sp, sp, #4	; 0x4
  100170:	13a00000 	movne	r0, #0	; 0x0
  100174:	15873000 	strne	r3, [r7]
  100178:	1a000017 	bne	1001dc <_malloc_r+0xa0>
  10017c:	e1a00007 	mov	r0, r7
  100180:	eb000217 	bl	1009e4 <__malloc_lock>
  100184:	e3550f7e 	cmp	r5, #504	; 0x1f8
  100188:	2a000015 	bcs	1001e4 <_malloc_r+0xa8>
  10018c:	e59f86fc 	ldr	r8, [pc, #1788]	; 100890 <prog+0x84c>
  100190:	e1a021a5 	mov	r2, r5, lsr #3
  100194:	e0883182 	add	r3, r8, r2, lsl #3
  100198:	e593400c 	ldr	r4, [r3, #12]
  10019c:	e1530004 	cmp	r3, r4
  1001a0:	e1a0a008 	mov	sl, r8
  1001a4:	0a0000cd 	beq	1004e0 <_malloc_r+0x3a4>
  1001a8:	e5943004 	ldr	r3, [r4, #4]
  1001ac:	e3c33003 	bic	r3, r3, #3	; 0x3
  1001b0:	e0843003 	add	r3, r4, r3
  1001b4:	e5932004 	ldr	r2, [r3, #4]
  1001b8:	e594000c 	ldr	r0, [r4, #12]
  1001bc:	e5941008 	ldr	r1, [r4, #8]
  1001c0:	e3822001 	orr	r2, r2, #1	; 0x1
  1001c4:	e5801008 	str	r1, [r0, #8]
  1001c8:	e581000c 	str	r0, [r1, #12]
  1001cc:	e5832004 	str	r2, [r3, #4]
  1001d0:	e1a00007 	mov	r0, r7
  1001d4:	eb000203 	bl	1009e8 <__malloc_unlock>
  1001d8:	e2840008 	add	r0, r4, #8	; 0x8
  1001dc:	e28dd004 	add	sp, sp, #4	; 0x4
  1001e0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1001e4:	e1b024a5 	movs	r2, r5, lsr #9
  1001e8:	01a001a5 	moveq	r0, r5, lsr #3
  1001ec:	01a03180 	moveq	r3, r0, lsl #3
  1001f0:	1a000027 	bne	100294 <_malloc_r+0x158>
  1001f4:	e59f8694 	ldr	r8, [pc, #1684]	; 100890 <prog+0x84c>
  1001f8:	e0831008 	add	r1, r3, r8
  1001fc:	e591400c 	ldr	r4, [r1, #12]
  100200:	e1510004 	cmp	r1, r4
  100204:	e1a0a008 	mov	sl, r8
  100208:	1a000005 	bne	100224 <_malloc_r+0xe8>
  10020c:	ea00000a 	b	10023c <_malloc_r+0x100>
  100210:	e3520000 	cmp	r2, #0	; 0x0
  100214:	aa000047 	bge	100338 <_malloc_r+0x1fc>
  100218:	e594400c 	ldr	r4, [r4, #12]
  10021c:	e1510004 	cmp	r1, r4
  100220:	0a000005 	beq	10023c <_malloc_r+0x100>
  100224:	e5943004 	ldr	r3, [r4, #4]
  100228:	e3c33003 	bic	r3, r3, #3	; 0x3
  10022c:	e0652003 	rsb	r2, r5, r3
  100230:	e352000f 	cmp	r2, #15	; 0xf
  100234:	dafffff5 	ble	100210 <_malloc_r+0xd4>
  100238:	e2400001 	sub	r0, r0, #1	; 0x1
  10023c:	e280e001 	add	lr, r0, #1	; 0x1
  100240:	e59f664c 	ldr	r6, [pc, #1612]	; 100894 <prog+0x850>
  100244:	e5964008 	ldr	r4, [r6, #8]
  100248:	e1560004 	cmp	r6, r4
  10024c:	0a000076 	beq	10042c <_malloc_r+0x2f0>
  100250:	e5943004 	ldr	r3, [r4, #4]
  100254:	e3c32003 	bic	r2, r3, #3	; 0x3
  100258:	e0650002 	rsb	r0, r5, r2
  10025c:	e350000f 	cmp	r0, #15	; 0xf
  100260:	ca000027 	bgt	100304 <_malloc_r+0x1c8>
  100264:	e3500000 	cmp	r0, #0	; 0x0
  100268:	e586600c 	str	r6, [r6, #12]
  10026c:	e5866008 	str	r6, [r6, #8]
  100270:	ba00003c 	blt	100368 <_malloc_r+0x22c>
  100274:	e0842002 	add	r2, r4, r2
  100278:	e5923004 	ldr	r3, [r2, #4]
  10027c:	e3833001 	orr	r3, r3, #1	; 0x1
  100280:	e1a00007 	mov	r0, r7
  100284:	e5823004 	str	r3, [r2, #4]
  100288:	eb0001d6 	bl	1009e8 <__malloc_unlock>
  10028c:	e2840008 	add	r0, r4, #8	; 0x8
  100290:	eaffffd1 	b	1001dc <_malloc_r+0xa0>
  100294:	e3520004 	cmp	r2, #4	; 0x4
  100298:	91a03325 	movls	r3, r5, lsr #6
  10029c:	92830038 	addls	r0, r3, #56	; 0x38
  1002a0:	91a03180 	movls	r3, r0, lsl #3
  1002a4:	9affffd2 	bls	1001f4 <_malloc_r+0xb8>
  1002a8:	e3520014 	cmp	r2, #20	; 0x14
  1002ac:	9282005b 	addls	r0, r2, #91	; 0x5b
  1002b0:	91a03180 	movls	r3, r0, lsl #3
  1002b4:	9affffce 	bls	1001f4 <_malloc_r+0xb8>
  1002b8:	e3520054 	cmp	r2, #84	; 0x54
  1002bc:	91a03625 	movls	r3, r5, lsr #12
  1002c0:	9283006e 	addls	r0, r3, #110	; 0x6e
  1002c4:	91a03180 	movls	r3, r0, lsl #3
  1002c8:	9affffc9 	bls	1001f4 <_malloc_r+0xb8>
  1002cc:	e3520f55 	cmp	r2, #340	; 0x154
  1002d0:	91a037a5 	movls	r3, r5, lsr #15
  1002d4:	92830077 	addls	r0, r3, #119	; 0x77
  1002d8:	91a03180 	movls	r3, r0, lsl #3
  1002dc:	9affffc4 	bls	1001f4 <_malloc_r+0xb8>
  1002e0:	e3a03e55 	mov	r3, #1360	; 0x550
  1002e4:	e2833004 	add	r3, r3, #4	; 0x4
  1002e8:	e1520003 	cmp	r2, r3
  1002ec:	91a03925 	movls	r3, r5, lsr #18
  1002f0:	9283007c 	addls	r0, r3, #124	; 0x7c
  1002f4:	83a0007e 	movhi	r0, #126	; 0x7e
  1002f8:	82433f59 	subhi	r3, r3, #356	; 0x164
  1002fc:	91a03180 	movls	r3, r0, lsl #3
  100300:	eaffffbb 	b	1001f4 <_malloc_r+0xb8>
  100304:	e0842005 	add	r2, r4, r5
  100308:	e3801001 	orr	r1, r0, #1	; 0x1
  10030c:	e3853001 	orr	r3, r5, #1	; 0x1
  100310:	e7820000 	str	r0, [r2, r0]
  100314:	e5843004 	str	r3, [r4, #4]
  100318:	e586200c 	str	r2, [r6, #12]
  10031c:	e5862008 	str	r2, [r6, #8]
  100320:	e1a00007 	mov	r0, r7
  100324:	e9820042 	stmib	r2, {r1, r6}
  100328:	e582600c 	str	r6, [r2, #12]
  10032c:	eb0001ad 	bl	1009e8 <__malloc_unlock>
  100330:	e2840008 	add	r0, r4, #8	; 0x8
  100334:	eaffffa8 	b	1001dc <_malloc_r+0xa0>
  100338:	e0840003 	add	r0, r4, r3
  10033c:	e5903004 	ldr	r3, [r0, #4]
  100340:	e594100c 	ldr	r1, [r4, #12]
  100344:	e5942008 	ldr	r2, [r4, #8]
  100348:	e3833001 	orr	r3, r3, #1	; 0x1
  10034c:	e5803004 	str	r3, [r0, #4]
  100350:	e5812008 	str	r2, [r1, #8]
  100354:	e1a00007 	mov	r0, r7
  100358:	e582100c 	str	r1, [r2, #12]
  10035c:	eb0001a1 	bl	1009e8 <__malloc_unlock>
  100360:	e2840008 	add	r0, r4, #8	; 0x8
  100364:	eaffff9c 	b	1001dc <_malloc_r+0xa0>
  100368:	e3520c02 	cmp	r2, #512	; 0x200
  10036c:	3a0000a0 	bcc	1005f4 <_malloc_r+0x4b8>
  100370:	e1b014a2 	movs	r1, r2, lsr #9
  100374:	01a011a2 	moveq	r1, r2, lsr #3
  100378:	01a03181 	moveq	r3, r1, lsl #3
  10037c:	0a00001a 	beq	1003ec <_malloc_r+0x2b0>
  100380:	e3510004 	cmp	r1, #4	; 0x4
  100384:	91a03322 	movls	r3, r2, lsr #6
  100388:	92831038 	addls	r1, r3, #56	; 0x38
  10038c:	91a03181 	movls	r3, r1, lsl #3
  100390:	9a000015 	bls	1003ec <_malloc_r+0x2b0>
  100394:	e3510014 	cmp	r1, #20	; 0x14
  100398:	9281105b 	addls	r1, r1, #91	; 0x5b
  10039c:	91a03181 	movls	r3, r1, lsl #3
  1003a0:	9a000011 	bls	1003ec <_malloc_r+0x2b0>
  1003a4:	e3510054 	cmp	r1, #84	; 0x54
  1003a8:	91a03622 	movls	r3, r2, lsr #12
  1003ac:	9283106e 	addls	r1, r3, #110	; 0x6e
  1003b0:	91a03181 	movls	r3, r1, lsl #3
  1003b4:	9a00000c 	bls	1003ec <_malloc_r+0x2b0>
  1003b8:	e3510f55 	cmp	r1, #340	; 0x154
  1003bc:	91a037a2 	movls	r3, r2, lsr #15
  1003c0:	92831077 	addls	r1, r3, #119	; 0x77
  1003c4:	91a03181 	movls	r3, r1, lsl #3
  1003c8:	9a000007 	bls	1003ec <_malloc_r+0x2b0>
  1003cc:	e3a03e55 	mov	r3, #1360	; 0x550
  1003d0:	e2833004 	add	r3, r3, #4	; 0x4
  1003d4:	e1510003 	cmp	r1, r3
  1003d8:	91a03922 	movls	r3, r2, lsr #18
  1003dc:	9283107c 	addls	r1, r3, #124	; 0x7c
  1003e0:	83a0107e 	movhi	r1, #126	; 0x7e
  1003e4:	82433f59 	subhi	r3, r3, #356	; 0x164
  1003e8:	91a03181 	movls	r3, r1, lsl #3
  1003ec:	e088c003 	add	ip, r8, r3
  1003f0:	e59c0008 	ldr	r0, [ip, #8]
  1003f4:	e15c0000 	cmp	ip, r0
  1003f8:	0a0000eb 	beq	1007ac <_malloc_r+0x670>
  1003fc:	e5903004 	ldr	r3, [r0, #4]
  100400:	e3c33003 	bic	r3, r3, #3	; 0x3
  100404:	e1520003 	cmp	r2, r3
  100408:	2a000002 	bcs	100418 <_malloc_r+0x2dc>
  10040c:	e5900008 	ldr	r0, [r0, #8]
  100410:	e15c0000 	cmp	ip, r0
  100414:	1afffff8 	bne	1003fc <_malloc_r+0x2c0>
  100418:	e590c00c 	ldr	ip, [r0, #12]
  10041c:	e584c00c 	str	ip, [r4, #12]
  100420:	e5840008 	str	r0, [r4, #8]
  100424:	e580400c 	str	r4, [r0, #12]
  100428:	e58c4008 	str	r4, [ip, #8]
  10042c:	e59a0004 	ldr	r0, [sl, #4]
  100430:	e35e0000 	cmp	lr, #0	; 0x0
  100434:	e28e3003 	add	r3, lr, #3	; 0x3
  100438:	a1a0300e 	movge	r3, lr
  10043c:	e1a03143 	mov	r3, r3, asr #2
  100440:	e3a02001 	mov	r2, #1	; 0x1
  100444:	e1a02312 	mov	r2, r2, lsl r3
  100448:	e1520000 	cmp	r2, r0
  10044c:	8a000029 	bhi	1004f8 <_malloc_r+0x3bc>
  100450:	e1120000 	tst	r2, r0
  100454:	0a000073 	beq	100628 <_malloc_r+0x4ec>
  100458:	e088918e 	add	r9, r8, lr, lsl #3
  10045c:	e1a0a00e 	mov	sl, lr
  100460:	e1a01009 	mov	r1, r9
  100464:	e591400c 	ldr	r4, [r1, #12]
  100468:	e1510004 	cmp	r1, r4
  10046c:	1a000005 	bne	100488 <_malloc_r+0x34c>
  100470:	ea000076 	b	100650 <_malloc_r+0x514>
  100474:	e35c0000 	cmp	ip, #0	; 0x0
  100478:	aa000079 	bge	100664 <_malloc_r+0x528>
  10047c:	e594400c 	ldr	r4, [r4, #12]
  100480:	e1510004 	cmp	r1, r4
  100484:	0a000071 	beq	100650 <_malloc_r+0x514>
  100488:	e5943004 	ldr	r3, [r4, #4]
  10048c:	e3c33003 	bic	r3, r3, #3	; 0x3
  100490:	e065c003 	rsb	ip, r5, r3
  100494:	e35c000f 	cmp	ip, #15	; 0xf
  100498:	dafffff5 	ble	100474 <_malloc_r+0x338>
  10049c:	e3853001 	orr	r3, r5, #1	; 0x1
  1004a0:	e0842005 	add	r2, r4, r5
  1004a4:	e594000c 	ldr	r0, [r4, #12]
  1004a8:	e5843004 	str	r3, [r4, #4]
  1004ac:	e5b41008 	ldr	r1, [r4, #8]!
  1004b0:	e38c3001 	orr	r3, ip, #1	; 0x1
  1004b4:	e5801008 	str	r1, [r0, #8]
  1004b8:	e581000c 	str	r0, [r1, #12]
  1004bc:	e5862008 	str	r2, [r6, #8]
  1004c0:	e586200c 	str	r2, [r6, #12]
  1004c4:	e1a00007 	mov	r0, r7
  1004c8:	e782c00c 	str	ip, [r2, ip]
  1004cc:	e9820048 	stmib	r2, {r3, r6}
  1004d0:	e582600c 	str	r6, [r2, #12]
  1004d4:	eb000143 	bl	1009e8 <__malloc_unlock>
  1004d8:	e1a00004 	mov	r0, r4
  1004dc:	eaffff3e 	b	1001dc <_malloc_r+0xa0>
  1004e0:	e2843008 	add	r3, r4, #8	; 0x8
  1004e4:	e593400c 	ldr	r4, [r3, #12]
  1004e8:	e1530004 	cmp	r3, r4
  1004ec:	1affff2d 	bne	1001a8 <_malloc_r+0x6c>
  1004f0:	e282e002 	add	lr, r2, #2	; 0x2
  1004f4:	eaffff51 	b	100240 <_malloc_r+0x104>
  1004f8:	e59f2390 	ldr	r2, [pc, #912]	; 100890 <prog+0x84c>
  1004fc:	e5924008 	ldr	r4, [r2, #8]
  100500:	e5943004 	ldr	r3, [r4, #4]
  100504:	e3c38003 	bic	r8, r3, #3	; 0x3
  100508:	e0650008 	rsb	r0, r5, r8
  10050c:	e350000f 	cmp	r0, #15	; 0xf
  100510:	c3a03000 	movgt	r3, #0	; 0x0
  100514:	d3a03001 	movle	r3, #1	; 0x1
  100518:	e1550008 	cmp	r5, r8
  10051c:	83833001 	orrhi	r3, r3, #1	; 0x1
  100520:	e3530000 	cmp	r3, #0	; 0x0
  100524:	e1a09004 	mov	r9, r4
  100528:	0a000026 	beq	1005c8 <_malloc_r+0x48c>
  10052c:	e59f3364 	ldr	r3, [pc, #868]	; 100898 <prog+0x854>
  100530:	e59fb364 	ldr	fp, [pc, #868]	; 10089c <prog+0x858>
  100534:	e5932000 	ldr	r2, [r3]
  100538:	e59b1000 	ldr	r1, [fp]
  10053c:	e2822010 	add	r2, r2, #16	; 0x10
  100540:	e3710001 	cmn	r1, #1	; 0x1
  100544:	e0856002 	add	r6, r5, r2
  100548:	12863eff 	addne	r3, r6, #4080	; 0xff0
  10054c:	1283300f 	addne	r3, r3, #15	; 0xf
  100550:	13c36eff 	bicne	r6, r3, #4080	; 0xff0
  100554:	13c6600f 	bicne	r6, r6, #15	; 0xf
  100558:	e1a00007 	mov	r0, r7
  10055c:	e1a01006 	mov	r1, r6
  100560:	eb0002ea 	bl	101110 <_sbrk_r>
  100564:	e3700001 	cmn	r0, #1	; 0x1
  100568:	0a00008c 	beq	1007a0 <_malloc_r+0x664>
  10056c:	e0841008 	add	r1, r4, r8
  100570:	e1510000 	cmp	r1, r0
  100574:	e1a0a000 	mov	sl, r0
  100578:	9a000045 	bls	100694 <_malloc_r+0x558>
  10057c:	e59f330c 	ldr	r3, [pc, #780]	; 100890 <prog+0x84c>
  100580:	e1540003 	cmp	r4, r3
  100584:	0a0000a5 	beq	100820 <_malloc_r+0x6e4>
  100588:	e59f3300 	ldr	r3, [pc, #768]	; 100890 <prog+0x84c>
  10058c:	e5934008 	ldr	r4, [r3, #8]
  100590:	e5942004 	ldr	r2, [r4, #4]
  100594:	e3c22003 	bic	r2, r2, #3	; 0x3
  100598:	e0650002 	rsb	r0, r5, r2
  10059c:	e350000f 	cmp	r0, #15	; 0xf
  1005a0:	c3a03000 	movgt	r3, #0	; 0x0
  1005a4:	d3a03001 	movle	r3, #1	; 0x1
  1005a8:	e1550002 	cmp	r5, r2
  1005ac:	83833001 	orrhi	r3, r3, #1	; 0x1
  1005b0:	e3530000 	cmp	r3, #0	; 0x0
  1005b4:	0a000003 	beq	1005c8 <_malloc_r+0x48c>
  1005b8:	e1a00007 	mov	r0, r7
  1005bc:	eb000109 	bl	1009e8 <__malloc_unlock>
  1005c0:	e3a00000 	mov	r0, #0	; 0x0
  1005c4:	eaffff04 	b	1001dc <_malloc_r+0xa0>
  1005c8:	e0841005 	add	r1, r4, r5
  1005cc:	e3802001 	orr	r2, r0, #1	; 0x1
  1005d0:	e3853001 	orr	r3, r5, #1	; 0x1
  1005d4:	e5843004 	str	r3, [r4, #4]
  1005d8:	e5812004 	str	r2, [r1, #4]
  1005dc:	e59f22ac 	ldr	r2, [pc, #684]	; 100890 <prog+0x84c>
  1005e0:	e1a00007 	mov	r0, r7
  1005e4:	e5821008 	str	r1, [r2, #8]
  1005e8:	eb0000fe 	bl	1009e8 <__malloc_unlock>
  1005ec:	e2840008 	add	r0, r4, #8	; 0x8
  1005f0:	eafffef9 	b	1001dc <_malloc_r+0xa0>
  1005f4:	e1a021a2 	mov	r2, r2, lsr #3
  1005f8:	e59a0004 	ldr	r0, [sl, #4]
  1005fc:	e1a01122 	mov	r1, r2, lsr #2
  100600:	e3a03001 	mov	r3, #1	; 0x1
  100604:	e1800113 	orr	r0, r0, r3, lsl r1
  100608:	e0882182 	add	r2, r8, r2, lsl #3
  10060c:	e5923008 	ldr	r3, [r2, #8]
  100610:	e584200c 	str	r2, [r4, #12]
  100614:	e5843008 	str	r3, [r4, #8]
  100618:	e58a0004 	str	r0, [sl, #4]
  10061c:	e583400c 	str	r4, [r3, #12]
  100620:	e5824008 	str	r4, [r2, #8]
  100624:	eaffff81 	b	100430 <_malloc_r+0x2f4>
  100628:	e1a02082 	mov	r2, r2, lsl #1
  10062c:	e3ce3003 	bic	r3, lr, #3	; 0x3
  100630:	e1100002 	tst	r0, r2
  100634:	e283e004 	add	lr, r3, #4	; 0x4
  100638:	1affff86 	bne	100458 <_malloc_r+0x31c>
  10063c:	e1a02082 	mov	r2, r2, lsl #1
  100640:	e1100002 	tst	r0, r2
  100644:	e28ee004 	add	lr, lr, #4	; 0x4
  100648:	0afffffb 	beq	10063c <_malloc_r+0x500>
  10064c:	eaffff81 	b	100458 <_malloc_r+0x31c>
  100650:	e28aa001 	add	sl, sl, #1	; 0x1
  100654:	e31a0003 	tst	sl, #3	; 0x3
  100658:	0a000059 	beq	1007c4 <_malloc_r+0x688>
  10065c:	e2811008 	add	r1, r1, #8	; 0x8
  100660:	eaffff7f 	b	100464 <_malloc_r+0x328>
  100664:	e0841003 	add	r1, r4, r3
  100668:	e5913004 	ldr	r3, [r1, #4]
  10066c:	e594000c 	ldr	r0, [r4, #12]
  100670:	e5b42008 	ldr	r2, [r4, #8]!
  100674:	e3833001 	orr	r3, r3, #1	; 0x1
  100678:	e5802008 	str	r2, [r0, #8]
  10067c:	e582000c 	str	r0, [r2, #12]
  100680:	e5813004 	str	r3, [r1, #4]
  100684:	e1a00007 	mov	r0, r7
  100688:	eb0000d6 	bl	1009e8 <__malloc_unlock>
  10068c:	e1a00004 	mov	r0, r4
  100690:	eafffed1 	b	1001dc <_malloc_r+0xa0>
  100694:	e59fc204 	ldr	ip, [pc, #516]	; 1008a0 <prog+0x85c>
  100698:	e59c3000 	ldr	r3, [ip]
  10069c:	e0862003 	add	r2, r6, r3
  1006a0:	e58c2000 	str	r2, [ip]
  1006a4:	0a000062 	beq	100834 <_malloc_r+0x6f8>
  1006a8:	e59b3000 	ldr	r3, [fp]
  1006ac:	e3730001 	cmn	r3, #1	; 0x1
  1006b0:	10613000 	rsbne	r3, r1, r0
  1006b4:	059f31e0 	ldreq	r3, [pc, #480]	; 10089c <prog+0x858>
  1006b8:	10823003 	addne	r3, r2, r3
  1006bc:	05830000 	streq	r0, [r3]
  1006c0:	158c3000 	strne	r3, [ip]
  1006c4:	e2103007 	ands	r3, r0, #7	; 0x7
  1006c8:	12631008 	rsbne	r1, r3, #8	; 0x8
  1006cc:	1080a001 	addne	sl, r0, r1
  1006d0:	01a01003 	moveq	r1, r3
  1006d4:	e08a3006 	add	r3, sl, r6
  1006d8:	e1a03a03 	mov	r3, r3, lsl #20
  1006dc:	e1a03a23 	mov	r3, r3, lsr #20
  1006e0:	e2633a01 	rsb	r3, r3, #4096	; 0x1000
  1006e4:	e0814003 	add	r4, r1, r3
  1006e8:	e1a01004 	mov	r1, r4
  1006ec:	e1a00007 	mov	r0, r7
  1006f0:	e58dc000 	str	ip, [sp]
  1006f4:	eb000285 	bl	101110 <_sbrk_r>
  1006f8:	e3700001 	cmn	r0, #1	; 0x1
  1006fc:	106a3000 	rsbne	r3, sl, r0
  100700:	e59dc000 	ldr	ip, [sp]
  100704:	10833004 	addne	r3, r3, r4
  100708:	13830001 	orrne	r0, r3, #1	; 0x1
  10070c:	e59f217c 	ldr	r2, [pc, #380]	; 100890 <prog+0x84c>
  100710:	e59c3000 	ldr	r3, [ip]
  100714:	03a04000 	moveq	r4, #0	; 0x0
  100718:	02800002 	addeq	r0, r0, #2	; 0x2
  10071c:	e0843003 	add	r3, r4, r3
  100720:	e1590002 	cmp	r9, r2
  100724:	e1a0400a 	mov	r4, sl
  100728:	e58c3000 	str	r3, [ip]
  10072c:	e58a0004 	str	r0, [sl, #4]
  100730:	e582a008 	str	sl, [r2, #8]
  100734:	0a00000f 	beq	100778 <_malloc_r+0x63c>
  100738:	e358000f 	cmp	r8, #15	; 0xf
  10073c:	93a03001 	movls	r3, #1	; 0x1
  100740:	958a3004 	strls	r3, [sl, #4]
  100744:	9affff91 	bls	100590 <_malloc_r+0x454>
  100748:	e5993004 	ldr	r3, [r9, #4]
  10074c:	e248200c 	sub	r2, r8, #12	; 0xc
  100750:	e3c22007 	bic	r2, r2, #7	; 0x7
  100754:	e2033001 	and	r3, r3, #1	; 0x1
  100758:	e1823003 	orr	r3, r2, r3
  10075c:	e3a01005 	mov	r1, #5	; 0x5
  100760:	e352000f 	cmp	r2, #15	; 0xf
  100764:	e0892002 	add	r2, r9, r2
  100768:	e5893004 	str	r3, [r9, #4]
  10076c:	e5821008 	str	r1, [r2, #8]
  100770:	e5821004 	str	r1, [r2, #4]
  100774:	8a000038 	bhi	10085c <_malloc_r+0x720>
  100778:	e59f1124 	ldr	r1, [pc, #292]	; 1008a4 <prog+0x860>
  10077c:	e59c2000 	ldr	r2, [ip]
  100780:	e5913000 	ldr	r3, [r1]
  100784:	e1520003 	cmp	r2, r3
  100788:	85812000 	strhi	r2, [r1]
  10078c:	e59f1114 	ldr	r1, [pc, #276]	; 1008a8 <prog+0x864>
  100790:	e5913000 	ldr	r3, [r1]
  100794:	e1520003 	cmp	r2, r3
  100798:	85812000 	strhi	r2, [r1]
  10079c:	eaffff7b 	b	100590 <_malloc_r+0x454>
  1007a0:	e59f20e8 	ldr	r2, [pc, #232]	; 100890 <prog+0x84c>
  1007a4:	e5924008 	ldr	r4, [r2, #8]
  1007a8:	eaffff78 	b	100590 <_malloc_r+0x454>
  1007ac:	e59a3004 	ldr	r3, [sl, #4]
  1007b0:	e1a01121 	mov	r1, r1, lsr #2
  1007b4:	e3a02001 	mov	r2, #1	; 0x1
  1007b8:	e1833112 	orr	r3, r3, r2, lsl r1
  1007bc:	e58a3004 	str	r3, [sl, #4]
  1007c0:	eaffff15 	b	10041c <_malloc_r+0x2e0>
  1007c4:	e1a0c00e 	mov	ip, lr
  1007c8:	e1a01009 	mov	r1, r9
  1007cc:	e31c0003 	tst	ip, #3	; 0x3
  1007d0:	e2411008 	sub	r1, r1, #8	; 0x8
  1007d4:	e24cc001 	sub	ip, ip, #1	; 0x1
  1007d8:	0a000027 	beq	10087c <_malloc_r+0x740>
  1007dc:	e5913008 	ldr	r3, [r1, #8]
  1007e0:	e1530001 	cmp	r3, r1
  1007e4:	0afffff8 	beq	1007cc <_malloc_r+0x690>
  1007e8:	e1a02082 	mov	r2, r2, lsl #1
  1007ec:	e1520000 	cmp	r2, r0
  1007f0:	8affff40 	bhi	1004f8 <_malloc_r+0x3bc>
  1007f4:	e3520000 	cmp	r2, #0	; 0x0
  1007f8:	0affff3e 	beq	1004f8 <_malloc_r+0x3bc>
  1007fc:	e1120000 	tst	r2, r0
  100800:	11a0e00a 	movne	lr, sl
  100804:	1affff13 	bne	100458 <_malloc_r+0x31c>
  100808:	e1a02082 	mov	r2, r2, lsl #1
  10080c:	e1100002 	tst	r0, r2
  100810:	e28aa004 	add	sl, sl, #4	; 0x4
  100814:	0afffffb 	beq	100808 <_malloc_r+0x6cc>
  100818:	e1a0e00a 	mov	lr, sl
  10081c:	eaffff0d 	b	100458 <_malloc_r+0x31c>
  100820:	e59fc078 	ldr	ip, [pc, #120]	; 1008a0 <prog+0x85c>
  100824:	e59c3000 	ldr	r3, [ip]
  100828:	e0862003 	add	r2, r6, r3
  10082c:	e58c2000 	str	r2, [ip]
  100830:	eaffff9c 	b	1006a8 <_malloc_r+0x56c>
  100834:	e1a03a00 	mov	r3, r0, lsl #20
  100838:	e1a03a23 	mov	r3, r3, lsr #20
  10083c:	e3530000 	cmp	r3, #0	; 0x0
  100840:	1affff98 	bne	1006a8 <_malloc_r+0x56c>
  100844:	e59f2044 	ldr	r2, [pc, #68]	; 100890 <prog+0x84c>
  100848:	e0863008 	add	r3, r6, r8
  10084c:	e5924008 	ldr	r4, [r2, #8]
  100850:	e3833001 	orr	r3, r3, #1	; 0x1
  100854:	e5843004 	str	r3, [r4, #4]
  100858:	eaffffc6 	b	100778 <_malloc_r+0x63c>
  10085c:	e2891008 	add	r1, r9, #8	; 0x8
  100860:	e1a00007 	mov	r0, r7
  100864:	e58dc000 	str	ip, [sp]
  100868:	eb000107 	bl	100c8c <_free_r>
  10086c:	e59f301c 	ldr	r3, [pc, #28]	; 100890 <prog+0x84c>
  100870:	e59dc000 	ldr	ip, [sp]
  100874:	e5934008 	ldr	r4, [r3, #8]
  100878:	eaffffbe 	b	100778 <_malloc_r+0x63c>
  10087c:	e1e03002 	mvn	r3, r2
  100880:	e0000003 	and	r0, r0, r3
  100884:	e59f3004 	ldr	r3, [pc, #4]	; 100890 <prog+0x84c>
  100888:	e5830004 	str	r0, [r3, #4]
  10088c:	eaffffd5 	b	1007e8 <_malloc_r+0x6ac>
  100890:	00200000 	eoreq	r0, r0, r0
  100894:	00200008 	eoreq	r0, r0, r8
  100898:	00200820 	eoreq	r0, r0, r0, lsr #16
  10089c:	0020040c 	eoreq	r0, r0, ip, lsl #8
  1008a0:	0020082c 	eoreq	r0, r0, ip, lsr #16
  1008a4:	00200824 	eoreq	r0, r0, r4, lsr #16
  1008a8:	00200828 	eoreq	r0, r0, r8, lsr #16

001008ac <memcpy>:
  1008ac:	e352000f 	cmp	r2, #15	; 0xf
  1008b0:	e52de004 	str	lr, [sp, #-4]!
  1008b4:	e1a0c000 	mov	ip, r0
  1008b8:	e1a0e002 	mov	lr, r2
  1008bc:	9a000002 	bls	1008cc <memcpy+0x20>
  1008c0:	e1813000 	orr	r3, r1, r0
  1008c4:	e3130003 	tst	r3, #3	; 0x3
  1008c8:	0a000008 	beq	1008f0 <memcpy+0x44>
  1008cc:	e35e0000 	cmp	lr, #0	; 0x0
  1008d0:	049df004 	ldreq	pc, [sp], #4
  1008d4:	e3a02000 	mov	r2, #0	; 0x0
  1008d8:	e4d13001 	ldrb	r3, [r1], #1
  1008dc:	e7c2300c 	strb	r3, [r2, ip]
  1008e0:	e2822001 	add	r2, r2, #1	; 0x1
  1008e4:	e152000e 	cmp	r2, lr
  1008e8:	1afffffa 	bne	1008d8 <memcpy+0x2c>
  1008ec:	e49df004 	ldr	pc, [sp], #4
  1008f0:	e5913000 	ldr	r3, [r1]
  1008f4:	e58c3000 	str	r3, [ip]
  1008f8:	e5912004 	ldr	r2, [r1, #4]
  1008fc:	e58c2004 	str	r2, [ip, #4]
  100900:	e5913008 	ldr	r3, [r1, #8]
  100904:	e58c3008 	str	r3, [ip, #8]
  100908:	e24ee010 	sub	lr, lr, #16	; 0x10
  10090c:	e591300c 	ldr	r3, [r1, #12]
  100910:	e35e000f 	cmp	lr, #15	; 0xf
  100914:	e58c300c 	str	r3, [ip, #12]
  100918:	e2811010 	add	r1, r1, #16	; 0x10
  10091c:	e28cc010 	add	ip, ip, #16	; 0x10
  100920:	8afffff2 	bhi	1008f0 <memcpy+0x44>
  100924:	e35e0003 	cmp	lr, #3	; 0x3
  100928:	9affffe7 	bls	1008cc <memcpy+0x20>
  10092c:	e24ee004 	sub	lr, lr, #4	; 0x4
  100930:	e4913004 	ldr	r3, [r1], #4
  100934:	e35e0003 	cmp	lr, #3	; 0x3
  100938:	e48c3004 	str	r3, [ip], #4
  10093c:	8afffffa 	bhi	10092c <memcpy+0x80>
  100940:	e35e0000 	cmp	lr, #0	; 0x0
  100944:	1affffe2 	bne	1008d4 <memcpy+0x28>
  100948:	e49df004 	ldr	pc, [sp], #4

0010094c <memset>:
  10094c:	e3520003 	cmp	r2, #3	; 0x3
  100950:	e20110ff 	and	r1, r1, #255	; 0xff
  100954:	e1a0c000 	mov	ip, r0
  100958:	9a000001 	bls	100964 <memset+0x18>
  10095c:	e3100003 	tst	r0, #3	; 0x3
  100960:	0a000008 	beq	100988 <memset+0x3c>
  100964:	e3520000 	cmp	r2, #0	; 0x0
  100968:	012fff1e 	bxeq	lr
  10096c:	e20110ff 	and	r1, r1, #255	; 0xff
  100970:	e3a03000 	mov	r3, #0	; 0x0
  100974:	e7c3100c 	strb	r1, [r3, ip]
  100978:	e2833001 	add	r3, r3, #1	; 0x1
  10097c:	e1530002 	cmp	r3, r2
  100980:	1afffffb 	bne	100974 <memset+0x28>
  100984:	e12fff1e 	bx	lr
  100988:	e1813401 	orr	r3, r1, r1, lsl #8
  10098c:	e352000f 	cmp	r2, #15	; 0xf
  100990:	e183c803 	orr	ip, r3, r3, lsl #16
  100994:	e1a03000 	mov	r3, r0
  100998:	9a000009 	bls	1009c4 <memset+0x78>
  10099c:	e2422010 	sub	r2, r2, #16	; 0x10
  1009a0:	e352000f 	cmp	r2, #15	; 0xf
  1009a4:	e583c000 	str	ip, [r3]
  1009a8:	e583c004 	str	ip, [r3, #4]
  1009ac:	e583c008 	str	ip, [r3, #8]
  1009b0:	e583c00c 	str	ip, [r3, #12]
  1009b4:	e2833010 	add	r3, r3, #16	; 0x10
  1009b8:	8afffff7 	bhi	10099c <memset+0x50>
  1009bc:	e3520003 	cmp	r2, #3	; 0x3
  1009c0:	9a000003 	bls	1009d4 <memset+0x88>
  1009c4:	e2422004 	sub	r2, r2, #4	; 0x4
  1009c8:	e3520003 	cmp	r2, #3	; 0x3
  1009cc:	e483c004 	str	ip, [r3], #4
  1009d0:	8afffffb 	bhi	1009c4 <memset+0x78>
  1009d4:	e3520000 	cmp	r2, #0	; 0x0
  1009d8:	e1a0c003 	mov	ip, r3
  1009dc:	1affffe2 	bne	10096c <memset+0x20>
  1009e0:	e12fff1e 	bx	lr

001009e4 <__malloc_lock>:
  1009e4:	e12fff1e 	bx	lr

001009e8 <__malloc_unlock>:
  1009e8:	e12fff1e 	bx	lr

001009ec <strlen>:
  1009ec:	e3100003 	tst	r0, #3	; 0x3
  1009f0:	e1a01000 	mov	r1, r0
  1009f4:	1a000018 	bne	100a5c <strlen+0x70>
  1009f8:	e5902000 	ldr	r2, [r0]
  1009fc:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100a00:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100a04:	e2433c01 	sub	r3, r3, #256	; 0x100
  100a08:	e2433001 	sub	r3, r3, #1	; 0x1
  100a0c:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100a10:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100a14:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100a18:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100a1c:	e1d32002 	bics	r2, r3, r2
  100a20:	e1a02000 	mov	r2, r0
  100a24:	1a00000b 	bne	100a58 <strlen+0x6c>
  100a28:	e5b02004 	ldr	r2, [r0, #4]!
  100a2c:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100a30:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100a34:	e2433c01 	sub	r3, r3, #256	; 0x100
  100a38:	e2433001 	sub	r3, r3, #1	; 0x1
  100a3c:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100a40:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100a44:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100a48:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100a4c:	e1d32002 	bics	r2, r3, r2
  100a50:	0afffff4 	beq	100a28 <strlen+0x3c>
  100a54:	e1a02000 	mov	r2, r0
  100a58:	e1a00002 	mov	r0, r2
  100a5c:	e5d03000 	ldrb	r3, [r0]
  100a60:	e3530000 	cmp	r3, #0	; 0x0
  100a64:	0a000002 	beq	100a74 <strlen+0x88>
  100a68:	e5f03001 	ldrb	r3, [r0, #1]!
  100a6c:	e3530000 	cmp	r3, #0	; 0x0
  100a70:	1afffffc 	bne	100a68 <strlen+0x7c>
  100a74:	e0610000 	rsb	r0, r1, r0
  100a78:	e12fff1e 	bx	lr

00100a7c <strncpy>:
  100a7c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100a80:	e1a04001 	mov	r4, r1
  100a84:	e1811000 	orr	r1, r1, r0
  100a88:	e3110003 	tst	r1, #3	; 0x3
  100a8c:	13a03000 	movne	r3, #0	; 0x0
  100a90:	03a03001 	moveq	r3, #1	; 0x1
  100a94:	e3520003 	cmp	r2, #3	; 0x3
  100a98:	93a03000 	movls	r3, #0	; 0x0
  100a9c:	82033001 	andhi	r3, r3, #1	; 0x1
  100aa0:	e3530000 	cmp	r3, #0	; 0x0
  100aa4:	01a01004 	moveq	r1, r4
  100aa8:	e1a05000 	mov	r5, r0
  100aac:	e1a0e002 	mov	lr, r2
  100ab0:	01a04000 	moveq	r4, r0
  100ab4:	0a000018 	beq	100b1c <strncpy+0xa0>
  100ab8:	e3520003 	cmp	r2, #3	; 0x3
  100abc:	e1a0c004 	mov	ip, r4
  100ac0:	9a000013 	bls	100b14 <strncpy+0x98>
  100ac4:	e5941000 	ldr	r1, [r4]
  100ac8:	ea000005 	b	100ae4 <strncpy+0x68>
  100acc:	e24ee004 	sub	lr, lr, #4	; 0x4
  100ad0:	e35e0003 	cmp	lr, #3	; 0x3
  100ad4:	e4801004 	str	r1, [r0], #4
  100ad8:	e28cc004 	add	ip, ip, #4	; 0x4
  100adc:	9a00000c 	bls	100b14 <strncpy+0x98>
  100ae0:	e59c1000 	ldr	r1, [ip]
  100ae4:	e28134ff 	add	r3, r1, #-16777216	; 0xff000000
  100ae8:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100aec:	e2433c01 	sub	r3, r3, #256	; 0x100
  100af0:	e2433001 	sub	r3, r3, #1	; 0x1
  100af4:	e1e02001 	mvn	r2, r1
  100af8:	e0033002 	and	r3, r3, r2
  100afc:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100b00:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100b04:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100b08:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100b0c:	e3530000 	cmp	r3, #0	; 0x0
  100b10:	0affffed 	beq	100acc <strncpy+0x50>
  100b14:	e1a04000 	mov	r4, r0
  100b18:	e1a0100c 	mov	r1, ip
  100b1c:	e35e0000 	cmp	lr, #0	; 0x0
  100b20:	0a000018 	beq	100b88 <strncpy+0x10c>
  100b24:	e5d13000 	ldrb	r3, [r1]
  100b28:	e24e2001 	sub	r2, lr, #1	; 0x1
  100b2c:	e3530000 	cmp	r3, #0	; 0x0
  100b30:	e1a0c004 	mov	ip, r4
  100b34:	e4cc3001 	strb	r3, [ip], #1
  100b38:	1284e002 	addne	lr, r4, #2	; 0x2
  100b3c:	10810002 	addne	r0, r1, r2
  100b40:	0a000008 	beq	100b68 <strncpy+0xec>
  100b44:	e1500001 	cmp	r0, r1
  100b48:	e1a0c00e 	mov	ip, lr
  100b4c:	e2422001 	sub	r2, r2, #1	; 0x1
  100b50:	e28ee001 	add	lr, lr, #1	; 0x1
  100b54:	0a00000b 	beq	100b88 <strncpy+0x10c>
  100b58:	e5f13001 	ldrb	r3, [r1, #1]!
  100b5c:	e3530000 	cmp	r3, #0	; 0x0
  100b60:	e54c3001 	strb	r3, [ip, #-1]
  100b64:	1afffff6 	bne	100b44 <strncpy+0xc8>
  100b68:	e3520000 	cmp	r2, #0	; 0x0
  100b6c:	0a000005 	beq	100b88 <strncpy+0x10c>
  100b70:	e3a03000 	mov	r3, #0	; 0x0
  100b74:	e1a01003 	mov	r1, r3
  100b78:	e7c3100c 	strb	r1, [r3, ip]
  100b7c:	e2833001 	add	r3, r3, #1	; 0x1
  100b80:	e1520003 	cmp	r2, r3
  100b84:	1afffffb 	bne	100b78 <strncpy+0xfc>
  100b88:	e1a00005 	mov	r0, r5
  100b8c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00100b90 <_malloc_trim_r>:
  100b90:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  100b94:	e59f70e4 	ldr	r7, [pc, #228]	; 100c80 <prog+0xc3c>
  100b98:	e1a04001 	mov	r4, r1
  100b9c:	e1a05000 	mov	r5, r0
  100ba0:	ebffff8f 	bl	1009e4 <__malloc_lock>
  100ba4:	e5973008 	ldr	r3, [r7, #8]
  100ba8:	e5932004 	ldr	r2, [r3, #4]
  100bac:	e3c26003 	bic	r6, r2, #3	; 0x3
  100bb0:	e0644006 	rsb	r4, r4, r6
  100bb4:	e2844efe 	add	r4, r4, #4064	; 0xfe0
  100bb8:	e284400f 	add	r4, r4, #15	; 0xf
  100bbc:	e1a04624 	mov	r4, r4, lsr #12
  100bc0:	e2444001 	sub	r4, r4, #1	; 0x1
  100bc4:	e1a04604 	mov	r4, r4, lsl #12
  100bc8:	e3540a01 	cmp	r4, #4096	; 0x1000
  100bcc:	e3a01000 	mov	r1, #0	; 0x0
  100bd0:	e1a00005 	mov	r0, r5
  100bd4:	ba000006 	blt	100bf4 <_malloc_trim_r+0x64>
  100bd8:	eb00014c 	bl	101110 <_sbrk_r>
  100bdc:	e5973008 	ldr	r3, [r7, #8]
  100be0:	e0863003 	add	r3, r6, r3
  100be4:	e1500003 	cmp	r0, r3
  100be8:	e2641000 	rsb	r1, r4, #0	; 0x0
  100bec:	e1a00005 	mov	r0, r5
  100bf0:	0a000002 	beq	100c00 <_malloc_trim_r+0x70>
  100bf4:	ebffff7b 	bl	1009e8 <__malloc_unlock>
  100bf8:	e3a00000 	mov	r0, #0	; 0x0
  100bfc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100c00:	eb000142 	bl	101110 <_sbrk_r>
  100c04:	e0643006 	rsb	r3, r4, r6
  100c08:	e3700001 	cmn	r0, #1	; 0x1
  100c0c:	e3a01000 	mov	r1, #0	; 0x0
  100c10:	e59fe06c 	ldr	lr, [pc, #108]	; 100c84 <prog+0xc40>
  100c14:	e383c001 	orr	ip, r3, #1	; 0x1
  100c18:	e1a00005 	mov	r0, r5
  100c1c:	0a000008 	beq	100c44 <_malloc_trim_r+0xb4>
  100c20:	e59e3000 	ldr	r3, [lr]
  100c24:	e5972008 	ldr	r2, [r7, #8]
  100c28:	e0643003 	rsb	r3, r4, r3
  100c2c:	e1a00005 	mov	r0, r5
  100c30:	e582c004 	str	ip, [r2, #4]
  100c34:	e58e3000 	str	r3, [lr]
  100c38:	ebffff6a 	bl	1009e8 <__malloc_unlock>
  100c3c:	e3a00001 	mov	r0, #1	; 0x1
  100c40:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100c44:	eb000131 	bl	101110 <_sbrk_r>
  100c48:	e5971008 	ldr	r1, [r7, #8]
  100c4c:	e1a0e000 	mov	lr, r0
  100c50:	e061300e 	rsb	r3, r1, lr
  100c54:	e353000f 	cmp	r3, #15	; 0xf
  100c58:	e1a00005 	mov	r0, r5
  100c5c:	e383c001 	orr	ip, r3, #1	; 0x1
  100c60:	daffffe3 	ble	100bf4 <_malloc_trim_r+0x64>
  100c64:	e59f301c 	ldr	r3, [pc, #28]	; 100c88 <prog+0xc44>
  100c68:	e5932000 	ldr	r2, [r3]
  100c6c:	e59f3010 	ldr	r3, [pc, #16]	; 100c84 <prog+0xc40>
  100c70:	e062200e 	rsb	r2, r2, lr
  100c74:	e5832000 	str	r2, [r3]
  100c78:	e581c004 	str	ip, [r1, #4]
  100c7c:	eaffffdc 	b	100bf4 <_malloc_trim_r+0x64>
  100c80:	00200000 	eoreq	r0, r0, r0
  100c84:	0020082c 	eoreq	r0, r0, ip, lsr #16
  100c88:	0020040c 	eoreq	r0, r0, ip, lsl #8

00100c8c <_free_r>:
  100c8c:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100c90:	e2514000 	subs	r4, r1, #0	; 0x0
  100c94:	e1a08000 	mov	r8, r0
  100c98:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  100c9c:	ebffff50 	bl	1009e4 <__malloc_lock>
  100ca0:	e244e008 	sub	lr, r4, #8	; 0x8
  100ca4:	e59e0004 	ldr	r0, [lr, #4]
  100ca8:	e59f726c 	ldr	r7, [pc, #620]	; 100f1c <prog+0xed8>
  100cac:	e3c01001 	bic	r1, r0, #1	; 0x1
  100cb0:	e08ec001 	add	ip, lr, r1
  100cb4:	e5973008 	ldr	r3, [r7, #8]
  100cb8:	e59c2004 	ldr	r2, [ip, #4]
  100cbc:	e15c0003 	cmp	ip, r3
  100cc0:	e3c25003 	bic	r5, r2, #3	; 0x3
  100cc4:	e1a0a007 	mov	sl, r7
  100cc8:	0a000077 	beq	100eac <_free_r+0x220>
  100ccc:	e2106001 	ands	r6, r0, #1	; 0x1
  100cd0:	e58c5004 	str	r5, [ip, #4]
  100cd4:	13a00000 	movne	r0, #0	; 0x0
  100cd8:	0a000018 	beq	100d40 <_free_r+0xb4>
  100cdc:	e08c3005 	add	r3, ip, r5
  100ce0:	e5932004 	ldr	r2, [r3, #4]
  100ce4:	e3120001 	tst	r2, #1	; 0x1
  100ce8:	0a000007 	beq	100d0c <_free_r+0x80>
  100cec:	e3813001 	orr	r3, r1, #1	; 0x1
  100cf0:	e3500000 	cmp	r0, #0	; 0x0
  100cf4:	e58e3004 	str	r3, [lr, #4]
  100cf8:	e781100e 	str	r1, [r1, lr]
  100cfc:	0a00001f 	beq	100d80 <_free_r+0xf4>
  100d00:	e1a00008 	mov	r0, r8
  100d04:	e8bd45f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100d08:	eaffff36 	b	1009e8 <__malloc_unlock>
  100d0c:	e3500000 	cmp	r0, #0	; 0x0
  100d10:	e0811005 	add	r1, r1, r5
  100d14:	159c2008 	ldrne	r2, [ip, #8]
  100d18:	0a00004a 	beq	100e48 <_free_r+0x1bc>
  100d1c:	e59c300c 	ldr	r3, [ip, #12]
  100d20:	e3500000 	cmp	r0, #0	; 0x0
  100d24:	e5832008 	str	r2, [r3, #8]
  100d28:	e582300c 	str	r3, [r2, #12]
  100d2c:	e3813001 	orr	r3, r1, #1	; 0x1
  100d30:	e58e3004 	str	r3, [lr, #4]
  100d34:	e781100e 	str	r1, [r1, lr]
  100d38:	1afffff0 	bne	100d00 <_free_r+0x74>
  100d3c:	ea00000f 	b	100d80 <_free_r+0xf4>
  100d40:	e5142008 	ldr	r2, [r4, #-8]
  100d44:	e062e00e 	rsb	lr, r2, lr
  100d48:	e59e0008 	ldr	r0, [lr, #8]
  100d4c:	e2873008 	add	r3, r7, #8	; 0x8
  100d50:	e1500003 	cmp	r0, r3
  100d54:	159e300c 	ldrne	r3, [lr, #12]
  100d58:	15830008 	strne	r0, [r3, #8]
  100d5c:	1580300c 	strne	r3, [r0, #12]
  100d60:	e08c3005 	add	r3, ip, r5
  100d64:	e0811002 	add	r1, r1, r2
  100d68:	e5932004 	ldr	r2, [r3, #4]
  100d6c:	03a00001 	moveq	r0, #1	; 0x1
  100d70:	11a00006 	movne	r0, r6
  100d74:	e3120001 	tst	r2, #1	; 0x1
  100d78:	1affffdb 	bne	100cec <_free_r+0x60>
  100d7c:	eaffffe2 	b	100d0c <_free_r+0x80>
  100d80:	e3510c02 	cmp	r1, #512	; 0x200
  100d84:	3a00003b 	bcc	100e78 <_free_r+0x1ec>
  100d88:	e1b024a1 	movs	r2, r1, lsr #9
  100d8c:	01a021a1 	moveq	r2, r1, lsr #3
  100d90:	01a03182 	moveq	r3, r2, lsl #3
  100d94:	0a00001a 	beq	100e04 <_free_r+0x178>
  100d98:	e3520004 	cmp	r2, #4	; 0x4
  100d9c:	91a03321 	movls	r3, r1, lsr #6
  100da0:	92832038 	addls	r2, r3, #56	; 0x38
  100da4:	91a03182 	movls	r3, r2, lsl #3
  100da8:	9a000015 	bls	100e04 <_free_r+0x178>
  100dac:	e3520014 	cmp	r2, #20	; 0x14
  100db0:	9282205b 	addls	r2, r2, #91	; 0x5b
  100db4:	91a03182 	movls	r3, r2, lsl #3
  100db8:	9a000011 	bls	100e04 <_free_r+0x178>
  100dbc:	e3520054 	cmp	r2, #84	; 0x54
  100dc0:	91a03621 	movls	r3, r1, lsr #12
  100dc4:	9283206e 	addls	r2, r3, #110	; 0x6e
  100dc8:	91a03182 	movls	r3, r2, lsl #3
  100dcc:	9a00000c 	bls	100e04 <_free_r+0x178>
  100dd0:	e3520f55 	cmp	r2, #340	; 0x154
  100dd4:	91a037a1 	movls	r3, r1, lsr #15
  100dd8:	92832077 	addls	r2, r3, #119	; 0x77
  100ddc:	91a03182 	movls	r3, r2, lsl #3
  100de0:	9a000007 	bls	100e04 <_free_r+0x178>
  100de4:	e3a03e55 	mov	r3, #1360	; 0x550
  100de8:	e2833004 	add	r3, r3, #4	; 0x4
  100dec:	e1520003 	cmp	r2, r3
  100df0:	91a03921 	movls	r3, r1, lsr #18
  100df4:	9283207c 	addls	r2, r3, #124	; 0x7c
  100df8:	83a0207e 	movhi	r2, #126	; 0x7e
  100dfc:	82433f59 	subhi	r3, r3, #356	; 0x164
  100e00:	91a03182 	movls	r3, r2, lsl #3
  100e04:	e083c00a 	add	ip, r3, sl
  100e08:	e59c0008 	ldr	r0, [ip, #8]
  100e0c:	e15c0000 	cmp	ip, r0
  100e10:	0a00003b 	beq	100f04 <_free_r+0x278>
  100e14:	e5903004 	ldr	r3, [r0, #4]
  100e18:	e3c33003 	bic	r3, r3, #3	; 0x3
  100e1c:	e1510003 	cmp	r1, r3
  100e20:	2a000002 	bcs	100e30 <_free_r+0x1a4>
  100e24:	e5900008 	ldr	r0, [r0, #8]
  100e28:	e15c0000 	cmp	ip, r0
  100e2c:	1afffff8 	bne	100e14 <_free_r+0x188>
  100e30:	e590c00c 	ldr	ip, [r0, #12]
  100e34:	e58ec00c 	str	ip, [lr, #12]
  100e38:	e58e0008 	str	r0, [lr, #8]
  100e3c:	e580e00c 	str	lr, [r0, #12]
  100e40:	e58ce008 	str	lr, [ip, #8]
  100e44:	eaffffad 	b	100d00 <_free_r+0x74>
  100e48:	e59c2008 	ldr	r2, [ip, #8]
  100e4c:	e59f30cc 	ldr	r3, [pc, #204]	; 100f20 <prog+0xedc>
  100e50:	e1520003 	cmp	r2, r3
  100e54:	1affffb0 	bne	100d1c <_free_r+0x90>
  100e58:	e3813001 	orr	r3, r1, #1	; 0x1
  100e5c:	e582e00c 	str	lr, [r2, #12]
  100e60:	e582e008 	str	lr, [r2, #8]
  100e64:	e781100e 	str	r1, [r1, lr]
  100e68:	e58e3004 	str	r3, [lr, #4]
  100e6c:	e58e2008 	str	r2, [lr, #8]
  100e70:	e58e200c 	str	r2, [lr, #12]
  100e74:	eaffffa1 	b	100d00 <_free_r+0x74>
  100e78:	e1a011a1 	mov	r1, r1, lsr #3
  100e7c:	e5972004 	ldr	r2, [r7, #4]
  100e80:	e1a00121 	mov	r0, r1, lsr #2
  100e84:	e3a03001 	mov	r3, #1	; 0x1
  100e88:	e1822013 	orr	r2, r2, r3, lsl r0
  100e8c:	e08a1181 	add	r1, sl, r1, lsl #3
  100e90:	e5913008 	ldr	r3, [r1, #8]
  100e94:	e58e100c 	str	r1, [lr, #12]
  100e98:	e58e3008 	str	r3, [lr, #8]
  100e9c:	e5872004 	str	r2, [r7, #4]
  100ea0:	e583e00c 	str	lr, [r3, #12]
  100ea4:	e581e008 	str	lr, [r1, #8]
  100ea8:	eaffff94 	b	100d00 <_free_r+0x74>
  100eac:	e3100001 	tst	r0, #1	; 0x1
  100eb0:	e0810005 	add	r0, r1, r5
  100eb4:	1a000006 	bne	100ed4 <_free_r+0x248>
  100eb8:	e5141008 	ldr	r1, [r4, #-8]
  100ebc:	e061e00e 	rsb	lr, r1, lr
  100ec0:	e59e200c 	ldr	r2, [lr, #12]
  100ec4:	e59e3008 	ldr	r3, [lr, #8]
  100ec8:	e5823008 	str	r3, [r2, #8]
  100ecc:	e583200c 	str	r2, [r3, #12]
  100ed0:	e0800001 	add	r0, r0, r1
  100ed4:	e59f3048 	ldr	r3, [pc, #72]	; 100f24 <prog+0xee0>
  100ed8:	e5932000 	ldr	r2, [r3]
  100edc:	e3803001 	orr	r3, r0, #1	; 0x1
  100ee0:	e1500002 	cmp	r0, r2
  100ee4:	e587e008 	str	lr, [r7, #8]
  100ee8:	e58e3004 	str	r3, [lr, #4]
  100eec:	3affff83 	bcc	100d00 <_free_r+0x74>
  100ef0:	e59f3030 	ldr	r3, [pc, #48]	; 100f28 <prog+0xee4>
  100ef4:	e1a00008 	mov	r0, r8
  100ef8:	e5931000 	ldr	r1, [r3]
  100efc:	ebffff23 	bl	100b90 <_malloc_trim_r>
  100f00:	eaffff7e 	b	100d00 <_free_r+0x74>
  100f04:	e5973004 	ldr	r3, [r7, #4]
  100f08:	e1a01122 	mov	r1, r2, lsr #2
  100f0c:	e3a02001 	mov	r2, #1	; 0x1
  100f10:	e1833112 	orr	r3, r3, r2, lsl r1
  100f14:	e5873004 	str	r3, [r7, #4]
  100f18:	eaffffc5 	b	100e34 <_free_r+0x1a8>
  100f1c:	00200000 	eoreq	r0, r0, r0
  100f20:	00200008 	eoreq	r0, r0, r8
  100f24:	00200408 	eoreq	r0, r0, r8, lsl #8
  100f28:	00200820 	eoreq	r0, r0, r0, lsr #16

00100f2c <vApplicationIdleHook>:
  100f2c:	e3a034a5 	mov	r3, #-1526726656	; 0xa5000000
  100f30:	e2833001 	add	r3, r3, #1	; 0x1
  100f34:	e3e02c02 	mvn	r2, #512	; 0x200
  100f38:	e50230bf 	str	r3, [r2, #-191]
  100f3c:	e12fff1e 	bx	lr

00100f40 <vResetEnv>:
  100f40:	e59f0008 	ldr	r0, [pc, #8]	; 100f50 <prog+0xf0c>
  100f44:	e3a01000 	mov	r1, #0	; 0x0
  100f48:	e3a02080 	mov	r2, #128	; 0x80
  100f4c:	eafffe7e 	b	10094c <memset>
  100f50:	002010ac 	eoreq	r1, r0, ip, lsr #1

00100f54 <mainloop>:
  100f54:	e3a04000 	mov	r4, #0	; 0x0
  100f58:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  100f5c:	e3a0200c 	mov	r2, #12	; 0xc
  100f60:	e5834031 	str	r4, [r3, #49]
  100f64:	e2833b03 	add	r3, r3, #3072	; 0xc00
  100f68:	e24dd008 	sub	sp, sp, #8	; 0x8
  100f6c:	e50320ef 	str	r2, [r3, #-239]
  100f70:	eb000070 	bl	101138 <led_init>
  100f74:	eb00009b 	bl	1011e8 <env_init>
  100f78:	eb00009f 	bl	1011fc <env_load>
  100f7c:	e1500004 	cmp	r0, r4
  100f80:	0a00000c 	beq	100fb8 <mainloop+0x64>
  100f84:	eb00000f 	bl	100fc8 <vUSBShellInit>
  100f88:	e3a0c002 	mov	ip, #2	; 0x2
  100f8c:	e1a03004 	mov	r3, r4
  100f90:	e59f1028 	ldr	r1, [pc, #40]	; 100fc0 <prog+0xf7c>
  100f94:	e3a02c02 	mov	r2, #512	; 0x200
  100f98:	e59f0024 	ldr	r0, [pc, #36]	; 100fc4 <prog+0xf80>
  100f9c:	e58dc000 	str	ip, [sp]
  100fa0:	e58d4004 	str	r4, [sp, #4]
  100fa4:	eb0003d8 	bl	101f0c <xTaskCreate>
  100fa8:	e3a00001 	mov	r0, #1	; 0x1
  100fac:	eb000067 	bl	101150 <led_set_green>
  100fb0:	eb000464 	bl	102148 <vTaskStartScheduler>
  100fb4:	eafffffe 	b	100fb4 <mainloop+0x60>
  100fb8:	ebffffe0 	bl	100f40 <vResetEnv>
  100fbc:	eafffff0 	b	100f84 <mainloop+0x30>
  100fc0:	001038fc 	ldreqsh	r3, [r0], -ip
  100fc4:	00102cec 	andeqs	r2, r0, ip, ror #25

00100fc8 <vUSBShellInit>:
  100fc8:	e52de004 	str	lr, [sp, #-4]!
  100fcc:	e3a0c000 	mov	ip, #0	; 0x0
  100fd0:	e24dd008 	sub	sp, sp, #8	; 0x8
  100fd4:	e1a0300c 	mov	r3, ip
  100fd8:	e59f1018 	ldr	r1, [pc, #24]	; 100ff8 <prog+0xfb4>
  100fdc:	e3a02c02 	mov	r2, #512	; 0x200
  100fe0:	e59f0014 	ldr	r0, [pc, #20]	; 100ffc <prog+0xfb8>
  100fe4:	e58dc000 	str	ip, [sp]
  100fe8:	e58dc004 	str	ip, [sp, #4]
  100fec:	eb0003c6 	bl	101f0c <xTaskCreate>
  100ff0:	e28dd008 	add	sp, sp, #8	; 0x8
  100ff4:	e8bd8000 	ldmia	sp!, {pc}
  100ff8:	00103900 	andeqs	r3, r0, r0, lsl #18
  100ffc:	00101000 	andeqs	r1, r0, r0

00101000 <usbshell_task>:
  101000:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  101004:	e3a05c4e 	mov	r5, #19968	; 0x4e00
  101008:	e24dd008 	sub	sp, sp, #8	; 0x8
  10100c:	e2855020 	add	r5, r5, #32	; 0x20
  101010:	e3a04000 	mov	r4, #0	; 0x0
  101014:	e28d6007 	add	r6, sp, #7	; 0x7
  101018:	ea000001 	b	101024 <usbshell_task+0x24>
  10101c:	e1540005 	cmp	r4, r5
  101020:	0a000034 	beq	1010f8 <usbshell_task+0xf8>
  101024:	e1a00006 	mov	r0, r6
  101028:	e3a01001 	mov	r1, #1	; 0x1
  10102c:	e3a02064 	mov	r2, #100	; 0x64
  101030:	eb00067f 	bl	102a34 <vUSBRecvByte>
  101034:	e3500000 	cmp	r0, #0	; 0x0
  101038:	e2844001 	add	r4, r4, #1	; 0x1
  10103c:	0afffff6 	beq	10101c <usbshell_task+0x1c>
  101040:	e59f70bc 	ldr	r7, [pc, #188]	; 101104 <prog+0x10c0>
  101044:	e3a05001 	mov	r5, #1	; 0x1
  101048:	ea000017 	b	1010ac <usbshell_task+0xac>
  10104c:	e3550001 	cmp	r5, #1	; 0x1
  101050:	0a00001b 	beq	1010c4 <usbshell_task+0xc4>
  101054:	e3a03003 	mov	r3, #3	; 0x3
  101058:	e3a0c025 	mov	ip, #37	; 0x25
  10105c:	e3a05000 	mov	r5, #0	; 0x0
  101060:	e59f10a0 	ldr	r1, [pc, #160]	; 101108 <prog+0x10c4>
  101064:	e3a0200f 	mov	r2, #15	; 0xf
  101068:	e59f009c 	ldr	r0, [pc, #156]	; 10110c <prog+0x10c8>
  10106c:	e5c73002 	strb	r3, [r7, #2]
  101070:	e5c7c000 	strb	ip, [r7]
  101074:	e5c75001 	strb	r5, [r7, #1]
  101078:	ebfffe0b 	bl	1008ac <memcpy>
  10107c:	e59f0088 	ldr	r0, [pc, #136]	; 10110c <prog+0x10c8>
  101080:	ebfffe59 	bl	1009ec <strlen>
  101084:	e2804004 	add	r4, r0, #4	; 0x4
  101088:	e20440ff 	and	r4, r4, #255	; 0xff
  10108c:	e3e0c000 	mvn	ip, #0	; 0x0
  101090:	e2841004 	add	r1, r4, #4	; 0x4
  101094:	e59f0068 	ldr	r0, [pc, #104]	; 101104 <prog+0x10c0>
  101098:	e1a02005 	mov	r2, r5
  10109c:	e1a03005 	mov	r3, r5
  1010a0:	e58dc000 	str	ip, [sp]
  1010a4:	e5c74000 	strb	r4, [r7]
  1010a8:	eb000683 	bl	102abc <usb_send_buffer_zero_copy>
  1010ac:	e1a00006 	mov	r0, r6
  1010b0:	e3a01001 	mov	r1, #1	; 0x1
  1010b4:	e3a02064 	mov	r2, #100	; 0x64
  1010b8:	eb00065d 	bl	102a34 <vUSBRecvByte>
  1010bc:	e3500000 	cmp	r0, #0	; 0x0
  1010c0:	0affffe1 	beq	10104c <usbshell_task+0x4c>
  1010c4:	e1a00006 	mov	r0, r6
  1010c8:	e3a01001 	mov	r1, #1	; 0x1
  1010cc:	e3a02064 	mov	r2, #100	; 0x64
  1010d0:	eb000657 	bl	102a34 <vUSBRecvByte>
  1010d4:	e3500000 	cmp	r0, #0	; 0x0
  1010d8:	0affffdd 	beq	101054 <usbshell_task+0x54>
  1010dc:	e1a00006 	mov	r0, r6
  1010e0:	e3a01001 	mov	r1, #1	; 0x1
  1010e4:	e3a02064 	mov	r2, #100	; 0x64
  1010e8:	eb000651 	bl	102a34 <vUSBRecvByte>
  1010ec:	e3500000 	cmp	r0, #0	; 0x0
  1010f0:	1afffff3 	bne	1010c4 <usbshell_task+0xc4>
  1010f4:	eaffffd6 	b	101054 <usbshell_task+0x54>
  1010f8:	e59f7004 	ldr	r7, [pc, #4]	; 101104 <prog+0x10c0>
  1010fc:	e1a05000 	mov	r5, r0
  101100:	eaffffe9 	b	1010ac <usbshell_task+0xac>
  101104:	00200ad0 	ldreqd	r0, [r0], -r0
  101108:	0010390c 	andeqs	r3, r0, ip, lsl #18
  10110c:	00200ad7 	ldreqd	r0, [r0], -r7

00101110 <_sbrk_r>:
  101110:	e59f2018 	ldr	r2, [pc, #24]	; 101130 <prog+0x10ec>
  101114:	e5920000 	ldr	r0, [r2]
  101118:	e3500000 	cmp	r0, #0	; 0x0
  10111c:	059f0010 	ldreq	r0, [pc, #16]	; 101134 <prog+0x10f0>
  101120:	e0803001 	add	r3, r0, r1
  101124:	05820000 	streq	r0, [r2]
  101128:	e5823000 	str	r3, [r2]
  10112c:	e12fff1e 	bx	lr
  101130:	00200854 	eoreq	r0, r0, r4, asr r8
  101134:	00201130 	eoreq	r1, r0, r0, lsr r1

00101138 <led_init>:
  101138:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  10113c:	e3a03501 	mov	r3, #4194304	; 0x400000
  101140:	e50230ff 	str	r3, [r2, #-255]
  101144:	e50230ef 	str	r3, [r2, #-239]
  101148:	e50230cf 	str	r3, [r2, #-207]
  10114c:	e12fff1e 	bx	lr

00101150 <led_set_green>:
  101150:	e31000ff 	tst	r0, #255	; 0xff
  101154:	13a02501 	movne	r2, #4194304	; 0x400000
  101158:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  10115c:	03a02501 	moveq	r2, #4194304	; 0x400000
  101160:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  101164:	150320cb 	strne	r2, [r3, #-203]
  101168:	050320cf 	streq	r2, [r3, #-207]
  10116c:	e12fff1e 	bx	lr

00101170 <env_crc16>:
  101170:	e3500000 	cmp	r0, #0	; 0x0
  101174:	13510000 	cmpne	r1, #0	; 0x0
  101178:	e52de004 	str	lr, [sp, #-4]!
  10117c:	e1a0e000 	mov	lr, r0
  101180:	0a000015 	beq	1011dc <env_crc16+0x6c>
  101184:	e3510000 	cmp	r1, #0	; 0x0
  101188:	0a000013 	beq	1011dc <env_crc16+0x6c>
  10118c:	e3a00801 	mov	r0, #65536	; 0x10000
  101190:	e2400001 	sub	r0, r0, #1	; 0x1
  101194:	e3a0c000 	mov	ip, #0	; 0x0
  101198:	e7dc200e 	ldrb	r2, [ip, lr]
  10119c:	e1a03400 	mov	r3, r0, lsl #8
  1011a0:	e1833420 	orr	r3, r3, r0, lsr #8
  1011a4:	e0233002 	eor	r3, r3, r2
  1011a8:	e1a03803 	mov	r3, r3, lsl #16
  1011ac:	e1a03823 	mov	r3, r3, lsr #16
  1011b0:	e20320ff 	and	r2, r3, #255	; 0xff
  1011b4:	e0233222 	eor	r3, r3, r2, lsr #4
  1011b8:	e0233603 	eor	r3, r3, r3, lsl #12
  1011bc:	e1a03803 	mov	r3, r3, lsl #16
  1011c0:	e1a03823 	mov	r3, r3, lsr #16
  1011c4:	e28cc001 	add	ip, ip, #1	; 0x1
  1011c8:	e20320ff 	and	r2, r3, #255	; 0xff
  1011cc:	e15c0001 	cmp	ip, r1
  1011d0:	e0230282 	eor	r0, r3, r2, lsl #5
  1011d4:	1affffef 	bne	101198 <env_crc16+0x28>
  1011d8:	e49df004 	ldr	pc, [sp], #4
  1011dc:	e3a00801 	mov	r0, #65536	; 0x10000
  1011e0:	e2400001 	sub	r0, r0, #1	; 0x1
  1011e4:	e49df004 	ldr	pc, [sp], #4

001011e8 <env_init>:
  1011e8:	e3a03831 	mov	r3, #3211264	; 0x310000
  1011ec:	e2833c03 	add	r3, r3, #768	; 0x300
  1011f0:	e3e02000 	mvn	r2, #0	; 0x0
  1011f4:	e502309f 	str	r3, [r2, #-159]
  1011f8:	e12fff1e 	bx	lr

001011fc <env_load>:
  1011fc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  101200:	e59f50b8 	ldr	r5, [pc, #184]	; 1012c0 <prog+0x127c>
  101204:	e3a0194f 	mov	r1, #1294336	; 0x13c000
  101208:	e2811a03 	add	r1, r1, #12288	; 0x3000
  10120c:	e3a02080 	mov	r2, #128	; 0x80
  101210:	e1a00005 	mov	r0, r5
  101214:	ebfffda4 	bl	1008ac <memcpy>
  101218:	e5d52001 	ldrb	r2, [r5, #1]
  10121c:	e5d53000 	ldrb	r3, [r5]
  101220:	e5d51002 	ldrb	r1, [r5, #2]
  101224:	e1833402 	orr	r3, r3, r2, lsl #8
  101228:	e5d50003 	ldrb	r0, [r5, #3]
  10122c:	e3e024f3 	mvn	r2, #-218103808	; 0xf3000000
  101230:	e1833801 	orr	r3, r3, r1, lsl #16
  101234:	e24229cd 	sub	r2, r2, #3358720	; 0x334000
  101238:	e1833c00 	orr	r3, r3, r0, lsl #24
  10123c:	e2422e11 	sub	r2, r2, #272	; 0x110
  101240:	e1530002 	cmp	r3, r2
  101244:	0a000001 	beq	101250 <env_load+0x54>
  101248:	e3a00000 	mov	r0, #0	; 0x0
  10124c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  101250:	e5d53004 	ldrb	r3, [r5, #4]
  101254:	e5d52005 	ldrb	r2, [r5, #5]
  101258:	e5d5c006 	ldrb	ip, [r5, #6]
  10125c:	e5d51007 	ldrb	r1, [r5, #7]
  101260:	e1833402 	orr	r3, r3, r2, lsl #8
  101264:	e183380c 	orr	r3, r3, ip, lsl #16
  101268:	e1833c01 	orr	r3, r3, r1, lsl #24
  10126c:	e3530080 	cmp	r3, #128	; 0x80
  101270:	e1a00005 	mov	r0, r5
  101274:	e3a0e000 	mov	lr, #0	; 0x0
  101278:	e1a01003 	mov	r1, r3
  10127c:	1afffff1 	bne	101248 <env_load+0x4c>
  101280:	e5d54008 	ldrb	r4, [r5, #8]
  101284:	e5d53009 	ldrb	r3, [r5, #9]
  101288:	e5d5200a 	ldrb	r2, [r5, #10]
  10128c:	e5d5c00b 	ldrb	ip, [r5, #11]
  101290:	e1844403 	orr	r4, r4, r3, lsl #8
  101294:	e1844802 	orr	r4, r4, r2, lsl #16
  101298:	e1844c0c 	orr	r4, r4, ip, lsl #24
  10129c:	e5c5e00b 	strb	lr, [r5, #11]
  1012a0:	e5c5e008 	strb	lr, [r5, #8]
  1012a4:	e5c5e009 	strb	lr, [r5, #9]
  1012a8:	e5c5e00a 	strb	lr, [r5, #10]
  1012ac:	ebffffaf 	bl	101170 <env_crc16>
  1012b0:	e1540000 	cmp	r4, r0
  1012b4:	13a00000 	movne	r0, #0	; 0x0
  1012b8:	03a00001 	moveq	r0, #1	; 0x1
  1012bc:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1012c0:	002010ac 	eoreq	r1, r0, ip, lsr #1

001012c4 <AT91F_LowLevelInit>:
  1012c4:	e3a0184b 	mov	r1, #4915200	; 0x4b0000
  1012c8:	e3a00502 	mov	r0, #8388608	; 0x800000
  1012cc:	e3a0cc06 	mov	ip, #1536	; 0x600
  1012d0:	e52de004 	str	lr, [sp, #-4]!
  1012d4:	e2811c01 	add	r1, r1, #256	; 0x100
  1012d8:	e2800d82 	add	r0, r0, #8320	; 0x2080
  1012dc:	e28cc001 	add	ip, ip, #1	; 0x1
  1012e0:	e3e0ec03 	mvn	lr, #768	; 0x300
  1012e4:	e3e03000 	mvn	r3, #0	; 0x0
  1012e8:	e3e02c02 	mvn	r2, #512	; 0x200
  1012ec:	e503109f 	str	r1, [r3, #-159]
  1012f0:	e50200bb 	str	r0, [r2, #-187]
  1012f4:	e50ec0df 	str	ip, [lr, #-223]
  1012f8:	e51e3097 	ldr	r3, [lr, #-151]
  1012fc:	e3130001 	tst	r3, #1	; 0x1
  101300:	0afffffc 	beq	1012f8 <AT91F_LowLevelInit+0x34>
  101304:	e3a03819 	mov	r3, #1638400	; 0x190000
  101308:	e2833b07 	add	r3, r3, #7168	; 0x1c00
  10130c:	e2833005 	add	r3, r3, #5	; 0x5
  101310:	e50e30d3 	str	r3, [lr, #-211]
  101314:	e3e02c03 	mvn	r2, #768	; 0x300
  101318:	e5123097 	ldr	r3, [r2, #-151]
  10131c:	e3130004 	tst	r3, #4	; 0x4
  101320:	0afffffc 	beq	101318 <AT91F_LowLevelInit+0x54>
  101324:	e3a03004 	mov	r3, #4	; 0x4
  101328:	e50230cf 	str	r3, [r2, #-207]
  10132c:	e3e02c03 	mvn	r2, #768	; 0x300
  101330:	e5123097 	ldr	r3, [r2, #-151]
  101334:	e3130008 	tst	r3, #8	; 0x8
  101338:	0afffffc 	beq	101330 <AT91F_LowLevelInit+0x6c>
  10133c:	e51230cf 	ldr	r3, [r2, #-207]
  101340:	e3833003 	orr	r3, r3, #3	; 0x3
  101344:	e50230cf 	str	r3, [r2, #-207]
  101348:	e3e02c03 	mvn	r2, #768	; 0x300
  10134c:	e5123097 	ldr	r3, [r2, #-151]
  101350:	e3130008 	tst	r3, #8	; 0x8
  101354:	0afffffc 	beq	10134c <AT91F_LowLevelInit+0x88>
  101358:	e49df004 	ldr	pc, [sp], #4

0010135c <AT91F_AIC_ConfigureIt>:
  10135c:	e92d4010 	stmdb	sp!, {r4, lr}
  101360:	e3a0e001 	mov	lr, #1	; 0x1
  101364:	e1a0e01e 	mov	lr, lr, lsl r0
  101368:	e1a0c100 	mov	ip, r0, lsl #2
  10136c:	e51c0f80 	ldr	r0, [ip, #-3968]
  101370:	e1822001 	orr	r2, r2, r1
  101374:	e24c4a01 	sub	r4, ip, #4096	; 0x1000
  101378:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  10137c:	e1a00003 	mov	r0, r3
  101380:	e581e025 	str	lr, [r1, #37]
  101384:	e50c3f80 	str	r3, [ip, #-3968]
  101388:	e5842000 	str	r2, [r4]
  10138c:	e581e029 	str	lr, [r1, #41]
  101390:	e8bd8010 	ldmia	sp!, {r4, pc}

00101394 <vListInitialise>:
  101394:	e3e03000 	mvn	r3, #0	; 0x0
  101398:	e5803008 	str	r3, [r0, #8]
  10139c:	e2802008 	add	r2, r0, #8	; 0x8
  1013a0:	e2833001 	add	r3, r3, #1	; 0x1
  1013a4:	e580200c 	str	r2, [r0, #12]
  1013a8:	e5802010 	str	r2, [r0, #16]
  1013ac:	e5802004 	str	r2, [r0, #4]
  1013b0:	e5803000 	str	r3, [r0]
  1013b4:	e12fff1e 	bx	lr

001013b8 <vListInitialiseItem>:
  1013b8:	e3a03000 	mov	r3, #0	; 0x0
  1013bc:	e5803010 	str	r3, [r0, #16]
  1013c0:	e12fff1e 	bx	lr

001013c4 <vListInsertEnd>:
  1013c4:	e5902004 	ldr	r2, [r0, #4]
  1013c8:	e5923004 	ldr	r3, [r2, #4]
  1013cc:	e5813004 	str	r3, [r1, #4]
  1013d0:	e592c004 	ldr	ip, [r2, #4]
  1013d4:	e5812008 	str	r2, [r1, #8]
  1013d8:	e58c1008 	str	r1, [ip, #8]
  1013dc:	e5821004 	str	r1, [r2, #4]
  1013e0:	e5903000 	ldr	r3, [r0]
  1013e4:	e2833001 	add	r3, r3, #1	; 0x1
  1013e8:	e5803000 	str	r3, [r0]
  1013ec:	e5810010 	str	r0, [r1, #16]
  1013f0:	e5801004 	str	r1, [r0, #4]
  1013f4:	e12fff1e 	bx	lr

001013f8 <vListInsert>:
  1013f8:	e52de004 	str	lr, [sp, #-4]!
  1013fc:	e591e000 	ldr	lr, [r1]
  101400:	e37e0001 	cmn	lr, #1	; 0x1
  101404:	0590c010 	ldreq	ip, [r0, #16]
  101408:	0a000009 	beq	101434 <vListInsert+0x3c>
  10140c:	e280c008 	add	ip, r0, #8	; 0x8
  101410:	e59c3004 	ldr	r3, [ip, #4]
  101414:	e5932000 	ldr	r2, [r3]
  101418:	e15e0002 	cmp	lr, r2
  10141c:	3a000004 	bcc	101434 <vListInsert+0x3c>
  101420:	e59cc004 	ldr	ip, [ip, #4]
  101424:	e59c3004 	ldr	r3, [ip, #4]
  101428:	e5932000 	ldr	r2, [r3]
  10142c:	e15e0002 	cmp	lr, r2
  101430:	2afffffa 	bcs	101420 <vListInsert+0x28>
  101434:	e59c3004 	ldr	r3, [ip, #4]
  101438:	e5831008 	str	r1, [r3, #8]
  10143c:	e5813004 	str	r3, [r1, #4]
  101440:	e58c1004 	str	r1, [ip, #4]
  101444:	e5903000 	ldr	r3, [r0]
  101448:	e2833001 	add	r3, r3, #1	; 0x1
  10144c:	e5803000 	str	r3, [r0]
  101450:	e5810010 	str	r0, [r1, #16]
  101454:	e581c008 	str	ip, [r1, #8]
  101458:	e49df004 	ldr	pc, [sp], #4

0010145c <vListRemove>:
  10145c:	e5903004 	ldr	r3, [r0, #4]
  101460:	e5902008 	ldr	r2, [r0, #8]
  101464:	e5832008 	str	r2, [r3, #8]
  101468:	e5902008 	ldr	r2, [r0, #8]
  10146c:	e5901010 	ldr	r1, [r0, #16]
  101470:	e5823004 	str	r3, [r2, #4]
  101474:	e5913004 	ldr	r3, [r1, #4]
  101478:	e1530000 	cmp	r3, r0
  10147c:	e5913000 	ldr	r3, [r1]
  101480:	05812004 	streq	r2, [r1, #4]
  101484:	e2433001 	sub	r3, r3, #1	; 0x1
  101488:	e3a02000 	mov	r2, #0	; 0x0
  10148c:	e5802010 	str	r2, [r0, #16]
  101490:	e5813000 	str	r3, [r1]
  101494:	e12fff1e 	bx	lr

00101498 <uxQueueMessagesWaiting>:
  101498:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10149c:	e1a04000 	mov	r4, r0
  1014a0:	eb0004d6 	bl	102800 <vPortEnterCritical>
  1014a4:	e5945038 	ldr	r5, [r4, #56]
  1014a8:	eb0004df 	bl	10282c <vPortExitCritical>
  1014ac:	e1a00005 	mov	r0, r5
  1014b0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

001014b4 <prvCopyDataFromQueue>:
  1014b4:	e92d4010 	stmdb	sp!, {r4, lr}
  1014b8:	e5904000 	ldr	r4, [r0]
  1014bc:	e3540000 	cmp	r4, #0	; 0x0
  1014c0:	e1a0e000 	mov	lr, r0
  1014c4:	e1a00001 	mov	r0, r1
  1014c8:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1014cc:	e59ec00c 	ldr	ip, [lr, #12]
  1014d0:	e59e3040 	ldr	r3, [lr, #64]
  1014d4:	e59e1004 	ldr	r1, [lr, #4]
  1014d8:	e08cc003 	add	ip, ip, r3
  1014dc:	e15c0001 	cmp	ip, r1
  1014e0:	e58ec00c 	str	ip, [lr, #12]
  1014e4:	21a0c004 	movcs	ip, r4
  1014e8:	e1a02003 	mov	r2, r3
  1014ec:	e1a0100c 	mov	r1, ip
  1014f0:	258ec00c 	strcs	ip, [lr, #12]
  1014f4:	e8bd4010 	ldmia	sp!, {r4, lr}
  1014f8:	eafffceb 	b	1008ac <memcpy>

001014fc <prvCopyDataToQueue>:
  1014fc:	e5903040 	ldr	r3, [r0, #64]
  101500:	e3530000 	cmp	r3, #0	; 0x0
  101504:	e92d4010 	stmdb	sp!, {r4, lr}
  101508:	e1a04000 	mov	r4, r0
  10150c:	e1a00002 	mov	r0, r2
  101510:	0a00000e 	beq	101550 <prvCopyDataToQueue+0x54>
  101514:	e3500000 	cmp	r0, #0	; 0x0
  101518:	e1a02003 	mov	r2, r3
  10151c:	0a00000f 	beq	101560 <prvCopyDataToQueue+0x64>
  101520:	e1a02003 	mov	r2, r3
  101524:	e594000c 	ldr	r0, [r4, #12]
  101528:	ebfffcdf 	bl	1008ac <memcpy>
  10152c:	e594300c 	ldr	r3, [r4, #12]
  101530:	e5941040 	ldr	r1, [r4, #64]
  101534:	e5942000 	ldr	r2, [r4]
  101538:	e0613003 	rsb	r3, r1, r3
  10153c:	e1530002 	cmp	r3, r2
  101540:	e584300c 	str	r3, [r4, #12]
  101544:	35943004 	ldrcc	r3, [r4, #4]
  101548:	30613003 	rsbcc	r3, r1, r3
  10154c:	3584300c 	strcc	r3, [r4, #12]
  101550:	e5943038 	ldr	r3, [r4, #56]
  101554:	e2833001 	add	r3, r3, #1	; 0x1
  101558:	e5843038 	str	r3, [r4, #56]
  10155c:	e8bd8010 	ldmia	sp!, {r4, pc}
  101560:	e5940008 	ldr	r0, [r4, #8]
  101564:	ebfffcd0 	bl	1008ac <memcpy>
  101568:	e5943008 	ldr	r3, [r4, #8]
  10156c:	e5942040 	ldr	r2, [r4, #64]
  101570:	e5941004 	ldr	r1, [r4, #4]
  101574:	e0833002 	add	r3, r3, r2
  101578:	e1530001 	cmp	r3, r1
  10157c:	e5843008 	str	r3, [r4, #8]
  101580:	25943000 	ldrcs	r3, [r4]
  101584:	25843008 	strcs	r3, [r4, #8]
  101588:	e5943038 	ldr	r3, [r4, #56]
  10158c:	e2833001 	add	r3, r3, #1	; 0x1
  101590:	e5843038 	str	r3, [r4, #56]
  101594:	e8bd8010 	ldmia	sp!, {r4, pc}

00101598 <xQueueGenericSendFromISR>:
  101598:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10159c:	e590c038 	ldr	ip, [r0, #56]
  1015a0:	e590e03c 	ldr	lr, [r0, #60]
  1015a4:	e15c000e 	cmp	ip, lr
  1015a8:	e1a05002 	mov	r5, r2
  1015ac:	e1a04000 	mov	r4, r0
  1015b0:	e3a0c000 	mov	ip, #0	; 0x0
  1015b4:	e1a02003 	mov	r2, r3
  1015b8:	3a000001 	bcc	1015c4 <xQueueGenericSendFromISR+0x2c>
  1015bc:	e1a0000c 	mov	r0, ip
  1015c0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1015c4:	ebffffcc 	bl	1014fc <prvCopyDataToQueue>
  1015c8:	e5943048 	ldr	r3, [r4, #72]
  1015cc:	e3730001 	cmn	r3, #1	; 0x1
  1015d0:	e2833001 	add	r3, r3, #1	; 0x1
  1015d4:	e3a0c001 	mov	ip, #1	; 0x1
  1015d8:	15843048 	strne	r3, [r4, #72]
  1015dc:	1afffff6 	bne	1015bc <xQueueGenericSendFromISR+0x24>
  1015e0:	e5943024 	ldr	r3, [r4, #36]
  1015e4:	e3530000 	cmp	r3, #0	; 0x0
  1015e8:	e2840024 	add	r0, r4, #36	; 0x24
  1015ec:	1a000001 	bne	1015f8 <xQueueGenericSendFromISR+0x60>
  1015f0:	e3a0c001 	mov	ip, #1	; 0x1
  1015f4:	eafffff0 	b	1015bc <xQueueGenericSendFromISR+0x24>
  1015f8:	eb00019c 	bl	101c70 <xTaskRemoveFromEventList>
  1015fc:	e3a03001 	mov	r3, #1	; 0x1
  101600:	e3500000 	cmp	r0, #0	; 0x0
  101604:	e1a0c003 	mov	ip, r3
  101608:	15853000 	strne	r3, [r5]
  10160c:	1affffea 	bne	1015bc <xQueueGenericSendFromISR+0x24>
  101610:	eafffff6 	b	1015f0 <xQueueGenericSendFromISR+0x58>

00101614 <prvUnlockQueue>:
  101614:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  101618:	e1a04000 	mov	r4, r0
  10161c:	eb000477 	bl	102800 <vPortEnterCritical>
  101620:	e5943048 	ldr	r3, [r4, #72]
  101624:	e3530000 	cmp	r3, #0	; 0x0
  101628:	da000016 	ble	101688 <prvUnlockQueue+0x74>
  10162c:	e5943024 	ldr	r3, [r4, #36]
  101630:	e3530000 	cmp	r3, #0	; 0x0
  101634:	12845024 	addne	r5, r4, #36	; 0x24
  101638:	1a000008 	bne	101660 <prvUnlockQueue+0x4c>
  10163c:	ea000011 	b	101688 <prvUnlockQueue+0x74>
  101640:	e5943048 	ldr	r3, [r4, #72]
  101644:	e2433001 	sub	r3, r3, #1	; 0x1
  101648:	e3530000 	cmp	r3, #0	; 0x0
  10164c:	e5843048 	str	r3, [r4, #72]
  101650:	da00000c 	ble	101688 <prvUnlockQueue+0x74>
  101654:	e5943024 	ldr	r3, [r4, #36]
  101658:	e3530000 	cmp	r3, #0	; 0x0
  10165c:	0a000009 	beq	101688 <prvUnlockQueue+0x74>
  101660:	e1a00005 	mov	r0, r5
  101664:	eb000181 	bl	101c70 <xTaskRemoveFromEventList>
  101668:	e3500000 	cmp	r0, #0	; 0x0
  10166c:	0afffff3 	beq	101640 <prvUnlockQueue+0x2c>
  101670:	eb000140 	bl	101b78 <vTaskMissedYield>
  101674:	e5943048 	ldr	r3, [r4, #72]
  101678:	e2433001 	sub	r3, r3, #1	; 0x1
  10167c:	e3530000 	cmp	r3, #0	; 0x0
  101680:	e5843048 	str	r3, [r4, #72]
  101684:	cafffff2 	bgt	101654 <prvUnlockQueue+0x40>
  101688:	e3e03000 	mvn	r3, #0	; 0x0
  10168c:	e5843048 	str	r3, [r4, #72]
  101690:	eb000465 	bl	10282c <vPortExitCritical>
  101694:	eb000459 	bl	102800 <vPortEnterCritical>
  101698:	e5943044 	ldr	r3, [r4, #68]
  10169c:	e3530000 	cmp	r3, #0	; 0x0
  1016a0:	da000016 	ble	101700 <prvUnlockQueue+0xec>
  1016a4:	e5943010 	ldr	r3, [r4, #16]
  1016a8:	e3530000 	cmp	r3, #0	; 0x0
  1016ac:	12845010 	addne	r5, r4, #16	; 0x10
  1016b0:	1a000008 	bne	1016d8 <prvUnlockQueue+0xc4>
  1016b4:	ea000011 	b	101700 <prvUnlockQueue+0xec>
  1016b8:	e5943044 	ldr	r3, [r4, #68]
  1016bc:	e2433001 	sub	r3, r3, #1	; 0x1
  1016c0:	e3530000 	cmp	r3, #0	; 0x0
  1016c4:	e5843044 	str	r3, [r4, #68]
  1016c8:	da00000c 	ble	101700 <prvUnlockQueue+0xec>
  1016cc:	e5943010 	ldr	r3, [r4, #16]
  1016d0:	e3530000 	cmp	r3, #0	; 0x0
  1016d4:	0a000009 	beq	101700 <prvUnlockQueue+0xec>
  1016d8:	e1a00005 	mov	r0, r5
  1016dc:	eb000163 	bl	101c70 <xTaskRemoveFromEventList>
  1016e0:	e3500000 	cmp	r0, #0	; 0x0
  1016e4:	0afffff3 	beq	1016b8 <prvUnlockQueue+0xa4>
  1016e8:	eb000122 	bl	101b78 <vTaskMissedYield>
  1016ec:	e5943044 	ldr	r3, [r4, #68]
  1016f0:	e2433001 	sub	r3, r3, #1	; 0x1
  1016f4:	e3530000 	cmp	r3, #0	; 0x0
  1016f8:	e5843044 	str	r3, [r4, #68]
  1016fc:	cafffff2 	bgt	1016cc <prvUnlockQueue+0xb8>
  101700:	e3e03000 	mvn	r3, #0	; 0x0
  101704:	e5843044 	str	r3, [r4, #68]
  101708:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  10170c:	ea000446 	b	10282c <vPortExitCritical>

00101710 <xQueueGenericReceive>:
  101710:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  101714:	e1a05000 	mov	r5, r0
  101718:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10171c:	e1a06001 	mov	r6, r1
  101720:	e1a07003 	mov	r7, r3
  101724:	e3a04001 	mov	r4, #1	; 0x1
  101728:	e58d2000 	str	r2, [sp]
  10172c:	ea00000d 	b	101768 <xQueueGenericReceive+0x58>
  101730:	eb000432 	bl	102800 <vPortEnterCritical>
  101734:	e5953038 	ldr	r3, [r5, #56]
  101738:	e3530000 	cmp	r3, #0	; 0x0
  10173c:	1a000030 	bne	101804 <xQueueGenericReceive+0xf4>
  101740:	eb000439 	bl	10282c <vPortExitCritical>
  101744:	e59d3000 	ldr	r3, [sp]
  101748:	e3530000 	cmp	r3, #0	; 0x0
  10174c:	0a000040 	beq	101854 <xQueueGenericReceive+0x144>
  101750:	e28d0004 	add	r0, sp, #4	; 0x4
  101754:	e1a0100d 	mov	r1, sp
  101758:	eb00010b 	bl	101b8c <xTaskCheckForTimeOut>
  10175c:	e3500000 	cmp	r0, #0	; 0x0
  101760:	e3e04000 	mvn	r4, #0	; 0x0
  101764:	1a00003a 	bne	101854 <xQueueGenericReceive+0x144>
  101768:	e59d3000 	ldr	r3, [sp]
  10176c:	e3530000 	cmp	r3, #0	; 0x0
  101770:	0affffee 	beq	101730 <xQueueGenericReceive+0x20>
  101774:	eb000134 	bl	101c4c <vTaskSuspendAll>
  101778:	eb000420 	bl	102800 <vPortEnterCritical>
  10177c:	e5953044 	ldr	r3, [r5, #68]
  101780:	e3730001 	cmn	r3, #1	; 0x1
  101784:	02833001 	addeq	r3, r3, #1	; 0x1
  101788:	05853044 	streq	r3, [r5, #68]
  10178c:	e5953048 	ldr	r3, [r5, #72]
  101790:	e3730001 	cmn	r3, #1	; 0x1
  101794:	02833001 	addeq	r3, r3, #1	; 0x1
  101798:	05853048 	streq	r3, [r5, #72]
  10179c:	eb000422 	bl	10282c <vPortExitCritical>
  1017a0:	e3540001 	cmp	r4, #1	; 0x1
  1017a4:	0a00002d 	beq	101860 <xQueueGenericReceive+0x150>
  1017a8:	eb000414 	bl	102800 <vPortEnterCritical>
  1017ac:	e5954038 	ldr	r4, [r5, #56]
  1017b0:	eb00041d 	bl	10282c <vPortExitCritical>
  1017b4:	e3540000 	cmp	r4, #0	; 0x0
  1017b8:	1a000021 	bne	101844 <xQueueGenericReceive+0x134>
  1017bc:	e28d0004 	add	r0, sp, #4	; 0x4
  1017c0:	e1a0100d 	mov	r1, sp
  1017c4:	eb0000f0 	bl	101b8c <xTaskCheckForTimeOut>
  1017c8:	e3500000 	cmp	r0, #0	; 0x0
  1017cc:	1a00001c 	bne	101844 <xQueueGenericReceive+0x134>
  1017d0:	e59d1000 	ldr	r1, [sp]
  1017d4:	e2850024 	add	r0, r5, #36	; 0x24
  1017d8:	eb0001a8 	bl	101e80 <vTaskPlaceOnEventList>
  1017dc:	e1a00005 	mov	r0, r5
  1017e0:	ebffff8b 	bl	101614 <prvUnlockQueue>
  1017e4:	eb000275 	bl	1021c0 <xTaskResumeAll>
  1017e8:	e3500000 	cmp	r0, #0	; 0x0
  1017ec:	1affffcf 	bne	101730 <xQueueGenericReceive+0x20>
  1017f0:	ef000000 	swi	0x00000000
  1017f4:	eb000401 	bl	102800 <vPortEnterCritical>
  1017f8:	e5953038 	ldr	r3, [r5, #56]
  1017fc:	e3530000 	cmp	r3, #0	; 0x0
  101800:	0affffce 	beq	101740 <xQueueGenericReceive+0x30>
  101804:	e1a01006 	mov	r1, r6
  101808:	e1a00005 	mov	r0, r5
  10180c:	e595400c 	ldr	r4, [r5, #12]
  101810:	ebffff27 	bl	1014b4 <prvCopyDataFromQueue>
  101814:	e3570000 	cmp	r7, #0	; 0x0
  101818:	0a000013 	beq	10186c <xQueueGenericReceive+0x15c>
  10181c:	e5953024 	ldr	r3, [r5, #36]
  101820:	e3530000 	cmp	r3, #0	; 0x0
  101824:	e585400c 	str	r4, [r5, #12]
  101828:	0a000015 	beq	101884 <xQueueGenericReceive+0x174>
  10182c:	e2850024 	add	r0, r5, #36	; 0x24
  101830:	eb00010e 	bl	101c70 <xTaskRemoveFromEventList>
  101834:	e3500000 	cmp	r0, #0	; 0x0
  101838:	0a000011 	beq	101884 <xQueueGenericReceive+0x174>
  10183c:	ef000000 	swi	0x00000000
  101840:	ea00000f 	b	101884 <xQueueGenericReceive+0x174>
  101844:	e1a00005 	mov	r0, r5
  101848:	ebffff71 	bl	101614 <prvUnlockQueue>
  10184c:	eb00025b 	bl	1021c0 <xTaskResumeAll>
  101850:	eaffffb6 	b	101730 <xQueueGenericReceive+0x20>
  101854:	e3a00000 	mov	r0, #0	; 0x0
  101858:	e28dd00c 	add	sp, sp, #12	; 0xc
  10185c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  101860:	e28d0004 	add	r0, sp, #4	; 0x4
  101864:	eb0000bb 	bl	101b58 <vTaskSetTimeOutState>
  101868:	eaffffce 	b	1017a8 <xQueueGenericReceive+0x98>
  10186c:	e5953038 	ldr	r3, [r5, #56]
  101870:	e2433001 	sub	r3, r3, #1	; 0x1
  101874:	e5853038 	str	r3, [r5, #56]
  101878:	e5952010 	ldr	r2, [r5, #16]
  10187c:	e3520000 	cmp	r2, #0	; 0x0
  101880:	1a000002 	bne	101890 <xQueueGenericReceive+0x180>
  101884:	eb0003e8 	bl	10282c <vPortExitCritical>
  101888:	e3a00001 	mov	r0, #1	; 0x1
  10188c:	eafffff1 	b	101858 <xQueueGenericReceive+0x148>
  101890:	e2850010 	add	r0, r5, #16	; 0x10
  101894:	eb0000f5 	bl	101c70 <xTaskRemoveFromEventList>
  101898:	e3500001 	cmp	r0, #1	; 0x1
  10189c:	1afffff8 	bne	101884 <xQueueGenericReceive+0x174>
  1018a0:	ef000000 	swi	0x00000000
  1018a4:	eafffff6 	b	101884 <xQueueGenericReceive+0x174>

001018a8 <xQueueGenericSend>:
  1018a8:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  1018ac:	e1a06000 	mov	r6, r0
  1018b0:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1018b4:	e1a07001 	mov	r7, r1
  1018b8:	e1a08003 	mov	r8, r3
  1018bc:	e3a04001 	mov	r4, #1	; 0x1
  1018c0:	e58d2000 	str	r2, [sp]
  1018c4:	ea00000e 	b	101904 <xQueueGenericSend+0x5c>
  1018c8:	eb0003cc 	bl	102800 <vPortEnterCritical>
  1018cc:	e5962038 	ldr	r2, [r6, #56]
  1018d0:	e596303c 	ldr	r3, [r6, #60]
  1018d4:	e1520003 	cmp	r2, r3
  1018d8:	3a000032 	bcc	1019a8 <xQueueGenericSend+0x100>
  1018dc:	eb0003d2 	bl	10282c <vPortExitCritical>
  1018e0:	e59d3000 	ldr	r3, [sp]
  1018e4:	e3530000 	cmp	r3, #0	; 0x0
  1018e8:	0a00003c 	beq	1019e0 <xQueueGenericSend+0x138>
  1018ec:	e28d0004 	add	r0, sp, #4	; 0x4
  1018f0:	e1a0100d 	mov	r1, sp
  1018f4:	eb0000a4 	bl	101b8c <xTaskCheckForTimeOut>
  1018f8:	e3500000 	cmp	r0, #0	; 0x0
  1018fc:	e3e04000 	mvn	r4, #0	; 0x0
  101900:	1a000036 	bne	1019e0 <xQueueGenericSend+0x138>
  101904:	e59d3000 	ldr	r3, [sp]
  101908:	e3530000 	cmp	r3, #0	; 0x0
  10190c:	0affffed 	beq	1018c8 <xQueueGenericSend+0x20>
  101910:	eb0000cd 	bl	101c4c <vTaskSuspendAll>
  101914:	eb0003b9 	bl	102800 <vPortEnterCritical>
  101918:	e5963044 	ldr	r3, [r6, #68]
  10191c:	e3730001 	cmn	r3, #1	; 0x1
  101920:	02833001 	addeq	r3, r3, #1	; 0x1
  101924:	05863044 	streq	r3, [r6, #68]
  101928:	e5963048 	ldr	r3, [r6, #72]
  10192c:	e3730001 	cmn	r3, #1	; 0x1
  101930:	02833001 	addeq	r3, r3, #1	; 0x1
  101934:	05863048 	streq	r3, [r6, #72]
  101938:	eb0003bb 	bl	10282c <vPortExitCritical>
  10193c:	e3540001 	cmp	r4, #1	; 0x1
  101940:	0a000029 	beq	1019ec <xQueueGenericSend+0x144>
  101944:	eb0003ad 	bl	102800 <vPortEnterCritical>
  101948:	e5965038 	ldr	r5, [r6, #56]
  10194c:	e596403c 	ldr	r4, [r6, #60]
  101950:	eb0003b5 	bl	10282c <vPortExitCritical>
  101954:	e1550004 	cmp	r5, r4
  101958:	1a00001c 	bne	1019d0 <xQueueGenericSend+0x128>
  10195c:	e28d0004 	add	r0, sp, #4	; 0x4
  101960:	e1a0100d 	mov	r1, sp
  101964:	eb000088 	bl	101b8c <xTaskCheckForTimeOut>
  101968:	e3500000 	cmp	r0, #0	; 0x0
  10196c:	1a000017 	bne	1019d0 <xQueueGenericSend+0x128>
  101970:	e59d1000 	ldr	r1, [sp]
  101974:	e2860010 	add	r0, r6, #16	; 0x10
  101978:	eb000140 	bl	101e80 <vTaskPlaceOnEventList>
  10197c:	e1a00006 	mov	r0, r6
  101980:	ebffff23 	bl	101614 <prvUnlockQueue>
  101984:	eb00020d 	bl	1021c0 <xTaskResumeAll>
  101988:	e3500000 	cmp	r0, #0	; 0x0
  10198c:	1affffcd 	bne	1018c8 <xQueueGenericSend+0x20>
  101990:	ef000000 	swi	0x00000000
  101994:	eb000399 	bl	102800 <vPortEnterCritical>
  101998:	e5962038 	ldr	r2, [r6, #56]
  10199c:	e596303c 	ldr	r3, [r6, #60]
  1019a0:	e1520003 	cmp	r2, r3
  1019a4:	2affffcc 	bcs	1018dc <xQueueGenericSend+0x34>
  1019a8:	e1a01007 	mov	r1, r7
  1019ac:	e1a02008 	mov	r2, r8
  1019b0:	e1a00006 	mov	r0, r6
  1019b4:	ebfffed0 	bl	1014fc <prvCopyDataToQueue>
  1019b8:	e5963024 	ldr	r3, [r6, #36]
  1019bc:	e3530000 	cmp	r3, #0	; 0x0
  1019c0:	1a00000c 	bne	1019f8 <xQueueGenericSend+0x150>
  1019c4:	eb000398 	bl	10282c <vPortExitCritical>
  1019c8:	e3a00001 	mov	r0, #1	; 0x1
  1019cc:	ea000004 	b	1019e4 <xQueueGenericSend+0x13c>
  1019d0:	e1a00006 	mov	r0, r6
  1019d4:	ebffff0e 	bl	101614 <prvUnlockQueue>
  1019d8:	eb0001f8 	bl	1021c0 <xTaskResumeAll>
  1019dc:	eaffffb9 	b	1018c8 <xQueueGenericSend+0x20>
  1019e0:	e3a00000 	mov	r0, #0	; 0x0
  1019e4:	e28dd00c 	add	sp, sp, #12	; 0xc
  1019e8:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1019ec:	e28d0004 	add	r0, sp, #4	; 0x4
  1019f0:	eb000058 	bl	101b58 <vTaskSetTimeOutState>
  1019f4:	eaffffd2 	b	101944 <xQueueGenericSend+0x9c>
  1019f8:	e2860024 	add	r0, r6, #36	; 0x24
  1019fc:	eb00009b 	bl	101c70 <xTaskRemoveFromEventList>
  101a00:	e3500001 	cmp	r0, #1	; 0x1
  101a04:	1affffee 	bne	1019c4 <xQueueGenericSend+0x11c>
  101a08:	ef000000 	swi	0x00000000
  101a0c:	eaffffec 	b	1019c4 <xQueueGenericSend+0x11c>

00101a10 <xQueueCreate>:
  101a10:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  101a14:	e2507000 	subs	r7, r0, #0	; 0x0
  101a18:	e1a06001 	mov	r6, r1
  101a1c:	e3a0004c 	mov	r0, #76	; 0x4c
  101a20:	1a000002 	bne	101a30 <xQueueCreate+0x20>
  101a24:	e3a05000 	mov	r5, #0	; 0x0
  101a28:	e1a00005 	mov	r0, r5
  101a2c:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  101a30:	eb0003f0 	bl	1029f8 <pvPortMalloc>
  101a34:	e3500000 	cmp	r0, #0	; 0x0
  101a38:	e1a05000 	mov	r5, r0
  101a3c:	0afffff8 	beq	101a24 <xQueueCreate+0x14>
  101a40:	e0040796 	mul	r4, r6, r7
  101a44:	e2840001 	add	r0, r4, #1	; 0x1
  101a48:	eb0003ea 	bl	1029f8 <pvPortMalloc>
  101a4c:	e1a08000 	mov	r8, r0
  101a50:	e3580000 	cmp	r8, #0	; 0x0
  101a54:	e0803004 	add	r3, r0, r4
  101a58:	e2472001 	sub	r2, r7, #1	; 0x1
  101a5c:	e3e01000 	mvn	r1, #0	; 0x0
  101a60:	e2850010 	add	r0, r5, #16	; 0x10
  101a64:	e5858000 	str	r8, [r5]
  101a68:	0a00000d 	beq	101aa4 <xQueueCreate+0x94>
  101a6c:	e0228296 	mla	r2, r6, r2, r8
  101a70:	e5853004 	str	r3, [r5, #4]
  101a74:	e3a03000 	mov	r3, #0	; 0x0
  101a78:	e5853038 	str	r3, [r5, #56]
  101a7c:	e585200c 	str	r2, [r5, #12]
  101a80:	e585703c 	str	r7, [r5, #60]
  101a84:	e5856040 	str	r6, [r5, #64]
  101a88:	e5851048 	str	r1, [r5, #72]
  101a8c:	e5858008 	str	r8, [r5, #8]
  101a90:	e5851044 	str	r1, [r5, #68]
  101a94:	ebfffe3e 	bl	101394 <vListInitialise>
  101a98:	e2850024 	add	r0, r5, #36	; 0x24
  101a9c:	ebfffe3c 	bl	101394 <vListInitialise>
  101aa0:	eaffffe0 	b	101a28 <xQueueCreate+0x18>
  101aa4:	e1a00005 	mov	r0, r5
  101aa8:	eb0003ca 	bl	1029d8 <vPortFree>
  101aac:	e1a05008 	mov	r5, r8
  101ab0:	eaffffdc 	b	101a28 <xQueueCreate+0x18>

00101ab4 <vTaskSwitchContext>:
  101ab4:	e59f3088 	ldr	r3, [pc, #136]	; 101b44 <prog+0x1b00>
  101ab8:	e5932000 	ldr	r2, [r3]
  101abc:	e3520000 	cmp	r2, #0	; 0x0
  101ac0:	159f3080 	ldrne	r3, [pc, #128]	; 101b48 <prog+0x1b04>
  101ac4:	13a02001 	movne	r2, #1	; 0x1
  101ac8:	15832000 	strne	r2, [r3]
  101acc:	112fff1e 	bxne	lr
  101ad0:	e59f1074 	ldr	r1, [pc, #116]	; 101b4c <prog+0x1b08>
  101ad4:	e5913000 	ldr	r3, [r1]
  101ad8:	e59f0070 	ldr	r0, [pc, #112]	; 101b50 <prog+0x1b0c>
  101adc:	e0833103 	add	r3, r3, r3, lsl #2
  101ae0:	e7902103 	ldr	r2, [r0, r3, lsl #2]
  101ae4:	e3520000 	cmp	r2, #0	; 0x0
  101ae8:	1a000007 	bne	101b0c <vTaskSwitchContext+0x58>
  101aec:	e5913000 	ldr	r3, [r1]
  101af0:	e2433001 	sub	r3, r3, #1	; 0x1
  101af4:	e5813000 	str	r3, [r1]
  101af8:	e5912000 	ldr	r2, [r1]
  101afc:	e0822102 	add	r2, r2, r2, lsl #2
  101b00:	e7903102 	ldr	r3, [r0, r2, lsl #2]
  101b04:	e3530000 	cmp	r3, #0	; 0x0
  101b08:	0afffff7 	beq	101aec <vTaskSwitchContext+0x38>
  101b0c:	e5913000 	ldr	r3, [r1]
  101b10:	e0833103 	add	r3, r3, r3, lsl #2
  101b14:	e0802103 	add	r2, r0, r3, lsl #2
  101b18:	e5921004 	ldr	r1, [r2, #4]
  101b1c:	e5911004 	ldr	r1, [r1, #4]
  101b20:	e2823008 	add	r3, r2, #8	; 0x8
  101b24:	e5821004 	str	r1, [r2, #4]
  101b28:	e1510003 	cmp	r1, r3
  101b2c:	05911004 	ldreq	r1, [r1, #4]
  101b30:	e59f301c 	ldr	r3, [pc, #28]	; 101b54 <prog+0x1b10>
  101b34:	05821004 	streq	r1, [r2, #4]
  101b38:	e591200c 	ldr	r2, [r1, #12]
  101b3c:	e5832000 	str	r2, [r3]
  101b40:	e12fff1e 	bx	lr
  101b44:	00200868 	eoreq	r0, r0, r8, ror #16
  101b48:	0020085c 	eoreq	r0, r0, ip, asr r8
  101b4c:	0020086c 	eoreq	r0, r0, ip, ror #16
  101b50:	00200884 	eoreq	r0, r0, r4, lsl #17
  101b54:	00200858 	eoreq	r0, r0, r8, asr r8

00101b58 <vTaskSetTimeOutState>:
  101b58:	e59f3010 	ldr	r3, [pc, #16]	; 101b70 <prog+0x1b2c>
  101b5c:	e59f2010 	ldr	r2, [pc, #16]	; 101b74 <prog+0x1b30>
  101b60:	e5931000 	ldr	r1, [r3]
  101b64:	e5923000 	ldr	r3, [r2]
  101b68:	e880000a 	stmia	r0, {r1, r3}
  101b6c:	e12fff1e 	bx	lr
  101b70:	00200860 	eoreq	r0, r0, r0, ror #16
  101b74:	00200864 	eoreq	r0, r0, r4, ror #16

00101b78 <vTaskMissedYield>:
  101b78:	e59f3008 	ldr	r3, [pc, #8]	; 101b88 <prog+0x1b44>
  101b7c:	e3a02001 	mov	r2, #1	; 0x1
  101b80:	e5832000 	str	r2, [r3]
  101b84:	e12fff1e 	bx	lr
  101b88:	0020085c 	eoreq	r0, r0, ip, asr r8

00101b8c <xTaskCheckForTimeOut>:
  101b8c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101b90:	e1a06001 	mov	r6, r1
  101b94:	e1a04000 	mov	r4, r0
  101b98:	eb000318 	bl	102800 <vPortEnterCritical>
  101b9c:	e596c000 	ldr	ip, [r6]
  101ba0:	e37c0001 	cmn	ip, #1	; 0x1
  101ba4:	e3a05000 	mov	r5, #0	; 0x0
  101ba8:	0a000010 	beq	101bf0 <xTaskCheckForTimeOut+0x64>
  101bac:	e59f3090 	ldr	r3, [pc, #144]	; 101c44 <prog+0x1c00>
  101bb0:	e5942000 	ldr	r2, [r4]
  101bb4:	e5931000 	ldr	r1, [r3]
  101bb8:	e1520001 	cmp	r2, r1
  101bbc:	e59fe084 	ldr	lr, [pc, #132]	; 101c48 <prog+0x1c04>
  101bc0:	0a000016 	beq	101c20 <xTaskCheckForTimeOut+0x94>
  101bc4:	e59e3000 	ldr	r3, [lr]
  101bc8:	e5941004 	ldr	r1, [r4, #4]
  101bcc:	e1510003 	cmp	r1, r3
  101bd0:	9a000005 	bls	101bec <xTaskCheckForTimeOut+0x60>
  101bd4:	e59e3000 	ldr	r3, [lr]
  101bd8:	e0613003 	rsb	r3, r1, r3
  101bdc:	e15c0003 	cmp	ip, r3
  101be0:	e1a00004 	mov	r0, r4
  101be4:	e3a05000 	mov	r5, #0	; 0x0
  101be8:	8a000003 	bhi	101bfc <xTaskCheckForTimeOut+0x70>
  101bec:	e3a05001 	mov	r5, #1	; 0x1
  101bf0:	eb00030d 	bl	10282c <vPortExitCritical>
  101bf4:	e1a00005 	mov	r0, r5
  101bf8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101bfc:	e59f2044 	ldr	r2, [pc, #68]	; 101c48 <prog+0x1c04>
  101c00:	e5923000 	ldr	r3, [r2]
  101c04:	e0613003 	rsb	r3, r1, r3
  101c08:	e063300c 	rsb	r3, r3, ip
  101c0c:	e5863000 	str	r3, [r6]
  101c10:	ebffffd0 	bl	101b58 <vTaskSetTimeOutState>
  101c14:	eb000304 	bl	10282c <vPortExitCritical>
  101c18:	e1a00005 	mov	r0, r5
  101c1c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101c20:	e59fe020 	ldr	lr, [pc, #32]	; 101c48 <prog+0x1c04>
  101c24:	e5941004 	ldr	r1, [r4, #4]
  101c28:	e59e3000 	ldr	r3, [lr]
  101c2c:	e0613003 	rsb	r3, r1, r3
  101c30:	e15c0003 	cmp	ip, r3
  101c34:	e1a00004 	mov	r0, r4
  101c38:	e3a05000 	mov	r5, #0	; 0x0
  101c3c:	9affffea 	bls	101bec <xTaskCheckForTimeOut+0x60>
  101c40:	eaffffed 	b	101bfc <xTaskCheckForTimeOut+0x70>
  101c44:	00200860 	eoreq	r0, r0, r0, ror #16
  101c48:	00200864 	eoreq	r0, r0, r4, ror #16

00101c4c <vTaskSuspendAll>:
  101c4c:	e52de004 	str	lr, [sp, #-4]!
  101c50:	eb0002ea 	bl	102800 <vPortEnterCritical>
  101c54:	e59f2010 	ldr	r2, [pc, #16]	; 101c6c <prog+0x1c28>
  101c58:	e5923000 	ldr	r3, [r2]
  101c5c:	e2833001 	add	r3, r3, #1	; 0x1
  101c60:	e5823000 	str	r3, [r2]
  101c64:	e49de004 	ldr	lr, [sp], #4
  101c68:	ea0002ef 	b	10282c <vPortExitCritical>
  101c6c:	00200868 	eoreq	r0, r0, r8, ror #16

00101c70 <xTaskRemoveFromEventList>:
  101c70:	e5903000 	ldr	r3, [r0]
  101c74:	e3530000 	cmp	r3, #0	; 0x0
  101c78:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101c7c:	e1a06003 	mov	r6, r3
  101c80:	1590300c 	ldrne	r3, [r0, #12]
  101c84:	1593600c 	ldrne	r6, [r3, #12]
  101c88:	e2864018 	add	r4, r6, #24	; 0x18
  101c8c:	e1a00004 	mov	r0, r4
  101c90:	ebfffdf1 	bl	10145c <vListRemove>
  101c94:	e59f3064 	ldr	r3, [pc, #100]	; 101d00 <prog+0x1cbc>
  101c98:	e5932000 	ldr	r2, [r3]
  101c9c:	e2865004 	add	r5, r6, #4	; 0x4
  101ca0:	e3520000 	cmp	r2, #0	; 0x0
  101ca4:	e1a00005 	mov	r0, r5
  101ca8:	e1a01004 	mov	r1, r4
  101cac:	159f0050 	ldrne	r0, [pc, #80]	; 101d04 <prog+0x1cc0>
  101cb0:	1a000009 	bne	101cdc <xTaskRemoveFromEventList+0x6c>
  101cb4:	ebfffde8 	bl	10145c <vListRemove>
  101cb8:	e59fe048 	ldr	lr, [pc, #72]	; 101d08 <prog+0x1cc4>
  101cbc:	e596c02c 	ldr	ip, [r6, #44]
  101cc0:	e59e2000 	ldr	r2, [lr]
  101cc4:	e59f0040 	ldr	r0, [pc, #64]	; 101d0c <prog+0x1cc8>
  101cc8:	e15c0002 	cmp	ip, r2
  101ccc:	e08c310c 	add	r3, ip, ip, lsl #2
  101cd0:	858ec000 	strhi	ip, [lr]
  101cd4:	e1a01005 	mov	r1, r5
  101cd8:	e0800103 	add	r0, r0, r3, lsl #2
  101cdc:	ebfffdb8 	bl	1013c4 <vListInsertEnd>
  101ce0:	e59f3028 	ldr	r3, [pc, #40]	; 101d10 <prog+0x1ccc>
  101ce4:	e5932000 	ldr	r2, [r3]
  101ce8:	e596102c 	ldr	r1, [r6, #44]
  101cec:	e592002c 	ldr	r0, [r2, #44]
  101cf0:	e1510000 	cmp	r1, r0
  101cf4:	33a00000 	movcc	r0, #0	; 0x0
  101cf8:	23a00001 	movcs	r0, #1	; 0x1
  101cfc:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101d00:	00200868 	eoreq	r0, r0, r8, ror #16
  101d04:	00200918 	eoreq	r0, r0, r8, lsl r9
  101d08:	0020086c 	eoreq	r0, r0, ip, ror #16
  101d0c:	00200884 	eoreq	r0, r0, r4, lsl #17
  101d10:	00200858 	eoreq	r0, r0, r8, asr r8

00101d14 <vTaskIncrementTick>:
  101d14:	e59f3144 	ldr	r3, [pc, #324]	; 101e60 <prog+0x1e1c>
  101d18:	e5932000 	ldr	r2, [r3]
  101d1c:	e3520000 	cmp	r2, #0	; 0x0
  101d20:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  101d24:	1a000039 	bne	101e10 <vTaskIncrementTick+0xfc>
  101d28:	e59f6134 	ldr	r6, [pc, #308]	; 101e64 <prog+0x1e20>
  101d2c:	e5963000 	ldr	r3, [r6]
  101d30:	e2833001 	add	r3, r3, #1	; 0x1
  101d34:	e5863000 	str	r3, [r6]
  101d38:	e5962000 	ldr	r2, [r6]
  101d3c:	e3520000 	cmp	r2, #0	; 0x0
  101d40:	e1a0c006 	mov	ip, r6
  101d44:	159fa11c 	ldrne	sl, [pc, #284]	; 101e68 <prog+0x1e24>
  101d48:	0a000035 	beq	101e24 <vTaskIncrementTick+0x110>
  101d4c:	e59a3000 	ldr	r3, [sl]
  101d50:	e5932000 	ldr	r2, [r3]
  101d54:	e3520000 	cmp	r2, #0	; 0x0
  101d58:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d5c:	e59f3104 	ldr	r3, [pc, #260]	; 101e68 <prog+0x1e24>
  101d60:	e5932000 	ldr	r2, [r3]
  101d64:	e592100c 	ldr	r1, [r2, #12]
  101d68:	e591300c 	ldr	r3, [r1, #12]
  101d6c:	e3530000 	cmp	r3, #0	; 0x0
  101d70:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d74:	e1a04003 	mov	r4, r3
  101d78:	e59c2000 	ldr	r2, [ip]
  101d7c:	e5933004 	ldr	r3, [r3, #4]
  101d80:	e1530002 	cmp	r3, r2
  101d84:	959f80e0 	ldrls	r8, [pc, #224]	; 101e6c <prog+0x1e28>
  101d88:	959f70e0 	ldrls	r7, [pc, #224]	; 101e70 <prog+0x1e2c>
  101d8c:	9a000004 	bls	101da4 <vTaskIncrementTick+0x90>
  101d90:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d94:	e5962000 	ldr	r2, [r6]
  101d98:	e5943004 	ldr	r3, [r4, #4]
  101d9c:	e1530002 	cmp	r3, r2
  101da0:	88bd85f0 	ldmhiia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101da4:	e2845004 	add	r5, r4, #4	; 0x4
  101da8:	e1a00005 	mov	r0, r5
  101dac:	ebfffdaa 	bl	10145c <vListRemove>
  101db0:	e5943028 	ldr	r3, [r4, #40]
  101db4:	e3530000 	cmp	r3, #0	; 0x0
  101db8:	e2840018 	add	r0, r4, #24	; 0x18
  101dbc:	1bfffda6 	blne	10145c <vListRemove>
  101dc0:	e594202c 	ldr	r2, [r4, #44]
  101dc4:	e5983000 	ldr	r3, [r8]
  101dc8:	e1520003 	cmp	r2, r3
  101dcc:	859f3098 	ldrhi	r3, [pc, #152]	; 101e6c <prog+0x1e28>
  101dd0:	e0820102 	add	r0, r2, r2, lsl #2
  101dd4:	85832000 	strhi	r2, [r3]
  101dd8:	e1a01005 	mov	r1, r5
  101ddc:	e0870100 	add	r0, r7, r0, lsl #2
  101de0:	ebfffd77 	bl	1013c4 <vListInsertEnd>
  101de4:	e59a3000 	ldr	r3, [sl]
  101de8:	e5932000 	ldr	r2, [r3]
  101dec:	e3520000 	cmp	r2, #0	; 0x0
  101df0:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101df4:	e59f306c 	ldr	r3, [pc, #108]	; 101e68 <prog+0x1e24>
  101df8:	e5932000 	ldr	r2, [r3]
  101dfc:	e592100c 	ldr	r1, [r2, #12]
  101e00:	e591300c 	ldr	r3, [r1, #12]
  101e04:	e2534000 	subs	r4, r3, #0	; 0x0
  101e08:	1affffe1 	bne	101d94 <vTaskIncrementTick+0x80>
  101e0c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101e10:	e59f205c 	ldr	r2, [pc, #92]	; 101e74 <prog+0x1e30>
  101e14:	e5923000 	ldr	r3, [r2]
  101e18:	e2833001 	add	r3, r3, #1	; 0x1
  101e1c:	e5823000 	str	r3, [r2]
  101e20:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101e24:	e59fa03c 	ldr	sl, [pc, #60]	; 101e68 <prog+0x1e24>
  101e28:	e59f1048 	ldr	r1, [pc, #72]	; 101e78 <prog+0x1e34>
  101e2c:	e59a0000 	ldr	r0, [sl]
  101e30:	e5913000 	ldr	r3, [r1]
  101e34:	e59f2040 	ldr	r2, [pc, #64]	; 101e7c <prog+0x1e38>
  101e38:	e58a3000 	str	r3, [sl]
  101e3c:	e5810000 	str	r0, [r1]
  101e40:	e5923000 	ldr	r3, [r2]
  101e44:	e2833001 	add	r3, r3, #1	; 0x1
  101e48:	e5823000 	str	r3, [r2]
  101e4c:	e59a3000 	ldr	r3, [sl]
  101e50:	e5932000 	ldr	r2, [r3]
  101e54:	e3520000 	cmp	r2, #0	; 0x0
  101e58:	1affffbf 	bne	101d5c <vTaskIncrementTick+0x48>
  101e5c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101e60:	00200868 	eoreq	r0, r0, r8, ror #16
  101e64:	00200864 	eoreq	r0, r0, r4, ror #16
  101e68:	00200910 	eoreq	r0, r0, r0, lsl r9
  101e6c:	0020086c 	eoreq	r0, r0, ip, ror #16
  101e70:	00200884 	eoreq	r0, r0, r4, lsl #17
  101e74:	00200870 	eoreq	r0, r0, r0, ror r8
  101e78:	00200914 	eoreq	r0, r0, r4, lsl r9
  101e7c:	00200860 	eoreq	r0, r0, r0, ror #16

00101e80 <vTaskPlaceOnEventList>:
  101e80:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  101e84:	e59f406c 	ldr	r4, [pc, #108]	; 101ef8 <prog+0x1eb4>
  101e88:	e5943000 	ldr	r3, [r4]
  101e8c:	e1a05001 	mov	r5, r1
  101e90:	e2831018 	add	r1, r3, #24	; 0x18
  101e94:	ebfffd57 	bl	1013f8 <vListInsert>
  101e98:	e5940000 	ldr	r0, [r4]
  101e9c:	e2800004 	add	r0, r0, #4	; 0x4
  101ea0:	ebfffd6d 	bl	10145c <vListRemove>
  101ea4:	e3750001 	cmn	r5, #1	; 0x1
  101ea8:	e59f004c 	ldr	r0, [pc, #76]	; 101efc <prog+0x1eb8>
  101eac:	e59f204c 	ldr	r2, [pc, #76]	; 101f00 <prog+0x1ebc>
  101eb0:	0a00000c 	beq	101ee8 <vTaskPlaceOnEventList+0x68>
  101eb4:	e5923000 	ldr	r3, [r2]
  101eb8:	e5941000 	ldr	r1, [r4]
  101ebc:	e5922000 	ldr	r2, [r2]
  101ec0:	e0853003 	add	r3, r5, r3
  101ec4:	e1530002 	cmp	r3, r2
  101ec8:	e5813004 	str	r3, [r1, #4]
  101ecc:	359f3030 	ldrcc	r3, [pc, #48]	; 101f04 <prog+0x1ec0>
  101ed0:	259f3030 	ldrcs	r3, [pc, #48]	; 101f08 <prog+0x1ec4>
  101ed4:	e5930000 	ldr	r0, [r3]
  101ed8:	e5941000 	ldr	r1, [r4]
  101edc:	e2811004 	add	r1, r1, #4	; 0x4
  101ee0:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  101ee4:	eafffd43 	b	1013f8 <vListInsert>
  101ee8:	e5941000 	ldr	r1, [r4]
  101eec:	e2811004 	add	r1, r1, #4	; 0x4
  101ef0:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  101ef4:	eafffd32 	b	1013c4 <vListInsertEnd>
  101ef8:	00200858 	eoreq	r0, r0, r8, asr r8
  101efc:	00200940 	eoreq	r0, r0, r0, asr #18
  101f00:	00200864 	eoreq	r0, r0, r4, ror #16
  101f04:	00200914 	eoreq	r0, r0, r4, lsl r9
  101f08:	00200910 	eoreq	r0, r0, r0, lsl r9

00101f0c <xTaskCreate>:
  101f0c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  101f10:	e1a02802 	mov	r2, r2, lsl #16
  101f14:	e1a0a000 	mov	sl, r0
  101f18:	e3a00044 	mov	r0, #68	; 0x44
  101f1c:	e1a05001 	mov	r5, r1
  101f20:	e1a08003 	mov	r8, r3
  101f24:	e1a07822 	mov	r7, r2, lsr #16
  101f28:	e59db024 	ldr	fp, [sp, #36]
  101f2c:	eb0002b1 	bl	1029f8 <pvPortMalloc>
  101f30:	e2506000 	subs	r6, r0, #0	; 0x0
  101f34:	02400001 	subeq	r0, r0, #1	; 0x1
  101f38:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  101f3c:	e1a04107 	mov	r4, r7, lsl #2
  101f40:	e1a00004 	mov	r0, r4
  101f44:	eb0002ab 	bl	1029f8 <pvPortMalloc>
  101f48:	e3500000 	cmp	r0, #0	; 0x0
  101f4c:	e5860030 	str	r0, [r6, #48]
  101f50:	0a00006b 	beq	102104 <xTaskCreate+0x1f8>
  101f54:	e1a02004 	mov	r2, r4
  101f58:	e3a010a5 	mov	r1, #165	; 0xa5
  101f5c:	ebfffa7a 	bl	10094c <memset>
  101f60:	e1a01005 	mov	r1, r5
  101f64:	e3a02010 	mov	r2, #16	; 0x10
  101f68:	e2860034 	add	r0, r6, #52	; 0x34
  101f6c:	ebfffac2 	bl	100a7c <strncpy>
  101f70:	e35b0004 	cmp	fp, #4	; 0x4
  101f74:	31a0400b 	movcc	r4, fp
  101f78:	23a04004 	movcs	r4, #4	; 0x4
  101f7c:	e3a03000 	mov	r3, #0	; 0x0
  101f80:	e2869004 	add	r9, r6, #4	; 0x4
  101f84:	e5c63043 	strb	r3, [r6, #67]
  101f88:	e586402c 	str	r4, [r6, #44]
  101f8c:	e1a00009 	mov	r0, r9
  101f90:	ebfffd08 	bl	1013b8 <vListInitialiseItem>
  101f94:	e2860018 	add	r0, r6, #24	; 0x18
  101f98:	ebfffd06 	bl	1013b8 <vListInitialiseItem>
  101f9c:	e5960030 	ldr	r0, [r6, #48]
  101fa0:	e2644005 	rsb	r4, r4, #5	; 0x5
  101fa4:	e0800107 	add	r0, r0, r7, lsl #2
  101fa8:	e1a0100a 	mov	r1, sl
  101fac:	e1a02008 	mov	r2, r8
  101fb0:	e5864018 	str	r4, [r6, #24]
  101fb4:	e5866010 	str	r6, [r6, #16]
  101fb8:	e5866024 	str	r6, [r6, #36]
  101fbc:	e2400004 	sub	r0, r0, #4	; 0x4
  101fc0:	eb000177 	bl	1025a4 <pxPortInitialiseStack>
  101fc4:	e5860000 	str	r0, [r6]
  101fc8:	eb00020c 	bl	102800 <vPortEnterCritical>
  101fcc:	e59f2140 	ldr	r2, [pc, #320]	; 102114 <prog+0x20d0>
  101fd0:	e5923000 	ldr	r3, [r2]
  101fd4:	e2833001 	add	r3, r3, #1	; 0x1
  101fd8:	e5823000 	str	r3, [r2]
  101fdc:	e5921000 	ldr	r1, [r2]
  101fe0:	e3510001 	cmp	r1, #1	; 0x1
  101fe4:	0a00002a 	beq	102094 <xTaskCreate+0x188>
  101fe8:	e59f7128 	ldr	r7, [pc, #296]	; 102118 <prog+0x20d4>
  101fec:	e5973000 	ldr	r3, [r7]
  101ff0:	e3530000 	cmp	r3, #0	; 0x0
  101ff4:	0a00001c 	beq	10206c <xTaskCreate+0x160>
  101ff8:	e59f811c 	ldr	r8, [pc, #284]	; 10211c <prog+0x20d8>
  101ffc:	e59f111c 	ldr	r1, [pc, #284]	; 102120 <prog+0x20dc>
  102000:	e596202c 	ldr	r2, [r6, #44]
  102004:	e5913000 	ldr	r3, [r1]
  102008:	e1520003 	cmp	r2, r3
  10200c:	85812000 	strhi	r2, [r1]
  102010:	e59f110c 	ldr	r1, [pc, #268]	; 102124 <prog+0x20e0>
  102014:	e5913000 	ldr	r3, [r1]
  102018:	e0820102 	add	r0, r2, r2, lsl #2
  10201c:	e1520003 	cmp	r2, r3
  102020:	85812000 	strhi	r2, [r1]
  102024:	e0880100 	add	r0, r8, r0, lsl #2
  102028:	e1a01009 	mov	r1, r9
  10202c:	ebfffce4 	bl	1013c4 <vListInsertEnd>
  102030:	eb0001fd 	bl	10282c <vPortExitCritical>
  102034:	e59d3028 	ldr	r3, [sp, #40]
  102038:	e3530000 	cmp	r3, #0	; 0x0
  10203c:	15836000 	strne	r6, [r3]
  102040:	e5973000 	ldr	r3, [r7]
  102044:	e3530000 	cmp	r3, #0	; 0x0
  102048:	0a00000f 	beq	10208c <xTaskCreate+0x180>
  10204c:	e59f30d4 	ldr	r3, [pc, #212]	; 102128 <prog+0x20e4>
  102050:	e5932000 	ldr	r2, [r3]
  102054:	e592102c 	ldr	r1, [r2, #44]
  102058:	e151000b 	cmp	r1, fp
  10205c:	2a00000a 	bcs	10208c <xTaskCreate+0x180>
  102060:	ef000000 	swi	0x00000000
  102064:	e3a00001 	mov	r0, #1	; 0x1
  102068:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10206c:	e59f10b4 	ldr	r1, [pc, #180]	; 102128 <prog+0x20e4>
  102070:	e5913000 	ldr	r3, [r1]
  102074:	e593202c 	ldr	r2, [r3, #44]
  102078:	e15b0002 	cmp	fp, r2
  10207c:	259f8098 	ldrcs	r8, [pc, #152]	; 10211c <prog+0x20d8>
  102080:	25816000 	strcs	r6, [r1]
  102084:	2affffdc 	bcs	101ffc <xTaskCreate+0xf0>
  102088:	eaffffda 	b	101ff8 <xTaskCreate+0xec>
  10208c:	e3a00001 	mov	r0, #1	; 0x1
  102090:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102094:	e59f308c 	ldr	r3, [pc, #140]	; 102128 <prog+0x20e4>
  102098:	e59f807c 	ldr	r8, [pc, #124]	; 10211c <prog+0x20d8>
  10209c:	e5836000 	str	r6, [r3]
  1020a0:	e1a04008 	mov	r4, r8
  1020a4:	e2885064 	add	r5, r8, #100	; 0x64
  1020a8:	e1a00004 	mov	r0, r4
  1020ac:	e2844014 	add	r4, r4, #20	; 0x14
  1020b0:	ebfffcb7 	bl	101394 <vListInitialise>
  1020b4:	e1540005 	cmp	r4, r5
  1020b8:	1afffffa 	bne	1020a8 <xTaskCreate+0x19c>
  1020bc:	e59f4068 	ldr	r4, [pc, #104]	; 10212c <prog+0x20e8>
  1020c0:	e59f5068 	ldr	r5, [pc, #104]	; 102130 <prog+0x20ec>
  1020c4:	e1a00004 	mov	r0, r4
  1020c8:	ebfffcb1 	bl	101394 <vListInitialise>
  1020cc:	e1a00005 	mov	r0, r5
  1020d0:	ebfffcaf 	bl	101394 <vListInitialise>
  1020d4:	e59f0058 	ldr	r0, [pc, #88]	; 102134 <prog+0x20f0>
  1020d8:	ebfffcad 	bl	101394 <vListInitialise>
  1020dc:	e59f0054 	ldr	r0, [pc, #84]	; 102138 <prog+0x20f4>
  1020e0:	ebfffcab 	bl	101394 <vListInitialise>
  1020e4:	e59f0050 	ldr	r0, [pc, #80]	; 10213c <prog+0x20f8>
  1020e8:	ebfffca9 	bl	101394 <vListInitialise>
  1020ec:	e59f7024 	ldr	r7, [pc, #36]	; 102118 <prog+0x20d4>
  1020f0:	e59f3048 	ldr	r3, [pc, #72]	; 102140 <prog+0x20fc>
  1020f4:	e59f2048 	ldr	r2, [pc, #72]	; 102144 <prog+0x2100>
  1020f8:	e5834000 	str	r4, [r3]
  1020fc:	e5825000 	str	r5, [r2]
  102100:	eaffffbd 	b	101ffc <xTaskCreate+0xf0>
  102104:	e1a00006 	mov	r0, r6
  102108:	eb000232 	bl	1029d8 <vPortFree>
  10210c:	e3e00000 	mvn	r0, #0	; 0x0
  102110:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102114:	00200874 	eoreq	r0, r0, r4, ror r8
  102118:	00200878 	eoreq	r0, r0, r8, ror r8
  10211c:	00200884 	eoreq	r0, r0, r4, lsl #17
  102120:	00200880 	eoreq	r0, r0, r0, lsl #17
  102124:	0020086c 	eoreq	r0, r0, ip, ror #16
  102128:	00200858 	eoreq	r0, r0, r8, asr r8
  10212c:	002008e8 	eoreq	r0, r0, r8, ror #17
  102130:	002008fc 	streqd	r0, [r0], -ip
  102134:	00200918 	eoreq	r0, r0, r8, lsl r9
  102138:	0020092c 	eoreq	r0, r0, ip, lsr #18
  10213c:	00200940 	eoreq	r0, r0, r0, asr #18
  102140:	00200910 	eoreq	r0, r0, r0, lsl r9
  102144:	00200914 	eoreq	r0, r0, r4, lsl r9

00102148 <vTaskStartScheduler>:
  102148:	e92d4010 	stmdb	sp!, {r4, lr}
  10214c:	e3a04000 	mov	r4, #0	; 0x0
  102150:	e24dd008 	sub	sp, sp, #8	; 0x8
  102154:	e59f1054 	ldr	r1, [pc, #84]	; 1021b0 <prog+0x216c>
  102158:	e3a0206e 	mov	r2, #110	; 0x6e
  10215c:	e1a03004 	mov	r3, r4
  102160:	e59f004c 	ldr	r0, [pc, #76]	; 1021b4 <prog+0x2170>
  102164:	e58d4000 	str	r4, [sp]
  102168:	e58d4004 	str	r4, [sp, #4]
  10216c:	ebffff66 	bl	101f0c <xTaskCreate>
  102170:	e3500001 	cmp	r0, #1	; 0x1
  102174:	0a000001 	beq	102180 <vTaskStartScheduler+0x38>
  102178:	e28dd008 	add	sp, sp, #8	; 0x8
  10217c:	e8bd8010 	ldmia	sp!, {r4, pc}
  102180:	e92d0001 	stmdb	sp!, {r0}
  102184:	e10f0000 	mrs	r0, CPSR
  102188:	e38000c0 	orr	r0, r0, #192	; 0xc0
  10218c:	e129f000 	msr	CPSR_fc, r0
  102190:	e8bd0001 	ldmia	sp!, {r0}
  102194:	e59f301c 	ldr	r3, [pc, #28]	; 1021b8 <prog+0x2174>
  102198:	e59f201c 	ldr	r2, [pc, #28]	; 1021bc <prog+0x2178>
  10219c:	e5830000 	str	r0, [r3]
  1021a0:	e5824000 	str	r4, [r2]
  1021a4:	e28dd008 	add	sp, sp, #8	; 0x8
  1021a8:	e8bd4010 	ldmia	sp!, {r4, lr}
  1021ac:	ea00016c 	b	102764 <xPortStartScheduler>
  1021b0:	0010391c 	andeqs	r3, r0, ip, lsl r9
  1021b4:	00102444 	andeqs	r2, r0, r4, asr #8
  1021b8:	00200878 	eoreq	r0, r0, r8, ror r8
  1021bc:	00200864 	eoreq	r0, r0, r4, ror #16

001021c0 <xTaskResumeAll>:
  1021c0:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1021c4:	e59fb248 	ldr	fp, [pc, #584]	; 102414 <prog+0x23d0>
  1021c8:	eb00018c 	bl	102800 <vPortEnterCritical>
  1021cc:	e59b3000 	ldr	r3, [fp]
  1021d0:	e2433001 	sub	r3, r3, #1	; 0x1
  1021d4:	e58b3000 	str	r3, [fp]
  1021d8:	e59b1000 	ldr	r1, [fp]
  1021dc:	e3510000 	cmp	r1, #0	; 0x0
  1021e0:	1a000006 	bne	102200 <xTaskResumeAll+0x40>
  1021e4:	e59f322c 	ldr	r3, [pc, #556]	; 102418 <prog+0x23d4>
  1021e8:	e5932000 	ldr	r2, [r3]
  1021ec:	e3520000 	cmp	r2, #0	; 0x0
  1021f0:	159f9224 	ldrne	r9, [pc, #548]	; 10241c <prog+0x23d8>
  1021f4:	11a06001 	movne	r6, r1
  1021f8:	11a0a009 	movne	sl, r9
  1021fc:	1a00001a 	bne	10226c <xTaskResumeAll+0xac>
  102200:	eb000189 	bl	10282c <vPortExitCritical>
  102204:	e3a04000 	mov	r4, #0	; 0x0
  102208:	e1a00004 	mov	r0, r4
  10220c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102210:	e599300c 	ldr	r3, [r9, #12]
  102214:	e593400c 	ldr	r4, [r3, #12]
  102218:	e3540000 	cmp	r4, #0	; 0x0
  10221c:	e2840018 	add	r0, r4, #24	; 0x18
  102220:	e2845004 	add	r5, r4, #4	; 0x4
  102224:	0a000015 	beq	102280 <xTaskResumeAll+0xc0>
  102228:	ebfffc8b 	bl	10145c <vListRemove>
  10222c:	e1a00005 	mov	r0, r5
  102230:	ebfffc89 	bl	10145c <vListRemove>
  102234:	e594202c 	ldr	r2, [r4, #44]
  102238:	e5973000 	ldr	r3, [r7]
  10223c:	e0820102 	add	r0, r2, r2, lsl #2
  102240:	e1520003 	cmp	r2, r3
  102244:	e1a01005 	mov	r1, r5
  102248:	e0880100 	add	r0, r8, r0, lsl #2
  10224c:	85872000 	strhi	r2, [r7]
  102250:	ebfffc5b 	bl	1013c4 <vListInsertEnd>
  102254:	e59f31c4 	ldr	r3, [pc, #452]	; 102420 <prog+0x23dc>
  102258:	e5932000 	ldr	r2, [r3]
  10225c:	e594102c 	ldr	r1, [r4, #44]
  102260:	e592302c 	ldr	r3, [r2, #44]
  102264:	e1510003 	cmp	r1, r3
  102268:	23a06001 	movcs	r6, #1	; 0x1
  10226c:	e59a3000 	ldr	r3, [sl]
  102270:	e3530000 	cmp	r3, #0	; 0x0
  102274:	e59f81a8 	ldr	r8, [pc, #424]	; 102424 <prog+0x23e0>
  102278:	e59f71a8 	ldr	r7, [pc, #424]	; 102428 <prog+0x23e4>
  10227c:	1affffe3 	bne	102210 <xTaskResumeAll+0x50>
  102280:	e59fa1a4 	ldr	sl, [pc, #420]	; 10242c <prog+0x23e8>
  102284:	e59a3000 	ldr	r3, [sl]
  102288:	e3530000 	cmp	r3, #0	; 0x0
  10228c:	0a000059 	beq	1023f8 <xTaskResumeAll+0x238>
  102290:	e59a3000 	ldr	r3, [sl]
  102294:	e3530000 	cmp	r3, #0	; 0x0
  102298:	0a00004e 	beq	1023d8 <xTaskResumeAll+0x218>
  10229c:	e59b3000 	ldr	r3, [fp]
  1022a0:	e3530000 	cmp	r3, #0	; 0x0
  1022a4:	159a3000 	ldrne	r3, [sl]
  1022a8:	12833001 	addne	r3, r3, #1	; 0x1
  1022ac:	158a3000 	strne	r3, [sl]
  1022b0:	1a000042 	bne	1023c0 <xTaskResumeAll+0x200>
  1022b4:	e59f6174 	ldr	r6, [pc, #372]	; 102430 <prog+0x23ec>
  1022b8:	e5963000 	ldr	r3, [r6]
  1022bc:	e2833001 	add	r3, r3, #1	; 0x1
  1022c0:	e5863000 	str	r3, [r6]
  1022c4:	e5962000 	ldr	r2, [r6]
  1022c8:	e3520000 	cmp	r2, #0	; 0x0
  1022cc:	e1a0c006 	mov	ip, r6
  1022d0:	159f915c 	ldrne	r9, [pc, #348]	; 102434 <prog+0x23f0>
  1022d4:	1a000009 	bne	102300 <xTaskResumeAll+0x140>
  1022d8:	e59f9154 	ldr	r9, [pc, #340]	; 102434 <prog+0x23f0>
  1022dc:	e59f1154 	ldr	r1, [pc, #340]	; 102438 <prog+0x23f4>
  1022e0:	e5990000 	ldr	r0, [r9]
  1022e4:	e5913000 	ldr	r3, [r1]
  1022e8:	e59f214c 	ldr	r2, [pc, #332]	; 10243c <prog+0x23f8>
  1022ec:	e5893000 	str	r3, [r9]
  1022f0:	e5810000 	str	r0, [r1]
  1022f4:	e5923000 	ldr	r3, [r2]
  1022f8:	e2833001 	add	r3, r3, #1	; 0x1
  1022fc:	e5823000 	str	r3, [r2]
  102300:	e5993000 	ldr	r3, [r9]
  102304:	e5932000 	ldr	r2, [r3]
  102308:	e3520000 	cmp	r2, #0	; 0x0
  10230c:	0a00002b 	beq	1023c0 <xTaskResumeAll+0x200>
  102310:	e59f311c 	ldr	r3, [pc, #284]	; 102434 <prog+0x23f0>
  102314:	e5932000 	ldr	r2, [r3]
  102318:	e592100c 	ldr	r1, [r2, #12]
  10231c:	e591300c 	ldr	r3, [r1, #12]
  102320:	e3530000 	cmp	r3, #0	; 0x0
  102324:	0a000025 	beq	1023c0 <xTaskResumeAll+0x200>
  102328:	e1a04003 	mov	r4, r3
  10232c:	e59c2000 	ldr	r2, [ip]
  102330:	e5933004 	ldr	r3, [r3, #4]
  102334:	e1530002 	cmp	r3, r2
  102338:	959f70e8 	ldrls	r7, [pc, #232]	; 102428 <prog+0x23e4>
  10233c:	959f80e0 	ldrls	r8, [pc, #224]	; 102424 <prog+0x23e0>
  102340:	9a00000a 	bls	102370 <xTaskResumeAll+0x1b0>
  102344:	ea00001d 	b	1023c0 <xTaskResumeAll+0x200>
  102348:	e59f30e4 	ldr	r3, [pc, #228]	; 102434 <prog+0x23f0>
  10234c:	e5932000 	ldr	r2, [r3]
  102350:	e592100c 	ldr	r1, [r2, #12]
  102354:	e591300c 	ldr	r3, [r1, #12]
  102358:	e2534000 	subs	r4, r3, #0	; 0x0
  10235c:	0a000017 	beq	1023c0 <xTaskResumeAll+0x200>
  102360:	e5962000 	ldr	r2, [r6]
  102364:	e5943004 	ldr	r3, [r4, #4]
  102368:	e1530002 	cmp	r3, r2
  10236c:	8a000013 	bhi	1023c0 <xTaskResumeAll+0x200>
  102370:	e2845004 	add	r5, r4, #4	; 0x4
  102374:	e1a00005 	mov	r0, r5
  102378:	ebfffc37 	bl	10145c <vListRemove>
  10237c:	e5943028 	ldr	r3, [r4, #40]
  102380:	e3530000 	cmp	r3, #0	; 0x0
  102384:	e2840018 	add	r0, r4, #24	; 0x18
  102388:	1bfffc33 	blne	10145c <vListRemove>
  10238c:	e594202c 	ldr	r2, [r4, #44]
  102390:	e5973000 	ldr	r3, [r7]
  102394:	e1520003 	cmp	r2, r3
  102398:	859f3088 	ldrhi	r3, [pc, #136]	; 102428 <prog+0x23e4>
  10239c:	e0820102 	add	r0, r2, r2, lsl #2
  1023a0:	85832000 	strhi	r2, [r3]
  1023a4:	e1a01005 	mov	r1, r5
  1023a8:	e0880100 	add	r0, r8, r0, lsl #2
  1023ac:	ebfffc04 	bl	1013c4 <vListInsertEnd>
  1023b0:	e5993000 	ldr	r3, [r9]
  1023b4:	e5932000 	ldr	r2, [r3]
  1023b8:	e3520000 	cmp	r2, #0	; 0x0
  1023bc:	1affffe1 	bne	102348 <xTaskResumeAll+0x188>
  1023c0:	e59a3000 	ldr	r3, [sl]
  1023c4:	e2433001 	sub	r3, r3, #1	; 0x1
  1023c8:	e58a3000 	str	r3, [sl]
  1023cc:	e59a2000 	ldr	r2, [sl]
  1023d0:	e3520000 	cmp	r2, #0	; 0x0
  1023d4:	1affffb0 	bne	10229c <xTaskResumeAll+0xdc>
  1023d8:	e59f2060 	ldr	r2, [pc, #96]	; 102440 <prog+0x23fc>
  1023dc:	e3a03000 	mov	r3, #0	; 0x0
  1023e0:	e5823000 	str	r3, [r2]
  1023e4:	ef000000 	swi	0x00000000
  1023e8:	eb00010f 	bl	10282c <vPortExitCritical>
  1023ec:	e3a04001 	mov	r4, #1	; 0x1
  1023f0:	e1a00004 	mov	r0, r4
  1023f4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1023f8:	e3560001 	cmp	r6, #1	; 0x1
  1023fc:	0afffff5 	beq	1023d8 <xTaskResumeAll+0x218>
  102400:	e59f2038 	ldr	r2, [pc, #56]	; 102440 <prog+0x23fc>
  102404:	e5923000 	ldr	r3, [r2]
  102408:	e3530001 	cmp	r3, #1	; 0x1
  10240c:	1affff7b 	bne	102200 <xTaskResumeAll+0x40>
  102410:	eafffff1 	b	1023dc <xTaskResumeAll+0x21c>
  102414:	00200868 	eoreq	r0, r0, r8, ror #16
  102418:	00200874 	eoreq	r0, r0, r4, ror r8
  10241c:	00200918 	eoreq	r0, r0, r8, lsl r9
  102420:	00200858 	eoreq	r0, r0, r8, asr r8
  102424:	00200884 	eoreq	r0, r0, r4, lsl #17
  102428:	0020086c 	eoreq	r0, r0, ip, ror #16
  10242c:	00200870 	eoreq	r0, r0, r0, ror r8
  102430:	00200864 	eoreq	r0, r0, r4, ror #16
  102434:	00200910 	eoreq	r0, r0, r0, lsl r9
  102438:	00200914 	eoreq	r0, r0, r4, lsl r9
  10243c:	00200860 	eoreq	r0, r0, r0, ror #16
  102440:	0020085c 	eoreq	r0, r0, ip, asr r8

00102444 <prvIdleTask>:
  102444:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  102448:	e59f50a0 	ldr	r5, [pc, #160]	; 1024f0 <prog+0x24ac>
  10244c:	e5953000 	ldr	r3, [r5]
  102450:	e59f709c 	ldr	r7, [pc, #156]	; 1024f4 <prog+0x24b0>
  102454:	e3530000 	cmp	r3, #0	; 0x0
  102458:	e59f8098 	ldr	r8, [pc, #152]	; 1024f8 <prog+0x24b4>
  10245c:	e59f6098 	ldr	r6, [pc, #152]	; 1024fc <prog+0x24b8>
  102460:	e287a008 	add	sl, r7, #8	; 0x8
  102464:	1a000007 	bne	102488 <prvIdleTask+0x44>
  102468:	e5963000 	ldr	r3, [r6]
  10246c:	e3530001 	cmp	r3, #1	; 0x1
  102470:	9a000000 	bls	102478 <prvIdleTask+0x34>
  102474:	ef000000 	swi	0x00000000
  102478:	ebfffaab 	bl	100f2c <vApplicationIdleHook>
  10247c:	e5953000 	ldr	r3, [r5]
  102480:	e3530000 	cmp	r3, #0	; 0x0
  102484:	0afffff7 	beq	102468 <prvIdleTask+0x24>
  102488:	ebfffdef 	bl	101c4c <vTaskSuspendAll>
  10248c:	e5974000 	ldr	r4, [r7]
  102490:	ebffff4a 	bl	1021c0 <xTaskResumeAll>
  102494:	e3540000 	cmp	r4, #0	; 0x0
  102498:	0afffff2 	beq	102468 <prvIdleTask+0x24>
  10249c:	eb0000d7 	bl	102800 <vPortEnterCritical>
  1024a0:	e59f304c 	ldr	r3, [pc, #76]	; 1024f4 <prog+0x24b0>
  1024a4:	e5932000 	ldr	r2, [r3]
  1024a8:	e3520000 	cmp	r2, #0	; 0x0
  1024ac:	159a3004 	ldrne	r3, [sl, #4]
  1024b0:	e1a04002 	mov	r4, r2
  1024b4:	1593400c 	ldrne	r4, [r3, #12]
  1024b8:	e2840004 	add	r0, r4, #4	; 0x4
  1024bc:	ebfffbe6 	bl	10145c <vListRemove>
  1024c0:	e5983000 	ldr	r3, [r8]
  1024c4:	e2433001 	sub	r3, r3, #1	; 0x1
  1024c8:	e5883000 	str	r3, [r8]
  1024cc:	e5952000 	ldr	r2, [r5]
  1024d0:	e2422001 	sub	r2, r2, #1	; 0x1
  1024d4:	e5852000 	str	r2, [r5]
  1024d8:	eb0000d3 	bl	10282c <vPortExitCritical>
  1024dc:	e5940030 	ldr	r0, [r4, #48]
  1024e0:	eb00013c 	bl	1029d8 <vPortFree>
  1024e4:	e1a00004 	mov	r0, r4
  1024e8:	eb00013a 	bl	1029d8 <vPortFree>
  1024ec:	eaffffdd 	b	102468 <prvIdleTask+0x24>
  1024f0:	0020087c 	eoreq	r0, r0, ip, ror r8
  1024f4:	0020092c 	eoreq	r0, r0, ip, lsr #18
  1024f8:	00200874 	eoreq	r0, r0, r4, ror r8
  1024fc:	00200884 	eoreq	r0, r0, r4, lsl #17

00102500 <vTaskDelay>:
  102500:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  102504:	e2505000 	subs	r5, r0, #0	; 0x0
  102508:	e59f6084 	ldr	r6, [pc, #132]	; 102594 <prog+0x2550>
  10250c:	e59f7084 	ldr	r7, [pc, #132]	; 102598 <prog+0x2554>
  102510:	1a000001 	bne	10251c <vTaskDelay+0x1c>
  102514:	ef000000 	swi	0x00000000
  102518:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10251c:	ebfffdca 	bl	101c4c <vTaskSuspendAll>
  102520:	e5974000 	ldr	r4, [r7]
  102524:	e5960000 	ldr	r0, [r6]
  102528:	e2800004 	add	r0, r0, #4	; 0x4
  10252c:	ebfffbca 	bl	10145c <vListRemove>
  102530:	e5962000 	ldr	r2, [r6]
  102534:	e5973000 	ldr	r3, [r7]
  102538:	e0854004 	add	r4, r5, r4
  10253c:	e1540003 	cmp	r4, r3
  102540:	e5824004 	str	r4, [r2, #4]
  102544:	2a000009 	bcs	102570 <vTaskDelay+0x70>
  102548:	e59f304c 	ldr	r3, [pc, #76]	; 10259c <prog+0x2558>
  10254c:	e5930000 	ldr	r0, [r3]
  102550:	e5961000 	ldr	r1, [r6]
  102554:	e2811004 	add	r1, r1, #4	; 0x4
  102558:	ebfffba6 	bl	1013f8 <vListInsert>
  10255c:	ebffff17 	bl	1021c0 <xTaskResumeAll>
  102560:	e3500000 	cmp	r0, #0	; 0x0
  102564:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
  102568:	ef000000 	swi	0x00000000
  10256c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  102570:	e59f3028 	ldr	r3, [pc, #40]	; 1025a0 <prog+0x255c>
  102574:	e5930000 	ldr	r0, [r3]
  102578:	e5961000 	ldr	r1, [r6]
  10257c:	e2811004 	add	r1, r1, #4	; 0x4
  102580:	ebfffb9c 	bl	1013f8 <vListInsert>
  102584:	ebffff0d 	bl	1021c0 <xTaskResumeAll>
  102588:	e3500000 	cmp	r0, #0	; 0x0
  10258c:	0afffff5 	beq	102568 <vTaskDelay+0x68>
  102590:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  102594:	00200858 	eoreq	r0, r0, r8, asr r8
  102598:	00200864 	eoreq	r0, r0, r4, ror #16
  10259c:	00200914 	eoreq	r0, r0, r4, lsl r9
  1025a0:	00200910 	eoreq	r0, r0, r0, lsl r9

001025a4 <pxPortInitialiseStack>:
  1025a4:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1025a8:	e2811004 	add	r1, r1, #4	; 0x4
  1025ac:	e1a0b000 	mov	fp, r0
  1025b0:	e40b1004 	str	r1, [fp], #-4
  1025b4:	e24b1004 	sub	r1, fp, #4	; 0x4
  1025b8:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  1025bc:	e2413004 	sub	r3, r1, #4	; 0x4
  1025c0:	e58d1004 	str	r1, [sp, #4]
  1025c4:	e2431004 	sub	r1, r3, #4	; 0x4
  1025c8:	e58d3008 	str	r3, [sp, #8]
  1025cc:	e2413004 	sub	r3, r1, #4	; 0x4
  1025d0:	e58d100c 	str	r1, [sp, #12]
  1025d4:	e2431004 	sub	r1, r3, #4	; 0x4
  1025d8:	e58d3010 	str	r3, [sp, #16]
  1025dc:	e2413004 	sub	r3, r1, #4	; 0x4
  1025e0:	e58d1014 	str	r1, [sp, #20]
  1025e4:	e2431004 	sub	r1, r3, #4	; 0x4
  1025e8:	e58d3018 	str	r3, [sp, #24]
  1025ec:	e2413004 	sub	r3, r1, #4	; 0x4
  1025f0:	e58d101c 	str	r1, [sp, #28]
  1025f4:	e2431004 	sub	r1, r3, #4	; 0x4
  1025f8:	e58d3020 	str	r3, [sp, #32]
  1025fc:	e2413004 	sub	r3, r1, #4	; 0x4
  102600:	e58d1024 	str	r1, [sp, #36]
  102604:	e2431004 	sub	r1, r3, #4	; 0x4
  102608:	e58d3028 	str	r3, [sp, #40]
  10260c:	e2413004 	sub	r3, r1, #4	; 0x4
  102610:	e58d102c 	str	r1, [sp, #44]
  102614:	e2431004 	sub	r1, r3, #4	; 0x4
  102618:	e58d1034 	str	r1, [sp, #52]
  10261c:	e58d3030 	str	r3, [sp, #48]
  102620:	e59d3034 	ldr	r3, [sp, #52]
  102624:	e2433004 	sub	r3, r3, #4	; 0x4
  102628:	e58d0000 	str	r0, [sp]
  10262c:	e58d3038 	str	r3, [sp, #56]
  102630:	e2430004 	sub	r0, r3, #4	; 0x4
  102634:	e3a03caa 	mov	r3, #43520	; 0xaa00
  102638:	e59d1000 	ldr	r1, [sp]
  10263c:	e28330aa 	add	r3, r3, #170	; 0xaa
  102640:	e1833803 	orr	r3, r3, r3, lsl #16
  102644:	e5013004 	str	r3, [r1, #-4]
  102648:	e3a03c12 	mov	r3, #4608	; 0x1200
  10264c:	e50b1004 	str	r1, [fp, #-4]
  102650:	e2833012 	add	r3, r3, #18	; 0x12
  102654:	e59d1004 	ldr	r1, [sp, #4]
  102658:	e1833803 	orr	r3, r3, r3, lsl #16
  10265c:	e3a09c11 	mov	r9, #4352	; 0x1100
  102660:	e3a0aa01 	mov	sl, #4096	; 0x1000
  102664:	e5013004 	str	r3, [r1, #-4]
  102668:	e2899011 	add	r9, r9, #17	; 0x11
  10266c:	e28d1008 	add	r1, sp, #8	; 0x8
  102670:	e891000a 	ldmia	r1, {r1, r3}
  102674:	e28aa010 	add	sl, sl, #16	; 0x10
  102678:	e1899809 	orr	r9, r9, r9, lsl #16
  10267c:	e18aa80a 	orr	sl, sl, sl, lsl #16
  102680:	e3a08c09 	mov	r8, #2304	; 0x900
  102684:	e3a07b02 	mov	r7, #2048	; 0x800
  102688:	e5019004 	str	r9, [r1, #-4]
  10268c:	e2888009 	add	r8, r8, #9	; 0x9
  102690:	e503a004 	str	sl, [r3, #-4]
  102694:	e28d1010 	add	r1, sp, #16	; 0x10
  102698:	e891000a 	ldmia	r1, {r1, r3}
  10269c:	e2877008 	add	r7, r7, #8	; 0x8
  1026a0:	e1888808 	orr	r8, r8, r8, lsl #16
  1026a4:	e1877807 	orr	r7, r7, r7, lsl #16
  1026a8:	e3a06c07 	mov	r6, #1792	; 0x700
  1026ac:	e3a05c06 	mov	r5, #1536	; 0x600
  1026b0:	e5018004 	str	r8, [r1, #-4]
  1026b4:	e2866007 	add	r6, r6, #7	; 0x7
  1026b8:	e5037004 	str	r7, [r3, #-4]
  1026bc:	e28d1018 	add	r1, sp, #24	; 0x18
  1026c0:	e891000a 	ldmia	r1, {r1, r3}
  1026c4:	e2855006 	add	r5, r5, #6	; 0x6
  1026c8:	e1866806 	orr	r6, r6, r6, lsl #16
  1026cc:	e1855805 	orr	r5, r5, r5, lsl #16
  1026d0:	e3a04c05 	mov	r4, #1280	; 0x500
  1026d4:	e5016004 	str	r6, [r1, #-4]
  1026d8:	e2844005 	add	r4, r4, #5	; 0x5
  1026dc:	e5035004 	str	r5, [r3, #-4]
  1026e0:	e59d1020 	ldr	r1, [sp, #32]
  1026e4:	e1844804 	orr	r4, r4, r4, lsl #16
  1026e8:	e3a0eb01 	mov	lr, #1024	; 0x400
  1026ec:	e3a0cc03 	mov	ip, #768	; 0x300
  1026f0:	e5014004 	str	r4, [r1, #-4]
  1026f4:	e59d3024 	ldr	r3, [sp, #36]
  1026f8:	e59d1028 	ldr	r1, [sp, #40]
  1026fc:	e28ee004 	add	lr, lr, #4	; 0x4
  102700:	e28cc003 	add	ip, ip, #3	; 0x3
  102704:	e18ee80e 	orr	lr, lr, lr, lsl #16
  102708:	e18cc80c 	orr	ip, ip, ip, lsl #16
  10270c:	e503e004 	str	lr, [r3, #-4]
  102710:	e501c004 	str	ip, [r1, #-4]
  102714:	e3a01c02 	mov	r1, #512	; 0x200
  102718:	e59d302c 	ldr	r3, [sp, #44]
  10271c:	e2811002 	add	r1, r1, #2	; 0x2
  102720:	e1811801 	orr	r1, r1, r1, lsl #16
  102724:	e5031004 	str	r1, [r3, #-4]
  102728:	e3a01c01 	mov	r1, #256	; 0x100
  10272c:	e59d3030 	ldr	r3, [sp, #48]
  102730:	e2811001 	add	r1, r1, #1	; 0x1
  102734:	e1811801 	orr	r1, r1, r1, lsl #16
  102738:	e5031004 	str	r1, [r3, #-4]
  10273c:	e59d3034 	ldr	r3, [sp, #52]
  102740:	e59d1038 	ldr	r1, [sp, #56]
  102744:	e5032004 	str	r2, [r3, #-4]
  102748:	e3a0301f 	mov	r3, #31	; 0x1f
  10274c:	e3a02000 	mov	r2, #0	; 0x0
  102750:	e5013004 	str	r3, [r1, #-4]
  102754:	e5002004 	str	r2, [r0, #-4]
  102758:	e2400004 	sub	r0, r0, #4	; 0x4
  10275c:	e28dd03c 	add	sp, sp, #60	; 0x3c
  102760:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00102764 <xPortStartScheduler>:
  102764:	e52de004 	str	lr, [sp, #-4]!
  102768:	e3a01007 	mov	r1, #7	; 0x7
  10276c:	e3a02000 	mov	r2, #0	; 0x0
  102770:	e59f3030 	ldr	r3, [pc, #48]	; 1027a8 <prog+0x2764>
  102774:	e3a00001 	mov	r0, #1	; 0x1
  102778:	ebfffaf7 	bl	10135c <AT91F_AIC_ConfigureIt>
  10277c:	e3a03403 	mov	r3, #50331648	; 0x3000000
  102780:	e2833ebb 	add	r3, r3, #2992	; 0xbb0
  102784:	e3e02c02 	mvn	r2, #512	; 0x200
  102788:	e2833003 	add	r3, r3, #3	; 0x3
  10278c:	e50230cf 	str	r3, [r2, #-207]
  102790:	e3a01002 	mov	r1, #2	; 0x2
  102794:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  102798:	e5831021 	str	r1, [r3, #33]
  10279c:	eb000002 	bl	1027ac <vPortISRStartFirstTask>
  1027a0:	e3a00000 	mov	r0, #0	; 0x0
  1027a4:	e49df004 	ldr	pc, [sp], #4
  1027a8:	00102870 	andeqs	r2, r0, r0, ror r8

001027ac <vPortISRStartFirstTask>:
  1027ac:	e59f0044 	ldr	r0, [pc, #68]	; 1027f8 <prog+0x27b4>
  1027b0:	e5900000 	ldr	r0, [r0]
  1027b4:	e590e000 	ldr	lr, [r0]
  1027b8:	e59f003c 	ldr	r0, [pc, #60]	; 1027fc <prog+0x27b8>
  1027bc:	e8be0002 	ldmia	lr!, {r1}
  1027c0:	e5801000 	str	r1, [r0]
  1027c4:	e8be0001 	ldmia	lr!, {r0}
  1027c8:	e169f000 	msr	SPSR_fc, r0
  1027cc:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1027d0:	e1a00000 	nop			(mov r0,r0)
  1027d4:	e59ee03c 	ldr	lr, [lr, #60]
  1027d8:	e25ef004 	subs	pc, lr, #4	; 0x4
  1027dc:	e59f300c 	ldr	r3, [pc, #12]	; 1027f0 <prog+0x27ac>
  1027e0:	e59f200c 	ldr	r2, [pc, #12]	; 1027f4 <prog+0x27b0>
  1027e4:	e5931000 	ldr	r1, [r3]
  1027e8:	e5923000 	ldr	r3, [r2]
  1027ec:	e12fff1e 	bx	lr
  1027f0:	00200814 	eoreq	r0, r0, r4, lsl r8
  1027f4:	00200858 	eoreq	r0, r0, r8, asr r8
  1027f8:	00200858 	eoreq	r0, r0, r8, asr r8
  1027fc:	00200814 	eoreq	r0, r0, r4, lsl r8

00102800 <vPortEnterCritical>:
  102800:	e92d0001 	stmdb	sp!, {r0}
  102804:	e10f0000 	mrs	r0, CPSR
  102808:	e38000c0 	orr	r0, r0, #192	; 0xc0
  10280c:	e129f000 	msr	CPSR_fc, r0
  102810:	e8bd0001 	ldmia	sp!, {r0}
  102814:	e59f200c 	ldr	r2, [pc, #12]	; 102828 <prog+0x27e4>
  102818:	e5923000 	ldr	r3, [r2]
  10281c:	e2833001 	add	r3, r3, #1	; 0x1
  102820:	e5823000 	str	r3, [r2]
  102824:	e12fff1e 	bx	lr
  102828:	00200814 	eoreq	r0, r0, r4, lsl r8

0010282c <vPortExitCritical>:
  10282c:	e59f2038 	ldr	r2, [pc, #56]	; 10286c <prog+0x2828>
  102830:	e5923000 	ldr	r3, [r2]
  102834:	e3530000 	cmp	r3, #0	; 0x0
  102838:	012fff1e 	bxeq	lr
  10283c:	e5923000 	ldr	r3, [r2]
  102840:	e2433001 	sub	r3, r3, #1	; 0x1
  102844:	e5823000 	str	r3, [r2]
  102848:	e5922000 	ldr	r2, [r2]
  10284c:	e3520000 	cmp	r2, #0	; 0x0
  102850:	112fff1e 	bxne	lr
  102854:	e92d0001 	stmdb	sp!, {r0}
  102858:	e10f0000 	mrs	r0, CPSR
  10285c:	e3c000c0 	bic	r0, r0, #192	; 0xc0
  102860:	e129f000 	msr	CPSR_fc, r0
  102864:	e8bd0001 	ldmia	sp!, {r0}
  102868:	e12fff1e 	bx	lr
  10286c:	00200814 	eoreq	r0, r0, r4, lsl r8

00102870 <vPreemptiveTick>:
  102870:	e92d0001 	stmdb	sp!, {r0}
  102874:	e94d2000 	stmdb	sp, {sp}^
  102878:	e1a00000 	nop			(mov r0,r0)
  10287c:	e24dd004 	sub	sp, sp, #4	; 0x4
  102880:	e8bd0001 	ldmia	sp!, {r0}
  102884:	e9204000 	stmdb	r0!, {lr}
  102888:	e1a0e000 	mov	lr, r0
  10288c:	e8bd0001 	ldmia	sp!, {r0}
  102890:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  102894:	e1a00000 	nop			(mov r0,r0)
  102898:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10289c:	e14f0000 	mrs	r0, SPSR
  1028a0:	e92e0001 	stmdb	lr!, {r0}
  1028a4:	e59f0078 	ldr	r0, [pc, #120]	; 102924 <prog+0x28e0>
  1028a8:	e5900000 	ldr	r0, [r0]
  1028ac:	e92e0001 	stmdb	lr!, {r0}
  1028b0:	e59f0070 	ldr	r0, [pc, #112]	; 102928 <prog+0x28e4>
  1028b4:	e5900000 	ldr	r0, [r0]
  1028b8:	e580e000 	str	lr, [r0]
  1028bc:	e59f4058 	ldr	r4, [pc, #88]	; 10291c <prog+0x28d8>
  1028c0:	e59f5058 	ldr	r5, [pc, #88]	; 102920 <prog+0x28dc>
  1028c4:	e5943000 	ldr	r3, [r4]
  1028c8:	e5952000 	ldr	r2, [r5]
  1028cc:	ebfffd10 	bl	101d14 <vTaskIncrementTick>
  1028d0:	ebfffc77 	bl	101ab4 <vTaskSwitchContext>
  1028d4:	e3e03c02 	mvn	r3, #512	; 0x200
  1028d8:	e51310c7 	ldr	r1, [r3, #-199]
  1028dc:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  1028e0:	e5821031 	str	r1, [r2, #49]
  1028e4:	e59f003c 	ldr	r0, [pc, #60]	; 102928 <prog+0x28e4>
  1028e8:	e5900000 	ldr	r0, [r0]
  1028ec:	e590e000 	ldr	lr, [r0]
  1028f0:	e59f002c 	ldr	r0, [pc, #44]	; 102924 <prog+0x28e0>
  1028f4:	e8be0002 	ldmia	lr!, {r1}
  1028f8:	e5801000 	str	r1, [r0]
  1028fc:	e8be0001 	ldmia	lr!, {r0}
  102900:	e169f000 	msr	SPSR_fc, r0
  102904:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  102908:	e1a00000 	nop			(mov r0,r0)
  10290c:	e59ee03c 	ldr	lr, [lr, #60]
  102910:	e25ef004 	subs	pc, lr, #4	; 0x4
  102914:	e5943000 	ldr	r3, [r4]
  102918:	e5952000 	ldr	r2, [r5]
  10291c:	00200814 	eoreq	r0, r0, r4, lsl r8
  102920:	00200858 	eoreq	r0, r0, r8, asr r8
  102924:	00200814 	eoreq	r0, r0, r4, lsl r8
  102928:	00200858 	eoreq	r0, r0, r8, asr r8

0010292c <swi_handler>:
  10292c:	e28ee004 	add	lr, lr, #4	; 0x4
  102930:	e92d0001 	stmdb	sp!, {r0}
  102934:	e94d2000 	stmdb	sp, {sp}^
  102938:	e1a00000 	nop			(mov r0,r0)
  10293c:	e24dd004 	sub	sp, sp, #4	; 0x4
  102940:	e8bd0001 	ldmia	sp!, {r0}
  102944:	e9204000 	stmdb	r0!, {lr}
  102948:	e1a0e000 	mov	lr, r0
  10294c:	e8bd0001 	ldmia	sp!, {r0}
  102950:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  102954:	e1a00000 	nop			(mov r0,r0)
  102958:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10295c:	e14f0000 	mrs	r0, SPSR
  102960:	e92e0001 	stmdb	lr!, {r0}
  102964:	e59f0064 	ldr	r0, [pc, #100]	; 1029d0 <prog+0x298c>
  102968:	e5900000 	ldr	r0, [r0]
  10296c:	e92e0001 	stmdb	lr!, {r0}
  102970:	e59f005c 	ldr	r0, [pc, #92]	; 1029d4 <prog+0x2990>
  102974:	e5900000 	ldr	r0, [r0]
  102978:	e580e000 	str	lr, [r0]
  10297c:	e59f4044 	ldr	r4, [pc, #68]	; 1029c8 <prog+0x2984>
  102980:	e59f5044 	ldr	r5, [pc, #68]	; 1029cc <prog+0x2988>
  102984:	e5943000 	ldr	r3, [r4]
  102988:	e5952000 	ldr	r2, [r5]
  10298c:	ebfffc48 	bl	101ab4 <vTaskSwitchContext>
  102990:	e59f003c 	ldr	r0, [pc, #60]	; 1029d4 <prog+0x2990>
  102994:	e5900000 	ldr	r0, [r0]
  102998:	e590e000 	ldr	lr, [r0]
  10299c:	e59f002c 	ldr	r0, [pc, #44]	; 1029d0 <prog+0x298c>
  1029a0:	e8be0002 	ldmia	lr!, {r1}
  1029a4:	e5801000 	str	r1, [r0]
  1029a8:	e8be0001 	ldmia	lr!, {r0}
  1029ac:	e169f000 	msr	SPSR_fc, r0
  1029b0:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1029b4:	e1a00000 	nop			(mov r0,r0)
  1029b8:	e59ee03c 	ldr	lr, [lr, #60]
  1029bc:	e25ef004 	subs	pc, lr, #4	; 0x4
  1029c0:	e5943000 	ldr	r3, [r4]
  1029c4:	e5952000 	ldr	r2, [r5]
  1029c8:	00200814 	eoreq	r0, r0, r4, lsl r8
  1029cc:	00200858 	eoreq	r0, r0, r8, asr r8
  1029d0:	00200814 	eoreq	r0, r0, r4, lsl r8
  1029d4:	00200858 	eoreq	r0, r0, r8, asr r8

001029d8 <vPortFree>:
  1029d8:	e92d4010 	stmdb	sp!, {r4, lr}
  1029dc:	e2504000 	subs	r4, r0, #0	; 0x0
  1029e0:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1029e4:	ebfffc98 	bl	101c4c <vTaskSuspendAll>
  1029e8:	e1a00004 	mov	r0, r4
  1029ec:	ebfff5c8 	bl	100114 <free>
  1029f0:	e8bd4010 	ldmia	sp!, {r4, lr}
  1029f4:	eafffdf1 	b	1021c0 <xTaskResumeAll>

001029f8 <pvPortMalloc>:
  1029f8:	e92d4010 	stmdb	sp!, {r4, lr}
  1029fc:	e1a04000 	mov	r4, r0
  102a00:	ebfffc91 	bl	101c4c <vTaskSuspendAll>
  102a04:	e1a00004 	mov	r0, r4
  102a08:	ebfff5c6 	bl	100128 <malloc>
  102a0c:	e1a04000 	mov	r4, r0
  102a10:	ebfffdea 	bl	1021c0 <xTaskResumeAll>
  102a14:	e1a00004 	mov	r0, r4
  102a18:	e8bd8010 	ldmia	sp!, {r4, pc}

00102a1c <vDetachUSBInterface>:
  102a1c:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  102a20:	e3a03801 	mov	r3, #65536	; 0x10000
  102a24:	e50230ff 	str	r3, [r2, #-255]
  102a28:	e50230ef 	str	r3, [r2, #-239]
  102a2c:	e50230cf 	str	r3, [r2, #-207]
  102a30:	e12fff1e 	bx	lr

00102a34 <vUSBRecvByte>:
  102a34:	e3500000 	cmp	r0, #0	; 0x0
  102a38:	13510000 	cmpne	r1, #0	; 0x0
  102a3c:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  102a40:	e1a04000 	mov	r4, r0
  102a44:	e1a07002 	mov	r7, r2
  102a48:	c3a00000 	movgt	r0, #0	; 0x0
  102a4c:	d3a00001 	movle	r0, #1	; 0x1
  102a50:	da000015 	ble	102aac <vUSBRecvByte+0x78>
  102a54:	e59f805c 	ldr	r8, [pc, #92]	; 102ab8 <prog+0x2a74>
  102a58:	e5983000 	ldr	r3, [r8]
  102a5c:	e3530000 	cmp	r3, #0	; 0x0
  102a60:	0a000011 	beq	102aac <vUSBRecvByte+0x78>
  102a64:	e3510000 	cmp	r1, #0	; 0x0
  102a68:	11a05000 	movne	r5, r0
  102a6c:	11a06001 	movne	r6, r1
  102a70:	1a000003 	bne	102a84 <vUSBRecvByte+0x50>
  102a74:	ea00000c 	b	102aac <vUSBRecvByte+0x78>
  102a78:	e2855001 	add	r5, r5, #1	; 0x1
  102a7c:	e1560005 	cmp	r6, r5
  102a80:	0a000007 	beq	102aa4 <vUSBRecvByte+0x70>
  102a84:	e1a01004 	mov	r1, r4
  102a88:	e5980000 	ldr	r0, [r8]
  102a8c:	e1a02007 	mov	r2, r7
  102a90:	e3a03000 	mov	r3, #0	; 0x0
  102a94:	ebfffb1d 	bl	101710 <xQueueGenericReceive>
  102a98:	e3500000 	cmp	r0, #0	; 0x0
  102a9c:	e2844001 	add	r4, r4, #1	; 0x1
  102aa0:	1afffff4 	bne	102a78 <vUSBRecvByte+0x44>
  102aa4:	e1a00005 	mov	r0, r5
  102aa8:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  102aac:	e3a05000 	mov	r5, #0	; 0x0
  102ab0:	e1a00005 	mov	r0, r5
  102ab4:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  102ab8:	00200a78 	eoreq	r0, r0, r8, ror sl

00102abc <usb_send_buffer_zero_copy>:
  102abc:	e52de004 	str	lr, [sp, #-4]!
  102ac0:	e24dd014 	sub	sp, sp, #20	; 0x14
  102ac4:	e58d3010 	str	r3, [sp, #16]
  102ac8:	e59f3028 	ldr	r3, [pc, #40]	; 102af8 <prog+0x2ab4>
  102acc:	e3a0c000 	mov	ip, #0	; 0x0
  102ad0:	e88d0003 	stmia	sp, {r0, r1}
  102ad4:	e58d200c 	str	r2, [sp, #12]
  102ad8:	e5930000 	ldr	r0, [r3]
  102adc:	e1a0100d 	mov	r1, sp
  102ae0:	e1a0300c 	mov	r3, ip
  102ae4:	e59d2018 	ldr	r2, [sp, #24]
  102ae8:	e58dc008 	str	ip, [sp, #8]
  102aec:	ebfffb6d 	bl	1018a8 <xQueueGenericSend>
  102af0:	e28dd014 	add	sp, sp, #20	; 0x14
  102af4:	e8bd8000 	ldmia	sp!, {pc}
  102af8:	00200a80 	eoreq	r0, r0, r0, lsl #21

00102afc <prvSendStall>:
  102afc:	e52de004 	str	lr, [sp, #-4]!
  102b00:	ebffff3e 	bl	102800 <vPortEnterCritical>
  102b04:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  102b08:	e5123fcf 	ldr	r3, [r2, #-4047]
  102b0c:	e3c33030 	bic	r3, r3, #48	; 0x30
  102b10:	e383306f 	orr	r3, r3, #111	; 0x6f
  102b14:	e5023fcf 	str	r3, [r2, #-4047]
  102b18:	e49de004 	ldr	lr, [sp], #4
  102b1c:	eaffff42 	b	10282c <vPortExitCritical>

00102b20 <prvSendZLP>:
  102b20:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  102b24:	e5123fcf 	ldr	r3, [r2, #-4047]
  102b28:	e3130010 	tst	r3, #16	; 0x10
  102b2c:	e92d4010 	stmdb	sp!, {r4, lr}
  102b30:	0a000005 	beq	102b4c <prvSendZLP+0x2c>
  102b34:	e1a04002 	mov	r4, r2
  102b38:	e3a00001 	mov	r0, #1	; 0x1
  102b3c:	ebfffe6f 	bl	102500 <vTaskDelay>
  102b40:	e5143fcf 	ldr	r3, [r4, #-4047]
  102b44:	e3130010 	tst	r3, #16	; 0x10
  102b48:	1afffffa 	bne	102b38 <prvSendZLP+0x18>
  102b4c:	ebffff2b 	bl	102800 <vPortEnterCritical>
  102b50:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  102b54:	e59f101c 	ldr	r1, [pc, #28]	; 102b78 <prog+0x2b34>
  102b58:	e5103fcf 	ldr	r3, [r0, #-4047]
  102b5c:	e5912080 	ldr	r2, [r1, #128]
  102b60:	e3c33030 	bic	r3, r3, #48	; 0x30
  102b64:	e383305f 	orr	r3, r3, #95	; 0x5f
  102b68:	e5812084 	str	r2, [r1, #132]
  102b6c:	e5003fcf 	str	r3, [r0, #-4047]
  102b70:	e8bd4010 	ldmia	sp!, {r4, lr}
  102b74:	eaffff2c 	b	10282c <vPortExitCritical>
  102b78:	00200968 	eoreq	r0, r0, r8, ror #18

00102b7c <prvSendNextSegment>:
  102b7c:	e92d4010 	stmdb	sp!, {r4, lr}
  102b80:	e59f40e4 	ldr	r4, [pc, #228]	; 102c6c <prog+0x2c28>
  102b84:	e5942084 	ldr	r2, [r4, #132]
  102b88:	e5943080 	ldr	r3, [r4, #128]
  102b8c:	e1520003 	cmp	r2, r3
  102b90:	e24dd00c 	sub	sp, sp, #12	; 0xc
  102b94:	9a00002a 	bls	102c44 <prvSendNextSegment+0xc8>
  102b98:	e0633002 	rsb	r3, r3, r2
  102b9c:	e58d3000 	str	r3, [sp]
  102ba0:	e59d2000 	ldr	r2, [sp]
  102ba4:	e3520008 	cmp	r2, #8	; 0x8
  102ba8:	959d3000 	ldrls	r3, [sp]
  102bac:	83a03008 	movhi	r3, #8	; 0x8
  102bb0:	858d3008 	strhi	r3, [sp, #8]
  102bb4:	958d3008 	strls	r3, [sp, #8]
  102bb8:	ea000001 	b	102bc4 <prvSendNextSegment+0x48>
  102bbc:	e3a00001 	mov	r0, #1	; 0x1
  102bc0:	ebfffe4e 	bl	102500 <vTaskDelay>
  102bc4:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  102bc8:	e5132fcf 	ldr	r2, [r3, #-4047]
  102bcc:	e3120010 	tst	r2, #16	; 0x10
  102bd0:	1afffff9 	bne	102bbc <prvSendNextSegment+0x40>
  102bd4:	e59d3008 	ldr	r3, [sp, #8]
  102bd8:	e3530000 	cmp	r3, #0	; 0x0
  102bdc:	0a00000b 	beq	102c10 <prvSendNextSegment+0x94>
  102be0:	e5941080 	ldr	r1, [r4, #128]
  102be4:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  102be8:	e7d43001 	ldrb	r3, [r4, r1]
  102bec:	e5003faf 	str	r3, [r0, #-4015]
  102bf0:	e59d2008 	ldr	r2, [sp, #8]
  102bf4:	e2422001 	sub	r2, r2, #1	; 0x1
  102bf8:	e58d2008 	str	r2, [sp, #8]
  102bfc:	e59d3008 	ldr	r3, [sp, #8]
  102c00:	e3530000 	cmp	r3, #0	; 0x0
  102c04:	e2811001 	add	r1, r1, #1	; 0x1
  102c08:	1afffff6 	bne	102be8 <prvSendNextSegment+0x6c>
  102c0c:	e5841080 	str	r1, [r4, #128]
  102c10:	ebfffefa 	bl	102800 <vPortEnterCritical>
  102c14:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  102c18:	e5112fcf 	ldr	r2, [r1, #-4047]
  102c1c:	e58d2004 	str	r2, [sp, #4]
  102c20:	e59d3004 	ldr	r3, [sp, #4]
  102c24:	e3c33030 	bic	r3, r3, #48	; 0x30
  102c28:	e383305f 	orr	r3, r3, #95	; 0x5f
  102c2c:	e58d3004 	str	r3, [sp, #4]
  102c30:	e59d2004 	ldr	r2, [sp, #4]
  102c34:	e5012fcf 	str	r2, [r1, #-4047]
  102c38:	e28dd00c 	add	sp, sp, #12	; 0xc
  102c3c:	e8bd4010 	ldmia	sp!, {r4, lr}
  102c40:	eafffef9 	b	10282c <vPortExitCritical>
  102c44:	e59f4024 	ldr	r4, [pc, #36]	; 102c70 <prog+0x2c2c>
  102c48:	e5943000 	ldr	r3, [r4]
  102c4c:	e3530004 	cmp	r3, #4	; 0x4
  102c50:	0a000001 	beq	102c5c <prvSendNextSegment+0xe0>
  102c54:	e28dd00c 	add	sp, sp, #12	; 0xc
  102c58:	e8bd8010 	ldmia	sp!, {r4, pc}
  102c5c:	ebffffaf 	bl	102b20 <prvSendZLP>
  102c60:	e3a03000 	mov	r3, #0	; 0x0
  102c64:	e5843000 	str	r3, [r4]
  102c68:	eafffff9 	b	102c54 <prvSendNextSegment+0xd8>
  102c6c:	00200968 	eoreq	r0, r0, r8, ror #18
  102c70:	00200958 	eoreq	r0, r0, r8, asr r9

00102c74 <prvSendControlData>:
  102c74:	e1a01801 	mov	r1, r1, lsl #16
  102c78:	e1a01821 	mov	r1, r1, lsr #16
  102c7c:	e1510002 	cmp	r1, r2
  102c80:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102c84:	e1a05002 	mov	r5, r2
  102c88:	93a02000 	movls	r2, #0	; 0x0
  102c8c:	83a02001 	movhi	r2, #1	; 0x1
  102c90:	31a05001 	movcc	r5, r1
  102c94:	3a000008 	bcc	102cbc <prvSendControlData+0x48>
  102c98:	e3530000 	cmp	r3, #0	; 0x0
  102c9c:	03a03000 	moveq	r3, #0	; 0x0
  102ca0:	12023001 	andne	r3, r2, #1	; 0x1
  102ca4:	e3530000 	cmp	r3, #0	; 0x0
  102ca8:	0a000003 	beq	102cbc <prvSendControlData+0x48>
  102cac:	e3150007 	tst	r5, #7	; 0x7
  102cb0:	059f302c 	ldreq	r3, [pc, #44]	; 102ce4 <prog+0x2ca0>
  102cb4:	03a02004 	moveq	r2, #4	; 0x4
  102cb8:	05832000 	streq	r2, [r3]
  102cbc:	e59f4024 	ldr	r4, [pc, #36]	; 102ce8 <prog+0x2ca4>
  102cc0:	e1a01000 	mov	r1, r0
  102cc4:	e1a02005 	mov	r2, r5
  102cc8:	e1a00004 	mov	r0, r4
  102ccc:	ebfff6f6 	bl	1008ac <memcpy>
  102cd0:	e3a03000 	mov	r3, #0	; 0x0
  102cd4:	e5843080 	str	r3, [r4, #128]
  102cd8:	e5845084 	str	r5, [r4, #132]
  102cdc:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  102ce0:	eaffffa5 	b	102b7c <prvSendNextSegment>
  102ce4:	00200958 	eoreq	r0, r0, r8, asr r9
  102ce8:	00200968 	eoreq	r0, r0, r8, ror #18

00102cec <vUSBCDCTask>:
  102cec:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  102cf0:	e59fc964 	ldr	ip, [pc, #2404]	; 10365c <prog+0x3618>
  102cf4:	e24dd028 	sub	sp, sp, #40	; 0x28
  102cf8:	e59c4010 	ldr	r4, [ip, #16]
  102cfc:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  102d00:	e28dc004 	add	ip, sp, #4	; 0x4
  102d04:	e58dc000 	str	ip, [sp]
  102d08:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
  102d0c:	e58d4014 	str	r4, [sp, #20]
  102d10:	ebfffeba 	bl	102800 <vPortEnterCritical>
  102d14:	ebffff40 	bl	102a1c <vDetachUSBInterface>
  102d18:	ebfffec3 	bl	10282c <vPortExitCritical>
  102d1c:	e3a0003c 	mov	r0, #60	; 0x3c
  102d20:	ebfffdf6 	bl	102500 <vTaskDelay>
  102d24:	ebfffeb5 	bl	102800 <vPortEnterCritical>
  102d28:	e3a00004 	mov	r0, #4	; 0x4
  102d2c:	e1a01000 	mov	r1, r0
  102d30:	ebfffb36 	bl	101a10 <xQueueCreate>
  102d34:	e59f1924 	ldr	r1, [pc, #2340]	; 103660 <prog+0x361c>
  102d38:	e5810000 	str	r0, [r1]
  102d3c:	e3a01001 	mov	r1, #1	; 0x1
  102d40:	e3a00b01 	mov	r0, #1024	; 0x400
  102d44:	ebfffb31 	bl	101a10 <xQueueCreate>
  102d48:	e59fb914 	ldr	fp, [pc, #2324]	; 103664 <prog+0x3620>
  102d4c:	e3a01005 	mov	r1, #5	; 0x5
  102d50:	e58b0000 	str	r0, [fp]
  102d54:	e3a000cd 	mov	r0, #205	; 0xcd
  102d58:	ebfffb2c 	bl	101a10 <xQueueCreate>
  102d5c:	e59f2904 	ldr	r2, [pc, #2308]	; 103668 <prog+0x3624>
  102d60:	e3a01014 	mov	r1, #20	; 0x14
  102d64:	e5820000 	str	r0, [r2]
  102d68:	e3a00040 	mov	r0, #64	; 0x40
  102d6c:	ebfffb27 	bl	101a10 <xQueueCreate>
  102d70:	e59fc8e8 	ldr	ip, [pc, #2280]	; 103660 <prog+0x361c>
  102d74:	e59c3000 	ldr	r3, [ip]
  102d78:	e59f18ec 	ldr	r1, [pc, #2284]	; 10366c <prog+0x3628>
  102d7c:	e3530000 	cmp	r3, #0	; 0x0
  102d80:	e5810000 	str	r0, [r1]
  102d84:	0a000038 	beq	102e6c <vUSBCDCTask+0x180>
  102d88:	e59b3000 	ldr	r3, [fp]
  102d8c:	e3530000 	cmp	r3, #0	; 0x0
  102d90:	0a000035 	beq	102e6c <vUSBCDCTask+0x180>
  102d94:	e59f28cc 	ldr	r2, [pc, #2252]	; 103668 <prog+0x3624>
  102d98:	e5923000 	ldr	r3, [r2]
  102d9c:	e3530000 	cmp	r3, #0	; 0x0
  102da0:	0a000031 	beq	102e6c <vUSBCDCTask+0x180>
  102da4:	e3500000 	cmp	r0, #0	; 0x0
  102da8:	0a00002f 	beq	102e6c <vUSBCDCTask+0x180>
  102dac:	e59fc8bc 	ldr	ip, [pc, #2236]	; 103670 <prog+0x362c>
  102db0:	e59f08bc 	ldr	r0, [pc, #2236]	; 103674 <prog+0x3630>
  102db4:	e59f18bc 	ldr	r1, [pc, #2236]	; 103678 <prog+0x3634>
  102db8:	e3a04000 	mov	r4, #0	; 0x0
  102dbc:	e3a03002 	mov	r3, #2	; 0x2
  102dc0:	e58c3000 	str	r3, [ip]
  102dc4:	e5c04000 	strb	r4, [r0]
  102dc8:	e5c14000 	strb	r4, [r1]
  102dcc:	e3e0ec03 	mvn	lr, #768	; 0x300
  102dd0:	e51e60d3 	ldr	r6, [lr, #-211]
  102dd4:	e3a0c080 	mov	ip, #128	; 0x80
  102dd8:	e3866201 	orr	r6, r6, #268435456	; 0x10000000
  102ddc:	e50e60d3 	str	r6, [lr, #-211]
  102de0:	e50ec0ff 	str	ip, [lr, #-255]
  102de4:	e59fc890 	ldr	ip, [pc, #2192]	; 10367c <prog+0x3638>
  102de8:	e58c4080 	str	r4, [ip, #128]
  102dec:	e59fc88c 	ldr	ip, [pc, #2188]	; 103680 <prog+0x363c>
  102df0:	e58c4080 	str	r4, [ip, #128]
  102df4:	e59fc888 	ldr	ip, [pc, #2184]	; 103684 <prog+0x3640>
  102df8:	e3e05a4f 	mvn	r5, #323584	; 0x4f000
  102dfc:	e3e07c0b 	mvn	r7, #2816	; 0xb00
  102e00:	e3a08801 	mov	r8, #65536	; 0x10000
  102e04:	e3a0ab02 	mov	sl, #2048	; 0x800
  102e08:	e3e09000 	mvn	r9, #0	; 0x0
  102e0c:	e50ea0ef 	str	sl, [lr, #-239]
  102e10:	e1a02004 	mov	r2, r4
  102e14:	e50780ff 	str	r8, [r7, #-255]
  102e18:	e3a01003 	mov	r1, #3	; 0x3
  102e1c:	e50780ef 	str	r8, [r7, #-239]
  102e20:	e59f3860 	ldr	r3, [pc, #2144]	; 103688 <prog+0x3644>
  102e24:	e50780cf 	str	r8, [r7, #-207]
  102e28:	e58c4000 	str	r4, [ip]
  102e2c:	e5059feb 	str	r9, [r5, #-4075]
  102e30:	e3a0000b 	mov	r0, #11	; 0xb
  102e34:	e5059fdf 	str	r9, [r5, #-4063]
  102e38:	e5054f8b 	str	r4, [r5, #-3979]
  102e3c:	e5054fcf 	str	r4, [r5, #-4047]
  102e40:	e5054fcb 	str	r4, [r5, #-4043]
  102e44:	e5054fc7 	str	r4, [r5, #-4039]
  102e48:	e5054fc3 	str	r4, [r5, #-4035]
  102e4c:	e5054ffb 	str	r4, [r5, #-4091]
  102e50:	e5054ff7 	str	r4, [r5, #-4087]
  102e54:	ebfff940 	bl	10135c <AT91F_AIC_ConfigureIt>
  102e58:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  102e5c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
  102e60:	e583a021 	str	sl, [r3, #33]
  102e64:	ebfffda5 	bl	102500 <vTaskDelay>
  102e68:	e50780cb 	str	r8, [r7, #-203]
  102e6c:	ebfffe6e 	bl	10282c <vPortExitCritical>
  102e70:	e59f9814 	ldr	r9, [pc, #2068]	; 10368c <prog+0x3648>
  102e74:	e28da01b 	add	sl, sp, #27	; 0x1b
  102e78:	e28d8027 	add	r8, sp, #39	; 0x27
  102e7c:	e28d2008 	add	r2, sp, #8	; 0x8
  102e80:	e892000c 	ldmia	r2, {r2, r3}
  102e84:	e59f17d4 	ldr	r1, [pc, #2004]	; 103660 <prog+0x361c>
  102e88:	e1530002 	cmp	r3, r2
  102e8c:	33a02000 	movcc	r2, #0	; 0x0
  102e90:	23a02001 	movcs	r2, #1	; 0x1
  102e94:	e5910000 	ldr	r0, [r1]
  102e98:	e3a03000 	mov	r3, #0	; 0x0
  102e9c:	e28d1020 	add	r1, sp, #32	; 0x20
  102ea0:	ebfffa1a 	bl	101710 <xQueueGenericReceive>
  102ea4:	e3500000 	cmp	r0, #0	; 0x0
  102ea8:	0a000030 	beq	102f70 <vUSBCDCTask+0x284>
  102eac:	e59d5020 	ldr	r5, [sp, #32]
  102eb0:	e5953000 	ldr	r3, [r5]
  102eb4:	e3130001 	tst	r3, #1	; 0x1
  102eb8:	0a000029 	beq	102f64 <vUSBCDCTask+0x278>
  102ebc:	e5950004 	ldr	r0, [r5, #4]
  102ec0:	e1a03820 	mov	r3, r0, lsr #16
  102ec4:	e1a07a83 	mov	r7, r3, lsl #21
  102ec8:	e3100001 	tst	r0, #1	; 0x1
  102ecc:	e1a07aa7 	mov	r7, r7, lsr #21
  102ed0:	0a000013 	beq	102f24 <vUSBCDCTask+0x238>
  102ed4:	e59f27a8 	ldr	r2, [pc, #1960]	; 103684 <prog+0x3640>
  102ed8:	e5926000 	ldr	r6, [r2]
  102edc:	e3560002 	cmp	r6, #2	; 0x2
  102ee0:	0a000189 	beq	10350c <prog+0x34c8>
  102ee4:	e3560003 	cmp	r6, #3	; 0x3
  102ee8:	1a000184 	bne	103500 <prog+0x34bc>
  102eec:	e59f379c 	ldr	r3, [pc, #1948]	; 103690 <prog+0x364c>
  102ef0:	e5931000 	ldr	r1, [r3]
  102ef4:	e3510000 	cmp	r1, #0	; 0x0
  102ef8:	13a02001 	movne	r2, #1	; 0x1
  102efc:	13e03a4f 	mvnne	r3, #323584	; 0x4f000
  102f00:	03e03a4f 	mvneq	r3, #323584	; 0x4f000
  102f04:	e59fc778 	ldr	ip, [pc, #1912]	; 103684 <prog+0x3640>
  102f08:	15032ffb 	strne	r2, [r3, #-4091]
  102f0c:	05031ffb 	streq	r1, [r3, #-4091]
  102f10:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  102f14:	e3813c01 	orr	r3, r1, #256	; 0x100
  102f18:	e3a01000 	mov	r1, #0	; 0x0
  102f1c:	e5023ff7 	str	r3, [r2, #-4087]
  102f20:	e58c1000 	str	r1, [ip]
  102f24:	e3100002 	tst	r0, #2	; 0x2
  102f28:	0a000099 	beq	103194 <vUSBCDCTask+0x4a8>
  102f2c:	e59f074c 	ldr	r0, [pc, #1868]	; 103680 <prog+0x363c>
  102f30:	e2800084 	add	r0, r0, #132	; 0x84
  102f34:	e8100009 	ldmda	r0, {r0, r3}
  102f38:	e0433000 	sub	r3, r3, r0
  102f3c:	e59f1738 	ldr	r1, [pc, #1848]	; 10367c <prog+0x3638>
  102f40:	e20340ff 	and	r4, r3, #255	; 0xff
  102f44:	e1570004 	cmp	r7, r4
  102f48:	e5912084 	ldr	r2, [r1, #132]
  102f4c:	320740ff 	andcc	r4, r7, #255	; 0xff
  102f50:	e3540000 	cmp	r4, #0	; 0x0
  102f54:	e5812080 	str	r2, [r1, #128]
  102f58:	e59f6720 	ldr	r6, [pc, #1824]	; 103680 <prog+0x363c>
  102f5c:	1a000084 	bne	103174 <vUSBCDCTask+0x488>
  102f60:	e59d5020 	ldr	r5, [sp, #32]
  102f64:	e5953000 	ldr	r3, [r5]
  102f68:	e3130a01 	tst	r3, #4096	; 0x1000
  102f6c:	1a0000d5 	bne	1032c8 <prog+0x3284>
  102f70:	e59f070c 	ldr	r0, [pc, #1804]	; 103684 <prog+0x3640>
  102f74:	e5903000 	ldr	r3, [r0]
  102f78:	e3530005 	cmp	r3, #5	; 0x5
  102f7c:	1affffbe 	bne	102e7c <vUSBCDCTask+0x190>
  102f80:	e59f16f0 	ldr	r1, [pc, #1776]	; 103678 <prog+0x3634>
  102f84:	e5d13000 	ldrb	r3, [r1]
  102f88:	e3530000 	cmp	r3, #0	; 0x0
  102f8c:	0affffba 	beq	102e7c <vUSBCDCTask+0x190>
  102f90:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  102f94:	e5132fc7 	ldr	r2, [r3, #-4039]
  102f98:	e3120010 	tst	r2, #16	; 0x10
  102f9c:	1a000045 	bne	1030b8 <vUSBCDCTask+0x3cc>
  102fa0:	e59d000c 	ldr	r0, [sp, #12]
  102fa4:	e59d2008 	ldr	r2, [sp, #8]
  102fa8:	e1500002 	cmp	r0, r2
  102fac:	2a0000af 	bcs	103270 <prog+0x322c>
  102fb0:	e1500002 	cmp	r0, r2
  102fb4:	e3a04000 	mov	r4, #0	; 0x0
  102fb8:	3a000027 	bcc	10305c <vUSBCDCTask+0x370>
  102fbc:	e59fc6a8 	ldr	ip, [pc, #1704]	; 10366c <prog+0x3628>
  102fc0:	e3a02000 	mov	r2, #0	; 0x0
  102fc4:	e59c0000 	ldr	r0, [ip]
  102fc8:	e28d1004 	add	r1, sp, #4	; 0x4
  102fcc:	e1a03002 	mov	r3, r2
  102fd0:	ebfff9ce 	bl	101710 <xQueueGenericReceive>
  102fd4:	e3500000 	cmp	r0, #0	; 0x0
  102fd8:	058d0008 	streq	r0, [sp, #8]
  102fdc:	058d000c 	streq	r0, [sp, #12]
  102fe0:	0a000003 	beq	102ff4 <vUSBCDCTask+0x308>
  102fe4:	e59d000c 	ldr	r0, [sp, #12]
  102fe8:	e59d2008 	ldr	r2, [sp, #8]
  102fec:	e1500002 	cmp	r0, r2
  102ff0:	3a000019 	bcc	10305c <vUSBCDCTask+0x370>
  102ff4:	e59f166c 	ldr	r1, [pc, #1644]	; 103668 <prog+0x3624>
  102ff8:	e3a02000 	mov	r2, #0	; 0x0
  102ffc:	e5910000 	ldr	r0, [r1]
  103000:	e1a03002 	mov	r3, r2
  103004:	e1a0100a 	mov	r1, sl
  103008:	ebfff9c0 	bl	101710 <xQueueGenericReceive>
  10300c:	e3500000 	cmp	r0, #0	; 0x0
  103010:	0a000024 	beq	1030a8 <vUSBCDCTask+0x3bc>
  103014:	e5dd101b 	ldrb	r1, [sp, #27]
  103018:	e3510000 	cmp	r1, #0	; 0x0
  10301c:	da000007 	ble	103040 <vUSBCDCTask+0x354>
  103020:	e3a02000 	mov	r2, #0	; 0x0
  103024:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  103028:	e2822001 	add	r2, r2, #1	; 0x1
  10302c:	e7d2300a 	ldrb	r3, [r2, sl]
  103030:	e1520001 	cmp	r2, r1
  103034:	e5003fa7 	str	r3, [r0, #-4007]
  103038:	e2844001 	add	r4, r4, #1	; 0x1
  10303c:	1afffff9 	bne	103028 <vUSBCDCTask+0x33c>
  103040:	e2844001 	add	r4, r4, #1	; 0x1
  103044:	e354003b 	cmp	r4, #59	; 0x3b
  103048:	ca000016 	bgt	1030a8 <vUSBCDCTask+0x3bc>
  10304c:	e59d000c 	ldr	r0, [sp, #12]
  103050:	e59d2008 	ldr	r2, [sp, #8]
  103054:	e1500002 	cmp	r0, r2
  103058:	2affffd7 	bcs	102fbc <vUSBCDCTask+0x2d0>
  10305c:	e59dc004 	ldr	ip, [sp, #4]
  103060:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  103064:	e1500002 	cmp	r0, r2
  103068:	e2844001 	add	r4, r4, #1	; 0x1
  10306c:	e2801001 	add	r1, r0, #1	; 0x1
  103070:	2a000007 	bcs	103094 <vUSBCDCTask+0x3a8>
  103074:	e7dc3000 	ldrb	r3, [ip, r0]
  103078:	e354003f 	cmp	r4, #63	; 0x3f
  10307c:	e50e3fa7 	str	r3, [lr, #-4007]
  103080:	e1a00001 	mov	r0, r1
  103084:	e58d100c 	str	r1, [sp, #12]
  103088:	dafffff5 	ble	103064 <vUSBCDCTask+0x378>
  10308c:	e1520001 	cmp	r2, r1
  103090:	8a000004 	bhi	1030a8 <vUSBCDCTask+0x3bc>
  103094:	e59d3010 	ldr	r3, [sp, #16]
  103098:	e3530000 	cmp	r3, #0	; 0x0
  10309c:	159d0014 	ldrne	r0, [sp, #20]
  1030a0:	11a0e00f 	movne	lr, pc
  1030a4:	112fff13 	bxne	r3
  1030a8:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  1030ac:	e5123fc7 	ldr	r3, [r2, #-4039]
  1030b0:	e3833010 	orr	r3, r3, #16	; 0x10
  1030b4:	e5023fc7 	str	r3, [r2, #-4039]
  1030b8:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1030bc:	e5143fcb 	ldr	r3, [r4, #-4043]
  1030c0:	e3130042 	tst	r3, #66	; 0x42
  1030c4:	0affff6c 	beq	102e7c <vUSBCDCTask+0x190>
  1030c8:	e5143fcb 	ldr	r3, [r4, #-4043]
  1030cc:	e59b0000 	ldr	r0, [fp]
  1030d0:	e1a03823 	mov	r3, r3, lsr #16
  1030d4:	e1a05a83 	mov	r5, r3, lsl #21
  1030d8:	ebfff8ee 	bl	101498 <uxQueueMessagesWaiting>
  1030dc:	e1a05aa5 	mov	r5, r5, lsr #21
  1030e0:	e2600b01 	rsb	r0, r0, #1024	; 0x400
  1030e4:	e1550000 	cmp	r5, r0
  1030e8:	2affff63 	bcs	102e7c <vUSBCDCTask+0x190>
  1030ec:	e3550000 	cmp	r5, #0	; 0x0
  1030f0:	0a00000b 	beq	103124 <vUSBCDCTask+0x438>
  1030f4:	e1a06004 	mov	r6, r4
  1030f8:	e3a04000 	mov	r4, #0	; 0x0
  1030fc:	e516cfab 	ldr	ip, [r6, #-4011]
  103100:	e3a02000 	mov	r2, #0	; 0x0
  103104:	e2844001 	add	r4, r4, #1	; 0x1
  103108:	e59b0000 	ldr	r0, [fp]
  10310c:	e1a01008 	mov	r1, r8
  103110:	e1a03002 	mov	r3, r2
  103114:	e5cdc027 	strb	ip, [sp, #39]
  103118:	ebfff9e2 	bl	1018a8 <xQueueGenericSend>
  10311c:	e1540005 	cmp	r4, r5
  103120:	1afffff5 	bne	1030fc <vUSBCDCTask+0x410>
  103124:	ebfffdb5 	bl	102800 <vPortEnterCritical>
  103128:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10312c:	e59fc53c 	ldr	ip, [pc, #1340]	; 103670 <prog+0x362c>
  103130:	e5143fcb 	ldr	r3, [r4, #-4043]
  103134:	e59c2000 	ldr	r2, [ip]
  103138:	e383304f 	orr	r3, r3, #79	; 0x4f
  10313c:	e1e02002 	mvn	r2, r2
  103140:	e3c33030 	bic	r3, r3, #48	; 0x30
  103144:	e0033002 	and	r3, r3, r2
  103148:	e5043fcb 	str	r3, [r4, #-4043]
  10314c:	ebfffdb6 	bl	10282c <vPortExitCritical>
  103150:	e3a01002 	mov	r1, #2	; 0x2
  103154:	e5041fef 	str	r1, [r4, #-4079]
  103158:	e59f0510 	ldr	r0, [pc, #1296]	; 103670 <prog+0x362c>
  10315c:	e5903000 	ldr	r3, [r0]
  103160:	e1530001 	cmp	r3, r1
  103164:	03a03040 	moveq	r3, #64	; 0x40
  103168:	05803000 	streq	r3, [r0]
  10316c:	15801000 	strne	r1, [r0]
  103170:	eaffffd0 	b	1030b8 <vUSBCDCTask+0x3cc>
  103174:	e1a00006 	mov	r0, r6
  103178:	e2851008 	add	r1, r5, #8	; 0x8
  10317c:	e1a02004 	mov	r2, r4
  103180:	ebfff5c9 	bl	1008ac <memcpy>
  103184:	e5963080 	ldr	r3, [r6, #128]
  103188:	e0843003 	add	r3, r4, r3
  10318c:	e5863080 	str	r3, [r6, #128]
  103190:	e5950004 	ldr	r0, [r5, #4]
  103194:	e3100004 	tst	r0, #4	; 0x4
  103198:	0a000020 	beq	103220 <vUSBCDCTask+0x534>
  10319c:	e3570007 	cmp	r7, #7	; 0x7
  1031a0:	9a00001e 	bls	103220 <vUSBCDCTask+0x534>
  1031a4:	e5d51008 	ldrb	r1, [r5, #8]
  1031a8:	e5c91000 	strb	r1, [r9]
  1031ac:	e5d52009 	ldrb	r2, [r5, #9]
  1031b0:	e5c92001 	strb	r2, [r9, #1]
  1031b4:	e5d5300b 	ldrb	r3, [r5, #11]
  1031b8:	e1a03403 	mov	r3, r3, lsl #8
  1031bc:	e1c930b2 	strh	r3, [r9, #2]
  1031c0:	e5d5200a 	ldrb	r2, [r5, #10]
  1031c4:	e1833002 	orr	r3, r3, r2
  1031c8:	e1c930b2 	strh	r3, [r9, #2]
  1031cc:	e5d5200d 	ldrb	r2, [r5, #13]
  1031d0:	e1a02402 	mov	r2, r2, lsl #8
  1031d4:	e1c920b4 	strh	r2, [r9, #4]
  1031d8:	e5d5300c 	ldrb	r3, [r5, #12]
  1031dc:	e1822003 	orr	r2, r2, r3
  1031e0:	e1c920b4 	strh	r2, [r9, #4]
  1031e4:	e5d5300f 	ldrb	r3, [r5, #15]
  1031e8:	e1a03403 	mov	r3, r3, lsl #8
  1031ec:	e1c930b6 	strh	r3, [r9, #6]
  1031f0:	e5d5200e 	ldrb	r2, [r5, #14]
  1031f4:	e59fc484 	ldr	ip, [pc, #1156]	; 103680 <prog+0x363c>
  1031f8:	e1833002 	orr	r3, r3, r2
  1031fc:	e3110080 	tst	r1, #128	; 0x80
  103200:	e3a02000 	mov	r2, #0	; 0x0
  103204:	e1c930b6 	strh	r3, [r9, #6]
  103208:	e58c2080 	str	r2, [ip, #128]
  10320c:	1a0000d9 	bne	103578 <prog+0x3534>
  103210:	e3530080 	cmp	r3, #128	; 0x80
  103214:	958c3084 	strls	r3, [ip, #132]
  103218:	95950004 	ldrls	r0, [r5, #4]
  10321c:	8a000024 	bhi	1032b4 <prog+0x3270>
  103220:	e3100006 	tst	r0, #6	; 0x6
  103224:	0affff4d 	beq	102f60 <vUSBCDCTask+0x274>
  103228:	e59f0450 	ldr	r0, [pc, #1104]	; 103680 <prog+0x363c>
  10322c:	e2802080 	add	r2, r0, #128	; 0x80
  103230:	e892000c 	ldmia	r2, {r2, r3}
  103234:	e1520003 	cmp	r2, r3
  103238:	3affff48 	bcc	102f60 <vUSBCDCTask+0x274>
  10323c:	e5d93000 	ldrb	r3, [r9]
  103240:	e2032060 	and	r2, r3, #96	; 0x60
  103244:	e2033003 	and	r3, r3, #3	; 0x3
  103248:	e18331a2 	orr	r3, r3, r2, lsr #3
  10324c:	e3530005 	cmp	r3, #5	; 0x5
  103250:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  103254:	ea000016 	b	1032b4 <prog+0x3270>
  103258:	00103354 	andeqs	r3, r0, r4, asr r3
  10325c:	00103328 	andeqs	r3, r0, r8, lsr #6
  103260:	001032b4 	ldreqh	r3, [r0], -r4
  103264:	001032b4 	ldreqh	r3, [r0], -r4
  103268:	001032b4 	ldreqh	r3, [r0], -r4
  10326c:	00103394 	muleqs	r0, r4, r3
  103270:	e59f23f0 	ldr	r2, [pc, #1008]	; 103668 <prog+0x3624>
  103274:	e5920000 	ldr	r0, [r2]
  103278:	ebfff886 	bl	101498 <uxQueueMessagesWaiting>
  10327c:	e3500000 	cmp	r0, #0	; 0x0
  103280:	0a0000bf 	beq	103584 <prog+0x3540>
  103284:	e59d000c 	ldr	r0, [sp, #12]
  103288:	e59d2008 	ldr	r2, [sp, #8]
  10328c:	eaffff47 	b	102fb0 <vUSBCDCTask+0x2c4>
  103290:	e1d920b2 	ldrh	r2, [r9, #2]
  103294:	e1a03422 	mov	r3, r2, lsr #8
  103298:	e3530002 	cmp	r3, #2	; 0x2
  10329c:	e59f13e8 	ldr	r1, [pc, #1000]	; 10368c <prog+0x3648>
  1032a0:	0a0000cc 	beq	1035d8 <prog+0x3594>
  1032a4:	e3530003 	cmp	r3, #3	; 0x3
  1032a8:	0a0000c1 	beq	1035b4 <prog+0x3570>
  1032ac:	e3530001 	cmp	r3, #1	; 0x1
  1032b0:	0a0000b9 	beq	10359c <prog+0x3558>
  1032b4:	ebfffe10 	bl	102afc <prvSendStall>
  1032b8:	e59d5020 	ldr	r5, [sp, #32]
  1032bc:	e5953000 	ldr	r3, [r5]
  1032c0:	e3130a01 	tst	r3, #4096	; 0x1000
  1032c4:	0affff29 	beq	102f70 <vUSBCDCTask+0x284>
  1032c8:	e59f13a8 	ldr	r1, [pc, #936]	; 103678 <prog+0x3634>
  1032cc:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1032d0:	e3a02000 	mov	r2, #0	; 0x0
  1032d4:	e3a0300f 	mov	r3, #15	; 0xf
  1032d8:	e5c12000 	strb	r2, [r1]
  1032dc:	e5043fd7 	str	r3, [r4, #-4055]
  1032e0:	e5042fd7 	str	r2, [r4, #-4055]
  1032e4:	e59f2398 	ldr	r2, [pc, #920]	; 103684 <prog+0x3640>
  1032e8:	e28330f1 	add	r3, r3, #241	; 0xf1
  1032ec:	e3a05001 	mov	r5, #1	; 0x1
  1032f0:	e5043ff7 	str	r3, [r4, #-4087]
  1032f4:	e5825000 	str	r5, [r2]
  1032f8:	ebfffd40 	bl	102800 <vPortEnterCritical>
  1032fc:	e5143fcf 	ldr	r3, [r4, #-4047]
  103300:	e383304f 	orr	r3, r3, #79	; 0x4f
  103304:	e3c33030 	bic	r3, r3, #48	; 0x30
  103308:	e3833902 	orr	r3, r3, #32768	; 0x8000
  10330c:	e5043fcf 	str	r3, [r4, #-4047]
  103310:	e5045fef 	str	r5, [r4, #-4079]
  103314:	ebfffd44 	bl	10282c <vPortExitCritical>
  103318:	e59fc350 	ldr	ip, [pc, #848]	; 103670 <prog+0x362c>
  10331c:	e3a03002 	mov	r3, #2	; 0x2
  103320:	e58c3000 	str	r3, [ip]
  103324:	eaffff11 	b	102f70 <vUSBCDCTask+0x284>
  103328:	e5d93001 	ldrb	r3, [r9, #1]
  10332c:	e3a0c000 	mov	ip, #0	; 0x0
  103330:	e3530000 	cmp	r3, #0	; 0x0
  103334:	e1cdc2b4 	strh	ip, [sp, #36]
  103338:	1affffdd 	bne	1032b4 <prog+0x3270>
  10333c:	e3a01002 	mov	r1, #2	; 0x2
  103340:	e28d0024 	add	r0, sp, #36	; 0x24
  103344:	e1a02001 	mov	r2, r1
  103348:	ebfffe49 	bl	102c74 <prvSendControlData>
  10334c:	e59d5020 	ldr	r5, [sp, #32]
  103350:	eaffff03 	b	102f64 <vUSBCDCTask+0x278>
  103354:	e5d93001 	ldrb	r3, [r9, #1]
  103358:	e3a01000 	mov	r1, #0	; 0x0
  10335c:	e1cd12b4 	strh	r1, [sp, #36]
  103360:	e3530009 	cmp	r3, #9	; 0x9
  103364:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  103368:	eaffffd1 	b	1032b4 <prog+0x3270>
  10336c:	00103494 	muleqs	r0, r4, r4
  103370:	001032b4 	ldreqh	r3, [r0], -r4
  103374:	001032b4 	ldreqh	r3, [r0], -r4
  103378:	00103448 	andeqs	r3, r0, r8, asr #8
  10337c:	001032b4 	ldreqh	r3, [r0], -r4
  103380:	00103454 	andeqs	r3, r0, r4, asr r4
  103384:	00103290 	muleqs	r0, r0, r2
  103388:	001032b4 	ldreqh	r3, [r0], -r4
  10338c:	00103478 	andeqs	r3, r0, r8, ror r4
  103390:	00103430 	andeqs	r3, r0, r0, lsr r4
  103394:	e5d93001 	ldrb	r3, [r9, #1]
  103398:	e3530022 	cmp	r3, #34	; 0x22
  10339c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  1033a0:	eaffffc3 	b	1032b4 <prog+0x3270>
  1033a4:	001032b4 	ldreqh	r3, [r0], -r4
  1033a8:	001032b4 	ldreqh	r3, [r0], -r4
  1033ac:	001032b4 	ldreqh	r3, [r0], -r4
  1033b0:	001032b4 	ldreqh	r3, [r0], -r4
  1033b4:	001032b4 	ldreqh	r3, [r0], -r4
  1033b8:	001032b4 	ldreqh	r3, [r0], -r4
  1033bc:	001032b4 	ldreqh	r3, [r0], -r4
  1033c0:	001032b4 	ldreqh	r3, [r0], -r4
  1033c4:	001032b4 	ldreqh	r3, [r0], -r4
  1033c8:	001032b4 	ldreqh	r3, [r0], -r4
  1033cc:	001032b4 	ldreqh	r3, [r0], -r4
  1033d0:	001032b4 	ldreqh	r3, [r0], -r4
  1033d4:	001032b4 	ldreqh	r3, [r0], -r4
  1033d8:	001032b4 	ldreqh	r3, [r0], -r4
  1033dc:	001032b4 	ldreqh	r3, [r0], -r4
  1033e0:	001032b4 	ldreqh	r3, [r0], -r4
  1033e4:	001032b4 	ldreqh	r3, [r0], -r4
  1033e8:	001032b4 	ldreqh	r3, [r0], -r4
  1033ec:	001032b4 	ldreqh	r3, [r0], -r4
  1033f0:	001032b4 	ldreqh	r3, [r0], -r4
  1033f4:	001032b4 	ldreqh	r3, [r0], -r4
  1033f8:	001032b4 	ldreqh	r3, [r0], -r4
  1033fc:	001032b4 	ldreqh	r3, [r0], -r4
  103400:	001032b4 	ldreqh	r3, [r0], -r4
  103404:	001032b4 	ldreqh	r3, [r0], -r4
  103408:	001032b4 	ldreqh	r3, [r0], -r4
  10340c:	001032b4 	ldreqh	r3, [r0], -r4
  103410:	001032b4 	ldreqh	r3, [r0], -r4
  103414:	001032b4 	ldreqh	r3, [r0], -r4
  103418:	001032b4 	ldreqh	r3, [r0], -r4
  10341c:	001032b4 	ldreqh	r3, [r0], -r4
  103420:	001032b4 	ldreqh	r3, [r0], -r4
  103424:	001034b0 	ldreqh	r3, [r0], -r0
  103428:	001034cc 	andeqs	r3, r0, ip, asr #9
  10342c:	001034e8 	andeqs	r3, r0, r8, ror #9
  103430:	e1d930b2 	ldrh	r3, [r9, #2]
  103434:	e59f2238 	ldr	r2, [pc, #568]	; 103674 <prog+0x3630>
  103438:	e5c23000 	strb	r3, [r2]
  10343c:	e59f3240 	ldr	r3, [pc, #576]	; 103684 <prog+0x3640>
  103440:	e3a02002 	mov	r2, #2	; 0x2
  103444:	e5832000 	str	r2, [r3]
  103448:	ebfffdb4 	bl	102b20 <prvSendZLP>
  10344c:	e59d5020 	ldr	r5, [sp, #32]
  103450:	eafffec3 	b	102f64 <vUSBCDCTask+0x278>
  103454:	ebfffdb1 	bl	102b20 <prvSendZLP>
  103458:	e1d920b2 	ldrh	r2, [r9, #2]
  10345c:	e59f0220 	ldr	r0, [pc, #544]	; 103684 <prog+0x3640>
  103460:	e59f1228 	ldr	r1, [pc, #552]	; 103690 <prog+0x364c>
  103464:	e59d5020 	ldr	r5, [sp, #32]
  103468:	e3a03003 	mov	r3, #3	; 0x3
  10346c:	e5803000 	str	r3, [r0]
  103470:	e5812000 	str	r2, [r1]
  103474:	eafffeba 	b	102f64 <vUSBCDCTask+0x278>
  103478:	e3a01001 	mov	r1, #1	; 0x1
  10347c:	e59f01f0 	ldr	r0, [pc, #496]	; 103674 <prog+0x3630>
  103480:	e1a02001 	mov	r2, r1
  103484:	e3a03000 	mov	r3, #0	; 0x0
  103488:	ebfffdf9 	bl	102c74 <prvSendControlData>
  10348c:	e59d5020 	ldr	r5, [sp, #32]
  103490:	eafffeb3 	b	102f64 <vUSBCDCTask+0x278>
  103494:	e3a01002 	mov	r1, #2	; 0x2
  103498:	e28d0024 	add	r0, sp, #36	; 0x24
  10349c:	e1a02001 	mov	r2, r1
  1034a0:	e3a03000 	mov	r3, #0	; 0x0
  1034a4:	ebfffdf2 	bl	102c74 <prvSendControlData>
  1034a8:	e59d5020 	ldr	r5, [sp, #32]
  1034ac:	eafffeac 	b	102f64 <vUSBCDCTask+0x278>
  1034b0:	ebfffd9a 	bl	102b20 <prvSendZLP>
  1034b4:	e59f01d8 	ldr	r0, [pc, #472]	; 103694 <prog+0x3650>
  1034b8:	e59f11c0 	ldr	r1, [pc, #448]	; 103680 <prog+0x363c>
  1034bc:	e3a02007 	mov	r2, #7	; 0x7
  1034c0:	ebfff4f9 	bl	1008ac <memcpy>
  1034c4:	e59d5020 	ldr	r5, [sp, #32]
  1034c8:	eafffea5 	b	102f64 <vUSBCDCTask+0x278>
  1034cc:	e59f01c0 	ldr	r0, [pc, #448]	; 103694 <prog+0x3650>
  1034d0:	e1d910b6 	ldrh	r1, [r9, #6]
  1034d4:	e3a02007 	mov	r2, #7	; 0x7
  1034d8:	e3a03000 	mov	r3, #0	; 0x0
  1034dc:	ebfffde4 	bl	102c74 <prvSendControlData>
  1034e0:	e59d5020 	ldr	r5, [sp, #32]
  1034e4:	eafffe9e 	b	102f64 <vUSBCDCTask+0x278>
  1034e8:	ebfffd8c 	bl	102b20 <prvSendZLP>
  1034ec:	e1d930b2 	ldrh	r3, [r9, #2]
  1034f0:	e59f0180 	ldr	r0, [pc, #384]	; 103678 <prog+0x3634>
  1034f4:	e59d5020 	ldr	r5, [sp, #32]
  1034f8:	e5c03000 	strb	r3, [r0]
  1034fc:	eafffe98 	b	102f64 <vUSBCDCTask+0x278>
  103500:	ebfffd9d 	bl	102b7c <prvSendNextSegment>
  103504:	e5950004 	ldr	r0, [r5, #4]
  103508:	eafffe85 	b	102f24 <vUSBCDCTask+0x238>
  10350c:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  103510:	e5046ffb 	str	r6, [r4, #-4091]
  103514:	ebfffcb9 	bl	102800 <vPortEnterCritical>
  103518:	e5143fcb 	ldr	r3, [r4, #-4043]
  10351c:	e383304f 	orr	r3, r3, #79	; 0x4f
  103520:	e3c33030 	bic	r3, r3, #48	; 0x30
  103524:	e3833c82 	orr	r3, r3, #33280	; 0x8200
  103528:	e5043fcb 	str	r3, [r4, #-4043]
  10352c:	e5046fef 	str	r6, [r4, #-4079]
  103530:	e5143fc7 	ldr	r3, [r4, #-4039]
  103534:	e383304f 	orr	r3, r3, #79	; 0x4f
  103538:	e3c33030 	bic	r3, r3, #48	; 0x30
  10353c:	e3a02004 	mov	r2, #4	; 0x4
  103540:	e3833c86 	orr	r3, r3, #34304	; 0x8600
  103544:	e5043fc7 	str	r3, [r4, #-4039]
  103548:	e5042fef 	str	r2, [r4, #-4079]
  10354c:	e5143fc3 	ldr	r3, [r4, #-4035]
  103550:	e383304f 	orr	r3, r3, #79	; 0x4f
  103554:	e3c33030 	bic	r3, r3, #48	; 0x30
  103558:	e3833c87 	orr	r3, r3, #34560	; 0x8700
  10355c:	e5043fc3 	str	r3, [r4, #-4035]
  103560:	ebfffcb1 	bl	10282c <vPortExitCritical>
  103564:	e59f3118 	ldr	r3, [pc, #280]	; 103684 <prog+0x3640>
  103568:	e5950004 	ldr	r0, [r5, #4]
  10356c:	e3a02005 	mov	r2, #5	; 0x5
  103570:	e5832000 	str	r2, [r3]
  103574:	eafffe6a 	b	102f24 <vUSBCDCTask+0x238>
  103578:	e58c2084 	str	r2, [ip, #132]
  10357c:	e5950004 	ldr	r0, [r5, #4]
  103580:	eaffff26 	b	103220 <vUSBCDCTask+0x534>
  103584:	e59f30e0 	ldr	r3, [pc, #224]	; 10366c <prog+0x3628>
  103588:	e5930000 	ldr	r0, [r3]
  10358c:	ebfff7c1 	bl	101498 <uxQueueMessagesWaiting>
  103590:	e3500000 	cmp	r0, #0	; 0x0
  103594:	0afffec7 	beq	1030b8 <vUSBCDCTask+0x3cc>
  103598:	eaffff39 	b	103284 <prog+0x3240>
  10359c:	e1d110b6 	ldrh	r1, [r1, #6]
  1035a0:	e59f00f0 	ldr	r0, [pc, #240]	; 103698 <prog+0x3654>
  1035a4:	e3a02012 	mov	r2, #18	; 0x12
  1035a8:	ebfffdb1 	bl	102c74 <prvSendControlData>
  1035ac:	e59d5020 	ldr	r5, [sp, #32]
  1035b0:	eafffe6b 	b	102f64 <vUSBCDCTask+0x278>
  1035b4:	e20230ff 	and	r3, r2, #255	; 0xff
  1035b8:	e3530004 	cmp	r3, #4	; 0x4
  1035bc:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  1035c0:	eaffff3b 	b	1032b4 <prog+0x3270>
  1035c4:	00103608 	andeqs	r3, r0, r8, lsl #12
  1035c8:	00103624 	andeqs	r3, r0, r4, lsr #12
  1035cc:	00103640 	andeqs	r3, r0, r0, asr #12
  1035d0:	00103640 	andeqs	r3, r0, r0, asr #12
  1035d4:	00103640 	andeqs	r3, r0, r0, asr #12
  1035d8:	e20230ff 	and	r3, r2, #255	; 0xff
  1035dc:	e59fc0b8 	ldr	ip, [pc, #184]	; 10369c <prog+0x3658>
  1035e0:	e3530002 	cmp	r3, #2	; 0x2
  1035e4:	23a03002 	movcs	r3, #2	; 0x2
  1035e8:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  1035ec:	e59fc0ac 	ldr	ip, [pc, #172]	; 1036a0 <prog+0x365c>
  1035f0:	e1d110b6 	ldrh	r1, [r1, #6]
  1035f4:	e79c0103 	ldr	r0, [ip, r3, lsl #2]
  1035f8:	e3a03001 	mov	r3, #1	; 0x1
  1035fc:	ebfffd9c 	bl	102c74 <prvSendControlData>
  103600:	e59d5020 	ldr	r5, [sp, #32]
  103604:	eafffe56 	b	102f64 <vUSBCDCTask+0x278>
  103608:	e59f0094 	ldr	r0, [pc, #148]	; 1036a4 <prog+0x3660>
  10360c:	e1d910b6 	ldrh	r1, [r9, #6]
  103610:	e3a02004 	mov	r2, #4	; 0x4
  103614:	e3a03001 	mov	r3, #1	; 0x1
  103618:	ebfffd95 	bl	102c74 <prvSendControlData>
  10361c:	e59d5020 	ldr	r5, [sp, #32]
  103620:	eafffe4f 	b	102f64 <vUSBCDCTask+0x278>
  103624:	e59f007c 	ldr	r0, [pc, #124]	; 1036a8 <prog+0x3664>
  103628:	e1d910b6 	ldrh	r1, [r9, #6]
  10362c:	e3a0201c 	mov	r2, #28	; 0x1c
  103630:	e3a03001 	mov	r3, #1	; 0x1
  103634:	ebfffd8e 	bl	102c74 <prvSendControlData>
  103638:	e59d5020 	ldr	r5, [sp, #32]
  10363c:	eafffe48 	b	102f64 <vUSBCDCTask+0x278>
  103640:	e59f0064 	ldr	r0, [pc, #100]	; 1036ac <prog+0x3668>
  103644:	e1d910b6 	ldrh	r1, [r9, #6]
  103648:	e3a0202c 	mov	r2, #44	; 0x2c
  10364c:	e3a03001 	mov	r3, #1	; 0x1
  103650:	ebfffd87 	bl	102c74 <prvSendControlData>
  103654:	e59d5020 	ldr	r5, [sp, #32]
  103658:	eafffe41 	b	102f64 <vUSBCDCTask+0x278>
  10365c:	00103a10 	andeqs	r3, r0, r0, lsl sl
  103660:	0020112c 	eoreq	r1, r0, ip, lsr #2
  103664:	00200a78 	eoreq	r0, r0, r8, ror sl
  103668:	00200a7c 	eoreq	r0, r0, ip, ror sl
  10366c:	00200a80 	eoreq	r0, r0, r0, lsl #21
  103670:	00200a88 	eoreq	r0, r0, r8, lsl #21
  103674:	00200954 	eoreq	r0, r0, r4, asr r9
  103678:	00200a84 	eoreq	r0, r0, r4, lsl #21
  10367c:	00200968 	eoreq	r0, r0, r8, ror #18
  103680:	002009f0 	streqd	r0, [r0], -r0
  103684:	00200958 	eoreq	r0, r0, r8, asr r9
  103688:	00103854 	andeqs	r3, r0, r4, asr r8
  10368c:	00200960 	eoreq	r0, r0, r0, ror #18
  103690:	0020095c 	eoreq	r0, r0, ip, asr r9
  103694:	00103a24 	andeqs	r3, r0, r4, lsr #20
  103698:	001039fc 	ldreqsh	r3, [r0], -ip
  10369c:	001039f4 	ldreqsh	r3, [r0], -r4
  1036a0:	00200818 	eoreq	r0, r0, r8, lsl r8
  1036a4:	00103921 	andeqs	r3, r0, r1, lsr #18
  1036a8:	00103925 	andeqs	r3, r0, r5, lsr #18
  1036ac:	00103941 	andeqs	r3, r0, r1, asr #18

001036b0 <vUSB_ISR_Handler>:
  1036b0:	e59f2190 	ldr	r2, [pc, #400]	; 103848 <prog+0x3804>
  1036b4:	e5921000 	ldr	r1, [r2]
  1036b8:	e5923000 	ldr	r3, [r2]
  1036bc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1036c0:	e2833001 	add	r3, r3, #1	; 0x1
  1036c4:	e5823000 	str	r3, [r2]
  1036c8:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1036cc:	e514cfe3 	ldr	ip, [r4, #-4067]
  1036d0:	e59f0174 	ldr	r0, [pc, #372]	; 10384c <prog+0x3808>
  1036d4:	e514efcf 	ldr	lr, [r4, #-4047]
  1036d8:	e2011003 	and	r1, r1, #3	; 0x3
  1036dc:	e5143fe7 	ldr	r3, [r4, #-4071]
  1036e0:	e1a01201 	mov	r1, r1, lsl #4
  1036e4:	e24dd008 	sub	sp, sp, #8	; 0x8
  1036e8:	e0812000 	add	r2, r1, r0
  1036ec:	e3833a01 	orr	r3, r3, #4096	; 0x1000
  1036f0:	e3a05000 	mov	r5, #0	; 0x0
  1036f4:	e31e0006 	tst	lr, #6	; 0x6
  1036f8:	e781c000 	str	ip, [r1, r0]
  1036fc:	e582e004 	str	lr, [r2, #4]
  103700:	e5043fdf 	str	r3, [r4, #-4063]
  103704:	e88d0024 	stmia	sp, {r2, r5}
  103708:	0a000019 	beq	103774 <vUSB_ISR_Handler+0xc4>
  10370c:	e1a0382e 	mov	r3, lr, lsr #16
  103710:	e1a0ca83 	mov	ip, r3, lsl #21
  103714:	e1a0caac 	mov	ip, ip, lsr #21
  103718:	e15c0005 	cmp	ip, r5
  10371c:	0a000009 	beq	103748 <vUSB_ISR_Handler+0x98>
  103720:	e1a00005 	mov	r0, r5
  103724:	e1a0e004 	mov	lr, r4
  103728:	e59d2000 	ldr	r2, [sp]
  10372c:	e2803001 	add	r3, r0, #1	; 0x1
  103730:	e0802002 	add	r2, r0, r2
  103734:	e51e1faf 	ldr	r1, [lr, #-4015]
  103738:	e20300ff 	and	r0, r3, #255	; 0xff
  10373c:	e15c0000 	cmp	ip, r0
  103740:	e5c21008 	strb	r1, [r2, #8]
  103744:	8afffff7 	bhi	103728 <vUSB_ISR_Handler+0x78>
  103748:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  10374c:	e5113fcf 	ldr	r3, [r1, #-4047]
  103750:	e3130004 	tst	r3, #4	; 0x4
  103754:	1a000025 	bne	1037f0 <vUSB_ISR_Handler+0x140>
  103758:	e5113fcf 	ldr	r3, [r1, #-4047]
  10375c:	e3c33002 	bic	r3, r3, #2	; 0x2
  103760:	e5013fcf 	str	r3, [r1, #-4047]
  103764:	e1a02001 	mov	r2, r1
  103768:	e5123fcf 	ldr	r3, [r2, #-4047]
  10376c:	e3130002 	tst	r3, #2	; 0x2
  103770:	1afffffc 	bne	103768 <vUSB_ISR_Handler+0xb8>
  103774:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  103778:	e51e3fcb 	ldr	r3, [lr, #-4043]
  10377c:	e3130042 	tst	r3, #66	; 0x42
  103780:	13a03002 	movne	r3, #2	; 0x2
  103784:	150e3feb 	strne	r3, [lr, #-4075]
  103788:	e51e3fcf 	ldr	r3, [lr, #-4047]
  10378c:	e3c33009 	bic	r3, r3, #9	; 0x9
  103790:	e50e3fcf 	str	r3, [lr, #-4047]
  103794:	e51e2fcb 	ldr	r2, [lr, #-4043]
  103798:	e3c2200d 	bic	r2, r2, #13	; 0xd
  10379c:	e50e2fcb 	str	r2, [lr, #-4043]
  1037a0:	e51e3fc7 	ldr	r3, [lr, #-4039]
  1037a4:	e3c3304f 	bic	r3, r3, #79	; 0x4f
  1037a8:	e50e3fc7 	str	r3, [lr, #-4039]
  1037ac:	e51ecfc3 	ldr	ip, [lr, #-4035]
  1037b0:	e59f3098 	ldr	r3, [pc, #152]	; 103850 <prog+0x380c>
  1037b4:	e3ccc04f 	bic	ip, ip, #79	; 0x4f
  1037b8:	e5930000 	ldr	r0, [r3]
  1037bc:	e28d2004 	add	r2, sp, #4	; 0x4
  1037c0:	e3a03000 	mov	r3, #0	; 0x0
  1037c4:	e1a0100d 	mov	r1, sp
  1037c8:	e50ecfc3 	str	ip, [lr, #-4035]
  1037cc:	ebfff771 	bl	101598 <xQueueGenericSendFromISR>
  1037d0:	e59d3004 	ldr	r3, [sp, #4]
  1037d4:	e3a02000 	mov	r2, #0	; 0x0
  1037d8:	e3530000 	cmp	r3, #0	; 0x0
  1037dc:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  1037e0:	e5832031 	str	r2, [r3, #49]
  1037e4:	1bfff8b2 	blne	101ab4 <vTaskSwitchContext>
  1037e8:	e28dd008 	add	sp, sp, #8	; 0x8
  1037ec:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1037f0:	e35c0000 	cmp	ip, #0	; 0x0
  1037f4:	1a000007 	bne	103818 <vUSB_ISR_Handler+0x168>
  1037f8:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  1037fc:	e5123fcf 	ldr	r3, [r2, #-4047]
  103800:	e3c33004 	bic	r3, r3, #4	; 0x4
  103804:	e5023fcf 	str	r3, [r2, #-4047]
  103808:	e5123fcf 	ldr	r3, [r2, #-4047]
  10380c:	e3130004 	tst	r3, #4	; 0x4
  103810:	1afffffc 	bne	103808 <vUSB_ISR_Handler+0x158>
  103814:	eaffffd6 	b	103774 <vUSB_ISR_Handler+0xc4>
  103818:	e59d3000 	ldr	r3, [sp]
  10381c:	e1d320d8 	ldrsb	r2, [r3, #8]
  103820:	e3520000 	cmp	r2, #0	; 0x0
  103824:	aafffff3 	bge	1037f8 <vUSB_ISR_Handler+0x148>
  103828:	e5113fcf 	ldr	r3, [r1, #-4047]
  10382c:	e3833080 	orr	r3, r3, #128	; 0x80
  103830:	e5013fcf 	str	r3, [r1, #-4047]
  103834:	e1a02001 	mov	r2, r1
  103838:	e5123fcf 	ldr	r3, [r2, #-4047]
  10383c:	e3130080 	tst	r3, #128	; 0x80
  103840:	0afffffc 	beq	103838 <vUSB_ISR_Handler+0x188>
  103844:	eaffffeb 	b	1037f8 <vUSB_ISR_Handler+0x148>
  103848:	00200a8c 	eoreq	r0, r0, ip, lsl #21
  10384c:	00200a90 	mlaeq	r0, r0, sl, r0
  103850:	0020112c 	eoreq	r1, r0, ip, lsr #2

00103854 <vUSB_ISR_Wrapper>:
  103854:	e92d0001 	stmdb	sp!, {r0}
  103858:	e94d2000 	stmdb	sp, {sp}^
  10385c:	e1a00000 	nop			(mov r0,r0)
  103860:	e24dd004 	sub	sp, sp, #4	; 0x4
  103864:	e8bd0001 	ldmia	sp!, {r0}
  103868:	e9204000 	stmdb	r0!, {lr}
  10386c:	e1a0e000 	mov	lr, r0
  103870:	e8bd0001 	ldmia	sp!, {r0}
  103874:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  103878:	e1a00000 	nop			(mov r0,r0)
  10387c:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  103880:	e14f0000 	mrs	r0, SPSR
  103884:	e92e0001 	stmdb	lr!, {r0}
  103888:	e59f0064 	ldr	r0, [pc, #100]	; 1038f4 <prog+0x38b0>
  10388c:	e5900000 	ldr	r0, [r0]
  103890:	e92e0001 	stmdb	lr!, {r0}
  103894:	e59f005c 	ldr	r0, [pc, #92]	; 1038f8 <prog+0x38b4>
  103898:	e5900000 	ldr	r0, [r0]
  10389c:	e580e000 	str	lr, [r0]
  1038a0:	e59f4044 	ldr	r4, [pc, #68]	; 1038ec <prog+0x38a8>
  1038a4:	e59f5044 	ldr	r5, [pc, #68]	; 1038f0 <prog+0x38ac>
  1038a8:	e5943000 	ldr	r3, [r4]
  1038ac:	e5952000 	ldr	r2, [r5]
  1038b0:	ebffff7e 	bl	1036b0 <vUSB_ISR_Handler>
  1038b4:	e59f003c 	ldr	r0, [pc, #60]	; 1038f8 <prog+0x38b4>
  1038b8:	e5900000 	ldr	r0, [r0]
  1038bc:	e590e000 	ldr	lr, [r0]
  1038c0:	e59f002c 	ldr	r0, [pc, #44]	; 1038f4 <prog+0x38b0>
  1038c4:	e8be0002 	ldmia	lr!, {r1}
  1038c8:	e5801000 	str	r1, [r0]
  1038cc:	e8be0001 	ldmia	lr!, {r0}
  1038d0:	e169f000 	msr	SPSR_fc, r0
  1038d4:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1038d8:	e1a00000 	nop			(mov r0,r0)
  1038dc:	e59ee03c 	ldr	lr, [lr, #60]
  1038e0:	e25ef004 	subs	pc, lr, #4	; 0x4
  1038e4:	e5943000 	ldr	r3, [r4]
  1038e8:	e5952000 	ldr	r2, [r5]
  1038ec:	00200814 	eoreq	r0, r0, r4, lsl r8
  1038f0:	00200858 	eoreq	r0, r0, r8, asr r8
  1038f4:	00200814 	eoreq	r0, r0, r4, lsl r8
  1038f8:	00200858 	eoreq	r0, r0, r8, asr r8
  1038fc:	00425355 	subeq	r5, r2, r5, asr r3
  103900:	53425355 	cmppl	r2, #1409286145	; 0x54000001
  103904:	4c4c4548 	cfstr64mi	mvdx4, [ip], {72}
  103908:	00000000 	andeq	r0, r0, r0
  10390c:	6c6c6148 	stfvse	f6, [ip], #-288
  103910:	57202c6f 	strpl	r2, [r0, -pc, ror #24]!
  103914:	646c726f 	strvsbt	r7, [ip], #-623
  103918:	00002121 	andeq	r2, r0, r1, lsr #2
  10391c:	454c4449 	strmib	r4, [ip, #-1097]
	...

00103921 <pxLanguageStringDescriptor>:
  103921:	04090304                                ....

00103925 <pxManufacturerStringDescriptor>:
  103925:	0062031c 00740069 0061006d 0075006e     ..b.i.t.m.a.n.u.
  103935:	00610066 0074006b 00720075              f.a.k.t.u.r.

00103941 <pxProductStringDescriptor>:
  103941:	004f0328 00650070 0042006e 00610065     (.O.p.e.n.B.e.a.
  103951:	006f0063 0020006e 006c0042 006e0069     c.o.n. .B.l.i.n.
  103961:	0065006b 006c006e 00000067              k.e.n.l.g...

0010396d <pxConfigDescriptor1>:
  10396d:	00430209 80030102 000409fa 02020100     ..C.............
  10397d:	24050401 04011000 05000224 01000624     ...$....$...$...
  10398d:	00012405 83050701 ff000803 00010409     .$..............
  10399d:	00000a02 01050700 00004002 02820507     .........@......
  1039ad:	09000040                                         @..

001039b0 <pxConfigDescriptor2>:
  1039b0:	00430209 80030202 00040932 02020100     ..C.....2.......
  1039c0:	24050401 04011000 05000224 01000624     ...$....$...$...
  1039d0:	00012405 83050701 ff000803 00010409     .$..............
  1039e0:	00000a02 01050700 00004002 02820507     .........@......
  1039f0:	00000040                                @...

001039f4 <pxConfigDescriptorSizes>:
  1039f4:	00000043 00000043                       C...C...

001039fc <pxDeviceDescriptor>:
  1039fc:	01100112 08000002 08af16c0 02010110     ................
  103a0c:	00000200                                ....

00103a10 <C.25.4299>:
	...

00103a24 <pxLineCoding>:
  103a24:	0001c200 00080000 00000043              ........C...
