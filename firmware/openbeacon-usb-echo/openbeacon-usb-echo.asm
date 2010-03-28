
openbeacon-usb-echo.elf:     file format elf32-littlearm

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
  100024:	00102838 	andeqs	r2, r0, r8, lsr r8

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
  100090:	eb00044e 	bl	1011d0 <AT91F_LowLevelInit>
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
  1000fc:	00201134 	eoreq	r1, r0, r4, lsr r1
  100100:	00200000 	eoreq	r0, r0, r0
  100104:	0010392c 	andeqs	r3, r0, ip, lsr #18
  100108:	00200820 	eoreq	r0, r0, r0, lsr #16
  10010c:	00203ffc 	streqd	r3, [r0], -ip
  100110:	00100ec4 	andeqs	r0, r0, r4, asr #29

00100114 <free>:
  100114:	e59f3008 	ldr	r3, [pc, #8]	; 100124 <prog+0xe0>
  100118:	e1a01000 	mov	r1, r0
  10011c:	e5930000 	ldr	r0, [r3]
  100120:	ea0002b5 	b	100bfc <_free_r>
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
  100560:	eb0002ad 	bl	10101c <_sbrk_r>
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
  1006f4:	eb000248 	bl	10101c <_sbrk_r>
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
  100868:	eb0000e3 	bl	100bfc <_free_r>
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

001009ec <strncpy>:
  1009ec:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1009f0:	e1a04001 	mov	r4, r1
  1009f4:	e1811000 	orr	r1, r1, r0
  1009f8:	e3110003 	tst	r1, #3	; 0x3
  1009fc:	13a03000 	movne	r3, #0	; 0x0
  100a00:	03a03001 	moveq	r3, #1	; 0x1
  100a04:	e3520003 	cmp	r2, #3	; 0x3
  100a08:	93a03000 	movls	r3, #0	; 0x0
  100a0c:	82033001 	andhi	r3, r3, #1	; 0x1
  100a10:	e3530000 	cmp	r3, #0	; 0x0
  100a14:	01a01004 	moveq	r1, r4
  100a18:	e1a05000 	mov	r5, r0
  100a1c:	e1a0e002 	mov	lr, r2
  100a20:	01a04000 	moveq	r4, r0
  100a24:	0a000018 	beq	100a8c <strncpy+0xa0>
  100a28:	e3520003 	cmp	r2, #3	; 0x3
  100a2c:	e1a0c004 	mov	ip, r4
  100a30:	9a000013 	bls	100a84 <strncpy+0x98>
  100a34:	e5941000 	ldr	r1, [r4]
  100a38:	ea000005 	b	100a54 <strncpy+0x68>
  100a3c:	e24ee004 	sub	lr, lr, #4	; 0x4
  100a40:	e35e0003 	cmp	lr, #3	; 0x3
  100a44:	e4801004 	str	r1, [r0], #4
  100a48:	e28cc004 	add	ip, ip, #4	; 0x4
  100a4c:	9a00000c 	bls	100a84 <strncpy+0x98>
  100a50:	e59c1000 	ldr	r1, [ip]
  100a54:	e28134ff 	add	r3, r1, #-16777216	; 0xff000000
  100a58:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100a5c:	e2433c01 	sub	r3, r3, #256	; 0x100
  100a60:	e2433001 	sub	r3, r3, #1	; 0x1
  100a64:	e1e02001 	mvn	r2, r1
  100a68:	e0033002 	and	r3, r3, r2
  100a6c:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100a70:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100a74:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100a78:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100a7c:	e3530000 	cmp	r3, #0	; 0x0
  100a80:	0affffed 	beq	100a3c <strncpy+0x50>
  100a84:	e1a04000 	mov	r4, r0
  100a88:	e1a0100c 	mov	r1, ip
  100a8c:	e35e0000 	cmp	lr, #0	; 0x0
  100a90:	0a000018 	beq	100af8 <strncpy+0x10c>
  100a94:	e5d13000 	ldrb	r3, [r1]
  100a98:	e24e2001 	sub	r2, lr, #1	; 0x1
  100a9c:	e3530000 	cmp	r3, #0	; 0x0
  100aa0:	e1a0c004 	mov	ip, r4
  100aa4:	e4cc3001 	strb	r3, [ip], #1
  100aa8:	1284e002 	addne	lr, r4, #2	; 0x2
  100aac:	10810002 	addne	r0, r1, r2
  100ab0:	0a000008 	beq	100ad8 <strncpy+0xec>
  100ab4:	e1500001 	cmp	r0, r1
  100ab8:	e1a0c00e 	mov	ip, lr
  100abc:	e2422001 	sub	r2, r2, #1	; 0x1
  100ac0:	e28ee001 	add	lr, lr, #1	; 0x1
  100ac4:	0a00000b 	beq	100af8 <strncpy+0x10c>
  100ac8:	e5f13001 	ldrb	r3, [r1, #1]!
  100acc:	e3530000 	cmp	r3, #0	; 0x0
  100ad0:	e54c3001 	strb	r3, [ip, #-1]
  100ad4:	1afffff6 	bne	100ab4 <strncpy+0xc8>
  100ad8:	e3520000 	cmp	r2, #0	; 0x0
  100adc:	0a000005 	beq	100af8 <strncpy+0x10c>
  100ae0:	e3a03000 	mov	r3, #0	; 0x0
  100ae4:	e1a01003 	mov	r1, r3
  100ae8:	e7c3100c 	strb	r1, [r3, ip]
  100aec:	e2833001 	add	r3, r3, #1	; 0x1
  100af0:	e1520003 	cmp	r2, r3
  100af4:	1afffffb 	bne	100ae8 <strncpy+0xfc>
  100af8:	e1a00005 	mov	r0, r5
  100afc:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00100b00 <_malloc_trim_r>:
  100b00:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  100b04:	e59f70e4 	ldr	r7, [pc, #228]	; 100bf0 <prog+0xbac>
  100b08:	e1a04001 	mov	r4, r1
  100b0c:	e1a05000 	mov	r5, r0
  100b10:	ebffffb3 	bl	1009e4 <__malloc_lock>
  100b14:	e5973008 	ldr	r3, [r7, #8]
  100b18:	e5932004 	ldr	r2, [r3, #4]
  100b1c:	e3c26003 	bic	r6, r2, #3	; 0x3
  100b20:	e0644006 	rsb	r4, r4, r6
  100b24:	e2844efe 	add	r4, r4, #4064	; 0xfe0
  100b28:	e284400f 	add	r4, r4, #15	; 0xf
  100b2c:	e1a04624 	mov	r4, r4, lsr #12
  100b30:	e2444001 	sub	r4, r4, #1	; 0x1
  100b34:	e1a04604 	mov	r4, r4, lsl #12
  100b38:	e3540a01 	cmp	r4, #4096	; 0x1000
  100b3c:	e3a01000 	mov	r1, #0	; 0x0
  100b40:	e1a00005 	mov	r0, r5
  100b44:	ba000006 	blt	100b64 <_malloc_trim_r+0x64>
  100b48:	eb000133 	bl	10101c <_sbrk_r>
  100b4c:	e5973008 	ldr	r3, [r7, #8]
  100b50:	e0863003 	add	r3, r6, r3
  100b54:	e1500003 	cmp	r0, r3
  100b58:	e2641000 	rsb	r1, r4, #0	; 0x0
  100b5c:	e1a00005 	mov	r0, r5
  100b60:	0a000002 	beq	100b70 <_malloc_trim_r+0x70>
  100b64:	ebffff9f 	bl	1009e8 <__malloc_unlock>
  100b68:	e3a00000 	mov	r0, #0	; 0x0
  100b6c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100b70:	eb000129 	bl	10101c <_sbrk_r>
  100b74:	e0643006 	rsb	r3, r4, r6
  100b78:	e3700001 	cmn	r0, #1	; 0x1
  100b7c:	e3a01000 	mov	r1, #0	; 0x0
  100b80:	e59fe06c 	ldr	lr, [pc, #108]	; 100bf4 <prog+0xbb0>
  100b84:	e383c001 	orr	ip, r3, #1	; 0x1
  100b88:	e1a00005 	mov	r0, r5
  100b8c:	0a000008 	beq	100bb4 <_malloc_trim_r+0xb4>
  100b90:	e59e3000 	ldr	r3, [lr]
  100b94:	e5972008 	ldr	r2, [r7, #8]
  100b98:	e0643003 	rsb	r3, r4, r3
  100b9c:	e1a00005 	mov	r0, r5
  100ba0:	e582c004 	str	ip, [r2, #4]
  100ba4:	e58e3000 	str	r3, [lr]
  100ba8:	ebffff8e 	bl	1009e8 <__malloc_unlock>
  100bac:	e3a00001 	mov	r0, #1	; 0x1
  100bb0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100bb4:	eb000118 	bl	10101c <_sbrk_r>
  100bb8:	e5971008 	ldr	r1, [r7, #8]
  100bbc:	e1a0e000 	mov	lr, r0
  100bc0:	e061300e 	rsb	r3, r1, lr
  100bc4:	e353000f 	cmp	r3, #15	; 0xf
  100bc8:	e1a00005 	mov	r0, r5
  100bcc:	e383c001 	orr	ip, r3, #1	; 0x1
  100bd0:	daffffe3 	ble	100b64 <_malloc_trim_r+0x64>
  100bd4:	e59f301c 	ldr	r3, [pc, #28]	; 100bf8 <prog+0xbb4>
  100bd8:	e5932000 	ldr	r2, [r3]
  100bdc:	e59f3010 	ldr	r3, [pc, #16]	; 100bf4 <prog+0xbb0>
  100be0:	e062200e 	rsb	r2, r2, lr
  100be4:	e5832000 	str	r2, [r3]
  100be8:	e581c004 	str	ip, [r1, #4]
  100bec:	eaffffdc 	b	100b64 <_malloc_trim_r+0x64>
  100bf0:	00200000 	eoreq	r0, r0, r0
  100bf4:	0020082c 	eoreq	r0, r0, ip, lsr #16
  100bf8:	0020040c 	eoreq	r0, r0, ip, lsl #8

00100bfc <_free_r>:
  100bfc:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100c00:	e2514000 	subs	r4, r1, #0	; 0x0
  100c04:	e1a08000 	mov	r8, r0
  100c08:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  100c0c:	ebffff74 	bl	1009e4 <__malloc_lock>
  100c10:	e244e008 	sub	lr, r4, #8	; 0x8
  100c14:	e59e0004 	ldr	r0, [lr, #4]
  100c18:	e59f726c 	ldr	r7, [pc, #620]	; 100e8c <prog+0xe48>
  100c1c:	e3c01001 	bic	r1, r0, #1	; 0x1
  100c20:	e08ec001 	add	ip, lr, r1
  100c24:	e5973008 	ldr	r3, [r7, #8]
  100c28:	e59c2004 	ldr	r2, [ip, #4]
  100c2c:	e15c0003 	cmp	ip, r3
  100c30:	e3c25003 	bic	r5, r2, #3	; 0x3
  100c34:	e1a0a007 	mov	sl, r7
  100c38:	0a000077 	beq	100e1c <_free_r+0x220>
  100c3c:	e2106001 	ands	r6, r0, #1	; 0x1
  100c40:	e58c5004 	str	r5, [ip, #4]
  100c44:	13a00000 	movne	r0, #0	; 0x0
  100c48:	0a000018 	beq	100cb0 <_free_r+0xb4>
  100c4c:	e08c3005 	add	r3, ip, r5
  100c50:	e5932004 	ldr	r2, [r3, #4]
  100c54:	e3120001 	tst	r2, #1	; 0x1
  100c58:	0a000007 	beq	100c7c <_free_r+0x80>
  100c5c:	e3813001 	orr	r3, r1, #1	; 0x1
  100c60:	e3500000 	cmp	r0, #0	; 0x0
  100c64:	e58e3004 	str	r3, [lr, #4]
  100c68:	e781100e 	str	r1, [r1, lr]
  100c6c:	0a00001f 	beq	100cf0 <_free_r+0xf4>
  100c70:	e1a00008 	mov	r0, r8
  100c74:	e8bd45f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100c78:	eaffff5a 	b	1009e8 <__malloc_unlock>
  100c7c:	e3500000 	cmp	r0, #0	; 0x0
  100c80:	e0811005 	add	r1, r1, r5
  100c84:	159c2008 	ldrne	r2, [ip, #8]
  100c88:	0a00004a 	beq	100db8 <_free_r+0x1bc>
  100c8c:	e59c300c 	ldr	r3, [ip, #12]
  100c90:	e3500000 	cmp	r0, #0	; 0x0
  100c94:	e5832008 	str	r2, [r3, #8]
  100c98:	e582300c 	str	r3, [r2, #12]
  100c9c:	e3813001 	orr	r3, r1, #1	; 0x1
  100ca0:	e58e3004 	str	r3, [lr, #4]
  100ca4:	e781100e 	str	r1, [r1, lr]
  100ca8:	1afffff0 	bne	100c70 <_free_r+0x74>
  100cac:	ea00000f 	b	100cf0 <_free_r+0xf4>
  100cb0:	e5142008 	ldr	r2, [r4, #-8]
  100cb4:	e062e00e 	rsb	lr, r2, lr
  100cb8:	e59e0008 	ldr	r0, [lr, #8]
  100cbc:	e2873008 	add	r3, r7, #8	; 0x8
  100cc0:	e1500003 	cmp	r0, r3
  100cc4:	159e300c 	ldrne	r3, [lr, #12]
  100cc8:	15830008 	strne	r0, [r3, #8]
  100ccc:	1580300c 	strne	r3, [r0, #12]
  100cd0:	e08c3005 	add	r3, ip, r5
  100cd4:	e0811002 	add	r1, r1, r2
  100cd8:	e5932004 	ldr	r2, [r3, #4]
  100cdc:	03a00001 	moveq	r0, #1	; 0x1
  100ce0:	11a00006 	movne	r0, r6
  100ce4:	e3120001 	tst	r2, #1	; 0x1
  100ce8:	1affffdb 	bne	100c5c <_free_r+0x60>
  100cec:	eaffffe2 	b	100c7c <_free_r+0x80>
  100cf0:	e3510c02 	cmp	r1, #512	; 0x200
  100cf4:	3a00003b 	bcc	100de8 <_free_r+0x1ec>
  100cf8:	e1b024a1 	movs	r2, r1, lsr #9
  100cfc:	01a021a1 	moveq	r2, r1, lsr #3
  100d00:	01a03182 	moveq	r3, r2, lsl #3
  100d04:	0a00001a 	beq	100d74 <_free_r+0x178>
  100d08:	e3520004 	cmp	r2, #4	; 0x4
  100d0c:	91a03321 	movls	r3, r1, lsr #6
  100d10:	92832038 	addls	r2, r3, #56	; 0x38
  100d14:	91a03182 	movls	r3, r2, lsl #3
  100d18:	9a000015 	bls	100d74 <_free_r+0x178>
  100d1c:	e3520014 	cmp	r2, #20	; 0x14
  100d20:	9282205b 	addls	r2, r2, #91	; 0x5b
  100d24:	91a03182 	movls	r3, r2, lsl #3
  100d28:	9a000011 	bls	100d74 <_free_r+0x178>
  100d2c:	e3520054 	cmp	r2, #84	; 0x54
  100d30:	91a03621 	movls	r3, r1, lsr #12
  100d34:	9283206e 	addls	r2, r3, #110	; 0x6e
  100d38:	91a03182 	movls	r3, r2, lsl #3
  100d3c:	9a00000c 	bls	100d74 <_free_r+0x178>
  100d40:	e3520f55 	cmp	r2, #340	; 0x154
  100d44:	91a037a1 	movls	r3, r1, lsr #15
  100d48:	92832077 	addls	r2, r3, #119	; 0x77
  100d4c:	91a03182 	movls	r3, r2, lsl #3
  100d50:	9a000007 	bls	100d74 <_free_r+0x178>
  100d54:	e3a03e55 	mov	r3, #1360	; 0x550
  100d58:	e2833004 	add	r3, r3, #4	; 0x4
  100d5c:	e1520003 	cmp	r2, r3
  100d60:	91a03921 	movls	r3, r1, lsr #18
  100d64:	9283207c 	addls	r2, r3, #124	; 0x7c
  100d68:	83a0207e 	movhi	r2, #126	; 0x7e
  100d6c:	82433f59 	subhi	r3, r3, #356	; 0x164
  100d70:	91a03182 	movls	r3, r2, lsl #3
  100d74:	e083c00a 	add	ip, r3, sl
  100d78:	e59c0008 	ldr	r0, [ip, #8]
  100d7c:	e15c0000 	cmp	ip, r0
  100d80:	0a00003b 	beq	100e74 <_free_r+0x278>
  100d84:	e5903004 	ldr	r3, [r0, #4]
  100d88:	e3c33003 	bic	r3, r3, #3	; 0x3
  100d8c:	e1510003 	cmp	r1, r3
  100d90:	2a000002 	bcs	100da0 <_free_r+0x1a4>
  100d94:	e5900008 	ldr	r0, [r0, #8]
  100d98:	e15c0000 	cmp	ip, r0
  100d9c:	1afffff8 	bne	100d84 <_free_r+0x188>
  100da0:	e590c00c 	ldr	ip, [r0, #12]
  100da4:	e58ec00c 	str	ip, [lr, #12]
  100da8:	e58e0008 	str	r0, [lr, #8]
  100dac:	e580e00c 	str	lr, [r0, #12]
  100db0:	e58ce008 	str	lr, [ip, #8]
  100db4:	eaffffad 	b	100c70 <_free_r+0x74>
  100db8:	e59c2008 	ldr	r2, [ip, #8]
  100dbc:	e59f30cc 	ldr	r3, [pc, #204]	; 100e90 <prog+0xe4c>
  100dc0:	e1520003 	cmp	r2, r3
  100dc4:	1affffb0 	bne	100c8c <_free_r+0x90>
  100dc8:	e3813001 	orr	r3, r1, #1	; 0x1
  100dcc:	e582e00c 	str	lr, [r2, #12]
  100dd0:	e582e008 	str	lr, [r2, #8]
  100dd4:	e781100e 	str	r1, [r1, lr]
  100dd8:	e58e3004 	str	r3, [lr, #4]
  100ddc:	e58e2008 	str	r2, [lr, #8]
  100de0:	e58e200c 	str	r2, [lr, #12]
  100de4:	eaffffa1 	b	100c70 <_free_r+0x74>
  100de8:	e1a011a1 	mov	r1, r1, lsr #3
  100dec:	e5972004 	ldr	r2, [r7, #4]
  100df0:	e1a00121 	mov	r0, r1, lsr #2
  100df4:	e3a03001 	mov	r3, #1	; 0x1
  100df8:	e1822013 	orr	r2, r2, r3, lsl r0
  100dfc:	e08a1181 	add	r1, sl, r1, lsl #3
  100e00:	e5913008 	ldr	r3, [r1, #8]
  100e04:	e58e100c 	str	r1, [lr, #12]
  100e08:	e58e3008 	str	r3, [lr, #8]
  100e0c:	e5872004 	str	r2, [r7, #4]
  100e10:	e583e00c 	str	lr, [r3, #12]
  100e14:	e581e008 	str	lr, [r1, #8]
  100e18:	eaffff94 	b	100c70 <_free_r+0x74>
  100e1c:	e3100001 	tst	r0, #1	; 0x1
  100e20:	e0810005 	add	r0, r1, r5
  100e24:	1a000006 	bne	100e44 <_free_r+0x248>
  100e28:	e5141008 	ldr	r1, [r4, #-8]
  100e2c:	e061e00e 	rsb	lr, r1, lr
  100e30:	e59e200c 	ldr	r2, [lr, #12]
  100e34:	e59e3008 	ldr	r3, [lr, #8]
  100e38:	e5823008 	str	r3, [r2, #8]
  100e3c:	e583200c 	str	r2, [r3, #12]
  100e40:	e0800001 	add	r0, r0, r1
  100e44:	e59f3048 	ldr	r3, [pc, #72]	; 100e94 <prog+0xe50>
  100e48:	e5932000 	ldr	r2, [r3]
  100e4c:	e3803001 	orr	r3, r0, #1	; 0x1
  100e50:	e1500002 	cmp	r0, r2
  100e54:	e587e008 	str	lr, [r7, #8]
  100e58:	e58e3004 	str	r3, [lr, #4]
  100e5c:	3affff83 	bcc	100c70 <_free_r+0x74>
  100e60:	e59f3030 	ldr	r3, [pc, #48]	; 100e98 <prog+0xe54>
  100e64:	e1a00008 	mov	r0, r8
  100e68:	e5931000 	ldr	r1, [r3]
  100e6c:	ebffff23 	bl	100b00 <_malloc_trim_r>
  100e70:	eaffff7e 	b	100c70 <_free_r+0x74>
  100e74:	e5973004 	ldr	r3, [r7, #4]
  100e78:	e1a01122 	mov	r1, r2, lsr #2
  100e7c:	e3a02001 	mov	r2, #1	; 0x1
  100e80:	e1833112 	orr	r3, r3, r2, lsl r1
  100e84:	e5873004 	str	r3, [r7, #4]
  100e88:	eaffffc5 	b	100da4 <_free_r+0x1a8>
  100e8c:	00200000 	eoreq	r0, r0, r0
  100e90:	00200008 	eoreq	r0, r0, r8
  100e94:	00200408 	eoreq	r0, r0, r8, lsl #8
  100e98:	00200820 	eoreq	r0, r0, r0, lsr #16

00100e9c <vApplicationIdleHook>:
  100e9c:	e3a034a5 	mov	r3, #-1526726656	; 0xa5000000
  100ea0:	e2833001 	add	r3, r3, #1	; 0x1
  100ea4:	e3e02c02 	mvn	r2, #512	; 0x200
  100ea8:	e50230bf 	str	r3, [r2, #-191]
  100eac:	e12fff1e 	bx	lr

00100eb0 <vResetEnv>:
  100eb0:	e59f0008 	ldr	r0, [pc, #8]	; 100ec0 <prog+0xe7c>
  100eb4:	e3a01000 	mov	r1, #0	; 0x0
  100eb8:	e3a02080 	mov	r2, #128	; 0x80
  100ebc:	eafffea2 	b	10094c <memset>
  100ec0:	002010b0 	streqh	r1, [r0], -r0

00100ec4 <mainloop>:
  100ec4:	e3a04000 	mov	r4, #0	; 0x0
  100ec8:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  100ecc:	e3a0200c 	mov	r2, #12	; 0xc
  100ed0:	e5834031 	str	r4, [r3, #49]
  100ed4:	e2833b03 	add	r3, r3, #3072	; 0xc00
  100ed8:	e24dd008 	sub	sp, sp, #8	; 0x8
  100edc:	e50320ef 	str	r2, [r3, #-239]
  100ee0:	eb000057 	bl	101044 <led_init>
  100ee4:	eb000082 	bl	1010f4 <env_init>
  100ee8:	eb000086 	bl	101108 <env_load>
  100eec:	e1500004 	cmp	r0, r4
  100ef0:	0a00000c 	beq	100f28 <mainloop+0x64>
  100ef4:	e3a0c002 	mov	ip, #2	; 0x2
  100ef8:	e1a03004 	mov	r3, r4
  100efc:	e59f102c 	ldr	r1, [pc, #44]	; 100f30 <prog+0xeec>
  100f00:	e3a02c02 	mov	r2, #512	; 0x200
  100f04:	e59f0028 	ldr	r0, [pc, #40]	; 100f34 <prog+0xef0>
  100f08:	e58dc000 	str	ip, [sp]
  100f0c:	e58d4004 	str	r4, [sp, #4]
  100f10:	eb0003c0 	bl	101e18 <xTaskCreate>
  100f14:	eb000007 	bl	100f38 <vUSBShellInit>
  100f18:	e3a00001 	mov	r0, #1	; 0x1
  100f1c:	eb00004e 	bl	10105c <led_set_green>
  100f20:	eb00044b 	bl	102054 <vTaskStartScheduler>
  100f24:	eafffffe 	b	100f24 <mainloop+0x60>
  100f28:	ebffffe0 	bl	100eb0 <vResetEnv>
  100f2c:	eafffff0 	b	100ef4 <mainloop+0x30>
  100f30:	00103808 	andeqs	r3, r0, r8, lsl #16
  100f34:	00102bf8 	ldreqsh	r2, [r0], -r8

00100f38 <vUSBShellInit>:
  100f38:	e52de004 	str	lr, [sp, #-4]!
  100f3c:	e3a0c000 	mov	ip, #0	; 0x0
  100f40:	e24dd008 	sub	sp, sp, #8	; 0x8
  100f44:	e1a0300c 	mov	r3, ip
  100f48:	e59f1018 	ldr	r1, [pc, #24]	; 100f68 <prog+0xf24>
  100f4c:	e3a02c02 	mov	r2, #512	; 0x200
  100f50:	e59f0014 	ldr	r0, [pc, #20]	; 100f6c <prog+0xf28>
  100f54:	e58dc000 	str	ip, [sp]
  100f58:	e58dc004 	str	ip, [sp, #4]
  100f5c:	eb0003ad 	bl	101e18 <xTaskCreate>
  100f60:	e28dd008 	add	sp, sp, #8	; 0x8
  100f64:	e8bd8000 	ldmia	sp!, {pc}
  100f68:	0010380c 	andeqs	r3, r0, ip, lsl #16
  100f6c:	00100f70 	andeqs	r0, r0, r0, ror pc

00100f70 <usbshell_task>:
  100f70:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100f74:	e59f8098 	ldr	r8, [pc, #152]	; 101014 <prog+0xfd0>
  100f78:	e3a02e5d 	mov	r2, #1488	; 0x5d0
  100f7c:	e24dd004 	sub	sp, sp, #4	; 0x4
  100f80:	e282200c 	add	r2, r2, #12	; 0xc
  100f84:	e1a00008 	mov	r0, r8
  100f88:	e3a01000 	mov	r1, #0	; 0x0
  100f8c:	ebfffe6e 	bl	10094c <memset>
  100f90:	e3a06000 	mov	r6, #0	; 0x0
  100f94:	e59f707c 	ldr	r7, [pc, #124]	; 101018 <prog+0xfd4>
  100f98:	e1a0a006 	mov	sl, r6
  100f9c:	e1a05006 	mov	r5, r6
  100fa0:	e59f4070 	ldr	r4, [pc, #112]	; 101018 <prog+0xfd4>
  100fa4:	e3a01001 	mov	r1, #1	; 0x1
  100fa8:	e1a00004 	mov	r0, r4
  100fac:	e3a02064 	mov	r2, #100	; 0x64
  100fb0:	eb000662 	bl	102940 <vUSBRecvByte>
  100fb4:	e3500000 	cmp	r0, #0	; 0x0
  100fb8:	0afffff8 	beq	100fa0 <usbshell_task+0x30>
  100fbc:	e3550000 	cmp	r5, #0	; 0x0
  100fc0:	05d4a000 	ldreqb	sl, [r4]
  100fc4:	0a000002 	beq	100fd4 <usbshell_task+0x64>
  100fc8:	e3550001 	cmp	r5, #1	; 0x1
  100fcc:	05d43000 	ldreqb	r3, [r4]
  100fd0:	008a6403 	addeq	r6, sl, r3, lsl #8
  100fd4:	e5d71000 	ldrb	r1, [r7]
  100fd8:	e286c004 	add	ip, r6, #4	; 0x4
  100fdc:	e7c81005 	strb	r1, [r8, r5]
  100fe0:	e2855001 	add	r5, r5, #1	; 0x1
  100fe4:	e3a02000 	mov	r2, #0	; 0x0
  100fe8:	e155000c 	cmp	r5, ip
  100fec:	e59f0020 	ldr	r0, [pc, #32]	; 101014 <prog+0xfd0>
  100ff0:	e1a03002 	mov	r3, r2
  100ff4:	e1a01005 	mov	r1, r5
  100ff8:	1affffe8 	bne	100fa0 <usbshell_task+0x30>
  100ffc:	e3e0c000 	mvn	ip, #0	; 0x0
  101000:	e58dc000 	str	ip, [sp]
  101004:	eb00066f 	bl	1029c8 <usb_send_buffer_zero_copy>
  101008:	e3a05000 	mov	r5, #0	; 0x0
  10100c:	e1a06005 	mov	r6, r5
  101010:	eaffffe2 	b	100fa0 <usbshell_task+0x30>
  101014:	00200ad4 	ldreqd	r0, [r0], -r4
  101018:	00200854 	eoreq	r0, r0, r4, asr r8

0010101c <_sbrk_r>:
  10101c:	e59f2018 	ldr	r2, [pc, #24]	; 10103c <prog+0xff8>
  101020:	e5920000 	ldr	r0, [r2]
  101024:	e3500000 	cmp	r0, #0	; 0x0
  101028:	059f0010 	ldreq	r0, [pc, #16]	; 101040 <prog+0xffc>
  10102c:	e0803001 	add	r3, r0, r1
  101030:	05820000 	streq	r0, [r2]
  101034:	e5823000 	str	r3, [r2]
  101038:	e12fff1e 	bx	lr
  10103c:	00200858 	eoreq	r0, r0, r8, asr r8
  101040:	00201134 	eoreq	r1, r0, r4, lsr r1

00101044 <led_init>:
  101044:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  101048:	e3a03501 	mov	r3, #4194304	; 0x400000
  10104c:	e50230ff 	str	r3, [r2, #-255]
  101050:	e50230ef 	str	r3, [r2, #-239]
  101054:	e50230cf 	str	r3, [r2, #-207]
  101058:	e12fff1e 	bx	lr

0010105c <led_set_green>:
  10105c:	e31000ff 	tst	r0, #255	; 0xff
  101060:	13a02501 	movne	r2, #4194304	; 0x400000
  101064:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  101068:	03a02501 	moveq	r2, #4194304	; 0x400000
  10106c:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  101070:	150320cb 	strne	r2, [r3, #-203]
  101074:	050320cf 	streq	r2, [r3, #-207]
  101078:	e12fff1e 	bx	lr

0010107c <env_crc16>:
  10107c:	e3500000 	cmp	r0, #0	; 0x0
  101080:	13510000 	cmpne	r1, #0	; 0x0
  101084:	e52de004 	str	lr, [sp, #-4]!
  101088:	e1a0e000 	mov	lr, r0
  10108c:	0a000015 	beq	1010e8 <env_crc16+0x6c>
  101090:	e3510000 	cmp	r1, #0	; 0x0
  101094:	0a000013 	beq	1010e8 <env_crc16+0x6c>
  101098:	e3a00801 	mov	r0, #65536	; 0x10000
  10109c:	e2400001 	sub	r0, r0, #1	; 0x1
  1010a0:	e3a0c000 	mov	ip, #0	; 0x0
  1010a4:	e7dc200e 	ldrb	r2, [ip, lr]
  1010a8:	e1a03400 	mov	r3, r0, lsl #8
  1010ac:	e1833420 	orr	r3, r3, r0, lsr #8
  1010b0:	e0233002 	eor	r3, r3, r2
  1010b4:	e1a03803 	mov	r3, r3, lsl #16
  1010b8:	e1a03823 	mov	r3, r3, lsr #16
  1010bc:	e20320ff 	and	r2, r3, #255	; 0xff
  1010c0:	e0233222 	eor	r3, r3, r2, lsr #4
  1010c4:	e0233603 	eor	r3, r3, r3, lsl #12
  1010c8:	e1a03803 	mov	r3, r3, lsl #16
  1010cc:	e1a03823 	mov	r3, r3, lsr #16
  1010d0:	e28cc001 	add	ip, ip, #1	; 0x1
  1010d4:	e20320ff 	and	r2, r3, #255	; 0xff
  1010d8:	e15c0001 	cmp	ip, r1
  1010dc:	e0230282 	eor	r0, r3, r2, lsl #5
  1010e0:	1affffef 	bne	1010a4 <env_crc16+0x28>
  1010e4:	e49df004 	ldr	pc, [sp], #4
  1010e8:	e3a00801 	mov	r0, #65536	; 0x10000
  1010ec:	e2400001 	sub	r0, r0, #1	; 0x1
  1010f0:	e49df004 	ldr	pc, [sp], #4

001010f4 <env_init>:
  1010f4:	e3a03831 	mov	r3, #3211264	; 0x310000
  1010f8:	e2833c03 	add	r3, r3, #768	; 0x300
  1010fc:	e3e02000 	mvn	r2, #0	; 0x0
  101100:	e502309f 	str	r3, [r2, #-159]
  101104:	e12fff1e 	bx	lr

00101108 <env_load>:
  101108:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10110c:	e59f50b8 	ldr	r5, [pc, #184]	; 1011cc <prog+0x1188>
  101110:	e3a0194f 	mov	r1, #1294336	; 0x13c000
  101114:	e2811a03 	add	r1, r1, #12288	; 0x3000
  101118:	e3a02080 	mov	r2, #128	; 0x80
  10111c:	e1a00005 	mov	r0, r5
  101120:	ebfffde1 	bl	1008ac <memcpy>
  101124:	e5d52001 	ldrb	r2, [r5, #1]
  101128:	e5d53000 	ldrb	r3, [r5]
  10112c:	e5d51002 	ldrb	r1, [r5, #2]
  101130:	e1833402 	orr	r3, r3, r2, lsl #8
  101134:	e5d50003 	ldrb	r0, [r5, #3]
  101138:	e3e024f3 	mvn	r2, #-218103808	; 0xf3000000
  10113c:	e1833801 	orr	r3, r3, r1, lsl #16
  101140:	e24229cd 	sub	r2, r2, #3358720	; 0x334000
  101144:	e1833c00 	orr	r3, r3, r0, lsl #24
  101148:	e2422e11 	sub	r2, r2, #272	; 0x110
  10114c:	e1530002 	cmp	r3, r2
  101150:	0a000001 	beq	10115c <env_load+0x54>
  101154:	e3a00000 	mov	r0, #0	; 0x0
  101158:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10115c:	e5d53004 	ldrb	r3, [r5, #4]
  101160:	e5d52005 	ldrb	r2, [r5, #5]
  101164:	e5d5c006 	ldrb	ip, [r5, #6]
  101168:	e5d51007 	ldrb	r1, [r5, #7]
  10116c:	e1833402 	orr	r3, r3, r2, lsl #8
  101170:	e183380c 	orr	r3, r3, ip, lsl #16
  101174:	e1833c01 	orr	r3, r3, r1, lsl #24
  101178:	e3530080 	cmp	r3, #128	; 0x80
  10117c:	e1a00005 	mov	r0, r5
  101180:	e3a0e000 	mov	lr, #0	; 0x0
  101184:	e1a01003 	mov	r1, r3
  101188:	1afffff1 	bne	101154 <env_load+0x4c>
  10118c:	e5d54008 	ldrb	r4, [r5, #8]
  101190:	e5d53009 	ldrb	r3, [r5, #9]
  101194:	e5d5200a 	ldrb	r2, [r5, #10]
  101198:	e5d5c00b 	ldrb	ip, [r5, #11]
  10119c:	e1844403 	orr	r4, r4, r3, lsl #8
  1011a0:	e1844802 	orr	r4, r4, r2, lsl #16
  1011a4:	e1844c0c 	orr	r4, r4, ip, lsl #24
  1011a8:	e5c5e00b 	strb	lr, [r5, #11]
  1011ac:	e5c5e008 	strb	lr, [r5, #8]
  1011b0:	e5c5e009 	strb	lr, [r5, #9]
  1011b4:	e5c5e00a 	strb	lr, [r5, #10]
  1011b8:	ebffffaf 	bl	10107c <env_crc16>
  1011bc:	e1540000 	cmp	r4, r0
  1011c0:	13a00000 	movne	r0, #0	; 0x0
  1011c4:	03a00001 	moveq	r0, #1	; 0x1
  1011c8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1011cc:	002010b0 	streqh	r1, [r0], -r0

001011d0 <AT91F_LowLevelInit>:
  1011d0:	e3a0184b 	mov	r1, #4915200	; 0x4b0000
  1011d4:	e3a00502 	mov	r0, #8388608	; 0x800000
  1011d8:	e3a0cc06 	mov	ip, #1536	; 0x600
  1011dc:	e52de004 	str	lr, [sp, #-4]!
  1011e0:	e2811c01 	add	r1, r1, #256	; 0x100
  1011e4:	e2800d82 	add	r0, r0, #8320	; 0x2080
  1011e8:	e28cc001 	add	ip, ip, #1	; 0x1
  1011ec:	e3e0ec03 	mvn	lr, #768	; 0x300
  1011f0:	e3e03000 	mvn	r3, #0	; 0x0
  1011f4:	e3e02c02 	mvn	r2, #512	; 0x200
  1011f8:	e503109f 	str	r1, [r3, #-159]
  1011fc:	e50200bb 	str	r0, [r2, #-187]
  101200:	e50ec0df 	str	ip, [lr, #-223]
  101204:	e51e3097 	ldr	r3, [lr, #-151]
  101208:	e3130001 	tst	r3, #1	; 0x1
  10120c:	0afffffc 	beq	101204 <AT91F_LowLevelInit+0x34>
  101210:	e3a03819 	mov	r3, #1638400	; 0x190000
  101214:	e2833b07 	add	r3, r3, #7168	; 0x1c00
  101218:	e2833005 	add	r3, r3, #5	; 0x5
  10121c:	e50e30d3 	str	r3, [lr, #-211]
  101220:	e3e02c03 	mvn	r2, #768	; 0x300
  101224:	e5123097 	ldr	r3, [r2, #-151]
  101228:	e3130004 	tst	r3, #4	; 0x4
  10122c:	0afffffc 	beq	101224 <AT91F_LowLevelInit+0x54>
  101230:	e3a03004 	mov	r3, #4	; 0x4
  101234:	e50230cf 	str	r3, [r2, #-207]
  101238:	e3e02c03 	mvn	r2, #768	; 0x300
  10123c:	e5123097 	ldr	r3, [r2, #-151]
  101240:	e3130008 	tst	r3, #8	; 0x8
  101244:	0afffffc 	beq	10123c <AT91F_LowLevelInit+0x6c>
  101248:	e51230cf 	ldr	r3, [r2, #-207]
  10124c:	e3833003 	orr	r3, r3, #3	; 0x3
  101250:	e50230cf 	str	r3, [r2, #-207]
  101254:	e3e02c03 	mvn	r2, #768	; 0x300
  101258:	e5123097 	ldr	r3, [r2, #-151]
  10125c:	e3130008 	tst	r3, #8	; 0x8
  101260:	0afffffc 	beq	101258 <AT91F_LowLevelInit+0x88>
  101264:	e49df004 	ldr	pc, [sp], #4

00101268 <AT91F_AIC_ConfigureIt>:
  101268:	e92d4010 	stmdb	sp!, {r4, lr}
  10126c:	e3a0e001 	mov	lr, #1	; 0x1
  101270:	e1a0e01e 	mov	lr, lr, lsl r0
  101274:	e1a0c100 	mov	ip, r0, lsl #2
  101278:	e51c0f80 	ldr	r0, [ip, #-3968]
  10127c:	e1822001 	orr	r2, r2, r1
  101280:	e24c4a01 	sub	r4, ip, #4096	; 0x1000
  101284:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  101288:	e1a00003 	mov	r0, r3
  10128c:	e581e025 	str	lr, [r1, #37]
  101290:	e50c3f80 	str	r3, [ip, #-3968]
  101294:	e5842000 	str	r2, [r4]
  101298:	e581e029 	str	lr, [r1, #41]
  10129c:	e8bd8010 	ldmia	sp!, {r4, pc}

001012a0 <vListInitialise>:
  1012a0:	e3e03000 	mvn	r3, #0	; 0x0
  1012a4:	e5803008 	str	r3, [r0, #8]
  1012a8:	e2802008 	add	r2, r0, #8	; 0x8
  1012ac:	e2833001 	add	r3, r3, #1	; 0x1
  1012b0:	e580200c 	str	r2, [r0, #12]
  1012b4:	e5802010 	str	r2, [r0, #16]
  1012b8:	e5802004 	str	r2, [r0, #4]
  1012bc:	e5803000 	str	r3, [r0]
  1012c0:	e12fff1e 	bx	lr

001012c4 <vListInitialiseItem>:
  1012c4:	e3a03000 	mov	r3, #0	; 0x0
  1012c8:	e5803010 	str	r3, [r0, #16]
  1012cc:	e12fff1e 	bx	lr

001012d0 <vListInsertEnd>:
  1012d0:	e5902004 	ldr	r2, [r0, #4]
  1012d4:	e5923004 	ldr	r3, [r2, #4]
  1012d8:	e5813004 	str	r3, [r1, #4]
  1012dc:	e592c004 	ldr	ip, [r2, #4]
  1012e0:	e5812008 	str	r2, [r1, #8]
  1012e4:	e58c1008 	str	r1, [ip, #8]
  1012e8:	e5821004 	str	r1, [r2, #4]
  1012ec:	e5903000 	ldr	r3, [r0]
  1012f0:	e2833001 	add	r3, r3, #1	; 0x1
  1012f4:	e5803000 	str	r3, [r0]
  1012f8:	e5810010 	str	r0, [r1, #16]
  1012fc:	e5801004 	str	r1, [r0, #4]
  101300:	e12fff1e 	bx	lr

00101304 <vListInsert>:
  101304:	e52de004 	str	lr, [sp, #-4]!
  101308:	e591e000 	ldr	lr, [r1]
  10130c:	e37e0001 	cmn	lr, #1	; 0x1
  101310:	0590c010 	ldreq	ip, [r0, #16]
  101314:	0a000009 	beq	101340 <vListInsert+0x3c>
  101318:	e280c008 	add	ip, r0, #8	; 0x8
  10131c:	e59c3004 	ldr	r3, [ip, #4]
  101320:	e5932000 	ldr	r2, [r3]
  101324:	e15e0002 	cmp	lr, r2
  101328:	3a000004 	bcc	101340 <vListInsert+0x3c>
  10132c:	e59cc004 	ldr	ip, [ip, #4]
  101330:	e59c3004 	ldr	r3, [ip, #4]
  101334:	e5932000 	ldr	r2, [r3]
  101338:	e15e0002 	cmp	lr, r2
  10133c:	2afffffa 	bcs	10132c <vListInsert+0x28>
  101340:	e59c3004 	ldr	r3, [ip, #4]
  101344:	e5831008 	str	r1, [r3, #8]
  101348:	e5813004 	str	r3, [r1, #4]
  10134c:	e58c1004 	str	r1, [ip, #4]
  101350:	e5903000 	ldr	r3, [r0]
  101354:	e2833001 	add	r3, r3, #1	; 0x1
  101358:	e5803000 	str	r3, [r0]
  10135c:	e5810010 	str	r0, [r1, #16]
  101360:	e581c008 	str	ip, [r1, #8]
  101364:	e49df004 	ldr	pc, [sp], #4

00101368 <vListRemove>:
  101368:	e5903004 	ldr	r3, [r0, #4]
  10136c:	e5902008 	ldr	r2, [r0, #8]
  101370:	e5832008 	str	r2, [r3, #8]
  101374:	e5902008 	ldr	r2, [r0, #8]
  101378:	e5901010 	ldr	r1, [r0, #16]
  10137c:	e5823004 	str	r3, [r2, #4]
  101380:	e5913004 	ldr	r3, [r1, #4]
  101384:	e1530000 	cmp	r3, r0
  101388:	e5913000 	ldr	r3, [r1]
  10138c:	05812004 	streq	r2, [r1, #4]
  101390:	e2433001 	sub	r3, r3, #1	; 0x1
  101394:	e3a02000 	mov	r2, #0	; 0x0
  101398:	e5802010 	str	r2, [r0, #16]
  10139c:	e5813000 	str	r3, [r1]
  1013a0:	e12fff1e 	bx	lr

001013a4 <uxQueueMessagesWaiting>:
  1013a4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1013a8:	e1a04000 	mov	r4, r0
  1013ac:	eb0004d6 	bl	10270c <vPortEnterCritical>
  1013b0:	e5945038 	ldr	r5, [r4, #56]
  1013b4:	eb0004df 	bl	102738 <vPortExitCritical>
  1013b8:	e1a00005 	mov	r0, r5
  1013bc:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

001013c0 <prvCopyDataFromQueue>:
  1013c0:	e92d4010 	stmdb	sp!, {r4, lr}
  1013c4:	e5904000 	ldr	r4, [r0]
  1013c8:	e3540000 	cmp	r4, #0	; 0x0
  1013cc:	e1a0e000 	mov	lr, r0
  1013d0:	e1a00001 	mov	r0, r1
  1013d4:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1013d8:	e59ec00c 	ldr	ip, [lr, #12]
  1013dc:	e59e3040 	ldr	r3, [lr, #64]
  1013e0:	e59e1004 	ldr	r1, [lr, #4]
  1013e4:	e08cc003 	add	ip, ip, r3
  1013e8:	e15c0001 	cmp	ip, r1
  1013ec:	e58ec00c 	str	ip, [lr, #12]
  1013f0:	21a0c004 	movcs	ip, r4
  1013f4:	e1a02003 	mov	r2, r3
  1013f8:	e1a0100c 	mov	r1, ip
  1013fc:	258ec00c 	strcs	ip, [lr, #12]
  101400:	e8bd4010 	ldmia	sp!, {r4, lr}
  101404:	eafffd28 	b	1008ac <memcpy>

00101408 <prvCopyDataToQueue>:
  101408:	e5903040 	ldr	r3, [r0, #64]
  10140c:	e3530000 	cmp	r3, #0	; 0x0
  101410:	e92d4010 	stmdb	sp!, {r4, lr}
  101414:	e1a04000 	mov	r4, r0
  101418:	e1a00002 	mov	r0, r2
  10141c:	0a00000e 	beq	10145c <prvCopyDataToQueue+0x54>
  101420:	e3500000 	cmp	r0, #0	; 0x0
  101424:	e1a02003 	mov	r2, r3
  101428:	0a00000f 	beq	10146c <prvCopyDataToQueue+0x64>
  10142c:	e1a02003 	mov	r2, r3
  101430:	e594000c 	ldr	r0, [r4, #12]
  101434:	ebfffd1c 	bl	1008ac <memcpy>
  101438:	e594300c 	ldr	r3, [r4, #12]
  10143c:	e5941040 	ldr	r1, [r4, #64]
  101440:	e5942000 	ldr	r2, [r4]
  101444:	e0613003 	rsb	r3, r1, r3
  101448:	e1530002 	cmp	r3, r2
  10144c:	e584300c 	str	r3, [r4, #12]
  101450:	35943004 	ldrcc	r3, [r4, #4]
  101454:	30613003 	rsbcc	r3, r1, r3
  101458:	3584300c 	strcc	r3, [r4, #12]
  10145c:	e5943038 	ldr	r3, [r4, #56]
  101460:	e2833001 	add	r3, r3, #1	; 0x1
  101464:	e5843038 	str	r3, [r4, #56]
  101468:	e8bd8010 	ldmia	sp!, {r4, pc}
  10146c:	e5940008 	ldr	r0, [r4, #8]
  101470:	ebfffd0d 	bl	1008ac <memcpy>
  101474:	e5943008 	ldr	r3, [r4, #8]
  101478:	e5942040 	ldr	r2, [r4, #64]
  10147c:	e5941004 	ldr	r1, [r4, #4]
  101480:	e0833002 	add	r3, r3, r2
  101484:	e1530001 	cmp	r3, r1
  101488:	e5843008 	str	r3, [r4, #8]
  10148c:	25943000 	ldrcs	r3, [r4]
  101490:	25843008 	strcs	r3, [r4, #8]
  101494:	e5943038 	ldr	r3, [r4, #56]
  101498:	e2833001 	add	r3, r3, #1	; 0x1
  10149c:	e5843038 	str	r3, [r4, #56]
  1014a0:	e8bd8010 	ldmia	sp!, {r4, pc}

001014a4 <xQueueGenericSendFromISR>:
  1014a4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1014a8:	e590c038 	ldr	ip, [r0, #56]
  1014ac:	e590e03c 	ldr	lr, [r0, #60]
  1014b0:	e15c000e 	cmp	ip, lr
  1014b4:	e1a05002 	mov	r5, r2
  1014b8:	e1a04000 	mov	r4, r0
  1014bc:	e3a0c000 	mov	ip, #0	; 0x0
  1014c0:	e1a02003 	mov	r2, r3
  1014c4:	3a000001 	bcc	1014d0 <xQueueGenericSendFromISR+0x2c>
  1014c8:	e1a0000c 	mov	r0, ip
  1014cc:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1014d0:	ebffffcc 	bl	101408 <prvCopyDataToQueue>
  1014d4:	e5943048 	ldr	r3, [r4, #72]
  1014d8:	e3730001 	cmn	r3, #1	; 0x1
  1014dc:	e2833001 	add	r3, r3, #1	; 0x1
  1014e0:	e3a0c001 	mov	ip, #1	; 0x1
  1014e4:	15843048 	strne	r3, [r4, #72]
  1014e8:	1afffff6 	bne	1014c8 <xQueueGenericSendFromISR+0x24>
  1014ec:	e5943024 	ldr	r3, [r4, #36]
  1014f0:	e3530000 	cmp	r3, #0	; 0x0
  1014f4:	e2840024 	add	r0, r4, #36	; 0x24
  1014f8:	1a000001 	bne	101504 <xQueueGenericSendFromISR+0x60>
  1014fc:	e3a0c001 	mov	ip, #1	; 0x1
  101500:	eafffff0 	b	1014c8 <xQueueGenericSendFromISR+0x24>
  101504:	eb00019c 	bl	101b7c <xTaskRemoveFromEventList>
  101508:	e3a03001 	mov	r3, #1	; 0x1
  10150c:	e3500000 	cmp	r0, #0	; 0x0
  101510:	e1a0c003 	mov	ip, r3
  101514:	15853000 	strne	r3, [r5]
  101518:	1affffea 	bne	1014c8 <xQueueGenericSendFromISR+0x24>
  10151c:	eafffff6 	b	1014fc <xQueueGenericSendFromISR+0x58>

00101520 <prvUnlockQueue>:
  101520:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  101524:	e1a04000 	mov	r4, r0
  101528:	eb000477 	bl	10270c <vPortEnterCritical>
  10152c:	e5943048 	ldr	r3, [r4, #72]
  101530:	e3530000 	cmp	r3, #0	; 0x0
  101534:	da000016 	ble	101594 <prvUnlockQueue+0x74>
  101538:	e5943024 	ldr	r3, [r4, #36]
  10153c:	e3530000 	cmp	r3, #0	; 0x0
  101540:	12845024 	addne	r5, r4, #36	; 0x24
  101544:	1a000008 	bne	10156c <prvUnlockQueue+0x4c>
  101548:	ea000011 	b	101594 <prvUnlockQueue+0x74>
  10154c:	e5943048 	ldr	r3, [r4, #72]
  101550:	e2433001 	sub	r3, r3, #1	; 0x1
  101554:	e3530000 	cmp	r3, #0	; 0x0
  101558:	e5843048 	str	r3, [r4, #72]
  10155c:	da00000c 	ble	101594 <prvUnlockQueue+0x74>
  101560:	e5943024 	ldr	r3, [r4, #36]
  101564:	e3530000 	cmp	r3, #0	; 0x0
  101568:	0a000009 	beq	101594 <prvUnlockQueue+0x74>
  10156c:	e1a00005 	mov	r0, r5
  101570:	eb000181 	bl	101b7c <xTaskRemoveFromEventList>
  101574:	e3500000 	cmp	r0, #0	; 0x0
  101578:	0afffff3 	beq	10154c <prvUnlockQueue+0x2c>
  10157c:	eb000140 	bl	101a84 <vTaskMissedYield>
  101580:	e5943048 	ldr	r3, [r4, #72]
  101584:	e2433001 	sub	r3, r3, #1	; 0x1
  101588:	e3530000 	cmp	r3, #0	; 0x0
  10158c:	e5843048 	str	r3, [r4, #72]
  101590:	cafffff2 	bgt	101560 <prvUnlockQueue+0x40>
  101594:	e3e03000 	mvn	r3, #0	; 0x0
  101598:	e5843048 	str	r3, [r4, #72]
  10159c:	eb000465 	bl	102738 <vPortExitCritical>
  1015a0:	eb000459 	bl	10270c <vPortEnterCritical>
  1015a4:	e5943044 	ldr	r3, [r4, #68]
  1015a8:	e3530000 	cmp	r3, #0	; 0x0
  1015ac:	da000016 	ble	10160c <prvUnlockQueue+0xec>
  1015b0:	e5943010 	ldr	r3, [r4, #16]
  1015b4:	e3530000 	cmp	r3, #0	; 0x0
  1015b8:	12845010 	addne	r5, r4, #16	; 0x10
  1015bc:	1a000008 	bne	1015e4 <prvUnlockQueue+0xc4>
  1015c0:	ea000011 	b	10160c <prvUnlockQueue+0xec>
  1015c4:	e5943044 	ldr	r3, [r4, #68]
  1015c8:	e2433001 	sub	r3, r3, #1	; 0x1
  1015cc:	e3530000 	cmp	r3, #0	; 0x0
  1015d0:	e5843044 	str	r3, [r4, #68]
  1015d4:	da00000c 	ble	10160c <prvUnlockQueue+0xec>
  1015d8:	e5943010 	ldr	r3, [r4, #16]
  1015dc:	e3530000 	cmp	r3, #0	; 0x0
  1015e0:	0a000009 	beq	10160c <prvUnlockQueue+0xec>
  1015e4:	e1a00005 	mov	r0, r5
  1015e8:	eb000163 	bl	101b7c <xTaskRemoveFromEventList>
  1015ec:	e3500000 	cmp	r0, #0	; 0x0
  1015f0:	0afffff3 	beq	1015c4 <prvUnlockQueue+0xa4>
  1015f4:	eb000122 	bl	101a84 <vTaskMissedYield>
  1015f8:	e5943044 	ldr	r3, [r4, #68]
  1015fc:	e2433001 	sub	r3, r3, #1	; 0x1
  101600:	e3530000 	cmp	r3, #0	; 0x0
  101604:	e5843044 	str	r3, [r4, #68]
  101608:	cafffff2 	bgt	1015d8 <prvUnlockQueue+0xb8>
  10160c:	e3e03000 	mvn	r3, #0	; 0x0
  101610:	e5843044 	str	r3, [r4, #68]
  101614:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  101618:	ea000446 	b	102738 <vPortExitCritical>

0010161c <xQueueGenericReceive>:
  10161c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  101620:	e1a05000 	mov	r5, r0
  101624:	e24dd00c 	sub	sp, sp, #12	; 0xc
  101628:	e1a06001 	mov	r6, r1
  10162c:	e1a07003 	mov	r7, r3
  101630:	e3a04001 	mov	r4, #1	; 0x1
  101634:	e58d2000 	str	r2, [sp]
  101638:	ea00000d 	b	101674 <xQueueGenericReceive+0x58>
  10163c:	eb000432 	bl	10270c <vPortEnterCritical>
  101640:	e5953038 	ldr	r3, [r5, #56]
  101644:	e3530000 	cmp	r3, #0	; 0x0
  101648:	1a000030 	bne	101710 <xQueueGenericReceive+0xf4>
  10164c:	eb000439 	bl	102738 <vPortExitCritical>
  101650:	e59d3000 	ldr	r3, [sp]
  101654:	e3530000 	cmp	r3, #0	; 0x0
  101658:	0a000040 	beq	101760 <xQueueGenericReceive+0x144>
  10165c:	e28d0004 	add	r0, sp, #4	; 0x4
  101660:	e1a0100d 	mov	r1, sp
  101664:	eb00010b 	bl	101a98 <xTaskCheckForTimeOut>
  101668:	e3500000 	cmp	r0, #0	; 0x0
  10166c:	e3e04000 	mvn	r4, #0	; 0x0
  101670:	1a00003a 	bne	101760 <xQueueGenericReceive+0x144>
  101674:	e59d3000 	ldr	r3, [sp]
  101678:	e3530000 	cmp	r3, #0	; 0x0
  10167c:	0affffee 	beq	10163c <xQueueGenericReceive+0x20>
  101680:	eb000134 	bl	101b58 <vTaskSuspendAll>
  101684:	eb000420 	bl	10270c <vPortEnterCritical>
  101688:	e5953044 	ldr	r3, [r5, #68]
  10168c:	e3730001 	cmn	r3, #1	; 0x1
  101690:	02833001 	addeq	r3, r3, #1	; 0x1
  101694:	05853044 	streq	r3, [r5, #68]
  101698:	e5953048 	ldr	r3, [r5, #72]
  10169c:	e3730001 	cmn	r3, #1	; 0x1
  1016a0:	02833001 	addeq	r3, r3, #1	; 0x1
  1016a4:	05853048 	streq	r3, [r5, #72]
  1016a8:	eb000422 	bl	102738 <vPortExitCritical>
  1016ac:	e3540001 	cmp	r4, #1	; 0x1
  1016b0:	0a00002d 	beq	10176c <xQueueGenericReceive+0x150>
  1016b4:	eb000414 	bl	10270c <vPortEnterCritical>
  1016b8:	e5954038 	ldr	r4, [r5, #56]
  1016bc:	eb00041d 	bl	102738 <vPortExitCritical>
  1016c0:	e3540000 	cmp	r4, #0	; 0x0
  1016c4:	1a000021 	bne	101750 <xQueueGenericReceive+0x134>
  1016c8:	e28d0004 	add	r0, sp, #4	; 0x4
  1016cc:	e1a0100d 	mov	r1, sp
  1016d0:	eb0000f0 	bl	101a98 <xTaskCheckForTimeOut>
  1016d4:	e3500000 	cmp	r0, #0	; 0x0
  1016d8:	1a00001c 	bne	101750 <xQueueGenericReceive+0x134>
  1016dc:	e59d1000 	ldr	r1, [sp]
  1016e0:	e2850024 	add	r0, r5, #36	; 0x24
  1016e4:	eb0001a8 	bl	101d8c <vTaskPlaceOnEventList>
  1016e8:	e1a00005 	mov	r0, r5
  1016ec:	ebffff8b 	bl	101520 <prvUnlockQueue>
  1016f0:	eb000275 	bl	1020cc <xTaskResumeAll>
  1016f4:	e3500000 	cmp	r0, #0	; 0x0
  1016f8:	1affffcf 	bne	10163c <xQueueGenericReceive+0x20>
  1016fc:	ef000000 	swi	0x00000000
  101700:	eb000401 	bl	10270c <vPortEnterCritical>
  101704:	e5953038 	ldr	r3, [r5, #56]
  101708:	e3530000 	cmp	r3, #0	; 0x0
  10170c:	0affffce 	beq	10164c <xQueueGenericReceive+0x30>
  101710:	e1a01006 	mov	r1, r6
  101714:	e1a00005 	mov	r0, r5
  101718:	e595400c 	ldr	r4, [r5, #12]
  10171c:	ebffff27 	bl	1013c0 <prvCopyDataFromQueue>
  101720:	e3570000 	cmp	r7, #0	; 0x0
  101724:	0a000013 	beq	101778 <xQueueGenericReceive+0x15c>
  101728:	e5953024 	ldr	r3, [r5, #36]
  10172c:	e3530000 	cmp	r3, #0	; 0x0
  101730:	e585400c 	str	r4, [r5, #12]
  101734:	0a000015 	beq	101790 <xQueueGenericReceive+0x174>
  101738:	e2850024 	add	r0, r5, #36	; 0x24
  10173c:	eb00010e 	bl	101b7c <xTaskRemoveFromEventList>
  101740:	e3500000 	cmp	r0, #0	; 0x0
  101744:	0a000011 	beq	101790 <xQueueGenericReceive+0x174>
  101748:	ef000000 	swi	0x00000000
  10174c:	ea00000f 	b	101790 <xQueueGenericReceive+0x174>
  101750:	e1a00005 	mov	r0, r5
  101754:	ebffff71 	bl	101520 <prvUnlockQueue>
  101758:	eb00025b 	bl	1020cc <xTaskResumeAll>
  10175c:	eaffffb6 	b	10163c <xQueueGenericReceive+0x20>
  101760:	e3a00000 	mov	r0, #0	; 0x0
  101764:	e28dd00c 	add	sp, sp, #12	; 0xc
  101768:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10176c:	e28d0004 	add	r0, sp, #4	; 0x4
  101770:	eb0000bb 	bl	101a64 <vTaskSetTimeOutState>
  101774:	eaffffce 	b	1016b4 <xQueueGenericReceive+0x98>
  101778:	e5953038 	ldr	r3, [r5, #56]
  10177c:	e2433001 	sub	r3, r3, #1	; 0x1
  101780:	e5853038 	str	r3, [r5, #56]
  101784:	e5952010 	ldr	r2, [r5, #16]
  101788:	e3520000 	cmp	r2, #0	; 0x0
  10178c:	1a000002 	bne	10179c <xQueueGenericReceive+0x180>
  101790:	eb0003e8 	bl	102738 <vPortExitCritical>
  101794:	e3a00001 	mov	r0, #1	; 0x1
  101798:	eafffff1 	b	101764 <xQueueGenericReceive+0x148>
  10179c:	e2850010 	add	r0, r5, #16	; 0x10
  1017a0:	eb0000f5 	bl	101b7c <xTaskRemoveFromEventList>
  1017a4:	e3500001 	cmp	r0, #1	; 0x1
  1017a8:	1afffff8 	bne	101790 <xQueueGenericReceive+0x174>
  1017ac:	ef000000 	swi	0x00000000
  1017b0:	eafffff6 	b	101790 <xQueueGenericReceive+0x174>

001017b4 <xQueueGenericSend>:
  1017b4:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  1017b8:	e1a06000 	mov	r6, r0
  1017bc:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1017c0:	e1a07001 	mov	r7, r1
  1017c4:	e1a08003 	mov	r8, r3
  1017c8:	e3a04001 	mov	r4, #1	; 0x1
  1017cc:	e58d2000 	str	r2, [sp]
  1017d0:	ea00000e 	b	101810 <xQueueGenericSend+0x5c>
  1017d4:	eb0003cc 	bl	10270c <vPortEnterCritical>
  1017d8:	e5962038 	ldr	r2, [r6, #56]
  1017dc:	e596303c 	ldr	r3, [r6, #60]
  1017e0:	e1520003 	cmp	r2, r3
  1017e4:	3a000032 	bcc	1018b4 <xQueueGenericSend+0x100>
  1017e8:	eb0003d2 	bl	102738 <vPortExitCritical>
  1017ec:	e59d3000 	ldr	r3, [sp]
  1017f0:	e3530000 	cmp	r3, #0	; 0x0
  1017f4:	0a00003c 	beq	1018ec <xQueueGenericSend+0x138>
  1017f8:	e28d0004 	add	r0, sp, #4	; 0x4
  1017fc:	e1a0100d 	mov	r1, sp
  101800:	eb0000a4 	bl	101a98 <xTaskCheckForTimeOut>
  101804:	e3500000 	cmp	r0, #0	; 0x0
  101808:	e3e04000 	mvn	r4, #0	; 0x0
  10180c:	1a000036 	bne	1018ec <xQueueGenericSend+0x138>
  101810:	e59d3000 	ldr	r3, [sp]
  101814:	e3530000 	cmp	r3, #0	; 0x0
  101818:	0affffed 	beq	1017d4 <xQueueGenericSend+0x20>
  10181c:	eb0000cd 	bl	101b58 <vTaskSuspendAll>
  101820:	eb0003b9 	bl	10270c <vPortEnterCritical>
  101824:	e5963044 	ldr	r3, [r6, #68]
  101828:	e3730001 	cmn	r3, #1	; 0x1
  10182c:	02833001 	addeq	r3, r3, #1	; 0x1
  101830:	05863044 	streq	r3, [r6, #68]
  101834:	e5963048 	ldr	r3, [r6, #72]
  101838:	e3730001 	cmn	r3, #1	; 0x1
  10183c:	02833001 	addeq	r3, r3, #1	; 0x1
  101840:	05863048 	streq	r3, [r6, #72]
  101844:	eb0003bb 	bl	102738 <vPortExitCritical>
  101848:	e3540001 	cmp	r4, #1	; 0x1
  10184c:	0a000029 	beq	1018f8 <xQueueGenericSend+0x144>
  101850:	eb0003ad 	bl	10270c <vPortEnterCritical>
  101854:	e5965038 	ldr	r5, [r6, #56]
  101858:	e596403c 	ldr	r4, [r6, #60]
  10185c:	eb0003b5 	bl	102738 <vPortExitCritical>
  101860:	e1550004 	cmp	r5, r4
  101864:	1a00001c 	bne	1018dc <xQueueGenericSend+0x128>
  101868:	e28d0004 	add	r0, sp, #4	; 0x4
  10186c:	e1a0100d 	mov	r1, sp
  101870:	eb000088 	bl	101a98 <xTaskCheckForTimeOut>
  101874:	e3500000 	cmp	r0, #0	; 0x0
  101878:	1a000017 	bne	1018dc <xQueueGenericSend+0x128>
  10187c:	e59d1000 	ldr	r1, [sp]
  101880:	e2860010 	add	r0, r6, #16	; 0x10
  101884:	eb000140 	bl	101d8c <vTaskPlaceOnEventList>
  101888:	e1a00006 	mov	r0, r6
  10188c:	ebffff23 	bl	101520 <prvUnlockQueue>
  101890:	eb00020d 	bl	1020cc <xTaskResumeAll>
  101894:	e3500000 	cmp	r0, #0	; 0x0
  101898:	1affffcd 	bne	1017d4 <xQueueGenericSend+0x20>
  10189c:	ef000000 	swi	0x00000000
  1018a0:	eb000399 	bl	10270c <vPortEnterCritical>
  1018a4:	e5962038 	ldr	r2, [r6, #56]
  1018a8:	e596303c 	ldr	r3, [r6, #60]
  1018ac:	e1520003 	cmp	r2, r3
  1018b0:	2affffcc 	bcs	1017e8 <xQueueGenericSend+0x34>
  1018b4:	e1a01007 	mov	r1, r7
  1018b8:	e1a02008 	mov	r2, r8
  1018bc:	e1a00006 	mov	r0, r6
  1018c0:	ebfffed0 	bl	101408 <prvCopyDataToQueue>
  1018c4:	e5963024 	ldr	r3, [r6, #36]
  1018c8:	e3530000 	cmp	r3, #0	; 0x0
  1018cc:	1a00000c 	bne	101904 <xQueueGenericSend+0x150>
  1018d0:	eb000398 	bl	102738 <vPortExitCritical>
  1018d4:	e3a00001 	mov	r0, #1	; 0x1
  1018d8:	ea000004 	b	1018f0 <xQueueGenericSend+0x13c>
  1018dc:	e1a00006 	mov	r0, r6
  1018e0:	ebffff0e 	bl	101520 <prvUnlockQueue>
  1018e4:	eb0001f8 	bl	1020cc <xTaskResumeAll>
  1018e8:	eaffffb9 	b	1017d4 <xQueueGenericSend+0x20>
  1018ec:	e3a00000 	mov	r0, #0	; 0x0
  1018f0:	e28dd00c 	add	sp, sp, #12	; 0xc
  1018f4:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1018f8:	e28d0004 	add	r0, sp, #4	; 0x4
  1018fc:	eb000058 	bl	101a64 <vTaskSetTimeOutState>
  101900:	eaffffd2 	b	101850 <xQueueGenericSend+0x9c>
  101904:	e2860024 	add	r0, r6, #36	; 0x24
  101908:	eb00009b 	bl	101b7c <xTaskRemoveFromEventList>
  10190c:	e3500001 	cmp	r0, #1	; 0x1
  101910:	1affffee 	bne	1018d0 <xQueueGenericSend+0x11c>
  101914:	ef000000 	swi	0x00000000
  101918:	eaffffec 	b	1018d0 <xQueueGenericSend+0x11c>

0010191c <xQueueCreate>:
  10191c:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  101920:	e2507000 	subs	r7, r0, #0	; 0x0
  101924:	e1a06001 	mov	r6, r1
  101928:	e3a0004c 	mov	r0, #76	; 0x4c
  10192c:	1a000002 	bne	10193c <xQueueCreate+0x20>
  101930:	e3a05000 	mov	r5, #0	; 0x0
  101934:	e1a00005 	mov	r0, r5
  101938:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10193c:	eb0003f0 	bl	102904 <pvPortMalloc>
  101940:	e3500000 	cmp	r0, #0	; 0x0
  101944:	e1a05000 	mov	r5, r0
  101948:	0afffff8 	beq	101930 <xQueueCreate+0x14>
  10194c:	e0040796 	mul	r4, r6, r7
  101950:	e2840001 	add	r0, r4, #1	; 0x1
  101954:	eb0003ea 	bl	102904 <pvPortMalloc>
  101958:	e1a08000 	mov	r8, r0
  10195c:	e3580000 	cmp	r8, #0	; 0x0
  101960:	e0803004 	add	r3, r0, r4
  101964:	e2472001 	sub	r2, r7, #1	; 0x1
  101968:	e3e01000 	mvn	r1, #0	; 0x0
  10196c:	e2850010 	add	r0, r5, #16	; 0x10
  101970:	e5858000 	str	r8, [r5]
  101974:	0a00000d 	beq	1019b0 <xQueueCreate+0x94>
  101978:	e0228296 	mla	r2, r6, r2, r8
  10197c:	e5853004 	str	r3, [r5, #4]
  101980:	e3a03000 	mov	r3, #0	; 0x0
  101984:	e5853038 	str	r3, [r5, #56]
  101988:	e585200c 	str	r2, [r5, #12]
  10198c:	e585703c 	str	r7, [r5, #60]
  101990:	e5856040 	str	r6, [r5, #64]
  101994:	e5851048 	str	r1, [r5, #72]
  101998:	e5858008 	str	r8, [r5, #8]
  10199c:	e5851044 	str	r1, [r5, #68]
  1019a0:	ebfffe3e 	bl	1012a0 <vListInitialise>
  1019a4:	e2850024 	add	r0, r5, #36	; 0x24
  1019a8:	ebfffe3c 	bl	1012a0 <vListInitialise>
  1019ac:	eaffffe0 	b	101934 <xQueueCreate+0x18>
  1019b0:	e1a00005 	mov	r0, r5
  1019b4:	eb0003ca 	bl	1028e4 <vPortFree>
  1019b8:	e1a05008 	mov	r5, r8
  1019bc:	eaffffdc 	b	101934 <xQueueCreate+0x18>

001019c0 <vTaskSwitchContext>:
  1019c0:	e59f3088 	ldr	r3, [pc, #136]	; 101a50 <prog+0x1a0c>
  1019c4:	e5932000 	ldr	r2, [r3]
  1019c8:	e3520000 	cmp	r2, #0	; 0x0
  1019cc:	159f3080 	ldrne	r3, [pc, #128]	; 101a54 <prog+0x1a10>
  1019d0:	13a02001 	movne	r2, #1	; 0x1
  1019d4:	15832000 	strne	r2, [r3]
  1019d8:	112fff1e 	bxne	lr
  1019dc:	e59f1074 	ldr	r1, [pc, #116]	; 101a58 <prog+0x1a14>
  1019e0:	e5913000 	ldr	r3, [r1]
  1019e4:	e59f0070 	ldr	r0, [pc, #112]	; 101a5c <prog+0x1a18>
  1019e8:	e0833103 	add	r3, r3, r3, lsl #2
  1019ec:	e7902103 	ldr	r2, [r0, r3, lsl #2]
  1019f0:	e3520000 	cmp	r2, #0	; 0x0
  1019f4:	1a000007 	bne	101a18 <vTaskSwitchContext+0x58>
  1019f8:	e5913000 	ldr	r3, [r1]
  1019fc:	e2433001 	sub	r3, r3, #1	; 0x1
  101a00:	e5813000 	str	r3, [r1]
  101a04:	e5912000 	ldr	r2, [r1]
  101a08:	e0822102 	add	r2, r2, r2, lsl #2
  101a0c:	e7903102 	ldr	r3, [r0, r2, lsl #2]
  101a10:	e3530000 	cmp	r3, #0	; 0x0
  101a14:	0afffff7 	beq	1019f8 <vTaskSwitchContext+0x38>
  101a18:	e5913000 	ldr	r3, [r1]
  101a1c:	e0833103 	add	r3, r3, r3, lsl #2
  101a20:	e0802103 	add	r2, r0, r3, lsl #2
  101a24:	e5921004 	ldr	r1, [r2, #4]
  101a28:	e5911004 	ldr	r1, [r1, #4]
  101a2c:	e2823008 	add	r3, r2, #8	; 0x8
  101a30:	e5821004 	str	r1, [r2, #4]
  101a34:	e1510003 	cmp	r1, r3
  101a38:	05911004 	ldreq	r1, [r1, #4]
  101a3c:	e59f301c 	ldr	r3, [pc, #28]	; 101a60 <prog+0x1a1c>
  101a40:	05821004 	streq	r1, [r2, #4]
  101a44:	e591200c 	ldr	r2, [r1, #12]
  101a48:	e5832000 	str	r2, [r3]
  101a4c:	e12fff1e 	bx	lr
  101a50:	0020086c 	eoreq	r0, r0, ip, ror #16
  101a54:	00200860 	eoreq	r0, r0, r0, ror #16
  101a58:	00200870 	eoreq	r0, r0, r0, ror r8
  101a5c:	00200888 	eoreq	r0, r0, r8, lsl #17
  101a60:	0020085c 	eoreq	r0, r0, ip, asr r8

00101a64 <vTaskSetTimeOutState>:
  101a64:	e59f3010 	ldr	r3, [pc, #16]	; 101a7c <prog+0x1a38>
  101a68:	e59f2010 	ldr	r2, [pc, #16]	; 101a80 <prog+0x1a3c>
  101a6c:	e5931000 	ldr	r1, [r3]
  101a70:	e5923000 	ldr	r3, [r2]
  101a74:	e880000a 	stmia	r0, {r1, r3}
  101a78:	e12fff1e 	bx	lr
  101a7c:	00200864 	eoreq	r0, r0, r4, ror #16
  101a80:	00200868 	eoreq	r0, r0, r8, ror #16

00101a84 <vTaskMissedYield>:
  101a84:	e59f3008 	ldr	r3, [pc, #8]	; 101a94 <prog+0x1a50>
  101a88:	e3a02001 	mov	r2, #1	; 0x1
  101a8c:	e5832000 	str	r2, [r3]
  101a90:	e12fff1e 	bx	lr
  101a94:	00200860 	eoreq	r0, r0, r0, ror #16

00101a98 <xTaskCheckForTimeOut>:
  101a98:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101a9c:	e1a06001 	mov	r6, r1
  101aa0:	e1a04000 	mov	r4, r0
  101aa4:	eb000318 	bl	10270c <vPortEnterCritical>
  101aa8:	e596c000 	ldr	ip, [r6]
  101aac:	e37c0001 	cmn	ip, #1	; 0x1
  101ab0:	e3a05000 	mov	r5, #0	; 0x0
  101ab4:	0a000010 	beq	101afc <xTaskCheckForTimeOut+0x64>
  101ab8:	e59f3090 	ldr	r3, [pc, #144]	; 101b50 <prog+0x1b0c>
  101abc:	e5942000 	ldr	r2, [r4]
  101ac0:	e5931000 	ldr	r1, [r3]
  101ac4:	e1520001 	cmp	r2, r1
  101ac8:	e59fe084 	ldr	lr, [pc, #132]	; 101b54 <prog+0x1b10>
  101acc:	0a000016 	beq	101b2c <xTaskCheckForTimeOut+0x94>
  101ad0:	e59e3000 	ldr	r3, [lr]
  101ad4:	e5941004 	ldr	r1, [r4, #4]
  101ad8:	e1510003 	cmp	r1, r3
  101adc:	9a000005 	bls	101af8 <xTaskCheckForTimeOut+0x60>
  101ae0:	e59e3000 	ldr	r3, [lr]
  101ae4:	e0613003 	rsb	r3, r1, r3
  101ae8:	e15c0003 	cmp	ip, r3
  101aec:	e1a00004 	mov	r0, r4
  101af0:	e3a05000 	mov	r5, #0	; 0x0
  101af4:	8a000003 	bhi	101b08 <xTaskCheckForTimeOut+0x70>
  101af8:	e3a05001 	mov	r5, #1	; 0x1
  101afc:	eb00030d 	bl	102738 <vPortExitCritical>
  101b00:	e1a00005 	mov	r0, r5
  101b04:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101b08:	e59f2044 	ldr	r2, [pc, #68]	; 101b54 <prog+0x1b10>
  101b0c:	e5923000 	ldr	r3, [r2]
  101b10:	e0613003 	rsb	r3, r1, r3
  101b14:	e063300c 	rsb	r3, r3, ip
  101b18:	e5863000 	str	r3, [r6]
  101b1c:	ebffffd0 	bl	101a64 <vTaskSetTimeOutState>
  101b20:	eb000304 	bl	102738 <vPortExitCritical>
  101b24:	e1a00005 	mov	r0, r5
  101b28:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101b2c:	e59fe020 	ldr	lr, [pc, #32]	; 101b54 <prog+0x1b10>
  101b30:	e5941004 	ldr	r1, [r4, #4]
  101b34:	e59e3000 	ldr	r3, [lr]
  101b38:	e0613003 	rsb	r3, r1, r3
  101b3c:	e15c0003 	cmp	ip, r3
  101b40:	e1a00004 	mov	r0, r4
  101b44:	e3a05000 	mov	r5, #0	; 0x0
  101b48:	9affffea 	bls	101af8 <xTaskCheckForTimeOut+0x60>
  101b4c:	eaffffed 	b	101b08 <xTaskCheckForTimeOut+0x70>
  101b50:	00200864 	eoreq	r0, r0, r4, ror #16
  101b54:	00200868 	eoreq	r0, r0, r8, ror #16

00101b58 <vTaskSuspendAll>:
  101b58:	e52de004 	str	lr, [sp, #-4]!
  101b5c:	eb0002ea 	bl	10270c <vPortEnterCritical>
  101b60:	e59f2010 	ldr	r2, [pc, #16]	; 101b78 <prog+0x1b34>
  101b64:	e5923000 	ldr	r3, [r2]
  101b68:	e2833001 	add	r3, r3, #1	; 0x1
  101b6c:	e5823000 	str	r3, [r2]
  101b70:	e49de004 	ldr	lr, [sp], #4
  101b74:	ea0002ef 	b	102738 <vPortExitCritical>
  101b78:	0020086c 	eoreq	r0, r0, ip, ror #16

00101b7c <xTaskRemoveFromEventList>:
  101b7c:	e5903000 	ldr	r3, [r0]
  101b80:	e3530000 	cmp	r3, #0	; 0x0
  101b84:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101b88:	e1a06003 	mov	r6, r3
  101b8c:	1590300c 	ldrne	r3, [r0, #12]
  101b90:	1593600c 	ldrne	r6, [r3, #12]
  101b94:	e2864018 	add	r4, r6, #24	; 0x18
  101b98:	e1a00004 	mov	r0, r4
  101b9c:	ebfffdf1 	bl	101368 <vListRemove>
  101ba0:	e59f3064 	ldr	r3, [pc, #100]	; 101c0c <prog+0x1bc8>
  101ba4:	e5932000 	ldr	r2, [r3]
  101ba8:	e2865004 	add	r5, r6, #4	; 0x4
  101bac:	e3520000 	cmp	r2, #0	; 0x0
  101bb0:	e1a00005 	mov	r0, r5
  101bb4:	e1a01004 	mov	r1, r4
  101bb8:	159f0050 	ldrne	r0, [pc, #80]	; 101c10 <prog+0x1bcc>
  101bbc:	1a000009 	bne	101be8 <xTaskRemoveFromEventList+0x6c>
  101bc0:	ebfffde8 	bl	101368 <vListRemove>
  101bc4:	e59fe048 	ldr	lr, [pc, #72]	; 101c14 <prog+0x1bd0>
  101bc8:	e596c02c 	ldr	ip, [r6, #44]
  101bcc:	e59e2000 	ldr	r2, [lr]
  101bd0:	e59f0040 	ldr	r0, [pc, #64]	; 101c18 <prog+0x1bd4>
  101bd4:	e15c0002 	cmp	ip, r2
  101bd8:	e08c310c 	add	r3, ip, ip, lsl #2
  101bdc:	858ec000 	strhi	ip, [lr]
  101be0:	e1a01005 	mov	r1, r5
  101be4:	e0800103 	add	r0, r0, r3, lsl #2
  101be8:	ebfffdb8 	bl	1012d0 <vListInsertEnd>
  101bec:	e59f3028 	ldr	r3, [pc, #40]	; 101c1c <prog+0x1bd8>
  101bf0:	e5932000 	ldr	r2, [r3]
  101bf4:	e596102c 	ldr	r1, [r6, #44]
  101bf8:	e592002c 	ldr	r0, [r2, #44]
  101bfc:	e1510000 	cmp	r1, r0
  101c00:	33a00000 	movcc	r0, #0	; 0x0
  101c04:	23a00001 	movcs	r0, #1	; 0x1
  101c08:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101c0c:	0020086c 	eoreq	r0, r0, ip, ror #16
  101c10:	0020091c 	eoreq	r0, r0, ip, lsl r9
  101c14:	00200870 	eoreq	r0, r0, r0, ror r8
  101c18:	00200888 	eoreq	r0, r0, r8, lsl #17
  101c1c:	0020085c 	eoreq	r0, r0, ip, asr r8

00101c20 <vTaskIncrementTick>:
  101c20:	e59f3144 	ldr	r3, [pc, #324]	; 101d6c <prog+0x1d28>
  101c24:	e5932000 	ldr	r2, [r3]
  101c28:	e3520000 	cmp	r2, #0	; 0x0
  101c2c:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  101c30:	1a000039 	bne	101d1c <vTaskIncrementTick+0xfc>
  101c34:	e59f6134 	ldr	r6, [pc, #308]	; 101d70 <prog+0x1d2c>
  101c38:	e5963000 	ldr	r3, [r6]
  101c3c:	e2833001 	add	r3, r3, #1	; 0x1
  101c40:	e5863000 	str	r3, [r6]
  101c44:	e5962000 	ldr	r2, [r6]
  101c48:	e3520000 	cmp	r2, #0	; 0x0
  101c4c:	e1a0c006 	mov	ip, r6
  101c50:	159fa11c 	ldrne	sl, [pc, #284]	; 101d74 <prog+0x1d30>
  101c54:	0a000035 	beq	101d30 <vTaskIncrementTick+0x110>
  101c58:	e59a3000 	ldr	r3, [sl]
  101c5c:	e5932000 	ldr	r2, [r3]
  101c60:	e3520000 	cmp	r2, #0	; 0x0
  101c64:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101c68:	e59f3104 	ldr	r3, [pc, #260]	; 101d74 <prog+0x1d30>
  101c6c:	e5932000 	ldr	r2, [r3]
  101c70:	e592100c 	ldr	r1, [r2, #12]
  101c74:	e591300c 	ldr	r3, [r1, #12]
  101c78:	e3530000 	cmp	r3, #0	; 0x0
  101c7c:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101c80:	e1a04003 	mov	r4, r3
  101c84:	e59c2000 	ldr	r2, [ip]
  101c88:	e5933004 	ldr	r3, [r3, #4]
  101c8c:	e1530002 	cmp	r3, r2
  101c90:	959f80e0 	ldrls	r8, [pc, #224]	; 101d78 <prog+0x1d34>
  101c94:	959f70e0 	ldrls	r7, [pc, #224]	; 101d7c <prog+0x1d38>
  101c98:	9a000004 	bls	101cb0 <vTaskIncrementTick+0x90>
  101c9c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101ca0:	e5962000 	ldr	r2, [r6]
  101ca4:	e5943004 	ldr	r3, [r4, #4]
  101ca8:	e1530002 	cmp	r3, r2
  101cac:	88bd85f0 	ldmhiia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101cb0:	e2845004 	add	r5, r4, #4	; 0x4
  101cb4:	e1a00005 	mov	r0, r5
  101cb8:	ebfffdaa 	bl	101368 <vListRemove>
  101cbc:	e5943028 	ldr	r3, [r4, #40]
  101cc0:	e3530000 	cmp	r3, #0	; 0x0
  101cc4:	e2840018 	add	r0, r4, #24	; 0x18
  101cc8:	1bfffda6 	blne	101368 <vListRemove>
  101ccc:	e594202c 	ldr	r2, [r4, #44]
  101cd0:	e5983000 	ldr	r3, [r8]
  101cd4:	e1520003 	cmp	r2, r3
  101cd8:	859f3098 	ldrhi	r3, [pc, #152]	; 101d78 <prog+0x1d34>
  101cdc:	e0820102 	add	r0, r2, r2, lsl #2
  101ce0:	85832000 	strhi	r2, [r3]
  101ce4:	e1a01005 	mov	r1, r5
  101ce8:	e0870100 	add	r0, r7, r0, lsl #2
  101cec:	ebfffd77 	bl	1012d0 <vListInsertEnd>
  101cf0:	e59a3000 	ldr	r3, [sl]
  101cf4:	e5932000 	ldr	r2, [r3]
  101cf8:	e3520000 	cmp	r2, #0	; 0x0
  101cfc:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d00:	e59f306c 	ldr	r3, [pc, #108]	; 101d74 <prog+0x1d30>
  101d04:	e5932000 	ldr	r2, [r3]
  101d08:	e592100c 	ldr	r1, [r2, #12]
  101d0c:	e591300c 	ldr	r3, [r1, #12]
  101d10:	e2534000 	subs	r4, r3, #0	; 0x0
  101d14:	1affffe1 	bne	101ca0 <vTaskIncrementTick+0x80>
  101d18:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d1c:	e59f205c 	ldr	r2, [pc, #92]	; 101d80 <prog+0x1d3c>
  101d20:	e5923000 	ldr	r3, [r2]
  101d24:	e2833001 	add	r3, r3, #1	; 0x1
  101d28:	e5823000 	str	r3, [r2]
  101d2c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d30:	e59fa03c 	ldr	sl, [pc, #60]	; 101d74 <prog+0x1d30>
  101d34:	e59f1048 	ldr	r1, [pc, #72]	; 101d84 <prog+0x1d40>
  101d38:	e59a0000 	ldr	r0, [sl]
  101d3c:	e5913000 	ldr	r3, [r1]
  101d40:	e59f2040 	ldr	r2, [pc, #64]	; 101d88 <prog+0x1d44>
  101d44:	e58a3000 	str	r3, [sl]
  101d48:	e5810000 	str	r0, [r1]
  101d4c:	e5923000 	ldr	r3, [r2]
  101d50:	e2833001 	add	r3, r3, #1	; 0x1
  101d54:	e5823000 	str	r3, [r2]
  101d58:	e59a3000 	ldr	r3, [sl]
  101d5c:	e5932000 	ldr	r2, [r3]
  101d60:	e3520000 	cmp	r2, #0	; 0x0
  101d64:	1affffbf 	bne	101c68 <vTaskIncrementTick+0x48>
  101d68:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d6c:	0020086c 	eoreq	r0, r0, ip, ror #16
  101d70:	00200868 	eoreq	r0, r0, r8, ror #16
  101d74:	00200914 	eoreq	r0, r0, r4, lsl r9
  101d78:	00200870 	eoreq	r0, r0, r0, ror r8
  101d7c:	00200888 	eoreq	r0, r0, r8, lsl #17
  101d80:	00200874 	eoreq	r0, r0, r4, ror r8
  101d84:	00200918 	eoreq	r0, r0, r8, lsl r9
  101d88:	00200864 	eoreq	r0, r0, r4, ror #16

00101d8c <vTaskPlaceOnEventList>:
  101d8c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  101d90:	e59f406c 	ldr	r4, [pc, #108]	; 101e04 <prog+0x1dc0>
  101d94:	e5943000 	ldr	r3, [r4]
  101d98:	e1a05001 	mov	r5, r1
  101d9c:	e2831018 	add	r1, r3, #24	; 0x18
  101da0:	ebfffd57 	bl	101304 <vListInsert>
  101da4:	e5940000 	ldr	r0, [r4]
  101da8:	e2800004 	add	r0, r0, #4	; 0x4
  101dac:	ebfffd6d 	bl	101368 <vListRemove>
  101db0:	e3750001 	cmn	r5, #1	; 0x1
  101db4:	e59f004c 	ldr	r0, [pc, #76]	; 101e08 <prog+0x1dc4>
  101db8:	e59f204c 	ldr	r2, [pc, #76]	; 101e0c <prog+0x1dc8>
  101dbc:	0a00000c 	beq	101df4 <vTaskPlaceOnEventList+0x68>
  101dc0:	e5923000 	ldr	r3, [r2]
  101dc4:	e5941000 	ldr	r1, [r4]
  101dc8:	e5922000 	ldr	r2, [r2]
  101dcc:	e0853003 	add	r3, r5, r3
  101dd0:	e1530002 	cmp	r3, r2
  101dd4:	e5813004 	str	r3, [r1, #4]
  101dd8:	359f3030 	ldrcc	r3, [pc, #48]	; 101e10 <prog+0x1dcc>
  101ddc:	259f3030 	ldrcs	r3, [pc, #48]	; 101e14 <prog+0x1dd0>
  101de0:	e5930000 	ldr	r0, [r3]
  101de4:	e5941000 	ldr	r1, [r4]
  101de8:	e2811004 	add	r1, r1, #4	; 0x4
  101dec:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  101df0:	eafffd43 	b	101304 <vListInsert>
  101df4:	e5941000 	ldr	r1, [r4]
  101df8:	e2811004 	add	r1, r1, #4	; 0x4
  101dfc:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  101e00:	eafffd32 	b	1012d0 <vListInsertEnd>
  101e04:	0020085c 	eoreq	r0, r0, ip, asr r8
  101e08:	00200944 	eoreq	r0, r0, r4, asr #18
  101e0c:	00200868 	eoreq	r0, r0, r8, ror #16
  101e10:	00200918 	eoreq	r0, r0, r8, lsl r9
  101e14:	00200914 	eoreq	r0, r0, r4, lsl r9

00101e18 <xTaskCreate>:
  101e18:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  101e1c:	e1a02802 	mov	r2, r2, lsl #16
  101e20:	e1a0a000 	mov	sl, r0
  101e24:	e3a00044 	mov	r0, #68	; 0x44
  101e28:	e1a05001 	mov	r5, r1
  101e2c:	e1a08003 	mov	r8, r3
  101e30:	e1a07822 	mov	r7, r2, lsr #16
  101e34:	e59db024 	ldr	fp, [sp, #36]
  101e38:	eb0002b1 	bl	102904 <pvPortMalloc>
  101e3c:	e2506000 	subs	r6, r0, #0	; 0x0
  101e40:	02400001 	subeq	r0, r0, #1	; 0x1
  101e44:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  101e48:	e1a04107 	mov	r4, r7, lsl #2
  101e4c:	e1a00004 	mov	r0, r4
  101e50:	eb0002ab 	bl	102904 <pvPortMalloc>
  101e54:	e3500000 	cmp	r0, #0	; 0x0
  101e58:	e5860030 	str	r0, [r6, #48]
  101e5c:	0a00006b 	beq	102010 <xTaskCreate+0x1f8>
  101e60:	e1a02004 	mov	r2, r4
  101e64:	e3a010a5 	mov	r1, #165	; 0xa5
  101e68:	ebfffab7 	bl	10094c <memset>
  101e6c:	e1a01005 	mov	r1, r5
  101e70:	e3a02010 	mov	r2, #16	; 0x10
  101e74:	e2860034 	add	r0, r6, #52	; 0x34
  101e78:	ebfffadb 	bl	1009ec <strncpy>
  101e7c:	e35b0004 	cmp	fp, #4	; 0x4
  101e80:	31a0400b 	movcc	r4, fp
  101e84:	23a04004 	movcs	r4, #4	; 0x4
  101e88:	e3a03000 	mov	r3, #0	; 0x0
  101e8c:	e2869004 	add	r9, r6, #4	; 0x4
  101e90:	e5c63043 	strb	r3, [r6, #67]
  101e94:	e586402c 	str	r4, [r6, #44]
  101e98:	e1a00009 	mov	r0, r9
  101e9c:	ebfffd08 	bl	1012c4 <vListInitialiseItem>
  101ea0:	e2860018 	add	r0, r6, #24	; 0x18
  101ea4:	ebfffd06 	bl	1012c4 <vListInitialiseItem>
  101ea8:	e5960030 	ldr	r0, [r6, #48]
  101eac:	e2644005 	rsb	r4, r4, #5	; 0x5
  101eb0:	e0800107 	add	r0, r0, r7, lsl #2
  101eb4:	e1a0100a 	mov	r1, sl
  101eb8:	e1a02008 	mov	r2, r8
  101ebc:	e5864018 	str	r4, [r6, #24]
  101ec0:	e5866010 	str	r6, [r6, #16]
  101ec4:	e5866024 	str	r6, [r6, #36]
  101ec8:	e2400004 	sub	r0, r0, #4	; 0x4
  101ecc:	eb000177 	bl	1024b0 <pxPortInitialiseStack>
  101ed0:	e5860000 	str	r0, [r6]
  101ed4:	eb00020c 	bl	10270c <vPortEnterCritical>
  101ed8:	e59f2140 	ldr	r2, [pc, #320]	; 102020 <prog+0x1fdc>
  101edc:	e5923000 	ldr	r3, [r2]
  101ee0:	e2833001 	add	r3, r3, #1	; 0x1
  101ee4:	e5823000 	str	r3, [r2]
  101ee8:	e5921000 	ldr	r1, [r2]
  101eec:	e3510001 	cmp	r1, #1	; 0x1
  101ef0:	0a00002a 	beq	101fa0 <xTaskCreate+0x188>
  101ef4:	e59f7128 	ldr	r7, [pc, #296]	; 102024 <prog+0x1fe0>
  101ef8:	e5973000 	ldr	r3, [r7]
  101efc:	e3530000 	cmp	r3, #0	; 0x0
  101f00:	0a00001c 	beq	101f78 <xTaskCreate+0x160>
  101f04:	e59f811c 	ldr	r8, [pc, #284]	; 102028 <prog+0x1fe4>
  101f08:	e59f111c 	ldr	r1, [pc, #284]	; 10202c <prog+0x1fe8>
  101f0c:	e596202c 	ldr	r2, [r6, #44]
  101f10:	e5913000 	ldr	r3, [r1]
  101f14:	e1520003 	cmp	r2, r3
  101f18:	85812000 	strhi	r2, [r1]
  101f1c:	e59f110c 	ldr	r1, [pc, #268]	; 102030 <prog+0x1fec>
  101f20:	e5913000 	ldr	r3, [r1]
  101f24:	e0820102 	add	r0, r2, r2, lsl #2
  101f28:	e1520003 	cmp	r2, r3
  101f2c:	85812000 	strhi	r2, [r1]
  101f30:	e0880100 	add	r0, r8, r0, lsl #2
  101f34:	e1a01009 	mov	r1, r9
  101f38:	ebfffce4 	bl	1012d0 <vListInsertEnd>
  101f3c:	eb0001fd 	bl	102738 <vPortExitCritical>
  101f40:	e59d3028 	ldr	r3, [sp, #40]
  101f44:	e3530000 	cmp	r3, #0	; 0x0
  101f48:	15836000 	strne	r6, [r3]
  101f4c:	e5973000 	ldr	r3, [r7]
  101f50:	e3530000 	cmp	r3, #0	; 0x0
  101f54:	0a00000f 	beq	101f98 <xTaskCreate+0x180>
  101f58:	e59f30d4 	ldr	r3, [pc, #212]	; 102034 <prog+0x1ff0>
  101f5c:	e5932000 	ldr	r2, [r3]
  101f60:	e592102c 	ldr	r1, [r2, #44]
  101f64:	e151000b 	cmp	r1, fp
  101f68:	2a00000a 	bcs	101f98 <xTaskCreate+0x180>
  101f6c:	ef000000 	swi	0x00000000
  101f70:	e3a00001 	mov	r0, #1	; 0x1
  101f74:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  101f78:	e59f10b4 	ldr	r1, [pc, #180]	; 102034 <prog+0x1ff0>
  101f7c:	e5913000 	ldr	r3, [r1]
  101f80:	e593202c 	ldr	r2, [r3, #44]
  101f84:	e15b0002 	cmp	fp, r2
  101f88:	259f8098 	ldrcs	r8, [pc, #152]	; 102028 <prog+0x1fe4>
  101f8c:	25816000 	strcs	r6, [r1]
  101f90:	2affffdc 	bcs	101f08 <xTaskCreate+0xf0>
  101f94:	eaffffda 	b	101f04 <xTaskCreate+0xec>
  101f98:	e3a00001 	mov	r0, #1	; 0x1
  101f9c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  101fa0:	e59f308c 	ldr	r3, [pc, #140]	; 102034 <prog+0x1ff0>
  101fa4:	e59f807c 	ldr	r8, [pc, #124]	; 102028 <prog+0x1fe4>
  101fa8:	e5836000 	str	r6, [r3]
  101fac:	e1a04008 	mov	r4, r8
  101fb0:	e2885064 	add	r5, r8, #100	; 0x64
  101fb4:	e1a00004 	mov	r0, r4
  101fb8:	e2844014 	add	r4, r4, #20	; 0x14
  101fbc:	ebfffcb7 	bl	1012a0 <vListInitialise>
  101fc0:	e1540005 	cmp	r4, r5
  101fc4:	1afffffa 	bne	101fb4 <xTaskCreate+0x19c>
  101fc8:	e59f4068 	ldr	r4, [pc, #104]	; 102038 <prog+0x1ff4>
  101fcc:	e59f5068 	ldr	r5, [pc, #104]	; 10203c <prog+0x1ff8>
  101fd0:	e1a00004 	mov	r0, r4
  101fd4:	ebfffcb1 	bl	1012a0 <vListInitialise>
  101fd8:	e1a00005 	mov	r0, r5
  101fdc:	ebfffcaf 	bl	1012a0 <vListInitialise>
  101fe0:	e59f0058 	ldr	r0, [pc, #88]	; 102040 <prog+0x1ffc>
  101fe4:	ebfffcad 	bl	1012a0 <vListInitialise>
  101fe8:	e59f0054 	ldr	r0, [pc, #84]	; 102044 <prog+0x2000>
  101fec:	ebfffcab 	bl	1012a0 <vListInitialise>
  101ff0:	e59f0050 	ldr	r0, [pc, #80]	; 102048 <prog+0x2004>
  101ff4:	ebfffca9 	bl	1012a0 <vListInitialise>
  101ff8:	e59f7024 	ldr	r7, [pc, #36]	; 102024 <prog+0x1fe0>
  101ffc:	e59f3048 	ldr	r3, [pc, #72]	; 10204c <prog+0x2008>
  102000:	e59f2048 	ldr	r2, [pc, #72]	; 102050 <prog+0x200c>
  102004:	e5834000 	str	r4, [r3]
  102008:	e5825000 	str	r5, [r2]
  10200c:	eaffffbd 	b	101f08 <xTaskCreate+0xf0>
  102010:	e1a00006 	mov	r0, r6
  102014:	eb000232 	bl	1028e4 <vPortFree>
  102018:	e3e00000 	mvn	r0, #0	; 0x0
  10201c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102020:	00200878 	eoreq	r0, r0, r8, ror r8
  102024:	0020087c 	eoreq	r0, r0, ip, ror r8
  102028:	00200888 	eoreq	r0, r0, r8, lsl #17
  10202c:	00200884 	eoreq	r0, r0, r4, lsl #17
  102030:	00200870 	eoreq	r0, r0, r0, ror r8
  102034:	0020085c 	eoreq	r0, r0, ip, asr r8
  102038:	002008ec 	eoreq	r0, r0, ip, ror #17
  10203c:	00200900 	eoreq	r0, r0, r0, lsl #18
  102040:	0020091c 	eoreq	r0, r0, ip, lsl r9
  102044:	00200930 	eoreq	r0, r0, r0, lsr r9
  102048:	00200944 	eoreq	r0, r0, r4, asr #18
  10204c:	00200914 	eoreq	r0, r0, r4, lsl r9
  102050:	00200918 	eoreq	r0, r0, r8, lsl r9

00102054 <vTaskStartScheduler>:
  102054:	e92d4010 	stmdb	sp!, {r4, lr}
  102058:	e3a04000 	mov	r4, #0	; 0x0
  10205c:	e24dd008 	sub	sp, sp, #8	; 0x8
  102060:	e59f1054 	ldr	r1, [pc, #84]	; 1020bc <prog+0x2078>
  102064:	e3a0206e 	mov	r2, #110	; 0x6e
  102068:	e1a03004 	mov	r3, r4
  10206c:	e59f004c 	ldr	r0, [pc, #76]	; 1020c0 <prog+0x207c>
  102070:	e58d4000 	str	r4, [sp]
  102074:	e58d4004 	str	r4, [sp, #4]
  102078:	ebffff66 	bl	101e18 <xTaskCreate>
  10207c:	e3500001 	cmp	r0, #1	; 0x1
  102080:	0a000001 	beq	10208c <vTaskStartScheduler+0x38>
  102084:	e28dd008 	add	sp, sp, #8	; 0x8
  102088:	e8bd8010 	ldmia	sp!, {r4, pc}
  10208c:	e92d0001 	stmdb	sp!, {r0}
  102090:	e10f0000 	mrs	r0, CPSR
  102094:	e38000c0 	orr	r0, r0, #192	; 0xc0
  102098:	e129f000 	msr	CPSR_fc, r0
  10209c:	e8bd0001 	ldmia	sp!, {r0}
  1020a0:	e59f301c 	ldr	r3, [pc, #28]	; 1020c4 <prog+0x2080>
  1020a4:	e59f201c 	ldr	r2, [pc, #28]	; 1020c8 <prog+0x2084>
  1020a8:	e5830000 	str	r0, [r3]
  1020ac:	e5824000 	str	r4, [r2]
  1020b0:	e28dd008 	add	sp, sp, #8	; 0x8
  1020b4:	e8bd4010 	ldmia	sp!, {r4, lr}
  1020b8:	ea00016c 	b	102670 <xPortStartScheduler>
  1020bc:	00103818 	andeqs	r3, r0, r8, lsl r8
  1020c0:	00102350 	andeqs	r2, r0, r0, asr r3
  1020c4:	0020087c 	eoreq	r0, r0, ip, ror r8
  1020c8:	00200868 	eoreq	r0, r0, r8, ror #16

001020cc <xTaskResumeAll>:
  1020cc:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1020d0:	e59fb248 	ldr	fp, [pc, #584]	; 102320 <prog+0x22dc>
  1020d4:	eb00018c 	bl	10270c <vPortEnterCritical>
  1020d8:	e59b3000 	ldr	r3, [fp]
  1020dc:	e2433001 	sub	r3, r3, #1	; 0x1
  1020e0:	e58b3000 	str	r3, [fp]
  1020e4:	e59b1000 	ldr	r1, [fp]
  1020e8:	e3510000 	cmp	r1, #0	; 0x0
  1020ec:	1a000006 	bne	10210c <xTaskResumeAll+0x40>
  1020f0:	e59f322c 	ldr	r3, [pc, #556]	; 102324 <prog+0x22e0>
  1020f4:	e5932000 	ldr	r2, [r3]
  1020f8:	e3520000 	cmp	r2, #0	; 0x0
  1020fc:	159f9224 	ldrne	r9, [pc, #548]	; 102328 <prog+0x22e4>
  102100:	11a06001 	movne	r6, r1
  102104:	11a0a009 	movne	sl, r9
  102108:	1a00001a 	bne	102178 <xTaskResumeAll+0xac>
  10210c:	eb000189 	bl	102738 <vPortExitCritical>
  102110:	e3a04000 	mov	r4, #0	; 0x0
  102114:	e1a00004 	mov	r0, r4
  102118:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10211c:	e599300c 	ldr	r3, [r9, #12]
  102120:	e593400c 	ldr	r4, [r3, #12]
  102124:	e3540000 	cmp	r4, #0	; 0x0
  102128:	e2840018 	add	r0, r4, #24	; 0x18
  10212c:	e2845004 	add	r5, r4, #4	; 0x4
  102130:	0a000015 	beq	10218c <xTaskResumeAll+0xc0>
  102134:	ebfffc8b 	bl	101368 <vListRemove>
  102138:	e1a00005 	mov	r0, r5
  10213c:	ebfffc89 	bl	101368 <vListRemove>
  102140:	e594202c 	ldr	r2, [r4, #44]
  102144:	e5973000 	ldr	r3, [r7]
  102148:	e0820102 	add	r0, r2, r2, lsl #2
  10214c:	e1520003 	cmp	r2, r3
  102150:	e1a01005 	mov	r1, r5
  102154:	e0880100 	add	r0, r8, r0, lsl #2
  102158:	85872000 	strhi	r2, [r7]
  10215c:	ebfffc5b 	bl	1012d0 <vListInsertEnd>
  102160:	e59f31c4 	ldr	r3, [pc, #452]	; 10232c <prog+0x22e8>
  102164:	e5932000 	ldr	r2, [r3]
  102168:	e594102c 	ldr	r1, [r4, #44]
  10216c:	e592302c 	ldr	r3, [r2, #44]
  102170:	e1510003 	cmp	r1, r3
  102174:	23a06001 	movcs	r6, #1	; 0x1
  102178:	e59a3000 	ldr	r3, [sl]
  10217c:	e3530000 	cmp	r3, #0	; 0x0
  102180:	e59f81a8 	ldr	r8, [pc, #424]	; 102330 <prog+0x22ec>
  102184:	e59f71a8 	ldr	r7, [pc, #424]	; 102334 <prog+0x22f0>
  102188:	1affffe3 	bne	10211c <xTaskResumeAll+0x50>
  10218c:	e59fa1a4 	ldr	sl, [pc, #420]	; 102338 <prog+0x22f4>
  102190:	e59a3000 	ldr	r3, [sl]
  102194:	e3530000 	cmp	r3, #0	; 0x0
  102198:	0a000059 	beq	102304 <xTaskResumeAll+0x238>
  10219c:	e59a3000 	ldr	r3, [sl]
  1021a0:	e3530000 	cmp	r3, #0	; 0x0
  1021a4:	0a00004e 	beq	1022e4 <xTaskResumeAll+0x218>
  1021a8:	e59b3000 	ldr	r3, [fp]
  1021ac:	e3530000 	cmp	r3, #0	; 0x0
  1021b0:	159a3000 	ldrne	r3, [sl]
  1021b4:	12833001 	addne	r3, r3, #1	; 0x1
  1021b8:	158a3000 	strne	r3, [sl]
  1021bc:	1a000042 	bne	1022cc <xTaskResumeAll+0x200>
  1021c0:	e59f6174 	ldr	r6, [pc, #372]	; 10233c <prog+0x22f8>
  1021c4:	e5963000 	ldr	r3, [r6]
  1021c8:	e2833001 	add	r3, r3, #1	; 0x1
  1021cc:	e5863000 	str	r3, [r6]
  1021d0:	e5962000 	ldr	r2, [r6]
  1021d4:	e3520000 	cmp	r2, #0	; 0x0
  1021d8:	e1a0c006 	mov	ip, r6
  1021dc:	159f915c 	ldrne	r9, [pc, #348]	; 102340 <prog+0x22fc>
  1021e0:	1a000009 	bne	10220c <xTaskResumeAll+0x140>
  1021e4:	e59f9154 	ldr	r9, [pc, #340]	; 102340 <prog+0x22fc>
  1021e8:	e59f1154 	ldr	r1, [pc, #340]	; 102344 <prog+0x2300>
  1021ec:	e5990000 	ldr	r0, [r9]
  1021f0:	e5913000 	ldr	r3, [r1]
  1021f4:	e59f214c 	ldr	r2, [pc, #332]	; 102348 <prog+0x2304>
  1021f8:	e5893000 	str	r3, [r9]
  1021fc:	e5810000 	str	r0, [r1]
  102200:	e5923000 	ldr	r3, [r2]
  102204:	e2833001 	add	r3, r3, #1	; 0x1
  102208:	e5823000 	str	r3, [r2]
  10220c:	e5993000 	ldr	r3, [r9]
  102210:	e5932000 	ldr	r2, [r3]
  102214:	e3520000 	cmp	r2, #0	; 0x0
  102218:	0a00002b 	beq	1022cc <xTaskResumeAll+0x200>
  10221c:	e59f311c 	ldr	r3, [pc, #284]	; 102340 <prog+0x22fc>
  102220:	e5932000 	ldr	r2, [r3]
  102224:	e592100c 	ldr	r1, [r2, #12]
  102228:	e591300c 	ldr	r3, [r1, #12]
  10222c:	e3530000 	cmp	r3, #0	; 0x0
  102230:	0a000025 	beq	1022cc <xTaskResumeAll+0x200>
  102234:	e1a04003 	mov	r4, r3
  102238:	e59c2000 	ldr	r2, [ip]
  10223c:	e5933004 	ldr	r3, [r3, #4]
  102240:	e1530002 	cmp	r3, r2
  102244:	959f70e8 	ldrls	r7, [pc, #232]	; 102334 <prog+0x22f0>
  102248:	959f80e0 	ldrls	r8, [pc, #224]	; 102330 <prog+0x22ec>
  10224c:	9a00000a 	bls	10227c <xTaskResumeAll+0x1b0>
  102250:	ea00001d 	b	1022cc <xTaskResumeAll+0x200>
  102254:	e59f30e4 	ldr	r3, [pc, #228]	; 102340 <prog+0x22fc>
  102258:	e5932000 	ldr	r2, [r3]
  10225c:	e592100c 	ldr	r1, [r2, #12]
  102260:	e591300c 	ldr	r3, [r1, #12]
  102264:	e2534000 	subs	r4, r3, #0	; 0x0
  102268:	0a000017 	beq	1022cc <xTaskResumeAll+0x200>
  10226c:	e5962000 	ldr	r2, [r6]
  102270:	e5943004 	ldr	r3, [r4, #4]
  102274:	e1530002 	cmp	r3, r2
  102278:	8a000013 	bhi	1022cc <xTaskResumeAll+0x200>
  10227c:	e2845004 	add	r5, r4, #4	; 0x4
  102280:	e1a00005 	mov	r0, r5
  102284:	ebfffc37 	bl	101368 <vListRemove>
  102288:	e5943028 	ldr	r3, [r4, #40]
  10228c:	e3530000 	cmp	r3, #0	; 0x0
  102290:	e2840018 	add	r0, r4, #24	; 0x18
  102294:	1bfffc33 	blne	101368 <vListRemove>
  102298:	e594202c 	ldr	r2, [r4, #44]
  10229c:	e5973000 	ldr	r3, [r7]
  1022a0:	e1520003 	cmp	r2, r3
  1022a4:	859f3088 	ldrhi	r3, [pc, #136]	; 102334 <prog+0x22f0>
  1022a8:	e0820102 	add	r0, r2, r2, lsl #2
  1022ac:	85832000 	strhi	r2, [r3]
  1022b0:	e1a01005 	mov	r1, r5
  1022b4:	e0880100 	add	r0, r8, r0, lsl #2
  1022b8:	ebfffc04 	bl	1012d0 <vListInsertEnd>
  1022bc:	e5993000 	ldr	r3, [r9]
  1022c0:	e5932000 	ldr	r2, [r3]
  1022c4:	e3520000 	cmp	r2, #0	; 0x0
  1022c8:	1affffe1 	bne	102254 <xTaskResumeAll+0x188>
  1022cc:	e59a3000 	ldr	r3, [sl]
  1022d0:	e2433001 	sub	r3, r3, #1	; 0x1
  1022d4:	e58a3000 	str	r3, [sl]
  1022d8:	e59a2000 	ldr	r2, [sl]
  1022dc:	e3520000 	cmp	r2, #0	; 0x0
  1022e0:	1affffb0 	bne	1021a8 <xTaskResumeAll+0xdc>
  1022e4:	e59f2060 	ldr	r2, [pc, #96]	; 10234c <prog+0x2308>
  1022e8:	e3a03000 	mov	r3, #0	; 0x0
  1022ec:	e5823000 	str	r3, [r2]
  1022f0:	ef000000 	swi	0x00000000
  1022f4:	eb00010f 	bl	102738 <vPortExitCritical>
  1022f8:	e3a04001 	mov	r4, #1	; 0x1
  1022fc:	e1a00004 	mov	r0, r4
  102300:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102304:	e3560001 	cmp	r6, #1	; 0x1
  102308:	0afffff5 	beq	1022e4 <xTaskResumeAll+0x218>
  10230c:	e59f2038 	ldr	r2, [pc, #56]	; 10234c <prog+0x2308>
  102310:	e5923000 	ldr	r3, [r2]
  102314:	e3530001 	cmp	r3, #1	; 0x1
  102318:	1affff7b 	bne	10210c <xTaskResumeAll+0x40>
  10231c:	eafffff1 	b	1022e8 <xTaskResumeAll+0x21c>
  102320:	0020086c 	eoreq	r0, r0, ip, ror #16
  102324:	00200878 	eoreq	r0, r0, r8, ror r8
  102328:	0020091c 	eoreq	r0, r0, ip, lsl r9
  10232c:	0020085c 	eoreq	r0, r0, ip, asr r8
  102330:	00200888 	eoreq	r0, r0, r8, lsl #17
  102334:	00200870 	eoreq	r0, r0, r0, ror r8
  102338:	00200874 	eoreq	r0, r0, r4, ror r8
  10233c:	00200868 	eoreq	r0, r0, r8, ror #16
  102340:	00200914 	eoreq	r0, r0, r4, lsl r9
  102344:	00200918 	eoreq	r0, r0, r8, lsl r9
  102348:	00200864 	eoreq	r0, r0, r4, ror #16
  10234c:	00200860 	eoreq	r0, r0, r0, ror #16

00102350 <prvIdleTask>:
  102350:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  102354:	e59f50a0 	ldr	r5, [pc, #160]	; 1023fc <prog+0x23b8>
  102358:	e5953000 	ldr	r3, [r5]
  10235c:	e59f709c 	ldr	r7, [pc, #156]	; 102400 <prog+0x23bc>
  102360:	e3530000 	cmp	r3, #0	; 0x0
  102364:	e59f8098 	ldr	r8, [pc, #152]	; 102404 <prog+0x23c0>
  102368:	e59f6098 	ldr	r6, [pc, #152]	; 102408 <prog+0x23c4>
  10236c:	e287a008 	add	sl, r7, #8	; 0x8
  102370:	1a000007 	bne	102394 <prvIdleTask+0x44>
  102374:	e5963000 	ldr	r3, [r6]
  102378:	e3530001 	cmp	r3, #1	; 0x1
  10237c:	9a000000 	bls	102384 <prvIdleTask+0x34>
  102380:	ef000000 	swi	0x00000000
  102384:	ebfffac4 	bl	100e9c <vApplicationIdleHook>
  102388:	e5953000 	ldr	r3, [r5]
  10238c:	e3530000 	cmp	r3, #0	; 0x0
  102390:	0afffff7 	beq	102374 <prvIdleTask+0x24>
  102394:	ebfffdef 	bl	101b58 <vTaskSuspendAll>
  102398:	e5974000 	ldr	r4, [r7]
  10239c:	ebffff4a 	bl	1020cc <xTaskResumeAll>
  1023a0:	e3540000 	cmp	r4, #0	; 0x0
  1023a4:	0afffff2 	beq	102374 <prvIdleTask+0x24>
  1023a8:	eb0000d7 	bl	10270c <vPortEnterCritical>
  1023ac:	e59f304c 	ldr	r3, [pc, #76]	; 102400 <prog+0x23bc>
  1023b0:	e5932000 	ldr	r2, [r3]
  1023b4:	e3520000 	cmp	r2, #0	; 0x0
  1023b8:	159a3004 	ldrne	r3, [sl, #4]
  1023bc:	e1a04002 	mov	r4, r2
  1023c0:	1593400c 	ldrne	r4, [r3, #12]
  1023c4:	e2840004 	add	r0, r4, #4	; 0x4
  1023c8:	ebfffbe6 	bl	101368 <vListRemove>
  1023cc:	e5983000 	ldr	r3, [r8]
  1023d0:	e2433001 	sub	r3, r3, #1	; 0x1
  1023d4:	e5883000 	str	r3, [r8]
  1023d8:	e5952000 	ldr	r2, [r5]
  1023dc:	e2422001 	sub	r2, r2, #1	; 0x1
  1023e0:	e5852000 	str	r2, [r5]
  1023e4:	eb0000d3 	bl	102738 <vPortExitCritical>
  1023e8:	e5940030 	ldr	r0, [r4, #48]
  1023ec:	eb00013c 	bl	1028e4 <vPortFree>
  1023f0:	e1a00004 	mov	r0, r4
  1023f4:	eb00013a 	bl	1028e4 <vPortFree>
  1023f8:	eaffffdd 	b	102374 <prvIdleTask+0x24>
  1023fc:	00200880 	eoreq	r0, r0, r0, lsl #17
  102400:	00200930 	eoreq	r0, r0, r0, lsr r9
  102404:	00200878 	eoreq	r0, r0, r8, ror r8
  102408:	00200888 	eoreq	r0, r0, r8, lsl #17

0010240c <vTaskDelay>:
  10240c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  102410:	e2505000 	subs	r5, r0, #0	; 0x0
  102414:	e59f6084 	ldr	r6, [pc, #132]	; 1024a0 <prog+0x245c>
  102418:	e59f7084 	ldr	r7, [pc, #132]	; 1024a4 <prog+0x2460>
  10241c:	1a000001 	bne	102428 <vTaskDelay+0x1c>
  102420:	ef000000 	swi	0x00000000
  102424:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  102428:	ebfffdca 	bl	101b58 <vTaskSuspendAll>
  10242c:	e5974000 	ldr	r4, [r7]
  102430:	e5960000 	ldr	r0, [r6]
  102434:	e2800004 	add	r0, r0, #4	; 0x4
  102438:	ebfffbca 	bl	101368 <vListRemove>
  10243c:	e5962000 	ldr	r2, [r6]
  102440:	e5973000 	ldr	r3, [r7]
  102444:	e0854004 	add	r4, r5, r4
  102448:	e1540003 	cmp	r4, r3
  10244c:	e5824004 	str	r4, [r2, #4]
  102450:	2a000009 	bcs	10247c <vTaskDelay+0x70>
  102454:	e59f304c 	ldr	r3, [pc, #76]	; 1024a8 <prog+0x2464>
  102458:	e5930000 	ldr	r0, [r3]
  10245c:	e5961000 	ldr	r1, [r6]
  102460:	e2811004 	add	r1, r1, #4	; 0x4
  102464:	ebfffba6 	bl	101304 <vListInsert>
  102468:	ebffff17 	bl	1020cc <xTaskResumeAll>
  10246c:	e3500000 	cmp	r0, #0	; 0x0
  102470:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
  102474:	ef000000 	swi	0x00000000
  102478:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10247c:	e59f3028 	ldr	r3, [pc, #40]	; 1024ac <prog+0x2468>
  102480:	e5930000 	ldr	r0, [r3]
  102484:	e5961000 	ldr	r1, [r6]
  102488:	e2811004 	add	r1, r1, #4	; 0x4
  10248c:	ebfffb9c 	bl	101304 <vListInsert>
  102490:	ebffff0d 	bl	1020cc <xTaskResumeAll>
  102494:	e3500000 	cmp	r0, #0	; 0x0
  102498:	0afffff5 	beq	102474 <vTaskDelay+0x68>
  10249c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1024a0:	0020085c 	eoreq	r0, r0, ip, asr r8
  1024a4:	00200868 	eoreq	r0, r0, r8, ror #16
  1024a8:	00200918 	eoreq	r0, r0, r8, lsl r9
  1024ac:	00200914 	eoreq	r0, r0, r4, lsl r9

001024b0 <pxPortInitialiseStack>:
  1024b0:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1024b4:	e2811004 	add	r1, r1, #4	; 0x4
  1024b8:	e1a0b000 	mov	fp, r0
  1024bc:	e40b1004 	str	r1, [fp], #-4
  1024c0:	e24b1004 	sub	r1, fp, #4	; 0x4
  1024c4:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  1024c8:	e2413004 	sub	r3, r1, #4	; 0x4
  1024cc:	e58d1004 	str	r1, [sp, #4]
  1024d0:	e2431004 	sub	r1, r3, #4	; 0x4
  1024d4:	e58d3008 	str	r3, [sp, #8]
  1024d8:	e2413004 	sub	r3, r1, #4	; 0x4
  1024dc:	e58d100c 	str	r1, [sp, #12]
  1024e0:	e2431004 	sub	r1, r3, #4	; 0x4
  1024e4:	e58d3010 	str	r3, [sp, #16]
  1024e8:	e2413004 	sub	r3, r1, #4	; 0x4
  1024ec:	e58d1014 	str	r1, [sp, #20]
  1024f0:	e2431004 	sub	r1, r3, #4	; 0x4
  1024f4:	e58d3018 	str	r3, [sp, #24]
  1024f8:	e2413004 	sub	r3, r1, #4	; 0x4
  1024fc:	e58d101c 	str	r1, [sp, #28]
  102500:	e2431004 	sub	r1, r3, #4	; 0x4
  102504:	e58d3020 	str	r3, [sp, #32]
  102508:	e2413004 	sub	r3, r1, #4	; 0x4
  10250c:	e58d1024 	str	r1, [sp, #36]
  102510:	e2431004 	sub	r1, r3, #4	; 0x4
  102514:	e58d3028 	str	r3, [sp, #40]
  102518:	e2413004 	sub	r3, r1, #4	; 0x4
  10251c:	e58d102c 	str	r1, [sp, #44]
  102520:	e2431004 	sub	r1, r3, #4	; 0x4
  102524:	e58d1034 	str	r1, [sp, #52]
  102528:	e58d3030 	str	r3, [sp, #48]
  10252c:	e59d3034 	ldr	r3, [sp, #52]
  102530:	e2433004 	sub	r3, r3, #4	; 0x4
  102534:	e58d0000 	str	r0, [sp]
  102538:	e58d3038 	str	r3, [sp, #56]
  10253c:	e2430004 	sub	r0, r3, #4	; 0x4
  102540:	e3a03caa 	mov	r3, #43520	; 0xaa00
  102544:	e59d1000 	ldr	r1, [sp]
  102548:	e28330aa 	add	r3, r3, #170	; 0xaa
  10254c:	e1833803 	orr	r3, r3, r3, lsl #16
  102550:	e5013004 	str	r3, [r1, #-4]
  102554:	e3a03c12 	mov	r3, #4608	; 0x1200
  102558:	e50b1004 	str	r1, [fp, #-4]
  10255c:	e2833012 	add	r3, r3, #18	; 0x12
  102560:	e59d1004 	ldr	r1, [sp, #4]
  102564:	e1833803 	orr	r3, r3, r3, lsl #16
  102568:	e3a09c11 	mov	r9, #4352	; 0x1100
  10256c:	e3a0aa01 	mov	sl, #4096	; 0x1000
  102570:	e5013004 	str	r3, [r1, #-4]
  102574:	e2899011 	add	r9, r9, #17	; 0x11
  102578:	e28d1008 	add	r1, sp, #8	; 0x8
  10257c:	e891000a 	ldmia	r1, {r1, r3}
  102580:	e28aa010 	add	sl, sl, #16	; 0x10
  102584:	e1899809 	orr	r9, r9, r9, lsl #16
  102588:	e18aa80a 	orr	sl, sl, sl, lsl #16
  10258c:	e3a08c09 	mov	r8, #2304	; 0x900
  102590:	e3a07b02 	mov	r7, #2048	; 0x800
  102594:	e5019004 	str	r9, [r1, #-4]
  102598:	e2888009 	add	r8, r8, #9	; 0x9
  10259c:	e503a004 	str	sl, [r3, #-4]
  1025a0:	e28d1010 	add	r1, sp, #16	; 0x10
  1025a4:	e891000a 	ldmia	r1, {r1, r3}
  1025a8:	e2877008 	add	r7, r7, #8	; 0x8
  1025ac:	e1888808 	orr	r8, r8, r8, lsl #16
  1025b0:	e1877807 	orr	r7, r7, r7, lsl #16
  1025b4:	e3a06c07 	mov	r6, #1792	; 0x700
  1025b8:	e3a05c06 	mov	r5, #1536	; 0x600
  1025bc:	e5018004 	str	r8, [r1, #-4]
  1025c0:	e2866007 	add	r6, r6, #7	; 0x7
  1025c4:	e5037004 	str	r7, [r3, #-4]
  1025c8:	e28d1018 	add	r1, sp, #24	; 0x18
  1025cc:	e891000a 	ldmia	r1, {r1, r3}
  1025d0:	e2855006 	add	r5, r5, #6	; 0x6
  1025d4:	e1866806 	orr	r6, r6, r6, lsl #16
  1025d8:	e1855805 	orr	r5, r5, r5, lsl #16
  1025dc:	e3a04c05 	mov	r4, #1280	; 0x500
  1025e0:	e5016004 	str	r6, [r1, #-4]
  1025e4:	e2844005 	add	r4, r4, #5	; 0x5
  1025e8:	e5035004 	str	r5, [r3, #-4]
  1025ec:	e59d1020 	ldr	r1, [sp, #32]
  1025f0:	e1844804 	orr	r4, r4, r4, lsl #16
  1025f4:	e3a0eb01 	mov	lr, #1024	; 0x400
  1025f8:	e3a0cc03 	mov	ip, #768	; 0x300
  1025fc:	e5014004 	str	r4, [r1, #-4]
  102600:	e59d3024 	ldr	r3, [sp, #36]
  102604:	e59d1028 	ldr	r1, [sp, #40]
  102608:	e28ee004 	add	lr, lr, #4	; 0x4
  10260c:	e28cc003 	add	ip, ip, #3	; 0x3
  102610:	e18ee80e 	orr	lr, lr, lr, lsl #16
  102614:	e18cc80c 	orr	ip, ip, ip, lsl #16
  102618:	e503e004 	str	lr, [r3, #-4]
  10261c:	e501c004 	str	ip, [r1, #-4]
  102620:	e3a01c02 	mov	r1, #512	; 0x200
  102624:	e59d302c 	ldr	r3, [sp, #44]
  102628:	e2811002 	add	r1, r1, #2	; 0x2
  10262c:	e1811801 	orr	r1, r1, r1, lsl #16
  102630:	e5031004 	str	r1, [r3, #-4]
  102634:	e3a01c01 	mov	r1, #256	; 0x100
  102638:	e59d3030 	ldr	r3, [sp, #48]
  10263c:	e2811001 	add	r1, r1, #1	; 0x1
  102640:	e1811801 	orr	r1, r1, r1, lsl #16
  102644:	e5031004 	str	r1, [r3, #-4]
  102648:	e59d3034 	ldr	r3, [sp, #52]
  10264c:	e59d1038 	ldr	r1, [sp, #56]
  102650:	e5032004 	str	r2, [r3, #-4]
  102654:	e3a0301f 	mov	r3, #31	; 0x1f
  102658:	e3a02000 	mov	r2, #0	; 0x0
  10265c:	e5013004 	str	r3, [r1, #-4]
  102660:	e5002004 	str	r2, [r0, #-4]
  102664:	e2400004 	sub	r0, r0, #4	; 0x4
  102668:	e28dd03c 	add	sp, sp, #60	; 0x3c
  10266c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00102670 <xPortStartScheduler>:
  102670:	e52de004 	str	lr, [sp, #-4]!
  102674:	e3a01007 	mov	r1, #7	; 0x7
  102678:	e3a02000 	mov	r2, #0	; 0x0
  10267c:	e59f3030 	ldr	r3, [pc, #48]	; 1026b4 <prog+0x2670>
  102680:	e3a00001 	mov	r0, #1	; 0x1
  102684:	ebfffaf7 	bl	101268 <AT91F_AIC_ConfigureIt>
  102688:	e3a03403 	mov	r3, #50331648	; 0x3000000
  10268c:	e2833ebb 	add	r3, r3, #2992	; 0xbb0
  102690:	e3e02c02 	mvn	r2, #512	; 0x200
  102694:	e2833003 	add	r3, r3, #3	; 0x3
  102698:	e50230cf 	str	r3, [r2, #-207]
  10269c:	e3a01002 	mov	r1, #2	; 0x2
  1026a0:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  1026a4:	e5831021 	str	r1, [r3, #33]
  1026a8:	eb000002 	bl	1026b8 <vPortISRStartFirstTask>
  1026ac:	e3a00000 	mov	r0, #0	; 0x0
  1026b0:	e49df004 	ldr	pc, [sp], #4
  1026b4:	0010277c 	andeqs	r2, r0, ip, ror r7

001026b8 <vPortISRStartFirstTask>:
  1026b8:	e59f0044 	ldr	r0, [pc, #68]	; 102704 <prog+0x26c0>
  1026bc:	e5900000 	ldr	r0, [r0]
  1026c0:	e590e000 	ldr	lr, [r0]
  1026c4:	e59f003c 	ldr	r0, [pc, #60]	; 102708 <prog+0x26c4>
  1026c8:	e8be0002 	ldmia	lr!, {r1}
  1026cc:	e5801000 	str	r1, [r0]
  1026d0:	e8be0001 	ldmia	lr!, {r0}
  1026d4:	e169f000 	msr	SPSR_fc, r0
  1026d8:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1026dc:	e1a00000 	nop			(mov r0,r0)
  1026e0:	e59ee03c 	ldr	lr, [lr, #60]
  1026e4:	e25ef004 	subs	pc, lr, #4	; 0x4
  1026e8:	e59f300c 	ldr	r3, [pc, #12]	; 1026fc <prog+0x26b8>
  1026ec:	e59f200c 	ldr	r2, [pc, #12]	; 102700 <prog+0x26bc>
  1026f0:	e5931000 	ldr	r1, [r3]
  1026f4:	e5923000 	ldr	r3, [r2]
  1026f8:	e12fff1e 	bx	lr
  1026fc:	00200814 	eoreq	r0, r0, r4, lsl r8
  102700:	0020085c 	eoreq	r0, r0, ip, asr r8
  102704:	0020085c 	eoreq	r0, r0, ip, asr r8
  102708:	00200814 	eoreq	r0, r0, r4, lsl r8

0010270c <vPortEnterCritical>:
  10270c:	e92d0001 	stmdb	sp!, {r0}
  102710:	e10f0000 	mrs	r0, CPSR
  102714:	e38000c0 	orr	r0, r0, #192	; 0xc0
  102718:	e129f000 	msr	CPSR_fc, r0
  10271c:	e8bd0001 	ldmia	sp!, {r0}
  102720:	e59f200c 	ldr	r2, [pc, #12]	; 102734 <prog+0x26f0>
  102724:	e5923000 	ldr	r3, [r2]
  102728:	e2833001 	add	r3, r3, #1	; 0x1
  10272c:	e5823000 	str	r3, [r2]
  102730:	e12fff1e 	bx	lr
  102734:	00200814 	eoreq	r0, r0, r4, lsl r8

00102738 <vPortExitCritical>:
  102738:	e59f2038 	ldr	r2, [pc, #56]	; 102778 <prog+0x2734>
  10273c:	e5923000 	ldr	r3, [r2]
  102740:	e3530000 	cmp	r3, #0	; 0x0
  102744:	012fff1e 	bxeq	lr
  102748:	e5923000 	ldr	r3, [r2]
  10274c:	e2433001 	sub	r3, r3, #1	; 0x1
  102750:	e5823000 	str	r3, [r2]
  102754:	e5922000 	ldr	r2, [r2]
  102758:	e3520000 	cmp	r2, #0	; 0x0
  10275c:	112fff1e 	bxne	lr
  102760:	e92d0001 	stmdb	sp!, {r0}
  102764:	e10f0000 	mrs	r0, CPSR
  102768:	e3c000c0 	bic	r0, r0, #192	; 0xc0
  10276c:	e129f000 	msr	CPSR_fc, r0
  102770:	e8bd0001 	ldmia	sp!, {r0}
  102774:	e12fff1e 	bx	lr
  102778:	00200814 	eoreq	r0, r0, r4, lsl r8

0010277c <vPreemptiveTick>:
  10277c:	e92d0001 	stmdb	sp!, {r0}
  102780:	e94d2000 	stmdb	sp, {sp}^
  102784:	e1a00000 	nop			(mov r0,r0)
  102788:	e24dd004 	sub	sp, sp, #4	; 0x4
  10278c:	e8bd0001 	ldmia	sp!, {r0}
  102790:	e9204000 	stmdb	r0!, {lr}
  102794:	e1a0e000 	mov	lr, r0
  102798:	e8bd0001 	ldmia	sp!, {r0}
  10279c:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1027a0:	e1a00000 	nop			(mov r0,r0)
  1027a4:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  1027a8:	e14f0000 	mrs	r0, SPSR
  1027ac:	e92e0001 	stmdb	lr!, {r0}
  1027b0:	e59f0078 	ldr	r0, [pc, #120]	; 102830 <prog+0x27ec>
  1027b4:	e5900000 	ldr	r0, [r0]
  1027b8:	e92e0001 	stmdb	lr!, {r0}
  1027bc:	e59f0070 	ldr	r0, [pc, #112]	; 102834 <prog+0x27f0>
  1027c0:	e5900000 	ldr	r0, [r0]
  1027c4:	e580e000 	str	lr, [r0]
  1027c8:	e59f4058 	ldr	r4, [pc, #88]	; 102828 <prog+0x27e4>
  1027cc:	e59f5058 	ldr	r5, [pc, #88]	; 10282c <prog+0x27e8>
  1027d0:	e5943000 	ldr	r3, [r4]
  1027d4:	e5952000 	ldr	r2, [r5]
  1027d8:	ebfffd10 	bl	101c20 <vTaskIncrementTick>
  1027dc:	ebfffc77 	bl	1019c0 <vTaskSwitchContext>
  1027e0:	e3e03c02 	mvn	r3, #512	; 0x200
  1027e4:	e51310c7 	ldr	r1, [r3, #-199]
  1027e8:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  1027ec:	e5821031 	str	r1, [r2, #49]
  1027f0:	e59f003c 	ldr	r0, [pc, #60]	; 102834 <prog+0x27f0>
  1027f4:	e5900000 	ldr	r0, [r0]
  1027f8:	e590e000 	ldr	lr, [r0]
  1027fc:	e59f002c 	ldr	r0, [pc, #44]	; 102830 <prog+0x27ec>
  102800:	e8be0002 	ldmia	lr!, {r1}
  102804:	e5801000 	str	r1, [r0]
  102808:	e8be0001 	ldmia	lr!, {r0}
  10280c:	e169f000 	msr	SPSR_fc, r0
  102810:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  102814:	e1a00000 	nop			(mov r0,r0)
  102818:	e59ee03c 	ldr	lr, [lr, #60]
  10281c:	e25ef004 	subs	pc, lr, #4	; 0x4
  102820:	e5943000 	ldr	r3, [r4]
  102824:	e5952000 	ldr	r2, [r5]
  102828:	00200814 	eoreq	r0, r0, r4, lsl r8
  10282c:	0020085c 	eoreq	r0, r0, ip, asr r8
  102830:	00200814 	eoreq	r0, r0, r4, lsl r8
  102834:	0020085c 	eoreq	r0, r0, ip, asr r8

00102838 <swi_handler>:
  102838:	e28ee004 	add	lr, lr, #4	; 0x4
  10283c:	e92d0001 	stmdb	sp!, {r0}
  102840:	e94d2000 	stmdb	sp, {sp}^
  102844:	e1a00000 	nop			(mov r0,r0)
  102848:	e24dd004 	sub	sp, sp, #4	; 0x4
  10284c:	e8bd0001 	ldmia	sp!, {r0}
  102850:	e9204000 	stmdb	r0!, {lr}
  102854:	e1a0e000 	mov	lr, r0
  102858:	e8bd0001 	ldmia	sp!, {r0}
  10285c:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  102860:	e1a00000 	nop			(mov r0,r0)
  102864:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  102868:	e14f0000 	mrs	r0, SPSR
  10286c:	e92e0001 	stmdb	lr!, {r0}
  102870:	e59f0064 	ldr	r0, [pc, #100]	; 1028dc <prog+0x2898>
  102874:	e5900000 	ldr	r0, [r0]
  102878:	e92e0001 	stmdb	lr!, {r0}
  10287c:	e59f005c 	ldr	r0, [pc, #92]	; 1028e0 <prog+0x289c>
  102880:	e5900000 	ldr	r0, [r0]
  102884:	e580e000 	str	lr, [r0]
  102888:	e59f4044 	ldr	r4, [pc, #68]	; 1028d4 <prog+0x2890>
  10288c:	e59f5044 	ldr	r5, [pc, #68]	; 1028d8 <prog+0x2894>
  102890:	e5943000 	ldr	r3, [r4]
  102894:	e5952000 	ldr	r2, [r5]
  102898:	ebfffc48 	bl	1019c0 <vTaskSwitchContext>
  10289c:	e59f003c 	ldr	r0, [pc, #60]	; 1028e0 <prog+0x289c>
  1028a0:	e5900000 	ldr	r0, [r0]
  1028a4:	e590e000 	ldr	lr, [r0]
  1028a8:	e59f002c 	ldr	r0, [pc, #44]	; 1028dc <prog+0x2898>
  1028ac:	e8be0002 	ldmia	lr!, {r1}
  1028b0:	e5801000 	str	r1, [r0]
  1028b4:	e8be0001 	ldmia	lr!, {r0}
  1028b8:	e169f000 	msr	SPSR_fc, r0
  1028bc:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1028c0:	e1a00000 	nop			(mov r0,r0)
  1028c4:	e59ee03c 	ldr	lr, [lr, #60]
  1028c8:	e25ef004 	subs	pc, lr, #4	; 0x4
  1028cc:	e5943000 	ldr	r3, [r4]
  1028d0:	e5952000 	ldr	r2, [r5]
  1028d4:	00200814 	eoreq	r0, r0, r4, lsl r8
  1028d8:	0020085c 	eoreq	r0, r0, ip, asr r8
  1028dc:	00200814 	eoreq	r0, r0, r4, lsl r8
  1028e0:	0020085c 	eoreq	r0, r0, ip, asr r8

001028e4 <vPortFree>:
  1028e4:	e92d4010 	stmdb	sp!, {r4, lr}
  1028e8:	e2504000 	subs	r4, r0, #0	; 0x0
  1028ec:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1028f0:	ebfffc98 	bl	101b58 <vTaskSuspendAll>
  1028f4:	e1a00004 	mov	r0, r4
  1028f8:	ebfff605 	bl	100114 <free>
  1028fc:	e8bd4010 	ldmia	sp!, {r4, lr}
  102900:	eafffdf1 	b	1020cc <xTaskResumeAll>

00102904 <pvPortMalloc>:
  102904:	e92d4010 	stmdb	sp!, {r4, lr}
  102908:	e1a04000 	mov	r4, r0
  10290c:	ebfffc91 	bl	101b58 <vTaskSuspendAll>
  102910:	e1a00004 	mov	r0, r4
  102914:	ebfff603 	bl	100128 <malloc>
  102918:	e1a04000 	mov	r4, r0
  10291c:	ebfffdea 	bl	1020cc <xTaskResumeAll>
  102920:	e1a00004 	mov	r0, r4
  102924:	e8bd8010 	ldmia	sp!, {r4, pc}

00102928 <vDetachUSBInterface>:
  102928:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  10292c:	e3a03801 	mov	r3, #65536	; 0x10000
  102930:	e50230ff 	str	r3, [r2, #-255]
  102934:	e50230ef 	str	r3, [r2, #-239]
  102938:	e50230cf 	str	r3, [r2, #-207]
  10293c:	e12fff1e 	bx	lr

00102940 <vUSBRecvByte>:
  102940:	e3500000 	cmp	r0, #0	; 0x0
  102944:	13510000 	cmpne	r1, #0	; 0x0
  102948:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10294c:	e1a04000 	mov	r4, r0
  102950:	e1a07002 	mov	r7, r2
  102954:	c3a00000 	movgt	r0, #0	; 0x0
  102958:	d3a00001 	movle	r0, #1	; 0x1
  10295c:	da000015 	ble	1029b8 <vUSBRecvByte+0x78>
  102960:	e59f805c 	ldr	r8, [pc, #92]	; 1029c4 <prog+0x2980>
  102964:	e5983000 	ldr	r3, [r8]
  102968:	e3530000 	cmp	r3, #0	; 0x0
  10296c:	0a000011 	beq	1029b8 <vUSBRecvByte+0x78>
  102970:	e3510000 	cmp	r1, #0	; 0x0
  102974:	11a05000 	movne	r5, r0
  102978:	11a06001 	movne	r6, r1
  10297c:	1a000003 	bne	102990 <vUSBRecvByte+0x50>
  102980:	ea00000c 	b	1029b8 <vUSBRecvByte+0x78>
  102984:	e2855001 	add	r5, r5, #1	; 0x1
  102988:	e1560005 	cmp	r6, r5
  10298c:	0a000007 	beq	1029b0 <vUSBRecvByte+0x70>
  102990:	e1a01004 	mov	r1, r4
  102994:	e5980000 	ldr	r0, [r8]
  102998:	e1a02007 	mov	r2, r7
  10299c:	e3a03000 	mov	r3, #0	; 0x0
  1029a0:	ebfffb1d 	bl	10161c <xQueueGenericReceive>
  1029a4:	e3500000 	cmp	r0, #0	; 0x0
  1029a8:	e2844001 	add	r4, r4, #1	; 0x1
  1029ac:	1afffff4 	bne	102984 <vUSBRecvByte+0x44>
  1029b0:	e1a00005 	mov	r0, r5
  1029b4:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1029b8:	e3a05000 	mov	r5, #0	; 0x0
  1029bc:	e1a00005 	mov	r0, r5
  1029c0:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1029c4:	00200a7c 	eoreq	r0, r0, ip, ror sl

001029c8 <usb_send_buffer_zero_copy>:
  1029c8:	e52de004 	str	lr, [sp, #-4]!
  1029cc:	e24dd014 	sub	sp, sp, #20	; 0x14
  1029d0:	e58d3010 	str	r3, [sp, #16]
  1029d4:	e59f3028 	ldr	r3, [pc, #40]	; 102a04 <prog+0x29c0>
  1029d8:	e3a0c000 	mov	ip, #0	; 0x0
  1029dc:	e88d0003 	stmia	sp, {r0, r1}
  1029e0:	e58d200c 	str	r2, [sp, #12]
  1029e4:	e5930000 	ldr	r0, [r3]
  1029e8:	e1a0100d 	mov	r1, sp
  1029ec:	e1a0300c 	mov	r3, ip
  1029f0:	e59d2018 	ldr	r2, [sp, #24]
  1029f4:	e58dc008 	str	ip, [sp, #8]
  1029f8:	ebfffb6d 	bl	1017b4 <xQueueGenericSend>
  1029fc:	e28dd014 	add	sp, sp, #20	; 0x14
  102a00:	e8bd8000 	ldmia	sp!, {pc}
  102a04:	00200a84 	eoreq	r0, r0, r4, lsl #21

00102a08 <prvSendStall>:
  102a08:	e52de004 	str	lr, [sp, #-4]!
  102a0c:	ebffff3e 	bl	10270c <vPortEnterCritical>
  102a10:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  102a14:	e5123fcf 	ldr	r3, [r2, #-4047]
  102a18:	e3c33030 	bic	r3, r3, #48	; 0x30
  102a1c:	e383306f 	orr	r3, r3, #111	; 0x6f
  102a20:	e5023fcf 	str	r3, [r2, #-4047]
  102a24:	e49de004 	ldr	lr, [sp], #4
  102a28:	eaffff42 	b	102738 <vPortExitCritical>

00102a2c <prvSendZLP>:
  102a2c:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  102a30:	e5123fcf 	ldr	r3, [r2, #-4047]
  102a34:	e3130010 	tst	r3, #16	; 0x10
  102a38:	e92d4010 	stmdb	sp!, {r4, lr}
  102a3c:	0a000005 	beq	102a58 <prvSendZLP+0x2c>
  102a40:	e1a04002 	mov	r4, r2
  102a44:	e3a00001 	mov	r0, #1	; 0x1
  102a48:	ebfffe6f 	bl	10240c <vTaskDelay>
  102a4c:	e5143fcf 	ldr	r3, [r4, #-4047]
  102a50:	e3130010 	tst	r3, #16	; 0x10
  102a54:	1afffffa 	bne	102a44 <prvSendZLP+0x18>
  102a58:	ebffff2b 	bl	10270c <vPortEnterCritical>
  102a5c:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  102a60:	e59f101c 	ldr	r1, [pc, #28]	; 102a84 <prog+0x2a40>
  102a64:	e5103fcf 	ldr	r3, [r0, #-4047]
  102a68:	e5912080 	ldr	r2, [r1, #128]
  102a6c:	e3c33030 	bic	r3, r3, #48	; 0x30
  102a70:	e383305f 	orr	r3, r3, #95	; 0x5f
  102a74:	e5812084 	str	r2, [r1, #132]
  102a78:	e5003fcf 	str	r3, [r0, #-4047]
  102a7c:	e8bd4010 	ldmia	sp!, {r4, lr}
  102a80:	eaffff2c 	b	102738 <vPortExitCritical>
  102a84:	0020096c 	eoreq	r0, r0, ip, ror #18

00102a88 <prvSendNextSegment>:
  102a88:	e92d4010 	stmdb	sp!, {r4, lr}
  102a8c:	e59f40e4 	ldr	r4, [pc, #228]	; 102b78 <prog+0x2b34>
  102a90:	e5942084 	ldr	r2, [r4, #132]
  102a94:	e5943080 	ldr	r3, [r4, #128]
  102a98:	e1520003 	cmp	r2, r3
  102a9c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  102aa0:	9a00002a 	bls	102b50 <prvSendNextSegment+0xc8>
  102aa4:	e0633002 	rsb	r3, r3, r2
  102aa8:	e58d3000 	str	r3, [sp]
  102aac:	e59d2000 	ldr	r2, [sp]
  102ab0:	e3520008 	cmp	r2, #8	; 0x8
  102ab4:	959d3000 	ldrls	r3, [sp]
  102ab8:	83a03008 	movhi	r3, #8	; 0x8
  102abc:	858d3008 	strhi	r3, [sp, #8]
  102ac0:	958d3008 	strls	r3, [sp, #8]
  102ac4:	ea000001 	b	102ad0 <prvSendNextSegment+0x48>
  102ac8:	e3a00001 	mov	r0, #1	; 0x1
  102acc:	ebfffe4e 	bl	10240c <vTaskDelay>
  102ad0:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  102ad4:	e5132fcf 	ldr	r2, [r3, #-4047]
  102ad8:	e3120010 	tst	r2, #16	; 0x10
  102adc:	1afffff9 	bne	102ac8 <prvSendNextSegment+0x40>
  102ae0:	e59d3008 	ldr	r3, [sp, #8]
  102ae4:	e3530000 	cmp	r3, #0	; 0x0
  102ae8:	0a00000b 	beq	102b1c <prvSendNextSegment+0x94>
  102aec:	e5941080 	ldr	r1, [r4, #128]
  102af0:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  102af4:	e7d43001 	ldrb	r3, [r4, r1]
  102af8:	e5003faf 	str	r3, [r0, #-4015]
  102afc:	e59d2008 	ldr	r2, [sp, #8]
  102b00:	e2422001 	sub	r2, r2, #1	; 0x1
  102b04:	e58d2008 	str	r2, [sp, #8]
  102b08:	e59d3008 	ldr	r3, [sp, #8]
  102b0c:	e3530000 	cmp	r3, #0	; 0x0
  102b10:	e2811001 	add	r1, r1, #1	; 0x1
  102b14:	1afffff6 	bne	102af4 <prvSendNextSegment+0x6c>
  102b18:	e5841080 	str	r1, [r4, #128]
  102b1c:	ebfffefa 	bl	10270c <vPortEnterCritical>
  102b20:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  102b24:	e5112fcf 	ldr	r2, [r1, #-4047]
  102b28:	e58d2004 	str	r2, [sp, #4]
  102b2c:	e59d3004 	ldr	r3, [sp, #4]
  102b30:	e3c33030 	bic	r3, r3, #48	; 0x30
  102b34:	e383305f 	orr	r3, r3, #95	; 0x5f
  102b38:	e58d3004 	str	r3, [sp, #4]
  102b3c:	e59d2004 	ldr	r2, [sp, #4]
  102b40:	e5012fcf 	str	r2, [r1, #-4047]
  102b44:	e28dd00c 	add	sp, sp, #12	; 0xc
  102b48:	e8bd4010 	ldmia	sp!, {r4, lr}
  102b4c:	eafffef9 	b	102738 <vPortExitCritical>
  102b50:	e59f4024 	ldr	r4, [pc, #36]	; 102b7c <prog+0x2b38>
  102b54:	e5943000 	ldr	r3, [r4]
  102b58:	e3530004 	cmp	r3, #4	; 0x4
  102b5c:	0a000001 	beq	102b68 <prvSendNextSegment+0xe0>
  102b60:	e28dd00c 	add	sp, sp, #12	; 0xc
  102b64:	e8bd8010 	ldmia	sp!, {r4, pc}
  102b68:	ebffffaf 	bl	102a2c <prvSendZLP>
  102b6c:	e3a03000 	mov	r3, #0	; 0x0
  102b70:	e5843000 	str	r3, [r4]
  102b74:	eafffff9 	b	102b60 <prvSendNextSegment+0xd8>
  102b78:	0020096c 	eoreq	r0, r0, ip, ror #18
  102b7c:	0020095c 	eoreq	r0, r0, ip, asr r9

00102b80 <prvSendControlData>:
  102b80:	e1a01801 	mov	r1, r1, lsl #16
  102b84:	e1a01821 	mov	r1, r1, lsr #16
  102b88:	e1510002 	cmp	r1, r2
  102b8c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102b90:	e1a05002 	mov	r5, r2
  102b94:	93a02000 	movls	r2, #0	; 0x0
  102b98:	83a02001 	movhi	r2, #1	; 0x1
  102b9c:	31a05001 	movcc	r5, r1
  102ba0:	3a000008 	bcc	102bc8 <prvSendControlData+0x48>
  102ba4:	e3530000 	cmp	r3, #0	; 0x0
  102ba8:	03a03000 	moveq	r3, #0	; 0x0
  102bac:	12023001 	andne	r3, r2, #1	; 0x1
  102bb0:	e3530000 	cmp	r3, #0	; 0x0
  102bb4:	0a000003 	beq	102bc8 <prvSendControlData+0x48>
  102bb8:	e3150007 	tst	r5, #7	; 0x7
  102bbc:	059f302c 	ldreq	r3, [pc, #44]	; 102bf0 <prog+0x2bac>
  102bc0:	03a02004 	moveq	r2, #4	; 0x4
  102bc4:	05832000 	streq	r2, [r3]
  102bc8:	e59f4024 	ldr	r4, [pc, #36]	; 102bf4 <prog+0x2bb0>
  102bcc:	e1a01000 	mov	r1, r0
  102bd0:	e1a02005 	mov	r2, r5
  102bd4:	e1a00004 	mov	r0, r4
  102bd8:	ebfff733 	bl	1008ac <memcpy>
  102bdc:	e3a03000 	mov	r3, #0	; 0x0
  102be0:	e5843080 	str	r3, [r4, #128]
  102be4:	e5845084 	str	r5, [r4, #132]
  102be8:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  102bec:	eaffffa5 	b	102a88 <prvSendNextSegment>
  102bf0:	0020095c 	eoreq	r0, r0, ip, asr r9
  102bf4:	0020096c 	eoreq	r0, r0, ip, ror #18

00102bf8 <vUSBCDCTask>:
  102bf8:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  102bfc:	e59fc964 	ldr	ip, [pc, #2404]	; 103568 <prog+0x3524>
  102c00:	e24dd028 	sub	sp, sp, #40	; 0x28
  102c04:	e59c4010 	ldr	r4, [ip, #16]
  102c08:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  102c0c:	e28dc004 	add	ip, sp, #4	; 0x4
  102c10:	e58dc000 	str	ip, [sp]
  102c14:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
  102c18:	e58d4014 	str	r4, [sp, #20]
  102c1c:	ebfffeba 	bl	10270c <vPortEnterCritical>
  102c20:	ebffff40 	bl	102928 <vDetachUSBInterface>
  102c24:	ebfffec3 	bl	102738 <vPortExitCritical>
  102c28:	e3a0003c 	mov	r0, #60	; 0x3c
  102c2c:	ebfffdf6 	bl	10240c <vTaskDelay>
  102c30:	ebfffeb5 	bl	10270c <vPortEnterCritical>
  102c34:	e3a00004 	mov	r0, #4	; 0x4
  102c38:	e1a01000 	mov	r1, r0
  102c3c:	ebfffb36 	bl	10191c <xQueueCreate>
  102c40:	e59f1924 	ldr	r1, [pc, #2340]	; 10356c <prog+0x3528>
  102c44:	e5810000 	str	r0, [r1]
  102c48:	e3a01001 	mov	r1, #1	; 0x1
  102c4c:	e3a00b01 	mov	r0, #1024	; 0x400
  102c50:	ebfffb31 	bl	10191c <xQueueCreate>
  102c54:	e59fb914 	ldr	fp, [pc, #2324]	; 103570 <prog+0x352c>
  102c58:	e3a01005 	mov	r1, #5	; 0x5
  102c5c:	e58b0000 	str	r0, [fp]
  102c60:	e3a000cd 	mov	r0, #205	; 0xcd
  102c64:	ebfffb2c 	bl	10191c <xQueueCreate>
  102c68:	e59f2904 	ldr	r2, [pc, #2308]	; 103574 <prog+0x3530>
  102c6c:	e3a01014 	mov	r1, #20	; 0x14
  102c70:	e5820000 	str	r0, [r2]
  102c74:	e3a00040 	mov	r0, #64	; 0x40
  102c78:	ebfffb27 	bl	10191c <xQueueCreate>
  102c7c:	e59fc8e8 	ldr	ip, [pc, #2280]	; 10356c <prog+0x3528>
  102c80:	e59c3000 	ldr	r3, [ip]
  102c84:	e59f18ec 	ldr	r1, [pc, #2284]	; 103578 <prog+0x3534>
  102c88:	e3530000 	cmp	r3, #0	; 0x0
  102c8c:	e5810000 	str	r0, [r1]
  102c90:	0a000038 	beq	102d78 <vUSBCDCTask+0x180>
  102c94:	e59b3000 	ldr	r3, [fp]
  102c98:	e3530000 	cmp	r3, #0	; 0x0
  102c9c:	0a000035 	beq	102d78 <vUSBCDCTask+0x180>
  102ca0:	e59f28cc 	ldr	r2, [pc, #2252]	; 103574 <prog+0x3530>
  102ca4:	e5923000 	ldr	r3, [r2]
  102ca8:	e3530000 	cmp	r3, #0	; 0x0
  102cac:	0a000031 	beq	102d78 <vUSBCDCTask+0x180>
  102cb0:	e3500000 	cmp	r0, #0	; 0x0
  102cb4:	0a00002f 	beq	102d78 <vUSBCDCTask+0x180>
  102cb8:	e59fc8bc 	ldr	ip, [pc, #2236]	; 10357c <prog+0x3538>
  102cbc:	e59f08bc 	ldr	r0, [pc, #2236]	; 103580 <prog+0x353c>
  102cc0:	e59f18bc 	ldr	r1, [pc, #2236]	; 103584 <prog+0x3540>
  102cc4:	e3a04000 	mov	r4, #0	; 0x0
  102cc8:	e3a03002 	mov	r3, #2	; 0x2
  102ccc:	e58c3000 	str	r3, [ip]
  102cd0:	e5c04000 	strb	r4, [r0]
  102cd4:	e5c14000 	strb	r4, [r1]
  102cd8:	e3e0ec03 	mvn	lr, #768	; 0x300
  102cdc:	e51e60d3 	ldr	r6, [lr, #-211]
  102ce0:	e3a0c080 	mov	ip, #128	; 0x80
  102ce4:	e3866201 	orr	r6, r6, #268435456	; 0x10000000
  102ce8:	e50e60d3 	str	r6, [lr, #-211]
  102cec:	e50ec0ff 	str	ip, [lr, #-255]
  102cf0:	e59fc890 	ldr	ip, [pc, #2192]	; 103588 <prog+0x3544>
  102cf4:	e58c4080 	str	r4, [ip, #128]
  102cf8:	e59fc88c 	ldr	ip, [pc, #2188]	; 10358c <prog+0x3548>
  102cfc:	e58c4080 	str	r4, [ip, #128]
  102d00:	e59fc888 	ldr	ip, [pc, #2184]	; 103590 <prog+0x354c>
  102d04:	e3e05a4f 	mvn	r5, #323584	; 0x4f000
  102d08:	e3e07c0b 	mvn	r7, #2816	; 0xb00
  102d0c:	e3a08801 	mov	r8, #65536	; 0x10000
  102d10:	e3a0ab02 	mov	sl, #2048	; 0x800
  102d14:	e3e09000 	mvn	r9, #0	; 0x0
  102d18:	e50ea0ef 	str	sl, [lr, #-239]
  102d1c:	e1a02004 	mov	r2, r4
  102d20:	e50780ff 	str	r8, [r7, #-255]
  102d24:	e3a01003 	mov	r1, #3	; 0x3
  102d28:	e50780ef 	str	r8, [r7, #-239]
  102d2c:	e59f3860 	ldr	r3, [pc, #2144]	; 103594 <prog+0x3550>
  102d30:	e50780cf 	str	r8, [r7, #-207]
  102d34:	e58c4000 	str	r4, [ip]
  102d38:	e5059feb 	str	r9, [r5, #-4075]
  102d3c:	e3a0000b 	mov	r0, #11	; 0xb
  102d40:	e5059fdf 	str	r9, [r5, #-4063]
  102d44:	e5054f8b 	str	r4, [r5, #-3979]
  102d48:	e5054fcf 	str	r4, [r5, #-4047]
  102d4c:	e5054fcb 	str	r4, [r5, #-4043]
  102d50:	e5054fc7 	str	r4, [r5, #-4039]
  102d54:	e5054fc3 	str	r4, [r5, #-4035]
  102d58:	e5054ffb 	str	r4, [r5, #-4091]
  102d5c:	e5054ff7 	str	r4, [r5, #-4087]
  102d60:	ebfff940 	bl	101268 <AT91F_AIC_ConfigureIt>
  102d64:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  102d68:	e3a00ffa 	mov	r0, #1000	; 0x3e8
  102d6c:	e583a021 	str	sl, [r3, #33]
  102d70:	ebfffda5 	bl	10240c <vTaskDelay>
  102d74:	e50780cb 	str	r8, [r7, #-203]
  102d78:	ebfffe6e 	bl	102738 <vPortExitCritical>
  102d7c:	e59f9814 	ldr	r9, [pc, #2068]	; 103598 <prog+0x3554>
  102d80:	e28da01b 	add	sl, sp, #27	; 0x1b
  102d84:	e28d8027 	add	r8, sp, #39	; 0x27
  102d88:	e28d2008 	add	r2, sp, #8	; 0x8
  102d8c:	e892000c 	ldmia	r2, {r2, r3}
  102d90:	e59f17d4 	ldr	r1, [pc, #2004]	; 10356c <prog+0x3528>
  102d94:	e1530002 	cmp	r3, r2
  102d98:	33a02000 	movcc	r2, #0	; 0x0
  102d9c:	23a02001 	movcs	r2, #1	; 0x1
  102da0:	e5910000 	ldr	r0, [r1]
  102da4:	e3a03000 	mov	r3, #0	; 0x0
  102da8:	e28d1020 	add	r1, sp, #32	; 0x20
  102dac:	ebfffa1a 	bl	10161c <xQueueGenericReceive>
  102db0:	e3500000 	cmp	r0, #0	; 0x0
  102db4:	0a000030 	beq	102e7c <vUSBCDCTask+0x284>
  102db8:	e59d5020 	ldr	r5, [sp, #32]
  102dbc:	e5953000 	ldr	r3, [r5]
  102dc0:	e3130001 	tst	r3, #1	; 0x1
  102dc4:	0a000029 	beq	102e70 <vUSBCDCTask+0x278>
  102dc8:	e5950004 	ldr	r0, [r5, #4]
  102dcc:	e1a03820 	mov	r3, r0, lsr #16
  102dd0:	e1a07a83 	mov	r7, r3, lsl #21
  102dd4:	e3100001 	tst	r0, #1	; 0x1
  102dd8:	e1a07aa7 	mov	r7, r7, lsr #21
  102ddc:	0a000013 	beq	102e30 <vUSBCDCTask+0x238>
  102de0:	e59f27a8 	ldr	r2, [pc, #1960]	; 103590 <prog+0x354c>
  102de4:	e5926000 	ldr	r6, [r2]
  102de8:	e3560002 	cmp	r6, #2	; 0x2
  102dec:	0a000189 	beq	103418 <prog+0x33d4>
  102df0:	e3560003 	cmp	r6, #3	; 0x3
  102df4:	1a000184 	bne	10340c <prog+0x33c8>
  102df8:	e59f379c 	ldr	r3, [pc, #1948]	; 10359c <prog+0x3558>
  102dfc:	e5931000 	ldr	r1, [r3]
  102e00:	e3510000 	cmp	r1, #0	; 0x0
  102e04:	13a02001 	movne	r2, #1	; 0x1
  102e08:	13e03a4f 	mvnne	r3, #323584	; 0x4f000
  102e0c:	03e03a4f 	mvneq	r3, #323584	; 0x4f000
  102e10:	e59fc778 	ldr	ip, [pc, #1912]	; 103590 <prog+0x354c>
  102e14:	15032ffb 	strne	r2, [r3, #-4091]
  102e18:	05031ffb 	streq	r1, [r3, #-4091]
  102e1c:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  102e20:	e3813c01 	orr	r3, r1, #256	; 0x100
  102e24:	e3a01000 	mov	r1, #0	; 0x0
  102e28:	e5023ff7 	str	r3, [r2, #-4087]
  102e2c:	e58c1000 	str	r1, [ip]
  102e30:	e3100002 	tst	r0, #2	; 0x2
  102e34:	0a000099 	beq	1030a0 <vUSBCDCTask+0x4a8>
  102e38:	e59f074c 	ldr	r0, [pc, #1868]	; 10358c <prog+0x3548>
  102e3c:	e2800084 	add	r0, r0, #132	; 0x84
  102e40:	e8100009 	ldmda	r0, {r0, r3}
  102e44:	e0433000 	sub	r3, r3, r0
  102e48:	e59f1738 	ldr	r1, [pc, #1848]	; 103588 <prog+0x3544>
  102e4c:	e20340ff 	and	r4, r3, #255	; 0xff
  102e50:	e1570004 	cmp	r7, r4
  102e54:	e5912084 	ldr	r2, [r1, #132]
  102e58:	320740ff 	andcc	r4, r7, #255	; 0xff
  102e5c:	e3540000 	cmp	r4, #0	; 0x0
  102e60:	e5812080 	str	r2, [r1, #128]
  102e64:	e59f6720 	ldr	r6, [pc, #1824]	; 10358c <prog+0x3548>
  102e68:	1a000084 	bne	103080 <vUSBCDCTask+0x488>
  102e6c:	e59d5020 	ldr	r5, [sp, #32]
  102e70:	e5953000 	ldr	r3, [r5]
  102e74:	e3130a01 	tst	r3, #4096	; 0x1000
  102e78:	1a0000d5 	bne	1031d4 <prog+0x3190>
  102e7c:	e59f070c 	ldr	r0, [pc, #1804]	; 103590 <prog+0x354c>
  102e80:	e5903000 	ldr	r3, [r0]
  102e84:	e3530005 	cmp	r3, #5	; 0x5
  102e88:	1affffbe 	bne	102d88 <vUSBCDCTask+0x190>
  102e8c:	e59f16f0 	ldr	r1, [pc, #1776]	; 103584 <prog+0x3540>
  102e90:	e5d13000 	ldrb	r3, [r1]
  102e94:	e3530000 	cmp	r3, #0	; 0x0
  102e98:	0affffba 	beq	102d88 <vUSBCDCTask+0x190>
  102e9c:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  102ea0:	e5132fc7 	ldr	r2, [r3, #-4039]
  102ea4:	e3120010 	tst	r2, #16	; 0x10
  102ea8:	1a000045 	bne	102fc4 <vUSBCDCTask+0x3cc>
  102eac:	e59d000c 	ldr	r0, [sp, #12]
  102eb0:	e59d2008 	ldr	r2, [sp, #8]
  102eb4:	e1500002 	cmp	r0, r2
  102eb8:	2a0000af 	bcs	10317c <prog+0x3138>
  102ebc:	e1500002 	cmp	r0, r2
  102ec0:	e3a04000 	mov	r4, #0	; 0x0
  102ec4:	3a000027 	bcc	102f68 <vUSBCDCTask+0x370>
  102ec8:	e59fc6a8 	ldr	ip, [pc, #1704]	; 103578 <prog+0x3534>
  102ecc:	e3a02000 	mov	r2, #0	; 0x0
  102ed0:	e59c0000 	ldr	r0, [ip]
  102ed4:	e28d1004 	add	r1, sp, #4	; 0x4
  102ed8:	e1a03002 	mov	r3, r2
  102edc:	ebfff9ce 	bl	10161c <xQueueGenericReceive>
  102ee0:	e3500000 	cmp	r0, #0	; 0x0
  102ee4:	058d0008 	streq	r0, [sp, #8]
  102ee8:	058d000c 	streq	r0, [sp, #12]
  102eec:	0a000003 	beq	102f00 <vUSBCDCTask+0x308>
  102ef0:	e59d000c 	ldr	r0, [sp, #12]
  102ef4:	e59d2008 	ldr	r2, [sp, #8]
  102ef8:	e1500002 	cmp	r0, r2
  102efc:	3a000019 	bcc	102f68 <vUSBCDCTask+0x370>
  102f00:	e59f166c 	ldr	r1, [pc, #1644]	; 103574 <prog+0x3530>
  102f04:	e3a02000 	mov	r2, #0	; 0x0
  102f08:	e5910000 	ldr	r0, [r1]
  102f0c:	e1a03002 	mov	r3, r2
  102f10:	e1a0100a 	mov	r1, sl
  102f14:	ebfff9c0 	bl	10161c <xQueueGenericReceive>
  102f18:	e3500000 	cmp	r0, #0	; 0x0
  102f1c:	0a000024 	beq	102fb4 <vUSBCDCTask+0x3bc>
  102f20:	e5dd101b 	ldrb	r1, [sp, #27]
  102f24:	e3510000 	cmp	r1, #0	; 0x0
  102f28:	da000007 	ble	102f4c <vUSBCDCTask+0x354>
  102f2c:	e3a02000 	mov	r2, #0	; 0x0
  102f30:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  102f34:	e2822001 	add	r2, r2, #1	; 0x1
  102f38:	e7d2300a 	ldrb	r3, [r2, sl]
  102f3c:	e1520001 	cmp	r2, r1
  102f40:	e5003fa7 	str	r3, [r0, #-4007]
  102f44:	e2844001 	add	r4, r4, #1	; 0x1
  102f48:	1afffff9 	bne	102f34 <vUSBCDCTask+0x33c>
  102f4c:	e2844001 	add	r4, r4, #1	; 0x1
  102f50:	e354003b 	cmp	r4, #59	; 0x3b
  102f54:	ca000016 	bgt	102fb4 <vUSBCDCTask+0x3bc>
  102f58:	e59d000c 	ldr	r0, [sp, #12]
  102f5c:	e59d2008 	ldr	r2, [sp, #8]
  102f60:	e1500002 	cmp	r0, r2
  102f64:	2affffd7 	bcs	102ec8 <vUSBCDCTask+0x2d0>
  102f68:	e59dc004 	ldr	ip, [sp, #4]
  102f6c:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  102f70:	e1500002 	cmp	r0, r2
  102f74:	e2844001 	add	r4, r4, #1	; 0x1
  102f78:	e2801001 	add	r1, r0, #1	; 0x1
  102f7c:	2a000007 	bcs	102fa0 <vUSBCDCTask+0x3a8>
  102f80:	e7dc3000 	ldrb	r3, [ip, r0]
  102f84:	e354003f 	cmp	r4, #63	; 0x3f
  102f88:	e50e3fa7 	str	r3, [lr, #-4007]
  102f8c:	e1a00001 	mov	r0, r1
  102f90:	e58d100c 	str	r1, [sp, #12]
  102f94:	dafffff5 	ble	102f70 <vUSBCDCTask+0x378>
  102f98:	e1520001 	cmp	r2, r1
  102f9c:	8a000004 	bhi	102fb4 <vUSBCDCTask+0x3bc>
  102fa0:	e59d3010 	ldr	r3, [sp, #16]
  102fa4:	e3530000 	cmp	r3, #0	; 0x0
  102fa8:	159d0014 	ldrne	r0, [sp, #20]
  102fac:	11a0e00f 	movne	lr, pc
  102fb0:	112fff13 	bxne	r3
  102fb4:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  102fb8:	e5123fc7 	ldr	r3, [r2, #-4039]
  102fbc:	e3833010 	orr	r3, r3, #16	; 0x10
  102fc0:	e5023fc7 	str	r3, [r2, #-4039]
  102fc4:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  102fc8:	e5143fcb 	ldr	r3, [r4, #-4043]
  102fcc:	e3130042 	tst	r3, #66	; 0x42
  102fd0:	0affff6c 	beq	102d88 <vUSBCDCTask+0x190>
  102fd4:	e5143fcb 	ldr	r3, [r4, #-4043]
  102fd8:	e59b0000 	ldr	r0, [fp]
  102fdc:	e1a03823 	mov	r3, r3, lsr #16
  102fe0:	e1a05a83 	mov	r5, r3, lsl #21
  102fe4:	ebfff8ee 	bl	1013a4 <uxQueueMessagesWaiting>
  102fe8:	e1a05aa5 	mov	r5, r5, lsr #21
  102fec:	e2600b01 	rsb	r0, r0, #1024	; 0x400
  102ff0:	e1550000 	cmp	r5, r0
  102ff4:	2affff63 	bcs	102d88 <vUSBCDCTask+0x190>
  102ff8:	e3550000 	cmp	r5, #0	; 0x0
  102ffc:	0a00000b 	beq	103030 <vUSBCDCTask+0x438>
  103000:	e1a06004 	mov	r6, r4
  103004:	e3a04000 	mov	r4, #0	; 0x0
  103008:	e516cfab 	ldr	ip, [r6, #-4011]
  10300c:	e3a02000 	mov	r2, #0	; 0x0
  103010:	e2844001 	add	r4, r4, #1	; 0x1
  103014:	e59b0000 	ldr	r0, [fp]
  103018:	e1a01008 	mov	r1, r8
  10301c:	e1a03002 	mov	r3, r2
  103020:	e5cdc027 	strb	ip, [sp, #39]
  103024:	ebfff9e2 	bl	1017b4 <xQueueGenericSend>
  103028:	e1540005 	cmp	r4, r5
  10302c:	1afffff5 	bne	103008 <vUSBCDCTask+0x410>
  103030:	ebfffdb5 	bl	10270c <vPortEnterCritical>
  103034:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  103038:	e59fc53c 	ldr	ip, [pc, #1340]	; 10357c <prog+0x3538>
  10303c:	e5143fcb 	ldr	r3, [r4, #-4043]
  103040:	e59c2000 	ldr	r2, [ip]
  103044:	e383304f 	orr	r3, r3, #79	; 0x4f
  103048:	e1e02002 	mvn	r2, r2
  10304c:	e3c33030 	bic	r3, r3, #48	; 0x30
  103050:	e0033002 	and	r3, r3, r2
  103054:	e5043fcb 	str	r3, [r4, #-4043]
  103058:	ebfffdb6 	bl	102738 <vPortExitCritical>
  10305c:	e3a01002 	mov	r1, #2	; 0x2
  103060:	e5041fef 	str	r1, [r4, #-4079]
  103064:	e59f0510 	ldr	r0, [pc, #1296]	; 10357c <prog+0x3538>
  103068:	e5903000 	ldr	r3, [r0]
  10306c:	e1530001 	cmp	r3, r1
  103070:	03a03040 	moveq	r3, #64	; 0x40
  103074:	05803000 	streq	r3, [r0]
  103078:	15801000 	strne	r1, [r0]
  10307c:	eaffffd0 	b	102fc4 <vUSBCDCTask+0x3cc>
  103080:	e1a00006 	mov	r0, r6
  103084:	e2851008 	add	r1, r5, #8	; 0x8
  103088:	e1a02004 	mov	r2, r4
  10308c:	ebfff606 	bl	1008ac <memcpy>
  103090:	e5963080 	ldr	r3, [r6, #128]
  103094:	e0843003 	add	r3, r4, r3
  103098:	e5863080 	str	r3, [r6, #128]
  10309c:	e5950004 	ldr	r0, [r5, #4]
  1030a0:	e3100004 	tst	r0, #4	; 0x4
  1030a4:	0a000020 	beq	10312c <vUSBCDCTask+0x534>
  1030a8:	e3570007 	cmp	r7, #7	; 0x7
  1030ac:	9a00001e 	bls	10312c <vUSBCDCTask+0x534>
  1030b0:	e5d51008 	ldrb	r1, [r5, #8]
  1030b4:	e5c91000 	strb	r1, [r9]
  1030b8:	e5d52009 	ldrb	r2, [r5, #9]
  1030bc:	e5c92001 	strb	r2, [r9, #1]
  1030c0:	e5d5300b 	ldrb	r3, [r5, #11]
  1030c4:	e1a03403 	mov	r3, r3, lsl #8
  1030c8:	e1c930b2 	strh	r3, [r9, #2]
  1030cc:	e5d5200a 	ldrb	r2, [r5, #10]
  1030d0:	e1833002 	orr	r3, r3, r2
  1030d4:	e1c930b2 	strh	r3, [r9, #2]
  1030d8:	e5d5200d 	ldrb	r2, [r5, #13]
  1030dc:	e1a02402 	mov	r2, r2, lsl #8
  1030e0:	e1c920b4 	strh	r2, [r9, #4]
  1030e4:	e5d5300c 	ldrb	r3, [r5, #12]
  1030e8:	e1822003 	orr	r2, r2, r3
  1030ec:	e1c920b4 	strh	r2, [r9, #4]
  1030f0:	e5d5300f 	ldrb	r3, [r5, #15]
  1030f4:	e1a03403 	mov	r3, r3, lsl #8
  1030f8:	e1c930b6 	strh	r3, [r9, #6]
  1030fc:	e5d5200e 	ldrb	r2, [r5, #14]
  103100:	e59fc484 	ldr	ip, [pc, #1156]	; 10358c <prog+0x3548>
  103104:	e1833002 	orr	r3, r3, r2
  103108:	e3110080 	tst	r1, #128	; 0x80
  10310c:	e3a02000 	mov	r2, #0	; 0x0
  103110:	e1c930b6 	strh	r3, [r9, #6]
  103114:	e58c2080 	str	r2, [ip, #128]
  103118:	1a0000d9 	bne	103484 <prog+0x3440>
  10311c:	e3530080 	cmp	r3, #128	; 0x80
  103120:	958c3084 	strls	r3, [ip, #132]
  103124:	95950004 	ldrls	r0, [r5, #4]
  103128:	8a000024 	bhi	1031c0 <prog+0x317c>
  10312c:	e3100006 	tst	r0, #6	; 0x6
  103130:	0affff4d 	beq	102e6c <vUSBCDCTask+0x274>
  103134:	e59f0450 	ldr	r0, [pc, #1104]	; 10358c <prog+0x3548>
  103138:	e2802080 	add	r2, r0, #128	; 0x80
  10313c:	e892000c 	ldmia	r2, {r2, r3}
  103140:	e1520003 	cmp	r2, r3
  103144:	3affff48 	bcc	102e6c <vUSBCDCTask+0x274>
  103148:	e5d93000 	ldrb	r3, [r9]
  10314c:	e2032060 	and	r2, r3, #96	; 0x60
  103150:	e2033003 	and	r3, r3, #3	; 0x3
  103154:	e18331a2 	orr	r3, r3, r2, lsr #3
  103158:	e3530005 	cmp	r3, #5	; 0x5
  10315c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  103160:	ea000016 	b	1031c0 <prog+0x317c>
  103164:	00103260 	andeqs	r3, r0, r0, ror #4
  103168:	00103234 	andeqs	r3, r0, r4, lsr r2
  10316c:	001031c0 	andeqs	r3, r0, r0, asr #3
  103170:	001031c0 	andeqs	r3, r0, r0, asr #3
  103174:	001031c0 	andeqs	r3, r0, r0, asr #3
  103178:	001032a0 	andeqs	r3, r0, r0, lsr #5
  10317c:	e59f23f0 	ldr	r2, [pc, #1008]	; 103574 <prog+0x3530>
  103180:	e5920000 	ldr	r0, [r2]
  103184:	ebfff886 	bl	1013a4 <uxQueueMessagesWaiting>
  103188:	e3500000 	cmp	r0, #0	; 0x0
  10318c:	0a0000bf 	beq	103490 <prog+0x344c>
  103190:	e59d000c 	ldr	r0, [sp, #12]
  103194:	e59d2008 	ldr	r2, [sp, #8]
  103198:	eaffff47 	b	102ebc <vUSBCDCTask+0x2c4>
  10319c:	e1d920b2 	ldrh	r2, [r9, #2]
  1031a0:	e1a03422 	mov	r3, r2, lsr #8
  1031a4:	e3530002 	cmp	r3, #2	; 0x2
  1031a8:	e59f13e8 	ldr	r1, [pc, #1000]	; 103598 <prog+0x3554>
  1031ac:	0a0000cc 	beq	1034e4 <prog+0x34a0>
  1031b0:	e3530003 	cmp	r3, #3	; 0x3
  1031b4:	0a0000c1 	beq	1034c0 <prog+0x347c>
  1031b8:	e3530001 	cmp	r3, #1	; 0x1
  1031bc:	0a0000b9 	beq	1034a8 <prog+0x3464>
  1031c0:	ebfffe10 	bl	102a08 <prvSendStall>
  1031c4:	e59d5020 	ldr	r5, [sp, #32]
  1031c8:	e5953000 	ldr	r3, [r5]
  1031cc:	e3130a01 	tst	r3, #4096	; 0x1000
  1031d0:	0affff29 	beq	102e7c <vUSBCDCTask+0x284>
  1031d4:	e59f13a8 	ldr	r1, [pc, #936]	; 103584 <prog+0x3540>
  1031d8:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1031dc:	e3a02000 	mov	r2, #0	; 0x0
  1031e0:	e3a0300f 	mov	r3, #15	; 0xf
  1031e4:	e5c12000 	strb	r2, [r1]
  1031e8:	e5043fd7 	str	r3, [r4, #-4055]
  1031ec:	e5042fd7 	str	r2, [r4, #-4055]
  1031f0:	e59f2398 	ldr	r2, [pc, #920]	; 103590 <prog+0x354c>
  1031f4:	e28330f1 	add	r3, r3, #241	; 0xf1
  1031f8:	e3a05001 	mov	r5, #1	; 0x1
  1031fc:	e5043ff7 	str	r3, [r4, #-4087]
  103200:	e5825000 	str	r5, [r2]
  103204:	ebfffd40 	bl	10270c <vPortEnterCritical>
  103208:	e5143fcf 	ldr	r3, [r4, #-4047]
  10320c:	e383304f 	orr	r3, r3, #79	; 0x4f
  103210:	e3c33030 	bic	r3, r3, #48	; 0x30
  103214:	e3833902 	orr	r3, r3, #32768	; 0x8000
  103218:	e5043fcf 	str	r3, [r4, #-4047]
  10321c:	e5045fef 	str	r5, [r4, #-4079]
  103220:	ebfffd44 	bl	102738 <vPortExitCritical>
  103224:	e59fc350 	ldr	ip, [pc, #848]	; 10357c <prog+0x3538>
  103228:	e3a03002 	mov	r3, #2	; 0x2
  10322c:	e58c3000 	str	r3, [ip]
  103230:	eaffff11 	b	102e7c <vUSBCDCTask+0x284>
  103234:	e5d93001 	ldrb	r3, [r9, #1]
  103238:	e3a0c000 	mov	ip, #0	; 0x0
  10323c:	e3530000 	cmp	r3, #0	; 0x0
  103240:	e1cdc2b4 	strh	ip, [sp, #36]
  103244:	1affffdd 	bne	1031c0 <prog+0x317c>
  103248:	e3a01002 	mov	r1, #2	; 0x2
  10324c:	e28d0024 	add	r0, sp, #36	; 0x24
  103250:	e1a02001 	mov	r2, r1
  103254:	ebfffe49 	bl	102b80 <prvSendControlData>
  103258:	e59d5020 	ldr	r5, [sp, #32]
  10325c:	eaffff03 	b	102e70 <vUSBCDCTask+0x278>
  103260:	e5d93001 	ldrb	r3, [r9, #1]
  103264:	e3a01000 	mov	r1, #0	; 0x0
  103268:	e1cd12b4 	strh	r1, [sp, #36]
  10326c:	e3530009 	cmp	r3, #9	; 0x9
  103270:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  103274:	eaffffd1 	b	1031c0 <prog+0x317c>
  103278:	001033a0 	andeqs	r3, r0, r0, lsr #7
  10327c:	001031c0 	andeqs	r3, r0, r0, asr #3
  103280:	001031c0 	andeqs	r3, r0, r0, asr #3
  103284:	00103354 	andeqs	r3, r0, r4, asr r3
  103288:	001031c0 	andeqs	r3, r0, r0, asr #3
  10328c:	00103360 	andeqs	r3, r0, r0, ror #6
  103290:	0010319c 	muleqs	r0, ip, r1
  103294:	001031c0 	andeqs	r3, r0, r0, asr #3
  103298:	00103384 	andeqs	r3, r0, r4, lsl #7
  10329c:	0010333c 	andeqs	r3, r0, ip, lsr r3
  1032a0:	e5d93001 	ldrb	r3, [r9, #1]
  1032a4:	e3530022 	cmp	r3, #34	; 0x22
  1032a8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  1032ac:	eaffffc3 	b	1031c0 <prog+0x317c>
  1032b0:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032b4:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032b8:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032bc:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032c0:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032c4:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032c8:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032cc:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032d0:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032d4:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032d8:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032dc:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032e0:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032e4:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032e8:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032ec:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032f0:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032f4:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032f8:	001031c0 	andeqs	r3, r0, r0, asr #3
  1032fc:	001031c0 	andeqs	r3, r0, r0, asr #3
  103300:	001031c0 	andeqs	r3, r0, r0, asr #3
  103304:	001031c0 	andeqs	r3, r0, r0, asr #3
  103308:	001031c0 	andeqs	r3, r0, r0, asr #3
  10330c:	001031c0 	andeqs	r3, r0, r0, asr #3
  103310:	001031c0 	andeqs	r3, r0, r0, asr #3
  103314:	001031c0 	andeqs	r3, r0, r0, asr #3
  103318:	001031c0 	andeqs	r3, r0, r0, asr #3
  10331c:	001031c0 	andeqs	r3, r0, r0, asr #3
  103320:	001031c0 	andeqs	r3, r0, r0, asr #3
  103324:	001031c0 	andeqs	r3, r0, r0, asr #3
  103328:	001031c0 	andeqs	r3, r0, r0, asr #3
  10332c:	001031c0 	andeqs	r3, r0, r0, asr #3
  103330:	001033bc 	ldreqh	r3, [r0], -ip
  103334:	001033d8 	ldreqsb	r3, [r0], -r8
  103338:	001033f4 	ldreqsh	r3, [r0], -r4
  10333c:	e1d930b2 	ldrh	r3, [r9, #2]
  103340:	e59f2238 	ldr	r2, [pc, #568]	; 103580 <prog+0x353c>
  103344:	e5c23000 	strb	r3, [r2]
  103348:	e59f3240 	ldr	r3, [pc, #576]	; 103590 <prog+0x354c>
  10334c:	e3a02002 	mov	r2, #2	; 0x2
  103350:	e5832000 	str	r2, [r3]
  103354:	ebfffdb4 	bl	102a2c <prvSendZLP>
  103358:	e59d5020 	ldr	r5, [sp, #32]
  10335c:	eafffec3 	b	102e70 <vUSBCDCTask+0x278>
  103360:	ebfffdb1 	bl	102a2c <prvSendZLP>
  103364:	e1d920b2 	ldrh	r2, [r9, #2]
  103368:	e59f0220 	ldr	r0, [pc, #544]	; 103590 <prog+0x354c>
  10336c:	e59f1228 	ldr	r1, [pc, #552]	; 10359c <prog+0x3558>
  103370:	e59d5020 	ldr	r5, [sp, #32]
  103374:	e3a03003 	mov	r3, #3	; 0x3
  103378:	e5803000 	str	r3, [r0]
  10337c:	e5812000 	str	r2, [r1]
  103380:	eafffeba 	b	102e70 <vUSBCDCTask+0x278>
  103384:	e3a01001 	mov	r1, #1	; 0x1
  103388:	e59f01f0 	ldr	r0, [pc, #496]	; 103580 <prog+0x353c>
  10338c:	e1a02001 	mov	r2, r1
  103390:	e3a03000 	mov	r3, #0	; 0x0
  103394:	ebfffdf9 	bl	102b80 <prvSendControlData>
  103398:	e59d5020 	ldr	r5, [sp, #32]
  10339c:	eafffeb3 	b	102e70 <vUSBCDCTask+0x278>
  1033a0:	e3a01002 	mov	r1, #2	; 0x2
  1033a4:	e28d0024 	add	r0, sp, #36	; 0x24
  1033a8:	e1a02001 	mov	r2, r1
  1033ac:	e3a03000 	mov	r3, #0	; 0x0
  1033b0:	ebfffdf2 	bl	102b80 <prvSendControlData>
  1033b4:	e59d5020 	ldr	r5, [sp, #32]
  1033b8:	eafffeac 	b	102e70 <vUSBCDCTask+0x278>
  1033bc:	ebfffd9a 	bl	102a2c <prvSendZLP>
  1033c0:	e59f01d8 	ldr	r0, [pc, #472]	; 1035a0 <prog+0x355c>
  1033c4:	e59f11c0 	ldr	r1, [pc, #448]	; 10358c <prog+0x3548>
  1033c8:	e3a02007 	mov	r2, #7	; 0x7
  1033cc:	ebfff536 	bl	1008ac <memcpy>
  1033d0:	e59d5020 	ldr	r5, [sp, #32]
  1033d4:	eafffea5 	b	102e70 <vUSBCDCTask+0x278>
  1033d8:	e59f01c0 	ldr	r0, [pc, #448]	; 1035a0 <prog+0x355c>
  1033dc:	e1d910b6 	ldrh	r1, [r9, #6]
  1033e0:	e3a02007 	mov	r2, #7	; 0x7
  1033e4:	e3a03000 	mov	r3, #0	; 0x0
  1033e8:	ebfffde4 	bl	102b80 <prvSendControlData>
  1033ec:	e59d5020 	ldr	r5, [sp, #32]
  1033f0:	eafffe9e 	b	102e70 <vUSBCDCTask+0x278>
  1033f4:	ebfffd8c 	bl	102a2c <prvSendZLP>
  1033f8:	e1d930b2 	ldrh	r3, [r9, #2]
  1033fc:	e59f0180 	ldr	r0, [pc, #384]	; 103584 <prog+0x3540>
  103400:	e59d5020 	ldr	r5, [sp, #32]
  103404:	e5c03000 	strb	r3, [r0]
  103408:	eafffe98 	b	102e70 <vUSBCDCTask+0x278>
  10340c:	ebfffd9d 	bl	102a88 <prvSendNextSegment>
  103410:	e5950004 	ldr	r0, [r5, #4]
  103414:	eafffe85 	b	102e30 <vUSBCDCTask+0x238>
  103418:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10341c:	e5046ffb 	str	r6, [r4, #-4091]
  103420:	ebfffcb9 	bl	10270c <vPortEnterCritical>
  103424:	e5143fcb 	ldr	r3, [r4, #-4043]
  103428:	e383304f 	orr	r3, r3, #79	; 0x4f
  10342c:	e3c33030 	bic	r3, r3, #48	; 0x30
  103430:	e3833c82 	orr	r3, r3, #33280	; 0x8200
  103434:	e5043fcb 	str	r3, [r4, #-4043]
  103438:	e5046fef 	str	r6, [r4, #-4079]
  10343c:	e5143fc7 	ldr	r3, [r4, #-4039]
  103440:	e383304f 	orr	r3, r3, #79	; 0x4f
  103444:	e3c33030 	bic	r3, r3, #48	; 0x30
  103448:	e3a02004 	mov	r2, #4	; 0x4
  10344c:	e3833c86 	orr	r3, r3, #34304	; 0x8600
  103450:	e5043fc7 	str	r3, [r4, #-4039]
  103454:	e5042fef 	str	r2, [r4, #-4079]
  103458:	e5143fc3 	ldr	r3, [r4, #-4035]
  10345c:	e383304f 	orr	r3, r3, #79	; 0x4f
  103460:	e3c33030 	bic	r3, r3, #48	; 0x30
  103464:	e3833c87 	orr	r3, r3, #34560	; 0x8700
  103468:	e5043fc3 	str	r3, [r4, #-4035]
  10346c:	ebfffcb1 	bl	102738 <vPortExitCritical>
  103470:	e59f3118 	ldr	r3, [pc, #280]	; 103590 <prog+0x354c>
  103474:	e5950004 	ldr	r0, [r5, #4]
  103478:	e3a02005 	mov	r2, #5	; 0x5
  10347c:	e5832000 	str	r2, [r3]
  103480:	eafffe6a 	b	102e30 <vUSBCDCTask+0x238>
  103484:	e58c2084 	str	r2, [ip, #132]
  103488:	e5950004 	ldr	r0, [r5, #4]
  10348c:	eaffff26 	b	10312c <vUSBCDCTask+0x534>
  103490:	e59f30e0 	ldr	r3, [pc, #224]	; 103578 <prog+0x3534>
  103494:	e5930000 	ldr	r0, [r3]
  103498:	ebfff7c1 	bl	1013a4 <uxQueueMessagesWaiting>
  10349c:	e3500000 	cmp	r0, #0	; 0x0
  1034a0:	0afffec7 	beq	102fc4 <vUSBCDCTask+0x3cc>
  1034a4:	eaffff39 	b	103190 <prog+0x314c>
  1034a8:	e1d110b6 	ldrh	r1, [r1, #6]
  1034ac:	e59f00f0 	ldr	r0, [pc, #240]	; 1035a4 <prog+0x3560>
  1034b0:	e3a02012 	mov	r2, #18	; 0x12
  1034b4:	ebfffdb1 	bl	102b80 <prvSendControlData>
  1034b8:	e59d5020 	ldr	r5, [sp, #32]
  1034bc:	eafffe6b 	b	102e70 <vUSBCDCTask+0x278>
  1034c0:	e20230ff 	and	r3, r2, #255	; 0xff
  1034c4:	e3530004 	cmp	r3, #4	; 0x4
  1034c8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  1034cc:	eaffff3b 	b	1031c0 <prog+0x317c>
  1034d0:	00103514 	andeqs	r3, r0, r4, lsl r5
  1034d4:	00103530 	andeqs	r3, r0, r0, lsr r5
  1034d8:	0010354c 	andeqs	r3, r0, ip, asr #10
  1034dc:	0010354c 	andeqs	r3, r0, ip, asr #10
  1034e0:	0010354c 	andeqs	r3, r0, ip, asr #10
  1034e4:	e20230ff 	and	r3, r2, #255	; 0xff
  1034e8:	e59fc0b8 	ldr	ip, [pc, #184]	; 1035a8 <prog+0x3564>
  1034ec:	e3530002 	cmp	r3, #2	; 0x2
  1034f0:	23a03002 	movcs	r3, #2	; 0x2
  1034f4:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  1034f8:	e59fc0ac 	ldr	ip, [pc, #172]	; 1035ac <prog+0x3568>
  1034fc:	e1d110b6 	ldrh	r1, [r1, #6]
  103500:	e79c0103 	ldr	r0, [ip, r3, lsl #2]
  103504:	e3a03001 	mov	r3, #1	; 0x1
  103508:	ebfffd9c 	bl	102b80 <prvSendControlData>
  10350c:	e59d5020 	ldr	r5, [sp, #32]
  103510:	eafffe56 	b	102e70 <vUSBCDCTask+0x278>
  103514:	e59f0094 	ldr	r0, [pc, #148]	; 1035b0 <prog+0x356c>
  103518:	e1d910b6 	ldrh	r1, [r9, #6]
  10351c:	e3a02004 	mov	r2, #4	; 0x4
  103520:	e3a03001 	mov	r3, #1	; 0x1
  103524:	ebfffd95 	bl	102b80 <prvSendControlData>
  103528:	e59d5020 	ldr	r5, [sp, #32]
  10352c:	eafffe4f 	b	102e70 <vUSBCDCTask+0x278>
  103530:	e59f007c 	ldr	r0, [pc, #124]	; 1035b4 <prog+0x3570>
  103534:	e1d910b6 	ldrh	r1, [r9, #6]
  103538:	e3a0201c 	mov	r2, #28	; 0x1c
  10353c:	e3a03001 	mov	r3, #1	; 0x1
  103540:	ebfffd8e 	bl	102b80 <prvSendControlData>
  103544:	e59d5020 	ldr	r5, [sp, #32]
  103548:	eafffe48 	b	102e70 <vUSBCDCTask+0x278>
  10354c:	e59f0064 	ldr	r0, [pc, #100]	; 1035b8 <prog+0x3574>
  103550:	e1d910b6 	ldrh	r1, [r9, #6]
  103554:	e3a0202c 	mov	r2, #44	; 0x2c
  103558:	e3a03001 	mov	r3, #1	; 0x1
  10355c:	ebfffd87 	bl	102b80 <prvSendControlData>
  103560:	e59d5020 	ldr	r5, [sp, #32]
  103564:	eafffe41 	b	102e70 <vUSBCDCTask+0x278>
  103568:	0010390c 	andeqs	r3, r0, ip, lsl #18
  10356c:	00201130 	eoreq	r1, r0, r0, lsr r1
  103570:	00200a7c 	eoreq	r0, r0, ip, ror sl
  103574:	00200a80 	eoreq	r0, r0, r0, lsl #21
  103578:	00200a84 	eoreq	r0, r0, r4, lsl #21
  10357c:	00200a8c 	eoreq	r0, r0, ip, lsl #21
  103580:	00200958 	eoreq	r0, r0, r8, asr r9
  103584:	00200a88 	eoreq	r0, r0, r8, lsl #21
  103588:	0020096c 	eoreq	r0, r0, ip, ror #18
  10358c:	002009f4 	streqd	r0, [r0], -r4
  103590:	0020095c 	eoreq	r0, r0, ip, asr r9
  103594:	00103760 	andeqs	r3, r0, r0, ror #14
  103598:	00200964 	eoreq	r0, r0, r4, ror #18
  10359c:	00200960 	eoreq	r0, r0, r0, ror #18
  1035a0:	00103920 	andeqs	r3, r0, r0, lsr #18
  1035a4:	001038f8 	ldreqsh	r3, [r0], -r8
  1035a8:	001038f0 	ldreqsh	r3, [r0], -r0
  1035ac:	00200818 	eoreq	r0, r0, r8, lsl r8
  1035b0:	0010381d 	andeqs	r3, r0, sp, lsl r8
  1035b4:	00103821 	andeqs	r3, r0, r1, lsr #16
  1035b8:	0010383d 	andeqs	r3, r0, sp, lsr r8

001035bc <vUSB_ISR_Handler>:
  1035bc:	e59f2190 	ldr	r2, [pc, #400]	; 103754 <prog+0x3710>
  1035c0:	e5921000 	ldr	r1, [r2]
  1035c4:	e5923000 	ldr	r3, [r2]
  1035c8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1035cc:	e2833001 	add	r3, r3, #1	; 0x1
  1035d0:	e5823000 	str	r3, [r2]
  1035d4:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1035d8:	e514cfe3 	ldr	ip, [r4, #-4067]
  1035dc:	e59f0174 	ldr	r0, [pc, #372]	; 103758 <prog+0x3714>
  1035e0:	e514efcf 	ldr	lr, [r4, #-4047]
  1035e4:	e2011003 	and	r1, r1, #3	; 0x3
  1035e8:	e5143fe7 	ldr	r3, [r4, #-4071]
  1035ec:	e1a01201 	mov	r1, r1, lsl #4
  1035f0:	e24dd008 	sub	sp, sp, #8	; 0x8
  1035f4:	e0812000 	add	r2, r1, r0
  1035f8:	e3833a01 	orr	r3, r3, #4096	; 0x1000
  1035fc:	e3a05000 	mov	r5, #0	; 0x0
  103600:	e31e0006 	tst	lr, #6	; 0x6
  103604:	e781c000 	str	ip, [r1, r0]
  103608:	e582e004 	str	lr, [r2, #4]
  10360c:	e5043fdf 	str	r3, [r4, #-4063]
  103610:	e88d0024 	stmia	sp, {r2, r5}
  103614:	0a000019 	beq	103680 <vUSB_ISR_Handler+0xc4>
  103618:	e1a0382e 	mov	r3, lr, lsr #16
  10361c:	e1a0ca83 	mov	ip, r3, lsl #21
  103620:	e1a0caac 	mov	ip, ip, lsr #21
  103624:	e15c0005 	cmp	ip, r5
  103628:	0a000009 	beq	103654 <vUSB_ISR_Handler+0x98>
  10362c:	e1a00005 	mov	r0, r5
  103630:	e1a0e004 	mov	lr, r4
  103634:	e59d2000 	ldr	r2, [sp]
  103638:	e2803001 	add	r3, r0, #1	; 0x1
  10363c:	e0802002 	add	r2, r0, r2
  103640:	e51e1faf 	ldr	r1, [lr, #-4015]
  103644:	e20300ff 	and	r0, r3, #255	; 0xff
  103648:	e15c0000 	cmp	ip, r0
  10364c:	e5c21008 	strb	r1, [r2, #8]
  103650:	8afffff7 	bhi	103634 <vUSB_ISR_Handler+0x78>
  103654:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  103658:	e5113fcf 	ldr	r3, [r1, #-4047]
  10365c:	e3130004 	tst	r3, #4	; 0x4
  103660:	1a000025 	bne	1036fc <vUSB_ISR_Handler+0x140>
  103664:	e5113fcf 	ldr	r3, [r1, #-4047]
  103668:	e3c33002 	bic	r3, r3, #2	; 0x2
  10366c:	e5013fcf 	str	r3, [r1, #-4047]
  103670:	e1a02001 	mov	r2, r1
  103674:	e5123fcf 	ldr	r3, [r2, #-4047]
  103678:	e3130002 	tst	r3, #2	; 0x2
  10367c:	1afffffc 	bne	103674 <vUSB_ISR_Handler+0xb8>
  103680:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  103684:	e51e3fcb 	ldr	r3, [lr, #-4043]
  103688:	e3130042 	tst	r3, #66	; 0x42
  10368c:	13a03002 	movne	r3, #2	; 0x2
  103690:	150e3feb 	strne	r3, [lr, #-4075]
  103694:	e51e3fcf 	ldr	r3, [lr, #-4047]
  103698:	e3c33009 	bic	r3, r3, #9	; 0x9
  10369c:	e50e3fcf 	str	r3, [lr, #-4047]
  1036a0:	e51e2fcb 	ldr	r2, [lr, #-4043]
  1036a4:	e3c2200d 	bic	r2, r2, #13	; 0xd
  1036a8:	e50e2fcb 	str	r2, [lr, #-4043]
  1036ac:	e51e3fc7 	ldr	r3, [lr, #-4039]
  1036b0:	e3c3304f 	bic	r3, r3, #79	; 0x4f
  1036b4:	e50e3fc7 	str	r3, [lr, #-4039]
  1036b8:	e51ecfc3 	ldr	ip, [lr, #-4035]
  1036bc:	e59f3098 	ldr	r3, [pc, #152]	; 10375c <prog+0x3718>
  1036c0:	e3ccc04f 	bic	ip, ip, #79	; 0x4f
  1036c4:	e5930000 	ldr	r0, [r3]
  1036c8:	e28d2004 	add	r2, sp, #4	; 0x4
  1036cc:	e3a03000 	mov	r3, #0	; 0x0
  1036d0:	e1a0100d 	mov	r1, sp
  1036d4:	e50ecfc3 	str	ip, [lr, #-4035]
  1036d8:	ebfff771 	bl	1014a4 <xQueueGenericSendFromISR>
  1036dc:	e59d3004 	ldr	r3, [sp, #4]
  1036e0:	e3a02000 	mov	r2, #0	; 0x0
  1036e4:	e3530000 	cmp	r3, #0	; 0x0
  1036e8:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  1036ec:	e5832031 	str	r2, [r3, #49]
  1036f0:	1bfff8b2 	blne	1019c0 <vTaskSwitchContext>
  1036f4:	e28dd008 	add	sp, sp, #8	; 0x8
  1036f8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1036fc:	e35c0000 	cmp	ip, #0	; 0x0
  103700:	1a000007 	bne	103724 <vUSB_ISR_Handler+0x168>
  103704:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  103708:	e5123fcf 	ldr	r3, [r2, #-4047]
  10370c:	e3c33004 	bic	r3, r3, #4	; 0x4
  103710:	e5023fcf 	str	r3, [r2, #-4047]
  103714:	e5123fcf 	ldr	r3, [r2, #-4047]
  103718:	e3130004 	tst	r3, #4	; 0x4
  10371c:	1afffffc 	bne	103714 <vUSB_ISR_Handler+0x158>
  103720:	eaffffd6 	b	103680 <vUSB_ISR_Handler+0xc4>
  103724:	e59d3000 	ldr	r3, [sp]
  103728:	e1d320d8 	ldrsb	r2, [r3, #8]
  10372c:	e3520000 	cmp	r2, #0	; 0x0
  103730:	aafffff3 	bge	103704 <vUSB_ISR_Handler+0x148>
  103734:	e5113fcf 	ldr	r3, [r1, #-4047]
  103738:	e3833080 	orr	r3, r3, #128	; 0x80
  10373c:	e5013fcf 	str	r3, [r1, #-4047]
  103740:	e1a02001 	mov	r2, r1
  103744:	e5123fcf 	ldr	r3, [r2, #-4047]
  103748:	e3130080 	tst	r3, #128	; 0x80
  10374c:	0afffffc 	beq	103744 <vUSB_ISR_Handler+0x188>
  103750:	eaffffeb 	b	103704 <vUSB_ISR_Handler+0x148>
  103754:	00200a90 	mlaeq	r0, r0, sl, r0
  103758:	00200a94 	mlaeq	r0, r4, sl, r0
  10375c:	00201130 	eoreq	r1, r0, r0, lsr r1

00103760 <vUSB_ISR_Wrapper>:
  103760:	e92d0001 	stmdb	sp!, {r0}
  103764:	e94d2000 	stmdb	sp, {sp}^
  103768:	e1a00000 	nop			(mov r0,r0)
  10376c:	e24dd004 	sub	sp, sp, #4	; 0x4
  103770:	e8bd0001 	ldmia	sp!, {r0}
  103774:	e9204000 	stmdb	r0!, {lr}
  103778:	e1a0e000 	mov	lr, r0
  10377c:	e8bd0001 	ldmia	sp!, {r0}
  103780:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  103784:	e1a00000 	nop			(mov r0,r0)
  103788:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10378c:	e14f0000 	mrs	r0, SPSR
  103790:	e92e0001 	stmdb	lr!, {r0}
  103794:	e59f0064 	ldr	r0, [pc, #100]	; 103800 <prog+0x37bc>
  103798:	e5900000 	ldr	r0, [r0]
  10379c:	e92e0001 	stmdb	lr!, {r0}
  1037a0:	e59f005c 	ldr	r0, [pc, #92]	; 103804 <prog+0x37c0>
  1037a4:	e5900000 	ldr	r0, [r0]
  1037a8:	e580e000 	str	lr, [r0]
  1037ac:	e59f4044 	ldr	r4, [pc, #68]	; 1037f8 <prog+0x37b4>
  1037b0:	e59f5044 	ldr	r5, [pc, #68]	; 1037fc <prog+0x37b8>
  1037b4:	e5943000 	ldr	r3, [r4]
  1037b8:	e5952000 	ldr	r2, [r5]
  1037bc:	ebffff7e 	bl	1035bc <vUSB_ISR_Handler>
  1037c0:	e59f003c 	ldr	r0, [pc, #60]	; 103804 <prog+0x37c0>
  1037c4:	e5900000 	ldr	r0, [r0]
  1037c8:	e590e000 	ldr	lr, [r0]
  1037cc:	e59f002c 	ldr	r0, [pc, #44]	; 103800 <prog+0x37bc>
  1037d0:	e8be0002 	ldmia	lr!, {r1}
  1037d4:	e5801000 	str	r1, [r0]
  1037d8:	e8be0001 	ldmia	lr!, {r0}
  1037dc:	e169f000 	msr	SPSR_fc, r0
  1037e0:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1037e4:	e1a00000 	nop			(mov r0,r0)
  1037e8:	e59ee03c 	ldr	lr, [lr, #60]
  1037ec:	e25ef004 	subs	pc, lr, #4	; 0x4
  1037f0:	e5943000 	ldr	r3, [r4]
  1037f4:	e5952000 	ldr	r2, [r5]
  1037f8:	00200814 	eoreq	r0, r0, r4, lsl r8
  1037fc:	0020085c 	eoreq	r0, r0, ip, asr r8
  103800:	00200814 	eoreq	r0, r0, r4, lsl r8
  103804:	0020085c 	eoreq	r0, r0, ip, asr r8
  103808:	00425355 	subeq	r5, r2, r5, asr r3
  10380c:	53425355 	cmppl	r2, #1409286145	; 0x54000001
  103810:	4c4c4548 	cfstr64mi	mvdx4, [ip], {72}
  103814:	00000000 	andeq	r0, r0, r0
  103818:	454c4449 	strmib	r4, [ip, #-1097]
	...

0010381d <pxLanguageStringDescriptor>:
  10381d:	04090304                                ....

00103821 <pxManufacturerStringDescriptor>:
  103821:	0062031c 00740069 0061006d 0075006e     ..b.i.t.m.a.n.u.
  103831:	00610066 0074006b 00720075              f.a.k.t.u.r.

0010383d <pxProductStringDescriptor>:
  10383d:	004f0328 00650070 0042006e 00610065     (.O.p.e.n.B.e.a.
  10384d:	006f0063 0020006e 006c0042 006e0069     c.o.n. .B.l.i.n.
  10385d:	0065006b 006c006e 00000067              k.e.n.l.g...

00103869 <pxConfigDescriptor1>:
  103869:	00430209 80030102 000409fa 02020100     ..C.............
  103879:	24050401 04011000 05000224 01000624     ...$....$...$...
  103889:	00012405 83050701 ff000803 00010409     .$..............
  103899:	00000a02 01050700 00004002 02820507     .........@......
  1038a9:	09000040                                         @..

001038ac <pxConfigDescriptor2>:
  1038ac:	00430209 80030202 00040932 02020100     ..C.....2.......
  1038bc:	24050401 04011000 05000224 01000624     ...$....$...$...
  1038cc:	00012405 83050701 ff000803 00010409     .$..............
  1038dc:	00000a02 01050700 00004002 02820507     .........@......
  1038ec:	00000040                                @...

001038f0 <pxConfigDescriptorSizes>:
  1038f0:	00000043 00000043                       C...C...

001038f8 <pxDeviceDescriptor>:
  1038f8:	01100112 08000002 08af16c0 02010110     ................
  103908:	00000200                                ....

0010390c <C.25.4299>:
	...

00103920 <pxLineCoding>:
  103920:	0001c200 00080000 00000043              ........C...
