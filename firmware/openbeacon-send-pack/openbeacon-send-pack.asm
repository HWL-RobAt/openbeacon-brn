
openbeacon-send-pack.elf:     file format elf32-littlearm

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
  100024:	001038e0 	andeqs	r3, r0, r0, ror #17

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
  100090:	eb00084c 	bl	1021c8 <AT91F_LowLevelInit>
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
  1000f8:	00200b78 	eoreq	r0, r0, r8, ror fp
  1000fc:	00200f54 	eoreq	r0, r0, r4, asr pc
  100100:	00200000 	eoreq	r0, r0, r0
  100104:	00104d38 	andeqs	r4, r0, r8, lsr sp
  100108:	00200b78 	eoreq	r0, r0, r8, ror fp
  10010c:	00203ffc 	streqd	r3, [r0], -ip
  100110:	001010d4 	ldreqsb	r1, [r0], -r4

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
  100230:	eb00003a 	bl	100320 <__aeabi_idiv0>
  100234:	e3a00000 	mov	r0, #0	; 0x0
  100238:	e49df008 	ldr	pc, [sp], #8

0010023c <__aeabi_idivmod>:
  10023c:	e92d4003 	stmdb	sp!, {r0, r1, lr}
  100240:	ebffffb3 	bl	100114 <__aeabi_idiv>
  100244:	e8bd4006 	ldmia	sp!, {r1, r2, lr}
  100248:	e0030092 	mul	r3, r2, r0
  10024c:	e0411003 	sub	r1, r1, r3
  100250:	e12fff1e 	bx	lr

00100254 <__umodsi3>:
  100254:	e2512001 	subs	r2, r1, #1	; 0x1
  100258:	3a00002c 	bcc	100310 <__umodsi3+0xbc>
  10025c:	11500001 	cmpne	r0, r1
  100260:	03a00000 	moveq	r0, #0	; 0x0
  100264:	81110002 	tsthi	r1, r2
  100268:	00000002 	andeq	r0, r0, r2
  10026c:	912fff1e 	bxls	lr
  100270:	e3a02000 	mov	r2, #0	; 0x0
  100274:	e3510201 	cmp	r1, #268435456	; 0x10000000
  100278:	31510000 	cmpcc	r1, r0
  10027c:	31a01201 	movcc	r1, r1, lsl #4
  100280:	32822004 	addcc	r2, r2, #4	; 0x4
  100284:	3afffffa 	bcc	100274 <__umodsi3+0x20>
  100288:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
  10028c:	31510000 	cmpcc	r1, r0
  100290:	31a01081 	movcc	r1, r1, lsl #1
  100294:	32822001 	addcc	r2, r2, #1	; 0x1
  100298:	3afffffa 	bcc	100288 <__umodsi3+0x34>
  10029c:	e2522003 	subs	r2, r2, #3	; 0x3
  1002a0:	ba00000e 	blt	1002e0 <__umodsi3+0x8c>
  1002a4:	e1500001 	cmp	r0, r1
  1002a8:	20400001 	subcs	r0, r0, r1
  1002ac:	e15000a1 	cmp	r0, r1, lsr #1
  1002b0:	204000a1 	subcs	r0, r0, r1, lsr #1
  1002b4:	e1500121 	cmp	r0, r1, lsr #2
  1002b8:	20400121 	subcs	r0, r0, r1, lsr #2
  1002bc:	e15001a1 	cmp	r0, r1, lsr #3
  1002c0:	204001a1 	subcs	r0, r0, r1, lsr #3
  1002c4:	e3500001 	cmp	r0, #1	; 0x1
  1002c8:	e1a01221 	mov	r1, r1, lsr #4
  1002cc:	a2522004 	subges	r2, r2, #4	; 0x4
  1002d0:	aafffff3 	bge	1002a4 <__umodsi3+0x50>
  1002d4:	e3120003 	tst	r2, #3	; 0x3
  1002d8:	13300000 	teqne	r0, #0	; 0x0
  1002dc:	0a00000a 	beq	10030c <__umodsi3+0xb8>
  1002e0:	e3720002 	cmn	r2, #2	; 0x2
  1002e4:	ba000006 	blt	100304 <__umodsi3+0xb0>
  1002e8:	0a000002 	beq	1002f8 <__umodsi3+0xa4>
  1002ec:	e1500001 	cmp	r0, r1
  1002f0:	20400001 	subcs	r0, r0, r1
  1002f4:	e1a010a1 	mov	r1, r1, lsr #1
  1002f8:	e1500001 	cmp	r0, r1
  1002fc:	20400001 	subcs	r0, r0, r1
  100300:	e1a010a1 	mov	r1, r1, lsr #1
  100304:	e1500001 	cmp	r0, r1
  100308:	20400001 	subcs	r0, r0, r1
  10030c:	e12fff1e 	bx	lr
  100310:	e52de008 	str	lr, [sp, #-8]!
  100314:	eb000001 	bl	100320 <__aeabi_idiv0>
  100318:	e3a00000 	mov	r0, #0	; 0x0
  10031c:	e49df008 	ldr	pc, [sp], #8

00100320 <__aeabi_idiv0>:
  100320:	e12fff1e 	bx	lr

00100324 <free>:
  100324:	e59f3008 	ldr	r3, [pc, #8]	; 100334 <prog+0x2f0>
  100328:	e1a01000 	mov	r1, r0
  10032c:	e5930000 	ldr	r0, [r3]
  100330:	ea0002b5 	b	100e0c <_free_r>
  100334:	00200410 	eoreq	r0, r0, r0, lsl r4

00100338 <malloc>:
  100338:	e59f3008 	ldr	r3, [pc, #8]	; 100348 <prog+0x304>
  10033c:	e1a01000 	mov	r1, r0
  100340:	e5930000 	ldr	r0, [r3]
  100344:	ea000000 	b	10034c <_malloc_r>
  100348:	00200410 	eoreq	r0, r0, r0, lsl r4

0010034c <_malloc_r>:
  10034c:	e281300b 	add	r3, r1, #11	; 0xb
  100350:	e3530016 	cmp	r3, #22	; 0x16
  100354:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  100358:	83c35007 	bichi	r5, r3, #7	; 0x7
  10035c:	93a05010 	movls	r5, #16	; 0x10
  100360:	93a03000 	movls	r3, #0	; 0x0
  100364:	81a03fa5 	movhi	r3, r5, lsr #31
  100368:	e1550001 	cmp	r5, r1
  10036c:	33833001 	orrcc	r3, r3, #1	; 0x1
  100370:	e3530000 	cmp	r3, #0	; 0x0
  100374:	e1a07000 	mov	r7, r0
  100378:	13a0300c 	movne	r3, #12	; 0xc
  10037c:	e24dd004 	sub	sp, sp, #4	; 0x4
  100380:	13a00000 	movne	r0, #0	; 0x0
  100384:	15873000 	strne	r3, [r7]
  100388:	1a000017 	bne	1003ec <_malloc_r+0xa0>
  10038c:	e1a00007 	mov	r0, r7
  100390:	eb000217 	bl	100bf4 <__malloc_lock>
  100394:	e3550f7e 	cmp	r5, #504	; 0x1f8
  100398:	2a000015 	bcs	1003f4 <_malloc_r+0xa8>
  10039c:	e59f86fc 	ldr	r8, [pc, #1788]	; 100aa0 <prog+0xa5c>
  1003a0:	e1a021a5 	mov	r2, r5, lsr #3
  1003a4:	e0883182 	add	r3, r8, r2, lsl #3
  1003a8:	e593400c 	ldr	r4, [r3, #12]
  1003ac:	e1530004 	cmp	r3, r4
  1003b0:	e1a0a008 	mov	sl, r8
  1003b4:	0a0000cd 	beq	1006f0 <_malloc_r+0x3a4>
  1003b8:	e5943004 	ldr	r3, [r4, #4]
  1003bc:	e3c33003 	bic	r3, r3, #3	; 0x3
  1003c0:	e0843003 	add	r3, r4, r3
  1003c4:	e5932004 	ldr	r2, [r3, #4]
  1003c8:	e594000c 	ldr	r0, [r4, #12]
  1003cc:	e5941008 	ldr	r1, [r4, #8]
  1003d0:	e3822001 	orr	r2, r2, #1	; 0x1
  1003d4:	e5801008 	str	r1, [r0, #8]
  1003d8:	e581000c 	str	r0, [r1, #12]
  1003dc:	e5832004 	str	r2, [r3, #4]
  1003e0:	e1a00007 	mov	r0, r7
  1003e4:	eb000203 	bl	100bf8 <__malloc_unlock>
  1003e8:	e2840008 	add	r0, r4, #8	; 0x8
  1003ec:	e28dd004 	add	sp, sp, #4	; 0x4
  1003f0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1003f4:	e1b024a5 	movs	r2, r5, lsr #9
  1003f8:	01a001a5 	moveq	r0, r5, lsr #3
  1003fc:	01a03180 	moveq	r3, r0, lsl #3
  100400:	1a000027 	bne	1004a4 <_malloc_r+0x158>
  100404:	e59f8694 	ldr	r8, [pc, #1684]	; 100aa0 <prog+0xa5c>
  100408:	e0831008 	add	r1, r3, r8
  10040c:	e591400c 	ldr	r4, [r1, #12]
  100410:	e1510004 	cmp	r1, r4
  100414:	e1a0a008 	mov	sl, r8
  100418:	1a000005 	bne	100434 <_malloc_r+0xe8>
  10041c:	ea00000a 	b	10044c <_malloc_r+0x100>
  100420:	e3520000 	cmp	r2, #0	; 0x0
  100424:	aa000047 	bge	100548 <_malloc_r+0x1fc>
  100428:	e594400c 	ldr	r4, [r4, #12]
  10042c:	e1510004 	cmp	r1, r4
  100430:	0a000005 	beq	10044c <_malloc_r+0x100>
  100434:	e5943004 	ldr	r3, [r4, #4]
  100438:	e3c33003 	bic	r3, r3, #3	; 0x3
  10043c:	e0652003 	rsb	r2, r5, r3
  100440:	e352000f 	cmp	r2, #15	; 0xf
  100444:	dafffff5 	ble	100420 <_malloc_r+0xd4>
  100448:	e2400001 	sub	r0, r0, #1	; 0x1
  10044c:	e280e001 	add	lr, r0, #1	; 0x1
  100450:	e59f664c 	ldr	r6, [pc, #1612]	; 100aa4 <prog+0xa60>
  100454:	e5964008 	ldr	r4, [r6, #8]
  100458:	e1560004 	cmp	r6, r4
  10045c:	0a000076 	beq	10063c <_malloc_r+0x2f0>
  100460:	e5943004 	ldr	r3, [r4, #4]
  100464:	e3c32003 	bic	r2, r3, #3	; 0x3
  100468:	e0650002 	rsb	r0, r5, r2
  10046c:	e350000f 	cmp	r0, #15	; 0xf
  100470:	ca000027 	bgt	100514 <_malloc_r+0x1c8>
  100474:	e3500000 	cmp	r0, #0	; 0x0
  100478:	e586600c 	str	r6, [r6, #12]
  10047c:	e5866008 	str	r6, [r6, #8]
  100480:	ba00003c 	blt	100578 <_malloc_r+0x22c>
  100484:	e0842002 	add	r2, r4, r2
  100488:	e5923004 	ldr	r3, [r2, #4]
  10048c:	e3833001 	orr	r3, r3, #1	; 0x1
  100490:	e1a00007 	mov	r0, r7
  100494:	e5823004 	str	r3, [r2, #4]
  100498:	eb0001d6 	bl	100bf8 <__malloc_unlock>
  10049c:	e2840008 	add	r0, r4, #8	; 0x8
  1004a0:	eaffffd1 	b	1003ec <_malloc_r+0xa0>
  1004a4:	e3520004 	cmp	r2, #4	; 0x4
  1004a8:	91a03325 	movls	r3, r5, lsr #6
  1004ac:	92830038 	addls	r0, r3, #56	; 0x38
  1004b0:	91a03180 	movls	r3, r0, lsl #3
  1004b4:	9affffd2 	bls	100404 <_malloc_r+0xb8>
  1004b8:	e3520014 	cmp	r2, #20	; 0x14
  1004bc:	9282005b 	addls	r0, r2, #91	; 0x5b
  1004c0:	91a03180 	movls	r3, r0, lsl #3
  1004c4:	9affffce 	bls	100404 <_malloc_r+0xb8>
  1004c8:	e3520054 	cmp	r2, #84	; 0x54
  1004cc:	91a03625 	movls	r3, r5, lsr #12
  1004d0:	9283006e 	addls	r0, r3, #110	; 0x6e
  1004d4:	91a03180 	movls	r3, r0, lsl #3
  1004d8:	9affffc9 	bls	100404 <_malloc_r+0xb8>
  1004dc:	e3520f55 	cmp	r2, #340	; 0x154
  1004e0:	91a037a5 	movls	r3, r5, lsr #15
  1004e4:	92830077 	addls	r0, r3, #119	; 0x77
  1004e8:	91a03180 	movls	r3, r0, lsl #3
  1004ec:	9affffc4 	bls	100404 <_malloc_r+0xb8>
  1004f0:	e3a03e55 	mov	r3, #1360	; 0x550
  1004f4:	e2833004 	add	r3, r3, #4	; 0x4
  1004f8:	e1520003 	cmp	r2, r3
  1004fc:	91a03925 	movls	r3, r5, lsr #18
  100500:	9283007c 	addls	r0, r3, #124	; 0x7c
  100504:	83a0007e 	movhi	r0, #126	; 0x7e
  100508:	82433f59 	subhi	r3, r3, #356	; 0x164
  10050c:	91a03180 	movls	r3, r0, lsl #3
  100510:	eaffffbb 	b	100404 <_malloc_r+0xb8>
  100514:	e0842005 	add	r2, r4, r5
  100518:	e3801001 	orr	r1, r0, #1	; 0x1
  10051c:	e3853001 	orr	r3, r5, #1	; 0x1
  100520:	e7820000 	str	r0, [r2, r0]
  100524:	e5843004 	str	r3, [r4, #4]
  100528:	e586200c 	str	r2, [r6, #12]
  10052c:	e5862008 	str	r2, [r6, #8]
  100530:	e1a00007 	mov	r0, r7
  100534:	e9820042 	stmib	r2, {r1, r6}
  100538:	e582600c 	str	r6, [r2, #12]
  10053c:	eb0001ad 	bl	100bf8 <__malloc_unlock>
  100540:	e2840008 	add	r0, r4, #8	; 0x8
  100544:	eaffffa8 	b	1003ec <_malloc_r+0xa0>
  100548:	e0840003 	add	r0, r4, r3
  10054c:	e5903004 	ldr	r3, [r0, #4]
  100550:	e594100c 	ldr	r1, [r4, #12]
  100554:	e5942008 	ldr	r2, [r4, #8]
  100558:	e3833001 	orr	r3, r3, #1	; 0x1
  10055c:	e5803004 	str	r3, [r0, #4]
  100560:	e5812008 	str	r2, [r1, #8]
  100564:	e1a00007 	mov	r0, r7
  100568:	e582100c 	str	r1, [r2, #12]
  10056c:	eb0001a1 	bl	100bf8 <__malloc_unlock>
  100570:	e2840008 	add	r0, r4, #8	; 0x8
  100574:	eaffff9c 	b	1003ec <_malloc_r+0xa0>
  100578:	e3520c02 	cmp	r2, #512	; 0x200
  10057c:	3a0000a0 	bcc	100804 <_malloc_r+0x4b8>
  100580:	e1b014a2 	movs	r1, r2, lsr #9
  100584:	01a011a2 	moveq	r1, r2, lsr #3
  100588:	01a03181 	moveq	r3, r1, lsl #3
  10058c:	0a00001a 	beq	1005fc <_malloc_r+0x2b0>
  100590:	e3510004 	cmp	r1, #4	; 0x4
  100594:	91a03322 	movls	r3, r2, lsr #6
  100598:	92831038 	addls	r1, r3, #56	; 0x38
  10059c:	91a03181 	movls	r3, r1, lsl #3
  1005a0:	9a000015 	bls	1005fc <_malloc_r+0x2b0>
  1005a4:	e3510014 	cmp	r1, #20	; 0x14
  1005a8:	9281105b 	addls	r1, r1, #91	; 0x5b
  1005ac:	91a03181 	movls	r3, r1, lsl #3
  1005b0:	9a000011 	bls	1005fc <_malloc_r+0x2b0>
  1005b4:	e3510054 	cmp	r1, #84	; 0x54
  1005b8:	91a03622 	movls	r3, r2, lsr #12
  1005bc:	9283106e 	addls	r1, r3, #110	; 0x6e
  1005c0:	91a03181 	movls	r3, r1, lsl #3
  1005c4:	9a00000c 	bls	1005fc <_malloc_r+0x2b0>
  1005c8:	e3510f55 	cmp	r1, #340	; 0x154
  1005cc:	91a037a2 	movls	r3, r2, lsr #15
  1005d0:	92831077 	addls	r1, r3, #119	; 0x77
  1005d4:	91a03181 	movls	r3, r1, lsl #3
  1005d8:	9a000007 	bls	1005fc <_malloc_r+0x2b0>
  1005dc:	e3a03e55 	mov	r3, #1360	; 0x550
  1005e0:	e2833004 	add	r3, r3, #4	; 0x4
  1005e4:	e1510003 	cmp	r1, r3
  1005e8:	91a03922 	movls	r3, r2, lsr #18
  1005ec:	9283107c 	addls	r1, r3, #124	; 0x7c
  1005f0:	83a0107e 	movhi	r1, #126	; 0x7e
  1005f4:	82433f59 	subhi	r3, r3, #356	; 0x164
  1005f8:	91a03181 	movls	r3, r1, lsl #3
  1005fc:	e088c003 	add	ip, r8, r3
  100600:	e59c0008 	ldr	r0, [ip, #8]
  100604:	e15c0000 	cmp	ip, r0
  100608:	0a0000eb 	beq	1009bc <_malloc_r+0x670>
  10060c:	e5903004 	ldr	r3, [r0, #4]
  100610:	e3c33003 	bic	r3, r3, #3	; 0x3
  100614:	e1520003 	cmp	r2, r3
  100618:	2a000002 	bcs	100628 <_malloc_r+0x2dc>
  10061c:	e5900008 	ldr	r0, [r0, #8]
  100620:	e15c0000 	cmp	ip, r0
  100624:	1afffff8 	bne	10060c <_malloc_r+0x2c0>
  100628:	e590c00c 	ldr	ip, [r0, #12]
  10062c:	e584c00c 	str	ip, [r4, #12]
  100630:	e5840008 	str	r0, [r4, #8]
  100634:	e580400c 	str	r4, [r0, #12]
  100638:	e58c4008 	str	r4, [ip, #8]
  10063c:	e59a0004 	ldr	r0, [sl, #4]
  100640:	e35e0000 	cmp	lr, #0	; 0x0
  100644:	e28e3003 	add	r3, lr, #3	; 0x3
  100648:	a1a0300e 	movge	r3, lr
  10064c:	e1a03143 	mov	r3, r3, asr #2
  100650:	e3a02001 	mov	r2, #1	; 0x1
  100654:	e1a02312 	mov	r2, r2, lsl r3
  100658:	e1520000 	cmp	r2, r0
  10065c:	8a000029 	bhi	100708 <_malloc_r+0x3bc>
  100660:	e1120000 	tst	r2, r0
  100664:	0a000073 	beq	100838 <_malloc_r+0x4ec>
  100668:	e088918e 	add	r9, r8, lr, lsl #3
  10066c:	e1a0a00e 	mov	sl, lr
  100670:	e1a01009 	mov	r1, r9
  100674:	e591400c 	ldr	r4, [r1, #12]
  100678:	e1510004 	cmp	r1, r4
  10067c:	1a000005 	bne	100698 <_malloc_r+0x34c>
  100680:	ea000076 	b	100860 <_malloc_r+0x514>
  100684:	e35c0000 	cmp	ip, #0	; 0x0
  100688:	aa000079 	bge	100874 <_malloc_r+0x528>
  10068c:	e594400c 	ldr	r4, [r4, #12]
  100690:	e1510004 	cmp	r1, r4
  100694:	0a000071 	beq	100860 <_malloc_r+0x514>
  100698:	e5943004 	ldr	r3, [r4, #4]
  10069c:	e3c33003 	bic	r3, r3, #3	; 0x3
  1006a0:	e065c003 	rsb	ip, r5, r3
  1006a4:	e35c000f 	cmp	ip, #15	; 0xf
  1006a8:	dafffff5 	ble	100684 <_malloc_r+0x338>
  1006ac:	e3853001 	orr	r3, r5, #1	; 0x1
  1006b0:	e0842005 	add	r2, r4, r5
  1006b4:	e594000c 	ldr	r0, [r4, #12]
  1006b8:	e5843004 	str	r3, [r4, #4]
  1006bc:	e5b41008 	ldr	r1, [r4, #8]!
  1006c0:	e38c3001 	orr	r3, ip, #1	; 0x1
  1006c4:	e5801008 	str	r1, [r0, #8]
  1006c8:	e581000c 	str	r0, [r1, #12]
  1006cc:	e5862008 	str	r2, [r6, #8]
  1006d0:	e586200c 	str	r2, [r6, #12]
  1006d4:	e1a00007 	mov	r0, r7
  1006d8:	e782c00c 	str	ip, [r2, ip]
  1006dc:	e9820048 	stmib	r2, {r3, r6}
  1006e0:	e582600c 	str	r6, [r2, #12]
  1006e4:	eb000143 	bl	100bf8 <__malloc_unlock>
  1006e8:	e1a00004 	mov	r0, r4
  1006ec:	eaffff3e 	b	1003ec <_malloc_r+0xa0>
  1006f0:	e2843008 	add	r3, r4, #8	; 0x8
  1006f4:	e593400c 	ldr	r4, [r3, #12]
  1006f8:	e1530004 	cmp	r3, r4
  1006fc:	1affff2d 	bne	1003b8 <_malloc_r+0x6c>
  100700:	e282e002 	add	lr, r2, #2	; 0x2
  100704:	eaffff51 	b	100450 <_malloc_r+0x104>
  100708:	e59f2390 	ldr	r2, [pc, #912]	; 100aa0 <prog+0xa5c>
  10070c:	e5924008 	ldr	r4, [r2, #8]
  100710:	e5943004 	ldr	r3, [r4, #4]
  100714:	e3c38003 	bic	r8, r3, #3	; 0x3
  100718:	e0650008 	rsb	r0, r5, r8
  10071c:	e350000f 	cmp	r0, #15	; 0xf
  100720:	c3a03000 	movgt	r3, #0	; 0x0
  100724:	d3a03001 	movle	r3, #1	; 0x1
  100728:	e1550008 	cmp	r5, r8
  10072c:	83833001 	orrhi	r3, r3, #1	; 0x1
  100730:	e3530000 	cmp	r3, #0	; 0x0
  100734:	e1a09004 	mov	r9, r4
  100738:	0a000026 	beq	1007d8 <_malloc_r+0x48c>
  10073c:	e59f3364 	ldr	r3, [pc, #868]	; 100aa8 <prog+0xa64>
  100740:	e59fb364 	ldr	fp, [pc, #868]	; 100aac <prog+0xa68>
  100744:	e5932000 	ldr	r2, [r3]
  100748:	e59b1000 	ldr	r1, [fp]
  10074c:	e2822010 	add	r2, r2, #16	; 0x10
  100750:	e3710001 	cmn	r1, #1	; 0x1
  100754:	e0856002 	add	r6, r5, r2
  100758:	12863eff 	addne	r3, r6, #4080	; 0xff0
  10075c:	1283300f 	addne	r3, r3, #15	; 0xf
  100760:	13c36eff 	bicne	r6, r3, #4080	; 0xff0
  100764:	13c6600f 	bicne	r6, r6, #15	; 0xf
  100768:	e1a00007 	mov	r0, r7
  10076c:	e1a01006 	mov	r1, r6
  100770:	eb0003b5 	bl	10164c <_sbrk_r>
  100774:	e3700001 	cmn	r0, #1	; 0x1
  100778:	0a00008c 	beq	1009b0 <_malloc_r+0x664>
  10077c:	e0841008 	add	r1, r4, r8
  100780:	e1510000 	cmp	r1, r0
  100784:	e1a0a000 	mov	sl, r0
  100788:	9a000045 	bls	1008a4 <_malloc_r+0x558>
  10078c:	e59f330c 	ldr	r3, [pc, #780]	; 100aa0 <prog+0xa5c>
  100790:	e1540003 	cmp	r4, r3
  100794:	0a0000a5 	beq	100a30 <_malloc_r+0x6e4>
  100798:	e59f3300 	ldr	r3, [pc, #768]	; 100aa0 <prog+0xa5c>
  10079c:	e5934008 	ldr	r4, [r3, #8]
  1007a0:	e5942004 	ldr	r2, [r4, #4]
  1007a4:	e3c22003 	bic	r2, r2, #3	; 0x3
  1007a8:	e0650002 	rsb	r0, r5, r2
  1007ac:	e350000f 	cmp	r0, #15	; 0xf
  1007b0:	c3a03000 	movgt	r3, #0	; 0x0
  1007b4:	d3a03001 	movle	r3, #1	; 0x1
  1007b8:	e1550002 	cmp	r5, r2
  1007bc:	83833001 	orrhi	r3, r3, #1	; 0x1
  1007c0:	e3530000 	cmp	r3, #0	; 0x0
  1007c4:	0a000003 	beq	1007d8 <_malloc_r+0x48c>
  1007c8:	e1a00007 	mov	r0, r7
  1007cc:	eb000109 	bl	100bf8 <__malloc_unlock>
  1007d0:	e3a00000 	mov	r0, #0	; 0x0
  1007d4:	eaffff04 	b	1003ec <_malloc_r+0xa0>
  1007d8:	e0841005 	add	r1, r4, r5
  1007dc:	e3802001 	orr	r2, r0, #1	; 0x1
  1007e0:	e3853001 	orr	r3, r5, #1	; 0x1
  1007e4:	e5843004 	str	r3, [r4, #4]
  1007e8:	e5812004 	str	r2, [r1, #4]
  1007ec:	e59f22ac 	ldr	r2, [pc, #684]	; 100aa0 <prog+0xa5c>
  1007f0:	e1a00007 	mov	r0, r7
  1007f4:	e5821008 	str	r1, [r2, #8]
  1007f8:	eb0000fe 	bl	100bf8 <__malloc_unlock>
  1007fc:	e2840008 	add	r0, r4, #8	; 0x8
  100800:	eafffef9 	b	1003ec <_malloc_r+0xa0>
  100804:	e1a021a2 	mov	r2, r2, lsr #3
  100808:	e59a0004 	ldr	r0, [sl, #4]
  10080c:	e1a01122 	mov	r1, r2, lsr #2
  100810:	e3a03001 	mov	r3, #1	; 0x1
  100814:	e1800113 	orr	r0, r0, r3, lsl r1
  100818:	e0882182 	add	r2, r8, r2, lsl #3
  10081c:	e5923008 	ldr	r3, [r2, #8]
  100820:	e584200c 	str	r2, [r4, #12]
  100824:	e5843008 	str	r3, [r4, #8]
  100828:	e58a0004 	str	r0, [sl, #4]
  10082c:	e583400c 	str	r4, [r3, #12]
  100830:	e5824008 	str	r4, [r2, #8]
  100834:	eaffff81 	b	100640 <_malloc_r+0x2f4>
  100838:	e1a02082 	mov	r2, r2, lsl #1
  10083c:	e3ce3003 	bic	r3, lr, #3	; 0x3
  100840:	e1100002 	tst	r0, r2
  100844:	e283e004 	add	lr, r3, #4	; 0x4
  100848:	1affff86 	bne	100668 <_malloc_r+0x31c>
  10084c:	e1a02082 	mov	r2, r2, lsl #1
  100850:	e1100002 	tst	r0, r2
  100854:	e28ee004 	add	lr, lr, #4	; 0x4
  100858:	0afffffb 	beq	10084c <_malloc_r+0x500>
  10085c:	eaffff81 	b	100668 <_malloc_r+0x31c>
  100860:	e28aa001 	add	sl, sl, #1	; 0x1
  100864:	e31a0003 	tst	sl, #3	; 0x3
  100868:	0a000059 	beq	1009d4 <_malloc_r+0x688>
  10086c:	e2811008 	add	r1, r1, #8	; 0x8
  100870:	eaffff7f 	b	100674 <_malloc_r+0x328>
  100874:	e0841003 	add	r1, r4, r3
  100878:	e5913004 	ldr	r3, [r1, #4]
  10087c:	e594000c 	ldr	r0, [r4, #12]
  100880:	e5b42008 	ldr	r2, [r4, #8]!
  100884:	e3833001 	orr	r3, r3, #1	; 0x1
  100888:	e5802008 	str	r2, [r0, #8]
  10088c:	e582000c 	str	r0, [r2, #12]
  100890:	e5813004 	str	r3, [r1, #4]
  100894:	e1a00007 	mov	r0, r7
  100898:	eb0000d6 	bl	100bf8 <__malloc_unlock>
  10089c:	e1a00004 	mov	r0, r4
  1008a0:	eafffed1 	b	1003ec <_malloc_r+0xa0>
  1008a4:	e59fc204 	ldr	ip, [pc, #516]	; 100ab0 <prog+0xa6c>
  1008a8:	e59c3000 	ldr	r3, [ip]
  1008ac:	e0862003 	add	r2, r6, r3
  1008b0:	e58c2000 	str	r2, [ip]
  1008b4:	0a000062 	beq	100a44 <_malloc_r+0x6f8>
  1008b8:	e59b3000 	ldr	r3, [fp]
  1008bc:	e3730001 	cmn	r3, #1	; 0x1
  1008c0:	10613000 	rsbne	r3, r1, r0
  1008c4:	059f31e0 	ldreq	r3, [pc, #480]	; 100aac <prog+0xa68>
  1008c8:	10823003 	addne	r3, r2, r3
  1008cc:	05830000 	streq	r0, [r3]
  1008d0:	158c3000 	strne	r3, [ip]
  1008d4:	e2103007 	ands	r3, r0, #7	; 0x7
  1008d8:	12631008 	rsbne	r1, r3, #8	; 0x8
  1008dc:	1080a001 	addne	sl, r0, r1
  1008e0:	01a01003 	moveq	r1, r3
  1008e4:	e08a3006 	add	r3, sl, r6
  1008e8:	e1a03a03 	mov	r3, r3, lsl #20
  1008ec:	e1a03a23 	mov	r3, r3, lsr #20
  1008f0:	e2633a01 	rsb	r3, r3, #4096	; 0x1000
  1008f4:	e0814003 	add	r4, r1, r3
  1008f8:	e1a01004 	mov	r1, r4
  1008fc:	e1a00007 	mov	r0, r7
  100900:	e58dc000 	str	ip, [sp]
  100904:	eb000350 	bl	10164c <_sbrk_r>
  100908:	e3700001 	cmn	r0, #1	; 0x1
  10090c:	106a3000 	rsbne	r3, sl, r0
  100910:	e59dc000 	ldr	ip, [sp]
  100914:	10833004 	addne	r3, r3, r4
  100918:	13830001 	orrne	r0, r3, #1	; 0x1
  10091c:	e59f217c 	ldr	r2, [pc, #380]	; 100aa0 <prog+0xa5c>
  100920:	e59c3000 	ldr	r3, [ip]
  100924:	03a04000 	moveq	r4, #0	; 0x0
  100928:	02800002 	addeq	r0, r0, #2	; 0x2
  10092c:	e0843003 	add	r3, r4, r3
  100930:	e1590002 	cmp	r9, r2
  100934:	e1a0400a 	mov	r4, sl
  100938:	e58c3000 	str	r3, [ip]
  10093c:	e58a0004 	str	r0, [sl, #4]
  100940:	e582a008 	str	sl, [r2, #8]
  100944:	0a00000f 	beq	100988 <_malloc_r+0x63c>
  100948:	e358000f 	cmp	r8, #15	; 0xf
  10094c:	93a03001 	movls	r3, #1	; 0x1
  100950:	958a3004 	strls	r3, [sl, #4]
  100954:	9affff91 	bls	1007a0 <_malloc_r+0x454>
  100958:	e5993004 	ldr	r3, [r9, #4]
  10095c:	e248200c 	sub	r2, r8, #12	; 0xc
  100960:	e3c22007 	bic	r2, r2, #7	; 0x7
  100964:	e2033001 	and	r3, r3, #1	; 0x1
  100968:	e1823003 	orr	r3, r2, r3
  10096c:	e3a01005 	mov	r1, #5	; 0x5
  100970:	e352000f 	cmp	r2, #15	; 0xf
  100974:	e0892002 	add	r2, r9, r2
  100978:	e5893004 	str	r3, [r9, #4]
  10097c:	e5821008 	str	r1, [r2, #8]
  100980:	e5821004 	str	r1, [r2, #4]
  100984:	8a000038 	bhi	100a6c <_malloc_r+0x720>
  100988:	e59f1124 	ldr	r1, [pc, #292]	; 100ab4 <prog+0xa70>
  10098c:	e59c2000 	ldr	r2, [ip]
  100990:	e5913000 	ldr	r3, [r1]
  100994:	e1520003 	cmp	r2, r3
  100998:	85812000 	strhi	r2, [r1]
  10099c:	e59f1114 	ldr	r1, [pc, #276]	; 100ab8 <prog+0xa74>
  1009a0:	e5913000 	ldr	r3, [r1]
  1009a4:	e1520003 	cmp	r2, r3
  1009a8:	85812000 	strhi	r2, [r1]
  1009ac:	eaffff7b 	b	1007a0 <_malloc_r+0x454>
  1009b0:	e59f20e8 	ldr	r2, [pc, #232]	; 100aa0 <prog+0xa5c>
  1009b4:	e5924008 	ldr	r4, [r2, #8]
  1009b8:	eaffff78 	b	1007a0 <_malloc_r+0x454>
  1009bc:	e59a3004 	ldr	r3, [sl, #4]
  1009c0:	e1a01121 	mov	r1, r1, lsr #2
  1009c4:	e3a02001 	mov	r2, #1	; 0x1
  1009c8:	e1833112 	orr	r3, r3, r2, lsl r1
  1009cc:	e58a3004 	str	r3, [sl, #4]
  1009d0:	eaffff15 	b	10062c <_malloc_r+0x2e0>
  1009d4:	e1a0c00e 	mov	ip, lr
  1009d8:	e1a01009 	mov	r1, r9
  1009dc:	e31c0003 	tst	ip, #3	; 0x3
  1009e0:	e2411008 	sub	r1, r1, #8	; 0x8
  1009e4:	e24cc001 	sub	ip, ip, #1	; 0x1
  1009e8:	0a000027 	beq	100a8c <_malloc_r+0x740>
  1009ec:	e5913008 	ldr	r3, [r1, #8]
  1009f0:	e1530001 	cmp	r3, r1
  1009f4:	0afffff8 	beq	1009dc <_malloc_r+0x690>
  1009f8:	e1a02082 	mov	r2, r2, lsl #1
  1009fc:	e1520000 	cmp	r2, r0
  100a00:	8affff40 	bhi	100708 <_malloc_r+0x3bc>
  100a04:	e3520000 	cmp	r2, #0	; 0x0
  100a08:	0affff3e 	beq	100708 <_malloc_r+0x3bc>
  100a0c:	e1120000 	tst	r2, r0
  100a10:	11a0e00a 	movne	lr, sl
  100a14:	1affff13 	bne	100668 <_malloc_r+0x31c>
  100a18:	e1a02082 	mov	r2, r2, lsl #1
  100a1c:	e1100002 	tst	r0, r2
  100a20:	e28aa004 	add	sl, sl, #4	; 0x4
  100a24:	0afffffb 	beq	100a18 <_malloc_r+0x6cc>
  100a28:	e1a0e00a 	mov	lr, sl
  100a2c:	eaffff0d 	b	100668 <_malloc_r+0x31c>
  100a30:	e59fc078 	ldr	ip, [pc, #120]	; 100ab0 <prog+0xa6c>
  100a34:	e59c3000 	ldr	r3, [ip]
  100a38:	e0862003 	add	r2, r6, r3
  100a3c:	e58c2000 	str	r2, [ip]
  100a40:	eaffff9c 	b	1008b8 <_malloc_r+0x56c>
  100a44:	e1a03a00 	mov	r3, r0, lsl #20
  100a48:	e1a03a23 	mov	r3, r3, lsr #20
  100a4c:	e3530000 	cmp	r3, #0	; 0x0
  100a50:	1affff98 	bne	1008b8 <_malloc_r+0x56c>
  100a54:	e59f2044 	ldr	r2, [pc, #68]	; 100aa0 <prog+0xa5c>
  100a58:	e0863008 	add	r3, r6, r8
  100a5c:	e5924008 	ldr	r4, [r2, #8]
  100a60:	e3833001 	orr	r3, r3, #1	; 0x1
  100a64:	e5843004 	str	r3, [r4, #4]
  100a68:	eaffffc6 	b	100988 <_malloc_r+0x63c>
  100a6c:	e2891008 	add	r1, r9, #8	; 0x8
  100a70:	e1a00007 	mov	r0, r7
  100a74:	e58dc000 	str	ip, [sp]
  100a78:	eb0000e3 	bl	100e0c <_free_r>
  100a7c:	e59f301c 	ldr	r3, [pc, #28]	; 100aa0 <prog+0xa5c>
  100a80:	e59dc000 	ldr	ip, [sp]
  100a84:	e5934008 	ldr	r4, [r3, #8]
  100a88:	eaffffbe 	b	100988 <_malloc_r+0x63c>
  100a8c:	e1e03002 	mvn	r3, r2
  100a90:	e0000003 	and	r0, r0, r3
  100a94:	e59f3004 	ldr	r3, [pc, #4]	; 100aa0 <prog+0xa5c>
  100a98:	e5830004 	str	r0, [r3, #4]
  100a9c:	eaffffd5 	b	1009f8 <_malloc_r+0x6ac>
  100aa0:	00200000 	eoreq	r0, r0, r0
  100aa4:	00200008 	eoreq	r0, r0, r8
  100aa8:	00200b78 	eoreq	r0, r0, r8, ror fp
  100aac:	0020040c 	eoreq	r0, r0, ip, lsl #8
  100ab0:	00200b84 	eoreq	r0, r0, r4, lsl #23
  100ab4:	00200b7c 	eoreq	r0, r0, ip, ror fp
  100ab8:	00200b80 	eoreq	r0, r0, r0, lsl #23

00100abc <memcpy>:
  100abc:	e352000f 	cmp	r2, #15	; 0xf
  100ac0:	e52de004 	str	lr, [sp, #-4]!
  100ac4:	e1a0c000 	mov	ip, r0
  100ac8:	e1a0e002 	mov	lr, r2
  100acc:	9a000002 	bls	100adc <memcpy+0x20>
  100ad0:	e1813000 	orr	r3, r1, r0
  100ad4:	e3130003 	tst	r3, #3	; 0x3
  100ad8:	0a000008 	beq	100b00 <memcpy+0x44>
  100adc:	e35e0000 	cmp	lr, #0	; 0x0
  100ae0:	049df004 	ldreq	pc, [sp], #4
  100ae4:	e3a02000 	mov	r2, #0	; 0x0
  100ae8:	e4d13001 	ldrb	r3, [r1], #1
  100aec:	e7c2300c 	strb	r3, [r2, ip]
  100af0:	e2822001 	add	r2, r2, #1	; 0x1
  100af4:	e152000e 	cmp	r2, lr
  100af8:	1afffffa 	bne	100ae8 <memcpy+0x2c>
  100afc:	e49df004 	ldr	pc, [sp], #4
  100b00:	e5913000 	ldr	r3, [r1]
  100b04:	e58c3000 	str	r3, [ip]
  100b08:	e5912004 	ldr	r2, [r1, #4]
  100b0c:	e58c2004 	str	r2, [ip, #4]
  100b10:	e5913008 	ldr	r3, [r1, #8]
  100b14:	e58c3008 	str	r3, [ip, #8]
  100b18:	e24ee010 	sub	lr, lr, #16	; 0x10
  100b1c:	e591300c 	ldr	r3, [r1, #12]
  100b20:	e35e000f 	cmp	lr, #15	; 0xf
  100b24:	e58c300c 	str	r3, [ip, #12]
  100b28:	e2811010 	add	r1, r1, #16	; 0x10
  100b2c:	e28cc010 	add	ip, ip, #16	; 0x10
  100b30:	8afffff2 	bhi	100b00 <memcpy+0x44>
  100b34:	e35e0003 	cmp	lr, #3	; 0x3
  100b38:	9affffe7 	bls	100adc <memcpy+0x20>
  100b3c:	e24ee004 	sub	lr, lr, #4	; 0x4
  100b40:	e4913004 	ldr	r3, [r1], #4
  100b44:	e35e0003 	cmp	lr, #3	; 0x3
  100b48:	e48c3004 	str	r3, [ip], #4
  100b4c:	8afffffa 	bhi	100b3c <memcpy+0x80>
  100b50:	e35e0000 	cmp	lr, #0	; 0x0
  100b54:	1affffe2 	bne	100ae4 <memcpy+0x28>
  100b58:	e49df004 	ldr	pc, [sp], #4

00100b5c <memset>:
  100b5c:	e3520003 	cmp	r2, #3	; 0x3
  100b60:	e20110ff 	and	r1, r1, #255	; 0xff
  100b64:	e1a0c000 	mov	ip, r0
  100b68:	9a000001 	bls	100b74 <memset+0x18>
  100b6c:	e3100003 	tst	r0, #3	; 0x3
  100b70:	0a000008 	beq	100b98 <memset+0x3c>
  100b74:	e3520000 	cmp	r2, #0	; 0x0
  100b78:	012fff1e 	bxeq	lr
  100b7c:	e20110ff 	and	r1, r1, #255	; 0xff
  100b80:	e3a03000 	mov	r3, #0	; 0x0
  100b84:	e7c3100c 	strb	r1, [r3, ip]
  100b88:	e2833001 	add	r3, r3, #1	; 0x1
  100b8c:	e1530002 	cmp	r3, r2
  100b90:	1afffffb 	bne	100b84 <memset+0x28>
  100b94:	e12fff1e 	bx	lr
  100b98:	e1813401 	orr	r3, r1, r1, lsl #8
  100b9c:	e352000f 	cmp	r2, #15	; 0xf
  100ba0:	e183c803 	orr	ip, r3, r3, lsl #16
  100ba4:	e1a03000 	mov	r3, r0
  100ba8:	9a000009 	bls	100bd4 <memset+0x78>
  100bac:	e2422010 	sub	r2, r2, #16	; 0x10
  100bb0:	e352000f 	cmp	r2, #15	; 0xf
  100bb4:	e583c000 	str	ip, [r3]
  100bb8:	e583c004 	str	ip, [r3, #4]
  100bbc:	e583c008 	str	ip, [r3, #8]
  100bc0:	e583c00c 	str	ip, [r3, #12]
  100bc4:	e2833010 	add	r3, r3, #16	; 0x10
  100bc8:	8afffff7 	bhi	100bac <memset+0x50>
  100bcc:	e3520003 	cmp	r2, #3	; 0x3
  100bd0:	9a000003 	bls	100be4 <memset+0x88>
  100bd4:	e2422004 	sub	r2, r2, #4	; 0x4
  100bd8:	e3520003 	cmp	r2, #3	; 0x3
  100bdc:	e483c004 	str	ip, [r3], #4
  100be0:	8afffffb 	bhi	100bd4 <memset+0x78>
  100be4:	e3520000 	cmp	r2, #0	; 0x0
  100be8:	e1a0c003 	mov	ip, r3
  100bec:	1affffe2 	bne	100b7c <memset+0x20>
  100bf0:	e12fff1e 	bx	lr

00100bf4 <__malloc_lock>:
  100bf4:	e12fff1e 	bx	lr

00100bf8 <__malloc_unlock>:
  100bf8:	e12fff1e 	bx	lr

00100bfc <strncpy>:
  100bfc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100c00:	e1a04001 	mov	r4, r1
  100c04:	e1811000 	orr	r1, r1, r0
  100c08:	e3110003 	tst	r1, #3	; 0x3
  100c0c:	13a03000 	movne	r3, #0	; 0x0
  100c10:	03a03001 	moveq	r3, #1	; 0x1
  100c14:	e3520003 	cmp	r2, #3	; 0x3
  100c18:	93a03000 	movls	r3, #0	; 0x0
  100c1c:	82033001 	andhi	r3, r3, #1	; 0x1
  100c20:	e3530000 	cmp	r3, #0	; 0x0
  100c24:	01a01004 	moveq	r1, r4
  100c28:	e1a05000 	mov	r5, r0
  100c2c:	e1a0e002 	mov	lr, r2
  100c30:	01a04000 	moveq	r4, r0
  100c34:	0a000018 	beq	100c9c <strncpy+0xa0>
  100c38:	e3520003 	cmp	r2, #3	; 0x3
  100c3c:	e1a0c004 	mov	ip, r4
  100c40:	9a000013 	bls	100c94 <strncpy+0x98>
  100c44:	e5941000 	ldr	r1, [r4]
  100c48:	ea000005 	b	100c64 <strncpy+0x68>
  100c4c:	e24ee004 	sub	lr, lr, #4	; 0x4
  100c50:	e35e0003 	cmp	lr, #3	; 0x3
  100c54:	e4801004 	str	r1, [r0], #4
  100c58:	e28cc004 	add	ip, ip, #4	; 0x4
  100c5c:	9a00000c 	bls	100c94 <strncpy+0x98>
  100c60:	e59c1000 	ldr	r1, [ip]
  100c64:	e28134ff 	add	r3, r1, #-16777216	; 0xff000000
  100c68:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100c6c:	e2433c01 	sub	r3, r3, #256	; 0x100
  100c70:	e2433001 	sub	r3, r3, #1	; 0x1
  100c74:	e1e02001 	mvn	r2, r1
  100c78:	e0033002 	and	r3, r3, r2
  100c7c:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100c80:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100c84:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100c88:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100c8c:	e3530000 	cmp	r3, #0	; 0x0
  100c90:	0affffed 	beq	100c4c <strncpy+0x50>
  100c94:	e1a04000 	mov	r4, r0
  100c98:	e1a0100c 	mov	r1, ip
  100c9c:	e35e0000 	cmp	lr, #0	; 0x0
  100ca0:	0a000018 	beq	100d08 <strncpy+0x10c>
  100ca4:	e5d13000 	ldrb	r3, [r1]
  100ca8:	e24e2001 	sub	r2, lr, #1	; 0x1
  100cac:	e3530000 	cmp	r3, #0	; 0x0
  100cb0:	e1a0c004 	mov	ip, r4
  100cb4:	e4cc3001 	strb	r3, [ip], #1
  100cb8:	1284e002 	addne	lr, r4, #2	; 0x2
  100cbc:	10810002 	addne	r0, r1, r2
  100cc0:	0a000008 	beq	100ce8 <strncpy+0xec>
  100cc4:	e1500001 	cmp	r0, r1
  100cc8:	e1a0c00e 	mov	ip, lr
  100ccc:	e2422001 	sub	r2, r2, #1	; 0x1
  100cd0:	e28ee001 	add	lr, lr, #1	; 0x1
  100cd4:	0a00000b 	beq	100d08 <strncpy+0x10c>
  100cd8:	e5f13001 	ldrb	r3, [r1, #1]!
  100cdc:	e3530000 	cmp	r3, #0	; 0x0
  100ce0:	e54c3001 	strb	r3, [ip, #-1]
  100ce4:	1afffff6 	bne	100cc4 <strncpy+0xc8>
  100ce8:	e3520000 	cmp	r2, #0	; 0x0
  100cec:	0a000005 	beq	100d08 <strncpy+0x10c>
  100cf0:	e3a03000 	mov	r3, #0	; 0x0
  100cf4:	e1a01003 	mov	r1, r3
  100cf8:	e7c3100c 	strb	r1, [r3, ip]
  100cfc:	e2833001 	add	r3, r3, #1	; 0x1
  100d00:	e1520003 	cmp	r2, r3
  100d04:	1afffffb 	bne	100cf8 <strncpy+0xfc>
  100d08:	e1a00005 	mov	r0, r5
  100d0c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00100d10 <_malloc_trim_r>:
  100d10:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  100d14:	e59f70e4 	ldr	r7, [pc, #228]	; 100e00 <prog+0xdbc>
  100d18:	e1a04001 	mov	r4, r1
  100d1c:	e1a05000 	mov	r5, r0
  100d20:	ebffffb3 	bl	100bf4 <__malloc_lock>
  100d24:	e5973008 	ldr	r3, [r7, #8]
  100d28:	e5932004 	ldr	r2, [r3, #4]
  100d2c:	e3c26003 	bic	r6, r2, #3	; 0x3
  100d30:	e0644006 	rsb	r4, r4, r6
  100d34:	e2844efe 	add	r4, r4, #4064	; 0xfe0
  100d38:	e284400f 	add	r4, r4, #15	; 0xf
  100d3c:	e1a04624 	mov	r4, r4, lsr #12
  100d40:	e2444001 	sub	r4, r4, #1	; 0x1
  100d44:	e1a04604 	mov	r4, r4, lsl #12
  100d48:	e3540a01 	cmp	r4, #4096	; 0x1000
  100d4c:	e3a01000 	mov	r1, #0	; 0x0
  100d50:	e1a00005 	mov	r0, r5
  100d54:	ba000006 	blt	100d74 <_malloc_trim_r+0x64>
  100d58:	eb00023b 	bl	10164c <_sbrk_r>
  100d5c:	e5973008 	ldr	r3, [r7, #8]
  100d60:	e0863003 	add	r3, r6, r3
  100d64:	e1500003 	cmp	r0, r3
  100d68:	e2641000 	rsb	r1, r4, #0	; 0x0
  100d6c:	e1a00005 	mov	r0, r5
  100d70:	0a000002 	beq	100d80 <_malloc_trim_r+0x70>
  100d74:	ebffff9f 	bl	100bf8 <__malloc_unlock>
  100d78:	e3a00000 	mov	r0, #0	; 0x0
  100d7c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100d80:	eb000231 	bl	10164c <_sbrk_r>
  100d84:	e0643006 	rsb	r3, r4, r6
  100d88:	e3700001 	cmn	r0, #1	; 0x1
  100d8c:	e3a01000 	mov	r1, #0	; 0x0
  100d90:	e59fe06c 	ldr	lr, [pc, #108]	; 100e04 <prog+0xdc0>
  100d94:	e383c001 	orr	ip, r3, #1	; 0x1
  100d98:	e1a00005 	mov	r0, r5
  100d9c:	0a000008 	beq	100dc4 <_malloc_trim_r+0xb4>
  100da0:	e59e3000 	ldr	r3, [lr]
  100da4:	e5972008 	ldr	r2, [r7, #8]
  100da8:	e0643003 	rsb	r3, r4, r3
  100dac:	e1a00005 	mov	r0, r5
  100db0:	e582c004 	str	ip, [r2, #4]
  100db4:	e58e3000 	str	r3, [lr]
  100db8:	ebffff8e 	bl	100bf8 <__malloc_unlock>
  100dbc:	e3a00001 	mov	r0, #1	; 0x1
  100dc0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  100dc4:	eb000220 	bl	10164c <_sbrk_r>
  100dc8:	e5971008 	ldr	r1, [r7, #8]
  100dcc:	e1a0e000 	mov	lr, r0
  100dd0:	e061300e 	rsb	r3, r1, lr
  100dd4:	e353000f 	cmp	r3, #15	; 0xf
  100dd8:	e1a00005 	mov	r0, r5
  100ddc:	e383c001 	orr	ip, r3, #1	; 0x1
  100de0:	daffffe3 	ble	100d74 <_malloc_trim_r+0x64>
  100de4:	e59f301c 	ldr	r3, [pc, #28]	; 100e08 <prog+0xdc4>
  100de8:	e5932000 	ldr	r2, [r3]
  100dec:	e59f3010 	ldr	r3, [pc, #16]	; 100e04 <prog+0xdc0>
  100df0:	e062200e 	rsb	r2, r2, lr
  100df4:	e5832000 	str	r2, [r3]
  100df8:	e581c004 	str	ip, [r1, #4]
  100dfc:	eaffffdc 	b	100d74 <_malloc_trim_r+0x64>
  100e00:	00200000 	eoreq	r0, r0, r0
  100e04:	00200b84 	eoreq	r0, r0, r4, lsl #23
  100e08:	0020040c 	eoreq	r0, r0, ip, lsl #8

00100e0c <_free_r>:
  100e0c:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100e10:	e2514000 	subs	r4, r1, #0	; 0x0
  100e14:	e1a08000 	mov	r8, r0
  100e18:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  100e1c:	ebffff74 	bl	100bf4 <__malloc_lock>
  100e20:	e244e008 	sub	lr, r4, #8	; 0x8
  100e24:	e59e0004 	ldr	r0, [lr, #4]
  100e28:	e59f726c 	ldr	r7, [pc, #620]	; 10109c <prog+0x1058>
  100e2c:	e3c01001 	bic	r1, r0, #1	; 0x1
  100e30:	e08ec001 	add	ip, lr, r1
  100e34:	e5973008 	ldr	r3, [r7, #8]
  100e38:	e59c2004 	ldr	r2, [ip, #4]
  100e3c:	e15c0003 	cmp	ip, r3
  100e40:	e3c25003 	bic	r5, r2, #3	; 0x3
  100e44:	e1a0a007 	mov	sl, r7
  100e48:	0a000077 	beq	10102c <_free_r+0x220>
  100e4c:	e2106001 	ands	r6, r0, #1	; 0x1
  100e50:	e58c5004 	str	r5, [ip, #4]
  100e54:	13a00000 	movne	r0, #0	; 0x0
  100e58:	0a000018 	beq	100ec0 <_free_r+0xb4>
  100e5c:	e08c3005 	add	r3, ip, r5
  100e60:	e5932004 	ldr	r2, [r3, #4]
  100e64:	e3120001 	tst	r2, #1	; 0x1
  100e68:	0a000007 	beq	100e8c <_free_r+0x80>
  100e6c:	e3813001 	orr	r3, r1, #1	; 0x1
  100e70:	e3500000 	cmp	r0, #0	; 0x0
  100e74:	e58e3004 	str	r3, [lr, #4]
  100e78:	e781100e 	str	r1, [r1, lr]
  100e7c:	0a00001f 	beq	100f00 <_free_r+0xf4>
  100e80:	e1a00008 	mov	r0, r8
  100e84:	e8bd45f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, lr}
  100e88:	eaffff5a 	b	100bf8 <__malloc_unlock>
  100e8c:	e3500000 	cmp	r0, #0	; 0x0
  100e90:	e0811005 	add	r1, r1, r5
  100e94:	159c2008 	ldrne	r2, [ip, #8]
  100e98:	0a00004a 	beq	100fc8 <_free_r+0x1bc>
  100e9c:	e59c300c 	ldr	r3, [ip, #12]
  100ea0:	e3500000 	cmp	r0, #0	; 0x0
  100ea4:	e5832008 	str	r2, [r3, #8]
  100ea8:	e582300c 	str	r3, [r2, #12]
  100eac:	e3813001 	orr	r3, r1, #1	; 0x1
  100eb0:	e58e3004 	str	r3, [lr, #4]
  100eb4:	e781100e 	str	r1, [r1, lr]
  100eb8:	1afffff0 	bne	100e80 <_free_r+0x74>
  100ebc:	ea00000f 	b	100f00 <_free_r+0xf4>
  100ec0:	e5142008 	ldr	r2, [r4, #-8]
  100ec4:	e062e00e 	rsb	lr, r2, lr
  100ec8:	e59e0008 	ldr	r0, [lr, #8]
  100ecc:	e2873008 	add	r3, r7, #8	; 0x8
  100ed0:	e1500003 	cmp	r0, r3
  100ed4:	159e300c 	ldrne	r3, [lr, #12]
  100ed8:	15830008 	strne	r0, [r3, #8]
  100edc:	1580300c 	strne	r3, [r0, #12]
  100ee0:	e08c3005 	add	r3, ip, r5
  100ee4:	e0811002 	add	r1, r1, r2
  100ee8:	e5932004 	ldr	r2, [r3, #4]
  100eec:	03a00001 	moveq	r0, #1	; 0x1
  100ef0:	11a00006 	movne	r0, r6
  100ef4:	e3120001 	tst	r2, #1	; 0x1
  100ef8:	1affffdb 	bne	100e6c <_free_r+0x60>
  100efc:	eaffffe2 	b	100e8c <_free_r+0x80>
  100f00:	e3510c02 	cmp	r1, #512	; 0x200
  100f04:	3a00003b 	bcc	100ff8 <_free_r+0x1ec>
  100f08:	e1b024a1 	movs	r2, r1, lsr #9
  100f0c:	01a021a1 	moveq	r2, r1, lsr #3
  100f10:	01a03182 	moveq	r3, r2, lsl #3
  100f14:	0a00001a 	beq	100f84 <_free_r+0x178>
  100f18:	e3520004 	cmp	r2, #4	; 0x4
  100f1c:	91a03321 	movls	r3, r1, lsr #6
  100f20:	92832038 	addls	r2, r3, #56	; 0x38
  100f24:	91a03182 	movls	r3, r2, lsl #3
  100f28:	9a000015 	bls	100f84 <_free_r+0x178>
  100f2c:	e3520014 	cmp	r2, #20	; 0x14
  100f30:	9282205b 	addls	r2, r2, #91	; 0x5b
  100f34:	91a03182 	movls	r3, r2, lsl #3
  100f38:	9a000011 	bls	100f84 <_free_r+0x178>
  100f3c:	e3520054 	cmp	r2, #84	; 0x54
  100f40:	91a03621 	movls	r3, r1, lsr #12
  100f44:	9283206e 	addls	r2, r3, #110	; 0x6e
  100f48:	91a03182 	movls	r3, r2, lsl #3
  100f4c:	9a00000c 	bls	100f84 <_free_r+0x178>
  100f50:	e3520f55 	cmp	r2, #340	; 0x154
  100f54:	91a037a1 	movls	r3, r1, lsr #15
  100f58:	92832077 	addls	r2, r3, #119	; 0x77
  100f5c:	91a03182 	movls	r3, r2, lsl #3
  100f60:	9a000007 	bls	100f84 <_free_r+0x178>
  100f64:	e3a03e55 	mov	r3, #1360	; 0x550
  100f68:	e2833004 	add	r3, r3, #4	; 0x4
  100f6c:	e1520003 	cmp	r2, r3
  100f70:	91a03921 	movls	r3, r1, lsr #18
  100f74:	9283207c 	addls	r2, r3, #124	; 0x7c
  100f78:	83a0207e 	movhi	r2, #126	; 0x7e
  100f7c:	82433f59 	subhi	r3, r3, #356	; 0x164
  100f80:	91a03182 	movls	r3, r2, lsl #3
  100f84:	e083c00a 	add	ip, r3, sl
  100f88:	e59c0008 	ldr	r0, [ip, #8]
  100f8c:	e15c0000 	cmp	ip, r0
  100f90:	0a00003b 	beq	101084 <_free_r+0x278>
  100f94:	e5903004 	ldr	r3, [r0, #4]
  100f98:	e3c33003 	bic	r3, r3, #3	; 0x3
  100f9c:	e1510003 	cmp	r1, r3
  100fa0:	2a000002 	bcs	100fb0 <_free_r+0x1a4>
  100fa4:	e5900008 	ldr	r0, [r0, #8]
  100fa8:	e15c0000 	cmp	ip, r0
  100fac:	1afffff8 	bne	100f94 <_free_r+0x188>
  100fb0:	e590c00c 	ldr	ip, [r0, #12]
  100fb4:	e58ec00c 	str	ip, [lr, #12]
  100fb8:	e58e0008 	str	r0, [lr, #8]
  100fbc:	e580e00c 	str	lr, [r0, #12]
  100fc0:	e58ce008 	str	lr, [ip, #8]
  100fc4:	eaffffad 	b	100e80 <_free_r+0x74>
  100fc8:	e59c2008 	ldr	r2, [ip, #8]
  100fcc:	e59f30cc 	ldr	r3, [pc, #204]	; 1010a0 <prog+0x105c>
  100fd0:	e1520003 	cmp	r2, r3
  100fd4:	1affffb0 	bne	100e9c <_free_r+0x90>
  100fd8:	e3813001 	orr	r3, r1, #1	; 0x1
  100fdc:	e582e00c 	str	lr, [r2, #12]
  100fe0:	e582e008 	str	lr, [r2, #8]
  100fe4:	e781100e 	str	r1, [r1, lr]
  100fe8:	e58e3004 	str	r3, [lr, #4]
  100fec:	e58e2008 	str	r2, [lr, #8]
  100ff0:	e58e200c 	str	r2, [lr, #12]
  100ff4:	eaffffa1 	b	100e80 <_free_r+0x74>
  100ff8:	e1a011a1 	mov	r1, r1, lsr #3
  100ffc:	e5972004 	ldr	r2, [r7, #4]
  101000:	e1a00121 	mov	r0, r1, lsr #2
  101004:	e3a03001 	mov	r3, #1	; 0x1
  101008:	e1822013 	orr	r2, r2, r3, lsl r0
  10100c:	e08a1181 	add	r1, sl, r1, lsl #3
  101010:	e5913008 	ldr	r3, [r1, #8]
  101014:	e58e100c 	str	r1, [lr, #12]
  101018:	e58e3008 	str	r3, [lr, #8]
  10101c:	e5872004 	str	r2, [r7, #4]
  101020:	e583e00c 	str	lr, [r3, #12]
  101024:	e581e008 	str	lr, [r1, #8]
  101028:	eaffff94 	b	100e80 <_free_r+0x74>
  10102c:	e3100001 	tst	r0, #1	; 0x1
  101030:	e0810005 	add	r0, r1, r5
  101034:	1a000006 	bne	101054 <_free_r+0x248>
  101038:	e5141008 	ldr	r1, [r4, #-8]
  10103c:	e061e00e 	rsb	lr, r1, lr
  101040:	e59e200c 	ldr	r2, [lr, #12]
  101044:	e59e3008 	ldr	r3, [lr, #8]
  101048:	e5823008 	str	r3, [r2, #8]
  10104c:	e583200c 	str	r2, [r3, #12]
  101050:	e0800001 	add	r0, r0, r1
  101054:	e59f3048 	ldr	r3, [pc, #72]	; 1010a4 <prog+0x1060>
  101058:	e5932000 	ldr	r2, [r3]
  10105c:	e3803001 	orr	r3, r0, #1	; 0x1
  101060:	e1500002 	cmp	r0, r2
  101064:	e587e008 	str	lr, [r7, #8]
  101068:	e58e3004 	str	r3, [lr, #4]
  10106c:	3affff83 	bcc	100e80 <_free_r+0x74>
  101070:	e59f3030 	ldr	r3, [pc, #48]	; 1010a8 <prog+0x1064>
  101074:	e1a00008 	mov	r0, r8
  101078:	e5931000 	ldr	r1, [r3]
  10107c:	ebffff23 	bl	100d10 <_malloc_trim_r>
  101080:	eaffff7e 	b	100e80 <_free_r+0x74>
  101084:	e5973004 	ldr	r3, [r7, #4]
  101088:	e1a01122 	mov	r1, r2, lsr #2
  10108c:	e3a02001 	mov	r2, #1	; 0x1
  101090:	e1833112 	orr	r3, r3, r2, lsl r1
  101094:	e5873004 	str	r3, [r7, #4]
  101098:	eaffffc5 	b	100fb4 <_free_r+0x1a8>
  10109c:	00200000 	eoreq	r0, r0, r0
  1010a0:	00200008 	eoreq	r0, r0, r8
  1010a4:	00200408 	eoreq	r0, r0, r8, lsl #8
  1010a8:	00200b78 	eoreq	r0, r0, r8, ror fp

001010ac <vApplicationIdleHook>:
  1010ac:	e3a034a5 	mov	r3, #-1526726656	; 0xa5000000
  1010b0:	e2833001 	add	r3, r3, #1	; 0x1
  1010b4:	e3e02c02 	mvn	r2, #512	; 0x200
  1010b8:	e50230bf 	str	r3, [r2, #-191]
  1010bc:	e12fff1e 	bx	lr

001010c0 <vResetEnv>:
  1010c0:	e59f0008 	ldr	r0, [pc, #8]	; 1010d0 <prog+0x108c>
  1010c4:	e3a01000 	mov	r1, #0	; 0x0
  1010c8:	e3a02080 	mov	r2, #128	; 0x80
  1010cc:	eafffea2 	b	100b5c <memset>
  1010d0:	00200ec8 	eoreq	r0, r0, r8, asr #29

001010d4 <mainloop>:
  1010d4:	e3a04000 	mov	r4, #0	; 0x0
  1010d8:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  1010dc:	e3a0200c 	mov	r2, #12	; 0xc
  1010e0:	e5834031 	str	r4, [r3, #49]
  1010e4:	e2833b03 	add	r3, r3, #3072	; 0xc00
  1010e8:	e24dd008 	sub	sp, sp, #8	; 0x8
  1010ec:	e50320ef 	str	r2, [r3, #-239]
  1010f0:	eb00015f 	bl	101674 <led_init>
  1010f4:	e1a00004 	mov	r0, r4
  1010f8:	eb000163 	bl	10168c <led_set_green>
  1010fc:	eb000188 	bl	101724 <env_init>
  101100:	eb00018c 	bl	101738 <env_load>
  101104:	e1500004 	cmp	r0, r4
  101108:	0a00000d 	beq	101144 <mainloop+0x70>
  10110c:	e3a0c002 	mov	ip, #2	; 0x2
  101110:	e1a03004 	mov	r3, r4
  101114:	e59f1030 	ldr	r1, [pc, #48]	; 10114c <prog+0x1108>
  101118:	e3a02c02 	mov	r2, #512	; 0x200
  10111c:	e59f002c 	ldr	r0, [pc, #44]	; 101150 <prog+0x110c>
  101120:	e58dc000 	str	ip, [sp]
  101124:	e58d4004 	str	r4, [sp, #4]
  101128:	eb000764 	bl	102ec0 <xTaskCreate>
  10112c:	eb000009 	bl	101158 <vUSBShellInit>
  101130:	eb00001d 	bl	1011ac <PtInitProtocol>
  101134:	e3a00001 	mov	r0, #1	; 0x1
  101138:	eb000153 	bl	10168c <led_set_green>
  10113c:	eb0007ee 	bl	1030fc <vTaskStartScheduler>
  101140:	eafffffe 	b	101140 <mainloop+0x6c>
  101144:	ebffffdd 	bl	1010c0 <vResetEnv>
  101148:	eaffffef 	b	10110c <mainloop+0x38>
  10114c:	001047e8 	andeqs	r4, r0, r8, ror #15
  101150:	00103bd8 	ldreqsb	r3, [r0], -r8

00101154 <use_led>:
  101154:	eafffffe 	b	101154 <use_led>

00101158 <vUSBShellInit>:
  101158:	e52de004 	str	lr, [sp, #-4]!
  10115c:	e3a0c000 	mov	ip, #0	; 0x0
  101160:	e24dd008 	sub	sp, sp, #8	; 0x8
  101164:	e1a0300c 	mov	r3, ip
  101168:	e59f1018 	ldr	r1, [pc, #24]	; 101188 <prog+0x1144>
  10116c:	e3a02c02 	mov	r2, #512	; 0x200
  101170:	e59f0014 	ldr	r0, [pc, #20]	; 10118c <prog+0x1148>
  101174:	e58dc000 	str	ip, [sp]
  101178:	e58dc004 	str	ip, [sp, #4]
  10117c:	eb00074f 	bl	102ec0 <xTaskCreate>
  101180:	e28dd008 	add	sp, sp, #8	; 0x8
  101184:	e8bd8000 	ldmia	sp!, {pc}
  101188:	001047ec 	andeqs	r4, r0, ip, ror #15
  10118c:	00101154 	andeqs	r1, r0, r4, asr r1

00101190 <PtSetRfPowerLevel>:
  101190:	e20000ff 	and	r0, r0, #255	; 0xff
  101194:	e59f300c 	ldr	r3, [pc, #12]	; 1011a8 <prog+0x1164>
  101198:	e3500003 	cmp	r0, #3	; 0x3
  10119c:	23a00003 	movcs	r0, #3	; 0x3
  1011a0:	e5c30000 	strb	r0, [r3]
  1011a4:	e12fff1e 	bx	lr
  1011a8:	00200bca 	eoreq	r0, r0, sl, asr #23

001011ac <PtInitProtocol>:
  1011ac:	e92d4010 	stmdb	sp!, {r4, lr}
  1011b0:	e59fc040 	ldr	ip, [pc, #64]	; 1011f8 <prog+0x11b4>
  1011b4:	e3a04000 	mov	r4, #0	; 0x0
  1011b8:	e58c4000 	str	r4, [ip]
  1011bc:	e59fe038 	ldr	lr, [pc, #56]	; 1011fc <prog+0x11b8>
  1011c0:	e59fc038 	ldr	ip, [pc, #56]	; 101200 <prog+0x11bc>
  1011c4:	e58e4000 	str	r4, [lr]
  1011c8:	e24dd008 	sub	sp, sp, #8	; 0x8
  1011cc:	e58c4000 	str	r4, [ip]
  1011d0:	e3a0e003 	mov	lr, #3	; 0x3
  1011d4:	e1a03004 	mov	r3, r4
  1011d8:	e59f1024 	ldr	r1, [pc, #36]	; 101204 <prog+0x11c0>
  1011dc:	e3a02c02 	mov	r2, #512	; 0x200
  1011e0:	e59f0020 	ldr	r0, [pc, #32]	; 101208 <prog+0x11c4>
  1011e4:	e58de000 	str	lr, [sp]
  1011e8:	e58d4004 	str	r4, [sp, #4]
  1011ec:	eb000733 	bl	102ec0 <xTaskCreate>
  1011f0:	e28dd008 	add	sp, sp, #8	; 0x8
  1011f4:	e8bd8010 	ldmia	sp!, {r4, pc}
  1011f8:	00200ec0 	eoreq	r0, r0, r0, asr #29
  1011fc:	00200ebc 	streqh	r0, [r0], -ip
  101200:	00200ec4 	eoreq	r0, r0, r4, asr #29
  101204:	001047f4 	ldreqsh	r4, [r0], -r4
  101208:	001013ec 	andeqs	r1, r0, ip, ror #7

0010120c <PtUpdateWmcuId>:
  10120c:	e92d4010 	stmdb	sp!, {r4, lr}
  101210:	e59f4040 	ldr	r4, [pc, #64]	; 101258 <prog+0x1214>
  101214:	e31000ff 	tst	r0, #255	; 0xff
  101218:	e59f203c 	ldr	r2, [pc, #60]	; 10125c <prog+0x1218>
  10121c:	05d43010 	ldreqb	r3, [r4, #16]
  101220:	e3a01005 	mov	r1, #5	; 0x5
  101224:	05c23004 	streqb	r3, [r2, #4]
  101228:	e59f0030 	ldr	r0, [pc, #48]	; 101260 <prog+0x121c>
  10122c:	03a01005 	moveq	r1, #5	; 0x5
  101230:	01a00002 	moveq	r0, r2
  101234:	eb0001fa 	bl	101a24 <nRFAPI_SetTxMAC>
  101238:	e59f3024 	ldr	r3, [pc, #36]	; 101264 <prog+0x1220>
  10123c:	e5d4c010 	ldrb	ip, [r4, #16]
  101240:	e3a01005 	mov	r1, #5	; 0x5
  101244:	e3a02001 	mov	r2, #1	; 0x1
  101248:	e1a00003 	mov	r0, r3
  10124c:	e5c3c004 	strb	ip, [r3, #4]
  101250:	e8bd4010 	ldmia	sp!, {r4, lr}
  101254:	ea0001d4 	b	1019ac <nRFAPI_SetRxMAC>
  101258:	00200ec8 	eoreq	r0, r0, r8, asr #29
  10125c:	00200814 	eoreq	r0, r0, r4, lsl r8
  101260:	00104810 	andeqs	r4, r0, r0, lsl r8
  101264:	00200819 	eoreq	r0, r0, r9, lsl r8

00101268 <shuffle_tx_byteorder>:
  101268:	e52de004 	str	lr, [sp, #-4]!
  10126c:	e251e000 	subs	lr, r1, #0	; 0x0
  101270:	049df004 	ldreq	pc, [sp], #4
  101274:	e3a0c000 	mov	ip, #0	; 0x0
  101278:	e5903000 	ldr	r3, [r0]
  10127c:	e1a02c03 	mov	r2, r3, lsl #24
  101280:	e1a01423 	mov	r1, r3, lsr #8
  101284:	e1822c23 	orr	r2, r2, r3, lsr #24
  101288:	e2011cff 	and	r1, r1, #65280	; 0xff00
  10128c:	e1a03403 	mov	r3, r3, lsl #8
  101290:	e1822001 	orr	r2, r2, r1
  101294:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
  101298:	e28cc001 	add	ip, ip, #1	; 0x1
  10129c:	e1822003 	orr	r2, r2, r3
  1012a0:	e15c000e 	cmp	ip, lr
  1012a4:	e4802004 	str	r2, [r0], #4
  1012a8:	1afffff2 	bne	101278 <shuffle_tx_byteorder+0x10>
  1012ac:	e49df004 	ldr	pc, [sp], #4

001012b0 <PtInternalTransmit>:
  1012b0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1012b4:	e59f5120 	ldr	r5, [pc, #288]	; 1013dc <prog+0x1398>
  1012b8:	e5953000 	ldr	r3, [r5]
  1012bc:	e3530000 	cmp	r3, #0	; 0x0
  1012c0:	e1a04000 	mov	r4, r0
  1012c4:	e3a00000 	mov	r0, #0	; 0x0
  1012c8:	08bd8030 	ldmeqia	sp!, {r4, r5, pc}
  1012cc:	eb000348 	bl	101ff4 <nRFCMD_CE>
  1012d0:	e3a00003 	mov	r0, #3	; 0x3
  1012d4:	eb000876 	bl	1034b4 <vTaskDelay>
  1012d8:	e3a00000 	mov	r0, #0	; 0x0
  1012dc:	eb00018c 	bl	101914 <nRFAPI_SetRxMode>
  1012e0:	e5d41001 	ldrb	r1, [r4, #1]
  1012e4:	e5d43000 	ldrb	r3, [r4]
  1012e8:	e3a02801 	mov	r2, #65536	; 0x10000
  1012ec:	e1833401 	orr	r3, r3, r1, lsl #8
  1012f0:	e59f00e8 	ldr	r0, [pc, #232]	; 1013e0 <prog+0x139c>
  1012f4:	e2422001 	sub	r2, r2, #1	; 0x1
  1012f8:	e1530002 	cmp	r3, r2
  1012fc:	e59fc0e0 	ldr	ip, [pc, #224]	; 1013e4 <prog+0x13a0>
  101300:	15903000 	ldrne	r3, [r0]
  101304:	059c3000 	ldreq	r3, [ip]
  101308:	12833001 	addne	r3, r3, #1	; 0x1
  10130c:	02833001 	addeq	r3, r3, #1	; 0x1
  101310:	15803000 	strne	r3, [r0]
  101314:	058c3000 	streq	r3, [ip]
  101318:	eb000630 	bl	102be0 <xTaskGetTickCount>
  10131c:	e5953000 	ldr	r3, [r5]
  101320:	e0800003 	add	r0, r0, r3
  101324:	e1a02820 	mov	r2, r0, lsr #16
  101328:	e1a01c20 	mov	r1, r0, lsr #24
  10132c:	e1a03420 	mov	r3, r0, lsr #8
  101330:	e5c43017 	strb	r3, [r4, #23]
  101334:	e5c42018 	strb	r2, [r4, #24]
  101338:	e5c41019 	strb	r1, [r4, #25]
  10133c:	e5c40016 	strb	r0, [r4, #22]
  101340:	e3a0101a 	mov	r1, #26	; 0x1a
  101344:	e1a00004 	mov	r0, r4
  101348:	e59f3098 	ldr	r3, [pc, #152]	; 1013e8 <prog+0x13a4>
  10134c:	e1a0e00f 	mov	lr, pc
  101350:	e12fff13 	bx	r3
  101354:	e1a03c00 	mov	r3, r0, lsl #24
  101358:	e1a02420 	mov	r2, r0, lsr #8
  10135c:	e1833c20 	orr	r3, r3, r0, lsr #24
  101360:	e2022cff 	and	r2, r2, #65280	; 0xff00
  101364:	e1a00400 	mov	r0, r0, lsl #8
  101368:	e1833002 	orr	r3, r3, r2
  10136c:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
  101370:	e1833000 	orr	r3, r3, r0
  101374:	e1a00c23 	mov	r0, r3, lsr #24
  101378:	e1a01823 	mov	r1, r3, lsr #16
  10137c:	e1a02423 	mov	r2, r3, lsr #8
  101380:	e5c4201b 	strb	r2, [r4, #27]
  101384:	e5c4301a 	strb	r3, [r4, #26]
  101388:	e5c4101c 	strb	r1, [r4, #28]
  10138c:	e5c4001d 	strb	r0, [r4, #29]
  101390:	e3a01007 	mov	r1, #7	; 0x7
  101394:	e1a00004 	mov	r0, r4
  101398:	ebffffb2 	bl	101268 <shuffle_tx_byteorder>
  10139c:	e1a00004 	mov	r0, r4
  1013a0:	e3a01007 	mov	r1, #7	; 0x7
  1013a4:	eb03fd22 	bl	200834 <xxtea_encode>
  1013a8:	e1a00004 	mov	r0, r4
  1013ac:	e3a01007 	mov	r1, #7	; 0x7
  1013b0:	ebffffac 	bl	101268 <shuffle_tx_byteorder>
  1013b4:	e3a0101e 	mov	r1, #30	; 0x1e
  1013b8:	e1a00004 	mov	r0, r4
  1013bc:	eb000175 	bl	101998 <nRFAPI_TX>
  1013c0:	e3a00001 	mov	r0, #1	; 0x1
  1013c4:	eb00030a 	bl	101ff4 <nRFCMD_CE>
  1013c8:	e3a00003 	mov	r0, #3	; 0x3
  1013cc:	eb000838 	bl	1034b4 <vTaskDelay>
  1013d0:	e3a00001 	mov	r0, #1	; 0x1
  1013d4:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  1013d8:	ea00014d 	b	101914 <nRFAPI_SetRxMode>
  1013dc:	00200bd0 	ldreqd	r0, [r0], -r0
  1013e0:	00200ebc 	streqh	r0, [r0], -ip
  1013e4:	00200ec0 	eoreq	r0, r0, r0, asr #29
  1013e8:	00200acc 	eoreq	r0, r0, ip, asr #21

001013ec <vnRFtaskRxTx>:
  1013ec:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1013f0:	e3a00051 	mov	r0, #81	; 0x51
  1013f4:	e59f11c8 	ldr	r1, [pc, #456]	; 1015c4 <prog+0x1580>
  1013f8:	e3a02005 	mov	r2, #5	; 0x5
  1013fc:	e3a03000 	mov	r3, #0	; 0x0
  101400:	eb0001b8 	bl	101ae8 <nRFAPI_Init>
  101404:	e3500000 	cmp	r0, #0	; 0x0
  101408:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10140c:	e59f11b4 	ldr	r1, [pc, #436]	; 1015c8 <prog+0x1584>
  101410:	e3a0300a 	mov	r3, #10	; 0xa
  101414:	e59f81b0 	ldr	r8, [pc, #432]	; 1015cc <prog+0x1588>
  101418:	e59f71b0 	ldr	r7, [pc, #432]	; 1015d0 <prog+0x158c>
  10141c:	e3e02000 	mvn	r2, #0	; 0x0
  101420:	e5813000 	str	r3, [r1]
  101424:	e3a00003 	mov	r0, #3	; 0x3
  101428:	e5c72000 	strb	r2, [r7]
  10142c:	e5c82000 	strb	r2, [r8]
  101430:	ebffff56 	bl	101190 <PtSetRfPowerLevel>
  101434:	e3a00005 	mov	r0, #5	; 0x5
  101438:	eb000115 	bl	101894 <nRFAPI_SetSizeMac>
  10143c:	e3a00000 	mov	r0, #0	; 0x0
  101440:	e3a0101e 	mov	r1, #30	; 0x1e
  101444:	eb000102 	bl	101854 <nRFAPI_SetPipeSizeRX>
  101448:	e59f4184 	ldr	r4, [pc, #388]	; 1015d4 <prog+0x1590>
  10144c:	e3a0101e 	mov	r1, #30	; 0x1e
  101450:	e3a00001 	mov	r0, #1	; 0x1
  101454:	eb0000fe 	bl	101854 <nRFAPI_SetPipeSizeRX>
  101458:	e3a00003 	mov	r0, #3	; 0x3
  10145c:	eb00011b 	bl	1018d0 <nRFAPI_PipesEnable>
  101460:	e5d42011 	ldrb	r2, [r4, #17]
  101464:	e5d43010 	ldrb	r3, [r4, #16]
  101468:	e5d40012 	ldrb	r0, [r4, #18]
  10146c:	e1833402 	orr	r3, r3, r2, lsl #8
  101470:	e5d41013 	ldrb	r1, [r4, #19]
  101474:	e1833800 	orr	r3, r3, r0, lsl #16
  101478:	e1931c01 	orrs	r1, r3, r1, lsl #24
  10147c:	13a00000 	movne	r0, #0	; 0x0
  101480:	03a00001 	moveq	r0, #1	; 0x1
  101484:	ebffff60 	bl	10120c <PtUpdateWmcuId>
  101488:	e3a00000 	mov	r0, #0	; 0x0
  10148c:	eb000120 	bl	101914 <nRFAPI_SetRxMode>
  101490:	e3a00000 	mov	r0, #0	; 0x0
  101494:	eb0002d6 	bl	101ff4 <nRFCMD_CE>
  101498:	e3a06000 	mov	r6, #0	; 0x0
  10149c:	e59f5134 	ldr	r5, [pc, #308]	; 1015d8 <prog+0x1594>
  1014a0:	e1a0a006 	mov	sl, r6
  1014a4:	e1a0b008 	mov	fp, r8
  1014a8:	e1a09007 	mov	r9, r7
  1014ac:	ea00000b 	b	1014e0 <vnRFtaskRxTx+0xf4>
  1014b0:	e5d43010 	ldrb	r3, [r4, #16]
  1014b4:	e5d42011 	ldrb	r2, [r4, #17]
  1014b8:	e5d40012 	ldrb	r0, [r4, #18]
  1014bc:	e1833402 	orr	r3, r3, r2, lsl #8
  1014c0:	e5d41013 	ldrb	r1, [r4, #19]
  1014c4:	e1833800 	orr	r3, r3, r0, lsl #16
  1014c8:	e1931c01 	orrs	r1, r3, r1, lsl #24
  1014cc:	1a000016 	bne	10152c <vnRFtaskRxTx+0x140>
  1014d0:	e3a00005 	mov	r0, #5	; 0x5
  1014d4:	eb0007f6 	bl	1034b4 <vTaskDelay>
  1014d8:	e3a00070 	mov	r0, #112	; 0x70
  1014dc:	eb0000e4 	bl	101874 <nRFAPI_ClearIRQ>
  1014e0:	e5d80000 	ldrb	r0, [r8]
  1014e4:	e5d73000 	ldrb	r3, [r7]
  1014e8:	e1530000 	cmp	r3, r0
  1014ec:	0a000002 	beq	1014fc <vnRFtaskRxTx+0x110>
  1014f0:	eb0000ff 	bl	1018f4 <nRFAPI_SetTxPower>
  1014f4:	e5db3000 	ldrb	r3, [fp]
  1014f8:	e5c93000 	strb	r3, [r9]
  1014fc:	eb000109 	bl	101928 <nRFAPI_GetFifoStatus>
  101500:	e3100020 	tst	r0, #32	; 0x20
  101504:	0affffe9 	beq	1014b0 <vnRFtaskRxTx+0xc4>
  101508:	eb000112 	bl	101958 <nRFAPI_FlushTX>
  10150c:	e5d43010 	ldrb	r3, [r4, #16]
  101510:	e5d42011 	ldrb	r2, [r4, #17]
  101514:	e5d40012 	ldrb	r0, [r4, #18]
  101518:	e1833402 	orr	r3, r3, r2, lsl #8
  10151c:	e5d41013 	ldrb	r1, [r4, #19]
  101520:	e1833800 	orr	r3, r3, r0, lsl #16
  101524:	e1931c01 	orrs	r1, r3, r1, lsl #24
  101528:	0affffe8 	beq	1014d0 <vnRFtaskRxTx+0xe4>
  10152c:	eb0005ab 	bl	102be0 <xTaskGetTickCount>
  101530:	e06a0000 	rsb	r0, sl, r0
  101534:	e1560000 	cmp	r6, r0
  101538:	2affffe4 	bcs	1014d0 <vnRFtaskRxTx+0xe4>
  10153c:	e3a01000 	mov	r1, #0	; 0x0
  101540:	e3a0201e 	mov	r2, #30	; 0x1e
  101544:	e59f0090 	ldr	r0, [pc, #144]	; 1015dc <prog+0x1598>
  101548:	ebfffd83 	bl	100b5c <memset>
  10154c:	e59f3080 	ldr	r3, [pc, #128]	; 1015d4 <prog+0x1590>
  101550:	e59fc084 	ldr	ip, [pc, #132]	; 1015dc <prog+0x1598>
  101554:	e5d31010 	ldrb	r1, [r3, #16]
  101558:	e3e02000 	mvn	r2, #0	; 0x0
  10155c:	e3a03000 	mov	r3, #0	; 0x0
  101560:	e59f0078 	ldr	r0, [pc, #120]	; 1015e0 <prog+0x159c>
  101564:	e5cc2001 	strb	r2, [ip, #1]
  101568:	e5cc3003 	strb	r3, [ip, #3]
  10156c:	e5cc1002 	strb	r1, [ip, #2]
  101570:	e5cc2000 	strb	r2, [ip]
  101574:	e5d03000 	ldrb	r3, [r0]
  101578:	e5d02001 	ldrb	r2, [r0, #1]
  10157c:	e203300f 	and	r3, r3, #15	; 0xf
  101580:	e2800002 	add	r0, r0, #2	; 0x2
  101584:	e1833202 	orr	r3, r3, r2, lsl #4
  101588:	e1500005 	cmp	r0, r5
  10158c:	e5cc3004 	strb	r3, [ip, #4]
  101590:	e28cc001 	add	ip, ip, #1	; 0x1
  101594:	1afffff6 	bne	101574 <vnRFtaskRxTx+0x188>
  101598:	e59f003c 	ldr	r0, [pc, #60]	; 1015dc <prog+0x1598>
  10159c:	ebffff43 	bl	1012b0 <PtInternalTransmit>
  1015a0:	eb00058e 	bl	102be0 <xTaskGetTickCount>
  1015a4:	e1a0a000 	mov	sl, r0
  1015a8:	eb00000d 	bl	1015e4 <RndNumber>
  1015ac:	e59f3014 	ldr	r3, [pc, #20]	; 1015c8 <prog+0x1584>
  1015b0:	e5931000 	ldr	r1, [r3]
  1015b4:	e1a01081 	mov	r1, r1, lsl #1
  1015b8:	ebfffb25 	bl	100254 <__umodsi3>
  1015bc:	e1a06000 	mov	r6, r0
  1015c0:	eaffffc2 	b	1014d0 <vnRFtaskRxTx+0xe4>
  1015c4:	00104810 	andeqs	r4, r0, r0, lsl r8
  1015c8:	00200bcc 	eoreq	r0, r0, ip, asr #23
  1015cc:	00200bca 	eoreq	r0, r0, sl, asr #23
  1015d0:	00200bcb 	eoreq	r0, r0, fp, asr #23
  1015d4:	00200ec8 	eoreq	r0, r0, r8, asr #29
  1015d8:	00200bf4 	streqd	r0, [r0], -r4
  1015dc:	00200bac 	eoreq	r0, r0, ip, lsr #23
  1015e0:	00200bd4 	ldreqd	r0, [r0], -r4

001015e4 <RndNumber>:
  1015e4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1015e8:	e59f4054 	ldr	r4, [pc, #84]	; 101644 <prog+0x1600>
  1015ec:	e59f5054 	ldr	r5, [pc, #84]	; 101648 <prog+0x1604>
  1015f0:	e594e000 	ldr	lr, [r4]
  1015f4:	e3a00801 	mov	r0, #65536	; 0x10000
  1015f8:	e595c000 	ldr	ip, [r5]
  1015fc:	e2400001 	sub	r0, r0, #1	; 0x1
  101600:	e00e3000 	and	r3, lr, r0
  101604:	e0831083 	add	r1, r3, r3, lsl #1
  101608:	e00c0000 	and	r0, ip, r0
  10160c:	e0831381 	add	r1, r3, r1, lsl #7
  101610:	e0802100 	add	r2, r0, r0, lsl #2
  101614:	e0831201 	add	r1, r3, r1, lsl #4
  101618:	e0822382 	add	r2, r2, r2, lsl #7
  10161c:	e0833081 	add	r3, r3, r1, lsl #1
  101620:	e0800202 	add	r0, r0, r2, lsl #4
  101624:	e0633103 	rsb	r3, r3, r3, lsl #2
  101628:	e0600100 	rsb	r0, r0, r0, lsl #2
  10162c:	e083382e 	add	r3, r3, lr, lsr #16
  101630:	e080082c 	add	r0, r0, ip, lsr #16
  101634:	e5850000 	str	r0, [r5]
  101638:	e0200803 	eor	r0, r0, r3, lsl #16
  10163c:	e5843000 	str	r3, [r4]
  101640:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  101644:	00200820 	eoreq	r0, r0, r0, lsr #16
  101648:	00200824 	eoreq	r0, r0, r4, lsr #16

0010164c <_sbrk_r>:
  10164c:	e59f2018 	ldr	r2, [pc, #24]	; 10166c <prog+0x1628>
  101650:	e5920000 	ldr	r0, [r2]
  101654:	e3500000 	cmp	r0, #0	; 0x0
  101658:	059f0010 	ldreq	r0, [pc, #16]	; 101670 <prog+0x162c>
  10165c:	e0803001 	add	r3, r0, r1
  101660:	05820000 	streq	r0, [r2]
  101664:	e5823000 	str	r3, [r2]
  101668:	e12fff1e 	bx	lr
  10166c:	00200bf4 	streqd	r0, [r0], -r4
  101670:	00200f54 	eoreq	r0, r0, r4, asr pc

00101674 <led_init>:
  101674:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  101678:	e3a03501 	mov	r3, #4194304	; 0x400000
  10167c:	e50230ff 	str	r3, [r2, #-255]
  101680:	e50230ef 	str	r3, [r2, #-239]
  101684:	e50230cf 	str	r3, [r2, #-207]
  101688:	e12fff1e 	bx	lr

0010168c <led_set_green>:
  10168c:	e31000ff 	tst	r0, #255	; 0xff
  101690:	13a02501 	movne	r2, #4194304	; 0x400000
  101694:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  101698:	03a02501 	moveq	r2, #4194304	; 0x400000
  10169c:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  1016a0:	150320cb 	strne	r2, [r3, #-203]
  1016a4:	050320cf 	streq	r2, [r3, #-207]
  1016a8:	e12fff1e 	bx	lr

001016ac <env_crc16>:
  1016ac:	e3500000 	cmp	r0, #0	; 0x0
  1016b0:	13510000 	cmpne	r1, #0	; 0x0
  1016b4:	e52de004 	str	lr, [sp, #-4]!
  1016b8:	e1a0e000 	mov	lr, r0
  1016bc:	0a000015 	beq	101718 <env_crc16+0x6c>
  1016c0:	e3510000 	cmp	r1, #0	; 0x0
  1016c4:	0a000013 	beq	101718 <env_crc16+0x6c>
  1016c8:	e3a00801 	mov	r0, #65536	; 0x10000
  1016cc:	e2400001 	sub	r0, r0, #1	; 0x1
  1016d0:	e3a0c000 	mov	ip, #0	; 0x0
  1016d4:	e7dc200e 	ldrb	r2, [ip, lr]
  1016d8:	e1a03400 	mov	r3, r0, lsl #8
  1016dc:	e1833420 	orr	r3, r3, r0, lsr #8
  1016e0:	e0233002 	eor	r3, r3, r2
  1016e4:	e1a03803 	mov	r3, r3, lsl #16
  1016e8:	e1a03823 	mov	r3, r3, lsr #16
  1016ec:	e20320ff 	and	r2, r3, #255	; 0xff
  1016f0:	e0233222 	eor	r3, r3, r2, lsr #4
  1016f4:	e0233603 	eor	r3, r3, r3, lsl #12
  1016f8:	e1a03803 	mov	r3, r3, lsl #16
  1016fc:	e1a03823 	mov	r3, r3, lsr #16
  101700:	e28cc001 	add	ip, ip, #1	; 0x1
  101704:	e20320ff 	and	r2, r3, #255	; 0xff
  101708:	e15c0001 	cmp	ip, r1
  10170c:	e0230282 	eor	r0, r3, r2, lsl #5
  101710:	1affffef 	bne	1016d4 <env_crc16+0x28>
  101714:	e49df004 	ldr	pc, [sp], #4
  101718:	e3a00801 	mov	r0, #65536	; 0x10000
  10171c:	e2400001 	sub	r0, r0, #1	; 0x1
  101720:	e49df004 	ldr	pc, [sp], #4

00101724 <env_init>:
  101724:	e3a03831 	mov	r3, #3211264	; 0x310000
  101728:	e2833c03 	add	r3, r3, #768	; 0x300
  10172c:	e3e02000 	mvn	r2, #0	; 0x0
  101730:	e502309f 	str	r3, [r2, #-159]
  101734:	e12fff1e 	bx	lr

00101738 <env_load>:
  101738:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10173c:	e59f50b8 	ldr	r5, [pc, #184]	; 1017fc <prog+0x17b8>
  101740:	e3a0194f 	mov	r1, #1294336	; 0x13c000
  101744:	e2811a03 	add	r1, r1, #12288	; 0x3000
  101748:	e3a02080 	mov	r2, #128	; 0x80
  10174c:	e1a00005 	mov	r0, r5
  101750:	ebfffcd9 	bl	100abc <memcpy>
  101754:	e5d52001 	ldrb	r2, [r5, #1]
  101758:	e5d53000 	ldrb	r3, [r5]
  10175c:	e5d51002 	ldrb	r1, [r5, #2]
  101760:	e1833402 	orr	r3, r3, r2, lsl #8
  101764:	e5d50003 	ldrb	r0, [r5, #3]
  101768:	e3e024f3 	mvn	r2, #-218103808	; 0xf3000000
  10176c:	e1833801 	orr	r3, r3, r1, lsl #16
  101770:	e24229cd 	sub	r2, r2, #3358720	; 0x334000
  101774:	e1833c00 	orr	r3, r3, r0, lsl #24
  101778:	e2422e11 	sub	r2, r2, #272	; 0x110
  10177c:	e1530002 	cmp	r3, r2
  101780:	0a000001 	beq	10178c <env_load+0x54>
  101784:	e3a00000 	mov	r0, #0	; 0x0
  101788:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10178c:	e5d53004 	ldrb	r3, [r5, #4]
  101790:	e5d52005 	ldrb	r2, [r5, #5]
  101794:	e5d5c006 	ldrb	ip, [r5, #6]
  101798:	e5d51007 	ldrb	r1, [r5, #7]
  10179c:	e1833402 	orr	r3, r3, r2, lsl #8
  1017a0:	e183380c 	orr	r3, r3, ip, lsl #16
  1017a4:	e1833c01 	orr	r3, r3, r1, lsl #24
  1017a8:	e3530080 	cmp	r3, #128	; 0x80
  1017ac:	e1a00005 	mov	r0, r5
  1017b0:	e3a0e000 	mov	lr, #0	; 0x0
  1017b4:	e1a01003 	mov	r1, r3
  1017b8:	1afffff1 	bne	101784 <env_load+0x4c>
  1017bc:	e5d54008 	ldrb	r4, [r5, #8]
  1017c0:	e5d53009 	ldrb	r3, [r5, #9]
  1017c4:	e5d5200a 	ldrb	r2, [r5, #10]
  1017c8:	e5d5c00b 	ldrb	ip, [r5, #11]
  1017cc:	e1844403 	orr	r4, r4, r3, lsl #8
  1017d0:	e1844802 	orr	r4, r4, r2, lsl #16
  1017d4:	e1844c0c 	orr	r4, r4, ip, lsl #24
  1017d8:	e5c5e00b 	strb	lr, [r5, #11]
  1017dc:	e5c5e008 	strb	lr, [r5, #8]
  1017e0:	e5c5e009 	strb	lr, [r5, #9]
  1017e4:	e5c5e00a 	strb	lr, [r5, #10]
  1017e8:	ebffffaf 	bl	1016ac <env_crc16>
  1017ec:	e1540000 	cmp	r4, r0
  1017f0:	13a00000 	movne	r0, #0	; 0x0
  1017f4:	03a00001 	moveq	r0, #1	; 0x1
  1017f8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1017fc:	00200ec8 	eoreq	r0, r0, r8, asr #29

00101800 <nRFAPI_SetFeatures>:
  101800:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101804:	e24dd004 	sub	sp, sp, #4	; 0x4
  101808:	e28d4002 	add	r4, sp, #2	; 0x2
  10180c:	e3a06002 	mov	r6, #2	; 0x2
  101810:	e1a02006 	mov	r2, r6
  101814:	e1a05000 	mov	r5, r0
  101818:	e59f102c 	ldr	r1, [pc, #44]	; 10184c <prog+0x1808>
  10181c:	e1a00004 	mov	r0, r4
  101820:	ebfffca5 	bl	100abc <memcpy>
  101824:	e20550ff 	and	r5, r5, #255	; 0xff
  101828:	e1a01004 	mov	r1, r4
  10182c:	e1a02006 	mov	r2, r6
  101830:	e59f0018 	ldr	r0, [pc, #24]	; 101850 <prog+0x180c>
  101834:	eb000185 	bl	101e50 <nRFCMD_ReadWriteBuffer>
  101838:	e1a01005 	mov	r1, r5
  10183c:	e3a0001d 	mov	r0, #29	; 0x1d
  101840:	eb0001c6 	bl	101f60 <nRFCMD_RegWriteStatusRead>
  101844:	e28dd004 	add	sp, sp, #4	; 0x4
  101848:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10184c:	00104c1f 	andeqs	r4, r0, pc, lsl ip
  101850:	00104c1d 	andeqs	r4, r0, sp, lsl ip

00101854 <nRFAPI_SetPipeSizeRX>:
  101854:	e20030ff 	and	r3, r0, #255	; 0xff
  101858:	e2830011 	add	r0, r3, #17	; 0x11
  10185c:	e3800020 	orr	r0, r0, #32	; 0x20
  101860:	e3530005 	cmp	r3, #5	; 0x5
  101864:	e20000ff 	and	r0, r0, #255	; 0xff
  101868:	e20110ff 	and	r1, r1, #255	; 0xff
  10186c:	812fff1e 	bxhi	lr
  101870:	ea0001ba 	b	101f60 <nRFCMD_RegWriteStatusRead>

00101874 <nRFAPI_ClearIRQ>:
  101874:	e2001070 	and	r1, r0, #112	; 0x70
  101878:	e52de004 	str	lr, [sp, #-4]!
  10187c:	e3a00027 	mov	r0, #39	; 0x27
  101880:	eb0001b6 	bl	101f60 <nRFCMD_RegWriteStatusRead>
  101884:	e49df004 	ldr	pc, [sp], #4

00101888 <nRFAPI_SetChannel>:
  101888:	e200107f 	and	r1, r0, #127	; 0x7f
  10188c:	e3a00025 	mov	r0, #37	; 0x25
  101890:	ea0001b2 	b	101f60 <nRFCMD_RegWriteStatusRead>

00101894 <nRFAPI_SetSizeMac>:
  101894:	e20000ff 	and	r0, r0, #255	; 0xff
  101898:	e2403003 	sub	r3, r0, #3	; 0x3
  10189c:	e3530002 	cmp	r3, #2	; 0x2
  1018a0:	e2400002 	sub	r0, r0, #2	; 0x2
  1018a4:	e92d4010 	stmdb	sp!, {r4, lr}
  1018a8:	e3a04000 	mov	r4, #0	; 0x0
  1018ac:	920040ff 	andls	r4, r0, #255	; 0xff
  1018b0:	e1a01004 	mov	r1, r4
  1018b4:	e3a00023 	mov	r0, #35	; 0x23
  1018b8:	eb0001a8 	bl	101f60 <nRFCMD_RegWriteStatusRead>
  1018bc:	e1a00004 	mov	r0, r4
  1018c0:	e8bd8010 	ldmia	sp!, {r4, pc}

001018c4 <nRFAPI_PipesAck>:
  1018c4:	e200103f 	and	r1, r0, #63	; 0x3f
  1018c8:	e3a00021 	mov	r0, #33	; 0x21
  1018cc:	ea0001a3 	b	101f60 <nRFCMD_RegWriteStatusRead>

001018d0 <nRFAPI_PipesEnable>:
  1018d0:	e200103f 	and	r1, r0, #63	; 0x3f
  1018d4:	e3a00022 	mov	r0, #34	; 0x22
  1018d8:	ea0001a0 	b	101f60 <nRFCMD_RegWriteStatusRead>

001018dc <nRFAPI_TxRetries>:
  1018dc:	e20010ff 	and	r1, r0, #255	; 0xff
  1018e0:	e351000f 	cmp	r1, #15	; 0xf
  1018e4:	23a0100f 	movcs	r1, #15	; 0xf
  1018e8:	e3811010 	orr	r1, r1, #16	; 0x10
  1018ec:	e3a00024 	mov	r0, #36	; 0x24
  1018f0:	ea00019a 	b	101f60 <nRFCMD_RegWriteStatusRead>

001018f4 <nRFAPI_SetTxPower>:
  1018f4:	e20010ff 	and	r1, r0, #255	; 0xff
  1018f8:	e3510003 	cmp	r1, #3	; 0x3
  1018fc:	23a01003 	movcs	r1, #3	; 0x3
  101900:	e1a01081 	mov	r1, r1, lsl #1
  101904:	e20110fe 	and	r1, r1, #254	; 0xfe
  101908:	e3811009 	orr	r1, r1, #9	; 0x9
  10190c:	e3a00026 	mov	r0, #38	; 0x26
  101910:	ea000192 	b	101f60 <nRFCMD_RegWriteStatusRead>

00101914 <nRFAPI_SetRxMode>:
  101914:	e31000ff 	tst	r0, #255	; 0xff
  101918:	03a0103a 	moveq	r1, #58	; 0x3a
  10191c:	13a0103b 	movne	r1, #59	; 0x3b
  101920:	e3a00020 	mov	r0, #32	; 0x20
  101924:	ea00018d 	b	101f60 <nRFCMD_RegWriteStatusRead>

00101928 <nRFAPI_GetFifoStatus>:
  101928:	e52de004 	str	lr, [sp, #-4]!
  10192c:	e3a00017 	mov	r0, #23	; 0x17
  101930:	eb000196 	bl	101f90 <nRFCMD_RegRead>
  101934:	e49df004 	ldr	pc, [sp], #4

00101938 <nRFAPI_GetSizeMac>:
  101938:	e52de004 	str	lr, [sp, #-4]!
  10193c:	e3a00003 	mov	r0, #3	; 0x3
  101940:	eb000192 	bl	101f90 <nRFCMD_RegRead>
  101944:	e2100003 	ands	r0, r0, #3	; 0x3
  101948:	e1a03000 	mov	r3, r0
  10194c:	12803002 	addne	r3, r0, #2	; 0x2
  101950:	e1a00003 	mov	r0, r3
  101954:	e49df004 	ldr	pc, [sp], #4

00101958 <nRFAPI_FlushTX>:
  101958:	e3a000e1 	mov	r0, #225	; 0xe1
  10195c:	ea000199 	b	101fc8 <nRFCMD_CmdExec>

00101960 <nRFAPI_FlushRX>:
  101960:	e3a000e2 	mov	r0, #226	; 0xe2
  101964:	ea000197 	b	101fc8 <nRFCMD_CmdExec>

00101968 <nRFAPI_GetStatus>:
  101968:	e52de004 	str	lr, [sp, #-4]!
  10196c:	e3a000ff 	mov	r0, #255	; 0xff
  101970:	eb000194 	bl	101fc8 <nRFCMD_CmdExec>
  101974:	e49df004 	ldr	pc, [sp], #4

00101978 <nRFAPI_GetTxMAC>:
  101978:	e20110ff 	and	r1, r1, #255	; 0xff
  10197c:	e1a02001 	mov	r2, r1
  101980:	e2411003 	sub	r1, r1, #3	; 0x3
  101984:	e3510002 	cmp	r1, #2	; 0x2
  101988:	e1a01000 	mov	r1, r0
  10198c:	e3a00010 	mov	r0, #16	; 0x10
  101990:	812fff1e 	bxhi	lr
  101994:	ea00014e 	b	101ed4 <nRFCMD_RegReadBuf>

00101998 <nRFAPI_TX>:
  101998:	e1a02001 	mov	r2, r1
  10199c:	e20220ff 	and	r2, r2, #255	; 0xff
  1019a0:	e1a01000 	mov	r1, r0
  1019a4:	e3a000a0 	mov	r0, #160	; 0xa0
  1019a8:	ea00015b 	b	101f1c <nRFCMD_RegWriteBuf>

001019ac <nRFAPI_SetRxMAC>:
  1019ac:	e1a03002 	mov	r3, r2
  1019b0:	e92d4010 	stmdb	sp!, {r4, lr}
  1019b4:	e201e0ff 	and	lr, r1, #255	; 0xff
  1019b8:	e20340ff 	and	r4, r3, #255	; 0xff
  1019bc:	e3540001 	cmp	r4, #1	; 0x1
  1019c0:	83a03000 	movhi	r3, #0	; 0x0
  1019c4:	93a03001 	movls	r3, #1	; 0x1
  1019c8:	e284c00a 	add	ip, r4, #10	; 0xa
  1019cc:	e35e0002 	cmp	lr, #2	; 0x2
  1019d0:	e38cc020 	orr	ip, ip, #32	; 0x20
  1019d4:	93a03000 	movls	r3, #0	; 0x0
  1019d8:	e20cc0ff 	and	ip, ip, #255	; 0xff
  1019dc:	e3530000 	cmp	r3, #0	; 0x0
  1019e0:	e1a01000 	mov	r1, r0
  1019e4:	e1a0200e 	mov	r2, lr
  1019e8:	e1a0000c 	mov	r0, ip
  1019ec:	0a000001 	beq	1019f8 <nRFAPI_SetRxMAC+0x4c>
  1019f0:	e35e0005 	cmp	lr, #5	; 0x5
  1019f4:	9a000008 	bls	101a1c <nRFAPI_SetRxMAC+0x70>
  1019f8:	e35e0001 	cmp	lr, #1	; 0x1
  1019fc:	13a03000 	movne	r3, #0	; 0x0
  101a00:	03a03001 	moveq	r3, #1	; 0x1
  101a04:	e3540001 	cmp	r4, #1	; 0x1
  101a08:	93a03000 	movls	r3, #0	; 0x0
  101a0c:	e3530000 	cmp	r3, #0	; 0x0
  101a10:	08bd8010 	ldmeqia	sp!, {r4, pc}
  101a14:	e3540005 	cmp	r4, #5	; 0x5
  101a18:	88bd8010 	ldmhiia	sp!, {r4, pc}
  101a1c:	e8bd4010 	ldmia	sp!, {r4, lr}
  101a20:	ea00013d 	b	101f1c <nRFCMD_RegWriteBuf>

00101a24 <nRFAPI_SetTxMAC>:
  101a24:	e20110ff 	and	r1, r1, #255	; 0xff
  101a28:	e1a02001 	mov	r2, r1
  101a2c:	e2411003 	sub	r1, r1, #3	; 0x3
  101a30:	e3510002 	cmp	r1, #2	; 0x2
  101a34:	e1a01000 	mov	r1, r0
  101a38:	e3a00030 	mov	r0, #48	; 0x30
  101a3c:	812fff1e 	bxhi	lr
  101a40:	ea000135 	b	101f1c <nRFCMD_RegWriteBuf>

00101a44 <nRFAPI_DetectChip>:
  101a44:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101a48:	e24dd008 	sub	sp, sp, #8	; 0x8
  101a4c:	ebffffc5 	bl	101968 <nRFAPI_GetStatus>
  101a50:	e3a00003 	mov	r0, #3	; 0x3
  101a54:	ebffff8e 	bl	101894 <nRFAPI_SetSizeMac>
  101a58:	ebffffb6 	bl	101938 <nRFAPI_GetSizeMac>
  101a5c:	e3500003 	cmp	r0, #3	; 0x3
  101a60:	0a000002 	beq	101a70 <nRFAPI_DetectChip+0x2c>
  101a64:	e3a00000 	mov	r0, #0	; 0x0
  101a68:	e28dd008 	add	sp, sp, #8	; 0x8
  101a6c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101a70:	e2800002 	add	r0, r0, #2	; 0x2
  101a74:	ebffff86 	bl	101894 <nRFAPI_SetSizeMac>
  101a78:	ebffffae 	bl	101938 <nRFAPI_GetSizeMac>
  101a7c:	e3500005 	cmp	r0, #5	; 0x5
  101a80:	e1a04000 	mov	r4, r0
  101a84:	1afffff6 	bne	101a64 <nRFAPI_DetectChip+0x20>
  101a88:	e59f6054 	ldr	r6, [pc, #84]	; 101ae4 <prog+0x1aa0>
  101a8c:	e1a01000 	mov	r1, r0
  101a90:	e28d5003 	add	r5, sp, #3	; 0x3
  101a94:	e1a00006 	mov	r0, r6
  101a98:	ebffffe1 	bl	101a24 <nRFAPI_SetTxMAC>
  101a9c:	e1a01004 	mov	r1, r4
  101aa0:	e1a00005 	mov	r0, r5
  101aa4:	e2444005 	sub	r4, r4, #5	; 0x5
  101aa8:	e5cd4003 	strb	r4, [sp, #3]
  101aac:	e5cd4004 	strb	r4, [sp, #4]
  101ab0:	e5cd4005 	strb	r4, [sp, #5]
  101ab4:	e5cd4006 	strb	r4, [sp, #6]
  101ab8:	e5cd4007 	strb	r4, [sp, #7]
  101abc:	ebffffad 	bl	101978 <nRFAPI_GetTxMAC>
  101ac0:	e7d42005 	ldrb	r2, [r4, r5]
  101ac4:	e7d43006 	ldrb	r3, [r4, r6]
  101ac8:	e1520003 	cmp	r2, r3
  101acc:	e2844001 	add	r4, r4, #1	; 0x1
  101ad0:	1affffe3 	bne	101a64 <nRFAPI_DetectChip+0x20>
  101ad4:	e3540005 	cmp	r4, #5	; 0x5
  101ad8:	1afffff8 	bne	101ac0 <nRFAPI_DetectChip+0x7c>
  101adc:	e3a00001 	mov	r0, #1	; 0x1
  101ae0:	eaffffe0 	b	101a68 <nRFAPI_DetectChip+0x24>
  101ae4:	00104c18 	andeqs	r4, r0, r8, lsl ip

00101ae8 <nRFAPI_Init>:
  101ae8:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  101aec:	e20240ff 	and	r4, r2, #255	; 0xff
  101af0:	e20370ff 	and	r7, r3, #255	; 0xff
  101af4:	e1a05001 	mov	r5, r1
  101af8:	e20060ff 	and	r6, r0, #255	; 0xff
  101afc:	eb00002d 	bl	101bb8 <nRFCMD_Init>
  101b00:	e2443003 	sub	r3, r4, #3	; 0x3
  101b04:	e3530002 	cmp	r3, #2	; 0x2
  101b08:	9a000001 	bls	101b14 <nRFAPI_Init+0x2c>
  101b0c:	e3a00000 	mov	r0, #0	; 0x0
  101b10:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  101b14:	ebffffca 	bl	101a44 <nRFAPI_DetectChip>
  101b18:	e3500000 	cmp	r0, #0	; 0x0
  101b1c:	0afffffa 	beq	101b0c <nRFAPI_Init+0x24>
  101b20:	e1a00004 	mov	r0, r4
  101b24:	ebffff5a 	bl	101894 <nRFAPI_SetSizeMac>
  101b28:	e1a01004 	mov	r1, r4
  101b2c:	e1a00005 	mov	r0, r5
  101b30:	ebffffbb 	bl	101a24 <nRFAPI_SetTxMAC>
  101b34:	e1a01004 	mov	r1, r4
  101b38:	e3a02000 	mov	r2, #0	; 0x0
  101b3c:	e1a00005 	mov	r0, r5
  101b40:	ebffff99 	bl	1019ac <nRFAPI_SetRxMAC>
  101b44:	e3a00001 	mov	r0, #1	; 0x1
  101b48:	ebffff60 	bl	1018d0 <nRFAPI_PipesEnable>
  101b4c:	e3a00000 	mov	r0, #0	; 0x0
  101b50:	ebffff5b 	bl	1018c4 <nRFAPI_PipesAck>
  101b54:	e3a04000 	mov	r4, #0	; 0x0
  101b58:	e1a00004 	mov	r0, r4
  101b5c:	e3a01002 	mov	r1, #2	; 0x2
  101b60:	e2844001 	add	r4, r4, #1	; 0x1
  101b64:	ebffff3a 	bl	101854 <nRFAPI_SetPipeSizeRX>
  101b68:	e3540006 	cmp	r4, #6	; 0x6
  101b6c:	1afffff9 	bne	101b58 <nRFAPI_Init+0x70>
  101b70:	e3a00000 	mov	r0, #0	; 0x0
  101b74:	ebffff58 	bl	1018dc <nRFAPI_TxRetries>
  101b78:	e1a00006 	mov	r0, r6
  101b7c:	ebffff41 	bl	101888 <nRFAPI_SetChannel>
  101b80:	e3a00003 	mov	r0, #3	; 0x3
  101b84:	ebffff5a 	bl	1018f4 <nRFAPI_SetTxPower>
  101b88:	ebffff74 	bl	101960 <nRFAPI_FlushRX>
  101b8c:	ebffff71 	bl	101958 <nRFAPI_FlushTX>
  101b90:	e3a00000 	mov	r0, #0	; 0x0
  101b94:	ebffff5e 	bl	101914 <nRFAPI_SetRxMode>
  101b98:	e3570000 	cmp	r7, #0	; 0x0
  101b9c:	1a000001 	bne	101ba8 <nRFAPI_Init+0xc0>
  101ba0:	e3a00001 	mov	r0, #1	; 0x1
  101ba4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  101ba8:	e1a00007 	mov	r0, r7
  101bac:	ebffff13 	bl	101800 <nRFAPI_SetFeatures>
  101bb0:	e3a00001 	mov	r0, #1	; 0x1
  101bb4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00101bb8 <nRFCMD_Init>:
  101bb8:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  101bbc:	e59f3154 	ldr	r3, [pc, #340]	; 101d18 <prog+0x1cd4>
  101bc0:	e59f2154 	ldr	r2, [pc, #340]	; 101d1c <prog+0x1cd8>
  101bc4:	e3a05000 	mov	r5, #0	; 0x0
  101bc8:	e1a01005 	mov	r1, r5
  101bcc:	e5835000 	str	r5, [r3]
  101bd0:	e5825000 	str	r5, [r2]
  101bd4:	e24dd004 	sub	sp, sp, #4	; 0x4
  101bd8:	e3a00001 	mov	r0, #1	; 0x1
  101bdc:	eb000370 	bl	1029a4 <xQueueCreate>
  101be0:	e59f6138 	ldr	r6, [pc, #312]	; 101d20 <prog+0x1cdc>
  101be4:	e1500005 	cmp	r0, r5
  101be8:	e59f4134 	ldr	r4, [pc, #308]	; 101d24 <prog+0x1ce0>
  101bec:	e1a02005 	mov	r2, r5
  101bf0:	e1a03005 	mov	r3, r5
  101bf4:	e1a01005 	mov	r1, r5
  101bf8:	e5860000 	str	r0, [r6]
  101bfc:	1b00030e 	blne	10283c <xQueueGenericSend>
  101c00:	e1a01005 	mov	r1, r5
  101c04:	e3a00001 	mov	r0, #1	; 0x1
  101c08:	eb000365 	bl	1029a4 <xQueueCreate>
  101c0c:	e3500000 	cmp	r0, #0	; 0x0
  101c10:	e1a01005 	mov	r1, r5
  101c14:	e1a02005 	mov	r2, r5
  101c18:	e1a03005 	mov	r3, r5
  101c1c:	e5840000 	str	r0, [r4]
  101c20:	1b000305 	blne	10283c <xQueueGenericSend>
  101c24:	e5960000 	ldr	r0, [r6]
  101c28:	e3500000 	cmp	r0, #0	; 0x0
  101c2c:	0a000037 	beq	101d10 <nRFCMD_Init+0x158>
  101c30:	e594c000 	ldr	ip, [r4]
  101c34:	e35c0000 	cmp	ip, #0	; 0x0
  101c38:	e1a01005 	mov	r1, r5
  101c3c:	e1a02005 	mov	r2, r5
  101c40:	e1a03005 	mov	r3, r5
  101c44:	e3e06c0b 	mvn	r6, #2816	; 0xb00
  101c48:	e3a08020 	mov	r8, #32	; 0x20
  101c4c:	e3a0a702 	mov	sl, #524288	; 0x80000
  101c50:	e3e07b7f 	mvn	r7, #130048	; 0x1fc00
  101c54:	0a00002d 	beq	101d10 <nRFCMD_Init+0x158>
  101c58:	eb000291 	bl	1026a4 <xQueueGenericReceive>
  101c5c:	e5940000 	ldr	r0, [r4]
  101c60:	e1a01005 	mov	r1, r5
  101c64:	e1a02005 	mov	r2, r5
  101c68:	e1a03005 	mov	r3, r5
  101c6c:	eb00028c 	bl	1026a4 <xQueueGenericReceive>
  101c70:	e3a02402 	mov	r2, #33554432	; 0x2000000
  101c74:	e3a01b1e 	mov	r1, #30720	; 0x7800
  101c78:	e3e03c03 	mvn	r3, #768	; 0x300
  101c7c:	e50380ef 	str	r8, [r3, #-239]
  101c80:	e506108f 	str	r1, [r6, #-143]
  101c84:	e506508b 	str	r5, [r6, #-139]
  101c88:	e50610fb 	str	r1, [r6, #-251]
  101c8c:	e506a0eb 	str	sl, [r6, #-235]
  101c90:	e506a0ff 	str	sl, [r6, #-255]
  101c94:	e50620cb 	str	r2, [r6, #-203]
  101c98:	e50620ff 	str	r2, [r6, #-255]
  101c9c:	e50620ef 	str	r2, [r6, #-239]
  101ca0:	eb0006c3 	bl	1037b4 <vPortEnterCritical>
  101ca4:	e3a0cc06 	mov	ip, #1536	; 0x600
  101ca8:	e28cc002 	add	ip, ip, #2	; 0x2
  101cac:	e3a04001 	mov	r4, #1	; 0x1
  101cb0:	e50743fb 	str	r4, [r7, #-1019]
  101cb4:	e3a01004 	mov	r1, #4	; 0x4
  101cb8:	e507c3cf 	str	ip, [r7, #-975]
  101cbc:	e1a02008 	mov	r2, r8
  101cc0:	e59f3060 	ldr	r3, [pc, #96]	; 101d28 <prog+0x1ce4>
  101cc4:	e3a00005 	mov	r0, #5	; 0x5
  101cc8:	e50743ff 	str	r4, [r7, #-1023]
  101ccc:	eb000163 	bl	102260 <AT91F_AIC_ConfigureIt>
  101cd0:	e3a01003 	mov	r1, #3	; 0x3
  101cd4:	e3a02040 	mov	r2, #64	; 0x40
  101cd8:	e59f304c 	ldr	r3, [pc, #76]	; 101d2c <prog+0x1ce8>
  101cdc:	e3a00002 	mov	r0, #2	; 0x2
  101ce0:	e50783eb 	str	r8, [r7, #-1003]
  101ce4:	eb00015d 	bl	102260 <AT91F_AIC_ConfigureIt>
  101ce8:	e51630b3 	ldr	r3, [r6, #-179]
  101cec:	e3a02024 	mov	r2, #36	; 0x24
  101cf0:	e58d3000 	str	r3, [sp]
  101cf4:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  101cf8:	e506a0bf 	str	sl, [r6, #-191]
  101cfc:	e5832021 	str	r2, [r3, #33]
  101d00:	eb0006b6 	bl	1037e0 <vPortExitCritical>
  101d04:	e1a00005 	mov	r0, r5
  101d08:	e28dd004 	add	sp, sp, #4	; 0x4
  101d0c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  101d10:	e3a00001 	mov	r0, #1	; 0x1
  101d14:	eafffffb 	b	101d08 <nRFCMD_Init+0x150>
  101d18:	00200f4c 	eoreq	r0, r0, ip, asr #30
  101d1c:	00200f48 	eoreq	r0, r0, r8, asr #30
  101d20:	00200c3c 	eoreq	r0, r0, ip, lsr ip
  101d24:	00200c40 	eoreq	r0, r0, r0, asr #24
  101d28:	00102120 	andeqs	r2, r0, r0, lsr #2
  101d2c:	00101da8 	andeqs	r1, r0, r8, lsr #27

00101d30 <nRFCMD_ISR_ACK_Handler>:
  101d30:	e92d4010 	stmdb	sp!, {r4, lr}
  101d34:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  101d38:	e51230b3 	ldr	r3, [r2, #-179]
  101d3c:	e3130702 	tst	r3, #524288	; 0x80000
  101d40:	e24dd004 	sub	sp, sp, #4	; 0x4
  101d44:	0a000005 	beq	101d60 <nRFCMD_ISR_ACK_Handler+0x30>
  101d48:	e51230c3 	ldr	r3, [r2, #-195]
  101d4c:	e2134702 	ands	r4, r3, #524288	; 0x80000
  101d50:	e28dc004 	add	ip, sp, #4	; 0x4
  101d54:	e1a01004 	mov	r1, r4
  101d58:	e1a03004 	mov	r3, r4
  101d5c:	0a000004 	beq	101d74 <nRFCMD_ISR_ACK_Handler+0x44>
  101d60:	e3a02000 	mov	r2, #0	; 0x0
  101d64:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  101d68:	e5832031 	str	r2, [r3, #49]
  101d6c:	e28dd004 	add	sp, sp, #4	; 0x4
  101d70:	e8bd8010 	ldmia	sp!, {r4, pc}
  101d74:	e59f2028 	ldr	r2, [pc, #40]	; 101da4 <prog+0x1d60>
  101d78:	e5920000 	ldr	r0, [r2]
  101d7c:	e1a0200d 	mov	r2, sp
  101d80:	e52c4004 	str	r4, [ip, #-4]!
  101d84:	eb0001e8 	bl	10252c <xQueueGenericSendFromISR>
  101d88:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  101d8c:	e3500000 	cmp	r0, #0	; 0x0
  101d90:	e5834031 	str	r4, [r3, #49]
  101d94:	0afffff4 	beq	101d6c <nRFCMD_ISR_ACK_Handler+0x3c>
  101d98:	e58d0000 	str	r0, [sp]
  101d9c:	eb000329 	bl	102a48 <vTaskSwitchContext>
  101da0:	eafffff1 	b	101d6c <nRFCMD_ISR_ACK_Handler+0x3c>
  101da4:	00200c40 	eoreq	r0, r0, r0, asr #24

00101da8 <nRFCMD_ISR_ACK>:
  101da8:	e92d0001 	stmdb	sp!, {r0}
  101dac:	e94d2000 	stmdb	sp, {sp}^
  101db0:	e1a00000 	nop			(mov r0,r0)
  101db4:	e24dd004 	sub	sp, sp, #4	; 0x4
  101db8:	e8bd0001 	ldmia	sp!, {r0}
  101dbc:	e9204000 	stmdb	r0!, {lr}
  101dc0:	e1a0e000 	mov	lr, r0
  101dc4:	e8bd0001 	ldmia	sp!, {r0}
  101dc8:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  101dcc:	e1a00000 	nop			(mov r0,r0)
  101dd0:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  101dd4:	e14f0000 	mrs	r0, SPSR
  101dd8:	e92e0001 	stmdb	lr!, {r0}
  101ddc:	e59f0064 	ldr	r0, [pc, #100]	; 101e48 <prog+0x1e04>
  101de0:	e5900000 	ldr	r0, [r0]
  101de4:	e92e0001 	stmdb	lr!, {r0}
  101de8:	e59f005c 	ldr	r0, [pc, #92]	; 101e4c <prog+0x1e08>
  101dec:	e5900000 	ldr	r0, [r0]
  101df0:	e580e000 	str	lr, [r0]
  101df4:	e59f4044 	ldr	r4, [pc, #68]	; 101e40 <prog+0x1dfc>
  101df8:	e59f5044 	ldr	r5, [pc, #68]	; 101e44 <prog+0x1e00>
  101dfc:	e5943000 	ldr	r3, [r4]
  101e00:	e5952000 	ldr	r2, [r5]
  101e04:	ebffffc9 	bl	101d30 <nRFCMD_ISR_ACK_Handler>
  101e08:	e59f003c 	ldr	r0, [pc, #60]	; 101e4c <prog+0x1e08>
  101e0c:	e5900000 	ldr	r0, [r0]
  101e10:	e590e000 	ldr	lr, [r0]
  101e14:	e59f002c 	ldr	r0, [pc, #44]	; 101e48 <prog+0x1e04>
  101e18:	e8be0002 	ldmia	lr!, {r1}
  101e1c:	e5801000 	str	r1, [r0]
  101e20:	e8be0001 	ldmia	lr!, {r0}
  101e24:	e169f000 	msr	SPSR_fc, r0
  101e28:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  101e2c:	e1a00000 	nop			(mov r0,r0)
  101e30:	e59ee03c 	ldr	lr, [lr, #60]
  101e34:	e25ef004 	subs	pc, lr, #4	; 0x4
  101e38:	e5943000 	ldr	r3, [r4]
  101e3c:	e5952000 	ldr	r2, [r5]
  101e40:	00200828 	eoreq	r0, r0, r8, lsr #16
  101e44:	00200c44 	eoreq	r0, r0, r4, asr #24
  101e48:	00200828 	eoreq	r0, r0, r8, lsr #16
  101e4c:	00200c44 	eoreq	r0, r0, r4, asr #24

00101e50 <nRFCMD_ReadWriteBuffer>:
  101e50:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  101e54:	e3a044ff 	mov	r4, #-16777216	; 0xff000000
  101e58:	e28448fe 	add	r4, r4, #16646144	; 0xfe0000
  101e5c:	e3a05000 	mov	r5, #0	; 0x0
  101e60:	e2846c01 	add	r6, r4, #256	; 0x100
  101e64:	e24dd004 	sub	sp, sp, #4	; 0x4
  101e68:	e1a07000 	mov	r7, r0
  101e6c:	e1a08002 	mov	r8, r2
  101e70:	e1a03005 	mov	r3, r5
  101e74:	e1a00006 	mov	r0, r6
  101e78:	e58d5000 	str	r5, [sp]
  101e7c:	eb000117 	bl	1022e0 <AT91F_PDC_ReceiveFrame>
  101e80:	e1a01007 	mov	r1, r7
  101e84:	e1a02008 	mov	r2, r8
  101e88:	e1a03005 	mov	r3, r5
  101e8c:	e1a00006 	mov	r0, r6
  101e90:	e58d5000 	str	r5, [sp]
  101e94:	eb0000ff 	bl	102298 <AT91F_PDC_SendFrame>
  101e98:	e59f3030 	ldr	r3, [pc, #48]	; 101ed0 <prog+0x1e8c>
  101e9c:	e3a0cc01 	mov	ip, #256	; 0x100
  101ea0:	e28cc001 	add	ip, ip, #1	; 0x1
  101ea4:	e1844ba4 	orr	r4, r4, r4, lsr #23
  101ea8:	e1a01005 	mov	r1, r5
  101eac:	e5930000 	ldr	r0, [r3]
  101eb0:	e3a02064 	mov	r2, #100	; 0x64
  101eb4:	e1a03005 	mov	r3, r5
  101eb8:	e504c0df 	str	ip, [r4, #-223]
  101ebc:	eb0001f8 	bl	1026a4 <xQueueGenericReceive>
  101ec0:	e2500001 	subs	r0, r0, #1	; 0x1
  101ec4:	13a00001 	movne	r0, #1	; 0x1
  101ec8:	e28dd004 	add	sp, sp, #4	; 0x4
  101ecc:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  101ed0:	00200c3c 	eoreq	r0, r0, ip, lsr ip

00101ed4 <nRFCMD_RegReadBuf>:
  101ed4:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101ed8:	e59f3034 	ldr	r3, [pc, #52]	; 101f14 <prog+0x1ed0>
  101edc:	e59f5034 	ldr	r5, [pc, #52]	; 101f18 <prog+0x1ed4>
  101ee0:	e20240ff 	and	r4, r2, #255	; 0xff
  101ee4:	e5c30000 	strb	r0, [r3]
  101ee8:	e1a06001 	mov	r6, r1
  101eec:	e1a00003 	mov	r0, r3
  101ef0:	e1a01005 	mov	r1, r5
  101ef4:	e2842002 	add	r2, r4, #2	; 0x2
  101ef8:	ebffffd4 	bl	101e50 <nRFCMD_ReadWriteBuffer>
  101efc:	e1a00006 	mov	r0, r6
  101f00:	e1a02004 	mov	r2, r4
  101f04:	e2851001 	add	r1, r5, #1	; 0x1
  101f08:	ebfffaeb 	bl	100abc <memcpy>
  101f0c:	e5d50000 	ldrb	r0, [r5]
  101f10:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101f14:	00200bf8 	streqd	r0, [r0], -r8
  101f18:	00200c19 	eoreq	r0, r0, r9, lsl ip

00101f1c <nRFCMD_RegWriteBuf>:
  101f1c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  101f20:	e59f6030 	ldr	r6, [pc, #48]	; 101f58 <prog+0x1f14>
  101f24:	e1a03006 	mov	r3, r6
  101f28:	e4c30001 	strb	r0, [r3], #1
  101f2c:	e20240ff 	and	r4, r2, #255	; 0xff
  101f30:	e59f5024 	ldr	r5, [pc, #36]	; 101f5c <prog+0x1f18>
  101f34:	e1a00003 	mov	r0, r3
  101f38:	e1a02004 	mov	r2, r4
  101f3c:	ebfffade 	bl	100abc <memcpy>
  101f40:	e1a00006 	mov	r0, r6
  101f44:	e2842001 	add	r2, r4, #1	; 0x1
  101f48:	e1a01005 	mov	r1, r5
  101f4c:	ebffffbf 	bl	101e50 <nRFCMD_ReadWriteBuffer>
  101f50:	e5d50000 	ldrb	r0, [r5]
  101f54:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  101f58:	00200bf8 	streqd	r0, [r0], -r8
  101f5c:	00200c19 	eoreq	r0, r0, r9, lsl ip

00101f60 <nRFCMD_RegWriteStatusRead>:
  101f60:	e92d4010 	stmdb	sp!, {r4, lr}
  101f64:	e59f401c 	ldr	r4, [pc, #28]	; 101f88 <prog+0x1f44>
  101f68:	e3a02002 	mov	r2, #2	; 0x2
  101f6c:	e5c40000 	strb	r0, [r4]
  101f70:	e5c41001 	strb	r1, [r4, #1]
  101f74:	e1a00004 	mov	r0, r4
  101f78:	e59f100c 	ldr	r1, [pc, #12]	; 101f8c <prog+0x1f48>
  101f7c:	ebffffb3 	bl	101e50 <nRFCMD_ReadWriteBuffer>
  101f80:	e5d40000 	ldrb	r0, [r4]
  101f84:	e8bd8010 	ldmia	sp!, {r4, pc}
  101f88:	00200bf8 	streqd	r0, [r0], -r8
  101f8c:	00200c19 	eoreq	r0, r0, r9, lsl ip

00101f90 <nRFCMD_RegRead>:
  101f90:	e92d4010 	stmdb	sp!, {r4, lr}
  101f94:	e59f3024 	ldr	r3, [pc, #36]	; 101fc0 <prog+0x1f7c>
  101f98:	e59f4024 	ldr	r4, [pc, #36]	; 101fc4 <prog+0x1f80>
  101f9c:	e3a0c000 	mov	ip, #0	; 0x0
  101fa0:	e5c30000 	strb	r0, [r3]
  101fa4:	e1a01004 	mov	r1, r4
  101fa8:	e1a00003 	mov	r0, r3
  101fac:	e3a02002 	mov	r2, #2	; 0x2
  101fb0:	e5c3c001 	strb	ip, [r3, #1]
  101fb4:	ebffffa5 	bl	101e50 <nRFCMD_ReadWriteBuffer>
  101fb8:	e5d40001 	ldrb	r0, [r4, #1]
  101fbc:	e8bd8010 	ldmia	sp!, {r4, pc}
  101fc0:	00200bf8 	streqd	r0, [r0], -r8
  101fc4:	00200c19 	eoreq	r0, r0, r9, lsl ip

00101fc8 <nRFCMD_CmdExec>:
  101fc8:	e52de004 	str	lr, [sp, #-4]!
  101fcc:	e24dd004 	sub	sp, sp, #4	; 0x4
  101fd0:	e28d3004 	add	r3, sp, #4	; 0x4
  101fd4:	e5630001 	strb	r0, [r3, #-1]!
  101fd8:	e28d1002 	add	r1, sp, #2	; 0x2
  101fdc:	e1a00003 	mov	r0, r3
  101fe0:	e3a02001 	mov	r2, #1	; 0x1
  101fe4:	ebffff99 	bl	101e50 <nRFCMD_ReadWriteBuffer>
  101fe8:	e5dd0002 	ldrb	r0, [sp, #2]
  101fec:	e28dd004 	add	sp, sp, #4	; 0x4
  101ff0:	e8bd8000 	ldmia	sp!, {pc}

00101ff4 <nRFCMD_CE>:
  101ff4:	e31000ff 	tst	r0, #255	; 0xff
  101ff8:	13a02402 	movne	r2, #33554432	; 0x2000000
  101ffc:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  102000:	03a02402 	moveq	r2, #33554432	; 0x2000000
  102004:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  102008:	150320cf 	strne	r2, [r3, #-207]
  10200c:	050320cb 	streq	r2, [r3, #-203]
  102010:	e12fff1e 	bx	lr

00102014 <nRFCMD_ProcessNextMacro>:
  102014:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  102018:	e59f5080 	ldr	r5, [pc, #128]	; 1020a0 <prog+0x205c>
  10201c:	e5952000 	ldr	r2, [r5]
  102020:	e3520000 	cmp	r2, #0	; 0x0
  102024:	e24dd004 	sub	sp, sp, #4	; 0x4
  102028:	e3a0c001 	mov	ip, #1	; 0x1
  10202c:	0a00000b 	beq	102060 <nRFCMD_ProcessNextMacro+0x4c>
  102030:	e5d24000 	ldrb	r4, [r2]
  102034:	e3a06000 	mov	r6, #0	; 0x0
  102038:	e3a004ff 	mov	r0, #-16777216	; 0xff000000
  10203c:	e28008fe 	add	r0, r0, #16646144	; 0xfe0000
  102040:	e1540006 	cmp	r4, r6
  102044:	e2821001 	add	r1, r2, #1	; 0x1
  102048:	e2800c01 	add	r0, r0, #256	; 0x100
  10204c:	e1a03006 	mov	r3, r6
  102050:	e1a02004 	mov	r2, r4
  102054:	e3a0c001 	mov	ip, #1	; 0x1
  102058:	05854000 	streq	r4, [r5]
  10205c:	1a000002 	bne	10206c <nRFCMD_ProcessNextMacro+0x58>
  102060:	e1a0000c 	mov	r0, ip
  102064:	e28dd004 	add	sp, sp, #4	; 0x4
  102068:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10206c:	e58d6000 	str	r6, [sp]
  102070:	eb000088 	bl	102298 <AT91F_PDC_SendFrame>
  102074:	e5953000 	ldr	r3, [r5]
  102078:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
  10207c:	e0843003 	add	r3, r4, r3
  102080:	e1a02742 	mov	r2, r2, asr #14
  102084:	e2833001 	add	r3, r3, #1	; 0x1
  102088:	e1822ba2 	orr	r2, r2, r2, lsr #23
  10208c:	e3a01c01 	mov	r1, #256	; 0x100
  102090:	e1a0c006 	mov	ip, r6
  102094:	e5853000 	str	r3, [r5]
  102098:	e50210df 	str	r1, [r2, #-223]
  10209c:	eaffffef 	b	102060 <nRFCMD_ProcessNextMacro+0x4c>
  1020a0:	00200f48 	eoreq	r0, r0, r8, asr #30

001020a4 <nRFCMD_ISR_DMA_Handler>:
  1020a4:	e92d4010 	stmdb	sp!, {r4, lr}
  1020a8:	e3e02b7f 	mvn	r2, #130048	; 0x1fc00
  1020ac:	e51233ef 	ldr	r3, [r2, #-1007]
  1020b0:	e2132020 	ands	r2, r3, #32	; 0x20
  1020b4:	03e03c0f 	mvneq	r3, #3840	; 0xf00
  1020b8:	e24dd004 	sub	sp, sp, #4	; 0x4
  1020bc:	e3a04000 	mov	r4, #0	; 0x0
  1020c0:	05832031 	streq	r2, [r3, #49]
  1020c4:	1a000001 	bne	1020d0 <nRFCMD_ISR_DMA_Handler+0x2c>
  1020c8:	e28dd004 	add	sp, sp, #4	; 0x4
  1020cc:	e8bd8010 	ldmia	sp!, {r4, pc}
  1020d0:	e58d4000 	str	r4, [sp]
  1020d4:	ebffffce 	bl	102014 <nRFCMD_ProcessNextMacro>
  1020d8:	e1500004 	cmp	r0, r4
  1020dc:	e1a01004 	mov	r1, r4
  1020e0:	e1a0200d 	mov	r2, sp
  1020e4:	e1a03004 	mov	r3, r4
  1020e8:	1a000006 	bne	102108 <nRFCMD_ISR_DMA_Handler+0x64>
  1020ec:	e59d3000 	ldr	r3, [sp]
  1020f0:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  1020f4:	e3530000 	cmp	r3, #0	; 0x0
  1020f8:	e5824031 	str	r4, [r2, #49]
  1020fc:	0afffff1 	beq	1020c8 <nRFCMD_ISR_DMA_Handler+0x24>
  102100:	eb000250 	bl	102a48 <vTaskSwitchContext>
  102104:	eaffffef 	b	1020c8 <nRFCMD_ISR_DMA_Handler+0x24>
  102108:	e59fc00c 	ldr	ip, [pc, #12]	; 10211c <prog+0x20d8>
  10210c:	e59c0000 	ldr	r0, [ip]
  102110:	eb000105 	bl	10252c <xQueueGenericSendFromISR>
  102114:	e58d0000 	str	r0, [sp]
  102118:	eafffff3 	b	1020ec <nRFCMD_ISR_DMA_Handler+0x48>
  10211c:	00200c3c 	eoreq	r0, r0, ip, lsr ip

00102120 <nRFCMD_ISR_DMA>:
  102120:	e92d0001 	stmdb	sp!, {r0}
  102124:	e94d2000 	stmdb	sp, {sp}^
  102128:	e1a00000 	nop			(mov r0,r0)
  10212c:	e24dd004 	sub	sp, sp, #4	; 0x4
  102130:	e8bd0001 	ldmia	sp!, {r0}
  102134:	e9204000 	stmdb	r0!, {lr}
  102138:	e1a0e000 	mov	lr, r0
  10213c:	e8bd0001 	ldmia	sp!, {r0}
  102140:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  102144:	e1a00000 	nop			(mov r0,r0)
  102148:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10214c:	e14f0000 	mrs	r0, SPSR
  102150:	e92e0001 	stmdb	lr!, {r0}
  102154:	e59f0064 	ldr	r0, [pc, #100]	; 1021c0 <prog+0x217c>
  102158:	e5900000 	ldr	r0, [r0]
  10215c:	e92e0001 	stmdb	lr!, {r0}
  102160:	e59f005c 	ldr	r0, [pc, #92]	; 1021c4 <prog+0x2180>
  102164:	e5900000 	ldr	r0, [r0]
  102168:	e580e000 	str	lr, [r0]
  10216c:	e59f4044 	ldr	r4, [pc, #68]	; 1021b8 <prog+0x2174>
  102170:	e59f5044 	ldr	r5, [pc, #68]	; 1021bc <prog+0x2178>
  102174:	e5943000 	ldr	r3, [r4]
  102178:	e5952000 	ldr	r2, [r5]
  10217c:	ebffffc8 	bl	1020a4 <nRFCMD_ISR_DMA_Handler>
  102180:	e59f003c 	ldr	r0, [pc, #60]	; 1021c4 <prog+0x2180>
  102184:	e5900000 	ldr	r0, [r0]
  102188:	e590e000 	ldr	lr, [r0]
  10218c:	e59f002c 	ldr	r0, [pc, #44]	; 1021c0 <prog+0x217c>
  102190:	e8be0002 	ldmia	lr!, {r1}
  102194:	e5801000 	str	r1, [r0]
  102198:	e8be0001 	ldmia	lr!, {r0}
  10219c:	e169f000 	msr	SPSR_fc, r0
  1021a0:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1021a4:	e1a00000 	nop			(mov r0,r0)
  1021a8:	e59ee03c 	ldr	lr, [lr, #60]
  1021ac:	e25ef004 	subs	pc, lr, #4	; 0x4
  1021b0:	e5943000 	ldr	r3, [r4]
  1021b4:	e5952000 	ldr	r2, [r5]
  1021b8:	00200828 	eoreq	r0, r0, r8, lsr #16
  1021bc:	00200c44 	eoreq	r0, r0, r4, asr #24
  1021c0:	00200828 	eoreq	r0, r0, r8, lsr #16
  1021c4:	00200c44 	eoreq	r0, r0, r4, asr #24

001021c8 <AT91F_LowLevelInit>:
  1021c8:	e3a0184b 	mov	r1, #4915200	; 0x4b0000
  1021cc:	e3a00502 	mov	r0, #8388608	; 0x800000
  1021d0:	e3a0cc06 	mov	ip, #1536	; 0x600
  1021d4:	e52de004 	str	lr, [sp, #-4]!
  1021d8:	e2811c01 	add	r1, r1, #256	; 0x100
  1021dc:	e2800d82 	add	r0, r0, #8320	; 0x2080
  1021e0:	e28cc001 	add	ip, ip, #1	; 0x1
  1021e4:	e3e0ec03 	mvn	lr, #768	; 0x300
  1021e8:	e3e03000 	mvn	r3, #0	; 0x0
  1021ec:	e3e02c02 	mvn	r2, #512	; 0x200
  1021f0:	e503109f 	str	r1, [r3, #-159]
  1021f4:	e50200bb 	str	r0, [r2, #-187]
  1021f8:	e50ec0df 	str	ip, [lr, #-223]
  1021fc:	e51e3097 	ldr	r3, [lr, #-151]
  102200:	e3130001 	tst	r3, #1	; 0x1
  102204:	0afffffc 	beq	1021fc <AT91F_LowLevelInit+0x34>
  102208:	e3a03819 	mov	r3, #1638400	; 0x190000
  10220c:	e2833b07 	add	r3, r3, #7168	; 0x1c00
  102210:	e2833005 	add	r3, r3, #5	; 0x5
  102214:	e50e30d3 	str	r3, [lr, #-211]
  102218:	e3e02c03 	mvn	r2, #768	; 0x300
  10221c:	e5123097 	ldr	r3, [r2, #-151]
  102220:	e3130004 	tst	r3, #4	; 0x4
  102224:	0afffffc 	beq	10221c <AT91F_LowLevelInit+0x54>
  102228:	e3a03004 	mov	r3, #4	; 0x4
  10222c:	e50230cf 	str	r3, [r2, #-207]
  102230:	e3e02c03 	mvn	r2, #768	; 0x300
  102234:	e5123097 	ldr	r3, [r2, #-151]
  102238:	e3130008 	tst	r3, #8	; 0x8
  10223c:	0afffffc 	beq	102234 <AT91F_LowLevelInit+0x6c>
  102240:	e51230cf 	ldr	r3, [r2, #-207]
  102244:	e3833003 	orr	r3, r3, #3	; 0x3
  102248:	e50230cf 	str	r3, [r2, #-207]
  10224c:	e3e02c03 	mvn	r2, #768	; 0x300
  102250:	e5123097 	ldr	r3, [r2, #-151]
  102254:	e3130008 	tst	r3, #8	; 0x8
  102258:	0afffffc 	beq	102250 <AT91F_LowLevelInit+0x88>
  10225c:	e49df004 	ldr	pc, [sp], #4

00102260 <AT91F_AIC_ConfigureIt>:
  102260:	e92d4010 	stmdb	sp!, {r4, lr}
  102264:	e3a0e001 	mov	lr, #1	; 0x1
  102268:	e1a0e01e 	mov	lr, lr, lsl r0
  10226c:	e1a0c100 	mov	ip, r0, lsl #2
  102270:	e51c0f80 	ldr	r0, [ip, #-3968]
  102274:	e1822001 	orr	r2, r2, r1
  102278:	e24c4a01 	sub	r4, ip, #4096	; 0x1000
  10227c:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  102280:	e1a00003 	mov	r0, r3
  102284:	e581e025 	str	lr, [r1, #37]
  102288:	e50c3f80 	str	r3, [ip, #-3968]
  10228c:	e5842000 	str	r2, [r4]
  102290:	e581e029 	str	lr, [r1, #41]
  102294:	e8bd8010 	ldmia	sp!, {r4, pc}

00102298 <AT91F_PDC_SendFrame>:
  102298:	e1a0c000 	mov	ip, r0
  10229c:	e590000c 	ldr	r0, [r0, #12]
  1022a0:	e3500000 	cmp	r0, #0	; 0x0
  1022a4:	e3a00002 	mov	r0, #2	; 0x2
  1022a8:	1a000005 	bne	1022c4 <AT91F_PDC_SendFrame+0x2c>
  1022ac:	e58c1008 	str	r1, [ip, #8]
  1022b0:	e58c200c 	str	r2, [ip, #12]
  1022b4:	e58c3018 	str	r3, [ip, #24]
  1022b8:	e59d3000 	ldr	r3, [sp]
  1022bc:	e58c301c 	str	r3, [ip, #28]
  1022c0:	e12fff1e 	bx	lr
  1022c4:	e59c301c 	ldr	r3, [ip, #28]
  1022c8:	e3530000 	cmp	r3, #0	; 0x0
  1022cc:	e3a00000 	mov	r0, #0	; 0x0
  1022d0:	03a00001 	moveq	r0, #1	; 0x1
  1022d4:	058c1018 	streq	r1, [ip, #24]
  1022d8:	058c201c 	streq	r2, [ip, #28]
  1022dc:	e12fff1e 	bx	lr

001022e0 <AT91F_PDC_ReceiveFrame>:
  1022e0:	e1a0c000 	mov	ip, r0
  1022e4:	e5900004 	ldr	r0, [r0, #4]
  1022e8:	e3500000 	cmp	r0, #0	; 0x0
  1022ec:	e3a00002 	mov	r0, #2	; 0x2
  1022f0:	1a000005 	bne	10230c <AT91F_PDC_ReceiveFrame+0x2c>
  1022f4:	e58c1000 	str	r1, [ip]
  1022f8:	e58c2004 	str	r2, [ip, #4]
  1022fc:	e58c3010 	str	r3, [ip, #16]
  102300:	e59d3000 	ldr	r3, [sp]
  102304:	e58c3014 	str	r3, [ip, #20]
  102308:	e12fff1e 	bx	lr
  10230c:	e59c3014 	ldr	r3, [ip, #20]
  102310:	e3530000 	cmp	r3, #0	; 0x0
  102314:	e3a00000 	mov	r0, #0	; 0x0
  102318:	03a00001 	moveq	r0, #1	; 0x1
  10231c:	058c1010 	streq	r1, [ip, #16]
  102320:	058c2014 	streq	r2, [ip, #20]
  102324:	e12fff1e 	bx	lr

00102328 <vListInitialise>:
  102328:	e3e03000 	mvn	r3, #0	; 0x0
  10232c:	e5803008 	str	r3, [r0, #8]
  102330:	e2802008 	add	r2, r0, #8	; 0x8
  102334:	e2833001 	add	r3, r3, #1	; 0x1
  102338:	e580200c 	str	r2, [r0, #12]
  10233c:	e5802010 	str	r2, [r0, #16]
  102340:	e5802004 	str	r2, [r0, #4]
  102344:	e5803000 	str	r3, [r0]
  102348:	e12fff1e 	bx	lr

0010234c <vListInitialiseItem>:
  10234c:	e3a03000 	mov	r3, #0	; 0x0
  102350:	e5803010 	str	r3, [r0, #16]
  102354:	e12fff1e 	bx	lr

00102358 <vListInsertEnd>:
  102358:	e5902004 	ldr	r2, [r0, #4]
  10235c:	e5923004 	ldr	r3, [r2, #4]
  102360:	e5813004 	str	r3, [r1, #4]
  102364:	e592c004 	ldr	ip, [r2, #4]
  102368:	e5812008 	str	r2, [r1, #8]
  10236c:	e58c1008 	str	r1, [ip, #8]
  102370:	e5821004 	str	r1, [r2, #4]
  102374:	e5903000 	ldr	r3, [r0]
  102378:	e2833001 	add	r3, r3, #1	; 0x1
  10237c:	e5803000 	str	r3, [r0]
  102380:	e5810010 	str	r0, [r1, #16]
  102384:	e5801004 	str	r1, [r0, #4]
  102388:	e12fff1e 	bx	lr

0010238c <vListInsert>:
  10238c:	e52de004 	str	lr, [sp, #-4]!
  102390:	e591e000 	ldr	lr, [r1]
  102394:	e37e0001 	cmn	lr, #1	; 0x1
  102398:	0590c010 	ldreq	ip, [r0, #16]
  10239c:	0a000009 	beq	1023c8 <vListInsert+0x3c>
  1023a0:	e280c008 	add	ip, r0, #8	; 0x8
  1023a4:	e59c3004 	ldr	r3, [ip, #4]
  1023a8:	e5932000 	ldr	r2, [r3]
  1023ac:	e15e0002 	cmp	lr, r2
  1023b0:	3a000004 	bcc	1023c8 <vListInsert+0x3c>
  1023b4:	e59cc004 	ldr	ip, [ip, #4]
  1023b8:	e59c3004 	ldr	r3, [ip, #4]
  1023bc:	e5932000 	ldr	r2, [r3]
  1023c0:	e15e0002 	cmp	lr, r2
  1023c4:	2afffffa 	bcs	1023b4 <vListInsert+0x28>
  1023c8:	e59c3004 	ldr	r3, [ip, #4]
  1023cc:	e5831008 	str	r1, [r3, #8]
  1023d0:	e5813004 	str	r3, [r1, #4]
  1023d4:	e58c1004 	str	r1, [ip, #4]
  1023d8:	e5903000 	ldr	r3, [r0]
  1023dc:	e2833001 	add	r3, r3, #1	; 0x1
  1023e0:	e5803000 	str	r3, [r0]
  1023e4:	e5810010 	str	r0, [r1, #16]
  1023e8:	e581c008 	str	ip, [r1, #8]
  1023ec:	e49df004 	ldr	pc, [sp], #4

001023f0 <vListRemove>:
  1023f0:	e5903004 	ldr	r3, [r0, #4]
  1023f4:	e5902008 	ldr	r2, [r0, #8]
  1023f8:	e5832008 	str	r2, [r3, #8]
  1023fc:	e5902008 	ldr	r2, [r0, #8]
  102400:	e5901010 	ldr	r1, [r0, #16]
  102404:	e5823004 	str	r3, [r2, #4]
  102408:	e5913004 	ldr	r3, [r1, #4]
  10240c:	e1530000 	cmp	r3, r0
  102410:	e5913000 	ldr	r3, [r1]
  102414:	05812004 	streq	r2, [r1, #4]
  102418:	e2433001 	sub	r3, r3, #1	; 0x1
  10241c:	e3a02000 	mov	r2, #0	; 0x0
  102420:	e5802010 	str	r2, [r0, #16]
  102424:	e5813000 	str	r3, [r1]
  102428:	e12fff1e 	bx	lr

0010242c <uxQueueMessagesWaiting>:
  10242c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102430:	e1a04000 	mov	r4, r0
  102434:	eb0004de 	bl	1037b4 <vPortEnterCritical>
  102438:	e5945038 	ldr	r5, [r4, #56]
  10243c:	eb0004e7 	bl	1037e0 <vPortExitCritical>
  102440:	e1a00005 	mov	r0, r5
  102444:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00102448 <prvCopyDataFromQueue>:
  102448:	e92d4010 	stmdb	sp!, {r4, lr}
  10244c:	e5904000 	ldr	r4, [r0]
  102450:	e3540000 	cmp	r4, #0	; 0x0
  102454:	e1a0e000 	mov	lr, r0
  102458:	e1a00001 	mov	r0, r1
  10245c:	08bd8010 	ldmeqia	sp!, {r4, pc}
  102460:	e59ec00c 	ldr	ip, [lr, #12]
  102464:	e59e3040 	ldr	r3, [lr, #64]
  102468:	e59e1004 	ldr	r1, [lr, #4]
  10246c:	e08cc003 	add	ip, ip, r3
  102470:	e15c0001 	cmp	ip, r1
  102474:	e58ec00c 	str	ip, [lr, #12]
  102478:	21a0c004 	movcs	ip, r4
  10247c:	e1a02003 	mov	r2, r3
  102480:	e1a0100c 	mov	r1, ip
  102484:	258ec00c 	strcs	ip, [lr, #12]
  102488:	e8bd4010 	ldmia	sp!, {r4, lr}
  10248c:	eafff98a 	b	100abc <memcpy>

00102490 <prvCopyDataToQueue>:
  102490:	e5903040 	ldr	r3, [r0, #64]
  102494:	e3530000 	cmp	r3, #0	; 0x0
  102498:	e92d4010 	stmdb	sp!, {r4, lr}
  10249c:	e1a04000 	mov	r4, r0
  1024a0:	e1a00002 	mov	r0, r2
  1024a4:	0a00000e 	beq	1024e4 <prvCopyDataToQueue+0x54>
  1024a8:	e3500000 	cmp	r0, #0	; 0x0
  1024ac:	e1a02003 	mov	r2, r3
  1024b0:	0a00000f 	beq	1024f4 <prvCopyDataToQueue+0x64>
  1024b4:	e1a02003 	mov	r2, r3
  1024b8:	e594000c 	ldr	r0, [r4, #12]
  1024bc:	ebfff97e 	bl	100abc <memcpy>
  1024c0:	e594300c 	ldr	r3, [r4, #12]
  1024c4:	e5941040 	ldr	r1, [r4, #64]
  1024c8:	e5942000 	ldr	r2, [r4]
  1024cc:	e0613003 	rsb	r3, r1, r3
  1024d0:	e1530002 	cmp	r3, r2
  1024d4:	e584300c 	str	r3, [r4, #12]
  1024d8:	35943004 	ldrcc	r3, [r4, #4]
  1024dc:	30613003 	rsbcc	r3, r1, r3
  1024e0:	3584300c 	strcc	r3, [r4, #12]
  1024e4:	e5943038 	ldr	r3, [r4, #56]
  1024e8:	e2833001 	add	r3, r3, #1	; 0x1
  1024ec:	e5843038 	str	r3, [r4, #56]
  1024f0:	e8bd8010 	ldmia	sp!, {r4, pc}
  1024f4:	e5940008 	ldr	r0, [r4, #8]
  1024f8:	ebfff96f 	bl	100abc <memcpy>
  1024fc:	e5943008 	ldr	r3, [r4, #8]
  102500:	e5942040 	ldr	r2, [r4, #64]
  102504:	e5941004 	ldr	r1, [r4, #4]
  102508:	e0833002 	add	r3, r3, r2
  10250c:	e1530001 	cmp	r3, r1
  102510:	e5843008 	str	r3, [r4, #8]
  102514:	25943000 	ldrcs	r3, [r4]
  102518:	25843008 	strcs	r3, [r4, #8]
  10251c:	e5943038 	ldr	r3, [r4, #56]
  102520:	e2833001 	add	r3, r3, #1	; 0x1
  102524:	e5843038 	str	r3, [r4, #56]
  102528:	e8bd8010 	ldmia	sp!, {r4, pc}

0010252c <xQueueGenericSendFromISR>:
  10252c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102530:	e590c038 	ldr	ip, [r0, #56]
  102534:	e590e03c 	ldr	lr, [r0, #60]
  102538:	e15c000e 	cmp	ip, lr
  10253c:	e1a05002 	mov	r5, r2
  102540:	e1a04000 	mov	r4, r0
  102544:	e3a0c000 	mov	ip, #0	; 0x0
  102548:	e1a02003 	mov	r2, r3
  10254c:	3a000001 	bcc	102558 <xQueueGenericSendFromISR+0x2c>
  102550:	e1a0000c 	mov	r0, ip
  102554:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  102558:	ebffffcc 	bl	102490 <prvCopyDataToQueue>
  10255c:	e5943048 	ldr	r3, [r4, #72]
  102560:	e3730001 	cmn	r3, #1	; 0x1
  102564:	e2833001 	add	r3, r3, #1	; 0x1
  102568:	e3a0c001 	mov	ip, #1	; 0x1
  10256c:	15843048 	strne	r3, [r4, #72]
  102570:	1afffff6 	bne	102550 <xQueueGenericSendFromISR+0x24>
  102574:	e5943024 	ldr	r3, [r4, #36]
  102578:	e3530000 	cmp	r3, #0	; 0x0
  10257c:	e2840024 	add	r0, r4, #36	; 0x24
  102580:	1a000001 	bne	10258c <xQueueGenericSendFromISR+0x60>
  102584:	e3a0c001 	mov	ip, #1	; 0x1
  102588:	eafffff0 	b	102550 <xQueueGenericSendFromISR+0x24>
  10258c:	eb0001a4 	bl	102c24 <xTaskRemoveFromEventList>
  102590:	e3a03001 	mov	r3, #1	; 0x1
  102594:	e3500000 	cmp	r0, #0	; 0x0
  102598:	e1a0c003 	mov	ip, r3
  10259c:	15853000 	strne	r3, [r5]
  1025a0:	1affffea 	bne	102550 <xQueueGenericSendFromISR+0x24>
  1025a4:	eafffff6 	b	102584 <xQueueGenericSendFromISR+0x58>

001025a8 <prvUnlockQueue>:
  1025a8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1025ac:	e1a04000 	mov	r4, r0
  1025b0:	eb00047f 	bl	1037b4 <vPortEnterCritical>
  1025b4:	e5943048 	ldr	r3, [r4, #72]
  1025b8:	e3530000 	cmp	r3, #0	; 0x0
  1025bc:	da000016 	ble	10261c <prvUnlockQueue+0x74>
  1025c0:	e5943024 	ldr	r3, [r4, #36]
  1025c4:	e3530000 	cmp	r3, #0	; 0x0
  1025c8:	12845024 	addne	r5, r4, #36	; 0x24
  1025cc:	1a000008 	bne	1025f4 <prvUnlockQueue+0x4c>
  1025d0:	ea000011 	b	10261c <prvUnlockQueue+0x74>
  1025d4:	e5943048 	ldr	r3, [r4, #72]
  1025d8:	e2433001 	sub	r3, r3, #1	; 0x1
  1025dc:	e3530000 	cmp	r3, #0	; 0x0
  1025e0:	e5843048 	str	r3, [r4, #72]
  1025e4:	da00000c 	ble	10261c <prvUnlockQueue+0x74>
  1025e8:	e5943024 	ldr	r3, [r4, #36]
  1025ec:	e3530000 	cmp	r3, #0	; 0x0
  1025f0:	0a000009 	beq	10261c <prvUnlockQueue+0x74>
  1025f4:	e1a00005 	mov	r0, r5
  1025f8:	eb000189 	bl	102c24 <xTaskRemoveFromEventList>
  1025fc:	e3500000 	cmp	r0, #0	; 0x0
  102600:	0afffff3 	beq	1025d4 <prvUnlockQueue+0x2c>
  102604:	eb000140 	bl	102b0c <vTaskMissedYield>
  102608:	e5943048 	ldr	r3, [r4, #72]
  10260c:	e2433001 	sub	r3, r3, #1	; 0x1
  102610:	e3530000 	cmp	r3, #0	; 0x0
  102614:	e5843048 	str	r3, [r4, #72]
  102618:	cafffff2 	bgt	1025e8 <prvUnlockQueue+0x40>
  10261c:	e3e03000 	mvn	r3, #0	; 0x0
  102620:	e5843048 	str	r3, [r4, #72]
  102624:	eb00046d 	bl	1037e0 <vPortExitCritical>
  102628:	eb000461 	bl	1037b4 <vPortEnterCritical>
  10262c:	e5943044 	ldr	r3, [r4, #68]
  102630:	e3530000 	cmp	r3, #0	; 0x0
  102634:	da000016 	ble	102694 <prvUnlockQueue+0xec>
  102638:	e5943010 	ldr	r3, [r4, #16]
  10263c:	e3530000 	cmp	r3, #0	; 0x0
  102640:	12845010 	addne	r5, r4, #16	; 0x10
  102644:	1a000008 	bne	10266c <prvUnlockQueue+0xc4>
  102648:	ea000011 	b	102694 <prvUnlockQueue+0xec>
  10264c:	e5943044 	ldr	r3, [r4, #68]
  102650:	e2433001 	sub	r3, r3, #1	; 0x1
  102654:	e3530000 	cmp	r3, #0	; 0x0
  102658:	e5843044 	str	r3, [r4, #68]
  10265c:	da00000c 	ble	102694 <prvUnlockQueue+0xec>
  102660:	e5943010 	ldr	r3, [r4, #16]
  102664:	e3530000 	cmp	r3, #0	; 0x0
  102668:	0a000009 	beq	102694 <prvUnlockQueue+0xec>
  10266c:	e1a00005 	mov	r0, r5
  102670:	eb00016b 	bl	102c24 <xTaskRemoveFromEventList>
  102674:	e3500000 	cmp	r0, #0	; 0x0
  102678:	0afffff3 	beq	10264c <prvUnlockQueue+0xa4>
  10267c:	eb000122 	bl	102b0c <vTaskMissedYield>
  102680:	e5943044 	ldr	r3, [r4, #68]
  102684:	e2433001 	sub	r3, r3, #1	; 0x1
  102688:	e3530000 	cmp	r3, #0	; 0x0
  10268c:	e5843044 	str	r3, [r4, #68]
  102690:	cafffff2 	bgt	102660 <prvUnlockQueue+0xb8>
  102694:	e3e03000 	mvn	r3, #0	; 0x0
  102698:	e5843044 	str	r3, [r4, #68]
  10269c:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  1026a0:	ea00044e 	b	1037e0 <vPortExitCritical>

001026a4 <xQueueGenericReceive>:
  1026a4:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  1026a8:	e1a05000 	mov	r5, r0
  1026ac:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1026b0:	e1a06001 	mov	r6, r1
  1026b4:	e1a07003 	mov	r7, r3
  1026b8:	e3a04001 	mov	r4, #1	; 0x1
  1026bc:	e58d2000 	str	r2, [sp]
  1026c0:	ea00000d 	b	1026fc <xQueueGenericReceive+0x58>
  1026c4:	eb00043a 	bl	1037b4 <vPortEnterCritical>
  1026c8:	e5953038 	ldr	r3, [r5, #56]
  1026cc:	e3530000 	cmp	r3, #0	; 0x0
  1026d0:	1a000030 	bne	102798 <xQueueGenericReceive+0xf4>
  1026d4:	eb000441 	bl	1037e0 <vPortExitCritical>
  1026d8:	e59d3000 	ldr	r3, [sp]
  1026dc:	e3530000 	cmp	r3, #0	; 0x0
  1026e0:	0a000040 	beq	1027e8 <xQueueGenericReceive+0x144>
  1026e4:	e28d0004 	add	r0, sp, #4	; 0x4
  1026e8:	e1a0100d 	mov	r1, sp
  1026ec:	eb00010b 	bl	102b20 <xTaskCheckForTimeOut>
  1026f0:	e3500000 	cmp	r0, #0	; 0x0
  1026f4:	e3e04000 	mvn	r4, #0	; 0x0
  1026f8:	1a00003a 	bne	1027e8 <xQueueGenericReceive+0x144>
  1026fc:	e59d3000 	ldr	r3, [sp]
  102700:	e3530000 	cmp	r3, #0	; 0x0
  102704:	0affffee 	beq	1026c4 <xQueueGenericReceive+0x20>
  102708:	eb00013c 	bl	102c00 <vTaskSuspendAll>
  10270c:	eb000428 	bl	1037b4 <vPortEnterCritical>
  102710:	e5953044 	ldr	r3, [r5, #68]
  102714:	e3730001 	cmn	r3, #1	; 0x1
  102718:	02833001 	addeq	r3, r3, #1	; 0x1
  10271c:	05853044 	streq	r3, [r5, #68]
  102720:	e5953048 	ldr	r3, [r5, #72]
  102724:	e3730001 	cmn	r3, #1	; 0x1
  102728:	02833001 	addeq	r3, r3, #1	; 0x1
  10272c:	05853048 	streq	r3, [r5, #72]
  102730:	eb00042a 	bl	1037e0 <vPortExitCritical>
  102734:	e3540001 	cmp	r4, #1	; 0x1
  102738:	0a00002d 	beq	1027f4 <xQueueGenericReceive+0x150>
  10273c:	eb00041c 	bl	1037b4 <vPortEnterCritical>
  102740:	e5954038 	ldr	r4, [r5, #56]
  102744:	eb000425 	bl	1037e0 <vPortExitCritical>
  102748:	e3540000 	cmp	r4, #0	; 0x0
  10274c:	1a000021 	bne	1027d8 <xQueueGenericReceive+0x134>
  102750:	e28d0004 	add	r0, sp, #4	; 0x4
  102754:	e1a0100d 	mov	r1, sp
  102758:	eb0000f0 	bl	102b20 <xTaskCheckForTimeOut>
  10275c:	e3500000 	cmp	r0, #0	; 0x0
  102760:	1a00001c 	bne	1027d8 <xQueueGenericReceive+0x134>
  102764:	e59d1000 	ldr	r1, [sp]
  102768:	e2850024 	add	r0, r5, #36	; 0x24
  10276c:	eb0001b0 	bl	102e34 <vTaskPlaceOnEventList>
  102770:	e1a00005 	mov	r0, r5
  102774:	ebffff8b 	bl	1025a8 <prvUnlockQueue>
  102778:	eb00027d 	bl	103174 <xTaskResumeAll>
  10277c:	e3500000 	cmp	r0, #0	; 0x0
  102780:	1affffcf 	bne	1026c4 <xQueueGenericReceive+0x20>
  102784:	ef000000 	swi	0x00000000
  102788:	eb000409 	bl	1037b4 <vPortEnterCritical>
  10278c:	e5953038 	ldr	r3, [r5, #56]
  102790:	e3530000 	cmp	r3, #0	; 0x0
  102794:	0affffce 	beq	1026d4 <xQueueGenericReceive+0x30>
  102798:	e1a01006 	mov	r1, r6
  10279c:	e1a00005 	mov	r0, r5
  1027a0:	e595400c 	ldr	r4, [r5, #12]
  1027a4:	ebffff27 	bl	102448 <prvCopyDataFromQueue>
  1027a8:	e3570000 	cmp	r7, #0	; 0x0
  1027ac:	0a000013 	beq	102800 <xQueueGenericReceive+0x15c>
  1027b0:	e5953024 	ldr	r3, [r5, #36]
  1027b4:	e3530000 	cmp	r3, #0	; 0x0
  1027b8:	e585400c 	str	r4, [r5, #12]
  1027bc:	0a000015 	beq	102818 <xQueueGenericReceive+0x174>
  1027c0:	e2850024 	add	r0, r5, #36	; 0x24
  1027c4:	eb000116 	bl	102c24 <xTaskRemoveFromEventList>
  1027c8:	e3500000 	cmp	r0, #0	; 0x0
  1027cc:	0a000011 	beq	102818 <xQueueGenericReceive+0x174>
  1027d0:	ef000000 	swi	0x00000000
  1027d4:	ea00000f 	b	102818 <xQueueGenericReceive+0x174>
  1027d8:	e1a00005 	mov	r0, r5
  1027dc:	ebffff71 	bl	1025a8 <prvUnlockQueue>
  1027e0:	eb000263 	bl	103174 <xTaskResumeAll>
  1027e4:	eaffffb6 	b	1026c4 <xQueueGenericReceive+0x20>
  1027e8:	e3a00000 	mov	r0, #0	; 0x0
  1027ec:	e28dd00c 	add	sp, sp, #12	; 0xc
  1027f0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1027f4:	e28d0004 	add	r0, sp, #4	; 0x4
  1027f8:	eb0000bb 	bl	102aec <vTaskSetTimeOutState>
  1027fc:	eaffffce 	b	10273c <xQueueGenericReceive+0x98>
  102800:	e5953038 	ldr	r3, [r5, #56]
  102804:	e2433001 	sub	r3, r3, #1	; 0x1
  102808:	e5853038 	str	r3, [r5, #56]
  10280c:	e5952010 	ldr	r2, [r5, #16]
  102810:	e3520000 	cmp	r2, #0	; 0x0
  102814:	1a000002 	bne	102824 <xQueueGenericReceive+0x180>
  102818:	eb0003f0 	bl	1037e0 <vPortExitCritical>
  10281c:	e3a00001 	mov	r0, #1	; 0x1
  102820:	eafffff1 	b	1027ec <xQueueGenericReceive+0x148>
  102824:	e2850010 	add	r0, r5, #16	; 0x10
  102828:	eb0000fd 	bl	102c24 <xTaskRemoveFromEventList>
  10282c:	e3500001 	cmp	r0, #1	; 0x1
  102830:	1afffff8 	bne	102818 <xQueueGenericReceive+0x174>
  102834:	ef000000 	swi	0x00000000
  102838:	eafffff6 	b	102818 <xQueueGenericReceive+0x174>

0010283c <xQueueGenericSend>:
  10283c:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  102840:	e1a06000 	mov	r6, r0
  102844:	e24dd00c 	sub	sp, sp, #12	; 0xc
  102848:	e1a07001 	mov	r7, r1
  10284c:	e1a08003 	mov	r8, r3
  102850:	e3a04001 	mov	r4, #1	; 0x1
  102854:	e58d2000 	str	r2, [sp]
  102858:	ea00000e 	b	102898 <xQueueGenericSend+0x5c>
  10285c:	eb0003d4 	bl	1037b4 <vPortEnterCritical>
  102860:	e5962038 	ldr	r2, [r6, #56]
  102864:	e596303c 	ldr	r3, [r6, #60]
  102868:	e1520003 	cmp	r2, r3
  10286c:	3a000032 	bcc	10293c <xQueueGenericSend+0x100>
  102870:	eb0003da 	bl	1037e0 <vPortExitCritical>
  102874:	e59d3000 	ldr	r3, [sp]
  102878:	e3530000 	cmp	r3, #0	; 0x0
  10287c:	0a00003c 	beq	102974 <xQueueGenericSend+0x138>
  102880:	e28d0004 	add	r0, sp, #4	; 0x4
  102884:	e1a0100d 	mov	r1, sp
  102888:	eb0000a4 	bl	102b20 <xTaskCheckForTimeOut>
  10288c:	e3500000 	cmp	r0, #0	; 0x0
  102890:	e3e04000 	mvn	r4, #0	; 0x0
  102894:	1a000036 	bne	102974 <xQueueGenericSend+0x138>
  102898:	e59d3000 	ldr	r3, [sp]
  10289c:	e3530000 	cmp	r3, #0	; 0x0
  1028a0:	0affffed 	beq	10285c <xQueueGenericSend+0x20>
  1028a4:	eb0000d5 	bl	102c00 <vTaskSuspendAll>
  1028a8:	eb0003c1 	bl	1037b4 <vPortEnterCritical>
  1028ac:	e5963044 	ldr	r3, [r6, #68]
  1028b0:	e3730001 	cmn	r3, #1	; 0x1
  1028b4:	02833001 	addeq	r3, r3, #1	; 0x1
  1028b8:	05863044 	streq	r3, [r6, #68]
  1028bc:	e5963048 	ldr	r3, [r6, #72]
  1028c0:	e3730001 	cmn	r3, #1	; 0x1
  1028c4:	02833001 	addeq	r3, r3, #1	; 0x1
  1028c8:	05863048 	streq	r3, [r6, #72]
  1028cc:	eb0003c3 	bl	1037e0 <vPortExitCritical>
  1028d0:	e3540001 	cmp	r4, #1	; 0x1
  1028d4:	0a000029 	beq	102980 <xQueueGenericSend+0x144>
  1028d8:	eb0003b5 	bl	1037b4 <vPortEnterCritical>
  1028dc:	e5965038 	ldr	r5, [r6, #56]
  1028e0:	e596403c 	ldr	r4, [r6, #60]
  1028e4:	eb0003bd 	bl	1037e0 <vPortExitCritical>
  1028e8:	e1550004 	cmp	r5, r4
  1028ec:	1a00001c 	bne	102964 <xQueueGenericSend+0x128>
  1028f0:	e28d0004 	add	r0, sp, #4	; 0x4
  1028f4:	e1a0100d 	mov	r1, sp
  1028f8:	eb000088 	bl	102b20 <xTaskCheckForTimeOut>
  1028fc:	e3500000 	cmp	r0, #0	; 0x0
  102900:	1a000017 	bne	102964 <xQueueGenericSend+0x128>
  102904:	e59d1000 	ldr	r1, [sp]
  102908:	e2860010 	add	r0, r6, #16	; 0x10
  10290c:	eb000148 	bl	102e34 <vTaskPlaceOnEventList>
  102910:	e1a00006 	mov	r0, r6
  102914:	ebffff23 	bl	1025a8 <prvUnlockQueue>
  102918:	eb000215 	bl	103174 <xTaskResumeAll>
  10291c:	e3500000 	cmp	r0, #0	; 0x0
  102920:	1affffcd 	bne	10285c <xQueueGenericSend+0x20>
  102924:	ef000000 	swi	0x00000000
  102928:	eb0003a1 	bl	1037b4 <vPortEnterCritical>
  10292c:	e5962038 	ldr	r2, [r6, #56]
  102930:	e596303c 	ldr	r3, [r6, #60]
  102934:	e1520003 	cmp	r2, r3
  102938:	2affffcc 	bcs	102870 <xQueueGenericSend+0x34>
  10293c:	e1a01007 	mov	r1, r7
  102940:	e1a02008 	mov	r2, r8
  102944:	e1a00006 	mov	r0, r6
  102948:	ebfffed0 	bl	102490 <prvCopyDataToQueue>
  10294c:	e5963024 	ldr	r3, [r6, #36]
  102950:	e3530000 	cmp	r3, #0	; 0x0
  102954:	1a00000c 	bne	10298c <xQueueGenericSend+0x150>
  102958:	eb0003a0 	bl	1037e0 <vPortExitCritical>
  10295c:	e3a00001 	mov	r0, #1	; 0x1
  102960:	ea000004 	b	102978 <xQueueGenericSend+0x13c>
  102964:	e1a00006 	mov	r0, r6
  102968:	ebffff0e 	bl	1025a8 <prvUnlockQueue>
  10296c:	eb000200 	bl	103174 <xTaskResumeAll>
  102970:	eaffffb9 	b	10285c <xQueueGenericSend+0x20>
  102974:	e3a00000 	mov	r0, #0	; 0x0
  102978:	e28dd00c 	add	sp, sp, #12	; 0xc
  10297c:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  102980:	e28d0004 	add	r0, sp, #4	; 0x4
  102984:	eb000058 	bl	102aec <vTaskSetTimeOutState>
  102988:	eaffffd2 	b	1028d8 <xQueueGenericSend+0x9c>
  10298c:	e2860024 	add	r0, r6, #36	; 0x24
  102990:	eb0000a3 	bl	102c24 <xTaskRemoveFromEventList>
  102994:	e3500001 	cmp	r0, #1	; 0x1
  102998:	1affffee 	bne	102958 <xQueueGenericSend+0x11c>
  10299c:	ef000000 	swi	0x00000000
  1029a0:	eaffffec 	b	102958 <xQueueGenericSend+0x11c>

001029a4 <xQueueCreate>:
  1029a4:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  1029a8:	e2507000 	subs	r7, r0, #0	; 0x0
  1029ac:	e1a06001 	mov	r6, r1
  1029b0:	e3a0004c 	mov	r0, #76	; 0x4c
  1029b4:	1a000002 	bne	1029c4 <xQueueCreate+0x20>
  1029b8:	e3a05000 	mov	r5, #0	; 0x0
  1029bc:	e1a00005 	mov	r0, r5
  1029c0:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1029c4:	eb0003f8 	bl	1039ac <pvPortMalloc>
  1029c8:	e3500000 	cmp	r0, #0	; 0x0
  1029cc:	e1a05000 	mov	r5, r0
  1029d0:	0afffff8 	beq	1029b8 <xQueueCreate+0x14>
  1029d4:	e0040796 	mul	r4, r6, r7
  1029d8:	e2840001 	add	r0, r4, #1	; 0x1
  1029dc:	eb0003f2 	bl	1039ac <pvPortMalloc>
  1029e0:	e1a08000 	mov	r8, r0
  1029e4:	e3580000 	cmp	r8, #0	; 0x0
  1029e8:	e0803004 	add	r3, r0, r4
  1029ec:	e2472001 	sub	r2, r7, #1	; 0x1
  1029f0:	e3e01000 	mvn	r1, #0	; 0x0
  1029f4:	e2850010 	add	r0, r5, #16	; 0x10
  1029f8:	e5858000 	str	r8, [r5]
  1029fc:	0a00000d 	beq	102a38 <xQueueCreate+0x94>
  102a00:	e0228296 	mla	r2, r6, r2, r8
  102a04:	e5853004 	str	r3, [r5, #4]
  102a08:	e3a03000 	mov	r3, #0	; 0x0
  102a0c:	e5853038 	str	r3, [r5, #56]
  102a10:	e585200c 	str	r2, [r5, #12]
  102a14:	e585703c 	str	r7, [r5, #60]
  102a18:	e5856040 	str	r6, [r5, #64]
  102a1c:	e5851048 	str	r1, [r5, #72]
  102a20:	e5858008 	str	r8, [r5, #8]
  102a24:	e5851044 	str	r1, [r5, #68]
  102a28:	ebfffe3e 	bl	102328 <vListInitialise>
  102a2c:	e2850024 	add	r0, r5, #36	; 0x24
  102a30:	ebfffe3c 	bl	102328 <vListInitialise>
  102a34:	eaffffe0 	b	1029bc <xQueueCreate+0x18>
  102a38:	e1a00005 	mov	r0, r5
  102a3c:	eb0003d2 	bl	10398c <vPortFree>
  102a40:	e1a05008 	mov	r5, r8
  102a44:	eaffffdc 	b	1029bc <xQueueCreate+0x18>

00102a48 <vTaskSwitchContext>:
  102a48:	e59f3088 	ldr	r3, [pc, #136]	; 102ad8 <prog+0x2a94>
  102a4c:	e5932000 	ldr	r2, [r3]
  102a50:	e3520000 	cmp	r2, #0	; 0x0
  102a54:	159f3080 	ldrne	r3, [pc, #128]	; 102adc <prog+0x2a98>
  102a58:	13a02001 	movne	r2, #1	; 0x1
  102a5c:	15832000 	strne	r2, [r3]
  102a60:	112fff1e 	bxne	lr
  102a64:	e59f1074 	ldr	r1, [pc, #116]	; 102ae0 <prog+0x2a9c>
  102a68:	e5913000 	ldr	r3, [r1]
  102a6c:	e59f0070 	ldr	r0, [pc, #112]	; 102ae4 <prog+0x2aa0>
  102a70:	e0833103 	add	r3, r3, r3, lsl #2
  102a74:	e7902103 	ldr	r2, [r0, r3, lsl #2]
  102a78:	e3520000 	cmp	r2, #0	; 0x0
  102a7c:	1a000007 	bne	102aa0 <vTaskSwitchContext+0x58>
  102a80:	e5913000 	ldr	r3, [r1]
  102a84:	e2433001 	sub	r3, r3, #1	; 0x1
  102a88:	e5813000 	str	r3, [r1]
  102a8c:	e5912000 	ldr	r2, [r1]
  102a90:	e0822102 	add	r2, r2, r2, lsl #2
  102a94:	e7903102 	ldr	r3, [r0, r2, lsl #2]
  102a98:	e3530000 	cmp	r3, #0	; 0x0
  102a9c:	0afffff7 	beq	102a80 <vTaskSwitchContext+0x38>
  102aa0:	e5913000 	ldr	r3, [r1]
  102aa4:	e0833103 	add	r3, r3, r3, lsl #2
  102aa8:	e0802103 	add	r2, r0, r3, lsl #2
  102aac:	e5921004 	ldr	r1, [r2, #4]
  102ab0:	e5911004 	ldr	r1, [r1, #4]
  102ab4:	e2823008 	add	r3, r2, #8	; 0x8
  102ab8:	e5821004 	str	r1, [r2, #4]
  102abc:	e1510003 	cmp	r1, r3
  102ac0:	05911004 	ldreq	r1, [r1, #4]
  102ac4:	e59f301c 	ldr	r3, [pc, #28]	; 102ae8 <prog+0x2aa4>
  102ac8:	05821004 	streq	r1, [r2, #4]
  102acc:	e591200c 	ldr	r2, [r1, #12]
  102ad0:	e5832000 	str	r2, [r3]
  102ad4:	e12fff1e 	bx	lr
  102ad8:	00200c54 	eoreq	r0, r0, r4, asr ip
  102adc:	00200c48 	eoreq	r0, r0, r8, asr #24
  102ae0:	00200c58 	eoreq	r0, r0, r8, asr ip
  102ae4:	00200c70 	eoreq	r0, r0, r0, ror ip
  102ae8:	00200c44 	eoreq	r0, r0, r4, asr #24

00102aec <vTaskSetTimeOutState>:
  102aec:	e59f3010 	ldr	r3, [pc, #16]	; 102b04 <prog+0x2ac0>
  102af0:	e59f2010 	ldr	r2, [pc, #16]	; 102b08 <prog+0x2ac4>
  102af4:	e5931000 	ldr	r1, [r3]
  102af8:	e5923000 	ldr	r3, [r2]
  102afc:	e880000a 	stmia	r0, {r1, r3}
  102b00:	e12fff1e 	bx	lr
  102b04:	00200c4c 	eoreq	r0, r0, ip, asr #24
  102b08:	00200c50 	eoreq	r0, r0, r0, asr ip

00102b0c <vTaskMissedYield>:
  102b0c:	e59f3008 	ldr	r3, [pc, #8]	; 102b1c <prog+0x2ad8>
  102b10:	e3a02001 	mov	r2, #1	; 0x1
  102b14:	e5832000 	str	r2, [r3]
  102b18:	e12fff1e 	bx	lr
  102b1c:	00200c48 	eoreq	r0, r0, r8, asr #24

00102b20 <xTaskCheckForTimeOut>:
  102b20:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  102b24:	e1a06001 	mov	r6, r1
  102b28:	e1a04000 	mov	r4, r0
  102b2c:	eb000320 	bl	1037b4 <vPortEnterCritical>
  102b30:	e596c000 	ldr	ip, [r6]
  102b34:	e37c0001 	cmn	ip, #1	; 0x1
  102b38:	e3a05000 	mov	r5, #0	; 0x0
  102b3c:	0a000010 	beq	102b84 <xTaskCheckForTimeOut+0x64>
  102b40:	e59f3090 	ldr	r3, [pc, #144]	; 102bd8 <prog+0x2b94>
  102b44:	e5942000 	ldr	r2, [r4]
  102b48:	e5931000 	ldr	r1, [r3]
  102b4c:	e1520001 	cmp	r2, r1
  102b50:	e59fe084 	ldr	lr, [pc, #132]	; 102bdc <prog+0x2b98>
  102b54:	0a000016 	beq	102bb4 <xTaskCheckForTimeOut+0x94>
  102b58:	e59e3000 	ldr	r3, [lr]
  102b5c:	e5941004 	ldr	r1, [r4, #4]
  102b60:	e1510003 	cmp	r1, r3
  102b64:	9a000005 	bls	102b80 <xTaskCheckForTimeOut+0x60>
  102b68:	e59e3000 	ldr	r3, [lr]
  102b6c:	e0613003 	rsb	r3, r1, r3
  102b70:	e15c0003 	cmp	ip, r3
  102b74:	e1a00004 	mov	r0, r4
  102b78:	e3a05000 	mov	r5, #0	; 0x0
  102b7c:	8a000003 	bhi	102b90 <xTaskCheckForTimeOut+0x70>
  102b80:	e3a05001 	mov	r5, #1	; 0x1
  102b84:	eb000315 	bl	1037e0 <vPortExitCritical>
  102b88:	e1a00005 	mov	r0, r5
  102b8c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  102b90:	e59f2044 	ldr	r2, [pc, #68]	; 102bdc <prog+0x2b98>
  102b94:	e5923000 	ldr	r3, [r2]
  102b98:	e0613003 	rsb	r3, r1, r3
  102b9c:	e063300c 	rsb	r3, r3, ip
  102ba0:	e5863000 	str	r3, [r6]
  102ba4:	ebffffd0 	bl	102aec <vTaskSetTimeOutState>
  102ba8:	eb00030c 	bl	1037e0 <vPortExitCritical>
  102bac:	e1a00005 	mov	r0, r5
  102bb0:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  102bb4:	e59fe020 	ldr	lr, [pc, #32]	; 102bdc <prog+0x2b98>
  102bb8:	e5941004 	ldr	r1, [r4, #4]
  102bbc:	e59e3000 	ldr	r3, [lr]
  102bc0:	e0613003 	rsb	r3, r1, r3
  102bc4:	e15c0003 	cmp	ip, r3
  102bc8:	e1a00004 	mov	r0, r4
  102bcc:	e3a05000 	mov	r5, #0	; 0x0
  102bd0:	9affffea 	bls	102b80 <xTaskCheckForTimeOut+0x60>
  102bd4:	eaffffed 	b	102b90 <xTaskCheckForTimeOut+0x70>
  102bd8:	00200c4c 	eoreq	r0, r0, ip, asr #24
  102bdc:	00200c50 	eoreq	r0, r0, r0, asr ip

00102be0 <xTaskGetTickCount>:
  102be0:	e92d4010 	stmdb	sp!, {r4, lr}
  102be4:	eb0002f2 	bl	1037b4 <vPortEnterCritical>
  102be8:	e59f300c 	ldr	r3, [pc, #12]	; 102bfc <prog+0x2bb8>
  102bec:	e5934000 	ldr	r4, [r3]
  102bf0:	eb0002fa 	bl	1037e0 <vPortExitCritical>
  102bf4:	e1a00004 	mov	r0, r4
  102bf8:	e8bd8010 	ldmia	sp!, {r4, pc}
  102bfc:	00200c50 	eoreq	r0, r0, r0, asr ip

00102c00 <vTaskSuspendAll>:
  102c00:	e52de004 	str	lr, [sp, #-4]!
  102c04:	eb0002ea 	bl	1037b4 <vPortEnterCritical>
  102c08:	e59f2010 	ldr	r2, [pc, #16]	; 102c20 <prog+0x2bdc>
  102c0c:	e5923000 	ldr	r3, [r2]
  102c10:	e2833001 	add	r3, r3, #1	; 0x1
  102c14:	e5823000 	str	r3, [r2]
  102c18:	e49de004 	ldr	lr, [sp], #4
  102c1c:	ea0002ef 	b	1037e0 <vPortExitCritical>
  102c20:	00200c54 	eoreq	r0, r0, r4, asr ip

00102c24 <xTaskRemoveFromEventList>:
  102c24:	e5903000 	ldr	r3, [r0]
  102c28:	e3530000 	cmp	r3, #0	; 0x0
  102c2c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  102c30:	e1a06003 	mov	r6, r3
  102c34:	1590300c 	ldrne	r3, [r0, #12]
  102c38:	1593600c 	ldrne	r6, [r3, #12]
  102c3c:	e2864018 	add	r4, r6, #24	; 0x18
  102c40:	e1a00004 	mov	r0, r4
  102c44:	ebfffde9 	bl	1023f0 <vListRemove>
  102c48:	e59f3064 	ldr	r3, [pc, #100]	; 102cb4 <prog+0x2c70>
  102c4c:	e5932000 	ldr	r2, [r3]
  102c50:	e2865004 	add	r5, r6, #4	; 0x4
  102c54:	e3520000 	cmp	r2, #0	; 0x0
  102c58:	e1a00005 	mov	r0, r5
  102c5c:	e1a01004 	mov	r1, r4
  102c60:	159f0050 	ldrne	r0, [pc, #80]	; 102cb8 <prog+0x2c74>
  102c64:	1a000009 	bne	102c90 <xTaskRemoveFromEventList+0x6c>
  102c68:	ebfffde0 	bl	1023f0 <vListRemove>
  102c6c:	e59fe048 	ldr	lr, [pc, #72]	; 102cbc <prog+0x2c78>
  102c70:	e596c02c 	ldr	ip, [r6, #44]
  102c74:	e59e2000 	ldr	r2, [lr]
  102c78:	e59f0040 	ldr	r0, [pc, #64]	; 102cc0 <prog+0x2c7c>
  102c7c:	e15c0002 	cmp	ip, r2
  102c80:	e08c310c 	add	r3, ip, ip, lsl #2
  102c84:	858ec000 	strhi	ip, [lr]
  102c88:	e1a01005 	mov	r1, r5
  102c8c:	e0800103 	add	r0, r0, r3, lsl #2
  102c90:	ebfffdb0 	bl	102358 <vListInsertEnd>
  102c94:	e59f3028 	ldr	r3, [pc, #40]	; 102cc4 <prog+0x2c80>
  102c98:	e5932000 	ldr	r2, [r3]
  102c9c:	e596102c 	ldr	r1, [r6, #44]
  102ca0:	e592002c 	ldr	r0, [r2, #44]
  102ca4:	e1510000 	cmp	r1, r0
  102ca8:	33a00000 	movcc	r0, #0	; 0x0
  102cac:	23a00001 	movcs	r0, #1	; 0x1
  102cb0:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  102cb4:	00200c54 	eoreq	r0, r0, r4, asr ip
  102cb8:	00200d04 	eoreq	r0, r0, r4, lsl #26
  102cbc:	00200c58 	eoreq	r0, r0, r8, asr ip
  102cc0:	00200c70 	eoreq	r0, r0, r0, ror ip
  102cc4:	00200c44 	eoreq	r0, r0, r4, asr #24

00102cc8 <vTaskIncrementTick>:
  102cc8:	e59f3144 	ldr	r3, [pc, #324]	; 102e14 <prog+0x2dd0>
  102ccc:	e5932000 	ldr	r2, [r3]
  102cd0:	e3520000 	cmp	r2, #0	; 0x0
  102cd4:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  102cd8:	1a000039 	bne	102dc4 <vTaskIncrementTick+0xfc>
  102cdc:	e59f6134 	ldr	r6, [pc, #308]	; 102e18 <prog+0x2dd4>
  102ce0:	e5963000 	ldr	r3, [r6]
  102ce4:	e2833001 	add	r3, r3, #1	; 0x1
  102ce8:	e5863000 	str	r3, [r6]
  102cec:	e5962000 	ldr	r2, [r6]
  102cf0:	e3520000 	cmp	r2, #0	; 0x0
  102cf4:	e1a0c006 	mov	ip, r6
  102cf8:	159fa11c 	ldrne	sl, [pc, #284]	; 102e1c <prog+0x2dd8>
  102cfc:	0a000035 	beq	102dd8 <vTaskIncrementTick+0x110>
  102d00:	e59a3000 	ldr	r3, [sl]
  102d04:	e5932000 	ldr	r2, [r3]
  102d08:	e3520000 	cmp	r2, #0	; 0x0
  102d0c:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102d10:	e59f3104 	ldr	r3, [pc, #260]	; 102e1c <prog+0x2dd8>
  102d14:	e5932000 	ldr	r2, [r3]
  102d18:	e592100c 	ldr	r1, [r2, #12]
  102d1c:	e591300c 	ldr	r3, [r1, #12]
  102d20:	e3530000 	cmp	r3, #0	; 0x0
  102d24:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102d28:	e1a04003 	mov	r4, r3
  102d2c:	e59c2000 	ldr	r2, [ip]
  102d30:	e5933004 	ldr	r3, [r3, #4]
  102d34:	e1530002 	cmp	r3, r2
  102d38:	959f80e0 	ldrls	r8, [pc, #224]	; 102e20 <prog+0x2ddc>
  102d3c:	959f70e0 	ldrls	r7, [pc, #224]	; 102e24 <prog+0x2de0>
  102d40:	9a000004 	bls	102d58 <vTaskIncrementTick+0x90>
  102d44:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102d48:	e5962000 	ldr	r2, [r6]
  102d4c:	e5943004 	ldr	r3, [r4, #4]
  102d50:	e1530002 	cmp	r3, r2
  102d54:	88bd85f0 	ldmhiia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102d58:	e2845004 	add	r5, r4, #4	; 0x4
  102d5c:	e1a00005 	mov	r0, r5
  102d60:	ebfffda2 	bl	1023f0 <vListRemove>
  102d64:	e5943028 	ldr	r3, [r4, #40]
  102d68:	e3530000 	cmp	r3, #0	; 0x0
  102d6c:	e2840018 	add	r0, r4, #24	; 0x18
  102d70:	1bfffd9e 	blne	1023f0 <vListRemove>
  102d74:	e594202c 	ldr	r2, [r4, #44]
  102d78:	e5983000 	ldr	r3, [r8]
  102d7c:	e1520003 	cmp	r2, r3
  102d80:	859f3098 	ldrhi	r3, [pc, #152]	; 102e20 <prog+0x2ddc>
  102d84:	e0820102 	add	r0, r2, r2, lsl #2
  102d88:	85832000 	strhi	r2, [r3]
  102d8c:	e1a01005 	mov	r1, r5
  102d90:	e0870100 	add	r0, r7, r0, lsl #2
  102d94:	ebfffd6f 	bl	102358 <vListInsertEnd>
  102d98:	e59a3000 	ldr	r3, [sl]
  102d9c:	e5932000 	ldr	r2, [r3]
  102da0:	e3520000 	cmp	r2, #0	; 0x0
  102da4:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102da8:	e59f306c 	ldr	r3, [pc, #108]	; 102e1c <prog+0x2dd8>
  102dac:	e5932000 	ldr	r2, [r3]
  102db0:	e592100c 	ldr	r1, [r2, #12]
  102db4:	e591300c 	ldr	r3, [r1, #12]
  102db8:	e2534000 	subs	r4, r3, #0	; 0x0
  102dbc:	1affffe1 	bne	102d48 <vTaskIncrementTick+0x80>
  102dc0:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102dc4:	e59f205c 	ldr	r2, [pc, #92]	; 102e28 <prog+0x2de4>
  102dc8:	e5923000 	ldr	r3, [r2]
  102dcc:	e2833001 	add	r3, r3, #1	; 0x1
  102dd0:	e5823000 	str	r3, [r2]
  102dd4:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102dd8:	e59fa03c 	ldr	sl, [pc, #60]	; 102e1c <prog+0x2dd8>
  102ddc:	e59f1048 	ldr	r1, [pc, #72]	; 102e2c <prog+0x2de8>
  102de0:	e59a0000 	ldr	r0, [sl]
  102de4:	e5913000 	ldr	r3, [r1]
  102de8:	e59f2040 	ldr	r2, [pc, #64]	; 102e30 <prog+0x2dec>
  102dec:	e58a3000 	str	r3, [sl]
  102df0:	e5810000 	str	r0, [r1]
  102df4:	e5923000 	ldr	r3, [r2]
  102df8:	e2833001 	add	r3, r3, #1	; 0x1
  102dfc:	e5823000 	str	r3, [r2]
  102e00:	e59a3000 	ldr	r3, [sl]
  102e04:	e5932000 	ldr	r2, [r3]
  102e08:	e3520000 	cmp	r2, #0	; 0x0
  102e0c:	1affffbf 	bne	102d10 <vTaskIncrementTick+0x48>
  102e10:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  102e14:	00200c54 	eoreq	r0, r0, r4, asr ip
  102e18:	00200c50 	eoreq	r0, r0, r0, asr ip
  102e1c:	00200cfc 	streqd	r0, [r0], -ip
  102e20:	00200c58 	eoreq	r0, r0, r8, asr ip
  102e24:	00200c70 	eoreq	r0, r0, r0, ror ip
  102e28:	00200c5c 	eoreq	r0, r0, ip, asr ip
  102e2c:	00200d00 	eoreq	r0, r0, r0, lsl #26
  102e30:	00200c4c 	eoreq	r0, r0, ip, asr #24

00102e34 <vTaskPlaceOnEventList>:
  102e34:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102e38:	e59f406c 	ldr	r4, [pc, #108]	; 102eac <prog+0x2e68>
  102e3c:	e5943000 	ldr	r3, [r4]
  102e40:	e1a05001 	mov	r5, r1
  102e44:	e2831018 	add	r1, r3, #24	; 0x18
  102e48:	ebfffd4f 	bl	10238c <vListInsert>
  102e4c:	e5940000 	ldr	r0, [r4]
  102e50:	e2800004 	add	r0, r0, #4	; 0x4
  102e54:	ebfffd65 	bl	1023f0 <vListRemove>
  102e58:	e3750001 	cmn	r5, #1	; 0x1
  102e5c:	e59f004c 	ldr	r0, [pc, #76]	; 102eb0 <prog+0x2e6c>
  102e60:	e59f204c 	ldr	r2, [pc, #76]	; 102eb4 <prog+0x2e70>
  102e64:	0a00000c 	beq	102e9c <vTaskPlaceOnEventList+0x68>
  102e68:	e5923000 	ldr	r3, [r2]
  102e6c:	e5941000 	ldr	r1, [r4]
  102e70:	e5922000 	ldr	r2, [r2]
  102e74:	e0853003 	add	r3, r5, r3
  102e78:	e1530002 	cmp	r3, r2
  102e7c:	e5813004 	str	r3, [r1, #4]
  102e80:	359f3030 	ldrcc	r3, [pc, #48]	; 102eb8 <prog+0x2e74>
  102e84:	259f3030 	ldrcs	r3, [pc, #48]	; 102ebc <prog+0x2e78>
  102e88:	e5930000 	ldr	r0, [r3]
  102e8c:	e5941000 	ldr	r1, [r4]
  102e90:	e2811004 	add	r1, r1, #4	; 0x4
  102e94:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  102e98:	eafffd3b 	b	10238c <vListInsert>
  102e9c:	e5941000 	ldr	r1, [r4]
  102ea0:	e2811004 	add	r1, r1, #4	; 0x4
  102ea4:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  102ea8:	eafffd2a 	b	102358 <vListInsertEnd>
  102eac:	00200c44 	eoreq	r0, r0, r4, asr #24
  102eb0:	00200d2c 	eoreq	r0, r0, ip, lsr #26
  102eb4:	00200c50 	eoreq	r0, r0, r0, asr ip
  102eb8:	00200d00 	eoreq	r0, r0, r0, lsl #26
  102ebc:	00200cfc 	streqd	r0, [r0], -ip

00102ec0 <xTaskCreate>:
  102ec0:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  102ec4:	e1a02802 	mov	r2, r2, lsl #16
  102ec8:	e1a0a000 	mov	sl, r0
  102ecc:	e3a00044 	mov	r0, #68	; 0x44
  102ed0:	e1a05001 	mov	r5, r1
  102ed4:	e1a08003 	mov	r8, r3
  102ed8:	e1a07822 	mov	r7, r2, lsr #16
  102edc:	e59db024 	ldr	fp, [sp, #36]
  102ee0:	eb0002b1 	bl	1039ac <pvPortMalloc>
  102ee4:	e2506000 	subs	r6, r0, #0	; 0x0
  102ee8:	02400001 	subeq	r0, r0, #1	; 0x1
  102eec:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102ef0:	e1a04107 	mov	r4, r7, lsl #2
  102ef4:	e1a00004 	mov	r0, r4
  102ef8:	eb0002ab 	bl	1039ac <pvPortMalloc>
  102efc:	e3500000 	cmp	r0, #0	; 0x0
  102f00:	e5860030 	str	r0, [r6, #48]
  102f04:	0a00006b 	beq	1030b8 <xTaskCreate+0x1f8>
  102f08:	e1a02004 	mov	r2, r4
  102f0c:	e3a010a5 	mov	r1, #165	; 0xa5
  102f10:	ebfff711 	bl	100b5c <memset>
  102f14:	e1a01005 	mov	r1, r5
  102f18:	e3a02010 	mov	r2, #16	; 0x10
  102f1c:	e2860034 	add	r0, r6, #52	; 0x34
  102f20:	ebfff735 	bl	100bfc <strncpy>
  102f24:	e35b0004 	cmp	fp, #4	; 0x4
  102f28:	31a0400b 	movcc	r4, fp
  102f2c:	23a04004 	movcs	r4, #4	; 0x4
  102f30:	e3a03000 	mov	r3, #0	; 0x0
  102f34:	e2869004 	add	r9, r6, #4	; 0x4
  102f38:	e5c63043 	strb	r3, [r6, #67]
  102f3c:	e586402c 	str	r4, [r6, #44]
  102f40:	e1a00009 	mov	r0, r9
  102f44:	ebfffd00 	bl	10234c <vListInitialiseItem>
  102f48:	e2860018 	add	r0, r6, #24	; 0x18
  102f4c:	ebfffcfe 	bl	10234c <vListInitialiseItem>
  102f50:	e5960030 	ldr	r0, [r6, #48]
  102f54:	e2644005 	rsb	r4, r4, #5	; 0x5
  102f58:	e0800107 	add	r0, r0, r7, lsl #2
  102f5c:	e1a0100a 	mov	r1, sl
  102f60:	e1a02008 	mov	r2, r8
  102f64:	e5864018 	str	r4, [r6, #24]
  102f68:	e5866010 	str	r6, [r6, #16]
  102f6c:	e5866024 	str	r6, [r6, #36]
  102f70:	e2400004 	sub	r0, r0, #4	; 0x4
  102f74:	eb000177 	bl	103558 <pxPortInitialiseStack>
  102f78:	e5860000 	str	r0, [r6]
  102f7c:	eb00020c 	bl	1037b4 <vPortEnterCritical>
  102f80:	e59f2140 	ldr	r2, [pc, #320]	; 1030c8 <prog+0x3084>
  102f84:	e5923000 	ldr	r3, [r2]
  102f88:	e2833001 	add	r3, r3, #1	; 0x1
  102f8c:	e5823000 	str	r3, [r2]
  102f90:	e5921000 	ldr	r1, [r2]
  102f94:	e3510001 	cmp	r1, #1	; 0x1
  102f98:	0a00002a 	beq	103048 <xTaskCreate+0x188>
  102f9c:	e59f7128 	ldr	r7, [pc, #296]	; 1030cc <prog+0x3088>
  102fa0:	e5973000 	ldr	r3, [r7]
  102fa4:	e3530000 	cmp	r3, #0	; 0x0
  102fa8:	0a00001c 	beq	103020 <xTaskCreate+0x160>
  102fac:	e59f811c 	ldr	r8, [pc, #284]	; 1030d0 <prog+0x308c>
  102fb0:	e59f111c 	ldr	r1, [pc, #284]	; 1030d4 <prog+0x3090>
  102fb4:	e596202c 	ldr	r2, [r6, #44]
  102fb8:	e5913000 	ldr	r3, [r1]
  102fbc:	e1520003 	cmp	r2, r3
  102fc0:	85812000 	strhi	r2, [r1]
  102fc4:	e59f110c 	ldr	r1, [pc, #268]	; 1030d8 <prog+0x3094>
  102fc8:	e5913000 	ldr	r3, [r1]
  102fcc:	e0820102 	add	r0, r2, r2, lsl #2
  102fd0:	e1520003 	cmp	r2, r3
  102fd4:	85812000 	strhi	r2, [r1]
  102fd8:	e0880100 	add	r0, r8, r0, lsl #2
  102fdc:	e1a01009 	mov	r1, r9
  102fe0:	ebfffcdc 	bl	102358 <vListInsertEnd>
  102fe4:	eb0001fd 	bl	1037e0 <vPortExitCritical>
  102fe8:	e59d3028 	ldr	r3, [sp, #40]
  102fec:	e3530000 	cmp	r3, #0	; 0x0
  102ff0:	15836000 	strne	r6, [r3]
  102ff4:	e5973000 	ldr	r3, [r7]
  102ff8:	e3530000 	cmp	r3, #0	; 0x0
  102ffc:	0a00000f 	beq	103040 <xTaskCreate+0x180>
  103000:	e59f30d4 	ldr	r3, [pc, #212]	; 1030dc <prog+0x3098>
  103004:	e5932000 	ldr	r2, [r3]
  103008:	e592102c 	ldr	r1, [r2, #44]
  10300c:	e151000b 	cmp	r1, fp
  103010:	2a00000a 	bcs	103040 <xTaskCreate+0x180>
  103014:	ef000000 	swi	0x00000000
  103018:	e3a00001 	mov	r0, #1	; 0x1
  10301c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  103020:	e59f10b4 	ldr	r1, [pc, #180]	; 1030dc <prog+0x3098>
  103024:	e5913000 	ldr	r3, [r1]
  103028:	e593202c 	ldr	r2, [r3, #44]
  10302c:	e15b0002 	cmp	fp, r2
  103030:	259f8098 	ldrcs	r8, [pc, #152]	; 1030d0 <prog+0x308c>
  103034:	25816000 	strcs	r6, [r1]
  103038:	2affffdc 	bcs	102fb0 <xTaskCreate+0xf0>
  10303c:	eaffffda 	b	102fac <xTaskCreate+0xec>
  103040:	e3a00001 	mov	r0, #1	; 0x1
  103044:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  103048:	e59f308c 	ldr	r3, [pc, #140]	; 1030dc <prog+0x3098>
  10304c:	e59f807c 	ldr	r8, [pc, #124]	; 1030d0 <prog+0x308c>
  103050:	e5836000 	str	r6, [r3]
  103054:	e1a04008 	mov	r4, r8
  103058:	e2885064 	add	r5, r8, #100	; 0x64
  10305c:	e1a00004 	mov	r0, r4
  103060:	e2844014 	add	r4, r4, #20	; 0x14
  103064:	ebfffcaf 	bl	102328 <vListInitialise>
  103068:	e1540005 	cmp	r4, r5
  10306c:	1afffffa 	bne	10305c <xTaskCreate+0x19c>
  103070:	e59f4068 	ldr	r4, [pc, #104]	; 1030e0 <prog+0x309c>
  103074:	e59f5068 	ldr	r5, [pc, #104]	; 1030e4 <prog+0x30a0>
  103078:	e1a00004 	mov	r0, r4
  10307c:	ebfffca9 	bl	102328 <vListInitialise>
  103080:	e1a00005 	mov	r0, r5
  103084:	ebfffca7 	bl	102328 <vListInitialise>
  103088:	e59f0058 	ldr	r0, [pc, #88]	; 1030e8 <prog+0x30a4>
  10308c:	ebfffca5 	bl	102328 <vListInitialise>
  103090:	e59f0054 	ldr	r0, [pc, #84]	; 1030ec <prog+0x30a8>
  103094:	ebfffca3 	bl	102328 <vListInitialise>
  103098:	e59f0050 	ldr	r0, [pc, #80]	; 1030f0 <prog+0x30ac>
  10309c:	ebfffca1 	bl	102328 <vListInitialise>
  1030a0:	e59f7024 	ldr	r7, [pc, #36]	; 1030cc <prog+0x3088>
  1030a4:	e59f3048 	ldr	r3, [pc, #72]	; 1030f4 <prog+0x30b0>
  1030a8:	e59f2048 	ldr	r2, [pc, #72]	; 1030f8 <prog+0x30b4>
  1030ac:	e5834000 	str	r4, [r3]
  1030b0:	e5825000 	str	r5, [r2]
  1030b4:	eaffffbd 	b	102fb0 <xTaskCreate+0xf0>
  1030b8:	e1a00006 	mov	r0, r6
  1030bc:	eb000232 	bl	10398c <vPortFree>
  1030c0:	e3e00000 	mvn	r0, #0	; 0x0
  1030c4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1030c8:	00200c60 	eoreq	r0, r0, r0, ror #24
  1030cc:	00200c64 	eoreq	r0, r0, r4, ror #24
  1030d0:	00200c70 	eoreq	r0, r0, r0, ror ip
  1030d4:	00200c6c 	eoreq	r0, r0, ip, ror #24
  1030d8:	00200c58 	eoreq	r0, r0, r8, asr ip
  1030dc:	00200c44 	eoreq	r0, r0, r4, asr #24
  1030e0:	00200cd4 	ldreqd	r0, [r0], -r4
  1030e4:	00200ce8 	eoreq	r0, r0, r8, ror #25
  1030e8:	00200d04 	eoreq	r0, r0, r4, lsl #26
  1030ec:	00200d18 	eoreq	r0, r0, r8, lsl sp
  1030f0:	00200d2c 	eoreq	r0, r0, ip, lsr #26
  1030f4:	00200cfc 	streqd	r0, [r0], -ip
  1030f8:	00200d00 	eoreq	r0, r0, r0, lsl #26

001030fc <vTaskStartScheduler>:
  1030fc:	e92d4010 	stmdb	sp!, {r4, lr}
  103100:	e3a04000 	mov	r4, #0	; 0x0
  103104:	e24dd008 	sub	sp, sp, #8	; 0x8
  103108:	e59f1054 	ldr	r1, [pc, #84]	; 103164 <prog+0x3120>
  10310c:	e3a0206e 	mov	r2, #110	; 0x6e
  103110:	e1a03004 	mov	r3, r4
  103114:	e59f004c 	ldr	r0, [pc, #76]	; 103168 <prog+0x3124>
  103118:	e58d4000 	str	r4, [sp]
  10311c:	e58d4004 	str	r4, [sp, #4]
  103120:	ebffff66 	bl	102ec0 <xTaskCreate>
  103124:	e3500001 	cmp	r0, #1	; 0x1
  103128:	0a000001 	beq	103134 <vTaskStartScheduler+0x38>
  10312c:	e28dd008 	add	sp, sp, #8	; 0x8
  103130:	e8bd8010 	ldmia	sp!, {r4, pc}
  103134:	e92d0001 	stmdb	sp!, {r0}
  103138:	e10f0000 	mrs	r0, CPSR
  10313c:	e38000c0 	orr	r0, r0, #192	; 0xc0
  103140:	e129f000 	msr	CPSR_fc, r0
  103144:	e8bd0001 	ldmia	sp!, {r0}
  103148:	e59f301c 	ldr	r3, [pc, #28]	; 10316c <prog+0x3128>
  10314c:	e59f201c 	ldr	r2, [pc, #28]	; 103170 <prog+0x312c>
  103150:	e5830000 	str	r0, [r3]
  103154:	e5824000 	str	r4, [r2]
  103158:	e28dd008 	add	sp, sp, #8	; 0x8
  10315c:	e8bd4010 	ldmia	sp!, {r4, lr}
  103160:	ea00016c 	b	103718 <xPortStartScheduler>
  103164:	00104c24 	andeqs	r4, r0, r4, lsr #24
  103168:	001033f8 	ldreqsh	r3, [r0], -r8
  10316c:	00200c64 	eoreq	r0, r0, r4, ror #24
  103170:	00200c50 	eoreq	r0, r0, r0, asr ip

00103174 <xTaskResumeAll>:
  103174:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  103178:	e59fb248 	ldr	fp, [pc, #584]	; 1033c8 <prog+0x3384>
  10317c:	eb00018c 	bl	1037b4 <vPortEnterCritical>
  103180:	e59b3000 	ldr	r3, [fp]
  103184:	e2433001 	sub	r3, r3, #1	; 0x1
  103188:	e58b3000 	str	r3, [fp]
  10318c:	e59b1000 	ldr	r1, [fp]
  103190:	e3510000 	cmp	r1, #0	; 0x0
  103194:	1a000006 	bne	1031b4 <xTaskResumeAll+0x40>
  103198:	e59f322c 	ldr	r3, [pc, #556]	; 1033cc <prog+0x3388>
  10319c:	e5932000 	ldr	r2, [r3]
  1031a0:	e3520000 	cmp	r2, #0	; 0x0
  1031a4:	159f9224 	ldrne	r9, [pc, #548]	; 1033d0 <prog+0x338c>
  1031a8:	11a06001 	movne	r6, r1
  1031ac:	11a0a009 	movne	sl, r9
  1031b0:	1a00001a 	bne	103220 <xTaskResumeAll+0xac>
  1031b4:	eb000189 	bl	1037e0 <vPortExitCritical>
  1031b8:	e3a04000 	mov	r4, #0	; 0x0
  1031bc:	e1a00004 	mov	r0, r4
  1031c0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1031c4:	e599300c 	ldr	r3, [r9, #12]
  1031c8:	e593400c 	ldr	r4, [r3, #12]
  1031cc:	e3540000 	cmp	r4, #0	; 0x0
  1031d0:	e2840018 	add	r0, r4, #24	; 0x18
  1031d4:	e2845004 	add	r5, r4, #4	; 0x4
  1031d8:	0a000015 	beq	103234 <xTaskResumeAll+0xc0>
  1031dc:	ebfffc83 	bl	1023f0 <vListRemove>
  1031e0:	e1a00005 	mov	r0, r5
  1031e4:	ebfffc81 	bl	1023f0 <vListRemove>
  1031e8:	e594202c 	ldr	r2, [r4, #44]
  1031ec:	e5973000 	ldr	r3, [r7]
  1031f0:	e0820102 	add	r0, r2, r2, lsl #2
  1031f4:	e1520003 	cmp	r2, r3
  1031f8:	e1a01005 	mov	r1, r5
  1031fc:	e0880100 	add	r0, r8, r0, lsl #2
  103200:	85872000 	strhi	r2, [r7]
  103204:	ebfffc53 	bl	102358 <vListInsertEnd>
  103208:	e59f31c4 	ldr	r3, [pc, #452]	; 1033d4 <prog+0x3390>
  10320c:	e5932000 	ldr	r2, [r3]
  103210:	e594102c 	ldr	r1, [r4, #44]
  103214:	e592302c 	ldr	r3, [r2, #44]
  103218:	e1510003 	cmp	r1, r3
  10321c:	23a06001 	movcs	r6, #1	; 0x1
  103220:	e59a3000 	ldr	r3, [sl]
  103224:	e3530000 	cmp	r3, #0	; 0x0
  103228:	e59f81a8 	ldr	r8, [pc, #424]	; 1033d8 <prog+0x3394>
  10322c:	e59f71a8 	ldr	r7, [pc, #424]	; 1033dc <prog+0x3398>
  103230:	1affffe3 	bne	1031c4 <xTaskResumeAll+0x50>
  103234:	e59fa1a4 	ldr	sl, [pc, #420]	; 1033e0 <prog+0x339c>
  103238:	e59a3000 	ldr	r3, [sl]
  10323c:	e3530000 	cmp	r3, #0	; 0x0
  103240:	0a000059 	beq	1033ac <xTaskResumeAll+0x238>
  103244:	e59a3000 	ldr	r3, [sl]
  103248:	e3530000 	cmp	r3, #0	; 0x0
  10324c:	0a00004e 	beq	10338c <xTaskResumeAll+0x218>
  103250:	e59b3000 	ldr	r3, [fp]
  103254:	e3530000 	cmp	r3, #0	; 0x0
  103258:	159a3000 	ldrne	r3, [sl]
  10325c:	12833001 	addne	r3, r3, #1	; 0x1
  103260:	158a3000 	strne	r3, [sl]
  103264:	1a000042 	bne	103374 <xTaskResumeAll+0x200>
  103268:	e59f6174 	ldr	r6, [pc, #372]	; 1033e4 <prog+0x33a0>
  10326c:	e5963000 	ldr	r3, [r6]
  103270:	e2833001 	add	r3, r3, #1	; 0x1
  103274:	e5863000 	str	r3, [r6]
  103278:	e5962000 	ldr	r2, [r6]
  10327c:	e3520000 	cmp	r2, #0	; 0x0
  103280:	e1a0c006 	mov	ip, r6
  103284:	159f915c 	ldrne	r9, [pc, #348]	; 1033e8 <prog+0x33a4>
  103288:	1a000009 	bne	1032b4 <xTaskResumeAll+0x140>
  10328c:	e59f9154 	ldr	r9, [pc, #340]	; 1033e8 <prog+0x33a4>
  103290:	e59f1154 	ldr	r1, [pc, #340]	; 1033ec <prog+0x33a8>
  103294:	e5990000 	ldr	r0, [r9]
  103298:	e5913000 	ldr	r3, [r1]
  10329c:	e59f214c 	ldr	r2, [pc, #332]	; 1033f0 <prog+0x33ac>
  1032a0:	e5893000 	str	r3, [r9]
  1032a4:	e5810000 	str	r0, [r1]
  1032a8:	e5923000 	ldr	r3, [r2]
  1032ac:	e2833001 	add	r3, r3, #1	; 0x1
  1032b0:	e5823000 	str	r3, [r2]
  1032b4:	e5993000 	ldr	r3, [r9]
  1032b8:	e5932000 	ldr	r2, [r3]
  1032bc:	e3520000 	cmp	r2, #0	; 0x0
  1032c0:	0a00002b 	beq	103374 <xTaskResumeAll+0x200>
  1032c4:	e59f311c 	ldr	r3, [pc, #284]	; 1033e8 <prog+0x33a4>
  1032c8:	e5932000 	ldr	r2, [r3]
  1032cc:	e592100c 	ldr	r1, [r2, #12]
  1032d0:	e591300c 	ldr	r3, [r1, #12]
  1032d4:	e3530000 	cmp	r3, #0	; 0x0
  1032d8:	0a000025 	beq	103374 <xTaskResumeAll+0x200>
  1032dc:	e1a04003 	mov	r4, r3
  1032e0:	e59c2000 	ldr	r2, [ip]
  1032e4:	e5933004 	ldr	r3, [r3, #4]
  1032e8:	e1530002 	cmp	r3, r2
  1032ec:	959f70e8 	ldrls	r7, [pc, #232]	; 1033dc <prog+0x3398>
  1032f0:	959f80e0 	ldrls	r8, [pc, #224]	; 1033d8 <prog+0x3394>
  1032f4:	9a00000a 	bls	103324 <xTaskResumeAll+0x1b0>
  1032f8:	ea00001d 	b	103374 <xTaskResumeAll+0x200>
  1032fc:	e59f30e4 	ldr	r3, [pc, #228]	; 1033e8 <prog+0x33a4>
  103300:	e5932000 	ldr	r2, [r3]
  103304:	e592100c 	ldr	r1, [r2, #12]
  103308:	e591300c 	ldr	r3, [r1, #12]
  10330c:	e2534000 	subs	r4, r3, #0	; 0x0
  103310:	0a000017 	beq	103374 <xTaskResumeAll+0x200>
  103314:	e5962000 	ldr	r2, [r6]
  103318:	e5943004 	ldr	r3, [r4, #4]
  10331c:	e1530002 	cmp	r3, r2
  103320:	8a000013 	bhi	103374 <xTaskResumeAll+0x200>
  103324:	e2845004 	add	r5, r4, #4	; 0x4
  103328:	e1a00005 	mov	r0, r5
  10332c:	ebfffc2f 	bl	1023f0 <vListRemove>
  103330:	e5943028 	ldr	r3, [r4, #40]
  103334:	e3530000 	cmp	r3, #0	; 0x0
  103338:	e2840018 	add	r0, r4, #24	; 0x18
  10333c:	1bfffc2b 	blne	1023f0 <vListRemove>
  103340:	e594202c 	ldr	r2, [r4, #44]
  103344:	e5973000 	ldr	r3, [r7]
  103348:	e1520003 	cmp	r2, r3
  10334c:	859f3088 	ldrhi	r3, [pc, #136]	; 1033dc <prog+0x3398>
  103350:	e0820102 	add	r0, r2, r2, lsl #2
  103354:	85832000 	strhi	r2, [r3]
  103358:	e1a01005 	mov	r1, r5
  10335c:	e0880100 	add	r0, r8, r0, lsl #2
  103360:	ebfffbfc 	bl	102358 <vListInsertEnd>
  103364:	e5993000 	ldr	r3, [r9]
  103368:	e5932000 	ldr	r2, [r3]
  10336c:	e3520000 	cmp	r2, #0	; 0x0
  103370:	1affffe1 	bne	1032fc <xTaskResumeAll+0x188>
  103374:	e59a3000 	ldr	r3, [sl]
  103378:	e2433001 	sub	r3, r3, #1	; 0x1
  10337c:	e58a3000 	str	r3, [sl]
  103380:	e59a2000 	ldr	r2, [sl]
  103384:	e3520000 	cmp	r2, #0	; 0x0
  103388:	1affffb0 	bne	103250 <xTaskResumeAll+0xdc>
  10338c:	e59f2060 	ldr	r2, [pc, #96]	; 1033f4 <prog+0x33b0>
  103390:	e3a03000 	mov	r3, #0	; 0x0
  103394:	e5823000 	str	r3, [r2]
  103398:	ef000000 	swi	0x00000000
  10339c:	eb00010f 	bl	1037e0 <vPortExitCritical>
  1033a0:	e3a04001 	mov	r4, #1	; 0x1
  1033a4:	e1a00004 	mov	r0, r4
  1033a8:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1033ac:	e3560001 	cmp	r6, #1	; 0x1
  1033b0:	0afffff5 	beq	10338c <xTaskResumeAll+0x218>
  1033b4:	e59f2038 	ldr	r2, [pc, #56]	; 1033f4 <prog+0x33b0>
  1033b8:	e5923000 	ldr	r3, [r2]
  1033bc:	e3530001 	cmp	r3, #1	; 0x1
  1033c0:	1affff7b 	bne	1031b4 <xTaskResumeAll+0x40>
  1033c4:	eafffff1 	b	103390 <xTaskResumeAll+0x21c>
  1033c8:	00200c54 	eoreq	r0, r0, r4, asr ip
  1033cc:	00200c60 	eoreq	r0, r0, r0, ror #24
  1033d0:	00200d04 	eoreq	r0, r0, r4, lsl #26
  1033d4:	00200c44 	eoreq	r0, r0, r4, asr #24
  1033d8:	00200c70 	eoreq	r0, r0, r0, ror ip
  1033dc:	00200c58 	eoreq	r0, r0, r8, asr ip
  1033e0:	00200c5c 	eoreq	r0, r0, ip, asr ip
  1033e4:	00200c50 	eoreq	r0, r0, r0, asr ip
  1033e8:	00200cfc 	streqd	r0, [r0], -ip
  1033ec:	00200d00 	eoreq	r0, r0, r0, lsl #26
  1033f0:	00200c4c 	eoreq	r0, r0, ip, asr #24
  1033f4:	00200c48 	eoreq	r0, r0, r8, asr #24

001033f8 <prvIdleTask>:
  1033f8:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  1033fc:	e59f50a0 	ldr	r5, [pc, #160]	; 1034a4 <prog+0x3460>
  103400:	e5953000 	ldr	r3, [r5]
  103404:	e59f709c 	ldr	r7, [pc, #156]	; 1034a8 <prog+0x3464>
  103408:	e3530000 	cmp	r3, #0	; 0x0
  10340c:	e59f8098 	ldr	r8, [pc, #152]	; 1034ac <prog+0x3468>
  103410:	e59f6098 	ldr	r6, [pc, #152]	; 1034b0 <prog+0x346c>
  103414:	e287a008 	add	sl, r7, #8	; 0x8
  103418:	1a000007 	bne	10343c <prvIdleTask+0x44>
  10341c:	e5963000 	ldr	r3, [r6]
  103420:	e3530001 	cmp	r3, #1	; 0x1
  103424:	9a000000 	bls	10342c <prvIdleTask+0x34>
  103428:	ef000000 	swi	0x00000000
  10342c:	ebfff71e 	bl	1010ac <vApplicationIdleHook>
  103430:	e5953000 	ldr	r3, [r5]
  103434:	e3530000 	cmp	r3, #0	; 0x0
  103438:	0afffff7 	beq	10341c <prvIdleTask+0x24>
  10343c:	ebfffdef 	bl	102c00 <vTaskSuspendAll>
  103440:	e5974000 	ldr	r4, [r7]
  103444:	ebffff4a 	bl	103174 <xTaskResumeAll>
  103448:	e3540000 	cmp	r4, #0	; 0x0
  10344c:	0afffff2 	beq	10341c <prvIdleTask+0x24>
  103450:	eb0000d7 	bl	1037b4 <vPortEnterCritical>
  103454:	e59f304c 	ldr	r3, [pc, #76]	; 1034a8 <prog+0x3464>
  103458:	e5932000 	ldr	r2, [r3]
  10345c:	e3520000 	cmp	r2, #0	; 0x0
  103460:	159a3004 	ldrne	r3, [sl, #4]
  103464:	e1a04002 	mov	r4, r2
  103468:	1593400c 	ldrne	r4, [r3, #12]
  10346c:	e2840004 	add	r0, r4, #4	; 0x4
  103470:	ebfffbde 	bl	1023f0 <vListRemove>
  103474:	e5983000 	ldr	r3, [r8]
  103478:	e2433001 	sub	r3, r3, #1	; 0x1
  10347c:	e5883000 	str	r3, [r8]
  103480:	e5952000 	ldr	r2, [r5]
  103484:	e2422001 	sub	r2, r2, #1	; 0x1
  103488:	e5852000 	str	r2, [r5]
  10348c:	eb0000d3 	bl	1037e0 <vPortExitCritical>
  103490:	e5940030 	ldr	r0, [r4, #48]
  103494:	eb00013c 	bl	10398c <vPortFree>
  103498:	e1a00004 	mov	r0, r4
  10349c:	eb00013a 	bl	10398c <vPortFree>
  1034a0:	eaffffdd 	b	10341c <prvIdleTask+0x24>
  1034a4:	00200c68 	eoreq	r0, r0, r8, ror #24
  1034a8:	00200d18 	eoreq	r0, r0, r8, lsl sp
  1034ac:	00200c60 	eoreq	r0, r0, r0, ror #24
  1034b0:	00200c70 	eoreq	r0, r0, r0, ror ip

001034b4 <vTaskDelay>:
  1034b4:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  1034b8:	e2505000 	subs	r5, r0, #0	; 0x0
  1034bc:	e59f6084 	ldr	r6, [pc, #132]	; 103548 <prog+0x3504>
  1034c0:	e59f7084 	ldr	r7, [pc, #132]	; 10354c <prog+0x3508>
  1034c4:	1a000001 	bne	1034d0 <vTaskDelay+0x1c>
  1034c8:	ef000000 	swi	0x00000000
  1034cc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1034d0:	ebfffdca 	bl	102c00 <vTaskSuspendAll>
  1034d4:	e5974000 	ldr	r4, [r7]
  1034d8:	e5960000 	ldr	r0, [r6]
  1034dc:	e2800004 	add	r0, r0, #4	; 0x4
  1034e0:	ebfffbc2 	bl	1023f0 <vListRemove>
  1034e4:	e5962000 	ldr	r2, [r6]
  1034e8:	e5973000 	ldr	r3, [r7]
  1034ec:	e0854004 	add	r4, r5, r4
  1034f0:	e1540003 	cmp	r4, r3
  1034f4:	e5824004 	str	r4, [r2, #4]
  1034f8:	2a000009 	bcs	103524 <vTaskDelay+0x70>
  1034fc:	e59f304c 	ldr	r3, [pc, #76]	; 103550 <prog+0x350c>
  103500:	e5930000 	ldr	r0, [r3]
  103504:	e5961000 	ldr	r1, [r6]
  103508:	e2811004 	add	r1, r1, #4	; 0x4
  10350c:	ebfffb9e 	bl	10238c <vListInsert>
  103510:	ebffff17 	bl	103174 <xTaskResumeAll>
  103514:	e3500000 	cmp	r0, #0	; 0x0
  103518:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
  10351c:	ef000000 	swi	0x00000000
  103520:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  103524:	e59f3028 	ldr	r3, [pc, #40]	; 103554 <prog+0x3510>
  103528:	e5930000 	ldr	r0, [r3]
  10352c:	e5961000 	ldr	r1, [r6]
  103530:	e2811004 	add	r1, r1, #4	; 0x4
  103534:	ebfffb94 	bl	10238c <vListInsert>
  103538:	ebffff0d 	bl	103174 <xTaskResumeAll>
  10353c:	e3500000 	cmp	r0, #0	; 0x0
  103540:	0afffff5 	beq	10351c <vTaskDelay+0x68>
  103544:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  103548:	00200c44 	eoreq	r0, r0, r4, asr #24
  10354c:	00200c50 	eoreq	r0, r0, r0, asr ip
  103550:	00200d00 	eoreq	r0, r0, r0, lsl #26
  103554:	00200cfc 	streqd	r0, [r0], -ip

00103558 <pxPortInitialiseStack>:
  103558:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10355c:	e2811004 	add	r1, r1, #4	; 0x4
  103560:	e1a0b000 	mov	fp, r0
  103564:	e40b1004 	str	r1, [fp], #-4
  103568:	e24b1004 	sub	r1, fp, #4	; 0x4
  10356c:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  103570:	e2413004 	sub	r3, r1, #4	; 0x4
  103574:	e58d1004 	str	r1, [sp, #4]
  103578:	e2431004 	sub	r1, r3, #4	; 0x4
  10357c:	e58d3008 	str	r3, [sp, #8]
  103580:	e2413004 	sub	r3, r1, #4	; 0x4
  103584:	e58d100c 	str	r1, [sp, #12]
  103588:	e2431004 	sub	r1, r3, #4	; 0x4
  10358c:	e58d3010 	str	r3, [sp, #16]
  103590:	e2413004 	sub	r3, r1, #4	; 0x4
  103594:	e58d1014 	str	r1, [sp, #20]
  103598:	e2431004 	sub	r1, r3, #4	; 0x4
  10359c:	e58d3018 	str	r3, [sp, #24]
  1035a0:	e2413004 	sub	r3, r1, #4	; 0x4
  1035a4:	e58d101c 	str	r1, [sp, #28]
  1035a8:	e2431004 	sub	r1, r3, #4	; 0x4
  1035ac:	e58d3020 	str	r3, [sp, #32]
  1035b0:	e2413004 	sub	r3, r1, #4	; 0x4
  1035b4:	e58d1024 	str	r1, [sp, #36]
  1035b8:	e2431004 	sub	r1, r3, #4	; 0x4
  1035bc:	e58d3028 	str	r3, [sp, #40]
  1035c0:	e2413004 	sub	r3, r1, #4	; 0x4
  1035c4:	e58d102c 	str	r1, [sp, #44]
  1035c8:	e2431004 	sub	r1, r3, #4	; 0x4
  1035cc:	e58d1034 	str	r1, [sp, #52]
  1035d0:	e58d3030 	str	r3, [sp, #48]
  1035d4:	e59d3034 	ldr	r3, [sp, #52]
  1035d8:	e2433004 	sub	r3, r3, #4	; 0x4
  1035dc:	e58d0000 	str	r0, [sp]
  1035e0:	e58d3038 	str	r3, [sp, #56]
  1035e4:	e2430004 	sub	r0, r3, #4	; 0x4
  1035e8:	e3a03caa 	mov	r3, #43520	; 0xaa00
  1035ec:	e59d1000 	ldr	r1, [sp]
  1035f0:	e28330aa 	add	r3, r3, #170	; 0xaa
  1035f4:	e1833803 	orr	r3, r3, r3, lsl #16
  1035f8:	e5013004 	str	r3, [r1, #-4]
  1035fc:	e3a03c12 	mov	r3, #4608	; 0x1200
  103600:	e50b1004 	str	r1, [fp, #-4]
  103604:	e2833012 	add	r3, r3, #18	; 0x12
  103608:	e59d1004 	ldr	r1, [sp, #4]
  10360c:	e1833803 	orr	r3, r3, r3, lsl #16
  103610:	e3a09c11 	mov	r9, #4352	; 0x1100
  103614:	e3a0aa01 	mov	sl, #4096	; 0x1000
  103618:	e5013004 	str	r3, [r1, #-4]
  10361c:	e2899011 	add	r9, r9, #17	; 0x11
  103620:	e28d1008 	add	r1, sp, #8	; 0x8
  103624:	e891000a 	ldmia	r1, {r1, r3}
  103628:	e28aa010 	add	sl, sl, #16	; 0x10
  10362c:	e1899809 	orr	r9, r9, r9, lsl #16
  103630:	e18aa80a 	orr	sl, sl, sl, lsl #16
  103634:	e3a08c09 	mov	r8, #2304	; 0x900
  103638:	e3a07b02 	mov	r7, #2048	; 0x800
  10363c:	e5019004 	str	r9, [r1, #-4]
  103640:	e2888009 	add	r8, r8, #9	; 0x9
  103644:	e503a004 	str	sl, [r3, #-4]
  103648:	e28d1010 	add	r1, sp, #16	; 0x10
  10364c:	e891000a 	ldmia	r1, {r1, r3}
  103650:	e2877008 	add	r7, r7, #8	; 0x8
  103654:	e1888808 	orr	r8, r8, r8, lsl #16
  103658:	e1877807 	orr	r7, r7, r7, lsl #16
  10365c:	e3a06c07 	mov	r6, #1792	; 0x700
  103660:	e3a05c06 	mov	r5, #1536	; 0x600
  103664:	e5018004 	str	r8, [r1, #-4]
  103668:	e2866007 	add	r6, r6, #7	; 0x7
  10366c:	e5037004 	str	r7, [r3, #-4]
  103670:	e28d1018 	add	r1, sp, #24	; 0x18
  103674:	e891000a 	ldmia	r1, {r1, r3}
  103678:	e2855006 	add	r5, r5, #6	; 0x6
  10367c:	e1866806 	orr	r6, r6, r6, lsl #16
  103680:	e1855805 	orr	r5, r5, r5, lsl #16
  103684:	e3a04c05 	mov	r4, #1280	; 0x500
  103688:	e5016004 	str	r6, [r1, #-4]
  10368c:	e2844005 	add	r4, r4, #5	; 0x5
  103690:	e5035004 	str	r5, [r3, #-4]
  103694:	e59d1020 	ldr	r1, [sp, #32]
  103698:	e1844804 	orr	r4, r4, r4, lsl #16
  10369c:	e3a0eb01 	mov	lr, #1024	; 0x400
  1036a0:	e3a0cc03 	mov	ip, #768	; 0x300
  1036a4:	e5014004 	str	r4, [r1, #-4]
  1036a8:	e59d3024 	ldr	r3, [sp, #36]
  1036ac:	e59d1028 	ldr	r1, [sp, #40]
  1036b0:	e28ee004 	add	lr, lr, #4	; 0x4
  1036b4:	e28cc003 	add	ip, ip, #3	; 0x3
  1036b8:	e18ee80e 	orr	lr, lr, lr, lsl #16
  1036bc:	e18cc80c 	orr	ip, ip, ip, lsl #16
  1036c0:	e503e004 	str	lr, [r3, #-4]
  1036c4:	e501c004 	str	ip, [r1, #-4]
  1036c8:	e3a01c02 	mov	r1, #512	; 0x200
  1036cc:	e59d302c 	ldr	r3, [sp, #44]
  1036d0:	e2811002 	add	r1, r1, #2	; 0x2
  1036d4:	e1811801 	orr	r1, r1, r1, lsl #16
  1036d8:	e5031004 	str	r1, [r3, #-4]
  1036dc:	e3a01c01 	mov	r1, #256	; 0x100
  1036e0:	e59d3030 	ldr	r3, [sp, #48]
  1036e4:	e2811001 	add	r1, r1, #1	; 0x1
  1036e8:	e1811801 	orr	r1, r1, r1, lsl #16
  1036ec:	e5031004 	str	r1, [r3, #-4]
  1036f0:	e59d3034 	ldr	r3, [sp, #52]
  1036f4:	e59d1038 	ldr	r1, [sp, #56]
  1036f8:	e5032004 	str	r2, [r3, #-4]
  1036fc:	e3a0301f 	mov	r3, #31	; 0x1f
  103700:	e3a02000 	mov	r2, #0	; 0x0
  103704:	e5013004 	str	r3, [r1, #-4]
  103708:	e5002004 	str	r2, [r0, #-4]
  10370c:	e2400004 	sub	r0, r0, #4	; 0x4
  103710:	e28dd03c 	add	sp, sp, #60	; 0x3c
  103714:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00103718 <xPortStartScheduler>:
  103718:	e52de004 	str	lr, [sp, #-4]!
  10371c:	e3a01007 	mov	r1, #7	; 0x7
  103720:	e3a02000 	mov	r2, #0	; 0x0
  103724:	e59f3030 	ldr	r3, [pc, #48]	; 10375c <prog+0x3718>
  103728:	e3a00001 	mov	r0, #1	; 0x1
  10372c:	ebfffacb 	bl	102260 <AT91F_AIC_ConfigureIt>
  103730:	e3a03403 	mov	r3, #50331648	; 0x3000000
  103734:	e2833ebb 	add	r3, r3, #2992	; 0xbb0
  103738:	e3e02c02 	mvn	r2, #512	; 0x200
  10373c:	e2833003 	add	r3, r3, #3	; 0x3
  103740:	e50230cf 	str	r3, [r2, #-207]
  103744:	e3a01002 	mov	r1, #2	; 0x2
  103748:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10374c:	e5831021 	str	r1, [r3, #33]
  103750:	eb000002 	bl	103760 <vPortISRStartFirstTask>
  103754:	e3a00000 	mov	r0, #0	; 0x0
  103758:	e49df004 	ldr	pc, [sp], #4
  10375c:	00103824 	andeqs	r3, r0, r4, lsr #16

00103760 <vPortISRStartFirstTask>:
  103760:	e59f0044 	ldr	r0, [pc, #68]	; 1037ac <prog+0x3768>
  103764:	e5900000 	ldr	r0, [r0]
  103768:	e590e000 	ldr	lr, [r0]
  10376c:	e59f003c 	ldr	r0, [pc, #60]	; 1037b0 <prog+0x376c>
  103770:	e8be0002 	ldmia	lr!, {r1}
  103774:	e5801000 	str	r1, [r0]
  103778:	e8be0001 	ldmia	lr!, {r0}
  10377c:	e169f000 	msr	SPSR_fc, r0
  103780:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  103784:	e1a00000 	nop			(mov r0,r0)
  103788:	e59ee03c 	ldr	lr, [lr, #60]
  10378c:	e25ef004 	subs	pc, lr, #4	; 0x4
  103790:	e59f300c 	ldr	r3, [pc, #12]	; 1037a4 <prog+0x3760>
  103794:	e59f200c 	ldr	r2, [pc, #12]	; 1037a8 <prog+0x3764>
  103798:	e5931000 	ldr	r1, [r3]
  10379c:	e5923000 	ldr	r3, [r2]
  1037a0:	e12fff1e 	bx	lr
  1037a4:	00200828 	eoreq	r0, r0, r8, lsr #16
  1037a8:	00200c44 	eoreq	r0, r0, r4, asr #24
  1037ac:	00200c44 	eoreq	r0, r0, r4, asr #24
  1037b0:	00200828 	eoreq	r0, r0, r8, lsr #16

001037b4 <vPortEnterCritical>:
  1037b4:	e92d0001 	stmdb	sp!, {r0}
  1037b8:	e10f0000 	mrs	r0, CPSR
  1037bc:	e38000c0 	orr	r0, r0, #192	; 0xc0
  1037c0:	e129f000 	msr	CPSR_fc, r0
  1037c4:	e8bd0001 	ldmia	sp!, {r0}
  1037c8:	e59f200c 	ldr	r2, [pc, #12]	; 1037dc <prog+0x3798>
  1037cc:	e5923000 	ldr	r3, [r2]
  1037d0:	e2833001 	add	r3, r3, #1	; 0x1
  1037d4:	e5823000 	str	r3, [r2]
  1037d8:	e12fff1e 	bx	lr
  1037dc:	00200828 	eoreq	r0, r0, r8, lsr #16

001037e0 <vPortExitCritical>:
  1037e0:	e59f2038 	ldr	r2, [pc, #56]	; 103820 <prog+0x37dc>
  1037e4:	e5923000 	ldr	r3, [r2]
  1037e8:	e3530000 	cmp	r3, #0	; 0x0
  1037ec:	012fff1e 	bxeq	lr
  1037f0:	e5923000 	ldr	r3, [r2]
  1037f4:	e2433001 	sub	r3, r3, #1	; 0x1
  1037f8:	e5823000 	str	r3, [r2]
  1037fc:	e5922000 	ldr	r2, [r2]
  103800:	e3520000 	cmp	r2, #0	; 0x0
  103804:	112fff1e 	bxne	lr
  103808:	e92d0001 	stmdb	sp!, {r0}
  10380c:	e10f0000 	mrs	r0, CPSR
  103810:	e3c000c0 	bic	r0, r0, #192	; 0xc0
  103814:	e129f000 	msr	CPSR_fc, r0
  103818:	e8bd0001 	ldmia	sp!, {r0}
  10381c:	e12fff1e 	bx	lr
  103820:	00200828 	eoreq	r0, r0, r8, lsr #16

00103824 <vPreemptiveTick>:
  103824:	e92d0001 	stmdb	sp!, {r0}
  103828:	e94d2000 	stmdb	sp, {sp}^
  10382c:	e1a00000 	nop			(mov r0,r0)
  103830:	e24dd004 	sub	sp, sp, #4	; 0x4
  103834:	e8bd0001 	ldmia	sp!, {r0}
  103838:	e9204000 	stmdb	r0!, {lr}
  10383c:	e1a0e000 	mov	lr, r0
  103840:	e8bd0001 	ldmia	sp!, {r0}
  103844:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  103848:	e1a00000 	nop			(mov r0,r0)
  10384c:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  103850:	e14f0000 	mrs	r0, SPSR
  103854:	e92e0001 	stmdb	lr!, {r0}
  103858:	e59f0078 	ldr	r0, [pc, #120]	; 1038d8 <prog+0x3894>
  10385c:	e5900000 	ldr	r0, [r0]
  103860:	e92e0001 	stmdb	lr!, {r0}
  103864:	e59f0070 	ldr	r0, [pc, #112]	; 1038dc <prog+0x3898>
  103868:	e5900000 	ldr	r0, [r0]
  10386c:	e580e000 	str	lr, [r0]
  103870:	e59f4058 	ldr	r4, [pc, #88]	; 1038d0 <prog+0x388c>
  103874:	e59f5058 	ldr	r5, [pc, #88]	; 1038d4 <prog+0x3890>
  103878:	e5943000 	ldr	r3, [r4]
  10387c:	e5952000 	ldr	r2, [r5]
  103880:	ebfffd10 	bl	102cc8 <vTaskIncrementTick>
  103884:	ebfffc6f 	bl	102a48 <vTaskSwitchContext>
  103888:	e3e03c02 	mvn	r3, #512	; 0x200
  10388c:	e51310c7 	ldr	r1, [r3, #-199]
  103890:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  103894:	e5821031 	str	r1, [r2, #49]
  103898:	e59f003c 	ldr	r0, [pc, #60]	; 1038dc <prog+0x3898>
  10389c:	e5900000 	ldr	r0, [r0]
  1038a0:	e590e000 	ldr	lr, [r0]
  1038a4:	e59f002c 	ldr	r0, [pc, #44]	; 1038d8 <prog+0x3894>
  1038a8:	e8be0002 	ldmia	lr!, {r1}
  1038ac:	e5801000 	str	r1, [r0]
  1038b0:	e8be0001 	ldmia	lr!, {r0}
  1038b4:	e169f000 	msr	SPSR_fc, r0
  1038b8:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1038bc:	e1a00000 	nop			(mov r0,r0)
  1038c0:	e59ee03c 	ldr	lr, [lr, #60]
  1038c4:	e25ef004 	subs	pc, lr, #4	; 0x4
  1038c8:	e5943000 	ldr	r3, [r4]
  1038cc:	e5952000 	ldr	r2, [r5]
  1038d0:	00200828 	eoreq	r0, r0, r8, lsr #16
  1038d4:	00200c44 	eoreq	r0, r0, r4, asr #24
  1038d8:	00200828 	eoreq	r0, r0, r8, lsr #16
  1038dc:	00200c44 	eoreq	r0, r0, r4, asr #24

001038e0 <swi_handler>:
  1038e0:	e28ee004 	add	lr, lr, #4	; 0x4
  1038e4:	e92d0001 	stmdb	sp!, {r0}
  1038e8:	e94d2000 	stmdb	sp, {sp}^
  1038ec:	e1a00000 	nop			(mov r0,r0)
  1038f0:	e24dd004 	sub	sp, sp, #4	; 0x4
  1038f4:	e8bd0001 	ldmia	sp!, {r0}
  1038f8:	e9204000 	stmdb	r0!, {lr}
  1038fc:	e1a0e000 	mov	lr, r0
  103900:	e8bd0001 	ldmia	sp!, {r0}
  103904:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  103908:	e1a00000 	nop			(mov r0,r0)
  10390c:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  103910:	e14f0000 	mrs	r0, SPSR
  103914:	e92e0001 	stmdb	lr!, {r0}
  103918:	e59f0064 	ldr	r0, [pc, #100]	; 103984 <prog+0x3940>
  10391c:	e5900000 	ldr	r0, [r0]
  103920:	e92e0001 	stmdb	lr!, {r0}
  103924:	e59f005c 	ldr	r0, [pc, #92]	; 103988 <prog+0x3944>
  103928:	e5900000 	ldr	r0, [r0]
  10392c:	e580e000 	str	lr, [r0]
  103930:	e59f4044 	ldr	r4, [pc, #68]	; 10397c <prog+0x3938>
  103934:	e59f5044 	ldr	r5, [pc, #68]	; 103980 <prog+0x393c>
  103938:	e5943000 	ldr	r3, [r4]
  10393c:	e5952000 	ldr	r2, [r5]
  103940:	ebfffc40 	bl	102a48 <vTaskSwitchContext>
  103944:	e59f003c 	ldr	r0, [pc, #60]	; 103988 <prog+0x3944>
  103948:	e5900000 	ldr	r0, [r0]
  10394c:	e590e000 	ldr	lr, [r0]
  103950:	e59f002c 	ldr	r0, [pc, #44]	; 103984 <prog+0x3940>
  103954:	e8be0002 	ldmia	lr!, {r1}
  103958:	e5801000 	str	r1, [r0]
  10395c:	e8be0001 	ldmia	lr!, {r0}
  103960:	e169f000 	msr	SPSR_fc, r0
  103964:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  103968:	e1a00000 	nop			(mov r0,r0)
  10396c:	e59ee03c 	ldr	lr, [lr, #60]
  103970:	e25ef004 	subs	pc, lr, #4	; 0x4
  103974:	e5943000 	ldr	r3, [r4]
  103978:	e5952000 	ldr	r2, [r5]
  10397c:	00200828 	eoreq	r0, r0, r8, lsr #16
  103980:	00200c44 	eoreq	r0, r0, r4, asr #24
  103984:	00200828 	eoreq	r0, r0, r8, lsr #16
  103988:	00200c44 	eoreq	r0, r0, r4, asr #24

0010398c <vPortFree>:
  10398c:	e92d4010 	stmdb	sp!, {r4, lr}
  103990:	e2504000 	subs	r4, r0, #0	; 0x0
  103994:	08bd8010 	ldmeqia	sp!, {r4, pc}
  103998:	ebfffc98 	bl	102c00 <vTaskSuspendAll>
  10399c:	e1a00004 	mov	r0, r4
  1039a0:	ebfff25f 	bl	100324 <free>
  1039a4:	e8bd4010 	ldmia	sp!, {r4, lr}
  1039a8:	eafffdf1 	b	103174 <xTaskResumeAll>

001039ac <pvPortMalloc>:
  1039ac:	e92d4010 	stmdb	sp!, {r4, lr}
  1039b0:	e1a04000 	mov	r4, r0
  1039b4:	ebfffc91 	bl	102c00 <vTaskSuspendAll>
  1039b8:	e1a00004 	mov	r0, r4
  1039bc:	ebfff25d 	bl	100338 <malloc>
  1039c0:	e1a04000 	mov	r4, r0
  1039c4:	ebfffdea 	bl	103174 <xTaskResumeAll>
  1039c8:	e1a00004 	mov	r0, r4
  1039cc:	e8bd8010 	ldmia	sp!, {r4, pc}

001039d0 <vDetachUSBInterface>:
  1039d0:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  1039d4:	e3a03801 	mov	r3, #65536	; 0x10000
  1039d8:	e50230ff 	str	r3, [r2, #-255]
  1039dc:	e50230ef 	str	r3, [r2, #-239]
  1039e0:	e50230cf 	str	r3, [r2, #-207]
  1039e4:	e12fff1e 	bx	lr

001039e8 <prvSendStall>:
  1039e8:	e52de004 	str	lr, [sp, #-4]!
  1039ec:	ebffff70 	bl	1037b4 <vPortEnterCritical>
  1039f0:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  1039f4:	e5123fcf 	ldr	r3, [r2, #-4047]
  1039f8:	e3c33030 	bic	r3, r3, #48	; 0x30
  1039fc:	e383306f 	orr	r3, r3, #111	; 0x6f
  103a00:	e5023fcf 	str	r3, [r2, #-4047]
  103a04:	e49de004 	ldr	lr, [sp], #4
  103a08:	eaffff74 	b	1037e0 <vPortExitCritical>

00103a0c <prvSendZLP>:
  103a0c:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  103a10:	e5123fcf 	ldr	r3, [r2, #-4047]
  103a14:	e3130010 	tst	r3, #16	; 0x10
  103a18:	e92d4010 	stmdb	sp!, {r4, lr}
  103a1c:	0a000005 	beq	103a38 <prvSendZLP+0x2c>
  103a20:	e1a04002 	mov	r4, r2
  103a24:	e3a00001 	mov	r0, #1	; 0x1
  103a28:	ebfffea1 	bl	1034b4 <vTaskDelay>
  103a2c:	e5143fcf 	ldr	r3, [r4, #-4047]
  103a30:	e3130010 	tst	r3, #16	; 0x10
  103a34:	1afffffa 	bne	103a24 <prvSendZLP+0x18>
  103a38:	ebffff5d 	bl	1037b4 <vPortEnterCritical>
  103a3c:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  103a40:	e59f101c 	ldr	r1, [pc, #28]	; 103a64 <prog+0x3a20>
  103a44:	e5103fcf 	ldr	r3, [r0, #-4047]
  103a48:	e5912080 	ldr	r2, [r1, #128]
  103a4c:	e3c33030 	bic	r3, r3, #48	; 0x30
  103a50:	e383305f 	orr	r3, r3, #95	; 0x5f
  103a54:	e5812084 	str	r2, [r1, #132]
  103a58:	e5003fcf 	str	r3, [r0, #-4047]
  103a5c:	e8bd4010 	ldmia	sp!, {r4, lr}
  103a60:	eaffff5e 	b	1037e0 <vPortExitCritical>
  103a64:	00200d54 	eoreq	r0, r0, r4, asr sp

00103a68 <prvSendNextSegment>:
  103a68:	e92d4010 	stmdb	sp!, {r4, lr}
  103a6c:	e59f40e4 	ldr	r4, [pc, #228]	; 103b58 <prog+0x3b14>
  103a70:	e5942084 	ldr	r2, [r4, #132]
  103a74:	e5943080 	ldr	r3, [r4, #128]
  103a78:	e1520003 	cmp	r2, r3
  103a7c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  103a80:	9a00002a 	bls	103b30 <prvSendNextSegment+0xc8>
  103a84:	e0633002 	rsb	r3, r3, r2
  103a88:	e58d3000 	str	r3, [sp]
  103a8c:	e59d2000 	ldr	r2, [sp]
  103a90:	e3520008 	cmp	r2, #8	; 0x8
  103a94:	959d3000 	ldrls	r3, [sp]
  103a98:	83a03008 	movhi	r3, #8	; 0x8
  103a9c:	858d3008 	strhi	r3, [sp, #8]
  103aa0:	958d3008 	strls	r3, [sp, #8]
  103aa4:	ea000001 	b	103ab0 <prvSendNextSegment+0x48>
  103aa8:	e3a00001 	mov	r0, #1	; 0x1
  103aac:	ebfffe80 	bl	1034b4 <vTaskDelay>
  103ab0:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  103ab4:	e5132fcf 	ldr	r2, [r3, #-4047]
  103ab8:	e3120010 	tst	r2, #16	; 0x10
  103abc:	1afffff9 	bne	103aa8 <prvSendNextSegment+0x40>
  103ac0:	e59d3008 	ldr	r3, [sp, #8]
  103ac4:	e3530000 	cmp	r3, #0	; 0x0
  103ac8:	0a00000b 	beq	103afc <prvSendNextSegment+0x94>
  103acc:	e5941080 	ldr	r1, [r4, #128]
  103ad0:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  103ad4:	e7d43001 	ldrb	r3, [r4, r1]
  103ad8:	e5003faf 	str	r3, [r0, #-4015]
  103adc:	e59d2008 	ldr	r2, [sp, #8]
  103ae0:	e2422001 	sub	r2, r2, #1	; 0x1
  103ae4:	e58d2008 	str	r2, [sp, #8]
  103ae8:	e59d3008 	ldr	r3, [sp, #8]
  103aec:	e3530000 	cmp	r3, #0	; 0x0
  103af0:	e2811001 	add	r1, r1, #1	; 0x1
  103af4:	1afffff6 	bne	103ad4 <prvSendNextSegment+0x6c>
  103af8:	e5841080 	str	r1, [r4, #128]
  103afc:	ebffff2c 	bl	1037b4 <vPortEnterCritical>
  103b00:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  103b04:	e5112fcf 	ldr	r2, [r1, #-4047]
  103b08:	e58d2004 	str	r2, [sp, #4]
  103b0c:	e59d3004 	ldr	r3, [sp, #4]
  103b10:	e3c33030 	bic	r3, r3, #48	; 0x30
  103b14:	e383305f 	orr	r3, r3, #95	; 0x5f
  103b18:	e58d3004 	str	r3, [sp, #4]
  103b1c:	e59d2004 	ldr	r2, [sp, #4]
  103b20:	e5012fcf 	str	r2, [r1, #-4047]
  103b24:	e28dd00c 	add	sp, sp, #12	; 0xc
  103b28:	e8bd4010 	ldmia	sp!, {r4, lr}
  103b2c:	eaffff2b 	b	1037e0 <vPortExitCritical>
  103b30:	e59f4024 	ldr	r4, [pc, #36]	; 103b5c <prog+0x3b18>
  103b34:	e5943000 	ldr	r3, [r4]
  103b38:	e3530004 	cmp	r3, #4	; 0x4
  103b3c:	0a000001 	beq	103b48 <prvSendNextSegment+0xe0>
  103b40:	e28dd00c 	add	sp, sp, #12	; 0xc
  103b44:	e8bd8010 	ldmia	sp!, {r4, pc}
  103b48:	ebffffaf 	bl	103a0c <prvSendZLP>
  103b4c:	e3a03000 	mov	r3, #0	; 0x0
  103b50:	e5843000 	str	r3, [r4]
  103b54:	eafffff9 	b	103b40 <prvSendNextSegment+0xd8>
  103b58:	00200d54 	eoreq	r0, r0, r4, asr sp
  103b5c:	00200d44 	eoreq	r0, r0, r4, asr #26

00103b60 <prvSendControlData>:
  103b60:	e1a01801 	mov	r1, r1, lsl #16
  103b64:	e1a01821 	mov	r1, r1, lsr #16
  103b68:	e1510002 	cmp	r1, r2
  103b6c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  103b70:	e1a05002 	mov	r5, r2
  103b74:	93a02000 	movls	r2, #0	; 0x0
  103b78:	83a02001 	movhi	r2, #1	; 0x1
  103b7c:	31a05001 	movcc	r5, r1
  103b80:	3a000008 	bcc	103ba8 <prvSendControlData+0x48>
  103b84:	e3530000 	cmp	r3, #0	; 0x0
  103b88:	03a03000 	moveq	r3, #0	; 0x0
  103b8c:	12023001 	andne	r3, r2, #1	; 0x1
  103b90:	e3530000 	cmp	r3, #0	; 0x0
  103b94:	0a000003 	beq	103ba8 <prvSendControlData+0x48>
  103b98:	e3150007 	tst	r5, #7	; 0x7
  103b9c:	059f302c 	ldreq	r3, [pc, #44]	; 103bd0 <prog+0x3b8c>
  103ba0:	03a02004 	moveq	r2, #4	; 0x4
  103ba4:	05832000 	streq	r2, [r3]
  103ba8:	e59f4024 	ldr	r4, [pc, #36]	; 103bd4 <prog+0x3b90>
  103bac:	e1a01000 	mov	r1, r0
  103bb0:	e1a02005 	mov	r2, r5
  103bb4:	e1a00004 	mov	r0, r4
  103bb8:	ebfff3bf 	bl	100abc <memcpy>
  103bbc:	e3a03000 	mov	r3, #0	; 0x0
  103bc0:	e5843080 	str	r3, [r4, #128]
  103bc4:	e5845084 	str	r5, [r4, #132]
  103bc8:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  103bcc:	eaffffa5 	b	103a68 <prvSendNextSegment>
  103bd0:	00200d44 	eoreq	r0, r0, r4, asr #26
  103bd4:	00200d54 	eoreq	r0, r0, r4, asr sp

00103bd8 <vUSBCDCTask>:
  103bd8:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  103bdc:	e59fc964 	ldr	ip, [pc, #2404]	; 104548 <prog+0x4504>
  103be0:	e24dd028 	sub	sp, sp, #40	; 0x28
  103be4:	e59c4010 	ldr	r4, [ip, #16]
  103be8:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  103bec:	e28dc004 	add	ip, sp, #4	; 0x4
  103bf0:	e58dc000 	str	ip, [sp]
  103bf4:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
  103bf8:	e58d4014 	str	r4, [sp, #20]
  103bfc:	ebfffeec 	bl	1037b4 <vPortEnterCritical>
  103c00:	ebffff72 	bl	1039d0 <vDetachUSBInterface>
  103c04:	ebfffef5 	bl	1037e0 <vPortExitCritical>
  103c08:	e3a0003c 	mov	r0, #60	; 0x3c
  103c0c:	ebfffe28 	bl	1034b4 <vTaskDelay>
  103c10:	ebfffee7 	bl	1037b4 <vPortEnterCritical>
  103c14:	e3a00004 	mov	r0, #4	; 0x4
  103c18:	e1a01000 	mov	r1, r0
  103c1c:	ebfffb60 	bl	1029a4 <xQueueCreate>
  103c20:	e59f1924 	ldr	r1, [pc, #2340]	; 10454c <prog+0x4508>
  103c24:	e5810000 	str	r0, [r1]
  103c28:	e3a01001 	mov	r1, #1	; 0x1
  103c2c:	e3a00b01 	mov	r0, #1024	; 0x400
  103c30:	ebfffb5b 	bl	1029a4 <xQueueCreate>
  103c34:	e59fb914 	ldr	fp, [pc, #2324]	; 104550 <prog+0x450c>
  103c38:	e3a01005 	mov	r1, #5	; 0x5
  103c3c:	e58b0000 	str	r0, [fp]
  103c40:	e3a000cd 	mov	r0, #205	; 0xcd
  103c44:	ebfffb56 	bl	1029a4 <xQueueCreate>
  103c48:	e59f2904 	ldr	r2, [pc, #2308]	; 104554 <prog+0x4510>
  103c4c:	e3a01014 	mov	r1, #20	; 0x14
  103c50:	e5820000 	str	r0, [r2]
  103c54:	e3a00040 	mov	r0, #64	; 0x40
  103c58:	ebfffb51 	bl	1029a4 <xQueueCreate>
  103c5c:	e59fc8e8 	ldr	ip, [pc, #2280]	; 10454c <prog+0x4508>
  103c60:	e59c3000 	ldr	r3, [ip]
  103c64:	e59f18ec 	ldr	r1, [pc, #2284]	; 104558 <prog+0x4514>
  103c68:	e3530000 	cmp	r3, #0	; 0x0
  103c6c:	e5810000 	str	r0, [r1]
  103c70:	0a000038 	beq	103d58 <vUSBCDCTask+0x180>
  103c74:	e59b3000 	ldr	r3, [fp]
  103c78:	e3530000 	cmp	r3, #0	; 0x0
  103c7c:	0a000035 	beq	103d58 <vUSBCDCTask+0x180>
  103c80:	e59f28cc 	ldr	r2, [pc, #2252]	; 104554 <prog+0x4510>
  103c84:	e5923000 	ldr	r3, [r2]
  103c88:	e3530000 	cmp	r3, #0	; 0x0
  103c8c:	0a000031 	beq	103d58 <vUSBCDCTask+0x180>
  103c90:	e3500000 	cmp	r0, #0	; 0x0
  103c94:	0a00002f 	beq	103d58 <vUSBCDCTask+0x180>
  103c98:	e59fc8bc 	ldr	ip, [pc, #2236]	; 10455c <prog+0x4518>
  103c9c:	e59f08bc 	ldr	r0, [pc, #2236]	; 104560 <prog+0x451c>
  103ca0:	e59f18bc 	ldr	r1, [pc, #2236]	; 104564 <prog+0x4520>
  103ca4:	e3a04000 	mov	r4, #0	; 0x0
  103ca8:	e3a03002 	mov	r3, #2	; 0x2
  103cac:	e58c3000 	str	r3, [ip]
  103cb0:	e5c04000 	strb	r4, [r0]
  103cb4:	e5c14000 	strb	r4, [r1]
  103cb8:	e3e0ec03 	mvn	lr, #768	; 0x300
  103cbc:	e51e60d3 	ldr	r6, [lr, #-211]
  103cc0:	e3a0c080 	mov	ip, #128	; 0x80
  103cc4:	e3866201 	orr	r6, r6, #268435456	; 0x10000000
  103cc8:	e50e60d3 	str	r6, [lr, #-211]
  103ccc:	e50ec0ff 	str	ip, [lr, #-255]
  103cd0:	e59fc890 	ldr	ip, [pc, #2192]	; 104568 <prog+0x4524>
  103cd4:	e58c4080 	str	r4, [ip, #128]
  103cd8:	e59fc88c 	ldr	ip, [pc, #2188]	; 10456c <prog+0x4528>
  103cdc:	e58c4080 	str	r4, [ip, #128]
  103ce0:	e59fc888 	ldr	ip, [pc, #2184]	; 104570 <prog+0x452c>
  103ce4:	e3e05a4f 	mvn	r5, #323584	; 0x4f000
  103ce8:	e3e07c0b 	mvn	r7, #2816	; 0xb00
  103cec:	e3a08801 	mov	r8, #65536	; 0x10000
  103cf0:	e3a0ab02 	mov	sl, #2048	; 0x800
  103cf4:	e3e09000 	mvn	r9, #0	; 0x0
  103cf8:	e50ea0ef 	str	sl, [lr, #-239]
  103cfc:	e1a02004 	mov	r2, r4
  103d00:	e50780ff 	str	r8, [r7, #-255]
  103d04:	e3a01003 	mov	r1, #3	; 0x3
  103d08:	e50780ef 	str	r8, [r7, #-239]
  103d0c:	e59f3860 	ldr	r3, [pc, #2144]	; 104574 <prog+0x4530>
  103d10:	e50780cf 	str	r8, [r7, #-207]
  103d14:	e58c4000 	str	r4, [ip]
  103d18:	e5059feb 	str	r9, [r5, #-4075]
  103d1c:	e3a0000b 	mov	r0, #11	; 0xb
  103d20:	e5059fdf 	str	r9, [r5, #-4063]
  103d24:	e5054f8b 	str	r4, [r5, #-3979]
  103d28:	e5054fcf 	str	r4, [r5, #-4047]
  103d2c:	e5054fcb 	str	r4, [r5, #-4043]
  103d30:	e5054fc7 	str	r4, [r5, #-4039]
  103d34:	e5054fc3 	str	r4, [r5, #-4035]
  103d38:	e5054ffb 	str	r4, [r5, #-4091]
  103d3c:	e5054ff7 	str	r4, [r5, #-4087]
  103d40:	ebfff946 	bl	102260 <AT91F_AIC_ConfigureIt>
  103d44:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  103d48:	e3a00ffa 	mov	r0, #1000	; 0x3e8
  103d4c:	e583a021 	str	sl, [r3, #33]
  103d50:	ebfffdd7 	bl	1034b4 <vTaskDelay>
  103d54:	e50780cb 	str	r8, [r7, #-203]
  103d58:	ebfffea0 	bl	1037e0 <vPortExitCritical>
  103d5c:	e59f9814 	ldr	r9, [pc, #2068]	; 104578 <prog+0x4534>
  103d60:	e28da01b 	add	sl, sp, #27	; 0x1b
  103d64:	e28d8027 	add	r8, sp, #39	; 0x27
  103d68:	e28d2008 	add	r2, sp, #8	; 0x8
  103d6c:	e892000c 	ldmia	r2, {r2, r3}
  103d70:	e59f17d4 	ldr	r1, [pc, #2004]	; 10454c <prog+0x4508>
  103d74:	e1530002 	cmp	r3, r2
  103d78:	33a02000 	movcc	r2, #0	; 0x0
  103d7c:	23a02001 	movcs	r2, #1	; 0x1
  103d80:	e5910000 	ldr	r0, [r1]
  103d84:	e3a03000 	mov	r3, #0	; 0x0
  103d88:	e28d1020 	add	r1, sp, #32	; 0x20
  103d8c:	ebfffa44 	bl	1026a4 <xQueueGenericReceive>
  103d90:	e3500000 	cmp	r0, #0	; 0x0
  103d94:	0a000030 	beq	103e5c <vUSBCDCTask+0x284>
  103d98:	e59d5020 	ldr	r5, [sp, #32]
  103d9c:	e5953000 	ldr	r3, [r5]
  103da0:	e3130001 	tst	r3, #1	; 0x1
  103da4:	0a000029 	beq	103e50 <vUSBCDCTask+0x278>
  103da8:	e5950004 	ldr	r0, [r5, #4]
  103dac:	e1a03820 	mov	r3, r0, lsr #16
  103db0:	e1a07a83 	mov	r7, r3, lsl #21
  103db4:	e3100001 	tst	r0, #1	; 0x1
  103db8:	e1a07aa7 	mov	r7, r7, lsr #21
  103dbc:	0a000013 	beq	103e10 <vUSBCDCTask+0x238>
  103dc0:	e59f27a8 	ldr	r2, [pc, #1960]	; 104570 <prog+0x452c>
  103dc4:	e5926000 	ldr	r6, [r2]
  103dc8:	e3560002 	cmp	r6, #2	; 0x2
  103dcc:	0a000189 	beq	1043f8 <prog+0x43b4>
  103dd0:	e3560003 	cmp	r6, #3	; 0x3
  103dd4:	1a000184 	bne	1043ec <prog+0x43a8>
  103dd8:	e59f379c 	ldr	r3, [pc, #1948]	; 10457c <prog+0x4538>
  103ddc:	e5931000 	ldr	r1, [r3]
  103de0:	e3510000 	cmp	r1, #0	; 0x0
  103de4:	13a02001 	movne	r2, #1	; 0x1
  103de8:	13e03a4f 	mvnne	r3, #323584	; 0x4f000
  103dec:	03e03a4f 	mvneq	r3, #323584	; 0x4f000
  103df0:	e59fc778 	ldr	ip, [pc, #1912]	; 104570 <prog+0x452c>
  103df4:	15032ffb 	strne	r2, [r3, #-4091]
  103df8:	05031ffb 	streq	r1, [r3, #-4091]
  103dfc:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  103e00:	e3813c01 	orr	r3, r1, #256	; 0x100
  103e04:	e3a01000 	mov	r1, #0	; 0x0
  103e08:	e5023ff7 	str	r3, [r2, #-4087]
  103e0c:	e58c1000 	str	r1, [ip]
  103e10:	e3100002 	tst	r0, #2	; 0x2
  103e14:	0a000099 	beq	104080 <vUSBCDCTask+0x4a8>
  103e18:	e59f074c 	ldr	r0, [pc, #1868]	; 10456c <prog+0x4528>
  103e1c:	e2800084 	add	r0, r0, #132	; 0x84
  103e20:	e8100009 	ldmda	r0, {r0, r3}
  103e24:	e0433000 	sub	r3, r3, r0
  103e28:	e59f1738 	ldr	r1, [pc, #1848]	; 104568 <prog+0x4524>
  103e2c:	e20340ff 	and	r4, r3, #255	; 0xff
  103e30:	e1570004 	cmp	r7, r4
  103e34:	e5912084 	ldr	r2, [r1, #132]
  103e38:	320740ff 	andcc	r4, r7, #255	; 0xff
  103e3c:	e3540000 	cmp	r4, #0	; 0x0
  103e40:	e5812080 	str	r2, [r1, #128]
  103e44:	e59f6720 	ldr	r6, [pc, #1824]	; 10456c <prog+0x4528>
  103e48:	1a000084 	bne	104060 <vUSBCDCTask+0x488>
  103e4c:	e59d5020 	ldr	r5, [sp, #32]
  103e50:	e5953000 	ldr	r3, [r5]
  103e54:	e3130a01 	tst	r3, #4096	; 0x1000
  103e58:	1a0000d5 	bne	1041b4 <prog+0x4170>
  103e5c:	e59f070c 	ldr	r0, [pc, #1804]	; 104570 <prog+0x452c>
  103e60:	e5903000 	ldr	r3, [r0]
  103e64:	e3530005 	cmp	r3, #5	; 0x5
  103e68:	1affffbe 	bne	103d68 <vUSBCDCTask+0x190>
  103e6c:	e59f16f0 	ldr	r1, [pc, #1776]	; 104564 <prog+0x4520>
  103e70:	e5d13000 	ldrb	r3, [r1]
  103e74:	e3530000 	cmp	r3, #0	; 0x0
  103e78:	0affffba 	beq	103d68 <vUSBCDCTask+0x190>
  103e7c:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  103e80:	e5132fc7 	ldr	r2, [r3, #-4039]
  103e84:	e3120010 	tst	r2, #16	; 0x10
  103e88:	1a000045 	bne	103fa4 <vUSBCDCTask+0x3cc>
  103e8c:	e59d000c 	ldr	r0, [sp, #12]
  103e90:	e59d2008 	ldr	r2, [sp, #8]
  103e94:	e1500002 	cmp	r0, r2
  103e98:	2a0000af 	bcs	10415c <prog+0x4118>
  103e9c:	e1500002 	cmp	r0, r2
  103ea0:	e3a04000 	mov	r4, #0	; 0x0
  103ea4:	3a000027 	bcc	103f48 <vUSBCDCTask+0x370>
  103ea8:	e59fc6a8 	ldr	ip, [pc, #1704]	; 104558 <prog+0x4514>
  103eac:	e3a02000 	mov	r2, #0	; 0x0
  103eb0:	e59c0000 	ldr	r0, [ip]
  103eb4:	e28d1004 	add	r1, sp, #4	; 0x4
  103eb8:	e1a03002 	mov	r3, r2
  103ebc:	ebfff9f8 	bl	1026a4 <xQueueGenericReceive>
  103ec0:	e3500000 	cmp	r0, #0	; 0x0
  103ec4:	058d0008 	streq	r0, [sp, #8]
  103ec8:	058d000c 	streq	r0, [sp, #12]
  103ecc:	0a000003 	beq	103ee0 <vUSBCDCTask+0x308>
  103ed0:	e59d000c 	ldr	r0, [sp, #12]
  103ed4:	e59d2008 	ldr	r2, [sp, #8]
  103ed8:	e1500002 	cmp	r0, r2
  103edc:	3a000019 	bcc	103f48 <vUSBCDCTask+0x370>
  103ee0:	e59f166c 	ldr	r1, [pc, #1644]	; 104554 <prog+0x4510>
  103ee4:	e3a02000 	mov	r2, #0	; 0x0
  103ee8:	e5910000 	ldr	r0, [r1]
  103eec:	e1a03002 	mov	r3, r2
  103ef0:	e1a0100a 	mov	r1, sl
  103ef4:	ebfff9ea 	bl	1026a4 <xQueueGenericReceive>
  103ef8:	e3500000 	cmp	r0, #0	; 0x0
  103efc:	0a000024 	beq	103f94 <vUSBCDCTask+0x3bc>
  103f00:	e5dd101b 	ldrb	r1, [sp, #27]
  103f04:	e3510000 	cmp	r1, #0	; 0x0
  103f08:	da000007 	ble	103f2c <vUSBCDCTask+0x354>
  103f0c:	e3a02000 	mov	r2, #0	; 0x0
  103f10:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  103f14:	e2822001 	add	r2, r2, #1	; 0x1
  103f18:	e7d2300a 	ldrb	r3, [r2, sl]
  103f1c:	e1520001 	cmp	r2, r1
  103f20:	e5003fa7 	str	r3, [r0, #-4007]
  103f24:	e2844001 	add	r4, r4, #1	; 0x1
  103f28:	1afffff9 	bne	103f14 <vUSBCDCTask+0x33c>
  103f2c:	e2844001 	add	r4, r4, #1	; 0x1
  103f30:	e354003b 	cmp	r4, #59	; 0x3b
  103f34:	ca000016 	bgt	103f94 <vUSBCDCTask+0x3bc>
  103f38:	e59d000c 	ldr	r0, [sp, #12]
  103f3c:	e59d2008 	ldr	r2, [sp, #8]
  103f40:	e1500002 	cmp	r0, r2
  103f44:	2affffd7 	bcs	103ea8 <vUSBCDCTask+0x2d0>
  103f48:	e59dc004 	ldr	ip, [sp, #4]
  103f4c:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  103f50:	e1500002 	cmp	r0, r2
  103f54:	e2844001 	add	r4, r4, #1	; 0x1
  103f58:	e2801001 	add	r1, r0, #1	; 0x1
  103f5c:	2a000007 	bcs	103f80 <vUSBCDCTask+0x3a8>
  103f60:	e7dc3000 	ldrb	r3, [ip, r0]
  103f64:	e354003f 	cmp	r4, #63	; 0x3f
  103f68:	e50e3fa7 	str	r3, [lr, #-4007]
  103f6c:	e1a00001 	mov	r0, r1
  103f70:	e58d100c 	str	r1, [sp, #12]
  103f74:	dafffff5 	ble	103f50 <vUSBCDCTask+0x378>
  103f78:	e1520001 	cmp	r2, r1
  103f7c:	8a000004 	bhi	103f94 <vUSBCDCTask+0x3bc>
  103f80:	e59d3010 	ldr	r3, [sp, #16]
  103f84:	e3530000 	cmp	r3, #0	; 0x0
  103f88:	159d0014 	ldrne	r0, [sp, #20]
  103f8c:	11a0e00f 	movne	lr, pc
  103f90:	112fff13 	bxne	r3
  103f94:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  103f98:	e5123fc7 	ldr	r3, [r2, #-4039]
  103f9c:	e3833010 	orr	r3, r3, #16	; 0x10
  103fa0:	e5023fc7 	str	r3, [r2, #-4039]
  103fa4:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  103fa8:	e5143fcb 	ldr	r3, [r4, #-4043]
  103fac:	e3130042 	tst	r3, #66	; 0x42
  103fb0:	0affff6c 	beq	103d68 <vUSBCDCTask+0x190>
  103fb4:	e5143fcb 	ldr	r3, [r4, #-4043]
  103fb8:	e59b0000 	ldr	r0, [fp]
  103fbc:	e1a03823 	mov	r3, r3, lsr #16
  103fc0:	e1a05a83 	mov	r5, r3, lsl #21
  103fc4:	ebfff918 	bl	10242c <uxQueueMessagesWaiting>
  103fc8:	e1a05aa5 	mov	r5, r5, lsr #21
  103fcc:	e2600b01 	rsb	r0, r0, #1024	; 0x400
  103fd0:	e1550000 	cmp	r5, r0
  103fd4:	2affff63 	bcs	103d68 <vUSBCDCTask+0x190>
  103fd8:	e3550000 	cmp	r5, #0	; 0x0
  103fdc:	0a00000b 	beq	104010 <vUSBCDCTask+0x438>
  103fe0:	e1a06004 	mov	r6, r4
  103fe4:	e3a04000 	mov	r4, #0	; 0x0
  103fe8:	e516cfab 	ldr	ip, [r6, #-4011]
  103fec:	e3a02000 	mov	r2, #0	; 0x0
  103ff0:	e2844001 	add	r4, r4, #1	; 0x1
  103ff4:	e59b0000 	ldr	r0, [fp]
  103ff8:	e1a01008 	mov	r1, r8
  103ffc:	e1a03002 	mov	r3, r2
  104000:	e5cdc027 	strb	ip, [sp, #39]
  104004:	ebfffa0c 	bl	10283c <xQueueGenericSend>
  104008:	e1540005 	cmp	r4, r5
  10400c:	1afffff5 	bne	103fe8 <vUSBCDCTask+0x410>
  104010:	ebfffde7 	bl	1037b4 <vPortEnterCritical>
  104014:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  104018:	e59fc53c 	ldr	ip, [pc, #1340]	; 10455c <prog+0x4518>
  10401c:	e5143fcb 	ldr	r3, [r4, #-4043]
  104020:	e59c2000 	ldr	r2, [ip]
  104024:	e383304f 	orr	r3, r3, #79	; 0x4f
  104028:	e1e02002 	mvn	r2, r2
  10402c:	e3c33030 	bic	r3, r3, #48	; 0x30
  104030:	e0033002 	and	r3, r3, r2
  104034:	e5043fcb 	str	r3, [r4, #-4043]
  104038:	ebfffde8 	bl	1037e0 <vPortExitCritical>
  10403c:	e3a01002 	mov	r1, #2	; 0x2
  104040:	e5041fef 	str	r1, [r4, #-4079]
  104044:	e59f0510 	ldr	r0, [pc, #1296]	; 10455c <prog+0x4518>
  104048:	e5903000 	ldr	r3, [r0]
  10404c:	e1530001 	cmp	r3, r1
  104050:	03a03040 	moveq	r3, #64	; 0x40
  104054:	05803000 	streq	r3, [r0]
  104058:	15801000 	strne	r1, [r0]
  10405c:	eaffffd0 	b	103fa4 <vUSBCDCTask+0x3cc>
  104060:	e1a00006 	mov	r0, r6
  104064:	e2851008 	add	r1, r5, #8	; 0x8
  104068:	e1a02004 	mov	r2, r4
  10406c:	ebfff292 	bl	100abc <memcpy>
  104070:	e5963080 	ldr	r3, [r6, #128]
  104074:	e0843003 	add	r3, r4, r3
  104078:	e5863080 	str	r3, [r6, #128]
  10407c:	e5950004 	ldr	r0, [r5, #4]
  104080:	e3100004 	tst	r0, #4	; 0x4
  104084:	0a000020 	beq	10410c <vUSBCDCTask+0x534>
  104088:	e3570007 	cmp	r7, #7	; 0x7
  10408c:	9a00001e 	bls	10410c <vUSBCDCTask+0x534>
  104090:	e5d51008 	ldrb	r1, [r5, #8]
  104094:	e5c91000 	strb	r1, [r9]
  104098:	e5d52009 	ldrb	r2, [r5, #9]
  10409c:	e5c92001 	strb	r2, [r9, #1]
  1040a0:	e5d5300b 	ldrb	r3, [r5, #11]
  1040a4:	e1a03403 	mov	r3, r3, lsl #8
  1040a8:	e1c930b2 	strh	r3, [r9, #2]
  1040ac:	e5d5200a 	ldrb	r2, [r5, #10]
  1040b0:	e1833002 	orr	r3, r3, r2
  1040b4:	e1c930b2 	strh	r3, [r9, #2]
  1040b8:	e5d5200d 	ldrb	r2, [r5, #13]
  1040bc:	e1a02402 	mov	r2, r2, lsl #8
  1040c0:	e1c920b4 	strh	r2, [r9, #4]
  1040c4:	e5d5300c 	ldrb	r3, [r5, #12]
  1040c8:	e1822003 	orr	r2, r2, r3
  1040cc:	e1c920b4 	strh	r2, [r9, #4]
  1040d0:	e5d5300f 	ldrb	r3, [r5, #15]
  1040d4:	e1a03403 	mov	r3, r3, lsl #8
  1040d8:	e1c930b6 	strh	r3, [r9, #6]
  1040dc:	e5d5200e 	ldrb	r2, [r5, #14]
  1040e0:	e59fc484 	ldr	ip, [pc, #1156]	; 10456c <prog+0x4528>
  1040e4:	e1833002 	orr	r3, r3, r2
  1040e8:	e3110080 	tst	r1, #128	; 0x80
  1040ec:	e3a02000 	mov	r2, #0	; 0x0
  1040f0:	e1c930b6 	strh	r3, [r9, #6]
  1040f4:	e58c2080 	str	r2, [ip, #128]
  1040f8:	1a0000d9 	bne	104464 <prog+0x4420>
  1040fc:	e3530080 	cmp	r3, #128	; 0x80
  104100:	958c3084 	strls	r3, [ip, #132]
  104104:	95950004 	ldrls	r0, [r5, #4]
  104108:	8a000024 	bhi	1041a0 <prog+0x415c>
  10410c:	e3100006 	tst	r0, #6	; 0x6
  104110:	0affff4d 	beq	103e4c <vUSBCDCTask+0x274>
  104114:	e59f0450 	ldr	r0, [pc, #1104]	; 10456c <prog+0x4528>
  104118:	e2802080 	add	r2, r0, #128	; 0x80
  10411c:	e892000c 	ldmia	r2, {r2, r3}
  104120:	e1520003 	cmp	r2, r3
  104124:	3affff48 	bcc	103e4c <vUSBCDCTask+0x274>
  104128:	e5d93000 	ldrb	r3, [r9]
  10412c:	e2032060 	and	r2, r3, #96	; 0x60
  104130:	e2033003 	and	r3, r3, #3	; 0x3
  104134:	e18331a2 	orr	r3, r3, r2, lsr #3
  104138:	e3530005 	cmp	r3, #5	; 0x5
  10413c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  104140:	ea000016 	b	1041a0 <prog+0x415c>
  104144:	00104240 	andeqs	r4, r0, r0, asr #4
  104148:	00104214 	andeqs	r4, r0, r4, lsl r2
  10414c:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104150:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104154:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104158:	00104280 	andeqs	r4, r0, r0, lsl #5
  10415c:	e59f23f0 	ldr	r2, [pc, #1008]	; 104554 <prog+0x4510>
  104160:	e5920000 	ldr	r0, [r2]
  104164:	ebfff8b0 	bl	10242c <uxQueueMessagesWaiting>
  104168:	e3500000 	cmp	r0, #0	; 0x0
  10416c:	0a0000bf 	beq	104470 <prog+0x442c>
  104170:	e59d000c 	ldr	r0, [sp, #12]
  104174:	e59d2008 	ldr	r2, [sp, #8]
  104178:	eaffff47 	b	103e9c <vUSBCDCTask+0x2c4>
  10417c:	e1d920b2 	ldrh	r2, [r9, #2]
  104180:	e1a03422 	mov	r3, r2, lsr #8
  104184:	e3530002 	cmp	r3, #2	; 0x2
  104188:	e59f13e8 	ldr	r1, [pc, #1000]	; 104578 <prog+0x4534>
  10418c:	0a0000cc 	beq	1044c4 <prog+0x4480>
  104190:	e3530003 	cmp	r3, #3	; 0x3
  104194:	0a0000c1 	beq	1044a0 <prog+0x445c>
  104198:	e3530001 	cmp	r3, #1	; 0x1
  10419c:	0a0000b9 	beq	104488 <prog+0x4444>
  1041a0:	ebfffe10 	bl	1039e8 <prvSendStall>
  1041a4:	e59d5020 	ldr	r5, [sp, #32]
  1041a8:	e5953000 	ldr	r3, [r5]
  1041ac:	e3130a01 	tst	r3, #4096	; 0x1000
  1041b0:	0affff29 	beq	103e5c <vUSBCDCTask+0x284>
  1041b4:	e59f13a8 	ldr	r1, [pc, #936]	; 104564 <prog+0x4520>
  1041b8:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1041bc:	e3a02000 	mov	r2, #0	; 0x0
  1041c0:	e3a0300f 	mov	r3, #15	; 0xf
  1041c4:	e5c12000 	strb	r2, [r1]
  1041c8:	e5043fd7 	str	r3, [r4, #-4055]
  1041cc:	e5042fd7 	str	r2, [r4, #-4055]
  1041d0:	e59f2398 	ldr	r2, [pc, #920]	; 104570 <prog+0x452c>
  1041d4:	e28330f1 	add	r3, r3, #241	; 0xf1
  1041d8:	e3a05001 	mov	r5, #1	; 0x1
  1041dc:	e5043ff7 	str	r3, [r4, #-4087]
  1041e0:	e5825000 	str	r5, [r2]
  1041e4:	ebfffd72 	bl	1037b4 <vPortEnterCritical>
  1041e8:	e5143fcf 	ldr	r3, [r4, #-4047]
  1041ec:	e383304f 	orr	r3, r3, #79	; 0x4f
  1041f0:	e3c33030 	bic	r3, r3, #48	; 0x30
  1041f4:	e3833902 	orr	r3, r3, #32768	; 0x8000
  1041f8:	e5043fcf 	str	r3, [r4, #-4047]
  1041fc:	e5045fef 	str	r5, [r4, #-4079]
  104200:	ebfffd76 	bl	1037e0 <vPortExitCritical>
  104204:	e59fc350 	ldr	ip, [pc, #848]	; 10455c <prog+0x4518>
  104208:	e3a03002 	mov	r3, #2	; 0x2
  10420c:	e58c3000 	str	r3, [ip]
  104210:	eaffff11 	b	103e5c <vUSBCDCTask+0x284>
  104214:	e5d93001 	ldrb	r3, [r9, #1]
  104218:	e3a0c000 	mov	ip, #0	; 0x0
  10421c:	e3530000 	cmp	r3, #0	; 0x0
  104220:	e1cdc2b4 	strh	ip, [sp, #36]
  104224:	1affffdd 	bne	1041a0 <prog+0x415c>
  104228:	e3a01002 	mov	r1, #2	; 0x2
  10422c:	e28d0024 	add	r0, sp, #36	; 0x24
  104230:	e1a02001 	mov	r2, r1
  104234:	ebfffe49 	bl	103b60 <prvSendControlData>
  104238:	e59d5020 	ldr	r5, [sp, #32]
  10423c:	eaffff03 	b	103e50 <vUSBCDCTask+0x278>
  104240:	e5d93001 	ldrb	r3, [r9, #1]
  104244:	e3a01000 	mov	r1, #0	; 0x0
  104248:	e1cd12b4 	strh	r1, [sp, #36]
  10424c:	e3530009 	cmp	r3, #9	; 0x9
  104250:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  104254:	eaffffd1 	b	1041a0 <prog+0x415c>
  104258:	00104380 	andeqs	r4, r0, r0, lsl #7
  10425c:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104260:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104264:	00104334 	andeqs	r4, r0, r4, lsr r3
  104268:	001041a0 	andeqs	r4, r0, r0, lsr #3
  10426c:	00104340 	andeqs	r4, r0, r0, asr #6
  104270:	0010417c 	andeqs	r4, r0, ip, ror r1
  104274:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104278:	00104364 	andeqs	r4, r0, r4, ror #6
  10427c:	0010431c 	andeqs	r4, r0, ip, lsl r3
  104280:	e5d93001 	ldrb	r3, [r9, #1]
  104284:	e3530022 	cmp	r3, #34	; 0x22
  104288:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10428c:	eaffffc3 	b	1041a0 <prog+0x415c>
  104290:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104294:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104298:	001041a0 	andeqs	r4, r0, r0, lsr #3
  10429c:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042a0:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042a4:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042a8:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042ac:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042b0:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042b4:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042b8:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042bc:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042c0:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042c4:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042c8:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042cc:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042d0:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042d4:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042d8:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042dc:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042e0:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042e4:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042e8:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042ec:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042f0:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042f4:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042f8:	001041a0 	andeqs	r4, r0, r0, lsr #3
  1042fc:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104300:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104304:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104308:	001041a0 	andeqs	r4, r0, r0, lsr #3
  10430c:	001041a0 	andeqs	r4, r0, r0, lsr #3
  104310:	0010439c 	muleqs	r0, ip, r3
  104314:	001043b8 	ldreqh	r4, [r0], -r8
  104318:	001043d4 	ldreqsb	r4, [r0], -r4
  10431c:	e1d930b2 	ldrh	r3, [r9, #2]
  104320:	e59f2238 	ldr	r2, [pc, #568]	; 104560 <prog+0x451c>
  104324:	e5c23000 	strb	r3, [r2]
  104328:	e59f3240 	ldr	r3, [pc, #576]	; 104570 <prog+0x452c>
  10432c:	e3a02002 	mov	r2, #2	; 0x2
  104330:	e5832000 	str	r2, [r3]
  104334:	ebfffdb4 	bl	103a0c <prvSendZLP>
  104338:	e59d5020 	ldr	r5, [sp, #32]
  10433c:	eafffec3 	b	103e50 <vUSBCDCTask+0x278>
  104340:	ebfffdb1 	bl	103a0c <prvSendZLP>
  104344:	e1d920b2 	ldrh	r2, [r9, #2]
  104348:	e59f0220 	ldr	r0, [pc, #544]	; 104570 <prog+0x452c>
  10434c:	e59f1228 	ldr	r1, [pc, #552]	; 10457c <prog+0x4538>
  104350:	e59d5020 	ldr	r5, [sp, #32]
  104354:	e3a03003 	mov	r3, #3	; 0x3
  104358:	e5803000 	str	r3, [r0]
  10435c:	e5812000 	str	r2, [r1]
  104360:	eafffeba 	b	103e50 <vUSBCDCTask+0x278>
  104364:	e3a01001 	mov	r1, #1	; 0x1
  104368:	e59f01f0 	ldr	r0, [pc, #496]	; 104560 <prog+0x451c>
  10436c:	e1a02001 	mov	r2, r1
  104370:	e3a03000 	mov	r3, #0	; 0x0
  104374:	ebfffdf9 	bl	103b60 <prvSendControlData>
  104378:	e59d5020 	ldr	r5, [sp, #32]
  10437c:	eafffeb3 	b	103e50 <vUSBCDCTask+0x278>
  104380:	e3a01002 	mov	r1, #2	; 0x2
  104384:	e28d0024 	add	r0, sp, #36	; 0x24
  104388:	e1a02001 	mov	r2, r1
  10438c:	e3a03000 	mov	r3, #0	; 0x0
  104390:	ebfffdf2 	bl	103b60 <prvSendControlData>
  104394:	e59d5020 	ldr	r5, [sp, #32]
  104398:	eafffeac 	b	103e50 <vUSBCDCTask+0x278>
  10439c:	ebfffd9a 	bl	103a0c <prvSendZLP>
  1043a0:	e59f01d8 	ldr	r0, [pc, #472]	; 104580 <prog+0x453c>
  1043a4:	e59f11c0 	ldr	r1, [pc, #448]	; 10456c <prog+0x4528>
  1043a8:	e3a02007 	mov	r2, #7	; 0x7
  1043ac:	ebfff1c2 	bl	100abc <memcpy>
  1043b0:	e59d5020 	ldr	r5, [sp, #32]
  1043b4:	eafffea5 	b	103e50 <vUSBCDCTask+0x278>
  1043b8:	e59f01c0 	ldr	r0, [pc, #448]	; 104580 <prog+0x453c>
  1043bc:	e1d910b6 	ldrh	r1, [r9, #6]
  1043c0:	e3a02007 	mov	r2, #7	; 0x7
  1043c4:	e3a03000 	mov	r3, #0	; 0x0
  1043c8:	ebfffde4 	bl	103b60 <prvSendControlData>
  1043cc:	e59d5020 	ldr	r5, [sp, #32]
  1043d0:	eafffe9e 	b	103e50 <vUSBCDCTask+0x278>
  1043d4:	ebfffd8c 	bl	103a0c <prvSendZLP>
  1043d8:	e1d930b2 	ldrh	r3, [r9, #2]
  1043dc:	e59f0180 	ldr	r0, [pc, #384]	; 104564 <prog+0x4520>
  1043e0:	e59d5020 	ldr	r5, [sp, #32]
  1043e4:	e5c03000 	strb	r3, [r0]
  1043e8:	eafffe98 	b	103e50 <vUSBCDCTask+0x278>
  1043ec:	ebfffd9d 	bl	103a68 <prvSendNextSegment>
  1043f0:	e5950004 	ldr	r0, [r5, #4]
  1043f4:	eafffe85 	b	103e10 <vUSBCDCTask+0x238>
  1043f8:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1043fc:	e5046ffb 	str	r6, [r4, #-4091]
  104400:	ebfffceb 	bl	1037b4 <vPortEnterCritical>
  104404:	e5143fcb 	ldr	r3, [r4, #-4043]
  104408:	e383304f 	orr	r3, r3, #79	; 0x4f
  10440c:	e3c33030 	bic	r3, r3, #48	; 0x30
  104410:	e3833c82 	orr	r3, r3, #33280	; 0x8200
  104414:	e5043fcb 	str	r3, [r4, #-4043]
  104418:	e5046fef 	str	r6, [r4, #-4079]
  10441c:	e5143fc7 	ldr	r3, [r4, #-4039]
  104420:	e383304f 	orr	r3, r3, #79	; 0x4f
  104424:	e3c33030 	bic	r3, r3, #48	; 0x30
  104428:	e3a02004 	mov	r2, #4	; 0x4
  10442c:	e3833c86 	orr	r3, r3, #34304	; 0x8600
  104430:	e5043fc7 	str	r3, [r4, #-4039]
  104434:	e5042fef 	str	r2, [r4, #-4079]
  104438:	e5143fc3 	ldr	r3, [r4, #-4035]
  10443c:	e383304f 	orr	r3, r3, #79	; 0x4f
  104440:	e3c33030 	bic	r3, r3, #48	; 0x30
  104444:	e3833c87 	orr	r3, r3, #34560	; 0x8700
  104448:	e5043fc3 	str	r3, [r4, #-4035]
  10444c:	ebfffce3 	bl	1037e0 <vPortExitCritical>
  104450:	e59f3118 	ldr	r3, [pc, #280]	; 104570 <prog+0x452c>
  104454:	e5950004 	ldr	r0, [r5, #4]
  104458:	e3a02005 	mov	r2, #5	; 0x5
  10445c:	e5832000 	str	r2, [r3]
  104460:	eafffe6a 	b	103e10 <vUSBCDCTask+0x238>
  104464:	e58c2084 	str	r2, [ip, #132]
  104468:	e5950004 	ldr	r0, [r5, #4]
  10446c:	eaffff26 	b	10410c <vUSBCDCTask+0x534>
  104470:	e59f30e0 	ldr	r3, [pc, #224]	; 104558 <prog+0x4514>
  104474:	e5930000 	ldr	r0, [r3]
  104478:	ebfff7eb 	bl	10242c <uxQueueMessagesWaiting>
  10447c:	e3500000 	cmp	r0, #0	; 0x0
  104480:	0afffec7 	beq	103fa4 <vUSBCDCTask+0x3cc>
  104484:	eaffff39 	b	104170 <prog+0x412c>
  104488:	e1d110b6 	ldrh	r1, [r1, #6]
  10448c:	e59f00f0 	ldr	r0, [pc, #240]	; 104584 <prog+0x4540>
  104490:	e3a02012 	mov	r2, #18	; 0x12
  104494:	ebfffdb1 	bl	103b60 <prvSendControlData>
  104498:	e59d5020 	ldr	r5, [sp, #32]
  10449c:	eafffe6b 	b	103e50 <vUSBCDCTask+0x278>
  1044a0:	e20230ff 	and	r3, r2, #255	; 0xff
  1044a4:	e3530004 	cmp	r3, #4	; 0x4
  1044a8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  1044ac:	eaffff3b 	b	1041a0 <prog+0x415c>
  1044b0:	001044f4 	ldreqsh	r4, [r0], -r4
  1044b4:	00104510 	andeqs	r4, r0, r0, lsl r5
  1044b8:	0010452c 	andeqs	r4, r0, ip, lsr #10
  1044bc:	0010452c 	andeqs	r4, r0, ip, lsr #10
  1044c0:	0010452c 	andeqs	r4, r0, ip, lsr #10
  1044c4:	e20230ff 	and	r3, r2, #255	; 0xff
  1044c8:	e59fc0b8 	ldr	ip, [pc, #184]	; 104588 <prog+0x4544>
  1044cc:	e3530002 	cmp	r3, #2	; 0x2
  1044d0:	23a03002 	movcs	r3, #2	; 0x2
  1044d4:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  1044d8:	e59fc0ac 	ldr	ip, [pc, #172]	; 10458c <prog+0x4548>
  1044dc:	e1d110b6 	ldrh	r1, [r1, #6]
  1044e0:	e79c0103 	ldr	r0, [ip, r3, lsl #2]
  1044e4:	e3a03001 	mov	r3, #1	; 0x1
  1044e8:	ebfffd9c 	bl	103b60 <prvSendControlData>
  1044ec:	e59d5020 	ldr	r5, [sp, #32]
  1044f0:	eafffe56 	b	103e50 <vUSBCDCTask+0x278>
  1044f4:	e59f0094 	ldr	r0, [pc, #148]	; 104590 <prog+0x454c>
  1044f8:	e1d910b6 	ldrh	r1, [r9, #6]
  1044fc:	e3a02004 	mov	r2, #4	; 0x4
  104500:	e3a03001 	mov	r3, #1	; 0x1
  104504:	ebfffd95 	bl	103b60 <prvSendControlData>
  104508:	e59d5020 	ldr	r5, [sp, #32]
  10450c:	eafffe4f 	b	103e50 <vUSBCDCTask+0x278>
  104510:	e59f007c 	ldr	r0, [pc, #124]	; 104594 <prog+0x4550>
  104514:	e1d910b6 	ldrh	r1, [r9, #6]
  104518:	e3a0201c 	mov	r2, #28	; 0x1c
  10451c:	e3a03001 	mov	r3, #1	; 0x1
  104520:	ebfffd8e 	bl	103b60 <prvSendControlData>
  104524:	e59d5020 	ldr	r5, [sp, #32]
  104528:	eafffe48 	b	103e50 <vUSBCDCTask+0x278>
  10452c:	e59f0064 	ldr	r0, [pc, #100]	; 104598 <prog+0x4554>
  104530:	e1d910b6 	ldrh	r1, [r9, #6]
  104534:	e3a0202c 	mov	r2, #44	; 0x2c
  104538:	e3a03001 	mov	r3, #1	; 0x1
  10453c:	ebfffd87 	bl	103b60 <prvSendControlData>
  104540:	e59d5020 	ldr	r5, [sp, #32]
  104544:	eafffe41 	b	103e50 <vUSBCDCTask+0x278>
  104548:	00104d18 	andeqs	r4, r0, r8, lsl sp
  10454c:	00200f50 	eoreq	r0, r0, r0, asr pc
  104550:	00200e64 	eoreq	r0, r0, r4, ror #28
  104554:	00200e68 	eoreq	r0, r0, r8, ror #28
  104558:	00200e6c 	eoreq	r0, r0, ip, ror #28
  10455c:	00200e74 	eoreq	r0, r0, r4, ror lr
  104560:	00200d40 	eoreq	r0, r0, r0, asr #26
  104564:	00200e70 	eoreq	r0, r0, r0, ror lr
  104568:	00200d54 	eoreq	r0, r0, r4, asr sp
  10456c:	00200ddc 	ldreqd	r0, [r0], -ip
  104570:	00200d44 	eoreq	r0, r0, r4, asr #26
  104574:	00104740 	andeqs	r4, r0, r0, asr #14
  104578:	00200d4c 	eoreq	r0, r0, ip, asr #26
  10457c:	00200d48 	eoreq	r0, r0, r8, asr #26
  104580:	00104d2c 	andeqs	r4, r0, ip, lsr #26
  104584:	00104d04 	andeqs	r4, r0, r4, lsl #26
  104588:	00104cfc 	ldreqsh	r4, [r0], -ip
  10458c:	0020082c 	eoreq	r0, r0, ip, lsr #16
  104590:	00104c29 	andeqs	r4, r0, r9, lsr #24
  104594:	00104c2d 	andeqs	r4, r0, sp, lsr #24
  104598:	00104c49 	andeqs	r4, r0, r9, asr #24

0010459c <vUSB_ISR_Handler>:
  10459c:	e59f2190 	ldr	r2, [pc, #400]	; 104734 <prog+0x46f0>
  1045a0:	e5921000 	ldr	r1, [r2]
  1045a4:	e5923000 	ldr	r3, [r2]
  1045a8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1045ac:	e2833001 	add	r3, r3, #1	; 0x1
  1045b0:	e5823000 	str	r3, [r2]
  1045b4:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  1045b8:	e514cfe3 	ldr	ip, [r4, #-4067]
  1045bc:	e59f0174 	ldr	r0, [pc, #372]	; 104738 <prog+0x46f4>
  1045c0:	e514efcf 	ldr	lr, [r4, #-4047]
  1045c4:	e2011003 	and	r1, r1, #3	; 0x3
  1045c8:	e5143fe7 	ldr	r3, [r4, #-4071]
  1045cc:	e1a01201 	mov	r1, r1, lsl #4
  1045d0:	e24dd008 	sub	sp, sp, #8	; 0x8
  1045d4:	e0812000 	add	r2, r1, r0
  1045d8:	e3833a01 	orr	r3, r3, #4096	; 0x1000
  1045dc:	e3a05000 	mov	r5, #0	; 0x0
  1045e0:	e31e0006 	tst	lr, #6	; 0x6
  1045e4:	e781c000 	str	ip, [r1, r0]
  1045e8:	e582e004 	str	lr, [r2, #4]
  1045ec:	e5043fdf 	str	r3, [r4, #-4063]
  1045f0:	e88d0024 	stmia	sp, {r2, r5}
  1045f4:	0a000019 	beq	104660 <vUSB_ISR_Handler+0xc4>
  1045f8:	e1a0382e 	mov	r3, lr, lsr #16
  1045fc:	e1a0ca83 	mov	ip, r3, lsl #21
  104600:	e1a0caac 	mov	ip, ip, lsr #21
  104604:	e15c0005 	cmp	ip, r5
  104608:	0a000009 	beq	104634 <vUSB_ISR_Handler+0x98>
  10460c:	e1a00005 	mov	r0, r5
  104610:	e1a0e004 	mov	lr, r4
  104614:	e59d2000 	ldr	r2, [sp]
  104618:	e2803001 	add	r3, r0, #1	; 0x1
  10461c:	e0802002 	add	r2, r0, r2
  104620:	e51e1faf 	ldr	r1, [lr, #-4015]
  104624:	e20300ff 	and	r0, r3, #255	; 0xff
  104628:	e15c0000 	cmp	ip, r0
  10462c:	e5c21008 	strb	r1, [r2, #8]
  104630:	8afffff7 	bhi	104614 <vUSB_ISR_Handler+0x78>
  104634:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  104638:	e5113fcf 	ldr	r3, [r1, #-4047]
  10463c:	e3130004 	tst	r3, #4	; 0x4
  104640:	1a000025 	bne	1046dc <vUSB_ISR_Handler+0x140>
  104644:	e5113fcf 	ldr	r3, [r1, #-4047]
  104648:	e3c33002 	bic	r3, r3, #2	; 0x2
  10464c:	e5013fcf 	str	r3, [r1, #-4047]
  104650:	e1a02001 	mov	r2, r1
  104654:	e5123fcf 	ldr	r3, [r2, #-4047]
  104658:	e3130002 	tst	r3, #2	; 0x2
  10465c:	1afffffc 	bne	104654 <vUSB_ISR_Handler+0xb8>
  104660:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  104664:	e51e3fcb 	ldr	r3, [lr, #-4043]
  104668:	e3130042 	tst	r3, #66	; 0x42
  10466c:	13a03002 	movne	r3, #2	; 0x2
  104670:	150e3feb 	strne	r3, [lr, #-4075]
  104674:	e51e3fcf 	ldr	r3, [lr, #-4047]
  104678:	e3c33009 	bic	r3, r3, #9	; 0x9
  10467c:	e50e3fcf 	str	r3, [lr, #-4047]
  104680:	e51e2fcb 	ldr	r2, [lr, #-4043]
  104684:	e3c2200d 	bic	r2, r2, #13	; 0xd
  104688:	e50e2fcb 	str	r2, [lr, #-4043]
  10468c:	e51e3fc7 	ldr	r3, [lr, #-4039]
  104690:	e3c3304f 	bic	r3, r3, #79	; 0x4f
  104694:	e50e3fc7 	str	r3, [lr, #-4039]
  104698:	e51ecfc3 	ldr	ip, [lr, #-4035]
  10469c:	e59f3098 	ldr	r3, [pc, #152]	; 10473c <prog+0x46f8>
  1046a0:	e3ccc04f 	bic	ip, ip, #79	; 0x4f
  1046a4:	e5930000 	ldr	r0, [r3]
  1046a8:	e28d2004 	add	r2, sp, #4	; 0x4
  1046ac:	e3a03000 	mov	r3, #0	; 0x0
  1046b0:	e1a0100d 	mov	r1, sp
  1046b4:	e50ecfc3 	str	ip, [lr, #-4035]
  1046b8:	ebfff79b 	bl	10252c <xQueueGenericSendFromISR>
  1046bc:	e59d3004 	ldr	r3, [sp, #4]
  1046c0:	e3a02000 	mov	r2, #0	; 0x0
  1046c4:	e3530000 	cmp	r3, #0	; 0x0
  1046c8:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  1046cc:	e5832031 	str	r2, [r3, #49]
  1046d0:	1bfff8dc 	blne	102a48 <vTaskSwitchContext>
  1046d4:	e28dd008 	add	sp, sp, #8	; 0x8
  1046d8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1046dc:	e35c0000 	cmp	ip, #0	; 0x0
  1046e0:	1a000007 	bne	104704 <vUSB_ISR_Handler+0x168>
  1046e4:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  1046e8:	e5123fcf 	ldr	r3, [r2, #-4047]
  1046ec:	e3c33004 	bic	r3, r3, #4	; 0x4
  1046f0:	e5023fcf 	str	r3, [r2, #-4047]
  1046f4:	e5123fcf 	ldr	r3, [r2, #-4047]
  1046f8:	e3130004 	tst	r3, #4	; 0x4
  1046fc:	1afffffc 	bne	1046f4 <vUSB_ISR_Handler+0x158>
  104700:	eaffffd6 	b	104660 <vUSB_ISR_Handler+0xc4>
  104704:	e59d3000 	ldr	r3, [sp]
  104708:	e1d320d8 	ldrsb	r2, [r3, #8]
  10470c:	e3520000 	cmp	r2, #0	; 0x0
  104710:	aafffff3 	bge	1046e4 <vUSB_ISR_Handler+0x148>
  104714:	e5113fcf 	ldr	r3, [r1, #-4047]
  104718:	e3833080 	orr	r3, r3, #128	; 0x80
  10471c:	e5013fcf 	str	r3, [r1, #-4047]
  104720:	e1a02001 	mov	r2, r1
  104724:	e5123fcf 	ldr	r3, [r2, #-4047]
  104728:	e3130080 	tst	r3, #128	; 0x80
  10472c:	0afffffc 	beq	104724 <vUSB_ISR_Handler+0x188>
  104730:	eaffffeb 	b	1046e4 <vUSB_ISR_Handler+0x148>
  104734:	00200e78 	eoreq	r0, r0, r8, ror lr
  104738:	00200e7c 	eoreq	r0, r0, ip, ror lr
  10473c:	00200f50 	eoreq	r0, r0, r0, asr pc

00104740 <vUSB_ISR_Wrapper>:
  104740:	e92d0001 	stmdb	sp!, {r0}
  104744:	e94d2000 	stmdb	sp, {sp}^
  104748:	e1a00000 	nop			(mov r0,r0)
  10474c:	e24dd004 	sub	sp, sp, #4	; 0x4
  104750:	e8bd0001 	ldmia	sp!, {r0}
  104754:	e9204000 	stmdb	r0!, {lr}
  104758:	e1a0e000 	mov	lr, r0
  10475c:	e8bd0001 	ldmia	sp!, {r0}
  104760:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  104764:	e1a00000 	nop			(mov r0,r0)
  104768:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10476c:	e14f0000 	mrs	r0, SPSR
  104770:	e92e0001 	stmdb	lr!, {r0}
  104774:	e59f0064 	ldr	r0, [pc, #100]	; 1047e0 <prog+0x479c>
  104778:	e5900000 	ldr	r0, [r0]
  10477c:	e92e0001 	stmdb	lr!, {r0}
  104780:	e59f005c 	ldr	r0, [pc, #92]	; 1047e4 <prog+0x47a0>
  104784:	e5900000 	ldr	r0, [r0]
  104788:	e580e000 	str	lr, [r0]
  10478c:	e59f4044 	ldr	r4, [pc, #68]	; 1047d8 <prog+0x4794>
  104790:	e59f5044 	ldr	r5, [pc, #68]	; 1047dc <prog+0x4798>
  104794:	e5943000 	ldr	r3, [r4]
  104798:	e5952000 	ldr	r2, [r5]
  10479c:	ebffff7e 	bl	10459c <vUSB_ISR_Handler>
  1047a0:	e59f003c 	ldr	r0, [pc, #60]	; 1047e4 <prog+0x47a0>
  1047a4:	e5900000 	ldr	r0, [r0]
  1047a8:	e590e000 	ldr	lr, [r0]
  1047ac:	e59f002c 	ldr	r0, [pc, #44]	; 1047e0 <prog+0x479c>
  1047b0:	e8be0002 	ldmia	lr!, {r1}
  1047b4:	e5801000 	str	r1, [r0]
  1047b8:	e8be0001 	ldmia	lr!, {r0}
  1047bc:	e169f000 	msr	SPSR_fc, r0
  1047c0:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  1047c4:	e1a00000 	nop			(mov r0,r0)
  1047c8:	e59ee03c 	ldr	lr, [lr, #60]
  1047cc:	e25ef004 	subs	pc, lr, #4	; 0x4
  1047d0:	e5943000 	ldr	r3, [r4]
  1047d4:	e5952000 	ldr	r2, [r5]
  1047d8:	00200828 	eoreq	r0, r0, r8, lsr #16
  1047dc:	00200c44 	eoreq	r0, r0, r4, asr #24
  1047e0:	00200828 	eoreq	r0, r0, r8, lsr #16
  1047e4:	00200c44 	eoreq	r0, r0, r4, asr #24
  1047e8:	00425355 	subeq	r5, r2, r5, asr r3
  1047ec:	4c455355 	mcrrmi	3, 5, r5, r5, cr5
  1047f0:	00004445 	andeq	r4, r0, r5, asr #8
  1047f4:	5f46526e 	swipl	0x0046526e
  1047f8:	78547852 	ldmvcda	r4, {r1, r4, r6, fp, ip, sp, lr}^
  1047fc:	00000000 	andeq	r0, r0, r0

00104800 <tea_key>:
  104800:	00112233 44556677 8899aabb ccddeeff     3"..wfUD........

00104810 <broadcast_mac>:
  104810:	41434544 00000044                       DECAD...

00104818 <crc32_table>:
  104818:	00000000 77073096 ee0e612c 990951ba     .....0.w,a...Q..
  104828:	076dc419 706af48f e963a535 9e6495a3     ..m...jp5.c...d.
  104838:	0edb8832 79dcb8a4 e0d5e91e 97d2d988     2......y........
  104848:	09b64c2b 7eb17cbd e7b82d07 90bf1d91     +L...|.~.-......
  104858:	1db71064 6ab020f2 f3b97148 84be41de     d.... .jHq...A..
  104868:	1adad47d 6ddde4eb f4d4b551 83d385c7     }......mQ.......
  104878:	136c9856 646ba8c0 fd62f97a 8a65c9ec     V.l...kdz.b...e.
  104888:	14015c4f 63066cd9 fa0f3d63 8d080df5     O\...l.cc=......
  104898:	3b6e20c8 4c69105e d56041e4 a2677172     . n;^.iL.A`.rqg.
  1048a8:	3c03e4d1 4b04d447 d20d85fd a50ab56b     ...<G..K....k...
  1048b8:	35b5a8fa 42b2986c dbbbc9d6 acbcf940     ...5l..B....@...
  1048c8:	32d86ce3 45df5c75 dcd60dcf abd13d59     .l.2u\.E....Y=..
  1048d8:	26d930ac 51de003a c8d75180 bfd06116     .0.&:..Q.Q...a..
  1048e8:	21b4f4b5 56b3c423 cfba9599 b8bda50f     ...!#..V........
  1048f8:	2802b89e 5f058808 c60cd9b2 b10be924     ...(..._....$...
  104908:	2f6f7c87 58684c11 c1611dab b6662d3d     .|o/.LhX..a.=-f.
  104918:	76dc4190 01db7106 98d220bc efd5102a     .A.v.q... ..*...
  104928:	71b18589 06b6b51f 9fbfe4a5 e8b8d433     ...q........3...
  104938:	7807c9a2 0f00f934 9609a88e e10e9818     ...x4...........
  104948:	7f6a0dbb 086d3d2d 91646c97 e6635c01     ..j.-=m..ld..\c.
  104958:	6b6b51f4 1c6c6162 856530d8 f262004e     .Qkkbal..0e.N.b.
  104968:	6c0695ed 1b01a57b 8208f4c1 f50fc457     ...l{.......W...
  104978:	65b0d9c6 12b7e950 8bbeb8ea fcb9887c     ...eP.......|...
  104988:	62dd1ddf 15da2d49 8cd37cf3 fbd44c65     ...bI-...|..eL..
  104998:	4db26158 3ab551ce a3bc0074 d4bb30e2     Xa.M.Q.:t....0..
  1049a8:	4adfa541 3dd895d7 a4d1c46d d3d6f4fb     A..J...=m.......
  1049b8:	4369e96a 346ed9fc ad678846 da60b8d0     j.iC..n4F.g...`.
  1049c8:	44042d73 33031de5 aa0a4c5f dd0d7cc9     s-.D...3_L...|..
  1049d8:	5005713c 270241aa be0b1010 c90c2086     <q.P.A.'..... ..
  1049e8:	5768b525 206f85b3 b966d409 ce61e49f     %.hW..o ..f...a.
  1049f8:	5edef90e 29d9c998 b0d09822 c7d7a8b4     ...^...)".......
  104a08:	59b33d17 2eb40d81 b7bd5c3b c0ba6cad     .=.Y....;\...l..
  104a18:	edb88320 9abfb3b6 03b6e20c 74b1d29a      ..............t
  104a28:	ead54739 9dd277af 04db2615 73dc1683     9G...w...&.....s
  104a38:	e3630b12 94643b84 0d6d6a3e 7a6a5aa8     ..c..;d.>jm..Zjz
  104a48:	e40ecf0b 9309ff9d 0a00ae27 7d079eb1     ........'......}
  104a58:	f00f9344 8708a3d2 1e01f268 6906c2fe     D.......h......i
  104a68:	f762575d 806567cb 196c3671 6e6b06e7     ]Wb..ge.q6l...kn
  104a78:	fed41b76 89d32be0 10da7a5a 67dd4acc     v....+..Zz...J.g
  104a88:	f9b9df6f 8ebeeff9 17b7be43 60b08ed5     o.......C......`
  104a98:	d6d6a3e8 a1d1937e 38d8c2c4 4fdff252     ....~......8R..O
  104aa8:	d1bb67f1 a6bc5767 3fb506dd 48b2364b     .g..gW.....?K6.H
  104ab8:	d80d2bda af0a1b4c 36034af6 41047a60     .+..L....J.6`z.A
  104ac8:	df60efc3 a867df55 316e8eef 4669be79     ..`.U.g...n1y.iF
  104ad8:	cb61b38c bc66831a 256fd2a0 5268e236     ..a...f...o%6.hR
  104ae8:	cc0c7795 bb0b4703 220216b9 5505262f     .w...G....."/&.U
  104af8:	c5ba3bbe b2bd0b28 2bb45a92 5cb36a04     .;..(....Z.+.j.\
  104b08:	c2d7ffa7 b5d0cf31 2cd99e8b 5bdeae1d     ....1......,...[
  104b18:	9b64c2b0 ec63f226 756aa39c 026d930a     ..d.&.c...ju..m.
  104b28:	9c0906a9 eb0e363f 72076785 05005713     ....?6...g.r.W..
  104b38:	95bf4a82 e2b87a14 7bb12bae 0cb61b38     .J...z...+.{8...
  104b48:	92d28e9b e5d5be0d 7cdcefb7 0bdbdf21     ...........|!...
  104b58:	86d3d2d4 f1d4e242 68ddb3f8 1fda836e     ....B......hn...
  104b68:	81be16cd f6b9265b 6fb077e1 18b74777     ....[&...w.owG..
  104b78:	88085ae6 ff0f6a70 66063bca 11010b5c     .Z..pj...;.f\...
  104b88:	8f659eff f862ae69 616bffd3 166ccf45     ..e.i.b...kaE.l.
  104b98:	a00ae278 d70dd2ee 4e048354 3903b3c2     x.......T..N...9
  104ba8:	a7672661 d06016f7 4969474d 3e6e77db     a&g...`.MGiI.wn>
  104bb8:	aed16a4a d9d65adc 40df0b66 37d83bf0     Jj...Z..f..@.;.7
  104bc8:	a9bcae53 debb9ec5 47b2cf7f 30b5ffe9     S..........G...0
  104bd8:	bdbdf21c cabac28a 53b39330 24b4a3a6     ........0..S...$
  104be8:	bad03605 cdd70693 54de5729 23d967bf     .6......)W.T.g.#
  104bf8:	b3667a2e c4614ab8 5d681b02 2a6f2b94     .zf..Ja...h].+o*
  104c08:	b40bbe37 c30c8ea1 5a05df1b 2d02ef8d     7..........Z...-

00104c18 <rfbroadcast_mac>:
  104c18:	43415354 00735042                                TSACB

00104c1d <ACTIVATE_SEQUENCE.1822>:
  104c1d:	00007350                                         Ps

00104c1f <C.2.1824>:
  104c1f:	00000000 4c444900 03040045                       .....IDLE.

00104c29 <pxLanguageStringDescriptor>:
  104c29:	04090304                                ....

00104c2d <pxManufacturerStringDescriptor>:
  104c2d:	0062031c 00740069 0061006d 0075006e     ..b.i.t.m.a.n.u.
  104c3d:	00610066 0074006b 00720075              f.a.k.t.u.r.

00104c49 <pxProductStringDescriptor>:
  104c49:	004f0328 00650070 0042006e 00610065     (.O.p.e.n.B.e.a.
  104c59:	006f0063 0020006e 006c0042 006e0069     c.o.n. .B.l.i.n.
  104c69:	0065006b 006c006e 00000067              k.e.n.l.g...

00104c75 <pxConfigDescriptor1>:
  104c75:	00430209 80030102 000409fa 02020100     ..C.............
  104c85:	24050401 04011000 05000224 01000624     ...$....$...$...
  104c95:	00012405 83050701 ff000803 00010409     .$..............
  104ca5:	00000a02 01050700 00004002 02820507     .........@......
  104cb5:	09000040                                         @..

00104cb8 <pxConfigDescriptor2>:
  104cb8:	00430209 80030202 00040932 02020100     ..C.....2.......
  104cc8:	24050401 04011000 05000224 01000624     ...$....$...$...
  104cd8:	00012405 83050701 ff000803 00010409     .$..............
  104ce8:	00000a02 01050700 00004002 02820507     .........@......
  104cf8:	00000040                                @...

00104cfc <pxConfigDescriptorSizes>:
  104cfc:	00000043 00000043                       C...C...

00104d04 <pxDeviceDescriptor>:
  104d04:	01100112 08000002 08af16c0 02010110     ................
  104d14:	00000200                                ....

00104d18 <C.25.4300>:
	...

00104d2c <pxLineCoding>:
  104d2c:	0001c200 00080000 00000043              ........C...
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
  200448:	00104d34 00000000 00000000 00000000     4M..............
	...
  2004b8:	00000001 00000000 abcd330e e66d1234     .........3..4.m.
  2004c8:	0005deec 0000000b 00000000 00000000     ................
	...

00200814 <jam_mac>:
  200814:	4d4d414a 434d5700                                JAMM.

00200819 <wmcu_mac>:
  200819:	55434d57 19000000                                WMCU...

00200820 <random_seed_v1>:
  200820:	52f7d319                                ...R

00200824 <random_seed_v2>:
  200824:	6e28014a                                J.(n

00200828 <ulCriticalNesting>:
  200828:	0000270f                                .'..

0020082c <pxConfigDescriptorList>:
  20082c:	00104c75 00104cb8                       uL...L..

00200834 <xxtea_encode>:
  200834:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  200838:	e0803101 	add	r3, r0, r1, lsl #2
  20083c:	e1a09000 	mov	r9, r0
  200840:	e3a00034 	mov	r0, #52	; 0x34
  200844:	e1a04001 	mov	r4, r1
  200848:	e5135004 	ldr	r5, [r3, #-4]
  20084c:	e243b004 	sub	fp, r3, #4	; 0x4
  200850:	ebfbfe2f 	bl	100114 <__aeabi_idiv>
  200854:	e2800005 	add	r0, r0, #5	; 0x5
  200858:	e3700001 	cmn	r0, #1	; 0x1
  20085c:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200860:	e0803100 	add	r3, r0, r0, lsl #2
  200864:	e0603283 	rsb	r3, r0, r3, lsl #5
  200868:	e0833283 	add	r3, r3, r3, lsl #5
  20086c:	e0603103 	rsb	r3, r0, r3, lsl #2
  200870:	e0633283 	rsb	r3, r3, r3, lsl #5
  200874:	e0633403 	rsb	r3, r3, r3, lsl #8
  200878:	e0803083 	add	r3, r0, r3, lsl #1
  20087c:	e0803183 	add	r3, r0, r3, lsl #3
  200880:	e283a49f 	add	sl, r3, #-1627389952	; 0x9f000000
  200884:	e24aa732 	sub	sl, sl, #13107200	; 0xc80000
  200888:	e24aac86 	sub	sl, sl, #34304	; 0x8600
  20088c:	e59f80d8 	ldr	r8, [pc, #216]	; 20096c <.data+0x96c>
  200890:	e1a0c005 	mov	ip, r5
  200894:	e2447001 	sub	r7, r4, #1	; 0x1
  200898:	e24aa047 	sub	sl, sl, #71	; 0x47
  20089c:	e3a05000 	mov	r5, #0	; 0x0
  2008a0:	e285549f 	add	r5, r5, #-1627389952	; 0x9f000000
  2008a4:	e2455732 	sub	r5, r5, #13107200	; 0xc80000
  2008a8:	e2455c86 	sub	r5, r5, #34304	; 0x8600
  2008ac:	e2455047 	sub	r5, r5, #71	; 0x47
  2008b0:	e3570000 	cmp	r7, #0	; 0x0
  2008b4:	e1a03125 	mov	r3, r5, lsr #2
  2008b8:	e2036003 	and	r6, r3, #3	; 0x3
  2008bc:	d3a01000 	movle	r1, #0	; 0x0
  2008c0:	da000016 	ble	200920 <xxtea_encode+0xec>
  2008c4:	e1a0e009 	mov	lr, r9
  2008c8:	e3a04000 	mov	r4, #0	; 0x0
  2008cc:	e2043003 	and	r3, r4, #3	; 0x3
  2008d0:	e59e2004 	ldr	r2, [lr, #4]
  2008d4:	e0263003 	eor	r3, r6, r3
  2008d8:	e7980103 	ldr	r0, [r8, r3, lsl #2]
  2008dc:	e1a0120c 	mov	r1, ip, lsl #4
  2008e0:	e1a03102 	mov	r3, r2, lsl #2
  2008e4:	e02111a2 	eor	r1, r1, r2, lsr #3
  2008e8:	e02c0000 	eor	r0, ip, r0
  2008ec:	e02332ac 	eor	r3, r3, ip, lsr #5
  2008f0:	e0252002 	eor	r2, r5, r2
  2008f4:	e0833001 	add	r3, r3, r1
  2008f8:	e0822000 	add	r2, r2, r0
  2008fc:	e59e1000 	ldr	r1, [lr]
  200900:	e0233002 	eor	r3, r3, r2
  200904:	e2844001 	add	r4, r4, #1	; 0x1
  200908:	e0833001 	add	r3, r3, r1
  20090c:	e1570004 	cmp	r7, r4
  200910:	e48e3004 	str	r3, [lr], #4
  200914:	e1a0c003 	mov	ip, r3
  200918:	1affffeb 	bne	2008cc <xxtea_encode+0x98>
  20091c:	e2041003 	and	r1, r4, #3	; 0x3
  200920:	e5992000 	ldr	r2, [r9]
  200924:	e0261001 	eor	r1, r6, r1
  200928:	e7980101 	ldr	r0, [r8, r1, lsl #2]
  20092c:	e1a03102 	mov	r3, r2, lsl #2
  200930:	e1a0120c 	mov	r1, ip, lsl #4
  200934:	e02111a2 	eor	r1, r1, r2, lsr #3
  200938:	e02c0000 	eor	r0, ip, r0
  20093c:	e02332ac 	eor	r3, r3, ip, lsr #5
  200940:	e0252002 	eor	r2, r5, r2
  200944:	e0833001 	add	r3, r3, r1
  200948:	e0822000 	add	r2, r2, r0
  20094c:	e59b1000 	ldr	r1, [fp]
  200950:	e0233002 	eor	r3, r3, r2
  200954:	e0833001 	add	r3, r3, r1
  200958:	e155000a 	cmp	r5, sl
  20095c:	e58b3000 	str	r3, [fp]
  200960:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200964:	e1a0c003 	mov	ip, r3
  200968:	eaffffcc 	b	2008a0 <xxtea_encode+0x6c>
  20096c:	00104800 	andeqs	r4, r0, r0, lsl #16

00200970 <xxtea_decode>:
  200970:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  200974:	e1a09000 	mov	r9, r0
  200978:	e24dd00c 	sub	sp, sp, #12	; 0xc
  20097c:	e3a00034 	mov	r0, #52	; 0x34
  200980:	e58d1004 	str	r1, [sp, #4]
  200984:	ebfbfde2 	bl	100114 <__aeabi_idiv>
  200988:	e2800006 	add	r0, r0, #6	; 0x6
  20098c:	e0803100 	add	r3, r0, r0, lsl #2
  200990:	e0603283 	rsb	r3, r0, r3, lsl #5
  200994:	e0833283 	add	r3, r3, r3, lsl #5
  200998:	e0603103 	rsb	r3, r0, r3, lsl #2
  20099c:	e0633283 	rsb	r3, r3, r3, lsl #5
  2009a0:	e0633403 	rsb	r3, r3, r3, lsl #8
  2009a4:	e0803083 	add	r3, r0, r3, lsl #1
  2009a8:	e0806183 	add	r6, r0, r3, lsl #3
  2009ac:	e3560000 	cmp	r6, #0	; 0x0
  2009b0:	e5994000 	ldr	r4, [r9]
  2009b4:	0a000041 	beq	200ac0 <xxtea_decode+0x150>
  2009b8:	e59d2004 	ldr	r2, [sp, #4]
  2009bc:	e1a02102 	mov	r2, r2, lsl #2
  2009c0:	e0893002 	add	r3, r9, r2
  2009c4:	e2433004 	sub	r3, r3, #4	; 0x4
  2009c8:	e58d3008 	str	r3, [sp, #8]
  2009cc:	e59d3004 	ldr	r3, [sp, #4]
  2009d0:	e58d2000 	str	r2, [sp]
  2009d4:	e59fa0ec 	ldr	sl, [pc, #236]	; 200ac8 <.data+0xac8>
  2009d8:	e1a05004 	mov	r5, r4
  2009dc:	e243b001 	sub	fp, r3, #1	; 0x1
  2009e0:	e35b0000 	cmp	fp, #0	; 0x0
  2009e4:	e1a03126 	mov	r3, r6, lsr #2
  2009e8:	e2038003 	and	r8, r3, #3	; 0x3
  2009ec:	d1a0e00b 	movle	lr, fp
  2009f0:	da00001a 	ble	200a60 <xxtea_decode+0xf0>
  2009f4:	e59d2004 	ldr	r2, [sp, #4]
  2009f8:	e06b3002 	rsb	r3, fp, r2
  2009fc:	e2437001 	sub	r7, r3, #1	; 0x1
  200a00:	e59d3000 	ldr	r3, [sp]
  200a04:	e1a0e00b 	mov	lr, fp
  200a08:	e0834009 	add	r4, r3, r9
  200a0c:	e20e3003 	and	r3, lr, #3	; 0x3
  200a10:	e5140008 	ldr	r0, [r4, #-8]
  200a14:	e0283003 	eor	r3, r8, r3
  200a18:	e79ac103 	ldr	ip, [sl, r3, lsl #2]
  200a1c:	e1a02105 	mov	r2, r5, lsl #2
  200a20:	e1a03200 	mov	r3, r0, lsl #4
  200a24:	e02331a5 	eor	r3, r3, r5, lsr #3
  200a28:	e0261005 	eor	r1, r6, r5
  200a2c:	e020c00c 	eor	ip, r0, ip
  200a30:	e02222a0 	eor	r2, r2, r0, lsr #5
  200a34:	e0822003 	add	r2, r2, r3
  200a38:	e081100c 	add	r1, r1, ip
  200a3c:	e5143004 	ldr	r3, [r4, #-4]
  200a40:	e0222001 	eor	r2, r2, r1
  200a44:	e24ee001 	sub	lr, lr, #1	; 0x1
  200a48:	e0623003 	rsb	r3, r2, r3
  200a4c:	e15e0007 	cmp	lr, r7
  200a50:	e5243004 	str	r3, [r4, #-4]!
  200a54:	e1a05003 	mov	r5, r3
  200a58:	1affffeb 	bne	200a0c <xxtea_decode+0x9c>
  200a5c:	e5994000 	ldr	r4, [r9]
  200a60:	e59d2008 	ldr	r2, [sp, #8]
  200a64:	e20e3003 	and	r3, lr, #3	; 0x3
  200a68:	e5921000 	ldr	r1, [r2]
  200a6c:	e0283003 	eor	r3, r8, r3
  200a70:	e79a0103 	ldr	r0, [sl, r3, lsl #2]
  200a74:	e026c005 	eor	ip, r6, r5
  200a78:	e1a03105 	mov	r3, r5, lsl #2
  200a7c:	e2866461 	add	r6, r6, #1627389952	; 0x61000000
  200a80:	e1a02201 	mov	r2, r1, lsl #4
  200a84:	e0210000 	eor	r0, r1, r0
  200a88:	e02332a1 	eor	r3, r3, r1, lsr #5
  200a8c:	e02221a5 	eor	r2, r2, r5, lsr #3
  200a90:	e2866732 	add	r6, r6, #13107200	; 0xc80000
  200a94:	e0833002 	add	r3, r3, r2
  200a98:	e08cc000 	add	ip, ip, r0
  200a9c:	e2866c86 	add	r6, r6, #34304	; 0x8600
  200aa0:	e023300c 	eor	r3, r3, ip
  200aa4:	e2866047 	add	r6, r6, #71	; 0x47
  200aa8:	e0633004 	rsb	r3, r3, r4
  200aac:	e3560000 	cmp	r6, #0	; 0x0
  200ab0:	e5893000 	str	r3, [r9]
  200ab4:	e1a04003 	mov	r4, r3
  200ab8:	11a05003 	movne	r5, r3
  200abc:	1affffc7 	bne	2009e0 <xxtea_decode+0x70>
  200ac0:	e28dd00c 	add	sp, sp, #12	; 0xc
  200ac4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200ac8:	00104800 	andeqs	r4, r0, r0, lsl #16

00200acc <crc32>:
  200acc:	e3510003 	cmp	r1, #3	; 0x3
  200ad0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  200ad4:	e1a0c001 	mov	ip, r1
  200ad8:	e1a04000 	mov	r4, r0
  200adc:	d3e0e000 	mvnle	lr, #0	; 0x0
  200ae0:	da000015 	ble	200b3c <crc32+0x70>
  200ae4:	e59f5088 	ldr	r5, [pc, #136]	; 200b74 <.data+0xb74>
  200ae8:	e3e0e000 	mvn	lr, #0	; 0x0
  200aec:	e4940004 	ldr	r0, [r4], #4
  200af0:	e020300e 	eor	r3, r0, lr
  200af4:	e20330ff 	and	r3, r3, #255	; 0xff
  200af8:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200afc:	e022242e 	eor	r2, r2, lr, lsr #8
  200b00:	e0223420 	eor	r3, r2, r0, lsr #8
  200b04:	e20330ff 	and	r3, r3, #255	; 0xff
  200b08:	e7951103 	ldr	r1, [r5, r3, lsl #2]
  200b0c:	e0211422 	eor	r1, r1, r2, lsr #8
  200b10:	e0213820 	eor	r3, r1, r0, lsr #16
  200b14:	e20330ff 	and	r3, r3, #255	; 0xff
  200b18:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200b1c:	e0222421 	eor	r2, r2, r1, lsr #8
  200b20:	e0220c20 	eor	r0, r2, r0, lsr #24
  200b24:	e20000ff 	and	r0, r0, #255	; 0xff
  200b28:	e7953100 	ldr	r3, [r5, r0, lsl #2]
  200b2c:	e24cc004 	sub	ip, ip, #4	; 0x4
  200b30:	e35c0003 	cmp	ip, #3	; 0x3
  200b34:	e023e422 	eor	lr, r3, r2, lsr #8
  200b38:	caffffeb 	bgt	200aec <crc32+0x20>
  200b3c:	e35c0000 	cmp	ip, #0	; 0x0
  200b40:	0a000009 	beq	200b6c <crc32+0xa0>
  200b44:	e59f5028 	ldr	r5, [pc, #40]	; 200b74 <.data+0xb74>
  200b48:	e3a01000 	mov	r1, #0	; 0x0
  200b4c:	e7d13004 	ldrb	r3, [r1, r4]
  200b50:	e023300e 	eor	r3, r3, lr
  200b54:	e20330ff 	and	r3, r3, #255	; 0xff
  200b58:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200b5c:	e2811001 	add	r1, r1, #1	; 0x1
  200b60:	e151000c 	cmp	r1, ip
  200b64:	e022e42e 	eor	lr, r2, lr, lsr #8
  200b68:	1afffff7 	bne	200b4c <crc32+0x80>
  200b6c:	e1e0000e 	mvn	r0, lr
  200b70:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  200b74:	00104818 	andeqs	r4, r0, r8, lsl r8
