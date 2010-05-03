
openbeacon-recive-pack.elf:     file format elf32-littlearm

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
  100024:	00103740 	andeqs	r3, r0, r0, asr #14

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
  100090:	eb0007ec 	bl	102048 <AT91F_LowLevelInit>
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
  1000f8:	00200b70 	eoreq	r0, r0, r0, ror fp
  1000fc:	00201504 	eoreq	r1, r0, r4, lsl #10
  100100:	00200000 	eoreq	r0, r0, r0
  100104:	00104be8 	andeqs	r4, r0, r8, ror #23
  100108:	00200b70 	eoreq	r0, r0, r0, ror fp
  10010c:	00203ffc 	streqd	r3, [r0], -ip
  100110:	00101098 	muleqs	r0, r8, r0

00100114 <__aeabi_idiv>:
  100114:	e3510000 	cmp	r1, #0	; 0x0
  100118:	e020c001 	eor	ip, r0, r1
  10011c:	0a000042 	beq	10022c <__aeabi_idiv+0x118>
  100120:	42611000 	rsbmi	r1, r1, #0	; 0x0
  100124:	e2512001 	subs	r2, r1, #1	; 0x1
  100128:	0a000027 	beq	1001cc <__aeabi_idiv+0xb8>
  10012c:	e1b03000 	movs	r3, r0
  100130:	42603000 	rsbmi	r3, r0, #0	; 0x0
  100134:	e1530001 	cmp	r3, r1
  100138:	9a000026 	bls	1001d8 <__aeabi_idiv+0xc4>
  10013c:	e1110002 	tst	r1, r2
  100140:	0a000028 	beq	1001e8 <__aeabi_idiv+0xd4>
  100144:	e311020e 	tst	r1, #-536870912	; 0xe0000000
  100148:	01a01181 	moveq	r1, r1, lsl #3
  10014c:	03a02008 	moveq	r2, #8	; 0x8
  100150:	13a02001 	movne	r2, #1	; 0x1
  100154:	e3510201 	cmp	r1, #268435456	; 0x10000000
  100158:	31510003 	cmpcc	r1, r3
  10015c:	31a01201 	movcc	r1, r1, lsl #4
  100160:	31a02202 	movcc	r2, r2, lsl #4
  100164:	3afffffa 	bcc	100154 <__aeabi_idiv+0x40>
  100168:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
  10016c:	31510003 	cmpcc	r1, r3
  100170:	31a01081 	movcc	r1, r1, lsl #1
  100174:	31a02082 	movcc	r2, r2, lsl #1
  100178:	3afffffa 	bcc	100168 <__aeabi_idiv+0x54>
  10017c:	e3a00000 	mov	r0, #0	; 0x0
  100180:	e1530001 	cmp	r3, r1
  100184:	20433001 	subcs	r3, r3, r1
  100188:	21800002 	orrcs	r0, r0, r2
  10018c:	e15300a1 	cmp	r3, r1, lsr #1
  100190:	204330a1 	subcs	r3, r3, r1, lsr #1
  100194:	218000a2 	orrcs	r0, r0, r2, lsr #1
  100198:	e1530121 	cmp	r3, r1, lsr #2
  10019c:	20433121 	subcs	r3, r3, r1, lsr #2
  1001a0:	21800122 	orrcs	r0, r0, r2, lsr #2
  1001a4:	e15301a1 	cmp	r3, r1, lsr #3
  1001a8:	204331a1 	subcs	r3, r3, r1, lsr #3
  1001ac:	218001a2 	orrcs	r0, r0, r2, lsr #3
  1001b0:	e3530000 	cmp	r3, #0	; 0x0
  1001b4:	11b02222 	movnes	r2, r2, lsr #4
  1001b8:	11a01221 	movne	r1, r1, lsr #4
  1001bc:	1affffef 	bne	100180 <__aeabi_idiv+0x6c>
  1001c0:	e35c0000 	cmp	ip, #0	; 0x0
  1001c4:	42600000 	rsbmi	r0, r0, #0	; 0x0
  1001c8:	e12fff1e 	bx	lr
  1001cc:	e13c0000 	teq	ip, r0
  1001d0:	42600000 	rsbmi	r0, r0, #0	; 0x0
  1001d4:	e12fff1e 	bx	lr
  1001d8:	33a00000 	movcc	r0, #0	; 0x0
  1001dc:	01a00fcc 	moveq	r0, ip, asr #31
  1001e0:	03800001 	orreq	r0, r0, #1	; 0x1
  1001e4:	e12fff1e 	bx	lr
  1001e8:	e3510801 	cmp	r1, #65536	; 0x10000
  1001ec:	21a01821 	movcs	r1, r1, lsr #16
  1001f0:	23a02010 	movcs	r2, #16	; 0x10
  1001f4:	33a02000 	movcc	r2, #0	; 0x0
  1001f8:	e3510c01 	cmp	r1, #256	; 0x100
  1001fc:	21a01421 	movcs	r1, r1, lsr #8
  100200:	22822008 	addcs	r2, r2, #8	; 0x8
  100204:	e3510010 	cmp	r1, #16	; 0x10
  100208:	21a01221 	movcs	r1, r1, lsr #4
  10020c:	22822004 	addcs	r2, r2, #4	; 0x4
  100210:	e3510004 	cmp	r1, #4	; 0x4
  100214:	82822003 	addhi	r2, r2, #3	; 0x3
  100218:	908220a1 	addls	r2, r2, r1, lsr #1
  10021c:	e35c0000 	cmp	ip, #0	; 0x0
  100220:	e1a00233 	mov	r0, r3, lsr r2
  100224:	42600000 	rsbmi	r0, r0, #0	; 0x0
  100228:	e12fff1e 	bx	lr
  10022c:	e52de008 	str	lr, [sp, #-8]!
  100230:	eb000007 	bl	100254 <__aeabi_idiv0>
  100234:	e3a00000 	mov	r0, #0	; 0x0
  100238:	e49df008 	ldr	pc, [sp], #8

0010023c <__aeabi_idivmod>:
  10023c:	e92d4003 	stmdb	sp!, {r0, r1, lr}
  100240:	ebffffb3 	bl	100114 <__aeabi_idiv>
  100244:	e8bd4006 	ldmia	sp!, {r1, r2, lr}
  100248:	e0030092 	mul	r3, r2, r0
  10024c:	e0411003 	sub	r1, r1, r3
  100250:	e12fff1e 	bx	lr

00100254 <__aeabi_idiv0>:
  100254:	e12fff1e 	bx	lr

00100258 <free>:
  100258:	e59f3008 	ldr	r3, [pc, #8]	; 100268 <prog+0x224>
  10025c:	e1a01000 	mov	r1, r0
  100260:	e5930000 	ldr	r0, [r3]
  100264:	ea0002d9 	b	100dd0 <_free_r>
  100268:	00200410 	eoreq	r0, r0, r0, lsl r4

0010026c <malloc>:
  10026c:	e59f3008 	ldr	r3, [pc, #8]	; 10027c <prog+0x238>
  100270:	e1a01000 	mov	r1, r0
  100274:	e5930000 	ldr	r0, [r3]
  100278:	ea000000 	b	100280 <_malloc_r>
  10027c:	00200410 	eoreq	r0, r0, r0, lsl r4

00100280 <_malloc_r>:
  100280:	e281300b 	add	r3, r1, #11	; 0xb
  100284:	e3530016 	cmp	r3, #22	; 0x16
  100288:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10028c:	83c35007 	bichi	r5, r3, #7	; 0x7
  100290:	93a05010 	movls	r5, #16	; 0x10
  100294:	93a03000 	movls	r3, #0	; 0x0
  100298:	81a03fa5 	movhi	r3, r5, lsr #31
  10029c:	e1550001 	cmp	r5, r1
  1002a0:	33833001 	orrcc	r3, r3, #1	; 0x1
  1002a4:	e3530000 	cmp	r3, #0	; 0x0
  1002a8:	e1a07000 	mov	r7, r0
  1002ac:	13a0300c 	movne	r3, #12	; 0xc
  1002b0:	e24dd004 	sub	sp, sp, #4	; 0x4
  1002b4:	13a00000 	movne	r0, #0	; 0x0
  1002b8:	15873000 	strne	r3, [r7]
  1002bc:	1a000017 	bne	100320 <_malloc_r+0xa0>
  1002c0:	e1a00007 	mov	r0, r7
  1002c4:	eb000217 	bl	100b28 <__malloc_lock>
  1002c8:	e3550f7e 	cmp	r5, #504	; 0x1f8
  1002cc:	2a000015 	bcs	100328 <_malloc_r+0xa8>
  1002d0:	e59f86fc 	ldr	r8, [pc, #1788]	; 1009d4 <prog+0x990>
  1002d4:	e1a021a5 	mov	r2, r5, lsr #3
  1002d8:	e0883182 	add	r3, r8, r2, lsl #3
  1002dc:	e593400c 	ldr	r4, [r3, #12]
  1002e0:	e1530004 	cmp	r3, r4
  1002e4:	e1a0a008 	mov	sl, r8
  1002e8:	0a0000cd 	beq	100624 <_malloc_r+0x3a4>
  1002ec:	e5943004 	ldr	r3, [r4, #4]
  1002f0:	e3c33003 	bic	r3, r3, #3	; 0x3
  1002f4:	e0843003 	add	r3, r4, r3
  1002f8:	e5932004 	ldr	r2, [r3, #4]
  1002fc:	e594000c 	ldr	r0, [r4, #12]
  100300:	e5941008 	ldr	r1, [r4, #8]
  100304:	e3822001 	orr	r2, r2, #1	; 0x1
  100308:	e5801008 	str	r1, [r0, #8]
  10030c:	e581000c 	str	r0, [r1, #12]
  100310:	e5832004 	str	r2, [r3, #4]
  100314:	e1a00007 	mov	r0, r7
  100318:	eb000203 	bl	100b2c <__malloc_unlock>
  10031c:	e2840008 	add	r0, r4, #8	; 0x8
  100320:	e28dd004 	add	sp, sp, #4	; 0x4
  100324:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  100328:	e1b024a5 	movs	r2, r5, lsr #9
  10032c:	01a001a5 	moveq	r0, r5, lsr #3
  100330:	01a03180 	moveq	r3, r0, lsl #3
  100334:	1a000027 	bne	1003d8 <_malloc_r+0x158>
  100338:	e59f8694 	ldr	r8, [pc, #1684]	; 1009d4 <prog+0x990>
  10033c:	e0831008 	add	r1, r3, r8
  100340:	e591400c 	ldr	r4, [r1, #12]
  100344:	e1510004 	cmp	r1, r4
  100348:	e1a0a008 	mov	sl, r8
  10034c:	1a000005 	bne	100368 <_malloc_r+0xe8>
  100350:	ea00000a 	b	100380 <_malloc_r+0x100>
  100354:	e3520000 	cmp	r2, #0	; 0x0
  100358:	aa000047 	bge	10047c <_malloc_r+0x1fc>
  10035c:	e594400c 	ldr	r4, [r4, #12]
  100360:	e1510004 	cmp	r1, r4
  100364:	0a000005 	beq	100380 <_malloc_r+0x100>
  100368:	e5943004 	ldr	r3, [r4, #4]
  10036c:	e3c33003 	bic	r3, r3, #3	; 0x3
  100370:	e0652003 	rsb	r2, r5, r3
  100374:	e352000f 	cmp	r2, #15	; 0xf
  100378:	dafffff5 	ble	100354 <_malloc_r+0xd4>
  10037c:	e2400001 	sub	r0, r0, #1	; 0x1
  100380:	e280e001 	add	lr, r0, #1	; 0x1
  100384:	e59f664c 	ldr	r6, [pc, #1612]	; 1009d8 <prog+0x994>
  100388:	e5964008 	ldr	r4, [r6, #8]
  10038c:	e1560004 	cmp	r6, r4
  100390:	0a000076 	beq	100570 <_malloc_r+0x2f0>
  100394:	e5943004 	ldr	r3, [r4, #4]
  100398:	e3c32003 	bic	r2, r3, #3	; 0x3
  10039c:	e0650002 	rsb	r0, r5, r2
  1003a0:	e350000f 	cmp	r0, #15	; 0xf
  1003a4:	ca000027 	bgt	100448 <_malloc_r+0x1c8>
  1003a8:	e3500000 	cmp	r0, #0	; 0x0
  1003ac:	e586600c 	str	r6, [r6, #12]
  1003b0:	e5866008 	str	r6, [r6, #8]
  1003b4:	ba00003c 	blt	1004ac <_malloc_r+0x22c>
  1003b8:	e0842002 	add	r2, r4, r2
  1003bc:	e5923004 	ldr	r3, [r2, #4]
  1003c0:	e3833001 	orr	r3, r3, #1	; 0x1
  1003c4:	e1a00007 	mov	r0, r7
  1003c8:	e5823004 	str	r3, [r2, #4]
  1003cc:	eb0001d6 	bl	100b2c <__malloc_unlock>
  1003d0:	e2840008 	add	r0, r4, #8	; 0x8
  1003d4:	eaffffd1 	b	100320 <_malloc_r+0xa0>
  1003d8:	e3520004 	cmp	r2, #4	; 0x4
  1003dc:	91a03325 	movls	r3, r5, lsr #6
  1003e0:	92830038 	addls	r0, r3, #56	; 0x38
  1003e4:	91a03180 	movls	r3, r0, lsl #3
  1003e8:	9affffd2 	bls	100338 <_malloc_r+0xb8>
  1003ec:	e3520014 	cmp	r2, #20	; 0x14
  1003f0:	9282005b 	addls	r0, r2, #91	; 0x5b
  1003f4:	91a03180 	movls	r3, r0, lsl #3
  1003f8:	9affffce 	bls	100338 <_malloc_r+0xb8>
  1003fc:	e3520054 	cmp	r2, #84	; 0x54
  100400:	91a03625 	movls	r3, r5, lsr #12
  100404:	9283006e 	addls	r0, r3, #110	; 0x6e
  100408:	91a03180 	movls	r3, r0, lsl #3
  10040c:	9affffc9 	bls	100338 <_malloc_r+0xb8>
  100410:	e3520f55 	cmp	r2, #340	; 0x154
  100414:	91a037a5 	movls	r3, r5, lsr #15
  100418:	92830077 	addls	r0, r3, #119	; 0x77
  10041c:	91a03180 	movls	r3, r0, lsl #3
  100420:	9affffc4 	bls	100338 <_malloc_r+0xb8>
  100424:	e3a03e55 	mov	r3, #1360	; 0x550
  100428:	e2833004 	add	r3, r3, #4	; 0x4
  10042c:	e1520003 	cmp	r2, r3
  100430:	91a03925 	movls	r3, r5, lsr #18
  100434:	9283007c 	addls	r0, r3, #124	; 0x7c
  100438:	83a0007e 	movhi	r0, #126	; 0x7e
  10043c:	82433f59 	subhi	r3, r3, #356	; 0x164
  100440:	91a03180 	movls	r3, r0, lsl #3
  100444:	eaffffbb 	b	100338 <_malloc_r+0xb8>
  100448:	e0842005 	add	r2, r4, r5
  10044c:	e3801001 	orr	r1, r0, #1	; 0x1
  100450:	e3853001 	orr	r3, r5, #1	; 0x1
  100454:	e7820000 	str	r0, [r2, r0]
  100458:	e5843004 	str	r3, [r4, #4]
  10045c:	e586200c 	str	r2, [r6, #12]
  100460:	e5862008 	str	r2, [r6, #8]
  100464:	e1a00007 	mov	r0, r7
  100468:	e9820042 	stmib	r2, {r1, r6}
  10046c:	e582600c 	str	r6, [r2, #12]
  100470:	eb0001ad 	bl	100b2c <__malloc_unlock>
  100474:	e2840008 	add	r0, r4, #8	; 0x8
  100478:	eaffffa8 	b	100320 <_malloc_r+0xa0>
  10047c:	e0840003 	add	r0, r4, r3
  100480:	e5903004 	ldr	r3, [r0, #4]
  100484:	e594100c 	ldr	r1, [r4, #12]
  100488:	e5942008 	ldr	r2, [r4, #8]
  10048c:	e3833001 	orr	r3, r3, #1	; 0x1
  100490:	e5803004 	str	r3, [r0, #4]
  100494:	e5812008 	str	r2, [r1, #8]
  100498:	e1a00007 	mov	r0, r7
  10049c:	e582100c 	str	r1, [r2, #12]
  1004a0:	eb0001a1 	bl	100b2c <__malloc_unlock>
  1004a4:	e2840008 	add	r0, r4, #8	; 0x8
  1004a8:	eaffff9c 	b	100320 <_malloc_r+0xa0>
  1004ac:	e3520c02 	cmp	r2, #512	; 0x200
  1004b0:	3a0000a0 	bcc	100738 <_malloc_r+0x4b8>
  1004b4:	e1b014a2 	movs	r1, r2, lsr #9
  1004b8:	01a011a2 	moveq	r1, r2, lsr #3
  1004bc:	01a03181 	moveq	r3, r1, lsl #3
  1004c0:	0a00001a 	beq	100530 <_malloc_r+0x2b0>
  1004c4:	e3510004 	cmp	r1, #4	; 0x4
  1004c8:	91a03322 	movls	r3, r2, lsr #6
  1004cc:	92831038 	addls	r1, r3, #56	; 0x38
  1004d0:	91a03181 	movls	r3, r1, lsl #3
  1004d4:	9a000015 	bls	100530 <_malloc_r+0x2b0>
  1004d8:	e3510014 	cmp	r1, #20	; 0x14
  1004dc:	9281105b 	addls	r1, r1, #91	; 0x5b
  1004e0:	91a03181 	movls	r3, r1, lsl #3
  1004e4:	9a000011 	bls	100530 <_malloc_r+0x2b0>
  1004e8:	e3510054 	cmp	r1, #84	; 0x54
  1004ec:	91a03622 	movls	r3, r2, lsr #12
  1004f0:	9283106e 	addls	r1, r3, #110	; 0x6e
  1004f4:	91a03181 	movls	r3, r1, lsl #3
  1004f8:	9a00000c 	bls	100530 <_malloc_r+0x2b0>
  1004fc:	e3510f55 	cmp	r1, #340	; 0x154
  100500:	91a037a2 	movls	r3, r2, lsr #15
  100504:	92831077 	addls	r1, r3, #119	; 0x77
  100508:	91a03181 	movls	r3, r1, lsl #3
  10050c:	9a000007 	bls	100530 <_malloc_r+0x2b0>
  100510:	e3a03e55 	mov	r3, #1360	; 0x550
  100514:	e2833004 	add	r3, r3, #4	; 0x4
  100518:	e1510003 	cmp	r1, r3
  10051c:	91a03922 	movls	r3, r2, lsr #18
  100520:	9283107c 	addls	r1, r3, #124	; 0x7c
  100524:	83a0107e 	movhi	r1, #126	; 0x7e
  100528:	82433f59 	subhi	r3, r3, #356	; 0x164
  10052c:	91a03181 	movls	r3, r1, lsl #3
  100530:	e088c003 	add	ip, r8, r3
  100534:	e59c0008 	ldr	r0, [ip, #8]
  100538:	e15c0000 	cmp	ip, r0
  10053c:	0a0000eb 	beq	1008f0 <_malloc_r+0x670>
  100540:	e5903004 	ldr	r3, [r0, #4]
  100544:	e3c33003 	bic	r3, r3, #3	; 0x3
  100548:	e1520003 	cmp	r2, r3
  10054c:	2a000002 	bcs	10055c <_malloc_r+0x2dc>
  100550:	e5900008 	ldr	r0, [r0, #8]
  100554:	e15c0000 	cmp	ip, r0
  100558:	1afffff8 	bne	100540 <_malloc_r+0x2c0>
  10055c:	e590c00c 	ldr	ip, [r0, #12]
  100560:	e584c00c 	str	ip, [r4, #12]
  100564:	e5840008 	str	r0, [r4, #8]
  100568:	e580400c 	str	r4, [r0, #12]
  10056c:	e58c4008 	str	r4, [ip, #8]
  100570:	e59a0004 	ldr	r0, [sl, #4]
  100574:	e35e0000 	cmp	lr, #0	; 0x0
  100578:	e28e3003 	add	r3, lr, #3	; 0x3
  10057c:	a1a0300e 	movge	r3, lr
  100580:	e1a03143 	mov	r3, r3, asr #2
  100584:	e3a02001 	mov	r2, #1	; 0x1
  100588:	e1a02312 	mov	r2, r2, lsl r3
  10058c:	e1520000 	cmp	r2, r0
  100590:	8a000029 	bhi	10063c <_malloc_r+0x3bc>
  100594:	e1120000 	tst	r2, r0
  100598:	0a000073 	beq	10076c <_malloc_r+0x4ec>
  10059c:	e088918e 	add	r9, r8, lr, lsl #3
  1005a0:	e1a0a00e 	mov	sl, lr
  1005a4:	e1a01009 	mov	r1, r9
  1005a8:	e591400c 	ldr	r4, [r1, #12]
  1005ac:	e1510004 	cmp	r1, r4
  1005b0:	1a000005 	bne	1005cc <_malloc_r+0x34c>
  1005b4:	ea000076 	b	100794 <_malloc_r+0x514>
  1005b8:	e35c0000 	cmp	ip, #0	; 0x0
  1005bc:	aa000079 	bge	1007a8 <_malloc_r+0x528>
  1005c0:	e594400c 	ldr	r4, [r4, #12]
  1005c4:	e1510004 	cmp	r1, r4
  1005c8:	0a000071 	beq	100794 <_malloc_r+0x514>
  1005cc:	e5943004 	ldr	r3, [r4, #4]
  1005d0:	e3c33003 	bic	r3, r3, #3	; 0x3
  1005d4:	e065c003 	rsb	ip, r5, r3
  1005d8:	e35c000f 	cmp	ip, #15	; 0xf
  1005dc:	dafffff5 	ble	1005b8 <_malloc_r+0x338>
  1005e0:	e3853001 	orr	r3, r5, #1	; 0x1
  1005e4:	e0842005 	add	r2, r4, r5
  1005e8:	e594000c 	ldr	r0, [r4, #12]
  1005ec:	e5843004 	str	r3, [r4, #4]
  1005f0:	e5b41008 	ldr	r1, [r4, #8]!
  1005f4:	e38c3001 	orr	r3, ip, #1	; 0x1
  1005f8:	e5801008 	str	r1, [r0, #8]
  1005fc:	e581000c 	str	r0, [r1, #12]
  100600:	e5862008 	str	r2, [r6, #8]
  100604:	e586200c 	str	r2, [r6, #12]
  100608:	e1a00007 	mov	r0, r7
  10060c:	e782c00c 	str	ip, [r2, ip]
  100610:	e9820048 	stmib	r2, {r3, r6}
  100614:	e582600c 	str	r6, [r2, #12]
  100618:	eb000143 	bl	100b2c <__malloc_unlock>
  10061c:	e1a00004 	mov	r0, r4
  100620:	eaffff3e 	b	100320 <_malloc_r+0xa0>
  100624:	e2843008 	add	r3, r4, #8	; 0x8
  100628:	e593400c 	ldr	r4, [r3, #12]
  10062c:	e1530004 	cmp	r3, r4
  100630:	1affff2d 	bne	1002ec <_malloc_r+0x6c>
  100634:	e282e002 	add	lr, r2, #2	; 0x2
  100638:	eaffff51 	b	100384 <_malloc_r+0x104>
  10063c:	e59f2390 	ldr	r2, [pc, #912]	; 1009d4 <prog+0x990>
  100640:	e5924008 	ldr	r4, [r2, #8]
  100644:	e5943004 	ldr	r3, [r4, #4]
  100648:	e3c38003 	bic	r8, r3, #3	; 0x3
  10064c:	e0650008 	rsb	r0, r5, r8
  100650:	e350000f 	cmp	r0, #15	; 0xf
  100654:	c3a03000 	movgt	r3, #0	; 0x0
  100658:	d3a03001 	movle	r3, #1	; 0x1
  10065c:	e1550008 	cmp	r5, r8
  100660:	83833001 	orrhi	r3, r3, #1	; 0x1
  100664:	e3530000 	cmp	r3, #0	; 0x0
  100668:	e1a09004 	mov	r9, r4
  10066c:	0a000026 	beq	10070c <_malloc_r+0x48c>
  100670:	e59f3364 	ldr	r3, [pc, #868]	; 1009dc <prog+0x998>
  100674:	e59fb364 	ldr	fp, [pc, #868]	; 1009e0 <prog+0x99c>
  100678:	e5932000 	ldr	r2, [r3]
  10067c:	e59b1000 	ldr	r1, [fp]
  100680:	e2822010 	add	r2, r2, #16	; 0x10
  100684:	e3710001 	cmn	r1, #1	; 0x1
  100688:	e0856002 	add	r6, r5, r2
  10068c:	12863eff 	addne	r3, r6, #4080	; 0xff0
  100690:	1283300f 	addne	r3, r3, #15	; 0xf
  100694:	13c36eff 	bicne	r6, r3, #4080	; 0xff0
  100698:	13c6600f 	bicne	r6, r6, #15	; 0xf
  10069c:	e1a00007 	mov	r0, r7
  1006a0:	e1a01006 	mov	r1, r6
  1006a4:	eb000383 	bl	1014b8 <_sbrk_r>
  1006a8:	e3700001 	cmn	r0, #1	; 0x1
  1006ac:	0a00008c 	beq	1008e4 <_malloc_r+0x664>
  1006b0:	e0841008 	add	r1, r4, r8
  1006b4:	e1510000 	cmp	r1, r0
  1006b8:	e1a0a000 	mov	sl, r0
  1006bc:	9a000045 	bls	1007d8 <_malloc_r+0x558>
  1006c0:	e59f330c 	ldr	r3, [pc, #780]	; 1009d4 <prog+0x990>
  1006c4:	e1540003 	cmp	r4, r3
  1006c8:	0a0000a5 	beq	100964 <_malloc_r+0x6e4>
  1006cc:	e59f3300 	ldr	r3, [pc, #768]	; 1009d4 <prog+0x990>
  1006d0:	e5934008 	ldr	r4, [r3, #8]
  1006d4:	e5942004 	ldr	r2, [r4, #4]
  1006d8:	e3c22003 	bic	r2, r2, #3	; 0x3
  1006dc:	e0650002 	rsb	r0, r5, r2
  1006e0:	e350000f 	cmp	r0, #15	; 0xf
  1006e4:	c3a03000 	movgt	r3, #0	; 0x0
  1006e8:	d3a03001 	movle	r3, #1	; 0x1
  1006ec:	e1550002 	cmp	r5, r2
  1006f0:	83833001 	orrhi	r3, r3, #1	; 0x1
  1006f4:	e3530000 	cmp	r3, #0	; 0x0
  1006f8:	0a000003 	beq	10070c <_malloc_r+0x48c>
  1006fc:	e1a00007 	mov	r0, r7
  100700:	eb000109 	bl	100b2c <__malloc_unlock>
  100704:	e3a00000 	mov	r0, #0	; 0x0
  100708:	eaffff04 	b	100320 <_malloc_r+0xa0>
  10070c:	e0841005 	add	r1, r4, r5
  100710:	e3802001 	orr	r2, r0, #1	; 0x1
  100714:	e3853001 	orr	r3, r5, #1	; 0x1
  100718:	e5843004 	str	r3, [r4, #4]
  10071c:	e5812004 	str	r2, [r1, #4]
  100720:	e59f22ac 	ldr	r2, [pc, #684]	; 1009d4 <prog+0x990>
  100724:	e1a00007 	mov	r0, r7
  100728:	e5821008 	str	r1, [r2, #8]
  10072c:	eb0000fe 	bl	100b2c <__malloc_unlock>
  100730:	e2840008 	add	r0, r4, #8	; 0x8
  100734:	eafffef9 	b	100320 <_malloc_r+0xa0>
  100738:	e1a021a2 	mov	r2, r2, lsr #3
  10073c:	e59a0004 	ldr	r0, [sl, #4]
  100740:	e1a01122 	mov	r1, r2, lsr #2
  100744:	e3a03001 	mov	r3, #1	; 0x1
  100748:	e1800113 	orr	r0, r0, r3, lsl r1
  10074c:	e0882182 	add	r2, r8, r2, lsl #3
  100750:	e5923008 	ldr	r3, [r2, #8]
  100754:	e584200c 	str	r2, [r4, #12]
  100758:	e5843008 	str	r3, [r4, #8]
  10075c:	e58a0004 	str	r0, [sl, #4]
  100760:	e583400c 	str	r4, [r3, #12]
  100764:	e5824008 	str	r4, [r2, #8]
  100768:	eaffff81 	b	100574 <_malloc_r+0x2f4>
  10076c:	e1a02082 	mov	r2, r2, lsl #1
  100770:	e3ce3003 	bic	r3, lr, #3	; 0x3
  100774:	e1100002 	tst	r0, r2
  100778:	e283e004 	add	lr, r3, #4	; 0x4
  10077c:	1affff86 	bne	10059c <_malloc_r+0x31c>
  100780:	e1a02082 	mov	r2, r2, lsl #1
  100784:	e1100002 	tst	r0, r2
  100788:	e28ee004 	add	lr, lr, #4	; 0x4
  10078c:	0afffffb 	beq	100780 <_malloc_r+0x500>
  100790:	eaffff81 	b	10059c <_malloc_r+0x31c>
  100794:	e28aa001 	add	sl, sl, #1	; 0x1
  100798:	e31a0003 	tst	sl, #3	; 0x3
  10079c:	0a000059 	beq	100908 <_malloc_r+0x688>
  1007a0:	e2811008 	add	r1, r1, #8	; 0x8
  1007a4:	eaffff7f 	b	1005a8 <_malloc_r+0x328>
  1007a8:	e0841003 	add	r1, r4, r3
  1007ac:	e5913004 	ldr	r3, [r1, #4]
  1007b0:	e594000c 	ldr	r0, [r4, #12]
  1007b4:	e5b42008 	ldr	r2, [r4, #8]!
  1007b8:	e3833001 	orr	r3, r3, #1	; 0x1
  1007bc:	e5802008 	str	r2, [r0, #8]
  1007c0:	e582000c 	str	r0, [r2, #12]
  1007c4:	e5813004 	str	r3, [r1, #4]
  1007c8:	e1a00007 	mov	r0, r7
  1007cc:	eb0000d6 	bl	100b2c <__malloc_unlock>
  1007d0:	e1a00004 	mov	r0, r4
  1007d4:	eafffed1 	b	100320 <_malloc_r+0xa0>
  1007d8:	e59fc204 	ldr	ip, [pc, #516]	; 1009e4 <prog+0x9a0>
  1007dc:	e59c3000 	ldr	r3, [ip]
  1007e0:	e0862003 	add	r2, r6, r3
  1007e4:	e58c2000 	str	r2, [ip]
  1007e8:	0a000062 	beq	100978 <_malloc_r+0x6f8>
  1007ec:	e59b3000 	ldr	r3, [fp]
  1007f0:	e3730001 	cmn	r3, #1	; 0x1
  1007f4:	10613000 	rsbne	r3, r1, r0
  1007f8:	059f31e0 	ldreq	r3, [pc, #480]	; 1009e0 <prog+0x99c>
  1007fc:	10823003 	addne	r3, r2, r3
  100800:	05830000 	streq	r0, [r3]
  100804:	158c3000 	strne	r3, [ip]
  100808:	e2103007 	ands	r3, r0, #7	; 0x7
  10080c:	12631008 	rsbne	r1, r3, #8	; 0x8
  100810:	1080a001 	addne	sl, r0, r1
  100814:	01a01003 	moveq	r1, r3
  100818:	e08a3006 	add	r3, sl, r6
  10081c:	e1a03a03 	mov	r3, r3, lsl #20
  100820:	e1a03a23 	mov	r3, r3, lsr #20
  100824:	e2633a01 	rsb	r3, r3, #4096	; 0x1000
  100828:	e0814003 	add	r4, r1, r3
  10082c:	e1a01004 	mov	r1, r4
  100830:	e1a00007 	mov	r0, r7
  100834:	e58dc000 	str	ip, [sp]
  100838:	eb00031e 	bl	1014b8 <_sbrk_r>
  10083c:	e3700001 	cmn	r0, #1	; 0x1
  100840:	106a3000 	rsbne	r3, sl, r0
  100844:	e59dc000 	ldr	ip, [sp]
  100848:	10833004 	addne	r3, r3, r4
  10084c:	13830001 	orrne	r0, r3, #1	; 0x1
  100850:	e59f217c 	ldr	r2, [pc, #380]	; 1009d4 <prog+0x990>
  100854:	e59c3000 	ldr	r3, [ip]
  100858:	03a04000 	moveq	r4, #0	; 0x0
  10085c:	02800002 	addeq	r0, r0, #2	; 0x2
  100860:	e0843003 	add	r3, r4, r3
  100864:	e1590002 	cmp	r9, r2
  100868:	e1a0400a 	mov	r4, sl
  10086c:	e58c3000 	str	r3, [ip]
  100870:	e58a0004 	str	r0, [sl, #4]
  100874:	e582a008 	str	sl, [r2, #8]
  100878:	0a00000f 	beq	1008bc <_malloc_r+0x63c>
  10087c:	e358000f 	cmp	r8, #15	; 0xf
  100880:	93a03001 	movls	r3, #1	; 0x1
  100884:	958a3004 	strls	r3, [sl, #4]
  100888:	9affff91 	bls	1006d4 <_malloc_r+0x454>
  10088c:	e5993004 	ldr	r3, [r9, #4]
  100890:	e248200c 	sub	r2, r8, #12	; 0xc
  100894:	e3c22007 	bic	r2, r2, #7	; 0x7
  100898:	e2033001 	and	r3, r3, #1	; 0x1
  10089c:	e1823003 	orr	r3, r2, r3
  1008a0:	e3a01005 	mov	r1, #5	; 0x5
  1008a4:	e352000f 	cmp	r2, #15	; 0xf
  1008a8:	e0892002 	add	r2, r9, r2
  1008ac:	e5893004 	str	r3, [r9, #4]
  1008b0:	e5821008 	str	r1, [r2, #8]
  1008b4:	e5821004 	str	r1, [r2, #4]
  1008b8:	8a000038 	bhi	1009a0 <_malloc_r+0x720>
  1008bc:	e59f1124 	ldr	r1, [pc, #292]	; 1009e8 <prog+0x9a4>
  1008c0:	e59c2000 	ldr	r2, [ip]
  1008c4:	e5913000 	ldr	r3, [r1]
  1008c8:	e1520003 	cmp	r2, r3
  1008cc:	85812000 	strhi	r2, [r1]
  1008d0:	e59f1114 	ldr	r1, [pc, #276]	; 1009ec <prog+0x9a8>
  1008d4:	e5913000 	ldr	r3, [r1]
  1008d8:	e1520003 	cmp	r2, r3
  1008dc:	85812000 	strhi	r2, [r1]
  1008e0:	eaffff7b 	b	1006d4 <_malloc_r+0x454>
  1008e4:	e59f20e8 	ldr	r2, [pc, #232]	; 1009d4 <prog+0x990>
  1008e8:	e5924008 	ldr	r4, [r2, #8]
  1008ec:	eaffff78 	b	1006d4 <_malloc_r+0x454>
  1008f0:	e59a3004 	ldr	r3, [sl, #4]
  1008f4:	e1a01121 	mov	r1, r1, lsr #2
  1008f8:	e3a02001 	mov	r2, #1	; 0x1
  1008fc:	e1833112 	orr	r3, r3, r2, lsl r1
  100900:	e58a3004 	str	r3, [sl, #4]
  100904:	eaffff15 	b	100560 <_malloc_r+0x2e0>
  100908:	e1a0c00e 	mov	ip, lr
  10090c:	e1a01009 	mov	r1, r9
  100910:	e31c0003 	tst	ip, #3	; 0x3
  100914:	e2411008 	sub	r1, r1, #8	; 0x8
  100918:	e24cc001 	sub	ip, ip, #1	; 0x1
  10091c:	0a000027 	beq	1009c0 <_malloc_r+0x740>
  100920:	e5913008 	ldr	r3, [r1, #8]
  100924:	e1530001 	cmp	r3, r1
  100928:	0afffff8 	beq	100910 <_malloc_r+0x690>
  10092c:	e1a02082 	mov	r2, r2, lsl #1
  100930:	e1520000 	cmp	r2, r0
  100934:	8affff40 	bhi	10063c <_malloc_r+0x3bc>
  100938:	e3520000 	cmp	r2, #0	; 0x0
  10093c:	0affff3e 	beq	10063c <_malloc_r+0x3bc>
  100940:	e1120000 	tst	r2, r0
  100944:	11a0e00a 	movne	lr, sl
  100948:	1affff13 	bne	10059c <_malloc_r+0x31c>
  10094c:	e1a02082 	mov	r2, r2, lsl #1
  100950:	e1100002 	tst	r0, r2
  100954:	e28aa004 	add	sl, sl, #4	; 0x4
  100958:	0afffffb 	beq	10094c <_malloc_r+0x6cc>
  10095c:	e1a0e00a 	mov	lr, sl
  100960:	eaffff0d 	b	10059c <_malloc_r+0x31c>
  100964:	e59fc078 	ldr	ip, [pc, #120]	; 1009e4 <prog+0x9a0>
  100968:	e59c3000 	ldr	r3, [ip]
  10096c:	e0862003 	add	r2, r6, r3
  100970:	e58c2000 	str	r2, [ip]
  100974:	eaffff9c 	b	1007ec <_malloc_r+0x56c>
  100978:	e1a03a00 	mov	r3, r0, lsl #20
  10097c:	e1a03a23 	mov	r3, r3, lsr #20
  100980:	e3530000 	cmp	r3, #0	; 0x0
  100984:	1affff98 	bne	1007ec <_malloc_r+0x56c>
  100988:	e59f2044 	ldr	r2, [pc, #68]	; 1009d4 <prog+0x990>
  10098c:	e0863008 	add	r3, r6, r8
  100990:	e5924008 	ldr	r4, [r2, #8]
  100994:	e3833001 	orr	r3, r3, #1	; 0x1
  100998:	e5843004 	str	r3, [r4, #4]
  10099c:	eaffffc6 	b	1008bc <_malloc_r+0x63c>
  1009a0:	e2891008 	add	r1, r9, #8	; 0x8
  1009a4:	e1a00007 	mov	r0, r7
  1009a8:	e58dc000 	str	ip, [sp]
  1009ac:	eb000107 	bl	100dd0 <_free_r>
  1009b0:	e59f301c 	ldr	r3, [pc, #28]	; 1009d4 <prog+0x990>
  1009b4:	e59dc000 	ldr	ip, [sp]
  1009b8:	e5934008 	ldr	r4, [r3, #8]
  1009bc:	eaffffbe 	b	1008bc <_malloc_r+0x63c>
  1009c0:	e1e03002 	mvn	r3, r2
  1009c4:	e0000003 	and	r0, r0, r3
  1009c8:	e59f3004 	ldr	r3, [pc, #4]	; 1009d4 <prog+0x990>
  1009cc:	e5830004 	str	r0, [r3, #4]
  1009d0:	eaffffd5 	b	10092c <_malloc_r+0x6ac>
  1009d4:	00200000 	eoreq	r0, r0, r0
  1009d8:	00200008 	eoreq	r0, r0, r8
  1009dc:	00200b70 	eoreq	r0, r0, r0, ror fp
  1009e0:	0020040c 	eoreq	r0, r0, ip, lsl #8
  1009e4:	00200b7c 	eoreq	r0, r0, ip, ror fp
  1009e8:	00200b74 	eoreq	r0, r0, r4, ror fp
  1009ec:	00200b78 	eoreq	r0, r0, r8, ror fp

001009f0 <memcpy>:
  1009f0:	e352000f 	cmp	r2, #15	; 0xf
  1009f4:	e52de004 	str	lr, [sp, #-4]!
  1009f8:	e1a0c000 	mov	ip, r0
  1009fc:	e1a0e002 	mov	lr, r2
  100a00:	9a000002 	bls	100a10 <memcpy+0x20>
  100a04:	e1813000 	orr	r3, r1, r0
  100a08:	e3130003 	tst	r3, #3	; 0x3
  100a0c:	0a000008 	beq	100a34 <memcpy+0x44>
  100a10:	e35e0000 	cmp	lr, #0	; 0x0
  100a14:	049df004 	ldreq	pc, [sp], #4
  100a18:	e3a02000 	mov	r2, #0	; 0x0
  100a1c:	e4d13001 	ldrb	r3, [r1], #1
  100a20:	e7c2300c 	strb	r3, [r2, ip]
  100a24:	e2822001 	add	r2, r2, #1	; 0x1
  100a28:	e152000e 	cmp	r2, lr
  100a2c:	1afffffa 	bne	100a1c <memcpy+0x2c>
  100a30:	e49df004 	ldr	pc, [sp], #4
  100a34:	e5913000 	ldr	r3, [r1]
  100a38:	e58c3000 	str	r3, [ip]
  100a3c:	e5912004 	ldr	r2, [r1, #4]
  100a40:	e58c2004 	str	r2, [ip, #4]
  100a44:	e5913008 	ldr	r3, [r1, #8]
  100a48:	e58c3008 	str	r3, [ip, #8]
  100a4c:	e24ee010 	sub	lr, lr, #16	; 0x10
  100a50:	e591300c 	ldr	r3, [r1, #12]
  100a54:	e35e000f 	cmp	lr, #15	; 0xf
  100a58:	e58c300c 	str	r3, [ip, #12]
  100a5c:	e2811010 	add	r1, r1, #16	; 0x10
  100a60:	e28cc010 	add	ip, ip, #16	; 0x10
  100a64:	8afffff2 	bhi	100a34 <memcpy+0x44>
  100a68:	e35e0003 	cmp	lr, #3	; 0x3
  100a6c:	9affffe7 	bls	100a10 <memcpy+0x20>
  100a70:	e24ee004 	sub	lr, lr, #4	; 0x4
  100a74:	e4913004 	ldr	r3, [r1], #4
  100a78:	e35e0003 	cmp	lr, #3	; 0x3
  100a7c:	e48c3004 	str	r3, [ip], #4
  100a80:	8afffffa 	bhi	100a70 <memcpy+0x80>
  100a84:	e35e0000 	cmp	lr, #0	; 0x0
  100a88:	1affffe2 	bne	100a18 <memcpy+0x28>
  100a8c:	e49df004 	ldr	pc, [sp], #4

00100a90 <memset>:
  100a90:	e3520003 	cmp	r2, #3	; 0x3
  100a94:	e20110ff 	and	r1, r1, #255	; 0xff
  100a98:	e1a0c000 	mov	ip, r0
  100a9c:	9a000001 	bls	100aa8 <memset+0x18>
  100aa0:	e3100003 	tst	r0, #3	; 0x3
  100aa4:	0a000008 	beq	100acc <memset+0x3c>
  100aa8:	e3520000 	cmp	r2, #0	; 0x0
  100aac:	012fff1e 	bxeq	lr
  100ab0:	e20110ff 	and	r1, r1, #255	; 0xff
  100ab4:	e3a03000 	mov	r3, #0	; 0x0
  100ab8:	e7c3100c 	strb	r1, [r3, ip]
  100abc:	e2833001 	add	r3, r3, #1	; 0x1
  100ac0:	e1530002 	cmp	r3, r2
  100ac4:	1afffffb 	bne	100ab8 <memset+0x28>
  100ac8:	e12fff1e 	bx	lr
  100acc:	e1813401 	orr	r3, r1, r1, lsl #8
  100ad0:	e352000f 	cmp	r2, #15	; 0xf
  100ad4:	e183c803 	orr	ip, r3, r3, lsl #16
  100ad8:	e1a03000 	mov	r3, r0
  100adc:	9a000009 	bls	100b08 <memset+0x78>
  100ae0:	e2422010 	sub	r2, r2, #16	; 0x10
  100ae4:	e352000f 	cmp	r2, #15	; 0xf
  100ae8:	e583c000 	str	ip, [r3]
  100aec:	e583c004 	str	ip, [r3, #4]
  100af0:	e583c008 	str	ip, [r3, #8]
  100af4:	e583c00c 	str	ip, [r3, #12]
  100af8:	e2833010 	add	r3, r3, #16	; 0x10
  100afc:	8afffff7 	bhi	100ae0 <memset+0x50>
  100b00:	e3520003 	cmp	r2, #3	; 0x3
  100b04:	9a000003 	bls	100b18 <memset+0x88>
  100b08:	e2422004 	sub	r2, r2, #4	; 0x4
  100b0c:	e3520003 	cmp	r2, #3	; 0x3
  100b10:	e483c004 	str	ip, [r3], #4
  100b14:	8afffffb 	bhi	100b08 <memset+0x78>
  100b18:	e3520000 	cmp	r2, #0	; 0x0
  100b1c:	e1a0c003 	mov	ip, r3
  100b20:	1affffe2 	bne	100ab0 <memset+0x20>
  100b24:	e12fff1e 	bx	lr

00100b28 <__malloc_lock>:
  100b28:	e12fff1e 	bx	lr

00100b2c <__malloc_unlock>:
  100b2c:	e12fff1e 	bx	lr

00100b30 <strlen>:
  100b30:	e3100003 	tst	r0, #3	; 0x3
  100b34:	e1a01000 	mov	r1, r0
  100b38:	1a000018 	bne	100ba0 <strlen+0x70>
  100b3c:	e5902000 	ldr	r2, [r0]
  100b40:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100b44:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100b48:	e2433c01 	sub	r3, r3, #256	; 0x100
  100b4c:	e2433001 	sub	r3, r3, #1	; 0x1
  100b50:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100b54:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100b58:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100b5c:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100b60:	e1d32002 	bics	r2, r3, r2
  100b64:	e1a02000 	mov	r2, r0
  100b68:	1a00000b 	bne	100b9c <strlen+0x6c>
  100b6c:	e5b02004 	ldr	r2, [r0, #4]!
  100b70:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100b74:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100b78:	e2433c01 	sub	r3, r3, #256	; 0x100
  100b7c:	e2433001 	sub	r3, r3, #1	; 0x1
  100b80:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100b84:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100b88:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100b8c:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100b90:	e1d32002 	bics	r2, r3, r2
  100b94:	0afffff4 	beq	100b6c <strlen+0x3c>
  100b98:	e1a02000 	mov	r2, r0
  100b9c:	e1a00002 	mov	r0, r2
  100ba0:	e5d03000 	ldrb	r3, [r0]
  100ba4:	e3530000 	cmp	r3, #0	; 0x0
  100ba8:	0a000002 	beq	100bb8 <strlen+0x88>
  100bac:	e5f03001 	ldrb	r3, [r0, #1]!
  100bb0:	e3530000 	cmp	r3, #0	; 0x0
  100bb4:	1afffffc 	bne	100bac <strlen+0x7c>
  100bb8:	e0610000 	rsb	r0, r1, r0
  100bbc:	e12fff1e 	bx	lr

00100bc0 <strncpy>:
  100bc0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100bc4:	e1a04001 	mov	r4, r1
  100bc8:	e1811000 	orr	r1, r1, r0
  100bcc:	e3110003 	tst	r1, #3	; 0x3
  100bd0:	13a03000 	movne	r3, #0	; 0x0
  100bd4:	03a03001 	moveq	r3, #1	; 0x1
  100bd8:	e3520003 	cmp	r2, #3	; 0x3
  100bdc:	93a03000 	movls	r3, #0	; 0x0
  100be0:	82033001 	andhi	r3, r3, #1	; 0x1
  100be4:	e3530000 	cmp	r3, #0	; 0x0
  100be8:	01a01004 	moveq	r1, r4
  100bec:	e1a05000 	mov	r5, r0
  100bf0:	e1a0e002 	mov	lr, r2
  100bf4:	01a04000 	moveq	r4, r0
  100bf8:	0a000018 	beq	100c60 <strncpy+0xa0>
  100bfc:	e3520003 	cmp	r2, #3	; 0x3
  100c00:	e1a0c004 	mov	ip, r4
  100c04:	9a000013 	bls	100c58 <strncpy+0x98>
  100c08:	e5941000 	ldr	r1, [r4]
  100c0c:	ea000005 	b	100c28 <strncpy+0x68>
  100c10:	e24ee004 	sub	lr, lr, #4	; 0x4
  100c14:	e35e0003 	cmp	lr, #3	; 0x3
  100c18:	e4801004 	str	r1, [r0], #4
  100c1c:	e28cc004 	add	ip, ip, #4	; 0x4
  100c20:	9a00000c 	bls	100c58 <strncpy+0x98>
  100c24:	e59c1000 	ldr	r1, [ip]
  100c28:	e28134ff 	add	r3, r1, #-16777216	; 0xff000000
  100c2c:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100c30:	e2433c01 	sub	r3, r3, #256	; 0x100
  100c34:	e2433001 	sub	r3, r3, #1	; 0x1
  100c38:	e1e02001 	mvn	r2, r1
  100c3c:	e0033002 	and	r3, r3, r2
  100c40:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100c44:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100c48:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100c4c:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100c50:	e3530000 	cmp	r3, #0	; 0x0
  100c54:	0affffed 	beq	100c10 <strncpy+0x50>
  100c58:	e1a04000 	mov	r4, r0
  100c5c:	e1a0100c 	mov	r1, ip
  100c60:	e35e0000 	cmp	lr, #0	; 0x0
  100c64:	0a000018 	beq	100ccc <strncpy+0x10c>
  100c68:	e5d13000 	ldrb	r3, [r1]
  100c6c:	e24e2001 	sub	r2, lr, #1	; 0x1
  100c70:	e3530000 	cmp	r3, #0	; 0x0
  100c74:	e1a0c004 	mov	ip, r4
  100c78:	e4cc3001 	strb	r3, [ip], #1
  100c7c:	1284e002 	addne	lr, r4, #2	; 0x2
  100c80:	10810002 	addne	r0, r1, r2
  100c84:	0a000008 	beq	100cac <strncpy+0xec>
  100c88:	e1500001 	cmp	r0, r1
  100c8c:	e1a0c00e 	mov	ip, lr
  100c90:	e2422001 	sub	r2, r2, #1	; 0x1
  100c94:	e28ee001 	add	lr, lr, #1	; 0x1
  100c98:	0a00000b 	beq	100ccc <strncpy+0x10c>
  100c9c:	e5f13001 	ldrb	r3, [r1, #1]!
  100ca0:	e3530000 	cmp	r3, #0	; 0x0
  100ca4:	e54c3001 	strb	r3, [ip, #-1]
  100ca8:	1afffff6 	bne	100c88 <strncpy+0xc8>
  100cac:	e3520000 	cmp	r2, #0	; 0x0
  100cb0:	0a000005 	beq	100ccc <strncpy+0x10c>
  100cb4:	e3a03000 	mov	r3, #0	; 0x0
  100cb8:	e1a01003 	mov	r1, r3
  100cbc:	e7c3100c 	strb	r1, [r3, ip]
  100cc0:	e2833001 	add	r3, r3, #1	; 0x1
  100cc4:	e1520003 	cmp	r2, r3
  100cc8:	1afffffb 	bne	100cbc <strncpy+0xfc>
  100ccc:	e1a00005 	mov	r0, r5
  100cd0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00100cd4 <_malloc_trim_r>:
  100cd4:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  100cd8:	e59f70e4 	ldr	r7, [pc, #228]	; 100dc4 <prog+0xd80>
  100cdc:	e1a04001 	mov	r4, r1
  100ce0:	e1a05000 	mov	r5, r0
  100ce4:	ebffff8f 	bl	100b28 <__malloc_lock>
  100ce8:	e5973008 	ldr	r3, [r7, #8]
  100cec:	e5932004 	ldr	r2, [r3, #4]
  100cf0:	e3c26003 	bic	r6, r2, #3	; 0x3
  100cf4:	e0644006 	rsb	r4, r4, r6
  100cf8:	e2844efe 	add	r4, r4, #4064	; 0xfe0
  100cfc:	e284400f 	add	r4, r4, #15	; 0xf
  100d00:	e1a04624 	mov	r4, r4, lsr #12
  100d04:	e2444001 	sub	r4, r4, #1	; 0x1
  100d08:	e1a04604 	mov	r4, r4, lsl #12
  100d0c:	e3540a01 	cmp	r4, #4096	; 0x1000
  100d10:	e3a01000 	mov	r1, #0	; 0x0
  100d14:	e1a00005 	mov	r0, r5
  100d18:	ba000006 	blt	100d38 <_malloc_trim_r+0x64>
  100d1c:	eb0001e5 	bl	1014b8 <_sbrk_r>
  100d20:	e5973008 	ldr	r3, [r7, #8]
  100d24:	e0863003 	add	r3, r6, r3
  100d28:	e1500003 	cmp	r0, r3
  100d2c:	e2641000 	rsb	r1, r4, #0	; 0x0
  100d30:	e1a00005 	mov	r0, r5
  100d34:	0a000002 	beq	100d44 <_malloc_trim_r+0x70>
  100d38:	ebffff7b 	bl	100b2c <__malloc_unlock>
  100d3c:	e3a00000 	mov	r0, #0	; 0x0
  100d40:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100d44:	eb0001db 	bl	1014b8 <_sbrk_r>
  100d48:	e0643006 	rsb	r3, r4, r6
  100d4c:	e3700001 	cmn	r0, #1	; 0x1
  100d50:	e3a01000 	mov	r1, #0	; 0x0
  100d54:	e59fe06c 	ldr	lr, [pc, #108]	; 100dc8 <prog+0xd84>
  100d58:	e383c001 	orr	ip, r3, #1	; 0x1
  100d5c:	e1a00005 	mov	r0, r5
  100d60:	0a000008 	beq	100d88 <_malloc_trim_r+0xb4>
  100d64:	e59e3000 	ldr	r3, [lr]
  100d68:	e5972008 	ldr	r2, [r7, #8]
  100d6c:	e0643003 	rsb	r3, r4, r3
  100d70:	e1a00005 	mov	r0, r5
  100d74:	e582c004 	str	ip, [r2, #4]
  100d78:	e58e3000 	str	r3, [lr]
  100d7c:	ebffff6a 	bl	100b2c <__malloc_unlock>
  100d80:	e3a00001 	mov	r0, #1	; 0x1
  100d84:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100d88:	eb0001ca 	bl	1014b8 <_sbrk_r>
  100d8c:	e5971008 	ldr	r1, [r7, #8]
  100d90:	e1a0e000 	mov	lr, r0
  100d94:	e061300e 	rsb	r3, r1, lr
  100d98:	e353000f 	cmp	r3, #15	; 0xf
  100d9c:	e1a00005 	mov	r0, r5
  100da0:	e383c001 	orr	ip, r3, #1	; 0x1
  100da4:	daffffe3 	ble	100d38 <_malloc_trim_r+0x64>
  100da8:	e59f301c 	ldr	r3, [pc, #28]	; 100dcc <prog+0xd88>
  100dac:	e5932000 	ldr	r2, [r3]
  100db0:	e59f3010 	ldr	r3, [pc, #16]	; 100dc8 <prog+0xd84>
  100db4:	e062200e 	rsb	r2, r2, lr
  100db8:	e5832000 	str	r2, [r3]
  100dbc:	e581c004 	str	ip, [r1, #4]
  100dc0:	eaffffdc 	b	100d38 <_malloc_trim_r+0x64>
  100dc4:	00200000 	eoreq	r0, r0, r0
  100dc8:	00200b7c 	eoreq	r0, r0, ip, ror fp
  100dcc:	0020040c 	eoreq	r0, r0, ip, lsl #8

00100dd0 <_free_r>:
  100dd0:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100dd4:	e2514000 	subs	r4, r1, #0	; 0x0
  100dd8:	e1a08000 	mov	r8, r0
  100ddc:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  100de0:	ebffff50 	bl	100b28 <__malloc_lock>
  100de4:	e244e008 	sub	lr, r4, #8	; 0x8
  100de8:	e59e0004 	ldr	r0, [lr, #4]
  100dec:	e59f726c 	ldr	r7, [pc, #620]	; 101060 <prog+0x101c>
  100df0:	e3c01001 	bic	r1, r0, #1	; 0x1
  100df4:	e08ec001 	add	ip, lr, r1
  100df8:	e5973008 	ldr	r3, [r7, #8]
  100dfc:	e59c2004 	ldr	r2, [ip, #4]
  100e00:	e15c0003 	cmp	ip, r3
  100e04:	e3c25003 	bic	r5, r2, #3	; 0x3
  100e08:	e1a0a007 	mov	sl, r7
  100e0c:	0a000077 	beq	100ff0 <_free_r+0x220>
  100e10:	e2106001 	ands	r6, r0, #1	; 0x1
  100e14:	e58c5004 	str	r5, [ip, #4]
  100e18:	13a00000 	movne	r0, #0	; 0x0
  100e1c:	0a000018 	beq	100e84 <_free_r+0xb4>
  100e20:	e08c3005 	add	r3, ip, r5
  100e24:	e5932004 	ldr	r2, [r3, #4]
  100e28:	e3120001 	tst	r2, #1	; 0x1
  100e2c:	0a000007 	beq	100e50 <_free_r+0x80>
  100e30:	e3813001 	orr	r3, r1, #1	; 0x1
  100e34:	e3500000 	cmp	r0, #0	; 0x0
  100e38:	e58e3004 	str	r3, [lr, #4]
  100e3c:	e781100e 	str	r1, [r1, lr]
  100e40:	0a00001f 	beq	100ec4 <_free_r+0xf4>
  100e44:	e1a00008 	mov	r0, r8
  100e48:	e8bd45f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100e4c:	eaffff36 	b	100b2c <__malloc_unlock>
  100e50:	e3500000 	cmp	r0, #0	; 0x0
  100e54:	e0811005 	add	r1, r1, r5
  100e58:	159c2008 	ldrne	r2, [ip, #8]
  100e5c:	0a00004a 	beq	100f8c <_free_r+0x1bc>
  100e60:	e59c300c 	ldr	r3, [ip, #12]
  100e64:	e3500000 	cmp	r0, #0	; 0x0
  100e68:	e5832008 	str	r2, [r3, #8]
  100e6c:	e582300c 	str	r3, [r2, #12]
  100e70:	e3813001 	orr	r3, r1, #1	; 0x1
  100e74:	e58e3004 	str	r3, [lr, #4]
  100e78:	e781100e 	str	r1, [r1, lr]
  100e7c:	1afffff0 	bne	100e44 <_free_r+0x74>
  100e80:	ea00000f 	b	100ec4 <_free_r+0xf4>
  100e84:	e5142008 	ldr	r2, [r4, #-8]
  100e88:	e062e00e 	rsb	lr, r2, lr
  100e8c:	e59e0008 	ldr	r0, [lr, #8]
  100e90:	e2873008 	add	r3, r7, #8	; 0x8
  100e94:	e1500003 	cmp	r0, r3
  100e98:	159e300c 	ldrne	r3, [lr, #12]
  100e9c:	15830008 	strne	r0, [r3, #8]
  100ea0:	1580300c 	strne	r3, [r0, #12]
  100ea4:	e08c3005 	add	r3, ip, r5
  100ea8:	e0811002 	add	r1, r1, r2
  100eac:	e5932004 	ldr	r2, [r3, #4]
  100eb0:	03a00001 	moveq	r0, #1	; 0x1
  100eb4:	11a00006 	movne	r0, r6
  100eb8:	e3120001 	tst	r2, #1	; 0x1
  100ebc:	1affffdb 	bne	100e30 <_free_r+0x60>
  100ec0:	eaffffe2 	b	100e50 <_free_r+0x80>
  100ec4:	e3510c02 	cmp	r1, #512	; 0x200
  100ec8:	3a00003b 	bcc	100fbc <_free_r+0x1ec>
  100ecc:	e1b024a1 	movs	r2, r1, lsr #9
  100ed0:	01a021a1 	moveq	r2, r1, lsr #3
  100ed4:	01a03182 	moveq	r3, r2, lsl #3
  100ed8:	0a00001a 	beq	100f48 <_free_r+0x178>
  100edc:	e3520004 	cmp	r2, #4	; 0x4
  100ee0:	91a03321 	movls	r3, r1, lsr #6
  100ee4:	92832038 	addls	r2, r3, #56	; 0x38
  100ee8:	91a03182 	movls	r3, r2, lsl #3
  100eec:	9a000015 	bls	100f48 <_free_r+0x178>
  100ef0:	e3520014 	cmp	r2, #20	; 0x14
  100ef4:	9282205b 	addls	r2, r2, #91	; 0x5b
  100ef8:	91a03182 	movls	r3, r2, lsl #3
  100efc:	9a000011 	bls	100f48 <_free_r+0x178>
  100f00:	e3520054 	cmp	r2, #84	; 0x54
  100f04:	91a03621 	movls	r3, r1, lsr #12
  100f08:	9283206e 	addls	r2, r3, #110	; 0x6e
  100f0c:	91a03182 	movls	r3, r2, lsl #3
  100f10:	9a00000c 	bls	100f48 <_free_r+0x178>
  100f14:	e3520f55 	cmp	r2, #340	; 0x154
  100f18:	91a037a1 	movls	r3, r1, lsr #15
  100f1c:	92832077 	addls	r2, r3, #119	; 0x77
  100f20:	91a03182 	movls	r3, r2, lsl #3
  100f24:	9a000007 	bls	100f48 <_free_r+0x178>
  100f28:	e3a03e55 	mov	r3, #1360	; 0x550
  100f2c:	e2833004 	add	r3, r3, #4	; 0x4
  100f30:	e1520003 	cmp	r2, r3
  100f34:	91a03921 	movls	r3, r1, lsr #18
  100f38:	9283207c 	addls	r2, r3, #124	; 0x7c
  100f3c:	83a0207e 	movhi	r2, #126	; 0x7e
  100f40:	82433f59 	subhi	r3, r3, #356	; 0x164
  100f44:	91a03182 	movls	r3, r2, lsl #3
  100f48:	e083c00a 	add	ip, r3, sl
  100f4c:	e59c0008 	ldr	r0, [ip, #8]
  100f50:	e15c0000 	cmp	ip, r0
  100f54:	0a00003b 	beq	101048 <_free_r+0x278>
  100f58:	e5903004 	ldr	r3, [r0, #4]
  100f5c:	e3c33003 	bic	r3, r3, #3	; 0x3
  100f60:	e1510003 	cmp	r1, r3
  100f64:	2a000002 	bcs	100f74 <_free_r+0x1a4>
  100f68:	e5900008 	ldr	r0, [r0, #8]
  100f6c:	e15c0000 	cmp	ip, r0
  100f70:	1afffff8 	bne	100f58 <_free_r+0x188>
  100f74:	e590c00c 	ldr	ip, [r0, #12]
  100f78:	e58ec00c 	str	ip, [lr, #12]
  100f7c:	e58e0008 	str	r0, [lr, #8]
  100f80:	e580e00c 	str	lr, [r0, #12]
  100f84:	e58ce008 	str	lr, [ip, #8]
  100f88:	eaffffad 	b	100e44 <_free_r+0x74>
  100f8c:	e59c2008 	ldr	r2, [ip, #8]
  100f90:	e59f30cc 	ldr	r3, [pc, #204]	; 101064 <prog+0x1020>
  100f94:	e1520003 	cmp	r2, r3
  100f98:	1affffb0 	bne	100e60 <_free_r+0x90>
  100f9c:	e3813001 	orr	r3, r1, #1	; 0x1
  100fa0:	e582e00c 	str	lr, [r2, #12]
  100fa4:	e582e008 	str	lr, [r2, #8]
  100fa8:	e781100e 	str	r1, [r1, lr]
  100fac:	e58e3004 	str	r3, [lr, #4]
  100fb0:	e58e2008 	str	r2, [lr, #8]
  100fb4:	e58e200c 	str	r2, [lr, #12]
  100fb8:	eaffffa1 	b	100e44 <_free_r+0x74>
  100fbc:	e1a011a1 	mov	r1, r1, lsr #3
  100fc0:	e5972004 	ldr	r2, [r7, #4]
  100fc4:	e1a00121 	mov	r0, r1, lsr #2
  100fc8:	e3a03001 	mov	r3, #1	; 0x1
  100fcc:	e1822013 	orr	r2, r2, r3, lsl r0
  100fd0:	e08a1181 	add	r1, sl, r1, lsl #3
  100fd4:	e5913008 	ldr	r3, [r1, #8]
  100fd8:	e58e100c 	str	r1, [lr, #12]
  100fdc:	e58e3008 	str	r3, [lr, #8]
  100fe0:	e5872004 	str	r2, [r7, #4]
  100fe4:	e583e00c 	str	lr, [r3, #12]
  100fe8:	e581e008 	str	lr, [r1, #8]
  100fec:	eaffff94 	b	100e44 <_free_r+0x74>
  100ff0:	e3100001 	tst	r0, #1	; 0x1
  100ff4:	e0810005 	add	r0, r1, r5
  100ff8:	1a000006 	bne	101018 <_free_r+0x248>
  100ffc:	e5141008 	ldr	r1, [r4, #-8]
  101000:	e061e00e 	rsb	lr, r1, lr
  101004:	e59e200c 	ldr	r2, [lr, #12]
  101008:	e59e3008 	ldr	r3, [lr, #8]
  10100c:	e5823008 	str	r3, [r2, #8]
  101010:	e583200c 	str	r2, [r3, #12]
  101014:	e0800001 	add	r0, r0, r1
  101018:	e59f3048 	ldr	r3, [pc, #72]	; 101068 <prog+0x1024>
  10101c:	e5932000 	ldr	r2, [r3]
  101020:	e3803001 	orr	r3, r0, #1	; 0x1
  101024:	e1500002 	cmp	r0, r2
  101028:	e587e008 	str	lr, [r7, #8]
  10102c:	e58e3004 	str	r3, [lr, #4]
  101030:	3affff83 	bcc	100e44 <_free_r+0x74>
  101034:	e59f3030 	ldr	r3, [pc, #48]	; 10106c <prog+0x1028>
  101038:	e1a00008 	mov	r0, r8
  10103c:	e5931000 	ldr	r1, [r3]
  101040:	ebffff23 	bl	100cd4 <_malloc_trim_r>
  101044:	eaffff7e 	b	100e44 <_free_r+0x74>
  101048:	e5973004 	ldr	r3, [r7, #4]
  10104c:	e1a01122 	mov	r1, r2, lsr #2
  101050:	e3a02001 	mov	r2, #1	; 0x1
  101054:	e1833112 	orr	r3, r3, r2, lsl r1
  101058:	e5873004 	str	r3, [r7, #4]
  10105c:	eaffffc5 	b	100f78 <_free_r+0x1a8>
  101060:	00200000 	eoreq	r0, r0, r0
  101064:	00200008 	eoreq	r0, r0, r8
  101068:	00200408 	eoreq	r0, r0, r8, lsl #8
  10106c:	00200b70 	eoreq	r0, r0, r0, ror fp

00101070 <vApplicationIdleHook>:
  101070:	e3a034a5 	mov	r3, #-1526726656	; 0xa5000000
  101074:	e2833001 	add	r3, r3, #1	; 0x1
  101078:	e3e02c02 	mvn	r2, #512	; 0x200
  10107c:	e50230bf 	str	r3, [r2, #-191]
  101080:	e12fff1e 	bx	lr

00101084 <vResetEnv>:
  101084:	e59f0008 	ldr	r0, [pc, #8]	; 101094 <prog+0x1050>
  101088:	e3a01000 	mov	r1, #0	; 0x0
  10108c:	e3a02080 	mov	r2, #128	; 0x80
  101090:	eafffe7e 	b	100a90 <memset>
  101094:	00201478 	eoreq	r1, r0, r8, ror r4

00101098 <mainloop>:
  101098:	e3a04000 	mov	r4, #0	; 0x0
  10109c:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  1010a0:	e3a0200c 	mov	r2, #12	; 0xc
  1010a4:	e5834031 	str	r4, [r3, #49]
  1010a8:	e2833b03 	add	r3, r3, #3072	; 0xc00
  1010ac:	e24dd008 	sub	sp, sp, #8	; 0x8
  1010b0:	e50320ef 	str	r2, [r3, #-239]
  1010b4:	eb000109 	bl	1014e0 <led_init>
  1010b8:	e1a00004 	mov	r0, r4
  1010bc:	eb00010d 	bl	1014f8 <led_set_green>
  1010c0:	eb000132 	bl	101590 <env_init>
  1010c4:	eb000136 	bl	1015a4 <env_load>
  1010c8:	e1500004 	cmp	r0, r4
  1010cc:	0a00000d 	beq	101108 <mainloop+0x70>
  1010d0:	e3a0c002 	mov	ip, #2	; 0x2
  1010d4:	e1a03004 	mov	r3, r4
  1010d8:	e59f1030 	ldr	r1, [pc, #48]	; 101110 <prog+0x10cc>
  1010dc:	e3a02c02 	mov	r2, #512	; 0x200
  1010e0:	e59f002c 	ldr	r0, [pc, #44]	; 101114 <prog+0x10d0>
  1010e4:	e58dc000 	str	ip, [sp]
  1010e8:	e58d4004 	str	r4, [sp, #4]
  1010ec:	eb00070b 	bl	102d20 <xTaskCreate>
  1010f0:	eb000009 	bl	10111c <vUSBShellInit>
  1010f4:	eb00001d 	bl	101170 <PtInitProtocol>
  1010f8:	e3a00001 	mov	r0, #1	; 0x1
  1010fc:	eb0000fd 	bl	1014f8 <led_set_green>
  101100:	eb000795 	bl	102f5c <vTaskStartScheduler>
  101104:	eafffffe 	b	101104 <mainloop+0x6c>
  101108:	ebffffdd 	bl	101084 <vResetEnv>
  10110c:	eaffffef 	b	1010d0 <mainloop+0x38>
  101110:	00104688 	andeqs	r4, r0, r8, lsl #13
  101114:	00103a78 	andeqs	r3, r0, r8, ror sl

00101118 <use_led>:
  101118:	eafffffe 	b	101118 <use_led>

0010111c <vUSBShellInit>:
  10111c:	e52de004 	str	lr, [sp, #-4]!
  101120:	e3a0c000 	mov	ip, #0	; 0x0
  101124:	e24dd008 	sub	sp, sp, #8	; 0x8
  101128:	e1a0300c 	mov	r3, ip
  10112c:	e59f1018 	ldr	r1, [pc, #24]	; 10114c <prog+0x1108>
  101130:	e3a02c02 	mov	r2, #512	; 0x200
  101134:	e59f0014 	ldr	r0, [pc, #20]	; 101150 <prog+0x110c>
  101138:	e58dc000 	str	ip, [sp]
  10113c:	e58dc004 	str	ip, [sp, #4]
  101140:	eb0006f6 	bl	102d20 <xTaskCreate>
  101144:	e28dd008 	add	sp, sp, #8	; 0x8
  101148:	e8bd8000 	ldmia	sp!, {pc}
  10114c:	0010468c 	andeqs	r4, r0, ip, lsl #13
  101150:	00101118 	andeqs	r1, r0, r8, lsl r1

00101154 <PtSetRfPowerLevel>:
  101154:	e20000ff 	and	r0, r0, #255	; 0xff
  101158:	e59f300c 	ldr	r3, [pc, #12]	; 10116c <prog+0x1128>
  10115c:	e3500003 	cmp	r0, #3	; 0x3
  101160:	23a00003 	movcs	r0, #3	; 0x3
  101164:	e5c30000 	strb	r0, [r3]
  101168:	e12fff1e 	bx	lr
  10116c:	00200bc2 	eoreq	r0, r0, r2, asr #23

00101170 <PtInitProtocol>:
  101170:	e92d4010 	stmdb	sp!, {r4, lr}
  101174:	e59fc040 	ldr	ip, [pc, #64]	; 1011bc <prog+0x1178>
  101178:	e3a04000 	mov	r4, #0	; 0x0
  10117c:	e58c4000 	str	r4, [ip]
  101180:	e59fe038 	ldr	lr, [pc, #56]	; 1011c0 <prog+0x117c>
  101184:	e59fc038 	ldr	ip, [pc, #56]	; 1011c4 <prog+0x1180>
  101188:	e58e4000 	str	r4, [lr]
  10118c:	e24dd008 	sub	sp, sp, #8	; 0x8
  101190:	e58c4000 	str	r4, [ip]
  101194:	e3a0e003 	mov	lr, #3	; 0x3
  101198:	e1a03004 	mov	r3, r4
  10119c:	e59f1024 	ldr	r1, [pc, #36]	; 1011c8 <prog+0x1184>
  1011a0:	e3a02c02 	mov	r2, #512	; 0x200
  1011a4:	e59f0020 	ldr	r0, [pc, #32]	; 1011cc <prog+0x1188>
  1011a8:	e58de000 	str	lr, [sp]
  1011ac:	e58d4004 	str	r4, [sp, #4]
  1011b0:	eb0006da 	bl	102d20 <xTaskCreate>
  1011b4:	e28dd008 	add	sp, sp, #8	; 0x8
  1011b8:	e8bd8010 	ldmia	sp!, {r4, pc}
  1011bc:	00201470 	eoreq	r1, r0, r0, ror r4
  1011c0:	0020146c 	eoreq	r1, r0, ip, ror #8
  1011c4:	00201474 	eoreq	r1, r0, r4, ror r4
  1011c8:	00104694 	muleqs	r0, r4, r6
  1011cc:	00101218 	andeqs	r1, r0, r8, lsl r2

001011d0 <shuffle_tx_byteorder>:
  1011d0:	e52de004 	str	lr, [sp, #-4]!
  1011d4:	e251e000 	subs	lr, r1, #0	; 0x0
  1011d8:	049df004 	ldreq	pc, [sp], #4
  1011dc:	e3a0c000 	mov	ip, #0	; 0x0
  1011e0:	e5903000 	ldr	r3, [r0]
  1011e4:	e1a02c03 	mov	r2, r3, lsl #24
  1011e8:	e1a01423 	mov	r1, r3, lsr #8
  1011ec:	e1822c23 	orr	r2, r2, r3, lsr #24
  1011f0:	e2011cff 	and	r1, r1, #65280	; 0xff00
  1011f4:	e1a03403 	mov	r3, r3, lsl #8
  1011f8:	e1822001 	orr	r2, r2, r1
  1011fc:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
  101200:	e28cc001 	add	ip, ip, #1	; 0x1
  101204:	e1822003 	orr	r2, r2, r3
  101208:	e15c000e 	cmp	ip, lr
  10120c:	e4802004 	str	r2, [r0], #4
  101210:	1afffff2 	bne	1011e0 <shuffle_tx_byteorder+0x10>
  101214:	e49df004 	ldr	pc, [sp], #4

00101218 <vnRFtaskRxTx>:
  101218:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10121c:	e3a00051 	mov	r0, #81	; 0x51
  101220:	e24dd004 	sub	sp, sp, #4	; 0x4
  101224:	e59f1258 	ldr	r1, [pc, #600]	; 101484 <prog+0x1440>
  101228:	e3a02005 	mov	r2, #5	; 0x5
  10122c:	e3a03000 	mov	r3, #0	; 0x0
  101230:	eb0001c2 	bl	101940 <nRFAPI_Init>
  101234:	e3500000 	cmp	r0, #0	; 0x0
  101238:	1a000001 	bne	101244 <vnRFtaskRxTx+0x2c>
  10123c:	e28dd004 	add	sp, sp, #4	; 0x4
  101240:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  101244:	e59f323c 	ldr	r3, [pc, #572]	; 101488 <prog+0x1444>
  101248:	e3a0100a 	mov	r1, #10	; 0xa
  10124c:	e59f2238 	ldr	r2, [pc, #568]	; 10148c <prog+0x1448>
  101250:	e5831000 	str	r1, [r3]
  101254:	e59f3234 	ldr	r3, [pc, #564]	; 101490 <prog+0x144c>
  101258:	e3e0c000 	mvn	ip, #0	; 0x0
  10125c:	e5c2c000 	strb	ip, [r2]
  101260:	e5c3c000 	strb	ip, [r3]
  101264:	e3a00003 	mov	r0, #3	; 0x3
  101268:	ebffffb9 	bl	101154 <PtSetRfPowerLevel>
  10126c:	e3a00005 	mov	r0, #5	; 0x5
  101270:	eb000122 	bl	101700 <nRFAPI_SetSizeMac>
  101274:	e3a00000 	mov	r0, #0	; 0x0
  101278:	e3a0101e 	mov	r1, #30	; 0x1e
  10127c:	eb00010f 	bl	1016c0 <nRFAPI_SetPipeSizeRX>
  101280:	e59f520c 	ldr	r5, [pc, #524]	; 101494 <prog+0x1450>
  101284:	e3a0101e 	mov	r1, #30	; 0x1e
  101288:	e3a00001 	mov	r0, #1	; 0x1
  10128c:	eb00010b 	bl	1016c0 <nRFAPI_SetPipeSizeRX>
  101290:	e3a00003 	mov	r0, #3	; 0x3
  101294:	eb000128 	bl	10173c <nRFAPI_PipesEnable>
  101298:	e5d53010 	ldrb	r3, [r5, #16]
  10129c:	e5d51011 	ldrb	r1, [r5, #17]
  1012a0:	e5d50012 	ldrb	r0, [r5, #18]
  1012a4:	e1833401 	orr	r3, r3, r1, lsl #8
  1012a8:	e5d52013 	ldrb	r2, [r5, #19]
  1012ac:	e1833800 	orr	r3, r3, r0, lsl #16
  1012b0:	e1932c02 	orrs	r2, r3, r2, lsl #24
  1012b4:	1a00006c 	bne	10146c <vnRFtaskRxTx+0x254>
  1012b8:	e59f01c4 	ldr	r0, [pc, #452]	; 101484 <prog+0x1440>
  1012bc:	e3a01005 	mov	r1, #5	; 0x5
  1012c0:	eb00016d 	bl	10187c <nRFAPI_SetTxMAC>
  1012c4:	e59f31cc 	ldr	r3, [pc, #460]	; 101498 <prog+0x1454>
  1012c8:	e5d5c010 	ldrb	ip, [r5, #16]
  1012cc:	e1a00003 	mov	r0, r3
  1012d0:	e3a01005 	mov	r1, #5	; 0x5
  1012d4:	e3a02001 	mov	r2, #1	; 0x1
  1012d8:	e5c3c004 	strb	ip, [r3, #4]
  1012dc:	eb000148 	bl	101804 <nRFAPI_SetRxMAC>
  1012e0:	e3a00000 	mov	r0, #0	; 0x0
  1012e4:	eb000125 	bl	101780 <nRFAPI_SetRxMode>
  1012e8:	e3a00000 	mov	r0, #0	; 0x0
  1012ec:	eb0002e0 	bl	101e74 <nRFCMD_CE>
  1012f0:	e59f71a4 	ldr	r7, [pc, #420]	; 10149c <prog+0x1458>
  1012f4:	e59f81a4 	ldr	r8, [pc, #420]	; 1014a0 <prog+0x145c>
  1012f8:	eb000125 	bl	101794 <nRFAPI_GetFifoStatus>
  1012fc:	e2100002 	ands	r0, r0, #2	; 0x2
  101300:	1a000002 	bne	101310 <vnRFtaskRxTx+0xf8>
  101304:	eb0001c1 	bl	101a10 <nRFCMD_WaitRx>
  101308:	e3500000 	cmp	r0, #0	; 0x0
  10130c:	0a000051 	beq	101458 <vnRFtaskRxTx+0x240>
  101310:	e3a00000 	mov	r0, #0	; 0x0
  101314:	eb000077 	bl	1014f8 <led_set_green>
  101318:	e59f6184 	ldr	r6, [pc, #388]	; 1014a4 <prog+0x1460>
  10131c:	e1a04006 	mov	r4, r6
  101320:	ea000002 	b	101330 <vnRFtaskRxTx+0x118>
  101324:	eb00011a 	bl	101794 <nRFAPI_GetFifoStatus>
  101328:	e3100001 	tst	r0, #1	; 0x1
  10132c:	1a000047 	bne	101450 <vnRFtaskRxTx+0x238>
  101330:	e3a0201e 	mov	r2, #30	; 0x1e
  101334:	e59f1168 	ldr	r1, [pc, #360]	; 1014a4 <prog+0x1460>
  101338:	e3a00061 	mov	r0, #97	; 0x61
  10133c:	eb000284 	bl	101d54 <nRFCMD_RegReadBuf>
  101340:	e59f015c 	ldr	r0, [pc, #348]	; 1014a4 <prog+0x1460>
  101344:	e3a01007 	mov	r1, #7	; 0x7
  101348:	ebffffa0 	bl	1011d0 <shuffle_tx_byteorder>
  10134c:	e59f0150 	ldr	r0, [pc, #336]	; 1014a4 <prog+0x1460>
  101350:	e3a01007 	mov	r1, #7	; 0x7
  101354:	eb03fd83 	bl	200968 <xxtea_decode>
  101358:	e59f0144 	ldr	r0, [pc, #324]	; 1014a4 <prog+0x1460>
  10135c:	e3a01007 	mov	r1, #7	; 0x7
  101360:	ebffff9a 	bl	1011d0 <shuffle_tx_byteorder>
  101364:	e3a0101a 	mov	r1, #26	; 0x1a
  101368:	e59f0134 	ldr	r0, [pc, #308]	; 1014a4 <prog+0x1460>
  10136c:	e1a0e00f 	mov	lr, pc
  101370:	e12fff17 	bx	r7
  101374:	e5d4201b 	ldrb	r2, [r4, #27]
  101378:	e5d4301a 	ldrb	r3, [r4, #26]
  10137c:	e5d4c01c 	ldrb	ip, [r4, #28]
  101380:	e1833402 	orr	r3, r3, r2, lsl #8
  101384:	e5d4101d 	ldrb	r1, [r4, #29]
  101388:	e183380c 	orr	r3, r3, ip, lsl #16
  10138c:	e1833c01 	orr	r3, r3, r1, lsl #24
  101390:	e1a02c03 	mov	r2, r3, lsl #24
  101394:	e1a01423 	mov	r1, r3, lsr #8
  101398:	e1822c23 	orr	r2, r2, r3, lsr #24
  10139c:	e2011cff 	and	r1, r1, #65280	; 0xff00
  1013a0:	e1a03403 	mov	r3, r3, lsl #8
  1013a4:	e1822001 	orr	r2, r2, r1
  1013a8:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
  1013ac:	e1822003 	orr	r2, r2, r3
  1013b0:	e1500002 	cmp	r0, r2
  1013b4:	1affffda 	bne	101324 <vnRFtaskRxTx+0x10c>
  1013b8:	e5d52011 	ldrb	r2, [r5, #17]
  1013bc:	e5d53010 	ldrb	r3, [r5, #16]
  1013c0:	e5d51012 	ldrb	r1, [r5, #18]
  1013c4:	e1833402 	orr	r3, r3, r2, lsl #8
  1013c8:	e5d50013 	ldrb	r0, [r5, #19]
  1013cc:	e1833801 	orr	r3, r3, r1, lsl #16
  1013d0:	e5d62002 	ldrb	r2, [r6, #2]
  1013d4:	e1833c00 	orr	r3, r3, r0, lsl #24
  1013d8:	e1520003 	cmp	r2, r3
  1013dc:	1affffd0 	bne	101324 <vnRFtaskRxTx+0x10c>
  1013e0:	e5d63003 	ldrb	r3, [r6, #3]
  1013e4:	e3130040 	tst	r3, #64	; 0x40
  1013e8:	e3a01000 	mov	r1, #0	; 0x0
  1013ec:	e3a02064 	mov	r2, #100	; 0x64
  1013f0:	e59f00b0 	ldr	r0, [pc, #176]	; 1014a8 <prog+0x1464>
  1013f4:	0affffca 	beq	101324 <vnRFtaskRxTx+0x10c>
  1013f8:	ebfffda4 	bl	100a90 <memset>
  1013fc:	e59f10a8 	ldr	r1, [pc, #168]	; 1014ac <prog+0x1468>
  101400:	e3a02010 	mov	r2, #16	; 0x10
  101404:	e59f00a4 	ldr	r0, [pc, #164]	; 1014b0 <prog+0x146c>
  101408:	ebfffd78 	bl	1009f0 <memcpy>
  10140c:	e59f009c 	ldr	r0, [pc, #156]	; 1014b0 <prog+0x146c>
  101410:	ebfffdc6 	bl	100b30 <strlen>
  101414:	e2801004 	add	r1, r0, #4	; 0x4
  101418:	e3a02000 	mov	r2, #0	; 0x0
  10141c:	e20110ff 	and	r1, r1, #255	; 0xff
  101420:	e1a03002 	mov	r3, r2
  101424:	e3e0c000 	mvn	ip, #0	; 0x0
  101428:	e2811004 	add	r1, r1, #4	; 0x4
  10142c:	e59f0074 	ldr	r0, [pc, #116]	; 1014a8 <prog+0x1464>
  101430:	e58dc000 	str	ip, [sp]
  101434:	eb000903 	bl	103848 <usb_send_buffer_zero_copy>
  101438:	e5983000 	ldr	r3, [r8]
  10143c:	e2833001 	add	r3, r3, #1	; 0x1
  101440:	e5883000 	str	r3, [r8]
  101444:	eb0000d2 	bl	101794 <nRFAPI_GetFifoStatus>
  101448:	e3100001 	tst	r0, #1	; 0x1
  10144c:	0affffb7 	beq	101330 <vnRFtaskRxTx+0x118>
  101450:	e3a00001 	mov	r0, #1	; 0x1
  101454:	eb000027 	bl	1014f8 <led_set_green>
  101458:	e3a00005 	mov	r0, #5	; 0x5
  10145c:	eb0007ac 	bl	103314 <vTaskDelay>
  101460:	e3a00070 	mov	r0, #112	; 0x70
  101464:	eb00009d 	bl	1016e0 <nRFAPI_ClearIRQ>
  101468:	eaffffa2 	b	1012f8 <vnRFtaskRxTx+0xe0>
  10146c:	e59f3040 	ldr	r3, [pc, #64]	; 1014b4 <prog+0x1470>
  101470:	e3a01005 	mov	r1, #5	; 0x5
  101474:	e1a00003 	mov	r0, r3
  101478:	e5c32004 	strb	r2, [r3, #4]
  10147c:	eb0000fe 	bl	10187c <nRFAPI_SetTxMAC>
  101480:	eaffff8f 	b	1012c4 <vnRFtaskRxTx+0xac>
  101484:	001046c0 	andeqs	r4, r0, r0, asr #13
  101488:	00200bc4 	eoreq	r0, r0, r4, asr #23
  10148c:	00200bc3 	eoreq	r0, r0, r3, asr #23
  101490:	00200bc2 	eoreq	r0, r0, r2, asr #23
  101494:	00201478 	eoreq	r1, r0, r8, ror r4
  101498:	00200819 	eoreq	r0, r0, r9, lsl r8
  10149c:	00200ac4 	eoreq	r0, r0, r4, asr #21
  1014a0:	00201474 	eoreq	r1, r0, r4, ror r4
  1014a4:	00200ba4 	eoreq	r0, r0, r4, lsr #23
  1014a8:	00200e90 	mlaeq	r0, r0, lr, r0
  1014ac:	001046a0 	andeqs	r4, r0, r0, lsr #13
  1014b0:	00200e97 	mlaeq	r0, r7, lr, r0
  1014b4:	00200814 	eoreq	r0, r0, r4, lsl r8

001014b8 <_sbrk_r>:
  1014b8:	e59f2018 	ldr	r2, [pc, #24]	; 1014d8 <prog+0x1494>
  1014bc:	e5920000 	ldr	r0, [r2]
  1014c0:	e3500000 	cmp	r0, #0	; 0x0
  1014c4:	059f0010 	ldreq	r0, [pc, #16]	; 1014dc <prog+0x1498>
  1014c8:	e0803001 	add	r3, r0, r1
  1014cc:	05820000 	streq	r0, [r2]
  1014d0:	e5823000 	str	r3, [r2]
  1014d4:	e12fff1e 	bx	lr
  1014d8:	00200bc8 	eoreq	r0, r0, r8, asr #23
  1014dc:	00201504 	eoreq	r1, r0, r4, lsl #10

001014e0 <led_init>:
  1014e0:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  1014e4:	e3a03501 	mov	r3, #4194304	; 0x400000
  1014e8:	e50230ff 	str	r3, [r2, #-255]
  1014ec:	e50230ef 	str	r3, [r2, #-239]
  1014f0:	e50230cf 	str	r3, [r2, #-207]
  1014f4:	e12fff1e 	bx	lr

001014f8 <led_set_green>:
  1014f8:	e31000ff 	tst	r0, #255	; 0xff
  1014fc:	13a02501 	movne	r2, #4194304	; 0x400000
  101500:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  101504:	03a02501 	moveq	r2, #4194304	; 0x400000
  101508:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  10150c:	150320cb 	strne	r2, [r3, #-203]
  101510:	050320cf 	streq	r2, [r3, #-207]
  101514:	e12fff1e 	bx	lr

00101518 <env_crc16>:
  101518:	e3500000 	cmp	r0, #0	; 0x0
  10151c:	13510000 	cmpne	r1, #0	; 0x0
  101520:	e52de004 	str	lr, [sp, #-4]!
  101524:	e1a0e000 	mov	lr, r0
  101528:	0a000015 	beq	101584 <env_crc16+0x6c>
  10152c:	e3510000 	cmp	r1, #0	; 0x0
  101530:	0a000013 	beq	101584 <env_crc16+0x6c>
  101534:	e3a00801 	mov	r0, #65536	; 0x10000
  101538:	e2400001 	sub	r0, r0, #1	; 0x1
  10153c:	e3a0c000 	mov	ip, #0	; 0x0
  101540:	e7dc200e 	ldrb	r2, [ip, lr]
  101544:	e1a03400 	mov	r3, r0, lsl #8
  101548:	e1833420 	orr	r3, r3, r0, lsr #8
  10154c:	e0233002 	eor	r3, r3, r2
  101550:	e1a03803 	mov	r3, r3, lsl #16
  101554:	e1a03823 	mov	r3, r3, lsr #16
  101558:	e20320ff 	and	r2, r3, #255	; 0xff
  10155c:	e0233222 	eor	r3, r3, r2, lsr #4
  101560:	e0233603 	eor	r3, r3, r3, lsl #12
  101564:	e1a03803 	mov	r3, r3, lsl #16
  101568:	e1a03823 	mov	r3, r3, lsr #16
  10156c:	e28cc001 	add	ip, ip, #1	; 0x1
  101570:	e20320ff 	and	r2, r3, #255	; 0xff
  101574:	e15c0001 	cmp	ip, r1
  101578:	e0230282 	eor	r0, r3, r2, lsl #5
  10157c:	1affffef 	bne	101540 <env_crc16+0x28>
  101580:	e49df004 	ldr	pc, [sp], #4
  101584:	e3a00801 	mov	r0, #65536	; 0x10000
  101588:	e2400001 	sub	r0, r0, #1	; 0x1
  10158c:	e49df004 	ldr	pc, [sp], #4

00101590 <env_init>:
  101590:	e3a03831 	mov	r3, #3211264	; 0x310000
  101594:	e2833c03 	add	r3, r3, #768	; 0x300
  101598:	e3e02000 	mvn	r2, #0	; 0x0
  10159c:	e502309f 	str	r3, [r2, #-159]
  1015a0:	e12fff1e 	bx	lr

001015a4 <env_load>:
  1015a4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1015a8:	e59f50b8 	ldr	r5, [pc, #184]	; 101668 <prog+0x1624>
  1015ac:	e3a0194f 	mov	r1, #1294336	; 0x13c000
  1015b0:	e2811a03 	add	r1, r1, #12288	; 0x3000
  1015b4:	e3a02080 	mov	r2, #128	; 0x80
  1015b8:	e1a00005 	mov	r0, r5
  1015bc:	ebfffd0b 	bl	1009f0 <memcpy>
  1015c0:	e5d52001 	ldrb	r2, [r5, #1]
  1015c4:	e5d53000 	ldrb	r3, [r5]
  1015c8:	e5d51002 	ldrb	r1, [r5, #2]
  1015cc:	e1833402 	orr	r3, r3, r2, lsl #8
  1015d0:	e5d50003 	ldrb	r0, [r5, #3]
  1015d4:	e3e024f3 	mvn	r2, #-218103808	; 0xf3000000
  1015d8:	e1833801 	orr	r3, r3, r1, lsl #16
  1015dc:	e24229cd 	sub	r2, r2, #3358720	; 0x334000
  1015e0:	e1833c00 	orr	r3, r3, r0, lsl #24
  1015e4:	e2422e11 	sub	r2, r2, #272	; 0x110
  1015e8:	e1530002 	cmp	r3, r2
  1015ec:	0a000001 	beq	1015f8 <env_load+0x54>
  1015f0:	e3a00000 	mov	r0, #0	; 0x0
  1015f4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1015f8:	e5d53004 	ldrb	r3, [r5, #4]
  1015fc:	e5d52005 	ldrb	r2, [r5, #5]
  101600:	e5d5c006 	ldrb	ip, [r5, #6]
  101604:	e5d51007 	ldrb	r1, [r5, #7]
  101608:	e1833402 	orr	r3, r3, r2, lsl #8
  10160c:	e183380c 	orr	r3, r3, ip, lsl #16
  101610:	e1833c01 	orr	r3, r3, r1, lsl #24
  101614:	e3530080 	cmp	r3, #128	; 0x80
  101618:	e1a00005 	mov	r0, r5
  10161c:	e3a0e000 	mov	lr, #0	; 0x0
  101620:	e1a01003 	mov	r1, r3
  101624:	1afffff1 	bne	1015f0 <env_load+0x4c>
  101628:	e5d54008 	ldrb	r4, [r5, #8]
  10162c:	e5d53009 	ldrb	r3, [r5, #9]
  101630:	e5d5200a 	ldrb	r2, [r5, #10]
  101634:	e5d5c00b 	ldrb	ip, [r5, #11]
  101638:	e1844403 	orr	r4, r4, r3, lsl #8
  10163c:	e1844802 	orr	r4, r4, r2, lsl #16
  101640:	e1844c0c 	orr	r4, r4, ip, lsl #24
  101644:	e5c5e00b 	strb	lr, [r5, #11]
  101648:	e5c5e008 	strb	lr, [r5, #8]
  10164c:	e5c5e009 	strb	lr, [r5, #9]
  101650:	e5c5e00a 	strb	lr, [r5, #10]
  101654:	ebffffaf 	bl	101518 <env_crc16>
  101658:	e1540000 	cmp	r4, r0
  10165c:	13a00000 	movne	r0, #0	; 0x0
  101660:	03a00001 	moveq	r0, #1	; 0x1
  101664:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  101668:	00201478 	eoreq	r1, r0, r8, ror r4

0010166c <nRFAPI_SetFeatures>:
  10166c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101670:	e24dd004 	sub	sp, sp, #4	; 0x4
  101674:	e28d4002 	add	r4, sp, #2	; 0x2
  101678:	e3a06002 	mov	r6, #2	; 0x2
  10167c:	e1a02006 	mov	r2, r6
  101680:	e1a05000 	mov	r5, r0
  101684:	e59f102c 	ldr	r1, [pc, #44]	; 1016b8 <prog+0x1674>
  101688:	e1a00004 	mov	r0, r4
  10168c:	ebfffcd7 	bl	1009f0 <memcpy>
  101690:	e20550ff 	and	r5, r5, #255	; 0xff
  101694:	e1a01004 	mov	r1, r4
  101698:	e1a02006 	mov	r2, r6
  10169c:	e59f0018 	ldr	r0, [pc, #24]	; 1016bc <prog+0x1678>
  1016a0:	eb00018a 	bl	101cd0 <nRFCMD_ReadWriteBuffer>
  1016a4:	e1a01005 	mov	r1, r5
  1016a8:	e3a0001d 	mov	r0, #29	; 0x1d
  1016ac:	eb0001cb 	bl	101de0 <nRFCMD_RegWriteStatusRead>
  1016b0:	e28dd004 	add	sp, sp, #4	; 0x4
  1016b4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  1016b8:	00104acf 	andeqs	r4, r0, pc, asr #21
  1016bc:	00104acd 	andeqs	r4, r0, sp, asr #21

001016c0 <nRFAPI_SetPipeSizeRX>:
  1016c0:	e20030ff 	and	r3, r0, #255	; 0xff
  1016c4:	e2830011 	add	r0, r3, #17	; 0x11
  1016c8:	e3800020 	orr	r0, r0, #32	; 0x20
  1016cc:	e3530005 	cmp	r3, #5	; 0x5
  1016d0:	e20000ff 	and	r0, r0, #255	; 0xff
  1016d4:	e20110ff 	and	r1, r1, #255	; 0xff
  1016d8:	812fff1e 	bxhi	lr
  1016dc:	ea0001bf 	b	101de0 <nRFCMD_RegWriteStatusRead>

001016e0 <nRFAPI_ClearIRQ>:
  1016e0:	e2001070 	and	r1, r0, #112	; 0x70
  1016e4:	e52de004 	str	lr, [sp, #-4]!
  1016e8:	e3a00027 	mov	r0, #39	; 0x27
  1016ec:	eb0001bb 	bl	101de0 <nRFCMD_RegWriteStatusRead>
  1016f0:	e49df004 	ldr	pc, [sp], #4

001016f4 <nRFAPI_SetChannel>:
  1016f4:	e200107f 	and	r1, r0, #127	; 0x7f
  1016f8:	e3a00025 	mov	r0, #37	; 0x25
  1016fc:	ea0001b7 	b	101de0 <nRFCMD_RegWriteStatusRead>

00101700 <nRFAPI_SetSizeMac>:
  101700:	e20000ff 	and	r0, r0, #255	; 0xff
  101704:	e2403003 	sub	r3, r0, #3	; 0x3
  101708:	e3530002 	cmp	r3, #2	; 0x2
  10170c:	e2400002 	sub	r0, r0, #2	; 0x2
  101710:	e92d4010 	stmdb	sp!, {r4, lr}
  101714:	e3a04000 	mov	r4, #0	; 0x0
  101718:	920040ff 	andls	r4, r0, #255	; 0xff
  10171c:	e1a01004 	mov	r1, r4
  101720:	e3a00023 	mov	r0, #35	; 0x23
  101724:	eb0001ad 	bl	101de0 <nRFCMD_RegWriteStatusRead>
  101728:	e1a00004 	mov	r0, r4
  10172c:	e8bd8010 	ldmia	sp!, {r4, pc}

00101730 <nRFAPI_PipesAck>:
  101730:	e200103f 	and	r1, r0, #63	; 0x3f
  101734:	e3a00021 	mov	r0, #33	; 0x21
  101738:	ea0001a8 	b	101de0 <nRFCMD_RegWriteStatusRead>

0010173c <nRFAPI_PipesEnable>:
  10173c:	e200103f 	and	r1, r0, #63	; 0x3f
  101740:	e3a00022 	mov	r0, #34	; 0x22
  101744:	ea0001a5 	b	101de0 <nRFCMD_RegWriteStatusRead>

00101748 <nRFAPI_TxRetries>:
  101748:	e20010ff 	and	r1, r0, #255	; 0xff
  10174c:	e351000f 	cmp	r1, #15	; 0xf
  101750:	23a0100f 	movcs	r1, #15	; 0xf
  101754:	e3811010 	orr	r1, r1, #16	; 0x10
  101758:	e3a00024 	mov	r0, #36	; 0x24
  10175c:	ea00019f 	b	101de0 <nRFCMD_RegWriteStatusRead>

00101760 <nRFAPI_SetTxPower>:
  101760:	e20010ff 	and	r1, r0, #255	; 0xff
  101764:	e3510003 	cmp	r1, #3	; 0x3
  101768:	23a01003 	movcs	r1, #3	; 0x3
  10176c:	e1a01081 	mov	r1, r1, lsl #1
  101770:	e20110fe 	and	r1, r1, #254	; 0xfe
  101774:	e3811009 	orr	r1, r1, #9	; 0x9
  101778:	e3a00026 	mov	r0, #38	; 0x26
  10177c:	ea000197 	b	101de0 <nRFCMD_RegWriteStatusRead>

00101780 <nRFAPI_SetRxMode>:
  101780:	e31000ff 	tst	r0, #255	; 0xff
  101784:	03a0103a 	moveq	r1, #58	; 0x3a
  101788:	13a0103b 	movne	r1, #59	; 0x3b
  10178c:	e3a00020 	mov	r0, #32	; 0x20
  101790:	ea000192 	b	101de0 <nRFCMD_RegWriteStatusRead>

00101794 <nRFAPI_GetFifoStatus>:
  101794:	e52de004 	str	lr, [sp, #-4]!
  101798:	e3a00017 	mov	r0, #23	; 0x17
  10179c:	eb00019b 	bl	101e10 <nRFCMD_RegRead>
  1017a0:	e49df004 	ldr	pc, [sp], #4

001017a4 <nRFAPI_GetSizeMac>:
  1017a4:	e52de004 	str	lr, [sp, #-4]!
  1017a8:	e3a00003 	mov	r0, #3	; 0x3
  1017ac:	eb000197 	bl	101e10 <nRFCMD_RegRead>
  1017b0:	e2100003 	ands	r0, r0, #3	; 0x3
  1017b4:	e1a03000 	mov	r3, r0
  1017b8:	12803002 	addne	r3, r0, #2	; 0x2
  1017bc:	e1a00003 	mov	r0, r3
  1017c0:	e49df004 	ldr	pc, [sp], #4

001017c4 <nRFAPI_FlushTX>:
  1017c4:	e3a000e1 	mov	r0, #225	; 0xe1
  1017c8:	ea00019e 	b	101e48 <nRFCMD_CmdExec>

001017cc <nRFAPI_FlushRX>:
  1017cc:	e3a000e2 	mov	r0, #226	; 0xe2
  1017d0:	ea00019c 	b	101e48 <nRFCMD_CmdExec>

001017d4 <nRFAPI_GetStatus>:
  1017d4:	e52de004 	str	lr, [sp, #-4]!
  1017d8:	e3a000ff 	mov	r0, #255	; 0xff
  1017dc:	eb000199 	bl	101e48 <nRFCMD_CmdExec>
  1017e0:	e49df004 	ldr	pc, [sp], #4

001017e4 <nRFAPI_GetTxMAC>:
  1017e4:	e20110ff 	and	r1, r1, #255	; 0xff
  1017e8:	e1a02001 	mov	r2, r1
  1017ec:	e2411003 	sub	r1, r1, #3	; 0x3
  1017f0:	e3510002 	cmp	r1, #2	; 0x2
  1017f4:	e1a01000 	mov	r1, r0
  1017f8:	e3a00010 	mov	r0, #16	; 0x10
  1017fc:	812fff1e 	bxhi	lr
  101800:	ea000153 	b	101d54 <nRFCMD_RegReadBuf>

00101804 <nRFAPI_SetRxMAC>:
  101804:	e1a03002 	mov	r3, r2
  101808:	e92d4010 	stmdb	sp!, {r4, lr}
  10180c:	e201e0ff 	and	lr, r1, #255	; 0xff
  101810:	e20340ff 	and	r4, r3, #255	; 0xff
  101814:	e3540001 	cmp	r4, #1	; 0x1
  101818:	83a03000 	movhi	r3, #0	; 0x0
  10181c:	93a03001 	movls	r3, #1	; 0x1
  101820:	e284c00a 	add	ip, r4, #10	; 0xa
  101824:	e35e0002 	cmp	lr, #2	; 0x2
  101828:	e38cc020 	orr	ip, ip, #32	; 0x20
  10182c:	93a03000 	movls	r3, #0	; 0x0
  101830:	e20cc0ff 	and	ip, ip, #255	; 0xff
  101834:	e3530000 	cmp	r3, #0	; 0x0
  101838:	e1a01000 	mov	r1, r0
  10183c:	e1a0200e 	mov	r2, lr
  101840:	e1a0000c 	mov	r0, ip
  101844:	0a000001 	beq	101850 <nRFAPI_SetRxMAC+0x4c>
  101848:	e35e0005 	cmp	lr, #5	; 0x5
  10184c:	9a000008 	bls	101874 <nRFAPI_SetRxMAC+0x70>
  101850:	e35e0001 	cmp	lr, #1	; 0x1
  101854:	13a03000 	movne	r3, #0	; 0x0
  101858:	03a03001 	moveq	r3, #1	; 0x1
  10185c:	e3540001 	cmp	r4, #1	; 0x1
  101860:	93a03000 	movls	r3, #0	; 0x0
  101864:	e3530000 	cmp	r3, #0	; 0x0
  101868:	08bd8010 	ldmeqia	sp!, {r4, pc}
  10186c:	e3540005 	cmp	r4, #5	; 0x5
  101870:	88bd8010 	ldmhiia	sp!, {r4, pc}
  101874:	e8bd4010 	ldmia	sp!, {r4, lr}
  101878:	ea000147 	b	101d9c <nRFCMD_RegWriteBuf>

0010187c <nRFAPI_SetTxMAC>:
  10187c:	e20110ff 	and	r1, r1, #255	; 0xff
  101880:	e1a02001 	mov	r2, r1
  101884:	e2411003 	sub	r1, r1, #3	; 0x3
  101888:	e3510002 	cmp	r1, #2	; 0x2
  10188c:	e1a01000 	mov	r1, r0
  101890:	e3a00030 	mov	r0, #48	; 0x30
  101894:	812fff1e 	bxhi	lr
  101898:	ea00013f 	b	101d9c <nRFCMD_RegWriteBuf>

0010189c <nRFAPI_DetectChip>:
  10189c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  1018a0:	e24dd008 	sub	sp, sp, #8	; 0x8
  1018a4:	ebffffca 	bl	1017d4 <nRFAPI_GetStatus>
  1018a8:	e3a00003 	mov	r0, #3	; 0x3
  1018ac:	ebffff93 	bl	101700 <nRFAPI_SetSizeMac>
  1018b0:	ebffffbb 	bl	1017a4 <nRFAPI_GetSizeMac>
  1018b4:	e3500003 	cmp	r0, #3	; 0x3
  1018b8:	0a000002 	beq	1018c8 <nRFAPI_DetectChip+0x2c>
  1018bc:	e3a00000 	mov	r0, #0	; 0x0
  1018c0:	e28dd008 	add	sp, sp, #8	; 0x8
  1018c4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  1018c8:	e2800002 	add	r0, r0, #2	; 0x2
  1018cc:	ebffff8b 	bl	101700 <nRFAPI_SetSizeMac>
  1018d0:	ebffffb3 	bl	1017a4 <nRFAPI_GetSizeMac>
  1018d4:	e3500005 	cmp	r0, #5	; 0x5
  1018d8:	e1a04000 	mov	r4, r0
  1018dc:	1afffff6 	bne	1018bc <nRFAPI_DetectChip+0x20>
  1018e0:	e59f6054 	ldr	r6, [pc, #84]	; 10193c <prog+0x18f8>
  1018e4:	e1a01000 	mov	r1, r0
  1018e8:	e28d5003 	add	r5, sp, #3	; 0x3
  1018ec:	e1a00006 	mov	r0, r6
  1018f0:	ebffffe1 	bl	10187c <nRFAPI_SetTxMAC>
  1018f4:	e1a01004 	mov	r1, r4
  1018f8:	e1a00005 	mov	r0, r5
  1018fc:	e2444005 	sub	r4, r4, #5	; 0x5
  101900:	e5cd4003 	strb	r4, [sp, #3]
  101904:	e5cd4004 	strb	r4, [sp, #4]
  101908:	e5cd4005 	strb	r4, [sp, #5]
  10190c:	e5cd4006 	strb	r4, [sp, #6]
  101910:	e5cd4007 	strb	r4, [sp, #7]
  101914:	ebffffb2 	bl	1017e4 <nRFAPI_GetTxMAC>
  101918:	e7d42005 	ldrb	r2, [r4, r5]
  10191c:	e7d43006 	ldrb	r3, [r4, r6]
  101920:	e1520003 	cmp	r2, r3
  101924:	e2844001 	add	r4, r4, #1	; 0x1
  101928:	1affffe3 	bne	1018bc <nRFAPI_DetectChip+0x20>
  10192c:	e3540005 	cmp	r4, #5	; 0x5
  101930:	1afffff8 	bne	101918 <nRFAPI_DetectChip+0x7c>
  101934:	e3a00001 	mov	r0, #1	; 0x1
  101938:	eaffffe0 	b	1018c0 <nRFAPI_DetectChip+0x24>
  10193c:	00104ac8 	andeqs	r4, r0, r8, asr #21

00101940 <nRFAPI_Init>:
  101940:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  101944:	e20240ff 	and	r4, r2, #255	; 0xff
  101948:	e20370ff 	and	r7, r3, #255	; 0xff
  10194c:	e1a05001 	mov	r5, r1
  101950:	e20060ff 	and	r6, r0, #255	; 0xff
  101954:	eb000037 	bl	101a38 <nRFCMD_Init>
  101958:	e2443003 	sub	r3, r4, #3	; 0x3
  10195c:	e3530002 	cmp	r3, #2	; 0x2
  101960:	9a000001 	bls	10196c <nRFAPI_Init+0x2c>
  101964:	e3a00000 	mov	r0, #0	; 0x0
  101968:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10196c:	ebffffca 	bl	10189c <nRFAPI_DetectChip>
  101970:	e3500000 	cmp	r0, #0	; 0x0
  101974:	0afffffa 	beq	101964 <nRFAPI_Init+0x24>
  101978:	e1a00004 	mov	r0, r4
  10197c:	ebffff5f 	bl	101700 <nRFAPI_SetSizeMac>
  101980:	e1a01004 	mov	r1, r4
  101984:	e1a00005 	mov	r0, r5
  101988:	ebffffbb 	bl	10187c <nRFAPI_SetTxMAC>
  10198c:	e1a01004 	mov	r1, r4
  101990:	e3a02000 	mov	r2, #0	; 0x0
  101994:	e1a00005 	mov	r0, r5
  101998:	ebffff99 	bl	101804 <nRFAPI_SetRxMAC>
  10199c:	e3a00001 	mov	r0, #1	; 0x1
  1019a0:	ebffff65 	bl	10173c <nRFAPI_PipesEnable>
  1019a4:	e3a00000 	mov	r0, #0	; 0x0
  1019a8:	ebffff60 	bl	101730 <nRFAPI_PipesAck>
  1019ac:	e3a04000 	mov	r4, #0	; 0x0
  1019b0:	e1a00004 	mov	r0, r4
  1019b4:	e3a01002 	mov	r1, #2	; 0x2
  1019b8:	e2844001 	add	r4, r4, #1	; 0x1
  1019bc:	ebffff3f 	bl	1016c0 <nRFAPI_SetPipeSizeRX>
  1019c0:	e3540006 	cmp	r4, #6	; 0x6
  1019c4:	1afffff9 	bne	1019b0 <nRFAPI_Init+0x70>
  1019c8:	e3a00000 	mov	r0, #0	; 0x0
  1019cc:	ebffff5d 	bl	101748 <nRFAPI_TxRetries>
  1019d0:	e1a00006 	mov	r0, r6
  1019d4:	ebffff46 	bl	1016f4 <nRFAPI_SetChannel>
  1019d8:	e3a00003 	mov	r0, #3	; 0x3
  1019dc:	ebffff5f 	bl	101760 <nRFAPI_SetTxPower>
  1019e0:	ebffff79 	bl	1017cc <nRFAPI_FlushRX>
  1019e4:	ebffff76 	bl	1017c4 <nRFAPI_FlushTX>
  1019e8:	e3a00000 	mov	r0, #0	; 0x0
  1019ec:	ebffff63 	bl	101780 <nRFAPI_SetRxMode>
  1019f0:	e3570000 	cmp	r7, #0	; 0x0
  1019f4:	1a000001 	bne	101a00 <nRFAPI_Init+0xc0>
  1019f8:	e3a00001 	mov	r0, #1	; 0x1
  1019fc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  101a00:	e1a00007 	mov	r0, r7
  101a04:	ebffff18 	bl	10166c <nRFAPI_SetFeatures>
  101a08:	e3a00001 	mov	r0, #1	; 0x1
  101a0c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00101a10 <nRFCMD_WaitRx>:
  101a10:	e59f301c 	ldr	r3, [pc, #28]	; 101a34 <prog+0x19f0>
  101a14:	e3a01000 	mov	r1, #0	; 0x0
  101a18:	e1a02000 	mov	r2, r0
  101a1c:	e52de004 	str	lr, [sp, #-4]!
  101a20:	e5930000 	ldr	r0, [r3]
  101a24:	e1a03001 	mov	r3, r1
  101a28:	eb0002bd 	bl	102524 <xQueueGenericReceive>
  101a2c:	e20000ff 	and	r0, r0, #255	; 0xff
  101a30:	e49df004 	ldr	pc, [sp], #4
  101a34:	00200c14 	eoreq	r0, r0, r4, lsl ip

00101a38 <nRFCMD_Init>:
  101a38:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  101a3c:	e59f3154 	ldr	r3, [pc, #340]	; 101b98 <prog+0x1b54>
  101a40:	e59f2154 	ldr	r2, [pc, #340]	; 101b9c <prog+0x1b58>
  101a44:	e3a05000 	mov	r5, #0	; 0x0
  101a48:	e1a01005 	mov	r1, r5
  101a4c:	e5835000 	str	r5, [r3]
  101a50:	e5825000 	str	r5, [r2]
  101a54:	e24dd004 	sub	sp, sp, #4	; 0x4
  101a58:	e3a00001 	mov	r0, #1	; 0x1
  101a5c:	eb000370 	bl	102824 <xQueueCreate>
  101a60:	e59f6138 	ldr	r6, [pc, #312]	; 101ba0 <prog+0x1b5c>
  101a64:	e1500005 	cmp	r0, r5
  101a68:	e59f4134 	ldr	r4, [pc, #308]	; 101ba4 <prog+0x1b60>
  101a6c:	e1a02005 	mov	r2, r5
  101a70:	e1a03005 	mov	r3, r5
  101a74:	e1a01005 	mov	r1, r5
  101a78:	e5860000 	str	r0, [r6]
  101a7c:	1b00030e 	blne	1026bc <xQueueGenericSend>
  101a80:	e1a01005 	mov	r1, r5
  101a84:	e3a00001 	mov	r0, #1	; 0x1
  101a88:	eb000365 	bl	102824 <xQueueCreate>
  101a8c:	e3500000 	cmp	r0, #0	; 0x0
  101a90:	e1a01005 	mov	r1, r5
  101a94:	e1a02005 	mov	r2, r5
  101a98:	e1a03005 	mov	r3, r5
  101a9c:	e5840000 	str	r0, [r4]
  101aa0:	1b000305 	blne	1026bc <xQueueGenericSend>
  101aa4:	e5960000 	ldr	r0, [r6]
  101aa8:	e3500000 	cmp	r0, #0	; 0x0
  101aac:	0a000037 	beq	101b90 <nRFCMD_Init+0x158>
  101ab0:	e594c000 	ldr	ip, [r4]
  101ab4:	e35c0000 	cmp	ip, #0	; 0x0
  101ab8:	e1a01005 	mov	r1, r5
  101abc:	e1a02005 	mov	r2, r5
  101ac0:	e1a03005 	mov	r3, r5
  101ac4:	e3e06c0b 	mvn	r6, #2816	; 0xb00
  101ac8:	e3a08020 	mov	r8, #32	; 0x20
  101acc:	e3a0a702 	mov	sl, #524288	; 0x80000
  101ad0:	e3e07b7f 	mvn	r7, #130048	; 0x1fc00
  101ad4:	0a00002d 	beq	101b90 <nRFCMD_Init+0x158>
  101ad8:	eb000291 	bl	102524 <xQueueGenericReceive>
  101adc:	e5940000 	ldr	r0, [r4]
  101ae0:	e1a01005 	mov	r1, r5
  101ae4:	e1a02005 	mov	r2, r5
  101ae8:	e1a03005 	mov	r3, r5
  101aec:	eb00028c 	bl	102524 <xQueueGenericReceive>
  101af0:	e3a02402 	mov	r2, #33554432	; 0x2000000
  101af4:	e3a01b1e 	mov	r1, #30720	; 0x7800
  101af8:	e3e03c03 	mvn	r3, #768	; 0x300
  101afc:	e50380ef 	str	r8, [r3, #-239]
  101b00:	e506108f 	str	r1, [r6, #-143]
  101b04:	e506508b 	str	r5, [r6, #-139]
  101b08:	e50610fb 	str	r1, [r6, #-251]
  101b0c:	e506a0eb 	str	sl, [r6, #-235]
  101b10:	e506a0ff 	str	sl, [r6, #-255]
  101b14:	e50620cb 	str	r2, [r6, #-203]
  101b18:	e50620ff 	str	r2, [r6, #-255]
  101b1c:	e50620ef 	str	r2, [r6, #-239]
  101b20:	eb0006bb 	bl	103614 <vPortEnterCritical>
  101b24:	e3a0cc06 	mov	ip, #1536	; 0x600
  101b28:	e28cc002 	add	ip, ip, #2	; 0x2
  101b2c:	e3a04001 	mov	r4, #1	; 0x1
  101b30:	e50743fb 	str	r4, [r7, #-1019]
  101b34:	e3a01004 	mov	r1, #4	; 0x4
  101b38:	e507c3cf 	str	ip, [r7, #-975]
  101b3c:	e1a02008 	mov	r2, r8
  101b40:	e59f3060 	ldr	r3, [pc, #96]	; 101ba8 <prog+0x1b64>
  101b44:	e3a00005 	mov	r0, #5	; 0x5
  101b48:	e50743ff 	str	r4, [r7, #-1023]
  101b4c:	eb000163 	bl	1020e0 <AT91F_AIC_ConfigureIt>
  101b50:	e3a01003 	mov	r1, #3	; 0x3
  101b54:	e3a02040 	mov	r2, #64	; 0x40
  101b58:	e59f304c 	ldr	r3, [pc, #76]	; 101bac <prog+0x1b68>
  101b5c:	e3a00002 	mov	r0, #2	; 0x2
  101b60:	e50783eb 	str	r8, [r7, #-1003]
  101b64:	eb00015d 	bl	1020e0 <AT91F_AIC_ConfigureIt>
  101b68:	e51630b3 	ldr	r3, [r6, #-179]
  101b6c:	e3a02024 	mov	r2, #36	; 0x24
  101b70:	e58d3000 	str	r3, [sp]
  101b74:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  101b78:	e506a0bf 	str	sl, [r6, #-191]
  101b7c:	e5832021 	str	r2, [r3, #33]
  101b80:	eb0006ae 	bl	103640 <vPortExitCritical>
  101b84:	e1a00005 	mov	r0, r5
  101b88:	e28dd004 	add	sp, sp, #4	; 0x4
  101b8c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101b90:	e3a00001 	mov	r0, #1	; 0x1
  101b94:	eafffffb 	b	101b88 <nRFCMD_Init+0x150>
  101b98:	002014fc 	streqd	r1, [r0], -ip
  101b9c:	002014f8 	streqd	r1, [r0], -r8
  101ba0:	00200c10 	eoreq	r0, r0, r0, lsl ip
  101ba4:	00200c14 	eoreq	r0, r0, r4, lsl ip
  101ba8:	00101fa0 	andeqs	r1, r0, r0, lsr #31
  101bac:	00101c28 	andeqs	r1, r0, r8, lsr #24

00101bb0 <nRFCMD_ISR_ACK_Handler>:
  101bb0:	e92d4010 	stmdb	sp!, {r4, lr}
  101bb4:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  101bb8:	e51230b3 	ldr	r3, [r2, #-179]
  101bbc:	e3130702 	tst	r3, #524288	; 0x80000
  101bc0:	e24dd004 	sub	sp, sp, #4	; 0x4
  101bc4:	0a000005 	beq	101be0 <nRFCMD_ISR_ACK_Handler+0x30>
  101bc8:	e51230c3 	ldr	r3, [r2, #-195]
  101bcc:	e2134702 	ands	r4, r3, #524288	; 0x80000
  101bd0:	e28dc004 	add	ip, sp, #4	; 0x4
  101bd4:	e1a01004 	mov	r1, r4
  101bd8:	e1a03004 	mov	r3, r4
  101bdc:	0a000004 	beq	101bf4 <nRFCMD_ISR_ACK_Handler+0x44>
  101be0:	e3a02000 	mov	r2, #0	; 0x0
  101be4:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  101be8:	e5832031 	str	r2, [r3, #49]
  101bec:	e28dd004 	add	sp, sp, #4	; 0x4
  101bf0:	e8bd8010 	ldmia	sp!, {r4, pc}
  101bf4:	e59f2028 	ldr	r2, [pc, #40]	; 101c24 <prog+0x1be0>
  101bf8:	e5920000 	ldr	r0, [r2]
  101bfc:	e1a0200d 	mov	r2, sp
  101c00:	e52c4004 	str	r4, [ip, #-4]!
  101c04:	eb0001e8 	bl	1023ac <xQueueGenericSendFromISR>
  101c08:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  101c0c:	e3500000 	cmp	r0, #0	; 0x0
  101c10:	e5834031 	str	r4, [r3, #49]
  101c14:	0afffff4 	beq	101bec <nRFCMD_ISR_ACK_Handler+0x3c>
  101c18:	e58d0000 	str	r0, [sp]
  101c1c:	eb000329 	bl	1028c8 <vTaskSwitchContext>
  101c20:	eafffff1 	b	101bec <nRFCMD_ISR_ACK_Handler+0x3c>
  101c24:	00200c14 	eoreq	r0, r0, r4, lsl ip

00101c28 <nRFCMD_ISR_ACK>:
  101c28:	e92d0001 	stmdb	sp!, {r0}
  101c2c:	e94d2000 	stmdb	sp, {sp}^
  101c30:	e1a00000 	nop			(mov r0,r0)
  101c34:	e24dd004 	sub	sp, sp, #4	; 0x4
  101c38:	e8bd0001 	ldmia	sp!, {r0}
  101c3c:	e9204000 	stmdb	r0!, {lr}
  101c40:	e1a0e000 	mov	lr, r0
  101c44:	e8bd0001 	ldmia	sp!, {r0}
  101c48:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  101c4c:	e1a00000 	nop			(mov r0,r0)
  101c50:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  101c54:	e14f0000 	mrs	r0, SPSR
  101c58:	e92e0001 	stmdb	lr!, {r0}
  101c5c:	e59f0064 	ldr	r0, [pc, #100]	; 101cc8 <prog+0x1c84>
  101c60:	e5900000 	ldr	r0, [r0]
  101c64:	e92e0001 	stmdb	lr!, {r0}
  101c68:	e59f005c 	ldr	r0, [pc, #92]	; 101ccc <prog+0x1c88>
  101c6c:	e5900000 	ldr	r0, [r0]
  101c70:	e580e000 	str	lr, [r0]
  101c74:	e59f4044 	ldr	r4, [pc, #68]	; 101cc0 <prog+0x1c7c>
  101c78:	e59f5044 	ldr	r5, [pc, #68]	; 101cc4 <prog+0x1c80>
  101c7c:	e5943000 	ldr	r3, [r4]
  101c80:	e5952000 	ldr	r2, [r5]
  101c84:	ebffffc9 	bl	101bb0 <nRFCMD_ISR_ACK_Handler>
  101c88:	e59f003c 	ldr	r0, [pc, #60]	; 101ccc <prog+0x1c88>
  101c8c:	e5900000 	ldr	r0, [r0]
  101c90:	e590e000 	ldr	lr, [r0]
  101c94:	e59f002c 	ldr	r0, [pc, #44]	; 101cc8 <prog+0x1c84>
  101c98:	e8be0002 	ldmia	lr!, {r1}
  101c9c:	e5801000 	str	r1, [r0]
  101ca0:	e8be0001 	ldmia	lr!, {r0}
  101ca4:	e169f000 	msr	SPSR_fc, r0
  101ca8:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  101cac:	e1a00000 	nop			(mov r0,r0)
  101cb0:	e59ee03c 	ldr	lr, [lr, #60]
  101cb4:	e25ef004 	subs	pc, lr, #4	; 0x4
  101cb8:	e5943000 	ldr	r3, [r4]
  101cbc:	e5952000 	ldr	r2, [r5]
  101cc0:	00200820 	eoreq	r0, r0, r0, lsr #16
  101cc4:	00200c18 	eoreq	r0, r0, r8, lsl ip
  101cc8:	00200820 	eoreq	r0, r0, r0, lsr #16
  101ccc:	00200c18 	eoreq	r0, r0, r8, lsl ip

00101cd0 <nRFCMD_ReadWriteBuffer>:
  101cd0:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  101cd4:	e3a044ff 	mov	r4, #-16777216	; 0xff000000
  101cd8:	e28448fe 	add	r4, r4, #16646144	; 0xfe0000
  101cdc:	e3a05000 	mov	r5, #0	; 0x0
  101ce0:	e2846c01 	add	r6, r4, #256	; 0x100
  101ce4:	e24dd004 	sub	sp, sp, #4	; 0x4
  101ce8:	e1a07000 	mov	r7, r0
  101cec:	e1a08002 	mov	r8, r2
  101cf0:	e1a03005 	mov	r3, r5
  101cf4:	e1a00006 	mov	r0, r6
  101cf8:	e58d5000 	str	r5, [sp]
  101cfc:	eb000117 	bl	102160 <AT91F_PDC_ReceiveFrame>
  101d00:	e1a01007 	mov	r1, r7
  101d04:	e1a02008 	mov	r2, r8
  101d08:	e1a03005 	mov	r3, r5
  101d0c:	e1a00006 	mov	r0, r6
  101d10:	e58d5000 	str	r5, [sp]
  101d14:	eb0000ff 	bl	102118 <AT91F_PDC_SendFrame>
  101d18:	e59f3030 	ldr	r3, [pc, #48]	; 101d50 <prog+0x1d0c>
  101d1c:	e3a0cc01 	mov	ip, #256	; 0x100
  101d20:	e28cc001 	add	ip, ip, #1	; 0x1
  101d24:	e1844ba4 	orr	r4, r4, r4, lsr #23
  101d28:	e1a01005 	mov	r1, r5
  101d2c:	e5930000 	ldr	r0, [r3]
  101d30:	e3a02064 	mov	r2, #100	; 0x64
  101d34:	e1a03005 	mov	r3, r5
  101d38:	e504c0df 	str	ip, [r4, #-223]
  101d3c:	eb0001f8 	bl	102524 <xQueueGenericReceive>
  101d40:	e2500001 	subs	r0, r0, #1	; 0x1
  101d44:	13a00001 	movne	r0, #1	; 0x1
  101d48:	e28dd004 	add	sp, sp, #4	; 0x4
  101d4c:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  101d50:	00200c10 	eoreq	r0, r0, r0, lsl ip

00101d54 <nRFCMD_RegReadBuf>:
  101d54:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101d58:	e59f3034 	ldr	r3, [pc, #52]	; 101d94 <prog+0x1d50>
  101d5c:	e59f5034 	ldr	r5, [pc, #52]	; 101d98 <prog+0x1d54>
  101d60:	e20240ff 	and	r4, r2, #255	; 0xff
  101d64:	e5c30000 	strb	r0, [r3]
  101d68:	e1a06001 	mov	r6, r1
  101d6c:	e1a00003 	mov	r0, r3
  101d70:	e1a01005 	mov	r1, r5
  101d74:	e2842002 	add	r2, r4, #2	; 0x2
  101d78:	ebffffd4 	bl	101cd0 <nRFCMD_ReadWriteBuffer>
  101d7c:	e1a00006 	mov	r0, r6
  101d80:	e1a02004 	mov	r2, r4
  101d84:	e2851001 	add	r1, r5, #1	; 0x1
  101d88:	ebfffb18 	bl	1009f0 <memcpy>
  101d8c:	e5d50000 	ldrb	r0, [r5]
  101d90:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101d94:	00200bcc 	eoreq	r0, r0, ip, asr #23
  101d98:	00200bed 	eoreq	r0, r0, sp, ror #23

00101d9c <nRFCMD_RegWriteBuf>:
  101d9c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101da0:	e59f6030 	ldr	r6, [pc, #48]	; 101dd8 <prog+0x1d94>
  101da4:	e1a03006 	mov	r3, r6
  101da8:	e4c30001 	strb	r0, [r3], #1
  101dac:	e20240ff 	and	r4, r2, #255	; 0xff
  101db0:	e59f5024 	ldr	r5, [pc, #36]	; 101ddc <prog+0x1d98>
  101db4:	e1a00003 	mov	r0, r3
  101db8:	e1a02004 	mov	r2, r4
  101dbc:	ebfffb0b 	bl	1009f0 <memcpy>
  101dc0:	e1a00006 	mov	r0, r6
  101dc4:	e2842001 	add	r2, r4, #1	; 0x1
  101dc8:	e1a01005 	mov	r1, r5
  101dcc:	ebffffbf 	bl	101cd0 <nRFCMD_ReadWriteBuffer>
  101dd0:	e5d50000 	ldrb	r0, [r5]
  101dd4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101dd8:	00200bcc 	eoreq	r0, r0, ip, asr #23
  101ddc:	00200bed 	eoreq	r0, r0, sp, ror #23

00101de0 <nRFCMD_RegWriteStatusRead>:
  101de0:	e92d4010 	stmdb	sp!, {r4, lr}
  101de4:	e59f401c 	ldr	r4, [pc, #28]	; 101e08 <prog+0x1dc4>
  101de8:	e3a02002 	mov	r2, #2	; 0x2
  101dec:	e5c40000 	strb	r0, [r4]
  101df0:	e5c41001 	strb	r1, [r4, #1]
  101df4:	e1a00004 	mov	r0, r4
  101df8:	e59f100c 	ldr	r1, [pc, #12]	; 101e0c <prog+0x1dc8>
  101dfc:	ebffffb3 	bl	101cd0 <nRFCMD_ReadWriteBuffer>
  101e00:	e5d40000 	ldrb	r0, [r4]
  101e04:	e8bd8010 	ldmia	sp!, {r4, pc}
  101e08:	00200bcc 	eoreq	r0, r0, ip, asr #23
  101e0c:	00200bed 	eoreq	r0, r0, sp, ror #23

00101e10 <nRFCMD_RegRead>:
  101e10:	e92d4010 	stmdb	sp!, {r4, lr}
  101e14:	e59f3024 	ldr	r3, [pc, #36]	; 101e40 <prog+0x1dfc>
  101e18:	e59f4024 	ldr	r4, [pc, #36]	; 101e44 <prog+0x1e00>
  101e1c:	e3a0c000 	mov	ip, #0	; 0x0
  101e20:	e5c30000 	strb	r0, [r3]
  101e24:	e1a01004 	mov	r1, r4
  101e28:	e1a00003 	mov	r0, r3
  101e2c:	e3a02002 	mov	r2, #2	; 0x2
  101e30:	e5c3c001 	strb	ip, [r3, #1]
  101e34:	ebffffa5 	bl	101cd0 <nRFCMD_ReadWriteBuffer>
  101e38:	e5d40001 	ldrb	r0, [r4, #1]
  101e3c:	e8bd8010 	ldmia	sp!, {r4, pc}
  101e40:	00200bcc 	eoreq	r0, r0, ip, asr #23
  101e44:	00200bed 	eoreq	r0, r0, sp, ror #23

00101e48 <nRFCMD_CmdExec>:
  101e48:	e52de004 	str	lr, [sp, #-4]!
  101e4c:	e24dd004 	sub	sp, sp, #4	; 0x4
  101e50:	e28d3004 	add	r3, sp, #4	; 0x4
  101e54:	e5630001 	strb	r0, [r3, #-1]!
  101e58:	e28d1002 	add	r1, sp, #2	; 0x2
  101e5c:	e1a00003 	mov	r0, r3
  101e60:	e3a02001 	mov	r2, #1	; 0x1
  101e64:	ebffff99 	bl	101cd0 <nRFCMD_ReadWriteBuffer>
  101e68:	e5dd0002 	ldrb	r0, [sp, #2]
  101e6c:	e28dd004 	add	sp, sp, #4	; 0x4
  101e70:	e8bd8000 	ldmia	sp!, {pc}

00101e74 <nRFCMD_CE>:
  101e74:	e31000ff 	tst	r0, #255	; 0xff
  101e78:	13a02402 	movne	r2, #33554432	; 0x2000000
  101e7c:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  101e80:	03a02402 	moveq	r2, #33554432	; 0x2000000
  101e84:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  101e88:	150320cf 	strne	r2, [r3, #-207]
  101e8c:	050320cb 	streq	r2, [r3, #-203]
  101e90:	e12fff1e 	bx	lr

00101e94 <nRFCMD_ProcessNextMacro>:
  101e94:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101e98:	e59f5080 	ldr	r5, [pc, #128]	; 101f20 <prog+0x1edc>
  101e9c:	e5952000 	ldr	r2, [r5]
  101ea0:	e3520000 	cmp	r2, #0	; 0x0
  101ea4:	e24dd004 	sub	sp, sp, #4	; 0x4
  101ea8:	e3a0c001 	mov	ip, #1	; 0x1
  101eac:	0a00000b 	beq	101ee0 <nRFCMD_ProcessNextMacro+0x4c>
  101eb0:	e5d24000 	ldrb	r4, [r2]
  101eb4:	e3a06000 	mov	r6, #0	; 0x0
  101eb8:	e3a004ff 	mov	r0, #-16777216	; 0xff000000
  101ebc:	e28008fe 	add	r0, r0, #16646144	; 0xfe0000
  101ec0:	e1540006 	cmp	r4, r6
  101ec4:	e2821001 	add	r1, r2, #1	; 0x1
  101ec8:	e2800c01 	add	r0, r0, #256	; 0x100
  101ecc:	e1a03006 	mov	r3, r6
  101ed0:	e1a02004 	mov	r2, r4
  101ed4:	e3a0c001 	mov	ip, #1	; 0x1
  101ed8:	05854000 	streq	r4, [r5]
  101edc:	1a000002 	bne	101eec <nRFCMD_ProcessNextMacro+0x58>
  101ee0:	e1a0000c 	mov	r0, ip
  101ee4:	e28dd004 	add	sp, sp, #4	; 0x4
  101ee8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101eec:	e58d6000 	str	r6, [sp]
  101ef0:	eb000088 	bl	102118 <AT91F_PDC_SendFrame>
  101ef4:	e5953000 	ldr	r3, [r5]
  101ef8:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
  101efc:	e0843003 	add	r3, r4, r3
  101f00:	e1a02742 	mov	r2, r2, asr #14
  101f04:	e2833001 	add	r3, r3, #1	; 0x1
  101f08:	e1822ba2 	orr	r2, r2, r2, lsr #23
  101f0c:	e3a01c01 	mov	r1, #256	; 0x100
  101f10:	e1a0c006 	mov	ip, r6
  101f14:	e5853000 	str	r3, [r5]
  101f18:	e50210df 	str	r1, [r2, #-223]
  101f1c:	eaffffef 	b	101ee0 <nRFCMD_ProcessNextMacro+0x4c>
  101f20:	002014f8 	streqd	r1, [r0], -r8

00101f24 <nRFCMD_ISR_DMA_Handler>:
  101f24:	e92d4010 	stmdb	sp!, {r4, lr}
  101f28:	e3e02b7f 	mvn	r2, #130048	; 0x1fc00
  101f2c:	e51233ef 	ldr	r3, [r2, #-1007]
  101f30:	e2132020 	ands	r2, r3, #32	; 0x20
  101f34:	03e03c0f 	mvneq	r3, #3840	; 0xf00
  101f38:	e24dd004 	sub	sp, sp, #4	; 0x4
  101f3c:	e3a04000 	mov	r4, #0	; 0x0
  101f40:	05832031 	streq	r2, [r3, #49]
  101f44:	1a000001 	bne	101f50 <nRFCMD_ISR_DMA_Handler+0x2c>
  101f48:	e28dd004 	add	sp, sp, #4	; 0x4
  101f4c:	e8bd8010 	ldmia	sp!, {r4, pc}
  101f50:	e58d4000 	str	r4, [sp]
  101f54:	ebffffce 	bl	101e94 <nRFCMD_ProcessNextMacro>
  101f58:	e1500004 	cmp	r0, r4
  101f5c:	e1a01004 	mov	r1, r4
  101f60:	e1a0200d 	mov	r2, sp
  101f64:	e1a03004 	mov	r3, r4
  101f68:	1a000006 	bne	101f88 <nRFCMD_ISR_DMA_Handler+0x64>
  101f6c:	e59d3000 	ldr	r3, [sp]
  101f70:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  101f74:	e3530000 	cmp	r3, #0	; 0x0
  101f78:	e5824031 	str	r4, [r2, #49]
  101f7c:	0afffff1 	beq	101f48 <nRFCMD_ISR_DMA_Handler+0x24>
  101f80:	eb000250 	bl	1028c8 <vTaskSwitchContext>
  101f84:	eaffffef 	b	101f48 <nRFCMD_ISR_DMA_Handler+0x24>
  101f88:	e59fc00c 	ldr	ip, [pc, #12]	; 101f9c <prog+0x1f58>
  101f8c:	e59c0000 	ldr	r0, [ip]
  101f90:	eb000105 	bl	1023ac <xQueueGenericSendFromISR>
  101f94:	e58d0000 	str	r0, [sp]
  101f98:	eafffff3 	b	101f6c <nRFCMD_ISR_DMA_Handler+0x48>
  101f9c:	00200c10 	eoreq	r0, r0, r0, lsl ip

00101fa0 <nRFCMD_ISR_DMA>:
  101fa0:	e92d0001 	stmdb	sp!, {r0}
  101fa4:	e94d2000 	stmdb	sp, {sp}^
  101fa8:	e1a00000 	nop			(mov r0,r0)
  101fac:	e24dd004 	sub	sp, sp, #4	; 0x4
  101fb0:	e8bd0001 	ldmia	sp!, {r0}
  101fb4:	e9204000 	stmdb	r0!, {lr}
  101fb8:	e1a0e000 	mov	lr, r0
  101fbc:	e8bd0001 	ldmia	sp!, {r0}
  101fc0:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  101fc4:	e1a00000 	nop			(mov r0,r0)
  101fc8:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  101fcc:	e14f0000 	mrs	r0, SPSR
  101fd0:	e92e0001 	stmdb	lr!, {r0}
  101fd4:	e59f0064 	ldr	r0, [pc, #100]	; 102040 <prog+0x1ffc>
  101fd8:	e5900000 	ldr	r0, [r0]
  101fdc:	e92e0001 	stmdb	lr!, {r0}
  101fe0:	e59f005c 	ldr	r0, [pc, #92]	; 102044 <prog+0x2000>
  101fe4:	e5900000 	ldr	r0, [r0]
  101fe8:	e580e000 	str	lr, [r0]
  101fec:	e59f4044 	ldr	r4, [pc, #68]	; 102038 <prog+0x1ff4>
  101ff0:	e59f5044 	ldr	r5, [pc, #68]	; 10203c <prog+0x1ff8>
  101ff4:	e5943000 	ldr	r3, [r4]
  101ff8:	e5952000 	ldr	r2, [r5]
  101ffc:	ebffffc8 	bl	101f24 <nRFCMD_ISR_DMA_Handler>
  102000:	e59f003c 	ldr	r0, [pc, #60]	; 102044 <prog+0x2000>
  102004:	e5900000 	ldr	r0, [r0]
  102008:	e590e000 	ldr	lr, [r0]
  10200c:	e59f002c 	ldr	r0, [pc, #44]	; 102040 <prog+0x1ffc>
  102010:	e8be0002 	ldmia	lr!, {r1}
  102014:	e5801000 	str	r1, [r0]
  102018:	e8be0001 	ldmia	lr!, {r0}
  10201c:	e169f000 	msr	SPSR_fc, r0
  102020:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  102024:	e1a00000 	nop			(mov r0,r0)
  102028:	e59ee03c 	ldr	lr, [lr, #60]
  10202c:	e25ef004 	subs	pc, lr, #4	; 0x4
  102030:	e5943000 	ldr	r3, [r4]
  102034:	e5952000 	ldr	r2, [r5]
  102038:	00200820 	eoreq	r0, r0, r0, lsr #16
  10203c:	00200c18 	eoreq	r0, r0, r8, lsl ip
  102040:	00200820 	eoreq	r0, r0, r0, lsr #16
  102044:	00200c18 	eoreq	r0, r0, r8, lsl ip

00102048 <AT91F_LowLevelInit>:
  102048:	e3a0184b 	mov	r1, #4915200	; 0x4b0000
  10204c:	e3a00502 	mov	r0, #8388608	; 0x800000
  102050:	e3a0cc06 	mov	ip, #1536	; 0x600
  102054:	e52de004 	str	lr, [sp, #-4]!
  102058:	e2811c01 	add	r1, r1, #256	; 0x100
  10205c:	e2800d82 	add	r0, r0, #8320	; 0x2080
  102060:	e28cc001 	add	ip, ip, #1	; 0x1
  102064:	e3e0ec03 	mvn	lr, #768	; 0x300
  102068:	e3e03000 	mvn	r3, #0	; 0x0
  10206c:	e3e02c02 	mvn	r2, #512	; 0x200
  102070:	e503109f 	str	r1, [r3, #-159]
  102074:	e50200bb 	str	r0, [r2, #-187]
  102078:	e50ec0df 	str	ip, [lr, #-223]
  10207c:	e51e3097 	ldr	r3, [lr, #-151]
  102080:	e3130001 	tst	r3, #1	; 0x1
  102084:	0afffffc 	beq	10207c <AT91F_LowLevelInit+0x34>
  102088:	e3a03819 	mov	r3, #1638400	; 0x190000
  10208c:	e2833b07 	add	r3, r3, #7168	; 0x1c00
  102090:	e2833005 	add	r3, r3, #5	; 0x5
  102094:	e50e30d3 	str	r3, [lr, #-211]
  102098:	e3e02c03 	mvn	r2, #768	; 0x300
  10209c:	e5123097 	ldr	r3, [r2, #-151]
  1020a0:	e3130004 	tst	r3, #4	; 0x4
  1020a4:	0afffffc 	beq	10209c <AT91F_LowLevelInit+0x54>
  1020a8:	e3a03004 	mov	r3, #4	; 0x4
  1020ac:	e50230cf 	str	r3, [r2, #-207]
  1020b0:	e3e02c03 	mvn	r2, #768	; 0x300
  1020b4:	e5123097 	ldr	r3, [r2, #-151]
  1020b8:	e3130008 	tst	r3, #8	; 0x8
  1020bc:	0afffffc 	beq	1020b4 <AT91F_LowLevelInit+0x6c>
  1020c0:	e51230cf 	ldr	r3, [r2, #-207]
  1020c4:	e3833003 	orr	r3, r3, #3	; 0x3
  1020c8:	e50230cf 	str	r3, [r2, #-207]
  1020cc:	e3e02c03 	mvn	r2, #768	; 0x300
  1020d0:	e5123097 	ldr	r3, [r2, #-151]
  1020d4:	e3130008 	tst	r3, #8	; 0x8
  1020d8:	0afffffc 	beq	1020d0 <AT91F_LowLevelInit+0x88>
  1020dc:	e49df004 	ldr	pc, [sp], #4

001020e0 <AT91F_AIC_ConfigureIt>:
  1020e0:	e92d4010 	stmdb	sp!, {r4, lr}
  1020e4:	e3a0e001 	mov	lr, #1	; 0x1
  1020e8:	e1a0e01e 	mov	lr, lr, lsl r0
  1020ec:	e1a0c100 	mov	ip, r0, lsl #2
  1020f0:	e51c0f80 	ldr	r0, [ip, #-3968]
  1020f4:	e1822001 	orr	r2, r2, r1
  1020f8:	e24c4a01 	sub	r4, ip, #4096	; 0x1000
  1020fc:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  102100:	e1a00003 	mov	r0, r3
  102104:	e581e025 	str	lr, [r1, #37]
  102108:	e50c3f80 	str	r3, [ip, #-3968]
  10210c:	e5842000 	str	r2, [r4]
  102110:	e581e029 	str	lr, [r1, #41]
  102114:	e8bd8010 	ldmia	sp!, {r4, pc}

00102118 <AT91F_PDC_SendFrame>:
  102118:	e1a0c000 	mov	ip, r0
  10211c:	e590000c 	ldr	r0, [r0, #12]
  102120:	e3500000 	cmp	r0, #0	; 0x0
  102124:	e3a00002 	mov	r0, #2	; 0x2
  102128:	1a000005 	bne	102144 <AT91F_PDC_SendFrame+0x2c>
  10212c:	e58c1008 	str	r1, [ip, #8]
  102130:	e58c200c 	str	r2, [ip, #12]
  102134:	e58c3018 	str	r3, [ip, #24]
  102138:	e59d3000 	ldr	r3, [sp]
  10213c:	e58c301c 	str	r3, [ip, #28]
  102140:	e12fff1e 	bx	lr
  102144:	e59c301c 	ldr	r3, [ip, #28]
  102148:	e3530000 	cmp	r3, #0	; 0x0
  10214c:	e3a00000 	mov	r0, #0	; 0x0
  102150:	03a00001 	moveq	r0, #1	; 0x1
  102154:	058c1018 	streq	r1, [ip, #24]
  102158:	058c201c 	streq	r2, [ip, #28]
  10215c:	e12fff1e 	bx	lr

00102160 <AT91F_PDC_ReceiveFrame>:
  102160:	e1a0c000 	mov	ip, r0
  102164:	e5900004 	ldr	r0, [r0, #4]
  102168:	e3500000 	cmp	r0, #0	; 0x0
  10216c:	e3a00002 	mov	r0, #2	; 0x2
  102170:	1a000005 	bne	10218c <AT91F_PDC_ReceiveFrame+0x2c>
  102174:	e58c1000 	str	r1, [ip]
  102178:	e58c2004 	str	r2, [ip, #4]
  10217c:	e58c3010 	str	r3, [ip, #16]
  102180:	e59d3000 	ldr	r3, [sp]
  102184:	e58c3014 	str	r3, [ip, #20]
  102188:	e12fff1e 	bx	lr
  10218c:	e59c3014 	ldr	r3, [ip, #20]
  102190:	e3530000 	cmp	r3, #0	; 0x0
  102194:	e3a00000 	mov	r0, #0	; 0x0
  102198:	03a00001 	moveq	r0, #1	; 0x1
  10219c:	058c1010 	streq	r1, [ip, #16]
  1021a0:	058c2014 	streq	r2, [ip, #20]
  1021a4:	e12fff1e 	bx	lr

001021a8 <vListInitialise>:
  1021a8:	e3e03000 	mvn	r3, #0	; 0x0
  1021ac:	e5803008 	str	r3, [r0, #8]
  1021b0:	e2802008 	add	r2, r0, #8	; 0x8
  1021b4:	e2833001 	add	r3, r3, #1	; 0x1
  1021b8:	e580200c 	str	r2, [r0, #12]
  1021bc:	e5802010 	str	r2, [r0, #16]
  1021c0:	e5802004 	str	r2, [r0, #4]
  1021c4:	e5803000 	str	r3, [r0]
  1021c8:	e12fff1e 	bx	lr

001021cc <vListInitialiseItem>:
  1021cc:	e3a03000 	mov	r3, #0	; 0x0
  1021d0:	e5803010 	str	r3, [r0, #16]
  1021d4:	e12fff1e 	bx	lr

001021d8 <vListInsertEnd>:
  1021d8:	e5902004 	ldr	r2, [r0, #4]
  1021dc:	e5923004 	ldr	r3, [r2, #4]
  1021e0:	e5813004 	str	r3, [r1, #4]
  1021e4:	e592c004 	ldr	ip, [r2, #4]
  1021e8:	e5812008 	str	r2, [r1, #8]
  1021ec:	e58c1008 	str	r1, [ip, #8]
  1021f0:	e5821004 	str	r1, [r2, #4]
  1021f4:	e5903000 	ldr	r3, [r0]
  1021f8:	e2833001 	add	r3, r3, #1	; 0x1
  1021fc:	e5803000 	str	r3, [r0]
  102200:	e5810010 	str	r0, [r1, #16]
  102204:	e5801004 	str	r1, [r0, #4]
  102208:	e12fff1e 	bx	lr

0010220c <vListInsert>:
  10220c:	e52de004 	str	lr, [sp, #-4]!
  102210:	e591e000 	ldr	lr, [r1]
  102214:	e37e0001 	cmn	lr, #1	; 0x1
  102218:	0590c010 	ldreq	ip, [r0, #16]
  10221c:	0a000009 	beq	102248 <vListInsert+0x3c>
  102220:	e280c008 	add	ip, r0, #8	; 0x8
  102224:	e59c3004 	ldr	r3, [ip, #4]
  102228:	e5932000 	ldr	r2, [r3]
  10222c:	e15e0002 	cmp	lr, r2
  102230:	3a000004 	bcc	102248 <vListInsert+0x3c>
  102234:	e59cc004 	ldr	ip, [ip, #4]
  102238:	e59c3004 	ldr	r3, [ip, #4]
  10223c:	e5932000 	ldr	r2, [r3]
  102240:	e15e0002 	cmp	lr, r2
  102244:	2afffffa 	bcs	102234 <vListInsert+0x28>
  102248:	e59c3004 	ldr	r3, [ip, #4]
  10224c:	e5831008 	str	r1, [r3, #8]
  102250:	e5813004 	str	r3, [r1, #4]
  102254:	e58c1004 	str	r1, [ip, #4]
  102258:	e5903000 	ldr	r3, [r0]
  10225c:	e2833001 	add	r3, r3, #1	; 0x1
  102260:	e5803000 	str	r3, [r0]
  102264:	e5810010 	str	r0, [r1, #16]
  102268:	e581c008 	str	ip, [r1, #8]
  10226c:	e49df004 	ldr	pc, [sp], #4

00102270 <vListRemove>:
  102270:	e5903004 	ldr	r3, [r0, #4]
  102274:	e5902008 	ldr	r2, [r0, #8]
  102278:	e5832008 	str	r2, [r3, #8]
  10227c:	e5902008 	ldr	r2, [r0, #8]
  102280:	e5901010 	ldr	r1, [r0, #16]
  102284:	e5823004 	str	r3, [r2, #4]
  102288:	e5913004 	ldr	r3, [r1, #4]
  10228c:	e1530000 	cmp	r3, r0
  102290:	e5913000 	ldr	r3, [r1]
  102294:	05812004 	streq	r2, [r1, #4]
  102298:	e2433001 	sub	r3, r3, #1	; 0x1
  10229c:	e3a02000 	mov	r2, #0	; 0x0
  1022a0:	e5802010 	str	r2, [r0, #16]
  1022a4:	e5813000 	str	r3, [r1]
  1022a8:	e12fff1e 	bx	lr

001022ac <uxQueueMessagesWaiting>:
  1022ac:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1022b0:	e1a04000 	mov	r4, r0
  1022b4:	eb0004d6 	bl	103614 <vPortEnterCritical>
  1022b8:	e5945038 	ldr	r5, [r4, #56]
  1022bc:	eb0004df 	bl	103640 <vPortExitCritical>
  1022c0:	e1a00005 	mov	r0, r5
  1022c4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

001022c8 <prvCopyDataFromQueue>:
  1022c8:	e92d4010 	stmdb	sp!, {r4, lr}
  1022cc:	e5904000 	ldr	r4, [r0]
  1022d0:	e3540000 	cmp	r4, #0	; 0x0
  1022d4:	e1a0e000 	mov	lr, r0
  1022d8:	e1a00001 	mov	r0, r1
  1022dc:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1022e0:	e59ec00c 	ldr	ip, [lr, #12]
  1022e4:	e59e3040 	ldr	r3, [lr, #64]
  1022e8:	e59e1004 	ldr	r1, [lr, #4]
  1022ec:	e08cc003 	add	ip, ip, r3
  1022f0:	e15c0001 	cmp	ip, r1
  1022f4:	e58ec00c 	str	ip, [lr, #12]
  1022f8:	21a0c004 	movcs	ip, r4
  1022fc:	e1a02003 	mov	r2, r3
  102300:	e1a0100c 	mov	r1, ip
  102304:	258ec00c 	strcs	ip, [lr, #12]
  102308:	e8bd4010 	ldmia	sp!, {r4, lr}
  10230c:	eafff9b7 	b	1009f0 <memcpy>

00102310 <prvCopyDataToQueue>:
  102310:	e5903040 	ldr	r3, [r0, #64]
  102314:	e3530000 	cmp	r3, #0	; 0x0
  102318:	e92d4010 	stmdb	sp!, {r4, lr}
  10231c:	e1a04000 	mov	r4, r0
  102320:	e1a00002 	mov	r0, r2
  102324:	0a00000e 	beq	102364 <prvCopyDataToQueue+0x54>
  102328:	e3500000 	cmp	r0, #0	; 0x0
  10232c:	e1a02003 	mov	r2, r3
  102330:	0a00000f 	beq	102374 <prvCopyDataToQueue+0x64>
  102334:	e1a02003 	mov	r2, r3
  102338:	e594000c 	ldr	r0, [r4, #12]
  10233c:	ebfff9ab 	bl	1009f0 <memcpy>
  102340:	e594300c 	ldr	r3, [r4, #12]
  102344:	e5941040 	ldr	r1, [r4, #64]
  102348:	e5942000 	ldr	r2, [r4]
  10234c:	e0613003 	rsb	r3, r1, r3
  102350:	e1530002 	cmp	r3, r2
  102354:	e584300c 	str	r3, [r4, #12]
  102358:	35943004 	ldrcc	r3, [r4, #4]
  10235c:	30613003 	rsbcc	r3, r1, r3
  102360:	3584300c 	strcc	r3, [r4, #12]
  102364:	e5943038 	ldr	r3, [r4, #56]
  102368:	e2833001 	add	r3, r3, #1	; 0x1
  10236c:	e5843038 	str	r3, [r4, #56]
  102370:	e8bd8010 	ldmia	sp!, {r4, pc}
  102374:	e5940008 	ldr	r0, [r4, #8]
  102378:	ebfff99c 	bl	1009f0 <memcpy>
  10237c:	e5943008 	ldr	r3, [r4, #8]
  102380:	e5942040 	ldr	r2, [r4, #64]
  102384:	e5941004 	ldr	r1, [r4, #4]
  102388:	e0833002 	add	r3, r3, r2
  10238c:	e1530001 	cmp	r3, r1
  102390:	e5843008 	str	r3, [r4, #8]
  102394:	25943000 	ldrcs	r3, [r4]
  102398:	25843008 	strcs	r3, [r4, #8]
  10239c:	e5943038 	ldr	r3, [r4, #56]
  1023a0:	e2833001 	add	r3, r3, #1	; 0x1
  1023a4:	e5843038 	str	r3, [r4, #56]
  1023a8:	e8bd8010 	ldmia	sp!, {r4, pc}

001023ac <xQueueGenericSendFromISR>:
  1023ac:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1023b0:	e590c038 	ldr	ip, [r0, #56]
  1023b4:	e590e03c 	ldr	lr, [r0, #60]
  1023b8:	e15c000e 	cmp	ip, lr
  1023bc:	e1a05002 	mov	r5, r2
  1023c0:	e1a04000 	mov	r4, r0
  1023c4:	e3a0c000 	mov	ip, #0	; 0x0
  1023c8:	e1a02003 	mov	r2, r3
  1023cc:	3a000001 	bcc	1023d8 <xQueueGenericSendFromISR+0x2c>
  1023d0:	e1a0000c 	mov	r0, ip
  1023d4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1023d8:	ebffffcc 	bl	102310 <prvCopyDataToQueue>
  1023dc:	e5943048 	ldr	r3, [r4, #72]
  1023e0:	e3730001 	cmn	r3, #1	; 0x1
  1023e4:	e2833001 	add	r3, r3, #1	; 0x1
  1023e8:	e3a0c001 	mov	ip, #1	; 0x1
  1023ec:	15843048 	strne	r3, [r4, #72]
  1023f0:	1afffff6 	bne	1023d0 <xQueueGenericSendFromISR+0x24>
  1023f4:	e5943024 	ldr	r3, [r4, #36]
  1023f8:	e3530000 	cmp	r3, #0	; 0x0
  1023fc:	e2840024 	add	r0, r4, #36	; 0x24
  102400:	1a000001 	bne	10240c <xQueueGenericSendFromISR+0x60>
  102404:	e3a0c001 	mov	ip, #1	; 0x1
  102408:	eafffff0 	b	1023d0 <xQueueGenericSendFromISR+0x24>
  10240c:	eb00019c 	bl	102a84 <xTaskRemoveFromEventList>
  102410:	e3a03001 	mov	r3, #1	; 0x1
  102414:	e3500000 	cmp	r0, #0	; 0x0
  102418:	e1a0c003 	mov	ip, r3
  10241c:	15853000 	strne	r3, [r5]
  102420:	1affffea 	bne	1023d0 <xQueueGenericSendFromISR+0x24>
  102424:	eafffff6 	b	102404 <xQueueGenericSendFromISR+0x58>

00102428 <prvUnlockQueue>:
  102428:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10242c:	e1a04000 	mov	r4, r0
  102430:	eb000477 	bl	103614 <vPortEnterCritical>
  102434:	e5943048 	ldr	r3, [r4, #72]
  102438:	e3530000 	cmp	r3, #0	; 0x0
  10243c:	da000016 	ble	10249c <prvUnlockQueue+0x74>
  102440:	e5943024 	ldr	r3, [r4, #36]
  102444:	e3530000 	cmp	r3, #0	; 0x0
  102448:	12845024 	addne	r5, r4, #36	; 0x24
  10244c:	1a000008 	bne	102474 <prvUnlockQueue+0x4c>
  102450:	ea000011 	b	10249c <prvUnlockQueue+0x74>
  102454:	e5943048 	ldr	r3, [r4, #72]
  102458:	e2433001 	sub	r3, r3, #1	; 0x1
  10245c:	e3530000 	cmp	r3, #0	; 0x0
  102460:	e5843048 	str	r3, [r4, #72]
  102464:	da00000c 	ble	10249c <prvUnlockQueue+0x74>
  102468:	e5943024 	ldr	r3, [r4, #36]
  10246c:	e3530000 	cmp	r3, #0	; 0x0
  102470:	0a000009 	beq	10249c <prvUnlockQueue+0x74>
  102474:	e1a00005 	mov	r0, r5
  102478:	eb000181 	bl	102a84 <xTaskRemoveFromEventList>
  10247c:	e3500000 	cmp	r0, #0	; 0x0
  102480:	0afffff3 	beq	102454 <prvUnlockQueue+0x2c>
  102484:	eb000140 	bl	10298c <vTaskMissedYield>
  102488:	e5943048 	ldr	r3, [r4, #72]
  10248c:	e2433001 	sub	r3, r3, #1	; 0x1
  102490:	e3530000 	cmp	r3, #0	; 0x0
  102494:	e5843048 	str	r3, [r4, #72]
  102498:	cafffff2 	bgt	102468 <prvUnlockQueue+0x40>
  10249c:	e3e03000 	mvn	r3, #0	; 0x0
  1024a0:	e5843048 	str	r3, [r4, #72]
  1024a4:	eb000465 	bl	103640 <vPortExitCritical>
  1024a8:	eb000459 	bl	103614 <vPortEnterCritical>
  1024ac:	e5943044 	ldr	r3, [r4, #68]
  1024b0:	e3530000 	cmp	r3, #0	; 0x0
  1024b4:	da000016 	ble	102514 <prvUnlockQueue+0xec>
  1024b8:	e5943010 	ldr	r3, [r4, #16]
  1024bc:	e3530000 	cmp	r3, #0	; 0x0
  1024c0:	12845010 	addne	r5, r4, #16	; 0x10
  1024c4:	1a000008 	bne	1024ec <prvUnlockQueue+0xc4>
  1024c8:	ea000011 	b	102514 <prvUnlockQueue+0xec>
  1024cc:	e5943044 	ldr	r3, [r4, #68]
  1024d0:	e2433001 	sub	r3, r3, #1	; 0x1
  1024d4:	e3530000 	cmp	r3, #0	; 0x0
  1024d8:	e5843044 	str	r3, [r4, #68]
  1024dc:	da00000c 	ble	102514 <prvUnlockQueue+0xec>
  1024e0:	e5943010 	ldr	r3, [r4, #16]
  1024e4:	e3530000 	cmp	r3, #0	; 0x0
  1024e8:	0a000009 	beq	102514 <prvUnlockQueue+0xec>
  1024ec:	e1a00005 	mov	r0, r5
  1024f0:	eb000163 	bl	102a84 <xTaskRemoveFromEventList>
  1024f4:	e3500000 	cmp	r0, #0	; 0x0
  1024f8:	0afffff3 	beq	1024cc <prvUnlockQueue+0xa4>
  1024fc:	eb000122 	bl	10298c <vTaskMissedYield>
  102500:	e5943044 	ldr	r3, [r4, #68]
  102504:	e2433001 	sub	r3, r3, #1	; 0x1
  102508:	e3530000 	cmp	r3, #0	; 0x0
  10250c:	e5843044 	str	r3, [r4, #68]
  102510:	cafffff2 	bgt	1024e0 <prvUnlockQueue+0xb8>
  102514:	e3e03000 	mvn	r3, #0	; 0x0
  102518:	e5843044 	str	r3, [r4, #68]
  10251c:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  102520:	ea000446 	b	103640 <vPortExitCritical>

00102524 <xQueueGenericReceive>:
  102524:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  102528:	e1a05000 	mov	r5, r0
  10252c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  102530:	e1a06001 	mov	r6, r1
  102534:	e1a07003 	mov	r7, r3
  102538:	e3a04001 	mov	r4, #1	; 0x1
  10253c:	e58d2000 	str	r2, [sp]
  102540:	ea00000d 	b	10257c <xQueueGenericReceive+0x58>
  102544:	eb000432 	bl	103614 <vPortEnterCritical>
  102548:	e5953038 	ldr	r3, [r5, #56]
  10254c:	e3530000 	cmp	r3, #0	; 0x0
  102550:	1a000030 	bne	102618 <xQueueGenericReceive+0xf4>
  102554:	eb000439 	bl	103640 <vPortExitCritical>
  102558:	e59d3000 	ldr	r3, [sp]
  10255c:	e3530000 	cmp	r3, #0	; 0x0
  102560:	0a000040 	beq	102668 <xQueueGenericReceive+0x144>
  102564:	e28d0004 	add	r0, sp, #4	; 0x4
  102568:	e1a0100d 	mov	r1, sp
  10256c:	eb00010b 	bl	1029a0 <xTaskCheckForTimeOut>
  102570:	e3500000 	cmp	r0, #0	; 0x0
  102574:	e3e04000 	mvn	r4, #0	; 0x0
  102578:	1a00003a 	bne	102668 <xQueueGenericReceive+0x144>
  10257c:	e59d3000 	ldr	r3, [sp]
  102580:	e3530000 	cmp	r3, #0	; 0x0
  102584:	0affffee 	beq	102544 <xQueueGenericReceive+0x20>
  102588:	eb000134 	bl	102a60 <vTaskSuspendAll>
  10258c:	eb000420 	bl	103614 <vPortEnterCritical>
  102590:	e5953044 	ldr	r3, [r5, #68]
  102594:	e3730001 	cmn	r3, #1	; 0x1
  102598:	02833001 	addeq	r3, r3, #1	; 0x1
  10259c:	05853044 	streq	r3, [r5, #68]
  1025a0:	e5953048 	ldr	r3, [r5, #72]
  1025a4:	e3730001 	cmn	r3, #1	; 0x1
  1025a8:	02833001 	addeq	r3, r3, #1	; 0x1
  1025ac:	05853048 	streq	r3, [r5, #72]
  1025b0:	eb000422 	bl	103640 <vPortExitCritical>
  1025b4:	e3540001 	cmp	r4, #1	; 0x1
  1025b8:	0a00002d 	beq	102674 <xQueueGenericReceive+0x150>
  1025bc:	eb000414 	bl	103614 <vPortEnterCritical>
  1025c0:	e5954038 	ldr	r4, [r5, #56]
  1025c4:	eb00041d 	bl	103640 <vPortExitCritical>
  1025c8:	e3540000 	cmp	r4, #0	; 0x0
  1025cc:	1a000021 	bne	102658 <xQueueGenericReceive+0x134>
  1025d0:	e28d0004 	add	r0, sp, #4	; 0x4
  1025d4:	e1a0100d 	mov	r1, sp
  1025d8:	eb0000f0 	bl	1029a0 <xTaskCheckForTimeOut>
  1025dc:	e3500000 	cmp	r0, #0	; 0x0
  1025e0:	1a00001c 	bne	102658 <xQueueGenericReceive+0x134>
  1025e4:	e59d1000 	ldr	r1, [sp]
  1025e8:	e2850024 	add	r0, r5, #36	; 0x24
  1025ec:	eb0001a8 	bl	102c94 <vTaskPlaceOnEventList>
  1025f0:	e1a00005 	mov	r0, r5
  1025f4:	ebffff8b 	bl	102428 <prvUnlockQueue>
  1025f8:	eb000275 	bl	102fd4 <xTaskResumeAll>
  1025fc:	e3500000 	cmp	r0, #0	; 0x0
  102600:	1affffcf 	bne	102544 <xQueueGenericReceive+0x20>
  102604:	ef000000 	swi	0x00000000
  102608:	eb000401 	bl	103614 <vPortEnterCritical>
  10260c:	e5953038 	ldr	r3, [r5, #56]
  102610:	e3530000 	cmp	r3, #0	; 0x0
  102614:	0affffce 	beq	102554 <xQueueGenericReceive+0x30>
  102618:	e1a01006 	mov	r1, r6
  10261c:	e1a00005 	mov	r0, r5
  102620:	e595400c 	ldr	r4, [r5, #12]
  102624:	ebffff27 	bl	1022c8 <prvCopyDataFromQueue>
  102628:	e3570000 	cmp	r7, #0	; 0x0
  10262c:	0a000013 	beq	102680 <xQueueGenericReceive+0x15c>
  102630:	e5953024 	ldr	r3, [r5, #36]
  102634:	e3530000 	cmp	r3, #0	; 0x0
  102638:	e585400c 	str	r4, [r5, #12]
  10263c:	0a000015 	beq	102698 <xQueueGenericReceive+0x174>
  102640:	e2850024 	add	r0, r5, #36	; 0x24
  102644:	eb00010e 	bl	102a84 <xTaskRemoveFromEventList>
  102648:	e3500000 	cmp	r0, #0	; 0x0
  10264c:	0a000011 	beq	102698 <xQueueGenericReceive+0x174>
  102650:	ef000000 	swi	0x00000000
  102654:	ea00000f 	b	102698 <xQueueGenericReceive+0x174>
  102658:	e1a00005 	mov	r0, r5
  10265c:	ebffff71 	bl	102428 <prvUnlockQueue>
  102660:	eb00025b 	bl	102fd4 <xTaskResumeAll>
  102664:	eaffffb6 	b	102544 <xQueueGenericReceive+0x20>
  102668:	e3a00000 	mov	r0, #0	; 0x0
  10266c:	e28dd00c 	add	sp, sp, #12	; 0xc
  102670:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  102674:	e28d0004 	add	r0, sp, #4	; 0x4
  102678:	eb0000bb 	bl	10296c <vTaskSetTimeOutState>
  10267c:	eaffffce 	b	1025bc <xQueueGenericReceive+0x98>
  102680:	e5953038 	ldr	r3, [r5, #56]
  102684:	e2433001 	sub	r3, r3, #1	; 0x1
  102688:	e5853038 	str	r3, [r5, #56]
  10268c:	e5952010 	ldr	r2, [r5, #16]
  102690:	e3520000 	cmp	r2, #0	; 0x0
  102694:	1a000002 	bne	1026a4 <xQueueGenericReceive+0x180>
  102698:	eb0003e8 	bl	103640 <vPortExitCritical>
  10269c:	e3a00001 	mov	r0, #1	; 0x1
  1026a0:	eafffff1 	b	10266c <xQueueGenericReceive+0x148>
  1026a4:	e2850010 	add	r0, r5, #16	; 0x10
  1026a8:	eb0000f5 	bl	102a84 <xTaskRemoveFromEventList>
  1026ac:	e3500001 	cmp	r0, #1	; 0x1
  1026b0:	1afffff8 	bne	102698 <xQueueGenericReceive+0x174>
  1026b4:	ef000000 	swi	0x00000000
  1026b8:	eafffff6 	b	102698 <xQueueGenericReceive+0x174>

001026bc <xQueueGenericSend>:
  1026bc:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  1026c0:	e1a06000 	mov	r6, r0
  1026c4:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1026c8:	e1a07001 	mov	r7, r1
  1026cc:	e1a08003 	mov	r8, r3
  1026d0:	e3a04001 	mov	r4, #1	; 0x1
  1026d4:	e58d2000 	str	r2, [sp]
  1026d8:	ea00000e 	b	102718 <xQueueGenericSend+0x5c>
  1026dc:	eb0003cc 	bl	103614 <vPortEnterCritical>
  1026e0:	e5962038 	ldr	r2, [r6, #56]
  1026e4:	e596303c 	ldr	r3, [r6, #60]
  1026e8:	e1520003 	cmp	r2, r3
  1026ec:	3a000032 	bcc	1027bc <xQueueGenericSend+0x100>
  1026f0:	eb0003d2 	bl	103640 <vPortExitCritical>
  1026f4:	e59d3000 	ldr	r3, [sp]
  1026f8:	e3530000 	cmp	r3, #0	; 0x0
  1026fc:	0a00003c 	beq	1027f4 <xQueueGenericSend+0x138>
  102700:	e28d0004 	add	r0, sp, #4	; 0x4
  102704:	e1a0100d 	mov	r1, sp
  102708:	eb0000a4 	bl	1029a0 <xTaskCheckForTimeOut>
  10270c:	e3500000 	cmp	r0, #0	; 0x0
  102710:	e3e04000 	mvn	r4, #0	; 0x0
  102714:	1a000036 	bne	1027f4 <xQueueGenericSend+0x138>
  102718:	e59d3000 	ldr	r3, [sp]
  10271c:	e3530000 	cmp	r3, #0	; 0x0
  102720:	0affffed 	beq	1026dc <xQueueGenericSend+0x20>
  102724:	eb0000cd 	bl	102a60 <vTaskSuspendAll>
  102728:	eb0003b9 	bl	103614 <vPortEnterCritical>
  10272c:	e5963044 	ldr	r3, [r6, #68]
  102730:	e3730001 	cmn	r3, #1	; 0x1
  102734:	02833001 	addeq	r3, r3, #1	; 0x1
  102738:	05863044 	streq	r3, [r6, #68]
  10273c:	e5963048 	ldr	r3, [r6, #72]
  102740:	e3730001 	cmn	r3, #1	; 0x1
  102744:	02833001 	addeq	r3, r3, #1	; 0x1
  102748:	05863048 	streq	r3, [r6, #72]
  10274c:	eb0003bb 	bl	103640 <vPortExitCritical>
  102750:	e3540001 	cmp	r4, #1	; 0x1
  102754:	0a000029 	beq	102800 <xQueueGenericSend+0x144>
  102758:	eb0003ad 	bl	103614 <vPortEnterCritical>
  10275c:	e5965038 	ldr	r5, [r6, #56]
  102760:	e596403c 	ldr	r4, [r6, #60]
  102764:	eb0003b5 	bl	103640 <vPortExitCritical>
  102768:	e1550004 	cmp	r5, r4
  10276c:	1a00001c 	bne	1027e4 <xQueueGenericSend+0x128>
  102770:	e28d0004 	add	r0, sp, #4	; 0x4
  102774:	e1a0100d 	mov	r1, sp
  102778:	eb000088 	bl	1029a0 <xTaskCheckForTimeOut>
  10277c:	e3500000 	cmp	r0, #0	; 0x0
  102780:	1a000017 	bne	1027e4 <xQueueGenericSend+0x128>
  102784:	e59d1000 	ldr	r1, [sp]
  102788:	e2860010 	add	r0, r6, #16	; 0x10
  10278c:	eb000140 	bl	102c94 <vTaskPlaceOnEventList>
  102790:	e1a00006 	mov	r0, r6
  102794:	ebffff23 	bl	102428 <prvUnlockQueue>
  102798:	eb00020d 	bl	102fd4 <xTaskResumeAll>
  10279c:	e3500000 	cmp	r0, #0	; 0x0
  1027a0:	1affffcd 	bne	1026dc <xQueueGenericSend+0x20>
  1027a4:	ef000000 	swi	0x00000000
  1027a8:	eb000399 	bl	103614 <vPortEnterCritical>
  1027ac:	e5962038 	ldr	r2, [r6, #56]
  1027b0:	e596303c 	ldr	r3, [r6, #60]
  1027b4:	e1520003 	cmp	r2, r3
  1027b8:	2affffcc 	bcs	1026f0 <xQueueGenericSend+0x34>
  1027bc:	e1a01007 	mov	r1, r7
  1027c0:	e1a02008 	mov	r2, r8
  1027c4:	e1a00006 	mov	r0, r6
  1027c8:	ebfffed0 	bl	102310 <prvCopyDataToQueue>
  1027cc:	e5963024 	ldr	r3, [r6, #36]
  1027d0:	e3530000 	cmp	r3, #0	; 0x0
  1027d4:	1a00000c 	bne	10280c <xQueueGenericSend+0x150>
  1027d8:	eb000398 	bl	103640 <vPortExitCritical>
  1027dc:	e3a00001 	mov	r0, #1	; 0x1
  1027e0:	ea000004 	b	1027f8 <xQueueGenericSend+0x13c>
  1027e4:	e1a00006 	mov	r0, r6
  1027e8:	ebffff0e 	bl	102428 <prvUnlockQueue>
  1027ec:	eb0001f8 	bl	102fd4 <xTaskResumeAll>
  1027f0:	eaffffb9 	b	1026dc <xQueueGenericSend+0x20>
  1027f4:	e3a00000 	mov	r0, #0	; 0x0
  1027f8:	e28dd00c 	add	sp, sp, #12	; 0xc
  1027fc:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  102800:	e28d0004 	add	r0, sp, #4	; 0x4
  102804:	eb000058 	bl	10296c <vTaskSetTimeOutState>
  102808:	eaffffd2 	b	102758 <xQueueGenericSend+0x9c>
  10280c:	e2860024 	add	r0, r6, #36	; 0x24
  102810:	eb00009b 	bl	102a84 <xTaskRemoveFromEventList>
  102814:	e3500001 	cmp	r0, #1	; 0x1
  102818:	1affffee 	bne	1027d8 <xQueueGenericSend+0x11c>
  10281c:	ef000000 	swi	0x00000000
  102820:	eaffffec 	b	1027d8 <xQueueGenericSend+0x11c>

00102824 <xQueueCreate>:
  102824:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  102828:	e2507000 	subs	r7, r0, #0	; 0x0
  10282c:	e1a06001 	mov	r6, r1
  102830:	e3a0004c 	mov	r0, #76	; 0x4c
  102834:	1a000002 	bne	102844 <xQueueCreate+0x20>
  102838:	e3a05000 	mov	r5, #0	; 0x0
  10283c:	e1a00005 	mov	r0, r5
  102840:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  102844:	eb0003f0 	bl	10380c <pvPortMalloc>
  102848:	e3500000 	cmp	r0, #0	; 0x0
  10284c:	e1a05000 	mov	r5, r0
  102850:	0afffff8 	beq	102838 <xQueueCreate+0x14>
  102854:	e0040796 	mul	r4, r6, r7
  102858:	e2840001 	add	r0, r4, #1	; 0x1
  10285c:	eb0003ea 	bl	10380c <pvPortMalloc>
  102860:	e1a08000 	mov	r8, r0
  102864:	e3580000 	cmp	r8, #0	; 0x0
  102868:	e0803004 	add	r3, r0, r4
  10286c:	e2472001 	sub	r2, r7, #1	; 0x1
  102870:	e3e01000 	mvn	r1, #0	; 0x0
  102874:	e2850010 	add	r0, r5, #16	; 0x10
  102878:	e5858000 	str	r8, [r5]
  10287c:	0a00000d 	beq	1028b8 <xQueueCreate+0x94>
  102880:	e0228296 	mla	r2, r6, r2, r8
  102884:	e5853004 	str	r3, [r5, #4]
  102888:	e3a03000 	mov	r3, #0	; 0x0
  10288c:	e5853038 	str	r3, [r5, #56]
  102890:	e585200c 	str	r2, [r5, #12]
  102894:	e585703c 	str	r7, [r5, #60]
  102898:	e5856040 	str	r6, [r5, #64]
  10289c:	e5851048 	str	r1, [r5, #72]
  1028a0:	e5858008 	str	r8, [r5, #8]
  1028a4:	e5851044 	str	r1, [r5, #68]
  1028a8:	ebfffe3e 	bl	1021a8 <vListInitialise>
  1028ac:	e2850024 	add	r0, r5, #36	; 0x24
  1028b0:	ebfffe3c 	bl	1021a8 <vListInitialise>
  1028b4:	eaffffe0 	b	10283c <xQueueCreate+0x18>
  1028b8:	e1a00005 	mov	r0, r5
  1028bc:	eb0003ca 	bl	1037ec <vPortFree>
  1028c0:	e1a05008 	mov	r5, r8
  1028c4:	eaffffdc 	b	10283c <xQueueCreate+0x18>

001028c8 <vTaskSwitchContext>:
  1028c8:	e59f3088 	ldr	r3, [pc, #136]	; 102958 <prog+0x2914>
  1028cc:	e5932000 	ldr	r2, [r3]
  1028d0:	e3520000 	cmp	r2, #0	; 0x0
  1028d4:	159f3080 	ldrne	r3, [pc, #128]	; 10295c <prog+0x2918>
  1028d8:	13a02001 	movne	r2, #1	; 0x1
  1028dc:	15832000 	strne	r2, [r3]
  1028e0:	112fff1e 	bxne	lr
  1028e4:	e59f1074 	ldr	r1, [pc, #116]	; 102960 <prog+0x291c>
  1028e8:	e5913000 	ldr	r3, [r1]
  1028ec:	e59f0070 	ldr	r0, [pc, #112]	; 102964 <prog+0x2920>
  1028f0:	e0833103 	add	r3, r3, r3, lsl #2
  1028f4:	e7902103 	ldr	r2, [r0, r3, lsl #2]
  1028f8:	e3520000 	cmp	r2, #0	; 0x0
  1028fc:	1a000007 	bne	102920 <vTaskSwitchContext+0x58>
  102900:	e5913000 	ldr	r3, [r1]
  102904:	e2433001 	sub	r3, r3, #1	; 0x1
  102908:	e5813000 	str	r3, [r1]
  10290c:	e5912000 	ldr	r2, [r1]
  102910:	e0822102 	add	r2, r2, r2, lsl #2
  102914:	e7903102 	ldr	r3, [r0, r2, lsl #2]
  102918:	e3530000 	cmp	r3, #0	; 0x0
  10291c:	0afffff7 	beq	102900 <vTaskSwitchContext+0x38>
  102920:	e5913000 	ldr	r3, [r1]
  102924:	e0833103 	add	r3, r3, r3, lsl #2
  102928:	e0802103 	add	r2, r0, r3, lsl #2
  10292c:	e5921004 	ldr	r1, [r2, #4]
  102930:	e5911004 	ldr	r1, [r1, #4]
  102934:	e2823008 	add	r3, r2, #8	; 0x8
  102938:	e5821004 	str	r1, [r2, #4]
  10293c:	e1510003 	cmp	r1, r3
  102940:	05911004 	ldreq	r1, [r1, #4]
  102944:	e59f301c 	ldr	r3, [pc, #28]	; 102968 <prog+0x2924>
  102948:	05821004 	streq	r1, [r2, #4]
  10294c:	e591200c 	ldr	r2, [r1, #12]
  102950:	e5832000 	str	r2, [r3]
  102954:	e12fff1e 	bx	lr
  102958:	00200c28 	eoreq	r0, r0, r8, lsr #24
  10295c:	00200c1c 	eoreq	r0, r0, ip, lsl ip
  102960:	00200c2c 	eoreq	r0, r0, ip, lsr #24
  102964:	00200c44 	eoreq	r0, r0, r4, asr #24
  102968:	00200c18 	eoreq	r0, r0, r8, lsl ip

0010296c <vTaskSetTimeOutState>:
  10296c:	e59f3010 	ldr	r3, [pc, #16]	; 102984 <prog+0x2940>
  102970:	e59f2010 	ldr	r2, [pc, #16]	; 102988 <prog+0x2944>
  102974:	e5931000 	ldr	r1, [r3]
  102978:	e5923000 	ldr	r3, [r2]
  10297c:	e880000a 	stmia	r0, {r1, r3}
  102980:	e12fff1e 	bx	lr
  102984:	00200c20 	eoreq	r0, r0, r0, lsr #24
  102988:	00200c24 	eoreq	r0, r0, r4, lsr #24

0010298c <vTaskMissedYield>:
  10298c:	e59f3008 	ldr	r3, [pc, #8]	; 10299c <prog+0x2958>
  102990:	e3a02001 	mov	r2, #1	; 0x1
  102994:	e5832000 	str	r2, [r3]
  102998:	e12fff1e 	bx	lr
  10299c:	00200c1c 	eoreq	r0, r0, ip, lsl ip

001029a0 <xTaskCheckForTimeOut>:
  1029a0:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  1029a4:	e1a06001 	mov	r6, r1
  1029a8:	e1a04000 	mov	r4, r0
  1029ac:	eb000318 	bl	103614 <vPortEnterCritical>
  1029b0:	e596c000 	ldr	ip, [r6]
  1029b4:	e37c0001 	cmn	ip, #1	; 0x1
  1029b8:	e3a05000 	mov	r5, #0	; 0x0
  1029bc:	0a000010 	beq	102a04 <xTaskCheckForTimeOut+0x64>
  1029c0:	e59f3090 	ldr	r3, [pc, #144]	; 102a58 <prog+0x2a14>
  1029c4:	e5942000 	ldr	r2, [r4]
  1029c8:	e5931000 	ldr	r1, [r3]
  1029cc:	e1520001 	cmp	r2, r1
  1029d0:	e59fe084 	ldr	lr, [pc, #132]	; 102a5c <prog+0x2a18>
  1029d4:	0a000016 	beq	102a34 <xTaskCheckForTimeOut+0x94>
  1029d8:	e59e3000 	ldr	r3, [lr]
  1029dc:	e5941004 	ldr	r1, [r4, #4]
  1029e0:	e1510003 	cmp	r1, r3
  1029e4:	9a000005 	bls	102a00 <xTaskCheckForTimeOut+0x60>
  1029e8:	e59e3000 	ldr	r3, [lr]
  1029ec:	e0613003 	rsb	r3, r1, r3
  1029f0:	e15c0003 	cmp	ip, r3
  1029f4:	e1a00004 	mov	r0, r4
  1029f8:	e3a05000 	mov	r5, #0	; 0x0
  1029fc:	8a000003 	bhi	102a10 <xTaskCheckForTimeOut+0x70>
  102a00:	e3a05001 	mov	r5, #1	; 0x1
  102a04:	eb00030d 	bl	103640 <vPortExitCritical>
  102a08:	e1a00005 	mov	r0, r5
  102a0c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  102a10:	e59f2044 	ldr	r2, [pc, #68]	; 102a5c <prog+0x2a18>
  102a14:	e5923000 	ldr	r3, [r2]
  102a18:	e0613003 	rsb	r3, r1, r3
  102a1c:	e063300c 	rsb	r3, r3, ip
  102a20:	e5863000 	str	r3, [r6]
  102a24:	ebffffd0 	bl	10296c <vTaskSetTimeOutState>
  102a28:	eb000304 	bl	103640 <vPortExitCritical>
  102a2c:	e1a00005 	mov	r0, r5
  102a30:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  102a34:	e59fe020 	ldr	lr, [pc, #32]	; 102a5c <prog+0x2a18>
  102a38:	e5941004 	ldr	r1, [r4, #4]
  102a3c:	e59e3000 	ldr	r3, [lr]
  102a40:	e0613003 	rsb	r3, r1, r3
  102a44:	e15c0003 	cmp	ip, r3
  102a48:	e1a00004 	mov	r0, r4
  102a4c:	e3a05000 	mov	r5, #0	; 0x0
  102a50:	9affffea 	bls	102a00 <xTaskCheckForTimeOut+0x60>
  102a54:	eaffffed 	b	102a10 <xTaskCheckForTimeOut+0x70>
  102a58:	00200c20 	eoreq	r0, r0, r0, lsr #24
  102a5c:	00200c24 	eoreq	r0, r0, r4, lsr #24

00102a60 <vTaskSuspendAll>:
  102a60:	e52de004 	str	lr, [sp, #-4]!
  102a64:	eb0002ea 	bl	103614 <vPortEnterCritical>
  102a68:	e59f2010 	ldr	r2, [pc, #16]	; 102a80 <prog+0x2a3c>
  102a6c:	e5923000 	ldr	r3, [r2]
  102a70:	e2833001 	add	r3, r3, #1	; 0x1
  102a74:	e5823000 	str	r3, [r2]
  102a78:	e49de004 	ldr	lr, [sp], #4
  102a7c:	ea0002ef 	b	103640 <vPortExitCritical>
  102a80:	00200c28 	eoreq	r0, r0, r8, lsr #24

00102a84 <xTaskRemoveFromEventList>:
  102a84:	e5903000 	ldr	r3, [r0]
  102a88:	e3530000 	cmp	r3, #0	; 0x0
  102a8c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  102a90:	e1a06003 	mov	r6, r3
  102a94:	1590300c 	ldrne	r3, [r0, #12]
  102a98:	1593600c 	ldrne	r6, [r3, #12]
  102a9c:	e2864018 	add	r4, r6, #24	; 0x18
  102aa0:	e1a00004 	mov	r0, r4
  102aa4:	ebfffdf1 	bl	102270 <vListRemove>
  102aa8:	e59f3064 	ldr	r3, [pc, #100]	; 102b14 <prog+0x2ad0>
  102aac:	e5932000 	ldr	r2, [r3]
  102ab0:	e2865004 	add	r5, r6, #4	; 0x4
  102ab4:	e3520000 	cmp	r2, #0	; 0x0
  102ab8:	e1a00005 	mov	r0, r5
  102abc:	e1a01004 	mov	r1, r4
  102ac0:	159f0050 	ldrne	r0, [pc, #80]	; 102b18 <prog+0x2ad4>
  102ac4:	1a000009 	bne	102af0 <xTaskRemoveFromEventList+0x6c>
  102ac8:	ebfffde8 	bl	102270 <vListRemove>
  102acc:	e59fe048 	ldr	lr, [pc, #72]	; 102b1c <prog+0x2ad8>
  102ad0:	e596c02c 	ldr	ip, [r6, #44]
  102ad4:	e59e2000 	ldr	r2, [lr]
  102ad8:	e59f0040 	ldr	r0, [pc, #64]	; 102b20 <prog+0x2adc>
  102adc:	e15c0002 	cmp	ip, r2
  102ae0:	e08c310c 	add	r3, ip, ip, lsl #2
  102ae4:	858ec000 	strhi	ip, [lr]
  102ae8:	e1a01005 	mov	r1, r5
  102aec:	e0800103 	add	r0, r0, r3, lsl #2
  102af0:	ebfffdb8 	bl	1021d8 <vListInsertEnd>
  102af4:	e59f3028 	ldr	r3, [pc, #40]	; 102b24 <prog+0x2ae0>
  102af8:	e5932000 	ldr	r2, [r3]
  102afc:	e596102c 	ldr	r1, [r6, #44]
  102b00:	e592002c 	ldr	r0, [r2, #44]
  102b04:	e1510000 	cmp	r1, r0
  102b08:	33a00000 	movcc	r0, #0	; 0x0
  102b0c:	23a00001 	movcs	r0, #1	; 0x1
  102b10:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  102b14:	00200c28 	eoreq	r0, r0, r8, lsr #24
  102b18:	00200cd8 	ldreqd	r0, [r0], -r8
  102b1c:	00200c2c 	eoreq	r0, r0, ip, lsr #24
  102b20:	00200c44 	eoreq	r0, r0, r4, asr #24
  102b24:	00200c18 	eoreq	r0, r0, r8, lsl ip

00102b28 <vTaskIncrementTick>:
  102b28:	e59f3144 	ldr	r3, [pc, #324]	; 102c74 <prog+0x2c30>
  102b2c:	e5932000 	ldr	r2, [r3]
  102b30:	e3520000 	cmp	r2, #0	; 0x0
  102b34:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  102b38:	1a000039 	bne	102c24 <vTaskIncrementTick+0xfc>
  102b3c:	e59f6134 	ldr	r6, [pc, #308]	; 102c78 <prog+0x2c34>
  102b40:	e5963000 	ldr	r3, [r6]
  102b44:	e2833001 	add	r3, r3, #1	; 0x1
  102b48:	e5863000 	str	r3, [r6]
  102b4c:	e5962000 	ldr	r2, [r6]
  102b50:	e3520000 	cmp	r2, #0	; 0x0
  102b54:	e1a0c006 	mov	ip, r6
  102b58:	159fa11c 	ldrne	sl, [pc, #284]	; 102c7c <prog+0x2c38>
  102b5c:	0a000035 	beq	102c38 <vTaskIncrementTick+0x110>
  102b60:	e59a3000 	ldr	r3, [sl]
  102b64:	e5932000 	ldr	r2, [r3]
  102b68:	e3520000 	cmp	r2, #0	; 0x0
  102b6c:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102b70:	e59f3104 	ldr	r3, [pc, #260]	; 102c7c <prog+0x2c38>
  102b74:	e5932000 	ldr	r2, [r3]
  102b78:	e592100c 	ldr	r1, [r2, #12]
  102b7c:	e591300c 	ldr	r3, [r1, #12]
  102b80:	e3530000 	cmp	r3, #0	; 0x0
  102b84:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102b88:	e1a04003 	mov	r4, r3
  102b8c:	e59c2000 	ldr	r2, [ip]
  102b90:	e5933004 	ldr	r3, [r3, #4]
  102b94:	e1530002 	cmp	r3, r2
  102b98:	959f80e0 	ldrls	r8, [pc, #224]	; 102c80 <prog+0x2c3c>
  102b9c:	959f70e0 	ldrls	r7, [pc, #224]	; 102c84 <prog+0x2c40>
  102ba0:	9a000004 	bls	102bb8 <vTaskIncrementTick+0x90>
  102ba4:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102ba8:	e5962000 	ldr	r2, [r6]
  102bac:	e5943004 	ldr	r3, [r4, #4]
  102bb0:	e1530002 	cmp	r3, r2
  102bb4:	88bd85f0 	ldmhiia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102bb8:	e2845004 	add	r5, r4, #4	; 0x4
  102bbc:	e1a00005 	mov	r0, r5
  102bc0:	ebfffdaa 	bl	102270 <vListRemove>
  102bc4:	e5943028 	ldr	r3, [r4, #40]
  102bc8:	e3530000 	cmp	r3, #0	; 0x0
  102bcc:	e2840018 	add	r0, r4, #24	; 0x18
  102bd0:	1bfffda6 	blne	102270 <vListRemove>
  102bd4:	e594202c 	ldr	r2, [r4, #44]
  102bd8:	e5983000 	ldr	r3, [r8]
  102bdc:	e1520003 	cmp	r2, r3
  102be0:	859f3098 	ldrhi	r3, [pc, #152]	; 102c80 <prog+0x2c3c>
  102be4:	e0820102 	add	r0, r2, r2, lsl #2
  102be8:	85832000 	strhi	r2, [r3]
  102bec:	e1a01005 	mov	r1, r5
  102bf0:	e0870100 	add	r0, r7, r0, lsl #2
  102bf4:	ebfffd77 	bl	1021d8 <vListInsertEnd>
  102bf8:	e59a3000 	ldr	r3, [sl]
  102bfc:	e5932000 	ldr	r2, [r3]
  102c00:	e3520000 	cmp	r2, #0	; 0x0
  102c04:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102c08:	e59f306c 	ldr	r3, [pc, #108]	; 102c7c <prog+0x2c38>
  102c0c:	e5932000 	ldr	r2, [r3]
  102c10:	e592100c 	ldr	r1, [r2, #12]
  102c14:	e591300c 	ldr	r3, [r1, #12]
  102c18:	e2534000 	subs	r4, r3, #0	; 0x0
  102c1c:	1affffe1 	bne	102ba8 <vTaskIncrementTick+0x80>
  102c20:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102c24:	e59f205c 	ldr	r2, [pc, #92]	; 102c88 <prog+0x2c44>
  102c28:	e5923000 	ldr	r3, [r2]
  102c2c:	e2833001 	add	r3, r3, #1	; 0x1
  102c30:	e5823000 	str	r3, [r2]
  102c34:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102c38:	e59fa03c 	ldr	sl, [pc, #60]	; 102c7c <prog+0x2c38>
  102c3c:	e59f1048 	ldr	r1, [pc, #72]	; 102c8c <prog+0x2c48>
  102c40:	e59a0000 	ldr	r0, [sl]
  102c44:	e5913000 	ldr	r3, [r1]
  102c48:	e59f2040 	ldr	r2, [pc, #64]	; 102c90 <prog+0x2c4c>
  102c4c:	e58a3000 	str	r3, [sl]
  102c50:	e5810000 	str	r0, [r1]
  102c54:	e5923000 	ldr	r3, [r2]
  102c58:	e2833001 	add	r3, r3, #1	; 0x1
  102c5c:	e5823000 	str	r3, [r2]
  102c60:	e59a3000 	ldr	r3, [sl]
  102c64:	e5932000 	ldr	r2, [r3]
  102c68:	e3520000 	cmp	r2, #0	; 0x0
  102c6c:	1affffbf 	bne	102b70 <vTaskIncrementTick+0x48>
  102c70:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102c74:	00200c28 	eoreq	r0, r0, r8, lsr #24
  102c78:	00200c24 	eoreq	r0, r0, r4, lsr #24
  102c7c:	00200cd0 	ldreqd	r0, [r0], -r0
  102c80:	00200c2c 	eoreq	r0, r0, ip, lsr #24
  102c84:	00200c44 	eoreq	r0, r0, r4, asr #24
  102c88:	00200c30 	eoreq	r0, r0, r0, lsr ip
  102c8c:	00200cd4 	ldreqd	r0, [r0], -r4
  102c90:	00200c20 	eoreq	r0, r0, r0, lsr #24

00102c94 <vTaskPlaceOnEventList>:
  102c94:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102c98:	e59f406c 	ldr	r4, [pc, #108]	; 102d0c <prog+0x2cc8>
  102c9c:	e5943000 	ldr	r3, [r4]
  102ca0:	e1a05001 	mov	r5, r1
  102ca4:	e2831018 	add	r1, r3, #24	; 0x18
  102ca8:	ebfffd57 	bl	10220c <vListInsert>
  102cac:	e5940000 	ldr	r0, [r4]
  102cb0:	e2800004 	add	r0, r0, #4	; 0x4
  102cb4:	ebfffd6d 	bl	102270 <vListRemove>
  102cb8:	e3750001 	cmn	r5, #1	; 0x1
  102cbc:	e59f004c 	ldr	r0, [pc, #76]	; 102d10 <prog+0x2ccc>
  102cc0:	e59f204c 	ldr	r2, [pc, #76]	; 102d14 <prog+0x2cd0>
  102cc4:	0a00000c 	beq	102cfc <vTaskPlaceOnEventList+0x68>
  102cc8:	e5923000 	ldr	r3, [r2]
  102ccc:	e5941000 	ldr	r1, [r4]
  102cd0:	e5922000 	ldr	r2, [r2]
  102cd4:	e0853003 	add	r3, r5, r3
  102cd8:	e1530002 	cmp	r3, r2
  102cdc:	e5813004 	str	r3, [r1, #4]
  102ce0:	359f3030 	ldrcc	r3, [pc, #48]	; 102d18 <prog+0x2cd4>
  102ce4:	259f3030 	ldrcs	r3, [pc, #48]	; 102d1c <prog+0x2cd8>
  102ce8:	e5930000 	ldr	r0, [r3]
  102cec:	e5941000 	ldr	r1, [r4]
  102cf0:	e2811004 	add	r1, r1, #4	; 0x4
  102cf4:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  102cf8:	eafffd43 	b	10220c <vListInsert>
  102cfc:	e5941000 	ldr	r1, [r4]
  102d00:	e2811004 	add	r1, r1, #4	; 0x4
  102d04:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  102d08:	eafffd32 	b	1021d8 <vListInsertEnd>
  102d0c:	00200c18 	eoreq	r0, r0, r8, lsl ip
  102d10:	00200d00 	eoreq	r0, r0, r0, lsl #26
  102d14:	00200c24 	eoreq	r0, r0, r4, lsr #24
  102d18:	00200cd4 	ldreqd	r0, [r0], -r4
  102d1c:	00200cd0 	ldreqd	r0, [r0], -r0

00102d20 <xTaskCreate>:
  102d20:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  102d24:	e1a02802 	mov	r2, r2, lsl #16
  102d28:	e1a0a000 	mov	sl, r0
  102d2c:	e3a00044 	mov	r0, #68	; 0x44
  102d30:	e1a05001 	mov	r5, r1
  102d34:	e1a08003 	mov	r8, r3
  102d38:	e1a07822 	mov	r7, r2, lsr #16
  102d3c:	e59db024 	ldr	fp, [sp, #36]
  102d40:	eb0002b1 	bl	10380c <pvPortMalloc>
  102d44:	e2506000 	subs	r6, r0, #0	; 0x0
  102d48:	02400001 	subeq	r0, r0, #1	; 0x1
  102d4c:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102d50:	e1a04107 	mov	r4, r7, lsl #2
  102d54:	e1a00004 	mov	r0, r4
  102d58:	eb0002ab 	bl	10380c <pvPortMalloc>
  102d5c:	e3500000 	cmp	r0, #0	; 0x0
  102d60:	e5860030 	str	r0, [r6, #48]
  102d64:	0a00006b 	beq	102f18 <xTaskCreate+0x1f8>
  102d68:	e1a02004 	mov	r2, r4
  102d6c:	e3a010a5 	mov	r1, #165	; 0xa5
  102d70:	ebfff746 	bl	100a90 <memset>
  102d74:	e1a01005 	mov	r1, r5
  102d78:	e3a02010 	mov	r2, #16	; 0x10
  102d7c:	e2860034 	add	r0, r6, #52	; 0x34
  102d80:	ebfff78e 	bl	100bc0 <strncpy>
  102d84:	e35b0004 	cmp	fp, #4	; 0x4
  102d88:	31a0400b 	movcc	r4, fp
  102d8c:	23a04004 	movcs	r4, #4	; 0x4
  102d90:	e3a03000 	mov	r3, #0	; 0x0
  102d94:	e2869004 	add	r9, r6, #4	; 0x4
  102d98:	e5c63043 	strb	r3, [r6, #67]
  102d9c:	e586402c 	str	r4, [r6, #44]
  102da0:	e1a00009 	mov	r0, r9
  102da4:	ebfffd08 	bl	1021cc <vListInitialiseItem>
  102da8:	e2860018 	add	r0, r6, #24	; 0x18
  102dac:	ebfffd06 	bl	1021cc <vListInitialiseItem>
  102db0:	e5960030 	ldr	r0, [r6, #48]
  102db4:	e2644005 	rsb	r4, r4, #5	; 0x5
  102db8:	e0800107 	add	r0, r0, r7, lsl #2
  102dbc:	e1a0100a 	mov	r1, sl
  102dc0:	e1a02008 	mov	r2, r8
  102dc4:	e5864018 	str	r4, [r6, #24]
  102dc8:	e5866010 	str	r6, [r6, #16]
  102dcc:	e5866024 	str	r6, [r6, #36]
  102dd0:	e2400004 	sub	r0, r0, #4	; 0x4
  102dd4:	eb000177 	bl	1033b8 <pxPortInitialiseStack>
  102dd8:	e5860000 	str	r0, [r6]
  102ddc:	eb00020c 	bl	103614 <vPortEnterCritical>
  102de0:	e59f2140 	ldr	r2, [pc, #320]	; 102f28 <prog+0x2ee4>
  102de4:	e5923000 	ldr	r3, [r2]
  102de8:	e2833001 	add	r3, r3, #1	; 0x1
  102dec:	e5823000 	str	r3, [r2]
  102df0:	e5921000 	ldr	r1, [r2]
  102df4:	e3510001 	cmp	r1, #1	; 0x1
  102df8:	0a00002a 	beq	102ea8 <xTaskCreate+0x188>
  102dfc:	e59f7128 	ldr	r7, [pc, #296]	; 102f2c <prog+0x2ee8>
  102e00:	e5973000 	ldr	r3, [r7]
  102e04:	e3530000 	cmp	r3, #0	; 0x0
  102e08:	0a00001c 	beq	102e80 <xTaskCreate+0x160>
  102e0c:	e59f811c 	ldr	r8, [pc, #284]	; 102f30 <prog+0x2eec>
  102e10:	e59f111c 	ldr	r1, [pc, #284]	; 102f34 <prog+0x2ef0>
  102e14:	e596202c 	ldr	r2, [r6, #44]
  102e18:	e5913000 	ldr	r3, [r1]
  102e1c:	e1520003 	cmp	r2, r3
  102e20:	85812000 	strhi	r2, [r1]
  102e24:	e59f110c 	ldr	r1, [pc, #268]	; 102f38 <prog+0x2ef4>
  102e28:	e5913000 	ldr	r3, [r1]
  102e2c:	e0820102 	add	r0, r2, r2, lsl #2
  102e30:	e1520003 	cmp	r2, r3
  102e34:	85812000 	strhi	r2, [r1]
  102e38:	e0880100 	add	r0, r8, r0, lsl #2
  102e3c:	e1a01009 	mov	r1, r9
  102e40:	ebfffce4 	bl	1021d8 <vListInsertEnd>
  102e44:	eb0001fd 	bl	103640 <vPortExitCritical>
  102e48:	e59d3028 	ldr	r3, [sp, #40]
  102e4c:	e3530000 	cmp	r3, #0	; 0x0
  102e50:	15836000 	strne	r6, [r3]
  102e54:	e5973000 	ldr	r3, [r7]
  102e58:	e3530000 	cmp	r3, #0	; 0x0
  102e5c:	0a00000f 	beq	102ea0 <xTaskCreate+0x180>
  102e60:	e59f30d4 	ldr	r3, [pc, #212]	; 102f3c <prog+0x2ef8>
  102e64:	e5932000 	ldr	r2, [r3]
  102e68:	e592102c 	ldr	r1, [r2, #44]
  102e6c:	e151000b 	cmp	r1, fp
  102e70:	2a00000a 	bcs	102ea0 <xTaskCreate+0x180>
  102e74:	ef000000 	swi	0x00000000
  102e78:	e3a00001 	mov	r0, #1	; 0x1
  102e7c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102e80:	e59f10b4 	ldr	r1, [pc, #180]	; 102f3c <prog+0x2ef8>
  102e84:	e5913000 	ldr	r3, [r1]
  102e88:	e593202c 	ldr	r2, [r3, #44]
  102e8c:	e15b0002 	cmp	fp, r2
  102e90:	259f8098 	ldrcs	r8, [pc, #152]	; 102f30 <prog+0x2eec>
  102e94:	25816000 	strcs	r6, [r1]
  102e98:	2affffdc 	bcs	102e10 <xTaskCreate+0xf0>
  102e9c:	eaffffda 	b	102e0c <xTaskCreate+0xec>
  102ea0:	e3a00001 	mov	r0, #1	; 0x1
  102ea4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102ea8:	e59f308c 	ldr	r3, [pc, #140]	; 102f3c <prog+0x2ef8>
  102eac:	e59f807c 	ldr	r8, [pc, #124]	; 102f30 <prog+0x2eec>
  102eb0:	e5836000 	str	r6, [r3]
  102eb4:	e1a04008 	mov	r4, r8
  102eb8:	e2885064 	add	r5, r8, #100	; 0x64
  102ebc:	e1a00004 	mov	r0, r4
  102ec0:	e2844014 	add	r4, r4, #20	; 0x14
  102ec4:	ebfffcb7 	bl	1021a8 <vListInitialise>
  102ec8:	e1540005 	cmp	r4, r5
  102ecc:	1afffffa 	bne	102ebc <xTaskCreate+0x19c>
  102ed0:	e59f4068 	ldr	r4, [pc, #104]	; 102f40 <prog+0x2efc>
  102ed4:	e59f5068 	ldr	r5, [pc, #104]	; 102f44 <prog+0x2f00>
  102ed8:	e1a00004 	mov	r0, r4
  102edc:	ebfffcb1 	bl	1021a8 <vListInitialise>
  102ee0:	e1a00005 	mov	r0, r5
  102ee4:	ebfffcaf 	bl	1021a8 <vListInitialise>
  102ee8:	e59f0058 	ldr	r0, [pc, #88]	; 102f48 <prog+0x2f04>
  102eec:	ebfffcad 	bl	1021a8 <vListInitialise>
  102ef0:	e59f0054 	ldr	r0, [pc, #84]	; 102f4c <prog+0x2f08>
  102ef4:	ebfffcab 	bl	1021a8 <vListInitialise>
  102ef8:	e59f0050 	ldr	r0, [pc, #80]	; 102f50 <prog+0x2f0c>
  102efc:	ebfffca9 	bl	1021a8 <vListInitialise>
  102f00:	e59f7024 	ldr	r7, [pc, #36]	; 102f2c <prog+0x2ee8>
  102f04:	e59f3048 	ldr	r3, [pc, #72]	; 102f54 <prog+0x2f10>
  102f08:	e59f2048 	ldr	r2, [pc, #72]	; 102f58 <prog+0x2f14>
  102f0c:	e5834000 	str	r4, [r3]
  102f10:	e5825000 	str	r5, [r2]
  102f14:	eaffffbd 	b	102e10 <xTaskCreate+0xf0>
  102f18:	e1a00006 	mov	r0, r6
  102f1c:	eb000232 	bl	1037ec <vPortFree>
  102f20:	e3e00000 	mvn	r0, #0	; 0x0
  102f24:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102f28:	00200c34 	eoreq	r0, r0, r4, lsr ip
  102f2c:	00200c38 	eoreq	r0, r0, r8, lsr ip
  102f30:	00200c44 	eoreq	r0, r0, r4, asr #24
  102f34:	00200c40 	eoreq	r0, r0, r0, asr #24
  102f38:	00200c2c 	eoreq	r0, r0, ip, lsr #24
  102f3c:	00200c18 	eoreq	r0, r0, r8, lsl ip
  102f40:	00200ca8 	eoreq	r0, r0, r8, lsr #25
  102f44:	00200cbc 	streqh	r0, [r0], -ip
  102f48:	00200cd8 	ldreqd	r0, [r0], -r8
  102f4c:	00200cec 	eoreq	r0, r0, ip, ror #25
  102f50:	00200d00 	eoreq	r0, r0, r0, lsl #26
  102f54:	00200cd0 	ldreqd	r0, [r0], -r0
  102f58:	00200cd4 	ldreqd	r0, [r0], -r4

00102f5c <vTaskStartScheduler>:
  102f5c:	e92d4010 	stmdb	sp!, {r4, lr}
  102f60:	e3a04000 	mov	r4, #0	; 0x0
  102f64:	e24dd008 	sub	sp, sp, #8	; 0x8
  102f68:	e59f1054 	ldr	r1, [pc, #84]	; 102fc4 <prog+0x2f80>
  102f6c:	e3a0206e 	mov	r2, #110	; 0x6e
  102f70:	e1a03004 	mov	r3, r4
  102f74:	e59f004c 	ldr	r0, [pc, #76]	; 102fc8 <prog+0x2f84>
  102f78:	e58d4000 	str	r4, [sp]
  102f7c:	e58d4004 	str	r4, [sp, #4]
  102f80:	ebffff66 	bl	102d20 <xTaskCreate>
  102f84:	e3500001 	cmp	r0, #1	; 0x1
  102f88:	0a000001 	beq	102f94 <vTaskStartScheduler+0x38>
  102f8c:	e28dd008 	add	sp, sp, #8	; 0x8
  102f90:	e8bd8010 	ldmia	sp!, {r4, pc}
  102f94:	e92d0001 	stmdb	sp!, {r0}
  102f98:	e10f0000 	mrs	r0, CPSR
  102f9c:	e38000c0 	orr	r0, r0, #192	; 0xc0
  102fa0:	e129f000 	msr	CPSR_fc, r0
  102fa4:	e8bd0001 	ldmia	sp!, {r0}
  102fa8:	e59f301c 	ldr	r3, [pc, #28]	; 102fcc <prog+0x2f88>
  102fac:	e59f201c 	ldr	r2, [pc, #28]	; 102fd0 <prog+0x2f8c>
  102fb0:	e5830000 	str	r0, [r3]
  102fb4:	e5824000 	str	r4, [r2]
  102fb8:	e28dd008 	add	sp, sp, #8	; 0x8
  102fbc:	e8bd4010 	ldmia	sp!, {r4, lr}
  102fc0:	ea00016c 	b	103578 <xPortStartScheduler>
  102fc4:	00104ad4 	ldreqsb	r4, [r0], -r4
  102fc8:	00103258 	andeqs	r3, r0, r8, asr r2
  102fcc:	00200c38 	eoreq	r0, r0, r8, lsr ip
  102fd0:	00200c24 	eoreq	r0, r0, r4, lsr #24

00102fd4 <xTaskResumeAll>:
  102fd4:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  102fd8:	e59fb248 	ldr	fp, [pc, #584]	; 103228 <prog+0x31e4>
  102fdc:	eb00018c 	bl	103614 <vPortEnterCritical>
  102fe0:	e59b3000 	ldr	r3, [fp]
  102fe4:	e2433001 	sub	r3, r3, #1	; 0x1
  102fe8:	e58b3000 	str	r3, [fp]
  102fec:	e59b1000 	ldr	r1, [fp]
  102ff0:	e3510000 	cmp	r1, #0	; 0x0
  102ff4:	1a000006 	bne	103014 <xTaskResumeAll+0x40>
  102ff8:	e59f322c 	ldr	r3, [pc, #556]	; 10322c <prog+0x31e8>
  102ffc:	e5932000 	ldr	r2, [r3]
  103000:	e3520000 	cmp	r2, #0	; 0x0
  103004:	159f9224 	ldrne	r9, [pc, #548]	; 103230 <prog+0x31ec>
  103008:	11a06001 	movne	r6, r1
  10300c:	11a0a009 	movne	sl, r9
  103010:	1a00001a 	bne	103080 <xTaskResumeAll+0xac>
  103014:	eb000189 	bl	103640 <vPortExitCritical>
  103018:	e3a04000 	mov	r4, #0	; 0x0
  10301c:	e1a00004 	mov	r0, r4
  103020:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  103024:	e599300c 	ldr	r3, [r9, #12]
  103028:	e593400c 	ldr	r4, [r3, #12]
  10302c:	e3540000 	cmp	r4, #0	; 0x0
  103030:	e2840018 	add	r0, r4, #24	; 0x18
  103034:	e2845004 	add	r5, r4, #4	; 0x4
  103038:	0a000015 	beq	103094 <xTaskResumeAll+0xc0>
  10303c:	ebfffc8b 	bl	102270 <vListRemove>
  103040:	e1a00005 	mov	r0, r5
  103044:	ebfffc89 	bl	102270 <vListRemove>
  103048:	e594202c 	ldr	r2, [r4, #44]
  10304c:	e5973000 	ldr	r3, [r7]
  103050:	e0820102 	add	r0, r2, r2, lsl #2
  103054:	e1520003 	cmp	r2, r3
  103058:	e1a01005 	mov	r1, r5
  10305c:	e0880100 	add	r0, r8, r0, lsl #2
  103060:	85872000 	strhi	r2, [r7]
  103064:	ebfffc5b 	bl	1021d8 <vListInsertEnd>
  103068:	e59f31c4 	ldr	r3, [pc, #452]	; 103234 <prog+0x31f0>
  10306c:	e5932000 	ldr	r2, [r3]
  103070:	e594102c 	ldr	r1, [r4, #44]
  103074:	e592302c 	ldr	r3, [r2, #44]
  103078:	e1510003 	cmp	r1, r3
  10307c:	23a06001 	movcs	r6, #1	; 0x1
  103080:	e59a3000 	ldr	r3, [sl]
  103084:	e3530000 	cmp	r3, #0	; 0x0
  103088:	e59f81a8 	ldr	r8, [pc, #424]	; 103238 <prog+0x31f4>
  10308c:	e59f71a8 	ldr	r7, [pc, #424]	; 10323c <prog+0x31f8>
  103090:	1affffe3 	bne	103024 <xTaskResumeAll+0x50>
  103094:	e59fa1a4 	ldr	sl, [pc, #420]	; 103240 <prog+0x31fc>
  103098:	e59a3000 	ldr	r3, [sl]
  10309c:	e3530000 	cmp	r3, #0	; 0x0
  1030a0:	0a000059 	beq	10320c <xTaskResumeAll+0x238>
  1030a4:	e59a3000 	ldr	r3, [sl]
  1030a8:	e3530000 	cmp	r3, #0	; 0x0
  1030ac:	0a00004e 	beq	1031ec <xTaskResumeAll+0x218>
  1030b0:	e59b3000 	ldr	r3, [fp]
  1030b4:	e3530000 	cmp	r3, #0	; 0x0
  1030b8:	159a3000 	ldrne	r3, [sl]
  1030bc:	12833001 	addne	r3, r3, #1	; 0x1
  1030c0:	158a3000 	strne	r3, [sl]
  1030c4:	1a000042 	bne	1031d4 <xTaskResumeAll+0x200>
  1030c8:	e59f6174 	ldr	r6, [pc, #372]	; 103244 <prog+0x3200>
  1030cc:	e5963000 	ldr	r3, [r6]
  1030d0:	e2833001 	add	r3, r3, #1	; 0x1
  1030d4:	e5863000 	str	r3, [r6]
  1030d8:	e5962000 	ldr	r2, [r6]
  1030dc:	e3520000 	cmp	r2, #0	; 0x0
  1030e0:	e1a0c006 	mov	ip, r6
  1030e4:	159f915c 	ldrne	r9, [pc, #348]	; 103248 <prog+0x3204>
  1030e8:	1a000009 	bne	103114 <xTaskResumeAll+0x140>
  1030ec:	e59f9154 	ldr	r9, [pc, #340]	; 103248 <prog+0x3204>
  1030f0:	e59f1154 	ldr	r1, [pc, #340]	; 10324c <prog+0x3208>
  1030f4:	e5990000 	ldr	r0, [r9]
  1030f8:	e5913000 	ldr	r3, [r1]
  1030fc:	e59f214c 	ldr	r2, [pc, #332]	; 103250 <prog+0x320c>
  103100:	e5893000 	str	r3, [r9]
  103104:	e5810000 	str	r0, [r1]
  103108:	e5923000 	ldr	r3, [r2]
  10310c:	e2833001 	add	r3, r3, #1	; 0x1
  103110:	e5823000 	str	r3, [r2]
  103114:	e5993000 	ldr	r3, [r9]
  103118:	e5932000 	ldr	r2, [r3]
  10311c:	e3520000 	cmp	r2, #0	; 0x0
  103120:	0a00002b 	beq	1031d4 <xTaskResumeAll+0x200>
  103124:	e59f311c 	ldr	r3, [pc, #284]	; 103248 <prog+0x3204>
  103128:	e5932000 	ldr	r2, [r3]
  10312c:	e592100c 	ldr	r1, [r2, #12]
  103130:	e591300c 	ldr	r3, [r1, #12]
  103134:	e3530000 	cmp	r3, #0	; 0x0
  103138:	0a000025 	beq	1031d4 <xTaskResumeAll+0x200>
  10313c:	e1a04003 	mov	r4, r3
  103140:	e59c2000 	ldr	r2, [ip]
  103144:	e5933004 	ldr	r3, [r3, #4]
  103148:	e1530002 	cmp	r3, r2
  10314c:	959f70e8 	ldrls	r7, [pc, #232]	; 10323c <prog+0x31f8>
  103150:	959f80e0 	ldrls	r8, [pc, #224]	; 103238 <prog+0x31f4>
  103154:	9a00000a 	bls	103184 <xTaskResumeAll+0x1b0>
  103158:	ea00001d 	b	1031d4 <xTaskResumeAll+0x200>
  10315c:	e59f30e4 	ldr	r3, [pc, #228]	; 103248 <prog+0x3204>
  103160:	e5932000 	ldr	r2, [r3]
  103164:	e592100c 	ldr	r1, [r2, #12]
  103168:	e591300c 	ldr	r3, [r1, #12]
  10316c:	e2534000 	subs	r4, r3, #0	; 0x0
  103170:	0a000017 	beq	1031d4 <xTaskResumeAll+0x200>
  103174:	e5962000 	ldr	r2, [r6]
  103178:	e5943004 	ldr	r3, [r4, #4]
  10317c:	e1530002 	cmp	r3, r2
  103180:	8a000013 	bhi	1031d4 <xTaskResumeAll+0x200>
  103184:	e2845004 	add	r5, r4, #4	; 0x4
  103188:	e1a00005 	mov	r0, r5
  10318c:	ebfffc37 	bl	102270 <vListRemove>
  103190:	e5943028 	ldr	r3, [r4, #40]
  103194:	e3530000 	cmp	r3, #0	; 0x0
  103198:	e2840018 	add	r0, r4, #24	; 0x18
  10319c:	1bfffc33 	blne	102270 <vListRemove>
  1031a0:	e594202c 	ldr	r2, [r4, #44]
  1031a4:	e5973000 	ldr	r3, [r7]
  1031a8:	e1520003 	cmp	r2, r3
  1031ac:	859f3088 	ldrhi	r3, [pc, #136]	; 10323c <prog+0x31f8>
  1031b0:	e0820102 	add	r0, r2, r2, lsl #2
  1031b4:	85832000 	strhi	r2, [r3]
  1031b8:	e1a01005 	mov	r1, r5
  1031bc:	e0880100 	add	r0, r8, r0, lsl #2
  1031c0:	ebfffc04 	bl	1021d8 <vListInsertEnd>
  1031c4:	e5993000 	ldr	r3, [r9]
  1031c8:	e5932000 	ldr	r2, [r3]
  1031cc:	e3520000 	cmp	r2, #0	; 0x0
  1031d0:	1affffe1 	bne	10315c <xTaskResumeAll+0x188>
  1031d4:	e59a3000 	ldr	r3, [sl]
  1031d8:	e2433001 	sub	r3, r3, #1	; 0x1
  1031dc:	e58a3000 	str	r3, [sl]
  1031e0:	e59a2000 	ldr	r2, [sl]
  1031e4:	e3520000 	cmp	r2, #0	; 0x0
  1031e8:	1affffb0 	bne	1030b0 <xTaskResumeAll+0xdc>
  1031ec:	e59f2060 	ldr	r2, [pc, #96]	; 103254 <prog+0x3210>
  1031f0:	e3a03000 	mov	r3, #0	; 0x0
  1031f4:	e5823000 	str	r3, [r2]
  1031f8:	ef000000 	swi	0x00000000
  1031fc:	eb00010f 	bl	103640 <vPortExitCritical>
  103200:	e3a04001 	mov	r4, #1	; 0x1
  103204:	e1a00004 	mov	r0, r4
  103208:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10320c:	e3560001 	cmp	r6, #1	; 0x1
  103210:	0afffff5 	beq	1031ec <xTaskResumeAll+0x218>
  103214:	e59f2038 	ldr	r2, [pc, #56]	; 103254 <prog+0x3210>
  103218:	e5923000 	ldr	r3, [r2]
  10321c:	e3530001 	cmp	r3, #1	; 0x1
  103220:	1affff7b 	bne	103014 <xTaskResumeAll+0x40>
  103224:	eafffff1 	b	1031f0 <xTaskResumeAll+0x21c>
  103228:	00200c28 	eoreq	r0, r0, r8, lsr #24
  10322c:	00200c34 	eoreq	r0, r0, r4, lsr ip
  103230:	00200cd8 	ldreqd	r0, [r0], -r8
  103234:	00200c18 	eoreq	r0, r0, r8, lsl ip
  103238:	00200c44 	eoreq	r0, r0, r4, asr #24
  10323c:	00200c2c 	eoreq	r0, r0, ip, lsr #24
  103240:	00200c30 	eoreq	r0, r0, r0, lsr ip
  103244:	00200c24 	eoreq	r0, r0, r4, lsr #24
  103248:	00200cd0 	ldreqd	r0, [r0], -r0
  10324c:	00200cd4 	ldreqd	r0, [r0], -r4
  103250:	00200c20 	eoreq	r0, r0, r0, lsr #24
  103254:	00200c1c 	eoreq	r0, r0, ip, lsl ip

00103258 <prvIdleTask>:
  103258:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  10325c:	e59f50a0 	ldr	r5, [pc, #160]	; 103304 <prog+0x32c0>
  103260:	e5953000 	ldr	r3, [r5]
  103264:	e59f709c 	ldr	r7, [pc, #156]	; 103308 <prog+0x32c4>
  103268:	e3530000 	cmp	r3, #0	; 0x0
  10326c:	e59f8098 	ldr	r8, [pc, #152]	; 10330c <prog+0x32c8>
  103270:	e59f6098 	ldr	r6, [pc, #152]	; 103310 <prog+0x32cc>
  103274:	e287a008 	add	sl, r7, #8	; 0x8
  103278:	1a000007 	bne	10329c <prvIdleTask+0x44>
  10327c:	e5963000 	ldr	r3, [r6]
  103280:	e3530001 	cmp	r3, #1	; 0x1
  103284:	9a000000 	bls	10328c <prvIdleTask+0x34>
  103288:	ef000000 	swi	0x00000000
  10328c:	ebfff777 	bl	101070 <vApplicationIdleHook>
  103290:	e5953000 	ldr	r3, [r5]
  103294:	e3530000 	cmp	r3, #0	; 0x0
  103298:	0afffff7 	beq	10327c <prvIdleTask+0x24>
  10329c:	ebfffdef 	bl	102a60 <vTaskSuspendAll>
  1032a0:	e5974000 	ldr	r4, [r7]
  1032a4:	ebffff4a 	bl	102fd4 <xTaskResumeAll>
  1032a8:	e3540000 	cmp	r4, #0	; 0x0
  1032ac:	0afffff2 	beq	10327c <prvIdleTask+0x24>
  1032b0:	eb0000d7 	bl	103614 <vPortEnterCritical>
  1032b4:	e59f304c 	ldr	r3, [pc, #76]	; 103308 <prog+0x32c4>
  1032b8:	e5932000 	ldr	r2, [r3]
  1032bc:	e3520000 	cmp	r2, #0	; 0x0
  1032c0:	159a3004 	ldrne	r3, [sl, #4]
  1032c4:	e1a04002 	mov	r4, r2
  1032c8:	1593400c 	ldrne	r4, [r3, #12]
  1032cc:	e2840004 	add	r0, r4, #4	; 0x4
  1032d0:	ebfffbe6 	bl	102270 <vListRemove>
  1032d4:	e5983000 	ldr	r3, [r8]
  1032d8:	e2433001 	sub	r3, r3, #1	; 0x1
  1032dc:	e5883000 	str	r3, [r8]
  1032e0:	e5952000 	ldr	r2, [r5]
  1032e4:	e2422001 	sub	r2, r2, #1	; 0x1
  1032e8:	e5852000 	str	r2, [r5]
  1032ec:	eb0000d3 	bl	103640 <vPortExitCritical>
  1032f0:	e5940030 	ldr	r0, [r4, #48]
  1032f4:	eb00013c 	bl	1037ec <vPortFree>
  1032f8:	e1a00004 	mov	r0, r4
  1032fc:	eb00013a 	bl	1037ec <vPortFree>
  103300:	eaffffdd 	b	10327c <prvIdleTask+0x24>
  103304:	00200c3c 	eoreq	r0, r0, ip, lsr ip
  103308:	00200cec 	eoreq	r0, r0, ip, ror #25
  10330c:	00200c34 	eoreq	r0, r0, r4, lsr ip
  103310:	00200c44 	eoreq	r0, r0, r4, asr #24

00103314 <vTaskDelay>:
  103314:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  103318:	e2505000 	subs	r5, r0, #0	; 0x0
  10331c:	e59f6084 	ldr	r6, [pc, #132]	; 1033a8 <prog+0x3364>
  103320:	e59f7084 	ldr	r7, [pc, #132]	; 1033ac <prog+0x3368>
  103324:	1a000001 	bne	103330 <vTaskDelay+0x1c>
  103328:	ef000000 	swi	0x00000000
  10332c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  103330:	ebfffdca 	bl	102a60 <vTaskSuspendAll>
  103334:	e5974000 	ldr	r4, [r7]
  103338:	e5960000 	ldr	r0, [r6]
  10333c:	e2800004 	add	r0, r0, #4	; 0x4
  103340:	ebfffbca 	bl	102270 <vListRemove>
  103344:	e5962000 	ldr	r2, [r6]
  103348:	e5973000 	ldr	r3, [r7]
  10334c:	e0854004 	add	r4, r5, r4
  103350:	e1540003 	cmp	r4, r3
  103354:	e5824004 	str	r4, [r2, #4]
  103358:	2a000009 	bcs	103384 <vTaskDelay+0x70>
  10335c:	e59f304c 	ldr	r3, [pc, #76]	; 1033b0 <prog+0x336c>
  103360:	e5930000 	ldr	r0, [r3]
  103364:	e5961000 	ldr	r1, [r6]
  103368:	e2811004 	add	r1, r1, #4	; 0x4
  10336c:	ebfffba6 	bl	10220c <vListInsert>
  103370:	ebffff17 	bl	102fd4 <xTaskResumeAll>
  103374:	e3500000 	cmp	r0, #0	; 0x0
  103378:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
  10337c:	ef000000 	swi	0x00000000
  103380:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  103384:	e59f3028 	ldr	r3, [pc, #40]	; 1033b4 <prog+0x3370>
  103388:	e5930000 	ldr	r0, [r3]
  10338c:	e5961000 	ldr	r1, [r6]
  103390:	e2811004 	add	r1, r1, #4	; 0x4
  103394:	ebfffb9c 	bl	10220c <vListInsert>
  103398:	ebffff0d 	bl	102fd4 <xTaskResumeAll>
  10339c:	e3500000 	cmp	r0, #0	; 0x0
  1033a0:	0afffff5 	beq	10337c <vTaskDelay+0x68>
  1033a4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1033a8:	00200c18 	eoreq	r0, r0, r8, lsl ip
  1033ac:	00200c24 	eoreq	r0, r0, r4, lsr #24
  1033b0:	00200cd4 	ldreqd	r0, [r0], -r4
  1033b4:	00200cd0 	ldreqd	r0, [r0], -r0

001033b8 <pxPortInitialiseStack>:
  1033b8:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1033bc:	e2811004 	add	r1, r1, #4	; 0x4
  1033c0:	e1a0b000 	mov	fp, r0
  1033c4:	e40b1004 	str	r1, [fp], #-4
  1033c8:	e24b1004 	sub	r1, fp, #4	; 0x4
  1033cc:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  1033d0:	e2413004 	sub	r3, r1, #4	; 0x4
  1033d4:	e58d1004 	str	r1, [sp, #4]
  1033d8:	e2431004 	sub	r1, r3, #4	; 0x4
  1033dc:	e58d3008 	str	r3, [sp, #8]
  1033e0:	e2413004 	sub	r3, r1, #4	; 0x4
  1033e4:	e58d100c 	str	r1, [sp, #12]
  1033e8:	e2431004 	sub	r1, r3, #4	; 0x4
  1033ec:	e58d3010 	str	r3, [sp, #16]
  1033f0:	e2413004 	sub	r3, r1, #4	; 0x4
  1033f4:	e58d1014 	str	r1, [sp, #20]
  1033f8:	e2431004 	sub	r1, r3, #4	; 0x4
  1033fc:	e58d3018 	str	r3, [sp, #24]
  103400:	e2413004 	sub	r3, r1, #4	; 0x4
  103404:	e58d101c 	str	r1, [sp, #28]
  103408:	e2431004 	sub	r1, r3, #4	; 0x4
  10340c:	e58d3020 	str	r3, [sp, #32]
  103410:	e2413004 	sub	r3, r1, #4	; 0x4
  103414:	e58d1024 	str	r1, [sp, #36]
  103418:	e2431004 	sub	r1, r3, #4	; 0x4
  10341c:	e58d3028 	str	r3, [sp, #40]
  103420:	e2413004 	sub	r3, r1, #4	; 0x4
  103424:	e58d102c 	str	r1, [sp, #44]
  103428:	e2431004 	sub	r1, r3, #4	; 0x4
  10342c:	e58d1034 	str	r1, [sp, #52]
  103430:	e58d3030 	str	r3, [sp, #48]
  103434:	e59d3034 	ldr	r3, [sp, #52]
  103438:	e2433004 	sub	r3, r3, #4	; 0x4
  10343c:	e58d0000 	str	r0, [sp]
  103440:	e58d3038 	str	r3, [sp, #56]
  103444:	e2430004 	sub	r0, r3, #4	; 0x4
  103448:	e3a03caa 	mov	r3, #43520	; 0xaa00
  10344c:	e59d1000 	ldr	r1, [sp]
  103450:	e28330aa 	add	r3, r3, #170	; 0xaa
  103454:	e1833803 	orr	r3, r3, r3, lsl #16
  103458:	e5013004 	str	r3, [r1, #-4]
  10345c:	e3a03c12 	mov	r3, #4608	; 0x1200
  103460:	e50b1004 	str	r1, [fp, #-4]
  103464:	e2833012 	add	r3, r3, #18	; 0x12
  103468:	e59d1004 	ldr	r1, [sp, #4]
  10346c:	e1833803 	orr	r3, r3, r3, lsl #16
  103470:	e3a09c11 	mov	r9, #4352	; 0x1100
  103474:	e3a0aa01 	mov	sl, #4096	; 0x1000
  103478:	e5013004 	str	r3, [r1, #-4]
  10347c:	e2899011 	add	r9, r9, #17	; 0x11
  103480:	e28d1008 	add	r1, sp, #8	; 0x8
  103484:	e891000a 	ldmia	r1, {r1, r3}
  103488:	e28aa010 	add	sl, sl, #16	; 0x10
  10348c:	e1899809 	orr	r9, r9, r9, lsl #16
  103490:	e18aa80a 	orr	sl, sl, sl, lsl #16
  103494:	e3a08c09 	mov	r8, #2304	; 0x900
  103498:	e3a07b02 	mov	r7, #2048	; 0x800
  10349c:	e5019004 	str	r9, [r1, #-4]
  1034a0:	e2888009 	add	r8, r8, #9	; 0x9
  1034a4:	e503a004 	str	sl, [r3, #-4]
  1034a8:	e28d1010 	add	r1, sp, #16	; 0x10
  1034ac:	e891000a 	ldmia	r1, {r1, r3}
  1034b0:	e2877008 	add	r7, r7, #8	; 0x8
  1034b4:	e1888808 	orr	r8, r8, r8, lsl #16
  1034b8:	e1877807 	orr	r7, r7, r7, lsl #16
  1034bc:	e3a06c07 	mov	r6, #1792	; 0x700
  1034c0:	e3a05c06 	mov	r5, #1536	; 0x600
  1034c4:	e5018004 	str	r8, [r1, #-4]
  1034c8:	e2866007 	add	r6, r6, #7	; 0x7
  1034cc:	e5037004 	str	r7, [r3, #-4]
  1034d0:	e28d1018 	add	r1, sp, #24	; 0x18
  1034d4:	e891000a 	ldmia	r1, {r1, r3}
  1034d8:	e2855006 	add	r5, r5, #6	; 0x6
  1034dc:	e1866806 	orr	r6, r6, r6, lsl #16
  1034e0:	e1855805 	orr	r5, r5, r5, lsl #16
  1034e4:	e3a04c05 	mov	r4, #1280	; 0x500
  1034e8:	e5016004 	str	r6, [r1, #-4]
  1034ec:	e2844005 	add	r4, r4, #5	; 0x5
  1034f0:	e5035004 	str	r5, [r3, #-4]
  1034f4:	e59d1020 	ldr	r1, [sp, #32]
  1034f8:	e1844804 	orr	r4, r4, r4, lsl #16
  1034fc:	e3a0eb01 	mov	lr, #1024	; 0x400
  103500:	e3a0cc03 	mov	ip, #768	; 0x300
  103504:	e5014004 	str	r4, [r1, #-4]
  103508:	e59d3024 	ldr	r3, [sp, #36]
  10350c:	e59d1028 	ldr	r1, [sp, #40]
  103510:	e28ee004 	add	lr, lr, #4	; 0x4
  103514:	e28cc003 	add	ip, ip, #3	; 0x3
  103518:	e18ee80e 	orr	lr, lr, lr, lsl #16
  10351c:	e18cc80c 	orr	ip, ip, ip, lsl #16
  103520:	e503e004 	str	lr, [r3, #-4]
  103524:	e501c004 	str	ip, [r1, #-4]
  103528:	e3a01c02 	mov	r1, #512	; 0x200
  10352c:	e59d302c 	ldr	r3, [sp, #44]
  103530:	e2811002 	add	r1, r1, #2	; 0x2
  103534:	e1811801 	orr	r1, r1, r1, lsl #16
  103538:	e5031004 	str	r1, [r3, #-4]
  10353c:	e3a01c01 	mov	r1, #256	; 0x100
  103540:	e59d3030 	ldr	r3, [sp, #48]
  103544:	e2811001 	add	r1, r1, #1	; 0x1
  103548:	e1811801 	orr	r1, r1, r1, lsl #16
  10354c:	e5031004 	str	r1, [r3, #-4]
  103550:	e59d3034 	ldr	r3, [sp, #52]
  103554:	e59d1038 	ldr	r1, [sp, #56]
  103558:	e5032004 	str	r2, [r3, #-4]
  10355c:	e3a0301f 	mov	r3, #31	; 0x1f
  103560:	e3a02000 	mov	r2, #0	; 0x0
  103564:	e5013004 	str	r3, [r1, #-4]
  103568:	e5002004 	str	r2, [r0, #-4]
  10356c:	e2400004 	sub	r0, r0, #4	; 0x4
  103570:	e28dd03c 	add	sp, sp, #60	; 0x3c
  103574:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00103578 <xPortStartScheduler>:
  103578:	e52de004 	str	lr, [sp, #-4]!
  10357c:	e3a01007 	mov	r1, #7	; 0x7
  103580:	e3a02000 	mov	r2, #0	; 0x0
  103584:	e59f3030 	ldr	r3, [pc, #48]	; 1035bc <prog+0x3578>
  103588:	e3a00001 	mov	r0, #1	; 0x1
  10358c:	ebfffad3 	bl	1020e0 <AT91F_AIC_ConfigureIt>
  103590:	e3a03403 	mov	r3, #50331648	; 0x3000000
  103594:	e2833ebb 	add	r3, r3, #2992	; 0xbb0
  103598:	e3e02c02 	mvn	r2, #512	; 0x200
  10359c:	e2833003 	add	r3, r3, #3	; 0x3
  1035a0:	e50230cf 	str	r3, [r2, #-207]
  1035a4:	e3a01002 	mov	r1, #2	; 0x2
  1035a8:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  1035ac:	e5831021 	str	r1, [r3, #33]
  1035b0:	eb000002 	bl	1035c0 <vPortISRStartFirstTask>
  1035b4:	e3a00000 	mov	r0, #0	; 0x0
  1035b8:	e49df004 	ldr	pc, [sp], #4
  1035bc:	00103684 	andeqs	r3, r0, r4, lsl #13

001035c0 <vPortISRStartFirstTask>:
  1035c0:	e59f0044 	ldr	r0, [pc, #68]	; 10360c <prog+0x35c8>
  1035c4:	e5900000 	ldr	r0, [r0]
  1035c8:	e590e000 	ldr	lr, [r0]
  1035cc:	e59f003c 	ldr	r0, [pc, #60]	; 103610 <prog+0x35cc>
  1035d0:	e8be0002 	ldmia	lr!, {r1}
  1035d4:	e5801000 	str	r1, [r0]
  1035d8:	e8be0001 	ldmia	lr!, {r0}
  1035dc:	e169f000 	msr	SPSR_fc, r0
  1035e0:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1035e4:	e1a00000 	nop			(mov r0,r0)
  1035e8:	e59ee03c 	ldr	lr, [lr, #60]
  1035ec:	e25ef004 	subs	pc, lr, #4	; 0x4
  1035f0:	e59f300c 	ldr	r3, [pc, #12]	; 103604 <prog+0x35c0>
  1035f4:	e59f200c 	ldr	r2, [pc, #12]	; 103608 <prog+0x35c4>
  1035f8:	e5931000 	ldr	r1, [r3]
  1035fc:	e5923000 	ldr	r3, [r2]
  103600:	e12fff1e 	bx	lr
  103604:	00200820 	eoreq	r0, r0, r0, lsr #16
  103608:	00200c18 	eoreq	r0, r0, r8, lsl ip
  10360c:	00200c18 	eoreq	r0, r0, r8, lsl ip
  103610:	00200820 	eoreq	r0, r0, r0, lsr #16

00103614 <vPortEnterCritical>:
  103614:	e92d0001 	stmdb	sp!, {r0}
  103618:	e10f0000 	mrs	r0, CPSR
  10361c:	e38000c0 	orr	r0, r0, #192	; 0xc0
  103620:	e129f000 	msr	CPSR_fc, r0
  103624:	e8bd0001 	ldmia	sp!, {r0}
  103628:	e59f200c 	ldr	r2, [pc, #12]	; 10363c <prog+0x35f8>
  10362c:	e5923000 	ldr	r3, [r2]
  103630:	e2833001 	add	r3, r3, #1	; 0x1
  103634:	e5823000 	str	r3, [r2]
  103638:	e12fff1e 	bx	lr
  10363c:	00200820 	eoreq	r0, r0, r0, lsr #16

00103640 <vPortExitCritical>:
  103640:	e59f2038 	ldr	r2, [pc, #56]	; 103680 <prog+0x363c>
  103644:	e5923000 	ldr	r3, [r2]
  103648:	e3530000 	cmp	r3, #0	; 0x0
  10364c:	012fff1e 	bxeq	lr
  103650:	e5923000 	ldr	r3, [r2]
  103654:	e2433001 	sub	r3, r3, #1	; 0x1
  103658:	e5823000 	str	r3, [r2]
  10365c:	e5922000 	ldr	r2, [r2]
  103660:	e3520000 	cmp	r2, #0	; 0x0
  103664:	112fff1e 	bxne	lr
  103668:	e92d0001 	stmdb	sp!, {r0}
  10366c:	e10f0000 	mrs	r0, CPSR
  103670:	e3c000c0 	bic	r0, r0, #192	; 0xc0
  103674:	e129f000 	msr	CPSR_fc, r0
  103678:	e8bd0001 	ldmia	sp!, {r0}
  10367c:	e12fff1e 	bx	lr
  103680:	00200820 	eoreq	r0, r0, r0, lsr #16

00103684 <vPreemptiveTick>:
  103684:	e92d0001 	stmdb	sp!, {r0}
  103688:	e94d2000 	stmdb	sp, {sp}^
  10368c:	e1a00000 	nop			(mov r0,r0)
  103690:	e24dd004 	sub	sp, sp, #4	; 0x4
  103694:	e8bd0001 	ldmia	sp!, {r0}
  103698:	e9204000 	stmdb	r0!, {lr}
  10369c:	e1a0e000 	mov	lr, r0
  1036a0:	e8bd0001 	ldmia	sp!, {r0}
  1036a4:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1036a8:	e1a00000 	nop			(mov r0,r0)
  1036ac:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  1036b0:	e14f0000 	mrs	r0, SPSR
  1036b4:	e92e0001 	stmdb	lr!, {r0}
  1036b8:	e59f0078 	ldr	r0, [pc, #120]	; 103738 <prog+0x36f4>
  1036bc:	e5900000 	ldr	r0, [r0]
  1036c0:	e92e0001 	stmdb	lr!, {r0}
  1036c4:	e59f0070 	ldr	r0, [pc, #112]	; 10373c <prog+0x36f8>
  1036c8:	e5900000 	ldr	r0, [r0]
  1036cc:	e580e000 	str	lr, [r0]
  1036d0:	e59f4058 	ldr	r4, [pc, #88]	; 103730 <prog+0x36ec>
  1036d4:	e59f5058 	ldr	r5, [pc, #88]	; 103734 <prog+0x36f0>
  1036d8:	e5943000 	ldr	r3, [r4]
  1036dc:	e5952000 	ldr	r2, [r5]
  1036e0:	ebfffd10 	bl	102b28 <vTaskIncrementTick>
  1036e4:	ebfffc77 	bl	1028c8 <vTaskSwitchContext>
  1036e8:	e3e03c02 	mvn	r3, #512	; 0x200
  1036ec:	e51310c7 	ldr	r1, [r3, #-199]
  1036f0:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  1036f4:	e5821031 	str	r1, [r2, #49]
  1036f8:	e59f003c 	ldr	r0, [pc, #60]	; 10373c <prog+0x36f8>
  1036fc:	e5900000 	ldr	r0, [r0]
  103700:	e590e000 	ldr	lr, [r0]
  103704:	e59f002c 	ldr	r0, [pc, #44]	; 103738 <prog+0x36f4>
  103708:	e8be0002 	ldmia	lr!, {r1}
  10370c:	e5801000 	str	r1, [r0]
  103710:	e8be0001 	ldmia	lr!, {r0}
  103714:	e169f000 	msr	SPSR_fc, r0
  103718:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10371c:	e1a00000 	nop			(mov r0,r0)
  103720:	e59ee03c 	ldr	lr, [lr, #60]
  103724:	e25ef004 	subs	pc, lr, #4	; 0x4
  103728:	e5943000 	ldr	r3, [r4]
  10372c:	e5952000 	ldr	r2, [r5]
  103730:	00200820 	eoreq	r0, r0, r0, lsr #16
  103734:	00200c18 	eoreq	r0, r0, r8, lsl ip
  103738:	00200820 	eoreq	r0, r0, r0, lsr #16
  10373c:	00200c18 	eoreq	r0, r0, r8, lsl ip

00103740 <swi_handler>:
  103740:	e28ee004 	add	lr, lr, #4	; 0x4
  103744:	e92d0001 	stmdb	sp!, {r0}
  103748:	e94d2000 	stmdb	sp, {sp}^
  10374c:	e1a00000 	nop			(mov r0,r0)
  103750:	e24dd004 	sub	sp, sp, #4	; 0x4
  103754:	e8bd0001 	ldmia	sp!, {r0}
  103758:	e9204000 	stmdb	r0!, {lr}
  10375c:	e1a0e000 	mov	lr, r0
  103760:	e8bd0001 	ldmia	sp!, {r0}
  103764:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  103768:	e1a00000 	nop			(mov r0,r0)
  10376c:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  103770:	e14f0000 	mrs	r0, SPSR
  103774:	e92e0001 	stmdb	lr!, {r0}
  103778:	e59f0064 	ldr	r0, [pc, #100]	; 1037e4 <prog+0x37a0>
  10377c:	e5900000 	ldr	r0, [r0]
  103780:	e92e0001 	stmdb	lr!, {r0}
  103784:	e59f005c 	ldr	r0, [pc, #92]	; 1037e8 <prog+0x37a4>
  103788:	e5900000 	ldr	r0, [r0]
  10378c:	e580e000 	str	lr, [r0]
  103790:	e59f4044 	ldr	r4, [pc, #68]	; 1037dc <prog+0x3798>
  103794:	e59f5044 	ldr	r5, [pc, #68]	; 1037e0 <prog+0x379c>
  103798:	e5943000 	ldr	r3, [r4]
  10379c:	e5952000 	ldr	r2, [r5]
  1037a0:	ebfffc48 	bl	1028c8 <vTaskSwitchContext>
  1037a4:	e59f003c 	ldr	r0, [pc, #60]	; 1037e8 <prog+0x37a4>
  1037a8:	e5900000 	ldr	r0, [r0]
  1037ac:	e590e000 	ldr	lr, [r0]
  1037b0:	e59f002c 	ldr	r0, [pc, #44]	; 1037e4 <prog+0x37a0>
  1037b4:	e8be0002 	ldmia	lr!, {r1}
  1037b8:	e5801000 	str	r1, [r0]
  1037bc:	e8be0001 	ldmia	lr!, {r0}
  1037c0:	e169f000 	msr	SPSR_fc, r0
  1037c4:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1037c8:	e1a00000 	nop			(mov r0,r0)
  1037cc:	e59ee03c 	ldr	lr, [lr, #60]
  1037d0:	e25ef004 	subs	pc, lr, #4	; 0x4
  1037d4:	e5943000 	ldr	r3, [r4]
  1037d8:	e5952000 	ldr	r2, [r5]
  1037dc:	00200820 	eoreq	r0, r0, r0, lsr #16
  1037e0:	00200c18 	eoreq	r0, r0, r8, lsl ip
  1037e4:	00200820 	eoreq	r0, r0, r0, lsr #16
  1037e8:	00200c18 	eoreq	r0, r0, r8, lsl ip

001037ec <vPortFree>:
  1037ec:	e92d4010 	stmdb	sp!, {r4, lr}
  1037f0:	e2504000 	subs	r4, r0, #0	; 0x0
  1037f4:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1037f8:	ebfffc98 	bl	102a60 <vTaskSuspendAll>
  1037fc:	e1a00004 	mov	r0, r4
  103800:	ebfff294 	bl	100258 <free>
  103804:	e8bd4010 	ldmia	sp!, {r4, lr}
  103808:	eafffdf1 	b	102fd4 <xTaskResumeAll>

0010380c <pvPortMalloc>:
  10380c:	e92d4010 	stmdb	sp!, {r4, lr}
  103810:	e1a04000 	mov	r4, r0
  103814:	ebfffc91 	bl	102a60 <vTaskSuspendAll>
  103818:	e1a00004 	mov	r0, r4
  10381c:	ebfff292 	bl	10026c <malloc>
  103820:	e1a04000 	mov	r4, r0
  103824:	ebfffdea 	bl	102fd4 <xTaskResumeAll>
  103828:	e1a00004 	mov	r0, r4
  10382c:	e8bd8010 	ldmia	sp!, {r4, pc}

00103830 <vDetachUSBInterface>:
  103830:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  103834:	e3a03801 	mov	r3, #65536	; 0x10000
  103838:	e50230ff 	str	r3, [r2, #-255]
  10383c:	e50230ef 	str	r3, [r2, #-239]
  103840:	e50230cf 	str	r3, [r2, #-207]
  103844:	e12fff1e 	bx	lr

00103848 <usb_send_buffer_zero_copy>:
  103848:	e52de004 	str	lr, [sp, #-4]!
  10384c:	e24dd014 	sub	sp, sp, #20	; 0x14
  103850:	e58d3010 	str	r3, [sp, #16]
  103854:	e59f3028 	ldr	r3, [pc, #40]	; 103884 <prog+0x3840>
  103858:	e3a0c000 	mov	ip, #0	; 0x0
  10385c:	e88d0003 	stmia	sp, {r0, r1}
  103860:	e58d200c 	str	r2, [sp, #12]
  103864:	e5930000 	ldr	r0, [r3]
  103868:	e1a0100d 	mov	r1, sp
  10386c:	e1a0300c 	mov	r3, ip
  103870:	e59d2018 	ldr	r2, [sp, #24]
  103874:	e58dc008 	str	ip, [sp, #8]
  103878:	ebfffb8f 	bl	1026bc <xQueueGenericSend>
  10387c:	e28dd014 	add	sp, sp, #20	; 0x14
  103880:	e8bd8000 	ldmia	sp!, {pc}
  103884:	00200e40 	eoreq	r0, r0, r0, asr #28

00103888 <prvSendStall>:
  103888:	e52de004 	str	lr, [sp, #-4]!
  10388c:	ebffff60 	bl	103614 <vPortEnterCritical>
  103890:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  103894:	e5123fcf 	ldr	r3, [r2, #-4047]
  103898:	e3c33030 	bic	r3, r3, #48	; 0x30
  10389c:	e383306f 	orr	r3, r3, #111	; 0x6f
  1038a0:	e5023fcf 	str	r3, [r2, #-4047]
  1038a4:	e49de004 	ldr	lr, [sp], #4
  1038a8:	eaffff64 	b	103640 <vPortExitCritical>

001038ac <prvSendZLP>:
  1038ac:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  1038b0:	e5123fcf 	ldr	r3, [r2, #-4047]
  1038b4:	e3130010 	tst	r3, #16	; 0x10
  1038b8:	e92d4010 	stmdb	sp!, {r4, lr}
  1038bc:	0a000005 	beq	1038d8 <prvSendZLP+0x2c>
  1038c0:	e1a04002 	mov	r4, r2
  1038c4:	e3a00001 	mov	r0, #1	; 0x1
  1038c8:	ebfffe91 	bl	103314 <vTaskDelay>
  1038cc:	e5143fcf 	ldr	r3, [r4, #-4047]
  1038d0:	e3130010 	tst	r3, #16	; 0x10
  1038d4:	1afffffa 	bne	1038c4 <prvSendZLP+0x18>
  1038d8:	ebffff4d 	bl	103614 <vPortEnterCritical>
  1038dc:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  1038e0:	e59f101c 	ldr	r1, [pc, #28]	; 103904 <prog+0x38c0>
  1038e4:	e5103fcf 	ldr	r3, [r0, #-4047]
  1038e8:	e5912080 	ldr	r2, [r1, #128]
  1038ec:	e3c33030 	bic	r3, r3, #48	; 0x30
  1038f0:	e383305f 	orr	r3, r3, #95	; 0x5f
  1038f4:	e5812084 	str	r2, [r1, #132]
  1038f8:	e5003fcf 	str	r3, [r0, #-4047]
  1038fc:	e8bd4010 	ldmia	sp!, {r4, lr}
  103900:	eaffff4e 	b	103640 <vPortExitCritical>
  103904:	00200d28 	eoreq	r0, r0, r8, lsr #26

00103908 <prvSendNextSegment>:
  103908:	e92d4010 	stmdb	sp!, {r4, lr}
  10390c:	e59f40e4 	ldr	r4, [pc, #228]	; 1039f8 <prog+0x39b4>
  103910:	e5942084 	ldr	r2, [r4, #132]
  103914:	e5943080 	ldr	r3, [r4, #128]
  103918:	e1520003 	cmp	r2, r3
  10391c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  103920:	9a00002a 	bls	1039d0 <prvSendNextSegment+0xc8>
  103924:	e0633002 	rsb	r3, r3, r2
  103928:	e58d3000 	str	r3, [sp]
  10392c:	e59d2000 	ldr	r2, [sp]
  103930:	e3520008 	cmp	r2, #8	; 0x8
  103934:	959d3000 	ldrls	r3, [sp]
  103938:	83a03008 	movhi	r3, #8	; 0x8
  10393c:	858d3008 	strhi	r3, [sp, #8]
  103940:	958d3008 	strls	r3, [sp, #8]
  103944:	ea000001 	b	103950 <prvSendNextSegment+0x48>
  103948:	e3a00001 	mov	r0, #1	; 0x1
  10394c:	ebfffe70 	bl	103314 <vTaskDelay>
  103950:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  103954:	e5132fcf 	ldr	r2, [r3, #-4047]
  103958:	e3120010 	tst	r2, #16	; 0x10
  10395c:	1afffff9 	bne	103948 <prvSendNextSegment+0x40>
  103960:	e59d3008 	ldr	r3, [sp, #8]
  103964:	e3530000 	cmp	r3, #0	; 0x0
  103968:	0a00000b 	beq	10399c <prvSendNextSegment+0x94>
  10396c:	e5941080 	ldr	r1, [r4, #128]
  103970:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  103974:	e7d43001 	ldrb	r3, [r4, r1]
  103978:	e5003faf 	str	r3, [r0, #-4015]
  10397c:	e59d2008 	ldr	r2, [sp, #8]
  103980:	e2422001 	sub	r2, r2, #1	; 0x1
  103984:	e58d2008 	str	r2, [sp, #8]
  103988:	e59d3008 	ldr	r3, [sp, #8]
  10398c:	e3530000 	cmp	r3, #0	; 0x0
  103990:	e2811001 	add	r1, r1, #1	; 0x1
  103994:	1afffff6 	bne	103974 <prvSendNextSegment+0x6c>
  103998:	e5841080 	str	r1, [r4, #128]
  10399c:	ebffff1c 	bl	103614 <vPortEnterCritical>
  1039a0:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  1039a4:	e5112fcf 	ldr	r2, [r1, #-4047]
  1039a8:	e58d2004 	str	r2, [sp, #4]
  1039ac:	e59d3004 	ldr	r3, [sp, #4]
  1039b0:	e3c33030 	bic	r3, r3, #48	; 0x30
  1039b4:	e383305f 	orr	r3, r3, #95	; 0x5f
  1039b8:	e58d3004 	str	r3, [sp, #4]
  1039bc:	e59d2004 	ldr	r2, [sp, #4]
  1039c0:	e5012fcf 	str	r2, [r1, #-4047]
  1039c4:	e28dd00c 	add	sp, sp, #12	; 0xc
  1039c8:	e8bd4010 	ldmia	sp!, {r4, lr}
  1039cc:	eaffff1b 	b	103640 <vPortExitCritical>
  1039d0:	e59f4024 	ldr	r4, [pc, #36]	; 1039fc <prog+0x39b8>
  1039d4:	e5943000 	ldr	r3, [r4]
  1039d8:	e3530004 	cmp	r3, #4	; 0x4
  1039dc:	0a000001 	beq	1039e8 <prvSendNextSegment+0xe0>
  1039e0:	e28dd00c 	add	sp, sp, #12	; 0xc
  1039e4:	e8bd8010 	ldmia	sp!, {r4, pc}
  1039e8:	ebffffaf 	bl	1038ac <prvSendZLP>
  1039ec:	e3a03000 	mov	r3, #0	; 0x0
  1039f0:	e5843000 	str	r3, [r4]
  1039f4:	eafffff9 	b	1039e0 <prvSendNextSegment+0xd8>
  1039f8:	00200d28 	eoreq	r0, r0, r8, lsr #26
  1039fc:	00200d18 	eoreq	r0, r0, r8, lsl sp

00103a00 <prvSendControlData>:
  103a00:	e1a01801 	mov	r1, r1, lsl #16
  103a04:	e1a01821 	mov	r1, r1, lsr #16
  103a08:	e1510002 	cmp	r1, r2
  103a0c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  103a10:	e1a05002 	mov	r5, r2
  103a14:	93a02000 	movls	r2, #0	; 0x0
  103a18:	83a02001 	movhi	r2, #1	; 0x1
  103a1c:	31a05001 	movcc	r5, r1
  103a20:	3a000008 	bcc	103a48 <prvSendControlData+0x48>
  103a24:	e3530000 	cmp	r3, #0	; 0x0
  103a28:	03a03000 	moveq	r3, #0	; 0x0
  103a2c:	12023001 	andne	r3, r2, #1	; 0x1
  103a30:	e3530000 	cmp	r3, #0	; 0x0
  103a34:	0a000003 	beq	103a48 <prvSendControlData+0x48>
  103a38:	e3150007 	tst	r5, #7	; 0x7
  103a3c:	059f302c 	ldreq	r3, [pc, #44]	; 103a70 <prog+0x3a2c>
  103a40:	03a02004 	moveq	r2, #4	; 0x4
  103a44:	05832000 	streq	r2, [r3]
  103a48:	e59f4024 	ldr	r4, [pc, #36]	; 103a74 <prog+0x3a30>
  103a4c:	e1a01000 	mov	r1, r0
  103a50:	e1a02005 	mov	r2, r5
  103a54:	e1a00004 	mov	r0, r4
  103a58:	ebfff3e4 	bl	1009f0 <memcpy>
  103a5c:	e3a03000 	mov	r3, #0	; 0x0
  103a60:	e5843080 	str	r3, [r4, #128]
  103a64:	e5845084 	str	r5, [r4, #132]
  103a68:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  103a6c:	eaffffa5 	b	103908 <prvSendNextSegment>
  103a70:	00200d18 	eoreq	r0, r0, r8, lsl sp
  103a74:	00200d28 	eoreq	r0, r0, r8, lsr #26

00103a78 <vUSBCDCTask>:
  103a78:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  103a7c:	e59fc964 	ldr	ip, [pc, #2404]	; 1043e8 <prog+0x43a4>
  103a80:	e24dd028 	sub	sp, sp, #40	; 0x28
  103a84:	e59c4010 	ldr	r4, [ip, #16]
  103a88:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  103a8c:	e28dc004 	add	ip, sp, #4	; 0x4
  103a90:	e58dc000 	str	ip, [sp]
  103a94:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
  103a98:	e58d4014 	str	r4, [sp, #20]
  103a9c:	ebfffedc 	bl	103614 <vPortEnterCritical>
  103aa0:	ebffff62 	bl	103830 <vDetachUSBInterface>
  103aa4:	ebfffee5 	bl	103640 <vPortExitCritical>
  103aa8:	e3a0003c 	mov	r0, #60	; 0x3c
  103aac:	ebfffe18 	bl	103314 <vTaskDelay>
  103ab0:	ebfffed7 	bl	103614 <vPortEnterCritical>
  103ab4:	e3a00004 	mov	r0, #4	; 0x4
  103ab8:	e1a01000 	mov	r1, r0
  103abc:	ebfffb58 	bl	102824 <xQueueCreate>
  103ac0:	e59f1924 	ldr	r1, [pc, #2340]	; 1043ec <prog+0x43a8>
  103ac4:	e5810000 	str	r0, [r1]
  103ac8:	e3a01001 	mov	r1, #1	; 0x1
  103acc:	e3a00b01 	mov	r0, #1024	; 0x400
  103ad0:	ebfffb53 	bl	102824 <xQueueCreate>
  103ad4:	e59fb914 	ldr	fp, [pc, #2324]	; 1043f0 <prog+0x43ac>
  103ad8:	e3a01005 	mov	r1, #5	; 0x5
  103adc:	e58b0000 	str	r0, [fp]
  103ae0:	e3a000cd 	mov	r0, #205	; 0xcd
  103ae4:	ebfffb4e 	bl	102824 <xQueueCreate>
  103ae8:	e59f2904 	ldr	r2, [pc, #2308]	; 1043f4 <prog+0x43b0>
  103aec:	e3a01014 	mov	r1, #20	; 0x14
  103af0:	e5820000 	str	r0, [r2]
  103af4:	e3a00040 	mov	r0, #64	; 0x40
  103af8:	ebfffb49 	bl	102824 <xQueueCreate>
  103afc:	e59fc8e8 	ldr	ip, [pc, #2280]	; 1043ec <prog+0x43a8>
  103b00:	e59c3000 	ldr	r3, [ip]
  103b04:	e59f18ec 	ldr	r1, [pc, #2284]	; 1043f8 <prog+0x43b4>
  103b08:	e3530000 	cmp	r3, #0	; 0x0
  103b0c:	e5810000 	str	r0, [r1]
  103b10:	0a000038 	beq	103bf8 <vUSBCDCTask+0x180>
  103b14:	e59b3000 	ldr	r3, [fp]
  103b18:	e3530000 	cmp	r3, #0	; 0x0
  103b1c:	0a000035 	beq	103bf8 <vUSBCDCTask+0x180>
  103b20:	e59f28cc 	ldr	r2, [pc, #2252]	; 1043f4 <prog+0x43b0>
  103b24:	e5923000 	ldr	r3, [r2]
  103b28:	e3530000 	cmp	r3, #0	; 0x0
  103b2c:	0a000031 	beq	103bf8 <vUSBCDCTask+0x180>
  103b30:	e3500000 	cmp	r0, #0	; 0x0
  103b34:	0a00002f 	beq	103bf8 <vUSBCDCTask+0x180>
  103b38:	e59fc8bc 	ldr	ip, [pc, #2236]	; 1043fc <prog+0x43b8>
  103b3c:	e59f08bc 	ldr	r0, [pc, #2236]	; 104400 <prog+0x43bc>
  103b40:	e59f18bc 	ldr	r1, [pc, #2236]	; 104404 <prog+0x43c0>
  103b44:	e3a04000 	mov	r4, #0	; 0x0
  103b48:	e3a03002 	mov	r3, #2	; 0x2
  103b4c:	e58c3000 	str	r3, [ip]
  103b50:	e5c04000 	strb	r4, [r0]
  103b54:	e5c14000 	strb	r4, [r1]
  103b58:	e3e0ec03 	mvn	lr, #768	; 0x300
  103b5c:	e51e60d3 	ldr	r6, [lr, #-211]
  103b60:	e3a0c080 	mov	ip, #128	; 0x80
  103b64:	e3866201 	orr	r6, r6, #268435456	; 0x10000000
  103b68:	e50e60d3 	str	r6, [lr, #-211]
  103b6c:	e50ec0ff 	str	ip, [lr, #-255]
  103b70:	e59fc890 	ldr	ip, [pc, #2192]	; 104408 <prog+0x43c4>
  103b74:	e58c4080 	str	r4, [ip, #128]
  103b78:	e59fc88c 	ldr	ip, [pc, #2188]	; 10440c <prog+0x43c8>
  103b7c:	e58c4080 	str	r4, [ip, #128]
  103b80:	e59fc888 	ldr	ip, [pc, #2184]	; 104410 <prog+0x43cc>
  103b84:	e3e05a4f 	mvn	r5, #323584	; 0x4f000
  103b88:	e3e07c0b 	mvn	r7, #2816	; 0xb00
  103b8c:	e3a08801 	mov	r8, #65536	; 0x10000
  103b90:	e3a0ab02 	mov	sl, #2048	; 0x800
  103b94:	e3e09000 	mvn	r9, #0	; 0x0
  103b98:	e50ea0ef 	str	sl, [lr, #-239]
  103b9c:	e1a02004 	mov	r2, r4
  103ba0:	e50780ff 	str	r8, [r7, #-255]
  103ba4:	e3a01003 	mov	r1, #3	; 0x3
  103ba8:	e50780ef 	str	r8, [r7, #-239]
  103bac:	e59f3860 	ldr	r3, [pc, #2144]	; 104414 <prog+0x43d0>
  103bb0:	e50780cf 	str	r8, [r7, #-207]
  103bb4:	e58c4000 	str	r4, [ip]
  103bb8:	e5059feb 	str	r9, [r5, #-4075]
  103bbc:	e3a0000b 	mov	r0, #11	; 0xb
  103bc0:	e5059fdf 	str	r9, [r5, #-4063]
  103bc4:	e5054f8b 	str	r4, [r5, #-3979]
  103bc8:	e5054fcf 	str	r4, [r5, #-4047]
  103bcc:	e5054fcb 	str	r4, [r5, #-4043]
  103bd0:	e5054fc7 	str	r4, [r5, #-4039]
  103bd4:	e5054fc3 	str	r4, [r5, #-4035]
  103bd8:	e5054ffb 	str	r4, [r5, #-4091]
  103bdc:	e5054ff7 	str	r4, [r5, #-4087]
  103be0:	ebfff93e 	bl	1020e0 <AT91F_AIC_ConfigureIt>
  103be4:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  103be8:	e3a00ffa 	mov	r0, #1000	; 0x3e8
  103bec:	e583a021 	str	sl, [r3, #33]
  103bf0:	ebfffdc7 	bl	103314 <vTaskDelay>
  103bf4:	e50780cb 	str	r8, [r7, #-203]
  103bf8:	ebfffe90 	bl	103640 <vPortExitCritical>
  103bfc:	e59f9814 	ldr	r9, [pc, #2068]	; 104418 <prog+0x43d4>
  103c00:	e28da01b 	add	sl, sp, #27	; 0x1b
  103c04:	e28d8027 	add	r8, sp, #39	; 0x27
  103c08:	e28d2008 	add	r2, sp, #8	; 0x8
  103c0c:	e892000c 	ldmia	r2, {r2, r3}
  103c10:	e59f17d4 	ldr	r1, [pc, #2004]	; 1043ec <prog+0x43a8>
  103c14:	e1530002 	cmp	r3, r2
  103c18:	33a02000 	movcc	r2, #0	; 0x0
  103c1c:	23a02001 	movcs	r2, #1	; 0x1
  103c20:	e5910000 	ldr	r0, [r1]
  103c24:	e3a03000 	mov	r3, #0	; 0x0
  103c28:	e28d1020 	add	r1, sp, #32	; 0x20
  103c2c:	ebfffa3c 	bl	102524 <xQueueGenericReceive>
  103c30:	e3500000 	cmp	r0, #0	; 0x0
  103c34:	0a000030 	beq	103cfc <vUSBCDCTask+0x284>
  103c38:	e59d5020 	ldr	r5, [sp, #32]
  103c3c:	e5953000 	ldr	r3, [r5]
  103c40:	e3130001 	tst	r3, #1	; 0x1
  103c44:	0a000029 	beq	103cf0 <vUSBCDCTask+0x278>
  103c48:	e5950004 	ldr	r0, [r5, #4]
  103c4c:	e1a03820 	mov	r3, r0, lsr #16
  103c50:	e1a07a83 	mov	r7, r3, lsl #21
  103c54:	e3100001 	tst	r0, #1	; 0x1
  103c58:	e1a07aa7 	mov	r7, r7, lsr #21
  103c5c:	0a000013 	beq	103cb0 <vUSBCDCTask+0x238>
  103c60:	e59f27a8 	ldr	r2, [pc, #1960]	; 104410 <prog+0x43cc>
  103c64:	e5926000 	ldr	r6, [r2]
  103c68:	e3560002 	cmp	r6, #2	; 0x2
  103c6c:	0a000189 	beq	104298 <prog+0x4254>
  103c70:	e3560003 	cmp	r6, #3	; 0x3
  103c74:	1a000184 	bne	10428c <prog+0x4248>
  103c78:	e59f379c 	ldr	r3, [pc, #1948]	; 10441c <prog+0x43d8>
  103c7c:	e5931000 	ldr	r1, [r3]
  103c80:	e3510000 	cmp	r1, #0	; 0x0
  103c84:	13a02001 	movne	r2, #1	; 0x1
  103c88:	13e03a4f 	mvnne	r3, #323584	; 0x4f000
  103c8c:	03e03a4f 	mvneq	r3, #323584	; 0x4f000
  103c90:	e59fc778 	ldr	ip, [pc, #1912]	; 104410 <prog+0x43cc>
  103c94:	15032ffb 	strne	r2, [r3, #-4091]
  103c98:	05031ffb 	streq	r1, [r3, #-4091]
  103c9c:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  103ca0:	e3813c01 	orr	r3, r1, #256	; 0x100
  103ca4:	e3a01000 	mov	r1, #0	; 0x0
  103ca8:	e5023ff7 	str	r3, [r2, #-4087]
  103cac:	e58c1000 	str	r1, [ip]
  103cb0:	e3100002 	tst	r0, #2	; 0x2
  103cb4:	0a000099 	beq	103f20 <vUSBCDCTask+0x4a8>
  103cb8:	e59f074c 	ldr	r0, [pc, #1868]	; 10440c <prog+0x43c8>
  103cbc:	e2800084 	add	r0, r0, #132	; 0x84
  103cc0:	e8100009 	ldmda	r0, {r0, r3}
  103cc4:	e0433000 	sub	r3, r3, r0
  103cc8:	e59f1738 	ldr	r1, [pc, #1848]	; 104408 <prog+0x43c4>
  103ccc:	e20340ff 	and	r4, r3, #255	; 0xff
  103cd0:	e1570004 	cmp	r7, r4
  103cd4:	e5912084 	ldr	r2, [r1, #132]
  103cd8:	320740ff 	andcc	r4, r7, #255	; 0xff
  103cdc:	e3540000 	cmp	r4, #0	; 0x0
  103ce0:	e5812080 	str	r2, [r1, #128]
  103ce4:	e59f6720 	ldr	r6, [pc, #1824]	; 10440c <prog+0x43c8>
  103ce8:	1a000084 	bne	103f00 <vUSBCDCTask+0x488>
  103cec:	e59d5020 	ldr	r5, [sp, #32]
  103cf0:	e5953000 	ldr	r3, [r5]
  103cf4:	e3130a01 	tst	r3, #4096	; 0x1000
  103cf8:	1a0000d5 	bne	104054 <prog+0x4010>
  103cfc:	e59f070c 	ldr	r0, [pc, #1804]	; 104410 <prog+0x43cc>
  103d00:	e5903000 	ldr	r3, [r0]
  103d04:	e3530005 	cmp	r3, #5	; 0x5
  103d08:	1affffbe 	bne	103c08 <vUSBCDCTask+0x190>
  103d0c:	e59f16f0 	ldr	r1, [pc, #1776]	; 104404 <prog+0x43c0>
  103d10:	e5d13000 	ldrb	r3, [r1]
  103d14:	e3530000 	cmp	r3, #0	; 0x0
  103d18:	0affffba 	beq	103c08 <vUSBCDCTask+0x190>
  103d1c:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  103d20:	e5132fc7 	ldr	r2, [r3, #-4039]
  103d24:	e3120010 	tst	r2, #16	; 0x10
  103d28:	1a000045 	bne	103e44 <vUSBCDCTask+0x3cc>
  103d2c:	e59d000c 	ldr	r0, [sp, #12]
  103d30:	e59d2008 	ldr	r2, [sp, #8]
  103d34:	e1500002 	cmp	r0, r2
  103d38:	2a0000af 	bcs	103ffc <prog+0x3fb8>
  103d3c:	e1500002 	cmp	r0, r2
  103d40:	e3a04000 	mov	r4, #0	; 0x0
  103d44:	3a000027 	bcc	103de8 <vUSBCDCTask+0x370>
  103d48:	e59fc6a8 	ldr	ip, [pc, #1704]	; 1043f8 <prog+0x43b4>
  103d4c:	e3a02000 	mov	r2, #0	; 0x0
  103d50:	e59c0000 	ldr	r0, [ip]
  103d54:	e28d1004 	add	r1, sp, #4	; 0x4
  103d58:	e1a03002 	mov	r3, r2
  103d5c:	ebfff9f0 	bl	102524 <xQueueGenericReceive>
  103d60:	e3500000 	cmp	r0, #0	; 0x0
  103d64:	058d0008 	streq	r0, [sp, #8]
  103d68:	058d000c 	streq	r0, [sp, #12]
  103d6c:	0a000003 	beq	103d80 <vUSBCDCTask+0x308>
  103d70:	e59d000c 	ldr	r0, [sp, #12]
  103d74:	e59d2008 	ldr	r2, [sp, #8]
  103d78:	e1500002 	cmp	r0, r2
  103d7c:	3a000019 	bcc	103de8 <vUSBCDCTask+0x370>
  103d80:	e59f166c 	ldr	r1, [pc, #1644]	; 1043f4 <prog+0x43b0>
  103d84:	e3a02000 	mov	r2, #0	; 0x0
  103d88:	e5910000 	ldr	r0, [r1]
  103d8c:	e1a03002 	mov	r3, r2
  103d90:	e1a0100a 	mov	r1, sl
  103d94:	ebfff9e2 	bl	102524 <xQueueGenericReceive>
  103d98:	e3500000 	cmp	r0, #0	; 0x0
  103d9c:	0a000024 	beq	103e34 <vUSBCDCTask+0x3bc>
  103da0:	e5dd101b 	ldrb	r1, [sp, #27]
  103da4:	e3510000 	cmp	r1, #0	; 0x0
  103da8:	da000007 	ble	103dcc <vUSBCDCTask+0x354>
  103dac:	e3a02000 	mov	r2, #0	; 0x0
  103db0:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  103db4:	e2822001 	add	r2, r2, #1	; 0x1
  103db8:	e7d2300a 	ldrb	r3, [r2, sl]
  103dbc:	e1520001 	cmp	r2, r1
  103dc0:	e5003fa7 	str	r3, [r0, #-4007]
  103dc4:	e2844001 	add	r4, r4, #1	; 0x1
  103dc8:	1afffff9 	bne	103db4 <vUSBCDCTask+0x33c>
  103dcc:	e2844001 	add	r4, r4, #1	; 0x1
  103dd0:	e354003b 	cmp	r4, #59	; 0x3b
  103dd4:	ca000016 	bgt	103e34 <vUSBCDCTask+0x3bc>
  103dd8:	e59d000c 	ldr	r0, [sp, #12]
  103ddc:	e59d2008 	ldr	r2, [sp, #8]
  103de0:	e1500002 	cmp	r0, r2
  103de4:	2affffd7 	bcs	103d48 <vUSBCDCTask+0x2d0>
  103de8:	e59dc004 	ldr	ip, [sp, #4]
  103dec:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  103df0:	e1500002 	cmp	r0, r2
  103df4:	e2844001 	add	r4, r4, #1	; 0x1
  103df8:	e2801001 	add	r1, r0, #1	; 0x1
  103dfc:	2a000007 	bcs	103e20 <vUSBCDCTask+0x3a8>
  103e00:	e7dc3000 	ldrb	r3, [ip, r0]
  103e04:	e354003f 	cmp	r4, #63	; 0x3f
  103e08:	e50e3fa7 	str	r3, [lr, #-4007]
  103e0c:	e1a00001 	mov	r0, r1
  103e10:	e58d100c 	str	r1, [sp, #12]
  103e14:	dafffff5 	ble	103df0 <vUSBCDCTask+0x378>
  103e18:	e1520001 	cmp	r2, r1
  103e1c:	8a000004 	bhi	103e34 <vUSBCDCTask+0x3bc>
  103e20:	e59d3010 	ldr	r3, [sp, #16]
  103e24:	e3530000 	cmp	r3, #0	; 0x0
  103e28:	159d0014 	ldrne	r0, [sp, #20]
  103e2c:	11a0e00f 	movne	lr, pc
  103e30:	112fff13 	bxne	r3
  103e34:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  103e38:	e5123fc7 	ldr	r3, [r2, #-4039]
  103e3c:	e3833010 	orr	r3, r3, #16	; 0x10
  103e40:	e5023fc7 	str	r3, [r2, #-4039]
  103e44:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  103e48:	e5143fcb 	ldr	r3, [r4, #-4043]
  103e4c:	e3130042 	tst	r3, #66	; 0x42
  103e50:	0affff6c 	beq	103c08 <vUSBCDCTask+0x190>
  103e54:	e5143fcb 	ldr	r3, [r4, #-4043]
  103e58:	e59b0000 	ldr	r0, [fp]
  103e5c:	e1a03823 	mov	r3, r3, lsr #16
  103e60:	e1a05a83 	mov	r5, r3, lsl #21
  103e64:	ebfff910 	bl	1022ac <uxQueueMessagesWaiting>
  103e68:	e1a05aa5 	mov	r5, r5, lsr #21
  103e6c:	e2600b01 	rsb	r0, r0, #1024	; 0x400
  103e70:	e1550000 	cmp	r5, r0
  103e74:	2affff63 	bcs	103c08 <vUSBCDCTask+0x190>
  103e78:	e3550000 	cmp	r5, #0	; 0x0
  103e7c:	0a00000b 	beq	103eb0 <vUSBCDCTask+0x438>
  103e80:	e1a06004 	mov	r6, r4
  103e84:	e3a04000 	mov	r4, #0	; 0x0
  103e88:	e516cfab 	ldr	ip, [r6, #-4011]
  103e8c:	e3a02000 	mov	r2, #0	; 0x0
  103e90:	e2844001 	add	r4, r4, #1	; 0x1
  103e94:	e59b0000 	ldr	r0, [fp]
  103e98:	e1a01008 	mov	r1, r8
  103e9c:	e1a03002 	mov	r3, r2
  103ea0:	e5cdc027 	strb	ip, [sp, #39]
  103ea4:	ebfffa04 	bl	1026bc <xQueueGenericSend>
  103ea8:	e1540005 	cmp	r4, r5
  103eac:	1afffff5 	bne	103e88 <vUSBCDCTask+0x410>
  103eb0:	ebfffdd7 	bl	103614 <vPortEnterCritical>
  103eb4:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  103eb8:	e59fc53c 	ldr	ip, [pc, #1340]	; 1043fc <prog+0x43b8>
  103ebc:	e5143fcb 	ldr	r3, [r4, #-4043]
  103ec0:	e59c2000 	ldr	r2, [ip]
  103ec4:	e383304f 	orr	r3, r3, #79	; 0x4f
  103ec8:	e1e02002 	mvn	r2, r2
  103ecc:	e3c33030 	bic	r3, r3, #48	; 0x30
  103ed0:	e0033002 	and	r3, r3, r2
  103ed4:	e5043fcb 	str	r3, [r4, #-4043]
  103ed8:	ebfffdd8 	bl	103640 <vPortExitCritical>
  103edc:	e3a01002 	mov	r1, #2	; 0x2
  103ee0:	e5041fef 	str	r1, [r4, #-4079]
  103ee4:	e59f0510 	ldr	r0, [pc, #1296]	; 1043fc <prog+0x43b8>
  103ee8:	e5903000 	ldr	r3, [r0]
  103eec:	e1530001 	cmp	r3, r1
  103ef0:	03a03040 	moveq	r3, #64	; 0x40
  103ef4:	05803000 	streq	r3, [r0]
  103ef8:	15801000 	strne	r1, [r0]
  103efc:	eaffffd0 	b	103e44 <vUSBCDCTask+0x3cc>
  103f00:	e1a00006 	mov	r0, r6
  103f04:	e2851008 	add	r1, r5, #8	; 0x8
  103f08:	e1a02004 	mov	r2, r4
  103f0c:	ebfff2b7 	bl	1009f0 <memcpy>
  103f10:	e5963080 	ldr	r3, [r6, #128]
  103f14:	e0843003 	add	r3, r4, r3
  103f18:	e5863080 	str	r3, [r6, #128]
  103f1c:	e5950004 	ldr	r0, [r5, #4]
  103f20:	e3100004 	tst	r0, #4	; 0x4
  103f24:	0a000020 	beq	103fac <vUSBCDCTask+0x534>
  103f28:	e3570007 	cmp	r7, #7	; 0x7
  103f2c:	9a00001e 	bls	103fac <vUSBCDCTask+0x534>
  103f30:	e5d51008 	ldrb	r1, [r5, #8]
  103f34:	e5c91000 	strb	r1, [r9]
  103f38:	e5d52009 	ldrb	r2, [r5, #9]
  103f3c:	e5c92001 	strb	r2, [r9, #1]
  103f40:	e5d5300b 	ldrb	r3, [r5, #11]
  103f44:	e1a03403 	mov	r3, r3, lsl #8
  103f48:	e1c930b2 	strh	r3, [r9, #2]
  103f4c:	e5d5200a 	ldrb	r2, [r5, #10]
  103f50:	e1833002 	orr	r3, r3, r2
  103f54:	e1c930b2 	strh	r3, [r9, #2]
  103f58:	e5d5200d 	ldrb	r2, [r5, #13]
  103f5c:	e1a02402 	mov	r2, r2, lsl #8
  103f60:	e1c920b4 	strh	r2, [r9, #4]
  103f64:	e5d5300c 	ldrb	r3, [r5, #12]
  103f68:	e1822003 	orr	r2, r2, r3
  103f6c:	e1c920b4 	strh	r2, [r9, #4]
  103f70:	e5d5300f 	ldrb	r3, [r5, #15]
  103f74:	e1a03403 	mov	r3, r3, lsl #8
  103f78:	e1c930b6 	strh	r3, [r9, #6]
  103f7c:	e5d5200e 	ldrb	r2, [r5, #14]
  103f80:	e59fc484 	ldr	ip, [pc, #1156]	; 10440c <prog+0x43c8>
  103f84:	e1833002 	orr	r3, r3, r2
  103f88:	e3110080 	tst	r1, #128	; 0x80
  103f8c:	e3a02000 	mov	r2, #0	; 0x0
  103f90:	e1c930b6 	strh	r3, [r9, #6]
  103f94:	e58c2080 	str	r2, [ip, #128]
  103f98:	1a0000d9 	bne	104304 <prog+0x42c0>
  103f9c:	e3530080 	cmp	r3, #128	; 0x80
  103fa0:	958c3084 	strls	r3, [ip, #132]
  103fa4:	95950004 	ldrls	r0, [r5, #4]
  103fa8:	8a000024 	bhi	104040 <prog+0x3ffc>
  103fac:	e3100006 	tst	r0, #6	; 0x6
  103fb0:	0affff4d 	beq	103cec <vUSBCDCTask+0x274>
  103fb4:	e59f0450 	ldr	r0, [pc, #1104]	; 10440c <prog+0x43c8>
  103fb8:	e2802080 	add	r2, r0, #128	; 0x80
  103fbc:	e892000c 	ldmia	r2, {r2, r3}
  103fc0:	e1520003 	cmp	r2, r3
  103fc4:	3affff48 	bcc	103cec <vUSBCDCTask+0x274>
  103fc8:	e5d93000 	ldrb	r3, [r9]
  103fcc:	e2032060 	and	r2, r3, #96	; 0x60
  103fd0:	e2033003 	and	r3, r3, #3	; 0x3
  103fd4:	e18331a2 	orr	r3, r3, r2, lsr #3
  103fd8:	e3530005 	cmp	r3, #5	; 0x5
  103fdc:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  103fe0:	ea000016 	b	104040 <prog+0x3ffc>
  103fe4:	001040e0 	andeqs	r4, r0, r0, ror #1
  103fe8:	001040b4 	ldreqh	r4, [r0], -r4
  103fec:	00104040 	andeqs	r4, r0, r0, asr #32
  103ff0:	00104040 	andeqs	r4, r0, r0, asr #32
  103ff4:	00104040 	andeqs	r4, r0, r0, asr #32
  103ff8:	00104120 	andeqs	r4, r0, r0, lsr #2
  103ffc:	e59f23f0 	ldr	r2, [pc, #1008]	; 1043f4 <prog+0x43b0>
  104000:	e5920000 	ldr	r0, [r2]
  104004:	ebfff8a8 	bl	1022ac <uxQueueMessagesWaiting>
  104008:	e3500000 	cmp	r0, #0	; 0x0
  10400c:	0a0000bf 	beq	104310 <prog+0x42cc>
  104010:	e59d000c 	ldr	r0, [sp, #12]
  104014:	e59d2008 	ldr	r2, [sp, #8]
  104018:	eaffff47 	b	103d3c <vUSBCDCTask+0x2c4>
  10401c:	e1d920b2 	ldrh	r2, [r9, #2]
  104020:	e1a03422 	mov	r3, r2, lsr #8
  104024:	e3530002 	cmp	r3, #2	; 0x2
  104028:	e59f13e8 	ldr	r1, [pc, #1000]	; 104418 <prog+0x43d4>
  10402c:	0a0000cc 	beq	104364 <prog+0x4320>
  104030:	e3530003 	cmp	r3, #3	; 0x3
  104034:	0a0000c1 	beq	104340 <prog+0x42fc>
  104038:	e3530001 	cmp	r3, #1	; 0x1
  10403c:	0a0000b9 	beq	104328 <prog+0x42e4>
  104040:	ebfffe10 	bl	103888 <prvSendStall>
  104044:	e59d5020 	ldr	r5, [sp, #32]
  104048:	e5953000 	ldr	r3, [r5]
  10404c:	e3130a01 	tst	r3, #4096	; 0x1000
  104050:	0affff29 	beq	103cfc <vUSBCDCTask+0x284>
  104054:	e59f13a8 	ldr	r1, [pc, #936]	; 104404 <prog+0x43c0>
  104058:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10405c:	e3a02000 	mov	r2, #0	; 0x0
  104060:	e3a0300f 	mov	r3, #15	; 0xf
  104064:	e5c12000 	strb	r2, [r1]
  104068:	e5043fd7 	str	r3, [r4, #-4055]
  10406c:	e5042fd7 	str	r2, [r4, #-4055]
  104070:	e59f2398 	ldr	r2, [pc, #920]	; 104410 <prog+0x43cc>
  104074:	e28330f1 	add	r3, r3, #241	; 0xf1
  104078:	e3a05001 	mov	r5, #1	; 0x1
  10407c:	e5043ff7 	str	r3, [r4, #-4087]
  104080:	e5825000 	str	r5, [r2]
  104084:	ebfffd62 	bl	103614 <vPortEnterCritical>
  104088:	e5143fcf 	ldr	r3, [r4, #-4047]
  10408c:	e383304f 	orr	r3, r3, #79	; 0x4f
  104090:	e3c33030 	bic	r3, r3, #48	; 0x30
  104094:	e3833902 	orr	r3, r3, #32768	; 0x8000
  104098:	e5043fcf 	str	r3, [r4, #-4047]
  10409c:	e5045fef 	str	r5, [r4, #-4079]
  1040a0:	ebfffd66 	bl	103640 <vPortExitCritical>
  1040a4:	e59fc350 	ldr	ip, [pc, #848]	; 1043fc <prog+0x43b8>
  1040a8:	e3a03002 	mov	r3, #2	; 0x2
  1040ac:	e58c3000 	str	r3, [ip]
  1040b0:	eaffff11 	b	103cfc <vUSBCDCTask+0x284>
  1040b4:	e5d93001 	ldrb	r3, [r9, #1]
  1040b8:	e3a0c000 	mov	ip, #0	; 0x0
  1040bc:	e3530000 	cmp	r3, #0	; 0x0
  1040c0:	e1cdc2b4 	strh	ip, [sp, #36]
  1040c4:	1affffdd 	bne	104040 <prog+0x3ffc>
  1040c8:	e3a01002 	mov	r1, #2	; 0x2
  1040cc:	e28d0024 	add	r0, sp, #36	; 0x24
  1040d0:	e1a02001 	mov	r2, r1
  1040d4:	ebfffe49 	bl	103a00 <prvSendControlData>
  1040d8:	e59d5020 	ldr	r5, [sp, #32]
  1040dc:	eaffff03 	b	103cf0 <vUSBCDCTask+0x278>
  1040e0:	e5d93001 	ldrb	r3, [r9, #1]
  1040e4:	e3a01000 	mov	r1, #0	; 0x0
  1040e8:	e1cd12b4 	strh	r1, [sp, #36]
  1040ec:	e3530009 	cmp	r3, #9	; 0x9
  1040f0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  1040f4:	eaffffd1 	b	104040 <prog+0x3ffc>
  1040f8:	00104220 	andeqs	r4, r0, r0, lsr #4
  1040fc:	00104040 	andeqs	r4, r0, r0, asr #32
  104100:	00104040 	andeqs	r4, r0, r0, asr #32
  104104:	001041d4 	ldreqsb	r4, [r0], -r4
  104108:	00104040 	andeqs	r4, r0, r0, asr #32
  10410c:	001041e0 	andeqs	r4, r0, r0, ror #3
  104110:	0010401c 	andeqs	r4, r0, ip, lsl r0
  104114:	00104040 	andeqs	r4, r0, r0, asr #32
  104118:	00104204 	andeqs	r4, r0, r4, lsl #4
  10411c:	001041bc 	ldreqh	r4, [r0], -ip
  104120:	e5d93001 	ldrb	r3, [r9, #1]
  104124:	e3530022 	cmp	r3, #34	; 0x22
  104128:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10412c:	eaffffc3 	b	104040 <prog+0x3ffc>
  104130:	00104040 	andeqs	r4, r0, r0, asr #32
  104134:	00104040 	andeqs	r4, r0, r0, asr #32
  104138:	00104040 	andeqs	r4, r0, r0, asr #32
  10413c:	00104040 	andeqs	r4, r0, r0, asr #32
  104140:	00104040 	andeqs	r4, r0, r0, asr #32
  104144:	00104040 	andeqs	r4, r0, r0, asr #32
  104148:	00104040 	andeqs	r4, r0, r0, asr #32
  10414c:	00104040 	andeqs	r4, r0, r0, asr #32
  104150:	00104040 	andeqs	r4, r0, r0, asr #32
  104154:	00104040 	andeqs	r4, r0, r0, asr #32
  104158:	00104040 	andeqs	r4, r0, r0, asr #32
  10415c:	00104040 	andeqs	r4, r0, r0, asr #32
  104160:	00104040 	andeqs	r4, r0, r0, asr #32
  104164:	00104040 	andeqs	r4, r0, r0, asr #32
  104168:	00104040 	andeqs	r4, r0, r0, asr #32
  10416c:	00104040 	andeqs	r4, r0, r0, asr #32
  104170:	00104040 	andeqs	r4, r0, r0, asr #32
  104174:	00104040 	andeqs	r4, r0, r0, asr #32
  104178:	00104040 	andeqs	r4, r0, r0, asr #32
  10417c:	00104040 	andeqs	r4, r0, r0, asr #32
  104180:	00104040 	andeqs	r4, r0, r0, asr #32
  104184:	00104040 	andeqs	r4, r0, r0, asr #32
  104188:	00104040 	andeqs	r4, r0, r0, asr #32
  10418c:	00104040 	andeqs	r4, r0, r0, asr #32
  104190:	00104040 	andeqs	r4, r0, r0, asr #32
  104194:	00104040 	andeqs	r4, r0, r0, asr #32
  104198:	00104040 	andeqs	r4, r0, r0, asr #32
  10419c:	00104040 	andeqs	r4, r0, r0, asr #32
  1041a0:	00104040 	andeqs	r4, r0, r0, asr #32
  1041a4:	00104040 	andeqs	r4, r0, r0, asr #32
  1041a8:	00104040 	andeqs	r4, r0, r0, asr #32
  1041ac:	00104040 	andeqs	r4, r0, r0, asr #32
  1041b0:	0010423c 	andeqs	r4, r0, ip, lsr r2
  1041b4:	00104258 	andeqs	r4, r0, r8, asr r2
  1041b8:	00104274 	andeqs	r4, r0, r4, ror r2
  1041bc:	e1d930b2 	ldrh	r3, [r9, #2]
  1041c0:	e59f2238 	ldr	r2, [pc, #568]	; 104400 <prog+0x43bc>
  1041c4:	e5c23000 	strb	r3, [r2]
  1041c8:	e59f3240 	ldr	r3, [pc, #576]	; 104410 <prog+0x43cc>
  1041cc:	e3a02002 	mov	r2, #2	; 0x2
  1041d0:	e5832000 	str	r2, [r3]
  1041d4:	ebfffdb4 	bl	1038ac <prvSendZLP>
  1041d8:	e59d5020 	ldr	r5, [sp, #32]
  1041dc:	eafffec3 	b	103cf0 <vUSBCDCTask+0x278>
  1041e0:	ebfffdb1 	bl	1038ac <prvSendZLP>
  1041e4:	e1d920b2 	ldrh	r2, [r9, #2]
  1041e8:	e59f0220 	ldr	r0, [pc, #544]	; 104410 <prog+0x43cc>
  1041ec:	e59f1228 	ldr	r1, [pc, #552]	; 10441c <prog+0x43d8>
  1041f0:	e59d5020 	ldr	r5, [sp, #32]
  1041f4:	e3a03003 	mov	r3, #3	; 0x3
  1041f8:	e5803000 	str	r3, [r0]
  1041fc:	e5812000 	str	r2, [r1]
  104200:	eafffeba 	b	103cf0 <vUSBCDCTask+0x278>
  104204:	e3a01001 	mov	r1, #1	; 0x1
  104208:	e59f01f0 	ldr	r0, [pc, #496]	; 104400 <prog+0x43bc>
  10420c:	e1a02001 	mov	r2, r1
  104210:	e3a03000 	mov	r3, #0	; 0x0
  104214:	ebfffdf9 	bl	103a00 <prvSendControlData>
  104218:	e59d5020 	ldr	r5, [sp, #32]
  10421c:	eafffeb3 	b	103cf0 <vUSBCDCTask+0x278>
  104220:	e3a01002 	mov	r1, #2	; 0x2
  104224:	e28d0024 	add	r0, sp, #36	; 0x24
  104228:	e1a02001 	mov	r2, r1
  10422c:	e3a03000 	mov	r3, #0	; 0x0
  104230:	ebfffdf2 	bl	103a00 <prvSendControlData>
  104234:	e59d5020 	ldr	r5, [sp, #32]
  104238:	eafffeac 	b	103cf0 <vUSBCDCTask+0x278>
  10423c:	ebfffd9a 	bl	1038ac <prvSendZLP>
  104240:	e59f01d8 	ldr	r0, [pc, #472]	; 104420 <prog+0x43dc>
  104244:	e59f11c0 	ldr	r1, [pc, #448]	; 10440c <prog+0x43c8>
  104248:	e3a02007 	mov	r2, #7	; 0x7
  10424c:	ebfff1e7 	bl	1009f0 <memcpy>
  104250:	e59d5020 	ldr	r5, [sp, #32]
  104254:	eafffea5 	b	103cf0 <vUSBCDCTask+0x278>
  104258:	e59f01c0 	ldr	r0, [pc, #448]	; 104420 <prog+0x43dc>
  10425c:	e1d910b6 	ldrh	r1, [r9, #6]
  104260:	e3a02007 	mov	r2, #7	; 0x7
  104264:	e3a03000 	mov	r3, #0	; 0x0
  104268:	ebfffde4 	bl	103a00 <prvSendControlData>
  10426c:	e59d5020 	ldr	r5, [sp, #32]
  104270:	eafffe9e 	b	103cf0 <vUSBCDCTask+0x278>
  104274:	ebfffd8c 	bl	1038ac <prvSendZLP>
  104278:	e1d930b2 	ldrh	r3, [r9, #2]
  10427c:	e59f0180 	ldr	r0, [pc, #384]	; 104404 <prog+0x43c0>
  104280:	e59d5020 	ldr	r5, [sp, #32]
  104284:	e5c03000 	strb	r3, [r0]
  104288:	eafffe98 	b	103cf0 <vUSBCDCTask+0x278>
  10428c:	ebfffd9d 	bl	103908 <prvSendNextSegment>
  104290:	e5950004 	ldr	r0, [r5, #4]
  104294:	eafffe85 	b	103cb0 <vUSBCDCTask+0x238>
  104298:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10429c:	e5046ffb 	str	r6, [r4, #-4091]
  1042a0:	ebfffcdb 	bl	103614 <vPortEnterCritical>
  1042a4:	e5143fcb 	ldr	r3, [r4, #-4043]
  1042a8:	e383304f 	orr	r3, r3, #79	; 0x4f
  1042ac:	e3c33030 	bic	r3, r3, #48	; 0x30
  1042b0:	e3833c82 	orr	r3, r3, #33280	; 0x8200
  1042b4:	e5043fcb 	str	r3, [r4, #-4043]
  1042b8:	e5046fef 	str	r6, [r4, #-4079]
  1042bc:	e5143fc7 	ldr	r3, [r4, #-4039]
  1042c0:	e383304f 	orr	r3, r3, #79	; 0x4f
  1042c4:	e3c33030 	bic	r3, r3, #48	; 0x30
  1042c8:	e3a02004 	mov	r2, #4	; 0x4
  1042cc:	e3833c86 	orr	r3, r3, #34304	; 0x8600
  1042d0:	e5043fc7 	str	r3, [r4, #-4039]
  1042d4:	e5042fef 	str	r2, [r4, #-4079]
  1042d8:	e5143fc3 	ldr	r3, [r4, #-4035]
  1042dc:	e383304f 	orr	r3, r3, #79	; 0x4f
  1042e0:	e3c33030 	bic	r3, r3, #48	; 0x30
  1042e4:	e3833c87 	orr	r3, r3, #34560	; 0x8700
  1042e8:	e5043fc3 	str	r3, [r4, #-4035]
  1042ec:	ebfffcd3 	bl	103640 <vPortExitCritical>
  1042f0:	e59f3118 	ldr	r3, [pc, #280]	; 104410 <prog+0x43cc>
  1042f4:	e5950004 	ldr	r0, [r5, #4]
  1042f8:	e3a02005 	mov	r2, #5	; 0x5
  1042fc:	e5832000 	str	r2, [r3]
  104300:	eafffe6a 	b	103cb0 <vUSBCDCTask+0x238>
  104304:	e58c2084 	str	r2, [ip, #132]
  104308:	e5950004 	ldr	r0, [r5, #4]
  10430c:	eaffff26 	b	103fac <vUSBCDCTask+0x534>
  104310:	e59f30e0 	ldr	r3, [pc, #224]	; 1043f8 <prog+0x43b4>
  104314:	e5930000 	ldr	r0, [r3]
  104318:	ebfff7e3 	bl	1022ac <uxQueueMessagesWaiting>
  10431c:	e3500000 	cmp	r0, #0	; 0x0
  104320:	0afffec7 	beq	103e44 <vUSBCDCTask+0x3cc>
  104324:	eaffff39 	b	104010 <prog+0x3fcc>
  104328:	e1d110b6 	ldrh	r1, [r1, #6]
  10432c:	e59f00f0 	ldr	r0, [pc, #240]	; 104424 <prog+0x43e0>
  104330:	e3a02012 	mov	r2, #18	; 0x12
  104334:	ebfffdb1 	bl	103a00 <prvSendControlData>
  104338:	e59d5020 	ldr	r5, [sp, #32]
  10433c:	eafffe6b 	b	103cf0 <vUSBCDCTask+0x278>
  104340:	e20230ff 	and	r3, r2, #255	; 0xff
  104344:	e3530004 	cmp	r3, #4	; 0x4
  104348:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10434c:	eaffff3b 	b	104040 <prog+0x3ffc>
  104350:	00104394 	muleqs	r0, r4, r3
  104354:	001043b0 	ldreqh	r4, [r0], -r0
  104358:	001043cc 	andeqs	r4, r0, ip, asr #7
  10435c:	001043cc 	andeqs	r4, r0, ip, asr #7
  104360:	001043cc 	andeqs	r4, r0, ip, asr #7
  104364:	e20230ff 	and	r3, r2, #255	; 0xff
  104368:	e59fc0b8 	ldr	ip, [pc, #184]	; 104428 <prog+0x43e4>
  10436c:	e3530002 	cmp	r3, #2	; 0x2
  104370:	23a03002 	movcs	r3, #2	; 0x2
  104374:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  104378:	e59fc0ac 	ldr	ip, [pc, #172]	; 10442c <prog+0x43e8>
  10437c:	e1d110b6 	ldrh	r1, [r1, #6]
  104380:	e79c0103 	ldr	r0, [ip, r3, lsl #2]
  104384:	e3a03001 	mov	r3, #1	; 0x1
  104388:	ebfffd9c 	bl	103a00 <prvSendControlData>
  10438c:	e59d5020 	ldr	r5, [sp, #32]
  104390:	eafffe56 	b	103cf0 <vUSBCDCTask+0x278>
  104394:	e59f0094 	ldr	r0, [pc, #148]	; 104430 <prog+0x43ec>
  104398:	e1d910b6 	ldrh	r1, [r9, #6]
  10439c:	e3a02004 	mov	r2, #4	; 0x4
  1043a0:	e3a03001 	mov	r3, #1	; 0x1
  1043a4:	ebfffd95 	bl	103a00 <prvSendControlData>
  1043a8:	e59d5020 	ldr	r5, [sp, #32]
  1043ac:	eafffe4f 	b	103cf0 <vUSBCDCTask+0x278>
  1043b0:	e59f007c 	ldr	r0, [pc, #124]	; 104434 <prog+0x43f0>
  1043b4:	e1d910b6 	ldrh	r1, [r9, #6]
  1043b8:	e3a0201c 	mov	r2, #28	; 0x1c
  1043bc:	e3a03001 	mov	r3, #1	; 0x1
  1043c0:	ebfffd8e 	bl	103a00 <prvSendControlData>
  1043c4:	e59d5020 	ldr	r5, [sp, #32]
  1043c8:	eafffe48 	b	103cf0 <vUSBCDCTask+0x278>
  1043cc:	e59f0064 	ldr	r0, [pc, #100]	; 104438 <prog+0x43f4>
  1043d0:	e1d910b6 	ldrh	r1, [r9, #6]
  1043d4:	e3a0202c 	mov	r2, #44	; 0x2c
  1043d8:	e3a03001 	mov	r3, #1	; 0x1
  1043dc:	ebfffd87 	bl	103a00 <prvSendControlData>
  1043e0:	e59d5020 	ldr	r5, [sp, #32]
  1043e4:	eafffe41 	b	103cf0 <vUSBCDCTask+0x278>
  1043e8:	00104bc8 	andeqs	r4, r0, r8, asr #23
  1043ec:	00201500 	eoreq	r1, r0, r0, lsl #10
  1043f0:	00200e38 	eoreq	r0, r0, r8, lsr lr
  1043f4:	00200e3c 	eoreq	r0, r0, ip, lsr lr
  1043f8:	00200e40 	eoreq	r0, r0, r0, asr #28
  1043fc:	00200e48 	eoreq	r0, r0, r8, asr #28
  104400:	00200d14 	eoreq	r0, r0, r4, lsl sp
  104404:	00200e44 	eoreq	r0, r0, r4, asr #28
  104408:	00200d28 	eoreq	r0, r0, r8, lsr #26
  10440c:	00200db0 	streqh	r0, [r0], -r0
  104410:	00200d18 	eoreq	r0, r0, r8, lsl sp
  104414:	001045e0 	andeqs	r4, r0, r0, ror #11
  104418:	00200d20 	eoreq	r0, r0, r0, lsr #26
  10441c:	00200d1c 	eoreq	r0, r0, ip, lsl sp
  104420:	00104bdc 	ldreqsb	r4, [r0], -ip
  104424:	00104bb4 	ldreqh	r4, [r0], -r4
  104428:	00104bac 	andeqs	r4, r0, ip, lsr #23
  10442c:	00200824 	eoreq	r0, r0, r4, lsr #16
  104430:	00104ad9 	ldreqsb	r4, [r0], -r9
  104434:	00104add 	ldreqsb	r4, [r0], -sp
  104438:	00104af9 	ldreqsh	r4, [r0], -r9

0010443c <vUSB_ISR_Handler>:
  10443c:	e59f2190 	ldr	r2, [pc, #400]	; 1045d4 <prog+0x4590>
  104440:	e5921000 	ldr	r1, [r2]
  104444:	e5923000 	ldr	r3, [r2]
  104448:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10444c:	e2833001 	add	r3, r3, #1	; 0x1
  104450:	e5823000 	str	r3, [r2]
  104454:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  104458:	e514cfe3 	ldr	ip, [r4, #-4067]
  10445c:	e59f0174 	ldr	r0, [pc, #372]	; 1045d8 <prog+0x4594>
  104460:	e514efcf 	ldr	lr, [r4, #-4047]
  104464:	e2011003 	and	r1, r1, #3	; 0x3
  104468:	e5143fe7 	ldr	r3, [r4, #-4071]
  10446c:	e1a01201 	mov	r1, r1, lsl #4
  104470:	e24dd008 	sub	sp, sp, #8	; 0x8
  104474:	e0812000 	add	r2, r1, r0
  104478:	e3833a01 	orr	r3, r3, #4096	; 0x1000
  10447c:	e3a05000 	mov	r5, #0	; 0x0
  104480:	e31e0006 	tst	lr, #6	; 0x6
  104484:	e781c000 	str	ip, [r1, r0]
  104488:	e582e004 	str	lr, [r2, #4]
  10448c:	e5043fdf 	str	r3, [r4, #-4063]
  104490:	e88d0024 	stmia	sp, {r2, r5}
  104494:	0a000019 	beq	104500 <vUSB_ISR_Handler+0xc4>
  104498:	e1a0382e 	mov	r3, lr, lsr #16
  10449c:	e1a0ca83 	mov	ip, r3, lsl #21
  1044a0:	e1a0caac 	mov	ip, ip, lsr #21
  1044a4:	e15c0005 	cmp	ip, r5
  1044a8:	0a000009 	beq	1044d4 <vUSB_ISR_Handler+0x98>
  1044ac:	e1a00005 	mov	r0, r5
  1044b0:	e1a0e004 	mov	lr, r4
  1044b4:	e59d2000 	ldr	r2, [sp]
  1044b8:	e2803001 	add	r3, r0, #1	; 0x1
  1044bc:	e0802002 	add	r2, r0, r2
  1044c0:	e51e1faf 	ldr	r1, [lr, #-4015]
  1044c4:	e20300ff 	and	r0, r3, #255	; 0xff
  1044c8:	e15c0000 	cmp	ip, r0
  1044cc:	e5c21008 	strb	r1, [r2, #8]
  1044d0:	8afffff7 	bhi	1044b4 <vUSB_ISR_Handler+0x78>
  1044d4:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  1044d8:	e5113fcf 	ldr	r3, [r1, #-4047]
  1044dc:	e3130004 	tst	r3, #4	; 0x4
  1044e0:	1a000025 	bne	10457c <vUSB_ISR_Handler+0x140>
  1044e4:	e5113fcf 	ldr	r3, [r1, #-4047]
  1044e8:	e3c33002 	bic	r3, r3, #2	; 0x2
  1044ec:	e5013fcf 	str	r3, [r1, #-4047]
  1044f0:	e1a02001 	mov	r2, r1
  1044f4:	e5123fcf 	ldr	r3, [r2, #-4047]
  1044f8:	e3130002 	tst	r3, #2	; 0x2
  1044fc:	1afffffc 	bne	1044f4 <vUSB_ISR_Handler+0xb8>
  104500:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  104504:	e51e3fcb 	ldr	r3, [lr, #-4043]
  104508:	e3130042 	tst	r3, #66	; 0x42
  10450c:	13a03002 	movne	r3, #2	; 0x2
  104510:	150e3feb 	strne	r3, [lr, #-4075]
  104514:	e51e3fcf 	ldr	r3, [lr, #-4047]
  104518:	e3c33009 	bic	r3, r3, #9	; 0x9
  10451c:	e50e3fcf 	str	r3, [lr, #-4047]
  104520:	e51e2fcb 	ldr	r2, [lr, #-4043]
  104524:	e3c2200d 	bic	r2, r2, #13	; 0xd
  104528:	e50e2fcb 	str	r2, [lr, #-4043]
  10452c:	e51e3fc7 	ldr	r3, [lr, #-4039]
  104530:	e3c3304f 	bic	r3, r3, #79	; 0x4f
  104534:	e50e3fc7 	str	r3, [lr, #-4039]
  104538:	e51ecfc3 	ldr	ip, [lr, #-4035]
  10453c:	e59f3098 	ldr	r3, [pc, #152]	; 1045dc <prog+0x4598>
  104540:	e3ccc04f 	bic	ip, ip, #79	; 0x4f
  104544:	e5930000 	ldr	r0, [r3]
  104548:	e28d2004 	add	r2, sp, #4	; 0x4
  10454c:	e3a03000 	mov	r3, #0	; 0x0
  104550:	e1a0100d 	mov	r1, sp
  104554:	e50ecfc3 	str	ip, [lr, #-4035]
  104558:	ebfff793 	bl	1023ac <xQueueGenericSendFromISR>
  10455c:	e59d3004 	ldr	r3, [sp, #4]
  104560:	e3a02000 	mov	r2, #0	; 0x0
  104564:	e3530000 	cmp	r3, #0	; 0x0
  104568:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10456c:	e5832031 	str	r2, [r3, #49]
  104570:	1bfff8d4 	blne	1028c8 <vTaskSwitchContext>
  104574:	e28dd008 	add	sp, sp, #8	; 0x8
  104578:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10457c:	e35c0000 	cmp	ip, #0	; 0x0
  104580:	1a000007 	bne	1045a4 <vUSB_ISR_Handler+0x168>
  104584:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  104588:	e5123fcf 	ldr	r3, [r2, #-4047]
  10458c:	e3c33004 	bic	r3, r3, #4	; 0x4
  104590:	e5023fcf 	str	r3, [r2, #-4047]
  104594:	e5123fcf 	ldr	r3, [r2, #-4047]
  104598:	e3130004 	tst	r3, #4	; 0x4
  10459c:	1afffffc 	bne	104594 <vUSB_ISR_Handler+0x158>
  1045a0:	eaffffd6 	b	104500 <vUSB_ISR_Handler+0xc4>
  1045a4:	e59d3000 	ldr	r3, [sp]
  1045a8:	e1d320d8 	ldrsb	r2, [r3, #8]
  1045ac:	e3520000 	cmp	r2, #0	; 0x0
  1045b0:	aafffff3 	bge	104584 <vUSB_ISR_Handler+0x148>
  1045b4:	e5113fcf 	ldr	r3, [r1, #-4047]
  1045b8:	e3833080 	orr	r3, r3, #128	; 0x80
  1045bc:	e5013fcf 	str	r3, [r1, #-4047]
  1045c0:	e1a02001 	mov	r2, r1
  1045c4:	e5123fcf 	ldr	r3, [r2, #-4047]
  1045c8:	e3130080 	tst	r3, #128	; 0x80
  1045cc:	0afffffc 	beq	1045c4 <vUSB_ISR_Handler+0x188>
  1045d0:	eaffffeb 	b	104584 <vUSB_ISR_Handler+0x148>
  1045d4:	00200e4c 	eoreq	r0, r0, ip, asr #28
  1045d8:	00200e50 	eoreq	r0, r0, r0, asr lr
  1045dc:	00201500 	eoreq	r1, r0, r0, lsl #10

001045e0 <vUSB_ISR_Wrapper>:
  1045e0:	e92d0001 	stmdb	sp!, {r0}
  1045e4:	e94d2000 	stmdb	sp, {sp}^
  1045e8:	e1a00000 	nop			(mov r0,r0)
  1045ec:	e24dd004 	sub	sp, sp, #4	; 0x4
  1045f0:	e8bd0001 	ldmia	sp!, {r0}
  1045f4:	e9204000 	stmdb	r0!, {lr}
  1045f8:	e1a0e000 	mov	lr, r0
  1045fc:	e8bd0001 	ldmia	sp!, {r0}
  104600:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  104604:	e1a00000 	nop			(mov r0,r0)
  104608:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10460c:	e14f0000 	mrs	r0, SPSR
  104610:	e92e0001 	stmdb	lr!, {r0}
  104614:	e59f0064 	ldr	r0, [pc, #100]	; 104680 <prog+0x463c>
  104618:	e5900000 	ldr	r0, [r0]
  10461c:	e92e0001 	stmdb	lr!, {r0}
  104620:	e59f005c 	ldr	r0, [pc, #92]	; 104684 <prog+0x4640>
  104624:	e5900000 	ldr	r0, [r0]
  104628:	e580e000 	str	lr, [r0]
  10462c:	e59f4044 	ldr	r4, [pc, #68]	; 104678 <prog+0x4634>
  104630:	e59f5044 	ldr	r5, [pc, #68]	; 10467c <prog+0x4638>
  104634:	e5943000 	ldr	r3, [r4]
  104638:	e5952000 	ldr	r2, [r5]
  10463c:	ebffff7e 	bl	10443c <vUSB_ISR_Handler>
  104640:	e59f003c 	ldr	r0, [pc, #60]	; 104684 <prog+0x4640>
  104644:	e5900000 	ldr	r0, [r0]
  104648:	e590e000 	ldr	lr, [r0]
  10464c:	e59f002c 	ldr	r0, [pc, #44]	; 104680 <prog+0x463c>
  104650:	e8be0002 	ldmia	lr!, {r1}
  104654:	e5801000 	str	r1, [r0]
  104658:	e8be0001 	ldmia	lr!, {r0}
  10465c:	e169f000 	msr	SPSR_fc, r0
  104660:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  104664:	e1a00000 	nop			(mov r0,r0)
  104668:	e59ee03c 	ldr	lr, [lr, #60]
  10466c:	e25ef004 	subs	pc, lr, #4	; 0x4
  104670:	e5943000 	ldr	r3, [r4]
  104674:	e5952000 	ldr	r2, [r5]
  104678:	00200820 	eoreq	r0, r0, r0, lsr #16
  10467c:	00200c18 	eoreq	r0, r0, r8, lsl ip
  104680:	00200820 	eoreq	r0, r0, r0, lsr #16
  104684:	00200c18 	eoreq	r0, r0, r8, lsl ip
  104688:	00425355 	subeq	r5, r2, r5, asr r3
  10468c:	4c455355 	mcrrmi	3, 5, r5, r5, cr5
  104690:	00004445 	andeq	r4, r0, r5, asr #8
  104694:	5f46526e 	swipl	0x0046526e
  104698:	78547852 	ldmvcda	r4, {r1, r4, r6, fp, ip, sp, lr}^
  10469c:	00000000 	andeq	r0, r0, r0
  1046a0:	6c6c6148 	stfvse	f6, [ip], #-288
  1046a4:	6369206f 	cmnvs	r9, #111	; 0x6f
  1046a8:	f6682068 	strnvbt	r2, [r8], -r8, rrx
  1046ac:	00216572 	eoreq	r6, r1, r2, ror r5

001046b0 <tea_key>:
  1046b0:	00112233 44556677 8899aabb ccddeeff     3"..wfUD........

001046c0 <broadcast_mac>:
  1046c0:	41434544 00000044                       DECAD...

001046c8 <crc32_table>:
  1046c8:	00000000 77073096 ee0e612c 990951ba     .....0.w,a...Q..
  1046d8:	076dc419 706af48f e963a535 9e6495a3     ..m...jp5.c...d.
  1046e8:	0edb8832 79dcb8a4 e0d5e91e 97d2d988     2......y........
  1046f8:	09b64c2b 7eb17cbd e7b82d07 90bf1d91     +L...|.~.-......
  104708:	1db71064 6ab020f2 f3b97148 84be41de     d.... .jHq...A..
  104718:	1adad47d 6ddde4eb f4d4b551 83d385c7     }......mQ.......
  104728:	136c9856 646ba8c0 fd62f97a 8a65c9ec     V.l...kdz.b...e.
  104738:	14015c4f 63066cd9 fa0f3d63 8d080df5     O\...l.cc=......
  104748:	3b6e20c8 4c69105e d56041e4 a2677172     . n;^.iL.A`.rqg.
  104758:	3c03e4d1 4b04d447 d20d85fd a50ab56b     ...<G..K....k...
  104768:	35b5a8fa 42b2986c dbbbc9d6 acbcf940     ...5l..B....@...
  104778:	32d86ce3 45df5c75 dcd60dcf abd13d59     .l.2u\.E....Y=..
  104788:	26d930ac 51de003a c8d75180 bfd06116     .0.&:..Q.Q...a..
  104798:	21b4f4b5 56b3c423 cfba9599 b8bda50f     ...!#..V........
  1047a8:	2802b89e 5f058808 c60cd9b2 b10be924     ...(..._....$...
  1047b8:	2f6f7c87 58684c11 c1611dab b6662d3d     .|o/.LhX..a.=-f.
  1047c8:	76dc4190 01db7106 98d220bc efd5102a     .A.v.q... ..*...
  1047d8:	71b18589 06b6b51f 9fbfe4a5 e8b8d433     ...q........3...
  1047e8:	7807c9a2 0f00f934 9609a88e e10e9818     ...x4...........
  1047f8:	7f6a0dbb 086d3d2d 91646c97 e6635c01     ..j.-=m..ld..\c.
  104808:	6b6b51f4 1c6c6162 856530d8 f262004e     .Qkkbal..0e.N.b.
  104818:	6c0695ed 1b01a57b 8208f4c1 f50fc457     ...l{.......W...
  104828:	65b0d9c6 12b7e950 8bbeb8ea fcb9887c     ...eP.......|...
  104838:	62dd1ddf 15da2d49 8cd37cf3 fbd44c65     ...bI-...|..eL..
  104848:	4db26158 3ab551ce a3bc0074 d4bb30e2     Xa.M.Q.:t....0..
  104858:	4adfa541 3dd895d7 a4d1c46d d3d6f4fb     A..J...=m.......
  104868:	4369e96a 346ed9fc ad678846 da60b8d0     j.iC..n4F.g...`.
  104878:	44042d73 33031de5 aa0a4c5f dd0d7cc9     s-.D...3_L...|..
  104888:	5005713c 270241aa be0b1010 c90c2086     <q.P.A.'..... ..
  104898:	5768b525 206f85b3 b966d409 ce61e49f     %.hW..o ..f...a.
  1048a8:	5edef90e 29d9c998 b0d09822 c7d7a8b4     ...^...)".......
  1048b8:	59b33d17 2eb40d81 b7bd5c3b c0ba6cad     .=.Y....;\...l..
  1048c8:	edb88320 9abfb3b6 03b6e20c 74b1d29a      ..............t
  1048d8:	ead54739 9dd277af 04db2615 73dc1683     9G...w...&.....s
  1048e8:	e3630b12 94643b84 0d6d6a3e 7a6a5aa8     ..c..;d.>jm..Zjz
  1048f8:	e40ecf0b 9309ff9d 0a00ae27 7d079eb1     ........'......}
  104908:	f00f9344 8708a3d2 1e01f268 6906c2fe     D.......h......i
  104918:	f762575d 806567cb 196c3671 6e6b06e7     ]Wb..ge.q6l...kn
  104928:	fed41b76 89d32be0 10da7a5a 67dd4acc     v....+..Zz...J.g
  104938:	f9b9df6f 8ebeeff9 17b7be43 60b08ed5     o.......C......`
  104948:	d6d6a3e8 a1d1937e 38d8c2c4 4fdff252     ....~......8R..O
  104958:	d1bb67f1 a6bc5767 3fb506dd 48b2364b     .g..gW.....?K6.H
  104968:	d80d2bda af0a1b4c 36034af6 41047a60     .+..L....J.6`z.A
  104978:	df60efc3 a867df55 316e8eef 4669be79     ..`.U.g...n1y.iF
  104988:	cb61b38c bc66831a 256fd2a0 5268e236     ..a...f...o%6.hR
  104998:	cc0c7795 bb0b4703 220216b9 5505262f     .w...G....."/&.U
  1049a8:	c5ba3bbe b2bd0b28 2bb45a92 5cb36a04     .;..(....Z.+.j.\
  1049b8:	c2d7ffa7 b5d0cf31 2cd99e8b 5bdeae1d     ....1......,...[
  1049c8:	9b64c2b0 ec63f226 756aa39c 026d930a     ..d.&.c...ju..m.
  1049d8:	9c0906a9 eb0e363f 72076785 05005713     ....?6...g.r.W..
  1049e8:	95bf4a82 e2b87a14 7bb12bae 0cb61b38     .J...z...+.{8...
  1049f8:	92d28e9b e5d5be0d 7cdcefb7 0bdbdf21     ...........|!...
  104a08:	86d3d2d4 f1d4e242 68ddb3f8 1fda836e     ....B......hn...
  104a18:	81be16cd f6b9265b 6fb077e1 18b74777     ....[&...w.owG..
  104a28:	88085ae6 ff0f6a70 66063bca 11010b5c     .Z..pj...;.f\...
  104a38:	8f659eff f862ae69 616bffd3 166ccf45     ..e.i.b...kaE.l.
  104a48:	a00ae278 d70dd2ee 4e048354 3903b3c2     x.......T..N...9
  104a58:	a7672661 d06016f7 4969474d 3e6e77db     a&g...`.MGiI.wn>
  104a68:	aed16a4a d9d65adc 40df0b66 37d83bf0     Jj...Z..f..@.;.7
  104a78:	a9bcae53 debb9ec5 47b2cf7f 30b5ffe9     S..........G...0
  104a88:	bdbdf21c cabac28a 53b39330 24b4a3a6     ........0..S...$
  104a98:	bad03605 cdd70693 54de5729 23d967bf     .6......)W.T.g.#
  104aa8:	b3667a2e c4614ab8 5d681b02 2a6f2b94     .zf..Ja...h].+o*
  104ab8:	b40bbe37 c30c8ea1 5a05df1b 2d02ef8d     7..........Z...-

00104ac8 <rfbroadcast_mac>:
  104ac8:	43415354 00735042                                TSACB

00104acd <ACTIVATE_SEQUENCE.1822>:
  104acd:	00007350                                         Ps

00104acf <C.2.1824>:
  104acf:	00000000 4c444900 03040045                       .....IDLE.

00104ad9 <pxLanguageStringDescriptor>:
  104ad9:	04090304                                ....

00104add <pxManufacturerStringDescriptor>:
  104add:	0062031c 00740069 0061006d 0075006e     ..b.i.t.m.a.n.u.
  104aed:	00610066 0074006b 00720075              f.a.k.t.u.r.

00104af9 <pxProductStringDescriptor>:
  104af9:	004f0328 00650070 0042006e 00610065     (.O.p.e.n.B.e.a.
  104b09:	006f0063 0020006e 006c0042 006e0069     c.o.n. .B.l.i.n.
  104b19:	0065006b 006c006e 00000067              k.e.n.l.g...

00104b25 <pxConfigDescriptor1>:
  104b25:	00430209 80030102 000409fa 02020100     ..C.............
  104b35:	24050401 04011000 05000224 01000624     ...$....$...$...
  104b45:	00012405 83050701 ff000803 00010409     .$..............
  104b55:	00000a02 01050700 00004002 02820507     .........@......
  104b65:	09000040                                         @..

00104b68 <pxConfigDescriptor2>:
  104b68:	00430209 80030202 00040932 02020100     ..C.....2.......
  104b78:	24050401 04011000 05000224 01000624     ...$....$...$...
  104b88:	00012405 83050701 ff000803 00010409     .$..............
  104b98:	00000a02 01050700 00004002 02820507     .........@......
  104ba8:	00000040                                @...

00104bac <pxConfigDescriptorSizes>:
  104bac:	00000043 00000043                       C...C...

00104bb4 <pxDeviceDescriptor>:
  104bb4:	01100112 08000002 08af16c0 02010110     ................
  104bc4:	00000200                                ....

00104bc8 <C.25.4299>:
	...

00104bdc <pxLineCoding>:
  104bdc:	0001c200 00080000 00000043              ........C...
Disassembly of section .data:

00200000 <__data_beg__>:
	...
  200008:	00200000 	eoreq	r0, r0, r0
  20000c:	00200000 	eoreq	r0, r0, r0
  200010:	00200008 	eoreq	r0, r0, r8
  200014:	00200008 	eoreq	r0, r0, r8
  200018:	00200010 	eoreq	r0, r0, r0, lsl r0
  20001c:	00200010 	eoreq	r0, r0, r0, lsl r0
  200020:	00200018 	eoreq	r0, r0, r8, lsl r0
  200024:	00200018 	eoreq	r0, r0, r8, lsl r0
  200028:	00200020 	eoreq	r0, r0, r0, lsr #32
  20002c:	00200020 	eoreq	r0, r0, r0, lsr #32
  200030:	00200028 	eoreq	r0, r0, r8, lsr #32
  200034:	00200028 	eoreq	r0, r0, r8, lsr #32
  200038:	00200030 	eoreq	r0, r0, r0, lsr r0
  20003c:	00200030 	eoreq	r0, r0, r0, lsr r0
  200040:	00200038 	eoreq	r0, r0, r8, lsr r0
  200044:	00200038 	eoreq	r0, r0, r8, lsr r0
  200048:	00200040 	eoreq	r0, r0, r0, asr #32
  20004c:	00200040 	eoreq	r0, r0, r0, asr #32
  200050:	00200048 	eoreq	r0, r0, r8, asr #32
  200054:	00200048 	eoreq	r0, r0, r8, asr #32
  200058:	00200050 	eoreq	r0, r0, r0, asr r0
  20005c:	00200050 	eoreq	r0, r0, r0, asr r0
  200060:	00200058 	eoreq	r0, r0, r8, asr r0
  200064:	00200058 	eoreq	r0, r0, r8, asr r0
  200068:	00200060 	eoreq	r0, r0, r0, rrx
  20006c:	00200060 	eoreq	r0, r0, r0, rrx
  200070:	00200068 	eoreq	r0, r0, r8, rrx
  200074:	00200068 	eoreq	r0, r0, r8, rrx
  200078:	00200070 	eoreq	r0, r0, r0, ror r0
  20007c:	00200070 	eoreq	r0, r0, r0, ror r0
  200080:	00200078 	eoreq	r0, r0, r8, ror r0
  200084:	00200078 	eoreq	r0, r0, r8, ror r0
  200088:	00200080 	eoreq	r0, r0, r0, lsl #1
  20008c:	00200080 	eoreq	r0, r0, r0, lsl #1
  200090:	00200088 	eoreq	r0, r0, r8, lsl #1
  200094:	00200088 	eoreq	r0, r0, r8, lsl #1
  200098:	00200090 	mlaeq	r0, r0, r0, r0
  20009c:	00200090 	mlaeq	r0, r0, r0, r0
  2000a0:	00200098 	mlaeq	r0, r8, r0, r0
  2000a4:	00200098 	mlaeq	r0, r8, r0, r0
  2000a8:	002000a0 	eoreq	r0, r0, r0, lsr #1
  2000ac:	002000a0 	eoreq	r0, r0, r0, lsr #1
  2000b0:	002000a8 	eoreq	r0, r0, r8, lsr #1
  2000b4:	002000a8 	eoreq	r0, r0, r8, lsr #1
  2000b8:	002000b0 	streqh	r0, [r0], -r0
  2000bc:	002000b0 	streqh	r0, [r0], -r0
  2000c0:	002000b8 	streqh	r0, [r0], -r8
  2000c4:	002000b8 	streqh	r0, [r0], -r8
  2000c8:	002000c0 	eoreq	r0, r0, r0, asr #1
  2000cc:	002000c0 	eoreq	r0, r0, r0, asr #1
  2000d0:	002000c8 	eoreq	r0, r0, r8, asr #1
  2000d4:	002000c8 	eoreq	r0, r0, r8, asr #1
  2000d8:	002000d0 	ldreqd	r0, [r0], -r0
  2000dc:	002000d0 	ldreqd	r0, [r0], -r0
  2000e0:	002000d8 	ldreqd	r0, [r0], -r8
  2000e4:	002000d8 	ldreqd	r0, [r0], -r8
  2000e8:	002000e0 	eoreq	r0, r0, r0, ror #1
  2000ec:	002000e0 	eoreq	r0, r0, r0, ror #1
  2000f0:	002000e8 	eoreq	r0, r0, r8, ror #1
  2000f4:	002000e8 	eoreq	r0, r0, r8, ror #1
  2000f8:	002000f0 	streqd	r0, [r0], -r0
  2000fc:	002000f0 	streqd	r0, [r0], -r0
  200100:	002000f8 	streqd	r0, [r0], -r8
  200104:	002000f8 	streqd	r0, [r0], -r8
  200108:	00200100 	eoreq	r0, r0, r0, lsl #2
  20010c:	00200100 	eoreq	r0, r0, r0, lsl #2
  200110:	00200108 	eoreq	r0, r0, r8, lsl #2
  200114:	00200108 	eoreq	r0, r0, r8, lsl #2
  200118:	00200110 	eoreq	r0, r0, r0, lsl r1
  20011c:	00200110 	eoreq	r0, r0, r0, lsl r1
  200120:	00200118 	eoreq	r0, r0, r8, lsl r1
  200124:	00200118 	eoreq	r0, r0, r8, lsl r1
  200128:	00200120 	eoreq	r0, r0, r0, lsr #2
  20012c:	00200120 	eoreq	r0, r0, r0, lsr #2
  200130:	00200128 	eoreq	r0, r0, r8, lsr #2
  200134:	00200128 	eoreq	r0, r0, r8, lsr #2
  200138:	00200130 	eoreq	r0, r0, r0, lsr r1
  20013c:	00200130 	eoreq	r0, r0, r0, lsr r1
  200140:	00200138 	eoreq	r0, r0, r8, lsr r1
  200144:	00200138 	eoreq	r0, r0, r8, lsr r1
  200148:	00200140 	eoreq	r0, r0, r0, asr #2
  20014c:	00200140 	eoreq	r0, r0, r0, asr #2
  200150:	00200148 	eoreq	r0, r0, r8, asr #2
  200154:	00200148 	eoreq	r0, r0, r8, asr #2
  200158:	00200150 	eoreq	r0, r0, r0, asr r1
  20015c:	00200150 	eoreq	r0, r0, r0, asr r1
  200160:	00200158 	eoreq	r0, r0, r8, asr r1
  200164:	00200158 	eoreq	r0, r0, r8, asr r1
  200168:	00200160 	eoreq	r0, r0, r0, ror #2
  20016c:	00200160 	eoreq	r0, r0, r0, ror #2
  200170:	00200168 	eoreq	r0, r0, r8, ror #2
  200174:	00200168 	eoreq	r0, r0, r8, ror #2
  200178:	00200170 	eoreq	r0, r0, r0, ror r1
  20017c:	00200170 	eoreq	r0, r0, r0, ror r1
  200180:	00200178 	eoreq	r0, r0, r8, ror r1
  200184:	00200178 	eoreq	r0, r0, r8, ror r1
  200188:	00200180 	eoreq	r0, r0, r0, lsl #3
  20018c:	00200180 	eoreq	r0, r0, r0, lsl #3
  200190:	00200188 	eoreq	r0, r0, r8, lsl #3
  200194:	00200188 	eoreq	r0, r0, r8, lsl #3
  200198:	00200190 	mlaeq	r0, r0, r1, r0
  20019c:	00200190 	mlaeq	r0, r0, r1, r0
  2001a0:	00200198 	mlaeq	r0, r8, r1, r0
  2001a4:	00200198 	mlaeq	r0, r8, r1, r0
  2001a8:	002001a0 	eoreq	r0, r0, r0, lsr #3
  2001ac:	002001a0 	eoreq	r0, r0, r0, lsr #3
  2001b0:	002001a8 	eoreq	r0, r0, r8, lsr #3
  2001b4:	002001a8 	eoreq	r0, r0, r8, lsr #3
  2001b8:	002001b0 	streqh	r0, [r0], -r0
  2001bc:	002001b0 	streqh	r0, [r0], -r0
  2001c0:	002001b8 	streqh	r0, [r0], -r8
  2001c4:	002001b8 	streqh	r0, [r0], -r8
  2001c8:	002001c0 	eoreq	r0, r0, r0, asr #3
  2001cc:	002001c0 	eoreq	r0, r0, r0, asr #3
  2001d0:	002001c8 	eoreq	r0, r0, r8, asr #3
  2001d4:	002001c8 	eoreq	r0, r0, r8, asr #3
  2001d8:	002001d0 	ldreqd	r0, [r0], -r0
  2001dc:	002001d0 	ldreqd	r0, [r0], -r0
  2001e0:	002001d8 	ldreqd	r0, [r0], -r8
  2001e4:	002001d8 	ldreqd	r0, [r0], -r8
  2001e8:	002001e0 	eoreq	r0, r0, r0, ror #3
  2001ec:	002001e0 	eoreq	r0, r0, r0, ror #3
  2001f0:	002001e8 	eoreq	r0, r0, r8, ror #3
  2001f4:	002001e8 	eoreq	r0, r0, r8, ror #3
  2001f8:	002001f0 	streqd	r0, [r0], -r0
  2001fc:	002001f0 	streqd	r0, [r0], -r0
  200200:	002001f8 	streqd	r0, [r0], -r8
  200204:	002001f8 	streqd	r0, [r0], -r8
  200208:	00200200 	eoreq	r0, r0, r0, lsl #4
  20020c:	00200200 	eoreq	r0, r0, r0, lsl #4
  200210:	00200208 	eoreq	r0, r0, r8, lsl #4
  200214:	00200208 	eoreq	r0, r0, r8, lsl #4
  200218:	00200210 	eoreq	r0, r0, r0, lsl r2
  20021c:	00200210 	eoreq	r0, r0, r0, lsl r2
  200220:	00200218 	eoreq	r0, r0, r8, lsl r2
  200224:	00200218 	eoreq	r0, r0, r8, lsl r2
  200228:	00200220 	eoreq	r0, r0, r0, lsr #4
  20022c:	00200220 	eoreq	r0, r0, r0, lsr #4
  200230:	00200228 	eoreq	r0, r0, r8, lsr #4
  200234:	00200228 	eoreq	r0, r0, r8, lsr #4
  200238:	00200230 	eoreq	r0, r0, r0, lsr r2
  20023c:	00200230 	eoreq	r0, r0, r0, lsr r2
  200240:	00200238 	eoreq	r0, r0, r8, lsr r2
  200244:	00200238 	eoreq	r0, r0, r8, lsr r2
  200248:	00200240 	eoreq	r0, r0, r0, asr #4
  20024c:	00200240 	eoreq	r0, r0, r0, asr #4
  200250:	00200248 	eoreq	r0, r0, r8, asr #4
  200254:	00200248 	eoreq	r0, r0, r8, asr #4
  200258:	00200250 	eoreq	r0, r0, r0, asr r2
  20025c:	00200250 	eoreq	r0, r0, r0, asr r2
  200260:	00200258 	eoreq	r0, r0, r8, asr r2
  200264:	00200258 	eoreq	r0, r0, r8, asr r2
  200268:	00200260 	eoreq	r0, r0, r0, ror #4
  20026c:	00200260 	eoreq	r0, r0, r0, ror #4
  200270:	00200268 	eoreq	r0, r0, r8, ror #4
  200274:	00200268 	eoreq	r0, r0, r8, ror #4
  200278:	00200270 	eoreq	r0, r0, r0, ror r2
  20027c:	00200270 	eoreq	r0, r0, r0, ror r2
  200280:	00200278 	eoreq	r0, r0, r8, ror r2
  200284:	00200278 	eoreq	r0, r0, r8, ror r2
  200288:	00200280 	eoreq	r0, r0, r0, lsl #5
  20028c:	00200280 	eoreq	r0, r0, r0, lsl #5
  200290:	00200288 	eoreq	r0, r0, r8, lsl #5
  200294:	00200288 	eoreq	r0, r0, r8, lsl #5
  200298:	00200290 	mlaeq	r0, r0, r2, r0
  20029c:	00200290 	mlaeq	r0, r0, r2, r0
  2002a0:	00200298 	mlaeq	r0, r8, r2, r0
  2002a4:	00200298 	mlaeq	r0, r8, r2, r0
  2002a8:	002002a0 	eoreq	r0, r0, r0, lsr #5
  2002ac:	002002a0 	eoreq	r0, r0, r0, lsr #5
  2002b0:	002002a8 	eoreq	r0, r0, r8, lsr #5
  2002b4:	002002a8 	eoreq	r0, r0, r8, lsr #5
  2002b8:	002002b0 	streqh	r0, [r0], -r0
  2002bc:	002002b0 	streqh	r0, [r0], -r0
  2002c0:	002002b8 	streqh	r0, [r0], -r8
  2002c4:	002002b8 	streqh	r0, [r0], -r8
  2002c8:	002002c0 	eoreq	r0, r0, r0, asr #5
  2002cc:	002002c0 	eoreq	r0, r0, r0, asr #5
  2002d0:	002002c8 	eoreq	r0, r0, r8, asr #5
  2002d4:	002002c8 	eoreq	r0, r0, r8, asr #5
  2002d8:	002002d0 	ldreqd	r0, [r0], -r0
  2002dc:	002002d0 	ldreqd	r0, [r0], -r0
  2002e0:	002002d8 	ldreqd	r0, [r0], -r8
  2002e4:	002002d8 	ldreqd	r0, [r0], -r8
  2002e8:	002002e0 	eoreq	r0, r0, r0, ror #5
  2002ec:	002002e0 	eoreq	r0, r0, r0, ror #5
  2002f0:	002002e8 	eoreq	r0, r0, r8, ror #5
  2002f4:	002002e8 	eoreq	r0, r0, r8, ror #5
  2002f8:	002002f0 	streqd	r0, [r0], -r0
  2002fc:	002002f0 	streqd	r0, [r0], -r0
  200300:	002002f8 	streqd	r0, [r0], -r8
  200304:	002002f8 	streqd	r0, [r0], -r8
  200308:	00200300 	eoreq	r0, r0, r0, lsl #6
  20030c:	00200300 	eoreq	r0, r0, r0, lsl #6
  200310:	00200308 	eoreq	r0, r0, r8, lsl #6
  200314:	00200308 	eoreq	r0, r0, r8, lsl #6
  200318:	00200310 	eoreq	r0, r0, r0, lsl r3
  20031c:	00200310 	eoreq	r0, r0, r0, lsl r3
  200320:	00200318 	eoreq	r0, r0, r8, lsl r3
  200324:	00200318 	eoreq	r0, r0, r8, lsl r3
  200328:	00200320 	eoreq	r0, r0, r0, lsr #6
  20032c:	00200320 	eoreq	r0, r0, r0, lsr #6
  200330:	00200328 	eoreq	r0, r0, r8, lsr #6
  200334:	00200328 	eoreq	r0, r0, r8, lsr #6
  200338:	00200330 	eoreq	r0, r0, r0, lsr r3
  20033c:	00200330 	eoreq	r0, r0, r0, lsr r3
  200340:	00200338 	eoreq	r0, r0, r8, lsr r3
  200344:	00200338 	eoreq	r0, r0, r8, lsr r3
  200348:	00200340 	eoreq	r0, r0, r0, asr #6
  20034c:	00200340 	eoreq	r0, r0, r0, asr #6
  200350:	00200348 	eoreq	r0, r0, r8, asr #6
  200354:	00200348 	eoreq	r0, r0, r8, asr #6
  200358:	00200350 	eoreq	r0, r0, r0, asr r3
  20035c:	00200350 	eoreq	r0, r0, r0, asr r3
  200360:	00200358 	eoreq	r0, r0, r8, asr r3
  200364:	00200358 	eoreq	r0, r0, r8, asr r3
  200368:	00200360 	eoreq	r0, r0, r0, ror #6
  20036c:	00200360 	eoreq	r0, r0, r0, ror #6
  200370:	00200368 	eoreq	r0, r0, r8, ror #6
  200374:	00200368 	eoreq	r0, r0, r8, ror #6
  200378:	00200370 	eoreq	r0, r0, r0, ror r3
  20037c:	00200370 	eoreq	r0, r0, r0, ror r3
  200380:	00200378 	eoreq	r0, r0, r8, ror r3
  200384:	00200378 	eoreq	r0, r0, r8, ror r3
  200388:	00200380 	eoreq	r0, r0, r0, lsl #7
  20038c:	00200380 	eoreq	r0, r0, r0, lsl #7
  200390:	00200388 	eoreq	r0, r0, r8, lsl #7
  200394:	00200388 	eoreq	r0, r0, r8, lsl #7
  200398:	00200390 	mlaeq	r0, r0, r3, r0
  20039c:	00200390 	mlaeq	r0, r0, r3, r0
  2003a0:	00200398 	mlaeq	r0, r8, r3, r0
  2003a4:	00200398 	mlaeq	r0, r8, r3, r0
  2003a8:	002003a0 	eoreq	r0, r0, r0, lsr #7
  2003ac:	002003a0 	eoreq	r0, r0, r0, lsr #7
  2003b0:	002003a8 	eoreq	r0, r0, r8, lsr #7
  2003b4:	002003a8 	eoreq	r0, r0, r8, lsr #7
  2003b8:	002003b0 	streqh	r0, [r0], -r0
  2003bc:	002003b0 	streqh	r0, [r0], -r0
  2003c0:	002003b8 	streqh	r0, [r0], -r8
  2003c4:	002003b8 	streqh	r0, [r0], -r8
  2003c8:	002003c0 	eoreq	r0, r0, r0, asr #7
  2003cc:	002003c0 	eoreq	r0, r0, r0, asr #7
  2003d0:	002003c8 	eoreq	r0, r0, r8, asr #7
  2003d4:	002003c8 	eoreq	r0, r0, r8, asr #7
  2003d8:	002003d0 	ldreqd	r0, [r0], -r0
  2003dc:	002003d0 	ldreqd	r0, [r0], -r0
  2003e0:	002003d8 	ldreqd	r0, [r0], -r8
  2003e4:	002003d8 	ldreqd	r0, [r0], -r8
  2003e8:	002003e0 	eoreq	r0, r0, r0, ror #7
  2003ec:	002003e0 	eoreq	r0, r0, r0, ror #7
  2003f0:	002003e8 	eoreq	r0, r0, r8, ror #7
  2003f4:	002003e8 	eoreq	r0, r0, r8, ror #7
  2003f8:	002003f0 	streqd	r0, [r0], -r0
  2003fc:	002003f0 	streqd	r0, [r0], -r0
  200400:	002003f8 	streqd	r0, [r0], -r8
  200404:	002003f8 	streqd	r0, [r0], -r8

00200408 <__malloc_trim_threshold>:
  200408:	00020000                                ....

0020040c <__malloc_sbrk_base>:
  20040c:	ffffffff                                ....

00200410 <_impure_ptr>:
  200410:	00200414                                .. .

00200414 <impure_data>:
  200414:	00000000 00200700 0020075c 002007b8     ...... .\. ... .
	...
  200448:	00104be4 00000000 00000000 00000000     .K..............
	...
  2004b8:	00000001 00000000 abcd330e e66d1234     .........3..4.m.
  2004c8:	0005deec 0000000b 00000000 00000000     ................
	...

00200814 <jam_mac>:
  200814:	4d4d414a 434d5700                                JAMM.

00200819 <wmcu_mac>:
  200819:	55434d57 0f000000                                WMCU...

00200820 <ulCriticalNesting>:
  200820:	0000270f                                .'..

00200824 <pxConfigDescriptorList>:
  200824:	00104b25 00104b68                       %K..hK..

0020082c <xxtea_encode>:
  20082c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  200830:	e0803101 	add	r3, r0, r1, lsl #2
  200834:	e1a09000 	mov	r9, r0
  200838:	e3a00034 	mov	r0, #52	; 0x34
  20083c:	e1a04001 	mov	r4, r1
  200840:	e5135004 	ldr	r5, [r3, #-4]
  200844:	e243b004 	sub	fp, r3, #4	; 0x4
  200848:	ebfbfe31 	bl	100114 <__aeabi_idiv>
  20084c:	e2800005 	add	r0, r0, #5	; 0x5
  200850:	e3700001 	cmn	r0, #1	; 0x1
  200854:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200858:	e0803100 	add	r3, r0, r0, lsl #2
  20085c:	e0603283 	rsb	r3, r0, r3, lsl #5
  200860:	e0833283 	add	r3, r3, r3, lsl #5
  200864:	e0603103 	rsb	r3, r0, r3, lsl #2
  200868:	e0633283 	rsb	r3, r3, r3, lsl #5
  20086c:	e0633403 	rsb	r3, r3, r3, lsl #8
  200870:	e0803083 	add	r3, r0, r3, lsl #1
  200874:	e0803183 	add	r3, r0, r3, lsl #3
  200878:	e283a49f 	add	sl, r3, #-1627389952	; 0x9f000000
  20087c:	e24aa732 	sub	sl, sl, #13107200	; 0xc80000
  200880:	e24aac86 	sub	sl, sl, #34304	; 0x8600
  200884:	e59f80d8 	ldr	r8, [pc, #216]	; 200964 <.data+0x964>
  200888:	e1a0c005 	mov	ip, r5
  20088c:	e2447001 	sub	r7, r4, #1	; 0x1
  200890:	e24aa047 	sub	sl, sl, #71	; 0x47
  200894:	e3a05000 	mov	r5, #0	; 0x0
  200898:	e285549f 	add	r5, r5, #-1627389952	; 0x9f000000
  20089c:	e2455732 	sub	r5, r5, #13107200	; 0xc80000
  2008a0:	e2455c86 	sub	r5, r5, #34304	; 0x8600
  2008a4:	e2455047 	sub	r5, r5, #71	; 0x47
  2008a8:	e3570000 	cmp	r7, #0	; 0x0
  2008ac:	e1a03125 	mov	r3, r5, lsr #2
  2008b0:	e2036003 	and	r6, r3, #3	; 0x3
  2008b4:	d3a01000 	movle	r1, #0	; 0x0
  2008b8:	da000016 	ble	200918 <xxtea_encode+0xec>
  2008bc:	e1a0e009 	mov	lr, r9
  2008c0:	e3a04000 	mov	r4, #0	; 0x0
  2008c4:	e2043003 	and	r3, r4, #3	; 0x3
  2008c8:	e59e2004 	ldr	r2, [lr, #4]
  2008cc:	e0263003 	eor	r3, r6, r3
  2008d0:	e7980103 	ldr	r0, [r8, r3, lsl #2]
  2008d4:	e1a0120c 	mov	r1, ip, lsl #4
  2008d8:	e1a03102 	mov	r3, r2, lsl #2
  2008dc:	e02111a2 	eor	r1, r1, r2, lsr #3
  2008e0:	e02c0000 	eor	r0, ip, r0
  2008e4:	e02332ac 	eor	r3, r3, ip, lsr #5
  2008e8:	e0252002 	eor	r2, r5, r2
  2008ec:	e0833001 	add	r3, r3, r1
  2008f0:	e0822000 	add	r2, r2, r0
  2008f4:	e59e1000 	ldr	r1, [lr]
  2008f8:	e0233002 	eor	r3, r3, r2
  2008fc:	e2844001 	add	r4, r4, #1	; 0x1
  200900:	e0833001 	add	r3, r3, r1
  200904:	e1570004 	cmp	r7, r4
  200908:	e48e3004 	str	r3, [lr], #4
  20090c:	e1a0c003 	mov	ip, r3
  200910:	1affffeb 	bne	2008c4 <xxtea_encode+0x98>
  200914:	e2041003 	and	r1, r4, #3	; 0x3
  200918:	e5992000 	ldr	r2, [r9]
  20091c:	e0261001 	eor	r1, r6, r1
  200920:	e7980101 	ldr	r0, [r8, r1, lsl #2]
  200924:	e1a03102 	mov	r3, r2, lsl #2
  200928:	e1a0120c 	mov	r1, ip, lsl #4
  20092c:	e02111a2 	eor	r1, r1, r2, lsr #3
  200930:	e02c0000 	eor	r0, ip, r0
  200934:	e02332ac 	eor	r3, r3, ip, lsr #5
  200938:	e0252002 	eor	r2, r5, r2
  20093c:	e0833001 	add	r3, r3, r1
  200940:	e0822000 	add	r2, r2, r0
  200944:	e59b1000 	ldr	r1, [fp]
  200948:	e0233002 	eor	r3, r3, r2
  20094c:	e0833001 	add	r3, r3, r1
  200950:	e155000a 	cmp	r5, sl
  200954:	e58b3000 	str	r3, [fp]
  200958:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  20095c:	e1a0c003 	mov	ip, r3
  200960:	eaffffcc 	b	200898 <xxtea_encode+0x6c>
  200964:	001046b0 	ldreqh	r4, [r0], -r0

00200968 <xxtea_decode>:
  200968:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  20096c:	e1a09000 	mov	r9, r0
  200970:	e24dd00c 	sub	sp, sp, #12	; 0xc
  200974:	e3a00034 	mov	r0, #52	; 0x34
  200978:	e58d1004 	str	r1, [sp, #4]
  20097c:	ebfbfde4 	bl	100114 <__aeabi_idiv>
  200980:	e2800006 	add	r0, r0, #6	; 0x6
  200984:	e0803100 	add	r3, r0, r0, lsl #2
  200988:	e0603283 	rsb	r3, r0, r3, lsl #5
  20098c:	e0833283 	add	r3, r3, r3, lsl #5
  200990:	e0603103 	rsb	r3, r0, r3, lsl #2
  200994:	e0633283 	rsb	r3, r3, r3, lsl #5
  200998:	e0633403 	rsb	r3, r3, r3, lsl #8
  20099c:	e0803083 	add	r3, r0, r3, lsl #1
  2009a0:	e0806183 	add	r6, r0, r3, lsl #3
  2009a4:	e3560000 	cmp	r6, #0	; 0x0
  2009a8:	e5994000 	ldr	r4, [r9]
  2009ac:	0a000041 	beq	200ab8 <xxtea_decode+0x150>
  2009b0:	e59d2004 	ldr	r2, [sp, #4]
  2009b4:	e1a02102 	mov	r2, r2, lsl #2
  2009b8:	e0893002 	add	r3, r9, r2
  2009bc:	e2433004 	sub	r3, r3, #4	; 0x4
  2009c0:	e58d3008 	str	r3, [sp, #8]
  2009c4:	e59d3004 	ldr	r3, [sp, #4]
  2009c8:	e58d2000 	str	r2, [sp]
  2009cc:	e59fa0ec 	ldr	sl, [pc, #236]	; 200ac0 <.data+0xac0>
  2009d0:	e1a05004 	mov	r5, r4
  2009d4:	e243b001 	sub	fp, r3, #1	; 0x1
  2009d8:	e35b0000 	cmp	fp, #0	; 0x0
  2009dc:	e1a03126 	mov	r3, r6, lsr #2
  2009e0:	e2038003 	and	r8, r3, #3	; 0x3
  2009e4:	d1a0e00b 	movle	lr, fp
  2009e8:	da00001a 	ble	200a58 <xxtea_decode+0xf0>
  2009ec:	e59d2004 	ldr	r2, [sp, #4]
  2009f0:	e06b3002 	rsb	r3, fp, r2
  2009f4:	e2437001 	sub	r7, r3, #1	; 0x1
  2009f8:	e59d3000 	ldr	r3, [sp]
  2009fc:	e1a0e00b 	mov	lr, fp
  200a00:	e0834009 	add	r4, r3, r9
  200a04:	e20e3003 	and	r3, lr, #3	; 0x3
  200a08:	e5140008 	ldr	r0, [r4, #-8]
  200a0c:	e0283003 	eor	r3, r8, r3
  200a10:	e79ac103 	ldr	ip, [sl, r3, lsl #2]
  200a14:	e1a02105 	mov	r2, r5, lsl #2
  200a18:	e1a03200 	mov	r3, r0, lsl #4
  200a1c:	e02331a5 	eor	r3, r3, r5, lsr #3
  200a20:	e0261005 	eor	r1, r6, r5
  200a24:	e020c00c 	eor	ip, r0, ip
  200a28:	e02222a0 	eor	r2, r2, r0, lsr #5
  200a2c:	e0822003 	add	r2, r2, r3
  200a30:	e081100c 	add	r1, r1, ip
  200a34:	e5143004 	ldr	r3, [r4, #-4]
  200a38:	e0222001 	eor	r2, r2, r1
  200a3c:	e24ee001 	sub	lr, lr, #1	; 0x1
  200a40:	e0623003 	rsb	r3, r2, r3
  200a44:	e15e0007 	cmp	lr, r7
  200a48:	e5243004 	str	r3, [r4, #-4]!
  200a4c:	e1a05003 	mov	r5, r3
  200a50:	1affffeb 	bne	200a04 <xxtea_decode+0x9c>
  200a54:	e5994000 	ldr	r4, [r9]
  200a58:	e59d2008 	ldr	r2, [sp, #8]
  200a5c:	e20e3003 	and	r3, lr, #3	; 0x3
  200a60:	e5921000 	ldr	r1, [r2]
  200a64:	e0283003 	eor	r3, r8, r3
  200a68:	e79a0103 	ldr	r0, [sl, r3, lsl #2]
  200a6c:	e026c005 	eor	ip, r6, r5
  200a70:	e1a03105 	mov	r3, r5, lsl #2
  200a74:	e2866461 	add	r6, r6, #1627389952	; 0x61000000
  200a78:	e1a02201 	mov	r2, r1, lsl #4
  200a7c:	e0210000 	eor	r0, r1, r0
  200a80:	e02332a1 	eor	r3, r3, r1, lsr #5
  200a84:	e02221a5 	eor	r2, r2, r5, lsr #3
  200a88:	e2866732 	add	r6, r6, #13107200	; 0xc80000
  200a8c:	e0833002 	add	r3, r3, r2
  200a90:	e08cc000 	add	ip, ip, r0
  200a94:	e2866c86 	add	r6, r6, #34304	; 0x8600
  200a98:	e023300c 	eor	r3, r3, ip
  200a9c:	e2866047 	add	r6, r6, #71	; 0x47
  200aa0:	e0633004 	rsb	r3, r3, r4
  200aa4:	e3560000 	cmp	r6, #0	; 0x0
  200aa8:	e5893000 	str	r3, [r9]
  200aac:	e1a04003 	mov	r4, r3
  200ab0:	11a05003 	movne	r5, r3
  200ab4:	1affffc7 	bne	2009d8 <xxtea_decode+0x70>
  200ab8:	e28dd00c 	add	sp, sp, #12	; 0xc
  200abc:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200ac0:	001046b0 	ldreqh	r4, [r0], -r0

00200ac4 <crc32>:
  200ac4:	e3510003 	cmp	r1, #3	; 0x3
  200ac8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  200acc:	e1a0c001 	mov	ip, r1
  200ad0:	e1a04000 	mov	r4, r0
  200ad4:	d3e0e000 	mvnle	lr, #0	; 0x0
  200ad8:	da000015 	ble	200b34 <crc32+0x70>
  200adc:	e59f5088 	ldr	r5, [pc, #136]	; 200b6c <.data+0xb6c>
  200ae0:	e3e0e000 	mvn	lr, #0	; 0x0
  200ae4:	e4940004 	ldr	r0, [r4], #4
  200ae8:	e020300e 	eor	r3, r0, lr
  200aec:	e20330ff 	and	r3, r3, #255	; 0xff
  200af0:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200af4:	e022242e 	eor	r2, r2, lr, lsr #8
  200af8:	e0223420 	eor	r3, r2, r0, lsr #8
  200afc:	e20330ff 	and	r3, r3, #255	; 0xff
  200b00:	e7951103 	ldr	r1, [r5, r3, lsl #2]
  200b04:	e0211422 	eor	r1, r1, r2, lsr #8
  200b08:	e0213820 	eor	r3, r1, r0, lsr #16
  200b0c:	e20330ff 	and	r3, r3, #255	; 0xff
  200b10:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200b14:	e0222421 	eor	r2, r2, r1, lsr #8
  200b18:	e0220c20 	eor	r0, r2, r0, lsr #24
  200b1c:	e20000ff 	and	r0, r0, #255	; 0xff
  200b20:	e7953100 	ldr	r3, [r5, r0, lsl #2]
  200b24:	e24cc004 	sub	ip, ip, #4	; 0x4
  200b28:	e35c0003 	cmp	ip, #3	; 0x3
  200b2c:	e023e422 	eor	lr, r3, r2, lsr #8
  200b30:	caffffeb 	bgt	200ae4 <crc32+0x20>
  200b34:	e35c0000 	cmp	ip, #0	; 0x0
  200b38:	0a000009 	beq	200b64 <crc32+0xa0>
  200b3c:	e59f5028 	ldr	r5, [pc, #40]	; 200b6c <.data+0xb6c>
  200b40:	e3a01000 	mov	r1, #0	; 0x0
  200b44:	e7d13004 	ldrb	r3, [r1, r4]
  200b48:	e023300e 	eor	r3, r3, lr
  200b4c:	e20330ff 	and	r3, r3, #255	; 0xff
  200b50:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200b54:	e2811001 	add	r1, r1, #1	; 0x1
  200b58:	e151000c 	cmp	r1, ip
  200b5c:	e022e42e 	eor	lr, r2, lr, lsr #8
  200b60:	1afffff7 	bne	200b44 <crc32+0x80>
  200b64:	e1e0000e 	mvn	r0, lr
  200b68:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  200b6c:	001046c8 	andeqs	r4, r0, r8, asr #13
