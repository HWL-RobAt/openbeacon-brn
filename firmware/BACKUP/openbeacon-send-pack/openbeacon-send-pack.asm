
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
  100024:	0010b808 	andeqs	fp, r0, r8, lsl #16

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
  100090:	eb002816 	bl	10a0f0 <AT91F_LowLevelInit>
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
  1000f8:	00200b88 	eoreq	r0, r0, r8, lsl #23
  1000fc:	002019d8 	ldreqd	r1, [r0], -r8
  100100:	00200000 	eoreq	r0, r0, r0
  100104:	0010cfa0 	andeqs	ip, r0, r0, lsr #31
  100108:	00200b88 	eoreq	r0, r0, r8, lsl #23
  10010c:	00203ffc 	streqd	r3, [r0], -ip
  100110:	00108de0 	andeqs	r8, r0, r0, ror #27

00100114 <__aeabi_uidiv>:
  100114:	e2512001 	subs	r2, r1, #1	; 0x1
  100118:	012fff1e 	bxeq	lr
  10011c:	3a000036 	bcc	1001fc <__aeabi_uidiv+0xe8>
  100120:	e1500001 	cmp	r0, r1
  100124:	9a000022 	bls	1001b4 <__aeabi_uidiv+0xa0>
  100128:	e1110002 	tst	r1, r2
  10012c:	0a000023 	beq	1001c0 <__aeabi_uidiv+0xac>
  100130:	e311020e 	tst	r1, #-536870912	; 0xe0000000
  100134:	01a01181 	moveq	r1, r1, lsl #3
  100138:	03a03008 	moveq	r3, #8	; 0x8
  10013c:	13a03001 	movne	r3, #1	; 0x1
  100140:	e3510201 	cmp	r1, #268435456	; 0x10000000
  100144:	31510000 	cmpcc	r1, r0
  100148:	31a01201 	movcc	r1, r1, lsl #4
  10014c:	31a03203 	movcc	r3, r3, lsl #4
  100150:	3afffffa 	bcc	100140 <__aeabi_uidiv+0x2c>
  100154:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
  100158:	31510000 	cmpcc	r1, r0
  10015c:	31a01081 	movcc	r1, r1, lsl #1
  100160:	31a03083 	movcc	r3, r3, lsl #1
  100164:	3afffffa 	bcc	100154 <__aeabi_uidiv+0x40>
  100168:	e3a02000 	mov	r2, #0	; 0x0
  10016c:	e1500001 	cmp	r0, r1
  100170:	20400001 	subcs	r0, r0, r1
  100174:	21822003 	orrcs	r2, r2, r3
  100178:	e15000a1 	cmp	r0, r1, lsr #1
  10017c:	204000a1 	subcs	r0, r0, r1, lsr #1
  100180:	218220a3 	orrcs	r2, r2, r3, lsr #1
  100184:	e1500121 	cmp	r0, r1, lsr #2
  100188:	20400121 	subcs	r0, r0, r1, lsr #2
  10018c:	21822123 	orrcs	r2, r2, r3, lsr #2
  100190:	e15001a1 	cmp	r0, r1, lsr #3
  100194:	204001a1 	subcs	r0, r0, r1, lsr #3
  100198:	218221a3 	orrcs	r2, r2, r3, lsr #3
  10019c:	e3500000 	cmp	r0, #0	; 0x0
  1001a0:	11b03223 	movnes	r3, r3, lsr #4
  1001a4:	11a01221 	movne	r1, r1, lsr #4
  1001a8:	1affffef 	bne	10016c <__aeabi_uidiv+0x58>
  1001ac:	e1a00002 	mov	r0, r2
  1001b0:	e12fff1e 	bx	lr
  1001b4:	03a00001 	moveq	r0, #1	; 0x1
  1001b8:	13a00000 	movne	r0, #0	; 0x0
  1001bc:	e12fff1e 	bx	lr
  1001c0:	e3510801 	cmp	r1, #65536	; 0x10000
  1001c4:	21a01821 	movcs	r1, r1, lsr #16
  1001c8:	23a02010 	movcs	r2, #16	; 0x10
  1001cc:	33a02000 	movcc	r2, #0	; 0x0
  1001d0:	e3510c01 	cmp	r1, #256	; 0x100
  1001d4:	21a01421 	movcs	r1, r1, lsr #8
  1001d8:	22822008 	addcs	r2, r2, #8	; 0x8
  1001dc:	e3510010 	cmp	r1, #16	; 0x10
  1001e0:	21a01221 	movcs	r1, r1, lsr #4
  1001e4:	22822004 	addcs	r2, r2, #4	; 0x4
  1001e8:	e3510004 	cmp	r1, #4	; 0x4
  1001ec:	82822003 	addhi	r2, r2, #3	; 0x3
  1001f0:	908220a1 	addls	r2, r2, r1, lsr #1
  1001f4:	e1a00230 	mov	r0, r0, lsr r2
  1001f8:	e12fff1e 	bx	lr
  1001fc:	e52de008 	str	lr, [sp, #-8]!
  100200:	eb00008a 	bl	100430 <__aeabi_idiv0>
  100204:	e3a00000 	mov	r0, #0	; 0x0
  100208:	e49df008 	ldr	pc, [sp], #8

0010020c <__aeabi_uidivmod>:
  10020c:	e92d4003 	stmdb	sp!, {r0, r1, lr}
  100210:	ebffffbf 	bl	100114 <__aeabi_uidiv>
  100214:	e8bd4006 	ldmia	sp!, {r1, r2, lr}
  100218:	e0030092 	mul	r3, r2, r0
  10021c:	e0411003 	sub	r1, r1, r3
  100220:	e12fff1e 	bx	lr

00100224 <__aeabi_idiv>:
  100224:	e3510000 	cmp	r1, #0	; 0x0
  100228:	e020c001 	eor	ip, r0, r1
  10022c:	0a000042 	beq	10033c <__aeabi_idiv+0x118>
  100230:	42611000 	rsbmi	r1, r1, #0	; 0x0
  100234:	e2512001 	subs	r2, r1, #1	; 0x1
  100238:	0a000027 	beq	1002dc <__aeabi_idiv+0xb8>
  10023c:	e1b03000 	movs	r3, r0
  100240:	42603000 	rsbmi	r3, r0, #0	; 0x0
  100244:	e1530001 	cmp	r3, r1
  100248:	9a000026 	bls	1002e8 <__aeabi_idiv+0xc4>
  10024c:	e1110002 	tst	r1, r2
  100250:	0a000028 	beq	1002f8 <__aeabi_idiv+0xd4>
  100254:	e311020e 	tst	r1, #-536870912	; 0xe0000000
  100258:	01a01181 	moveq	r1, r1, lsl #3
  10025c:	03a02008 	moveq	r2, #8	; 0x8
  100260:	13a02001 	movne	r2, #1	; 0x1
  100264:	e3510201 	cmp	r1, #268435456	; 0x10000000
  100268:	31510003 	cmpcc	r1, r3
  10026c:	31a01201 	movcc	r1, r1, lsl #4
  100270:	31a02202 	movcc	r2, r2, lsl #4
  100274:	3afffffa 	bcc	100264 <__aeabi_idiv+0x40>
  100278:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
  10027c:	31510003 	cmpcc	r1, r3
  100280:	31a01081 	movcc	r1, r1, lsl #1
  100284:	31a02082 	movcc	r2, r2, lsl #1
  100288:	3afffffa 	bcc	100278 <__aeabi_idiv+0x54>
  10028c:	e3a00000 	mov	r0, #0	; 0x0
  100290:	e1530001 	cmp	r3, r1
  100294:	20433001 	subcs	r3, r3, r1
  100298:	21800002 	orrcs	r0, r0, r2
  10029c:	e15300a1 	cmp	r3, r1, lsr #1
  1002a0:	204330a1 	subcs	r3, r3, r1, lsr #1
  1002a4:	218000a2 	orrcs	r0, r0, r2, lsr #1
  1002a8:	e1530121 	cmp	r3, r1, lsr #2
  1002ac:	20433121 	subcs	r3, r3, r1, lsr #2
  1002b0:	21800122 	orrcs	r0, r0, r2, lsr #2
  1002b4:	e15301a1 	cmp	r3, r1, lsr #3
  1002b8:	204331a1 	subcs	r3, r3, r1, lsr #3
  1002bc:	218001a2 	orrcs	r0, r0, r2, lsr #3
  1002c0:	e3530000 	cmp	r3, #0	; 0x0
  1002c4:	11b02222 	movnes	r2, r2, lsr #4
  1002c8:	11a01221 	movne	r1, r1, lsr #4
  1002cc:	1affffef 	bne	100290 <__aeabi_idiv+0x6c>
  1002d0:	e35c0000 	cmp	ip, #0	; 0x0
  1002d4:	42600000 	rsbmi	r0, r0, #0	; 0x0
  1002d8:	e12fff1e 	bx	lr
  1002dc:	e13c0000 	teq	ip, r0
  1002e0:	42600000 	rsbmi	r0, r0, #0	; 0x0
  1002e4:	e12fff1e 	bx	lr
  1002e8:	33a00000 	movcc	r0, #0	; 0x0
  1002ec:	01a00fcc 	moveq	r0, ip, asr #31
  1002f0:	03800001 	orreq	r0, r0, #1	; 0x1
  1002f4:	e12fff1e 	bx	lr
  1002f8:	e3510801 	cmp	r1, #65536	; 0x10000
  1002fc:	21a01821 	movcs	r1, r1, lsr #16
  100300:	23a02010 	movcs	r2, #16	; 0x10
  100304:	33a02000 	movcc	r2, #0	; 0x0
  100308:	e3510c01 	cmp	r1, #256	; 0x100
  10030c:	21a01421 	movcs	r1, r1, lsr #8
  100310:	22822008 	addcs	r2, r2, #8	; 0x8
  100314:	e3510010 	cmp	r1, #16	; 0x10
  100318:	21a01221 	movcs	r1, r1, lsr #4
  10031c:	22822004 	addcs	r2, r2, #4	; 0x4
  100320:	e3510004 	cmp	r1, #4	; 0x4
  100324:	82822003 	addhi	r2, r2, #3	; 0x3
  100328:	908220a1 	addls	r2, r2, r1, lsr #1
  10032c:	e35c0000 	cmp	ip, #0	; 0x0
  100330:	e1a00233 	mov	r0, r3, lsr r2
  100334:	42600000 	rsbmi	r0, r0, #0	; 0x0
  100338:	e12fff1e 	bx	lr
  10033c:	e52de008 	str	lr, [sp, #-8]!
  100340:	eb00003a 	bl	100430 <__aeabi_idiv0>
  100344:	e3a00000 	mov	r0, #0	; 0x0
  100348:	e49df008 	ldr	pc, [sp], #8

0010034c <__aeabi_idivmod>:
  10034c:	e92d4003 	stmdb	sp!, {r0, r1, lr}
  100350:	ebffffb3 	bl	100224 <__aeabi_idiv>
  100354:	e8bd4006 	ldmia	sp!, {r1, r2, lr}
  100358:	e0030092 	mul	r3, r2, r0
  10035c:	e0411003 	sub	r1, r1, r3
  100360:	e12fff1e 	bx	lr

00100364 <__umodsi3>:
  100364:	e2512001 	subs	r2, r1, #1	; 0x1
  100368:	3a00002c 	bcc	100420 <__umodsi3+0xbc>
  10036c:	11500001 	cmpne	r0, r1
  100370:	03a00000 	moveq	r0, #0	; 0x0
  100374:	81110002 	tsthi	r1, r2
  100378:	00000002 	andeq	r0, r0, r2
  10037c:	912fff1e 	bxls	lr
  100380:	e3a02000 	mov	r2, #0	; 0x0
  100384:	e3510201 	cmp	r1, #268435456	; 0x10000000
  100388:	31510000 	cmpcc	r1, r0
  10038c:	31a01201 	movcc	r1, r1, lsl #4
  100390:	32822004 	addcc	r2, r2, #4	; 0x4
  100394:	3afffffa 	bcc	100384 <__umodsi3+0x20>
  100398:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
  10039c:	31510000 	cmpcc	r1, r0
  1003a0:	31a01081 	movcc	r1, r1, lsl #1
  1003a4:	32822001 	addcc	r2, r2, #1	; 0x1
  1003a8:	3afffffa 	bcc	100398 <__umodsi3+0x34>
  1003ac:	e2522003 	subs	r2, r2, #3	; 0x3
  1003b0:	ba00000e 	blt	1003f0 <__umodsi3+0x8c>
  1003b4:	e1500001 	cmp	r0, r1
  1003b8:	20400001 	subcs	r0, r0, r1
  1003bc:	e15000a1 	cmp	r0, r1, lsr #1
  1003c0:	204000a1 	subcs	r0, r0, r1, lsr #1
  1003c4:	e1500121 	cmp	r0, r1, lsr #2
  1003c8:	20400121 	subcs	r0, r0, r1, lsr #2
  1003cc:	e15001a1 	cmp	r0, r1, lsr #3
  1003d0:	204001a1 	subcs	r0, r0, r1, lsr #3
  1003d4:	e3500001 	cmp	r0, #1	; 0x1
  1003d8:	e1a01221 	mov	r1, r1, lsr #4
  1003dc:	a2522004 	subges	r2, r2, #4	; 0x4
  1003e0:	aafffff3 	bge	1003b4 <__umodsi3+0x50>
  1003e4:	e3120003 	tst	r2, #3	; 0x3
  1003e8:	13300000 	teqne	r0, #0	; 0x0
  1003ec:	0a00000a 	beq	10041c <__umodsi3+0xb8>
  1003f0:	e3720002 	cmn	r2, #2	; 0x2
  1003f4:	ba000006 	blt	100414 <__umodsi3+0xb0>
  1003f8:	0a000002 	beq	100408 <__umodsi3+0xa4>
  1003fc:	e1500001 	cmp	r0, r1
  100400:	20400001 	subcs	r0, r0, r1
  100404:	e1a010a1 	mov	r1, r1, lsr #1
  100408:	e1500001 	cmp	r0, r1
  10040c:	20400001 	subcs	r0, r0, r1
  100410:	e1a010a1 	mov	r1, r1, lsr #1
  100414:	e1500001 	cmp	r0, r1
  100418:	20400001 	subcs	r0, r0, r1
  10041c:	e12fff1e 	bx	lr
  100420:	e52de008 	str	lr, [sp, #-8]!
  100424:	eb000001 	bl	100430 <__aeabi_idiv0>
  100428:	e3a00000 	mov	r0, #0	; 0x0
  10042c:	e49df008 	ldr	pc, [sp], #8

00100430 <__aeabi_idiv0>:
  100430:	e12fff1e 	bx	lr

00100434 <free>:
  100434:	e59f3008 	ldr	r3, [pc, #8]	; 100444 <prog+0x400>
  100438:	e1a01000 	mov	r1, r0
  10043c:	e5930000 	ldr	r0, [r3]
  100440:	ea001321 	b	1050cc <_free_r>
  100444:	00200410 	eoreq	r0, r0, r0, lsl r4

00100448 <malloc>:
  100448:	e59f3008 	ldr	r3, [pc, #8]	; 100458 <prog+0x414>
  10044c:	e1a01000 	mov	r1, r0
  100450:	e5930000 	ldr	r0, [r3]
  100454:	ea000000 	b	10045c <_malloc_r>
  100458:	00200410 	eoreq	r0, r0, r0, lsl r4

0010045c <_malloc_r>:
  10045c:	e281300b 	add	r3, r1, #11	; 0xb
  100460:	e3530016 	cmp	r3, #22	; 0x16
  100464:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  100468:	83c35007 	bichi	r5, r3, #7	; 0x7
  10046c:	93a05010 	movls	r5, #16	; 0x10
  100470:	93a03000 	movls	r3, #0	; 0x0
  100474:	81a03fa5 	movhi	r3, r5, lsr #31
  100478:	e1550001 	cmp	r5, r1
  10047c:	33833001 	orrcc	r3, r3, #1	; 0x1
  100480:	e3530000 	cmp	r3, #0	; 0x0
  100484:	e1a07000 	mov	r7, r0
  100488:	13a0300c 	movne	r3, #12	; 0xc
  10048c:	e24dd004 	sub	sp, sp, #4	; 0x4
  100490:	13a00000 	movne	r0, #0	; 0x0
  100494:	15873000 	strne	r3, [r7]
  100498:	1a000017 	bne	1004fc <_malloc_r+0xa0>
  10049c:	e1a00007 	mov	r0, r7
  1004a0:	eb000217 	bl	100d04 <__malloc_lock>
  1004a4:	e3550f7e 	cmp	r5, #504	; 0x1f8
  1004a8:	2a000015 	bcs	100504 <_malloc_r+0xa8>
  1004ac:	e59f86fc 	ldr	r8, [pc, #1788]	; 100bb0 <prog+0xb6c>
  1004b0:	e1a021a5 	mov	r2, r5, lsr #3
  1004b4:	e0883182 	add	r3, r8, r2, lsl #3
  1004b8:	e593400c 	ldr	r4, [r3, #12]
  1004bc:	e1530004 	cmp	r3, r4
  1004c0:	e1a0a008 	mov	sl, r8
  1004c4:	0a0000cd 	beq	100800 <_malloc_r+0x3a4>
  1004c8:	e5943004 	ldr	r3, [r4, #4]
  1004cc:	e3c33003 	bic	r3, r3, #3	; 0x3
  1004d0:	e0843003 	add	r3, r4, r3
  1004d4:	e5932004 	ldr	r2, [r3, #4]
  1004d8:	e594000c 	ldr	r0, [r4, #12]
  1004dc:	e5941008 	ldr	r1, [r4, #8]
  1004e0:	e3822001 	orr	r2, r2, #1	; 0x1
  1004e4:	e5801008 	str	r1, [r0, #8]
  1004e8:	e581000c 	str	r0, [r1, #12]
  1004ec:	e5832004 	str	r2, [r3, #4]
  1004f0:	e1a00007 	mov	r0, r7
  1004f4:	eb000203 	bl	100d08 <__malloc_unlock>
  1004f8:	e2840008 	add	r0, r4, #8	; 0x8
  1004fc:	e28dd004 	add	sp, sp, #4	; 0x4
  100500:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  100504:	e1b024a5 	movs	r2, r5, lsr #9
  100508:	01a001a5 	moveq	r0, r5, lsr #3
  10050c:	01a03180 	moveq	r3, r0, lsl #3
  100510:	1a000027 	bne	1005b4 <_malloc_r+0x158>
  100514:	e59f8694 	ldr	r8, [pc, #1684]	; 100bb0 <prog+0xb6c>
  100518:	e0831008 	add	r1, r3, r8
  10051c:	e591400c 	ldr	r4, [r1, #12]
  100520:	e1510004 	cmp	r1, r4
  100524:	e1a0a008 	mov	sl, r8
  100528:	1a000005 	bne	100544 <_malloc_r+0xe8>
  10052c:	ea00000a 	b	10055c <_malloc_r+0x100>
  100530:	e3520000 	cmp	r2, #0	; 0x0
  100534:	aa000047 	bge	100658 <_malloc_r+0x1fc>
  100538:	e594400c 	ldr	r4, [r4, #12]
  10053c:	e1510004 	cmp	r1, r4
  100540:	0a000005 	beq	10055c <_malloc_r+0x100>
  100544:	e5943004 	ldr	r3, [r4, #4]
  100548:	e3c33003 	bic	r3, r3, #3	; 0x3
  10054c:	e0652003 	rsb	r2, r5, r3
  100550:	e352000f 	cmp	r2, #15	; 0xf
  100554:	dafffff5 	ble	100530 <_malloc_r+0xd4>
  100558:	e2400001 	sub	r0, r0, #1	; 0x1
  10055c:	e280e001 	add	lr, r0, #1	; 0x1
  100560:	e59f664c 	ldr	r6, [pc, #1612]	; 100bb4 <prog+0xb70>
  100564:	e5964008 	ldr	r4, [r6, #8]
  100568:	e1560004 	cmp	r6, r4
  10056c:	0a000076 	beq	10074c <_malloc_r+0x2f0>
  100570:	e5943004 	ldr	r3, [r4, #4]
  100574:	e3c32003 	bic	r2, r3, #3	; 0x3
  100578:	e0650002 	rsb	r0, r5, r2
  10057c:	e350000f 	cmp	r0, #15	; 0xf
  100580:	ca000027 	bgt	100624 <_malloc_r+0x1c8>
  100584:	e3500000 	cmp	r0, #0	; 0x0
  100588:	e586600c 	str	r6, [r6, #12]
  10058c:	e5866008 	str	r6, [r6, #8]
  100590:	ba00003c 	blt	100688 <_malloc_r+0x22c>
  100594:	e0842002 	add	r2, r4, r2
  100598:	e5923004 	ldr	r3, [r2, #4]
  10059c:	e3833001 	orr	r3, r3, #1	; 0x1
  1005a0:	e1a00007 	mov	r0, r7
  1005a4:	e5823004 	str	r3, [r2, #4]
  1005a8:	eb0001d6 	bl	100d08 <__malloc_unlock>
  1005ac:	e2840008 	add	r0, r4, #8	; 0x8
  1005b0:	eaffffd1 	b	1004fc <_malloc_r+0xa0>
  1005b4:	e3520004 	cmp	r2, #4	; 0x4
  1005b8:	91a03325 	movls	r3, r5, lsr #6
  1005bc:	92830038 	addls	r0, r3, #56	; 0x38
  1005c0:	91a03180 	movls	r3, r0, lsl #3
  1005c4:	9affffd2 	bls	100514 <_malloc_r+0xb8>
  1005c8:	e3520014 	cmp	r2, #20	; 0x14
  1005cc:	9282005b 	addls	r0, r2, #91	; 0x5b
  1005d0:	91a03180 	movls	r3, r0, lsl #3
  1005d4:	9affffce 	bls	100514 <_malloc_r+0xb8>
  1005d8:	e3520054 	cmp	r2, #84	; 0x54
  1005dc:	91a03625 	movls	r3, r5, lsr #12
  1005e0:	9283006e 	addls	r0, r3, #110	; 0x6e
  1005e4:	91a03180 	movls	r3, r0, lsl #3
  1005e8:	9affffc9 	bls	100514 <_malloc_r+0xb8>
  1005ec:	e3520f55 	cmp	r2, #340	; 0x154
  1005f0:	91a037a5 	movls	r3, r5, lsr #15
  1005f4:	92830077 	addls	r0, r3, #119	; 0x77
  1005f8:	91a03180 	movls	r3, r0, lsl #3
  1005fc:	9affffc4 	bls	100514 <_malloc_r+0xb8>
  100600:	e3a03e55 	mov	r3, #1360	; 0x550
  100604:	e2833004 	add	r3, r3, #4	; 0x4
  100608:	e1520003 	cmp	r2, r3
  10060c:	91a03925 	movls	r3, r5, lsr #18
  100610:	9283007c 	addls	r0, r3, #124	; 0x7c
  100614:	83a0007e 	movhi	r0, #126	; 0x7e
  100618:	82433f59 	subhi	r3, r3, #356	; 0x164
  10061c:	91a03180 	movls	r3, r0, lsl #3
  100620:	eaffffbb 	b	100514 <_malloc_r+0xb8>
  100624:	e0842005 	add	r2, r4, r5
  100628:	e3801001 	orr	r1, r0, #1	; 0x1
  10062c:	e3853001 	orr	r3, r5, #1	; 0x1
  100630:	e7820000 	str	r0, [r2, r0]
  100634:	e5843004 	str	r3, [r4, #4]
  100638:	e586200c 	str	r2, [r6, #12]
  10063c:	e5862008 	str	r2, [r6, #8]
  100640:	e1a00007 	mov	r0, r7
  100644:	e9820042 	stmib	r2, {r1, r6}
  100648:	e582600c 	str	r6, [r2, #12]
  10064c:	eb0001ad 	bl	100d08 <__malloc_unlock>
  100650:	e2840008 	add	r0, r4, #8	; 0x8
  100654:	eaffffa8 	b	1004fc <_malloc_r+0xa0>
  100658:	e0840003 	add	r0, r4, r3
  10065c:	e5903004 	ldr	r3, [r0, #4]
  100660:	e594100c 	ldr	r1, [r4, #12]
  100664:	e5942008 	ldr	r2, [r4, #8]
  100668:	e3833001 	orr	r3, r3, #1	; 0x1
  10066c:	e5803004 	str	r3, [r0, #4]
  100670:	e5812008 	str	r2, [r1, #8]
  100674:	e1a00007 	mov	r0, r7
  100678:	e582100c 	str	r1, [r2, #12]
  10067c:	eb0001a1 	bl	100d08 <__malloc_unlock>
  100680:	e2840008 	add	r0, r4, #8	; 0x8
  100684:	eaffff9c 	b	1004fc <_malloc_r+0xa0>
  100688:	e3520c02 	cmp	r2, #512	; 0x200
  10068c:	3a0000a0 	bcc	100914 <_malloc_r+0x4b8>
  100690:	e1b014a2 	movs	r1, r2, lsr #9
  100694:	01a011a2 	moveq	r1, r2, lsr #3
  100698:	01a03181 	moveq	r3, r1, lsl #3
  10069c:	0a00001a 	beq	10070c <_malloc_r+0x2b0>
  1006a0:	e3510004 	cmp	r1, #4	; 0x4
  1006a4:	91a03322 	movls	r3, r2, lsr #6
  1006a8:	92831038 	addls	r1, r3, #56	; 0x38
  1006ac:	91a03181 	movls	r3, r1, lsl #3
  1006b0:	9a000015 	bls	10070c <_malloc_r+0x2b0>
  1006b4:	e3510014 	cmp	r1, #20	; 0x14
  1006b8:	9281105b 	addls	r1, r1, #91	; 0x5b
  1006bc:	91a03181 	movls	r3, r1, lsl #3
  1006c0:	9a000011 	bls	10070c <_malloc_r+0x2b0>
  1006c4:	e3510054 	cmp	r1, #84	; 0x54
  1006c8:	91a03622 	movls	r3, r2, lsr #12
  1006cc:	9283106e 	addls	r1, r3, #110	; 0x6e
  1006d0:	91a03181 	movls	r3, r1, lsl #3
  1006d4:	9a00000c 	bls	10070c <_malloc_r+0x2b0>
  1006d8:	e3510f55 	cmp	r1, #340	; 0x154
  1006dc:	91a037a2 	movls	r3, r2, lsr #15
  1006e0:	92831077 	addls	r1, r3, #119	; 0x77
  1006e4:	91a03181 	movls	r3, r1, lsl #3
  1006e8:	9a000007 	bls	10070c <_malloc_r+0x2b0>
  1006ec:	e3a03e55 	mov	r3, #1360	; 0x550
  1006f0:	e2833004 	add	r3, r3, #4	; 0x4
  1006f4:	e1510003 	cmp	r1, r3
  1006f8:	91a03922 	movls	r3, r2, lsr #18
  1006fc:	9283107c 	addls	r1, r3, #124	; 0x7c
  100700:	83a0107e 	movhi	r1, #126	; 0x7e
  100704:	82433f59 	subhi	r3, r3, #356	; 0x164
  100708:	91a03181 	movls	r3, r1, lsl #3
  10070c:	e088c003 	add	ip, r8, r3
  100710:	e59c0008 	ldr	r0, [ip, #8]
  100714:	e15c0000 	cmp	ip, r0
  100718:	0a0000eb 	beq	100acc <_malloc_r+0x670>
  10071c:	e5903004 	ldr	r3, [r0, #4]
  100720:	e3c33003 	bic	r3, r3, #3	; 0x3
  100724:	e1520003 	cmp	r2, r3
  100728:	2a000002 	bcs	100738 <_malloc_r+0x2dc>
  10072c:	e5900008 	ldr	r0, [r0, #8]
  100730:	e15c0000 	cmp	ip, r0
  100734:	1afffff8 	bne	10071c <_malloc_r+0x2c0>
  100738:	e590c00c 	ldr	ip, [r0, #12]
  10073c:	e584c00c 	str	ip, [r4, #12]
  100740:	e5840008 	str	r0, [r4, #8]
  100744:	e580400c 	str	r4, [r0, #12]
  100748:	e58c4008 	str	r4, [ip, #8]
  10074c:	e59a0004 	ldr	r0, [sl, #4]
  100750:	e35e0000 	cmp	lr, #0	; 0x0
  100754:	e28e3003 	add	r3, lr, #3	; 0x3
  100758:	a1a0300e 	movge	r3, lr
  10075c:	e1a03143 	mov	r3, r3, asr #2
  100760:	e3a02001 	mov	r2, #1	; 0x1
  100764:	e1a02312 	mov	r2, r2, lsl r3
  100768:	e1520000 	cmp	r2, r0
  10076c:	8a000029 	bhi	100818 <_malloc_r+0x3bc>
  100770:	e1120000 	tst	r2, r0
  100774:	0a000073 	beq	100948 <_malloc_r+0x4ec>
  100778:	e088918e 	add	r9, r8, lr, lsl #3
  10077c:	e1a0a00e 	mov	sl, lr
  100780:	e1a01009 	mov	r1, r9
  100784:	e591400c 	ldr	r4, [r1, #12]
  100788:	e1510004 	cmp	r1, r4
  10078c:	1a000005 	bne	1007a8 <_malloc_r+0x34c>
  100790:	ea000076 	b	100970 <_malloc_r+0x514>
  100794:	e35c0000 	cmp	ip, #0	; 0x0
  100798:	aa000079 	bge	100984 <_malloc_r+0x528>
  10079c:	e594400c 	ldr	r4, [r4, #12]
  1007a0:	e1510004 	cmp	r1, r4
  1007a4:	0a000071 	beq	100970 <_malloc_r+0x514>
  1007a8:	e5943004 	ldr	r3, [r4, #4]
  1007ac:	e3c33003 	bic	r3, r3, #3	; 0x3
  1007b0:	e065c003 	rsb	ip, r5, r3
  1007b4:	e35c000f 	cmp	ip, #15	; 0xf
  1007b8:	dafffff5 	ble	100794 <_malloc_r+0x338>
  1007bc:	e3853001 	orr	r3, r5, #1	; 0x1
  1007c0:	e0842005 	add	r2, r4, r5
  1007c4:	e594000c 	ldr	r0, [r4, #12]
  1007c8:	e5843004 	str	r3, [r4, #4]
  1007cc:	e5b41008 	ldr	r1, [r4, #8]!
  1007d0:	e38c3001 	orr	r3, ip, #1	; 0x1
  1007d4:	e5801008 	str	r1, [r0, #8]
  1007d8:	e581000c 	str	r0, [r1, #12]
  1007dc:	e5862008 	str	r2, [r6, #8]
  1007e0:	e586200c 	str	r2, [r6, #12]
  1007e4:	e1a00007 	mov	r0, r7
  1007e8:	e782c00c 	str	ip, [r2, ip]
  1007ec:	e9820048 	stmib	r2, {r3, r6}
  1007f0:	e582600c 	str	r6, [r2, #12]
  1007f4:	eb000143 	bl	100d08 <__malloc_unlock>
  1007f8:	e1a00004 	mov	r0, r4
  1007fc:	eaffff3e 	b	1004fc <_malloc_r+0xa0>
  100800:	e2843008 	add	r3, r4, #8	; 0x8
  100804:	e593400c 	ldr	r4, [r3, #12]
  100808:	e1530004 	cmp	r3, r4
  10080c:	1affff2d 	bne	1004c8 <_malloc_r+0x6c>
  100810:	e282e002 	add	lr, r2, #2	; 0x2
  100814:	eaffff51 	b	100560 <_malloc_r+0x104>
  100818:	e59f2390 	ldr	r2, [pc, #912]	; 100bb0 <prog+0xb6c>
  10081c:	e5924008 	ldr	r4, [r2, #8]
  100820:	e5943004 	ldr	r3, [r4, #4]
  100824:	e3c38003 	bic	r8, r3, #3	; 0x3
  100828:	e0650008 	rsb	r0, r5, r8
  10082c:	e350000f 	cmp	r0, #15	; 0xf
  100830:	c3a03000 	movgt	r3, #0	; 0x0
  100834:	d3a03001 	movle	r3, #1	; 0x1
  100838:	e1550008 	cmp	r5, r8
  10083c:	83833001 	orrhi	r3, r3, #1	; 0x1
  100840:	e3530000 	cmp	r3, #0	; 0x0
  100844:	e1a09004 	mov	r9, r4
  100848:	0a000026 	beq	1008e8 <_malloc_r+0x48c>
  10084c:	e59f3364 	ldr	r3, [pc, #868]	; 100bb8 <prog+0xb74>
  100850:	e59fb364 	ldr	fp, [pc, #868]	; 100bbc <prog+0xb78>
  100854:	e5932000 	ldr	r2, [r3]
  100858:	e59b1000 	ldr	r1, [fp]
  10085c:	e2822010 	add	r2, r2, #16	; 0x10
  100860:	e3710001 	cmn	r1, #1	; 0x1
  100864:	e0856002 	add	r6, r5, r2
  100868:	12863eff 	addne	r3, r6, #4080	; 0xff0
  10086c:	1283300f 	addne	r3, r3, #15	; 0xf
  100870:	13c36eff 	bicne	r6, r3, #4080	; 0xff0
  100874:	13c6600f 	bicne	r6, r6, #15	; 0xf
  100878:	e1a00007 	mov	r0, r7
  10087c:	e1a01006 	mov	r1, r6
  100880:	eb002308 	bl	1094a8 <_sbrk_r>
  100884:	e3700001 	cmn	r0, #1	; 0x1
  100888:	0a00008c 	beq	100ac0 <_malloc_r+0x664>
  10088c:	e0841008 	add	r1, r4, r8
  100890:	e1510000 	cmp	r1, r0
  100894:	e1a0a000 	mov	sl, r0
  100898:	9a000045 	bls	1009b4 <_malloc_r+0x558>
  10089c:	e59f330c 	ldr	r3, [pc, #780]	; 100bb0 <prog+0xb6c>
  1008a0:	e1540003 	cmp	r4, r3
  1008a4:	0a0000a5 	beq	100b40 <_malloc_r+0x6e4>
  1008a8:	e59f3300 	ldr	r3, [pc, #768]	; 100bb0 <prog+0xb6c>
  1008ac:	e5934008 	ldr	r4, [r3, #8]
  1008b0:	e5942004 	ldr	r2, [r4, #4]
  1008b4:	e3c22003 	bic	r2, r2, #3	; 0x3
  1008b8:	e0650002 	rsb	r0, r5, r2
  1008bc:	e350000f 	cmp	r0, #15	; 0xf
  1008c0:	c3a03000 	movgt	r3, #0	; 0x0
  1008c4:	d3a03001 	movle	r3, #1	; 0x1
  1008c8:	e1550002 	cmp	r5, r2
  1008cc:	83833001 	orrhi	r3, r3, #1	; 0x1
  1008d0:	e3530000 	cmp	r3, #0	; 0x0
  1008d4:	0a000003 	beq	1008e8 <_malloc_r+0x48c>
  1008d8:	e1a00007 	mov	r0, r7
  1008dc:	eb000109 	bl	100d08 <__malloc_unlock>
  1008e0:	e3a00000 	mov	r0, #0	; 0x0
  1008e4:	eaffff04 	b	1004fc <_malloc_r+0xa0>
  1008e8:	e0841005 	add	r1, r4, r5
  1008ec:	e3802001 	orr	r2, r0, #1	; 0x1
  1008f0:	e3853001 	orr	r3, r5, #1	; 0x1
  1008f4:	e5843004 	str	r3, [r4, #4]
  1008f8:	e5812004 	str	r2, [r1, #4]
  1008fc:	e59f22ac 	ldr	r2, [pc, #684]	; 100bb0 <prog+0xb6c>
  100900:	e1a00007 	mov	r0, r7
  100904:	e5821008 	str	r1, [r2, #8]
  100908:	eb0000fe 	bl	100d08 <__malloc_unlock>
  10090c:	e2840008 	add	r0, r4, #8	; 0x8
  100910:	eafffef9 	b	1004fc <_malloc_r+0xa0>
  100914:	e1a021a2 	mov	r2, r2, lsr #3
  100918:	e59a0004 	ldr	r0, [sl, #4]
  10091c:	e1a01122 	mov	r1, r2, lsr #2
  100920:	e3a03001 	mov	r3, #1	; 0x1
  100924:	e1800113 	orr	r0, r0, r3, lsl r1
  100928:	e0882182 	add	r2, r8, r2, lsl #3
  10092c:	e5923008 	ldr	r3, [r2, #8]
  100930:	e584200c 	str	r2, [r4, #12]
  100934:	e5843008 	str	r3, [r4, #8]
  100938:	e58a0004 	str	r0, [sl, #4]
  10093c:	e583400c 	str	r4, [r3, #12]
  100940:	e5824008 	str	r4, [r2, #8]
  100944:	eaffff81 	b	100750 <_malloc_r+0x2f4>
  100948:	e1a02082 	mov	r2, r2, lsl #1
  10094c:	e3ce3003 	bic	r3, lr, #3	; 0x3
  100950:	e1100002 	tst	r0, r2
  100954:	e283e004 	add	lr, r3, #4	; 0x4
  100958:	1affff86 	bne	100778 <_malloc_r+0x31c>
  10095c:	e1a02082 	mov	r2, r2, lsl #1
  100960:	e1100002 	tst	r0, r2
  100964:	e28ee004 	add	lr, lr, #4	; 0x4
  100968:	0afffffb 	beq	10095c <_malloc_r+0x500>
  10096c:	eaffff81 	b	100778 <_malloc_r+0x31c>
  100970:	e28aa001 	add	sl, sl, #1	; 0x1
  100974:	e31a0003 	tst	sl, #3	; 0x3
  100978:	0a000059 	beq	100ae4 <_malloc_r+0x688>
  10097c:	e2811008 	add	r1, r1, #8	; 0x8
  100980:	eaffff7f 	b	100784 <_malloc_r+0x328>
  100984:	e0841003 	add	r1, r4, r3
  100988:	e5913004 	ldr	r3, [r1, #4]
  10098c:	e594000c 	ldr	r0, [r4, #12]
  100990:	e5b42008 	ldr	r2, [r4, #8]!
  100994:	e3833001 	orr	r3, r3, #1	; 0x1
  100998:	e5802008 	str	r2, [r0, #8]
  10099c:	e582000c 	str	r0, [r2, #12]
  1009a0:	e5813004 	str	r3, [r1, #4]
  1009a4:	e1a00007 	mov	r0, r7
  1009a8:	eb0000d6 	bl	100d08 <__malloc_unlock>
  1009ac:	e1a00004 	mov	r0, r4
  1009b0:	eafffed1 	b	1004fc <_malloc_r+0xa0>
  1009b4:	e59fc204 	ldr	ip, [pc, #516]	; 100bc0 <prog+0xb7c>
  1009b8:	e59c3000 	ldr	r3, [ip]
  1009bc:	e0862003 	add	r2, r6, r3
  1009c0:	e58c2000 	str	r2, [ip]
  1009c4:	0a000062 	beq	100b54 <_malloc_r+0x6f8>
  1009c8:	e59b3000 	ldr	r3, [fp]
  1009cc:	e3730001 	cmn	r3, #1	; 0x1
  1009d0:	10613000 	rsbne	r3, r1, r0
  1009d4:	059f31e0 	ldreq	r3, [pc, #480]	; 100bbc <prog+0xb78>
  1009d8:	10823003 	addne	r3, r2, r3
  1009dc:	05830000 	streq	r0, [r3]
  1009e0:	158c3000 	strne	r3, [ip]
  1009e4:	e2103007 	ands	r3, r0, #7	; 0x7
  1009e8:	12631008 	rsbne	r1, r3, #8	; 0x8
  1009ec:	1080a001 	addne	sl, r0, r1
  1009f0:	01a01003 	moveq	r1, r3
  1009f4:	e08a3006 	add	r3, sl, r6
  1009f8:	e1a03a03 	mov	r3, r3, lsl #20
  1009fc:	e1a03a23 	mov	r3, r3, lsr #20
  100a00:	e2633a01 	rsb	r3, r3, #4096	; 0x1000
  100a04:	e0814003 	add	r4, r1, r3
  100a08:	e1a01004 	mov	r1, r4
  100a0c:	e1a00007 	mov	r0, r7
  100a10:	e58dc000 	str	ip, [sp]
  100a14:	eb0022a3 	bl	1094a8 <_sbrk_r>
  100a18:	e3700001 	cmn	r0, #1	; 0x1
  100a1c:	106a3000 	rsbne	r3, sl, r0
  100a20:	e59dc000 	ldr	ip, [sp]
  100a24:	10833004 	addne	r3, r3, r4
  100a28:	13830001 	orrne	r0, r3, #1	; 0x1
  100a2c:	e59f217c 	ldr	r2, [pc, #380]	; 100bb0 <prog+0xb6c>
  100a30:	e59c3000 	ldr	r3, [ip]
  100a34:	03a04000 	moveq	r4, #0	; 0x0
  100a38:	02800002 	addeq	r0, r0, #2	; 0x2
  100a3c:	e0843003 	add	r3, r4, r3
  100a40:	e1590002 	cmp	r9, r2
  100a44:	e1a0400a 	mov	r4, sl
  100a48:	e58c3000 	str	r3, [ip]
  100a4c:	e58a0004 	str	r0, [sl, #4]
  100a50:	e582a008 	str	sl, [r2, #8]
  100a54:	0a00000f 	beq	100a98 <_malloc_r+0x63c>
  100a58:	e358000f 	cmp	r8, #15	; 0xf
  100a5c:	93a03001 	movls	r3, #1	; 0x1
  100a60:	958a3004 	strls	r3, [sl, #4]
  100a64:	9affff91 	bls	1008b0 <_malloc_r+0x454>
  100a68:	e5993004 	ldr	r3, [r9, #4]
  100a6c:	e248200c 	sub	r2, r8, #12	; 0xc
  100a70:	e3c22007 	bic	r2, r2, #7	; 0x7
  100a74:	e2033001 	and	r3, r3, #1	; 0x1
  100a78:	e1823003 	orr	r3, r2, r3
  100a7c:	e3a01005 	mov	r1, #5	; 0x5
  100a80:	e352000f 	cmp	r2, #15	; 0xf
  100a84:	e0892002 	add	r2, r9, r2
  100a88:	e5893004 	str	r3, [r9, #4]
  100a8c:	e5821008 	str	r1, [r2, #8]
  100a90:	e5821004 	str	r1, [r2, #4]
  100a94:	8a000038 	bhi	100b7c <_malloc_r+0x720>
  100a98:	e59f1124 	ldr	r1, [pc, #292]	; 100bc4 <prog+0xb80>
  100a9c:	e59c2000 	ldr	r2, [ip]
  100aa0:	e5913000 	ldr	r3, [r1]
  100aa4:	e1520003 	cmp	r2, r3
  100aa8:	85812000 	strhi	r2, [r1]
  100aac:	e59f1114 	ldr	r1, [pc, #276]	; 100bc8 <prog+0xb84>
  100ab0:	e5913000 	ldr	r3, [r1]
  100ab4:	e1520003 	cmp	r2, r3
  100ab8:	85812000 	strhi	r2, [r1]
  100abc:	eaffff7b 	b	1008b0 <_malloc_r+0x454>
  100ac0:	e59f20e8 	ldr	r2, [pc, #232]	; 100bb0 <prog+0xb6c>
  100ac4:	e5924008 	ldr	r4, [r2, #8]
  100ac8:	eaffff78 	b	1008b0 <_malloc_r+0x454>
  100acc:	e59a3004 	ldr	r3, [sl, #4]
  100ad0:	e1a01121 	mov	r1, r1, lsr #2
  100ad4:	e3a02001 	mov	r2, #1	; 0x1
  100ad8:	e1833112 	orr	r3, r3, r2, lsl r1
  100adc:	e58a3004 	str	r3, [sl, #4]
  100ae0:	eaffff15 	b	10073c <_malloc_r+0x2e0>
  100ae4:	e1a0c00e 	mov	ip, lr
  100ae8:	e1a01009 	mov	r1, r9
  100aec:	e31c0003 	tst	ip, #3	; 0x3
  100af0:	e2411008 	sub	r1, r1, #8	; 0x8
  100af4:	e24cc001 	sub	ip, ip, #1	; 0x1
  100af8:	0a000027 	beq	100b9c <_malloc_r+0x740>
  100afc:	e5913008 	ldr	r3, [r1, #8]
  100b00:	e1530001 	cmp	r3, r1
  100b04:	0afffff8 	beq	100aec <_malloc_r+0x690>
  100b08:	e1a02082 	mov	r2, r2, lsl #1
  100b0c:	e1520000 	cmp	r2, r0
  100b10:	8affff40 	bhi	100818 <_malloc_r+0x3bc>
  100b14:	e3520000 	cmp	r2, #0	; 0x0
  100b18:	0affff3e 	beq	100818 <_malloc_r+0x3bc>
  100b1c:	e1120000 	tst	r2, r0
  100b20:	11a0e00a 	movne	lr, sl
  100b24:	1affff13 	bne	100778 <_malloc_r+0x31c>
  100b28:	e1a02082 	mov	r2, r2, lsl #1
  100b2c:	e1100002 	tst	r0, r2
  100b30:	e28aa004 	add	sl, sl, #4	; 0x4
  100b34:	0afffffb 	beq	100b28 <_malloc_r+0x6cc>
  100b38:	e1a0e00a 	mov	lr, sl
  100b3c:	eaffff0d 	b	100778 <_malloc_r+0x31c>
  100b40:	e59fc078 	ldr	ip, [pc, #120]	; 100bc0 <prog+0xb7c>
  100b44:	e59c3000 	ldr	r3, [ip]
  100b48:	e0862003 	add	r2, r6, r3
  100b4c:	e58c2000 	str	r2, [ip]
  100b50:	eaffff9c 	b	1009c8 <_malloc_r+0x56c>
  100b54:	e1a03a00 	mov	r3, r0, lsl #20
  100b58:	e1a03a23 	mov	r3, r3, lsr #20
  100b5c:	e3530000 	cmp	r3, #0	; 0x0
  100b60:	1affff98 	bne	1009c8 <_malloc_r+0x56c>
  100b64:	e59f2044 	ldr	r2, [pc, #68]	; 100bb0 <prog+0xb6c>
  100b68:	e0863008 	add	r3, r6, r8
  100b6c:	e5924008 	ldr	r4, [r2, #8]
  100b70:	e3833001 	orr	r3, r3, #1	; 0x1
  100b74:	e5843004 	str	r3, [r4, #4]
  100b78:	eaffffc6 	b	100a98 <_malloc_r+0x63c>
  100b7c:	e2891008 	add	r1, r9, #8	; 0x8
  100b80:	e1a00007 	mov	r0, r7
  100b84:	e58dc000 	str	ip, [sp]
  100b88:	eb00114f 	bl	1050cc <_free_r>
  100b8c:	e59f301c 	ldr	r3, [pc, #28]	; 100bb0 <prog+0xb6c>
  100b90:	e59dc000 	ldr	ip, [sp]
  100b94:	e5934008 	ldr	r4, [r3, #8]
  100b98:	eaffffbe 	b	100a98 <_malloc_r+0x63c>
  100b9c:	e1e03002 	mvn	r3, r2
  100ba0:	e0000003 	and	r0, r0, r3
  100ba4:	e59f3004 	ldr	r3, [pc, #4]	; 100bb0 <prog+0xb6c>
  100ba8:	e5830004 	str	r0, [r3, #4]
  100bac:	eaffffd5 	b	100b08 <_malloc_r+0x6ac>
  100bb0:	00200000 	eoreq	r0, r0, r0
  100bb4:	00200008 	eoreq	r0, r0, r8
  100bb8:	00200b88 	eoreq	r0, r0, r8, lsl #23
  100bbc:	0020040c 	eoreq	r0, r0, ip, lsl #8
  100bc0:	00200b94 	mlaeq	r0, r4, fp, r0
  100bc4:	00200b8c 	eoreq	r0, r0, ip, lsl #23
  100bc8:	00200b90 	mlaeq	r0, r0, fp, r0

00100bcc <memcpy>:
  100bcc:	e352000f 	cmp	r2, #15	; 0xf
  100bd0:	e52de004 	str	lr, [sp, #-4]!
  100bd4:	e1a0c000 	mov	ip, r0
  100bd8:	e1a0e002 	mov	lr, r2
  100bdc:	9a000002 	bls	100bec <memcpy+0x20>
  100be0:	e1813000 	orr	r3, r1, r0
  100be4:	e3130003 	tst	r3, #3	; 0x3
  100be8:	0a000008 	beq	100c10 <memcpy+0x44>
  100bec:	e35e0000 	cmp	lr, #0	; 0x0
  100bf0:	049df004 	ldreq	pc, [sp], #4
  100bf4:	e3a02000 	mov	r2, #0	; 0x0
  100bf8:	e4d13001 	ldrb	r3, [r1], #1
  100bfc:	e7c2300c 	strb	r3, [r2, ip]
  100c00:	e2822001 	add	r2, r2, #1	; 0x1
  100c04:	e152000e 	cmp	r2, lr
  100c08:	1afffffa 	bne	100bf8 <memcpy+0x2c>
  100c0c:	e49df004 	ldr	pc, [sp], #4
  100c10:	e5913000 	ldr	r3, [r1]
  100c14:	e58c3000 	str	r3, [ip]
  100c18:	e5912004 	ldr	r2, [r1, #4]
  100c1c:	e58c2004 	str	r2, [ip, #4]
  100c20:	e5913008 	ldr	r3, [r1, #8]
  100c24:	e58c3008 	str	r3, [ip, #8]
  100c28:	e24ee010 	sub	lr, lr, #16	; 0x10
  100c2c:	e591300c 	ldr	r3, [r1, #12]
  100c30:	e35e000f 	cmp	lr, #15	; 0xf
  100c34:	e58c300c 	str	r3, [ip, #12]
  100c38:	e2811010 	add	r1, r1, #16	; 0x10
  100c3c:	e28cc010 	add	ip, ip, #16	; 0x10
  100c40:	8afffff2 	bhi	100c10 <memcpy+0x44>
  100c44:	e35e0003 	cmp	lr, #3	; 0x3
  100c48:	9affffe7 	bls	100bec <memcpy+0x20>
  100c4c:	e24ee004 	sub	lr, lr, #4	; 0x4
  100c50:	e4913004 	ldr	r3, [r1], #4
  100c54:	e35e0003 	cmp	lr, #3	; 0x3
  100c58:	e48c3004 	str	r3, [ip], #4
  100c5c:	8afffffa 	bhi	100c4c <memcpy+0x80>
  100c60:	e35e0000 	cmp	lr, #0	; 0x0
  100c64:	1affffe2 	bne	100bf4 <memcpy+0x28>
  100c68:	e49df004 	ldr	pc, [sp], #4

00100c6c <memset>:
  100c6c:	e3520003 	cmp	r2, #3	; 0x3
  100c70:	e20110ff 	and	r1, r1, #255	; 0xff
  100c74:	e1a0c000 	mov	ip, r0
  100c78:	9a000001 	bls	100c84 <memset+0x18>
  100c7c:	e3100003 	tst	r0, #3	; 0x3
  100c80:	0a000008 	beq	100ca8 <memset+0x3c>
  100c84:	e3520000 	cmp	r2, #0	; 0x0
  100c88:	012fff1e 	bxeq	lr
  100c8c:	e20110ff 	and	r1, r1, #255	; 0xff
  100c90:	e3a03000 	mov	r3, #0	; 0x0
  100c94:	e7c3100c 	strb	r1, [r3, ip]
  100c98:	e2833001 	add	r3, r3, #1	; 0x1
  100c9c:	e1530002 	cmp	r3, r2
  100ca0:	1afffffb 	bne	100c94 <memset+0x28>
  100ca4:	e12fff1e 	bx	lr
  100ca8:	e1813401 	orr	r3, r1, r1, lsl #8
  100cac:	e352000f 	cmp	r2, #15	; 0xf
  100cb0:	e183c803 	orr	ip, r3, r3, lsl #16
  100cb4:	e1a03000 	mov	r3, r0
  100cb8:	9a000009 	bls	100ce4 <memset+0x78>
  100cbc:	e2422010 	sub	r2, r2, #16	; 0x10
  100cc0:	e352000f 	cmp	r2, #15	; 0xf
  100cc4:	e583c000 	str	ip, [r3]
  100cc8:	e583c004 	str	ip, [r3, #4]
  100ccc:	e583c008 	str	ip, [r3, #8]
  100cd0:	e583c00c 	str	ip, [r3, #12]
  100cd4:	e2833010 	add	r3, r3, #16	; 0x10
  100cd8:	8afffff7 	bhi	100cbc <memset+0x50>
  100cdc:	e3520003 	cmp	r2, #3	; 0x3
  100ce0:	9a000003 	bls	100cf4 <memset+0x88>
  100ce4:	e2422004 	sub	r2, r2, #4	; 0x4
  100ce8:	e3520003 	cmp	r2, #3	; 0x3
  100cec:	e483c004 	str	ip, [r3], #4
  100cf0:	8afffffb 	bhi	100ce4 <memset+0x78>
  100cf4:	e3520000 	cmp	r2, #0	; 0x0
  100cf8:	e1a0c003 	mov	ip, r3
  100cfc:	1affffe2 	bne	100c8c <memset+0x20>
  100d00:	e12fff1e 	bx	lr

00100d04 <__malloc_lock>:
  100d04:	e12fff1e 	bx	lr

00100d08 <__malloc_unlock>:
  100d08:	e12fff1e 	bx	lr

00100d0c <sprintf>:
  100d0c:	e92d000e 	stmdb	sp!, {r1, r2, r3}
  100d10:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100d14:	e59f2060 	ldr	r2, [pc, #96]	; 100d7c <prog+0xd38>
  100d18:	e24dd060 	sub	sp, sp, #96	; 0x60
  100d1c:	e28d4070 	add	r4, sp, #112	; 0x70
  100d20:	e3e0c102 	mvn	ip, #-2147483648	; 0x80000000
  100d24:	e1a0e000 	mov	lr, r0
  100d28:	e1a03004 	mov	r3, r4
  100d2c:	e58dc014 	str	ip, [sp, #20]
  100d30:	e58dc008 	str	ip, [sp, #8]
  100d34:	e5920000 	ldr	r0, [r2]
  100d38:	e3e0c000 	mvn	ip, #0	; 0x0
  100d3c:	e59d206c 	ldr	r2, [sp, #108]
  100d40:	e1a0100d 	mov	r1, sp
  100d44:	e3a05f82 	mov	r5, #520	; 0x208
  100d48:	e58de010 	str	lr, [sp, #16]
  100d4c:	e1cd50bc 	strh	r5, [sp, #12]
  100d50:	e58de000 	str	lr, [sp]
  100d54:	e1cdc0be 	strh	ip, [sp, #14]
  100d58:	e58d405c 	str	r4, [sp, #92]
  100d5c:	eb00009a 	bl	100fcc <_vfprintf_r>
  100d60:	e59d3000 	ldr	r3, [sp]
  100d64:	e3a02000 	mov	r2, #0	; 0x0
  100d68:	e5c32000 	strb	r2, [r3]
  100d6c:	e28dd060 	add	sp, sp, #96	; 0x60
  100d70:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  100d74:	e28dd00c 	add	sp, sp, #12	; 0xc
  100d78:	e12fff1e 	bx	lr
  100d7c:	00200410 	eoreq	r0, r0, r0, lsl r4

00100d80 <_sprintf_r>:
  100d80:	e92d000c 	stmdb	sp!, {r2, r3}
  100d84:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100d88:	e24dd060 	sub	sp, sp, #96	; 0x60
  100d8c:	e28d4070 	add	r4, sp, #112	; 0x70
  100d90:	e3e0c102 	mvn	ip, #-2147483648	; 0x80000000
  100d94:	e1a0e001 	mov	lr, r1
  100d98:	e1a03004 	mov	r3, r4
  100d9c:	e59d206c 	ldr	r2, [sp, #108]
  100da0:	e58dc014 	str	ip, [sp, #20]
  100da4:	e58dc008 	str	ip, [sp, #8]
  100da8:	e1a0100d 	mov	r1, sp
  100dac:	e3e0c000 	mvn	ip, #0	; 0x0
  100db0:	e3a05f82 	mov	r5, #520	; 0x208
  100db4:	e58de010 	str	lr, [sp, #16]
  100db8:	e1cd50bc 	strh	r5, [sp, #12]
  100dbc:	e58de000 	str	lr, [sp]
  100dc0:	e1cdc0be 	strh	ip, [sp, #14]
  100dc4:	e58d405c 	str	r4, [sp, #92]
  100dc8:	eb00007f 	bl	100fcc <_vfprintf_r>
  100dcc:	e59d3000 	ldr	r3, [sp]
  100dd0:	e3a02000 	mov	r2, #0	; 0x0
  100dd4:	e5c32000 	strb	r2, [r3]
  100dd8:	e28dd060 	add	sp, sp, #96	; 0x60
  100ddc:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  100de0:	e28dd008 	add	sp, sp, #8	; 0x8
  100de4:	e12fff1e 	bx	lr

00100de8 <strlen>:
  100de8:	e3100003 	tst	r0, #3	; 0x3
  100dec:	e1a01000 	mov	r1, r0
  100df0:	1a000018 	bne	100e58 <strlen+0x70>
  100df4:	e5902000 	ldr	r2, [r0]
  100df8:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100dfc:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100e00:	e2433c01 	sub	r3, r3, #256	; 0x100
  100e04:	e2433001 	sub	r3, r3, #1	; 0x1
  100e08:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100e0c:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100e10:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100e14:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100e18:	e1d32002 	bics	r2, r3, r2
  100e1c:	e1a02000 	mov	r2, r0
  100e20:	1a00000b 	bne	100e54 <strlen+0x6c>
  100e24:	e5b02004 	ldr	r2, [r0, #4]!
  100e28:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100e2c:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100e30:	e2433c01 	sub	r3, r3, #256	; 0x100
  100e34:	e2433001 	sub	r3, r3, #1	; 0x1
  100e38:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100e3c:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100e40:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100e44:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100e48:	e1d32002 	bics	r2, r3, r2
  100e4c:	0afffff4 	beq	100e24 <strlen+0x3c>
  100e50:	e1a02000 	mov	r2, r0
  100e54:	e1a00002 	mov	r0, r2
  100e58:	e5d03000 	ldrb	r3, [r0]
  100e5c:	e3530000 	cmp	r3, #0	; 0x0
  100e60:	0a000002 	beq	100e70 <strlen+0x88>
  100e64:	e5f03001 	ldrb	r3, [r0, #1]!
  100e68:	e3530000 	cmp	r3, #0	; 0x0
  100e6c:	1afffffc 	bne	100e64 <strlen+0x7c>
  100e70:	e0610000 	rsb	r0, r1, r0
  100e74:	e12fff1e 	bx	lr

00100e78 <strncpy>:
  100e78:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100e7c:	e1a04001 	mov	r4, r1
  100e80:	e1811000 	orr	r1, r1, r0
  100e84:	e3110003 	tst	r1, #3	; 0x3
  100e88:	13a03000 	movne	r3, #0	; 0x0
  100e8c:	03a03001 	moveq	r3, #1	; 0x1
  100e90:	e3520003 	cmp	r2, #3	; 0x3
  100e94:	93a03000 	movls	r3, #0	; 0x0
  100e98:	82033001 	andhi	r3, r3, #1	; 0x1
  100e9c:	e3530000 	cmp	r3, #0	; 0x0
  100ea0:	01a01004 	moveq	r1, r4
  100ea4:	e1a05000 	mov	r5, r0
  100ea8:	e1a0e002 	mov	lr, r2
  100eac:	01a04000 	moveq	r4, r0
  100eb0:	0a000018 	beq	100f18 <strncpy+0xa0>
  100eb4:	e3520003 	cmp	r2, #3	; 0x3
  100eb8:	e1a0c004 	mov	ip, r4
  100ebc:	9a000013 	bls	100f10 <strncpy+0x98>
  100ec0:	e5941000 	ldr	r1, [r4]
  100ec4:	ea000005 	b	100ee0 <strncpy+0x68>
  100ec8:	e24ee004 	sub	lr, lr, #4	; 0x4
  100ecc:	e35e0003 	cmp	lr, #3	; 0x3
  100ed0:	e4801004 	str	r1, [r0], #4
  100ed4:	e28cc004 	add	ip, ip, #4	; 0x4
  100ed8:	9a00000c 	bls	100f10 <strncpy+0x98>
  100edc:	e59c1000 	ldr	r1, [ip]
  100ee0:	e28134ff 	add	r3, r1, #-16777216	; 0xff000000
  100ee4:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100ee8:	e2433c01 	sub	r3, r3, #256	; 0x100
  100eec:	e2433001 	sub	r3, r3, #1	; 0x1
  100ef0:	e1e02001 	mvn	r2, r1
  100ef4:	e0033002 	and	r3, r3, r2
  100ef8:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100efc:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100f00:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100f04:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100f08:	e3530000 	cmp	r3, #0	; 0x0
  100f0c:	0affffed 	beq	100ec8 <strncpy+0x50>
  100f10:	e1a04000 	mov	r4, r0
  100f14:	e1a0100c 	mov	r1, ip
  100f18:	e35e0000 	cmp	lr, #0	; 0x0
  100f1c:	0a000018 	beq	100f84 <strncpy+0x10c>
  100f20:	e5d13000 	ldrb	r3, [r1]
  100f24:	e24e2001 	sub	r2, lr, #1	; 0x1
  100f28:	e3530000 	cmp	r3, #0	; 0x0
  100f2c:	e1a0c004 	mov	ip, r4
  100f30:	e4cc3001 	strb	r3, [ip], #1
  100f34:	1284e002 	addne	lr, r4, #2	; 0x2
  100f38:	10810002 	addne	r0, r1, r2
  100f3c:	0a000008 	beq	100f64 <strncpy+0xec>
  100f40:	e1500001 	cmp	r0, r1
  100f44:	e1a0c00e 	mov	ip, lr
  100f48:	e2422001 	sub	r2, r2, #1	; 0x1
  100f4c:	e28ee001 	add	lr, lr, #1	; 0x1
  100f50:	0a00000b 	beq	100f84 <strncpy+0x10c>
  100f54:	e5f13001 	ldrb	r3, [r1, #1]!
  100f58:	e3530000 	cmp	r3, #0	; 0x0
  100f5c:	e54c3001 	strb	r3, [ip, #-1]
  100f60:	1afffff6 	bne	100f40 <strncpy+0xc8>
  100f64:	e3520000 	cmp	r2, #0	; 0x0
  100f68:	0a000005 	beq	100f84 <strncpy+0x10c>
  100f6c:	e3a03000 	mov	r3, #0	; 0x0
  100f70:	e1a01003 	mov	r1, r3
  100f74:	e7c3100c 	strb	r1, [r3, ip]
  100f78:	e2833001 	add	r3, r3, #1	; 0x1
  100f7c:	e1520003 	cmp	r2, r3
  100f80:	1afffffb 	bne	100f74 <strncpy+0xfc>
  100f84:	e1a00005 	mov	r0, r5
  100f88:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00100f8c <__sprint>:
  100f8c:	e5913008 	ldr	r3, [r1, #8]
  100f90:	e3530000 	cmp	r3, #0	; 0x0
  100f94:	e92d4010 	stmdb	sp!, {r4, lr}
  100f98:	e1a02003 	mov	r2, r3
  100f9c:	e1a04001 	mov	r4, r1
  100fa0:	05813004 	streq	r3, [r1, #4]
  100fa4:	1a000001 	bne	100fb0 <__sprint+0x24>
  100fa8:	e1a00002 	mov	r0, r2
  100fac:	e8bd8010 	ldmia	sp!, {r4, pc}
  100fb0:	eb0010ed 	bl	10536c <__sfvwrite>
  100fb4:	e1a02000 	mov	r2, r0
  100fb8:	e3a03000 	mov	r3, #0	; 0x0
  100fbc:	e1a00002 	mov	r0, r2
  100fc0:	e5843004 	str	r3, [r4, #4]
  100fc4:	e5843008 	str	r3, [r4, #8]
  100fc8:	e8bd8010 	ldmia	sp!, {r4, pc}

00100fcc <_vfprintf_r>:
  100fcc:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  100fd0:	e24dde6b 	sub	sp, sp, #1712	; 0x6b0
  100fd4:	e1a0a001 	mov	sl, r1
  100fd8:	e58d0010 	str	r0, [sp, #16]
  100fdc:	e1a04002 	mov	r4, r2
  100fe0:	e1a09003 	mov	r9, r3
  100fe4:	eb001228 	bl	10588c <localeconv>
  100fe8:	e59d1010 	ldr	r1, [sp, #16]
  100fec:	e5900000 	ldr	r0, [r0]
  100ff0:	e3510000 	cmp	r1, #0	; 0x0
  100ff4:	e58d0028 	str	r0, [sp, #40]
  100ff8:	0a000002 	beq	101008 <_vfprintf_r+0x3c>
  100ffc:	e5913038 	ldr	r3, [r1, #56]
  101000:	e3530000 	cmp	r3, #0	; 0x0
  101004:	0a0000cf 	beq	101348 <prog+0x1304>
  101008:	e1dac0bc 	ldrh	ip, [sl, #12]
  10100c:	e31c0008 	tst	ip, #8	; 0x8
  101010:	0a0000cf 	beq	101354 <prog+0x1310>
  101014:	e59a3010 	ldr	r3, [sl, #16]
  101018:	e3530000 	cmp	r3, #0	; 0x0
  10101c:	0a0000cc 	beq	101354 <prog+0x1310>
  101020:	e20c301a 	and	r3, ip, #26	; 0x1a
  101024:	e353000a 	cmp	r3, #10	; 0xa
  101028:	1a00002d 	bne	1010e4 <_vfprintf_r+0x118>
  10102c:	e1da30fe 	ldrsh	r3, [sl, #14]
  101030:	e3530000 	cmp	r3, #0	; 0x0
  101034:	ba00002a 	blt	1010e4 <_vfprintf_r+0x118>
  101038:	e3ccc002 	bic	ip, ip, #2	; 0x2
  10103c:	e28d8c05 	add	r8, sp, #1280	; 0x500
  101040:	e1c8ccb0 	strh	ip, [r8, #192]
  101044:	e3a0c000 	mov	ip, #0	; 0x0
  101048:	e58dc5cc 	str	ip, [sp, #1484]
  10104c:	e28d7e5b 	add	r7, sp, #1456	; 0x5b0
  101050:	e1dac0be 	ldrh	ip, [sl, #14]
  101054:	e59a501c 	ldr	r5, [sl, #28]
  101058:	e59a6024 	ldr	r6, [sl, #36]
  10105c:	e28de060 	add	lr, sp, #96	; 0x60
  101060:	e2877004 	add	r7, r7, #4	; 0x4
  101064:	e24ee008 	sub	lr, lr, #8	; 0x8
  101068:	e1a02004 	mov	r2, r4
  10106c:	e59d0010 	ldr	r0, [sp, #16]
  101070:	e3a04b01 	mov	r4, #1024	; 0x400
  101074:	e1a03009 	mov	r3, r9
  101078:	e1a01007 	mov	r1, r7
  10107c:	e1c8ccb2 	strh	ip, [r8, #194]
  101080:	e58d55d0 	str	r5, [sp, #1488]
  101084:	e58d65d8 	str	r6, [sp, #1496]
  101088:	e58de5c4 	str	lr, [sp, #1476]
  10108c:	e58d45c8 	str	r4, [sp, #1480]
  101090:	e58de5b4 	str	lr, [sp, #1460]
  101094:	e58d45bc 	str	r4, [sp, #1468]
  101098:	ebffffcb 	bl	100fcc <_vfprintf_r>
  10109c:	e3500000 	cmp	r0, #0	; 0x0
  1010a0:	e58d0020 	str	r0, [sp, #32]
  1010a4:	ba000005 	blt	1010c0 <_vfprintf_r+0xf4>
  1010a8:	e1a00007 	mov	r0, r7
  1010ac:	eb000ef0 	bl	104c74 <fflush>
  1010b0:	e59d1020 	ldr	r1, [sp, #32]
  1010b4:	e3500000 	cmp	r0, #0	; 0x0
  1010b8:	13e01000 	mvnne	r1, #0	; 0x0
  1010bc:	e58d1020 	str	r1, [sp, #32]
  1010c0:	e28d2c05 	add	r2, sp, #1280	; 0x500
  1010c4:	e1d23cb0 	ldrh	r3, [r2, #192]
  1010c8:	e3130040 	tst	r3, #64	; 0x40
  1010cc:	11da30bc 	ldrneh	r3, [sl, #12]
  1010d0:	13833040 	orrne	r3, r3, #64	; 0x40
  1010d4:	11ca30bc 	strneh	r3, [sl, #12]
  1010d8:	e59d0020 	ldr	r0, [sp, #32]
  1010dc:	e28dde6b 	add	sp, sp, #1712	; 0x6b0
  1010e0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1010e4:	e58d4018 	str	r4, [sp, #24]
  1010e8:	e3a03000 	mov	r3, #0	; 0x0
  1010ec:	e3a04000 	mov	r4, #0	; 0x0
  1010f0:	e3a06000 	mov	r6, #0	; 0x0
  1010f4:	e28d8e61 	add	r8, sp, #1552	; 0x610
  1010f8:	e58d3048 	str	r3, [sp, #72]
  1010fc:	e58d404c 	str	r4, [sp, #76]
  101100:	e58d6020 	str	r6, [sp, #32]
  101104:	e58d6030 	str	r6, [sp, #48]
  101108:	e58d6040 	str	r6, [sp, #64]
  10110c:	e58d6044 	str	r6, [sp, #68]
  101110:	e58d8678 	str	r8, [sp, #1656]
  101114:	e58d6680 	str	r6, [sp, #1664]
  101118:	e58d667c 	str	r6, [sp, #1660]
  10111c:	e1a05006 	mov	r5, r6
  101120:	e59d4018 	ldr	r4, [sp, #24]
  101124:	e5d43000 	ldrb	r3, [r4]
  101128:	e3530000 	cmp	r3, #0	; 0x0
  10112c:	13530025 	cmpne	r3, #37	; 0x25
  101130:	0a000017 	beq	101194 <_vfprintf_r+0x1c8>
  101134:	e59d2018 	ldr	r2, [sp, #24]
  101138:	e5f23001 	ldrb	r3, [r2, #1]!
  10113c:	e3530000 	cmp	r3, #0	; 0x0
  101140:	13530025 	cmpne	r3, #37	; 0x25
  101144:	1afffffb 	bne	101138 <_vfprintf_r+0x16c>
  101148:	e59d5018 	ldr	r5, [sp, #24]
  10114c:	e0527005 	subs	r7, r2, r5
  101150:	e1a04002 	mov	r4, r2
  101154:	0a00000e 	beq	101194 <_vfprintf_r+0x1c8>
  101158:	e59d567c 	ldr	r5, [sp, #1660]
  10115c:	e59d6680 	ldr	r6, [sp, #1664]
  101160:	e2855001 	add	r5, r5, #1	; 0x1
  101164:	e59dc018 	ldr	ip, [sp, #24]
  101168:	e3550007 	cmp	r5, #7	; 0x7
  10116c:	e0866007 	add	r6, r6, r7
  101170:	e588c000 	str	ip, [r8]
  101174:	e5887004 	str	r7, [r8, #4]
  101178:	e58d6680 	str	r6, [sp, #1664]
  10117c:	e58d567c 	str	r5, [sp, #1660]
  101180:	d2888008 	addle	r8, r8, #8	; 0x8
  101184:	ca00041d 	bgt	102200 <prog+0x21bc>
  101188:	e59d1020 	ldr	r1, [sp, #32]
  10118c:	e0811007 	add	r1, r1, r7
  101190:	e58d1020 	str	r1, [sp, #32]
  101194:	e5d43000 	ldrb	r3, [r4]
  101198:	e3530000 	cmp	r3, #0	; 0x0
  10119c:	0a0006ef 	beq	102d60 <prog+0x2d1c>
  1011a0:	e3a03000 	mov	r3, #0	; 0x0
  1011a4:	e5cd36af 	strb	r3, [sp, #1711]
  1011a8:	e58d3024 	str	r3, [sp, #36]
  1011ac:	e3a02000 	mov	r2, #0	; 0x0
  1011b0:	e5d43001 	ldrb	r3, [r4, #1]
  1011b4:	e2844001 	add	r4, r4, #1	; 0x1
  1011b8:	e58d4018 	str	r4, [sp, #24]
  1011bc:	e58d2054 	str	r2, [sp, #84]
  1011c0:	e3e06000 	mvn	r6, #0	; 0x0
  1011c4:	e59dc018 	ldr	ip, [sp, #24]
  1011c8:	e28cc001 	add	ip, ip, #1	; 0x1
  1011cc:	e58dc018 	str	ip, [sp, #24]
  1011d0:	e1a07003 	mov	r7, r3
  1011d4:	e2473020 	sub	r3, r7, #32	; 0x20
  1011d8:	e3530058 	cmp	r3, #88	; 0x58
  1011dc:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  1011e0:	ea000198 	b	101848 <prog+0x1804>
  1011e4:	00101660 	andeqs	r1, r0, r0, ror #12
  1011e8:	00101848 	andeqs	r1, r0, r8, asr #16
  1011ec:	00101848 	andeqs	r1, r0, r8, asr #16
  1011f0:	00101678 	andeqs	r1, r0, r8, ror r6
  1011f4:	00101848 	andeqs	r1, r0, r8, asr #16
  1011f8:	00101848 	andeqs	r1, r0, r8, asr #16
  1011fc:	00101848 	andeqs	r1, r0, r8, asr #16
  101200:	00101848 	andeqs	r1, r0, r8, asr #16
  101204:	00101848 	andeqs	r1, r0, r8, asr #16
  101208:	00101848 	andeqs	r1, r0, r8, asr #16
  10120c:	00101690 	muleqs	r0, r0, r6
  101210:	001016b4 	ldreqh	r1, [r0], -r4
  101214:	00101848 	andeqs	r1, r0, r8, asr #16
  101218:	00101648 	andeqs	r1, r0, r8, asr #12
  10121c:	00101d74 	andeqs	r1, r0, r4, ror sp
  101220:	00101848 	andeqs	r1, r0, r8, asr #16
  101224:	00101d2c 	andeqs	r1, r0, ip, lsr #26
  101228:	00101d44 	andeqs	r1, r0, r4, asr #26
  10122c:	00101d44 	andeqs	r1, r0, r4, asr #26
  101230:	00101d44 	andeqs	r1, r0, r4, asr #26
  101234:	00101d44 	andeqs	r1, r0, r4, asr #26
  101238:	00101d44 	andeqs	r1, r0, r4, asr #26
  10123c:	00101d44 	andeqs	r1, r0, r4, asr #26
  101240:	00101d44 	andeqs	r1, r0, r4, asr #26
  101244:	00101d44 	andeqs	r1, r0, r4, asr #26
  101248:	00101d44 	andeqs	r1, r0, r4, asr #26
  10124c:	00101848 	andeqs	r1, r0, r8, asr #16
  101250:	00101848 	andeqs	r1, r0, r8, asr #16
  101254:	00101848 	andeqs	r1, r0, r8, asr #16
  101258:	00101848 	andeqs	r1, r0, r8, asr #16
  10125c:	00101848 	andeqs	r1, r0, r8, asr #16
  101260:	00101848 	andeqs	r1, r0, r8, asr #16
  101264:	00101848 	andeqs	r1, r0, r8, asr #16
  101268:	00101848 	andeqs	r1, r0, r8, asr #16
  10126c:	00101848 	andeqs	r1, r0, r8, asr #16
  101270:	0010171c 	andeqs	r1, r0, ip, lsl r7
  101274:	001013b4 	ldreqh	r1, [r0], -r4
  101278:	00101798 	muleqs	r0, r8, r7
  10127c:	00101798 	muleqs	r0, r8, r7
  101280:	00101798 	muleqs	r0, r8, r7
  101284:	00101848 	andeqs	r1, r0, r8, asr #16
  101288:	00101848 	andeqs	r1, r0, r8, asr #16
  10128c:	00101848 	andeqs	r1, r0, r8, asr #16
  101290:	00101848 	andeqs	r1, r0, r8, asr #16
  101294:	00101d14 	andeqs	r1, r0, r4, lsl sp
  101298:	00101848 	andeqs	r1, r0, r8, asr #16
  10129c:	00101848 	andeqs	r1, r0, r8, asr #16
  1012a0:	0010144c 	andeqs	r1, r0, ip, asr #8
  1012a4:	00101848 	andeqs	r1, r0, r8, asr #16
  1012a8:	00101848 	andeqs	r1, r0, r8, asr #16
  1012ac:	00101848 	andeqs	r1, r0, r8, asr #16
  1012b0:	00101b6c 	andeqs	r1, r0, ip, ror #22
  1012b4:	00101848 	andeqs	r1, r0, r8, asr #16
  1012b8:	00101604 	andeqs	r1, r0, r4, lsl #12
  1012bc:	00101848 	andeqs	r1, r0, r8, asr #16
  1012c0:	00101848 	andeqs	r1, r0, r8, asr #16
  1012c4:	001016c8 	andeqs	r1, r0, r8, asr #13
  1012c8:	00101848 	andeqs	r1, r0, r8, asr #16
  1012cc:	00101848 	andeqs	r1, r0, r8, asr #16
  1012d0:	00101848 	andeqs	r1, r0, r8, asr #16
  1012d4:	00101848 	andeqs	r1, r0, r8, asr #16
  1012d8:	00101848 	andeqs	r1, r0, r8, asr #16
  1012dc:	00101848 	andeqs	r1, r0, r8, asr #16
  1012e0:	00101848 	andeqs	r1, r0, r8, asr #16
  1012e4:	00101848 	andeqs	r1, r0, r8, asr #16
  1012e8:	00101848 	andeqs	r1, r0, r8, asr #16
  1012ec:	00101848 	andeqs	r1, r0, r8, asr #16
  1012f0:	0010171c 	andeqs	r1, r0, ip, lsl r7
  1012f4:	001013c0 	andeqs	r1, r0, r0, asr #7
  1012f8:	00101798 	muleqs	r0, r8, r7
  1012fc:	00101798 	muleqs	r0, r8, r7
  101300:	00101798 	muleqs	r0, r8, r7
  101304:	00101830 	andeqs	r1, r0, r0, lsr r8
  101308:	001013c0 	andeqs	r1, r0, r0, asr #7
  10130c:	00101848 	andeqs	r1, r0, r8, asr #16
  101310:	00101848 	andeqs	r1, r0, r8, asr #16
  101314:	00101ca0 	andeqs	r1, r0, r0, lsr #25
  101318:	00101848 	andeqs	r1, r0, r8, asr #16
  10131c:	00101cd0 	ldreqsb	r1, [r0], -r0
  101320:	00101458 	andeqs	r1, r0, r8, asr r4
  101324:	00101b28 	andeqs	r1, r0, r8, lsr #22
  101328:	00101b54 	andeqs	r1, r0, r4, asr fp
  10132c:	00101848 	andeqs	r1, r0, r8, asr #16
  101330:	00101b6c 	andeqs	r1, r0, ip, ror #22
  101334:	00101848 	andeqs	r1, r0, r8, asr #16
  101338:	00101610 	andeqs	r1, r0, r0, lsl r6
  10133c:	00101848 	andeqs	r1, r0, r8, asr #16
  101340:	00101848 	andeqs	r1, r0, r8, asr #16
  101344:	00101b1c 	andeqs	r1, r0, ip, lsl fp
  101348:	e1a00001 	mov	r0, r1
  10134c:	eb000e9b 	bl	104dc0 <__sinit>
  101350:	eaffff2c 	b	101008 <_vfprintf_r+0x3c>
  101354:	e1a0000a 	mov	r0, sl
  101358:	eb000873 	bl	10352c <__swsetup>
  10135c:	e3500000 	cmp	r0, #0	; 0x0
  101360:	1a000010 	bne	1013a8 <prog+0x1364>
  101364:	e1dac0bc 	ldrh	ip, [sl, #12]
  101368:	eaffff2c 	b	101020 <_vfprintf_r+0x54>
  10136c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101370:	e1a0000a 	mov	r0, sl
  101374:	e2811008 	add	r1, r1, #8	; 0x8
  101378:	ebffff03 	bl	100f8c <__sprint>
  10137c:	e3500000 	cmp	r0, #0	; 0x0
  101380:	0a0001d8 	beq	101ae8 <prog+0x1aa4>
  101384:	e59d1044 	ldr	r1, [sp, #68]
  101388:	e3510000 	cmp	r1, #0	; 0x0
  10138c:	0a000002 	beq	10139c <prog+0x1358>
  101390:	e59d0010 	ldr	r0, [sp, #16]
  101394:	e59d1044 	ldr	r1, [sp, #68]
  101398:	eb000f4b 	bl	1050cc <_free_r>
  10139c:	e1da30bc 	ldrh	r3, [sl, #12]
  1013a0:	e3130040 	tst	r3, #64	; 0x40
  1013a4:	0affff4b 	beq	1010d8 <_vfprintf_r+0x10c>
  1013a8:	e3e02000 	mvn	r2, #0	; 0x0
  1013ac:	e58d2020 	str	r2, [sp, #32]
  1013b0:	eaffff48 	b	1010d8 <_vfprintf_r+0x10c>
  1013b4:	e59d3054 	ldr	r3, [sp, #84]
  1013b8:	e3833010 	orr	r3, r3, #16	; 0x10
  1013bc:	e58d3054 	str	r3, [sp, #84]
  1013c0:	e59d4054 	ldr	r4, [sp, #84]
  1013c4:	e3140010 	tst	r4, #16	; 0x10
  1013c8:	1a000002 	bne	1013d8 <prog+0x1394>
  1013cc:	e59d5054 	ldr	r5, [sp, #84]
  1013d0:	e3150040 	tst	r5, #64	; 0x40
  1013d4:	1a000414 	bne	10242c <prog+0x23e8>
  1013d8:	e5991000 	ldr	r1, [r9]
  1013dc:	e2899004 	add	r9, r9, #4	; 0x4
  1013e0:	e58d9050 	str	r9, [sp, #80]
  1013e4:	e3510000 	cmp	r1, #0	; 0x0
  1013e8:	b3a0302d 	movlt	r3, #45	; 0x2d
  1013ec:	a3a02001 	movge	r2, #1	; 0x1
  1013f0:	b2611000 	rsblt	r1, r1, #0	; 0x0
  1013f4:	b3a02001 	movlt	r2, #1	; 0x1
  1013f8:	b5cd36af 	strltb	r3, [sp, #1711]
  1013fc:	e3560000 	cmp	r6, #0	; 0x0
  101400:	aa00001f 	bge	101484 <prog+0x1440>
  101404:	e3520001 	cmp	r2, #1	; 0x1
  101408:	0a000384 	beq	102220 <prog+0x21dc>
  10140c:	328d0e5b 	addcc	r0, sp, #1456	; 0x5b0
  101410:	32800004 	addcc	r0, r0, #4	; 0x4
  101414:	3a0002c1 	bcc	101f20 <prog+0x1edc>
  101418:	e3520002 	cmp	r2, #2	; 0x2
  10141c:	0a00047e 	beq	10261c <prog+0x25d8>
  101420:	e59f0fcc 	ldr	r0, [pc, #4044]	; 1023f4 <prog+0x23b0>
  101424:	ebfffe6f 	bl	100de8 <strlen>
  101428:	e59fcfc4 	ldr	ip, [pc, #4036]	; 1023f4 <prog+0x23b0>
  10142c:	e1560000 	cmp	r6, r0
  101430:	a1a01006 	movge	r1, r6
  101434:	b1a01000 	movlt	r1, r0
  101438:	e1a0b000 	mov	fp, r0
  10143c:	e58dc01c 	str	ip, [sp, #28]
  101440:	e58d103c 	str	r1, [sp, #60]
  101444:	e58d6038 	str	r6, [sp, #56]
  101448:	ea00002c 	b	101500 <prog+0x14bc>
  10144c:	e59d2054 	ldr	r2, [sp, #84]
  101450:	e3822010 	orr	r2, r2, #16	; 0x10
  101454:	e58d2054 	str	r2, [sp, #84]
  101458:	e59d3054 	ldr	r3, [sp, #84]
  10145c:	e2132010 	ands	r2, r3, #16	; 0x10
  101460:	0a0003a4 	beq	1022f8 <prog+0x22b4>
  101464:	e5991000 	ldr	r1, [r9]
  101468:	e2899004 	add	r9, r9, #4	; 0x4
  10146c:	e58d9050 	str	r9, [sp, #80]
  101470:	e3a02000 	mov	r2, #0	; 0x0
  101474:	e3a03000 	mov	r3, #0	; 0x0
  101478:	e3560000 	cmp	r6, #0	; 0x0
  10147c:	e5cd36af 	strb	r3, [sp, #1711]
  101480:	baffffdf 	blt	101404 <prog+0x13c0>
  101484:	e59d3054 	ldr	r3, [sp, #84]
  101488:	e3560000 	cmp	r6, #0	; 0x0
  10148c:	03510000 	cmpeq	r1, #0	; 0x0
  101490:	e3c33080 	bic	r3, r3, #128	; 0x80
  101494:	e58d3054 	str	r3, [sp, #84]
  101498:	1affffd9 	bne	101404 <prog+0x13c0>
  10149c:	e3520000 	cmp	r2, #0	; 0x0
  1014a0:	128d2e5b 	addne	r2, sp, #1456	; 0x5b0
  1014a4:	12822004 	addne	r2, r2, #4	; 0x4
  1014a8:	158d201c 	strne	r2, [sp, #28]
  1014ac:	1a000009 	bne	1014d8 <prog+0x1494>
  1014b0:	e59d3054 	ldr	r3, [sp, #84]
  1014b4:	e3130001 	tst	r3, #1	; 0x1
  1014b8:	028d4e5b 	addeq	r4, sp, #1456	; 0x5b0
  1014bc:	128d5e5b 	addne	r5, sp, #1456	; 0x5b0
  1014c0:	02844004 	addeq	r4, r4, #4	; 0x4
  1014c4:	13a03030 	movne	r3, #48	; 0x30
  1014c8:	12855003 	addne	r5, r5, #3	; 0x3
  1014cc:	058d401c 	streq	r4, [sp, #28]
  1014d0:	15cd35b3 	strneb	r3, [sp, #1459]
  1014d4:	158d501c 	strne	r5, [sp, #28]
  1014d8:	e28d5e45 	add	r5, sp, #1104	; 0x450
  1014dc:	e59dc01c 	ldr	ip, [sp, #28]
  1014e0:	e2855008 	add	r5, r5, #8	; 0x8
  1014e4:	e06c3005 	rsb	r3, ip, r5
  1014e8:	e283bf57 	add	fp, r3, #348	; 0x15c
  1014ec:	e156000b 	cmp	r6, fp
  1014f0:	a1a01006 	movge	r1, r6
  1014f4:	b1a0100b 	movlt	r1, fp
  1014f8:	e58d103c 	str	r1, [sp, #60]
  1014fc:	e58d6038 	str	r6, [sp, #56]
  101500:	e5dd36af 	ldrb	r3, [sp, #1711]
  101504:	e3530000 	cmp	r3, #0	; 0x0
  101508:	0a0000dc 	beq	101880 <prog+0x183c>
  10150c:	e59d103c 	ldr	r1, [sp, #60]
  101510:	e59d4054 	ldr	r4, [sp, #84]
  101514:	e2811001 	add	r1, r1, #1	; 0x1
  101518:	e2144084 	ands	r4, r4, #132	; 0x84
  10151c:	e58d103c 	str	r1, [sp, #60]
  101520:	e58d4014 	str	r4, [sp, #20]
  101524:	1a0000de 	bne	1018a4 <prog+0x1860>
  101528:	e59d5024 	ldr	r5, [sp, #36]
  10152c:	e59dc03c 	ldr	ip, [sp, #60]
  101530:	e06c4005 	rsb	r4, ip, r5
  101534:	e3540000 	cmp	r4, #0	; 0x0
  101538:	da0000d9 	ble	1018a4 <prog+0x1860>
  10153c:	e3540010 	cmp	r4, #16	; 0x10
  101540:	da000484 	ble	102758 <prog+0x2714>
  101544:	e59d6680 	ldr	r6, [sp, #1664]
  101548:	e59d567c 	ldr	r5, [sp, #1660]
  10154c:	e59f9ec8 	ldr	r9, [pc, #3784]	; 10241c <prog+0x23d8>
  101550:	ea000002 	b	101560 <prog+0x151c>
  101554:	e2444010 	sub	r4, r4, #16	; 0x10
  101558:	e3540010 	cmp	r4, #16	; 0x10
  10155c:	da000015 	ble	1015b8 <prog+0x1574>
  101560:	e2855001 	add	r5, r5, #1	; 0x1
  101564:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101568:	e2866010 	add	r6, r6, #16	; 0x10
  10156c:	e3a03010 	mov	r3, #16	; 0x10
  101570:	e3550007 	cmp	r5, #7	; 0x7
  101574:	e5883004 	str	r3, [r8, #4]
  101578:	e5889000 	str	r9, [r8]
  10157c:	e1a0000a 	mov	r0, sl
  101580:	e2811008 	add	r1, r1, #8	; 0x8
  101584:	e2888008 	add	r8, r8, #8	; 0x8
  101588:	e58d6680 	str	r6, [sp, #1664]
  10158c:	e58d567c 	str	r5, [sp, #1660]
  101590:	daffffef 	ble	101554 <prog+0x1510>
  101594:	ebfffe7c 	bl	100f8c <__sprint>
  101598:	e3500000 	cmp	r0, #0	; 0x0
  10159c:	1affff78 	bne	101384 <prog+0x1340>
  1015a0:	e2444010 	sub	r4, r4, #16	; 0x10
  1015a4:	e3540010 	cmp	r4, #16	; 0x10
  1015a8:	e28d8e61 	add	r8, sp, #1552	; 0x610
  1015ac:	e59d6680 	ldr	r6, [sp, #1664]
  1015b0:	e59d567c 	ldr	r5, [sp, #1660]
  1015b4:	caffffe9 	bgt	101560 <prog+0x151c>
  1015b8:	e2855001 	add	r5, r5, #1	; 0x1
  1015bc:	e0866004 	add	r6, r6, r4
  1015c0:	e3550007 	cmp	r5, #7	; 0x7
  1015c4:	e5889000 	str	r9, [r8]
  1015c8:	e5884004 	str	r4, [r8, #4]
  1015cc:	e58d6680 	str	r6, [sp, #1664]
  1015d0:	e58d567c 	str	r5, [sp, #1660]
  1015d4:	d2888008 	addle	r8, r8, #8	; 0x8
  1015d8:	da0000b3 	ble	1018ac <prog+0x1868>
  1015dc:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1015e0:	e1a0000a 	mov	r0, sl
  1015e4:	e2811008 	add	r1, r1, #8	; 0x8
  1015e8:	ebfffe67 	bl	100f8c <__sprint>
  1015ec:	e3500000 	cmp	r0, #0	; 0x0
  1015f0:	1affff63 	bne	101384 <prog+0x1340>
  1015f4:	e59d6680 	ldr	r6, [sp, #1664]
  1015f8:	e59d567c 	ldr	r5, [sp, #1660]
  1015fc:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101600:	ea0000a9 	b	1018ac <prog+0x1868>
  101604:	e59d1054 	ldr	r1, [sp, #84]
  101608:	e3811010 	orr	r1, r1, #16	; 0x10
  10160c:	e58d1054 	str	r1, [sp, #84]
  101610:	e59d2054 	ldr	r2, [sp, #84]
  101614:	e3120010 	tst	r2, #16	; 0x10
  101618:	1a000002 	bne	101628 <prog+0x15e4>
  10161c:	e59d3054 	ldr	r3, [sp, #84]
  101620:	e3130040 	tst	r3, #64	; 0x40
  101624:	1a00036b 	bne	1023d8 <prog+0x2394>
  101628:	e5991000 	ldr	r1, [r9]
  10162c:	e3a02001 	mov	r2, #1	; 0x1
  101630:	e2899004 	add	r9, r9, #4	; 0x4
  101634:	e58d9050 	str	r9, [sp, #80]
  101638:	eaffff8d 	b	101474 <prog+0x1430>
  10163c:	e26cc000 	rsb	ip, ip, #0	; 0x0
  101640:	e58dc024 	str	ip, [sp, #36]
  101644:	e1a09002 	mov	r9, r2
  101648:	e59d1018 	ldr	r1, [sp, #24]
  10164c:	e59d2054 	ldr	r2, [sp, #84]
  101650:	e5d13000 	ldrb	r3, [r1]
  101654:	e3822004 	orr	r2, r2, #4	; 0x4
  101658:	e58d2054 	str	r2, [sp, #84]
  10165c:	eafffed8 	b	1011c4 <_vfprintf_r+0x1f8>
  101660:	e5dd36af 	ldrb	r3, [sp, #1711]
  101664:	e3530000 	cmp	r3, #0	; 0x0
  101668:	0a000355 	beq	1023c4 <prog+0x2380>
  10166c:	e59d5018 	ldr	r5, [sp, #24]
  101670:	e5d53000 	ldrb	r3, [r5]
  101674:	eafffed2 	b	1011c4 <_vfprintf_r+0x1f8>
  101678:	e59d4018 	ldr	r4, [sp, #24]
  10167c:	e59d5054 	ldr	r5, [sp, #84]
  101680:	e5d43000 	ldrb	r3, [r4]
  101684:	e3855001 	orr	r5, r5, #1	; 0x1
  101688:	e58d5054 	str	r5, [sp, #84]
  10168c:	eafffecc 	b	1011c4 <_vfprintf_r+0x1f8>
  101690:	e599c000 	ldr	ip, [r9]
  101694:	e35c0000 	cmp	ip, #0	; 0x0
  101698:	e58dc024 	str	ip, [sp, #36]
  10169c:	e2892004 	add	r2, r9, #4	; 0x4
  1016a0:	baffffe5 	blt	10163c <prog+0x15f8>
  1016a4:	e59d4018 	ldr	r4, [sp, #24]
  1016a8:	e5d43000 	ldrb	r3, [r4]
  1016ac:	e1a09002 	mov	r9, r2
  1016b0:	eafffec3 	b	1011c4 <_vfprintf_r+0x1f8>
  1016b4:	e3a0302b 	mov	r3, #43	; 0x2b
  1016b8:	e5cd36af 	strb	r3, [sp, #1711]
  1016bc:	e59d4018 	ldr	r4, [sp, #24]
  1016c0:	e5d43000 	ldrb	r3, [r4]
  1016c4:	eafffebe 	b	1011c4 <_vfprintf_r+0x1f8>
  1016c8:	e59f4d28 	ldr	r4, [pc, #3368]	; 1023f8 <prog+0x23b4>
  1016cc:	e58d4040 	str	r4, [sp, #64]
  1016d0:	e59d5054 	ldr	r5, [sp, #84]
  1016d4:	e3150010 	tst	r5, #16	; 0x10
  1016d8:	1a000002 	bne	1016e8 <prog+0x16a4>
  1016dc:	e59dc054 	ldr	ip, [sp, #84]
  1016e0:	e31c0040 	tst	ip, #64	; 0x40
  1016e4:	1a000356 	bne	102444 <prog+0x2400>
  1016e8:	e5991000 	ldr	r1, [r9]
  1016ec:	e2899004 	add	r9, r9, #4	; 0x4
  1016f0:	e58d9050 	str	r9, [sp, #80]
  1016f4:	e59d3054 	ldr	r3, [sp, #84]
  1016f8:	e3510000 	cmp	r1, #0	; 0x0
  1016fc:	03a03000 	moveq	r3, #0	; 0x0
  101700:	12033001 	andne	r3, r3, #1	; 0x1
  101704:	e3530000 	cmp	r3, #0	; 0x0
  101708:	159d2054 	ldrne	r2, [sp, #84]
  10170c:	13822002 	orrne	r2, r2, #2	; 0x2
  101710:	158d2054 	strne	r2, [sp, #84]
  101714:	e3a02002 	mov	r2, #2	; 0x2
  101718:	eaffff55 	b	101474 <prog+0x1430>
  10171c:	e3570043 	cmp	r7, #67	; 0x43
  101720:	0a000002 	beq	101730 <prog+0x16ec>
  101724:	e59d1054 	ldr	r1, [sp, #84]
  101728:	e3110010 	tst	r1, #16	; 0x10
  10172c:	0a00037a 	beq	10251c <prog+0x24d8>
  101730:	e28d4d1a 	add	r4, sp, #1664	; 0x680
  101734:	e284400c 	add	r4, r4, #12	; 0xc
  101738:	e28d5e45 	add	r5, sp, #1104	; 0x450
  10173c:	e3a01000 	mov	r1, #0	; 0x0
  101740:	e3a02008 	mov	r2, #8	; 0x8
  101744:	e1a00004 	mov	r0, r4
  101748:	e2855008 	add	r5, r5, #8	; 0x8
  10174c:	ebfffd46 	bl	100c6c <memset>
  101750:	e1a03004 	mov	r3, r4
  101754:	e59d0010 	ldr	r0, [sp, #16]
  101758:	e1a01005 	mov	r1, r5
  10175c:	e5992000 	ldr	r2, [r9]
  101760:	eb0005eb 	bl	102f14 <_wcrtomb_r>
  101764:	e3700001 	cmn	r0, #1	; 0x1
  101768:	e1a0b000 	mov	fp, r0
  10176c:	0a000565 	beq	102d08 <prog+0x2cc4>
  101770:	e2899004 	add	r9, r9, #4	; 0x4
  101774:	e58d9050 	str	r9, [sp, #80]
  101778:	e35b0000 	cmp	fp, #0	; 0x0
  10177c:	a1a0200b 	movge	r2, fp
  101780:	b3a02000 	movlt	r2, #0	; 0x0
  101784:	e3a03000 	mov	r3, #0	; 0x0
  101788:	e58d203c 	str	r2, [sp, #60]
  10178c:	e58d501c 	str	r5, [sp, #28]
  101790:	e5cd36af 	strb	r3, [sp, #1711]
  101794:	ea000037 	b	101878 <prog+0x1834>
  101798:	e3760001 	cmn	r6, #1	; 0x1
  10179c:	02866007 	addeq	r6, r6, #7	; 0x7
  1017a0:	0a000002 	beq	1017b0 <prog+0x176c>
  1017a4:	e3570047 	cmp	r7, #71	; 0x47
  1017a8:	13570067 	cmpne	r7, #103	; 0x67
  1017ac:	0a000362 	beq	10253c <prog+0x24f8>
  1017b0:	e59dc054 	ldr	ip, [sp, #84]
  1017b4:	e31c0008 	tst	ip, #8	; 0x8
  1017b8:	0a0002fb 	beq	1023ac <prog+0x2368>
  1017bc:	e8990006 	ldmia	r9, {r1, r2}
  1017c0:	e2899008 	add	r9, r9, #8	; 0x8
  1017c4:	e58d1048 	str	r1, [sp, #72]
  1017c8:	e58d204c 	str	r2, [sp, #76]
  1017cc:	e58d9050 	str	r9, [sp, #80]
  1017d0:	e28d0048 	add	r0, sp, #72	; 0x48
  1017d4:	e8900003 	ldmia	r0, {r0, r1}
  1017d8:	eb00159e 	bl	106e58 <isinf>
  1017dc:	e2504000 	subs	r4, r0, #0	; 0x0
  1017e0:	0a0003c4 	beq	1026f8 <prog+0x26b4>
  1017e4:	e3a03000 	mov	r3, #0	; 0x0
  1017e8:	e28d0048 	add	r0, sp, #72	; 0x48
  1017ec:	e8900003 	ldmia	r0, {r0, r1}
  1017f0:	e3a02000 	mov	r2, #0	; 0x0
  1017f4:	eb001b70 	bl	1085bc <__ltdf2>
  1017f8:	e3500000 	cmp	r0, #0	; 0x0
  1017fc:	b3a0302d 	movlt	r3, #45	; 0x2d
  101800:	b5cd36af 	strltb	r3, [sp, #1711]
  101804:	e2473045 	sub	r3, r7, #69	; 0x45
  101808:	e3530002 	cmp	r3, #2	; 0x2
  10180c:	8a0003a8 	bhi	1026b4 <prog+0x2670>
  101810:	e3a03003 	mov	r3, #3	; 0x3
  101814:	e59f4be0 	ldr	r4, [pc, #3040]	; 1023fc <prog+0x23b8>
  101818:	e3a05000 	mov	r5, #0	; 0x0
  10181c:	e1a0b003 	mov	fp, r3
  101820:	e58d303c 	str	r3, [sp, #60]
  101824:	e58d401c 	str	r4, [sp, #28]
  101828:	e58d5038 	str	r5, [sp, #56]
  10182c:	eaffff33 	b	101500 <prog+0x14bc>
  101830:	e59d5018 	ldr	r5, [sp, #24]
  101834:	e59dc054 	ldr	ip, [sp, #84]
  101838:	e5d53000 	ldrb	r3, [r5]
  10183c:	e38cc040 	orr	ip, ip, #64	; 0x40
  101840:	e58dc054 	str	ip, [sp, #84]
  101844:	eafffe5e 	b	1011c4 <_vfprintf_r+0x1f8>
  101848:	e3570000 	cmp	r7, #0	; 0x0
  10184c:	0a000543 	beq	102d60 <prog+0x2d1c>
  101850:	e28d3e45 	add	r3, sp, #1104	; 0x450
  101854:	e2833008 	add	r3, r3, #8	; 0x8
  101858:	e3a02001 	mov	r2, #1	; 0x1
  10185c:	e58d301c 	str	r3, [sp, #28]
  101860:	e3a03000 	mov	r3, #0	; 0x0
  101864:	e58d203c 	str	r2, [sp, #60]
  101868:	e58d9050 	str	r9, [sp, #80]
  10186c:	e5cd36af 	strb	r3, [sp, #1711]
  101870:	e5cd7458 	strb	r7, [sp, #1112]
  101874:	e1a0b002 	mov	fp, r2
  101878:	e3a05000 	mov	r5, #0	; 0x0
  10187c:	e58d5038 	str	r5, [sp, #56]
  101880:	e59d2054 	ldr	r2, [sp, #84]
  101884:	e3120002 	tst	r2, #2	; 0x2
  101888:	159d303c 	ldrne	r3, [sp, #60]
  10188c:	e59d4054 	ldr	r4, [sp, #84]
  101890:	12833002 	addne	r3, r3, #2	; 0x2
  101894:	158d303c 	strne	r3, [sp, #60]
  101898:	e2144084 	ands	r4, r4, #132	; 0x84
  10189c:	e58d4014 	str	r4, [sp, #20]
  1018a0:	0affff20 	beq	101528 <prog+0x14e4>
  1018a4:	e59d6680 	ldr	r6, [sp, #1664]
  1018a8:	e59d567c 	ldr	r5, [sp, #1660]
  1018ac:	e5dd36af 	ldrb	r3, [sp, #1711]
  1018b0:	e3530000 	cmp	r3, #0	; 0x0
  1018b4:	0a000147 	beq	101dd8 <prog+0x1d94>
  1018b8:	e2855001 	add	r5, r5, #1	; 0x1
  1018bc:	e28d3e6a 	add	r3, sp, #1696	; 0x6a0
  1018c0:	e2866001 	add	r6, r6, #1	; 0x1
  1018c4:	e283300f 	add	r3, r3, #15	; 0xf
  1018c8:	e3a02001 	mov	r2, #1	; 0x1
  1018cc:	e3550007 	cmp	r5, #7	; 0x7
  1018d0:	e5883000 	str	r3, [r8]
  1018d4:	e5882004 	str	r2, [r8, #4]
  1018d8:	e58d6680 	str	r6, [sp, #1664]
  1018dc:	e58d567c 	str	r5, [sp, #1660]
  1018e0:	ca00014d 	bgt	101e1c <prog+0x1dd8>
  1018e4:	e2888008 	add	r8, r8, #8	; 0x8
  1018e8:	e59d2014 	ldr	r2, [sp, #20]
  1018ec:	e3520080 	cmp	r2, #128	; 0x80
  1018f0:	0a000155 	beq	101e4c <prog+0x1e08>
  1018f4:	e59d1038 	ldr	r1, [sp, #56]
  1018f8:	e06b4001 	rsb	r4, fp, r1
  1018fc:	e3540000 	cmp	r4, #0	; 0x0
  101900:	da00002e 	ble	1019c0 <prog+0x197c>
  101904:	e3540010 	cmp	r4, #16	; 0x10
  101908:	da000367 	ble	1026ac <prog+0x2668>
  10190c:	e59f9b0c 	ldr	r9, [pc, #2828]	; 102420 <prog+0x23dc>
  101910:	ea000002 	b	101920 <prog+0x18dc>
  101914:	e2444010 	sub	r4, r4, #16	; 0x10
  101918:	e3540010 	cmp	r4, #16	; 0x10
  10191c:	da000015 	ble	101978 <prog+0x1934>
  101920:	e2855001 	add	r5, r5, #1	; 0x1
  101924:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101928:	e2866010 	add	r6, r6, #16	; 0x10
  10192c:	e3a03010 	mov	r3, #16	; 0x10
  101930:	e3550007 	cmp	r5, #7	; 0x7
  101934:	e5883004 	str	r3, [r8, #4]
  101938:	e5889000 	str	r9, [r8]
  10193c:	e1a0000a 	mov	r0, sl
  101940:	e2811008 	add	r1, r1, #8	; 0x8
  101944:	e2888008 	add	r8, r8, #8	; 0x8
  101948:	e58d6680 	str	r6, [sp, #1664]
  10194c:	e58d567c 	str	r5, [sp, #1660]
  101950:	daffffef 	ble	101914 <prog+0x18d0>
  101954:	ebfffd8c 	bl	100f8c <__sprint>
  101958:	e3500000 	cmp	r0, #0	; 0x0
  10195c:	1afffe88 	bne	101384 <prog+0x1340>
  101960:	e2444010 	sub	r4, r4, #16	; 0x10
  101964:	e3540010 	cmp	r4, #16	; 0x10
  101968:	e28d8e61 	add	r8, sp, #1552	; 0x610
  10196c:	e59d6680 	ldr	r6, [sp, #1664]
  101970:	e59d567c 	ldr	r5, [sp, #1660]
  101974:	caffffe9 	bgt	101920 <prog+0x18dc>
  101978:	e2855001 	add	r5, r5, #1	; 0x1
  10197c:	e0866004 	add	r6, r6, r4
  101980:	e3550007 	cmp	r5, #7	; 0x7
  101984:	e5889000 	str	r9, [r8]
  101988:	e5884004 	str	r4, [r8, #4]
  10198c:	e58d6680 	str	r6, [sp, #1664]
  101990:	e58d567c 	str	r5, [sp, #1660]
  101994:	d2888008 	addle	r8, r8, #8	; 0x8
  101998:	da000008 	ble	1019c0 <prog+0x197c>
  10199c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1019a0:	e1a0000a 	mov	r0, sl
  1019a4:	e2811008 	add	r1, r1, #8	; 0x8
  1019a8:	ebfffd77 	bl	100f8c <__sprint>
  1019ac:	e3500000 	cmp	r0, #0	; 0x0
  1019b0:	1afffe73 	bne	101384 <prog+0x1340>
  1019b4:	e59d6680 	ldr	r6, [sp, #1664]
  1019b8:	e59d567c 	ldr	r5, [sp, #1660]
  1019bc:	e28d8e61 	add	r8, sp, #1552	; 0x610
  1019c0:	e59d2054 	ldr	r2, [sp, #84]
  1019c4:	e3120c01 	tst	r2, #256	; 0x100
  1019c8:	1a000163 	bne	101f5c <prog+0x1f18>
  1019cc:	e2855001 	add	r5, r5, #1	; 0x1
  1019d0:	e59d301c 	ldr	r3, [sp, #28]
  1019d4:	e086600b 	add	r6, r6, fp
  1019d8:	e3550007 	cmp	r5, #7	; 0x7
  1019dc:	e8880808 	stmia	r8, {r3, fp}
  1019e0:	e58d6680 	str	r6, [sp, #1664]
  1019e4:	e58d567c 	str	r5, [sp, #1660]
  1019e8:	d288c008 	addle	ip, r8, #8	; 0x8
  1019ec:	ca0001c6 	bgt	10210c <prog+0x20c8>
  1019f0:	e59d1054 	ldr	r1, [sp, #84]
  1019f4:	e3110004 	tst	r1, #4	; 0x4
  1019f8:	0a000031 	beq	101ac4 <prog+0x1a80>
  1019fc:	e59d2024 	ldr	r2, [sp, #36]
  101a00:	e59d303c 	ldr	r3, [sp, #60]
  101a04:	e0634002 	rsb	r4, r3, r2
  101a08:	e3540000 	cmp	r4, #0	; 0x0
  101a0c:	da00002c 	ble	101ac4 <prog+0x1a80>
  101a10:	e3540010 	cmp	r4, #16	; 0x10
  101a14:	da000393 	ble	102868 <prog+0x2824>
  101a18:	e59d567c 	ldr	r5, [sp, #1660]
  101a1c:	e59f99f8 	ldr	r9, [pc, #2552]	; 10241c <prog+0x23d8>
  101a20:	ea000002 	b	101a30 <prog+0x19ec>
  101a24:	e2444010 	sub	r4, r4, #16	; 0x10
  101a28:	e3540010 	cmp	r4, #16	; 0x10
  101a2c:	da000015 	ble	101a88 <prog+0x1a44>
  101a30:	e2855001 	add	r5, r5, #1	; 0x1
  101a34:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101a38:	e2866010 	add	r6, r6, #16	; 0x10
  101a3c:	e3a03010 	mov	r3, #16	; 0x10
  101a40:	e3550007 	cmp	r5, #7	; 0x7
  101a44:	e58c3004 	str	r3, [ip, #4]
  101a48:	e58c9000 	str	r9, [ip]
  101a4c:	e1a0000a 	mov	r0, sl
  101a50:	e2811008 	add	r1, r1, #8	; 0x8
  101a54:	e28cc008 	add	ip, ip, #8	; 0x8
  101a58:	e58d6680 	str	r6, [sp, #1664]
  101a5c:	e58d567c 	str	r5, [sp, #1660]
  101a60:	daffffef 	ble	101a24 <prog+0x19e0>
  101a64:	ebfffd48 	bl	100f8c <__sprint>
  101a68:	e3500000 	cmp	r0, #0	; 0x0
  101a6c:	1afffe44 	bne	101384 <prog+0x1340>
  101a70:	e2444010 	sub	r4, r4, #16	; 0x10
  101a74:	e3540010 	cmp	r4, #16	; 0x10
  101a78:	e28dce61 	add	ip, sp, #1552	; 0x610
  101a7c:	e59d6680 	ldr	r6, [sp, #1664]
  101a80:	e59d567c 	ldr	r5, [sp, #1660]
  101a84:	caffffe9 	bgt	101a30 <prog+0x19ec>
  101a88:	e2855001 	add	r5, r5, #1	; 0x1
  101a8c:	e0866004 	add	r6, r6, r4
  101a90:	e3550007 	cmp	r5, #7	; 0x7
  101a94:	e58c9000 	str	r9, [ip]
  101a98:	e58c4004 	str	r4, [ip, #4]
  101a9c:	e58d6680 	str	r6, [sp, #1664]
  101aa0:	e58d567c 	str	r5, [sp, #1660]
  101aa4:	da000006 	ble	101ac4 <prog+0x1a80>
  101aa8:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101aac:	e1a0000a 	mov	r0, sl
  101ab0:	e2811008 	add	r1, r1, #8	; 0x8
  101ab4:	ebfffd34 	bl	100f8c <__sprint>
  101ab8:	e3500000 	cmp	r0, #0	; 0x0
  101abc:	1afffe30 	bne	101384 <prog+0x1340>
  101ac0:	e59d6680 	ldr	r6, [sp, #1664]
  101ac4:	e28d4020 	add	r4, sp, #32	; 0x20
  101ac8:	e8940030 	ldmia	r4, {r4, r5}
  101acc:	e59d803c 	ldr	r8, [sp, #60]
  101ad0:	e1550008 	cmp	r5, r8
  101ad4:	a0844005 	addge	r4, r4, r5
  101ad8:	b0844008 	addlt	r4, r4, r8
  101adc:	e3560000 	cmp	r6, #0	; 0x0
  101ae0:	e58d4020 	str	r4, [sp, #32]
  101ae4:	1afffe20 	bne	10136c <prog+0x1328>
  101ae8:	e59dc044 	ldr	ip, [sp, #68]
  101aec:	e3a05000 	mov	r5, #0	; 0x0
  101af0:	e35c0000 	cmp	ip, #0	; 0x0
  101af4:	e58d567c 	str	r5, [sp, #1660]
  101af8:	028d8e61 	addeq	r8, sp, #1552	; 0x610
  101afc:	0a000004 	beq	101b14 <prog+0x1ad0>
  101b00:	e1a0100c 	mov	r1, ip
  101b04:	e59d0010 	ldr	r0, [sp, #16]
  101b08:	eb000d6f 	bl	1050cc <_free_r>
  101b0c:	e58d5044 	str	r5, [sp, #68]
  101b10:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101b14:	e59d9050 	ldr	r9, [sp, #80]
  101b18:	eafffd80 	b	101120 <_vfprintf_r+0x154>
  101b1c:	e59f18dc 	ldr	r1, [pc, #2268]	; 102400 <prog+0x23bc>
  101b20:	e58d1040 	str	r1, [sp, #64]
  101b24:	eafffee9 	b	1016d0 <prog+0x168c>
  101b28:	e59dc054 	ldr	ip, [sp, #84]
  101b2c:	e5991000 	ldr	r1, [r9]
  101b30:	e59f58c8 	ldr	r5, [pc, #2248]	; 102400 <prog+0x23bc>
  101b34:	e38cc002 	orr	ip, ip, #2	; 0x2
  101b38:	e2899004 	add	r9, r9, #4	; 0x4
  101b3c:	e3a07078 	mov	r7, #120	; 0x78
  101b40:	e3a02002 	mov	r2, #2	; 0x2
  101b44:	e58d5040 	str	r5, [sp, #64]
  101b48:	e58dc054 	str	ip, [sp, #84]
  101b4c:	e58d9050 	str	r9, [sp, #80]
  101b50:	eafffe47 	b	101474 <prog+0x1430>
  101b54:	e59d5018 	ldr	r5, [sp, #24]
  101b58:	e59dc054 	ldr	ip, [sp, #84]
  101b5c:	e5d53000 	ldrb	r3, [r5]
  101b60:	e38cc010 	orr	ip, ip, #16	; 0x10
  101b64:	e58dc054 	str	ip, [sp, #84]
  101b68:	eafffd95 	b	1011c4 <_vfprintf_r+0x1f8>
  101b6c:	e3a04000 	mov	r4, #0	; 0x0
  101b70:	e5cd46af 	strb	r4, [sp, #1711]
  101b74:	e5991000 	ldr	r1, [r9]
  101b78:	e2899004 	add	r9, r9, #4	; 0x4
  101b7c:	e1510004 	cmp	r1, r4
  101b80:	e58d101c 	str	r1, [sp, #28]
  101b84:	e58d9050 	str	r9, [sp, #80]
  101b88:	0a000330 	beq	102850 <prog+0x280c>
  101b8c:	e3570053 	cmp	r7, #83	; 0x53
  101b90:	0a000002 	beq	101ba0 <prog+0x1b5c>
  101b94:	e59d2054 	ldr	r2, [sp, #84]
  101b98:	e2125010 	ands	r5, r2, #16	; 0x10
  101b9c:	0a000269 	beq	102548 <prog+0x2504>
  101ba0:	e28d9d1a 	add	r9, sp, #1664	; 0x680
  101ba4:	e59d301c 	ldr	r3, [sp, #28]
  101ba8:	e2899004 	add	r9, r9, #4	; 0x4
  101bac:	e1a00009 	mov	r0, r9
  101bb0:	e1a01004 	mov	r1, r4
  101bb4:	e3a02008 	mov	r2, #8	; 0x8
  101bb8:	e58d36a4 	str	r3, [sp, #1700]
  101bbc:	ebfffc2a 	bl	100c6c <memset>
  101bc0:	e3560000 	cmp	r6, #0	; 0x0
  101bc4:	ba000443 	blt	102cd8 <prog+0x2c94>
  101bc8:	e28d5e45 	add	r5, sp, #1104	; 0x450
  101bcc:	e1a0b004 	mov	fp, r4
  101bd0:	e2855008 	add	r5, r5, #8	; 0x8
  101bd4:	e59d36a4 	ldr	r3, [sp, #1700]
  101bd8:	e793c004 	ldr	ip, [r3, r4]
  101bdc:	e35c0000 	cmp	ip, #0	; 0x0
  101be0:	e1a0200c 	mov	r2, ip
  101be4:	e59d0010 	ldr	r0, [sp, #16]
  101be8:	e1a01005 	mov	r1, r5
  101bec:	e1a03009 	mov	r3, r9
  101bf0:	0a000009 	beq	101c1c <prog+0x1bd8>
  101bf4:	eb0004c6 	bl	102f14 <_wcrtomb_r>
  101bf8:	e3700001 	cmn	r0, #1	; 0x1
  101bfc:	e08b3000 	add	r3, fp, r0
  101c00:	0a000440 	beq	102d08 <prog+0x2cc4>
  101c04:	e1560003 	cmp	r6, r3
  101c08:	ba000003 	blt	101c1c <prog+0x1bd8>
  101c0c:	e1a0b003 	mov	fp, r3
  101c10:	e2844004 	add	r4, r4, #4	; 0x4
  101c14:	1affffee 	bne	101bd4 <prog+0x1b90>
  101c18:	e1a0b006 	mov	fp, r6
  101c1c:	e35b0000 	cmp	fp, #0	; 0x0
  101c20:	058db038 	streq	fp, [sp, #56]
  101c24:	058db03c 	streq	fp, [sp, #60]
  101c28:	0afffe34 	beq	101500 <prog+0x14bc>
  101c2c:	e59d0010 	ldr	r0, [sp, #16]
  101c30:	e28b1001 	add	r1, fp, #1	; 0x1
  101c34:	ebfffa08 	bl	10045c <_malloc_r>
  101c38:	e3500000 	cmp	r0, #0	; 0x0
  101c3c:	0a000431 	beq	102d08 <prog+0x2cc4>
  101c40:	e58d0044 	str	r0, [sp, #68]
  101c44:	e3a01000 	mov	r1, #0	; 0x0
  101c48:	e3a02008 	mov	r2, #8	; 0x8
  101c4c:	e1a00009 	mov	r0, r9
  101c50:	ebfffc05 	bl	100c6c <memset>
  101c54:	e28d2e6a 	add	r2, sp, #1696	; 0x6a0
  101c58:	e59d0010 	ldr	r0, [sp, #16]
  101c5c:	e59d1044 	ldr	r1, [sp, #68]
  101c60:	e2822004 	add	r2, r2, #4	; 0x4
  101c64:	e1a0300b 	mov	r3, fp
  101c68:	e58d9000 	str	r9, [sp]
  101c6c:	eb0004c8 	bl	102f94 <_wcsrtombs_r>
  101c70:	e15b0000 	cmp	fp, r0
  101c74:	1a000492 	bne	102ec4 <prog+0x2e80>
  101c78:	e3a03000 	mov	r3, #0	; 0x0
  101c7c:	e59dc044 	ldr	ip, [sp, #68]
  101c80:	e15b0003 	cmp	fp, r3
  101c84:	a1a0500b 	movge	r5, fp
  101c88:	b1a05003 	movlt	r5, r3
  101c8c:	e58d503c 	str	r5, [sp, #60]
  101c90:	e58d3038 	str	r3, [sp, #56]
  101c94:	e58dc01c 	str	ip, [sp, #28]
  101c98:	e7cc300b 	strb	r3, [ip, fp]
  101c9c:	eafffe17 	b	101500 <prog+0x14bc>
  101ca0:	e59d1018 	ldr	r1, [sp, #24]
  101ca4:	e5d13000 	ldrb	r3, [r1]
  101ca8:	e353006c 	cmp	r3, #108	; 0x6c
  101cac:	059d2054 	ldreq	r2, [sp, #84]
  101cb0:	159d4054 	ldrne	r4, [sp, #84]
  101cb4:	05f13001 	ldreqb	r3, [r1, #1]!
  101cb8:	03822010 	orreq	r2, r2, #16	; 0x10
  101cbc:	13844010 	orrne	r4, r4, #16	; 0x10
  101cc0:	058d1018 	streq	r1, [sp, #24]
  101cc4:	058d2054 	streq	r2, [sp, #84]
  101cc8:	158d4054 	strne	r4, [sp, #84]
  101ccc:	eafffd3c 	b	1011c4 <_vfprintf_r+0x1f8>
  101cd0:	e59d3054 	ldr	r3, [sp, #84]
  101cd4:	e3130010 	tst	r3, #16	; 0x10
  101cd8:	1a0001df 	bne	10245c <prog+0x2418>
  101cdc:	e59d5054 	ldr	r5, [sp, #84]
  101ce0:	e3150040 	tst	r5, #64	; 0x40
  101ce4:	15993000 	ldrne	r3, [r9]
  101ce8:	05993000 	ldreq	r3, [r9]
  101cec:	12899004 	addne	r9, r9, #4	; 0x4
  101cf0:	02899004 	addeq	r9, r9, #4	; 0x4
  101cf4:	158d9050 	strne	r9, [sp, #80]
  101cf8:	058d9050 	streq	r9, [sp, #80]
  101cfc:	159dc020 	ldrne	ip, [sp, #32]
  101d00:	059d1020 	ldreq	r1, [sp, #32]
  101d04:	e59d9050 	ldr	r9, [sp, #80]
  101d08:	11c3c0b0 	strneh	ip, [r3]
  101d0c:	05831000 	streq	r1, [r3]
  101d10:	eafffd02 	b	101120 <_vfprintf_r+0x154>
  101d14:	e59d2018 	ldr	r2, [sp, #24]
  101d18:	e59d4054 	ldr	r4, [sp, #84]
  101d1c:	e5d23000 	ldrb	r3, [r2]
  101d20:	e3844008 	orr	r4, r4, #8	; 0x8
  101d24:	e58d4054 	str	r4, [sp, #84]
  101d28:	eafffd25 	b	1011c4 <_vfprintf_r+0x1f8>
  101d2c:	e59d5018 	ldr	r5, [sp, #24]
  101d30:	e59dc054 	ldr	ip, [sp, #84]
  101d34:	e5d53000 	ldrb	r3, [r5]
  101d38:	e38cc080 	orr	ip, ip, #128	; 0x80
  101d3c:	e58dc054 	str	ip, [sp, #84]
  101d40:	eafffd1f 	b	1011c4 <_vfprintf_r+0x1f8>
  101d44:	e3a03000 	mov	r3, #0	; 0x0
  101d48:	e59d1018 	ldr	r1, [sp, #24]
  101d4c:	e0832103 	add	r2, r3, r3, lsl #2
  101d50:	e0872082 	add	r2, r7, r2, lsl #1
  101d54:	e4d17001 	ldrb	r7, [r1], #1
  101d58:	e2473030 	sub	r3, r7, #48	; 0x30
  101d5c:	e3530009 	cmp	r3, #9	; 0x9
  101d60:	e58d1018 	str	r1, [sp, #24]
  101d64:	e2423030 	sub	r3, r2, #48	; 0x30
  101d68:	9afffff6 	bls	101d48 <prog+0x1d04>
  101d6c:	e58d3024 	str	r3, [sp, #36]
  101d70:	eafffd17 	b	1011d4 <_vfprintf_r+0x208>
  101d74:	e59d2018 	ldr	r2, [sp, #24]
  101d78:	e4d23001 	ldrb	r3, [r2], #1
  101d7c:	e353002a 	cmp	r3, #42	; 0x2a
  101d80:	0a000439 	beq	102e6c <prog+0x2e28>
  101d84:	e1a07003 	mov	r7, r3
  101d88:	e2433030 	sub	r3, r3, #48	; 0x30
  101d8c:	e3530009 	cmp	r3, #9	; 0x9
  101d90:	83a06000 	movhi	r6, #0	; 0x0
  101d94:	8a00000d 	bhi	101dd0 <prog+0x1d8c>
  101d98:	e59d1018 	ldr	r1, [sp, #24]
  101d9c:	e3a02000 	mov	r2, #0	; 0x0
  101da0:	e0822102 	add	r2, r2, r2, lsl #2
  101da4:	e0872082 	add	r2, r7, r2, lsl #1
  101da8:	e5f17001 	ldrb	r7, [r1, #1]!
  101dac:	e2473030 	sub	r3, r7, #48	; 0x30
  101db0:	e3530009 	cmp	r3, #9	; 0x9
  101db4:	e2422030 	sub	r2, r2, #48	; 0x30
  101db8:	9afffff8 	bls	101da0 <prog+0x1d5c>
  101dbc:	e3e03000 	mvn	r3, #0	; 0x0
  101dc0:	e1520003 	cmp	r2, r3
  101dc4:	a1a06002 	movge	r6, r2
  101dc8:	b1a06003 	movlt	r6, r3
  101dcc:	e2812001 	add	r2, r1, #1	; 0x1
  101dd0:	e58d2018 	str	r2, [sp, #24]
  101dd4:	eafffcfe 	b	1011d4 <_vfprintf_r+0x208>
  101dd8:	e59d1054 	ldr	r1, [sp, #84]
  101ddc:	e3110002 	tst	r1, #2	; 0x2
  101de0:	0afffec0 	beq	1018e8 <prog+0x18a4>
  101de4:	e3a03030 	mov	r3, #48	; 0x30
  101de8:	e5cd36ad 	strb	r3, [sp, #1709]
  101dec:	e2855001 	add	r5, r5, #1	; 0x1
  101df0:	e28d3e6a 	add	r3, sp, #1696	; 0x6a0
  101df4:	e2866002 	add	r6, r6, #2	; 0x2
  101df8:	e283300d 	add	r3, r3, #13	; 0xd
  101dfc:	e3a02002 	mov	r2, #2	; 0x2
  101e00:	e3550007 	cmp	r5, #7	; 0x7
  101e04:	e5cd76ae 	strb	r7, [sp, #1710]
  101e08:	e58d6680 	str	r6, [sp, #1664]
  101e0c:	e5883000 	str	r3, [r8]
  101e10:	e5882004 	str	r2, [r8, #4]
  101e14:	e58d567c 	str	r5, [sp, #1660]
  101e18:	dafffeb1 	ble	1018e4 <prog+0x18a0>
  101e1c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101e20:	e1a0000a 	mov	r0, sl
  101e24:	e2811008 	add	r1, r1, #8	; 0x8
  101e28:	ebfffc57 	bl	100f8c <__sprint>
  101e2c:	e3500000 	cmp	r0, #0	; 0x0
  101e30:	1afffd53 	bne	101384 <prog+0x1340>
  101e34:	e59d2014 	ldr	r2, [sp, #20]
  101e38:	e3520080 	cmp	r2, #128	; 0x80
  101e3c:	e59d6680 	ldr	r6, [sp, #1664]
  101e40:	e59d567c 	ldr	r5, [sp, #1660]
  101e44:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101e48:	1afffea9 	bne	1018f4 <prog+0x18b0>
  101e4c:	e59d3024 	ldr	r3, [sp, #36]
  101e50:	e59dc03c 	ldr	ip, [sp, #60]
  101e54:	e06c4003 	rsb	r4, ip, r3
  101e58:	e3540000 	cmp	r4, #0	; 0x0
  101e5c:	dafffea4 	ble	1018f4 <prog+0x18b0>
  101e60:	e3540010 	cmp	r4, #16	; 0x10
  101e64:	da00032e 	ble	102b24 <prog+0x2ae0>
  101e68:	e59f95b0 	ldr	r9, [pc, #1456]	; 102420 <prog+0x23dc>
  101e6c:	ea000002 	b	101e7c <prog+0x1e38>
  101e70:	e2444010 	sub	r4, r4, #16	; 0x10
  101e74:	e3540010 	cmp	r4, #16	; 0x10
  101e78:	da000015 	ble	101ed4 <prog+0x1e90>
  101e7c:	e2855001 	add	r5, r5, #1	; 0x1
  101e80:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101e84:	e2866010 	add	r6, r6, #16	; 0x10
  101e88:	e3a03010 	mov	r3, #16	; 0x10
  101e8c:	e3550007 	cmp	r5, #7	; 0x7
  101e90:	e5883004 	str	r3, [r8, #4]
  101e94:	e5889000 	str	r9, [r8]
  101e98:	e1a0000a 	mov	r0, sl
  101e9c:	e2811008 	add	r1, r1, #8	; 0x8
  101ea0:	e2888008 	add	r8, r8, #8	; 0x8
  101ea4:	e58d6680 	str	r6, [sp, #1664]
  101ea8:	e58d567c 	str	r5, [sp, #1660]
  101eac:	daffffef 	ble	101e70 <prog+0x1e2c>
  101eb0:	ebfffc35 	bl	100f8c <__sprint>
  101eb4:	e3500000 	cmp	r0, #0	; 0x0
  101eb8:	1afffd31 	bne	101384 <prog+0x1340>
  101ebc:	e2444010 	sub	r4, r4, #16	; 0x10
  101ec0:	e3540010 	cmp	r4, #16	; 0x10
  101ec4:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101ec8:	e59d6680 	ldr	r6, [sp, #1664]
  101ecc:	e59d567c 	ldr	r5, [sp, #1660]
  101ed0:	caffffe9 	bgt	101e7c <prog+0x1e38>
  101ed4:	e2855001 	add	r5, r5, #1	; 0x1
  101ed8:	e0866004 	add	r6, r6, r4
  101edc:	e3550007 	cmp	r5, #7	; 0x7
  101ee0:	e5889000 	str	r9, [r8]
  101ee4:	e5884004 	str	r4, [r8, #4]
  101ee8:	e58d6680 	str	r6, [sp, #1664]
  101eec:	e58d567c 	str	r5, [sp, #1660]
  101ef0:	d2888008 	addle	r8, r8, #8	; 0x8
  101ef4:	dafffe7e 	ble	1018f4 <prog+0x18b0>
  101ef8:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101efc:	e1a0000a 	mov	r0, sl
  101f00:	e2811008 	add	r1, r1, #8	; 0x8
  101f04:	ebfffc20 	bl	100f8c <__sprint>
  101f08:	e3500000 	cmp	r0, #0	; 0x0
  101f0c:	1afffd1c 	bne	101384 <prog+0x1340>
  101f10:	e59d6680 	ldr	r6, [sp, #1664]
  101f14:	e59d567c 	ldr	r5, [sp, #1660]
  101f18:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101f1c:	eafffe74 	b	1018f4 <prog+0x18b0>
  101f20:	e2013007 	and	r3, r1, #7	; 0x7
  101f24:	e2833030 	add	r3, r3, #48	; 0x30
  101f28:	e1b011a1 	movs	r1, r1, lsr #3
  101f2c:	e5603001 	strb	r3, [r0, #-1]!
  101f30:	1afffffa 	bne	101f20 <prog+0x1edc>
  101f34:	e59d5054 	ldr	r5, [sp, #84]
  101f38:	e3150001 	tst	r5, #1	; 0x1
  101f3c:	e58d001c 	str	r0, [sp, #28]
  101f40:	0afffd64 	beq	1014d8 <prog+0x1494>
  101f44:	e3530030 	cmp	r3, #48	; 0x30
  101f48:	11a0c000 	movne	ip, r0
  101f4c:	13a03030 	movne	r3, #48	; 0x30
  101f50:	156c3001 	strneb	r3, [ip, #-1]!
  101f54:	158dc01c 	strne	ip, [sp, #28]
  101f58:	eafffd5e 	b	1014d8 <prog+0x1494>
  101f5c:	e3570065 	cmp	r7, #101	; 0x65
  101f60:	da000072 	ble	102130 <prog+0x20ec>
  101f64:	e28d0048 	add	r0, sp, #72	; 0x48
  101f68:	e8900003 	ldmia	r0, {r0, r1}
  101f6c:	e3a02000 	mov	r2, #0	; 0x0
  101f70:	e3a03000 	mov	r3, #0	; 0x0
  101f74:	eb001908 	bl	10839c <__eqdf2>
  101f78:	e3500000 	cmp	r0, #0	; 0x0
  101f7c:	1a00003a 	bne	10206c <prog+0x2028>
  101f80:	e2855001 	add	r5, r5, #1	; 0x1
  101f84:	e59f3488 	ldr	r3, [pc, #1160]	; 102414 <prog+0x23d0>
  101f88:	e3550007 	cmp	r5, #7	; 0x7
  101f8c:	e2866001 	add	r6, r6, #1	; 0x1
  101f90:	e3a02001 	mov	r2, #1	; 0x1
  101f94:	e5883000 	str	r3, [r8]
  101f98:	e5882004 	str	r2, [r8, #4]
  101f9c:	e58d6680 	str	r6, [sp, #1664]
  101fa0:	e58d567c 	str	r5, [sp, #1660]
  101fa4:	d288c008 	addle	ip, r8, #8	; 0x8
  101fa8:	ca0001c9 	bgt	1026d4 <prog+0x2690>
  101fac:	e59d36a8 	ldr	r3, [sp, #1704]
  101fb0:	e59d4034 	ldr	r4, [sp, #52]
  101fb4:	e1530004 	cmp	r3, r4
  101fb8:	aa0000f7 	bge	10239c <prog+0x2358>
  101fbc:	e59d567c 	ldr	r5, [sp, #1660]
  101fc0:	e59d8028 	ldr	r8, [sp, #40]
  101fc4:	e2855001 	add	r5, r5, #1	; 0x1
  101fc8:	e3550007 	cmp	r5, #7	; 0x7
  101fcc:	e2866001 	add	r6, r6, #1	; 0x1
  101fd0:	e3a03001 	mov	r3, #1	; 0x1
  101fd4:	e58c3004 	str	r3, [ip, #4]
  101fd8:	e58c8000 	str	r8, [ip]
  101fdc:	e58d6680 	str	r6, [sp, #1664]
  101fe0:	e58d567c 	str	r5, [sp, #1660]
  101fe4:	d28cc008 	addle	ip, ip, #8	; 0x8
  101fe8:	ca0001d1 	bgt	102734 <prog+0x26f0>
  101fec:	e59d1034 	ldr	r1, [sp, #52]
  101ff0:	e2414001 	sub	r4, r1, #1	; 0x1
  101ff4:	e3540000 	cmp	r4, #0	; 0x0
  101ff8:	dafffe7c 	ble	1019f0 <prog+0x19ac>
  101ffc:	e3540010 	cmp	r4, #16	; 0x10
  102000:	da00018f 	ble	102644 <prog+0x2600>
  102004:	e59d567c 	ldr	r5, [sp, #1660]
  102008:	e59f9410 	ldr	r9, [pc, #1040]	; 102420 <prog+0x23dc>
  10200c:	ea000002 	b	10201c <prog+0x1fd8>
  102010:	e2444010 	sub	r4, r4, #16	; 0x10
  102014:	e3540010 	cmp	r4, #16	; 0x10
  102018:	da00018b 	ble	10264c <prog+0x2608>
  10201c:	e2855001 	add	r5, r5, #1	; 0x1
  102020:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102024:	e2866010 	add	r6, r6, #16	; 0x10
  102028:	e3a03010 	mov	r3, #16	; 0x10
  10202c:	e3550007 	cmp	r5, #7	; 0x7
  102030:	e58c3004 	str	r3, [ip, #4]
  102034:	e58c9000 	str	r9, [ip]
  102038:	e1a0000a 	mov	r0, sl
  10203c:	e2811008 	add	r1, r1, #8	; 0x8
  102040:	e28cc008 	add	ip, ip, #8	; 0x8
  102044:	e58d6680 	str	r6, [sp, #1664]
  102048:	e58d567c 	str	r5, [sp, #1660]
  10204c:	daffffef 	ble	102010 <prog+0x1fcc>
  102050:	ebfffbcd 	bl	100f8c <__sprint>
  102054:	e3500000 	cmp	r0, #0	; 0x0
  102058:	1afffcc9 	bne	101384 <prog+0x1340>
  10205c:	e59d6680 	ldr	r6, [sp, #1664]
  102060:	e59d567c 	ldr	r5, [sp, #1660]
  102064:	e28dce61 	add	ip, sp, #1552	; 0x610
  102068:	eaffffe8 	b	102010 <prog+0x1fcc>
  10206c:	e59d06a8 	ldr	r0, [sp, #1704]
  102070:	e3500000 	cmp	r0, #0	; 0x0
  102074:	da0001bb 	ble	102768 <prog+0x2724>
  102078:	e59dc034 	ldr	ip, [sp, #52]
  10207c:	e150000c 	cmp	r0, ip
  102080:	aa0000fc 	bge	102478 <prog+0x2434>
  102084:	e2855001 	add	r5, r5, #1	; 0x1
  102088:	e59d401c 	ldr	r4, [sp, #28]
  10208c:	e0866000 	add	r6, r6, r0
  102090:	e3550007 	cmp	r5, #7	; 0x7
  102094:	e5884000 	str	r4, [r8]
  102098:	e5880004 	str	r0, [r8, #4]
  10209c:	e58d6680 	str	r6, [sp, #1664]
  1020a0:	e58d567c 	str	r5, [sp, #1660]
  1020a4:	d2881008 	addle	r1, r8, #8	; 0x8
  1020a8:	ca000288 	bgt	102ad0 <prog+0x2a8c>
  1020ac:	e2855001 	add	r5, r5, #1	; 0x1
  1020b0:	e59f3350 	ldr	r3, [pc, #848]	; 102408 <prog+0x23c4>
  1020b4:	e2866001 	add	r6, r6, #1	; 0x1
  1020b8:	e3550007 	cmp	r5, #7	; 0x7
  1020bc:	e3a02001 	mov	r2, #1	; 0x1
  1020c0:	e5813000 	str	r3, [r1]
  1020c4:	e5812004 	str	r2, [r1, #4]
  1020c8:	e58d6680 	str	r6, [sp, #1664]
  1020cc:	e58d567c 	str	r5, [sp, #1660]
  1020d0:	e1a04000 	mov	r4, r0
  1020d4:	d281c008 	addle	ip, r1, #8	; 0x8
  1020d8:	ca000271 	bgt	102aa4 <prog+0x2a60>
  1020dc:	e59d8034 	ldr	r8, [sp, #52]
  1020e0:	e59d101c 	ldr	r1, [sp, #28]
  1020e4:	e0602008 	rsb	r2, r0, r8
  1020e8:	e2855001 	add	r5, r5, #1	; 0x1
  1020ec:	e0843001 	add	r3, r4, r1
  1020f0:	e0866002 	add	r6, r6, r2
  1020f4:	e3550007 	cmp	r5, #7	; 0x7
  1020f8:	e58c3000 	str	r3, [ip]
  1020fc:	e58c2004 	str	r2, [ip, #4]
  102100:	e58d6680 	str	r6, [sp, #1664]
  102104:	e58d567c 	str	r5, [sp, #1660]
  102108:	da000141 	ble	102614 <prog+0x25d0>
  10210c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102110:	e1a0000a 	mov	r0, sl
  102114:	e2811008 	add	r1, r1, #8	; 0x8
  102118:	ebfffb9b 	bl	100f8c <__sprint>
  10211c:	e3500000 	cmp	r0, #0	; 0x0
  102120:	1afffc97 	bne	101384 <prog+0x1340>
  102124:	e59d6680 	ldr	r6, [sp, #1664]
  102128:	e28dce61 	add	ip, sp, #1552	; 0x610
  10212c:	eafffe2f 	b	1019f0 <prog+0x19ac>
  102130:	e59d2034 	ldr	r2, [sp, #52]
  102134:	e3520001 	cmp	r2, #1	; 0x1
  102138:	da00014d 	ble	102674 <prog+0x2630>
  10213c:	e59d401c 	ldr	r4, [sp, #28]
  102140:	e5d42000 	ldrb	r2, [r4]
  102144:	e2855001 	add	r5, r5, #1	; 0x1
  102148:	e5cd26ad 	strb	r2, [sp, #1709]
  10214c:	e3a0302e 	mov	r3, #46	; 0x2e
  102150:	e28d2e6a 	add	r2, sp, #1696	; 0x6a0
  102154:	e5cd36ae 	strb	r3, [sp, #1710]
  102158:	e2866002 	add	r6, r6, #2	; 0x2
  10215c:	e3550007 	cmp	r5, #7	; 0x7
  102160:	e282200d 	add	r2, r2, #13	; 0xd
  102164:	e243302c 	sub	r3, r3, #44	; 0x2c
  102168:	e888000c 	stmia	r8, {r2, r3}
  10216c:	e58d6680 	str	r6, [sp, #1664]
  102170:	e58d567c 	str	r5, [sp, #1660]
  102174:	d2884008 	addle	r4, r8, #8	; 0x8
  102178:	ca00007d 	bgt	102374 <prog+0x2330>
  10217c:	e28d0048 	add	r0, sp, #72	; 0x48
  102180:	e8900003 	ldmia	r0, {r0, r1}
  102184:	e3a02000 	mov	r2, #0	; 0x0
  102188:	e3a03000 	mov	r3, #0	; 0x0
  10218c:	eb0018a4 	bl	108424 <__nedf2>
  102190:	e3500000 	cmp	r0, #0	; 0x0
  102194:	0a000038 	beq	10227c <prog+0x2238>
  102198:	e59d8034 	ldr	r8, [sp, #52]
  10219c:	e59dc01c 	ldr	ip, [sp, #28]
  1021a0:	e2855001 	add	r5, r5, #1	; 0x1
  1021a4:	e0883006 	add	r3, r8, r6
  1021a8:	e2436001 	sub	r6, r3, #1	; 0x1
  1021ac:	e28c2001 	add	r2, ip, #1	; 0x1
  1021b0:	e2483001 	sub	r3, r8, #1	; 0x1
  1021b4:	e3550007 	cmp	r5, #7	; 0x7
  1021b8:	e884000c 	stmia	r4, {r2, r3}
  1021bc:	e58d6680 	str	r6, [sp, #1664]
  1021c0:	e58d567c 	str	r5, [sp, #1660]
  1021c4:	ca000060 	bgt	10234c <prog+0x2308>
  1021c8:	e2844008 	add	r4, r4, #8	; 0x8
  1021cc:	e59d3030 	ldr	r3, [sp, #48]
  1021d0:	e2855001 	add	r5, r5, #1	; 0x1
  1021d4:	e0866003 	add	r6, r6, r3
  1021d8:	e59d8030 	ldr	r8, [sp, #48]
  1021dc:	e28d3e69 	add	r3, sp, #1680	; 0x690
  1021e0:	e3550007 	cmp	r5, #7	; 0x7
  1021e4:	e2833005 	add	r3, r3, #5	; 0x5
  1021e8:	e8840108 	stmia	r4, {r3, r8}
  1021ec:	e58d6680 	str	r6, [sp, #1664]
  1021f0:	e58d567c 	str	r5, [sp, #1660]
  1021f4:	d284c008 	addle	ip, r4, #8	; 0x8
  1021f8:	dafffdfc 	ble	1019f0 <prog+0x19ac>
  1021fc:	eaffffc2 	b	10210c <prog+0x20c8>
  102200:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102204:	e1a0000a 	mov	r0, sl
  102208:	e2811008 	add	r1, r1, #8	; 0x8
  10220c:	ebfffb5e 	bl	100f8c <__sprint>
  102210:	e3500000 	cmp	r0, #0	; 0x0
  102214:	1afffc60 	bne	10139c <prog+0x1358>
  102218:	e28d8e61 	add	r8, sp, #1552	; 0x610
  10221c:	eafffbd9 	b	101188 <_vfprintf_r+0x1bc>
  102220:	e3510009 	cmp	r1, #9	; 0x9
  102224:	928d4e5b 	addls	r4, sp, #1456	; 0x5b0
  102228:	92844003 	addls	r4, r4, #3	; 0x3
  10222c:	958d401c 	strls	r4, [sp, #28]
  102230:	9a00000d 	bls	10226c <prog+0x2228>
  102234:	e28d0e5b 	add	r0, sp, #1456	; 0x5b0
  102238:	e59fc1c4 	ldr	ip, [pc, #452]	; 102404 <prog+0x23c0>
  10223c:	e2800004 	add	r0, r0, #4	; 0x4
  102240:	e083219c 	umull	r2, r3, ip, r1
  102244:	e1a031a3 	mov	r3, r3, lsr #3
  102248:	e0832103 	add	r2, r3, r3, lsl #2
  10224c:	e0412082 	sub	r2, r1, r2, lsl #1
  102250:	e2822030 	add	r2, r2, #48	; 0x30
  102254:	e3530009 	cmp	r3, #9	; 0x9
  102258:	e1a01003 	mov	r1, r3
  10225c:	e5602001 	strb	r2, [r0, #-1]!
  102260:	8afffff6 	bhi	102240 <prog+0x21fc>
  102264:	e2400001 	sub	r0, r0, #1	; 0x1
  102268:	e58d001c 	str	r0, [sp, #28]
  10226c:	e59d401c 	ldr	r4, [sp, #28]
  102270:	e2813030 	add	r3, r1, #48	; 0x30
  102274:	e5c43000 	strb	r3, [r4]
  102278:	eafffc96 	b	1014d8 <prog+0x1494>
  10227c:	e59d1034 	ldr	r1, [sp, #52]
  102280:	e2417001 	sub	r7, r1, #1	; 0x1
  102284:	e3570000 	cmp	r7, #0	; 0x0
  102288:	daffffcf 	ble	1021cc <prog+0x2188>
  10228c:	e3570010 	cmp	r7, #16	; 0x10
  102290:	da000024 	ble	102328 <prog+0x22e4>
  102294:	e59f9184 	ldr	r9, [pc, #388]	; 102420 <prog+0x23dc>
  102298:	ea000002 	b	1022a8 <prog+0x2264>
  10229c:	e2477010 	sub	r7, r7, #16	; 0x10
  1022a0:	e3570010 	cmp	r7, #16	; 0x10
  1022a4:	da000020 	ble	10232c <prog+0x22e8>
  1022a8:	e2855001 	add	r5, r5, #1	; 0x1
  1022ac:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1022b0:	e2866010 	add	r6, r6, #16	; 0x10
  1022b4:	e3a03010 	mov	r3, #16	; 0x10
  1022b8:	e3550007 	cmp	r5, #7	; 0x7
  1022bc:	e5843004 	str	r3, [r4, #4]
  1022c0:	e5849000 	str	r9, [r4]
  1022c4:	e1a0000a 	mov	r0, sl
  1022c8:	e2811008 	add	r1, r1, #8	; 0x8
  1022cc:	e2844008 	add	r4, r4, #8	; 0x8
  1022d0:	e58d6680 	str	r6, [sp, #1664]
  1022d4:	e58d567c 	str	r5, [sp, #1660]
  1022d8:	daffffef 	ble	10229c <prog+0x2258>
  1022dc:	ebfffb2a 	bl	100f8c <__sprint>
  1022e0:	e3500000 	cmp	r0, #0	; 0x0
  1022e4:	1afffc26 	bne	101384 <prog+0x1340>
  1022e8:	e59d6680 	ldr	r6, [sp, #1664]
  1022ec:	e59d567c 	ldr	r5, [sp, #1660]
  1022f0:	e28d4e61 	add	r4, sp, #1552	; 0x610
  1022f4:	eaffffe8 	b	10229c <prog+0x2258>
  1022f8:	e59d4054 	ldr	r4, [sp, #84]
  1022fc:	e2143040 	ands	r3, r4, #64	; 0x40
  102300:	15993000 	ldrne	r3, [r9]
  102304:	05991000 	ldreq	r1, [r9]
  102308:	11a03803 	movne	r3, r3, lsl #16
  10230c:	12899004 	addne	r9, r9, #4	; 0x4
  102310:	02899004 	addeq	r9, r9, #4	; 0x4
  102314:	11a01823 	movne	r1, r3, lsr #16
  102318:	01a02003 	moveq	r2, r3
  10231c:	158d9050 	strne	r9, [sp, #80]
  102320:	058d9050 	streq	r9, [sp, #80]
  102324:	eafffc52 	b	101474 <prog+0x1430>
  102328:	e59f90f0 	ldr	r9, [pc, #240]	; 102420 <prog+0x23dc>
  10232c:	e2855001 	add	r5, r5, #1	; 0x1
  102330:	e0866007 	add	r6, r6, r7
  102334:	e3550007 	cmp	r5, #7	; 0x7
  102338:	e5849000 	str	r9, [r4]
  10233c:	e5847004 	str	r7, [r4, #4]
  102340:	e58d6680 	str	r6, [sp, #1664]
  102344:	e58d567c 	str	r5, [sp, #1660]
  102348:	daffff9e 	ble	1021c8 <prog+0x2184>
  10234c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102350:	e1a0000a 	mov	r0, sl
  102354:	e2811008 	add	r1, r1, #8	; 0x8
  102358:	ebfffb0b 	bl	100f8c <__sprint>
  10235c:	e3500000 	cmp	r0, #0	; 0x0
  102360:	1afffc07 	bne	101384 <prog+0x1340>
  102364:	e59d6680 	ldr	r6, [sp, #1664]
  102368:	e59d567c 	ldr	r5, [sp, #1660]
  10236c:	e28d4e61 	add	r4, sp, #1552	; 0x610
  102370:	eaffff95 	b	1021cc <prog+0x2188>
  102374:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102378:	e1a0000a 	mov	r0, sl
  10237c:	e2811008 	add	r1, r1, #8	; 0x8
  102380:	ebfffb01 	bl	100f8c <__sprint>
  102384:	e3500000 	cmp	r0, #0	; 0x0
  102388:	1afffbfd 	bne	101384 <prog+0x1340>
  10238c:	e59d6680 	ldr	r6, [sp, #1664]
  102390:	e59d567c 	ldr	r5, [sp, #1660]
  102394:	e28d4e61 	add	r4, sp, #1552	; 0x610
  102398:	eaffff77 	b	10217c <prog+0x2138>
  10239c:	e59d5054 	ldr	r5, [sp, #84]
  1023a0:	e3150001 	tst	r5, #1	; 0x1
  1023a4:	0afffd91 	beq	1019f0 <prog+0x19ac>
  1023a8:	eaffff03 	b	101fbc <prog+0x1f78>
  1023ac:	e899000c 	ldmia	r9, {r2, r3}
  1023b0:	e2899008 	add	r9, r9, #8	; 0x8
  1023b4:	e58d2048 	str	r2, [sp, #72]
  1023b8:	e58d304c 	str	r3, [sp, #76]
  1023bc:	e58d9050 	str	r9, [sp, #80]
  1023c0:	eafffd02 	b	1017d0 <prog+0x178c>
  1023c4:	e2833020 	add	r3, r3, #32	; 0x20
  1023c8:	e5cd36af 	strb	r3, [sp, #1711]
  1023cc:	e59d2018 	ldr	r2, [sp, #24]
  1023d0:	e5d23000 	ldrb	r3, [r2]
  1023d4:	eafffb7a 	b	1011c4 <_vfprintf_r+0x1f8>
  1023d8:	e5993000 	ldr	r3, [r9]
  1023dc:	e1a03803 	mov	r3, r3, lsl #16
  1023e0:	e2899004 	add	r9, r9, #4	; 0x4
  1023e4:	e1a01823 	mov	r1, r3, lsr #16
  1023e8:	e3a02001 	mov	r2, #1	; 0x1
  1023ec:	e58d9050 	str	r9, [sp, #80]
  1023f0:	eafffc1f 	b	101474 <prog+0x1430>
  1023f4:	0010cf2c 	andeqs	ip, r0, ip, lsr #30
  1023f8:	0010cf18 	andeqs	ip, r0, r8, lsl pc
  1023fc:	0010cf0c 	andeqs	ip, r0, ip, lsl #30
  102400:	0010cef8 	ldreqsh	ip, [r0], -r8
  102404:	cccccccd 	stcgtl	12, cr12, [ip], {205}
  102408:	0010cf50 	andeqs	ip, r0, r0, asr pc
  10240c:	0010cf48 	andeqs	ip, r0, r8, asr #30
  102410:	0010cf10 	andeqs	ip, r0, r0, lsl pc
  102414:	0010cf4c 	andeqs	ip, r0, ip, asr #30
  102418:	0010cf54 	andeqs	ip, r0, r4, asr pc
  10241c:	0010c820 	andeqs	ip, r0, r0, lsr #16
  102420:	0010c810 	andeqs	ip, r0, r0, lsl r8
  102424:	0010cf14 	andeqs	ip, r0, r4, lsl pc
  102428:	66666667 	strvsbt	r6, [r6], -r7, ror #12
  10242c:	e5993000 	ldr	r3, [r9]
  102430:	e1a03803 	mov	r3, r3, lsl #16
  102434:	e2899004 	add	r9, r9, #4	; 0x4
  102438:	e1a01843 	mov	r1, r3, asr #16
  10243c:	e58d9050 	str	r9, [sp, #80]
  102440:	eafffbe7 	b	1013e4 <prog+0x13a0>
  102444:	e5993000 	ldr	r3, [r9]
  102448:	e1a03803 	mov	r3, r3, lsl #16
  10244c:	e2899004 	add	r9, r9, #4	; 0x4
  102450:	e1a01823 	mov	r1, r3, lsr #16
  102454:	e58d9050 	str	r9, [sp, #80]
  102458:	eafffca5 	b	1016f4 <prog+0x16b0>
  10245c:	e5993000 	ldr	r3, [r9]
  102460:	e2899004 	add	r9, r9, #4	; 0x4
  102464:	e58d9050 	str	r9, [sp, #80]
  102468:	e59d4020 	ldr	r4, [sp, #32]
  10246c:	e59d9050 	ldr	r9, [sp, #80]
  102470:	e5834000 	str	r4, [r3]
  102474:	eafffb29 	b	101120 <_vfprintf_r+0x154>
  102478:	e2855001 	add	r5, r5, #1	; 0x1
  10247c:	e59d101c 	ldr	r1, [sp, #28]
  102480:	e086600c 	add	r6, r6, ip
  102484:	e3550007 	cmp	r5, #7	; 0x7
  102488:	e8881002 	stmia	r8, {r1, ip}
  10248c:	e58d6680 	str	r6, [sp, #1664]
  102490:	e58d567c 	str	r5, [sp, #1660]
  102494:	d288c008 	addle	ip, r8, #8	; 0x8
  102498:	ca000197 	bgt	102afc <prog+0x2ab8>
  10249c:	e59d2034 	ldr	r2, [sp, #52]
  1024a0:	e0624000 	rsb	r4, r2, r0
  1024a4:	e3540000 	cmp	r4, #0	; 0x0
  1024a8:	da00004b 	ble	1025dc <prog+0x2598>
  1024ac:	e3540010 	cmp	r4, #16	; 0x10
  1024b0:	da000036 	ble	102590 <prog+0x254c>
  1024b4:	e59d567c 	ldr	r5, [sp, #1660]
  1024b8:	e51f90a0 	ldr	r9, [pc, #-160]	; 102420 <prog+0x23dc>
  1024bc:	ea000002 	b	1024cc <prog+0x2488>
  1024c0:	e2444010 	sub	r4, r4, #16	; 0x10
  1024c4:	e3540010 	cmp	r4, #16	; 0x10
  1024c8:	da000032 	ble	102598 <prog+0x2554>
  1024cc:	e2855001 	add	r5, r5, #1	; 0x1
  1024d0:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1024d4:	e2866010 	add	r6, r6, #16	; 0x10
  1024d8:	e3a03010 	mov	r3, #16	; 0x10
  1024dc:	e3550007 	cmp	r5, #7	; 0x7
  1024e0:	e58c3004 	str	r3, [ip, #4]
  1024e4:	e58c9000 	str	r9, [ip]
  1024e8:	e1a0000a 	mov	r0, sl
  1024ec:	e2811008 	add	r1, r1, #8	; 0x8
  1024f0:	e28cc008 	add	ip, ip, #8	; 0x8
  1024f4:	e58d6680 	str	r6, [sp, #1664]
  1024f8:	e58d567c 	str	r5, [sp, #1660]
  1024fc:	daffffef 	ble	1024c0 <prog+0x247c>
  102500:	ebfffaa1 	bl	100f8c <__sprint>
  102504:	e3500000 	cmp	r0, #0	; 0x0
  102508:	1afffb9d 	bne	101384 <prog+0x1340>
  10250c:	e59d6680 	ldr	r6, [sp, #1664]
  102510:	e59d567c 	ldr	r5, [sp, #1660]
  102514:	e28dce61 	add	ip, sp, #1552	; 0x610
  102518:	eaffffe8 	b	1024c0 <prog+0x247c>
  10251c:	e5993000 	ldr	r3, [r9]
  102520:	e28d5e45 	add	r5, sp, #1104	; 0x450
  102524:	e2899004 	add	r9, r9, #4	; 0x4
  102528:	e3a0b001 	mov	fp, #1	; 0x1
  10252c:	e2855008 	add	r5, r5, #8	; 0x8
  102530:	e5cd3458 	strb	r3, [sp, #1112]
  102534:	e58d9050 	str	r9, [sp, #80]
  102538:	eafffc8e 	b	101778 <prog+0x1734>
  10253c:	e3560000 	cmp	r6, #0	; 0x0
  102540:	03a06001 	moveq	r6, #1	; 0x1
  102544:	eafffc99 	b	1017b0 <prog+0x176c>
  102548:	e3560000 	cmp	r6, #0	; 0x0
  10254c:	ba000187 	blt	102b70 <prog+0x2b2c>
  102550:	e59d001c 	ldr	r0, [sp, #28]
  102554:	e1a01005 	mov	r1, r5
  102558:	e1a02006 	mov	r2, r6
  10255c:	eb000d43 	bl	105a70 <memchr>
  102560:	e3500000 	cmp	r0, #0	; 0x0
  102564:	0a0001f6 	beq	102d44 <prog+0x2d00>
  102568:	e59d201c 	ldr	r2, [sp, #28]
  10256c:	e062b000 	rsb	fp, r2, r0
  102570:	e156000b 	cmp	r6, fp
  102574:	ba00016c 	blt	102b2c <prog+0x2ae8>
  102578:	e35b0000 	cmp	fp, #0	; 0x0
  10257c:	a1a0300b 	movge	r3, fp
  102580:	b3a03000 	movlt	r3, #0	; 0x0
  102584:	e58d303c 	str	r3, [sp, #60]
  102588:	e58d5038 	str	r5, [sp, #56]
  10258c:	eafffbdb 	b	101500 <prog+0x14bc>
  102590:	e59d567c 	ldr	r5, [sp, #1660]
  102594:	e51f917c 	ldr	r9, [pc, #-380]	; 102420 <prog+0x23dc>
  102598:	e2855001 	add	r5, r5, #1	; 0x1
  10259c:	e0866004 	add	r6, r6, r4
  1025a0:	e3550007 	cmp	r5, #7	; 0x7
  1025a4:	e58c9000 	str	r9, [ip]
  1025a8:	e58c4004 	str	r4, [ip, #4]
  1025ac:	e58d6680 	str	r6, [sp, #1664]
  1025b0:	e58d567c 	str	r5, [sp, #1660]
  1025b4:	d28cc008 	addle	ip, ip, #8	; 0x8
  1025b8:	da000007 	ble	1025dc <prog+0x2598>
  1025bc:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1025c0:	e1a0000a 	mov	r0, sl
  1025c4:	e2811008 	add	r1, r1, #8	; 0x8
  1025c8:	ebfffa6f 	bl	100f8c <__sprint>
  1025cc:	e3500000 	cmp	r0, #0	; 0x0
  1025d0:	1afffb6b 	bne	101384 <prog+0x1340>
  1025d4:	e59d6680 	ldr	r6, [sp, #1664]
  1025d8:	e28dce61 	add	ip, sp, #1552	; 0x610
  1025dc:	e59d3054 	ldr	r3, [sp, #84]
  1025e0:	e3130001 	tst	r3, #1	; 0x1
  1025e4:	0afffd01 	beq	1019f0 <prog+0x19ac>
  1025e8:	e59d567c 	ldr	r5, [sp, #1660]
  1025ec:	e51f31ec 	ldr	r3, [pc, #-492]	; 102408 <prog+0x23c4>
  1025f0:	e2855001 	add	r5, r5, #1	; 0x1
  1025f4:	e2866001 	add	r6, r6, #1	; 0x1
  1025f8:	e3a02001 	mov	r2, #1	; 0x1
  1025fc:	e3550007 	cmp	r5, #7	; 0x7
  102600:	e58c3000 	str	r3, [ip]
  102604:	e58c2004 	str	r2, [ip, #4]
  102608:	e58d6680 	str	r6, [sp, #1664]
  10260c:	e58d567c 	str	r5, [sp, #1660]
  102610:	cafffebd 	bgt	10210c <prog+0x20c8>
  102614:	e28cc008 	add	ip, ip, #8	; 0x8
  102618:	eafffcf4 	b	1019f0 <prog+0x19ac>
  10261c:	e28d0e5b 	add	r0, sp, #1456	; 0x5b0
  102620:	e2800004 	add	r0, r0, #4	; 0x4
  102624:	e59d5040 	ldr	r5, [sp, #64]
  102628:	e201300f 	and	r3, r1, #15	; 0xf
  10262c:	e7d52003 	ldrb	r2, [r5, r3]
  102630:	e1b01221 	movs	r1, r1, lsr #4
  102634:	e5602001 	strb	r2, [r0, #-1]!
  102638:	1afffff9 	bne	102624 <prog+0x25e0>
  10263c:	e58d001c 	str	r0, [sp, #28]
  102640:	eafffba4 	b	1014d8 <prog+0x1494>
  102644:	e59d567c 	ldr	r5, [sp, #1660]
  102648:	e51f9230 	ldr	r9, [pc, #-560]	; 102420 <prog+0x23dc>
  10264c:	e2855001 	add	r5, r5, #1	; 0x1
  102650:	e0866004 	add	r6, r6, r4
  102654:	e3550007 	cmp	r5, #7	; 0x7
  102658:	e58c9000 	str	r9, [ip]
  10265c:	e58c4004 	str	r4, [ip, #4]
  102660:	e58d6680 	str	r6, [sp, #1664]
  102664:	e58d567c 	str	r5, [sp, #1660]
  102668:	cafffea7 	bgt	10210c <prog+0x20c8>
  10266c:	e28cc008 	add	ip, ip, #8	; 0x8
  102670:	eafffcde 	b	1019f0 <prog+0x19ac>
  102674:	e59d3054 	ldr	r3, [sp, #84]
  102678:	e3130001 	tst	r3, #1	; 0x1
  10267c:	1afffeae 	bne	10213c <prog+0x20f8>
  102680:	e2855001 	add	r5, r5, #1	; 0x1
  102684:	e59d201c 	ldr	r2, [sp, #28]
  102688:	e2866001 	add	r6, r6, #1	; 0x1
  10268c:	e3550007 	cmp	r5, #7	; 0x7
  102690:	e3a03001 	mov	r3, #1	; 0x1
  102694:	e888000c 	stmia	r8, {r2, r3}
  102698:	e58d6680 	str	r6, [sp, #1664]
  10269c:	e58d567c 	str	r5, [sp, #1660]
  1026a0:	d2884008 	addle	r4, r8, #8	; 0x8
  1026a4:	dafffec8 	ble	1021cc <prog+0x2188>
  1026a8:	eaffff27 	b	10234c <prog+0x2308>
  1026ac:	e51f9294 	ldr	r9, [pc, #-660]	; 102420 <prog+0x23dc>
  1026b0:	eafffcb0 	b	101978 <prog+0x1934>
  1026b4:	e3a04003 	mov	r4, #3	; 0x3
  1026b8:	e51f52b4 	ldr	r5, [pc, #-692]	; 10240c <prog+0x23c8>
  1026bc:	e3a0c000 	mov	ip, #0	; 0x0
  1026c0:	e1a0b004 	mov	fp, r4
  1026c4:	e58d403c 	str	r4, [sp, #60]
  1026c8:	e58d501c 	str	r5, [sp, #28]
  1026cc:	e58dc038 	str	ip, [sp, #56]
  1026d0:	eafffb8a 	b	101500 <prog+0x14bc>
  1026d4:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1026d8:	e1a0000a 	mov	r0, sl
  1026dc:	e2811008 	add	r1, r1, #8	; 0x8
  1026e0:	ebfffa29 	bl	100f8c <__sprint>
  1026e4:	e3500000 	cmp	r0, #0	; 0x0
  1026e8:	1afffb25 	bne	101384 <prog+0x1340>
  1026ec:	e59d6680 	ldr	r6, [sp, #1664]
  1026f0:	e28dce61 	add	ip, sp, #1552	; 0x610
  1026f4:	eafffe2c 	b	101fac <prog+0x1f68>
  1026f8:	e28d0048 	add	r0, sp, #72	; 0x48
  1026fc:	e8900003 	ldmia	r0, {r0, r1}
  102700:	eb0011e3 	bl	106e94 <isnan>
  102704:	e3500000 	cmp	r0, #0	; 0x0
  102708:	0a000059 	beq	102874 <prog+0x2830>
  10270c:	e2473045 	sub	r3, r7, #69	; 0x45
  102710:	e3530002 	cmp	r3, #2	; 0x2
  102714:	8a00011e 	bhi	102b94 <prog+0x2b50>
  102718:	e3a0c003 	mov	ip, #3	; 0x3
  10271c:	e51f1314 	ldr	r1, [pc, #-788]	; 102410 <prog+0x23cc>
  102720:	e1a0b00c 	mov	fp, ip
  102724:	e58dc03c 	str	ip, [sp, #60]
  102728:	e58d101c 	str	r1, [sp, #28]
  10272c:	e58d4038 	str	r4, [sp, #56]
  102730:	eafffb72 	b	101500 <prog+0x14bc>
  102734:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102738:	e1a0000a 	mov	r0, sl
  10273c:	e2811008 	add	r1, r1, #8	; 0x8
  102740:	ebfffa11 	bl	100f8c <__sprint>
  102744:	e3500000 	cmp	r0, #0	; 0x0
  102748:	1afffb0d 	bne	101384 <prog+0x1340>
  10274c:	e59d6680 	ldr	r6, [sp, #1664]
  102750:	e28dce61 	add	ip, sp, #1552	; 0x610
  102754:	eafffe24 	b	101fec <prog+0x1fa8>
  102758:	e59d6680 	ldr	r6, [sp, #1664]
  10275c:	e59d567c 	ldr	r5, [sp, #1660]
  102760:	e51f934c 	ldr	r9, [pc, #-844]	; 10241c <prog+0x23d8>
  102764:	eafffb93 	b	1015b8 <prog+0x1574>
  102768:	e2855001 	add	r5, r5, #1	; 0x1
  10276c:	e51f3360 	ldr	r3, [pc, #-864]	; 102414 <prog+0x23d0>
  102770:	e3550007 	cmp	r5, #7	; 0x7
  102774:	e2866001 	add	r6, r6, #1	; 0x1
  102778:	e3a02001 	mov	r2, #1	; 0x1
  10277c:	e5883000 	str	r3, [r8]
  102780:	e5882004 	str	r2, [r8, #4]
  102784:	e58d6680 	str	r6, [sp, #1664]
  102788:	e58d567c 	str	r5, [sp, #1660]
  10278c:	d288c008 	addle	ip, r8, #8	; 0x8
  102790:	ca0000ec 	bgt	102b48 <prog+0x2b04>
  102794:	e3500000 	cmp	r0, #0	; 0x0
  102798:	1a000002 	bne	1027a8 <prog+0x2764>
  10279c:	e59d2034 	ldr	r2, [sp, #52]
  1027a0:	e3520000 	cmp	r2, #0	; 0x0
  1027a4:	0afffc91 	beq	1019f0 <prog+0x19ac>
  1027a8:	e59d567c 	ldr	r5, [sp, #1660]
  1027ac:	e3a03001 	mov	r3, #1	; 0x1
  1027b0:	e2855001 	add	r5, r5, #1	; 0x1
  1027b4:	e58c3004 	str	r3, [ip, #4]
  1027b8:	e59d3028 	ldr	r3, [sp, #40]
  1027bc:	e2866001 	add	r6, r6, #1	; 0x1
  1027c0:	e3550007 	cmp	r5, #7	; 0x7
  1027c4:	e58c3000 	str	r3, [ip]
  1027c8:	e58d6680 	str	r6, [sp, #1664]
  1027cc:	e58d567c 	str	r5, [sp, #1660]
  1027d0:	d28c2008 	addle	r2, ip, #8	; 0x8
  1027d4:	ca00014f 	bgt	102d18 <prog+0x2cd4>
  1027d8:	e2604000 	rsb	r4, r0, #0	; 0x0
  1027dc:	e3540000 	cmp	r4, #0	; 0x0
  1027e0:	da0000a3 	ble	102a74 <prog+0x2a30>
  1027e4:	e3540010 	cmp	r4, #16	; 0x10
  1027e8:	da00008e 	ble	102a28 <prog+0x29e4>
  1027ec:	e51f93d4 	ldr	r9, [pc, #-980]	; 102420 <prog+0x23dc>
  1027f0:	ea000002 	b	102800 <prog+0x27bc>
  1027f4:	e2444010 	sub	r4, r4, #16	; 0x10
  1027f8:	e3540010 	cmp	r4, #16	; 0x10
  1027fc:	da00008a 	ble	102a2c <prog+0x29e8>
  102800:	e2855001 	add	r5, r5, #1	; 0x1
  102804:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102808:	e2866010 	add	r6, r6, #16	; 0x10
  10280c:	e3a03010 	mov	r3, #16	; 0x10
  102810:	e3550007 	cmp	r5, #7	; 0x7
  102814:	e5823004 	str	r3, [r2, #4]
  102818:	e5829000 	str	r9, [r2]
  10281c:	e1a0000a 	mov	r0, sl
  102820:	e2811008 	add	r1, r1, #8	; 0x8
  102824:	e2822008 	add	r2, r2, #8	; 0x8
  102828:	e58d6680 	str	r6, [sp, #1664]
  10282c:	e58d567c 	str	r5, [sp, #1660]
  102830:	daffffef 	ble	1027f4 <prog+0x27b0>
  102834:	ebfff9d4 	bl	100f8c <__sprint>
  102838:	e3500000 	cmp	r0, #0	; 0x0
  10283c:	1afffad0 	bne	101384 <prog+0x1340>
  102840:	e59d6680 	ldr	r6, [sp, #1664]
  102844:	e59d567c 	ldr	r5, [sp, #1660]
  102848:	e28d2e61 	add	r2, sp, #1552	; 0x610
  10284c:	eaffffe8 	b	1027f4 <prog+0x27b0>
  102850:	e3a03006 	mov	r3, #6	; 0x6
  102854:	e51f4444 	ldr	r4, [pc, #-1092]	; 102418 <prog+0x23d4>
  102858:	e1a0b003 	mov	fp, r3
  10285c:	e58d303c 	str	r3, [sp, #60]
  102860:	e58d401c 	str	r4, [sp, #28]
  102864:	eafffc03 	b	101878 <prog+0x1834>
  102868:	e59d567c 	ldr	r5, [sp, #1660]
  10286c:	e51f9458 	ldr	r9, [pc, #-1112]	; 10241c <prog+0x23d8>
  102870:	eafffc84 	b	101a88 <prog+0x1a44>
  102874:	e59d4054 	ldr	r4, [sp, #84]
  102878:	e3570066 	cmp	r7, #102	; 0x66
  10287c:	e3844c01 	orr	r4, r4, #256	; 0x100
  102880:	e58d4054 	str	r4, [sp, #84]
  102884:	01a0b006 	moveq	fp, r6
  102888:	03a02003 	moveq	r2, #3	; 0x3
  10288c:	0a000005 	beq	1028a8 <prog+0x2864>
  102890:	e3570045 	cmp	r7, #69	; 0x45
  102894:	13570065 	cmpne	r7, #101	; 0x65
  102898:	11a0b006 	movne	fp, r6
  10289c:	13a02002 	movne	r2, #2	; 0x2
  1028a0:	0286b001 	addeq	fp, r6, #1	; 0x1
  1028a4:	03a02002 	moveq	r2, #2	; 0x2
  1028a8:	e28d3048 	add	r3, sp, #72	; 0x48
  1028ac:	e8930018 	ldmia	r3, {r3, r4}
  1028b0:	e3530000 	cmp	r3, #0	; 0x0
  1028b4:	a3a0c000 	movge	ip, #0	; 0x0
  1028b8:	b3a0c02d 	movlt	ip, #45	; 0x2d
  1028bc:	b59d1048 	ldrlt	r1, [sp, #72]
  1028c0:	b59d304c 	ldrlt	r3, [sp, #76]
  1028c4:	a58dc02c 	strge	ip, [sp, #44]
  1028c8:	b58dc02c 	strlt	ip, [sp, #44]
  1028cc:	e28dce6a 	add	ip, sp, #1696	; 0x6a0
  1028d0:	e28cc008 	add	ip, ip, #8	; 0x8
  1028d4:	a1a05004 	movge	r5, r4
  1028d8:	b1a05003 	movlt	r5, r3
  1028dc:	a1a04003 	movge	r4, r3
  1028e0:	b2814102 	addlt	r4, r1, #-2147483648	; 0x80000000
  1028e4:	e58dc004 	str	ip, [sp, #4]
  1028e8:	e28dce69 	add	ip, sp, #1680	; 0x690
  1028ec:	e1a03002 	mov	r3, r2
  1028f0:	e28dee6a 	add	lr, sp, #1696	; 0x6a0
  1028f4:	e28cc00c 	add	ip, ip, #12	; 0xc
  1028f8:	e59d0010 	ldr	r0, [sp, #16]
  1028fc:	e1a01004 	mov	r1, r4
  102900:	e1a02005 	mov	r2, r5
  102904:	e58de008 	str	lr, [sp, #8]
  102908:	e58dc00c 	str	ip, [sp, #12]
  10290c:	e58db000 	str	fp, [sp]
  102910:	eb0003c5 	bl	10382c <_dtoa_r>
  102914:	e3570067 	cmp	r7, #103	; 0x67
  102918:	13570047 	cmpne	r7, #71	; 0x47
  10291c:	e58d001c 	str	r0, [sp, #28]
  102920:	1a000003 	bne	102934 <prog+0x28f0>
  102924:	e59d1054 	ldr	r1, [sp, #84]
  102928:	e3110001 	tst	r1, #1	; 0x1
  10292c:	059d269c 	ldreq	r2, [sp, #1692]
  102930:	0a000019 	beq	10299c <prog+0x2958>
  102934:	e59d201c 	ldr	r2, [sp, #28]
  102938:	e3570066 	cmp	r7, #102	; 0x66
  10293c:	e082900b 	add	r9, r2, fp
  102940:	0a00012d 	beq	102dfc <prog+0x2db8>
  102944:	e3a02000 	mov	r2, #0	; 0x0
  102948:	e1a00004 	mov	r0, r4
  10294c:	e1a01005 	mov	r1, r5
  102950:	e3a03000 	mov	r3, #0	; 0x0
  102954:	eb001690 	bl	10839c <__eqdf2>
  102958:	e3500000 	cmp	r0, #0	; 0x0
  10295c:	01a02009 	moveq	r2, r9
  102960:	058d269c 	streq	r2, [sp, #1692]
  102964:	0a00000c 	beq	10299c <prog+0x2958>
  102968:	e59d269c 	ldr	r2, [sp, #1692]
  10296c:	e1590002 	cmp	r9, r2
  102970:	9a000009 	bls	10299c <prog+0x2958>
  102974:	e0623009 	rsb	r3, r2, r9
  102978:	e0833002 	add	r3, r3, r2
  10297c:	e2821001 	add	r1, r2, #1	; 0x1
  102980:	e3a00030 	mov	r0, #48	; 0x30
  102984:	e1510003 	cmp	r1, r3
  102988:	e5410001 	strb	r0, [r1, #-1]
  10298c:	e1a02001 	mov	r2, r1
  102990:	e58d169c 	str	r1, [sp, #1692]
  102994:	e2811001 	add	r1, r1, #1	; 0x1
  102998:	1afffff9 	bne	102984 <prog+0x2940>
  10299c:	e59d401c 	ldr	r4, [sp, #28]
  1029a0:	e3570067 	cmp	r7, #103	; 0x67
  1029a4:	13a03000 	movne	r3, #0	; 0x0
  1029a8:	03a03001 	moveq	r3, #1	; 0x1
  1029ac:	e3570067 	cmp	r7, #103	; 0x67
  1029b0:	13570047 	cmpne	r7, #71	; 0x47
  1029b4:	e0645002 	rsb	r5, r4, r2
  1029b8:	1a000082 	bne	102bc8 <prog+0x2b84>
  1029bc:	e59d06a8 	ldr	r0, [sp, #1704]
  1029c0:	e3700004 	cmn	r0, #4	; 0x4
  1029c4:	da0000bd 	ble	102cc0 <prog+0x2c7c>
  1029c8:	e1560000 	cmp	r6, r0
  1029cc:	a3a07067 	movge	r7, #103	; 0x67
  1029d0:	ba0000ba 	blt	102cc0 <prog+0x2c7c>
  1029d4:	e1550000 	cmp	r5, r0
  1029d8:	e1a0b000 	mov	fp, r0
  1029dc:	ca0000fd 	bgt	102dd8 <prog+0x2d94>
  1029e0:	e59d1054 	ldr	r1, [sp, #84]
  1029e4:	e3110001 	tst	r1, #1	; 0x1
  1029e8:	1280b001 	addne	fp, r0, #1	; 0x1
  1029ec:	1a0000f4 	bne	102dc4 <prog+0x2d80>
  1029f0:	e35b0000 	cmp	fp, #0	; 0x0
  1029f4:	a1a0200b 	movge	r2, fp
  1029f8:	b3a02000 	movlt	r2, #0	; 0x0
  1029fc:	e58d203c 	str	r2, [sp, #60]
  102a00:	e59dc02c 	ldr	ip, [sp, #44]
  102a04:	e35c0000 	cmp	ip, #0	; 0x0
  102a08:	1a000068 	bne	102bb0 <prog+0x2b6c>
  102a0c:	e35b0000 	cmp	fp, #0	; 0x0
  102a10:	a1a0100b 	movge	r1, fp
  102a14:	b3a01000 	movlt	r1, #0	; 0x0
  102a18:	e58d103c 	str	r1, [sp, #60]
  102a1c:	e58d5034 	str	r5, [sp, #52]
  102a20:	e58dc038 	str	ip, [sp, #56]
  102a24:	eafffab5 	b	101500 <prog+0x14bc>
  102a28:	e51f9610 	ldr	r9, [pc, #-1552]	; 102420 <prog+0x23dc>
  102a2c:	e2855001 	add	r5, r5, #1	; 0x1
  102a30:	e0866004 	add	r6, r6, r4
  102a34:	e3550007 	cmp	r5, #7	; 0x7
  102a38:	e5829000 	str	r9, [r2]
  102a3c:	e5824004 	str	r4, [r2, #4]
  102a40:	e58d6680 	str	r6, [sp, #1664]
  102a44:	e58d567c 	str	r5, [sp, #1660]
  102a48:	d2822008 	addle	r2, r2, #8	; 0x8
  102a4c:	da000008 	ble	102a74 <prog+0x2a30>
  102a50:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102a54:	e1a0000a 	mov	r0, sl
  102a58:	e2811008 	add	r1, r1, #8	; 0x8
  102a5c:	ebfff94a 	bl	100f8c <__sprint>
  102a60:	e3500000 	cmp	r0, #0	; 0x0
  102a64:	1afffa46 	bne	101384 <prog+0x1340>
  102a68:	e59d6680 	ldr	r6, [sp, #1664]
  102a6c:	e59d567c 	ldr	r5, [sp, #1660]
  102a70:	e28d2e61 	add	r2, sp, #1552	; 0x610
  102a74:	e59d4034 	ldr	r4, [sp, #52]
  102a78:	e2855001 	add	r5, r5, #1	; 0x1
  102a7c:	e59d801c 	ldr	r8, [sp, #28]
  102a80:	e3550007 	cmp	r5, #7	; 0x7
  102a84:	e0866004 	add	r6, r6, r4
  102a88:	e5828000 	str	r8, [r2]
  102a8c:	e5824004 	str	r4, [r2, #4]
  102a90:	e58d6680 	str	r6, [sp, #1664]
  102a94:	e58d567c 	str	r5, [sp, #1660]
  102a98:	d282c008 	addle	ip, r2, #8	; 0x8
  102a9c:	dafffbd3 	ble	1019f0 <prog+0x19ac>
  102aa0:	eafffd99 	b	10210c <prog+0x20c8>
  102aa4:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102aa8:	e1a0000a 	mov	r0, sl
  102aac:	e2811008 	add	r1, r1, #8	; 0x8
  102ab0:	ebfff935 	bl	100f8c <__sprint>
  102ab4:	e3500000 	cmp	r0, #0	; 0x0
  102ab8:	1afffa31 	bne	101384 <prog+0x1340>
  102abc:	e59d6680 	ldr	r6, [sp, #1664]
  102ac0:	e59d567c 	ldr	r5, [sp, #1660]
  102ac4:	e59d06a8 	ldr	r0, [sp, #1704]
  102ac8:	e28dce61 	add	ip, sp, #1552	; 0x610
  102acc:	eafffd82 	b	1020dc <prog+0x2098>
  102ad0:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102ad4:	e1a0000a 	mov	r0, sl
  102ad8:	e2811008 	add	r1, r1, #8	; 0x8
  102adc:	ebfff92a 	bl	100f8c <__sprint>
  102ae0:	e3500000 	cmp	r0, #0	; 0x0
  102ae4:	1afffa26 	bne	101384 <prog+0x1340>
  102ae8:	e59d6680 	ldr	r6, [sp, #1664]
  102aec:	e59d567c 	ldr	r5, [sp, #1660]
  102af0:	e59d06a8 	ldr	r0, [sp, #1704]
  102af4:	e28d1e61 	add	r1, sp, #1552	; 0x610
  102af8:	eafffd6b 	b	1020ac <prog+0x2068>
  102afc:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102b00:	e1a0000a 	mov	r0, sl
  102b04:	e2811008 	add	r1, r1, #8	; 0x8
  102b08:	ebfff91f 	bl	100f8c <__sprint>
  102b0c:	e3500000 	cmp	r0, #0	; 0x0
  102b10:	1afffa1b 	bne	101384 <prog+0x1340>
  102b14:	e59d6680 	ldr	r6, [sp, #1664]
  102b18:	e59d06a8 	ldr	r0, [sp, #1704]
  102b1c:	e28dce61 	add	ip, sp, #1552	; 0x610
  102b20:	eafffe5d 	b	10249c <prog+0x2458>
  102b24:	e51f970c 	ldr	r9, [pc, #-1804]	; 102420 <prog+0x23dc>
  102b28:	eafffce9 	b	101ed4 <prog+0x1e90>
  102b2c:	e3560000 	cmp	r6, #0	; 0x0
  102b30:	a1a04006 	movge	r4, r6
  102b34:	b3a04000 	movlt	r4, #0	; 0x0
  102b38:	e1a0b006 	mov	fp, r6
  102b3c:	e58d403c 	str	r4, [sp, #60]
  102b40:	e58d5038 	str	r5, [sp, #56]
  102b44:	eafffa6d 	b	101500 <prog+0x14bc>
  102b48:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102b4c:	e1a0000a 	mov	r0, sl
  102b50:	e2811008 	add	r1, r1, #8	; 0x8
  102b54:	ebfff90c 	bl	100f8c <__sprint>
  102b58:	e3500000 	cmp	r0, #0	; 0x0
  102b5c:	1afffa08 	bne	101384 <prog+0x1340>
  102b60:	e59d6680 	ldr	r6, [sp, #1664]
  102b64:	e59d06a8 	ldr	r0, [sp, #1704]
  102b68:	e28dce61 	add	ip, sp, #1552	; 0x610
  102b6c:	eaffff08 	b	102794 <prog+0x2750>
  102b70:	e59d001c 	ldr	r0, [sp, #28]
  102b74:	ebfff89b 	bl	100de8 <strlen>
  102b78:	e3500000 	cmp	r0, #0	; 0x0
  102b7c:	a1a0c000 	movge	ip, r0
  102b80:	b3a0c000 	movlt	ip, #0	; 0x0
  102b84:	e1a0b000 	mov	fp, r0
  102b88:	e58dc03c 	str	ip, [sp, #60]
  102b8c:	e58d5038 	str	r5, [sp, #56]
  102b90:	eafffa5a 	b	101500 <prog+0x14bc>
  102b94:	e3a02003 	mov	r2, #3	; 0x3
  102b98:	e51f377c 	ldr	r3, [pc, #-1916]	; 102424 <prog+0x23e0>
  102b9c:	e1a0b002 	mov	fp, r2
  102ba0:	e58d203c 	str	r2, [sp, #60]
  102ba4:	e58d301c 	str	r3, [sp, #28]
  102ba8:	e58d4038 	str	r4, [sp, #56]
  102bac:	eafffa53 	b	101500 <prog+0x14bc>
  102bb0:	e3a02000 	mov	r2, #0	; 0x0
  102bb4:	e3a0302d 	mov	r3, #45	; 0x2d
  102bb8:	e58d5034 	str	r5, [sp, #52]
  102bbc:	e58d2038 	str	r2, [sp, #56]
  102bc0:	e5cd36af 	strb	r3, [sp, #1711]
  102bc4:	eafffa50 	b	10150c <prog+0x14c8>
  102bc8:	e3570065 	cmp	r7, #101	; 0x65
  102bcc:	ca000069 	bgt	102d78 <prog+0x2d34>
  102bd0:	e59d06a8 	ldr	r0, [sp, #1704]
  102bd4:	e20730ff 	and	r3, r7, #255	; 0xff
  102bd8:	e2400001 	sub	r0, r0, #1	; 0x1
  102bdc:	e3500000 	cmp	r0, #0	; 0x0
  102be0:	e5cd3695 	strb	r3, [sp, #1685]
  102be4:	e1a0c000 	mov	ip, r0
  102be8:	b3a0302d 	movlt	r3, #45	; 0x2d
  102bec:	a3a0302b 	movge	r3, #43	; 0x2b
  102bf0:	b260c000 	rsblt	ip, r0, #0	; 0x0
  102bf4:	b5cd3696 	strltb	r3, [sp, #1686]
  102bf8:	a5cd3696 	strgeb	r3, [sp, #1686]
  102bfc:	e35c0009 	cmp	ip, #9	; 0x9
  102c00:	d28c2030 	addle	r2, ip, #48	; 0x30
  102c04:	d5cd2698 	strleb	r2, [sp, #1688]
  102c08:	d3a03030 	movle	r3, #48	; 0x30
  102c0c:	d28d2e69 	addle	r2, sp, #1680	; 0x690
  102c10:	e58d06a8 	str	r0, [sp, #1704]
  102c14:	d5cd3697 	strleb	r3, [sp, #1687]
  102c18:	d2822009 	addle	r2, r2, #9	; 0x9
  102c1c:	da00001a 	ble	102c8c <prog+0x2c48>
  102c20:	e28d4e67 	add	r4, sp, #1648	; 0x670
  102c24:	e2844008 	add	r4, r4, #8	; 0x8
  102c28:	e51f0808 	ldr	r0, [pc, #-2056]	; 102428 <prog+0x23e4>
  102c2c:	e1a0e004 	mov	lr, r4
  102c30:	e0c31c90 	smull	r1, r3, r0, ip
  102c34:	e1a02fcc 	mov	r2, ip, asr #31
  102c38:	e0622143 	rsb	r2, r2, r3, asr #2
  102c3c:	e0821102 	add	r1, r2, r2, lsl #2
  102c40:	e04c1081 	sub	r1, ip, r1, lsl #1
  102c44:	e2811030 	add	r1, r1, #48	; 0x30
  102c48:	e3520009 	cmp	r2, #9	; 0x9
  102c4c:	e1a0c002 	mov	ip, r2
  102c50:	e56e1001 	strb	r1, [lr, #-1]!
  102c54:	cafffff5 	bgt	102c30 <prog+0x2bec>
  102c58:	e24e0001 	sub	r0, lr, #1	; 0x1
  102c5c:	e1500004 	cmp	r0, r4
  102c60:	e2823030 	add	r3, r2, #48	; 0x30
  102c64:	228d2e69 	addcs	r2, sp, #1680	; 0x690
  102c68:	e54e3001 	strb	r3, [lr, #-1]
  102c6c:	22822007 	addcs	r2, r2, #7	; 0x7
  102c70:	2a000005 	bcs	102c8c <prog+0x2c48>
  102c74:	e28d2e69 	add	r2, sp, #1680	; 0x690
  102c78:	e2822007 	add	r2, r2, #7	; 0x7
  102c7c:	e4d03001 	ldrb	r3, [r0], #1
  102c80:	e1500004 	cmp	r0, r4
  102c84:	e4c23001 	strb	r3, [r2], #1
  102c88:	3afffffb 	bcc	102c7c <prog+0x2c38>
  102c8c:	e28d3e69 	add	r3, sp, #1680	; 0x690
  102c90:	e2833005 	add	r3, r3, #5	; 0x5
  102c94:	e0632002 	rsb	r2, r3, r2
  102c98:	e3550001 	cmp	r5, #1	; 0x1
  102c9c:	e58d2030 	str	r2, [sp, #48]
  102ca0:	e085b002 	add	fp, r5, r2
  102ca4:	da000043 	ble	102db8 <prog+0x2d74>
  102ca8:	e28bb001 	add	fp, fp, #1	; 0x1
  102cac:	e35b0000 	cmp	fp, #0	; 0x0
  102cb0:	a1a0400b 	movge	r4, fp
  102cb4:	b3a04000 	movlt	r4, #0	; 0x0
  102cb8:	e58d403c 	str	r4, [sp, #60]
  102cbc:	eaffff4f 	b	102a00 <prog+0x29bc>
  102cc0:	e3530000 	cmp	r3, #0	; 0x0
  102cc4:	13a03065 	movne	r3, #101	; 0x65
  102cc8:	11a07003 	movne	r7, r3
  102ccc:	03a03045 	moveq	r3, #69	; 0x45
  102cd0:	01a07003 	moveq	r7, r3
  102cd4:	eaffffbf 	b	102bd8 <prog+0x2b94>
  102cd8:	e3a01000 	mov	r1, #0	; 0x0
  102cdc:	e28d2e6a 	add	r2, sp, #1696	; 0x6a0
  102ce0:	e59d0010 	ldr	r0, [sp, #16]
  102ce4:	e2822004 	add	r2, r2, #4	; 0x4
  102ce8:	e1a03001 	mov	r3, r1
  102cec:	e58d9000 	str	r9, [sp]
  102cf0:	eb0000a7 	bl	102f94 <_wcsrtombs_r>
  102cf4:	e3700001 	cmn	r0, #1	; 0x1
  102cf8:	e1a0b000 	mov	fp, r0
  102cfc:	159d401c 	ldrne	r4, [sp, #28]
  102d00:	158d46a4 	strne	r4, [sp, #1700]
  102d04:	1afffbc4 	bne	101c1c <prog+0x1bd8>
  102d08:	e1da30bc 	ldrh	r3, [sl, #12]
  102d0c:	e3833040 	orr	r3, r3, #64	; 0x40
  102d10:	e1ca30bc 	strh	r3, [sl, #12]
  102d14:	eafff9a0 	b	10139c <prog+0x1358>
  102d18:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102d1c:	e1a0000a 	mov	r0, sl
  102d20:	e2811008 	add	r1, r1, #8	; 0x8
  102d24:	ebfff898 	bl	100f8c <__sprint>
  102d28:	e3500000 	cmp	r0, #0	; 0x0
  102d2c:	1afff994 	bne	101384 <prog+0x1340>
  102d30:	e59d6680 	ldr	r6, [sp, #1664]
  102d34:	e59d567c 	ldr	r5, [sp, #1660]
  102d38:	e59d06a8 	ldr	r0, [sp, #1704]
  102d3c:	e28d2e61 	add	r2, sp, #1552	; 0x610
  102d40:	eafffea4 	b	1027d8 <prog+0x2794>
  102d44:	e3560000 	cmp	r6, #0	; 0x0
  102d48:	a1a01006 	movge	r1, r6
  102d4c:	b3a01000 	movlt	r1, #0	; 0x0
  102d50:	e1a0b006 	mov	fp, r6
  102d54:	e58d103c 	str	r1, [sp, #60]
  102d58:	e58d0038 	str	r0, [sp, #56]
  102d5c:	eafff9e7 	b	101500 <prog+0x14bc>
  102d60:	e59d3680 	ldr	r3, [sp, #1664]
  102d64:	e3530000 	cmp	r3, #0	; 0x0
  102d68:	1a000031 	bne	102e34 <prog+0x2df0>
  102d6c:	e3a03000 	mov	r3, #0	; 0x0
  102d70:	e58d367c 	str	r3, [sp, #1660]
  102d74:	eafff988 	b	10139c <prog+0x1358>
  102d78:	e3570066 	cmp	r7, #102	; 0x66
  102d7c:	159d06a8 	ldrne	r0, [sp, #1704]
  102d80:	1affff13 	bne	1029d4 <prog+0x2990>
  102d84:	e59db6a8 	ldr	fp, [sp, #1704]
  102d88:	e35b0000 	cmp	fp, #0	; 0x0
  102d8c:	da00003e 	ble	102e8c <prog+0x2e48>
  102d90:	e3560000 	cmp	r6, #0	; 0x0
  102d94:	1a00002d 	bne	102e50 <prog+0x2e0c>
  102d98:	e59dc054 	ldr	ip, [sp, #84]
  102d9c:	e31c0001 	tst	ip, #1	; 0x1
  102da0:	1a00002a 	bne	102e50 <prog+0x2e0c>
  102da4:	e35b0000 	cmp	fp, #0	; 0x0
  102da8:	a1a0100b 	movge	r1, fp
  102dac:	b3a01000 	movlt	r1, #0	; 0x0
  102db0:	e58d103c 	str	r1, [sp, #60]
  102db4:	eaffff11 	b	102a00 <prog+0x29bc>
  102db8:	e59d2054 	ldr	r2, [sp, #84]
  102dbc:	e3120001 	tst	r2, #1	; 0x1
  102dc0:	1affffb8 	bne	102ca8 <prog+0x2c64>
  102dc4:	e35b0000 	cmp	fp, #0	; 0x0
  102dc8:	a1a0300b 	movge	r3, fp
  102dcc:	b3a03000 	movlt	r3, #0	; 0x0
  102dd0:	e58d303c 	str	r3, [sp, #60]
  102dd4:	eaffff09 	b	102a00 <prog+0x29bc>
  102dd8:	e3500000 	cmp	r0, #0	; 0x0
  102ddc:	c3a00001 	movgt	r0, #1	; 0x1
  102de0:	d26b0002 	rsble	r0, fp, #2	; 0x2
  102de4:	e080b005 	add	fp, r0, r5
  102de8:	e35b0000 	cmp	fp, #0	; 0x0
  102dec:	a1a0400b 	movge	r4, fp
  102df0:	b3a04000 	movlt	r4, #0	; 0x0
  102df4:	e58d403c 	str	r4, [sp, #60]
  102df8:	eaffff00 	b	102a00 <prog+0x29bc>
  102dfc:	e5d23000 	ldrb	r3, [r2]
  102e00:	e3530030 	cmp	r3, #48	; 0x30
  102e04:	1a000007 	bne	102e28 <prog+0x2de4>
  102e08:	e1a00004 	mov	r0, r4
  102e0c:	e1a01005 	mov	r1, r5
  102e10:	e3a02000 	mov	r2, #0	; 0x0
  102e14:	e3a03000 	mov	r3, #0	; 0x0
  102e18:	eb001581 	bl	108424 <__nedf2>
  102e1c:	e3500000 	cmp	r0, #0	; 0x0
  102e20:	126b0001 	rsbne	r0, fp, #1	; 0x1
  102e24:	158d06a8 	strne	r0, [sp, #1704]
  102e28:	e59d06a8 	ldr	r0, [sp, #1704]
  102e2c:	e0899000 	add	r9, r9, r0
  102e30:	eafffec3 	b	102944 <prog+0x2900>
  102e34:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102e38:	e1a0000a 	mov	r0, sl
  102e3c:	e2811008 	add	r1, r1, #8	; 0x8
  102e40:	ebfff851 	bl	100f8c <__sprint>
  102e44:	e3500000 	cmp	r0, #0	; 0x0
  102e48:	1afff953 	bne	10139c <prog+0x1358>
  102e4c:	eaffffc6 	b	102d6c <prog+0x2d28>
  102e50:	e28b3001 	add	r3, fp, #1	; 0x1
  102e54:	e086b003 	add	fp, r6, r3
  102e58:	e35b0000 	cmp	fp, #0	; 0x0
  102e5c:	a1a0200b 	movge	r2, fp
  102e60:	b3a02000 	movlt	r2, #0	; 0x0
  102e64:	e58d203c 	str	r2, [sp, #60]
  102e68:	eafffee4 	b	102a00 <prog+0x29bc>
  102e6c:	e5996000 	ldr	r6, [r9]
  102e70:	e3560000 	cmp	r6, #0	; 0x0
  102e74:	e2891004 	add	r1, r9, #4	; 0x4
  102e78:	ba000015 	blt	102ed4 <prog+0x2e90>
  102e7c:	e58d2018 	str	r2, [sp, #24]
  102e80:	e5d23000 	ldrb	r3, [r2]
  102e84:	e1a09001 	mov	r9, r1
  102e88:	eafff8cd 	b	1011c4 <_vfprintf_r+0x1f8>
  102e8c:	e3560000 	cmp	r6, #0	; 0x0
  102e90:	1a000005 	bne	102eac <prog+0x2e68>
  102e94:	e59d3054 	ldr	r3, [sp, #84]
  102e98:	e3130001 	tst	r3, #1	; 0x1
  102e9c:	03a04001 	moveq	r4, #1	; 0x1
  102ea0:	058d403c 	streq	r4, [sp, #60]
  102ea4:	01a0b004 	moveq	fp, r4
  102ea8:	0afffed4 	beq	102a00 <prog+0x29bc>
  102eac:	e286b002 	add	fp, r6, #2	; 0x2
  102eb0:	e35b0000 	cmp	fp, #0	; 0x0
  102eb4:	a1a0c00b 	movge	ip, fp
  102eb8:	b3a0c000 	movlt	ip, #0	; 0x0
  102ebc:	e58dc03c 	str	ip, [sp, #60]
  102ec0:	eafffece 	b	102a00 <prog+0x29bc>
  102ec4:	e1da30bc 	ldrh	r3, [sl, #12]
  102ec8:	e3833040 	orr	r3, r3, #64	; 0x40
  102ecc:	e1ca30bc 	strh	r3, [sl, #12]
  102ed0:	eafff92e 	b	101390 <prog+0x134c>
  102ed4:	e58d2018 	str	r2, [sp, #24]
  102ed8:	e5d23000 	ldrb	r3, [r2]
  102edc:	e1a09001 	mov	r9, r1
  102ee0:	e3e06000 	mvn	r6, #0	; 0x0
  102ee4:	eafff8b6 	b	1011c4 <_vfprintf_r+0x1f8>

00102ee8 <vfprintf>:
  102ee8:	e52de004 	str	lr, [sp, #-4]!
  102eec:	e1a03002 	mov	r3, r2
  102ef0:	e59f2018 	ldr	r2, [pc, #24]	; 102f10 <prog+0x2ecc>
  102ef4:	e1a0c000 	mov	ip, r0
  102ef8:	e1a0e001 	mov	lr, r1
  102efc:	e5920000 	ldr	r0, [r2]
  102f00:	e1a0100c 	mov	r1, ip
  102f04:	e1a0200e 	mov	r2, lr
  102f08:	e49de004 	ldr	lr, [sp], #4
  102f0c:	eafff82e 	b	100fcc <_vfprintf_r>
  102f10:	00200410 	eoreq	r0, r0, r0, lsl r4

00102f14 <_wcrtomb_r>:
  102f14:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102f18:	e251c000 	subs	ip, r1, #0	; 0x0
  102f1c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  102f20:	e1a05000 	mov	r5, r0
  102f24:	e1a04003 	mov	r4, r3
  102f28:	0a00000a 	beq	102f58 <_wcrtomb_r+0x44>
  102f2c:	eb000076 	bl	10310c <_wctomb_r>
  102f30:	e3700001 	cmn	r0, #1	; 0x1
  102f34:	e1a01000 	mov	r1, r0
  102f38:	11a01000 	movne	r1, r0
  102f3c:	03a03000 	moveq	r3, #0	; 0x0
  102f40:	03a0208a 	moveq	r2, #138	; 0x8a
  102f44:	e1a00001 	mov	r0, r1
  102f48:	05843000 	streq	r3, [r4]
  102f4c:	05852000 	streq	r2, [r5]
  102f50:	e28dd00c 	add	sp, sp, #12	; 0xc
  102f54:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  102f58:	e1a0200c 	mov	r2, ip
  102f5c:	e28d1002 	add	r1, sp, #2	; 0x2
  102f60:	eb000069 	bl	10310c <_wctomb_r>
  102f64:	eafffff1 	b	102f30 <_wcrtomb_r+0x1c>

00102f68 <wcrtomb>:
  102f68:	e52de004 	str	lr, [sp, #-4]!
  102f6c:	e1a03002 	mov	r3, r2
  102f70:	e59f2018 	ldr	r2, [pc, #24]	; 102f90 <prog+0x2f4c>
  102f74:	e1a0c000 	mov	ip, r0
  102f78:	e1a0e001 	mov	lr, r1
  102f7c:	e5920000 	ldr	r0, [r2]
  102f80:	e1a0100c 	mov	r1, ip
  102f84:	e1a0200e 	mov	r2, lr
  102f88:	e49de004 	ldr	lr, [sp], #4
  102f8c:	eaffffe0 	b	102f14 <_wcrtomb_r>
  102f90:	00200410 	eoreq	r0, r0, r0, lsl r4

00102f94 <_wcsrtombs_r>:
  102f94:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  102f98:	e3510000 	cmp	r1, #0	; 0x0
  102f9c:	e24dd014 	sub	sp, sp, #20	; 0x14
  102fa0:	e58d1000 	str	r1, [sp]
  102fa4:	e58d0004 	str	r0, [sp, #4]
  102fa8:	e1a0b002 	mov	fp, r2
  102fac:	e1a06003 	mov	r6, r3
  102fb0:	e59d9038 	ldr	r9, [sp, #56]
  102fb4:	0a000039 	beq	1030a0 <_wcsrtombs_r+0x10c>
  102fb8:	e3530000 	cmp	r3, #0	; 0x0
  102fbc:	e5928000 	ldr	r8, [r2]
  102fc0:	0a000039 	beq	1030ac <_wcsrtombs_r+0x118>
  102fc4:	e59d4000 	ldr	r4, [sp]
  102fc8:	e3a05000 	mov	r5, #0	; 0x0
  102fcc:	e59d0004 	ldr	r0, [sp, #4]
  102fd0:	e28d100a 	add	r1, sp, #10	; 0xa
  102fd4:	e5982000 	ldr	r2, [r8]
  102fd8:	e1a03009 	mov	r3, r9
  102fdc:	e599a000 	ldr	sl, [r9]
  102fe0:	e5997004 	ldr	r7, [r9, #4]
  102fe4:	ebffffca 	bl	102f14 <_wcrtomb_r>
  102fe8:	e3700001 	cmn	r0, #1	; 0x1
  102fec:	0a00001f 	beq	103070 <_wcsrtombs_r+0xdc>
  102ff0:	e0603006 	rsb	r3, r0, r6
  102ff4:	e1530005 	cmp	r3, r5
  102ff8:	33a02000 	movcc	r2, #0	; 0x0
  102ffc:	23a02001 	movcs	r2, #1	; 0x1
  103000:	e1500006 	cmp	r0, r6
  103004:	23a02000 	movcs	r2, #0	; 0x0
  103008:	e3520000 	cmp	r2, #0	; 0x0
  10300c:	0a000020 	beq	103094 <_wcsrtombs_r+0x100>
  103010:	e59d1000 	ldr	r1, [sp]
  103014:	e3510000 	cmp	r1, #0	; 0x0
  103018:	e0855000 	add	r5, r5, r0
  10301c:	0a00000c 	beq	103054 <_wcsrtombs_r+0xc0>
  103020:	e3500000 	cmp	r0, #0	; 0x0
  103024:	da000007 	ble	103048 <_wcsrtombs_r+0xb4>
  103028:	e3a02000 	mov	r2, #0	; 0x0
  10302c:	e282100a 	add	r1, r2, #10	; 0xa
  103030:	e7d1300d 	ldrb	r3, [r1, sp]
  103034:	e7c23004 	strb	r3, [r2, r4]
  103038:	e2822001 	add	r2, r2, #1	; 0x1
  10303c:	e1500002 	cmp	r0, r2
  103040:	1afffff9 	bne	10302c <_wcsrtombs_r+0x98>
  103044:	e0844000 	add	r4, r4, r0
  103048:	e59b3000 	ldr	r3, [fp]
  10304c:	e2833004 	add	r3, r3, #4	; 0x4
  103050:	e58b3000 	str	r3, [fp]
  103054:	e5983000 	ldr	r3, [r8]
  103058:	e3530000 	cmp	r3, #0	; 0x0
  10305c:	0a000014 	beq	1030b4 <_wcsrtombs_r+0x120>
  103060:	e1550006 	cmp	r5, r6
  103064:	2a000007 	bcs	103088 <_wcsrtombs_r+0xf4>
  103068:	e2888004 	add	r8, r8, #4	; 0x4
  10306c:	eaffffd6 	b	102fcc <_wcsrtombs_r+0x38>
  103070:	e59d1004 	ldr	r1, [sp, #4]
  103074:	e3a0308a 	mov	r3, #138	; 0x8a
  103078:	e3a02000 	mov	r2, #0	; 0x0
  10307c:	e5813000 	str	r3, [r1]
  103080:	e5892000 	str	r2, [r9]
  103084:	e1a05000 	mov	r5, r0
  103088:	e1a00005 	mov	r0, r5
  10308c:	e28dd014 	add	sp, sp, #20	; 0x14
  103090:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  103094:	e5897004 	str	r7, [r9, #4]
  103098:	e589a000 	str	sl, [r9]
  10309c:	eafffff9 	b	103088 <_wcsrtombs_r+0xf4>
  1030a0:	e5928000 	ldr	r8, [r2]
  1030a4:	e3e06000 	mvn	r6, #0	; 0x0
  1030a8:	eaffffc5 	b	102fc4 <_wcsrtombs_r+0x30>
  1030ac:	e3a05000 	mov	r5, #0	; 0x0
  1030b0:	eafffff4 	b	103088 <_wcsrtombs_r+0xf4>
  1030b4:	e59d2000 	ldr	r2, [sp]
  1030b8:	e2455001 	sub	r5, r5, #1	; 0x1
  1030bc:	e3520000 	cmp	r2, #0	; 0x0
  1030c0:	158b3000 	strne	r3, [fp]
  1030c4:	e5893000 	str	r3, [r9]
  1030c8:	eaffffee 	b	103088 <_wcsrtombs_r+0xf4>

001030cc <wcsrtombs>:
  1030cc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1030d0:	e59fc030 	ldr	ip, [pc, #48]	; 103108 <prog+0x30c4>
  1030d4:	e59ce000 	ldr	lr, [ip]
  1030d8:	e1a04000 	mov	r4, r0
  1030dc:	e1a0c001 	mov	ip, r1
  1030e0:	e1a05002 	mov	r5, r2
  1030e4:	e24dd004 	sub	sp, sp, #4	; 0x4
  1030e8:	e58d3000 	str	r3, [sp]
  1030ec:	e1a0000e 	mov	r0, lr
  1030f0:	e1a01004 	mov	r1, r4
  1030f4:	e1a0200c 	mov	r2, ip
  1030f8:	e1a03005 	mov	r3, r5
  1030fc:	ebffffa4 	bl	102f94 <_wcsrtombs_r>
  103100:	e28dd004 	add	sp, sp, #4	; 0x4
  103104:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  103108:	00200410 	eoreq	r0, r0, r0, lsl r4

0010310c <_wctomb_r>:
  10310c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  103110:	e59f0400 	ldr	r0, [pc, #1024]	; 103518 <prog+0x34d4>
  103114:	e1a07001 	mov	r7, r1
  103118:	e1a04002 	mov	r4, r2
  10311c:	e1a05003 	mov	r5, r3
  103120:	ebfff730 	bl	100de8 <strlen>
  103124:	e3500001 	cmp	r0, #1	; 0x1
  103128:	9a000025 	bls	1031c4 <_wctomb_r+0xb8>
  10312c:	e59f03e4 	ldr	r0, [pc, #996]	; 103518 <prog+0x34d4>
  103130:	e59f13e4 	ldr	r1, [pc, #996]	; 10351c <prog+0x34d8>
  103134:	eb000fa2 	bl	106fc4 <strcmp>
  103138:	e3500000 	cmp	r0, #0	; 0x0
  10313c:	1a000012 	bne	10318c <_wctomb_r+0x80>
  103140:	e3570000 	cmp	r7, #0	; 0x0
  103144:	0a000020 	beq	1031cc <_wctomb_r+0xc0>
  103148:	e354007f 	cmp	r4, #127	; 0x7f
  10314c:	da000018 	ble	1031b4 <_wctomb_r+0xa8>
  103150:	e2443080 	sub	r3, r4, #128	; 0x80
  103154:	e3530d1e 	cmp	r3, #1920	; 0x780
  103158:	2a000063 	bcs	1032ec <_wctomb_r+0x1e0>
  10315c:	e2043d1f 	and	r3, r4, #1984	; 0x7c0
  103160:	e204203f 	and	r2, r4, #63	; 0x3f
  103164:	e1a03343 	mov	r3, r3, asr #6
  103168:	e3a06002 	mov	r6, #2	; 0x2
  10316c:	e1e03d03 	mvn	r3, r3, lsl #26
  103170:	e1e02c82 	mvn	r2, r2, lsl #25
  103174:	e1e03d23 	mvn	r3, r3, lsr #26
  103178:	e1e02ca2 	mvn	r2, r2, lsr #25
  10317c:	e1a00006 	mov	r0, r6
  103180:	e5c72001 	strb	r2, [r7, #1]
  103184:	e5c73000 	strb	r3, [r7]
  103188:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10318c:	e59f0384 	ldr	r0, [pc, #900]	; 103518 <prog+0x34d4>
  103190:	e59f1388 	ldr	r1, [pc, #904]	; 103520 <prog+0x34dc>
  103194:	eb000f8a 	bl	106fc4 <strcmp>
  103198:	e3500000 	cmp	r0, #0	; 0x0
  10319c:	1a00000d 	bne	1031d8 <_wctomb_r+0xcc>
  1031a0:	e3570000 	cmp	r7, #0	; 0x0
  1031a4:	0a000008 	beq	1031cc <_wctomb_r+0xc0>
  1031a8:	e1a03444 	mov	r3, r4, asr #8
  1031ac:	e213e0ff 	ands	lr, r3, #255	; 0xff
  1031b0:	1a000034 	bne	103288 <_wctomb_r+0x17c>
  1031b4:	e5c74000 	strb	r4, [r7]
  1031b8:	e3a06001 	mov	r6, #1	; 0x1
  1031bc:	e1a00006 	mov	r0, r6
  1031c0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1031c4:	e3570000 	cmp	r7, #0	; 0x0
  1031c8:	1afffff9 	bne	1031b4 <_wctomb_r+0xa8>
  1031cc:	e3a06000 	mov	r6, #0	; 0x0
  1031d0:	e1a00006 	mov	r0, r6
  1031d4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1031d8:	e59f0338 	ldr	r0, [pc, #824]	; 103518 <prog+0x34d4>
  1031dc:	e59f1340 	ldr	r1, [pc, #832]	; 103524 <prog+0x34e0>
  1031e0:	eb000f77 	bl	106fc4 <strcmp>
  1031e4:	e3500000 	cmp	r0, #0	; 0x0
  1031e8:	1a00000a 	bne	103218 <_wctomb_r+0x10c>
  1031ec:	e3570000 	cmp	r7, #0	; 0x0
  1031f0:	0afffff5 	beq	1031cc <_wctomb_r+0xc0>
  1031f4:	e1a03444 	mov	r3, r4, asr #8
  1031f8:	e213e0ff 	ands	lr, r3, #255	; 0xff
  1031fc:	0affffec 	beq	1031b4 <_wctomb_r+0xa8>
  103200:	e28e305f 	add	r3, lr, #95	; 0x5f
  103204:	e20330ff 	and	r3, r3, #255	; 0xff
  103208:	e353005d 	cmp	r3, #93	; 0x5d
  10320c:	9a00002f 	bls	1032d0 <_wctomb_r+0x1c4>
  103210:	e3e06000 	mvn	r6, #0	; 0x0
  103214:	eaffffe8 	b	1031bc <_wctomb_r+0xb0>
  103218:	e59f02f8 	ldr	r0, [pc, #760]	; 103518 <prog+0x34d4>
  10321c:	e59f1304 	ldr	r1, [pc, #772]	; 103528 <prog+0x34e4>
  103220:	eb000f67 	bl	106fc4 <strcmp>
  103224:	e3500000 	cmp	r0, #0	; 0x0
  103228:	1affffe5 	bne	1031c4 <_wctomb_r+0xb8>
  10322c:	e3570000 	cmp	r7, #0	; 0x0
  103230:	03a06001 	moveq	r6, #1	; 0x1
  103234:	0affffe0 	beq	1031bc <_wctomb_r+0xb0>
  103238:	e1a03444 	mov	r3, r4, asr #8
  10323c:	e213e0ff 	ands	lr, r3, #255	; 0xff
  103240:	e20400ff 	and	r0, r4, #255	; 0xff
  103244:	1a000044 	bne	10335c <_wctomb_r+0x250>
  103248:	e5953000 	ldr	r3, [r5]
  10324c:	e3530000 	cmp	r3, #0	; 0x0
  103250:	03a06001 	moveq	r6, #1	; 0x1
  103254:	0a000009 	beq	103280 <_wctomb_r+0x174>
  103258:	e1a01007 	mov	r1, r7
  10325c:	e3a0301b 	mov	r3, #27	; 0x1b
  103260:	e585e000 	str	lr, [r5]
  103264:	e4c13001 	strb	r3, [r1], #1
  103268:	e3a02028 	mov	r2, #40	; 0x28
  10326c:	e2833027 	add	r3, r3, #39	; 0x27
  103270:	e5c72001 	strb	r2, [r7, #1]
  103274:	e5c13001 	strb	r3, [r1, #1]
  103278:	e2817002 	add	r7, r1, #2	; 0x2
  10327c:	e3a06004 	mov	r6, #4	; 0x4
  103280:	e5c70000 	strb	r0, [r7]
  103284:	eaffffcc 	b	1031bc <_wctomb_r+0xb0>
  103288:	e28e207f 	add	r2, lr, #127	; 0x7f
  10328c:	e28e3020 	add	r3, lr, #32	; 0x20
  103290:	e20220ff 	and	r2, r2, #255	; 0xff
  103294:	e20330ff 	and	r3, r3, #255	; 0xff
  103298:	e353000f 	cmp	r3, #15	; 0xf
  10329c:	8352001e 	cmphi	r2, #30	; 0x1e
  1032a0:	8affffda 	bhi	103210 <_wctomb_r+0x104>
  1032a4:	e20400ff 	and	r0, r4, #255	; 0xff
  1032a8:	e2403080 	sub	r3, r0, #128	; 0x80
  1032ac:	e20330ff 	and	r3, r3, #255	; 0xff
  1032b0:	e2402040 	sub	r2, r0, #64	; 0x40
  1032b4:	e353007c 	cmp	r3, #124	; 0x7c
  1032b8:	8352003e 	cmphi	r2, #62	; 0x3e
  1032bc:	8affffd3 	bhi	103210 <_wctomb_r+0x104>
  1032c0:	e3a06002 	mov	r6, #2	; 0x2
  1032c4:	e5c70001 	strb	r0, [r7, #1]
  1032c8:	e5c7e000 	strb	lr, [r7]
  1032cc:	eaffffba 	b	1031bc <_wctomb_r+0xb0>
  1032d0:	e20400ff 	and	r0, r4, #255	; 0xff
  1032d4:	e280305f 	add	r3, r0, #95	; 0x5f
  1032d8:	e20330ff 	and	r3, r3, #255	; 0xff
  1032dc:	e353005d 	cmp	r3, #93	; 0x5d
  1032e0:	9afffff6 	bls	1032c0 <_wctomb_r+0x1b4>
  1032e4:	e3e06000 	mvn	r6, #0	; 0x0
  1032e8:	eaffffb3 	b	1031bc <_wctomb_r+0xb0>
  1032ec:	e2443b02 	sub	r3, r4, #2048	; 0x800
  1032f0:	e3530b3e 	cmp	r3, #63488	; 0xf800
  1032f4:	3a00004f 	bcc	103438 <_wctomb_r+0x32c>
  1032f8:	e2443801 	sub	r3, r4, #65536	; 0x10000
  1032fc:	e353081f 	cmp	r3, #2031616	; 0x1f0000
  103300:	2a00002d 	bcs	1033bc <_wctomb_r+0x2b0>
  103304:	e2043707 	and	r3, r4, #1835008	; 0x1c0000
  103308:	e1a03943 	mov	r3, r3, asr #18
  10330c:	e1e03e03 	mvn	r3, r3, lsl #28
  103310:	e2042a3f 	and	r2, r4, #258048	; 0x3f000
  103314:	e2041d3f 	and	r1, r4, #4032	; 0xfc0
  103318:	e1a0c007 	mov	ip, r7
  10331c:	e1e03e23 	mvn	r3, r3, lsr #28
  103320:	e1a02642 	mov	r2, r2, asr #12
  103324:	e1a01341 	mov	r1, r1, asr #6
  103328:	e204003f 	and	r0, r4, #63	; 0x3f
  10332c:	e4cc3001 	strb	r3, [ip], #1
  103330:	e1e02c82 	mvn	r2, r2, lsl #25
  103334:	e1e01c81 	mvn	r1, r1, lsl #25
  103338:	e1e00c80 	mvn	r0, r0, lsl #25
  10333c:	e1e02ca2 	mvn	r2, r2, lsr #25
  103340:	e1e01ca1 	mvn	r1, r1, lsr #25
  103344:	e1e00ca0 	mvn	r0, r0, lsr #25
  103348:	e3a06004 	mov	r6, #4	; 0x4
  10334c:	e5c72001 	strb	r2, [r7, #1]
  103350:	e5cc0002 	strb	r0, [ip, #2]
  103354:	e5cc1001 	strb	r1, [ip, #1]
  103358:	eaffff97 	b	1031bc <_wctomb_r+0xb0>
  10335c:	e24e3021 	sub	r3, lr, #33	; 0x21
  103360:	e353005d 	cmp	r3, #93	; 0x5d
  103364:	8affffa9 	bhi	103210 <_wctomb_r+0x104>
  103368:	e2403021 	sub	r3, r0, #33	; 0x21
  10336c:	e353005d 	cmp	r3, #93	; 0x5d
  103370:	8affffa6 	bhi	103210 <_wctomb_r+0x104>
  103374:	e5953000 	ldr	r3, [r5]
  103378:	e3530000 	cmp	r3, #0	; 0x0
  10337c:	13a06002 	movne	r6, #2	; 0x2
  103380:	1a00000a 	bne	1033b0 <_wctomb_r+0x2a4>
  103384:	e1a01007 	mov	r1, r7
  103388:	e3a03001 	mov	r3, #1	; 0x1
  10338c:	e3a0201b 	mov	r2, #27	; 0x1b
  103390:	e5853000 	str	r3, [r5]
  103394:	e4c12001 	strb	r2, [r1], #1
  103398:	e2833023 	add	r3, r3, #35	; 0x23
  10339c:	e2822027 	add	r2, r2, #39	; 0x27
  1033a0:	e5c73001 	strb	r3, [r7, #1]
  1033a4:	e5c12001 	strb	r2, [r1, #1]
  1033a8:	e2817002 	add	r7, r1, #2	; 0x2
  1033ac:	e3a06005 	mov	r6, #5	; 0x5
  1033b0:	e5c70001 	strb	r0, [r7, #1]
  1033b4:	e5c7e000 	strb	lr, [r7]
  1033b8:	eaffff7f 	b	1031bc <_wctomb_r+0xb0>
  1033bc:	e2443602 	sub	r3, r4, #2097152	; 0x200000
  1033c0:	e353063e 	cmp	r3, #65011712	; 0x3e00000
  1033c4:	2a00002f 	bcs	103488 <_wctomb_r+0x37c>
  1033c8:	e2043403 	and	r3, r4, #50331648	; 0x3000000
  1033cc:	e1a03c43 	mov	r3, r3, asr #24
  1033d0:	e1e03e83 	mvn	r3, r3, lsl #29
  1033d4:	e1a0e007 	mov	lr, r7
  1033d8:	e1e03ea3 	mvn	r3, r3, lsr #29
  1033dc:	e204273f 	and	r2, r4, #16515072	; 0xfc0000
  1033e0:	e2041a3f 	and	r1, r4, #258048	; 0x3f000
  1033e4:	e2040d3f 	and	r0, r4, #4032	; 0xfc0
  1033e8:	e4ce3001 	strb	r3, [lr], #1
  1033ec:	e1a02942 	mov	r2, r2, asr #18
  1033f0:	e1a01641 	mov	r1, r1, asr #12
  1033f4:	e1a00340 	mov	r0, r0, asr #6
  1033f8:	e204303f 	and	r3, r4, #63	; 0x3f
  1033fc:	e1e02c82 	mvn	r2, r2, lsl #25
  103400:	e1e01c81 	mvn	r1, r1, lsl #25
  103404:	e1e00c80 	mvn	r0, r0, lsl #25
  103408:	e1e03c83 	mvn	r3, r3, lsl #25
  10340c:	e28ec001 	add	ip, lr, #1	; 0x1
  103410:	e1e02ca2 	mvn	r2, r2, lsr #25
  103414:	e1e01ca1 	mvn	r1, r1, lsr #25
  103418:	e1e00ca0 	mvn	r0, r0, lsr #25
  10341c:	e1e03ca3 	mvn	r3, r3, lsr #25
  103420:	e3a06005 	mov	r6, #5	; 0x5
  103424:	e5c72001 	strb	r2, [r7, #1]
  103428:	e5ce1001 	strb	r1, [lr, #1]
  10342c:	e5cc3002 	strb	r3, [ip, #2]
  103430:	e5cc0001 	strb	r0, [ip, #1]
  103434:	eaffff60 	b	1031bc <_wctomb_r+0xb0>
  103438:	e2443b36 	sub	r3, r4, #55296	; 0xd800
  10343c:	e3530b02 	cmp	r3, #2048	; 0x800
  103440:	3affff72 	bcc	103210 <_wctomb_r+0x104>
  103444:	e2043a0f 	and	r3, r4, #61440	; 0xf000
  103448:	e1a03643 	mov	r3, r3, asr #12
  10344c:	e1e03d83 	mvn	r3, r3, lsl #27
  103450:	e2042d3f 	and	r2, r4, #4032	; 0xfc0
  103454:	e1a00007 	mov	r0, r7
  103458:	e1e03da3 	mvn	r3, r3, lsr #27
  10345c:	e1a02342 	mov	r2, r2, asr #6
  103460:	e204103f 	and	r1, r4, #63	; 0x3f
  103464:	e4c03001 	strb	r3, [r0], #1
  103468:	e1e02c82 	mvn	r2, r2, lsl #25
  10346c:	e1e01c81 	mvn	r1, r1, lsl #25
  103470:	e1e02ca2 	mvn	r2, r2, lsr #25
  103474:	e1e01ca1 	mvn	r1, r1, lsr #25
  103478:	e3a06003 	mov	r6, #3	; 0x3
  10347c:	e5c72001 	strb	r2, [r7, #1]
  103480:	e5c01001 	strb	r1, [r0, #1]
  103484:	eaffff4c 	b	1031bc <_wctomb_r+0xb0>
  103488:	e374037f 	cmn	r4, #-67108863	; 0xfc000001
  10348c:	daffff5f 	ble	103210 <_wctomb_r+0x104>
  103490:	e2043101 	and	r3, r4, #1073741824	; 0x40000000
  103494:	e1a03f43 	mov	r3, r3, asr #30
  103498:	e1e03f03 	mvn	r3, r3, lsl #30
  10349c:	e1a0e007 	mov	lr, r7
  1034a0:	e1e03f23 	mvn	r3, r3, lsr #30
  1034a4:	e4ce3001 	strb	r3, [lr], #1
  1034a8:	e204243f 	and	r2, r4, #1056964608	; 0x3f000000
  1034ac:	e204373f 	and	r3, r4, #16515072	; 0xfc0000
  1034b0:	e2041a3f 	and	r1, r4, #258048	; 0x3f000
  1034b4:	e2040d3f 	and	r0, r4, #4032	; 0xfc0
  1034b8:	e204c03f 	and	ip, r4, #63	; 0x3f
  1034bc:	e1a02c42 	mov	r2, r2, asr #24
  1034c0:	e1a03943 	mov	r3, r3, asr #18
  1034c4:	e1a01641 	mov	r1, r1, asr #12
  1034c8:	e1a00340 	mov	r0, r0, asr #6
  1034cc:	e28e5001 	add	r5, lr, #1	; 0x1
  1034d0:	e1e02c82 	mvn	r2, r2, lsl #25
  1034d4:	e1e03c83 	mvn	r3, r3, lsl #25
  1034d8:	e1e01c81 	mvn	r1, r1, lsl #25
  1034dc:	e1e00c80 	mvn	r0, r0, lsl #25
  1034e0:	e1e0cc8c 	mvn	ip, ip, lsl #25
  1034e4:	e2854001 	add	r4, r5, #1	; 0x1
  1034e8:	e1e02ca2 	mvn	r2, r2, lsr #25
  1034ec:	e1e03ca3 	mvn	r3, r3, lsr #25
  1034f0:	e1e01ca1 	mvn	r1, r1, lsr #25
  1034f4:	e1e00ca0 	mvn	r0, r0, lsr #25
  1034f8:	e1e0ccac 	mvn	ip, ip, lsr #25
  1034fc:	e3a06006 	mov	r6, #6	; 0x6
  103500:	e5c72001 	strb	r2, [r7, #1]
  103504:	e5ce3001 	strb	r3, [lr, #1]
  103508:	e5c51001 	strb	r1, [r5, #1]
  10350c:	e5c4c002 	strb	ip, [r4, #2]
  103510:	e5c40001 	strb	r0, [r4, #1]
  103514:	eaffff28 	b	1031bc <_wctomb_r+0xb0>
  103518:	00200818 	eoreq	r0, r0, r8, lsl r8
  10351c:	0010cf5c 	andeqs	ip, r0, ip, asr pc
  103520:	0010cf64 	andeqs	ip, r0, r4, ror #30
  103524:	0010cf6c 	andeqs	ip, r0, ip, ror #30
  103528:	0010cf74 	andeqs	ip, r0, r4, ror pc

0010352c <__swsetup>:
  10352c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  103530:	e59f60ec 	ldr	r6, [pc, #236]	; 103624 <prog+0x35e0>
  103534:	e5962000 	ldr	r2, [r6]
  103538:	e3520000 	cmp	r2, #0	; 0x0
  10353c:	e1a04000 	mov	r4, r0
  103540:	0a000002 	beq	103550 <__swsetup+0x24>
  103544:	e5923038 	ldr	r3, [r2, #56]
  103548:	e3530000 	cmp	r3, #0	; 0x0
  10354c:	0a000015 	beq	1035a8 <__swsetup+0x7c>
  103550:	e1d420bc 	ldrh	r2, [r4, #12]
  103554:	e2125008 	ands	r5, r2, #8	; 0x8
  103558:	15941010 	ldrne	r1, [r4, #16]
  10355c:	0a000017 	beq	1035c0 <__swsetup+0x94>
  103560:	e3510000 	cmp	r1, #0	; 0x0
  103564:	0a000012 	beq	1035b4 <__swsetup+0x88>
  103568:	e1d430bc 	ldrh	r3, [r4, #12]
  10356c:	e2132001 	ands	r2, r3, #1	; 0x1
  103570:	1a000005 	bne	10358c <__swsetup+0x60>
  103574:	e3130002 	tst	r3, #2	; 0x2
  103578:	05943014 	ldreq	r3, [r4, #20]
  10357c:	11a03002 	movne	r3, r2
  103580:	e3a00000 	mov	r0, #0	; 0x0
  103584:	e5843008 	str	r3, [r4, #8]
  103588:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10358c:	e5943014 	ldr	r3, [r4, #20]
  103590:	e3a02000 	mov	r2, #0	; 0x0
  103594:	e2633000 	rsb	r3, r3, #0	; 0x0
  103598:	e1a00002 	mov	r0, r2
  10359c:	e5843018 	str	r3, [r4, #24]
  1035a0:	e5842008 	str	r2, [r4, #8]
  1035a4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  1035a8:	e1a00002 	mov	r0, r2
  1035ac:	eb000603 	bl	104dc0 <__sinit>
  1035b0:	eaffffe6 	b	103550 <__swsetup+0x24>
  1035b4:	e1a00004 	mov	r0, r4
  1035b8:	eb0008d7 	bl	10591c <__smakebuf>
  1035bc:	eaffffe9 	b	103568 <__swsetup+0x3c>
  1035c0:	e3120010 	tst	r2, #16	; 0x10
  1035c4:	03e00000 	mvneq	r0, #0	; 0x0
  1035c8:	08bd8070 	ldmeqia	sp!, {r4, r5, r6, pc}
  1035cc:	e3120004 	tst	r2, #4	; 0x4
  1035d0:	05941010 	ldreq	r1, [r4, #16]
  1035d4:	0a00000f 	beq	103618 <__swsetup+0xec>
  1035d8:	e5941030 	ldr	r1, [r4, #48]
  1035dc:	e3510000 	cmp	r1, #0	; 0x0
  1035e0:	0a000006 	beq	103600 <__swsetup+0xd4>
  1035e4:	e2843040 	add	r3, r4, #64	; 0x40
  1035e8:	e1510003 	cmp	r1, r3
  1035ec:	0a000002 	beq	1035fc <__swsetup+0xd0>
  1035f0:	e5960000 	ldr	r0, [r6]
  1035f4:	eb0006b4 	bl	1050cc <_free_r>
  1035f8:	e1d420bc 	ldrh	r2, [r4, #12]
  1035fc:	e5845030 	str	r5, [r4, #48]
  103600:	e3c23024 	bic	r3, r2, #36	; 0x24
  103604:	e1c430bc 	strh	r3, [r4, #12]
  103608:	e5941010 	ldr	r1, [r4, #16]
  10360c:	e3a03000 	mov	r3, #0	; 0x0
  103610:	e1d420bc 	ldrh	r2, [r4, #12]
  103614:	e884000a 	stmia	r4, {r1, r3}
  103618:	e3823008 	orr	r3, r2, #8	; 0x8
  10361c:	e1c430bc 	strh	r3, [r4, #12]
  103620:	eaffffce 	b	103560 <__swsetup+0x34>
  103624:	00200410 	eoreq	r0, r0, r0, lsl r4

00103628 <quorem>:
  103628:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10362c:	e5903010 	ldr	r3, [r0, #16]
  103630:	e5912010 	ldr	r2, [r1, #16]
  103634:	e24dd00c 	sub	sp, sp, #12	; 0xc
  103638:	e1520003 	cmp	r2, r3
  10363c:	e58d0000 	str	r0, [sp]
  103640:	e1a09001 	mov	r9, r1
  103644:	c3a00000 	movgt	r0, #0	; 0x0
  103648:	ca000044 	bgt	103760 <quorem+0x138>
  10364c:	e2815014 	add	r5, r1, #20	; 0x14
  103650:	e59d1000 	ldr	r1, [sp]
  103654:	e2427001 	sub	r7, r2, #1	; 0x1
  103658:	e1a03107 	mov	r3, r7, lsl #2
  10365c:	e2818014 	add	r8, r1, #20	; 0x14
  103660:	e7932008 	ldr	r2, [r3, r8]
  103664:	e7951003 	ldr	r1, [r5, r3]
  103668:	e1a00002 	mov	r0, r2
  10366c:	e2811001 	add	r1, r1, #1	; 0x1
  103670:	e085b003 	add	fp, r5, r3
  103674:	e0833008 	add	r3, r3, r8
  103678:	e98d000c 	stmib	sp, {r2, r3}
  10367c:	ebfff2a4 	bl	100114 <__aeabi_uidiv>
  103680:	e250a000 	subs	sl, r0, #0	; 0x0
  103684:	1a000037 	bne	103768 <quorem+0x140>
  103688:	e1a01009 	mov	r1, r9
  10368c:	e59d0000 	ldr	r0, [sp]
  103690:	eb0009b8 	bl	105d78 <__mcmp>
  103694:	e3500000 	cmp	r0, #0	; 0x0
  103698:	ba00002f 	blt	10375c <quorem+0x134>
  10369c:	e3a04000 	mov	r4, #0	; 0x0
  1036a0:	e28aa001 	add	sl, sl, #1	; 0x1
  1036a4:	e1a0e008 	mov	lr, r8
  1036a8:	e1a00004 	mov	r0, r4
  1036ac:	e4952004 	ldr	r2, [r5], #4
  1036b0:	e1a03802 	mov	r3, r2, lsl #16
  1036b4:	e1a03823 	mov	r3, r3, lsr #16
  1036b8:	e59ec000 	ldr	ip, [lr]
  1036bc:	e0803003 	add	r3, r0, r3
  1036c0:	e1a00823 	mov	r0, r3, lsr #16
  1036c4:	e0800822 	add	r0, r0, r2, lsr #16
  1036c8:	e1a03803 	mov	r3, r3, lsl #16
  1036cc:	e1a0180c 	mov	r1, ip, lsl #16
  1036d0:	e1a02800 	mov	r2, r0, lsl #16
  1036d4:	e1a01821 	mov	r1, r1, lsr #16
  1036d8:	e1a03823 	mov	r3, r3, lsr #16
  1036dc:	e0631001 	rsb	r1, r3, r1
  1036e0:	e1a02822 	mov	r2, r2, lsr #16
  1036e4:	e0811004 	add	r1, r1, r4
  1036e8:	e062282c 	rsb	r2, r2, ip, lsr #16
  1036ec:	e0822841 	add	r2, r2, r1, asr #16
  1036f0:	e15b0005 	cmp	fp, r5
  1036f4:	e1ce20b2 	strh	r2, [lr, #2]
  1036f8:	e1a00820 	mov	r0, r0, lsr #16
  1036fc:	e0ce10b4 	strh	r1, [lr], #4
  103700:	e1a04842 	mov	r4, r2, asr #16
  103704:	2affffe8 	bcs	1036ac <quorem+0x84>
  103708:	e1a02107 	mov	r2, r7, lsl #2
  10370c:	e7983002 	ldr	r3, [r8, r2]
  103710:	e3530000 	cmp	r3, #0	; 0x0
  103714:	e0883002 	add	r3, r8, r2
  103718:	1a00000f 	bne	10375c <quorem+0x134>
  10371c:	e2432004 	sub	r2, r3, #4	; 0x4
  103720:	e1580002 	cmp	r8, r2
  103724:	2a00000a 	bcs	103754 <quorem+0x12c>
  103728:	e5133004 	ldr	r3, [r3, #-4]
  10372c:	e3530000 	cmp	r3, #0	; 0x0
  103730:	0a000003 	beq	103744 <quorem+0x11c>
  103734:	ea000006 	b	103754 <quorem+0x12c>
  103738:	e5923000 	ldr	r3, [r2]
  10373c:	e3530000 	cmp	r3, #0	; 0x0
  103740:	1a000003 	bne	103754 <quorem+0x12c>
  103744:	e2422004 	sub	r2, r2, #4	; 0x4
  103748:	e1580002 	cmp	r8, r2
  10374c:	e2477001 	sub	r7, r7, #1	; 0x1
  103750:	3afffff8 	bcc	103738 <quorem+0x110>
  103754:	e59d3000 	ldr	r3, [sp]
  103758:	e5837010 	str	r7, [r3, #16]
  10375c:	e1a0000a 	mov	r0, sl
  103760:	e28dd00c 	add	sp, sp, #12	; 0xc
  103764:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  103768:	e3a06000 	mov	r6, #0	; 0x0
  10376c:	e1a0e008 	mov	lr, r8
  103770:	e1a04005 	mov	r4, r5
  103774:	e1a0c006 	mov	ip, r6
  103778:	e4942004 	ldr	r2, [r4], #4
  10377c:	e1a03802 	mov	r3, r2, lsl #16
  103780:	e1a03823 	mov	r3, r3, lsr #16
  103784:	e021ca93 	mla	r1, r3, sl, ip
  103788:	e1a02822 	mov	r2, r2, lsr #16
  10378c:	e1a03821 	mov	r3, r1, lsr #16
  103790:	e02c3a92 	mla	ip, r2, sl, r3
  103794:	e59e0000 	ldr	r0, [lr]
  103798:	e1a01801 	mov	r1, r1, lsl #16
  10379c:	e1a02800 	mov	r2, r0, lsl #16
  1037a0:	e1a0380c 	mov	r3, ip, lsl #16
  1037a4:	e1a02822 	mov	r2, r2, lsr #16
  1037a8:	e1a01821 	mov	r1, r1, lsr #16
  1037ac:	e0612002 	rsb	r2, r1, r2
  1037b0:	e1a03823 	mov	r3, r3, lsr #16
  1037b4:	e0822006 	add	r2, r2, r6
  1037b8:	e0633820 	rsb	r3, r3, r0, lsr #16
  1037bc:	e0833842 	add	r3, r3, r2, asr #16
  1037c0:	e15b0004 	cmp	fp, r4
  1037c4:	e1ce30b2 	strh	r3, [lr, #2]
  1037c8:	e1a0c82c 	mov	ip, ip, lsr #16
  1037cc:	e0ce20b4 	strh	r2, [lr], #4
  1037d0:	e1a06843 	mov	r6, r3, asr #16
  1037d4:	2affffe7 	bcs	103778 <quorem+0x150>
  1037d8:	e59d3004 	ldr	r3, [sp, #4]
  1037dc:	e3530000 	cmp	r3, #0	; 0x0
  1037e0:	1affffa8 	bne	103688 <quorem+0x60>
  1037e4:	e59d1008 	ldr	r1, [sp, #8]
  1037e8:	e2412004 	sub	r2, r1, #4	; 0x4
  1037ec:	e1580002 	cmp	r8, r2
  1037f0:	2a00000a 	bcs	103820 <quorem+0x1f8>
  1037f4:	e5113004 	ldr	r3, [r1, #-4]
  1037f8:	e3530000 	cmp	r3, #0	; 0x0
  1037fc:	0a000003 	beq	103810 <quorem+0x1e8>
  103800:	ea000006 	b	103820 <quorem+0x1f8>
  103804:	e5923000 	ldr	r3, [r2]
  103808:	e3530000 	cmp	r3, #0	; 0x0
  10380c:	1a000003 	bne	103820 <quorem+0x1f8>
  103810:	e2422004 	sub	r2, r2, #4	; 0x4
  103814:	e1580002 	cmp	r8, r2
  103818:	e2477001 	sub	r7, r7, #1	; 0x1
  10381c:	3afffff8 	bcc	103804 <quorem+0x1dc>
  103820:	e59d2000 	ldr	r2, [sp]
  103824:	e5827010 	str	r7, [r2, #16]
  103828:	eaffff96 	b	103688 <quorem+0x60>

0010382c <_dtoa_r>:
  10382c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  103830:	e590c040 	ldr	ip, [r0, #64]
  103834:	e24dd050 	sub	sp, sp, #80	; 0x50
  103838:	e35c0000 	cmp	ip, #0	; 0x0
  10383c:	e58d0008 	str	r0, [sp, #8]
  103840:	e58d3004 	str	r3, [sp, #4]
  103844:	e1a08001 	mov	r8, r1
  103848:	e1a09002 	mov	r9, r2
  10384c:	e59d407c 	ldr	r4, [sp, #124]
  103850:	0a00000a 	beq	103880 <_dtoa_r+0x54>
  103854:	e5903044 	ldr	r3, [r0, #68]
  103858:	e58c3004 	str	r3, [ip, #4]
  10385c:	e5902044 	ldr	r2, [r0, #68]
  103860:	e3a03001 	mov	r3, #1	; 0x1
  103864:	e1a03213 	mov	r3, r3, lsl r2
  103868:	e1a0100c 	mov	r1, ip
  10386c:	e58c3008 	str	r3, [ip, #8]
  103870:	eb0008fe 	bl	105c70 <_Bfree>
  103874:	e59d2008 	ldr	r2, [sp, #8]
  103878:	e3a03000 	mov	r3, #0	; 0x0
  10387c:	e5823040 	str	r3, [r2, #64]
  103880:	e2583000 	subs	r3, r8, #0	; 0x0
  103884:	b3c38102 	biclt	r8, r3, #-2147483648	; 0x80000000
  103888:	a3a03000 	movge	r3, #0	; 0x0
  10388c:	b3a03001 	movlt	r3, #1	; 0x1
  103890:	e3c82102 	bic	r2, r8, #-2147483648	; 0x80000000
  103894:	b5843000 	strlt	r3, [r4]
  103898:	a5843000 	strge	r3, [r4]
  10389c:	e1a02a22 	mov	r2, r2, lsr #20
  1038a0:	e3a0347f 	mov	r3, #2130706432	; 0x7f000000
  1038a4:	e283360f 	add	r3, r3, #15728640	; 0xf00000
  1038a8:	e1a02a02 	mov	r2, r2, lsl #20
  1038ac:	e1520003 	cmp	r2, r3
  1038b0:	e1a04008 	mov	r4, r8
  1038b4:	0a000087 	beq	103ad8 <prog+0x3a94>
  1038b8:	e1a00008 	mov	r0, r8
  1038bc:	e1a01009 	mov	r1, r9
  1038c0:	e3a02000 	mov	r2, #0	; 0x0
  1038c4:	e3a03000 	mov	r3, #0	; 0x0
  1038c8:	e58d800c 	str	r8, [sp, #12]
  1038cc:	e58d9010 	str	r9, [sp, #16]
  1038d0:	eb0012d3 	bl	108424 <__nedf2>
  1038d4:	e3500000 	cmp	r0, #0	; 0x0
  1038d8:	1a00000b 	bne	10390c <_dtoa_r+0xe0>
  1038dc:	e59d2080 	ldr	r2, [sp, #128]
  1038e0:	e59dc078 	ldr	ip, [sp, #120]
  1038e4:	e3520000 	cmp	r2, #0	; 0x0
  1038e8:	e3a03001 	mov	r3, #1	; 0x1
  1038ec:	e58c3000 	str	r3, [ip]
  1038f0:	159de080 	ldrne	lr, [sp, #128]
  1038f4:	159f3448 	ldrne	r3, [pc, #1096]	; 103d44 <prog+0x3d00>
  1038f8:	059f0448 	ldreq	r0, [pc, #1096]	; 103d48 <prog+0x3d04>
  1038fc:	158e3000 	strne	r3, [lr]
  103900:	12430001 	subne	r0, r3, #1	; 0x1
  103904:	e28dd050 	add	sp, sp, #80	; 0x50
  103908:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10390c:	e28d100c 	add	r1, sp, #12	; 0xc
  103910:	e8910006 	ldmia	r1, {r1, r2}
  103914:	e28d3048 	add	r3, sp, #72	; 0x48
  103918:	e28dc04c 	add	ip, sp, #76	; 0x4c
  10391c:	e59d0008 	ldr	r0, [sp, #8]
  103920:	e58dc000 	str	ip, [sp]
  103924:	eb0009c7 	bl	106048 <_d2b>
  103928:	e1a03a28 	mov	r3, r8, lsr #20
  10392c:	e1a02a83 	mov	r2, r3, lsl #21
  103930:	e1a02aa2 	mov	r2, r2, lsr #21
  103934:	e3520000 	cmp	r2, #0	; 0x0
  103938:	e58d0038 	str	r0, [sp, #56]
  10393c:	0a00007c 	beq	103b34 <prog+0x3af0>
  103940:	e28d000c 	add	r0, sp, #12	; 0xc
  103944:	e8900003 	ldmia	r0, {r0, r1}
  103948:	e3c034ff 	bic	r3, r0, #-16777216	; 0xff000000
  10394c:	e2426fff 	sub	r6, r2, #1020	; 0x3fc
  103950:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  103954:	e3a02000 	mov	r2, #0	; 0x0
  103958:	e38305ff 	orr	r0, r3, #1069547520	; 0x3fc00000
  10395c:	e59d704c 	ldr	r7, [sp, #76]
  103960:	e58d2034 	str	r2, [sp, #52]
  103964:	e2466003 	sub	r6, r6, #3	; 0x3
  103968:	e3800603 	orr	r0, r0, #3145728	; 0x300000
  10396c:	e3a025ff 	mov	r2, #1069547520	; 0x3fc00000
  103970:	e282270e 	add	r2, r2, #3670016	; 0x380000
  103974:	e3a03000 	mov	r3, #0	; 0x0
  103978:	eb0010db 	bl	107cec <__subdf3>
  10397c:	e28f2fea 	add	r2, pc, #936	; 0x3a8
  103980:	e892000c 	ldmia	r2, {r2, r3}
  103984:	eb001117 	bl	107de8 <__muldf3>
  103988:	e28f2fe9 	add	r2, pc, #932	; 0x3a4
  10398c:	e892000c 	ldmia	r2, {r2, r3}
  103990:	eb0010ed 	bl	107d4c <__adddf3>
  103994:	e1a04000 	mov	r4, r0
  103998:	e1a00006 	mov	r0, r6
  10399c:	e1a05001 	mov	r5, r1
  1039a0:	eb001322 	bl	108630 <__floatsidf>
  1039a4:	e28f2e39 	add	r2, pc, #912	; 0x390
  1039a8:	e892000c 	ldmia	r2, {r2, r3}
  1039ac:	eb00110d 	bl	107de8 <__muldf3>
  1039b0:	e1a02000 	mov	r2, r0
  1039b4:	e1a03001 	mov	r3, r1
  1039b8:	e1a00004 	mov	r0, r4
  1039bc:	e1a01005 	mov	r1, r5
  1039c0:	eb0010e1 	bl	107d4c <__adddf3>
  1039c4:	e1a04000 	mov	r4, r0
  1039c8:	e1a05001 	mov	r5, r1
  1039cc:	eb001355 	bl	108728 <__fixdfsi>
  1039d0:	e1a01005 	mov	r1, r5
  1039d4:	e58d0024 	str	r0, [sp, #36]
  1039d8:	e3a02000 	mov	r2, #0	; 0x0
  1039dc:	e1a00004 	mov	r0, r4
  1039e0:	e3a03000 	mov	r3, #0	; 0x0
  1039e4:	eb0012f4 	bl	1085bc <__ltdf2>
  1039e8:	e3500000 	cmp	r0, #0	; 0x0
  1039ec:	ba0002fd 	blt	1045e8 <prog+0x45a4>
  1039f0:	e59de024 	ldr	lr, [sp, #36]
  1039f4:	e35e0016 	cmp	lr, #22	; 0x16
  1039f8:	83a00001 	movhi	r0, #1	; 0x1
  1039fc:	858d0028 	strhi	r0, [sp, #40]
  103a00:	8a00000e 	bhi	103a40 <_dtoa_r+0x214>
  103a04:	e59d2024 	ldr	r2, [sp, #36]
  103a08:	e59f1344 	ldr	r1, [pc, #836]	; 103d54 <prog+0x3d10>
  103a0c:	e0811182 	add	r1, r1, r2, lsl #3
  103a10:	e891000c 	ldmia	r1, {r2, r3}
  103a14:	e28d000c 	add	r0, sp, #12	; 0xc
  103a18:	e8900003 	ldmia	r0, {r0, r1}
  103a1c:	eb0012e6 	bl	1085bc <__ltdf2>
  103a20:	e3500000 	cmp	r0, #0	; 0x0
  103a24:	b59dc024 	ldrlt	ip, [sp, #36]
  103a28:	a3a03000 	movge	r3, #0	; 0x0
  103a2c:	b24cc001 	sublt	ip, ip, #1	; 0x1
  103a30:	b3a0e000 	movlt	lr, #0	; 0x0
  103a34:	a58d3028 	strge	r3, [sp, #40]
  103a38:	b58dc024 	strlt	ip, [sp, #36]
  103a3c:	b58de028 	strlt	lr, [sp, #40]
  103a40:	e0663007 	rsb	r3, r6, r7
  103a44:	e2532001 	subs	r2, r3, #1	; 0x1
  103a48:	e59d1024 	ldr	r1, [sp, #36]
  103a4c:	42622000 	rsbmi	r2, r2, #0	; 0x0
  103a50:	53a00000 	movpl	r0, #0	; 0x0
  103a54:	51a0b002 	movpl	fp, r2
  103a58:	458d2014 	strmi	r2, [sp, #20]
  103a5c:	43a0b000 	movmi	fp, #0	; 0x0
  103a60:	558d0014 	strpl	r0, [sp, #20]
  103a64:	e3510000 	cmp	r1, #0	; 0x0
  103a68:	a3a02000 	movge	r2, #0	; 0x0
  103a6c:	a08bb001 	addge	fp, fp, r1
  103a70:	a58d1030 	strge	r1, [sp, #48]
  103a74:	a58d2018 	strge	r2, [sp, #24]
  103a78:	ba0002e6 	blt	104618 <prog+0x45d4>
  103a7c:	e59d1004 	ldr	r1, [sp, #4]
  103a80:	e3510009 	cmp	r1, #9	; 0x9
  103a84:	83a02000 	movhi	r2, #0	; 0x0
  103a88:	858d2004 	strhi	r2, [sp, #4]
  103a8c:	83a05001 	movhi	r5, #1	; 0x1
  103a90:	8a00003e 	bhi	103b90 <prog+0x3b4c>
  103a94:	e59d3004 	ldr	r3, [sp, #4]
  103a98:	e3530005 	cmp	r3, #5	; 0x5
  103a9c:	c59dc004 	ldrgt	ip, [sp, #4]
  103aa0:	c24cc004 	subgt	ip, ip, #4	; 0x4
  103aa4:	c58dc004 	strgt	ip, [sp, #4]
  103aa8:	e59de004 	ldr	lr, [sp, #4]
  103aac:	d3a00001 	movle	r0, #1	; 0x1
  103ab0:	c3a00000 	movgt	r0, #0	; 0x0
  103ab4:	e35e0005 	cmp	lr, #5	; 0x5
  103ab8:	979ff10e 	ldrls	pc, [pc, lr, lsl #2]
  103abc:	ea000279 	b	1044a8 <prog+0x4464>
  103ac0:	00103b8c 	andeqs	r3, r0, ip, lsl #23
  103ac4:	00103b8c 	andeqs	r3, r0, ip, lsl #23
  103ac8:	00104598 	muleqs	r0, r8, r5
  103acc:	0010450c 	andeqs	r4, r0, ip, lsl #10
  103ad0:	00104550 	andeqs	r4, r0, r0, asr r5
  103ad4:	0010458c 	andeqs	r4, r0, ip, lsl #11
  103ad8:	e3a03c27 	mov	r3, #9984	; 0x2700
  103adc:	e59dc078 	ldr	ip, [sp, #120]
  103ae0:	e283300f 	add	r3, r3, #15	; 0xf
  103ae4:	e3590000 	cmp	r9, #0	; 0x0
  103ae8:	e58c3000 	str	r3, [ip]
  103aec:	0a00000a 	beq	103b1c <prog+0x3ad8>
  103af0:	e59f0254 	ldr	r0, [pc, #596]	; 103d4c <prog+0x3d08>
  103af4:	e59de080 	ldr	lr, [sp, #128]
  103af8:	e35e0000 	cmp	lr, #0	; 0x0
  103afc:	0affff80 	beq	103904 <_dtoa_r+0xd8>
  103b00:	e5d03003 	ldrb	r3, [r0, #3]
  103b04:	e59d1080 	ldr	r1, [sp, #128]
  103b08:	e3530000 	cmp	r3, #0	; 0x0
  103b0c:	e2803003 	add	r3, r0, #3	; 0x3
  103b10:	12803008 	addne	r3, r0, #8	; 0x8
  103b14:	e5813000 	str	r3, [r1]
  103b18:	eaffff79 	b	103904 <_dtoa_r+0xd8>
  103b1c:	e3c834ff 	bic	r3, r8, #-16777216	; 0xff000000
  103b20:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  103b24:	e3530000 	cmp	r3, #0	; 0x0
  103b28:	059f0220 	ldreq	r0, [pc, #544]	; 103d50 <prog+0x3d0c>
  103b2c:	0afffff0 	beq	103af4 <prog+0x3ab0>
  103b30:	eaffffee 	b	103af0 <prog+0x3aac>
  103b34:	e28d2048 	add	r2, sp, #72	; 0x48
  103b38:	e8920084 	ldmia	r2, {r2, r7}
  103b3c:	e2873e43 	add	r3, r7, #1072	; 0x430
  103b40:	e2833002 	add	r3, r3, #2	; 0x2
  103b44:	e0835002 	add	r5, r3, r2
  103b48:	e3550020 	cmp	r5, #32	; 0x20
  103b4c:	c2453020 	subgt	r3, r5, #32	; 0x20
  103b50:	c1a03339 	movgt	r3, r9, lsr r3
  103b54:	c2652040 	rsbgt	r2, r5, #64	; 0x40
  103b58:	d2653020 	rsble	r3, r5, #32	; 0x20
  103b5c:	c1834218 	orrgt	r4, r3, r8, lsl r2
  103b60:	d1a04319 	movle	r4, r9, lsl r3
  103b64:	e1a00004 	mov	r0, r4
  103b68:	eb0012b0 	bl	108630 <__floatsidf>
  103b6c:	e3540000 	cmp	r4, #0	; 0x0
  103b70:	ba0003c4 	blt	104a88 <prog+0x4a44>
  103b74:	e2456e43 	sub	r6, r5, #1072	; 0x430
  103b78:	e3a03001 	mov	r3, #1	; 0x1
  103b7c:	e2466003 	sub	r6, r6, #3	; 0x3
  103b80:	e240061f 	sub	r0, r0, #32505856	; 0x1f00000
  103b84:	e58d3034 	str	r3, [sp, #52]
  103b88:	eaffff77 	b	10396c <_dtoa_r+0x140>
  103b8c:	e1a05000 	mov	r5, r0
  103b90:	e3a03000 	mov	r3, #0	; 0x0
  103b94:	e3e0c000 	mvn	ip, #0	; 0x0
  103b98:	e3a0e001 	mov	lr, #1	; 0x1
  103b9c:	e58d3074 	str	r3, [sp, #116]
  103ba0:	e58dc020 	str	ip, [sp, #32]
  103ba4:	e58dc01c 	str	ip, [sp, #28]
  103ba8:	e58de02c 	str	lr, [sp, #44]
  103bac:	e1a04003 	mov	r4, r3
  103bb0:	e59dc008 	ldr	ip, [sp, #8]
  103bb4:	e3a03000 	mov	r3, #0	; 0x0
  103bb8:	e58c3044 	str	r3, [ip, #68]
  103bbc:	e59d0008 	ldr	r0, [sp, #8]
  103bc0:	e5901044 	ldr	r1, [r0, #68]
  103bc4:	eb0008f9 	bl	105fb0 <_Balloc>
  103bc8:	e59dc008 	ldr	ip, [sp, #8]
  103bcc:	e1150004 	tst	r5, r4
  103bd0:	e58d0040 	str	r0, [sp, #64]
  103bd4:	e58c0040 	str	r0, [ip, #64]
  103bd8:	0a0000d8 	beq	103f40 <prog+0x3efc>
  103bdc:	e59de024 	ldr	lr, [sp, #36]
  103be0:	e35e0000 	cmp	lr, #0	; 0x0
  103be4:	da000385 	ble	104a00 <prog+0x49bc>
  103be8:	e59f3164 	ldr	r3, [pc, #356]	; 103d54 <prog+0x3d10>
  103bec:	e20e200f 	and	r2, lr, #15	; 0xf
  103bf0:	e1a0424e 	mov	r4, lr, asr #4
  103bf4:	e0833182 	add	r3, r3, r2, lsl #3
  103bf8:	e3140010 	tst	r4, #16	; 0x10
  103bfc:	e8930060 	ldmia	r3, {r5, r6}
  103c00:	03a0a002 	moveq	sl, #2	; 0x2
  103c04:	1a0001b0 	bne	1042cc <prog+0x4288>
  103c08:	e3540000 	cmp	r4, #0	; 0x0
  103c0c:	0a00000c 	beq	103c44 <prog+0x3c00>
  103c10:	e59f7140 	ldr	r7, [pc, #320]	; 103d58 <prog+0x3d14>
  103c14:	e3140001 	tst	r4, #1	; 0x1
  103c18:	e1a00005 	mov	r0, r5
  103c1c:	e1a01006 	mov	r1, r6
  103c20:	0a000004 	beq	103c38 <prog+0x3bf4>
  103c24:	e897000c 	ldmia	r7, {r2, r3}
  103c28:	eb00106e 	bl	107de8 <__muldf3>
  103c2c:	e28aa001 	add	sl, sl, #1	; 0x1
  103c30:	e1a05000 	mov	r5, r0
  103c34:	e1a06001 	mov	r6, r1
  103c38:	e1b040c4 	movs	r4, r4, asr #1
  103c3c:	e2877008 	add	r7, r7, #8	; 0x8
  103c40:	1afffff3 	bne	103c14 <prog+0x3bd0>
  103c44:	e1a00008 	mov	r0, r8
  103c48:	e1a01009 	mov	r1, r9
  103c4c:	e1a02005 	mov	r2, r5
  103c50:	e1a03006 	mov	r3, r6
  103c54:	eb001147 	bl	108178 <__divdf3>
  103c58:	e1a08000 	mov	r8, r0
  103c5c:	e1a09001 	mov	r9, r1
  103c60:	e59d1028 	ldr	r1, [sp, #40]
  103c64:	e3510000 	cmp	r1, #0	; 0x0
  103c68:	0a00003b 	beq	103d5c <prog+0x3d18>
  103c6c:	e3a025ff 	mov	r2, #1069547520	; 0x3fc00000
  103c70:	e2822603 	add	r2, r2, #3145728	; 0x300000
  103c74:	e3a03000 	mov	r3, #0	; 0x0
  103c78:	e1a00008 	mov	r0, r8
  103c7c:	e1a01009 	mov	r1, r9
  103c80:	eb00124d 	bl	1085bc <__ltdf2>
  103c84:	e59d201c 	ldr	r2, [sp, #28]
  103c88:	e3500000 	cmp	r0, #0	; 0x0
  103c8c:	e3a03000 	mov	r3, #0	; 0x0
  103c90:	b3a03001 	movlt	r3, #1	; 0x1
  103c94:	e3520000 	cmp	r2, #0	; 0x0
  103c98:	d3a03000 	movle	r3, #0	; 0x0
  103c9c:	c2033001 	andgt	r3, r3, #1	; 0x1
  103ca0:	e3530000 	cmp	r3, #0	; 0x0
  103ca4:	e1a04008 	mov	r4, r8
  103ca8:	e1a05009 	mov	r5, r9
  103cac:	0a00002a 	beq	103d5c <prog+0x3d18>
  103cb0:	e59d3020 	ldr	r3, [sp, #32]
  103cb4:	e3530000 	cmp	r3, #0	; 0x0
  103cb8:	da00009e 	ble	103f38 <prog+0x3ef4>
  103cbc:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103cc0:	e2822709 	add	r2, r2, #2359296	; 0x240000
  103cc4:	e3a03000 	mov	r3, #0	; 0x0
  103cc8:	e1a00008 	mov	r0, r8
  103ccc:	e1a01009 	mov	r1, r9
  103cd0:	eb001044 	bl	107de8 <__muldf3>
  103cd4:	e1a04000 	mov	r4, r0
  103cd8:	e28a0001 	add	r0, sl, #1	; 0x1
  103cdc:	e1a05001 	mov	r5, r1
  103ce0:	eb001252 	bl	108630 <__floatsidf>
  103ce4:	e1a02000 	mov	r2, r0
  103ce8:	e1a03001 	mov	r3, r1
  103cec:	e1a00004 	mov	r0, r4
  103cf0:	e1a01005 	mov	r1, r5
  103cf4:	eb00103b 	bl	107de8 <__muldf3>
  103cf8:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103cfc:	e2822707 	add	r2, r2, #1835008	; 0x1c0000
  103d00:	e3a03000 	mov	r3, #0	; 0x0
  103d04:	eb001010 	bl	107d4c <__adddf3>
  103d08:	e28da020 	add	sl, sp, #32	; 0x20
  103d0c:	e89a1400 	ldmia	sl, {sl, ip}
  103d10:	e24cc001 	sub	ip, ip, #1	; 0x1
  103d14:	e1a07001 	mov	r7, r1
  103d18:	e1a08004 	mov	r8, r4
  103d1c:	e1a09005 	mov	r9, r5
  103d20:	e240650d 	sub	r6, r0, #54525952	; 0x3400000
  103d24:	e58dc044 	str	ip, [sp, #68]
  103d28:	ea00001c 	b	103da0 <prog+0x3d5c>
  103d2c:	3fd287a7 	swicc	0x00d287a7
  103d30:	636f4361 	cmnvs	pc, #-2080374783	; 0x84000001
  103d34:	3fc68a28 	swicc	0x00c68a28
  103d38:	8b60c8b3 	blhi	193600c <__stack_end__+0x1732010>
  103d3c:	3fd34413 	swicc	0x00d34413
  103d40:	509f79fb 	ldrplsh	r7, [pc], fp
  103d44:	0010cf4d 	andeqs	ip, r0, sp, asr #30
  103d48:	0010cf4c 	andeqs	ip, r0, ip, asr #30
  103d4c:	0010cf88 	andeqs	ip, r0, r8, lsl #31
  103d50:	0010cf7c 	andeqs	ip, r0, ip, ror pc
  103d54:	0010c868 	andeqs	ip, r0, r8, ror #16
  103d58:	0010c930 	andeqs	ip, r0, r0, lsr r9
  103d5c:	e1a0000a 	mov	r0, sl
  103d60:	eb001232 	bl	108630 <__floatsidf>
  103d64:	e1a02008 	mov	r2, r8
  103d68:	e1a03009 	mov	r3, r9
  103d6c:	eb00101d 	bl	107de8 <__muldf3>
  103d70:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103d74:	e2822707 	add	r2, r2, #1835008	; 0x1c0000
  103d78:	e3a03000 	mov	r3, #0	; 0x0
  103d7c:	eb000ff2 	bl	107d4c <__adddf3>
  103d80:	e59de01c 	ldr	lr, [sp, #28]
  103d84:	e35e0000 	cmp	lr, #0	; 0x0
  103d88:	e1a07001 	mov	r7, r1
  103d8c:	e240650d 	sub	r6, r0, #54525952	; 0x3400000
  103d90:	0a000158 	beq	1042f8 <prog+0x42b4>
  103d94:	e59d0024 	ldr	r0, [sp, #36]
  103d98:	e59da01c 	ldr	sl, [sp, #28]
  103d9c:	e58d0044 	str	r0, [sp, #68]
  103da0:	e59d102c 	ldr	r1, [sp, #44]
  103da4:	e3510000 	cmp	r1, #0	; 0x0
  103da8:	0a0002c1 	beq	1048b4 <prog+0x4870>
  103dac:	e51f1060 	ldr	r1, [pc, #-96]	; 103d54 <prog+0x3d10>
  103db0:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  103db4:	e081118a 	add	r1, r1, sl, lsl #3
  103db8:	e911000c 	ldmdb	r1, {r2, r3}
  103dbc:	e2800602 	add	r0, r0, #2097152	; 0x200000
  103dc0:	e3a01000 	mov	r1, #0	; 0x0
  103dc4:	eb0010eb 	bl	108178 <__divdf3>
  103dc8:	e1a02006 	mov	r2, r6
  103dcc:	e1a03007 	mov	r3, r7
  103dd0:	eb000fc5 	bl	107cec <__subdf3>
  103dd4:	e1a06008 	mov	r6, r8
  103dd8:	e1a07009 	mov	r7, r9
  103ddc:	e1a08000 	mov	r8, r0
  103de0:	e1a09001 	mov	r9, r1
  103de4:	e1a00006 	mov	r0, r6
  103de8:	e1a01007 	mov	r1, r7
  103dec:	eb00124d 	bl	108728 <__fixdfsi>
  103df0:	e1a04000 	mov	r4, r0
  103df4:	eb00120d 	bl	108630 <__floatsidf>
  103df8:	e1a02000 	mov	r2, r0
  103dfc:	e1a03001 	mov	r3, r1
  103e00:	e1a00006 	mov	r0, r6
  103e04:	e1a01007 	mov	r1, r7
  103e08:	eb000fb7 	bl	107cec <__subdf3>
  103e0c:	e59d7040 	ldr	r7, [sp, #64]
  103e10:	e2844030 	add	r4, r4, #48	; 0x30
  103e14:	e4c74001 	strb	r4, [r7], #1
  103e18:	e1a02008 	mov	r2, r8
  103e1c:	e1a03009 	mov	r3, r9
  103e20:	e1a05000 	mov	r5, r0
  103e24:	e1a06001 	mov	r6, r1
  103e28:	eb0011e3 	bl	1085bc <__ltdf2>
  103e2c:	e3500000 	cmp	r0, #0	; 0x0
  103e30:	ba00003d 	blt	103f2c <prog+0x3ee8>
  103e34:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  103e38:	e1a02005 	mov	r2, r5
  103e3c:	e1a03006 	mov	r3, r6
  103e40:	e2800603 	add	r0, r0, #3145728	; 0x300000
  103e44:	e3a01000 	mov	r1, #0	; 0x0
  103e48:	eb000fa7 	bl	107cec <__subdf3>
  103e4c:	e1a02008 	mov	r2, r8
  103e50:	e1a03009 	mov	r3, r9
  103e54:	eb0011d8 	bl	1085bc <__ltdf2>
  103e58:	e3500000 	cmp	r0, #0	; 0x0
  103e5c:	ba000088 	blt	104084 <prog+0x4040>
  103e60:	e35a0001 	cmp	sl, #1	; 0x1
  103e64:	ca00000a 	bgt	103e94 <prog+0x3e50>
  103e68:	ea000032 	b	103f38 <prog+0x3ef4>
  103e6c:	eb000f9e 	bl	107cec <__subdf3>
  103e70:	e1a02008 	mov	r2, r8
  103e74:	e1a03009 	mov	r3, r9
  103e78:	eb0011cf 	bl	1085bc <__ltdf2>
  103e7c:	e59d2040 	ldr	r2, [sp, #64]
  103e80:	e3500000 	cmp	r0, #0	; 0x0
  103e84:	e08a3002 	add	r3, sl, r2
  103e88:	ba00007d 	blt	104084 <prog+0x4040>
  103e8c:	e1570003 	cmp	r7, r3
  103e90:	0a000028 	beq	103f38 <prog+0x3ef4>
  103e94:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103e98:	e1a00008 	mov	r0, r8
  103e9c:	e1a01009 	mov	r1, r9
  103ea0:	e2822709 	add	r2, r2, #2359296	; 0x240000
  103ea4:	e3a03000 	mov	r3, #0	; 0x0
  103ea8:	eb000fce 	bl	107de8 <__muldf3>
  103eac:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103eb0:	e2822709 	add	r2, r2, #2359296	; 0x240000
  103eb4:	e3a03000 	mov	r3, #0	; 0x0
  103eb8:	e1a08000 	mov	r8, r0
  103ebc:	e1a09001 	mov	r9, r1
  103ec0:	e1a00005 	mov	r0, r5
  103ec4:	e1a01006 	mov	r1, r6
  103ec8:	eb000fc6 	bl	107de8 <__muldf3>
  103ecc:	e1a06001 	mov	r6, r1
  103ed0:	e1a05000 	mov	r5, r0
  103ed4:	eb001213 	bl	108728 <__fixdfsi>
  103ed8:	e1a04000 	mov	r4, r0
  103edc:	eb0011d3 	bl	108630 <__floatsidf>
  103ee0:	e1a02000 	mov	r2, r0
  103ee4:	e1a03001 	mov	r3, r1
  103ee8:	e1a00005 	mov	r0, r5
  103eec:	e1a01006 	mov	r1, r6
  103ef0:	eb000f7d 	bl	107cec <__subdf3>
  103ef4:	e2844030 	add	r4, r4, #48	; 0x30
  103ef8:	e1a02008 	mov	r2, r8
  103efc:	e1a03009 	mov	r3, r9
  103f00:	e4c74001 	strb	r4, [r7], #1
  103f04:	e1a06001 	mov	r6, r1
  103f08:	e1a05000 	mov	r5, r0
  103f0c:	eb0011aa 	bl	1085bc <__ltdf2>
  103f10:	e3500000 	cmp	r0, #0	; 0x0
  103f14:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  103f18:	e1a02005 	mov	r2, r5
  103f1c:	e1a03006 	mov	r3, r6
  103f20:	e2800603 	add	r0, r0, #3145728	; 0x300000
  103f24:	e3a01000 	mov	r1, #0	; 0x0
  103f28:	aaffffcf 	bge	103e6c <prog+0x3e28>
  103f2c:	e59d3044 	ldr	r3, [sp, #68]
  103f30:	e58d3024 	str	r3, [sp, #36]
  103f34:	ea00011a 	b	1043a4 <prog+0x4360>
  103f38:	e28d800c 	add	r8, sp, #12	; 0xc
  103f3c:	e8980300 	ldmia	r8, {r8, r9}
  103f40:	e59d2048 	ldr	r2, [sp, #72]
  103f44:	e59de024 	ldr	lr, [sp, #36]
  103f48:	e1e03002 	mvn	r3, r2
  103f4c:	e1a03fa3 	mov	r3, r3, lsr #31
  103f50:	e35e000e 	cmp	lr, #14	; 0xe
  103f54:	c3a03000 	movgt	r3, #0	; 0x0
  103f58:	e3530000 	cmp	r3, #0	; 0x0
  103f5c:	0a00005d 	beq	1040d8 <prog+0x4094>
  103f60:	e59d001c 	ldr	r0, [sp, #28]
  103f64:	e59d1074 	ldr	r1, [sp, #116]
  103f68:	e51f321c 	ldr	r3, [pc, #-540]	; 103d54 <prog+0x3d10>
  103f6c:	e3500000 	cmp	r0, #0	; 0x0
  103f70:	c3a02000 	movgt	r2, #0	; 0x0
  103f74:	d3a02001 	movle	r2, #1	; 0x1
  103f78:	e083318e 	add	r3, r3, lr, lsl #3
  103f7c:	e0121fa1 	ands	r1, r2, r1, lsr #31
  103f80:	e8930c00 	ldmia	r3, {sl, fp}
  103f84:	1a000137 	bne	104468 <prog+0x4424>
  103f88:	e59d3040 	ldr	r3, [sp, #64]
  103f8c:	e59d201c 	ldr	r2, [sp, #28]
  103f90:	e1a04008 	mov	r4, r8
  103f94:	e1a05009 	mov	r5, r9
  103f98:	e0828003 	add	r8, r2, r3
  103f9c:	e1a07003 	mov	r7, r3
  103fa0:	ea000007 	b	103fc4 <prog+0x3f80>
  103fa4:	eb000f8f 	bl	107de8 <__muldf3>
  103fa8:	e3a02000 	mov	r2, #0	; 0x0
  103fac:	e3a03000 	mov	r3, #0	; 0x0
  103fb0:	e1a04000 	mov	r4, r0
  103fb4:	e1a05001 	mov	r5, r1
  103fb8:	eb001119 	bl	108424 <__nedf2>
  103fbc:	e3500000 	cmp	r0, #0	; 0x0
  103fc0:	0a0000f7 	beq	1043a4 <prog+0x4360>
  103fc4:	e1a0200a 	mov	r2, sl
  103fc8:	e1a0300b 	mov	r3, fp
  103fcc:	e1a00004 	mov	r0, r4
  103fd0:	e1a01005 	mov	r1, r5
  103fd4:	eb001067 	bl	108178 <__divdf3>
  103fd8:	eb0011d2 	bl	108728 <__fixdfsi>
  103fdc:	e1a06000 	mov	r6, r0
  103fe0:	eb001192 	bl	108630 <__floatsidf>
  103fe4:	e1a02000 	mov	r2, r0
  103fe8:	e1a03001 	mov	r3, r1
  103fec:	e1a0000a 	mov	r0, sl
  103ff0:	e1a0100b 	mov	r1, fp
  103ff4:	eb000f7b 	bl	107de8 <__muldf3>
  103ff8:	e1a02000 	mov	r2, r0
  103ffc:	e1a03001 	mov	r3, r1
  104000:	e1a00004 	mov	r0, r4
  104004:	e1a01005 	mov	r1, r5
  104008:	eb000f37 	bl	107cec <__subdf3>
  10400c:	e286c030 	add	ip, r6, #48	; 0x30
  104010:	e4c7c001 	strb	ip, [r7], #1
  104014:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  104018:	e1580007 	cmp	r8, r7
  10401c:	e2822709 	add	r2, r2, #2359296	; 0x240000
  104020:	e3a03000 	mov	r3, #0	; 0x0
  104024:	1affffde 	bne	103fa4 <prog+0x3f60>
  104028:	e1a02000 	mov	r2, r0
  10402c:	e1a03001 	mov	r3, r1
  104030:	eb000f45 	bl	107d4c <__adddf3>
  104034:	e1a04000 	mov	r4, r0
  104038:	e1a05001 	mov	r5, r1
  10403c:	e1a0000a 	mov	r0, sl
  104040:	e1a0100b 	mov	r1, fp
  104044:	e1a02004 	mov	r2, r4
  104048:	e1a03005 	mov	r3, r5
  10404c:	eb00115a 	bl	1085bc <__ltdf2>
  104050:	e3500000 	cmp	r0, #0	; 0x0
  104054:	ba000008 	blt	10407c <prog+0x4038>
  104058:	e1a0000a 	mov	r0, sl
  10405c:	e1a0100b 	mov	r1, fp
  104060:	e1a02004 	mov	r2, r4
  104064:	e1a03005 	mov	r3, r5
  104068:	eb0010cb 	bl	10839c <__eqdf2>
  10406c:	e3500000 	cmp	r0, #0	; 0x0
  104070:	1a0000cb 	bne	1043a4 <prog+0x4360>
  104074:	e3160001 	tst	r6, #1	; 0x1
  104078:	0a0000c9 	beq	1043a4 <prog+0x4360>
  10407c:	e59d0024 	ldr	r0, [sp, #36]
  104080:	e58d0044 	str	r0, [sp, #68]
  104084:	e1a02007 	mov	r2, r7
  104088:	e59d3040 	ldr	r3, [sp, #64]
  10408c:	e0671003 	rsb	r1, r7, r3
  104090:	e5723001 	ldrb	r3, [r2, #-1]!
  104094:	e3530039 	cmp	r3, #57	; 0x39
  104098:	1a000008 	bne	1040c0 <prog+0x407c>
  10409c:	e59dc040 	ldr	ip, [sp, #64]
  1040a0:	e15c0002 	cmp	ip, r2
  1040a4:	1afffff7 	bne	104088 <prog+0x4044>
  1040a8:	e3a03030 	mov	r3, #48	; 0x30
  1040ac:	e5cc3000 	strb	r3, [ip]
  1040b0:	e59de044 	ldr	lr, [sp, #68]
  1040b4:	e28ee001 	add	lr, lr, #1	; 0x1
  1040b8:	e7d13007 	ldrb	r3, [r1, r7]
  1040bc:	e58de044 	str	lr, [sp, #68]
  1040c0:	e2833001 	add	r3, r3, #1	; 0x1
  1040c4:	e4c23001 	strb	r3, [r2], #1
  1040c8:	e59dc044 	ldr	ip, [sp, #68]
  1040cc:	e1a07002 	mov	r7, r2
  1040d0:	e58dc024 	str	ip, [sp, #36]
  1040d4:	ea0000b2 	b	1043a4 <prog+0x4360>
  1040d8:	e59de02c 	ldr	lr, [sp, #44]
  1040dc:	e35e0000 	cmp	lr, #0	; 0x0
  1040e0:	1a0000bf 	bne	1043e4 <prog+0x43a0>
  1040e4:	e59d7014 	ldr	r7, [sp, #20]
  1040e8:	e59d5018 	ldr	r5, [sp, #24]
  1040ec:	e1a0a00e 	mov	sl, lr
  1040f0:	e3570000 	cmp	r7, #0	; 0x0
  1040f4:	c35b0000 	cmpgt	fp, #0	; 0x0
  1040f8:	da000007 	ble	10411c <prog+0x40d8>
  1040fc:	e59de014 	ldr	lr, [sp, #20]
  104100:	e157000b 	cmp	r7, fp
  104104:	b1a03007 	movlt	r3, r7
  104108:	a1a0300b 	movge	r3, fp
  10410c:	e063e00e 	rsb	lr, r3, lr
  104110:	e58de014 	str	lr, [sp, #20]
  104114:	e063b00b 	rsb	fp, r3, fp
  104118:	e0637007 	rsb	r7, r3, r7
  10411c:	e59d0018 	ldr	r0, [sp, #24]
  104120:	e3500000 	cmp	r0, #0	; 0x0
  104124:	da000015 	ble	104180 <prog+0x413c>
  104128:	e59d102c 	ldr	r1, [sp, #44]
  10412c:	e3510000 	cmp	r1, #0	; 0x0
  104130:	0a00027b 	beq	104b24 <prog+0x4ae0>
  104134:	e3550000 	cmp	r5, #0	; 0x0
  104138:	da00000d 	ble	104174 <prog+0x4130>
  10413c:	e1a0100a 	mov	r1, sl
  104140:	e1a02005 	mov	r2, r5
  104144:	e59d0008 	ldr	r0, [sp, #8]
  104148:	eb00093f 	bl	10664c <_pow5mult>
  10414c:	e1a0a000 	mov	sl, r0
  104150:	e1a0100a 	mov	r1, sl
  104154:	e59d2038 	ldr	r2, [sp, #56]
  104158:	e59d0008 	ldr	r0, [sp, #8]
  10415c:	eb000890 	bl	1063a4 <_multiply>
  104160:	e59d1038 	ldr	r1, [sp, #56]
  104164:	e1a04000 	mov	r4, r0
  104168:	e59d0008 	ldr	r0, [sp, #8]
  10416c:	eb0006bf 	bl	105c70 <_Bfree>
  104170:	e58d4038 	str	r4, [sp, #56]
  104174:	e59d3018 	ldr	r3, [sp, #24]
  104178:	e0532005 	subs	r2, r3, r5
  10417c:	1a000270 	bne	104b44 <prog+0x4b00>
  104180:	e59d0008 	ldr	r0, [sp, #8]
  104184:	e3a01001 	mov	r1, #1	; 0x1
  104188:	eb0008f5 	bl	106564 <_i2b>
  10418c:	e59dc030 	ldr	ip, [sp, #48]
  104190:	e35c0000 	cmp	ip, #0	; 0x0
  104194:	e1a06000 	mov	r6, r0
  104198:	da000004 	ble	1041b0 <prog+0x416c>
  10419c:	e1a01000 	mov	r1, r0
  1041a0:	e1a0200c 	mov	r2, ip
  1041a4:	e59d0008 	ldr	r0, [sp, #8]
  1041a8:	eb000927 	bl	10664c <_pow5mult>
  1041ac:	e1a06000 	mov	r6, r0
  1041b0:	e59de004 	ldr	lr, [sp, #4]
  1041b4:	e35e0001 	cmp	lr, #1	; 0x1
  1041b8:	da0000f9 	ble	1045a4 <prog+0x4560>
  1041bc:	e3a04000 	mov	r4, #0	; 0x0
  1041c0:	e59d1030 	ldr	r1, [sp, #48]
  1041c4:	e3510000 	cmp	r1, #0	; 0x0
  1041c8:	03a03001 	moveq	r3, #1	; 0x1
  1041cc:	1a000232 	bne	104a9c <prog+0x4a58>
  1041d0:	e08b3003 	add	r3, fp, r3
  1041d4:	e213301f 	ands	r3, r3, #31	; 0x1f
  1041d8:	03a0301c 	moveq	r3, #28	; 0x1c
  1041dc:	0a000119 	beq	104648 <prog+0x4604>
  1041e0:	e2633020 	rsb	r3, r3, #32	; 0x20
  1041e4:	e3530004 	cmp	r3, #4	; 0x4
  1041e8:	da000113 	ble	10463c <prog+0x45f8>
  1041ec:	e59d2014 	ldr	r2, [sp, #20]
  1041f0:	e2433004 	sub	r3, r3, #4	; 0x4
  1041f4:	e0822003 	add	r2, r2, r3
  1041f8:	e58d2014 	str	r2, [sp, #20]
  1041fc:	e08bb003 	add	fp, fp, r3
  104200:	e0877003 	add	r7, r7, r3
  104204:	e59de014 	ldr	lr, [sp, #20]
  104208:	e35e0000 	cmp	lr, #0	; 0x0
  10420c:	da000004 	ble	104224 <prog+0x41e0>
  104210:	e59d1038 	ldr	r1, [sp, #56]
  104214:	e1a0200e 	mov	r2, lr
  104218:	e59d0008 	ldr	r0, [sp, #8]
  10421c:	eb000823 	bl	1062b0 <_lshift>
  104220:	e58d0038 	str	r0, [sp, #56]
  104224:	e35b0000 	cmp	fp, #0	; 0x0
  104228:	da000004 	ble	104240 <prog+0x41fc>
  10422c:	e1a01006 	mov	r1, r6
  104230:	e1a0200b 	mov	r2, fp
  104234:	e59d0008 	ldr	r0, [sp, #8]
  104238:	eb00081c 	bl	1062b0 <_lshift>
  10423c:	e1a06000 	mov	r6, r0
  104240:	e59d0028 	ldr	r0, [sp, #40]
  104244:	e3500000 	cmp	r0, #0	; 0x0
  104248:	1a000219 	bne	104ab4 <prog+0x4a70>
  10424c:	e59de01c 	ldr	lr, [sp, #28]
  104250:	e59d0004 	ldr	r0, [sp, #4]
  104254:	e35e0000 	cmp	lr, #0	; 0x0
  104258:	c3a03000 	movgt	r3, #0	; 0x0
  10425c:	d3a03001 	movle	r3, #1	; 0x1
  104260:	e3500002 	cmp	r0, #2	; 0x2
  104264:	d3a03000 	movle	r3, #0	; 0x0
  104268:	e3530000 	cmp	r3, #0	; 0x0
  10426c:	0a0000fb 	beq	104660 <prog+0x461c>
  104270:	e35e0000 	cmp	lr, #0	; 0x0
  104274:	ba000037 	blt	104358 <prog+0x4314>
  104278:	e1a01006 	mov	r1, r6
  10427c:	e3a02005 	mov	r2, #5	; 0x5
  104280:	e3a03000 	mov	r3, #0	; 0x0
  104284:	e59d0008 	ldr	r0, [sp, #8]
  104288:	eb0008bd 	bl	106584 <_multadd>
  10428c:	e1a06000 	mov	r6, r0
  104290:	e1a01006 	mov	r1, r6
  104294:	e59d0038 	ldr	r0, [sp, #56]
  104298:	eb0006b6 	bl	105d78 <__mcmp>
  10429c:	e3500000 	cmp	r0, #0	; 0x0
  1042a0:	da00002c 	ble	104358 <prog+0x4314>
  1042a4:	e59d7040 	ldr	r7, [sp, #64]
  1042a8:	e3a03031 	mov	r3, #49	; 0x31
  1042ac:	e4c73001 	strb	r3, [r7], #1
  1042b0:	e59d3024 	ldr	r3, [sp, #36]
  1042b4:	e3a0c000 	mov	ip, #0	; 0x0
  1042b8:	e2833001 	add	r3, r3, #1	; 0x1
  1042bc:	e1a0b00a 	mov	fp, sl
  1042c0:	e58d3024 	str	r3, [sp, #36]
  1042c4:	e58dc03c 	str	ip, [sp, #60]
  1042c8:	ea000029 	b	104374 <prog+0x4330>
  1042cc:	e51f157c 	ldr	r1, [pc, #-1404]	; 103d58 <prog+0x3d14>
  1042d0:	e2812020 	add	r2, r1, #32	; 0x20
  1042d4:	e892000c 	ldmia	r2, {r2, r3}
  1042d8:	e28d000c 	add	r0, sp, #12	; 0xc
  1042dc:	e8900003 	ldmia	r0, {r0, r1}
  1042e0:	eb000fa4 	bl	108178 <__divdf3>
  1042e4:	e204400f 	and	r4, r4, #15	; 0xf
  1042e8:	e1a08000 	mov	r8, r0
  1042ec:	e1a09001 	mov	r9, r1
  1042f0:	e3a0a003 	mov	sl, #3	; 0x3
  1042f4:	eafffe43 	b	103c08 <prog+0x3bc4>
  1042f8:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  1042fc:	e1a00008 	mov	r0, r8
  104300:	e1a01009 	mov	r1, r9
  104304:	e2822705 	add	r2, r2, #1310720	; 0x140000
  104308:	e3a03000 	mov	r3, #0	; 0x0
  10430c:	eb000e76 	bl	107cec <__subdf3>
  104310:	e1a02006 	mov	r2, r6
  104314:	e1a03007 	mov	r3, r7
  104318:	e1a08000 	mov	r8, r0
  10431c:	e1a09001 	mov	r9, r1
  104320:	eb001061 	bl	1084ac <__gtdf2>
  104324:	e3500000 	cmp	r0, #0	; 0x0
  104328:	e1a04006 	mov	r4, r6
  10432c:	e1a05007 	mov	r5, r7
  104330:	ca000059 	bgt	10449c <prog+0x4458>
  104334:	e2862102 	add	r2, r6, #-2147483648	; 0x80000000
  104338:	e1a03007 	mov	r3, r7
  10433c:	e1a00008 	mov	r0, r8
  104340:	e1a01009 	mov	r1, r9
  104344:	eb00109c 	bl	1085bc <__ltdf2>
  104348:	e3500000 	cmp	r0, #0	; 0x0
  10434c:	aafffef9 	bge	103f38 <prog+0x3ef4>
  104350:	e3a06000 	mov	r6, #0	; 0x0
  104354:	e1a0a006 	mov	sl, r6
  104358:	e59d1074 	ldr	r1, [sp, #116]
  10435c:	e3a02000 	mov	r2, #0	; 0x0
  104360:	e1e01001 	mvn	r1, r1
  104364:	e58d1024 	str	r1, [sp, #36]
  104368:	e59d7040 	ldr	r7, [sp, #64]
  10436c:	e58d203c 	str	r2, [sp, #60]
  104370:	e1a0b00a 	mov	fp, sl
  104374:	e1a01006 	mov	r1, r6
  104378:	e59d0008 	ldr	r0, [sp, #8]
  10437c:	eb00063b 	bl	105c70 <_Bfree>
  104380:	e35b0000 	cmp	fp, #0	; 0x0
  104384:	0a000006 	beq	1043a4 <prog+0x4360>
  104388:	e59d203c 	ldr	r2, [sp, #60]
  10438c:	e3520000 	cmp	r2, #0	; 0x0
  104390:	1152000b 	cmpne	r2, fp
  104394:	1a000142 	bne	1048a4 <prog+0x4860>
  104398:	e1a0100b 	mov	r1, fp
  10439c:	e59d0008 	ldr	r0, [sp, #8]
  1043a0:	eb000632 	bl	105c70 <_Bfree>
  1043a4:	e59d1038 	ldr	r1, [sp, #56]
  1043a8:	e59d0008 	ldr	r0, [sp, #8]
  1043ac:	eb00062f 	bl	105c70 <_Bfree>
  1043b0:	e3a03000 	mov	r3, #0	; 0x0
  1043b4:	e59dc024 	ldr	ip, [sp, #36]
  1043b8:	e59de080 	ldr	lr, [sp, #128]
  1043bc:	e5c73000 	strb	r3, [r7]
  1043c0:	e59d0078 	ldr	r0, [sp, #120]
  1043c4:	e35e0000 	cmp	lr, #0	; 0x0
  1043c8:	e28c2001 	add	r2, ip, #1	; 0x1
  1043cc:	e5802000 	str	r2, [r0]
  1043d0:	159d1080 	ldrne	r1, [sp, #128]
  1043d4:	059d0040 	ldreq	r0, [sp, #64]
  1043d8:	159d0040 	ldrne	r0, [sp, #64]
  1043dc:	15817000 	strne	r7, [r1]
  1043e0:	eafffd47 	b	103904 <_dtoa_r+0xd8>
  1043e4:	e59d0004 	ldr	r0, [sp, #4]
  1043e8:	e3500001 	cmp	r0, #1	; 0x1
  1043ec:	da0001d9 	ble	104b58 <prog+0x4b14>
  1043f0:	e59d301c 	ldr	r3, [sp, #28]
  1043f4:	e59dc018 	ldr	ip, [sp, #24]
  1043f8:	e2432001 	sub	r2, r3, #1	; 0x1
  1043fc:	e15c0002 	cmp	ip, r2
  104400:	b59de018 	ldrlt	lr, [sp, #24]
  104404:	b59d0030 	ldrlt	r0, [sp, #48]
  104408:	b06e3002 	rsblt	r3, lr, r2
  10440c:	e59d101c 	ldr	r1, [sp, #28]
  104410:	b08ee003 	addlt	lr, lr, r3
  104414:	b0800003 	addlt	r0, r0, r3
  104418:	a062500c 	rsbge	r5, r2, ip
  10441c:	b58de018 	strlt	lr, [sp, #24]
  104420:	b58d0030 	strlt	r0, [sp, #48]
  104424:	b3a05000 	movlt	r5, #0	; 0x0
  104428:	e3510000 	cmp	r1, #0	; 0x0
  10442c:	b59d301c 	ldrlt	r3, [sp, #28]
  104430:	b59d2014 	ldrlt	r2, [sp, #20]
  104434:	a59d7014 	ldrge	r7, [sp, #20]
  104438:	b0637002 	rsblt	r7, r3, r2
  10443c:	a1a03001 	movge	r3, r1
  104440:	b3a03000 	movlt	r3, #0	; 0x0
  104444:	e59dc014 	ldr	ip, [sp, #20]
  104448:	e59d0008 	ldr	r0, [sp, #8]
  10444c:	e08cc003 	add	ip, ip, r3
  104450:	e3a01001 	mov	r1, #1	; 0x1
  104454:	e08bb003 	add	fp, fp, r3
  104458:	e58dc014 	str	ip, [sp, #20]
  10445c:	eb000840 	bl	106564 <_i2b>
  104460:	e1a0a000 	mov	sl, r0
  104464:	eaffff21 	b	1040f0 <prog+0x40ac>
  104468:	e3500000 	cmp	r0, #0	; 0x0
  10446c:	baffffb7 	blt	104350 <prog+0x430c>
  104470:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  104474:	e2822705 	add	r2, r2, #1310720	; 0x140000
  104478:	e3a03000 	mov	r3, #0	; 0x0
  10447c:	e1a0000a 	mov	r0, sl
  104480:	e1a0100b 	mov	r1, fp
  104484:	eb000e57 	bl	107de8 <__muldf3>
  104488:	e1a02008 	mov	r2, r8
  10448c:	e1a03009 	mov	r3, r9
  104490:	eb001027 	bl	108534 <__gedf2>
  104494:	e3500000 	cmp	r0, #0	; 0x0
  104498:	aaffffac 	bge	104350 <prog+0x430c>
  10449c:	e3a06000 	mov	r6, #0	; 0x0
  1044a0:	e1a0a006 	mov	sl, r6
  1044a4:	eaffff7e 	b	1042a4 <prog+0x4260>
  1044a8:	e3e02000 	mvn	r2, #0	; 0x0
  1044ac:	e3a03001 	mov	r3, #1	; 0x1
  1044b0:	e58d2020 	str	r2, [sp, #32]
  1044b4:	e58d201c 	str	r2, [sp, #28]
  1044b8:	e58d302c 	str	r3, [sp, #44]
  1044bc:	e59dc008 	ldr	ip, [sp, #8]
  1044c0:	e3560017 	cmp	r6, #23	; 0x17
  1044c4:	e3a03000 	mov	r3, #0	; 0x0
  1044c8:	e58c3044 	str	r3, [ip, #68]
  1044cc:	81a01003 	movhi	r1, r3
  1044d0:	83a02004 	movhi	r2, #4	; 0x4
  1044d4:	9a0001e0 	bls	104c5c <prog+0x4c18>
  1044d8:	e1a02082 	mov	r2, r2, lsl #1
  1044dc:	e2823014 	add	r3, r2, #20	; 0x14
  1044e0:	e1560003 	cmp	r6, r3
  1044e4:	e2811001 	add	r1, r1, #1	; 0x1
  1044e8:	2afffffa 	bcs	1044d8 <prog+0x4494>
  1044ec:	e59d301c 	ldr	r3, [sp, #28]
  1044f0:	e59d2008 	ldr	r2, [sp, #8]
  1044f4:	e353000e 	cmp	r3, #14	; 0xe
  1044f8:	83a04000 	movhi	r4, #0	; 0x0
  1044fc:	93a04001 	movls	r4, #1	; 0x1
  104500:	e1a05000 	mov	r5, r0
  104504:	e5821044 	str	r1, [r2, #68]
  104508:	eafffdab 	b	103bbc <prog+0x3b78>
  10450c:	e3a03000 	mov	r3, #0	; 0x0
  104510:	e58d302c 	str	r3, [sp, #44]
  104514:	e59dc074 	ldr	ip, [sp, #116]
  104518:	e59de024 	ldr	lr, [sp, #36]
  10451c:	e28c3001 	add	r3, ip, #1	; 0x1
  104520:	e08e6003 	add	r6, lr, r3
  104524:	e3560000 	cmp	r6, #0	; 0x0
  104528:	e2461001 	sub	r1, r6, #1	; 0x1
  10452c:	e58d1020 	str	r1, [sp, #32]
  104530:	c58d601c 	strgt	r6, [sp, #28]
  104534:	caffffe0 	bgt	1044bc <prog+0x4478>
  104538:	e356000e 	cmp	r6, #14	; 0xe
  10453c:	83a04000 	movhi	r4, #0	; 0x0
  104540:	93a04001 	movls	r4, #1	; 0x1
  104544:	e1a05000 	mov	r5, r0
  104548:	e58d601c 	str	r6, [sp, #28]
  10454c:	eafffd97 	b	103bb0 <prog+0x3b6c>
  104550:	e3a02001 	mov	r2, #1	; 0x1
  104554:	e58d202c 	str	r2, [sp, #44]
  104558:	e59d2074 	ldr	r2, [sp, #116]
  10455c:	e3520000 	cmp	r2, #0	; 0x0
  104560:	c58d2020 	strgt	r2, [sp, #32]
  104564:	c1a06002 	movgt	r6, r2
  104568:	c58d201c 	strgt	r2, [sp, #28]
  10456c:	caffffd2 	bgt	1044bc <prog+0x4478>
  104570:	e3a02001 	mov	r2, #1	; 0x1
  104574:	e1a04002 	mov	r4, r2
  104578:	e1a05000 	mov	r5, r0
  10457c:	e58d201c 	str	r2, [sp, #28]
  104580:	e58d2074 	str	r2, [sp, #116]
  104584:	e58d2020 	str	r2, [sp, #32]
  104588:	eafffd88 	b	103bb0 <prog+0x3b6c>
  10458c:	e3a01001 	mov	r1, #1	; 0x1
  104590:	e58d102c 	str	r1, [sp, #44]
  104594:	eaffffde 	b	104514 <prog+0x44d0>
  104598:	e3a01000 	mov	r1, #0	; 0x0
  10459c:	e58d102c 	str	r1, [sp, #44]
  1045a0:	eaffffec 	b	104558 <prog+0x4514>
  1045a4:	e3590000 	cmp	r9, #0	; 0x0
  1045a8:	1affff03 	bne	1041bc <prog+0x4178>
  1045ac:	e3c834ff 	bic	r3, r8, #-16777216	; 0xff000000
  1045b0:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  1045b4:	e3530000 	cmp	r3, #0	; 0x0
  1045b8:	1afffeff 	bne	1041bc <prog+0x4178>
  1045bc:	e3c83102 	bic	r3, r8, #-2147483648	; 0x80000000
  1045c0:	e1a03a23 	mov	r3, r3, lsr #20
  1045c4:	e1a03a03 	mov	r3, r3, lsl #20
  1045c8:	e3530000 	cmp	r3, #0	; 0x0
  1045cc:	0afffefa 	beq	1041bc <prog+0x4178>
  1045d0:	e59d0014 	ldr	r0, [sp, #20]
  1045d4:	e28bb001 	add	fp, fp, #1	; 0x1
  1045d8:	e2800001 	add	r0, r0, #1	; 0x1
  1045dc:	e3a04001 	mov	r4, #1	; 0x1
  1045e0:	e58d0014 	str	r0, [sp, #20]
  1045e4:	eafffef5 	b	1041c0 <prog+0x417c>
  1045e8:	e59d0024 	ldr	r0, [sp, #36]
  1045ec:	eb00100f 	bl	108630 <__floatsidf>
  1045f0:	e1a02000 	mov	r2, r0
  1045f4:	e1a03001 	mov	r3, r1
  1045f8:	e1a00004 	mov	r0, r4
  1045fc:	e1a01005 	mov	r1, r5
  104600:	eb000f87 	bl	108424 <__nedf2>
  104604:	e3500000 	cmp	r0, #0	; 0x0
  104608:	159dc024 	ldrne	ip, [sp, #36]
  10460c:	124cc001 	subne	ip, ip, #1	; 0x1
  104610:	158dc024 	strne	ip, [sp, #36]
  104614:	eafffcf5 	b	1039f0 <_dtoa_r+0x1c4>
  104618:	e59d3014 	ldr	r3, [sp, #20]
  10461c:	e59dc024 	ldr	ip, [sp, #36]
  104620:	e3a00000 	mov	r0, #0	; 0x0
  104624:	e06c3003 	rsb	r3, ip, r3
  104628:	e26ce000 	rsb	lr, ip, #0	; 0x0
  10462c:	e58d3014 	str	r3, [sp, #20]
  104630:	e58de018 	str	lr, [sp, #24]
  104634:	e58d0030 	str	r0, [sp, #48]
  104638:	eafffd0f 	b	103a7c <_dtoa_r+0x250>
  10463c:	e3530003 	cmp	r3, #3	; 0x3
  104640:	cafffeef 	bgt	104204 <prog+0x41c0>
  104644:	e283301c 	add	r3, r3, #28	; 0x1c
  104648:	e59dc014 	ldr	ip, [sp, #20]
  10464c:	e08bb003 	add	fp, fp, r3
  104650:	e08cc003 	add	ip, ip, r3
  104654:	e0877003 	add	r7, r7, r3
  104658:	e58dc014 	str	ip, [sp, #20]
  10465c:	eafffee8 	b	104204 <prog+0x41c0>
  104660:	e59de02c 	ldr	lr, [sp, #44]
  104664:	e35e0000 	cmp	lr, #0	; 0x0
  104668:	03a04000 	moveq	r4, #0	; 0x0
  10466c:	0a00004c 	beq	1047a4 <prog+0x4760>
  104670:	e3570000 	cmp	r7, #0	; 0x0
  104674:	da000004 	ble	10468c <prog+0x4648>
  104678:	e1a0100a 	mov	r1, sl
  10467c:	e1a02007 	mov	r2, r7
  104680:	e59d0008 	ldr	r0, [sp, #8]
  104684:	eb000709 	bl	1062b0 <_lshift>
  104688:	e1a0a000 	mov	sl, r0
  10468c:	e3540000 	cmp	r4, #0	; 0x0
  104690:	01a0b00a 	moveq	fp, sl
  104694:	1a00014f 	bne	104bd8 <prog+0x4b94>
  104698:	e58da03c 	str	sl, [sp, #60]
  10469c:	e59d5040 	ldr	r5, [sp, #64]
  1046a0:	e2097001 	and	r7, r9, #1	; 0x1
  1046a4:	e1a01006 	mov	r1, r6
  1046a8:	e59d0038 	ldr	r0, [sp, #56]
  1046ac:	ebfffbdd 	bl	103628 <quorem>
  1046b0:	e59d103c 	ldr	r1, [sp, #60]
  1046b4:	e2809030 	add	r9, r0, #48	; 0x30
  1046b8:	e59d0038 	ldr	r0, [sp, #56]
  1046bc:	eb0005ad 	bl	105d78 <__mcmp>
  1046c0:	e1a01006 	mov	r1, r6
  1046c4:	e1a08000 	mov	r8, r0
  1046c8:	e1a0200b 	mov	r2, fp
  1046cc:	e59d0008 	ldr	r0, [sp, #8]
  1046d0:	eb0006a9 	bl	10617c <__mdiff>
  1046d4:	e590300c 	ldr	r3, [r0, #12]
  1046d8:	e3530000 	cmp	r3, #0	; 0x0
  1046dc:	e1a04000 	mov	r4, r0
  1046e0:	13a0a001 	movne	sl, #1	; 0x1
  1046e4:	0a000061 	beq	104870 <prog+0x482c>
  1046e8:	e1a01004 	mov	r1, r4
  1046ec:	e59d0008 	ldr	r0, [sp, #8]
  1046f0:	eb00055e 	bl	105c70 <_Bfree>
  1046f4:	e59d2004 	ldr	r2, [sp, #4]
  1046f8:	e19a2002 	orrs	r2, sl, r2
  1046fc:	1a000001 	bne	104708 <prog+0x46c4>
  104700:	e3570000 	cmp	r7, #0	; 0x0
  104704:	0a00014b 	beq	104c38 <prog+0x4bf4>
  104708:	e3580000 	cmp	r8, #0	; 0x0
  10470c:	ba000120 	blt	104b94 <prog+0x4b50>
  104710:	e59d3004 	ldr	r3, [sp, #4]
  104714:	e1983003 	orrs	r3, r8, r3
  104718:	1a000001 	bne	104724 <prog+0x46e0>
  10471c:	e3570000 	cmp	r7, #0	; 0x0
  104720:	0a00011b 	beq	104b94 <prog+0x4b50>
  104724:	e35a0000 	cmp	sl, #0	; 0x0
  104728:	ca00013a 	bgt	104c18 <prog+0x4bd4>
  10472c:	e4c59001 	strb	r9, [r5], #1
  104730:	e59dc01c 	ldr	ip, [sp, #28]
  104734:	e59de040 	ldr	lr, [sp, #64]
  104738:	e08c300e 	add	r3, ip, lr
  10473c:	e1550003 	cmp	r5, r3
  104740:	0a00002a 	beq	1047f0 <prog+0x47ac>
  104744:	e59d1038 	ldr	r1, [sp, #56]
  104748:	e59d0008 	ldr	r0, [sp, #8]
  10474c:	e3a0200a 	mov	r2, #10	; 0xa
  104750:	e3a03000 	mov	r3, #0	; 0x0
  104754:	eb00078a 	bl	106584 <_multadd>
  104758:	e58d0038 	str	r0, [sp, #56]
  10475c:	e59d003c 	ldr	r0, [sp, #60]
  104760:	e150000b 	cmp	r0, fp
  104764:	0a000046 	beq	104884 <prog+0x4840>
  104768:	e59d103c 	ldr	r1, [sp, #60]
  10476c:	e3a0200a 	mov	r2, #10	; 0xa
  104770:	e3a03000 	mov	r3, #0	; 0x0
  104774:	e59d0008 	ldr	r0, [sp, #8]
  104778:	eb000781 	bl	106584 <_multadd>
  10477c:	e1a0100b 	mov	r1, fp
  104780:	e58d003c 	str	r0, [sp, #60]
  104784:	e3a0200a 	mov	r2, #10	; 0xa
  104788:	e59d0008 	ldr	r0, [sp, #8]
  10478c:	e3a03000 	mov	r3, #0	; 0x0
  104790:	eb00077b 	bl	106584 <_multadd>
  104794:	e1a0b000 	mov	fp, r0
  104798:	eaffffc1 	b	1046a4 <prog+0x4660>
  10479c:	eb000778 	bl	106584 <_multadd>
  1047a0:	e58d0038 	str	r0, [sp, #56]
  1047a4:	e1a01006 	mov	r1, r6
  1047a8:	e59d0038 	ldr	r0, [sp, #56]
  1047ac:	ebfffb9d 	bl	103628 <quorem>
  1047b0:	e59dc040 	ldr	ip, [sp, #64]
  1047b4:	e2809030 	add	r9, r0, #48	; 0x30
  1047b8:	e59d1038 	ldr	r1, [sp, #56]
  1047bc:	e59d0008 	ldr	r0, [sp, #8]
  1047c0:	e7c4900c 	strb	r9, [r4, ip]
  1047c4:	e59de01c 	ldr	lr, [sp, #28]
  1047c8:	e2844001 	add	r4, r4, #1	; 0x1
  1047cc:	e15e0004 	cmp	lr, r4
  1047d0:	e3a0200a 	mov	r2, #10	; 0xa
  1047d4:	e3a03000 	mov	r3, #0	; 0x0
  1047d8:	caffffef 	bgt	10479c <prog+0x4758>
  1047dc:	e59d0040 	ldr	r0, [sp, #64]
  1047e0:	e3a01000 	mov	r1, #0	; 0x0
  1047e4:	e58d103c 	str	r1, [sp, #60]
  1047e8:	e0805004 	add	r5, r0, r4
  1047ec:	e1a0b00a 	mov	fp, sl
  1047f0:	e59d1038 	ldr	r1, [sp, #56]
  1047f4:	e3a02001 	mov	r2, #1	; 0x1
  1047f8:	e59d0008 	ldr	r0, [sp, #8]
  1047fc:	eb0006ab 	bl	1062b0 <_lshift>
  104800:	e1a01006 	mov	r1, r6
  104804:	e58d0038 	str	r0, [sp, #56]
  104808:	eb00055a 	bl	105d78 <__mcmp>
  10480c:	e3500000 	cmp	r0, #0	; 0x0
  104810:	da00000d 	ble	10484c <prog+0x4808>
  104814:	e1a02005 	mov	r2, r5
  104818:	e5723001 	ldrb	r3, [r2, #-1]!
  10481c:	e3530039 	cmp	r3, #57	; 0x39
  104820:	1a0000d7 	bne	104b84 <prog+0x4b40>
  104824:	e59d0040 	ldr	r0, [sp, #64]
  104828:	e1500002 	cmp	r0, r2
  10482c:	1afffff9 	bne	104818 <prog+0x47d4>
  104830:	e1a07000 	mov	r7, r0
  104834:	e3a03031 	mov	r3, #49	; 0x31
  104838:	e4c73001 	strb	r3, [r7], #1
  10483c:	e59d1024 	ldr	r1, [sp, #36]
  104840:	e2811001 	add	r1, r1, #1	; 0x1
  104844:	e58d1024 	str	r1, [sp, #36]
  104848:	eafffec9 	b	104374 <prog+0x4330>
  10484c:	1a000001 	bne	104858 <prog+0x4814>
  104850:	e3190001 	tst	r9, #1	; 0x1
  104854:	1affffee 	bne	104814 <prog+0x47d0>
  104858:	e1a02005 	mov	r2, r5
  10485c:	e5723001 	ldrb	r3, [r2, #-1]!
  104860:	e3530030 	cmp	r3, #48	; 0x30
  104864:	0afffffc 	beq	10485c <prog+0x4818>
  104868:	e2827001 	add	r7, r2, #1	; 0x1
  10486c:	eafffec0 	b	104374 <prog+0x4330>
  104870:	e59d0038 	ldr	r0, [sp, #56]
  104874:	e1a01004 	mov	r1, r4
  104878:	eb00053e 	bl	105d78 <__mcmp>
  10487c:	e1a0a000 	mov	sl, r0
  104880:	eaffff98 	b	1046e8 <prog+0x46a4>
  104884:	e1a0100b 	mov	r1, fp
  104888:	e59d0008 	ldr	r0, [sp, #8]
  10488c:	e3a0200a 	mov	r2, #10	; 0xa
  104890:	e3a03000 	mov	r3, #0	; 0x0
  104894:	eb00073a 	bl	106584 <_multadd>
  104898:	e1a0b000 	mov	fp, r0
  10489c:	e58d003c 	str	r0, [sp, #60]
  1048a0:	eaffff7f 	b	1046a4 <prog+0x4660>
  1048a4:	e1a01002 	mov	r1, r2
  1048a8:	e59d0008 	ldr	r0, [sp, #8]
  1048ac:	eb0004ef 	bl	105c70 <_Bfree>
  1048b0:	eafffeb8 	b	104398 <prog+0x4354>
  1048b4:	e51fcb68 	ldr	ip, [pc, #-2920]	; 103d54 <prog+0x3d10>
  1048b8:	e08cc18a 	add	ip, ip, sl, lsl #3
  1048bc:	e91c000c 	ldmdb	ip, {r2, r3}
  1048c0:	e1a00006 	mov	r0, r6
  1048c4:	e1a01007 	mov	r1, r7
  1048c8:	eb000d46 	bl	107de8 <__muldf3>
  1048cc:	e1a05008 	mov	r5, r8
  1048d0:	e1a06009 	mov	r6, r9
  1048d4:	e1a08000 	mov	r8, r0
  1048d8:	e1a09001 	mov	r9, r1
  1048dc:	e1a00005 	mov	r0, r5
  1048e0:	e1a01006 	mov	r1, r6
  1048e4:	eb000f8f 	bl	108728 <__fixdfsi>
  1048e8:	e1a04000 	mov	r4, r0
  1048ec:	eb000f4f 	bl	108630 <__floatsidf>
  1048f0:	e1a02000 	mov	r2, r0
  1048f4:	e1a03001 	mov	r3, r1
  1048f8:	e1a00005 	mov	r0, r5
  1048fc:	e1a01006 	mov	r1, r6
  104900:	eb000cf9 	bl	107cec <__subdf3>
  104904:	e59d7040 	ldr	r7, [sp, #64]
  104908:	e2844030 	add	r4, r4, #48	; 0x30
  10490c:	e35a0001 	cmp	sl, #1	; 0x1
  104910:	e4c74001 	strb	r4, [r7], #1
  104914:	e1a05000 	mov	r5, r0
  104918:	e1a06001 	mov	r6, r1
  10491c:	13a07001 	movne	r7, #1	; 0x1
  104920:	0a000018 	beq	104988 <prog+0x4944>
  104924:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  104928:	e2822709 	add	r2, r2, #2359296	; 0x240000
  10492c:	e3a03000 	mov	r3, #0	; 0x0
  104930:	e1a00005 	mov	r0, r5
  104934:	e1a01006 	mov	r1, r6
  104938:	eb000d2a 	bl	107de8 <__muldf3>
  10493c:	e1a06001 	mov	r6, r1
  104940:	e1a05000 	mov	r5, r0
  104944:	eb000f77 	bl	108728 <__fixdfsi>
  104948:	e1a04000 	mov	r4, r0
  10494c:	eb000f37 	bl	108630 <__floatsidf>
  104950:	e1a02000 	mov	r2, r0
  104954:	e1a03001 	mov	r3, r1
  104958:	e1a00005 	mov	r0, r5
  10495c:	e1a01006 	mov	r1, r6
  104960:	eb000ce1 	bl	107cec <__subdf3>
  104964:	e59dc040 	ldr	ip, [sp, #64]
  104968:	e2844030 	add	r4, r4, #48	; 0x30
  10496c:	e7c7400c 	strb	r4, [r7, ip]
  104970:	e2877001 	add	r7, r7, #1	; 0x1
  104974:	e157000a 	cmp	r7, sl
  104978:	e1a05000 	mov	r5, r0
  10497c:	e1a06001 	mov	r6, r1
  104980:	1affffe7 	bne	104924 <prog+0x48e0>
  104984:	e08c7007 	add	r7, ip, r7
  104988:	e3a025ff 	mov	r2, #1069547520	; 0x3fc00000
  10498c:	e2822602 	add	r2, r2, #2097152	; 0x200000
  104990:	e3a03000 	mov	r3, #0	; 0x0
  104994:	e1a00008 	mov	r0, r8
  104998:	e1a01009 	mov	r1, r9
  10499c:	eb000cea 	bl	107d4c <__adddf3>
  1049a0:	e1a02005 	mov	r2, r5
  1049a4:	e1a03006 	mov	r3, r6
  1049a8:	eb000f03 	bl	1085bc <__ltdf2>
  1049ac:	e3500000 	cmp	r0, #0	; 0x0
  1049b0:	bafffdb3 	blt	104084 <prog+0x4040>
  1049b4:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  1049b8:	e1a02008 	mov	r2, r8
  1049bc:	e1a03009 	mov	r3, r9
  1049c0:	e2800602 	add	r0, r0, #2097152	; 0x200000
  1049c4:	e3a01000 	mov	r1, #0	; 0x0
  1049c8:	eb000cc7 	bl	107cec <__subdf3>
  1049cc:	e1a02005 	mov	r2, r5
  1049d0:	e1a03006 	mov	r3, r6
  1049d4:	eb000eb4 	bl	1084ac <__gtdf2>
  1049d8:	e3500000 	cmp	r0, #0	; 0x0
  1049dc:	dafffd55 	ble	103f38 <prog+0x3ef4>
  1049e0:	e1a02007 	mov	r2, r7
  1049e4:	e5723001 	ldrb	r3, [r2, #-1]!
  1049e8:	e3530030 	cmp	r3, #48	; 0x30
  1049ec:	0afffffc 	beq	1049e4 <prog+0x49a0>
  1049f0:	e59d3044 	ldr	r3, [sp, #68]
  1049f4:	e2827001 	add	r7, r2, #1	; 0x1
  1049f8:	e58d3024 	str	r3, [sp, #36]
  1049fc:	eafffe68 	b	1043a4 <prog+0x4360>
  104a00:	e59d0024 	ldr	r0, [sp, #36]
  104a04:	e2605000 	rsb	r5, r0, #0	; 0x0
  104a08:	e3550000 	cmp	r5, #0	; 0x0
  104a0c:	0a00004a 	beq	104b3c <prog+0x4af8>
  104a10:	e51f1cc4 	ldr	r1, [pc, #-3268]	; 103d54 <prog+0x3d10>
  104a14:	e205300f 	and	r3, r5, #15	; 0xf
  104a18:	e0811183 	add	r1, r1, r3, lsl #3
  104a1c:	e891000c 	ldmia	r1, {r2, r3}
  104a20:	e28d000c 	add	r0, sp, #12	; 0xc
  104a24:	e8900003 	ldmia	r0, {r0, r1}
  104a28:	eb000cee 	bl	107de8 <__muldf3>
  104a2c:	e1b05245 	movs	r5, r5, asr #4
  104a30:	e1a03000 	mov	r3, r0
  104a34:	e1a04001 	mov	r4, r1
  104a38:	e1a08000 	mov	r8, r0
  104a3c:	e1a09001 	mov	r9, r1
  104a40:	0a00003d 	beq	104b3c <prog+0x4af8>
  104a44:	e51f6cf4 	ldr	r6, [pc, #-3316]	; 103d58 <prog+0x3d14>
  104a48:	e3a0a002 	mov	sl, #2	; 0x2
  104a4c:	e3150001 	tst	r5, #1	; 0x1
  104a50:	e1a00003 	mov	r0, r3
  104a54:	e1a01004 	mov	r1, r4
  104a58:	0a000004 	beq	104a70 <prog+0x4a2c>
  104a5c:	e896000c 	ldmia	r6, {r2, r3}
  104a60:	eb000ce0 	bl	107de8 <__muldf3>
  104a64:	e28aa001 	add	sl, sl, #1	; 0x1
  104a68:	e1a03000 	mov	r3, r0
  104a6c:	e1a04001 	mov	r4, r1
  104a70:	e1b050c5 	movs	r5, r5, asr #1
  104a74:	e2866008 	add	r6, r6, #8	; 0x8
  104a78:	1afffff3 	bne	104a4c <prog+0x4a08>
  104a7c:	e1a08003 	mov	r8, r3
  104a80:	e1a09004 	mov	r9, r4
  104a84:	eafffc75 	b	103c60 <prog+0x3c1c>
  104a88:	e3a02441 	mov	r2, #1090519040	; 0x41000000
  104a8c:	e282260f 	add	r2, r2, #15728640	; 0xf00000
  104a90:	e3a03000 	mov	r3, #0	; 0x0
  104a94:	eb000cac 	bl	107d4c <__adddf3>
  104a98:	eafffc35 	b	103b74 <prog+0x3b30>
  104a9c:	e5963010 	ldr	r3, [r6, #16]
  104aa0:	e0863103 	add	r3, r6, r3, lsl #2
  104aa4:	e5930010 	ldr	r0, [r3, #16]
  104aa8:	eb000477 	bl	105c8c <_hi0bits>
  104aac:	e2603020 	rsb	r3, r0, #32	; 0x20
  104ab0:	eafffdc6 	b	1041d0 <prog+0x418c>
  104ab4:	e59d0038 	ldr	r0, [sp, #56]
  104ab8:	e1a01006 	mov	r1, r6
  104abc:	eb0004ad 	bl	105d78 <__mcmp>
  104ac0:	e3500000 	cmp	r0, #0	; 0x0
  104ac4:	aafffde0 	bge	10424c <prog+0x4208>
  104ac8:	e3a03000 	mov	r3, #0	; 0x0
  104acc:	e59d1038 	ldr	r1, [sp, #56]
  104ad0:	e3a0200a 	mov	r2, #10	; 0xa
  104ad4:	e59d0008 	ldr	r0, [sp, #8]
  104ad8:	eb0006a9 	bl	106584 <_multadd>
  104adc:	e59d102c 	ldr	r1, [sp, #44]
  104ae0:	e59d2024 	ldr	r2, [sp, #36]
  104ae4:	e3510000 	cmp	r1, #0	; 0x0
  104ae8:	059d3020 	ldreq	r3, [sp, #32]
  104aec:	e2422001 	sub	r2, r2, #1	; 0x1
  104af0:	e58d0038 	str	r0, [sp, #56]
  104af4:	e58d2024 	str	r2, [sp, #36]
  104af8:	058d301c 	streq	r3, [sp, #28]
  104afc:	0afffdd2 	beq	10424c <prog+0x4208>
  104b00:	e1a0100a 	mov	r1, sl
  104b04:	e59d0008 	ldr	r0, [sp, #8]
  104b08:	e3a0200a 	mov	r2, #10	; 0xa
  104b0c:	e3a03000 	mov	r3, #0	; 0x0
  104b10:	eb00069b 	bl	106584 <_multadd>
  104b14:	e59dc020 	ldr	ip, [sp, #32]
  104b18:	e1a0a000 	mov	sl, r0
  104b1c:	e58dc01c 	str	ip, [sp, #28]
  104b20:	eafffdc9 	b	10424c <prog+0x4208>
  104b24:	e59d1038 	ldr	r1, [sp, #56]
  104b28:	e59d2018 	ldr	r2, [sp, #24]
  104b2c:	e59d0008 	ldr	r0, [sp, #8]
  104b30:	eb0006c5 	bl	10664c <_pow5mult>
  104b34:	e58d0038 	str	r0, [sp, #56]
  104b38:	eafffd90 	b	104180 <prog+0x413c>
  104b3c:	e3a0a002 	mov	sl, #2	; 0x2
  104b40:	eafffc46 	b	103c60 <prog+0x3c1c>
  104b44:	e59d1038 	ldr	r1, [sp, #56]
  104b48:	e59d0008 	ldr	r0, [sp, #8]
  104b4c:	eb0006be 	bl	10664c <_pow5mult>
  104b50:	e58d0038 	str	r0, [sp, #56]
  104b54:	eafffd89 	b	104180 <prog+0x413c>
  104b58:	e59d1034 	ldr	r1, [sp, #52]
  104b5c:	e3510000 	cmp	r1, #0	; 0x0
  104b60:	059d304c 	ldreq	r3, [sp, #76]
  104b64:	12823e43 	addne	r3, r2, #1072	; 0x430
  104b68:	159d7014 	ldrne	r7, [sp, #20]
  104b6c:	159d5018 	ldrne	r5, [sp, #24]
  104b70:	059d7014 	ldreq	r7, [sp, #20]
  104b74:	059d5018 	ldreq	r5, [sp, #24]
  104b78:	12833003 	addne	r3, r3, #3	; 0x3
  104b7c:	02633036 	rsbeq	r3, r3, #54	; 0x36
  104b80:	eafffe2f 	b	104444 <prog+0x4400>
  104b84:	e2833001 	add	r3, r3, #1	; 0x1
  104b88:	e4c23001 	strb	r3, [r2], #1
  104b8c:	e1a07002 	mov	r7, r2
  104b90:	eafffdf7 	b	104374 <prog+0x4330>
  104b94:	e35a0000 	cmp	sl, #0	; 0x0
  104b98:	da00000b 	ble	104bcc <prog+0x4b88>
  104b9c:	e59d1038 	ldr	r1, [sp, #56]
  104ba0:	e3a02001 	mov	r2, #1	; 0x1
  104ba4:	e59d0008 	ldr	r0, [sp, #8]
  104ba8:	eb0005c0 	bl	1062b0 <_lshift>
  104bac:	e1a01006 	mov	r1, r6
  104bb0:	e58d0038 	str	r0, [sp, #56]
  104bb4:	eb00046f 	bl	105d78 <__mcmp>
  104bb8:	e3500000 	cmp	r0, #0	; 0x0
  104bbc:	da000022 	ble	104c4c <prog+0x4c08>
  104bc0:	e2899001 	add	r9, r9, #1	; 0x1
  104bc4:	e359003a 	cmp	r9, #58	; 0x3a
  104bc8:	0a000017 	beq	104c2c <prog+0x4be8>
  104bcc:	e4c59001 	strb	r9, [r5], #1
  104bd0:	e1a07005 	mov	r7, r5
  104bd4:	eafffde6 	b	104374 <prog+0x4330>
  104bd8:	e59a1004 	ldr	r1, [sl, #4]
  104bdc:	e59d0008 	ldr	r0, [sp, #8]
  104be0:	eb0004f2 	bl	105fb0 <_Balloc>
  104be4:	e59a2010 	ldr	r2, [sl, #16]
  104be8:	e1a02102 	mov	r2, r2, lsl #2
  104bec:	e1a04000 	mov	r4, r0
  104bf0:	e2822008 	add	r2, r2, #8	; 0x8
  104bf4:	e28a100c 	add	r1, sl, #12	; 0xc
  104bf8:	e280000c 	add	r0, r0, #12	; 0xc
  104bfc:	ebffeff2 	bl	100bcc <memcpy>
  104c00:	e59d0008 	ldr	r0, [sp, #8]
  104c04:	e1a01004 	mov	r1, r4
  104c08:	e3a02001 	mov	r2, #1	; 0x1
  104c0c:	eb0005a7 	bl	1062b0 <_lshift>
  104c10:	e1a0b000 	mov	fp, r0
  104c14:	eafffe9f 	b	104698 <prog+0x4654>
  104c18:	e3590039 	cmp	r9, #57	; 0x39
  104c1c:	12893001 	addne	r3, r9, #1	; 0x1
  104c20:	14c53001 	strneb	r3, [r5], #1
  104c24:	11a07005 	movne	r7, r5
  104c28:	1afffdd1 	bne	104374 <prog+0x4330>
  104c2c:	e3a03039 	mov	r3, #57	; 0x39
  104c30:	e4c53001 	strb	r3, [r5], #1
  104c34:	eafffef6 	b	104814 <prog+0x47d0>
  104c38:	e3590039 	cmp	r9, #57	; 0x39
  104c3c:	0afffffa 	beq	104c2c <prog+0x4be8>
  104c40:	e3580000 	cmp	r8, #0	; 0x0
  104c44:	c2899001 	addgt	r9, r9, #1	; 0x1
  104c48:	eaffffdf 	b	104bcc <prog+0x4b88>
  104c4c:	1affffde 	bne	104bcc <prog+0x4b88>
  104c50:	e3190001 	tst	r9, #1	; 0x1
  104c54:	0affffdc 	beq	104bcc <prog+0x4b88>
  104c58:	eaffffd8 	b	104bc0 <prog+0x4b7c>
  104c5c:	e59de01c 	ldr	lr, [sp, #28]
  104c60:	e1a05000 	mov	r5, r0
  104c64:	e35e000e 	cmp	lr, #14	; 0xe
  104c68:	83a04000 	movhi	r4, #0	; 0x0
  104c6c:	93a04001 	movls	r4, #1	; 0x1
  104c70:	eafffbd1 	b	103bbc <prog+0x3b78>

00104c74 <fflush>:
  104c74:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  104c78:	e2506000 	subs	r6, r0, #0	; 0x0
  104c7c:	0a00002c 	beq	104d34 <fflush+0xc0>
  104c80:	e59f30c0 	ldr	r3, [pc, #192]	; 104d48 <prog+0x4d04>
  104c84:	e5930000 	ldr	r0, [r3]
  104c88:	e3500000 	cmp	r0, #0	; 0x0
  104c8c:	0a000002 	beq	104c9c <fflush+0x28>
  104c90:	e5903038 	ldr	r3, [r0, #56]
  104c94:	e3530000 	cmp	r3, #0	; 0x0
  104c98:	0a000023 	beq	104d2c <fflush+0xb8>
  104c9c:	e1d610fc 	ldrsh	r1, [r6, #12]
  104ca0:	e3110008 	tst	r1, #8	; 0x8
  104ca4:	0a00001c 	beq	104d1c <fflush+0xa8>
  104ca8:	e5965010 	ldr	r5, [r6, #16]
  104cac:	e3550000 	cmp	r5, #0	; 0x0
  104cb0:	0a000019 	beq	104d1c <fflush+0xa8>
  104cb4:	e5963000 	ldr	r3, [r6]
  104cb8:	e3110003 	tst	r1, #3	; 0x3
  104cbc:	e0654003 	rsb	r4, r5, r3
  104cc0:	e5865000 	str	r5, [r6]
  104cc4:	13a03000 	movne	r3, #0	; 0x0
  104cc8:	0a000015 	beq	104d24 <fflush+0xb0>
  104ccc:	e3540000 	cmp	r4, #0	; 0x0
  104cd0:	e5863008 	str	r3, [r6, #8]
  104cd4:	ca000002 	bgt	104ce4 <fflush+0x70>
  104cd8:	ea00000f 	b	104d1c <fflush+0xa8>
  104cdc:	e3540000 	cmp	r4, #0	; 0x0
  104ce0:	da00000d 	ble	104d1c <fflush+0xa8>
  104ce4:	e1a01005 	mov	r1, r5
  104ce8:	e1a02004 	mov	r2, r4
  104cec:	e596001c 	ldr	r0, [r6, #28]
  104cf0:	e1a0e00f 	mov	lr, pc
  104cf4:	e596f024 	ldr	pc, [r6, #36]
  104cf8:	e3500000 	cmp	r0, #0	; 0x0
  104cfc:	e0855000 	add	r5, r5, r0
  104d00:	e0604004 	rsb	r4, r0, r4
  104d04:	cafffff4 	bgt	104cdc <fflush+0x68>
  104d08:	e1d630bc 	ldrh	r3, [r6, #12]
  104d0c:	e3e00000 	mvn	r0, #0	; 0x0
  104d10:	e3833040 	orr	r3, r3, #64	; 0x40
  104d14:	e1c630bc 	strh	r3, [r6, #12]
  104d18:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  104d1c:	e3a00000 	mov	r0, #0	; 0x0
  104d20:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  104d24:	e5963014 	ldr	r3, [r6, #20]
  104d28:	eaffffe7 	b	104ccc <fflush+0x58>
  104d2c:	eb000023 	bl	104dc0 <__sinit>
  104d30:	eaffffd9 	b	104c9c <fflush+0x28>
  104d34:	e59f3010 	ldr	r3, [pc, #16]	; 104d4c <prog+0x4d08>
  104d38:	e59f1010 	ldr	r1, [pc, #16]	; 104d50 <prog+0x4d0c>
  104d3c:	e5930000 	ldr	r0, [r3]
  104d40:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
  104d44:	ea0002a8 	b	1057ec <_fwalk>
  104d48:	00200410 	eoreq	r0, r0, r0, lsl r4
  104d4c:	0010c830 	andeqs	ip, r0, r0, lsr r8
  104d50:	00104c74 	andeqs	r4, r0, r4, ror ip

00104d54 <std>:
  104d54:	e59f3044 	ldr	r3, [pc, #68]	; 104da0 <prog+0x4d5c>
  104d58:	e580302c 	str	r3, [r0, #44]
  104d5c:	e59f3040 	ldr	r3, [pc, #64]	; 104da4 <prog+0x4d60>
  104d60:	e1c020be 	strh	r2, [r0, #14]
  104d64:	e5803020 	str	r3, [r0, #32]
  104d68:	e59f2038 	ldr	r2, [pc, #56]	; 104da8 <prog+0x4d64>
  104d6c:	e59f3038 	ldr	r3, [pc, #56]	; 104dac <prog+0x4d68>
  104d70:	e3a0c000 	mov	ip, #0	; 0x0
  104d74:	e1c010bc 	strh	r1, [r0, #12]
  104d78:	e580c018 	str	ip, [r0, #24]
  104d7c:	e5802024 	str	r2, [r0, #36]
  104d80:	e5803028 	str	r3, [r0, #40]
  104d84:	e580c000 	str	ip, [r0]
  104d88:	e580c004 	str	ip, [r0, #4]
  104d8c:	e580c008 	str	ip, [r0, #8]
  104d90:	e580c010 	str	ip, [r0, #16]
  104d94:	e580c014 	str	ip, [r0, #20]
  104d98:	e580001c 	str	r0, [r0, #28]
  104d9c:	e12fff1e 	bx	lr
  104da0:	00106ec4 	andeqs	r6, r0, r4, asr #29
  104da4:	00106f80 	andeqs	r6, r0, r0, lsl #31
  104da8:	00106f20 	andeqs	r6, r0, r0, lsr #30
  104dac:	00106ed8 	ldreqsb	r6, [r0], -r8

00104db0 <__sfp_lock_acquire>:
  104db0:	e12fff1e 	bx	lr

00104db4 <__sfp_lock_release>:
  104db4:	e12fff1e 	bx	lr

00104db8 <__sinit_lock_acquire>:
  104db8:	e12fff1e 	bx	lr

00104dbc <__sinit_lock_release>:
  104dbc:	e12fff1e 	bx	lr

00104dc0 <__sinit>:
  104dc0:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  104dc4:	e590e038 	ldr	lr, [r0, #56]
  104dc8:	e25e2000 	subs	r2, lr, #0	; 0x0
  104dcc:	e3a06001 	mov	r6, #1	; 0x1
  104dd0:	e3a01004 	mov	r1, #4	; 0x4
  104dd4:	e1a04000 	mov	r4, r0
  104dd8:	e2805fbb 	add	r5, r0, #748	; 0x2ec
  104ddc:	e1a03000 	mov	r3, r0
  104de0:	18bd8070 	ldmneia	sp!, {r4, r5, r6, pc}
  104de4:	e59f0048 	ldr	r0, [pc, #72]	; 104e34 <prog+0x4df0>
  104de8:	e3a0c003 	mov	ip, #3	; 0x3
  104dec:	e584003c 	str	r0, [r4, #60]
  104df0:	e584c2e4 	str	ip, [r4, #740]
  104df4:	e584e2e0 	str	lr, [r4, #736]
  104df8:	e5940004 	ldr	r0, [r4, #4]
  104dfc:	e58452e8 	str	r5, [r4, #744]
  104e00:	e5846038 	str	r6, [r4, #56]
  104e04:	ebffffd2 	bl	104d54 <std>
  104e08:	e1a02006 	mov	r2, r6
  104e0c:	e5940008 	ldr	r0, [r4, #8]
  104e10:	e1a03004 	mov	r3, r4
  104e14:	e3a01009 	mov	r1, #9	; 0x9
  104e18:	ebffffcd 	bl	104d54 <std>
  104e1c:	e594000c 	ldr	r0, [r4, #12]
  104e20:	e1a03004 	mov	r3, r4
  104e24:	e3a0100a 	mov	r1, #10	; 0xa
  104e28:	e3a02002 	mov	r2, #2	; 0x2
  104e2c:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
  104e30:	eaffffc7 	b	104d54 <std>
  104e34:	00104e78 	andeqs	r4, r0, r8, ror lr

00104e38 <__fp_lock>:
  104e38:	e3a00000 	mov	r0, #0	; 0x0
  104e3c:	e12fff1e 	bx	lr

00104e40 <__fp_unlock>:
  104e40:	e3a00000 	mov	r0, #0	; 0x0
  104e44:	e12fff1e 	bx	lr

00104e48 <__fp_unlock_all>:
  104e48:	e59f3008 	ldr	r3, [pc, #8]	; 104e58 <prog+0x4e14>
  104e4c:	e59f1008 	ldr	r1, [pc, #8]	; 104e5c <prog+0x4e18>
  104e50:	e5930000 	ldr	r0, [r3]
  104e54:	ea000264 	b	1057ec <_fwalk>
  104e58:	00200410 	eoreq	r0, r0, r0, lsl r4
  104e5c:	00104e40 	andeqs	r4, r0, r0, asr #28

00104e60 <__fp_lock_all>:
  104e60:	e59f3008 	ldr	r3, [pc, #8]	; 104e70 <prog+0x4e2c>
  104e64:	e59f1008 	ldr	r1, [pc, #8]	; 104e74 <prog+0x4e30>
  104e68:	e5930000 	ldr	r0, [r3]
  104e6c:	ea00025e 	b	1057ec <_fwalk>
  104e70:	00200410 	eoreq	r0, r0, r0, lsl r4
  104e74:	00104e38 	andeqs	r4, r0, r8, lsr lr

00104e78 <_cleanup_r>:
  104e78:	e59f1000 	ldr	r1, [pc, #0]	; 104e80 <prog+0x4e3c>
  104e7c:	ea00025a 	b	1057ec <_fwalk>
  104e80:	00107960 	andeqs	r7, r0, r0, ror #18

00104e84 <_cleanup>:
  104e84:	e59f3004 	ldr	r3, [pc, #4]	; 104e90 <prog+0x4e4c>
  104e88:	e5930000 	ldr	r0, [r3]
  104e8c:	eafffff9 	b	104e78 <_cleanup_r>
  104e90:	0010c830 	andeqs	ip, r0, r0, lsr r8

00104e94 <__sfmoreglue>:
  104e94:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  104e98:	e0814081 	add	r4, r1, r1, lsl #1
  104e9c:	e0614184 	rsb	r4, r1, r4, lsl #3
  104ea0:	e1a04104 	mov	r4, r4, lsl #2
  104ea4:	e1a06001 	mov	r6, r1
  104ea8:	e284100c 	add	r1, r4, #12	; 0xc
  104eac:	ebffed6a 	bl	10045c <_malloc_r>
  104eb0:	e250c000 	subs	ip, r0, #0	; 0x0
  104eb4:	e3a0e000 	mov	lr, #0	; 0x0
  104eb8:	e28c300c 	add	r3, ip, #12	; 0xc
  104ebc:	e1a0500c 	mov	r5, ip
  104ec0:	e1a00003 	mov	r0, r3
  104ec4:	e1a0100e 	mov	r1, lr
  104ec8:	e1a02004 	mov	r2, r4
  104ecc:	158c6004 	strne	r6, [ip, #4]
  104ed0:	158ce000 	strne	lr, [ip]
  104ed4:	158c3008 	strne	r3, [ip, #8]
  104ed8:	1bffef63 	blne	100c6c <memset>
  104edc:	e1a00005 	mov	r0, r5
  104ee0:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

00104ee4 <__sfp>:
  104ee4:	e59f30e0 	ldr	r3, [pc, #224]	; 104fcc <prog+0x4f88>
  104ee8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  104eec:	e5934000 	ldr	r4, [r3]
  104ef0:	e5942038 	ldr	r2, [r4, #56]
  104ef4:	e3520000 	cmp	r2, #0	; 0x0
  104ef8:	e1a05000 	mov	r5, r0
  104efc:	0a000025 	beq	104f98 <__sfp+0xb4>
  104f00:	e2844e2e 	add	r4, r4, #736	; 0x2e0
  104f04:	e5943004 	ldr	r3, [r4, #4]
  104f08:	e2531001 	subs	r1, r3, #1	; 0x1
  104f0c:	e5940008 	ldr	r0, [r4, #8]
  104f10:	4a00000b 	bmi	104f44 <__sfp+0x60>
  104f14:	e1d030fc 	ldrsh	r3, [r0, #12]
  104f18:	e3530000 	cmp	r3, #0	; 0x0
  104f1c:	0a00000d 	beq	104f58 <__sfp+0x74>
  104f20:	e3a02000 	mov	r2, #0	; 0x0
  104f24:	ea000002 	b	104f34 <__sfp+0x50>
  104f28:	e1d030fc 	ldrsh	r3, [r0, #12]
  104f2c:	e3530000 	cmp	r3, #0	; 0x0
  104f30:	0a000008 	beq	104f58 <__sfp+0x74>
  104f34:	e1520001 	cmp	r2, r1
  104f38:	e280005c 	add	r0, r0, #92	; 0x5c
  104f3c:	e2822001 	add	r2, r2, #1	; 0x1
  104f40:	1afffff8 	bne	104f28 <__sfp+0x44>
  104f44:	e5940000 	ldr	r0, [r4]
  104f48:	e3500000 	cmp	r0, #0	; 0x0
  104f4c:	0a000014 	beq	104fa4 <__sfp+0xc0>
  104f50:	e1a04000 	mov	r4, r0
  104f54:	eaffffea 	b	104f04 <__sfp+0x20>
  104f58:	e3a03000 	mov	r3, #0	; 0x0
  104f5c:	e5803048 	str	r3, [r0, #72]
  104f60:	e5803000 	str	r3, [r0]
  104f64:	e5803008 	str	r3, [r0, #8]
  104f68:	e5803004 	str	r3, [r0, #4]
  104f6c:	e5803010 	str	r3, [r0, #16]
  104f70:	e5803014 	str	r3, [r0, #20]
  104f74:	e5803018 	str	r3, [r0, #24]
  104f78:	e5803030 	str	r3, [r0, #48]
  104f7c:	e5803034 	str	r3, [r0, #52]
  104f80:	e5803044 	str	r3, [r0, #68]
  104f84:	e3e03000 	mvn	r3, #0	; 0x0
  104f88:	e1c030be 	strh	r3, [r0, #14]
  104f8c:	e3a03001 	mov	r3, #1	; 0x1
  104f90:	e1c030bc 	strh	r3, [r0, #12]
  104f94:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  104f98:	e1a00004 	mov	r0, r4
  104f9c:	ebffff87 	bl	104dc0 <__sinit>
  104fa0:	eaffffd6 	b	104f00 <__sfp+0x1c>
  104fa4:	e1a00005 	mov	r0, r5
  104fa8:	e3a01004 	mov	r1, #4	; 0x4
  104fac:	ebffffb8 	bl	104e94 <__sfmoreglue>
  104fb0:	e3500000 	cmp	r0, #0	; 0x0
  104fb4:	e5840000 	str	r0, [r4]
  104fb8:	1affffe4 	bne	104f50 <__sfp+0x6c>
  104fbc:	e3a0300c 	mov	r3, #12	; 0xc
  104fc0:	e3a00000 	mov	r0, #0	; 0x0
  104fc4:	e5853000 	str	r3, [r5]
  104fc8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  104fcc:	0010c830 	andeqs	ip, r0, r0, lsr r8

00104fd0 <_malloc_trim_r>:
  104fd0:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  104fd4:	e59f70e4 	ldr	r7, [pc, #228]	; 1050c0 <prog+0x507c>
  104fd8:	e1a04001 	mov	r4, r1
  104fdc:	e1a05000 	mov	r5, r0
  104fe0:	ebffef47 	bl	100d04 <__malloc_lock>
  104fe4:	e5973008 	ldr	r3, [r7, #8]
  104fe8:	e5932004 	ldr	r2, [r3, #4]
  104fec:	e3c26003 	bic	r6, r2, #3	; 0x3
  104ff0:	e0644006 	rsb	r4, r4, r6
  104ff4:	e2844efe 	add	r4, r4, #4064	; 0xfe0
  104ff8:	e284400f 	add	r4, r4, #15	; 0xf
  104ffc:	e1a04624 	mov	r4, r4, lsr #12
  105000:	e2444001 	sub	r4, r4, #1	; 0x1
  105004:	e1a04604 	mov	r4, r4, lsl #12
  105008:	e3540a01 	cmp	r4, #4096	; 0x1000
  10500c:	e3a01000 	mov	r1, #0	; 0x0
  105010:	e1a00005 	mov	r0, r5
  105014:	ba000006 	blt	105034 <_malloc_trim_r+0x64>
  105018:	eb001122 	bl	1094a8 <_sbrk_r>
  10501c:	e5973008 	ldr	r3, [r7, #8]
  105020:	e0863003 	add	r3, r6, r3
  105024:	e1500003 	cmp	r0, r3
  105028:	e2641000 	rsb	r1, r4, #0	; 0x0
  10502c:	e1a00005 	mov	r0, r5
  105030:	0a000002 	beq	105040 <_malloc_trim_r+0x70>
  105034:	ebffef33 	bl	100d08 <__malloc_unlock>
  105038:	e3a00000 	mov	r0, #0	; 0x0
  10503c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  105040:	eb001118 	bl	1094a8 <_sbrk_r>
  105044:	e0643006 	rsb	r3, r4, r6
  105048:	e3700001 	cmn	r0, #1	; 0x1
  10504c:	e3a01000 	mov	r1, #0	; 0x0
  105050:	e59fe06c 	ldr	lr, [pc, #108]	; 1050c4 <prog+0x5080>
  105054:	e383c001 	orr	ip, r3, #1	; 0x1
  105058:	e1a00005 	mov	r0, r5
  10505c:	0a000008 	beq	105084 <_malloc_trim_r+0xb4>
  105060:	e59e3000 	ldr	r3, [lr]
  105064:	e5972008 	ldr	r2, [r7, #8]
  105068:	e0643003 	rsb	r3, r4, r3
  10506c:	e1a00005 	mov	r0, r5
  105070:	e582c004 	str	ip, [r2, #4]
  105074:	e58e3000 	str	r3, [lr]
  105078:	ebffef22 	bl	100d08 <__malloc_unlock>
  10507c:	e3a00001 	mov	r0, #1	; 0x1
  105080:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  105084:	eb001107 	bl	1094a8 <_sbrk_r>
  105088:	e5971008 	ldr	r1, [r7, #8]
  10508c:	e1a0e000 	mov	lr, r0
  105090:	e061300e 	rsb	r3, r1, lr
  105094:	e353000f 	cmp	r3, #15	; 0xf
  105098:	e1a00005 	mov	r0, r5
  10509c:	e383c001 	orr	ip, r3, #1	; 0x1
  1050a0:	daffffe3 	ble	105034 <_malloc_trim_r+0x64>
  1050a4:	e59f301c 	ldr	r3, [pc, #28]	; 1050c8 <prog+0x5084>
  1050a8:	e5932000 	ldr	r2, [r3]
  1050ac:	e59f3010 	ldr	r3, [pc, #16]	; 1050c4 <prog+0x5080>
  1050b0:	e062200e 	rsb	r2, r2, lr
  1050b4:	e5832000 	str	r2, [r3]
  1050b8:	e581c004 	str	ip, [r1, #4]
  1050bc:	eaffffdc 	b	105034 <_malloc_trim_r+0x64>
  1050c0:	00200000 	eoreq	r0, r0, r0
  1050c4:	00200b94 	mlaeq	r0, r4, fp, r0
  1050c8:	0020040c 	eoreq	r0, r0, ip, lsl #8

001050cc <_free_r>:
  1050cc:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  1050d0:	e2514000 	subs	r4, r1, #0	; 0x0
  1050d4:	e1a08000 	mov	r8, r0
  1050d8:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  1050dc:	ebffef08 	bl	100d04 <__malloc_lock>
  1050e0:	e244e008 	sub	lr, r4, #8	; 0x8
  1050e4:	e59e0004 	ldr	r0, [lr, #4]
  1050e8:	e59f726c 	ldr	r7, [pc, #620]	; 10535c <prog+0x5318>
  1050ec:	e3c01001 	bic	r1, r0, #1	; 0x1
  1050f0:	e08ec001 	add	ip, lr, r1
  1050f4:	e5973008 	ldr	r3, [r7, #8]
  1050f8:	e59c2004 	ldr	r2, [ip, #4]
  1050fc:	e15c0003 	cmp	ip, r3
  105100:	e3c25003 	bic	r5, r2, #3	; 0x3
  105104:	e1a0a007 	mov	sl, r7
  105108:	0a000077 	beq	1052ec <_free_r+0x220>
  10510c:	e2106001 	ands	r6, r0, #1	; 0x1
  105110:	e58c5004 	str	r5, [ip, #4]
  105114:	13a00000 	movne	r0, #0	; 0x0
  105118:	0a000018 	beq	105180 <_free_r+0xb4>
  10511c:	e08c3005 	add	r3, ip, r5
  105120:	e5932004 	ldr	r2, [r3, #4]
  105124:	e3120001 	tst	r2, #1	; 0x1
  105128:	0a000007 	beq	10514c <_free_r+0x80>
  10512c:	e3813001 	orr	r3, r1, #1	; 0x1
  105130:	e3500000 	cmp	r0, #0	; 0x0
  105134:	e58e3004 	str	r3, [lr, #4]
  105138:	e781100e 	str	r1, [r1, lr]
  10513c:	0a00001f 	beq	1051c0 <_free_r+0xf4>
  105140:	e1a00008 	mov	r0, r8
  105144:	e8bd45f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, lr}
  105148:	eaffeeee 	b	100d08 <__malloc_unlock>
  10514c:	e3500000 	cmp	r0, #0	; 0x0
  105150:	e0811005 	add	r1, r1, r5
  105154:	159c2008 	ldrne	r2, [ip, #8]
  105158:	0a00004a 	beq	105288 <_free_r+0x1bc>
  10515c:	e59c300c 	ldr	r3, [ip, #12]
  105160:	e3500000 	cmp	r0, #0	; 0x0
  105164:	e5832008 	str	r2, [r3, #8]
  105168:	e582300c 	str	r3, [r2, #12]
  10516c:	e3813001 	orr	r3, r1, #1	; 0x1
  105170:	e58e3004 	str	r3, [lr, #4]
  105174:	e781100e 	str	r1, [r1, lr]
  105178:	1afffff0 	bne	105140 <_free_r+0x74>
  10517c:	ea00000f 	b	1051c0 <_free_r+0xf4>
  105180:	e5142008 	ldr	r2, [r4, #-8]
  105184:	e062e00e 	rsb	lr, r2, lr
  105188:	e59e0008 	ldr	r0, [lr, #8]
  10518c:	e2873008 	add	r3, r7, #8	; 0x8
  105190:	e1500003 	cmp	r0, r3
  105194:	159e300c 	ldrne	r3, [lr, #12]
  105198:	15830008 	strne	r0, [r3, #8]
  10519c:	1580300c 	strne	r3, [r0, #12]
  1051a0:	e08c3005 	add	r3, ip, r5
  1051a4:	e0811002 	add	r1, r1, r2
  1051a8:	e5932004 	ldr	r2, [r3, #4]
  1051ac:	03a00001 	moveq	r0, #1	; 0x1
  1051b0:	11a00006 	movne	r0, r6
  1051b4:	e3120001 	tst	r2, #1	; 0x1
  1051b8:	1affffdb 	bne	10512c <_free_r+0x60>
  1051bc:	eaffffe2 	b	10514c <_free_r+0x80>
  1051c0:	e3510c02 	cmp	r1, #512	; 0x200
  1051c4:	3a00003b 	bcc	1052b8 <_free_r+0x1ec>
  1051c8:	e1b024a1 	movs	r2, r1, lsr #9
  1051cc:	01a021a1 	moveq	r2, r1, lsr #3
  1051d0:	01a03182 	moveq	r3, r2, lsl #3
  1051d4:	0a00001a 	beq	105244 <_free_r+0x178>
  1051d8:	e3520004 	cmp	r2, #4	; 0x4
  1051dc:	91a03321 	movls	r3, r1, lsr #6
  1051e0:	92832038 	addls	r2, r3, #56	; 0x38
  1051e4:	91a03182 	movls	r3, r2, lsl #3
  1051e8:	9a000015 	bls	105244 <_free_r+0x178>
  1051ec:	e3520014 	cmp	r2, #20	; 0x14
  1051f0:	9282205b 	addls	r2, r2, #91	; 0x5b
  1051f4:	91a03182 	movls	r3, r2, lsl #3
  1051f8:	9a000011 	bls	105244 <_free_r+0x178>
  1051fc:	e3520054 	cmp	r2, #84	; 0x54
  105200:	91a03621 	movls	r3, r1, lsr #12
  105204:	9283206e 	addls	r2, r3, #110	; 0x6e
  105208:	91a03182 	movls	r3, r2, lsl #3
  10520c:	9a00000c 	bls	105244 <_free_r+0x178>
  105210:	e3520f55 	cmp	r2, #340	; 0x154
  105214:	91a037a1 	movls	r3, r1, lsr #15
  105218:	92832077 	addls	r2, r3, #119	; 0x77
  10521c:	91a03182 	movls	r3, r2, lsl #3
  105220:	9a000007 	bls	105244 <_free_r+0x178>
  105224:	e3a03e55 	mov	r3, #1360	; 0x550
  105228:	e2833004 	add	r3, r3, #4	; 0x4
  10522c:	e1520003 	cmp	r2, r3
  105230:	91a03921 	movls	r3, r1, lsr #18
  105234:	9283207c 	addls	r2, r3, #124	; 0x7c
  105238:	83a0207e 	movhi	r2, #126	; 0x7e
  10523c:	82433f59 	subhi	r3, r3, #356	; 0x164
  105240:	91a03182 	movls	r3, r2, lsl #3
  105244:	e083c00a 	add	ip, r3, sl
  105248:	e59c0008 	ldr	r0, [ip, #8]
  10524c:	e15c0000 	cmp	ip, r0
  105250:	0a00003b 	beq	105344 <_free_r+0x278>
  105254:	e5903004 	ldr	r3, [r0, #4]
  105258:	e3c33003 	bic	r3, r3, #3	; 0x3
  10525c:	e1510003 	cmp	r1, r3
  105260:	2a000002 	bcs	105270 <_free_r+0x1a4>
  105264:	e5900008 	ldr	r0, [r0, #8]
  105268:	e15c0000 	cmp	ip, r0
  10526c:	1afffff8 	bne	105254 <_free_r+0x188>
  105270:	e590c00c 	ldr	ip, [r0, #12]
  105274:	e58ec00c 	str	ip, [lr, #12]
  105278:	e58e0008 	str	r0, [lr, #8]
  10527c:	e580e00c 	str	lr, [r0, #12]
  105280:	e58ce008 	str	lr, [ip, #8]
  105284:	eaffffad 	b	105140 <_free_r+0x74>
  105288:	e59c2008 	ldr	r2, [ip, #8]
  10528c:	e59f30cc 	ldr	r3, [pc, #204]	; 105360 <prog+0x531c>
  105290:	e1520003 	cmp	r2, r3
  105294:	1affffb0 	bne	10515c <_free_r+0x90>
  105298:	e3813001 	orr	r3, r1, #1	; 0x1
  10529c:	e582e00c 	str	lr, [r2, #12]
  1052a0:	e582e008 	str	lr, [r2, #8]
  1052a4:	e781100e 	str	r1, [r1, lr]
  1052a8:	e58e3004 	str	r3, [lr, #4]
  1052ac:	e58e2008 	str	r2, [lr, #8]
  1052b0:	e58e200c 	str	r2, [lr, #12]
  1052b4:	eaffffa1 	b	105140 <_free_r+0x74>
  1052b8:	e1a011a1 	mov	r1, r1, lsr #3
  1052bc:	e5972004 	ldr	r2, [r7, #4]
  1052c0:	e1a00121 	mov	r0, r1, lsr #2
  1052c4:	e3a03001 	mov	r3, #1	; 0x1
  1052c8:	e1822013 	orr	r2, r2, r3, lsl r0
  1052cc:	e08a1181 	add	r1, sl, r1, lsl #3
  1052d0:	e5913008 	ldr	r3, [r1, #8]
  1052d4:	e58e100c 	str	r1, [lr, #12]
  1052d8:	e58e3008 	str	r3, [lr, #8]
  1052dc:	e5872004 	str	r2, [r7, #4]
  1052e0:	e583e00c 	str	lr, [r3, #12]
  1052e4:	e581e008 	str	lr, [r1, #8]
  1052e8:	eaffff94 	b	105140 <_free_r+0x74>
  1052ec:	e3100001 	tst	r0, #1	; 0x1
  1052f0:	e0810005 	add	r0, r1, r5
  1052f4:	1a000006 	bne	105314 <_free_r+0x248>
  1052f8:	e5141008 	ldr	r1, [r4, #-8]
  1052fc:	e061e00e 	rsb	lr, r1, lr
  105300:	e59e200c 	ldr	r2, [lr, #12]
  105304:	e59e3008 	ldr	r3, [lr, #8]
  105308:	e5823008 	str	r3, [r2, #8]
  10530c:	e583200c 	str	r2, [r3, #12]
  105310:	e0800001 	add	r0, r0, r1
  105314:	e59f3048 	ldr	r3, [pc, #72]	; 105364 <prog+0x5320>
  105318:	e5932000 	ldr	r2, [r3]
  10531c:	e3803001 	orr	r3, r0, #1	; 0x1
  105320:	e1500002 	cmp	r0, r2
  105324:	e587e008 	str	lr, [r7, #8]
  105328:	e58e3004 	str	r3, [lr, #4]
  10532c:	3affff83 	bcc	105140 <_free_r+0x74>
  105330:	e59f3030 	ldr	r3, [pc, #48]	; 105368 <prog+0x5324>
  105334:	e1a00008 	mov	r0, r8
  105338:	e5931000 	ldr	r1, [r3]
  10533c:	ebffff23 	bl	104fd0 <_malloc_trim_r>
  105340:	eaffff7e 	b	105140 <_free_r+0x74>
  105344:	e5973004 	ldr	r3, [r7, #4]
  105348:	e1a01122 	mov	r1, r2, lsr #2
  10534c:	e3a02001 	mov	r2, #1	; 0x1
  105350:	e1833112 	orr	r3, r3, r2, lsl r1
  105354:	e5873004 	str	r3, [r7, #4]
  105358:	eaffffc5 	b	105274 <_free_r+0x1a8>
  10535c:	00200000 	eoreq	r0, r0, r0
  105360:	00200008 	eoreq	r0, r0, r8
  105364:	00200408 	eoreq	r0, r0, r8, lsl #8
  105368:	00200b88 	eoreq	r0, r0, r8, lsl #23

0010536c <__sfvwrite>:
  10536c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  105370:	e5913008 	ldr	r3, [r1, #8]
  105374:	e3530000 	cmp	r3, #0	; 0x0
  105378:	e24dd004 	sub	sp, sp, #4	; 0x4
  10537c:	e1a0a001 	mov	sl, r1
  105380:	e1a06000 	mov	r6, r0
  105384:	0a00001c 	beq	1053fc <__sfvwrite+0x90>
  105388:	e1d010bc 	ldrh	r1, [r0, #12]
  10538c:	e3110008 	tst	r1, #8	; 0x8
  105390:	0a0000e8 	beq	105738 <__sfvwrite+0x3cc>
  105394:	e5903010 	ldr	r3, [r0, #16]
  105398:	e3530000 	cmp	r3, #0	; 0x0
  10539c:	0a0000e5 	beq	105738 <__sfvwrite+0x3cc>
  1053a0:	e3110002 	tst	r1, #2	; 0x2
  1053a4:	13a04000 	movne	r4, #0	; 0x0
  1053a8:	e59a8000 	ldr	r8, [sl]
  1053ac:	11a05004 	movne	r5, r4
  1053b0:	0a000018 	beq	105418 <__sfvwrite+0xac>
  1053b4:	e3540000 	cmp	r4, #0	; 0x0
  1053b8:	e1a01005 	mov	r1, r5
  1053bc:	0a000011 	beq	105408 <__sfvwrite+0x9c>
  1053c0:	e3540b01 	cmp	r4, #1024	; 0x400
  1053c4:	31a02004 	movcc	r2, r4
  1053c8:	23a02b01 	movcs	r2, #1024	; 0x400
  1053cc:	e596001c 	ldr	r0, [r6, #28]
  1053d0:	e1a0e00f 	mov	lr, pc
  1053d4:	e596f024 	ldr	pc, [r6, #36]
  1053d8:	e3500000 	cmp	r0, #0	; 0x0
  1053dc:	e0604004 	rsb	r4, r0, r4
  1053e0:	e0855000 	add	r5, r5, r0
  1053e4:	da00005b 	ble	105558 <__sfvwrite+0x1ec>
  1053e8:	e59a3008 	ldr	r3, [sl, #8]
  1053ec:	e0603003 	rsb	r3, r0, r3
  1053f0:	e3530000 	cmp	r3, #0	; 0x0
  1053f4:	e58a3008 	str	r3, [sl, #8]
  1053f8:	1affffed 	bne	1053b4 <__sfvwrite+0x48>
  1053fc:	e3a00000 	mov	r0, #0	; 0x0
  105400:	e28dd004 	add	sp, sp, #4	; 0x4
  105404:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  105408:	e5985000 	ldr	r5, [r8]
  10540c:	e5984004 	ldr	r4, [r8, #4]
  105410:	e2888008 	add	r8, r8, #8	; 0x8
  105414:	eaffffe6 	b	1053b4 <__sfvwrite+0x48>
  105418:	e2112001 	ands	r2, r1, #1	; 0x1
  10541c:	13a07000 	movne	r7, #0	; 0x0
  105420:	11a09007 	movne	r9, r7
  105424:	158d7000 	strne	r7, [sp]
  105428:	11a0b007 	movne	fp, r7
  10542c:	0a00005b 	beq	1055a0 <__sfvwrite+0x234>
  105430:	e3570000 	cmp	r7, #0	; 0x0
  105434:	0a000025 	beq	1054d0 <__sfvwrite+0x164>
  105438:	e59d3000 	ldr	r3, [sp]
  10543c:	e3530000 	cmp	r3, #0	; 0x0
  105440:	0a000049 	beq	10556c <__sfvwrite+0x200>
  105444:	e596c014 	ldr	ip, [r6, #20]
  105448:	e5961008 	ldr	r1, [r6, #8]
  10544c:	e5960000 	ldr	r0, [r6]
  105450:	e5962010 	ldr	r2, [r6, #16]
  105454:	e157000b 	cmp	r7, fp
  105458:	31a05007 	movcc	r5, r7
  10545c:	21a0500b 	movcs	r5, fp
  105460:	e08c4001 	add	r4, ip, r1
  105464:	e1500002 	cmp	r0, r2
  105468:	93a03000 	movls	r3, #0	; 0x0
  10546c:	83a03001 	movhi	r3, #1	; 0x1
  105470:	e1550004 	cmp	r5, r4
  105474:	d3a03000 	movle	r3, #0	; 0x0
  105478:	e3530000 	cmp	r3, #0	; 0x0
  10547c:	1a00002b 	bne	105530 <__sfvwrite+0x1c4>
  105480:	e155000c 	cmp	r5, ip
  105484:	ba000017 	blt	1054e8 <__sfvwrite+0x17c>
  105488:	e1a0200c 	mov	r2, ip
  10548c:	e596001c 	ldr	r0, [r6, #28]
  105490:	e1a01009 	mov	r1, r9
  105494:	e1a0e00f 	mov	lr, pc
  105498:	e596f024 	ldr	pc, [r6, #36]
  10549c:	e2504000 	subs	r4, r0, #0	; 0x0
  1054a0:	da00002c 	ble	105558 <__sfvwrite+0x1ec>
  1054a4:	e05bb004 	subs	fp, fp, r4
  1054a8:	0a00001a 	beq	105518 <__sfvwrite+0x1ac>
  1054ac:	e59a3008 	ldr	r3, [sl, #8]
  1054b0:	e0643003 	rsb	r3, r4, r3
  1054b4:	e3530000 	cmp	r3, #0	; 0x0
  1054b8:	e58a3008 	str	r3, [sl, #8]
  1054bc:	0affffce 	beq	1053fc <__sfvwrite+0x90>
  1054c0:	e0647007 	rsb	r7, r4, r7
  1054c4:	e3570000 	cmp	r7, #0	; 0x0
  1054c8:	e0899004 	add	r9, r9, r4
  1054cc:	1affffd9 	bne	105438 <__sfvwrite+0xcc>
  1054d0:	e5989000 	ldr	r9, [r8]
  1054d4:	e5987004 	ldr	r7, [r8, #4]
  1054d8:	e3a03000 	mov	r3, #0	; 0x0
  1054dc:	e2888008 	add	r8, r8, #8	; 0x8
  1054e0:	e58d3000 	str	r3, [sp]
  1054e4:	eaffffd1 	b	105430 <__sfvwrite+0xc4>
  1054e8:	e1a02005 	mov	r2, r5
  1054ec:	e1a01009 	mov	r1, r9
  1054f0:	eb00019f 	bl	105b74 <memmove>
  1054f4:	e5963008 	ldr	r3, [r6, #8]
  1054f8:	e5962000 	ldr	r2, [r6]
  1054fc:	e1a04005 	mov	r4, r5
  105500:	e0653003 	rsb	r3, r5, r3
  105504:	e0822005 	add	r2, r2, r5
  105508:	e05bb004 	subs	fp, fp, r4
  10550c:	e5863008 	str	r3, [r6, #8]
  105510:	e5862000 	str	r2, [r6]
  105514:	1affffe4 	bne	1054ac <__sfvwrite+0x140>
  105518:	e1a00006 	mov	r0, r6
  10551c:	ebfffdd4 	bl	104c74 <fflush>
  105520:	e3500000 	cmp	r0, #0	; 0x0
  105524:	1a00000b 	bne	105558 <__sfvwrite+0x1ec>
  105528:	e58d0000 	str	r0, [sp]
  10552c:	eaffffde 	b	1054ac <__sfvwrite+0x140>
  105530:	e1a01009 	mov	r1, r9
  105534:	e1a02004 	mov	r2, r4
  105538:	eb00018d 	bl	105b74 <memmove>
  10553c:	e5963000 	ldr	r3, [r6]
  105540:	e0833004 	add	r3, r3, r4
  105544:	e5863000 	str	r3, [r6]
  105548:	e1a00006 	mov	r0, r6
  10554c:	ebfffdc8 	bl	104c74 <fflush>
  105550:	e3500000 	cmp	r0, #0	; 0x0
  105554:	0affffd2 	beq	1054a4 <__sfvwrite+0x138>
  105558:	e1d630bc 	ldrh	r3, [r6, #12]
  10555c:	e3e00000 	mvn	r0, #0	; 0x0
  105560:	e3833040 	orr	r3, r3, #64	; 0x40
  105564:	e1c630bc 	strh	r3, [r6, #12]
  105568:	eaffffa4 	b	105400 <__sfvwrite+0x94>
  10556c:	e1a00009 	mov	r0, r9
  105570:	e3a0100a 	mov	r1, #10	; 0xa
  105574:	e1a02007 	mov	r2, r7
  105578:	eb00013c 	bl	105a70 <memchr>
  10557c:	e3500000 	cmp	r0, #0	; 0x0
  105580:	10693000 	rsbne	r3, r9, r0
  105584:	1283b001 	addne	fp, r3, #1	; 0x1
  105588:	03a03001 	moveq	r3, #1	; 0x1
  10558c:	13a03001 	movne	r3, #1	; 0x1
  105590:	0287b001 	addeq	fp, r7, #1	; 0x1
  105594:	158d3000 	strne	r3, [sp]
  105598:	058d3000 	streq	r3, [sp]
  10559c:	eaffffa8 	b	105444 <__sfvwrite+0xd8>
  1055a0:	e1a07002 	mov	r7, r2
  1055a4:	e1a09002 	mov	r9, r2
  1055a8:	e3570000 	cmp	r7, #0	; 0x0
  1055ac:	0a000020 	beq	105634 <__sfvwrite+0x2c8>
  1055b0:	e3110c02 	tst	r1, #512	; 0x200
  1055b4:	e5964008 	ldr	r4, [r6, #8]
  1055b8:	0a000021 	beq	105644 <__sfvwrite+0x2d8>
  1055bc:	e1570004 	cmp	r7, r4
  1055c0:	e1a02004 	mov	r2, r4
  1055c4:	9a000001 	bls	1055d0 <__sfvwrite+0x264>
  1055c8:	e3110080 	tst	r1, #128	; 0x80
  1055cc:	1a000047 	bne	1056f0 <__sfvwrite+0x384>
  1055d0:	e1570002 	cmp	r7, r2
  1055d4:	31a02007 	movcc	r2, r7
  1055d8:	e5960000 	ldr	r0, [r6]
  1055dc:	e1a01009 	mov	r1, r9
  1055e0:	31a04007 	movcc	r4, r7
  1055e4:	eb000162 	bl	105b74 <memmove>
  1055e8:	e5963008 	ldr	r3, [r6, #8]
  1055ec:	e5962000 	ldr	r2, [r6]
  1055f0:	e0643003 	rsb	r3, r4, r3
  1055f4:	e0822004 	add	r2, r2, r4
  1055f8:	e5863008 	str	r3, [r6, #8]
  1055fc:	e5862000 	str	r2, [r6]
  105600:	e1a05007 	mov	r5, r7
  105604:	e1a00007 	mov	r0, r7
  105608:	e1a04007 	mov	r4, r7
  10560c:	e59a3008 	ldr	r3, [sl, #8]
  105610:	e0643003 	rsb	r3, r4, r3
  105614:	e3530000 	cmp	r3, #0	; 0x0
  105618:	e58a3008 	str	r3, [sl, #8]
  10561c:	0affff76 	beq	1053fc <__sfvwrite+0x90>
  105620:	e0657007 	rsb	r7, r5, r7
  105624:	e3570000 	cmp	r7, #0	; 0x0
  105628:	e1d610bc 	ldrh	r1, [r6, #12]
  10562c:	e0899000 	add	r9, r9, r0
  105630:	1affffde 	bne	1055b0 <__sfvwrite+0x244>
  105634:	e5989000 	ldr	r9, [r8]
  105638:	e5987004 	ldr	r7, [r8, #4]
  10563c:	e2888008 	add	r8, r8, #8	; 0x8
  105640:	eaffffd8 	b	1055a8 <__sfvwrite+0x23c>
  105644:	e5960000 	ldr	r0, [r6]
  105648:	e5963010 	ldr	r3, [r6, #16]
  10564c:	e1500003 	cmp	r0, r3
  105650:	81570004 	cmphi	r7, r4
  105654:	e1a05004 	mov	r5, r4
  105658:	8a000018 	bhi	1056c0 <__sfvwrite+0x354>
  10565c:	e5962014 	ldr	r2, [r6, #20]
  105660:	e1570002 	cmp	r7, r2
  105664:	3a000008 	bcc	10568c <__sfvwrite+0x320>
  105668:	e596001c 	ldr	r0, [r6, #28]
  10566c:	e1a01009 	mov	r1, r9
  105670:	e1a0e00f 	mov	lr, pc
  105674:	e596f024 	ldr	pc, [r6, #36]
  105678:	e2504000 	subs	r4, r0, #0	; 0x0
  10567c:	daffffb5 	ble	105558 <__sfvwrite+0x1ec>
  105680:	e1a05004 	mov	r5, r4
  105684:	e1a00004 	mov	r0, r4
  105688:	eaffffdf 	b	10560c <__sfvwrite+0x2a0>
  10568c:	e1a02007 	mov	r2, r7
  105690:	e1a01009 	mov	r1, r9
  105694:	eb000136 	bl	105b74 <memmove>
  105698:	e5963008 	ldr	r3, [r6, #8]
  10569c:	e5962000 	ldr	r2, [r6]
  1056a0:	e0673003 	rsb	r3, r7, r3
  1056a4:	e0822007 	add	r2, r2, r7
  1056a8:	e1a04007 	mov	r4, r7
  1056ac:	e1a05007 	mov	r5, r7
  1056b0:	e1a00007 	mov	r0, r7
  1056b4:	e5863008 	str	r3, [r6, #8]
  1056b8:	e5862000 	str	r2, [r6]
  1056bc:	eaffffd2 	b	10560c <__sfvwrite+0x2a0>
  1056c0:	e1a01009 	mov	r1, r9
  1056c4:	e1a02004 	mov	r2, r4
  1056c8:	eb000129 	bl	105b74 <memmove>
  1056cc:	e5963000 	ldr	r3, [r6]
  1056d0:	e0833004 	add	r3, r3, r4
  1056d4:	e5863000 	str	r3, [r6]
  1056d8:	e1a00006 	mov	r0, r6
  1056dc:	ebfffd64 	bl	104c74 <fflush>
  1056e0:	e3500000 	cmp	r0, #0	; 0x0
  1056e4:	e1a00004 	mov	r0, r4
  1056e8:	0affffc7 	beq	10560c <__sfvwrite+0x2a0>
  1056ec:	eaffff99 	b	105558 <__sfvwrite+0x1ec>
  1056f0:	e5961010 	ldr	r1, [r6, #16]
  1056f4:	e5963000 	ldr	r3, [r6]
  1056f8:	e59fb060 	ldr	fp, [pc, #96]	; 105760 <prog+0x571c>
  1056fc:	e0614003 	rsb	r4, r1, r3
  105700:	e0875004 	add	r5, r7, r4
  105704:	e59b0000 	ldr	r0, [fp]
  105708:	e1a02005 	mov	r2, r5
  10570c:	eb000443 	bl	106820 <_realloc_r>
  105710:	e3500000 	cmp	r0, #0	; 0x0
  105714:	0a00000d 	beq	105750 <__sfvwrite+0x3e4>
  105718:	e0803004 	add	r3, r0, r4
  10571c:	e1a02007 	mov	r2, r7
  105720:	e1a04007 	mov	r4, r7
  105724:	e5863000 	str	r3, [r6]
  105728:	e5865014 	str	r5, [r6, #20]
  10572c:	e5860010 	str	r0, [r6, #16]
  105730:	e5867008 	str	r7, [r6, #8]
  105734:	eaffffa5 	b	1055d0 <__sfvwrite+0x264>
  105738:	ebfff77b 	bl	10352c <__swsetup>
  10573c:	e3500000 	cmp	r0, #0	; 0x0
  105740:	13e00000 	mvnne	r0, #0	; 0x0
  105744:	1affff2d 	bne	105400 <__sfvwrite+0x94>
  105748:	e1d610bc 	ldrh	r1, [r6, #12]
  10574c:	eaffff13 	b	1053a0 <__sfvwrite+0x34>
  105750:	e59b0000 	ldr	r0, [fp]
  105754:	e5961010 	ldr	r1, [r6, #16]
  105758:	ebfffe5b 	bl	1050cc <_free_r>
  10575c:	eaffff7d 	b	105558 <__sfvwrite+0x1ec>
  105760:	00200410 	eoreq	r0, r0, r0, lsl r4

00105764 <_fwalk_reent>:
  105764:	e92d47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
  105768:	e1a08000 	mov	r8, r0
  10576c:	e1a0a001 	mov	sl, r1
  105770:	ebfffd8e 	bl	104db0 <__sfp_lock_acquire>
  105774:	e2987e2e 	adds	r7, r8, #736	; 0x2e0
  105778:	01a09007 	moveq	r9, r7
  10577c:	0a000017 	beq	1057e0 <_fwalk_reent+0x7c>
  105780:	e3a09000 	mov	r9, #0	; 0x0
  105784:	e5973004 	ldr	r3, [r7, #4]
  105788:	e2536001 	subs	r6, r3, #1	; 0x1
  10578c:	e5974008 	ldr	r4, [r7, #8]
  105790:	4a00000f 	bmi	1057d4 <_fwalk_reent+0x70>
  105794:	e3a05000 	mov	r5, #0	; 0x0
  105798:	e1d430fc 	ldrsh	r3, [r4, #12]
  10579c:	e3530000 	cmp	r3, #0	; 0x0
  1057a0:	0a000007 	beq	1057c4 <_fwalk_reent+0x60>
  1057a4:	e1d430fe 	ldrsh	r3, [r4, #14]
  1057a8:	e3730001 	cmn	r3, #1	; 0x1
  1057ac:	e1a01004 	mov	r1, r4
  1057b0:	e1a00008 	mov	r0, r8
  1057b4:	0a000002 	beq	1057c4 <_fwalk_reent+0x60>
  1057b8:	e1a0e00f 	mov	lr, pc
  1057bc:	e12fff1a 	bx	sl
  1057c0:	e1899000 	orr	r9, r9, r0
  1057c4:	e1560005 	cmp	r6, r5
  1057c8:	e284405c 	add	r4, r4, #92	; 0x5c
  1057cc:	e2855001 	add	r5, r5, #1	; 0x1
  1057d0:	1afffff0 	bne	105798 <_fwalk_reent+0x34>
  1057d4:	e5977000 	ldr	r7, [r7]
  1057d8:	e3570000 	cmp	r7, #0	; 0x0
  1057dc:	1affffe8 	bne	105784 <_fwalk_reent+0x20>
  1057e0:	ebfffd73 	bl	104db4 <__sfp_lock_release>
  1057e4:	e1a00009 	mov	r0, r9
  1057e8:	e8bd87f0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

001057ec <_fwalk>:
  1057ec:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  1057f0:	e1a04000 	mov	r4, r0
  1057f4:	e1a08001 	mov	r8, r1
  1057f8:	ebfffd6c 	bl	104db0 <__sfp_lock_acquire>
  1057fc:	e2947e2e 	adds	r7, r4, #736	; 0x2e0
  105800:	01a0a007 	moveq	sl, r7
  105804:	0a000016 	beq	105864 <_fwalk+0x78>
  105808:	e3a0a000 	mov	sl, #0	; 0x0
  10580c:	e5973004 	ldr	r3, [r7, #4]
  105810:	e2536001 	subs	r6, r3, #1	; 0x1
  105814:	e5974008 	ldr	r4, [r7, #8]
  105818:	4a00000e 	bmi	105858 <_fwalk+0x6c>
  10581c:	e3a05000 	mov	r5, #0	; 0x0
  105820:	e1d430fc 	ldrsh	r3, [r4, #12]
  105824:	e3530000 	cmp	r3, #0	; 0x0
  105828:	0a000006 	beq	105848 <_fwalk+0x5c>
  10582c:	e1d430fe 	ldrsh	r3, [r4, #14]
  105830:	e3730001 	cmn	r3, #1	; 0x1
  105834:	e1a00004 	mov	r0, r4
  105838:	0a000002 	beq	105848 <_fwalk+0x5c>
  10583c:	e1a0e00f 	mov	lr, pc
  105840:	e12fff18 	bx	r8
  105844:	e18aa000 	orr	sl, sl, r0
  105848:	e1560005 	cmp	r6, r5
  10584c:	e284405c 	add	r4, r4, #92	; 0x5c
  105850:	e2855001 	add	r5, r5, #1	; 0x1
  105854:	1afffff1 	bne	105820 <_fwalk+0x34>
  105858:	e5977000 	ldr	r7, [r7]
  10585c:	e3570000 	cmp	r7, #0	; 0x0
  105860:	1affffe9 	bne	10580c <_fwalk+0x20>
  105864:	ebfffd52 	bl	104db4 <__sfp_lock_release>
  105868:	e1a0000a 	mov	r0, sl
  10586c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}

00105870 <__locale_charset>:
  105870:	e59f3004 	ldr	r3, [pc, #4]	; 10587c <prog+0x5838>
  105874:	e5930000 	ldr	r0, [r3]
  105878:	e12fff1e 	bx	lr
  10587c:	0010c864 	andeqs	ip, r0, r4, ror #16

00105880 <_localeconv_r>:
  105880:	e59f0000 	ldr	r0, [pc, #0]	; 105888 <prog+0x5844>
  105884:	e12fff1e 	bx	lr
  105888:	0010c834 	andeqs	ip, r0, r4, lsr r8

0010588c <localeconv>:
  10588c:	e59f3004 	ldr	r3, [pc, #4]	; 105898 <prog+0x5854>
  105890:	e5930000 	ldr	r0, [r3]
  105894:	eafffff9 	b	105880 <_localeconv_r>
  105898:	00200410 	eoreq	r0, r0, r0, lsl r4

0010589c <_setlocale_r>:
  10589c:	e59f3054 	ldr	r3, [pc, #84]	; 1058f8 <prog+0x58b4>
  1058a0:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  1058a4:	e2524000 	subs	r4, r2, #0	; 0x0
  1058a8:	e1a05000 	mov	r5, r0
  1058ac:	e1a06001 	mov	r6, r1
  1058b0:	e1a00004 	mov	r0, r4
  1058b4:	e1a01003 	mov	r1, r3
  1058b8:	0a000007 	beq	1058dc <_setlocale_r+0x40>
  1058bc:	eb0005c0 	bl	106fc4 <strcmp>
  1058c0:	e3500000 	cmp	r0, #0	; 0x0
  1058c4:	e59f1030 	ldr	r1, [pc, #48]	; 1058fc <prog+0x58b8>
  1058c8:	e1a00004 	mov	r0, r4
  1058cc:	1a000004 	bne	1058e4 <_setlocale_r+0x48>
  1058d0:	e5854034 	str	r4, [r5, #52]
  1058d4:	e5856030 	str	r6, [r5, #48]
  1058d8:	e59f3018 	ldr	r3, [pc, #24]	; 1058f8 <prog+0x58b4>
  1058dc:	e1a00003 	mov	r0, r3
  1058e0:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  1058e4:	eb0005b6 	bl	106fc4 <strcmp>
  1058e8:	e3500000 	cmp	r0, #0	; 0x0
  1058ec:	e3a03000 	mov	r3, #0	; 0x0
  1058f0:	0afffff6 	beq	1058d0 <_setlocale_r+0x34>
  1058f4:	eafffff8 	b	1058dc <_setlocale_r+0x40>
  1058f8:	0010cf8c 	andeqs	ip, r0, ip, lsl #31
  1058fc:	0010cdec 	andeqs	ip, r0, ip, ror #27

00105900 <setlocale>:
  105900:	e1a02001 	mov	r2, r1
  105904:	e59f100c 	ldr	r1, [pc, #12]	; 105918 <prog+0x58d4>
  105908:	e1a03000 	mov	r3, r0
  10590c:	e5910000 	ldr	r0, [r1]
  105910:	e1a01003 	mov	r1, r3
  105914:	eaffffe0 	b	10589c <_setlocale_r>
  105918:	00200410 	eoreq	r0, r0, r0, lsl r4

0010591c <__smakebuf>:
  10591c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  105920:	e1d030bc 	ldrh	r3, [r0, #12]
  105924:	e3130002 	tst	r3, #2	; 0x2
  105928:	12802043 	addne	r2, r0, #67	; 0x43
  10592c:	13a03001 	movne	r3, #1	; 0x1
  105930:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  105934:	e1a04000 	mov	r4, r0
  105938:	15803014 	strne	r3, [r0, #20]
  10593c:	15802010 	strne	r2, [r0, #16]
  105940:	15802000 	strne	r2, [r0]
  105944:	1a000025 	bne	1059e0 <__smakebuf+0xc4>
  105948:	e1d010fe 	ldrsh	r1, [r0, #14]
  10594c:	e3510000 	cmp	r1, #0	; 0x0
  105950:	ba000024 	blt	1059e8 <__smakebuf+0xcc>
  105954:	e59f5108 	ldr	r5, [pc, #264]	; 105a64 <prog+0x5a20>
  105958:	e1a0200d 	mov	r2, sp
  10595c:	e5950000 	ldr	r0, [r5]
  105960:	eb000ecc 	bl	109498 <_fstat_r>
  105964:	e3500000 	cmp	r0, #0	; 0x0
  105968:	b1d430bc 	ldrlth	r3, [r4, #12]
  10596c:	ba00001e 	blt	1059ec <__smakebuf+0xd0>
  105970:	e59d3004 	ldr	r3, [sp, #4]
  105974:	e2033a0f 	and	r3, r3, #61440	; 0xf000
  105978:	e3530a02 	cmp	r3, #8192	; 0x2000
  10597c:	13a06000 	movne	r6, #0	; 0x0
  105980:	03a06001 	moveq	r6, #1	; 0x1
  105984:	e3530902 	cmp	r3, #32768	; 0x8000
  105988:	0a000022 	beq	105a18 <__smakebuf+0xfc>
  10598c:	e1d430bc 	ldrh	r3, [r4, #12]
  105990:	e3833b02 	orr	r3, r3, #2048	; 0x800
  105994:	e1c430bc 	strh	r3, [r4, #12]
  105998:	e5950000 	ldr	r0, [r5]
  10599c:	e3a01b01 	mov	r1, #1024	; 0x400
  1059a0:	ebffeaad 	bl	10045c <_malloc_r>
  1059a4:	e3500000 	cmp	r0, #0	; 0x0
  1059a8:	0a000024 	beq	105a40 <__smakebuf+0x124>
  1059ac:	e59f30b0 	ldr	r3, [pc, #176]	; 105a64 <prog+0x5a20>
  1059b0:	e1d420bc 	ldrh	r2, [r4, #12]
  1059b4:	e5931000 	ldr	r1, [r3]
  1059b8:	e59f30a8 	ldr	r3, [pc, #168]	; 105a68 <prog+0x5a24>
  1059bc:	e3822080 	orr	r2, r2, #128	; 0x80
  1059c0:	e581303c 	str	r3, [r1, #60]
  1059c4:	e3560000 	cmp	r6, #0	; 0x0
  1059c8:	e3a03b01 	mov	r3, #1024	; 0x400
  1059cc:	e1c420bc 	strh	r2, [r4, #12]
  1059d0:	e5840010 	str	r0, [r4, #16]
  1059d4:	e5843014 	str	r3, [r4, #20]
  1059d8:	e5840000 	str	r0, [r4]
  1059dc:	1a000006 	bne	1059fc <__smakebuf+0xe0>
  1059e0:	e28dd03c 	add	sp, sp, #60	; 0x3c
  1059e4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  1059e8:	e59f5074 	ldr	r5, [pc, #116]	; 105a64 <prog+0x5a20>
  1059ec:	e3833b02 	orr	r3, r3, #2048	; 0x800
  1059f0:	e3a06000 	mov	r6, #0	; 0x0
  1059f4:	e1c430bc 	strh	r3, [r4, #12]
  1059f8:	eaffffe6 	b	105998 <__smakebuf+0x7c>
  1059fc:	e1d400fe 	ldrsh	r0, [r4, #14]
  105a00:	eb0005b6 	bl	1070e0 <isatty>
  105a04:	e3500000 	cmp	r0, #0	; 0x0
  105a08:	11d430bc 	ldrneh	r3, [r4, #12]
  105a0c:	13833001 	orrne	r3, r3, #1	; 0x1
  105a10:	11c430bc 	strneh	r3, [r4, #12]
  105a14:	eafffff1 	b	1059e0 <__smakebuf+0xc4>
  105a18:	e5942028 	ldr	r2, [r4, #40]
  105a1c:	e59f3048 	ldr	r3, [pc, #72]	; 105a6c <prog+0x5a28>
  105a20:	e1520003 	cmp	r2, r3
  105a24:	1affffd8 	bne	10598c <__smakebuf+0x70>
  105a28:	e1d430bc 	ldrh	r3, [r4, #12]
  105a2c:	e3a02b01 	mov	r2, #1024	; 0x400
  105a30:	e3833b01 	orr	r3, r3, #1024	; 0x400
  105a34:	e1c430bc 	strh	r3, [r4, #12]
  105a38:	e584204c 	str	r2, [r4, #76]
  105a3c:	eaffffd5 	b	105998 <__smakebuf+0x7c>
  105a40:	e1d430bc 	ldrh	r3, [r4, #12]
  105a44:	e2841043 	add	r1, r4, #67	; 0x43
  105a48:	e3833002 	orr	r3, r3, #2	; 0x2
  105a4c:	e3a02001 	mov	r2, #1	; 0x1
  105a50:	e5842014 	str	r2, [r4, #20]
  105a54:	e1c430bc 	strh	r3, [r4, #12]
  105a58:	e5841010 	str	r1, [r4, #16]
  105a5c:	e5841000 	str	r1, [r4]
  105a60:	eaffffde 	b	1059e0 <__smakebuf+0xc4>
  105a64:	00200410 	eoreq	r0, r0, r0, lsl r4
  105a68:	00104e78 	andeqs	r4, r0, r8, ror lr
  105a6c:	00106ed8 	ldreqsb	r6, [r0], -r8

00105a70 <memchr>:
  105a70:	e1a0c002 	mov	ip, r2
  105a74:	e35c0003 	cmp	ip, #3	; 0x3
  105a78:	e52de004 	str	lr, [sp, #-4]!
  105a7c:	e1a02000 	mov	r2, r0
  105a80:	e20110ff 	and	r1, r1, #255	; 0xff
  105a84:	9a000001 	bls	105a90 <memchr+0x20>
  105a88:	e2103003 	ands	r3, r0, #3	; 0x3
  105a8c:	0a00000e 	beq	105acc <memchr+0x5c>
  105a90:	e25c2001 	subs	r2, ip, #1	; 0x1
  105a94:	3a00000a 	bcc	105ac4 <memchr+0x54>
  105a98:	e5d03000 	ldrb	r3, [r0]
  105a9c:	e1510003 	cmp	r1, r3
  105aa0:	049df004 	ldreq	pc, [sp], #4
  105aa4:	e3a0c000 	mov	ip, #0	; 0x0
  105aa8:	ea000002 	b	105ab8 <memchr+0x48>
  105aac:	e5f03001 	ldrb	r3, [r0, #1]!
  105ab0:	e1510003 	cmp	r1, r3
  105ab4:	0a00002b 	beq	105b68 <memchr+0xf8>
  105ab8:	e152000c 	cmp	r2, ip
  105abc:	e28cc001 	add	ip, ip, #1	; 0x1
  105ac0:	1afffff9 	bne	105aac <memchr+0x3c>
  105ac4:	e3a00000 	mov	r0, #0	; 0x0
  105ac8:	e49df004 	ldr	pc, [sp], #4
  105acc:	e1a0e003 	mov	lr, r3
  105ad0:	e2833001 	add	r3, r3, #1	; 0x1
  105ad4:	e3530004 	cmp	r3, #4	; 0x4
  105ad8:	e081e40e 	add	lr, r1, lr, lsl #8
  105adc:	1afffffb 	bne	105ad0 <memchr+0x60>
  105ae0:	e1a00002 	mov	r0, r2
  105ae4:	e5902000 	ldr	r2, [r0]
  105ae8:	e022200e 	eor	r2, r2, lr
  105aec:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  105af0:	e2433801 	sub	r3, r3, #65536	; 0x10000
  105af4:	e2433c01 	sub	r3, r3, #256	; 0x100
  105af8:	e2433001 	sub	r3, r3, #1	; 0x1
  105afc:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  105b00:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  105b04:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  105b08:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  105b0c:	e1d32002 	bics	r2, r3, r2
  105b10:	e24cc004 	sub	ip, ip, #4	; 0x4
  105b14:	0a00000f 	beq	105b58 <memchr+0xe8>
  105b18:	e5d03000 	ldrb	r3, [r0]
  105b1c:	e1510003 	cmp	r1, r3
  105b20:	e1a02000 	mov	r2, r0
  105b24:	0a000010 	beq	105b6c <memchr+0xfc>
  105b28:	e5d03001 	ldrb	r3, [r0, #1]
  105b2c:	e1510003 	cmp	r1, r3
  105b30:	e2802001 	add	r2, r0, #1	; 0x1
  105b34:	0a00000c 	beq	105b6c <memchr+0xfc>
  105b38:	e5d03002 	ldrb	r3, [r0, #2]
  105b3c:	e1510003 	cmp	r1, r3
  105b40:	e2802002 	add	r2, r0, #2	; 0x2
  105b44:	0a000008 	beq	105b6c <memchr+0xfc>
  105b48:	e5d03003 	ldrb	r3, [r0, #3]
  105b4c:	e1510003 	cmp	r1, r3
  105b50:	e2802003 	add	r2, r0, #3	; 0x3
  105b54:	0a000004 	beq	105b6c <memchr+0xfc>
  105b58:	e35c0003 	cmp	ip, #3	; 0x3
  105b5c:	e2800004 	add	r0, r0, #4	; 0x4
  105b60:	8affffdf 	bhi	105ae4 <memchr+0x74>
  105b64:	eaffffc9 	b	105a90 <memchr+0x20>
  105b68:	e49df004 	ldr	pc, [sp], #4
  105b6c:	e1a00002 	mov	r0, r2
  105b70:	e49df004 	ldr	pc, [sp], #4

00105b74 <memmove>:
  105b74:	e1500001 	cmp	r0, r1
  105b78:	e92d4010 	stmdb	sp!, {r4, lr}
  105b7c:	e1a0c000 	mov	ip, r0
  105b80:	e1a04001 	mov	r4, r1
  105b84:	e1a0e002 	mov	lr, r2
  105b88:	9a000011 	bls	105bd4 <memmove+0x60>
  105b8c:	e0813002 	add	r3, r1, r2
  105b90:	e1500003 	cmp	r0, r3
  105b94:	2a00000e 	bcs	105bd4 <memmove+0x60>
  105b98:	e2522001 	subs	r2, r2, #1	; 0x1
  105b9c:	38bd8010 	ldmccia	sp!, {r4, pc}
  105ba0:	e1a01003 	mov	r1, r3
  105ba4:	e0623003 	rsb	r3, r2, r3
  105ba8:	e243c001 	sub	ip, r3, #1	; 0x1
  105bac:	e080200e 	add	r2, r0, lr
  105bb0:	e5713001 	ldrb	r3, [r1, #-1]!
  105bb4:	e15c0001 	cmp	ip, r1
  105bb8:	e5623001 	strb	r3, [r2, #-1]!
  105bbc:	08bd8010 	ldmeqia	sp!, {r4, pc}
  105bc0:	e5713001 	ldrb	r3, [r1, #-1]!
  105bc4:	e15c0001 	cmp	ip, r1
  105bc8:	e5623001 	strb	r3, [r2, #-1]!
  105bcc:	1afffff7 	bne	105bb0 <memmove+0x3c>
  105bd0:	e8bd8010 	ldmia	sp!, {r4, pc}
  105bd4:	e35e000f 	cmp	lr, #15	; 0xf
  105bd8:	8a000008 	bhi	105c00 <memmove+0x8c>
  105bdc:	e35e0000 	cmp	lr, #0	; 0x0
  105be0:	08bd8010 	ldmeqia	sp!, {r4, pc}
  105be4:	e3a02000 	mov	r2, #0	; 0x0
  105be8:	e4d13001 	ldrb	r3, [r1], #1
  105bec:	e7c2300c 	strb	r3, [r2, ip]
  105bf0:	e2822001 	add	r2, r2, #1	; 0x1
  105bf4:	e152000e 	cmp	r2, lr
  105bf8:	1afffffa 	bne	105be8 <memmove+0x74>
  105bfc:	e8bd8010 	ldmia	sp!, {r4, pc}
  105c00:	e1843000 	orr	r3, r4, r0
  105c04:	e3130003 	tst	r3, #3	; 0x3
  105c08:	1afffff3 	bne	105bdc <memmove+0x68>
  105c0c:	e1a01004 	mov	r1, r4
  105c10:	e1a0c000 	mov	ip, r0
  105c14:	e5913000 	ldr	r3, [r1]
  105c18:	e58c3000 	str	r3, [ip]
  105c1c:	e5912004 	ldr	r2, [r1, #4]
  105c20:	e58c2004 	str	r2, [ip, #4]
  105c24:	e5913008 	ldr	r3, [r1, #8]
  105c28:	e58c3008 	str	r3, [ip, #8]
  105c2c:	e24ee010 	sub	lr, lr, #16	; 0x10
  105c30:	e591300c 	ldr	r3, [r1, #12]
  105c34:	e35e000f 	cmp	lr, #15	; 0xf
  105c38:	e58c300c 	str	r3, [ip, #12]
  105c3c:	e2811010 	add	r1, r1, #16	; 0x10
  105c40:	e28cc010 	add	ip, ip, #16	; 0x10
  105c44:	8afffff2 	bhi	105c14 <memmove+0xa0>
  105c48:	e35e0003 	cmp	lr, #3	; 0x3
  105c4c:	9affffe2 	bls	105bdc <memmove+0x68>
  105c50:	e24ee004 	sub	lr, lr, #4	; 0x4
  105c54:	e4913004 	ldr	r3, [r1], #4
  105c58:	e35e0003 	cmp	lr, #3	; 0x3
  105c5c:	e48c3004 	str	r3, [ip], #4
  105c60:	8afffffa 	bhi	105c50 <memmove+0xdc>
  105c64:	e35e0000 	cmp	lr, #0	; 0x0
  105c68:	1affffdd 	bne	105be4 <memmove+0x70>
  105c6c:	e8bd8010 	ldmia	sp!, {r4, pc}

00105c70 <_Bfree>:
  105c70:	e251c000 	subs	ip, r1, #0	; 0x0
  105c74:	1590104c 	ldrne	r1, [r0, #76]
  105c78:	159c2004 	ldrne	r2, [ip, #4]
  105c7c:	17913102 	ldrne	r3, [r1, r2, lsl #2]
  105c80:	158c3000 	strne	r3, [ip]
  105c84:	1781c102 	strne	ip, [r1, r2, lsl #2]
  105c88:	e12fff1e 	bx	lr

00105c8c <_hi0bits>:
  105c8c:	e1a03820 	mov	r3, r0, lsr #16
  105c90:	e1a03803 	mov	r3, r3, lsl #16
  105c94:	e3530000 	cmp	r3, #0	; 0x0
  105c98:	01a00800 	moveq	r0, r0, lsl #16
  105c9c:	13a03000 	movne	r3, #0	; 0x0
  105ca0:	03a03010 	moveq	r3, #16	; 0x10
  105ca4:	e31004ff 	tst	r0, #-16777216	; 0xff000000
  105ca8:	01a00400 	moveq	r0, r0, lsl #8
  105cac:	02833008 	addeq	r3, r3, #8	; 0x8
  105cb0:	e310020f 	tst	r0, #-268435456	; 0xf0000000
  105cb4:	01a00200 	moveq	r0, r0, lsl #4
  105cb8:	02833004 	addeq	r3, r3, #4	; 0x4
  105cbc:	e3100103 	tst	r0, #-1073741824	; 0xc0000000
  105cc0:	01a00100 	moveq	r0, r0, lsl #2
  105cc4:	02833002 	addeq	r3, r3, #2	; 0x2
  105cc8:	e3500000 	cmp	r0, #0	; 0x0
  105ccc:	ba000002 	blt	105cdc <_hi0bits+0x50>
  105cd0:	e3100101 	tst	r0, #1073741824	; 0x40000000
  105cd4:	03a03020 	moveq	r3, #32	; 0x20
  105cd8:	12833001 	addne	r3, r3, #1	; 0x1
  105cdc:	e1a00003 	mov	r0, r3
  105ce0:	e12fff1e 	bx	lr

00105ce4 <_lo0bits>:
  105ce4:	e5902000 	ldr	r2, [r0]
  105ce8:	e1a01000 	mov	r1, r0
  105cec:	e2120007 	ands	r0, r2, #7	; 0x7
  105cf0:	0a00000a 	beq	105d20 <_lo0bits+0x3c>
  105cf4:	e3120001 	tst	r2, #1	; 0x1
  105cf8:	13a00000 	movne	r0, #0	; 0x0
  105cfc:	112fff1e 	bxne	lr
  105d00:	e3120002 	tst	r2, #2	; 0x2
  105d04:	11a030a2 	movne	r3, r2, lsr #1
  105d08:	01a03122 	moveq	r3, r2, lsr #2
  105d0c:	13a00001 	movne	r0, #1	; 0x1
  105d10:	03a00002 	moveq	r0, #2	; 0x2
  105d14:	15813000 	strne	r3, [r1]
  105d18:	05813000 	streq	r3, [r1]
  105d1c:	e12fff1e 	bx	lr
  105d20:	e1a03802 	mov	r3, r2, lsl #16
  105d24:	e1a03823 	mov	r3, r3, lsr #16
  105d28:	e3530000 	cmp	r3, #0	; 0x0
  105d2c:	01a02822 	moveq	r2, r2, lsr #16
  105d30:	03a00010 	moveq	r0, #16	; 0x10
  105d34:	e31200ff 	tst	r2, #255	; 0xff
  105d38:	01a02422 	moveq	r2, r2, lsr #8
  105d3c:	02800008 	addeq	r0, r0, #8	; 0x8
  105d40:	e312000f 	tst	r2, #15	; 0xf
  105d44:	01a02222 	moveq	r2, r2, lsr #4
  105d48:	02800004 	addeq	r0, r0, #4	; 0x4
  105d4c:	e3120003 	tst	r2, #3	; 0x3
  105d50:	01a02122 	moveq	r2, r2, lsr #2
  105d54:	02800002 	addeq	r0, r0, #2	; 0x2
  105d58:	e3120001 	tst	r2, #1	; 0x1
  105d5c:	1a000003 	bne	105d70 <_lo0bits+0x8c>
  105d60:	e1b020a2 	movs	r2, r2, lsr #1
  105d64:	03a00020 	moveq	r0, #32	; 0x20
  105d68:	012fff1e 	bxeq	lr
  105d6c:	e2800001 	add	r0, r0, #1	; 0x1
  105d70:	e5812000 	str	r2, [r1]
  105d74:	e12fff1e 	bx	lr

00105d78 <__mcmp>:
  105d78:	e5903010 	ldr	r3, [r0, #16]
  105d7c:	e5912010 	ldr	r2, [r1, #16]
  105d80:	e52de004 	str	lr, [sp, #-4]!
  105d84:	e053e002 	subs	lr, r3, r2
  105d88:	1a00000c 	bne	105dc0 <__mcmp+0x48>
  105d8c:	e1a02102 	mov	r2, r2, lsl #2
  105d90:	e2800014 	add	r0, r0, #20	; 0x14
  105d94:	e2823014 	add	r3, r2, #20	; 0x14
  105d98:	e0811003 	add	r1, r1, r3
  105d9c:	e080c002 	add	ip, r0, r2
  105da0:	e51c2004 	ldr	r2, [ip, #-4]
  105da4:	e5113004 	ldr	r3, [r1, #-4]
  105da8:	e1520003 	cmp	r2, r3
  105dac:	e24cc004 	sub	ip, ip, #4	; 0x4
  105db0:	e2411004 	sub	r1, r1, #4	; 0x4
  105db4:	1a000003 	bne	105dc8 <__mcmp+0x50>
  105db8:	e150000c 	cmp	r0, ip
  105dbc:	3afffff7 	bcc	105da0 <__mcmp+0x28>
  105dc0:	e1a0000e 	mov	r0, lr
  105dc4:	e49df004 	ldr	pc, [sp], #4
  105dc8:	33e0e000 	mvncc	lr, #0	; 0x0
  105dcc:	23a0e001 	movcs	lr, #1	; 0x1
  105dd0:	e1a0000e 	mov	r0, lr
  105dd4:	e49df004 	ldr	pc, [sp], #4

00105dd8 <_ulp>:
  105dd8:	e3c00102 	bic	r0, r0, #-2147483648	; 0x80000000
  105ddc:	e1a00a20 	mov	r0, r0, lsr #20
  105de0:	e1a00a00 	mov	r0, r0, lsl #20
  105de4:	e240250d 	sub	r2, r0, #54525952	; 0x3400000
  105de8:	e3520000 	cmp	r2, #0	; 0x0
  105dec:	e2623000 	rsb	r3, r2, #0	; 0x0
  105df0:	e1a0ca43 	mov	ip, r3, asr #20
  105df4:	c1a00002 	movgt	r0, r2
  105df8:	c3a01000 	movgt	r1, #0	; 0x0
  105dfc:	c12fff1e 	bxgt	lr
  105e00:	e35c0013 	cmp	ip, #19	; 0x13
  105e04:	e24c3014 	sub	r3, ip, #20	; 0x14
  105e08:	d3a03702 	movle	r3, #524288	; 0x80000
  105e0c:	d1a00c53 	movle	r0, r3, asr ip
  105e10:	d3a01000 	movle	r1, #0	; 0x0
  105e14:	d12fff1e 	bxle	lr
  105e18:	e353001e 	cmp	r3, #30	; 0x1e
  105e1c:	e263201f 	rsb	r2, r3, #31	; 0x1f
  105e20:	e3a03001 	mov	r3, #1	; 0x1
  105e24:	d3a03001 	movle	r3, #1	; 0x1
  105e28:	d1a03213 	movle	r3, r3, lsl r2
  105e2c:	e3a00000 	mov	r0, #0	; 0x0
  105e30:	e1a01003 	mov	r1, r3
  105e34:	e12fff1e 	bx	lr

00105e38 <_b2d>:
  105e38:	e5903010 	ldr	r3, [r0, #16]
  105e3c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  105e40:	e2806014 	add	r6, r0, #20	; 0x14
  105e44:	e0863103 	add	r3, r6, r3, lsl #2
  105e48:	e5137004 	ldr	r7, [r3, #-4]
  105e4c:	e1a00007 	mov	r0, r7
  105e50:	e1a04001 	mov	r4, r1
  105e54:	e2435004 	sub	r5, r3, #4	; 0x4
  105e58:	ebffff8b 	bl	105c8c <_hi0bits>
  105e5c:	e2603020 	rsb	r3, r0, #32	; 0x20
  105e60:	e350000a 	cmp	r0, #10	; 0xa
  105e64:	e1a02000 	mov	r2, r0
  105e68:	e5843000 	str	r3, [r4]
  105e6c:	ca00000a 	bgt	105e9c <_b2d+0x64>
  105e70:	e1560005 	cmp	r6, r5
  105e74:	35153004 	ldrcc	r3, [r5, #-4]
  105e78:	e260c00b 	rsb	ip, r0, #11	; 0xb
  105e7c:	31a0ec33 	movcc	lr, r3, lsr ip
  105e80:	e1a03c37 	mov	r3, r7, lsr ip
  105e84:	23a0e000 	movcs	lr, #0	; 0x0
  105e88:	e2822015 	add	r2, r2, #21	; 0x15
  105e8c:	e18e1217 	orr	r1, lr, r7, lsl r2
  105e90:	e38305ff 	orr	r0, r3, #1069547520	; 0x3fc00000
  105e94:	e3800603 	orr	r0, r0, #3145728	; 0x300000
  105e98:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  105e9c:	e1560005 	cmp	r6, r5
  105ea0:	23a0e000 	movcs	lr, #0	; 0x0
  105ea4:	3535e004 	ldrcc	lr, [r5, #-4]!
  105ea8:	e250200b 	subs	r2, r0, #11	; 0xb
  105eac:	1a000003 	bne	105ec0 <_b2d+0x88>
  105eb0:	e38705ff 	orr	r0, r7, #1069547520	; 0x3fc00000
  105eb4:	e3800603 	orr	r0, r0, #3145728	; 0x300000
  105eb8:	e1a0100e 	mov	r1, lr
  105ebc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  105ec0:	e1550006 	cmp	r5, r6
  105ec4:	85153004 	ldrhi	r3, [r5, #-4]
  105ec8:	e262c020 	rsb	ip, r2, #32	; 0x20
  105ecc:	81a04c33 	movhi	r4, r3, lsr ip
  105ed0:	e1a03217 	mov	r3, r7, lsl r2
  105ed4:	e38335ff 	orr	r3, r3, #1069547520	; 0x3fc00000
  105ed8:	93a04000 	movls	r4, #0	; 0x0
  105edc:	e3833603 	orr	r3, r3, #3145728	; 0x300000
  105ee0:	e1830c3e 	orr	r0, r3, lr, lsr ip
  105ee4:	e184121e 	orr	r1, r4, lr, lsl r2
  105ee8:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00105eec <_ratio>:
  105eec:	e92d43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
  105ef0:	e24dd008 	sub	sp, sp, #8	; 0x8
  105ef4:	e1a04001 	mov	r4, r1
  105ef8:	e28d1004 	add	r1, sp, #4	; 0x4
  105efc:	e1a05000 	mov	r5, r0
  105f00:	ebffffcc 	bl	105e38 <_b2d>
  105f04:	e1a06000 	mov	r6, r0
  105f08:	e1a07001 	mov	r7, r1
  105f0c:	e1a00004 	mov	r0, r4
  105f10:	e1a0100d 	mov	r1, sp
  105f14:	ebffffc7 	bl	105e38 <_b2d>
  105f18:	e5942010 	ldr	r2, [r4, #16]
  105f1c:	e1a09001 	mov	r9, r1
  105f20:	e5951010 	ldr	r1, [r5, #16]
  105f24:	e59d3004 	ldr	r3, [sp, #4]
  105f28:	e0621001 	rsb	r1, r2, r1
  105f2c:	e59d2000 	ldr	r2, [sp]
  105f30:	e0623003 	rsb	r3, r2, r3
  105f34:	e0833281 	add	r3, r3, r1, lsl #5
  105f38:	e1a08000 	mov	r8, r0
  105f3c:	e3530000 	cmp	r3, #0	; 0x0
  105f40:	c0866a03 	addgt	r6, r6, r3, lsl #20
  105f44:	d0488a03 	suble	r8, r8, r3, lsl #20
  105f48:	e1a00006 	mov	r0, r6
  105f4c:	e1a01007 	mov	r1, r7
  105f50:	e1a02008 	mov	r2, r8
  105f54:	e1a03009 	mov	r3, r9
  105f58:	eb000886 	bl	108178 <__divdf3>
  105f5c:	e28dd008 	add	sp, sp, #8	; 0x8
  105f60:	e8bd83f0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, pc}

00105f64 <_mprec_log10>:
  105f64:	e3500017 	cmp	r0, #23	; 0x17
  105f68:	e92d4010 	stmdb	sp!, {r4, lr}
  105f6c:	e1a04000 	mov	r4, r0
  105f70:	c3a005ff 	movgt	r0, #1069547520	; 0x3fc00000
  105f74:	c2800603 	addgt	r0, r0, #3145728	; 0x300000
  105f78:	c3a01000 	movgt	r1, #0	; 0x0
  105f7c:	ca000003 	bgt	105f90 <_mprec_log10+0x2c>
  105f80:	e59f3024 	ldr	r3, [pc, #36]	; 105fac <prog+0x5f68>
  105f84:	e0833184 	add	r3, r3, r4, lsl #3
  105f88:	e8930003 	ldmia	r3, {r0, r1}
  105f8c:	e8bd8010 	ldmia	sp!, {r4, pc}
  105f90:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  105f94:	e2822709 	add	r2, r2, #2359296	; 0x240000
  105f98:	e3a03000 	mov	r3, #0	; 0x0
  105f9c:	eb000791 	bl	107de8 <__muldf3>
  105fa0:	e2544001 	subs	r4, r4, #1	; 0x1
  105fa4:	1afffff9 	bne	105f90 <_mprec_log10+0x2c>
  105fa8:	e8bd8010 	ldmia	sp!, {r4, pc}
  105fac:	0010c868 	andeqs	ip, r0, r8, ror #16

00105fb0 <_Balloc>:
  105fb0:	e590c04c 	ldr	ip, [r0, #76]
  105fb4:	e35c0000 	cmp	ip, #0	; 0x0
  105fb8:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  105fbc:	e3a02010 	mov	r2, #16	; 0x10
  105fc0:	e1a06001 	mov	r6, r1
  105fc4:	e1a04000 	mov	r4, r0
  105fc8:	e3a01004 	mov	r1, #4	; 0x4
  105fcc:	0a00000c 	beq	106004 <_Balloc+0x54>
  105fd0:	e79c5106 	ldr	r5, [ip, r6, lsl #2]
  105fd4:	e3550000 	cmp	r5, #0	; 0x0
  105fd8:	15953000 	ldrne	r3, [r5]
  105fdc:	e3a02001 	mov	r2, #1	; 0x1
  105fe0:	e1a00004 	mov	r0, r4
  105fe4:	e1a01002 	mov	r1, r2
  105fe8:	178c3106 	strne	r3, [ip, r6, lsl #2]
  105fec:	0a00000b 	beq	106020 <_Balloc+0x70>
  105ff0:	e3a03000 	mov	r3, #0	; 0x0
  105ff4:	e585300c 	str	r3, [r5, #12]
  105ff8:	e5853010 	str	r3, [r5, #16]
  105ffc:	e1a00005 	mov	r0, r5
  106000:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  106004:	eb0005e4 	bl	10779c <_calloc_r>
  106008:	e3500000 	cmp	r0, #0	; 0x0
  10600c:	e1a0c000 	mov	ip, r0
  106010:	e1a05000 	mov	r5, r0
  106014:	e584004c 	str	r0, [r4, #76]
  106018:	1affffec 	bne	105fd0 <_Balloc+0x20>
  10601c:	eafffff6 	b	105ffc <_Balloc+0x4c>
  106020:	e1a04612 	mov	r4, r2, lsl r6
  106024:	e1a02104 	mov	r2, r4, lsl #2
  106028:	e2822014 	add	r2, r2, #20	; 0x14
  10602c:	eb0005da 	bl	10779c <_calloc_r>
  106030:	e3500000 	cmp	r0, #0	; 0x0
  106034:	0afffff0 	beq	105ffc <_Balloc+0x4c>
  106038:	e1a05000 	mov	r5, r0
  10603c:	e5806004 	str	r6, [r0, #4]
  106040:	e5804008 	str	r4, [r0, #8]
  106044:	eaffffe9 	b	105ff0 <_Balloc+0x40>

00106048 <_d2b>:
  106048:	e92d47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
  10604c:	e1a04001 	mov	r4, r1
  106050:	e24dd008 	sub	sp, sp, #8	; 0x8
  106054:	e3a01001 	mov	r1, #1	; 0x1
  106058:	e1a05002 	mov	r5, r2
  10605c:	e1a0a003 	mov	sl, r3
  106060:	e59d9028 	ldr	r9, [sp, #40]
  106064:	ebffffd1 	bl	105fb0 <_Balloc>
  106068:	e3c42102 	bic	r2, r4, #-2147483648	; 0x80000000
  10606c:	e3c434ff 	bic	r3, r4, #-16777216	; 0xff000000
  106070:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  106074:	e1b07a22 	movs	r7, r2, lsr #20
  106078:	e58d3000 	str	r3, [sp]
  10607c:	13833601 	orrne	r3, r3, #1048576	; 0x100000
  106080:	158d3000 	strne	r3, [sp]
  106084:	e3550000 	cmp	r5, #0	; 0x0
  106088:	e1a06000 	mov	r6, r0
  10608c:	e2808014 	add	r8, r0, #20	; 0x14
  106090:	0a000022 	beq	106120 <_d2b+0xd8>
  106094:	e28d0008 	add	r0, sp, #8	; 0x8
  106098:	e5205004 	str	r5, [r0, #-4]!
  10609c:	ebffff10 	bl	105ce4 <_lo0bits>
  1060a0:	e3500000 	cmp	r0, #0	; 0x0
  1060a4:	0a000030 	beq	10616c <_d2b+0x124>
  1060a8:	e89d000c 	ldmia	sp, {r2, r3}
  1060ac:	e2601020 	rsb	r1, r0, #32	; 0x20
  1060b0:	e1833112 	orr	r3, r3, r2, lsl r1
  1060b4:	e5863014 	str	r3, [r6, #20]
  1060b8:	e59d3000 	ldr	r3, [sp]
  1060bc:	e1a03033 	mov	r3, r3, lsr r0
  1060c0:	e58d3000 	str	r3, [sp]
  1060c4:	e3530000 	cmp	r3, #0	; 0x0
  1060c8:	03a04001 	moveq	r4, #1	; 0x1
  1060cc:	13a04002 	movne	r4, #2	; 0x2
  1060d0:	e3570000 	cmp	r7, #0	; 0x0
  1060d4:	e5883004 	str	r3, [r8, #4]
  1060d8:	10803007 	addne	r3, r0, r7
  1060dc:	12433e43 	subne	r3, r3, #1072	; 0x430
  1060e0:	12433003 	subne	r3, r3, #3	; 0x3
  1060e4:	12602035 	rsbne	r2, r0, #53	; 0x35
  1060e8:	e5864010 	str	r4, [r6, #16]
  1060ec:	158a3000 	strne	r3, [sl]
  1060f0:	15892000 	strne	r2, [r9]
  1060f4:	1a000019 	bne	106160 <_d2b+0x118>
  1060f8:	e2403e43 	sub	r3, r0, #1072	; 0x430
  1060fc:	e0882104 	add	r2, r8, r4, lsl #2
  106100:	e2433002 	sub	r3, r3, #2	; 0x2
  106104:	e58a3000 	str	r3, [sl]
  106108:	e5120004 	ldr	r0, [r2, #-4]
  10610c:	ebfffede 	bl	105c8c <_hi0bits>
  106110:	e1a04284 	mov	r4, r4, lsl #5
  106114:	e0604004 	rsb	r4, r0, r4
  106118:	e5894000 	str	r4, [r9]
  10611c:	ea00000f 	b	106160 <_d2b+0x118>
  106120:	e1a0000d 	mov	r0, sp
  106124:	ebfffeee 	bl	105ce4 <_lo0bits>
  106128:	e59d3000 	ldr	r3, [sp]
  10612c:	e3570000 	cmp	r7, #0	; 0x0
  106130:	e2800020 	add	r0, r0, #32	; 0x20
  106134:	e5863014 	str	r3, [r6, #20]
  106138:	10803007 	addne	r3, r0, r7
  10613c:	e3a02001 	mov	r2, #1	; 0x1
  106140:	12433e43 	subne	r3, r3, #1072	; 0x430
  106144:	e5862010 	str	r2, [r6, #16]
  106148:	e1a04002 	mov	r4, r2
  10614c:	12433003 	subne	r3, r3, #3	; 0x3
  106150:	12602035 	rsbne	r2, r0, #53	; 0x35
  106154:	158a3000 	strne	r3, [sl]
  106158:	15892000 	strne	r2, [r9]
  10615c:	0affffe5 	beq	1060f8 <_d2b+0xb0>
  106160:	e1a00006 	mov	r0, r6
  106164:	e28dd008 	add	sp, sp, #8	; 0x8
  106168:	e8bd87f0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
  10616c:	e59d3004 	ldr	r3, [sp, #4]
  106170:	e5863014 	str	r3, [r6, #20]
  106174:	e59d3000 	ldr	r3, [sp]
  106178:	eaffffd1 	b	1060c4 <_d2b+0x7c>

0010617c <__mdiff>:
  10617c:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  106180:	e1a04001 	mov	r4, r1
  106184:	e1a07000 	mov	r7, r0
  106188:	e1a01002 	mov	r1, r2
  10618c:	e1a00004 	mov	r0, r4
  106190:	e1a05002 	mov	r5, r2
  106194:	ebfffef7 	bl	105d78 <__mcmp>
  106198:	e2506000 	subs	r6, r0, #0	; 0x0
  10619c:	0a00003a 	beq	10628c <__mdiff+0x110>
  1061a0:	b1a03005 	movlt	r3, r5
  1061a4:	b1a05004 	movlt	r5, r4
  1061a8:	b1a04003 	movlt	r4, r3
  1061ac:	e1a00007 	mov	r0, r7
  1061b0:	e5941004 	ldr	r1, [r4, #4]
  1061b4:	b3a0a001 	movlt	sl, #1	; 0x1
  1061b8:	a3a0a000 	movge	sl, #0	; 0x0
  1061bc:	ebffff7b 	bl	105fb0 <_Balloc>
  1061c0:	e5953010 	ldr	r3, [r5, #16]
  1061c4:	e5946010 	ldr	r6, [r4, #16]
  1061c8:	e284e014 	add	lr, r4, #20	; 0x14
  1061cc:	e2854014 	add	r4, r5, #20	; 0x14
  1061d0:	e580a00c 	str	sl, [r0, #12]
  1061d4:	e1a08000 	mov	r8, r0
  1061d8:	e0847103 	add	r7, r4, r3, lsl #2
  1061dc:	e08ea106 	add	sl, lr, r6, lsl #2
  1061e0:	e280c014 	add	ip, r0, #20	; 0x14
  1061e4:	e3a05000 	mov	r5, #0	; 0x0
  1061e8:	e4942004 	ldr	r2, [r4], #4
  1061ec:	e49e0004 	ldr	r0, [lr], #4
  1061f0:	e1a01802 	mov	r1, r2, lsl #16
  1061f4:	e1a03800 	mov	r3, r0, lsl #16
  1061f8:	e1a03823 	mov	r3, r3, lsr #16
  1061fc:	e1a01821 	mov	r1, r1, lsr #16
  106200:	e0613003 	rsb	r3, r1, r3
  106204:	e1a02822 	mov	r2, r2, lsr #16
  106208:	e0833005 	add	r3, r3, r5
  10620c:	e0622820 	rsb	r2, r2, r0, lsr #16
  106210:	e0822843 	add	r2, r2, r3, asr #16
  106214:	e1570004 	cmp	r7, r4
  106218:	e1cc20b2 	strh	r2, [ip, #2]
  10621c:	e1a05842 	mov	r5, r2, asr #16
  106220:	e0cc30b4 	strh	r3, [ip], #4
  106224:	8affffef 	bhi	1061e8 <__mdiff+0x6c>
  106228:	e15a000e 	cmp	sl, lr
  10622c:	9a00000a 	bls	10625c <__mdiff+0xe0>
  106230:	e49e3004 	ldr	r3, [lr], #4
  106234:	e1a02803 	mov	r2, r3, lsl #16
  106238:	e1a02822 	mov	r2, r2, lsr #16
  10623c:	e0822005 	add	r2, r2, r5
  106240:	e1a01842 	mov	r1, r2, asr #16
  106244:	e0811823 	add	r1, r1, r3, lsr #16
  106248:	e15a000e 	cmp	sl, lr
  10624c:	e1cc10b2 	strh	r1, [ip, #2]
  106250:	e1a05841 	mov	r5, r1, asr #16
  106254:	e0cc20b4 	strh	r2, [ip], #4
  106258:	8afffff4 	bhi	106230 <__mdiff+0xb4>
  10625c:	e51c3004 	ldr	r3, [ip, #-4]
  106260:	e3530000 	cmp	r3, #0	; 0x0
  106264:	1a000005 	bne	106280 <__mdiff+0x104>
  106268:	e1a0200c 	mov	r2, ip
  10626c:	e5123008 	ldr	r3, [r2, #-8]
  106270:	e3530000 	cmp	r3, #0	; 0x0
  106274:	e2466001 	sub	r6, r6, #1	; 0x1
  106278:	e2422004 	sub	r2, r2, #4	; 0x4
  10627c:	0afffffa 	beq	10626c <__mdiff+0xf0>
  106280:	e1a00008 	mov	r0, r8
  106284:	e5886010 	str	r6, [r8, #16]
  106288:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10628c:	e1a00007 	mov	r0, r7
  106290:	e1a01006 	mov	r1, r6
  106294:	ebffff45 	bl	105fb0 <_Balloc>
  106298:	e3a03001 	mov	r3, #1	; 0x1
  10629c:	e1a08000 	mov	r8, r0
  1062a0:	e5803010 	str	r3, [r0, #16]
  1062a4:	e5806014 	str	r6, [r0, #20]
  1062a8:	e1a00008 	mov	r0, r8
  1062ac:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}

001062b0 <_lshift>:
  1062b0:	e5913010 	ldr	r3, [r1, #16]
  1062b4:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  1062b8:	e2833001 	add	r3, r3, #1	; 0x1
  1062bc:	e1a042c2 	mov	r4, r2, asr #5
  1062c0:	e1a06002 	mov	r6, r2
  1062c4:	e5912008 	ldr	r2, [r1, #8]
  1062c8:	e0845003 	add	r5, r4, r3
  1062cc:	e1550002 	cmp	r5, r2
  1062d0:	e1a07001 	mov	r7, r1
  1062d4:	e1a0a000 	mov	sl, r0
  1062d8:	e5911004 	ldr	r1, [r1, #4]
  1062dc:	da000003 	ble	1062f0 <_lshift+0x40>
  1062e0:	e1a02082 	mov	r2, r2, lsl #1
  1062e4:	e1550002 	cmp	r5, r2
  1062e8:	e2811001 	add	r1, r1, #1	; 0x1
  1062ec:	cafffffb 	bgt	1062e0 <_lshift+0x30>
  1062f0:	e1a0000a 	mov	r0, sl
  1062f4:	ebffff2d 	bl	105fb0 <_Balloc>
  1062f8:	e3540000 	cmp	r4, #0	; 0x0
  1062fc:	e1a08000 	mov	r8, r0
  106300:	e2800014 	add	r0, r0, #20	; 0x14
  106304:	da000005 	ble	106320 <_lshift+0x70>
  106308:	e3a03000 	mov	r3, #0	; 0x0
  10630c:	e1a02003 	mov	r2, r3
  106310:	e2833001 	add	r3, r3, #1	; 0x1
  106314:	e1540003 	cmp	r4, r3
  106318:	e4802004 	str	r2, [r0], #4
  10631c:	1afffffb 	bne	106310 <_lshift+0x60>
  106320:	e5973010 	ldr	r3, [r7, #16]
  106324:	e2871014 	add	r1, r7, #20	; 0x14
  106328:	e216401f 	ands	r4, r6, #31	; 0x1f
  10632c:	e081c103 	add	ip, r1, r3, lsl #2
  106330:	0a000012 	beq	106380 <_lshift+0xd0>
  106334:	e264e020 	rsb	lr, r4, #32	; 0x20
  106338:	e3a02000 	mov	r2, #0	; 0x0
  10633c:	e5913000 	ldr	r3, [r1]
  106340:	e1823413 	orr	r3, r2, r3, lsl r4
  106344:	e4803004 	str	r3, [r0], #4
  106348:	e4912004 	ldr	r2, [r1], #4
  10634c:	e15c0001 	cmp	ip, r1
  106350:	e1a02e32 	mov	r2, r2, lsr lr
  106354:	8afffff8 	bhi	10633c <_lshift+0x8c>
  106358:	e3520000 	cmp	r2, #0	; 0x0
  10635c:	e5802000 	str	r2, [r0]
  106360:	12855001 	addne	r5, r5, #1	; 0x1
  106364:	e2453001 	sub	r3, r5, #1	; 0x1
  106368:	e1a0000a 	mov	r0, sl
  10636c:	e5883010 	str	r3, [r8, #16]
  106370:	e1a01007 	mov	r1, r7
  106374:	ebfffe3d 	bl	105c70 <_Bfree>
  106378:	e1a00008 	mov	r0, r8
  10637c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  106380:	e4913004 	ldr	r3, [r1], #4
  106384:	e15c0001 	cmp	ip, r1
  106388:	e4803004 	str	r3, [r0], #4
  10638c:	9afffff4 	bls	106364 <_lshift+0xb4>
  106390:	e4913004 	ldr	r3, [r1], #4
  106394:	e15c0001 	cmp	ip, r1
  106398:	e4803004 	str	r3, [r0], #4
  10639c:	8afffff7 	bhi	106380 <_lshift+0xd0>
  1063a0:	eaffffef 	b	106364 <_lshift+0xb4>

001063a4 <_multiply>:
  1063a4:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1063a8:	e5918010 	ldr	r8, [r1, #16]
  1063ac:	e5925010 	ldr	r5, [r2, #16]
  1063b0:	e1580005 	cmp	r8, r5
  1063b4:	b1a03002 	movlt	r3, r2
  1063b8:	e1a06002 	mov	r6, r2
  1063bc:	b1a06001 	movlt	r6, r1
  1063c0:	e1a04001 	mov	r4, r1
  1063c4:	b1a08005 	movlt	r8, r5
  1063c8:	b1a04003 	movlt	r4, r3
  1063cc:	b5965010 	ldrlt	r5, [r6, #16]
  1063d0:	e994000a 	ldmib	r4, {r1, r3}
  1063d4:	e0889005 	add	r9, r8, r5
  1063d8:	e1590003 	cmp	r9, r3
  1063dc:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1063e0:	c2811001 	addgt	r1, r1, #1	; 0x1
  1063e4:	ebfffef1 	bl	105fb0 <_Balloc>
  1063e8:	e2801014 	add	r1, r0, #20	; 0x14
  1063ec:	e58d0000 	str	r0, [sp]
  1063f0:	e0810109 	add	r0, r1, r9, lsl #2
  1063f4:	e1510000 	cmp	r1, r0
  1063f8:	e58d0004 	str	r0, [sp, #4]
  1063fc:	2a000005 	bcs	106418 <_multiply+0x74>
  106400:	e1a03001 	mov	r3, r1
  106404:	e3a02000 	mov	r2, #0	; 0x0
  106408:	e4832004 	str	r2, [r3], #4
  10640c:	e59d0004 	ldr	r0, [sp, #4]
  106410:	e1500003 	cmp	r0, r3
  106414:	8afffffb 	bhi	106408 <_multiply+0x64>
  106418:	e2867014 	add	r7, r6, #20	; 0x14
  10641c:	e0875105 	add	r5, r7, r5, lsl #2
  106420:	e284b014 	add	fp, r4, #20	; 0x14
  106424:	e1570005 	cmp	r7, r5
  106428:	e58d5008 	str	r5, [sp, #8]
  10642c:	e08b8108 	add	r8, fp, r8, lsl #2
  106430:	2a000038 	bcs	106518 <_multiply+0x174>
  106434:	e1a0a001 	mov	sl, r1
  106438:	e5973000 	ldr	r3, [r7]
  10643c:	e1a06803 	mov	r6, r3, lsl #16
  106440:	e1a06826 	mov	r6, r6, lsr #16
  106444:	e3560000 	cmp	r6, #0	; 0x0
  106448:	0a000015 	beq	1064a4 <_multiply+0x100>
  10644c:	e1a0500b 	mov	r5, fp
  106450:	e1a0400a 	mov	r4, sl
  106454:	e3a03000 	mov	r3, #0	; 0x0
  106458:	e594c000 	ldr	ip, [r4]
  10645c:	e4950004 	ldr	r0, [r5], #4
  106460:	e1a0280c 	mov	r2, ip, lsl #16
  106464:	e1a01800 	mov	r1, r0, lsl #16
  106468:	e1a02822 	mov	r2, r2, lsr #16
  10646c:	e0832002 	add	r2, r3, r2
  106470:	e1a01821 	mov	r1, r1, lsr #16
  106474:	e1a00820 	mov	r0, r0, lsr #16
  106478:	e1a0c82c 	mov	ip, ip, lsr #16
  10647c:	e02e2691 	mla	lr, r1, r6, r2
  106480:	e023c690 	mla	r3, r0, r6, ip
  106484:	e1580005 	cmp	r8, r5
  106488:	e083382e 	add	r3, r3, lr, lsr #16
  10648c:	e1c430b2 	strh	r3, [r4, #2]
  106490:	e0c4e0b4 	strh	lr, [r4], #4
  106494:	e1a03823 	mov	r3, r3, lsr #16
  106498:	8affffee 	bhi	106458 <_multiply+0xb4>
  10649c:	e5843000 	str	r3, [r4]
  1064a0:	e5973000 	ldr	r3, [r7]
  1064a4:	e1b05823 	movs	r5, r3, lsr #16
  1064a8:	0a000015 	beq	106504 <_multiply+0x160>
  1064ac:	e59ae000 	ldr	lr, [sl]
  1064b0:	e1a0c00a 	mov	ip, sl
  1064b4:	e1a0400b 	mov	r4, fp
  1064b8:	e3a00000 	mov	r0, #0	; 0x0
  1064bc:	e4941004 	ldr	r1, [r4], #4
  1064c0:	e59c2000 	ldr	r2, [ip]
  1064c4:	e1a03801 	mov	r3, r1, lsl #16
  1064c8:	e0802822 	add	r2, r0, r2, lsr #16
  1064cc:	e1a03823 	mov	r3, r3, lsr #16
  1064d0:	e0202593 	mla	r0, r3, r5, r2
  1064d4:	e1cce0b0 	strh	lr, [ip]
  1064d8:	e1cc00b2 	strh	r0, [ip, #2]
  1064dc:	e5bc3004 	ldr	r3, [ip, #4]!
  1064e0:	e1a03803 	mov	r3, r3, lsl #16
  1064e4:	e1a01821 	mov	r1, r1, lsr #16
  1064e8:	e1a03823 	mov	r3, r3, lsr #16
  1064ec:	e0223591 	mla	r2, r1, r5, r3
  1064f0:	e1580004 	cmp	r8, r4
  1064f4:	e082e820 	add	lr, r2, r0, lsr #16
  1064f8:	e1a0082e 	mov	r0, lr, lsr #16
  1064fc:	8affffee 	bhi	1064bc <_multiply+0x118>
  106500:	e58ce000 	str	lr, [ip]
  106504:	e59d2008 	ldr	r2, [sp, #8]
  106508:	e2877004 	add	r7, r7, #4	; 0x4
  10650c:	e1520007 	cmp	r2, r7
  106510:	828aa004 	addhi	sl, sl, #4	; 0x4
  106514:	8affffc7 	bhi	106438 <_multiply+0x94>
  106518:	e3590000 	cmp	r9, #0	; 0x0
  10651c:	da00000b 	ble	106550 <_multiply+0x1ac>
  106520:	e59d0004 	ldr	r0, [sp, #4]
  106524:	e5103004 	ldr	r3, [r0, #-4]
  106528:	e3530000 	cmp	r3, #0	; 0x0
  10652c:	1a000007 	bne	106550 <_multiply+0x1ac>
  106530:	e1a02000 	mov	r2, r0
  106534:	ea000003 	b	106548 <_multiply+0x1a4>
  106538:	e5123008 	ldr	r3, [r2, #-8]
  10653c:	e3530000 	cmp	r3, #0	; 0x0
  106540:	e2422004 	sub	r2, r2, #4	; 0x4
  106544:	1a000001 	bne	106550 <_multiply+0x1ac>
  106548:	e2599001 	subs	r9, r9, #1	; 0x1
  10654c:	1afffff9 	bne	106538 <_multiply+0x194>
  106550:	e59d2000 	ldr	r2, [sp]
  106554:	e1a00002 	mov	r0, r2
  106558:	e5829010 	str	r9, [r2, #16]
  10655c:	e28dd00c 	add	sp, sp, #12	; 0xc
  106560:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00106564 <_i2b>:
  106564:	e92d4010 	stmdb	sp!, {r4, lr}
  106568:	e1a04001 	mov	r4, r1
  10656c:	e3a01001 	mov	r1, #1	; 0x1
  106570:	ebfffe8e 	bl	105fb0 <_Balloc>
  106574:	e3a03001 	mov	r3, #1	; 0x1
  106578:	e5803010 	str	r3, [r0, #16]
  10657c:	e5804014 	str	r4, [r0, #20]
  106580:	e8bd8010 	ldmia	sp!, {r4, pc}

00106584 <_multadd>:
  106584:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  106588:	e5916010 	ldr	r6, [r1, #16]
  10658c:	e1a07001 	mov	r7, r1
  106590:	e1a08000 	mov	r8, r0
  106594:	e1a04002 	mov	r4, r2
  106598:	e1a05003 	mov	r5, r3
  10659c:	e281c014 	add	ip, r1, #20	; 0x14
  1065a0:	e3a0e000 	mov	lr, #0	; 0x0
  1065a4:	e59c1000 	ldr	r1, [ip]
  1065a8:	e1a03801 	mov	r3, r1, lsl #16
  1065ac:	e1a03823 	mov	r3, r3, lsr #16
  1065b0:	e0225394 	mla	r2, r4, r3, r5
  1065b4:	e1a01821 	mov	r1, r1, lsr #16
  1065b8:	e1a03822 	mov	r3, r2, lsr #16
  1065bc:	e0203194 	mla	r0, r4, r1, r3
  1065c0:	e1a02802 	mov	r2, r2, lsl #16
  1065c4:	e1a02822 	mov	r2, r2, lsr #16
  1065c8:	e28ee001 	add	lr, lr, #1	; 0x1
  1065cc:	e0822800 	add	r2, r2, r0, lsl #16
  1065d0:	e156000e 	cmp	r6, lr
  1065d4:	e48c2004 	str	r2, [ip], #4
  1065d8:	e1a05820 	mov	r5, r0, lsr #16
  1065dc:	cafffff0 	bgt	1065a4 <_multadd+0x20>
  1065e0:	e3550000 	cmp	r5, #0	; 0x0
  1065e4:	0a000006 	beq	106604 <_multadd+0x80>
  1065e8:	e5973008 	ldr	r3, [r7, #8]
  1065ec:	e1560003 	cmp	r6, r3
  1065f0:	aa000005 	bge	10660c <_multadd+0x88>
  1065f4:	e2862001 	add	r2, r6, #1	; 0x1
  1065f8:	e0873106 	add	r3, r7, r6, lsl #2
  1065fc:	e5835014 	str	r5, [r3, #20]
  106600:	e5872010 	str	r2, [r7, #16]
  106604:	e1a00007 	mov	r0, r7
  106608:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10660c:	e5971004 	ldr	r1, [r7, #4]
  106610:	e1a00008 	mov	r0, r8
  106614:	e2811001 	add	r1, r1, #1	; 0x1
  106618:	ebfffe64 	bl	105fb0 <_Balloc>
  10661c:	e5972010 	ldr	r2, [r7, #16]
  106620:	e1a02102 	mov	r2, r2, lsl #2
  106624:	e287100c 	add	r1, r7, #12	; 0xc
  106628:	e1a04000 	mov	r4, r0
  10662c:	e2822008 	add	r2, r2, #8	; 0x8
  106630:	e280000c 	add	r0, r0, #12	; 0xc
  106634:	ebffe964 	bl	100bcc <memcpy>
  106638:	e1a01007 	mov	r1, r7
  10663c:	e1a00008 	mov	r0, r8
  106640:	ebfffd8a 	bl	105c70 <_Bfree>
  106644:	e1a07004 	mov	r7, r4
  106648:	eaffffe9 	b	1065f4 <_multadd+0x70>

0010664c <_pow5mult>:
  10664c:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  106650:	e1a04002 	mov	r4, r2
  106654:	e2122003 	ands	r2, r2, #3	; 0x3
  106658:	e1a07000 	mov	r7, r0
  10665c:	e1a08001 	mov	r8, r1
  106660:	1a000025 	bne	1066fc <_pow5mult+0xb0>
  106664:	e1b06144 	movs	r6, r4, asr #2
  106668:	0a00001c 	beq	1066e0 <_pow5mult+0x94>
  10666c:	e5975048 	ldr	r5, [r7, #72]
  106670:	e3550000 	cmp	r5, #0	; 0x0
  106674:	1a000009 	bne	1066a0 <_pow5mult+0x54>
  106678:	ea000026 	b	106718 <_pow5mult+0xcc>
  10667c:	e1b060c6 	movs	r6, r6, asr #1
  106680:	e1a01005 	mov	r1, r5
  106684:	e1a02005 	mov	r2, r5
  106688:	e1a00007 	mov	r0, r7
  10668c:	0a000013 	beq	1066e0 <_pow5mult+0x94>
  106690:	e5954000 	ldr	r4, [r5]
  106694:	e3540000 	cmp	r4, #0	; 0x0
  106698:	0a000012 	beq	1066e8 <_pow5mult+0x9c>
  10669c:	e1a05004 	mov	r5, r4
  1066a0:	e3160001 	tst	r6, #1	; 0x1
  1066a4:	e1a02005 	mov	r2, r5
  1066a8:	e1a00007 	mov	r0, r7
  1066ac:	e1a01008 	mov	r1, r8
  1066b0:	0afffff1 	beq	10667c <_pow5mult+0x30>
  1066b4:	ebffff3a 	bl	1063a4 <_multiply>
  1066b8:	e1a01008 	mov	r1, r8
  1066bc:	e1a04000 	mov	r4, r0
  1066c0:	e1a00007 	mov	r0, r7
  1066c4:	ebfffd69 	bl	105c70 <_Bfree>
  1066c8:	e1b060c6 	movs	r6, r6, asr #1
  1066cc:	e1a08004 	mov	r8, r4
  1066d0:	e1a01005 	mov	r1, r5
  1066d4:	e1a02005 	mov	r2, r5
  1066d8:	e1a00007 	mov	r0, r7
  1066dc:	1affffeb 	bne	106690 <_pow5mult+0x44>
  1066e0:	e1a00008 	mov	r0, r8
  1066e4:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1066e8:	ebffff2d 	bl	1063a4 <_multiply>
  1066ec:	e5850000 	str	r0, [r5]
  1066f0:	e1a05000 	mov	r5, r0
  1066f4:	e5804000 	str	r4, [r0]
  1066f8:	eaffffe8 	b	1066a0 <_pow5mult+0x54>
  1066fc:	e59f3038 	ldr	r3, [pc, #56]	; 10673c <prog+0x66f8>
  106700:	e0833102 	add	r3, r3, r2, lsl #2
  106704:	e5132004 	ldr	r2, [r3, #-4]
  106708:	e3a03000 	mov	r3, #0	; 0x0
  10670c:	ebffff9c 	bl	106584 <_multadd>
  106710:	e1a08000 	mov	r8, r0
  106714:	eaffffd2 	b	106664 <_pow5mult+0x18>
  106718:	e3a01e27 	mov	r1, #624	; 0x270
  10671c:	e2811001 	add	r1, r1, #1	; 0x1
  106720:	e1a00007 	mov	r0, r7
  106724:	ebffff8e 	bl	106564 <_i2b>
  106728:	e3a03000 	mov	r3, #0	; 0x0
  10672c:	e1a05000 	mov	r5, r0
  106730:	e5870048 	str	r0, [r7, #72]
  106734:	e5803000 	str	r3, [r0]
  106738:	eaffffd8 	b	1066a0 <_pow5mult+0x54>
  10673c:	0010c980 	andeqs	ip, r0, r0, lsl #19

00106740 <_s2b>:
  106740:	e59fc0d4 	ldr	ip, [pc, #212]	; 10681c <prog+0x67d8>
  106744:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  106748:	e1a08003 	mov	r8, r3
  10674c:	e2833008 	add	r3, r3, #8	; 0x8
  106750:	e0ce439c 	smull	r4, lr, ip, r3
  106754:	e1a03fc3 	mov	r3, r3, asr #31
  106758:	e063c0ce 	rsb	ip, r3, lr, asr #1
  10675c:	e35c0001 	cmp	ip, #1	; 0x1
  106760:	e1a05001 	mov	r5, r1
  106764:	e1a06000 	mov	r6, r0
  106768:	e1a07002 	mov	r7, r2
  10676c:	d3a01000 	movle	r1, #0	; 0x0
  106770:	da000005 	ble	10678c <_s2b+0x4c>
  106774:	e3a03001 	mov	r3, #1	; 0x1
  106778:	e3a01000 	mov	r1, #0	; 0x0
  10677c:	e1a03083 	mov	r3, r3, lsl #1
  106780:	e15c0003 	cmp	ip, r3
  106784:	e2811001 	add	r1, r1, #1	; 0x1
  106788:	cafffffb 	bgt	10677c <_s2b+0x3c>
  10678c:	e1a00006 	mov	r0, r6
  106790:	ebfffe06 	bl	105fb0 <_Balloc>
  106794:	e59d3018 	ldr	r3, [sp, #24]
  106798:	e3570009 	cmp	r7, #9	; 0x9
  10679c:	e3a02001 	mov	r2, #1	; 0x1
  1067a0:	e5803014 	str	r3, [r0, #20]
  1067a4:	e5802010 	str	r2, [r0, #16]
  1067a8:	d285700a 	addle	r7, r5, #10	; 0xa
  1067ac:	d3a04009 	movle	r4, #9	; 0x9
  1067b0:	da00000b 	ble	1067e4 <_s2b+0xa4>
  1067b4:	e3a04009 	mov	r4, #9	; 0x9
  1067b8:	e7d43005 	ldrb	r3, [r4, r5]
  1067bc:	e1a01000 	mov	r1, r0
  1067c0:	e2433030 	sub	r3, r3, #48	; 0x30
  1067c4:	e2844001 	add	r4, r4, #1	; 0x1
  1067c8:	e1a00006 	mov	r0, r6
  1067cc:	e3a0200a 	mov	r2, #10	; 0xa
  1067d0:	ebffff6b 	bl	106584 <_multadd>
  1067d4:	e1570004 	cmp	r7, r4
  1067d8:	1afffff6 	bne	1067b8 <_s2b+0x78>
  1067dc:	e0853004 	add	r3, r5, r4
  1067e0:	e2837001 	add	r7, r3, #1	; 0x1
  1067e4:	e1580004 	cmp	r8, r4
  1067e8:	d8bd81f0 	ldmleia	sp!, {r4, r5, r6, r7, r8, pc}
  1067ec:	e0645008 	rsb	r5, r4, r8
  1067f0:	e3a04000 	mov	r4, #0	; 0x0
  1067f4:	e7d43007 	ldrb	r3, [r4, r7]
  1067f8:	e1a01000 	mov	r1, r0
  1067fc:	e2433030 	sub	r3, r3, #48	; 0x30
  106800:	e2844001 	add	r4, r4, #1	; 0x1
  106804:	e1a00006 	mov	r0, r6
  106808:	e3a0200a 	mov	r2, #10	; 0xa
  10680c:	ebffff5c 	bl	106584 <_multadd>
  106810:	e1550004 	cmp	r5, r4
  106814:	1afffff6 	bne	1067f4 <_s2b+0xb4>
  106818:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10681c:	38e38e39 	stmccia	r3!, {r0, r3, r4, r5, r9, sl, fp, pc}^

00106820 <_realloc_r>:
  106820:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  106824:	e251a000 	subs	sl, r1, #0	; 0x0
  106828:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10682c:	e1a06002 	mov	r6, r2
  106830:	e58d0000 	str	r0, [sp]
  106834:	0a00008d 	beq	106a70 <_realloc_r+0x250>
  106838:	ebffe931 	bl	100d04 <__malloc_lock>
  10683c:	e286300b 	add	r3, r6, #11	; 0xb
  106840:	e3530016 	cmp	r3, #22	; 0x16
  106844:	83c3e007 	bichi	lr, r3, #7	; 0x7
  106848:	93a0e010 	movls	lr, #16	; 0x10
  10684c:	958de004 	strls	lr, [sp, #4]
  106850:	858de004 	strhi	lr, [sp, #4]
  106854:	e59d0004 	ldr	r0, [sp, #4]
  106858:	93a03000 	movls	r3, #0	; 0x0
  10685c:	81a03fae 	movhi	r3, lr, lsr #31
  106860:	e1500006 	cmp	r0, r6
  106864:	33833001 	orrcc	r3, r3, #1	; 0x1
  106868:	e24a5008 	sub	r5, sl, #8	; 0x8
  10686c:	e3530000 	cmp	r3, #0	; 0x0
  106870:	e5959004 	ldr	r9, [r5, #4]
  106874:	1a0000d0 	bne	106bbc <_realloc_r+0x39c>
  106878:	e3c94003 	bic	r4, r9, #3	; 0x3
  10687c:	e154000e 	cmp	r4, lr
  106880:	a1a08005 	movge	r8, r5
  106884:	a1a07004 	movge	r7, r4
  106888:	a1a0c008 	movge	ip, r8
  10688c:	a2884008 	addge	r4, r8, #8	; 0x8
  106890:	aa00004a 	bge	1069c0 <_realloc_r+0x1a0>
  106894:	e59f25b8 	ldr	r2, [pc, #1464]	; 106e54 <prog+0x6e10>
  106898:	e592b008 	ldr	fp, [r2, #8]
  10689c:	e0850004 	add	r0, r5, r4
  1068a0:	e150000b 	cmp	r0, fp
  1068a4:	e1a08005 	mov	r8, r5
  1068a8:	0a0000c8 	beq	106bd0 <_realloc_r+0x3b0>
  1068ac:	e5901004 	ldr	r1, [r0, #4]
  1068b0:	e3c13001 	bic	r3, r1, #1	; 0x1
  1068b4:	e0833000 	add	r3, r3, r0
  1068b8:	e5932004 	ldr	r2, [r3, #4]
  1068bc:	e3120001 	tst	r2, #1	; 0x1
  1068c0:	0a00005f 	beq	106a44 <_realloc_r+0x224>
  1068c4:	e3a0c000 	mov	ip, #0	; 0x0
  1068c8:	e1a0000c 	mov	r0, ip
  1068cc:	e3190001 	tst	r9, #1	; 0x1
  1068d0:	1a00006a 	bne	106a80 <_realloc_r+0x260>
  1068d4:	e5953000 	ldr	r3, [r5]
  1068d8:	e0633005 	rsb	r3, r3, r5
  1068dc:	e5932004 	ldr	r2, [r3, #4]
  1068e0:	e3500000 	cmp	r0, #0	; 0x0
  1068e4:	e58d3008 	str	r3, [sp, #8]
  1068e8:	e3c22003 	bic	r2, r2, #3	; 0x3
  1068ec:	0a000083 	beq	106b00 <_realloc_r+0x2e0>
  1068f0:	e150000b 	cmp	r0, fp
  1068f4:	0a0000f9 	beq	106ce0 <_realloc_r+0x4c0>
  1068f8:	e0849002 	add	r9, r4, r2
  1068fc:	e08c7009 	add	r7, ip, r9
  106900:	e157000e 	cmp	r7, lr
  106904:	ba00007e 	blt	106b04 <_realloc_r+0x2e4>
  106908:	e2802008 	add	r2, r0, #8	; 0x8
  10690c:	e892000c 	ldmia	r2, {r2, r3}
  106910:	e5832008 	str	r2, [r3, #8]
  106914:	e582300c 	str	r3, [r2, #12]
  106918:	e59d3008 	ldr	r3, [sp, #8]
  10691c:	e2444004 	sub	r4, r4, #4	; 0x4
  106920:	e593200c 	ldr	r2, [r3, #12]
  106924:	e59d8008 	ldr	r8, [sp, #8]
  106928:	e5933008 	ldr	r3, [r3, #8]
  10692c:	e3540024 	cmp	r4, #36	; 0x24
  106930:	e5823008 	str	r3, [r2, #8]
  106934:	e583200c 	str	r2, [r3, #12]
  106938:	e2885008 	add	r5, r8, #8	; 0x8
  10693c:	8a0000d4 	bhi	106c94 <_realloc_r+0x474>
  106940:	e3540013 	cmp	r4, #19	; 0x13
  106944:	e1a0c00a 	mov	ip, sl
  106948:	e1a0e005 	mov	lr, r5
  10694c:	9a000011 	bls	106998 <_realloc_r+0x178>
  106950:	e1a0000a 	mov	r0, sl
  106954:	e4903004 	ldr	r3, [r0], #4
  106958:	e5883008 	str	r3, [r8, #8]
  10695c:	e59a2004 	ldr	r2, [sl, #4]
  106960:	e354001b 	cmp	r4, #27	; 0x1b
  106964:	e588200c 	str	r2, [r8, #12]
  106968:	e288e010 	add	lr, r8, #16	; 0x10
  10696c:	e280c004 	add	ip, r0, #4	; 0x4
  106970:	9a000008 	bls	106998 <_realloc_r+0x178>
  106974:	e5903004 	ldr	r3, [r0, #4]
  106978:	e5883010 	str	r3, [r8, #16]
  10697c:	e59c2004 	ldr	r2, [ip, #4]
  106980:	e28c3004 	add	r3, ip, #4	; 0x4
  106984:	e3540024 	cmp	r4, #36	; 0x24
  106988:	e5882014 	str	r2, [r8, #20]
  10698c:	e288e018 	add	lr, r8, #24	; 0x18
  106990:	e283c004 	add	ip, r3, #4	; 0x4
  106994:	0a000119 	beq	106e00 <_realloc_r+0x5e0>
  106998:	e1a0200c 	mov	r2, ip
  10699c:	e4920004 	ldr	r0, [r2], #4
  1069a0:	e1a0100e 	mov	r1, lr
  1069a4:	e4810004 	str	r0, [r1], #4
  1069a8:	e59c3004 	ldr	r3, [ip, #4]
  1069ac:	e58e3004 	str	r3, [lr, #4]
  1069b0:	e5920004 	ldr	r0, [r2, #4]
  1069b4:	e59dc008 	ldr	ip, [sp, #8]
  1069b8:	e5810004 	str	r0, [r1, #4]
  1069bc:	e1a04005 	mov	r4, r5
  1069c0:	e59d1004 	ldr	r1, [sp, #4]
  1069c4:	e0610007 	rsb	r0, r1, r7
  1069c8:	e350000f 	cmp	r0, #15	; 0xf
  1069cc:	8a00000d 	bhi	106a08 <_realloc_r+0x1e8>
  1069d0:	e59c3004 	ldr	r3, [ip, #4]
  1069d4:	e2033001 	and	r3, r3, #1	; 0x1
  1069d8:	e1873003 	orr	r3, r7, r3
  1069dc:	e58c3004 	str	r3, [ip, #4]
  1069e0:	e0872008 	add	r2, r7, r8
  1069e4:	e5923004 	ldr	r3, [r2, #4]
  1069e8:	e3833001 	orr	r3, r3, #1	; 0x1
  1069ec:	e5823004 	str	r3, [r2, #4]
  1069f0:	e59d0000 	ldr	r0, [sp]
  1069f4:	ebffe8c3 	bl	100d08 <__malloc_unlock>
  1069f8:	e1a06004 	mov	r6, r4
  1069fc:	e1a00006 	mov	r0, r6
  106a00:	e28dd00c 	add	sp, sp, #12	; 0xc
  106a04:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  106a08:	e59c3004 	ldr	r3, [ip, #4]
  106a0c:	e2033001 	and	r3, r3, #1	; 0x1
  106a10:	e1813003 	orr	r3, r1, r3
  106a14:	e3802001 	orr	r2, r0, #1	; 0x1
  106a18:	e0811008 	add	r1, r1, r8
  106a1c:	e58c3004 	str	r3, [ip, #4]
  106a20:	e5812004 	str	r2, [r1, #4]
  106a24:	e0810000 	add	r0, r1, r0
  106a28:	e5903004 	ldr	r3, [r0, #4]
  106a2c:	e3833001 	orr	r3, r3, #1	; 0x1
  106a30:	e5803004 	str	r3, [r0, #4]
  106a34:	e2811008 	add	r1, r1, #8	; 0x8
  106a38:	e59d0000 	ldr	r0, [sp]
  106a3c:	ebfff9a2 	bl	1050cc <_free_r>
  106a40:	eaffffea 	b	1069f0 <_realloc_r+0x1d0>
  106a44:	e3c1c003 	bic	ip, r1, #3	; 0x3
  106a48:	e084700c 	add	r7, r4, ip
  106a4c:	e15e0007 	cmp	lr, r7
  106a50:	caffff9d 	bgt	1068cc <_realloc_r+0xac>
  106a54:	e2802008 	add	r2, r0, #8	; 0x8
  106a58:	e892000c 	ldmia	r2, {r2, r3}
  106a5c:	e1a0c005 	mov	ip, r5
  106a60:	e2854008 	add	r4, r5, #8	; 0x8
  106a64:	e5832008 	str	r2, [r3, #8]
  106a68:	e582300c 	str	r3, [r2, #12]
  106a6c:	eaffffd3 	b	1069c0 <_realloc_r+0x1a0>
  106a70:	e1a01002 	mov	r1, r2
  106a74:	e28dd00c 	add	sp, sp, #12	; 0xc
  106a78:	e8bd4ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  106a7c:	eaffe676 	b	10045c <_malloc_r>
  106a80:	e1a01006 	mov	r1, r6
  106a84:	e59d0000 	ldr	r0, [sp]
  106a88:	ebffe673 	bl	10045c <_malloc_r>
  106a8c:	e2506000 	subs	r6, r0, #0	; 0x0
  106a90:	0a000017 	beq	106af4 <_realloc_r+0x2d4>
  106a94:	e5953004 	ldr	r3, [r5, #4]
  106a98:	e3c33001 	bic	r3, r3, #1	; 0x1
  106a9c:	e0853003 	add	r3, r5, r3
  106aa0:	e2462008 	sub	r2, r6, #8	; 0x8
  106aa4:	e1520003 	cmp	r2, r3
  106aa8:	0a0000c9 	beq	106dd4 <_realloc_r+0x5b4>
  106aac:	e2441004 	sub	r1, r4, #4	; 0x4
  106ab0:	e3510024 	cmp	r1, #36	; 0x24
  106ab4:	8a000085 	bhi	106cd0 <_realloc_r+0x4b0>
  106ab8:	e3510013 	cmp	r1, #19	; 0x13
  106abc:	e1a0c00a 	mov	ip, sl
  106ac0:	e1a0e006 	mov	lr, r6
  106ac4:	8a000057 	bhi	106c28 <_realloc_r+0x408>
  106ac8:	e1a0000c 	mov	r0, ip
  106acc:	e4902004 	ldr	r2, [r0], #4
  106ad0:	e1a0100e 	mov	r1, lr
  106ad4:	e4812004 	str	r2, [r1], #4
  106ad8:	e59c3004 	ldr	r3, [ip, #4]
  106adc:	e58e3004 	str	r3, [lr, #4]
  106ae0:	e5902004 	ldr	r2, [r0, #4]
  106ae4:	e5812004 	str	r2, [r1, #4]
  106ae8:	e1a0100a 	mov	r1, sl
  106aec:	e59d0000 	ldr	r0, [sp]
  106af0:	ebfff975 	bl	1050cc <_free_r>
  106af4:	e59d0000 	ldr	r0, [sp]
  106af8:	ebffe882 	bl	100d08 <__malloc_unlock>
  106afc:	eaffffbe 	b	1069fc <_realloc_r+0x1dc>
  106b00:	e0849002 	add	r9, r4, r2
  106b04:	e159000e 	cmp	r9, lr
  106b08:	baffffdc 	blt	106a80 <_realloc_r+0x260>
  106b0c:	e59d0008 	ldr	r0, [sp, #8]
  106b10:	e2444004 	sub	r4, r4, #4	; 0x4
  106b14:	e590200c 	ldr	r2, [r0, #12]
  106b18:	e5903008 	ldr	r3, [r0, #8]
  106b1c:	e3540024 	cmp	r4, #36	; 0x24
  106b20:	e1a08000 	mov	r8, r0
  106b24:	e5823008 	str	r3, [r2, #8]
  106b28:	e583200c 	str	r2, [r3, #12]
  106b2c:	e2805008 	add	r5, r0, #8	; 0x8
  106b30:	8a00005e 	bhi	106cb0 <_realloc_r+0x490>
  106b34:	e3540013 	cmp	r4, #19	; 0x13
  106b38:	e1a0c00a 	mov	ip, sl
  106b3c:	e1a0e005 	mov	lr, r5
  106b40:	9a000011 	bls	106b8c <_realloc_r+0x36c>
  106b44:	e1a0000a 	mov	r0, sl
  106b48:	e4903004 	ldr	r3, [r0], #4
  106b4c:	e5883008 	str	r3, [r8, #8]
  106b50:	e59a2004 	ldr	r2, [sl, #4]
  106b54:	e354001b 	cmp	r4, #27	; 0x1b
  106b58:	e588200c 	str	r2, [r8, #12]
  106b5c:	e288e010 	add	lr, r8, #16	; 0x10
  106b60:	e280c004 	add	ip, r0, #4	; 0x4
  106b64:	9a000008 	bls	106b8c <_realloc_r+0x36c>
  106b68:	e5903004 	ldr	r3, [r0, #4]
  106b6c:	e5883010 	str	r3, [r8, #16]
  106b70:	e59c2004 	ldr	r2, [ip, #4]
  106b74:	e28c3004 	add	r3, ip, #4	; 0x4
  106b78:	e3540024 	cmp	r4, #36	; 0x24
  106b7c:	e5882014 	str	r2, [r8, #20]
  106b80:	e288e018 	add	lr, r8, #24	; 0x18
  106b84:	e283c004 	add	ip, r3, #4	; 0x4
  106b88:	0a0000a3 	beq	106e1c <_realloc_r+0x5fc>
  106b8c:	e1a0200c 	mov	r2, ip
  106b90:	e4921004 	ldr	r1, [r2], #4
  106b94:	e1a0000e 	mov	r0, lr
  106b98:	e4801004 	str	r1, [r0], #4
  106b9c:	e59c3004 	ldr	r3, [ip, #4]
  106ba0:	e58e3004 	str	r3, [lr, #4]
  106ba4:	e59dc008 	ldr	ip, [sp, #8]
  106ba8:	e5921004 	ldr	r1, [r2, #4]
  106bac:	e1a07009 	mov	r7, r9
  106bb0:	e1a04005 	mov	r4, r5
  106bb4:	e5801004 	str	r1, [r0, #4]
  106bb8:	eaffff80 	b	1069c0 <_realloc_r+0x1a0>
  106bbc:	e59d1000 	ldr	r1, [sp]
  106bc0:	e3a0300c 	mov	r3, #12	; 0xc
  106bc4:	e3a06000 	mov	r6, #0	; 0x0
  106bc8:	e5813000 	str	r3, [r1]
  106bcc:	eaffff8a 	b	1069fc <_realloc_r+0x1dc>
  106bd0:	e5903004 	ldr	r3, [r0, #4]
  106bd4:	e59d1004 	ldr	r1, [sp, #4]
  106bd8:	e3c3c003 	bic	ip, r3, #3	; 0x3
  106bdc:	e084200c 	add	r2, r4, ip
  106be0:	e2813010 	add	r3, r1, #16	; 0x10
  106be4:	e1520003 	cmp	r2, r3
  106be8:	baffff37 	blt	1068cc <_realloc_r+0xac>
  106bec:	e0613002 	rsb	r3, r1, r2
  106bf0:	e3833001 	orr	r3, r3, #1	; 0x1
  106bf4:	e0851001 	add	r1, r5, r1
  106bf8:	e5813004 	str	r3, [r1, #4]
  106bfc:	e5952004 	ldr	r2, [r5, #4]
  106c00:	e59d3004 	ldr	r3, [sp, #4]
  106c04:	e2022001 	and	r2, r2, #1	; 0x1
  106c08:	e1832002 	orr	r2, r3, r2
  106c0c:	e5852004 	str	r2, [r5, #4]
  106c10:	e59f223c 	ldr	r2, [pc, #572]	; 106e54 <prog+0x6e10>
  106c14:	e59d0000 	ldr	r0, [sp]
  106c18:	e5821008 	str	r1, [r2, #8]
  106c1c:	ebffe839 	bl	100d08 <__malloc_unlock>
  106c20:	e2856008 	add	r6, r5, #8	; 0x8
  106c24:	eaffff74 	b	1069fc <_realloc_r+0x1dc>
  106c28:	e1a0400a 	mov	r4, sl
  106c2c:	e4943004 	ldr	r3, [r4], #4
  106c30:	e1a00006 	mov	r0, r6
  106c34:	e4803004 	str	r3, [r0], #4
  106c38:	e59a2004 	ldr	r2, [sl, #4]
  106c3c:	e351001b 	cmp	r1, #27	; 0x1b
  106c40:	e5862004 	str	r2, [r6, #4]
  106c44:	e280e004 	add	lr, r0, #4	; 0x4
  106c48:	e284c004 	add	ip, r4, #4	; 0x4
  106c4c:	9affff9d 	bls	106ac8 <_realloc_r+0x2a8>
  106c50:	e5943004 	ldr	r3, [r4, #4]
  106c54:	e5803004 	str	r3, [r0, #4]
  106c58:	e59c2004 	ldr	r2, [ip, #4]
  106c5c:	e3510024 	cmp	r1, #36	; 0x24
  106c60:	e28c3004 	add	r3, ip, #4	; 0x4
  106c64:	e28e1004 	add	r1, lr, #4	; 0x4
  106c68:	e58e2004 	str	r2, [lr, #4]
  106c6c:	e283c004 	add	ip, r3, #4	; 0x4
  106c70:	e281e004 	add	lr, r1, #4	; 0x4
  106c74:	1affff93 	bne	106ac8 <_realloc_r+0x2a8>
  106c78:	e5933004 	ldr	r3, [r3, #4]
  106c7c:	e5813004 	str	r3, [r1, #4]
  106c80:	e59c2004 	ldr	r2, [ip, #4]
  106c84:	e28cc008 	add	ip, ip, #8	; 0x8
  106c88:	e58e2004 	str	r2, [lr, #4]
  106c8c:	e28ee008 	add	lr, lr, #8	; 0x8
  106c90:	eaffff8c 	b	106ac8 <_realloc_r+0x2a8>
  106c94:	e1a02004 	mov	r2, r4
  106c98:	e1a0100a 	mov	r1, sl
  106c9c:	e1a00005 	mov	r0, r5
  106ca0:	ebfffbb3 	bl	105b74 <memmove>
  106ca4:	e1a04005 	mov	r4, r5
  106ca8:	e1a0c008 	mov	ip, r8
  106cac:	eaffff43 	b	1069c0 <_realloc_r+0x1a0>
  106cb0:	e1a02004 	mov	r2, r4
  106cb4:	e1a0100a 	mov	r1, sl
  106cb8:	e1a00005 	mov	r0, r5
  106cbc:	ebfffbac 	bl	105b74 <memmove>
  106cc0:	e1a07009 	mov	r7, r9
  106cc4:	e1a04005 	mov	r4, r5
  106cc8:	e1a0c008 	mov	ip, r8
  106ccc:	eaffff3b 	b	1069c0 <_realloc_r+0x1a0>
  106cd0:	e1a02001 	mov	r2, r1
  106cd4:	e1a0100a 	mov	r1, sl
  106cd8:	ebfffba5 	bl	105b74 <memmove>
  106cdc:	eaffff81 	b	106ae8 <_realloc_r+0x2c8>
  106ce0:	e59d0004 	ldr	r0, [sp, #4]
  106ce4:	e0849002 	add	r9, r4, r2
  106ce8:	e08c7009 	add	r7, ip, r9
  106cec:	e2803010 	add	r3, r0, #16	; 0x10
  106cf0:	e1570003 	cmp	r7, r3
  106cf4:	baffff82 	blt	106b04 <_realloc_r+0x2e4>
  106cf8:	e59d1008 	ldr	r1, [sp, #8]
  106cfc:	e2444004 	sub	r4, r4, #4	; 0x4
  106d00:	e591200c 	ldr	r2, [r1, #12]
  106d04:	e5913008 	ldr	r3, [r1, #8]
  106d08:	e3540024 	cmp	r4, #36	; 0x24
  106d0c:	e5823008 	str	r3, [r2, #8]
  106d10:	e583200c 	str	r2, [r3, #12]
  106d14:	e2816008 	add	r6, r1, #8	; 0x8
  106d18:	8a000033 	bhi	106dec <_realloc_r+0x5cc>
  106d1c:	e3540013 	cmp	r4, #19	; 0x13
  106d20:	e1a0c00a 	mov	ip, sl
  106d24:	e1a0e006 	mov	lr, r6
  106d28:	9a000011 	bls	106d74 <_realloc_r+0x554>
  106d2c:	e1a0000a 	mov	r0, sl
  106d30:	e4903004 	ldr	r3, [r0], #4
  106d34:	e5813008 	str	r3, [r1, #8]
  106d38:	e59a2004 	ldr	r2, [sl, #4]
  106d3c:	e354001b 	cmp	r4, #27	; 0x1b
  106d40:	e581200c 	str	r2, [r1, #12]
  106d44:	e281e010 	add	lr, r1, #16	; 0x10
  106d48:	e280c004 	add	ip, r0, #4	; 0x4
  106d4c:	9a000008 	bls	106d74 <_realloc_r+0x554>
  106d50:	e5903004 	ldr	r3, [r0, #4]
  106d54:	e5813010 	str	r3, [r1, #16]
  106d58:	e59c2004 	ldr	r2, [ip, #4]
  106d5c:	e28c3004 	add	r3, ip, #4	; 0x4
  106d60:	e3540024 	cmp	r4, #36	; 0x24
  106d64:	e5812014 	str	r2, [r1, #20]
  106d68:	e281e018 	add	lr, r1, #24	; 0x18
  106d6c:	e283c004 	add	ip, r3, #4	; 0x4
  106d70:	0a000030 	beq	106e38 <_realloc_r+0x618>
  106d74:	e1a0000c 	mov	r0, ip
  106d78:	e4902004 	ldr	r2, [r0], #4
  106d7c:	e1a0100e 	mov	r1, lr
  106d80:	e4812004 	str	r2, [r1], #4
  106d84:	e59c3004 	ldr	r3, [ip, #4]
  106d88:	e58e3004 	str	r3, [lr, #4]
  106d8c:	e5902004 	ldr	r2, [r0, #4]
  106d90:	e5812004 	str	r2, [r1, #4]
  106d94:	e59d2004 	ldr	r2, [sp, #4]
  106d98:	e59d0008 	ldr	r0, [sp, #8]
  106d9c:	e0623007 	rsb	r3, r2, r7
  106da0:	e0801002 	add	r1, r0, r2
  106da4:	e3833001 	orr	r3, r3, #1	; 0x1
  106da8:	e5813004 	str	r3, [r1, #4]
  106dac:	e5902004 	ldr	r2, [r0, #4]
  106db0:	e59d3004 	ldr	r3, [sp, #4]
  106db4:	e2022001 	and	r2, r2, #1	; 0x1
  106db8:	e1832002 	orr	r2, r3, r2
  106dbc:	e5802004 	str	r2, [r0, #4]
  106dc0:	e59f208c 	ldr	r2, [pc, #140]	; 106e54 <prog+0x6e10>
  106dc4:	e59d0000 	ldr	r0, [sp]
  106dc8:	e5821008 	str	r1, [r2, #8]
  106dcc:	ebffe7cd 	bl	100d08 <__malloc_unlock>
  106dd0:	eaffff09 	b	1069fc <_realloc_r+0x1dc>
  106dd4:	e5923004 	ldr	r3, [r2, #4]
  106dd8:	e3c33003 	bic	r3, r3, #3	; 0x3
  106ddc:	e0847003 	add	r7, r4, r3
  106de0:	e1a0c005 	mov	ip, r5
  106de4:	e2854008 	add	r4, r5, #8	; 0x8
  106de8:	eafffef4 	b	1069c0 <_realloc_r+0x1a0>
  106dec:	e1a0100a 	mov	r1, sl
  106df0:	e1a02004 	mov	r2, r4
  106df4:	e1a00006 	mov	r0, r6
  106df8:	ebfffb5d 	bl	105b74 <memmove>
  106dfc:	eaffffe4 	b	106d94 <_realloc_r+0x574>
  106e00:	e5933004 	ldr	r3, [r3, #4]
  106e04:	e5883018 	str	r3, [r8, #24]
  106e08:	e59c2004 	ldr	r2, [ip, #4]
  106e0c:	e288e020 	add	lr, r8, #32	; 0x20
  106e10:	e28cc008 	add	ip, ip, #8	; 0x8
  106e14:	e588201c 	str	r2, [r8, #28]
  106e18:	eafffede 	b	106998 <_realloc_r+0x178>
  106e1c:	e5933004 	ldr	r3, [r3, #4]
  106e20:	e5883018 	str	r3, [r8, #24]
  106e24:	e59c2004 	ldr	r2, [ip, #4]
  106e28:	e288e020 	add	lr, r8, #32	; 0x20
  106e2c:	e28cc008 	add	ip, ip, #8	; 0x8
  106e30:	e588201c 	str	r2, [r8, #28]
  106e34:	eaffff54 	b	106b8c <_realloc_r+0x36c>
  106e38:	e5933004 	ldr	r3, [r3, #4]
  106e3c:	e5813018 	str	r3, [r1, #24]
  106e40:	e59c2004 	ldr	r2, [ip, #4]
  106e44:	e281e020 	add	lr, r1, #32	; 0x20
  106e48:	e28cc008 	add	ip, ip, #8	; 0x8
  106e4c:	e581201c 	str	r2, [r1, #28]
  106e50:	eaffffc7 	b	106d74 <_realloc_r+0x554>
  106e54:	00200000 	eoreq	r0, r0, r0

00106e58 <isinf>:
  106e58:	e2612000 	rsb	r2, r1, #0	; 0x0
  106e5c:	e1822001 	orr	r2, r2, r1
  106e60:	e3c03102 	bic	r3, r0, #-2147483648	; 0x80000000
  106e64:	e3a0047f 	mov	r0, #2130706432	; 0x7f000000
  106e68:	e1833fa2 	orr	r3, r3, r2, lsr #31
  106e6c:	e280060f 	add	r0, r0, #15728640	; 0xf00000
  106e70:	e0630000 	rsb	r0, r3, r0
  106e74:	e52d4004 	str	r4, [sp, #-4]!
  106e78:	e2602000 	rsb	r2, r0, #0	; 0x0
  106e7c:	e1800002 	orr	r0, r0, r2
  106e80:	e1a00fa0 	mov	r0, r0, lsr #31
  106e84:	e1a04001 	mov	r4, r1
  106e88:	e2600001 	rsb	r0, r0, #1	; 0x1
  106e8c:	e8bd0010 	ldmia	sp!, {r4}
  106e90:	e12fff1e 	bx	lr

00106e94 <isnan>:
  106e94:	e52d4004 	str	r4, [sp, #-4]!
  106e98:	e2612000 	rsb	r2, r1, #0	; 0x0
  106e9c:	e1822001 	orr	r2, r2, r1
  106ea0:	e3c03102 	bic	r3, r0, #-2147483648	; 0x80000000
  106ea4:	e3a0047f 	mov	r0, #2130706432	; 0x7f000000
  106ea8:	e1833fa2 	orr	r3, r3, r2, lsr #31
  106eac:	e280060f 	add	r0, r0, #15728640	; 0xf00000
  106eb0:	e0630000 	rsb	r0, r3, r0
  106eb4:	e1a04001 	mov	r4, r1
  106eb8:	e1a00fa0 	mov	r0, r0, lsr #31
  106ebc:	e8bd0010 	ldmia	sp!, {r4}
  106ec0:	e12fff1e 	bx	lr

00106ec4 <__sclose>:
  106ec4:	e59f3008 	ldr	r3, [pc, #8]	; 106ed4 <prog+0x6e90>
  106ec8:	e1d010fe 	ldrsh	r1, [r0, #14]
  106ecc:	e5930000 	ldr	r0, [r3]
  106ed0:	ea00096c 	b	109488 <_close_r>
  106ed4:	00200410 	eoreq	r0, r0, r0, lsl r4

00106ed8 <__sseek>:
  106ed8:	e1a03002 	mov	r3, r2
  106edc:	e59f2038 	ldr	r2, [pc, #56]	; 106f1c <prog+0x6ed8>
  106ee0:	e92d4010 	stmdb	sp!, {r4, lr}
  106ee4:	e1a04000 	mov	r4, r0
  106ee8:	e5920000 	ldr	r0, [r2]
  106eec:	e1a02001 	mov	r2, r1
  106ef0:	e1d410fe 	ldrsh	r1, [r4, #14]
  106ef4:	eb000965 	bl	109490 <_lseek_r>
  106ef8:	e3700001 	cmn	r0, #1	; 0x1
  106efc:	01d430bc 	ldreqh	r3, [r4, #12]
  106f00:	11d430bc 	ldrneh	r3, [r4, #12]
  106f04:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
  106f08:	13833a01 	orrne	r3, r3, #4096	; 0x1000
  106f0c:	01c430bc 	streqh	r3, [r4, #12]
  106f10:	11c430bc 	strneh	r3, [r4, #12]
  106f14:	15840050 	strne	r0, [r4, #80]
  106f18:	e8bd8010 	ldmia	sp!, {r4, pc}
  106f1c:	00200410 	eoreq	r0, r0, r0, lsl r4

00106f20 <__swrite>:
  106f20:	e1d0c0bc 	ldrh	ip, [r0, #12]
  106f24:	e31c0c01 	tst	ip, #256	; 0x100
  106f28:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  106f2c:	e3a03002 	mov	r3, #2	; 0x2
  106f30:	e59f7044 	ldr	r7, [pc, #68]	; 106f7c <prog+0x6f38>
  106f34:	e1a06002 	mov	r6, r2
  106f38:	e1a04000 	mov	r4, r0
  106f3c:	e1a05001 	mov	r5, r1
  106f40:	e3a02000 	mov	r2, #0	; 0x0
  106f44:	059f7030 	ldreq	r7, [pc, #48]	; 106f7c <prog+0x6f38>
  106f48:	0a000003 	beq	106f5c <__swrite+0x3c>
  106f4c:	e5970000 	ldr	r0, [r7]
  106f50:	e1d410fe 	ldrsh	r1, [r4, #14]
  106f54:	eb00094d 	bl	109490 <_lseek_r>
  106f58:	e1d4c0bc 	ldrh	ip, [r4, #12]
  106f5c:	e5970000 	ldr	r0, [r7]
  106f60:	e1d410fe 	ldrsh	r1, [r4, #14]
  106f64:	e3ccca01 	bic	ip, ip, #4096	; 0x1000
  106f68:	e1a02005 	mov	r2, r5
  106f6c:	e1a03006 	mov	r3, r6
  106f70:	e1c4c0bc 	strh	ip, [r4, #12]
  106f74:	e8bd40f0 	ldmia	sp!, {r4, r5, r6, r7, lr}
  106f78:	ea000956 	b	1094d8 <_write_r>
  106f7c:	00200410 	eoreq	r0, r0, r0, lsl r4

00106f80 <__sread>:
  106f80:	e1a03002 	mov	r3, r2
  106f84:	e59f2034 	ldr	r2, [pc, #52]	; 106fc0 <prog+0x6f7c>
  106f88:	e92d4010 	stmdb	sp!, {r4, lr}
  106f8c:	e1a04000 	mov	r4, r0
  106f90:	e5920000 	ldr	r0, [r2]
  106f94:	e1a02001 	mov	r2, r1
  106f98:	e1d410fe 	ldrsh	r1, [r4, #14]
  106f9c:	eb000965 	bl	109538 <_read_r>
  106fa0:	e3500000 	cmp	r0, #0	; 0x0
  106fa4:	a5943050 	ldrge	r3, [r4, #80]
  106fa8:	b1d430bc 	ldrlth	r3, [r4, #12]
  106fac:	a0833000 	addge	r3, r3, r0
  106fb0:	b3c33a01 	biclt	r3, r3, #4096	; 0x1000
  106fb4:	a5843050 	strge	r3, [r4, #80]
  106fb8:	b1c430bc 	strlth	r3, [r4, #12]
  106fbc:	e8bd8010 	ldmia	sp!, {r4, pc}
  106fc0:	00200410 	eoreq	r0, r0, r0, lsl r4

00106fc4 <strcmp>:
  106fc4:	e1803001 	orr	r3, r0, r1
  106fc8:	e3130003 	tst	r3, #3	; 0x3
  106fcc:	e1a02000 	mov	r2, r0
  106fd0:	1a00001d 	bne	10704c <strcmp+0x88>
  106fd4:	e5902000 	ldr	r2, [r0]
  106fd8:	e5913000 	ldr	r3, [r1]
  106fdc:	e1520003 	cmp	r2, r3
  106fe0:	1a000018 	bne	107048 <strcmp+0x84>
  106fe4:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  106fe8:	e2433801 	sub	r3, r3, #65536	; 0x10000
  106fec:	e2433c01 	sub	r3, r3, #256	; 0x100
  106ff0:	e2433001 	sub	r3, r3, #1	; 0x1
  106ff4:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  106ff8:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  106ffc:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  107000:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  107004:	e1d32002 	bics	r2, r3, r2
  107008:	0a000002 	beq	107018 <strcmp+0x54>
  10700c:	ea00001e 	b	10708c <strcmp+0xc8>
  107010:	e1d2c00c 	bics	ip, r2, ip
  107014:	1a00001c 	bne	10708c <strcmp+0xc8>
  107018:	e5b0c004 	ldr	ip, [r0, #4]!
  10701c:	e28c34ff 	add	r3, ip, #-16777216	; 0xff000000
  107020:	e2433801 	sub	r3, r3, #65536	; 0x10000
  107024:	e2433c01 	sub	r3, r3, #256	; 0x100
  107028:	e2433001 	sub	r3, r3, #1	; 0x1
  10702c:	e3c3247f 	bic	r2, r3, #2130706432	; 0x7f000000
  107030:	e5b13004 	ldr	r3, [r1, #4]!
  107034:	e3c2287f 	bic	r2, r2, #8323072	; 0x7f0000
  107038:	e3c22c7f 	bic	r2, r2, #32512	; 0x7f00
  10703c:	e15c0003 	cmp	ip, r3
  107040:	e3c2207f 	bic	r2, r2, #127	; 0x7f
  107044:	0afffff1 	beq	107010 <strcmp+0x4c>
  107048:	e1a02000 	mov	r2, r0
  10704c:	e5d23000 	ldrb	r3, [r2]
  107050:	e3530000 	cmp	r3, #0	; 0x0
  107054:	1a000004 	bne	10706c <strcmp+0xa8>
  107058:	ea000008 	b	107080 <strcmp+0xbc>
  10705c:	e5f23001 	ldrb	r3, [r2, #1]!
  107060:	e3530000 	cmp	r3, #0	; 0x0
  107064:	e2811001 	add	r1, r1, #1	; 0x1
  107068:	0a000004 	beq	107080 <strcmp+0xbc>
  10706c:	e5d10000 	ldrb	r0, [r1]
  107070:	e1500003 	cmp	r0, r3
  107074:	0afffff8 	beq	10705c <strcmp+0x98>
  107078:	e0600003 	rsb	r0, r0, r3
  10707c:	e12fff1e 	bx	lr
  107080:	e5d10000 	ldrb	r0, [r1]
  107084:	e0600003 	rsb	r0, r0, r3
  107088:	e12fff1e 	bx	lr
  10708c:	e3a00000 	mov	r0, #0	; 0x0
  107090:	e12fff1e 	bx	lr

00107094 <findslot>:
  107094:	e59f2024 	ldr	r2, [pc, #36]	; 1070c0 <prog+0x707c>
  107098:	e1a01000 	mov	r1, r0
  10709c:	e3a00000 	mov	r0, #0	; 0x0
  1070a0:	e5923000 	ldr	r3, [r2]
  1070a4:	e1530001 	cmp	r3, r1
  1070a8:	e2822008 	add	r2, r2, #8	; 0x8
  1070ac:	012fff1e 	bxeq	lr
  1070b0:	e2800001 	add	r0, r0, #1	; 0x1
  1070b4:	e3500014 	cmp	r0, #20	; 0x14
  1070b8:	1afffff8 	bne	1070a0 <findslot+0xc>
  1070bc:	e12fff1e 	bx	lr
  1070c0:	00200bcc 	eoreq	r0, r0, ip, asr #23

001070c4 <_getpid>:
  1070c4:	e3a00001 	mov	r0, #1	; 0x1
  1070c8:	e12fff1e 	bx	lr

001070cc <_link>:
  1070cc:	e3e00000 	mvn	r0, #0	; 0x0
  1070d0:	e12fff1e 	bx	lr

001070d4 <_unlink>:
  1070d4:	e3e00000 	mvn	r0, #0	; 0x0
  1070d8:	e12fff1e 	bx	lr

001070dc <_raise>:
  1070dc:	e12fff1e 	bx	lr

001070e0 <isatty>:
  1070e0:	e3a00001 	mov	r0, #1	; 0x1
  1070e4:	e12fff1e 	bx	lr

001070e8 <_rename>:
  1070e8:	e52de004 	str	lr, [sp, #-4]!
  1070ec:	eb0001d2 	bl	10783c <__errno>
  1070f0:	e3a03058 	mov	r3, #88	; 0x58
  1070f4:	e5803000 	str	r3, [r0]
  1070f8:	e3e00000 	mvn	r0, #0	; 0x0
  1070fc:	e49df004 	ldr	pc, [sp], #4

00107100 <_system>:
  107100:	e3500000 	cmp	r0, #0	; 0x0
  107104:	e52de004 	str	lr, [sp, #-4]!
  107108:	049df004 	ldreq	pc, [sp], #4
  10710c:	eb0001ca 	bl	10783c <__errno>
  107110:	e3a03058 	mov	r3, #88	; 0x58
  107114:	e5803000 	str	r3, [r0]
  107118:	e3e00000 	mvn	r0, #0	; 0x0
  10711c:	e49df004 	ldr	pc, [sp], #4

00107120 <_sbrk>:
  107120:	e59f1044 	ldr	r1, [pc, #68]	; 10716c <prog+0x7128>
  107124:	e5913000 	ldr	r3, [r1]
  107128:	e52de004 	str	lr, [sp, #-4]!
  10712c:	e3530000 	cmp	r3, #0	; 0x0
  107130:	059f3038 	ldreq	r3, [pc, #56]	; 107170 <prog+0x712c>
  107134:	e0830000 	add	r0, r3, r0
  107138:	05813000 	streq	r3, [r1]
  10713c:	e150000d 	cmp	r0, sp
  107140:	e1a02003 	mov	r2, r3
  107144:	95810000 	strls	r0, [r1]
  107148:	8a000001 	bhi	107154 <_sbrk+0x34>
  10714c:	e1a00002 	mov	r0, r2
  107150:	e49df004 	ldr	pc, [sp], #4
  107154:	eb0001b8 	bl	10783c <__errno>
  107158:	e3e02000 	mvn	r2, #0	; 0x0
  10715c:	e3a0300c 	mov	r3, #12	; 0xc
  107160:	e5803000 	str	r3, [r0]
  107164:	e1a00002 	mov	r0, r2
  107168:	e49df004 	ldr	pc, [sp], #4
  10716c:	00200bbc 	streqh	r0, [r0], -ip
  107170:	002019d8 	ldreqd	r1, [r0], -r8

00107174 <_fstat>:
  107174:	e92d4010 	stmdb	sp!, {r4, lr}
  107178:	e1a00001 	mov	r0, r1
  10717c:	e1a04001 	mov	r4, r1
  107180:	e3a0203c 	mov	r2, #60	; 0x3c
  107184:	e3a01000 	mov	r1, #0	; 0x0
  107188:	ebffe6b7 	bl	100c6c <memset>
  10718c:	e3a03b01 	mov	r3, #1024	; 0x400
  107190:	e3a02a02 	mov	r2, #8192	; 0x2000
  107194:	e3a00000 	mov	r0, #0	; 0x0
  107198:	e584302c 	str	r3, [r4, #44]
  10719c:	e5842004 	str	r2, [r4, #4]
  1071a0:	e8bd8010 	ldmia	sp!, {r4, pc}

001071a4 <remap_handle>:
  1071a4:	e59f3064 	ldr	r3, [pc, #100]	; 107210 <prog+0x71cc>
  1071a8:	e5932000 	ldr	r2, [r3]
  1071ac:	e3520000 	cmp	r2, #0	; 0x0
  1071b0:	e92d4010 	stmdb	sp!, {r4, lr}
  1071b4:	e1a04000 	mov	r4, r0
  1071b8:	0a000002 	beq	1071c8 <remap_handle+0x24>
  1071bc:	e5923038 	ldr	r3, [r2, #56]
  1071c0:	e3530000 	cmp	r3, #0	; 0x0
  1071c4:	0a00000b 	beq	1071f8 <remap_handle+0x54>
  1071c8:	e3540000 	cmp	r4, #0	; 0x0
  1071cc:	1a000002 	bne	1071dc <remap_handle+0x38>
  1071d0:	e59f303c 	ldr	r3, [pc, #60]	; 107214 <prog+0x71d0>
  1071d4:	e5930000 	ldr	r0, [r3]
  1071d8:	e8bd8010 	ldmia	sp!, {r4, pc}
  1071dc:	e3540001 	cmp	r4, #1	; 0x1
  1071e0:	0a000007 	beq	107204 <remap_handle+0x60>
  1071e4:	e3540002 	cmp	r4, #2	; 0x2
  1071e8:	059f3028 	ldreq	r3, [pc, #40]	; 107218 <prog+0x71d4>
  1071ec:	05930000 	ldreq	r0, [r3]
  1071f0:	12440020 	subne	r0, r4, #32	; 0x20
  1071f4:	e8bd8010 	ldmia	sp!, {r4, pc}
  1071f8:	e1a00002 	mov	r0, r2
  1071fc:	ebfff6ef 	bl	104dc0 <__sinit>
  107200:	eafffff0 	b	1071c8 <remap_handle+0x24>
  107204:	e59f3010 	ldr	r3, [pc, #16]	; 10721c <prog+0x71d8>
  107208:	e5930000 	ldr	r0, [r3]
  10720c:	e8bd8010 	ldmia	sp!, {r4, pc}
  107210:	00200410 	eoreq	r0, r0, r0, lsl r4
  107214:	00200bc0 	eoreq	r0, r0, r0, asr #23
  107218:	00200bc8 	eoreq	r0, r0, r8, asr #23
  10721c:	00200bc4 	eoreq	r0, r0, r4, asr #23

00107220 <initialise_monitor_handles>:
  107220:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  107224:	e59f709c 	ldr	r7, [pc, #156]	; 1072c8 <prog+0x7284>
  107228:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10722c:	e3a08003 	mov	r8, #3	; 0x3
  107230:	e3a03000 	mov	r3, #0	; 0x0
  107234:	e58d7000 	str	r7, [sp]
  107238:	e3a06001 	mov	r6, #1	; 0x1
  10723c:	e58d8008 	str	r8, [sp, #8]
  107240:	e1a0500d 	mov	r5, sp
  107244:	e58d3004 	str	r3, [sp, #4]
  107248:	e1a00006 	mov	r0, r6
  10724c:	e1a0100d 	mov	r1, sp
  107250:	ef123456 	swi	0x00123456
  107254:	e1a04000 	mov	r4, r0
  107258:	e59fa06c 	ldr	sl, [pc, #108]	; 1072cc <prog+0x7288>
  10725c:	e58a4000 	str	r4, [sl]
  107260:	e3a04004 	mov	r4, #4	; 0x4
  107264:	e58d7000 	str	r7, [sp]
  107268:	e58d8008 	str	r8, [sp, #8]
  10726c:	e58d4004 	str	r4, [sp, #4]
  107270:	e1a00006 	mov	r0, r6
  107274:	e1a0100d 	mov	r1, sp
  107278:	ef123456 	swi	0x00123456
  10727c:	e1a04000 	mov	r4, r0
  107280:	e59f3048 	ldr	r3, [pc, #72]	; 1072d0 <prog+0x728c>
  107284:	e59f2048 	ldr	r2, [pc, #72]	; 1072d4 <prog+0x7290>
  107288:	e59f0048 	ldr	r0, [pc, #72]	; 1072d8 <prog+0x7294>
  10728c:	e5834000 	str	r4, [r3]
  107290:	e5824000 	str	r4, [r2]
  107294:	e3e03000 	mvn	r3, #0	; 0x0
  107298:	e28020a0 	add	r2, r0, #160	; 0xa0
  10729c:	e4803008 	str	r3, [r0], #8
  1072a0:	e1500002 	cmp	r0, r2
  1072a4:	1afffffc 	bne	10729c <initialise_monitor_handles+0x7c>
  1072a8:	e59a3000 	ldr	r3, [sl]
  1072ac:	e24020a0 	sub	r2, r0, #160	; 0xa0
  1072b0:	e3a01000 	mov	r1, #0	; 0x0
  1072b4:	e50030a0 	str	r3, [r0, #-160]
  1072b8:	e582100c 	str	r1, [r2, #12]
  1072bc:	e9820012 	stmib	r2, {r1, r4}
  1072c0:	e28dd00c 	add	sp, sp, #12	; 0xc
  1072c4:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  1072c8:	0010cf9c 	muleqs	r0, ip, pc
  1072cc:	00200bc0 	eoreq	r0, r0, r0, asr #23
  1072d0:	00200bc8 	eoreq	r0, r0, r8, asr #23
  1072d4:	00200bc4 	eoreq	r0, r0, r4, asr #23
  1072d8:	00200bcc 	eoreq	r0, r0, ip, asr #23

001072dc <_times>:
  1072dc:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  1072e0:	e1a05000 	mov	r5, r0
  1072e4:	e3a04010 	mov	r4, #16	; 0x10
  1072e8:	e3a06000 	mov	r6, #0	; 0x0
  1072ec:	e1a00004 	mov	r0, r4
  1072f0:	e1a01006 	mov	r1, r6
  1072f4:	ef123456 	swi	0x00123456
  1072f8:	e1a04000 	mov	r4, r0
  1072fc:	e1550006 	cmp	r5, r6
  107300:	e1a00004 	mov	r0, r4
  107304:	1585600c 	strne	r6, [r5, #12]
  107308:	15854000 	strne	r4, [r5]
  10730c:	15856004 	strne	r6, [r5, #4]
  107310:	15856008 	strne	r6, [r5, #8]
  107314:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

00107318 <_gettimeofday>:
  107318:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10731c:	e2507000 	subs	r7, r0, #0	; 0x0
  107320:	e1a06001 	mov	r6, r1
  107324:	0a000007 	beq	107348 <_gettimeofday+0x30>
  107328:	e3a05011 	mov	r5, #17	; 0x11
  10732c:	e3a04000 	mov	r4, #0	; 0x0
  107330:	e1a00005 	mov	r0, r5
  107334:	e1a01004 	mov	r1, r4
  107338:	ef123456 	swi	0x00123456
  10733c:	e1a05000 	mov	r5, r0
  107340:	e5874004 	str	r4, [r7, #4]
  107344:	e5875000 	str	r5, [r7]
  107348:	e3a03000 	mov	r3, #0	; 0x0
  10734c:	e1560003 	cmp	r6, r3
  107350:	e3a00000 	mov	r0, #0	; 0x0
  107354:	15863004 	strne	r3, [r6, #4]
  107358:	15863000 	strne	r3, [r6]
  10735c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00107360 <_kill>:
  107360:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  107364:	e3a05802 	mov	r5, #131072	; 0x20000
  107368:	e2855026 	add	r5, r5, #38	; 0x26
  10736c:	e3a04018 	mov	r4, #24	; 0x18
  107370:	e1a00004 	mov	r0, r4
  107374:	e1a01005 	mov	r1, r5
  107378:	ef123456 	swi	0x00123456
  10737c:	e1a04000 	mov	r4, r0
  107380:	e1a00004 	mov	r0, r4
  107384:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107388 <_exit>:
  107388:	e3a05802 	mov	r5, #131072	; 0x20000
  10738c:	e2855026 	add	r5, r5, #38	; 0x26
  107390:	e3a04018 	mov	r4, #24	; 0x18
  107394:	e1a00004 	mov	r0, r4
  107398:	e1a01005 	mov	r1, r5
  10739c:	ef123456 	swi	0x00123456
  1073a0:	e1a04000 	mov	r4, r0
  1073a4:	e12fff1e 	bx	lr

001073a8 <_swiclose>:
  1073a8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1073ac:	e24dd004 	sub	sp, sp, #4	; 0x4
  1073b0:	ebffff7b 	bl	1071a4 <remap_handle>
  1073b4:	e58d0000 	str	r0, [sp]
  1073b8:	ebffff35 	bl	107094 <findslot>
  1073bc:	e3500014 	cmp	r0, #20	; 0x14
  1073c0:	159f3028 	ldrne	r3, [pc, #40]	; 1073f0 <prog+0x73ac>
  1073c4:	13e02000 	mvnne	r2, #0	; 0x0
  1073c8:	17832180 	strne	r2, [r3, r0, lsl #3]
  1073cc:	e3a04002 	mov	r4, #2	; 0x2
  1073d0:	e1a0500d 	mov	r5, sp
  1073d4:	e1a00004 	mov	r0, r4
  1073d8:	e1a0100d 	mov	r1, sp
  1073dc:	ef123456 	swi	0x00123456
  1073e0:	e1a04000 	mov	r4, r0
  1073e4:	e1a00004 	mov	r0, r4
  1073e8:	e28dd004 	add	sp, sp, #4	; 0x4
  1073ec:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1073f0:	00200bcc 	eoreq	r0, r0, ip, asr #23

001073f4 <_swiwrite>:
  1073f4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1073f8:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1073fc:	e1a04001 	mov	r4, r1
  107400:	e1a05002 	mov	r5, r2
  107404:	ebffff66 	bl	1071a4 <remap_handle>
  107408:	e88d0031 	stmia	sp, {r0, r4, r5}
  10740c:	e3a04005 	mov	r4, #5	; 0x5
  107410:	e1a0500d 	mov	r5, sp
  107414:	e1a00004 	mov	r0, r4
  107418:	e1a0100d 	mov	r1, sp
  10741c:	ef123456 	swi	0x00123456
  107420:	e1a04000 	mov	r4, r0
  107424:	e1a00004 	mov	r0, r4
  107428:	e28dd00c 	add	sp, sp, #12	; 0xc
  10742c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107430 <_swilseek>:
  107430:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  107434:	e24dd008 	sub	sp, sp, #8	; 0x8
  107438:	e1a04002 	mov	r4, r2
  10743c:	e1a05001 	mov	r5, r1
  107440:	e1a08000 	mov	r8, r0
  107444:	ebffff56 	bl	1071a4 <remap_handle>
  107448:	e1a07000 	mov	r7, r0
  10744c:	ebffff10 	bl	107094 <findslot>
  107450:	e3540001 	cmp	r4, #1	; 0x1
  107454:	e1a06000 	mov	r6, r0
  107458:	0a00001a 	beq	1074c8 <_swilseek+0x98>
  10745c:	e3540002 	cmp	r4, #2	; 0x2
  107460:	11a0700d 	movne	r7, sp
  107464:	0a00001f 	beq	1074e8 <_swilseek+0xb8>
  107468:	e1a00008 	mov	r0, r8
  10746c:	ebffff4c 	bl	1071a4 <remap_handle>
  107470:	e3a0400a 	mov	r4, #10	; 0xa
  107474:	e88d0021 	stmia	sp, {r0, r5}
  107478:	e1a00004 	mov	r0, r4
  10747c:	e1a01007 	mov	r1, r7
  107480:	ef123456 	swi	0x00123456
  107484:	e1a04000 	mov	r4, r0
  107488:	e2744001 	rsbs	r4, r4, #1	; 0x1
  10748c:	33a04000 	movcc	r4, #0	; 0x0
  107490:	e3560014 	cmp	r6, #20	; 0x14
  107494:	03a03000 	moveq	r3, #0	; 0x0
  107498:	12043001 	andne	r3, r4, #1	; 0x1
  10749c:	e3530000 	cmp	r3, #0	; 0x0
  1074a0:	159f3064 	ldrne	r3, [pc, #100]	; 10750c <prog+0x74c8>
  1074a4:	10833186 	addne	r3, r3, r6, lsl #3
  1074a8:	15835004 	strne	r5, [r3, #4]
  1074ac:	e3540000 	cmp	r4, #0	; 0x0
  1074b0:	0a000002 	beq	1074c0 <_swilseek+0x90>
  1074b4:	e1a00005 	mov	r0, r5
  1074b8:	e28dd008 	add	sp, sp, #8	; 0x8
  1074bc:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1074c0:	e3e05000 	mvn	r5, #0	; 0x0
  1074c4:	eafffffa 	b	1074b4 <_swilseek+0x84>
  1074c8:	e3500014 	cmp	r0, #20	; 0x14
  1074cc:	0afffffb 	beq	1074c0 <_swilseek+0x90>
  1074d0:	e59f3034 	ldr	r3, [pc, #52]	; 10750c <prog+0x74c8>
  1074d4:	e0833180 	add	r3, r3, r0, lsl #3
  1074d8:	e5932004 	ldr	r2, [r3, #4]
  1074dc:	e1a0700d 	mov	r7, sp
  1074e0:	e0855002 	add	r5, r5, r2
  1074e4:	eaffffdf 	b	107468 <_swilseek+0x38>
  1074e8:	e58d7000 	str	r7, [sp]
  1074ec:	e284400a 	add	r4, r4, #10	; 0xa
  1074f0:	e1a0700d 	mov	r7, sp
  1074f4:	e1a00004 	mov	r0, r4
  1074f8:	e1a0100d 	mov	r1, sp
  1074fc:	ef123456 	swi	0x00123456
  107500:	e1a04000 	mov	r4, r0
  107504:	e0855004 	add	r5, r5, r4
  107508:	eaffffd6 	b	107468 <_swilseek+0x38>
  10750c:	00200bcc 	eoreq	r0, r0, ip, asr #23

00107510 <error>:
  107510:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  107514:	e1a07000 	mov	r7, r0
  107518:	eb0000c7 	bl	10783c <__errno>
  10751c:	e3a04013 	mov	r4, #19	; 0x13
  107520:	e1a06000 	mov	r6, r0
  107524:	e3a05000 	mov	r5, #0	; 0x0
  107528:	e1a00004 	mov	r0, r4
  10752c:	e1a01005 	mov	r1, r5
  107530:	ef123456 	swi	0x00123456
  107534:	e1a04000 	mov	r4, r0
  107538:	e1a00007 	mov	r0, r7
  10753c:	e5864000 	str	r4, [r6]
  107540:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00107544 <_swiopen>:
  107544:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  107548:	e1a07000 	mov	r7, r0
  10754c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  107550:	e3e00000 	mvn	r0, #0	; 0x0
  107554:	e1a05001 	mov	r5, r1
  107558:	ebfffecd 	bl	107094 <findslot>
  10755c:	e3500014 	cmp	r0, #20	; 0x14
  107560:	e1a06000 	mov	r6, r0
  107564:	03e00000 	mvneq	r0, #0	; 0x0
  107568:	0a000019 	beq	1075d4 <_swiopen+0x90>
  10756c:	e2054002 	and	r4, r5, #2	; 0x2
  107570:	e3150c02 	tst	r5, #512	; 0x200
  107574:	13844004 	orrne	r4, r4, #4	; 0x4
  107578:	e3150b01 	tst	r5, #1024	; 0x400
  10757c:	13844004 	orrne	r4, r4, #4	; 0x4
  107580:	e3150008 	tst	r5, #8	; 0x8
  107584:	13c43004 	bicne	r3, r4, #4	; 0x4
  107588:	e1a00007 	mov	r0, r7
  10758c:	13834008 	orrne	r4, r3, #8	; 0x8
  107590:	e58d7000 	str	r7, [sp]
  107594:	ebffe613 	bl	100de8 <strlen>
  107598:	e3a05001 	mov	r5, #1	; 0x1
  10759c:	e58d4004 	str	r4, [sp, #4]
  1075a0:	e58d0008 	str	r0, [sp, #8]
  1075a4:	e1a00005 	mov	r0, r5
  1075a8:	e1a0100d 	mov	r1, sp
  1075ac:	ef123456 	swi	0x00123456
  1075b0:	e1a04000 	mov	r4, r0
  1075b4:	e3540000 	cmp	r4, #0	; 0x0
  1075b8:	ba000007 	blt	1075dc <_swiopen+0x98>
  1075bc:	e59f1024 	ldr	r1, [pc, #36]	; 1075e8 <prog+0x75a4>
  1075c0:	e3a03000 	mov	r3, #0	; 0x0
  1075c4:	e0812186 	add	r2, r1, r6, lsl #3
  1075c8:	e5823004 	str	r3, [r2, #4]
  1075cc:	e7814186 	str	r4, [r1, r6, lsl #3]
  1075d0:	e2840020 	add	r0, r4, #32	; 0x20
  1075d4:	e28dd00c 	add	sp, sp, #12	; 0xc
  1075d8:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1075dc:	e1a00004 	mov	r0, r4
  1075e0:	ebffffca 	bl	107510 <error>
  1075e4:	eafffffa 	b	1075d4 <_swiopen+0x90>
  1075e8:	00200bcc 	eoreq	r0, r0, ip, asr #23

001075ec <_write>:
  1075ec:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  1075f0:	e1a06002 	mov	r6, r2
  1075f4:	e1a05001 	mov	r5, r1
  1075f8:	e1a04000 	mov	r4, r0
  1075fc:	ebfffee8 	bl	1071a4 <remap_handle>
  107600:	ebfffea3 	bl	107094 <findslot>
  107604:	e1a02006 	mov	r2, r6
  107608:	e1a07000 	mov	r7, r0
  10760c:	e1a01005 	mov	r1, r5
  107610:	e1a00004 	mov	r0, r4
  107614:	ebffff76 	bl	1073f4 <_swiwrite>
  107618:	e1a02000 	mov	r2, r0
  10761c:	e3e00000 	mvn	r0, #0	; 0x0
  107620:	e1520000 	cmp	r2, r0
  107624:	11560002 	cmpne	r6, r2
  107628:	0a000008 	beq	107650 <_write+0x64>
  10762c:	e59f3024 	ldr	r3, [pc, #36]	; 107658 <prog+0x7614>
  107630:	e3570014 	cmp	r7, #20	; 0x14
  107634:	e0831187 	add	r1, r3, r7, lsl #3
  107638:	e0620006 	rsb	r0, r2, r6
  10763c:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
  107640:	e5913004 	ldr	r3, [r1, #4]
  107644:	e0833000 	add	r3, r3, r0
  107648:	e5813004 	str	r3, [r1, #4]
  10764c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  107650:	e8bd40f0 	ldmia	sp!, {r4, r5, r6, r7, lr}
  107654:	eaffffad 	b	107510 <error>
  107658:	00200bcc 	eoreq	r0, r0, ip, asr #23

0010765c <wrap>:
  10765c:	e3700001 	cmn	r0, #1	; 0x1
  107660:	112fff1e 	bxne	lr
  107664:	eaffffa9 	b	107510 <error>

00107668 <_close>:
  107668:	e52de004 	str	lr, [sp, #-4]!
  10766c:	ebffff4d 	bl	1073a8 <_swiclose>
  107670:	e49de004 	ldr	lr, [sp], #4
  107674:	eafffff8 	b	10765c <wrap>

00107678 <_open>:
  107678:	e92d000e 	stmdb	sp!, {r1, r2, r3}
  10767c:	e52de004 	str	lr, [sp, #-4]!
  107680:	e59d1004 	ldr	r1, [sp, #4]
  107684:	ebffffae 	bl	107544 <_swiopen>
  107688:	ebfffff3 	bl	10765c <wrap>
  10768c:	e49de004 	ldr	lr, [sp], #4
  107690:	e28dd00c 	add	sp, sp, #12	; 0xc
  107694:	e12fff1e 	bx	lr

00107698 <_stat>:
  107698:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10769c:	e1a04001 	mov	r4, r1
  1076a0:	e3a01000 	mov	r1, #0	; 0x0
  1076a4:	ebfffff3 	bl	107678 <_open>
  1076a8:	e2505000 	subs	r5, r0, #0	; 0x0
  1076ac:	e3a01000 	mov	r1, #0	; 0x0
  1076b0:	e3a0203c 	mov	r2, #60	; 0x3c
  1076b4:	e1a00004 	mov	r0, r4
  1076b8:	e3e03000 	mvn	r3, #0	; 0x0
  1076bc:	ba000007 	blt	1076e0 <_stat+0x48>
  1076c0:	ebffe569 	bl	100c6c <memset>
  1076c4:	e3a03b01 	mov	r3, #1024	; 0x400
  1076c8:	e3a02c81 	mov	r2, #33024	; 0x8100
  1076cc:	e584302c 	str	r3, [r4, #44]
  1076d0:	e5842004 	str	r2, [r4, #4]
  1076d4:	e1a00005 	mov	r0, r5
  1076d8:	ebffff32 	bl	1073a8 <_swiclose>
  1076dc:	e3a03000 	mov	r3, #0	; 0x0
  1076e0:	e1a00003 	mov	r0, r3
  1076e4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

001076e8 <_lseek>:
  1076e8:	e52de004 	str	lr, [sp, #-4]!
  1076ec:	ebffff4f 	bl	107430 <_swilseek>
  1076f0:	e49de004 	ldr	lr, [sp], #4
  1076f4:	eaffffd8 	b	10765c <wrap>

001076f8 <_swiread>:
  1076f8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1076fc:	e24dd00c 	sub	sp, sp, #12	; 0xc
  107700:	e1a04001 	mov	r4, r1
  107704:	e1a05002 	mov	r5, r2
  107708:	ebfffea5 	bl	1071a4 <remap_handle>
  10770c:	e88d0031 	stmia	sp, {r0, r4, r5}
  107710:	e3a04006 	mov	r4, #6	; 0x6
  107714:	e1a0500d 	mov	r5, sp
  107718:	e1a00004 	mov	r0, r4
  10771c:	e1a0100d 	mov	r1, sp
  107720:	ef123456 	swi	0x00123456
  107724:	e1a04000 	mov	r4, r0
  107728:	e1a00004 	mov	r0, r4
  10772c:	e28dd00c 	add	sp, sp, #12	; 0xc
  107730:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107734 <_read>:
  107734:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  107738:	e1a06002 	mov	r6, r2
  10773c:	e1a05001 	mov	r5, r1
  107740:	e1a04000 	mov	r4, r0
  107744:	ebfffe96 	bl	1071a4 <remap_handle>
  107748:	ebfffe51 	bl	107094 <findslot>
  10774c:	e1a01005 	mov	r1, r5
  107750:	e1a07000 	mov	r7, r0
  107754:	e1a02006 	mov	r2, r6
  107758:	e1a00004 	mov	r0, r4
  10775c:	ebffffe5 	bl	1076f8 <_swiread>
  107760:	e2501000 	subs	r1, r0, #0	; 0x0
  107764:	e3e00000 	mvn	r0, #0	; 0x0
  107768:	ba000008 	blt	107790 <_read+0x5c>
  10776c:	e59f3024 	ldr	r3, [pc, #36]	; 107798 <prog+0x7754>
  107770:	e3570014 	cmp	r7, #20	; 0x14
  107774:	e0832187 	add	r2, r3, r7, lsl #3
  107778:	e0610006 	rsb	r0, r1, r6
  10777c:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
  107780:	e5923004 	ldr	r3, [r2, #4]
  107784:	e0833000 	add	r3, r3, r0
  107788:	e5823004 	str	r3, [r2, #4]
  10778c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  107790:	e8bd40f0 	ldmia	sp!, {r4, r5, r6, r7, lr}
  107794:	eaffff5d 	b	107510 <error>
  107798:	00200bcc 	eoreq	r0, r0, ip, asr #23

0010779c <_calloc_r>:
  10779c:	e92d4010 	stmdb	sp!, {r4, lr}
  1077a0:	e0010192 	mul	r1, r2, r1
  1077a4:	ebffe32c 	bl	10045c <_malloc_r>
  1077a8:	e2504000 	subs	r4, r0, #0	; 0x0
  1077ac:	0a00000f 	beq	1077f0 <_calloc_r+0x54>
  1077b0:	e5143004 	ldr	r3, [r4, #-4]
  1077b4:	e3c33003 	bic	r3, r3, #3	; 0x3
  1077b8:	e2433004 	sub	r3, r3, #4	; 0x4
  1077bc:	e3a0c000 	mov	ip, #0	; 0x0
  1077c0:	e3530024 	cmp	r3, #36	; 0x24
  1077c4:	e1a02003 	mov	r2, r3
  1077c8:	e1a0100c 	mov	r1, ip
  1077cc:	8a000017 	bhi	107830 <_calloc_r+0x94>
  1077d0:	e3530013 	cmp	r3, #19	; 0x13
  1077d4:	e1a01004 	mov	r1, r4
  1077d8:	e1a02004 	mov	r2, r4
  1077dc:	8a000005 	bhi	1077f8 <_calloc_r+0x5c>
  1077e0:	e1a03002 	mov	r3, r2
  1077e4:	e483c004 	str	ip, [r3], #4
  1077e8:	e582c004 	str	ip, [r2, #4]
  1077ec:	e583c004 	str	ip, [r3, #4]
  1077f0:	e1a00004 	mov	r0, r4
  1077f4:	e8bd8010 	ldmia	sp!, {r4, pc}
  1077f8:	e481c004 	str	ip, [r1], #4
  1077fc:	e353001b 	cmp	r3, #27	; 0x1b
  107800:	e2812004 	add	r2, r1, #4	; 0x4
  107804:	e584c004 	str	ip, [r4, #4]
  107808:	e282e004 	add	lr, r2, #4	; 0x4
  10780c:	9afffff3 	bls	1077e0 <_calloc_r+0x44>
  107810:	e3530024 	cmp	r3, #36	; 0x24
  107814:	e581c004 	str	ip, [r1, #4]
  107818:	e582c004 	str	ip, [r2, #4]
  10781c:	e28e2004 	add	r2, lr, #4	; 0x4
  107820:	058ec004 	streq	ip, [lr, #4]
  107824:	0582c004 	streq	ip, [r2, #4]
  107828:	02822008 	addeq	r2, r2, #8	; 0x8
  10782c:	eaffffeb 	b	1077e0 <_calloc_r+0x44>
  107830:	ebffe50d 	bl	100c6c <memset>
  107834:	e1a00004 	mov	r0, r4
  107838:	e8bd8010 	ldmia	sp!, {r4, pc}

0010783c <__errno>:
  10783c:	e59f3004 	ldr	r3, [pc, #4]	; 107848 <prog+0x7804>
  107840:	e5930000 	ldr	r0, [r3]
  107844:	e12fff1e 	bx	lr
  107848:	00200410 	eoreq	r0, r0, r0, lsl r4

0010784c <_fclose_r>:
  10784c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  107850:	e2515000 	subs	r5, r1, #0	; 0x0
  107854:	e1a06000 	mov	r6, r0
  107858:	01a04005 	moveq	r4, r5
  10785c:	0a00002b 	beq	107910 <_fclose_r+0xc4>
  107860:	ebfff552 	bl	104db0 <__sfp_lock_acquire>
  107864:	e3560000 	cmp	r6, #0	; 0x0
  107868:	0a000002 	beq	107878 <_fclose_r+0x2c>
  10786c:	e5963038 	ldr	r3, [r6, #56]
  107870:	e3530000 	cmp	r3, #0	; 0x0
  107874:	0a000027 	beq	107918 <_fclose_r+0xcc>
  107878:	e1d540bc 	ldrh	r4, [r5, #12]
  10787c:	e3540000 	cmp	r4, #0	; 0x0
  107880:	0a000021 	beq	10790c <_fclose_r+0xc0>
  107884:	e2140008 	ands	r0, r4, #8	; 0x8
  107888:	1a000025 	bne	107924 <_fclose_r+0xd8>
  10788c:	e595302c 	ldr	r3, [r5, #44]
  107890:	e3530000 	cmp	r3, #0	; 0x0
  107894:	e1a04000 	mov	r4, r0
  107898:	0a000004 	beq	1078b0 <_fclose_r+0x64>
  10789c:	e595001c 	ldr	r0, [r5, #28]
  1078a0:	e1a0e00f 	mov	lr, pc
  1078a4:	e12fff13 	bx	r3
  1078a8:	e3500000 	cmp	r0, #0	; 0x0
  1078ac:	b3e04000 	mvnlt	r4, #0	; 0x0
  1078b0:	e1d530bc 	ldrh	r3, [r5, #12]
  1078b4:	e3130080 	tst	r3, #128	; 0x80
  1078b8:	1a000020 	bne	107940 <_fclose_r+0xf4>
  1078bc:	e5951030 	ldr	r1, [r5, #48]
  1078c0:	e3510000 	cmp	r1, #0	; 0x0
  1078c4:	0a000006 	beq	1078e4 <_fclose_r+0x98>
  1078c8:	e2853040 	add	r3, r5, #64	; 0x40
  1078cc:	e1510003 	cmp	r1, r3
  1078d0:	159f3084 	ldrne	r3, [pc, #132]	; 10795c <prog+0x7918>
  1078d4:	15930000 	ldrne	r0, [r3]
  1078d8:	1bfff5fb 	blne	1050cc <_free_r>
  1078dc:	e3a03000 	mov	r3, #0	; 0x0
  1078e0:	e5853030 	str	r3, [r5, #48]
  1078e4:	e5951044 	ldr	r1, [r5, #68]
  1078e8:	e3510000 	cmp	r1, #0	; 0x0
  1078ec:	0a000004 	beq	107904 <_fclose_r+0xb8>
  1078f0:	e59f3064 	ldr	r3, [pc, #100]	; 10795c <prog+0x7918>
  1078f4:	e5930000 	ldr	r0, [r3]
  1078f8:	ebfff5f3 	bl	1050cc <_free_r>
  1078fc:	e3a03000 	mov	r3, #0	; 0x0
  107900:	e5853044 	str	r3, [r5, #68]
  107904:	e3a03000 	mov	r3, #0	; 0x0
  107908:	e1c530bc 	strh	r3, [r5, #12]
  10790c:	ebfff528 	bl	104db4 <__sfp_lock_release>
  107910:	e1a00004 	mov	r0, r4
  107914:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  107918:	e1a00006 	mov	r0, r6
  10791c:	ebfff527 	bl	104dc0 <__sinit>
  107920:	eaffffd4 	b	107878 <_fclose_r+0x2c>
  107924:	e1a00005 	mov	r0, r5
  107928:	ebfff4d1 	bl	104c74 <fflush>
  10792c:	e595302c 	ldr	r3, [r5, #44]
  107930:	e3530000 	cmp	r3, #0	; 0x0
  107934:	e1a04000 	mov	r4, r0
  107938:	1affffd7 	bne	10789c <_fclose_r+0x50>
  10793c:	eaffffdb 	b	1078b0 <_fclose_r+0x64>
  107940:	e5951010 	ldr	r1, [r5, #16]
  107944:	e1a00006 	mov	r0, r6
  107948:	ebfff5df 	bl	1050cc <_free_r>
  10794c:	e5951030 	ldr	r1, [r5, #48]
  107950:	e3510000 	cmp	r1, #0	; 0x0
  107954:	1affffdb 	bne	1078c8 <_fclose_r+0x7c>
  107958:	eaffffe1 	b	1078e4 <_fclose_r+0x98>
  10795c:	00200410 	eoreq	r0, r0, r0, lsl r4

00107960 <fclose>:
  107960:	e59f3008 	ldr	r3, [pc, #8]	; 107970 <prog+0x792c>
  107964:	e1a01000 	mov	r1, r0
  107968:	e5930000 	ldr	r0, [r3]
  10796c:	eaffffb6 	b	10784c <_fclose_r>
  107970:	00200410 	eoreq	r0, r0, r0, lsl r4

00107974 <nan>:
  107974:	e59f0000 	ldr	r0, [pc, #0]	; 10797c <prog+0x7938>
  107978:	e12fff1e 	bx	lr
  10797c:	0010c98c 	andeqs	ip, r0, ip, lsl #19

00107980 <isnan>:
  107980:	e5900000 	ldr	r0, [r0]
  107984:	e3500001 	cmp	r0, #1	; 0x1
  107988:	83a00000 	movhi	r0, #0	; 0x0
  10798c:	93a00001 	movls	r0, #1	; 0x1
  107990:	e12fff1e 	bx	lr

00107994 <isinf>:
  107994:	e5900000 	ldr	r0, [r0]
  107998:	e3500004 	cmp	r0, #4	; 0x4
  10799c:	13a00000 	movne	r0, #0	; 0x0
  1079a0:	03a00001 	moveq	r0, #1	; 0x1
  1079a4:	e12fff1e 	bx	lr

001079a8 <iszero>:
  1079a8:	e5900000 	ldr	r0, [r0]
  1079ac:	e3500002 	cmp	r0, #2	; 0x2
  1079b0:	13a00000 	movne	r0, #0	; 0x0
  1079b4:	03a00001 	moveq	r0, #1	; 0x1
  1079b8:	e12fff1e 	bx	lr

001079bc <_fpadd_parts>:
  1079bc:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1079c0:	e24dd004 	sub	sp, sp, #4	; 0x4
  1079c4:	e1a07001 	mov	r7, r1
  1079c8:	e1a06002 	mov	r6, r2
  1079cc:	e1a05000 	mov	r5, r0
  1079d0:	ebffffea 	bl	107980 <isnan>
  1079d4:	e3500000 	cmp	r0, #0	; 0x0
  1079d8:	0a000002 	beq	1079e8 <_fpadd_parts+0x2c>
  1079dc:	e1a00005 	mov	r0, r5
  1079e0:	e28dd004 	add	sp, sp, #4	; 0x4
  1079e4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1079e8:	e1a00007 	mov	r0, r7
  1079ec:	ebffffe3 	bl	107980 <isnan>
  1079f0:	e3500000 	cmp	r0, #0	; 0x0
  1079f4:	0a000001 	beq	107a00 <_fpadd_parts+0x44>
  1079f8:	e1a05007 	mov	r5, r7
  1079fc:	eafffff6 	b	1079dc <_fpadd_parts+0x20>
  107a00:	e1a00005 	mov	r0, r5
  107a04:	ebffffe2 	bl	107994 <isinf>
  107a08:	e3500000 	cmp	r0, #0	; 0x0
  107a0c:	1a000068 	bne	107bb4 <_fpadd_parts+0x1f8>
  107a10:	e1a00007 	mov	r0, r7
  107a14:	ebffffde 	bl	107994 <isinf>
  107a18:	e3500000 	cmp	r0, #0	; 0x0
  107a1c:	1afffff5 	bne	1079f8 <_fpadd_parts+0x3c>
  107a20:	e1a00007 	mov	r0, r7
  107a24:	ebffffdf 	bl	1079a8 <iszero>
  107a28:	e3500000 	cmp	r0, #0	; 0x0
  107a2c:	1a00006b 	bne	107be0 <_fpadd_parts+0x224>
  107a30:	e1a00005 	mov	r0, r5
  107a34:	ebffffdb 	bl	1079a8 <iszero>
  107a38:	e3500000 	cmp	r0, #0	; 0x0
  107a3c:	1affffed 	bne	1079f8 <_fpadd_parts+0x3c>
  107a40:	e5953008 	ldr	r3, [r5, #8]
  107a44:	e597c008 	ldr	ip, [r7, #8]
  107a48:	e06ce003 	rsb	lr, ip, r3
  107a4c:	e58d3000 	str	r3, [sp]
  107a50:	e02e3fce 	eor	r3, lr, lr, asr #31
  107a54:	e0433fce 	sub	r3, r3, lr, asr #31
  107a58:	e353003f 	cmp	r3, #63	; 0x3f
  107a5c:	e285a00c 	add	sl, r5, #12	; 0xc
  107a60:	e89a0c00 	ldmia	sl, {sl, fp}
  107a64:	e287800c 	add	r8, r7, #12	; 0xc
  107a68:	e8980300 	ldmia	r8, {r8, r9}
  107a6c:	ca000081 	bgt	107c78 <_fpadd_parts+0x2bc>
  107a70:	e59d4000 	ldr	r4, [sp]
  107a74:	e154000c 	cmp	r4, ip
  107a78:	da00000b 	ble	107aac <_fpadd_parts+0xf0>
  107a7c:	e2800001 	add	r0, r0, #1	; 0x1
  107a80:	e3a03001 	mov	r3, #1	; 0x1
  107a84:	e3a04000 	mov	r4, #0	; 0x0
  107a88:	e1b020a9 	movs	r2, r9, lsr #1
  107a8c:	e1a01068 	mov	r1, r8, rrx
  107a90:	e0088003 	and	r8, r8, r3
  107a94:	e0099004 	and	r9, r9, r4
  107a98:	e150000e 	cmp	r0, lr
  107a9c:	e1888001 	orr	r8, r8, r1
  107aa0:	e1899002 	orr	r9, r9, r2
  107aa4:	1afffff4 	bne	107a7c <_fpadd_parts+0xc0>
  107aa8:	e08cc000 	add	ip, ip, r0
  107aac:	e59d4000 	ldr	r4, [sp]
  107ab0:	e154000c 	cmp	r4, ip
  107ab4:	aa00000f 	bge	107af8 <_fpadd_parts+0x13c>
  107ab8:	e064c00c 	rsb	ip, r4, ip
  107abc:	e3a00000 	mov	r0, #0	; 0x0
  107ac0:	e2800001 	add	r0, r0, #1	; 0x1
  107ac4:	e3a03001 	mov	r3, #1	; 0x1
  107ac8:	e3a04000 	mov	r4, #0	; 0x0
  107acc:	e1b020ab 	movs	r2, fp, lsr #1
  107ad0:	e1a0106a 	mov	r1, sl, rrx
  107ad4:	e00aa003 	and	sl, sl, r3
  107ad8:	e00bb004 	and	fp, fp, r4
  107adc:	e15c0000 	cmp	ip, r0
  107ae0:	e18aa001 	orr	sl, sl, r1
  107ae4:	e18bb002 	orr	fp, fp, r2
  107ae8:	1afffff4 	bne	107ac0 <_fpadd_parts+0x104>
  107aec:	e59d4000 	ldr	r4, [sp]
  107af0:	e0844000 	add	r4, r4, r0
  107af4:	e58d4000 	str	r4, [sp]
  107af8:	e5950004 	ldr	r0, [r5, #4]
  107afc:	e5973004 	ldr	r3, [r7, #4]
  107b00:	e1500003 	cmp	r0, r3
  107b04:	0a000068 	beq	107cac <_fpadd_parts+0x2f0>
  107b08:	e3500000 	cmp	r0, #0	; 0x0
  107b0c:	0a000061 	beq	107c98 <_fpadd_parts+0x2dc>
  107b10:	e1a01008 	mov	r1, r8
  107b14:	e1a02009 	mov	r2, r9
  107b18:	e051100a 	subs	r1, r1, sl
  107b1c:	e0c2200b 	sbc	r2, r2, fp
  107b20:	e3520000 	cmp	r2, #0	; 0x0
  107b24:	ba000067 	blt	107cc8 <_fpadd_parts+0x30c>
  107b28:	e586100c 	str	r1, [r6, #12]
  107b2c:	e5862010 	str	r2, [r6, #16]
  107b30:	e59d4000 	ldr	r4, [sp]
  107b34:	e3a03000 	mov	r3, #0	; 0x0
  107b38:	e9860018 	stmib	r6, {r3, r4}
  107b3c:	e286100c 	add	r1, r6, #12	; 0xc
  107b40:	e8910006 	ldmia	r1, {r1, r2}
  107b44:	e3e07000 	mvn	r7, #0	; 0x0
  107b48:	e0977001 	adds	r7, r7, r1
  107b4c:	e3e08000 	mvn	r8, #0	; 0x0
  107b50:	e0a88002 	adc	r8, r8, r2
  107b54:	e378021f 	cmn	r8, #-268435455	; 0xf0000001
  107b58:	e1a0a001 	mov	sl, r1
  107b5c:	e1a0b002 	mov	fp, r2
  107b60:	8a000030 	bhi	107c28 <_fpadd_parts+0x26c>
  107b64:	0a00002d 	beq	107c20 <_fpadd_parts+0x264>
  107b68:	e5963008 	ldr	r3, [r6, #8]
  107b6c:	e09a100a 	adds	r1, sl, sl
  107b70:	e3e07000 	mvn	r7, #0	; 0x0
  107b74:	e0ab200b 	adc	r2, fp, fp
  107b78:	e3e08000 	mvn	r8, #0	; 0x0
  107b7c:	e0977001 	adds	r7, r7, r1
  107b80:	e0a88002 	adc	r8, r8, r2
  107b84:	e2433001 	sub	r3, r3, #1	; 0x1
  107b88:	e378021f 	cmn	r8, #-268435455	; 0xf0000001
  107b8c:	e586100c 	str	r1, [r6, #12]
  107b90:	e5862010 	str	r2, [r6, #16]
  107b94:	e5863008 	str	r3, [r6, #8]
  107b98:	e1a0a001 	mov	sl, r1
  107b9c:	e1a0b002 	mov	fp, r2
  107ba0:	8a000020 	bhi	107c28 <_fpadd_parts+0x26c>
  107ba4:	1afffff0 	bne	107b6c <_fpadd_parts+0x1b0>
  107ba8:	e3770002 	cmn	r7, #2	; 0x2
  107bac:	8a00001d 	bhi	107c28 <_fpadd_parts+0x26c>
  107bb0:	eaffffed 	b	107b6c <_fpadd_parts+0x1b0>
  107bb4:	e1a00007 	mov	r0, r7
  107bb8:	ebffff75 	bl	107994 <isinf>
  107bbc:	e3500000 	cmp	r0, #0	; 0x0
  107bc0:	0affff85 	beq	1079dc <_fpadd_parts+0x20>
  107bc4:	e5972004 	ldr	r2, [r7, #4]
  107bc8:	e5953004 	ldr	r3, [r5, #4]
  107bcc:	e1530002 	cmp	r3, r2
  107bd0:	0affff81 	beq	1079dc <_fpadd_parts+0x20>
  107bd4:	e28dd004 	add	sp, sp, #4	; 0x4
  107bd8:	e8bd4ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  107bdc:	eaffff64 	b	107974 <nan>
  107be0:	e1a00005 	mov	r0, r5
  107be4:	ebffff6f 	bl	1079a8 <iszero>
  107be8:	e3500000 	cmp	r0, #0	; 0x0
  107bec:	0affff7a 	beq	1079dc <_fpadd_parts+0x20>
  107bf0:	e1a0c005 	mov	ip, r5
  107bf4:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  107bf8:	e1a0e006 	mov	lr, r6
  107bfc:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
  107c00:	e5953010 	ldr	r3, [r5, #16]
  107c04:	e5863010 	str	r3, [r6, #16]
  107c08:	e5952004 	ldr	r2, [r5, #4]
  107c0c:	e5973004 	ldr	r3, [r7, #4]
  107c10:	e1a05006 	mov	r5, r6
  107c14:	e0022003 	and	r2, r2, r3
  107c18:	e5862004 	str	r2, [r6, #4]
  107c1c:	eaffff6e 	b	1079dc <_fpadd_parts+0x20>
  107c20:	e3770002 	cmn	r7, #2	; 0x2
  107c24:	9affffcf 	bls	107b68 <_fpadd_parts+0x1ac>
  107c28:	e372021e 	cmn	r2, #-536870911	; 0xe0000001
  107c2c:	e3a03003 	mov	r3, #3	; 0x3
  107c30:	e5863000 	str	r3, [r6]
  107c34:	91a05006 	movls	r5, r6
  107c38:	9affff67 	bls	1079dc <_fpadd_parts+0x20>
  107c3c:	e5960008 	ldr	r0, [r6, #8]
  107c40:	e3a03001 	mov	r3, #1	; 0x1
  107c44:	e3a04000 	mov	r4, #0	; 0x0
  107c48:	e1b080a2 	movs	r8, r2, lsr #1
  107c4c:	e1a07061 	mov	r7, r1, rrx
  107c50:	e0011003 	and	r1, r1, r3
  107c54:	e0022004 	and	r2, r2, r4
  107c58:	e1877001 	orr	r7, r7, r1
  107c5c:	e1888002 	orr	r8, r8, r2
  107c60:	e2800001 	add	r0, r0, #1	; 0x1
  107c64:	e1a05006 	mov	r5, r6
  107c68:	e586700c 	str	r7, [r6, #12]
  107c6c:	e5868010 	str	r8, [r6, #16]
  107c70:	e5860008 	str	r0, [r6, #8]
  107c74:	eaffff58 	b	1079dc <_fpadd_parts+0x20>
  107c78:	e59d3000 	ldr	r3, [sp]
  107c7c:	e153000c 	cmp	r3, ip
  107c80:	d3a0a000 	movle	sl, #0	; 0x0
  107c84:	d3a0b000 	movle	fp, #0	; 0x0
  107c88:	c3a08000 	movgt	r8, #0	; 0x0
  107c8c:	c3a09000 	movgt	r9, #0	; 0x0
  107c90:	d58dc000 	strle	ip, [sp]
  107c94:	eaffff97 	b	107af8 <_fpadd_parts+0x13c>
  107c98:	e1a0100a 	mov	r1, sl
  107c9c:	e1a0200b 	mov	r2, fp
  107ca0:	e0511008 	subs	r1, r1, r8
  107ca4:	e0c22009 	sbc	r2, r2, r9
  107ca8:	eaffff9c 	b	107b20 <_fpadd_parts+0x164>
  107cac:	e09a1008 	adds	r1, sl, r8
  107cb0:	e0ab2009 	adc	r2, fp, r9
  107cb4:	e586100c 	str	r1, [r6, #12]
  107cb8:	e5862010 	str	r2, [r6, #16]
  107cbc:	e59d4000 	ldr	r4, [sp]
  107cc0:	e9860011 	stmib	r6, {r0, r4}
  107cc4:	eaffffd7 	b	107c28 <_fpadd_parts+0x26c>
  107cc8:	e3a03001 	mov	r3, #1	; 0x1
  107ccc:	e5863004 	str	r3, [r6, #4]
  107cd0:	e59d3000 	ldr	r3, [sp]
  107cd4:	e2711000 	rsbs	r1, r1, #0	; 0x0
  107cd8:	e2e22000 	rsc	r2, r2, #0	; 0x0
  107cdc:	e5863008 	str	r3, [r6, #8]
  107ce0:	e586100c 	str	r1, [r6, #12]
  107ce4:	e5862010 	str	r2, [r6, #16]
  107ce8:	eaffff93 	b	107b3c <_fpadd_parts+0x180>

00107cec <__subdf3>:
  107cec:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  107cf0:	e24dd04c 	sub	sp, sp, #76	; 0x4c
  107cf4:	e28d5028 	add	r5, sp, #40	; 0x28
  107cf8:	e58d0044 	str	r0, [sp, #68]
  107cfc:	e58d1048 	str	r1, [sp, #72]
  107d00:	e28d4014 	add	r4, sp, #20	; 0x14
  107d04:	e28d0044 	add	r0, sp, #68	; 0x44
  107d08:	e1a01005 	mov	r1, r5
  107d0c:	e58d203c 	str	r2, [sp, #60]
  107d10:	e58d3040 	str	r3, [sp, #64]
  107d14:	eb00037e 	bl	108b14 <__unpack_d>
  107d18:	e28d003c 	add	r0, sp, #60	; 0x3c
  107d1c:	e1a01004 	mov	r1, r4
  107d20:	eb00037b 	bl	108b14 <__unpack_d>
  107d24:	e59d3018 	ldr	r3, [sp, #24]
  107d28:	e1a01004 	mov	r1, r4
  107d2c:	e2233001 	eor	r3, r3, #1	; 0x1
  107d30:	e1a0200d 	mov	r2, sp
  107d34:	e1a00005 	mov	r0, r5
  107d38:	e58d3018 	str	r3, [sp, #24]
  107d3c:	ebffff1e 	bl	1079bc <_fpadd_parts>
  107d40:	eb0002b6 	bl	108820 <__pack_d>
  107d44:	e28dd04c 	add	sp, sp, #76	; 0x4c
  107d48:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107d4c <__adddf3>:
  107d4c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  107d50:	e24dd04c 	sub	sp, sp, #76	; 0x4c
  107d54:	e28d5028 	add	r5, sp, #40	; 0x28
  107d58:	e58d0044 	str	r0, [sp, #68]
  107d5c:	e58d1048 	str	r1, [sp, #72]
  107d60:	e28d4014 	add	r4, sp, #20	; 0x14
  107d64:	e28d0044 	add	r0, sp, #68	; 0x44
  107d68:	e1a01005 	mov	r1, r5
  107d6c:	e58d203c 	str	r2, [sp, #60]
  107d70:	e58d3040 	str	r3, [sp, #64]
  107d74:	eb000366 	bl	108b14 <__unpack_d>
  107d78:	e28d003c 	add	r0, sp, #60	; 0x3c
  107d7c:	e1a01004 	mov	r1, r4
  107d80:	eb000363 	bl	108b14 <__unpack_d>
  107d84:	e1a01004 	mov	r1, r4
  107d88:	e1a0200d 	mov	r2, sp
  107d8c:	e1a00005 	mov	r0, r5
  107d90:	ebffff09 	bl	1079bc <_fpadd_parts>
  107d94:	eb0002a1 	bl	108820 <__pack_d>
  107d98:	e28dd04c 	add	sp, sp, #76	; 0x4c
  107d9c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107da0 <nan>:
  107da0:	e59f0000 	ldr	r0, [pc, #0]	; 107da8 <prog+0x7d64>
  107da4:	e12fff1e 	bx	lr
  107da8:	0010c98c 	andeqs	ip, r0, ip, lsl #19

00107dac <isnan>:
  107dac:	e5900000 	ldr	r0, [r0]
  107db0:	e3500001 	cmp	r0, #1	; 0x1
  107db4:	83a00000 	movhi	r0, #0	; 0x0
  107db8:	93a00001 	movls	r0, #1	; 0x1
  107dbc:	e12fff1e 	bx	lr

00107dc0 <isinf>:
  107dc0:	e5900000 	ldr	r0, [r0]
  107dc4:	e3500004 	cmp	r0, #4	; 0x4
  107dc8:	13a00000 	movne	r0, #0	; 0x0
  107dcc:	03a00001 	moveq	r0, #1	; 0x1
  107dd0:	e12fff1e 	bx	lr

00107dd4 <iszero>:
  107dd4:	e5900000 	ldr	r0, [r0]
  107dd8:	e3500002 	cmp	r0, #2	; 0x2
  107ddc:	13a00000 	movne	r0, #0	; 0x0
  107de0:	03a00001 	moveq	r0, #1	; 0x1
  107de4:	e12fff1e 	bx	lr

00107de8 <__muldf3>:
  107de8:	e92d4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
  107dec:	e24dd064 	sub	sp, sp, #100	; 0x64
  107df0:	e28d5040 	add	r5, sp, #64	; 0x40
  107df4:	e58d005c 	str	r0, [sp, #92]
  107df8:	e58d1060 	str	r1, [sp, #96]
  107dfc:	e28d702c 	add	r7, sp, #44	; 0x2c
  107e00:	e28d005c 	add	r0, sp, #92	; 0x5c
  107e04:	e1a01005 	mov	r1, r5
  107e08:	e58d2054 	str	r2, [sp, #84]
  107e0c:	e58d3058 	str	r3, [sp, #88]
  107e10:	eb00033f 	bl	108b14 <__unpack_d>
  107e14:	e1a01007 	mov	r1, r7
  107e18:	e28d0054 	add	r0, sp, #84	; 0x54
  107e1c:	eb00033c 	bl	108b14 <__unpack_d>
  107e20:	e1a00005 	mov	r0, r5
  107e24:	ebffffe0 	bl	107dac <isnan>
  107e28:	e3500000 	cmp	r0, #0	; 0x0
  107e2c:	0a000008 	beq	107e54 <__muldf3+0x6c>
  107e30:	e59d3044 	ldr	r3, [sp, #68]
  107e34:	e59d2030 	ldr	r2, [sp, #48]
  107e38:	e0533002 	subs	r3, r3, r2
  107e3c:	13a03001 	movne	r3, #1	; 0x1
  107e40:	e58d3044 	str	r3, [sp, #68]
  107e44:	e1a00005 	mov	r0, r5
  107e48:	eb000274 	bl	108820 <__pack_d>
  107e4c:	e28dd064 	add	sp, sp, #100	; 0x64
  107e50:	e8bd8df0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
  107e54:	e1a00007 	mov	r0, r7
  107e58:	ebffffd3 	bl	107dac <isnan>
  107e5c:	e3500000 	cmp	r0, #0	; 0x0
  107e60:	0a000006 	beq	107e80 <__muldf3+0x98>
  107e64:	e59d2030 	ldr	r2, [sp, #48]
  107e68:	e59d3044 	ldr	r3, [sp, #68]
  107e6c:	e1a00007 	mov	r0, r7
  107e70:	e0533002 	subs	r3, r3, r2
  107e74:	13a03001 	movne	r3, #1	; 0x1
  107e78:	e58d3030 	str	r3, [sp, #48]
  107e7c:	eafffff1 	b	107e48 <__muldf3+0x60>
  107e80:	e1a00005 	mov	r0, r5
  107e84:	ebffffcd 	bl	107dc0 <isinf>
  107e88:	e3500000 	cmp	r0, #0	; 0x0
  107e8c:	1a000009 	bne	107eb8 <__muldf3+0xd0>
  107e90:	e1a00007 	mov	r0, r7
  107e94:	ebffffc9 	bl	107dc0 <isinf>
  107e98:	e3500000 	cmp	r0, #0	; 0x0
  107e9c:	0a00000b 	beq	107ed0 <__muldf3+0xe8>
  107ea0:	e1a00005 	mov	r0, r5
  107ea4:	ebffffca 	bl	107dd4 <iszero>
  107ea8:	e3500000 	cmp	r0, #0	; 0x0
  107eac:	0affffec 	beq	107e64 <__muldf3+0x7c>
  107eb0:	ebffffba 	bl	107da0 <nan>
  107eb4:	eaffffe3 	b	107e48 <__muldf3+0x60>
  107eb8:	e1a00007 	mov	r0, r7
  107ebc:	ebffffc4 	bl	107dd4 <iszero>
  107ec0:	e3500000 	cmp	r0, #0	; 0x0
  107ec4:	0affffd9 	beq	107e30 <__muldf3+0x48>
  107ec8:	ebffffb4 	bl	107da0 <nan>
  107ecc:	eaffffdd 	b	107e48 <__muldf3+0x60>
  107ed0:	e1a00005 	mov	r0, r5
  107ed4:	ebffffbe 	bl	107dd4 <iszero>
  107ed8:	e3500000 	cmp	r0, #0	; 0x0
  107edc:	1affffd3 	bne	107e30 <__muldf3+0x48>
  107ee0:	e1a00007 	mov	r0, r7
  107ee4:	ebffffba 	bl	107dd4 <iszero>
  107ee8:	e3500000 	cmp	r0, #0	; 0x0
  107eec:	1affffdc 	bne	107e64 <__muldf3+0x7c>
  107ef0:	e28d5038 	add	r5, sp, #56	; 0x38
  107ef4:	e8950060 	ldmia	r5, {r5, r6}
  107ef8:	e1a03006 	mov	r3, r6
  107efc:	e3a04000 	mov	r4, #0	; 0x0
  107f00:	e28d704c 	add	r7, sp, #76	; 0x4c
  107f04:	e8970180 	ldmia	r7, {r7, r8}
  107f08:	e58d3010 	str	r3, [sp, #16]
  107f0c:	e58d4014 	str	r4, [sp, #20]
  107f10:	e59d0010 	ldr	r0, [sp, #16]
  107f14:	e1a01008 	mov	r1, r8
  107f18:	e3a08000 	mov	r8, #0	; 0x0
  107f1c:	e0843097 	umull	r3, r4, r7, r0
  107f20:	e3a06000 	mov	r6, #0	; 0x0
  107f24:	e1a0a001 	mov	sl, r1
  107f28:	e3a0b000 	mov	fp, #0	; 0x0
  107f2c:	e1a02004 	mov	r2, r4
  107f30:	e1a01003 	mov	r1, r3
  107f34:	e0a2159a 	umlal	r1, r2, sl, r5
  107f38:	e88d0006 	stmia	sp, {r1, r2}
  107f3c:	e0810795 	umull	r0, r1, r5, r7
  107f40:	e1540002 	cmp	r4, r2
  107f44:	e1a05000 	mov	r5, r0
  107f48:	e1a06001 	mov	r6, r1
  107f4c:	8a00005f 	bhi	1080d0 <__muldf3+0x2e8>
  107f50:	0a00005b 	beq	1080c4 <__muldf3+0x2dc>
  107f54:	e3a02000 	mov	r2, #0	; 0x0
  107f58:	e3a03000 	mov	r3, #0	; 0x0
  107f5c:	e58d2008 	str	r2, [sp, #8]
  107f60:	e58d300c 	str	r3, [sp, #12]
  107f64:	e59d4000 	ldr	r4, [sp]
  107f68:	e3a03000 	mov	r3, #0	; 0x0
  107f6c:	e0937005 	adds	r7, r3, r5
  107f70:	e1a01004 	mov	r1, r4
  107f74:	e3a02000 	mov	r2, #0	; 0x0
  107f78:	e0a18006 	adc	r8, r1, r6
  107f7c:	e1560008 	cmp	r6, r8
  107f80:	8a000046 	bhi	1080a0 <__muldf3+0x2b8>
  107f84:	0a000043 	beq	108098 <__muldf3+0x2b0>
  107f88:	e59d0010 	ldr	r0, [sp, #16]
  107f8c:	e000009b 	mul	r0, fp, r0
  107f90:	e59dc010 	ldr	ip, [sp, #16]
  107f94:	e0821a9c 	umull	r1, r2, ip, sl
  107f98:	e59dc014 	ldr	ip, [sp, #20]
  107f9c:	e02c0c9a 	mla	ip, sl, ip, r0
  107fa0:	e59d0004 	ldr	r0, [sp, #4]
  107fa4:	e08c2002 	add	r2, ip, r2
  107fa8:	e0905001 	adds	r5, r0, r1
  107fac:	e3a04000 	mov	r4, #0	; 0x0
  107fb0:	e0a46002 	adc	r6, r4, r2
  107fb4:	e28d1008 	add	r1, sp, #8	; 0x8
  107fb8:	e8910006 	ldmia	r1, {r1, r2}
  107fbc:	e0955001 	adds	r5, r5, r1
  107fc0:	e59d1048 	ldr	r1, [sp, #72]
  107fc4:	e0a66002 	adc	r6, r6, r2
  107fc8:	e59d0044 	ldr	r0, [sp, #68]
  107fcc:	e59d3030 	ldr	r3, [sp, #48]
  107fd0:	e59d2034 	ldr	r2, [sp, #52]
  107fd4:	e2811004 	add	r1, r1, #4	; 0x4
  107fd8:	e0500003 	subs	r0, r0, r3
  107fdc:	13a00001 	movne	r0, #1	; 0x1
  107fe0:	e0822001 	add	r2, r2, r1
  107fe4:	e376021e 	cmn	r6, #-536870911	; 0xe0000001
  107fe8:	e58d001c 	str	r0, [sp, #28]
  107fec:	e58d2020 	str	r2, [sp, #32]
  107ff0:	9a00000e 	bls	108030 <__muldf3+0x248>
  107ff4:	e3a00001 	mov	r0, #1	; 0x1
  107ff8:	e3a0a000 	mov	sl, #0	; 0x0
  107ffc:	e3a0b102 	mov	fp, #-2147483648	; 0x80000000
  108000:	e1150000 	tst	r5, r0
  108004:	e2822001 	add	r2, r2, #1	; 0x1
  108008:	0a000003 	beq	10801c <__muldf3+0x234>
  10800c:	e1b040a8 	movs	r4, r8, lsr #1
  108010:	e1a03067 	mov	r3, r7, rrx
  108014:	e183700a 	orr	r7, r3, sl
  108018:	e184800b 	orr	r8, r4, fp
  10801c:	e1b060a6 	movs	r6, r6, lsr #1
  108020:	e1a05065 	mov	r5, r5, rrx
  108024:	e376021e 	cmn	r6, #-536870911	; 0xe0000001
  108028:	8afffff4 	bhi	108000 <__muldf3+0x218>
  10802c:	e58d2020 	str	r2, [sp, #32]
  108030:	e376021f 	cmn	r6, #-268435455	; 0xf0000001
  108034:	8a00000d 	bhi	108070 <__muldf3+0x288>
  108038:	e59d3020 	ldr	r3, [sp, #32]
  10803c:	e3a01001 	mov	r1, #1	; 0x1
  108040:	e3a02000 	mov	r2, #0	; 0x0
  108044:	e0955005 	adds	r5, r5, r5
  108048:	e0a66006 	adc	r6, r6, r6
  10804c:	e3580000 	cmp	r8, #0	; 0x0
  108050:	b1866002 	orrlt	r6, r6, r2
  108054:	b1855001 	orrlt	r5, r5, r1
  108058:	e0977007 	adds	r7, r7, r7
  10805c:	e0a88008 	adc	r8, r8, r8
  108060:	e376021f 	cmn	r6, #-268435455	; 0xf0000001
  108064:	e2433001 	sub	r3, r3, #1	; 0x1
  108068:	9afffff5 	bls	108044 <__muldf3+0x25c>
  10806c:	e58d3020 	str	r3, [sp, #32]
  108070:	e20530ff 	and	r3, r5, #255	; 0xff
  108074:	e3a04000 	mov	r4, #0	; 0x0
  108078:	e3530080 	cmp	r3, #128	; 0x80
  10807c:	0a000018 	beq	1080e4 <__muldf3+0x2fc>
  108080:	e3a03003 	mov	r3, #3	; 0x3
  108084:	e28d0018 	add	r0, sp, #24	; 0x18
  108088:	e58d5024 	str	r5, [sp, #36]
  10808c:	e58d6028 	str	r6, [sp, #40]
  108090:	e58d3018 	str	r3, [sp, #24]
  108094:	eaffff6b 	b	107e48 <__muldf3+0x60>
  108098:	e1550007 	cmp	r5, r7
  10809c:	9affffb9 	bls	107f88 <__muldf3+0x1a0>
  1080a0:	e28d0008 	add	r0, sp, #8	; 0x8
  1080a4:	e8900003 	ldmia	r0, {r0, r1}
  1080a8:	e3a03001 	mov	r3, #1	; 0x1
  1080ac:	e0900003 	adds	r0, r0, r3
  1080b0:	e3a04000 	mov	r4, #0	; 0x0
  1080b4:	e0a11004 	adc	r1, r1, r4
  1080b8:	e58d0008 	str	r0, [sp, #8]
  1080bc:	e58d100c 	str	r1, [sp, #12]
  1080c0:	eaffffb0 	b	107f88 <__muldf3+0x1a0>
  1080c4:	e59d1000 	ldr	r1, [sp]
  1080c8:	e1530001 	cmp	r3, r1
  1080cc:	9affffa0 	bls	107f54 <__muldf3+0x16c>
  1080d0:	e3a03000 	mov	r3, #0	; 0x0
  1080d4:	e3a04001 	mov	r4, #1	; 0x1
  1080d8:	e58d3008 	str	r3, [sp, #8]
  1080dc:	e58d400c 	str	r4, [sp, #12]
  1080e0:	eaffff9f 	b	107f64 <__muldf3+0x17c>
  1080e4:	e3540000 	cmp	r4, #0	; 0x0
  1080e8:	1affffe4 	bne	108080 <__muldf3+0x298>
  1080ec:	e3a01c01 	mov	r1, #256	; 0x100
  1080f0:	e3a02000 	mov	r2, #0	; 0x0
  1080f4:	e0053001 	and	r3, r5, r1
  1080f8:	e0064002 	and	r4, r6, r2
  1080fc:	e1933004 	orrs	r3, r3, r4
  108100:	1affffde 	bne	108080 <__muldf3+0x298>
  108104:	e1977008 	orrs	r7, r7, r8
  108108:	0affffdc 	beq	108080 <__muldf3+0x298>
  10810c:	e3a03080 	mov	r3, #128	; 0x80
  108110:	e0933005 	adds	r3, r3, r5
  108114:	e3a04000 	mov	r4, #0	; 0x0
  108118:	e0a44006 	adc	r4, r4, r6
  10811c:	e3e010ff 	mvn	r1, #255	; 0xff
  108120:	e3e02000 	mvn	r2, #0	; 0x0
  108124:	e0035001 	and	r5, r3, r1
  108128:	e0046002 	and	r6, r4, r2
  10812c:	eaffffd3 	b	108080 <__muldf3+0x298>

00108130 <nan>:
  108130:	e59f0000 	ldr	r0, [pc, #0]	; 108138 <prog+0x80f4>
  108134:	e12fff1e 	bx	lr
  108138:	0010c98c 	andeqs	ip, r0, ip, lsl #19

0010813c <isnan>:
  10813c:	e5900000 	ldr	r0, [r0]
  108140:	e3500001 	cmp	r0, #1	; 0x1
  108144:	83a00000 	movhi	r0, #0	; 0x0
  108148:	93a00001 	movls	r0, #1	; 0x1
  10814c:	e12fff1e 	bx	lr

00108150 <isinf>:
  108150:	e5900000 	ldr	r0, [r0]
  108154:	e3500004 	cmp	r0, #4	; 0x4
  108158:	13a00000 	movne	r0, #0	; 0x0
  10815c:	03a00001 	moveq	r0, #1	; 0x1
  108160:	e12fff1e 	bx	lr

00108164 <iszero>:
  108164:	e5900000 	ldr	r0, [r0]
  108168:	e3500002 	cmp	r0, #2	; 0x2
  10816c:	13a00000 	movne	r0, #0	; 0x0
  108170:	03a00001 	moveq	r0, #1	; 0x1
  108174:	e12fff1e 	bx	lr

00108178 <__divdf3>:
  108178:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10817c:	e24dd038 	sub	sp, sp, #56	; 0x38
  108180:	e28d7014 	add	r7, sp, #20	; 0x14
  108184:	e58d0030 	str	r0, [sp, #48]
  108188:	e58d1034 	str	r1, [sp, #52]
  10818c:	e28d0030 	add	r0, sp, #48	; 0x30
  108190:	e1a01007 	mov	r1, r7
  108194:	e58d2028 	str	r2, [sp, #40]
  108198:	e58d302c 	str	r3, [sp, #44]
  10819c:	eb00025c 	bl	108b14 <__unpack_d>
  1081a0:	e1a0100d 	mov	r1, sp
  1081a4:	e28d0028 	add	r0, sp, #40	; 0x28
  1081a8:	eb000259 	bl	108b14 <__unpack_d>
  1081ac:	e1a00007 	mov	r0, r7
  1081b0:	ebffffe1 	bl	10813c <isnan>
  1081b4:	e3500000 	cmp	r0, #0	; 0x0
  1081b8:	e1a0500d 	mov	r5, sp
  1081bc:	0a000003 	beq	1081d0 <__divdf3+0x58>
  1081c0:	e1a00007 	mov	r0, r7
  1081c4:	eb000195 	bl	108820 <__pack_d>
  1081c8:	e28dd038 	add	sp, sp, #56	; 0x38
  1081cc:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1081d0:	e1a0000d 	mov	r0, sp
  1081d4:	ebffffd8 	bl	10813c <isnan>
  1081d8:	e3500000 	cmp	r0, #0	; 0x0
  1081dc:	11a0000d 	movne	r0, sp
  1081e0:	1afffff7 	bne	1081c4 <__divdf3+0x4c>
  1081e4:	e59d3018 	ldr	r3, [sp, #24]
  1081e8:	e59d2004 	ldr	r2, [sp, #4]
  1081ec:	e0233002 	eor	r3, r3, r2
  1081f0:	e58d3018 	str	r3, [sp, #24]
  1081f4:	e1a00007 	mov	r0, r7
  1081f8:	ebffffd4 	bl	108150 <isinf>
  1081fc:	e3500000 	cmp	r0, #0	; 0x0
  108200:	0a000005 	beq	10821c <__divdf3+0xa4>
  108204:	e59d2014 	ldr	r2, [sp, #20]
  108208:	e59d3000 	ldr	r3, [sp]
  10820c:	e1520003 	cmp	r2, r3
  108210:	1affffea 	bne	1081c0 <__divdf3+0x48>
  108214:	ebffffc5 	bl	108130 <nan>
  108218:	eaffffe9 	b	1081c4 <__divdf3+0x4c>
  10821c:	e1a00007 	mov	r0, r7
  108220:	ebffffcf 	bl	108164 <iszero>
  108224:	e2506000 	subs	r6, r0, #0	; 0x0
  108228:	1afffff5 	bne	108204 <__divdf3+0x8c>
  10822c:	e1a0000d 	mov	r0, sp
  108230:	ebffffc6 	bl	108150 <isinf>
  108234:	e3500000 	cmp	r0, #0	; 0x0
  108238:	0a000006 	beq	108258 <__divdf3+0xe0>
  10823c:	e3a03000 	mov	r3, #0	; 0x0
  108240:	e3a04000 	mov	r4, #0	; 0x0
  108244:	e1a00007 	mov	r0, r7
  108248:	e58d601c 	str	r6, [sp, #28]
  10824c:	e58d3020 	str	r3, [sp, #32]
  108250:	e58d4024 	str	r4, [sp, #36]
  108254:	eaffffda 	b	1081c4 <__divdf3+0x4c>
  108258:	e1a0000d 	mov	r0, sp
  10825c:	ebffffc0 	bl	108164 <iszero>
  108260:	e3500000 	cmp	r0, #0	; 0x0
  108264:	13a03004 	movne	r3, #4	; 0x4
  108268:	11a00007 	movne	r0, r7
  10826c:	158d3014 	strne	r3, [sp, #20]
  108270:	1affffd3 	bne	1081c4 <__divdf3+0x4c>
  108274:	e59d201c 	ldr	r2, [sp, #28]
  108278:	e28d0020 	add	r0, sp, #32	; 0x20
  10827c:	e8900003 	ldmia	r0, {r0, r1}
  108280:	e28d800c 	add	r8, sp, #12	; 0xc
  108284:	e8980300 	ldmia	r8, {r8, r9}
  108288:	e59d3008 	ldr	r3, [sp, #8]
  10828c:	e1590001 	cmp	r9, r1
  108290:	e0632002 	rsb	r2, r3, r2
  108294:	e58d201c 	str	r2, [sp, #28]
  108298:	8a000022 	bhi	108328 <__divdf3+0x1b0>
  10829c:	0a00001f 	beq	108320 <__divdf3+0x1a8>
  1082a0:	e3a02000 	mov	r2, #0	; 0x0
  1082a4:	e3a03201 	mov	r3, #268435456	; 0x10000000
  1082a8:	e3a0a000 	mov	sl, #0	; 0x0
  1082ac:	e3a0b000 	mov	fp, #0	; 0x0
  1082b0:	e3a0c000 	mov	ip, #0	; 0x0
  1082b4:	ea00000b 	b	1082e8 <__divdf3+0x170>
  1082b8:	e0500008 	subs	r0, r0, r8
  1082bc:	e0c11009 	sbc	r1, r1, r9
  1082c0:	e18aa002 	orr	sl, sl, r2
  1082c4:	e18bb003 	orr	fp, fp, r3
  1082c8:	e0905000 	adds	r5, r0, r0
  1082cc:	e0a16001 	adc	r6, r1, r1
  1082d0:	e1b030a3 	movs	r3, r3, lsr #1
  1082d4:	e1a02062 	mov	r2, r2, rrx
  1082d8:	e35c003d 	cmp	ip, #61	; 0x3d
  1082dc:	e1a00005 	mov	r0, r5
  1082e0:	e1a01006 	mov	r1, r6
  1082e4:	0a000006 	beq	108304 <__divdf3+0x18c>
  1082e8:	e1590001 	cmp	r9, r1
  1082ec:	e28cc001 	add	ip, ip, #1	; 0x1
  1082f0:	8afffff4 	bhi	1082c8 <__divdf3+0x150>
  1082f4:	1affffef 	bne	1082b8 <__divdf3+0x140>
  1082f8:	e1580000 	cmp	r8, r0
  1082fc:	8afffff1 	bhi	1082c8 <__divdf3+0x150>
  108300:	eaffffec 	b	1082b8 <__divdf3+0x140>
  108304:	e20a20ff 	and	r2, sl, #255	; 0xff
  108308:	e3a03000 	mov	r3, #0	; 0x0
  10830c:	e3520080 	cmp	r2, #128	; 0x80
  108310:	0a000009 	beq	10833c <__divdf3+0x1c4>
  108314:	e58da020 	str	sl, [sp, #32]
  108318:	e58db024 	str	fp, [sp, #36]
  10831c:	eaffffa7 	b	1081c0 <__divdf3+0x48>
  108320:	e1580000 	cmp	r8, r0
  108324:	9affffdd 	bls	1082a0 <__divdf3+0x128>
  108328:	e0900000 	adds	r0, r0, r0
  10832c:	e2423001 	sub	r3, r2, #1	; 0x1
  108330:	e0a11001 	adc	r1, r1, r1
  108334:	e58d301c 	str	r3, [sp, #28]
  108338:	eaffffd8 	b	1082a0 <__divdf3+0x128>
  10833c:	e3530000 	cmp	r3, #0	; 0x0
  108340:	1afffff3 	bne	108314 <__divdf3+0x19c>
  108344:	e3a01c01 	mov	r1, #256	; 0x100
  108348:	e3a02000 	mov	r2, #0	; 0x0
  10834c:	e00a3001 	and	r3, sl, r1
  108350:	e00b4002 	and	r4, fp, r2
  108354:	e1933004 	orrs	r3, r3, r4
  108358:	1affffed 	bne	108314 <__divdf3+0x19c>
  10835c:	e1955006 	orrs	r5, r5, r6
  108360:	0affffeb 	beq	108314 <__divdf3+0x19c>
  108364:	e3a03080 	mov	r3, #128	; 0x80
  108368:	e093300a 	adds	r3, r3, sl
  10836c:	e3a04000 	mov	r4, #0	; 0x0
  108370:	e0a4400b 	adc	r4, r4, fp
  108374:	e3e010ff 	mvn	r1, #255	; 0xff
  108378:	e3e02000 	mvn	r2, #0	; 0x0
  10837c:	e003a001 	and	sl, r3, r1
  108380:	e004b002 	and	fp, r4, r2
  108384:	eaffffe2 	b	108314 <__divdf3+0x19c>

00108388 <isnan>:
  108388:	e5900000 	ldr	r0, [r0]
  10838c:	e3500001 	cmp	r0, #1	; 0x1
  108390:	83a00000 	movhi	r0, #0	; 0x0
  108394:	93a00001 	movls	r0, #1	; 0x1
  108398:	e12fff1e 	bx	lr

0010839c <__eqdf2>:
  10839c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1083a0:	e24dd038 	sub	sp, sp, #56	; 0x38
  1083a4:	e28d5014 	add	r5, sp, #20	; 0x14
  1083a8:	e58d0030 	str	r0, [sp, #48]
  1083ac:	e58d1034 	str	r1, [sp, #52]
  1083b0:	e28d0030 	add	r0, sp, #48	; 0x30
  1083b4:	e1a01005 	mov	r1, r5
  1083b8:	e58d2028 	str	r2, [sp, #40]
  1083bc:	e58d302c 	str	r3, [sp, #44]
  1083c0:	eb0001d3 	bl	108b14 <__unpack_d>
  1083c4:	e1a0100d 	mov	r1, sp
  1083c8:	e28d0028 	add	r0, sp, #40	; 0x28
  1083cc:	eb0001d0 	bl	108b14 <__unpack_d>
  1083d0:	e1a00005 	mov	r0, r5
  1083d4:	ebffffeb 	bl	108388 <isnan>
  1083d8:	e3500000 	cmp	r0, #0	; 0x0
  1083dc:	e1a0400d 	mov	r4, sp
  1083e0:	e1a0000d 	mov	r0, sp
  1083e4:	0a000002 	beq	1083f4 <__eqdf2+0x58>
  1083e8:	e3a00001 	mov	r0, #1	; 0x1
  1083ec:	e28dd038 	add	sp, sp, #56	; 0x38
  1083f0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1083f4:	ebffffe3 	bl	108388 <isnan>
  1083f8:	e3500000 	cmp	r0, #0	; 0x0
  1083fc:	e1a0100d 	mov	r1, sp
  108400:	e1a00005 	mov	r0, r5
  108404:	1afffff7 	bne	1083e8 <__eqdf2+0x4c>
  108408:	eb000219 	bl	108c74 <__fpcmp_parts_d>
  10840c:	eafffff6 	b	1083ec <__eqdf2+0x50>

00108410 <isnan>:
  108410:	e5900000 	ldr	r0, [r0]
  108414:	e3500001 	cmp	r0, #1	; 0x1
  108418:	83a00000 	movhi	r0, #0	; 0x0
  10841c:	93a00001 	movls	r0, #1	; 0x1
  108420:	e12fff1e 	bx	lr

00108424 <__nedf2>:
  108424:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  108428:	e24dd038 	sub	sp, sp, #56	; 0x38
  10842c:	e28d5014 	add	r5, sp, #20	; 0x14
  108430:	e58d0030 	str	r0, [sp, #48]
  108434:	e58d1034 	str	r1, [sp, #52]
  108438:	e28d0030 	add	r0, sp, #48	; 0x30
  10843c:	e1a01005 	mov	r1, r5
  108440:	e58d2028 	str	r2, [sp, #40]
  108444:	e58d302c 	str	r3, [sp, #44]
  108448:	eb0001b1 	bl	108b14 <__unpack_d>
  10844c:	e1a0100d 	mov	r1, sp
  108450:	e28d0028 	add	r0, sp, #40	; 0x28
  108454:	eb0001ae 	bl	108b14 <__unpack_d>
  108458:	e1a00005 	mov	r0, r5
  10845c:	ebffffeb 	bl	108410 <isnan>
  108460:	e3500000 	cmp	r0, #0	; 0x0
  108464:	e1a0400d 	mov	r4, sp
  108468:	e1a0000d 	mov	r0, sp
  10846c:	0a000002 	beq	10847c <__nedf2+0x58>
  108470:	e3a00001 	mov	r0, #1	; 0x1
  108474:	e28dd038 	add	sp, sp, #56	; 0x38
  108478:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10847c:	ebffffe3 	bl	108410 <isnan>
  108480:	e3500000 	cmp	r0, #0	; 0x0
  108484:	e1a0100d 	mov	r1, sp
  108488:	e1a00005 	mov	r0, r5
  10848c:	1afffff7 	bne	108470 <__nedf2+0x4c>
  108490:	eb0001f7 	bl	108c74 <__fpcmp_parts_d>
  108494:	eafffff6 	b	108474 <__nedf2+0x50>

00108498 <isnan>:
  108498:	e5900000 	ldr	r0, [r0]
  10849c:	e3500001 	cmp	r0, #1	; 0x1
  1084a0:	83a00000 	movhi	r0, #0	; 0x0
  1084a4:	93a00001 	movls	r0, #1	; 0x1
  1084a8:	e12fff1e 	bx	lr

001084ac <__gtdf2>:
  1084ac:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1084b0:	e24dd038 	sub	sp, sp, #56	; 0x38
  1084b4:	e28d5014 	add	r5, sp, #20	; 0x14
  1084b8:	e58d0030 	str	r0, [sp, #48]
  1084bc:	e58d1034 	str	r1, [sp, #52]
  1084c0:	e28d0030 	add	r0, sp, #48	; 0x30
  1084c4:	e1a01005 	mov	r1, r5
  1084c8:	e58d2028 	str	r2, [sp, #40]
  1084cc:	e58d302c 	str	r3, [sp, #44]
  1084d0:	eb00018f 	bl	108b14 <__unpack_d>
  1084d4:	e1a0100d 	mov	r1, sp
  1084d8:	e28d0028 	add	r0, sp, #40	; 0x28
  1084dc:	eb00018c 	bl	108b14 <__unpack_d>
  1084e0:	e1a00005 	mov	r0, r5
  1084e4:	ebffffeb 	bl	108498 <isnan>
  1084e8:	e3500000 	cmp	r0, #0	; 0x0
  1084ec:	e1a0400d 	mov	r4, sp
  1084f0:	e1a0000d 	mov	r0, sp
  1084f4:	0a000002 	beq	108504 <__gtdf2+0x58>
  1084f8:	e3e00000 	mvn	r0, #0	; 0x0
  1084fc:	e28dd038 	add	sp, sp, #56	; 0x38
  108500:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108504:	ebffffe3 	bl	108498 <isnan>
  108508:	e3500000 	cmp	r0, #0	; 0x0
  10850c:	e1a0100d 	mov	r1, sp
  108510:	e1a00005 	mov	r0, r5
  108514:	1afffff7 	bne	1084f8 <__gtdf2+0x4c>
  108518:	eb0001d5 	bl	108c74 <__fpcmp_parts_d>
  10851c:	eafffff6 	b	1084fc <__gtdf2+0x50>

00108520 <isnan>:
  108520:	e5900000 	ldr	r0, [r0]
  108524:	e3500001 	cmp	r0, #1	; 0x1
  108528:	83a00000 	movhi	r0, #0	; 0x0
  10852c:	93a00001 	movls	r0, #1	; 0x1
  108530:	e12fff1e 	bx	lr

00108534 <__gedf2>:
  108534:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  108538:	e24dd038 	sub	sp, sp, #56	; 0x38
  10853c:	e28d5014 	add	r5, sp, #20	; 0x14
  108540:	e58d0030 	str	r0, [sp, #48]
  108544:	e58d1034 	str	r1, [sp, #52]
  108548:	e28d0030 	add	r0, sp, #48	; 0x30
  10854c:	e1a01005 	mov	r1, r5
  108550:	e58d2028 	str	r2, [sp, #40]
  108554:	e58d302c 	str	r3, [sp, #44]
  108558:	eb00016d 	bl	108b14 <__unpack_d>
  10855c:	e1a0100d 	mov	r1, sp
  108560:	e28d0028 	add	r0, sp, #40	; 0x28
  108564:	eb00016a 	bl	108b14 <__unpack_d>
  108568:	e1a00005 	mov	r0, r5
  10856c:	ebffffeb 	bl	108520 <isnan>
  108570:	e3500000 	cmp	r0, #0	; 0x0
  108574:	e1a0400d 	mov	r4, sp
  108578:	e1a0000d 	mov	r0, sp
  10857c:	0a000002 	beq	10858c <__gedf2+0x58>
  108580:	e3e00000 	mvn	r0, #0	; 0x0
  108584:	e28dd038 	add	sp, sp, #56	; 0x38
  108588:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10858c:	ebffffe3 	bl	108520 <isnan>
  108590:	e3500000 	cmp	r0, #0	; 0x0
  108594:	e1a0100d 	mov	r1, sp
  108598:	e1a00005 	mov	r0, r5
  10859c:	1afffff7 	bne	108580 <__gedf2+0x4c>
  1085a0:	eb0001b3 	bl	108c74 <__fpcmp_parts_d>
  1085a4:	eafffff6 	b	108584 <__gedf2+0x50>

001085a8 <isnan>:
  1085a8:	e5900000 	ldr	r0, [r0]
  1085ac:	e3500001 	cmp	r0, #1	; 0x1
  1085b0:	83a00000 	movhi	r0, #0	; 0x0
  1085b4:	93a00001 	movls	r0, #1	; 0x1
  1085b8:	e12fff1e 	bx	lr

001085bc <__ltdf2>:
  1085bc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1085c0:	e24dd038 	sub	sp, sp, #56	; 0x38
  1085c4:	e28d5014 	add	r5, sp, #20	; 0x14
  1085c8:	e58d0030 	str	r0, [sp, #48]
  1085cc:	e58d1034 	str	r1, [sp, #52]
  1085d0:	e28d0030 	add	r0, sp, #48	; 0x30
  1085d4:	e1a01005 	mov	r1, r5
  1085d8:	e58d2028 	str	r2, [sp, #40]
  1085dc:	e58d302c 	str	r3, [sp, #44]
  1085e0:	eb00014b 	bl	108b14 <__unpack_d>
  1085e4:	e1a0100d 	mov	r1, sp
  1085e8:	e28d0028 	add	r0, sp, #40	; 0x28
  1085ec:	eb000148 	bl	108b14 <__unpack_d>
  1085f0:	e1a00005 	mov	r0, r5
  1085f4:	ebffffeb 	bl	1085a8 <isnan>
  1085f8:	e3500000 	cmp	r0, #0	; 0x0
  1085fc:	e1a0400d 	mov	r4, sp
  108600:	e1a0000d 	mov	r0, sp
  108604:	0a000002 	beq	108614 <__ltdf2+0x58>
  108608:	e3a00001 	mov	r0, #1	; 0x1
  10860c:	e28dd038 	add	sp, sp, #56	; 0x38
  108610:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108614:	ebffffe3 	bl	1085a8 <isnan>
  108618:	e3500000 	cmp	r0, #0	; 0x0
  10861c:	e1a0100d 	mov	r1, sp
  108620:	e1a00005 	mov	r0, r5
  108624:	1afffff7 	bne	108608 <__ltdf2+0x4c>
  108628:	eb000191 	bl	108c74 <__fpcmp_parts_d>
  10862c:	eafffff6 	b	10860c <__ltdf2+0x50>

00108630 <__floatsidf>:
  108630:	e92d4010 	stmdb	sp!, {r4, lr}
  108634:	e3a03003 	mov	r3, #3	; 0x3
  108638:	e24dd014 	sub	sp, sp, #20	; 0x14
  10863c:	e3500000 	cmp	r0, #0	; 0x0
  108640:	e58d3000 	str	r3, [sp]
  108644:	e1a02fa0 	mov	r2, r0, lsr #31
  108648:	02433001 	subeq	r3, r3, #1	; 0x1
  10864c:	e58d2004 	str	r2, [sp, #4]
  108650:	058d3000 	streq	r3, [sp]
  108654:	0a00001b 	beq	1086c8 <__floatsidf+0x98>
  108658:	e3520000 	cmp	r2, #0	; 0x0
  10865c:	e3a0203c 	mov	r2, #60	; 0x3c
  108660:	e58d2008 	str	r2, [sp, #8]
  108664:	0a00001b 	beq	1086d8 <__floatsidf+0xa8>
  108668:	e3500102 	cmp	r0, #-2147483648	; 0x80000000
  10866c:	03a004c1 	moveq	r0, #-1056964608	; 0xc1000000
  108670:	0280060e 	addeq	r0, r0, #14680064	; 0xe00000
  108674:	03a01000 	moveq	r1, #0	; 0x0
  108678:	0a000014 	beq	1086d0 <__floatsidf+0xa0>
  10867c:	e2603000 	rsb	r3, r0, #0	; 0x0
  108680:	e1a04fc3 	mov	r4, r3, asr #31
  108684:	e58d300c 	str	r3, [sp, #12]
  108688:	e58d4010 	str	r4, [sp, #16]
  10868c:	e28d000c 	add	r0, sp, #12	; 0xc
  108690:	e8900003 	ldmia	r0, {r0, r1}
  108694:	e371021f 	cmn	r1, #-268435455	; 0xf0000001
  108698:	8a00000a 	bhi	1086c8 <__floatsidf+0x98>
  10869c:	e59d2008 	ldr	r2, [sp, #8]
  1086a0:	e0903000 	adds	r3, r0, r0
  1086a4:	e0a14001 	adc	r4, r1, r1
  1086a8:	e2422001 	sub	r2, r2, #1	; 0x1
  1086ac:	e374021f 	cmn	r4, #-268435455	; 0xf0000001
  1086b0:	e1a00003 	mov	r0, r3
  1086b4:	e1a01004 	mov	r1, r4
  1086b8:	e58d300c 	str	r3, [sp, #12]
  1086bc:	e58d4010 	str	r4, [sp, #16]
  1086c0:	e58d2008 	str	r2, [sp, #8]
  1086c4:	9afffff5 	bls	1086a0 <__floatsidf+0x70>
  1086c8:	e1a0000d 	mov	r0, sp
  1086cc:	eb000053 	bl	108820 <__pack_d>
  1086d0:	e28dd014 	add	sp, sp, #20	; 0x14
  1086d4:	e8bd8010 	ldmia	sp!, {r4, pc}
  1086d8:	e1a03000 	mov	r3, r0
  1086dc:	e1a04fc3 	mov	r4, r3, asr #31
  1086e0:	e58d300c 	str	r3, [sp, #12]
  1086e4:	e58d4010 	str	r4, [sp, #16]
  1086e8:	eaffffe7 	b	10868c <__floatsidf+0x5c>

001086ec <isnan>:
  1086ec:	e5900000 	ldr	r0, [r0]
  1086f0:	e3500001 	cmp	r0, #1	; 0x1
  1086f4:	83a00000 	movhi	r0, #0	; 0x0
  1086f8:	93a00001 	movls	r0, #1	; 0x1
  1086fc:	e12fff1e 	bx	lr

00108700 <isinf>:
  108700:	e5900000 	ldr	r0, [r0]
  108704:	e3500004 	cmp	r0, #4	; 0x4
  108708:	13a00000 	movne	r0, #0	; 0x0
  10870c:	03a00001 	moveq	r0, #1	; 0x1
  108710:	e12fff1e 	bx	lr

00108714 <iszero>:
  108714:	e5900000 	ldr	r0, [r0]
  108718:	e3500002 	cmp	r0, #2	; 0x2
  10871c:	13a00000 	movne	r0, #0	; 0x0
  108720:	03a00001 	moveq	r0, #1	; 0x1
  108724:	e12fff1e 	bx	lr

00108728 <__fixdfsi>:
  108728:	e92d4010 	stmdb	sp!, {r4, lr}
  10872c:	e24dd01c 	sub	sp, sp, #28	; 0x1c
  108730:	e28d301c 	add	r3, sp, #28	; 0x1c
  108734:	e9230003 	stmdb	r3!, {r0, r1}
  108738:	e1a0100d 	mov	r1, sp
  10873c:	e1a00003 	mov	r0, r3
  108740:	eb0000f3 	bl	108b14 <__unpack_d>
  108744:	e1a0000d 	mov	r0, sp
  108748:	ebfffff1 	bl	108714 <iszero>
  10874c:	e3500000 	cmp	r0, #0	; 0x0
  108750:	e1a0400d 	mov	r4, sp
  108754:	0a000002 	beq	108764 <__fixdfsi+0x3c>
  108758:	e3a00000 	mov	r0, #0	; 0x0
  10875c:	e28dd01c 	add	sp, sp, #28	; 0x1c
  108760:	e8bd8010 	ldmia	sp!, {r4, pc}
  108764:	e1a0000d 	mov	r0, sp
  108768:	ebffffdf 	bl	1086ec <isnan>
  10876c:	e3500000 	cmp	r0, #0	; 0x0
  108770:	1afffff8 	bne	108758 <__fixdfsi+0x30>
  108774:	e1a0000d 	mov	r0, sp
  108778:	ebffffe0 	bl	108700 <isinf>
  10877c:	e3500000 	cmp	r0, #0	; 0x0
  108780:	0a000004 	beq	108798 <__fixdfsi+0x70>
  108784:	e59d3004 	ldr	r3, [sp, #4]
  108788:	e3530000 	cmp	r3, #0	; 0x0
  10878c:	03e00102 	mvneq	r0, #-2147483648	; 0x80000000
  108790:	13a00102 	movne	r0, #-2147483648	; 0x80000000
  108794:	eafffff0 	b	10875c <__fixdfsi+0x34>
  108798:	e59d3008 	ldr	r3, [sp, #8]
  10879c:	e3530000 	cmp	r3, #0	; 0x0
  1087a0:	baffffec 	blt	108758 <__fixdfsi+0x30>
  1087a4:	e353001e 	cmp	r3, #30	; 0x1e
  1087a8:	cafffff5 	bgt	108784 <__fixdfsi+0x5c>
  1087ac:	e59d200c 	ldr	r2, [sp, #12]
  1087b0:	e263103c 	rsb	r1, r3, #60	; 0x3c
  1087b4:	e1a03132 	mov	r3, r2, lsr r1
  1087b8:	e59d0010 	ldr	r0, [sp, #16]
  1087bc:	e261c020 	rsb	ip, r1, #32	; 0x20
  1087c0:	e1833c10 	orr	r3, r3, r0, lsl ip
  1087c4:	e251e020 	subs	lr, r1, #32	; 0x20
  1087c8:	51a03e30 	movpl	r3, r0, lsr lr
  1087cc:	e1a04130 	mov	r4, r0, lsr r1
  1087d0:	e59d2004 	ldr	r2, [sp, #4]
  1087d4:	e3520000 	cmp	r2, #0	; 0x0
  1087d8:	e1a00003 	mov	r0, r3
  1087dc:	12630000 	rsbne	r0, r3, #0	; 0x0
  1087e0:	eaffffdd 	b	10875c <__fixdfsi+0x34>

001087e4 <isnan>:
  1087e4:	e5900000 	ldr	r0, [r0]
  1087e8:	e3500001 	cmp	r0, #1	; 0x1
  1087ec:	83a00000 	movhi	r0, #0	; 0x0
  1087f0:	93a00001 	movls	r0, #1	; 0x1
  1087f4:	e12fff1e 	bx	lr

001087f8 <isinf>:
  1087f8:	e5900000 	ldr	r0, [r0]
  1087fc:	e3500004 	cmp	r0, #4	; 0x4
  108800:	13a00000 	movne	r0, #0	; 0x0
  108804:	03a00001 	moveq	r0, #1	; 0x1
  108808:	e12fff1e 	bx	lr

0010880c <iszero>:
  10880c:	e5900000 	ldr	r0, [r0]
  108810:	e3500002 	cmp	r0, #2	; 0x2
  108814:	13a00000 	movne	r0, #0	; 0x0
  108818:	03a00001 	moveq	r0, #1	; 0x1
  10881c:	e12fff1e 	bx	lr

00108820 <__pack_d>:
  108820:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  108824:	e24dd008 	sub	sp, sp, #8	; 0x8
  108828:	e1a05000 	mov	r5, r0
  10882c:	ebffffec 	bl	1087e4 <isnan>
  108830:	e3500000 	cmp	r0, #0	; 0x0
  108834:	e3a08000 	mov	r8, #0	; 0x0
  108838:	e285a00c 	add	sl, r5, #12	; 0xc
  10883c:	e89a0c00 	ldmia	sl, {sl, fp}
  108840:	e5959004 	ldr	r9, [r5, #4]
  108844:	0a000019 	beq	1088b0 <__pack_d+0x90>
  108848:	e3a04702 	mov	r4, #524288	; 0x80000
  10884c:	e3a03000 	mov	r3, #0	; 0x0
  108850:	e18b1004 	orr	r1, fp, r4
  108854:	e3a04601 	mov	r4, #1048576	; 0x100000
  108858:	e18a0003 	orr	r0, sl, r3
  10885c:	e3a0ce7f 	mov	ip, #2032	; 0x7f0
  108860:	e3e03000 	mvn	r3, #0	; 0x0
  108864:	e2444001 	sub	r4, r4, #1	; 0x1
  108868:	e0000003 	and	r0, r0, r3
  10886c:	e0011004 	and	r1, r1, r4
  108870:	e28cc00f 	add	ip, ip, #15	; 0xf
  108874:	e1a03a28 	mov	r3, r8, lsr #20
  108878:	e1833601 	orr	r3, r3, r1, lsl #12
  10887c:	e1a08663 	mov	r8, r3, ror #12
  108880:	e3c8247f 	bic	r2, r8, #2130706432	; 0x7f000000
  108884:	e3c2260f 	bic	r2, r2, #15728640	; 0xf00000
  108888:	e1828a0c 	orr	r8, r2, ip, lsl #20
  10888c:	e3c83102 	bic	r3, r8, #-2147483648	; 0x80000000
  108890:	e1833f89 	orr	r3, r3, r9, lsl #31
  108894:	e1a02000 	mov	r2, r0
  108898:	e1a08000 	mov	r8, r0
  10889c:	e1a07003 	mov	r7, r3
  1088a0:	e1a00003 	mov	r0, r3
  1088a4:	e1a01002 	mov	r1, r2
  1088a8:	e28dd008 	add	sp, sp, #8	; 0x8
  1088ac:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1088b0:	e1a00005 	mov	r0, r5
  1088b4:	ebffffcf 	bl	1087f8 <isinf>
  1088b8:	e3500000 	cmp	r0, #0	; 0x0
  1088bc:	0a000004 	beq	1088d4 <__pack_d+0xb4>
  1088c0:	e3a0ce7f 	mov	ip, #2032	; 0x7f0
  1088c4:	e28cc00f 	add	ip, ip, #15	; 0xf
  1088c8:	e3a00000 	mov	r0, #0	; 0x0
  1088cc:	e3a01000 	mov	r1, #0	; 0x0
  1088d0:	eaffffe7 	b	108874 <__pack_d+0x54>
  1088d4:	e1a00005 	mov	r0, r5
  1088d8:	ebffffcb 	bl	10880c <iszero>
  1088dc:	e250c000 	subs	ip, r0, #0	; 0x0
  1088e0:	1a000023 	bne	108974 <__pack_d+0x154>
  1088e4:	e19a100b 	orrs	r1, sl, fp
  1088e8:	0a000021 	beq	108974 <__pack_d+0x154>
  1088ec:	e5950008 	ldr	r0, [r5, #8]
  1088f0:	e3e03fff 	mvn	r3, #1020	; 0x3fc
  1088f4:	e2433001 	sub	r3, r3, #1	; 0x1
  1088f8:	e1500003 	cmp	r0, r3
  1088fc:	ba000020 	blt	108984 <__pack_d+0x164>
  108900:	e3500b01 	cmp	r0, #1024	; 0x400
  108904:	aaffffed 	bge	1088c0 <__pack_d+0xa0>
  108908:	e20a20ff 	and	r2, sl, #255	; 0xff
  10890c:	e3a03000 	mov	r3, #0	; 0x0
  108910:	e2800fff 	add	r0, r0, #1020	; 0x3fc
  108914:	e3520080 	cmp	r2, #128	; 0x80
  108918:	e2800003 	add	r0, r0, #3	; 0x3
  10891c:	0a000054 	beq	108a74 <__pack_d+0x254>
  108920:	e3a0307f 	mov	r3, #127	; 0x7f
  108924:	e3a04000 	mov	r4, #0	; 0x0
  108928:	e09aa003 	adds	sl, sl, r3
  10892c:	e0abb004 	adc	fp, fp, r4
  108930:	e37b021e 	cmn	fp, #-536870911	; 0xe0000001
  108934:	9a000002 	bls	108944 <__pack_d+0x124>
  108938:	e1b0b0ab 	movs	fp, fp, lsr #1
  10893c:	e1a0a06a 	mov	sl, sl, rrx
  108940:	e2800001 	add	r0, r0, #1	; 0x1
  108944:	e3c02b3e 	bic	r2, r0, #63488	; 0xf800
  108948:	e3a04601 	mov	r4, #1048576	; 0x100000
  10894c:	e1a0042a 	mov	r0, sl, lsr #8
  108950:	e1a02802 	mov	r2, r2, lsl #16
  108954:	e1800c0b 	orr	r0, r0, fp, lsl #24
  108958:	e1a0142b 	mov	r1, fp, lsr #8
  10895c:	e3e03000 	mvn	r3, #0	; 0x0
  108960:	e2444001 	sub	r4, r4, #1	; 0x1
  108964:	e0000003 	and	r0, r0, r3
  108968:	e0011004 	and	r1, r1, r4
  10896c:	e1a0c822 	mov	ip, r2, lsr #16
  108970:	eaffffbf 	b	108874 <__pack_d+0x54>
  108974:	e3a00000 	mov	r0, #0	; 0x0
  108978:	e3a01000 	mov	r1, #0	; 0x0
  10897c:	e3a0c000 	mov	ip, #0	; 0x0
  108980:	eaffffbb 	b	108874 <__pack_d+0x54>
  108984:	e26003bf 	rsb	r0, r0, #-67108862	; 0xfc000002
  108988:	e28007ff 	add	r0, r0, #66846720	; 0x3fc0000
  10898c:	e2800bff 	add	r0, r0, #261120	; 0x3fc00
  108990:	e3500038 	cmp	r0, #56	; 0x38
  108994:	c1a0000c 	movgt	r0, ip
  108998:	c3a0a000 	movgt	sl, #0	; 0x0
  10899c:	c3a0b000 	movgt	fp, #0	; 0x0
  1089a0:	ca00002a 	bgt	108a50 <__pack_d+0x230>
  1089a4:	e1a0503a 	mov	r5, sl, lsr r0
  1089a8:	e2601020 	rsb	r1, r0, #32	; 0x20
  1089ac:	e3a0e001 	mov	lr, #1	; 0x1
  1089b0:	e185511b 	orr	r5, r5, fp, lsl r1
  1089b4:	e18c413e 	orr	r4, ip, lr, lsr r1
  1089b8:	e2402020 	sub	r2, r0, #32	; 0x20
  1089bc:	e3520000 	cmp	r2, #0	; 0x0
  1089c0:	e1a0301e 	mov	r3, lr, lsl r0
  1089c4:	a1a0421e 	movge	r4, lr, lsl r2
  1089c8:	e1a01005 	mov	r1, r5
  1089cc:	a1a0123b 	movge	r1, fp, lsr r2
  1089d0:	e1a0003b 	mov	r0, fp, lsr r0
  1089d4:	e3e05000 	mvn	r5, #0	; 0x0
  1089d8:	e0933005 	adds	r3, r3, r5
  1089dc:	e3e06000 	mvn	r6, #0	; 0x0
  1089e0:	e0a44006 	adc	r4, r4, r6
  1089e4:	e00b2004 	and	r2, fp, r4
  1089e8:	e58d1000 	str	r1, [sp]
  1089ec:	e58d0004 	str	r0, [sp, #4]
  1089f0:	e00a1003 	and	r1, sl, r3
  1089f4:	e1911002 	orrs	r1, r1, r2
  1089f8:	e89d0060 	ldmia	sp, {r5, r6}
  1089fc:	e3a02000 	mov	r2, #0	; 0x0
  108a00:	13a02001 	movne	r2, #1	; 0x1
  108a04:	e1855002 	orr	r5, r5, r2
  108a08:	e205a0ff 	and	sl, r5, #255	; 0xff
  108a0c:	e3a0b000 	mov	fp, #0	; 0x0
  108a10:	e3a03000 	mov	r3, #0	; 0x0
  108a14:	13a03000 	movne	r3, #0	; 0x0
  108a18:	e35a0080 	cmp	sl, #128	; 0x80
  108a1c:	e1866003 	orr	r6, r6, r3
  108a20:	0a000020 	beq	108aa8 <__pack_d+0x288>
  108a24:	e3a0307f 	mov	r3, #127	; 0x7f
  108a28:	e0933005 	adds	r3, r3, r5
  108a2c:	e3a04000 	mov	r4, #0	; 0x0
  108a30:	e0a44006 	adc	r4, r4, r6
  108a34:	e3540201 	cmp	r4, #268435456	; 0x10000000
  108a38:	31a0200c 	movcc	r2, ip
  108a3c:	21a0200e 	movcs	r2, lr
  108a40:	e1a0a423 	mov	sl, r3, lsr #8
  108a44:	e1a00002 	mov	r0, r2
  108a48:	e18aac04 	orr	sl, sl, r4, lsl #24
  108a4c:	e1a0b424 	mov	fp, r4, lsr #8
  108a50:	e3c02b3e 	bic	r2, r0, #63488	; 0xf800
  108a54:	e3a04601 	mov	r4, #1048576	; 0x100000
  108a58:	e1a02802 	mov	r2, r2, lsl #16
  108a5c:	e3e03000 	mvn	r3, #0	; 0x0
  108a60:	e2444001 	sub	r4, r4, #1	; 0x1
  108a64:	e00a0003 	and	r0, sl, r3
  108a68:	e00b1004 	and	r1, fp, r4
  108a6c:	e1a0c822 	mov	ip, r2, lsr #16
  108a70:	eaffff7f 	b	108874 <__pack_d+0x54>
  108a74:	e3530000 	cmp	r3, #0	; 0x0
  108a78:	1affffa8 	bne	108920 <__pack_d+0x100>
  108a7c:	e3a01c01 	mov	r1, #256	; 0x100
  108a80:	e3a02000 	mov	r2, #0	; 0x0
  108a84:	e00a3001 	and	r3, sl, r1
  108a88:	e00b4002 	and	r4, fp, r2
  108a8c:	e1933004 	orrs	r3, r3, r4
  108a90:	0affffa6 	beq	108930 <__pack_d+0x110>
  108a94:	e3a03080 	mov	r3, #128	; 0x80
  108a98:	e3a04000 	mov	r4, #0	; 0x0
  108a9c:	e09aa003 	adds	sl, sl, r3
  108aa0:	e0abb004 	adc	fp, fp, r4
  108aa4:	eaffffa1 	b	108930 <__pack_d+0x110>
  108aa8:	e35b0000 	cmp	fp, #0	; 0x0
  108aac:	1affffdc 	bne	108a24 <__pack_d+0x204>
  108ab0:	e3a01c01 	mov	r1, #256	; 0x100
  108ab4:	e3a02000 	mov	r2, #0	; 0x0
  108ab8:	e0053001 	and	r3, r5, r1
  108abc:	e0064002 	and	r4, r6, r2
  108ac0:	e1933004 	orrs	r3, r3, r4
  108ac4:	1a000006 	bne	108ae4 <__pack_d+0x2c4>
  108ac8:	e3560201 	cmp	r6, #268435456	; 0x10000000
  108acc:	21a0300e 	movcs	r3, lr
  108ad0:	e1a0a425 	mov	sl, r5, lsr #8
  108ad4:	e1a00003 	mov	r0, r3
  108ad8:	e18aac06 	orr	sl, sl, r6, lsl #24
  108adc:	e1a0b426 	mov	fp, r6, lsr #8
  108ae0:	eaffffda 	b	108a50 <__pack_d+0x230>
  108ae4:	e3a03080 	mov	r3, #128	; 0x80
  108ae8:	e0933005 	adds	r3, r3, r5
  108aec:	e3a04000 	mov	r4, #0	; 0x0
  108af0:	e0a44006 	adc	r4, r4, r6
  108af4:	e3540201 	cmp	r4, #268435456	; 0x10000000
  108af8:	21a0200e 	movcs	r2, lr
  108afc:	31a0200b 	movcc	r2, fp
  108b00:	e1a0a423 	mov	sl, r3, lsr #8
  108b04:	e1a00002 	mov	r0, r2
  108b08:	e18aac04 	orr	sl, sl, r4, lsl #24
  108b0c:	e1a0b424 	mov	fp, r4, lsr #8
  108b10:	eaffffce 	b	108a50 <__pack_d+0x230>

00108b14 <__unpack_d>:
  108b14:	e92d0070 	stmdb	sp!, {r4, r5, r6}
  108b18:	e5904000 	ldr	r4, [r0]
  108b1c:	e1a02a24 	mov	r2, r4, lsr #20
  108b20:	e5903004 	ldr	r3, [r0, #4]
  108b24:	e3c22b3e 	bic	r2, r2, #63488	; 0xf800
  108b28:	e1a0c001 	mov	ip, r1
  108b2c:	e3c464ff 	bic	r6, r4, #-16777216	; 0xff000000
  108b30:	e1a01fa4 	mov	r1, r4, lsr #31
  108b34:	e2520000 	subs	r0, r2, #0	; 0x0
  108b38:	e1a05003 	mov	r5, r3
  108b3c:	e58c1004 	str	r1, [ip, #4]
  108b40:	e3c6660f 	bic	r6, r6, #15728640	; 0xf00000
  108b44:	1a000005 	bne	108b60 <__unpack_d+0x4c>
  108b48:	e1953006 	orrs	r3, r5, r6
  108b4c:	03a03002 	moveq	r3, #2	; 0x2
  108b50:	058c3000 	streq	r3, [ip]
  108b54:	1a000014 	bne	108bac <__unpack_d+0x98>
  108b58:	e8bd0070 	ldmia	sp!, {r4, r5, r6}
  108b5c:	e12fff1e 	bx	lr
  108b60:	e3a03e7f 	mov	r3, #2032	; 0x7f0
  108b64:	e283300f 	add	r3, r3, #15	; 0xf
  108b68:	e1500003 	cmp	r0, r3
  108b6c:	0a000022 	beq	108bfc <__unpack_d+0xe8>
  108b70:	e1a04406 	mov	r4, r6, lsl #8
  108b74:	e1844c25 	orr	r4, r4, r5, lsr #24
  108b78:	e1a03405 	mov	r3, r5, lsl #8
  108b7c:	e3a01000 	mov	r1, #0	; 0x0
  108b80:	e3a02201 	mov	r2, #268435456	; 0x10000000
  108b84:	e2400fff 	sub	r0, r0, #1020	; 0x3fc
  108b88:	e1835001 	orr	r5, r3, r1
  108b8c:	e1846002 	orr	r6, r4, r2
  108b90:	e2400003 	sub	r0, r0, #3	; 0x3
  108b94:	e3a03003 	mov	r3, #3	; 0x3
  108b98:	e58c500c 	str	r5, [ip, #12]
  108b9c:	e58c6010 	str	r6, [ip, #16]
  108ba0:	e58c0008 	str	r0, [ip, #8]
  108ba4:	e58c3000 	str	r3, [ip]
  108ba8:	eaffffea 	b	108b58 <__unpack_d+0x44>
  108bac:	e1a02406 	mov	r2, r6, lsl #8
  108bb0:	e3e00fff 	mvn	r0, #1020	; 0x3fc
  108bb4:	e1822c25 	orr	r2, r2, r5, lsr #24
  108bb8:	e2400001 	sub	r0, r0, #1	; 0x1
  108bbc:	e3a03003 	mov	r3, #3	; 0x3
  108bc0:	e372021f 	cmn	r2, #-268435455	; 0xf0000001
  108bc4:	e1a01405 	mov	r1, r5, lsl #8
  108bc8:	e58c3000 	str	r3, [ip]
  108bcc:	e58c0008 	str	r0, [ip, #8]
  108bd0:	8a000006 	bhi	108bf0 <__unpack_d+0xdc>
  108bd4:	e1a03000 	mov	r3, r0
  108bd8:	e0911001 	adds	r1, r1, r1
  108bdc:	e0a22002 	adc	r2, r2, r2
  108be0:	e372021f 	cmn	r2, #-268435455	; 0xf0000001
  108be4:	e2433001 	sub	r3, r3, #1	; 0x1
  108be8:	9afffffa 	bls	108bd8 <__unpack_d+0xc4>
  108bec:	e58c3008 	str	r3, [ip, #8]
  108bf0:	e58c100c 	str	r1, [ip, #12]
  108bf4:	e58c2010 	str	r2, [ip, #16]
  108bf8:	eaffffd6 	b	108b58 <__unpack_d+0x44>
  108bfc:	e1953006 	orrs	r3, r5, r6
  108c00:	03a03004 	moveq	r3, #4	; 0x4
  108c04:	058c3000 	streq	r3, [ip]
  108c08:	0affffd2 	beq	108b58 <__unpack_d+0x44>
  108c0c:	e3a01000 	mov	r1, #0	; 0x0
  108c10:	e3a02702 	mov	r2, #524288	; 0x80000
  108c14:	e0053001 	and	r3, r5, r1
  108c18:	e0064002 	and	r4, r6, r2
  108c1c:	e1933004 	orrs	r3, r3, r4
  108c20:	13a03001 	movne	r3, #1	; 0x1
  108c24:	158c3000 	strne	r3, [ip]
  108c28:	058c3000 	streq	r3, [ip]
  108c2c:	e58c500c 	str	r5, [ip, #12]
  108c30:	e58c6010 	str	r6, [ip, #16]
  108c34:	eaffffc7 	b	108b58 <__unpack_d+0x44>

00108c38 <isnan>:
  108c38:	e5900000 	ldr	r0, [r0]
  108c3c:	e3500001 	cmp	r0, #1	; 0x1
  108c40:	83a00000 	movhi	r0, #0	; 0x0
  108c44:	93a00001 	movls	r0, #1	; 0x1
  108c48:	e12fff1e 	bx	lr

00108c4c <isinf>:
  108c4c:	e5900000 	ldr	r0, [r0]
  108c50:	e3500004 	cmp	r0, #4	; 0x4
  108c54:	13a00000 	movne	r0, #0	; 0x0
  108c58:	03a00001 	moveq	r0, #1	; 0x1
  108c5c:	e12fff1e 	bx	lr

00108c60 <iszero>:
  108c60:	e5900000 	ldr	r0, [r0]
  108c64:	e3500002 	cmp	r0, #2	; 0x2
  108c68:	13a00000 	movne	r0, #0	; 0x0
  108c6c:	03a00001 	moveq	r0, #1	; 0x1
  108c70:	e12fff1e 	bx	lr

00108c74 <__fpcmp_parts_d>:
  108c74:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  108c78:	e1a04001 	mov	r4, r1
  108c7c:	e1a05000 	mov	r5, r0
  108c80:	ebffffec 	bl	108c38 <isnan>
  108c84:	e3500000 	cmp	r0, #0	; 0x0
  108c88:	0a000001 	beq	108c94 <__fpcmp_parts_d+0x20>
  108c8c:	e3a00001 	mov	r0, #1	; 0x1
  108c90:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108c94:	e1a00004 	mov	r0, r4
  108c98:	ebffffe6 	bl	108c38 <isnan>
  108c9c:	e3500000 	cmp	r0, #0	; 0x0
  108ca0:	1afffff9 	bne	108c8c <__fpcmp_parts_d+0x18>
  108ca4:	e1a00005 	mov	r0, r5
  108ca8:	ebffffe7 	bl	108c4c <isinf>
  108cac:	e3500000 	cmp	r0, #0	; 0x0
  108cb0:	1a000013 	bne	108d04 <__fpcmp_parts_d+0x90>
  108cb4:	e1a00004 	mov	r0, r4
  108cb8:	ebffffe3 	bl	108c4c <isinf>
  108cbc:	e3500000 	cmp	r0, #0	; 0x0
  108cc0:	1a000021 	bne	108d4c <__fpcmp_parts_d+0xd8>
  108cc4:	e1a00005 	mov	r0, r5
  108cc8:	ebffffe4 	bl	108c60 <iszero>
  108ccc:	e3500000 	cmp	r0, #0	; 0x0
  108cd0:	1a000017 	bne	108d34 <__fpcmp_parts_d+0xc0>
  108cd4:	e1a00004 	mov	r0, r4
  108cd8:	ebffffe0 	bl	108c60 <iszero>
  108cdc:	e3500000 	cmp	r0, #0	; 0x0
  108ce0:	1a00000f 	bne	108d24 <__fpcmp_parts_d+0xb0>
  108ce4:	e595c004 	ldr	ip, [r5, #4]
  108ce8:	e5943004 	ldr	r3, [r4, #4]
  108cec:	e15c0003 	cmp	ip, r3
  108cf0:	0a000019 	beq	108d5c <__fpcmp_parts_d+0xe8>
  108cf4:	e35c0000 	cmp	ip, #0	; 0x0
  108cf8:	0affffe3 	beq	108c8c <__fpcmp_parts_d+0x18>
  108cfc:	e3e00000 	mvn	r0, #0	; 0x0
  108d00:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108d04:	e1a00004 	mov	r0, r4
  108d08:	ebffffcf 	bl	108c4c <isinf>
  108d0c:	e3500000 	cmp	r0, #0	; 0x0
  108d10:	0a000003 	beq	108d24 <__fpcmp_parts_d+0xb0>
  108d14:	e5942004 	ldr	r2, [r4, #4]
  108d18:	e5953004 	ldr	r3, [r5, #4]
  108d1c:	e0630002 	rsb	r0, r3, r2
  108d20:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108d24:	e5953004 	ldr	r3, [r5, #4]
  108d28:	e3530000 	cmp	r3, #0	; 0x0
  108d2c:	0affffd6 	beq	108c8c <__fpcmp_parts_d+0x18>
  108d30:	eafffff1 	b	108cfc <__fpcmp_parts_d+0x88>
  108d34:	e1a00004 	mov	r0, r4
  108d38:	ebffffc8 	bl	108c60 <iszero>
  108d3c:	e3500000 	cmp	r0, #0	; 0x0
  108d40:	0a000001 	beq	108d4c <__fpcmp_parts_d+0xd8>
  108d44:	e3a00000 	mov	r0, #0	; 0x0
  108d48:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108d4c:	e5943004 	ldr	r3, [r4, #4]
  108d50:	e3530000 	cmp	r3, #0	; 0x0
  108d54:	1affffcc 	bne	108c8c <__fpcmp_parts_d+0x18>
  108d58:	eaffffe7 	b	108cfc <__fpcmp_parts_d+0x88>
  108d5c:	e5952008 	ldr	r2, [r5, #8]
  108d60:	e5943008 	ldr	r3, [r4, #8]
  108d64:	e1520003 	cmp	r2, r3
  108d68:	caffffe1 	bgt	108cf4 <__fpcmp_parts_d+0x80>
  108d6c:	ba00000b 	blt	108da0 <__fpcmp_parts_d+0x12c>
  108d70:	e285200c 	add	r2, r5, #12	; 0xc
  108d74:	e892000c 	ldmia	r2, {r2, r3}
  108d78:	e284000c 	add	r0, r4, #12	; 0xc
  108d7c:	e8900003 	ldmia	r0, {r0, r1}
  108d80:	e1530001 	cmp	r3, r1
  108d84:	8affffda 	bhi	108cf4 <__fpcmp_parts_d+0x80>
  108d88:	0a000007 	beq	108dac <__fpcmp_parts_d+0x138>
  108d8c:	e1510003 	cmp	r1, r3
  108d90:	8a000002 	bhi	108da0 <__fpcmp_parts_d+0x12c>
  108d94:	1affffea 	bne	108d44 <__fpcmp_parts_d+0xd0>
  108d98:	e1500002 	cmp	r0, r2
  108d9c:	9affffe8 	bls	108d44 <__fpcmp_parts_d+0xd0>
  108da0:	e35c0000 	cmp	ip, #0	; 0x0
  108da4:	1affffb8 	bne	108c8c <__fpcmp_parts_d+0x18>
  108da8:	eaffffd3 	b	108cfc <__fpcmp_parts_d+0x88>
  108dac:	e1520000 	cmp	r2, r0
  108db0:	9afffff5 	bls	108d8c <__fpcmp_parts_d+0x118>
  108db4:	eaffffce 	b	108cf4 <__fpcmp_parts_d+0x80>

00108db8 <vApplicationIdleHook>:
  108db8:	e3a034a5 	mov	r3, #-1526726656	; 0xa5000000
  108dbc:	e2833001 	add	r3, r3, #1	; 0x1
  108dc0:	e3e02c02 	mvn	r2, #512	; 0x200
  108dc4:	e50230bf 	str	r3, [r2, #-191]
  108dc8:	e12fff1e 	bx	lr

00108dcc <vResetEnv>:
  108dcc:	e59f0008 	ldr	r0, [pc, #8]	; 108ddc <prog+0x8d98>
  108dd0:	e3a01000 	mov	r1, #0	; 0x0
  108dd4:	e3a02080 	mov	r2, #128	; 0x80
  108dd8:	eaffdfa3 	b	100c6c <memset>
  108ddc:	0020194c 	eoreq	r1, r0, ip, asr #18

00108de0 <mainloop>:
  108de0:	e3a04000 	mov	r4, #0	; 0x0
  108de4:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  108de8:	e3a0200c 	mov	r2, #12	; 0xc
  108dec:	e5834031 	str	r4, [r3, #49]
  108df0:	e2833b03 	add	r3, r3, #3072	; 0xc00
  108df4:	e24dd008 	sub	sp, sp, #8	; 0x8
  108df8:	e50320ef 	str	r2, [r3, #-239]
  108dfc:	eb0001e6 	bl	10959c <led_init>
  108e00:	e1a00004 	mov	r0, r4
  108e04:	eb0001ea 	bl	1095b4 <led_set_green>
  108e08:	eb00020f 	bl	10964c <env_init>
  108e0c:	eb000213 	bl	109660 <env_load>
  108e10:	e1500004 	cmp	r0, r4
  108e14:	0a00000d 	beq	108e50 <mainloop+0x70>
  108e18:	e3a0c002 	mov	ip, #2	; 0x2
  108e1c:	e1a03004 	mov	r3, r4
  108e20:	e59f1030 	ldr	r1, [pc, #48]	; 108e58 <prog+0x8e14>
  108e24:	e3a02c02 	mov	r2, #512	; 0x200
  108e28:	e59f002c 	ldr	r0, [pc, #44]	; 108e5c <prog+0x8e18>
  108e2c:	e58dc000 	str	ip, [sp]
  108e30:	e58d4004 	str	r4, [sp, #4]
  108e34:	eb0007eb 	bl	10ade8 <xTaskCreate>
  108e38:	eb000008 	bl	108e60 <vUSBShellInit>
  108e3c:	eb000050 	bl	108f84 <PtInitProtocol>
  108e40:	e3a00001 	mov	r0, #1	; 0x1
  108e44:	eb0001da 	bl	1095b4 <led_set_green>
  108e48:	eb000875 	bl	10b024 <vTaskStartScheduler>
  108e4c:	eafffffe 	b	108e4c <mainloop+0x6c>
  108e50:	ebffffdd 	bl	108dcc <vResetEnv>
  108e54:	eaffffef 	b	108e18 <mainloop+0x38>
  108e58:	0010c9a0 	andeqs	ip, r0, r0, lsr #19
  108e5c:	0010bc00 	andeqs	fp, r0, r0, lsl #24

00108e60 <vUSBShellInit>:
  108e60:	e52de004 	str	lr, [sp, #-4]!
  108e64:	e3a0c000 	mov	ip, #0	; 0x0
  108e68:	e24dd008 	sub	sp, sp, #8	; 0x8
  108e6c:	e1a0300c 	mov	r3, ip
  108e70:	e59f1018 	ldr	r1, [pc, #24]	; 108e90 <prog+0x8e4c>
  108e74:	e3a02c02 	mov	r2, #512	; 0x200
  108e78:	e59f0014 	ldr	r0, [pc, #20]	; 108e94 <prog+0x8e50>
  108e7c:	e58dc000 	str	ip, [sp]
  108e80:	e58dc004 	str	ip, [sp, #4]
  108e84:	eb0007d7 	bl	10ade8 <xTaskCreate>
  108e88:	e28dd008 	add	sp, sp, #8	; 0x8
  108e8c:	e8bd8000 	ldmia	sp!, {pc}
  108e90:	0010c9a4 	andeqs	ip, r0, r4, lsr #19
  108e94:	00108e98 	muleqs	r0, r8, lr

00108e98 <usbshell_task>:
  108e98:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  108e9c:	e3a06c4e 	mov	r6, #19968	; 0x4e00
  108ea0:	e24dd004 	sub	sp, sp, #4	; 0x4
  108ea4:	e2866020 	add	r6, r6, #32	; 0x20
  108ea8:	e3a05000 	mov	r5, #0	; 0x0
  108eac:	e28d4003 	add	r4, sp, #3	; 0x3
  108eb0:	ea000001 	b	108ebc <usbshell_task+0x24>
  108eb4:	e1550006 	cmp	r5, r6
  108eb8:	0a000025 	beq	108f54 <usbshell_task+0xbc>
  108ebc:	e1a00004 	mov	r0, r4
  108ec0:	e3a01001 	mov	r1, #1	; 0x1
  108ec4:	e3a02064 	mov	r2, #100	; 0x64
  108ec8:	eb000a90 	bl	10b910 <vUSBRecvByte>
  108ecc:	e3500000 	cmp	r0, #0	; 0x0
  108ed0:	e2855001 	add	r5, r5, #1	; 0x1
  108ed4:	0afffff6 	beq	108eb4 <usbshell_task+0x1c>
  108ed8:	e3a05001 	mov	r5, #1	; 0x1
  108edc:	e59f1078 	ldr	r1, [pc, #120]	; 108f5c <prog+0x8f18>
  108ee0:	e3a02008 	mov	r2, #8	; 0x8
  108ee4:	e59f0074 	ldr	r0, [pc, #116]	; 108f60 <prog+0x8f1c>
  108ee8:	ebffdf37 	bl	100bcc <memcpy>
  108eec:	ea000005 	b	108f08 <usbshell_task+0x70>
  108ef0:	e3550001 	cmp	r5, #1	; 0x1
  108ef4:	0a000009 	beq	108f20 <usbshell_task+0x88>
  108ef8:	e59f0064 	ldr	r0, [pc, #100]	; 108f64 <prog+0x8f20>
  108efc:	e59f105c 	ldr	r1, [pc, #92]	; 108f60 <prog+0x8f1c>
  108f00:	eb00012d 	bl	1093bc <printDebug>
  108f04:	e3a05000 	mov	r5, #0	; 0x0
  108f08:	e1a00004 	mov	r0, r4
  108f0c:	e3a01001 	mov	r1, #1	; 0x1
  108f10:	e3a02064 	mov	r2, #100	; 0x64
  108f14:	eb000a7d 	bl	10b910 <vUSBRecvByte>
  108f18:	e3500000 	cmp	r0, #0	; 0x0
  108f1c:	0afffff3 	beq	108ef0 <usbshell_task+0x58>
  108f20:	e1a00004 	mov	r0, r4
  108f24:	e3a01001 	mov	r1, #1	; 0x1
  108f28:	e3a02064 	mov	r2, #100	; 0x64
  108f2c:	eb000a77 	bl	10b910 <vUSBRecvByte>
  108f30:	e3500000 	cmp	r0, #0	; 0x0
  108f34:	0affffef 	beq	108ef8 <usbshell_task+0x60>
  108f38:	e1a00004 	mov	r0, r4
  108f3c:	e3a01001 	mov	r1, #1	; 0x1
  108f40:	e3a02064 	mov	r2, #100	; 0x64
  108f44:	eb000a71 	bl	10b910 <vUSBRecvByte>
  108f48:	e3500000 	cmp	r0, #0	; 0x0
  108f4c:	1afffff3 	bne	108f20 <usbshell_task+0x88>
  108f50:	eaffffe8 	b	108ef8 <usbshell_task+0x60>
  108f54:	e1a05000 	mov	r5, r0
  108f58:	eaffffdf 	b	108edc <usbshell_task+0x44>
  108f5c:	0010c9b0 	ldreqh	ip, [r0], -r0
  108f60:	00201558 	eoreq	r1, r0, r8, asr r5
  108f64:	00200f7c 	eoreq	r0, r0, ip, ror pc

00108f68 <PtSetRfPowerLevel>:
  108f68:	e20000ff 	and	r0, r0, #255	; 0xff
  108f6c:	e59f300c 	ldr	r3, [pc, #12]	; 108f80 <prog+0x8f3c>
  108f70:	e3500003 	cmp	r0, #3	; 0x3
  108f74:	23a00003 	movcs	r0, #3	; 0x3
  108f78:	e5c30000 	strb	r0, [r3]
  108f7c:	e12fff1e 	bx	lr
  108f80:	00200c8a 	eoreq	r0, r0, sl, lsl #25

00108f84 <PtInitProtocol>:
  108f84:	e92d4010 	stmdb	sp!, {r4, lr}
  108f88:	e59fc040 	ldr	ip, [pc, #64]	; 108fd0 <prog+0x8f8c>
  108f8c:	e3a04000 	mov	r4, #0	; 0x0
  108f90:	e58c4000 	str	r4, [ip]
  108f94:	e59fe038 	ldr	lr, [pc, #56]	; 108fd4 <prog+0x8f90>
  108f98:	e59fc038 	ldr	ip, [pc, #56]	; 108fd8 <prog+0x8f94>
  108f9c:	e58e4000 	str	r4, [lr]
  108fa0:	e24dd008 	sub	sp, sp, #8	; 0x8
  108fa4:	e58c4000 	str	r4, [ip]
  108fa8:	e3a0e003 	mov	lr, #3	; 0x3
  108fac:	e1a03004 	mov	r3, r4
  108fb0:	e59f1024 	ldr	r1, [pc, #36]	; 108fdc <prog+0x8f98>
  108fb4:	e3a02c02 	mov	r2, #512	; 0x200
  108fb8:	e59f0020 	ldr	r0, [pc, #32]	; 108fe0 <prog+0x8f9c>
  108fbc:	e58de000 	str	lr, [sp]
  108fc0:	e58d4004 	str	r4, [sp, #4]
  108fc4:	eb000787 	bl	10ade8 <xTaskCreate>
  108fc8:	e28dd008 	add	sp, sp, #8	; 0x8
  108fcc:	e8bd8010 	ldmia	sp!, {r4, pc}
  108fd0:	00201944 	eoreq	r1, r0, r4, asr #18
  108fd4:	00201940 	eoreq	r1, r0, r0, asr #18
  108fd8:	00201948 	eoreq	r1, r0, r8, asr #18
  108fdc:	0010c9b8 	ldreqh	ip, [r0], -r8
  108fe0:	001091c4 	andeqs	r9, r0, r4, asr #3

00108fe4 <PtUpdateWmcuId>:
  108fe4:	e92d4010 	stmdb	sp!, {r4, lr}
  108fe8:	e59f4040 	ldr	r4, [pc, #64]	; 109030 <prog+0x8fec>
  108fec:	e31000ff 	tst	r0, #255	; 0xff
  108ff0:	e59f203c 	ldr	r2, [pc, #60]	; 109034 <prog+0x8ff0>
  108ff4:	05d43010 	ldreqb	r3, [r4, #16]
  108ff8:	e3a01005 	mov	r1, #5	; 0x5
  108ffc:	05c23004 	streqb	r3, [r2, #4]
  109000:	e59f0030 	ldr	r0, [pc, #48]	; 109038 <prog+0x8ff4>
  109004:	03a01005 	moveq	r1, #5	; 0x5
  109008:	01a00002 	moveq	r0, r2
  10900c:	eb00024e 	bl	10994c <nRFAPI_SetTxMAC>
  109010:	e59f3024 	ldr	r3, [pc, #36]	; 10903c <prog+0x8ff8>
  109014:	e5d4c010 	ldrb	ip, [r4, #16]
  109018:	e3a01005 	mov	r1, #5	; 0x5
  10901c:	e3a02001 	mov	r2, #1	; 0x1
  109020:	e1a00003 	mov	r0, r3
  109024:	e5c3c004 	strb	ip, [r3, #4]
  109028:	e8bd4010 	ldmia	sp!, {r4, lr}
  10902c:	ea000228 	b	1098d4 <nRFAPI_SetRxMAC>
  109030:	0020194c 	eoreq	r1, r0, ip, asr #18
  109034:	00200824 	eoreq	r0, r0, r4, lsr #16
  109038:	0010c9d4 	ldreqsb	ip, [r0], -r4
  10903c:	00200829 	eoreq	r0, r0, r9, lsr #16

00109040 <shuffle_tx_byteorder>:
  109040:	e52de004 	str	lr, [sp, #-4]!
  109044:	e251e000 	subs	lr, r1, #0	; 0x0
  109048:	049df004 	ldreq	pc, [sp], #4
  10904c:	e3a0c000 	mov	ip, #0	; 0x0
  109050:	e5903000 	ldr	r3, [r0]
  109054:	e1a02c03 	mov	r2, r3, lsl #24
  109058:	e1a01423 	mov	r1, r3, lsr #8
  10905c:	e1822c23 	orr	r2, r2, r3, lsr #24
  109060:	e2011cff 	and	r1, r1, #65280	; 0xff00
  109064:	e1a03403 	mov	r3, r3, lsl #8
  109068:	e1822001 	orr	r2, r2, r1
  10906c:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
  109070:	e28cc001 	add	ip, ip, #1	; 0x1
  109074:	e1822003 	orr	r2, r2, r3
  109078:	e15c000e 	cmp	ip, lr
  10907c:	e4802004 	str	r2, [r0], #4
  109080:	1afffff2 	bne	109050 <shuffle_tx_byteorder+0x10>
  109084:	e49df004 	ldr	pc, [sp], #4

00109088 <PtInternalTransmit>:
  109088:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10908c:	e59f5120 	ldr	r5, [pc, #288]	; 1091b4 <prog+0x9170>
  109090:	e5953000 	ldr	r3, [r5]
  109094:	e3530000 	cmp	r3, #0	; 0x0
  109098:	e1a04000 	mov	r4, r0
  10909c:	e3a00000 	mov	r0, #0	; 0x0
  1090a0:	08bd8030 	ldmeqia	sp!, {r4, r5, pc}
  1090a4:	eb00039c 	bl	109f1c <nRFCMD_CE>
  1090a8:	e3a00003 	mov	r0, #3	; 0x3
  1090ac:	eb0008ca 	bl	10b3dc <vTaskDelay>
  1090b0:	e3a00000 	mov	r0, #0	; 0x0
  1090b4:	eb0001e0 	bl	10983c <nRFAPI_SetRxMode>
  1090b8:	e5d41001 	ldrb	r1, [r4, #1]
  1090bc:	e5d43000 	ldrb	r3, [r4]
  1090c0:	e3a02801 	mov	r2, #65536	; 0x10000
  1090c4:	e1833401 	orr	r3, r3, r1, lsl #8
  1090c8:	e59f00e8 	ldr	r0, [pc, #232]	; 1091b8 <prog+0x9174>
  1090cc:	e2422001 	sub	r2, r2, #1	; 0x1
  1090d0:	e1530002 	cmp	r3, r2
  1090d4:	e59fc0e0 	ldr	ip, [pc, #224]	; 1091bc <prog+0x9178>
  1090d8:	15903000 	ldrne	r3, [r0]
  1090dc:	059c3000 	ldreq	r3, [ip]
  1090e0:	12833001 	addne	r3, r3, #1	; 0x1
  1090e4:	02833001 	addeq	r3, r3, #1	; 0x1
  1090e8:	15803000 	strne	r3, [r0]
  1090ec:	058c3000 	streq	r3, [ip]
  1090f0:	eb000684 	bl	10ab08 <xTaskGetTickCount>
  1090f4:	e5953000 	ldr	r3, [r5]
  1090f8:	e0800003 	add	r0, r0, r3
  1090fc:	e1a02820 	mov	r2, r0, lsr #16
  109100:	e1a01c20 	mov	r1, r0, lsr #24
  109104:	e1a03420 	mov	r3, r0, lsr #8
  109108:	e5c43017 	strb	r3, [r4, #23]
  10910c:	e5c42018 	strb	r2, [r4, #24]
  109110:	e5c41019 	strb	r1, [r4, #25]
  109114:	e5c40016 	strb	r0, [r4, #22]
  109118:	e3a0101a 	mov	r1, #26	; 0x1a
  10911c:	e1a00004 	mov	r0, r4
  109120:	e59f3098 	ldr	r3, [pc, #152]	; 1091c0 <prog+0x917c>
  109124:	e1a0e00f 	mov	lr, pc
  109128:	e12fff13 	bx	r3
  10912c:	e1a03c00 	mov	r3, r0, lsl #24
  109130:	e1a02420 	mov	r2, r0, lsr #8
  109134:	e1833c20 	orr	r3, r3, r0, lsr #24
  109138:	e2022cff 	and	r2, r2, #65280	; 0xff00
  10913c:	e1a00400 	mov	r0, r0, lsl #8
  109140:	e1833002 	orr	r3, r3, r2
  109144:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
  109148:	e1833000 	orr	r3, r3, r0
  10914c:	e1a00c23 	mov	r0, r3, lsr #24
  109150:	e1a01823 	mov	r1, r3, lsr #16
  109154:	e1a02423 	mov	r2, r3, lsr #8
  109158:	e5c4201b 	strb	r2, [r4, #27]
  10915c:	e5c4301a 	strb	r3, [r4, #26]
  109160:	e5c4101c 	strb	r1, [r4, #28]
  109164:	e5c4001d 	strb	r0, [r4, #29]
  109168:	e3a01007 	mov	r1, #7	; 0x7
  10916c:	e1a00004 	mov	r0, r4
  109170:	ebffffb2 	bl	109040 <shuffle_tx_byteorder>
  109174:	e1a00004 	mov	r0, r4
  109178:	e3a01007 	mov	r1, #7	; 0x7
  10917c:	eb03ddb0 	bl	200844 <xxtea_encode>
  109180:	e1a00004 	mov	r0, r4
  109184:	e3a01007 	mov	r1, #7	; 0x7
  109188:	ebffffac 	bl	109040 <shuffle_tx_byteorder>
  10918c:	e3a0101e 	mov	r1, #30	; 0x1e
  109190:	e1a00004 	mov	r0, r4
  109194:	eb0001c9 	bl	1098c0 <nRFAPI_TX>
  109198:	e3a00001 	mov	r0, #1	; 0x1
  10919c:	eb00035e 	bl	109f1c <nRFCMD_CE>
  1091a0:	e3a00003 	mov	r0, #3	; 0x3
  1091a4:	eb00088c 	bl	10b3dc <vTaskDelay>
  1091a8:	e3a00001 	mov	r0, #1	; 0x1
  1091ac:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  1091b0:	ea0001a1 	b	10983c <nRFAPI_SetRxMode>
  1091b4:	00200c90 	mlaeq	r0, r0, ip, r0
  1091b8:	00201940 	eoreq	r1, r0, r0, asr #18
  1091bc:	00201944 	eoreq	r1, r0, r4, asr #18
  1091c0:	00200adc 	ldreqd	r0, [r0], -ip

001091c4 <vnRFtaskRxTx>:
  1091c4:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1091c8:	e3a00051 	mov	r0, #81	; 0x51
  1091cc:	e59f11c8 	ldr	r1, [pc, #456]	; 10939c <prog+0x9358>
  1091d0:	e3a02005 	mov	r2, #5	; 0x5
  1091d4:	e3a03000 	mov	r3, #0	; 0x0
  1091d8:	eb00020c 	bl	109a10 <nRFAPI_Init>
  1091dc:	e3500000 	cmp	r0, #0	; 0x0
  1091e0:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1091e4:	e59f11b4 	ldr	r1, [pc, #436]	; 1093a0 <prog+0x935c>
  1091e8:	e3a0300a 	mov	r3, #10	; 0xa
  1091ec:	e59f81b0 	ldr	r8, [pc, #432]	; 1093a4 <prog+0x9360>
  1091f0:	e59f71b0 	ldr	r7, [pc, #432]	; 1093a8 <prog+0x9364>
  1091f4:	e3e02000 	mvn	r2, #0	; 0x0
  1091f8:	e5813000 	str	r3, [r1]
  1091fc:	e3a00003 	mov	r0, #3	; 0x3
  109200:	e5c72000 	strb	r2, [r7]
  109204:	e5c82000 	strb	r2, [r8]
  109208:	ebffff56 	bl	108f68 <PtSetRfPowerLevel>
  10920c:	e3a00005 	mov	r0, #5	; 0x5
  109210:	eb000169 	bl	1097bc <nRFAPI_SetSizeMac>
  109214:	e3a00000 	mov	r0, #0	; 0x0
  109218:	e3a0101e 	mov	r1, #30	; 0x1e
  10921c:	eb000156 	bl	10977c <nRFAPI_SetPipeSizeRX>
  109220:	e59f4184 	ldr	r4, [pc, #388]	; 1093ac <prog+0x9368>
  109224:	e3a0101e 	mov	r1, #30	; 0x1e
  109228:	e3a00001 	mov	r0, #1	; 0x1
  10922c:	eb000152 	bl	10977c <nRFAPI_SetPipeSizeRX>
  109230:	e3a00003 	mov	r0, #3	; 0x3
  109234:	eb00016f 	bl	1097f8 <nRFAPI_PipesEnable>
  109238:	e5d42011 	ldrb	r2, [r4, #17]
  10923c:	e5d43010 	ldrb	r3, [r4, #16]
  109240:	e5d40012 	ldrb	r0, [r4, #18]
  109244:	e1833402 	orr	r3, r3, r2, lsl #8
  109248:	e5d41013 	ldrb	r1, [r4, #19]
  10924c:	e1833800 	orr	r3, r3, r0, lsl #16
  109250:	e1931c01 	orrs	r1, r3, r1, lsl #24
  109254:	13a00000 	movne	r0, #0	; 0x0
  109258:	03a00001 	moveq	r0, #1	; 0x1
  10925c:	ebffff60 	bl	108fe4 <PtUpdateWmcuId>
  109260:	e3a00000 	mov	r0, #0	; 0x0
  109264:	eb000174 	bl	10983c <nRFAPI_SetRxMode>
  109268:	e3a00000 	mov	r0, #0	; 0x0
  10926c:	eb00032a 	bl	109f1c <nRFCMD_CE>
  109270:	e3a06000 	mov	r6, #0	; 0x0
  109274:	e59f5134 	ldr	r5, [pc, #308]	; 1093b0 <prog+0x936c>
  109278:	e1a0a006 	mov	sl, r6
  10927c:	e1a0b008 	mov	fp, r8
  109280:	e1a09007 	mov	r9, r7
  109284:	ea00000b 	b	1092b8 <vnRFtaskRxTx+0xf4>
  109288:	e5d43010 	ldrb	r3, [r4, #16]
  10928c:	e5d42011 	ldrb	r2, [r4, #17]
  109290:	e5d40012 	ldrb	r0, [r4, #18]
  109294:	e1833402 	orr	r3, r3, r2, lsl #8
  109298:	e5d41013 	ldrb	r1, [r4, #19]
  10929c:	e1833800 	orr	r3, r3, r0, lsl #16
  1092a0:	e1931c01 	orrs	r1, r3, r1, lsl #24
  1092a4:	1a000016 	bne	109304 <vnRFtaskRxTx+0x140>
  1092a8:	e3a00005 	mov	r0, #5	; 0x5
  1092ac:	eb00084a 	bl	10b3dc <vTaskDelay>
  1092b0:	e3a00070 	mov	r0, #112	; 0x70
  1092b4:	eb000138 	bl	10979c <nRFAPI_ClearIRQ>
  1092b8:	e5d80000 	ldrb	r0, [r8]
  1092bc:	e5d73000 	ldrb	r3, [r7]
  1092c0:	e1530000 	cmp	r3, r0
  1092c4:	0a000002 	beq	1092d4 <vnRFtaskRxTx+0x110>
  1092c8:	eb000153 	bl	10981c <nRFAPI_SetTxPower>
  1092cc:	e5db3000 	ldrb	r3, [fp]
  1092d0:	e5c93000 	strb	r3, [r9]
  1092d4:	eb00015d 	bl	109850 <nRFAPI_GetFifoStatus>
  1092d8:	e3100020 	tst	r0, #32	; 0x20
  1092dc:	0affffe9 	beq	109288 <vnRFtaskRxTx+0xc4>
  1092e0:	eb000166 	bl	109880 <nRFAPI_FlushTX>
  1092e4:	e5d43010 	ldrb	r3, [r4, #16]
  1092e8:	e5d42011 	ldrb	r2, [r4, #17]
  1092ec:	e5d40012 	ldrb	r0, [r4, #18]
  1092f0:	e1833402 	orr	r3, r3, r2, lsl #8
  1092f4:	e5d41013 	ldrb	r1, [r4, #19]
  1092f8:	e1833800 	orr	r3, r3, r0, lsl #16
  1092fc:	e1931c01 	orrs	r1, r3, r1, lsl #24
  109300:	0affffe8 	beq	1092a8 <vnRFtaskRxTx+0xe4>
  109304:	eb0005ff 	bl	10ab08 <xTaskGetTickCount>
  109308:	e06a0000 	rsb	r0, sl, r0
  10930c:	e1560000 	cmp	r6, r0
  109310:	2affffe4 	bcs	1092a8 <vnRFtaskRxTx+0xe4>
  109314:	e3a01000 	mov	r1, #0	; 0x0
  109318:	e3a0201e 	mov	r2, #30	; 0x1e
  10931c:	e59f0090 	ldr	r0, [pc, #144]	; 1093b4 <prog+0x9370>
  109320:	ebffde51 	bl	100c6c <memset>
  109324:	e59f3080 	ldr	r3, [pc, #128]	; 1093ac <prog+0x9368>
  109328:	e59fc084 	ldr	ip, [pc, #132]	; 1093b4 <prog+0x9370>
  10932c:	e5d31010 	ldrb	r1, [r3, #16]
  109330:	e3e02000 	mvn	r2, #0	; 0x0
  109334:	e3a03000 	mov	r3, #0	; 0x0
  109338:	e59f0078 	ldr	r0, [pc, #120]	; 1093b8 <prog+0x9374>
  10933c:	e5cc2001 	strb	r2, [ip, #1]
  109340:	e5cc3003 	strb	r3, [ip, #3]
  109344:	e5cc1002 	strb	r1, [ip, #2]
  109348:	e5cc2000 	strb	r2, [ip]
  10934c:	e5d03000 	ldrb	r3, [r0]
  109350:	e5d02001 	ldrb	r2, [r0, #1]
  109354:	e203300f 	and	r3, r3, #15	; 0xf
  109358:	e2800002 	add	r0, r0, #2	; 0x2
  10935c:	e1833202 	orr	r3, r3, r2, lsl #4
  109360:	e1500005 	cmp	r0, r5
  109364:	e5cc3004 	strb	r3, [ip, #4]
  109368:	e28cc001 	add	ip, ip, #1	; 0x1
  10936c:	1afffff6 	bne	10934c <vnRFtaskRxTx+0x188>
  109370:	e59f003c 	ldr	r0, [pc, #60]	; 1093b4 <prog+0x9370>
  109374:	ebffff43 	bl	109088 <PtInternalTransmit>
  109378:	eb0005e2 	bl	10ab08 <xTaskGetTickCount>
  10937c:	e1a0a000 	mov	sl, r0
  109380:	eb000026 	bl	109420 <RndNumber>
  109384:	e59f3014 	ldr	r3, [pc, #20]	; 1093a0 <prog+0x935c>
  109388:	e5931000 	ldr	r1, [r3]
  10938c:	e1a01081 	mov	r1, r1, lsl #1
  109390:	ebffdbf3 	bl	100364 <__umodsi3>
  109394:	e1a06000 	mov	r6, r0
  109398:	eaffffc2 	b	1092a8 <vnRFtaskRxTx+0xe4>
  10939c:	0010c9d4 	ldreqsb	ip, [r0], -r4
  1093a0:	00200c8c 	eoreq	r0, r0, ip, lsl #25
  1093a4:	00200c8a 	eoreq	r0, r0, sl, lsl #25
  1093a8:	00200c8b 	eoreq	r0, r0, fp, lsl #25
  1093ac:	0020194c 	eoreq	r1, r0, ip, asr #18
  1093b0:	00200cb4 	streqh	r0, [r0], -r4
  1093b4:	00200c6c 	eoreq	r0, r0, ip, ror #24
  1093b8:	00200c94 	mlaeq	r0, r4, ip, r0

001093bc <printDebug>:
  1093bc:	e92d4010 	stmdb	sp!, {r4, lr}
  1093c0:	e3a03003 	mov	r3, #3	; 0x3
  1093c4:	e24dd008 	sub	sp, sp, #8	; 0x8
  1093c8:	e3a04000 	mov	r4, #0	; 0x0
  1093cc:	e58d0004 	str	r0, [sp, #4]
  1093d0:	e5cd3006 	strb	r3, [sp, #6]
  1093d4:	e5cd4005 	strb	r4, [sp, #5]
  1093d8:	e59d0004 	ldr	r0, [sp, #4]
  1093dc:	e2800007 	add	r0, r0, #7	; 0x7
  1093e0:	ebffde49 	bl	100d0c <sprintf>
  1093e4:	e59d0004 	ldr	r0, [sp, #4]
  1093e8:	e2800007 	add	r0, r0, #7	; 0x7
  1093ec:	ebffde7d 	bl	100de8 <strlen>
  1093f0:	e2801004 	add	r1, r0, #4	; 0x4
  1093f4:	e20110ff 	and	r1, r1, #255	; 0xff
  1093f8:	e5cd1004 	strb	r1, [sp, #4]
  1093fc:	e3e0c000 	mvn	ip, #0	; 0x0
  109400:	e1a02004 	mov	r2, r4
  109404:	e59d0004 	ldr	r0, [sp, #4]
  109408:	e2811004 	add	r1, r1, #4	; 0x4
  10940c:	e1a03004 	mov	r3, r4
  109410:	e58dc000 	str	ip, [sp]
  109414:	eb00095f 	bl	10b998 <usb_send_buffer_zero_copy>
  109418:	e28dd008 	add	sp, sp, #8	; 0x8
  10941c:	e8bd8010 	ldmia	sp!, {r4, pc}

00109420 <RndNumber>:
  109420:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  109424:	e59f4054 	ldr	r4, [pc, #84]	; 109480 <prog+0x943c>
  109428:	e59f5054 	ldr	r5, [pc, #84]	; 109484 <prog+0x9440>
  10942c:	e594e000 	ldr	lr, [r4]
  109430:	e3a00801 	mov	r0, #65536	; 0x10000
  109434:	e595c000 	ldr	ip, [r5]
  109438:	e2400001 	sub	r0, r0, #1	; 0x1
  10943c:	e00e3000 	and	r3, lr, r0
  109440:	e0831083 	add	r1, r3, r3, lsl #1
  109444:	e00c0000 	and	r0, ip, r0
  109448:	e0831381 	add	r1, r3, r1, lsl #7
  10944c:	e0802100 	add	r2, r0, r0, lsl #2
  109450:	e0831201 	add	r1, r3, r1, lsl #4
  109454:	e0822382 	add	r2, r2, r2, lsl #7
  109458:	e0833081 	add	r3, r3, r1, lsl #1
  10945c:	e0800202 	add	r0, r0, r2, lsl #4
  109460:	e0633103 	rsb	r3, r3, r3, lsl #2
  109464:	e0600100 	rsb	r0, r0, r0, lsl #2
  109468:	e083382e 	add	r3, r3, lr, lsr #16
  10946c:	e080082c 	add	r0, r0, ip, lsr #16
  109470:	e5850000 	str	r0, [r5]
  109474:	e0200803 	eor	r0, r0, r3, lsl #16
  109478:	e5843000 	str	r3, [r4]
  10947c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  109480:	00200830 	eoreq	r0, r0, r0, lsr r8
  109484:	00200834 	eoreq	r0, r0, r4, lsr r8

00109488 <_close_r>:
  109488:	e3a00000 	mov	r0, #0	; 0x0
  10948c:	e12fff1e 	bx	lr

00109490 <_lseek_r>:
  109490:	e3a00000 	mov	r0, #0	; 0x0
  109494:	e12fff1e 	bx	lr

00109498 <_fstat_r>:
  109498:	e3a03a02 	mov	r3, #8192	; 0x2000
  10949c:	e3a00000 	mov	r0, #0	; 0x0
  1094a0:	e5823004 	str	r3, [r2, #4]
  1094a4:	e12fff1e 	bx	lr

001094a8 <_sbrk_r>:
  1094a8:	e59f2018 	ldr	r2, [pc, #24]	; 1094c8 <prog+0x9484>
  1094ac:	e5920000 	ldr	r0, [r2]
  1094b0:	e3500000 	cmp	r0, #0	; 0x0
  1094b4:	059f0010 	ldreq	r0, [pc, #16]	; 1094cc <prog+0x9488>
  1094b8:	e0803001 	add	r3, r0, r1
  1094bc:	05820000 	streq	r0, [r2]
  1094c0:	e5823000 	str	r3, [r2]
  1094c4:	e12fff1e 	bx	lr
  1094c8:	00200cb4 	streqh	r0, [r0], -r4
  1094cc:	002019d8 	ldreqd	r1, [r0], -r8

001094d0 <my_putc>:
  1094d0:	e20000ff 	and	r0, r0, #255	; 0xff
  1094d4:	ea00093f 	b	10b9d8 <vUSBSendByte>

001094d8 <_write_r>:
  1094d8:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  1094dc:	e2536000 	subs	r6, r3, #0	; 0x0
  1094e0:	e1a05002 	mov	r5, r2
  1094e4:	0a000011 	beq	109530 <_write_r+0x58>
  1094e8:	e3a04000 	mov	r4, #0	; 0x0
  1094ec:	ea000004 	b	109504 <_write_r+0x2c>
  1094f0:	e1a00003 	mov	r0, r3
  1094f4:	e2844001 	add	r4, r4, #1	; 0x1
  1094f8:	ebfffff4 	bl	1094d0 <my_putc>
  1094fc:	e1560004 	cmp	r6, r4
  109500:	0a00000a 	beq	109530 <_write_r+0x58>
  109504:	e7d43005 	ldrb	r3, [r4, r5]
  109508:	e353000a 	cmp	r3, #10	; 0xa
  10950c:	e3a0000d 	mov	r0, #13	; 0xd
  109510:	1afffff6 	bne	1094f0 <_write_r+0x18>
  109514:	ebffffed 	bl	1094d0 <my_putc>
  109518:	e7d43005 	ldrb	r3, [r4, r5]
  10951c:	e2844001 	add	r4, r4, #1	; 0x1
  109520:	e1a00003 	mov	r0, r3
  109524:	ebffffe9 	bl	1094d0 <my_putc>
  109528:	e1560004 	cmp	r6, r4
  10952c:	1afffff4 	bne	109504 <_write_r+0x2c>
  109530:	e1a00006 	mov	r0, r6
  109534:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

00109538 <_read_r>:
  109538:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10953c:	e2535000 	subs	r5, r3, #0	; 0x0
  109540:	e24dd004 	sub	sp, sp, #4	; 0x4
  109544:	e1a06002 	mov	r6, r2
  109548:	01a04005 	moveq	r4, r5
  10954c:	0a00000f 	beq	109590 <_read_r+0x58>
  109550:	e3a04000 	mov	r4, #0	; 0x0
  109554:	e28d7003 	add	r7, sp, #3	; 0x3
  109558:	ea000003 	b	10956c <_read_r+0x34>
  10955c:	e7c40006 	strb	r0, [r4, r6]
  109560:	e2844001 	add	r4, r4, #1	; 0x1
  109564:	e1550004 	cmp	r5, r4
  109568:	0a000008 	beq	109590 <_read_r+0x58>
  10956c:	e1a00007 	mov	r0, r7
  109570:	e3a01001 	mov	r1, #1	; 0x1
  109574:	e3e02000 	mvn	r2, #0	; 0x0
  109578:	eb0008e4 	bl	10b910 <vUSBRecvByte>
  10957c:	e20000ff 	and	r0, r0, #255	; 0xff
  109580:	e350000d 	cmp	r0, #13	; 0xd
  109584:	1afffff4 	bne	10955c <_read_r+0x24>
  109588:	e3a03000 	mov	r3, #0	; 0x0
  10958c:	e7c63004 	strb	r3, [r6, r4]
  109590:	e0640005 	rsb	r0, r4, r5
  109594:	e28dd004 	add	sp, sp, #4	; 0x4
  109598:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

0010959c <led_init>:
  10959c:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  1095a0:	e3a03501 	mov	r3, #4194304	; 0x400000
  1095a4:	e50230ff 	str	r3, [r2, #-255]
  1095a8:	e50230ef 	str	r3, [r2, #-239]
  1095ac:	e50230cf 	str	r3, [r2, #-207]
  1095b0:	e12fff1e 	bx	lr

001095b4 <led_set_green>:
  1095b4:	e31000ff 	tst	r0, #255	; 0xff
  1095b8:	13a02501 	movne	r2, #4194304	; 0x400000
  1095bc:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  1095c0:	03a02501 	moveq	r2, #4194304	; 0x400000
  1095c4:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  1095c8:	150320cb 	strne	r2, [r3, #-203]
  1095cc:	050320cf 	streq	r2, [r3, #-207]
  1095d0:	e12fff1e 	bx	lr

001095d4 <env_crc16>:
  1095d4:	e3500000 	cmp	r0, #0	; 0x0
  1095d8:	13510000 	cmpne	r1, #0	; 0x0
  1095dc:	e52de004 	str	lr, [sp, #-4]!
  1095e0:	e1a0e000 	mov	lr, r0
  1095e4:	0a000015 	beq	109640 <env_crc16+0x6c>
  1095e8:	e3510000 	cmp	r1, #0	; 0x0
  1095ec:	0a000013 	beq	109640 <env_crc16+0x6c>
  1095f0:	e3a00801 	mov	r0, #65536	; 0x10000
  1095f4:	e2400001 	sub	r0, r0, #1	; 0x1
  1095f8:	e3a0c000 	mov	ip, #0	; 0x0
  1095fc:	e7dc200e 	ldrb	r2, [ip, lr]
  109600:	e1a03400 	mov	r3, r0, lsl #8
  109604:	e1833420 	orr	r3, r3, r0, lsr #8
  109608:	e0233002 	eor	r3, r3, r2
  10960c:	e1a03803 	mov	r3, r3, lsl #16
  109610:	e1a03823 	mov	r3, r3, lsr #16
  109614:	e20320ff 	and	r2, r3, #255	; 0xff
  109618:	e0233222 	eor	r3, r3, r2, lsr #4
  10961c:	e0233603 	eor	r3, r3, r3, lsl #12
  109620:	e1a03803 	mov	r3, r3, lsl #16
  109624:	e1a03823 	mov	r3, r3, lsr #16
  109628:	e28cc001 	add	ip, ip, #1	; 0x1
  10962c:	e20320ff 	and	r2, r3, #255	; 0xff
  109630:	e15c0001 	cmp	ip, r1
  109634:	e0230282 	eor	r0, r3, r2, lsl #5
  109638:	1affffef 	bne	1095fc <env_crc16+0x28>
  10963c:	e49df004 	ldr	pc, [sp], #4
  109640:	e3a00801 	mov	r0, #65536	; 0x10000
  109644:	e2400001 	sub	r0, r0, #1	; 0x1
  109648:	e49df004 	ldr	pc, [sp], #4

0010964c <env_init>:
  10964c:	e3a03831 	mov	r3, #3211264	; 0x310000
  109650:	e2833c03 	add	r3, r3, #768	; 0x300
  109654:	e3e02000 	mvn	r2, #0	; 0x0
  109658:	e502309f 	str	r3, [r2, #-159]
  10965c:	e12fff1e 	bx	lr

00109660 <env_load>:
  109660:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  109664:	e59f50b8 	ldr	r5, [pc, #184]	; 109724 <prog+0x96e0>
  109668:	e3a0194f 	mov	r1, #1294336	; 0x13c000
  10966c:	e2811a03 	add	r1, r1, #12288	; 0x3000
  109670:	e3a02080 	mov	r2, #128	; 0x80
  109674:	e1a00005 	mov	r0, r5
  109678:	ebffdd53 	bl	100bcc <memcpy>
  10967c:	e5d52001 	ldrb	r2, [r5, #1]
  109680:	e5d53000 	ldrb	r3, [r5]
  109684:	e5d51002 	ldrb	r1, [r5, #2]
  109688:	e1833402 	orr	r3, r3, r2, lsl #8
  10968c:	e5d50003 	ldrb	r0, [r5, #3]
  109690:	e3e024f3 	mvn	r2, #-218103808	; 0xf3000000
  109694:	e1833801 	orr	r3, r3, r1, lsl #16
  109698:	e24229cd 	sub	r2, r2, #3358720	; 0x334000
  10969c:	e1833c00 	orr	r3, r3, r0, lsl #24
  1096a0:	e2422e11 	sub	r2, r2, #272	; 0x110
  1096a4:	e1530002 	cmp	r3, r2
  1096a8:	0a000001 	beq	1096b4 <env_load+0x54>
  1096ac:	e3a00000 	mov	r0, #0	; 0x0
  1096b0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1096b4:	e5d53004 	ldrb	r3, [r5, #4]
  1096b8:	e5d52005 	ldrb	r2, [r5, #5]
  1096bc:	e5d5c006 	ldrb	ip, [r5, #6]
  1096c0:	e5d51007 	ldrb	r1, [r5, #7]
  1096c4:	e1833402 	orr	r3, r3, r2, lsl #8
  1096c8:	e183380c 	orr	r3, r3, ip, lsl #16
  1096cc:	e1833c01 	orr	r3, r3, r1, lsl #24
  1096d0:	e3530080 	cmp	r3, #128	; 0x80
  1096d4:	e1a00005 	mov	r0, r5
  1096d8:	e3a0e000 	mov	lr, #0	; 0x0
  1096dc:	e1a01003 	mov	r1, r3
  1096e0:	1afffff1 	bne	1096ac <env_load+0x4c>
  1096e4:	e5d54008 	ldrb	r4, [r5, #8]
  1096e8:	e5d53009 	ldrb	r3, [r5, #9]
  1096ec:	e5d5200a 	ldrb	r2, [r5, #10]
  1096f0:	e5d5c00b 	ldrb	ip, [r5, #11]
  1096f4:	e1844403 	orr	r4, r4, r3, lsl #8
  1096f8:	e1844802 	orr	r4, r4, r2, lsl #16
  1096fc:	e1844c0c 	orr	r4, r4, ip, lsl #24
  109700:	e5c5e00b 	strb	lr, [r5, #11]
  109704:	e5c5e008 	strb	lr, [r5, #8]
  109708:	e5c5e009 	strb	lr, [r5, #9]
  10970c:	e5c5e00a 	strb	lr, [r5, #10]
  109710:	ebffffaf 	bl	1095d4 <env_crc16>
  109714:	e1540000 	cmp	r4, r0
  109718:	13a00000 	movne	r0, #0	; 0x0
  10971c:	03a00001 	moveq	r0, #1	; 0x1
  109720:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  109724:	0020194c 	eoreq	r1, r0, ip, asr #18

00109728 <nRFAPI_SetFeatures>:
  109728:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  10972c:	e24dd004 	sub	sp, sp, #4	; 0x4
  109730:	e28d4002 	add	r4, sp, #2	; 0x2
  109734:	e3a06002 	mov	r6, #2	; 0x2
  109738:	e1a02006 	mov	r2, r6
  10973c:	e1a05000 	mov	r5, r0
  109740:	e59f102c 	ldr	r1, [pc, #44]	; 109774 <prog+0x9730>
  109744:	e1a00004 	mov	r0, r4
  109748:	ebffdd1f 	bl	100bcc <memcpy>
  10974c:	e20550ff 	and	r5, r5, #255	; 0xff
  109750:	e1a01004 	mov	r1, r4
  109754:	e1a02006 	mov	r2, r6
  109758:	e59f0018 	ldr	r0, [pc, #24]	; 109778 <prog+0x9734>
  10975c:	eb000185 	bl	109d78 <nRFCMD_ReadWriteBuffer>
  109760:	e1a01005 	mov	r1, r5
  109764:	e3a0001d 	mov	r0, #29	; 0x1d
  109768:	eb0001c6 	bl	109e88 <nRFCMD_RegWriteStatusRead>
  10976c:	e28dd004 	add	sp, sp, #4	; 0x4
  109770:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109774:	0010cde3 	andeqs	ip, r0, r3, ror #27
  109778:	0010cde1 	andeqs	ip, r0, r1, ror #27

0010977c <nRFAPI_SetPipeSizeRX>:
  10977c:	e20030ff 	and	r3, r0, #255	; 0xff
  109780:	e2830011 	add	r0, r3, #17	; 0x11
  109784:	e3800020 	orr	r0, r0, #32	; 0x20
  109788:	e3530005 	cmp	r3, #5	; 0x5
  10978c:	e20000ff 	and	r0, r0, #255	; 0xff
  109790:	e20110ff 	and	r1, r1, #255	; 0xff
  109794:	812fff1e 	bxhi	lr
  109798:	ea0001ba 	b	109e88 <nRFCMD_RegWriteStatusRead>

0010979c <nRFAPI_ClearIRQ>:
  10979c:	e2001070 	and	r1, r0, #112	; 0x70
  1097a0:	e52de004 	str	lr, [sp, #-4]!
  1097a4:	e3a00027 	mov	r0, #39	; 0x27
  1097a8:	eb0001b6 	bl	109e88 <nRFCMD_RegWriteStatusRead>
  1097ac:	e49df004 	ldr	pc, [sp], #4

001097b0 <nRFAPI_SetChannel>:
  1097b0:	e200107f 	and	r1, r0, #127	; 0x7f
  1097b4:	e3a00025 	mov	r0, #37	; 0x25
  1097b8:	ea0001b2 	b	109e88 <nRFCMD_RegWriteStatusRead>

001097bc <nRFAPI_SetSizeMac>:
  1097bc:	e20000ff 	and	r0, r0, #255	; 0xff
  1097c0:	e2403003 	sub	r3, r0, #3	; 0x3
  1097c4:	e3530002 	cmp	r3, #2	; 0x2
  1097c8:	e2400002 	sub	r0, r0, #2	; 0x2
  1097cc:	e92d4010 	stmdb	sp!, {r4, lr}
  1097d0:	e3a04000 	mov	r4, #0	; 0x0
  1097d4:	920040ff 	andls	r4, r0, #255	; 0xff
  1097d8:	e1a01004 	mov	r1, r4
  1097dc:	e3a00023 	mov	r0, #35	; 0x23
  1097e0:	eb0001a8 	bl	109e88 <nRFCMD_RegWriteStatusRead>
  1097e4:	e1a00004 	mov	r0, r4
  1097e8:	e8bd8010 	ldmia	sp!, {r4, pc}

001097ec <nRFAPI_PipesAck>:
  1097ec:	e200103f 	and	r1, r0, #63	; 0x3f
  1097f0:	e3a00021 	mov	r0, #33	; 0x21
  1097f4:	ea0001a3 	b	109e88 <nRFCMD_RegWriteStatusRead>

001097f8 <nRFAPI_PipesEnable>:
  1097f8:	e200103f 	and	r1, r0, #63	; 0x3f
  1097fc:	e3a00022 	mov	r0, #34	; 0x22
  109800:	ea0001a0 	b	109e88 <nRFCMD_RegWriteStatusRead>

00109804 <nRFAPI_TxRetries>:
  109804:	e20010ff 	and	r1, r0, #255	; 0xff
  109808:	e351000f 	cmp	r1, #15	; 0xf
  10980c:	23a0100f 	movcs	r1, #15	; 0xf
  109810:	e3811010 	orr	r1, r1, #16	; 0x10
  109814:	e3a00024 	mov	r0, #36	; 0x24
  109818:	ea00019a 	b	109e88 <nRFCMD_RegWriteStatusRead>

0010981c <nRFAPI_SetTxPower>:
  10981c:	e20010ff 	and	r1, r0, #255	; 0xff
  109820:	e3510003 	cmp	r1, #3	; 0x3
  109824:	23a01003 	movcs	r1, #3	; 0x3
  109828:	e1a01081 	mov	r1, r1, lsl #1
  10982c:	e20110fe 	and	r1, r1, #254	; 0xfe
  109830:	e3811009 	orr	r1, r1, #9	; 0x9
  109834:	e3a00026 	mov	r0, #38	; 0x26
  109838:	ea000192 	b	109e88 <nRFCMD_RegWriteStatusRead>

0010983c <nRFAPI_SetRxMode>:
  10983c:	e31000ff 	tst	r0, #255	; 0xff
  109840:	03a0103a 	moveq	r1, #58	; 0x3a
  109844:	13a0103b 	movne	r1, #59	; 0x3b
  109848:	e3a00020 	mov	r0, #32	; 0x20
  10984c:	ea00018d 	b	109e88 <nRFCMD_RegWriteStatusRead>

00109850 <nRFAPI_GetFifoStatus>:
  109850:	e52de004 	str	lr, [sp, #-4]!
  109854:	e3a00017 	mov	r0, #23	; 0x17
  109858:	eb000196 	bl	109eb8 <nRFCMD_RegRead>
  10985c:	e49df004 	ldr	pc, [sp], #4

00109860 <nRFAPI_GetSizeMac>:
  109860:	e52de004 	str	lr, [sp, #-4]!
  109864:	e3a00003 	mov	r0, #3	; 0x3
  109868:	eb000192 	bl	109eb8 <nRFCMD_RegRead>
  10986c:	e2100003 	ands	r0, r0, #3	; 0x3
  109870:	e1a03000 	mov	r3, r0
  109874:	12803002 	addne	r3, r0, #2	; 0x2
  109878:	e1a00003 	mov	r0, r3
  10987c:	e49df004 	ldr	pc, [sp], #4

00109880 <nRFAPI_FlushTX>:
  109880:	e3a000e1 	mov	r0, #225	; 0xe1
  109884:	ea000199 	b	109ef0 <nRFCMD_CmdExec>

00109888 <nRFAPI_FlushRX>:
  109888:	e3a000e2 	mov	r0, #226	; 0xe2
  10988c:	ea000197 	b	109ef0 <nRFCMD_CmdExec>

00109890 <nRFAPI_GetStatus>:
  109890:	e52de004 	str	lr, [sp, #-4]!
  109894:	e3a000ff 	mov	r0, #255	; 0xff
  109898:	eb000194 	bl	109ef0 <nRFCMD_CmdExec>
  10989c:	e49df004 	ldr	pc, [sp], #4

001098a0 <nRFAPI_GetTxMAC>:
  1098a0:	e20110ff 	and	r1, r1, #255	; 0xff
  1098a4:	e1a02001 	mov	r2, r1
  1098a8:	e2411003 	sub	r1, r1, #3	; 0x3
  1098ac:	e3510002 	cmp	r1, #2	; 0x2
  1098b0:	e1a01000 	mov	r1, r0
  1098b4:	e3a00010 	mov	r0, #16	; 0x10
  1098b8:	812fff1e 	bxhi	lr
  1098bc:	ea00014e 	b	109dfc <nRFCMD_RegReadBuf>

001098c0 <nRFAPI_TX>:
  1098c0:	e1a02001 	mov	r2, r1
  1098c4:	e20220ff 	and	r2, r2, #255	; 0xff
  1098c8:	e1a01000 	mov	r1, r0
  1098cc:	e3a000a0 	mov	r0, #160	; 0xa0
  1098d0:	ea00015b 	b	109e44 <nRFCMD_RegWriteBuf>

001098d4 <nRFAPI_SetRxMAC>:
  1098d4:	e1a03002 	mov	r3, r2
  1098d8:	e92d4010 	stmdb	sp!, {r4, lr}
  1098dc:	e201e0ff 	and	lr, r1, #255	; 0xff
  1098e0:	e20340ff 	and	r4, r3, #255	; 0xff
  1098e4:	e3540001 	cmp	r4, #1	; 0x1
  1098e8:	83a03000 	movhi	r3, #0	; 0x0
  1098ec:	93a03001 	movls	r3, #1	; 0x1
  1098f0:	e284c00a 	add	ip, r4, #10	; 0xa
  1098f4:	e35e0002 	cmp	lr, #2	; 0x2
  1098f8:	e38cc020 	orr	ip, ip, #32	; 0x20
  1098fc:	93a03000 	movls	r3, #0	; 0x0
  109900:	e20cc0ff 	and	ip, ip, #255	; 0xff
  109904:	e3530000 	cmp	r3, #0	; 0x0
  109908:	e1a01000 	mov	r1, r0
  10990c:	e1a0200e 	mov	r2, lr
  109910:	e1a0000c 	mov	r0, ip
  109914:	0a000001 	beq	109920 <nRFAPI_SetRxMAC+0x4c>
  109918:	e35e0005 	cmp	lr, #5	; 0x5
  10991c:	9a000008 	bls	109944 <nRFAPI_SetRxMAC+0x70>
  109920:	e35e0001 	cmp	lr, #1	; 0x1
  109924:	13a03000 	movne	r3, #0	; 0x0
  109928:	03a03001 	moveq	r3, #1	; 0x1
  10992c:	e3540001 	cmp	r4, #1	; 0x1
  109930:	93a03000 	movls	r3, #0	; 0x0
  109934:	e3530000 	cmp	r3, #0	; 0x0
  109938:	08bd8010 	ldmeqia	sp!, {r4, pc}
  10993c:	e3540005 	cmp	r4, #5	; 0x5
  109940:	88bd8010 	ldmhiia	sp!, {r4, pc}
  109944:	e8bd4010 	ldmia	sp!, {r4, lr}
  109948:	ea00013d 	b	109e44 <nRFCMD_RegWriteBuf>

0010994c <nRFAPI_SetTxMAC>:
  10994c:	e20110ff 	and	r1, r1, #255	; 0xff
  109950:	e1a02001 	mov	r2, r1
  109954:	e2411003 	sub	r1, r1, #3	; 0x3
  109958:	e3510002 	cmp	r1, #2	; 0x2
  10995c:	e1a01000 	mov	r1, r0
  109960:	e3a00030 	mov	r0, #48	; 0x30
  109964:	812fff1e 	bxhi	lr
  109968:	ea000135 	b	109e44 <nRFCMD_RegWriteBuf>

0010996c <nRFAPI_DetectChip>:
  10996c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  109970:	e24dd008 	sub	sp, sp, #8	; 0x8
  109974:	ebffffc5 	bl	109890 <nRFAPI_GetStatus>
  109978:	e3a00003 	mov	r0, #3	; 0x3
  10997c:	ebffff8e 	bl	1097bc <nRFAPI_SetSizeMac>
  109980:	ebffffb6 	bl	109860 <nRFAPI_GetSizeMac>
  109984:	e3500003 	cmp	r0, #3	; 0x3
  109988:	0a000002 	beq	109998 <nRFAPI_DetectChip+0x2c>
  10998c:	e3a00000 	mov	r0, #0	; 0x0
  109990:	e28dd008 	add	sp, sp, #8	; 0x8
  109994:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109998:	e2800002 	add	r0, r0, #2	; 0x2
  10999c:	ebffff86 	bl	1097bc <nRFAPI_SetSizeMac>
  1099a0:	ebffffae 	bl	109860 <nRFAPI_GetSizeMac>
  1099a4:	e3500005 	cmp	r0, #5	; 0x5
  1099a8:	e1a04000 	mov	r4, r0
  1099ac:	1afffff6 	bne	10998c <nRFAPI_DetectChip+0x20>
  1099b0:	e59f6054 	ldr	r6, [pc, #84]	; 109a0c <prog+0x99c8>
  1099b4:	e1a01000 	mov	r1, r0
  1099b8:	e28d5003 	add	r5, sp, #3	; 0x3
  1099bc:	e1a00006 	mov	r0, r6
  1099c0:	ebffffe1 	bl	10994c <nRFAPI_SetTxMAC>
  1099c4:	e1a01004 	mov	r1, r4
  1099c8:	e1a00005 	mov	r0, r5
  1099cc:	e2444005 	sub	r4, r4, #5	; 0x5
  1099d0:	e5cd4003 	strb	r4, [sp, #3]
  1099d4:	e5cd4004 	strb	r4, [sp, #4]
  1099d8:	e5cd4005 	strb	r4, [sp, #5]
  1099dc:	e5cd4006 	strb	r4, [sp, #6]
  1099e0:	e5cd4007 	strb	r4, [sp, #7]
  1099e4:	ebffffad 	bl	1098a0 <nRFAPI_GetTxMAC>
  1099e8:	e7d42005 	ldrb	r2, [r4, r5]
  1099ec:	e7d43006 	ldrb	r3, [r4, r6]
  1099f0:	e1520003 	cmp	r2, r3
  1099f4:	e2844001 	add	r4, r4, #1	; 0x1
  1099f8:	1affffe3 	bne	10998c <nRFAPI_DetectChip+0x20>
  1099fc:	e3540005 	cmp	r4, #5	; 0x5
  109a00:	1afffff8 	bne	1099e8 <nRFAPI_DetectChip+0x7c>
  109a04:	e3a00001 	mov	r0, #1	; 0x1
  109a08:	eaffffe0 	b	109990 <nRFAPI_DetectChip+0x24>
  109a0c:	0010cddc 	ldreqsb	ip, [r0], -ip

00109a10 <nRFAPI_Init>:
  109a10:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  109a14:	e20240ff 	and	r4, r2, #255	; 0xff
  109a18:	e20370ff 	and	r7, r3, #255	; 0xff
  109a1c:	e1a05001 	mov	r5, r1
  109a20:	e20060ff 	and	r6, r0, #255	; 0xff
  109a24:	eb00002d 	bl	109ae0 <nRFCMD_Init>
  109a28:	e2443003 	sub	r3, r4, #3	; 0x3
  109a2c:	e3530002 	cmp	r3, #2	; 0x2
  109a30:	9a000001 	bls	109a3c <nRFAPI_Init+0x2c>
  109a34:	e3a00000 	mov	r0, #0	; 0x0
  109a38:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  109a3c:	ebffffca 	bl	10996c <nRFAPI_DetectChip>
  109a40:	e3500000 	cmp	r0, #0	; 0x0
  109a44:	0afffffa 	beq	109a34 <nRFAPI_Init+0x24>
  109a48:	e1a00004 	mov	r0, r4
  109a4c:	ebffff5a 	bl	1097bc <nRFAPI_SetSizeMac>
  109a50:	e1a01004 	mov	r1, r4
  109a54:	e1a00005 	mov	r0, r5
  109a58:	ebffffbb 	bl	10994c <nRFAPI_SetTxMAC>
  109a5c:	e1a01004 	mov	r1, r4
  109a60:	e3a02000 	mov	r2, #0	; 0x0
  109a64:	e1a00005 	mov	r0, r5
  109a68:	ebffff99 	bl	1098d4 <nRFAPI_SetRxMAC>
  109a6c:	e3a00001 	mov	r0, #1	; 0x1
  109a70:	ebffff60 	bl	1097f8 <nRFAPI_PipesEnable>
  109a74:	e3a00000 	mov	r0, #0	; 0x0
  109a78:	ebffff5b 	bl	1097ec <nRFAPI_PipesAck>
  109a7c:	e3a04000 	mov	r4, #0	; 0x0
  109a80:	e1a00004 	mov	r0, r4
  109a84:	e3a01002 	mov	r1, #2	; 0x2
  109a88:	e2844001 	add	r4, r4, #1	; 0x1
  109a8c:	ebffff3a 	bl	10977c <nRFAPI_SetPipeSizeRX>
  109a90:	e3540006 	cmp	r4, #6	; 0x6
  109a94:	1afffff9 	bne	109a80 <nRFAPI_Init+0x70>
  109a98:	e3a00000 	mov	r0, #0	; 0x0
  109a9c:	ebffff58 	bl	109804 <nRFAPI_TxRetries>
  109aa0:	e1a00006 	mov	r0, r6
  109aa4:	ebffff41 	bl	1097b0 <nRFAPI_SetChannel>
  109aa8:	e3a00003 	mov	r0, #3	; 0x3
  109aac:	ebffff5a 	bl	10981c <nRFAPI_SetTxPower>
  109ab0:	ebffff74 	bl	109888 <nRFAPI_FlushRX>
  109ab4:	ebffff71 	bl	109880 <nRFAPI_FlushTX>
  109ab8:	e3a00000 	mov	r0, #0	; 0x0
  109abc:	ebffff5e 	bl	10983c <nRFAPI_SetRxMode>
  109ac0:	e3570000 	cmp	r7, #0	; 0x0
  109ac4:	1a000001 	bne	109ad0 <nRFAPI_Init+0xc0>
  109ac8:	e3a00001 	mov	r0, #1	; 0x1
  109acc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  109ad0:	e1a00007 	mov	r0, r7
  109ad4:	ebffff13 	bl	109728 <nRFAPI_SetFeatures>
  109ad8:	e3a00001 	mov	r0, #1	; 0x1
  109adc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00109ae0 <nRFCMD_Init>:
  109ae0:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  109ae4:	e59f3154 	ldr	r3, [pc, #340]	; 109c40 <prog+0x9bfc>
  109ae8:	e59f2154 	ldr	r2, [pc, #340]	; 109c44 <prog+0x9c00>
  109aec:	e3a05000 	mov	r5, #0	; 0x0
  109af0:	e1a01005 	mov	r1, r5
  109af4:	e5835000 	str	r5, [r3]
  109af8:	e5825000 	str	r5, [r2]
  109afc:	e24dd004 	sub	sp, sp, #4	; 0x4
  109b00:	e3a00001 	mov	r0, #1	; 0x1
  109b04:	eb000370 	bl	10a8cc <xQueueCreate>
  109b08:	e59f6138 	ldr	r6, [pc, #312]	; 109c48 <prog+0x9c04>
  109b0c:	e1500005 	cmp	r0, r5
  109b10:	e59f4134 	ldr	r4, [pc, #308]	; 109c4c <prog+0x9c08>
  109b14:	e1a02005 	mov	r2, r5
  109b18:	e1a03005 	mov	r3, r5
  109b1c:	e1a01005 	mov	r1, r5
  109b20:	e5860000 	str	r0, [r6]
  109b24:	1b00030e 	blne	10a764 <xQueueGenericSend>
  109b28:	e1a01005 	mov	r1, r5
  109b2c:	e3a00001 	mov	r0, #1	; 0x1
  109b30:	eb000365 	bl	10a8cc <xQueueCreate>
  109b34:	e3500000 	cmp	r0, #0	; 0x0
  109b38:	e1a01005 	mov	r1, r5
  109b3c:	e1a02005 	mov	r2, r5
  109b40:	e1a03005 	mov	r3, r5
  109b44:	e5840000 	str	r0, [r4]
  109b48:	1b000305 	blne	10a764 <xQueueGenericSend>
  109b4c:	e5960000 	ldr	r0, [r6]
  109b50:	e3500000 	cmp	r0, #0	; 0x0
  109b54:	0a000037 	beq	109c38 <nRFCMD_Init+0x158>
  109b58:	e594c000 	ldr	ip, [r4]
  109b5c:	e35c0000 	cmp	ip, #0	; 0x0
  109b60:	e1a01005 	mov	r1, r5
  109b64:	e1a02005 	mov	r2, r5
  109b68:	e1a03005 	mov	r3, r5
  109b6c:	e3e06c0b 	mvn	r6, #2816	; 0xb00
  109b70:	e3a08020 	mov	r8, #32	; 0x20
  109b74:	e3a0a702 	mov	sl, #524288	; 0x80000
  109b78:	e3e07b7f 	mvn	r7, #130048	; 0x1fc00
  109b7c:	0a00002d 	beq	109c38 <nRFCMD_Init+0x158>
  109b80:	eb000291 	bl	10a5cc <xQueueGenericReceive>
  109b84:	e5940000 	ldr	r0, [r4]
  109b88:	e1a01005 	mov	r1, r5
  109b8c:	e1a02005 	mov	r2, r5
  109b90:	e1a03005 	mov	r3, r5
  109b94:	eb00028c 	bl	10a5cc <xQueueGenericReceive>
  109b98:	e3a02402 	mov	r2, #33554432	; 0x2000000
  109b9c:	e3a01b1e 	mov	r1, #30720	; 0x7800
  109ba0:	e3e03c03 	mvn	r3, #768	; 0x300
  109ba4:	e50380ef 	str	r8, [r3, #-239]
  109ba8:	e506108f 	str	r1, [r6, #-143]
  109bac:	e506508b 	str	r5, [r6, #-139]
  109bb0:	e50610fb 	str	r1, [r6, #-251]
  109bb4:	e506a0eb 	str	sl, [r6, #-235]
  109bb8:	e506a0ff 	str	sl, [r6, #-255]
  109bbc:	e50620cb 	str	r2, [r6, #-203]
  109bc0:	e50620ff 	str	r2, [r6, #-255]
  109bc4:	e50620ef 	str	r2, [r6, #-239]
  109bc8:	eb0006c3 	bl	10b6dc <vPortEnterCritical>
  109bcc:	e3a0cc06 	mov	ip, #1536	; 0x600
  109bd0:	e28cc002 	add	ip, ip, #2	; 0x2
  109bd4:	e3a04001 	mov	r4, #1	; 0x1
  109bd8:	e50743fb 	str	r4, [r7, #-1019]
  109bdc:	e3a01004 	mov	r1, #4	; 0x4
  109be0:	e507c3cf 	str	ip, [r7, #-975]
  109be4:	e1a02008 	mov	r2, r8
  109be8:	e59f3060 	ldr	r3, [pc, #96]	; 109c50 <prog+0x9c0c>
  109bec:	e3a00005 	mov	r0, #5	; 0x5
  109bf0:	e50743ff 	str	r4, [r7, #-1023]
  109bf4:	eb000163 	bl	10a188 <AT91F_AIC_ConfigureIt>
  109bf8:	e3a01003 	mov	r1, #3	; 0x3
  109bfc:	e3a02040 	mov	r2, #64	; 0x40
  109c00:	e59f304c 	ldr	r3, [pc, #76]	; 109c54 <prog+0x9c10>
  109c04:	e3a00002 	mov	r0, #2	; 0x2
  109c08:	e50783eb 	str	r8, [r7, #-1003]
  109c0c:	eb00015d 	bl	10a188 <AT91F_AIC_ConfigureIt>
  109c10:	e51630b3 	ldr	r3, [r6, #-179]
  109c14:	e3a02024 	mov	r2, #36	; 0x24
  109c18:	e58d3000 	str	r3, [sp]
  109c1c:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  109c20:	e506a0bf 	str	sl, [r6, #-191]
  109c24:	e5832021 	str	r2, [r3, #33]
  109c28:	eb0006b6 	bl	10b708 <vPortExitCritical>
  109c2c:	e1a00005 	mov	r0, r5
  109c30:	e28dd004 	add	sp, sp, #4	; 0x4
  109c34:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109c38:	e3a00001 	mov	r0, #1	; 0x1
  109c3c:	eafffffb 	b	109c30 <nRFCMD_Init+0x150>
  109c40:	002019d0 	ldreqd	r1, [r0], -r0
  109c44:	002019cc 	eoreq	r1, r0, ip, asr #19
  109c48:	00200cfc 	streqd	r0, [r0], -ip
  109c4c:	00200d00 	eoreq	r0, r0, r0, lsl #26
  109c50:	0010a048 	andeqs	sl, r0, r8, asr #32
  109c54:	00109cd0 	ldreqsb	r9, [r0], -r0

00109c58 <nRFCMD_ISR_ACK_Handler>:
  109c58:	e92d4010 	stmdb	sp!, {r4, lr}
  109c5c:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  109c60:	e51230b3 	ldr	r3, [r2, #-179]
  109c64:	e3130702 	tst	r3, #524288	; 0x80000
  109c68:	e24dd004 	sub	sp, sp, #4	; 0x4
  109c6c:	0a000005 	beq	109c88 <nRFCMD_ISR_ACK_Handler+0x30>
  109c70:	e51230c3 	ldr	r3, [r2, #-195]
  109c74:	e2134702 	ands	r4, r3, #524288	; 0x80000
  109c78:	e28dc004 	add	ip, sp, #4	; 0x4
  109c7c:	e1a01004 	mov	r1, r4
  109c80:	e1a03004 	mov	r3, r4
  109c84:	0a000004 	beq	109c9c <nRFCMD_ISR_ACK_Handler+0x44>
  109c88:	e3a02000 	mov	r2, #0	; 0x0
  109c8c:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  109c90:	e5832031 	str	r2, [r3, #49]
  109c94:	e28dd004 	add	sp, sp, #4	; 0x4
  109c98:	e8bd8010 	ldmia	sp!, {r4, pc}
  109c9c:	e59f2028 	ldr	r2, [pc, #40]	; 109ccc <prog+0x9c88>
  109ca0:	e5920000 	ldr	r0, [r2]
  109ca4:	e1a0200d 	mov	r2, sp
  109ca8:	e52c4004 	str	r4, [ip, #-4]!
  109cac:	eb0001e8 	bl	10a454 <xQueueGenericSendFromISR>
  109cb0:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  109cb4:	e3500000 	cmp	r0, #0	; 0x0
  109cb8:	e5834031 	str	r4, [r3, #49]
  109cbc:	0afffff4 	beq	109c94 <nRFCMD_ISR_ACK_Handler+0x3c>
  109cc0:	e58d0000 	str	r0, [sp]
  109cc4:	eb000329 	bl	10a970 <vTaskSwitchContext>
  109cc8:	eafffff1 	b	109c94 <nRFCMD_ISR_ACK_Handler+0x3c>
  109ccc:	00200d00 	eoreq	r0, r0, r0, lsl #26

00109cd0 <nRFCMD_ISR_ACK>:
  109cd0:	e92d0001 	stmdb	sp!, {r0}
  109cd4:	e94d2000 	stmdb	sp, {sp}^
  109cd8:	e1a00000 	nop			(mov r0,r0)
  109cdc:	e24dd004 	sub	sp, sp, #4	; 0x4
  109ce0:	e8bd0001 	ldmia	sp!, {r0}
  109ce4:	e9204000 	stmdb	r0!, {lr}
  109ce8:	e1a0e000 	mov	lr, r0
  109cec:	e8bd0001 	ldmia	sp!, {r0}
  109cf0:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  109cf4:	e1a00000 	nop			(mov r0,r0)
  109cf8:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  109cfc:	e14f0000 	mrs	r0, SPSR
  109d00:	e92e0001 	stmdb	lr!, {r0}
  109d04:	e59f0064 	ldr	r0, [pc, #100]	; 109d70 <prog+0x9d2c>
  109d08:	e5900000 	ldr	r0, [r0]
  109d0c:	e92e0001 	stmdb	lr!, {r0}
  109d10:	e59f005c 	ldr	r0, [pc, #92]	; 109d74 <prog+0x9d30>
  109d14:	e5900000 	ldr	r0, [r0]
  109d18:	e580e000 	str	lr, [r0]
  109d1c:	e59f4044 	ldr	r4, [pc, #68]	; 109d68 <prog+0x9d24>
  109d20:	e59f5044 	ldr	r5, [pc, #68]	; 109d6c <prog+0x9d28>
  109d24:	e5943000 	ldr	r3, [r4]
  109d28:	e5952000 	ldr	r2, [r5]
  109d2c:	ebffffc9 	bl	109c58 <nRFCMD_ISR_ACK_Handler>
  109d30:	e59f003c 	ldr	r0, [pc, #60]	; 109d74 <prog+0x9d30>
  109d34:	e5900000 	ldr	r0, [r0]
  109d38:	e590e000 	ldr	lr, [r0]
  109d3c:	e59f002c 	ldr	r0, [pc, #44]	; 109d70 <prog+0x9d2c>
  109d40:	e8be0002 	ldmia	lr!, {r1}
  109d44:	e5801000 	str	r1, [r0]
  109d48:	e8be0001 	ldmia	lr!, {r0}
  109d4c:	e169f000 	msr	SPSR_fc, r0
  109d50:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  109d54:	e1a00000 	nop			(mov r0,r0)
  109d58:	e59ee03c 	ldr	lr, [lr, #60]
  109d5c:	e25ef004 	subs	pc, lr, #4	; 0x4
  109d60:	e5943000 	ldr	r3, [r4]
  109d64:	e5952000 	ldr	r2, [r5]
  109d68:	00200838 	eoreq	r0, r0, r8, lsr r8
  109d6c:	00200d04 	eoreq	r0, r0, r4, lsl #26
  109d70:	00200838 	eoreq	r0, r0, r8, lsr r8
  109d74:	00200d04 	eoreq	r0, r0, r4, lsl #26

00109d78 <nRFCMD_ReadWriteBuffer>:
  109d78:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  109d7c:	e3a044ff 	mov	r4, #-16777216	; 0xff000000
  109d80:	e28448fe 	add	r4, r4, #16646144	; 0xfe0000
  109d84:	e3a05000 	mov	r5, #0	; 0x0
  109d88:	e2846c01 	add	r6, r4, #256	; 0x100
  109d8c:	e24dd004 	sub	sp, sp, #4	; 0x4
  109d90:	e1a07000 	mov	r7, r0
  109d94:	e1a08002 	mov	r8, r2
  109d98:	e1a03005 	mov	r3, r5
  109d9c:	e1a00006 	mov	r0, r6
  109da0:	e58d5000 	str	r5, [sp]
  109da4:	eb000117 	bl	10a208 <AT91F_PDC_ReceiveFrame>
  109da8:	e1a01007 	mov	r1, r7
  109dac:	e1a02008 	mov	r2, r8
  109db0:	e1a03005 	mov	r3, r5
  109db4:	e1a00006 	mov	r0, r6
  109db8:	e58d5000 	str	r5, [sp]
  109dbc:	eb0000ff 	bl	10a1c0 <AT91F_PDC_SendFrame>
  109dc0:	e59f3030 	ldr	r3, [pc, #48]	; 109df8 <prog+0x9db4>
  109dc4:	e3a0cc01 	mov	ip, #256	; 0x100
  109dc8:	e28cc001 	add	ip, ip, #1	; 0x1
  109dcc:	e1844ba4 	orr	r4, r4, r4, lsr #23
  109dd0:	e1a01005 	mov	r1, r5
  109dd4:	e5930000 	ldr	r0, [r3]
  109dd8:	e3a02064 	mov	r2, #100	; 0x64
  109ddc:	e1a03005 	mov	r3, r5
  109de0:	e504c0df 	str	ip, [r4, #-223]
  109de4:	eb0001f8 	bl	10a5cc <xQueueGenericReceive>
  109de8:	e2500001 	subs	r0, r0, #1	; 0x1
  109dec:	13a00001 	movne	r0, #1	; 0x1
  109df0:	e28dd004 	add	sp, sp, #4	; 0x4
  109df4:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  109df8:	00200cfc 	streqd	r0, [r0], -ip

00109dfc <nRFCMD_RegReadBuf>:
  109dfc:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  109e00:	e59f3034 	ldr	r3, [pc, #52]	; 109e3c <prog+0x9df8>
  109e04:	e59f5034 	ldr	r5, [pc, #52]	; 109e40 <prog+0x9dfc>
  109e08:	e20240ff 	and	r4, r2, #255	; 0xff
  109e0c:	e5c30000 	strb	r0, [r3]
  109e10:	e1a06001 	mov	r6, r1
  109e14:	e1a00003 	mov	r0, r3
  109e18:	e1a01005 	mov	r1, r5
  109e1c:	e2842002 	add	r2, r4, #2	; 0x2
  109e20:	ebffffd4 	bl	109d78 <nRFCMD_ReadWriteBuffer>
  109e24:	e1a00006 	mov	r0, r6
  109e28:	e1a02004 	mov	r2, r4
  109e2c:	e2851001 	add	r1, r5, #1	; 0x1
  109e30:	ebffdb65 	bl	100bcc <memcpy>
  109e34:	e5d50000 	ldrb	r0, [r5]
  109e38:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109e3c:	00200cb8 	streqh	r0, [r0], -r8
  109e40:	00200cd9 	ldreqd	r0, [r0], -r9

00109e44 <nRFCMD_RegWriteBuf>:
  109e44:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  109e48:	e59f6030 	ldr	r6, [pc, #48]	; 109e80 <prog+0x9e3c>
  109e4c:	e1a03006 	mov	r3, r6
  109e50:	e4c30001 	strb	r0, [r3], #1
  109e54:	e20240ff 	and	r4, r2, #255	; 0xff
  109e58:	e59f5024 	ldr	r5, [pc, #36]	; 109e84 <prog+0x9e40>
  109e5c:	e1a00003 	mov	r0, r3
  109e60:	e1a02004 	mov	r2, r4
  109e64:	ebffdb58 	bl	100bcc <memcpy>
  109e68:	e1a00006 	mov	r0, r6
  109e6c:	e2842001 	add	r2, r4, #1	; 0x1
  109e70:	e1a01005 	mov	r1, r5
  109e74:	ebffffbf 	bl	109d78 <nRFCMD_ReadWriteBuffer>
  109e78:	e5d50000 	ldrb	r0, [r5]
  109e7c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109e80:	00200cb8 	streqh	r0, [r0], -r8
  109e84:	00200cd9 	ldreqd	r0, [r0], -r9

00109e88 <nRFCMD_RegWriteStatusRead>:
  109e88:	e92d4010 	stmdb	sp!, {r4, lr}
  109e8c:	e59f401c 	ldr	r4, [pc, #28]	; 109eb0 <prog+0x9e6c>
  109e90:	e3a02002 	mov	r2, #2	; 0x2
  109e94:	e5c40000 	strb	r0, [r4]
  109e98:	e5c41001 	strb	r1, [r4, #1]
  109e9c:	e1a00004 	mov	r0, r4
  109ea0:	e59f100c 	ldr	r1, [pc, #12]	; 109eb4 <prog+0x9e70>
  109ea4:	ebffffb3 	bl	109d78 <nRFCMD_ReadWriteBuffer>
  109ea8:	e5d40000 	ldrb	r0, [r4]
  109eac:	e8bd8010 	ldmia	sp!, {r4, pc}
  109eb0:	00200cb8 	streqh	r0, [r0], -r8
  109eb4:	00200cd9 	ldreqd	r0, [r0], -r9

00109eb8 <nRFCMD_RegRead>:
  109eb8:	e92d4010 	stmdb	sp!, {r4, lr}
  109ebc:	e59f3024 	ldr	r3, [pc, #36]	; 109ee8 <prog+0x9ea4>
  109ec0:	e59f4024 	ldr	r4, [pc, #36]	; 109eec <prog+0x9ea8>
  109ec4:	e3a0c000 	mov	ip, #0	; 0x0
  109ec8:	e5c30000 	strb	r0, [r3]
  109ecc:	e1a01004 	mov	r1, r4
  109ed0:	e1a00003 	mov	r0, r3
  109ed4:	e3a02002 	mov	r2, #2	; 0x2
  109ed8:	e5c3c001 	strb	ip, [r3, #1]
  109edc:	ebffffa5 	bl	109d78 <nRFCMD_ReadWriteBuffer>
  109ee0:	e5d40001 	ldrb	r0, [r4, #1]
  109ee4:	e8bd8010 	ldmia	sp!, {r4, pc}
  109ee8:	00200cb8 	streqh	r0, [r0], -r8
  109eec:	00200cd9 	ldreqd	r0, [r0], -r9

00109ef0 <nRFCMD_CmdExec>:
  109ef0:	e52de004 	str	lr, [sp, #-4]!
  109ef4:	e24dd004 	sub	sp, sp, #4	; 0x4
  109ef8:	e28d3004 	add	r3, sp, #4	; 0x4
  109efc:	e5630001 	strb	r0, [r3, #-1]!
  109f00:	e28d1002 	add	r1, sp, #2	; 0x2
  109f04:	e1a00003 	mov	r0, r3
  109f08:	e3a02001 	mov	r2, #1	; 0x1
  109f0c:	ebffff99 	bl	109d78 <nRFCMD_ReadWriteBuffer>
  109f10:	e5dd0002 	ldrb	r0, [sp, #2]
  109f14:	e28dd004 	add	sp, sp, #4	; 0x4
  109f18:	e8bd8000 	ldmia	sp!, {pc}

00109f1c <nRFCMD_CE>:
  109f1c:	e31000ff 	tst	r0, #255	; 0xff
  109f20:	13a02402 	movne	r2, #33554432	; 0x2000000
  109f24:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  109f28:	03a02402 	moveq	r2, #33554432	; 0x2000000
  109f2c:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  109f30:	150320cf 	strne	r2, [r3, #-207]
  109f34:	050320cb 	streq	r2, [r3, #-203]
  109f38:	e12fff1e 	bx	lr

00109f3c <nRFCMD_ProcessNextMacro>:
  109f3c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  109f40:	e59f5080 	ldr	r5, [pc, #128]	; 109fc8 <prog+0x9f84>
  109f44:	e5952000 	ldr	r2, [r5]
  109f48:	e3520000 	cmp	r2, #0	; 0x0
  109f4c:	e24dd004 	sub	sp, sp, #4	; 0x4
  109f50:	e3a0c001 	mov	ip, #1	; 0x1
  109f54:	0a00000b 	beq	109f88 <nRFCMD_ProcessNextMacro+0x4c>
  109f58:	e5d24000 	ldrb	r4, [r2]
  109f5c:	e3a06000 	mov	r6, #0	; 0x0
  109f60:	e3a004ff 	mov	r0, #-16777216	; 0xff000000
  109f64:	e28008fe 	add	r0, r0, #16646144	; 0xfe0000
  109f68:	e1540006 	cmp	r4, r6
  109f6c:	e2821001 	add	r1, r2, #1	; 0x1
  109f70:	e2800c01 	add	r0, r0, #256	; 0x100
  109f74:	e1a03006 	mov	r3, r6
  109f78:	e1a02004 	mov	r2, r4
  109f7c:	e3a0c001 	mov	ip, #1	; 0x1
  109f80:	05854000 	streq	r4, [r5]
  109f84:	1a000002 	bne	109f94 <nRFCMD_ProcessNextMacro+0x58>
  109f88:	e1a0000c 	mov	r0, ip
  109f8c:	e28dd004 	add	sp, sp, #4	; 0x4
  109f90:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109f94:	e58d6000 	str	r6, [sp]
  109f98:	eb000088 	bl	10a1c0 <AT91F_PDC_SendFrame>
  109f9c:	e5953000 	ldr	r3, [r5]
  109fa0:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
  109fa4:	e0843003 	add	r3, r4, r3
  109fa8:	e1a02742 	mov	r2, r2, asr #14
  109fac:	e2833001 	add	r3, r3, #1	; 0x1
  109fb0:	e1822ba2 	orr	r2, r2, r2, lsr #23
  109fb4:	e3a01c01 	mov	r1, #256	; 0x100
  109fb8:	e1a0c006 	mov	ip, r6
  109fbc:	e5853000 	str	r3, [r5]
  109fc0:	e50210df 	str	r1, [r2, #-223]
  109fc4:	eaffffef 	b	109f88 <nRFCMD_ProcessNextMacro+0x4c>
  109fc8:	002019cc 	eoreq	r1, r0, ip, asr #19

00109fcc <nRFCMD_ISR_DMA_Handler>:
  109fcc:	e92d4010 	stmdb	sp!, {r4, lr}
  109fd0:	e3e02b7f 	mvn	r2, #130048	; 0x1fc00
  109fd4:	e51233ef 	ldr	r3, [r2, #-1007]
  109fd8:	e2132020 	ands	r2, r3, #32	; 0x20
  109fdc:	03e03c0f 	mvneq	r3, #3840	; 0xf00
  109fe0:	e24dd004 	sub	sp, sp, #4	; 0x4
  109fe4:	e3a04000 	mov	r4, #0	; 0x0
  109fe8:	05832031 	streq	r2, [r3, #49]
  109fec:	1a000001 	bne	109ff8 <nRFCMD_ISR_DMA_Handler+0x2c>
  109ff0:	e28dd004 	add	sp, sp, #4	; 0x4
  109ff4:	e8bd8010 	ldmia	sp!, {r4, pc}
  109ff8:	e58d4000 	str	r4, [sp]
  109ffc:	ebffffce 	bl	109f3c <nRFCMD_ProcessNextMacro>
  10a000:	e1500004 	cmp	r0, r4
  10a004:	e1a01004 	mov	r1, r4
  10a008:	e1a0200d 	mov	r2, sp
  10a00c:	e1a03004 	mov	r3, r4
  10a010:	1a000006 	bne	10a030 <nRFCMD_ISR_DMA_Handler+0x64>
  10a014:	e59d3000 	ldr	r3, [sp]
  10a018:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  10a01c:	e3530000 	cmp	r3, #0	; 0x0
  10a020:	e5824031 	str	r4, [r2, #49]
  10a024:	0afffff1 	beq	109ff0 <nRFCMD_ISR_DMA_Handler+0x24>
  10a028:	eb000250 	bl	10a970 <vTaskSwitchContext>
  10a02c:	eaffffef 	b	109ff0 <nRFCMD_ISR_DMA_Handler+0x24>
  10a030:	e59fc00c 	ldr	ip, [pc, #12]	; 10a044 <prog+0xa000>
  10a034:	e59c0000 	ldr	r0, [ip]
  10a038:	eb000105 	bl	10a454 <xQueueGenericSendFromISR>
  10a03c:	e58d0000 	str	r0, [sp]
  10a040:	eafffff3 	b	10a014 <nRFCMD_ISR_DMA_Handler+0x48>
  10a044:	00200cfc 	streqd	r0, [r0], -ip

0010a048 <nRFCMD_ISR_DMA>:
  10a048:	e92d0001 	stmdb	sp!, {r0}
  10a04c:	e94d2000 	stmdb	sp, {sp}^
  10a050:	e1a00000 	nop			(mov r0,r0)
  10a054:	e24dd004 	sub	sp, sp, #4	; 0x4
  10a058:	e8bd0001 	ldmia	sp!, {r0}
  10a05c:	e9204000 	stmdb	r0!, {lr}
  10a060:	e1a0e000 	mov	lr, r0
  10a064:	e8bd0001 	ldmia	sp!, {r0}
  10a068:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10a06c:	e1a00000 	nop			(mov r0,r0)
  10a070:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10a074:	e14f0000 	mrs	r0, SPSR
  10a078:	e92e0001 	stmdb	lr!, {r0}
  10a07c:	e59f0064 	ldr	r0, [pc, #100]	; 10a0e8 <prog+0xa0a4>
  10a080:	e5900000 	ldr	r0, [r0]
  10a084:	e92e0001 	stmdb	lr!, {r0}
  10a088:	e59f005c 	ldr	r0, [pc, #92]	; 10a0ec <prog+0xa0a8>
  10a08c:	e5900000 	ldr	r0, [r0]
  10a090:	e580e000 	str	lr, [r0]
  10a094:	e59f4044 	ldr	r4, [pc, #68]	; 10a0e0 <prog+0xa09c>
  10a098:	e59f5044 	ldr	r5, [pc, #68]	; 10a0e4 <prog+0xa0a0>
  10a09c:	e5943000 	ldr	r3, [r4]
  10a0a0:	e5952000 	ldr	r2, [r5]
  10a0a4:	ebffffc8 	bl	109fcc <nRFCMD_ISR_DMA_Handler>
  10a0a8:	e59f003c 	ldr	r0, [pc, #60]	; 10a0ec <prog+0xa0a8>
  10a0ac:	e5900000 	ldr	r0, [r0]
  10a0b0:	e590e000 	ldr	lr, [r0]
  10a0b4:	e59f002c 	ldr	r0, [pc, #44]	; 10a0e8 <prog+0xa0a4>
  10a0b8:	e8be0002 	ldmia	lr!, {r1}
  10a0bc:	e5801000 	str	r1, [r0]
  10a0c0:	e8be0001 	ldmia	lr!, {r0}
  10a0c4:	e169f000 	msr	SPSR_fc, r0
  10a0c8:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10a0cc:	e1a00000 	nop			(mov r0,r0)
  10a0d0:	e59ee03c 	ldr	lr, [lr, #60]
  10a0d4:	e25ef004 	subs	pc, lr, #4	; 0x4
  10a0d8:	e5943000 	ldr	r3, [r4]
  10a0dc:	e5952000 	ldr	r2, [r5]
  10a0e0:	00200838 	eoreq	r0, r0, r8, lsr r8
  10a0e4:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10a0e8:	00200838 	eoreq	r0, r0, r8, lsr r8
  10a0ec:	00200d04 	eoreq	r0, r0, r4, lsl #26

0010a0f0 <AT91F_LowLevelInit>:
  10a0f0:	e3a0184b 	mov	r1, #4915200	; 0x4b0000
  10a0f4:	e3a00502 	mov	r0, #8388608	; 0x800000
  10a0f8:	e3a0cc06 	mov	ip, #1536	; 0x600
  10a0fc:	e52de004 	str	lr, [sp, #-4]!
  10a100:	e2811c01 	add	r1, r1, #256	; 0x100
  10a104:	e2800d82 	add	r0, r0, #8320	; 0x2080
  10a108:	e28cc001 	add	ip, ip, #1	; 0x1
  10a10c:	e3e0ec03 	mvn	lr, #768	; 0x300
  10a110:	e3e03000 	mvn	r3, #0	; 0x0
  10a114:	e3e02c02 	mvn	r2, #512	; 0x200
  10a118:	e503109f 	str	r1, [r3, #-159]
  10a11c:	e50200bb 	str	r0, [r2, #-187]
  10a120:	e50ec0df 	str	ip, [lr, #-223]
  10a124:	e51e3097 	ldr	r3, [lr, #-151]
  10a128:	e3130001 	tst	r3, #1	; 0x1
  10a12c:	0afffffc 	beq	10a124 <AT91F_LowLevelInit+0x34>
  10a130:	e3a03819 	mov	r3, #1638400	; 0x190000
  10a134:	e2833b07 	add	r3, r3, #7168	; 0x1c00
  10a138:	e2833005 	add	r3, r3, #5	; 0x5
  10a13c:	e50e30d3 	str	r3, [lr, #-211]
  10a140:	e3e02c03 	mvn	r2, #768	; 0x300
  10a144:	e5123097 	ldr	r3, [r2, #-151]
  10a148:	e3130004 	tst	r3, #4	; 0x4
  10a14c:	0afffffc 	beq	10a144 <AT91F_LowLevelInit+0x54>
  10a150:	e3a03004 	mov	r3, #4	; 0x4
  10a154:	e50230cf 	str	r3, [r2, #-207]
  10a158:	e3e02c03 	mvn	r2, #768	; 0x300
  10a15c:	e5123097 	ldr	r3, [r2, #-151]
  10a160:	e3130008 	tst	r3, #8	; 0x8
  10a164:	0afffffc 	beq	10a15c <AT91F_LowLevelInit+0x6c>
  10a168:	e51230cf 	ldr	r3, [r2, #-207]
  10a16c:	e3833003 	orr	r3, r3, #3	; 0x3
  10a170:	e50230cf 	str	r3, [r2, #-207]
  10a174:	e3e02c03 	mvn	r2, #768	; 0x300
  10a178:	e5123097 	ldr	r3, [r2, #-151]
  10a17c:	e3130008 	tst	r3, #8	; 0x8
  10a180:	0afffffc 	beq	10a178 <AT91F_LowLevelInit+0x88>
  10a184:	e49df004 	ldr	pc, [sp], #4

0010a188 <AT91F_AIC_ConfigureIt>:
  10a188:	e92d4010 	stmdb	sp!, {r4, lr}
  10a18c:	e3a0e001 	mov	lr, #1	; 0x1
  10a190:	e1a0e01e 	mov	lr, lr, lsl r0
  10a194:	e1a0c100 	mov	ip, r0, lsl #2
  10a198:	e51c0f80 	ldr	r0, [ip, #-3968]
  10a19c:	e1822001 	orr	r2, r2, r1
  10a1a0:	e24c4a01 	sub	r4, ip, #4096	; 0x1000
  10a1a4:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  10a1a8:	e1a00003 	mov	r0, r3
  10a1ac:	e581e025 	str	lr, [r1, #37]
  10a1b0:	e50c3f80 	str	r3, [ip, #-3968]
  10a1b4:	e5842000 	str	r2, [r4]
  10a1b8:	e581e029 	str	lr, [r1, #41]
  10a1bc:	e8bd8010 	ldmia	sp!, {r4, pc}

0010a1c0 <AT91F_PDC_SendFrame>:
  10a1c0:	e1a0c000 	mov	ip, r0
  10a1c4:	e590000c 	ldr	r0, [r0, #12]
  10a1c8:	e3500000 	cmp	r0, #0	; 0x0
  10a1cc:	e3a00002 	mov	r0, #2	; 0x2
  10a1d0:	1a000005 	bne	10a1ec <AT91F_PDC_SendFrame+0x2c>
  10a1d4:	e58c1008 	str	r1, [ip, #8]
  10a1d8:	e58c200c 	str	r2, [ip, #12]
  10a1dc:	e58c3018 	str	r3, [ip, #24]
  10a1e0:	e59d3000 	ldr	r3, [sp]
  10a1e4:	e58c301c 	str	r3, [ip, #28]
  10a1e8:	e12fff1e 	bx	lr
  10a1ec:	e59c301c 	ldr	r3, [ip, #28]
  10a1f0:	e3530000 	cmp	r3, #0	; 0x0
  10a1f4:	e3a00000 	mov	r0, #0	; 0x0
  10a1f8:	03a00001 	moveq	r0, #1	; 0x1
  10a1fc:	058c1018 	streq	r1, [ip, #24]
  10a200:	058c201c 	streq	r2, [ip, #28]
  10a204:	e12fff1e 	bx	lr

0010a208 <AT91F_PDC_ReceiveFrame>:
  10a208:	e1a0c000 	mov	ip, r0
  10a20c:	e5900004 	ldr	r0, [r0, #4]
  10a210:	e3500000 	cmp	r0, #0	; 0x0
  10a214:	e3a00002 	mov	r0, #2	; 0x2
  10a218:	1a000005 	bne	10a234 <AT91F_PDC_ReceiveFrame+0x2c>
  10a21c:	e58c1000 	str	r1, [ip]
  10a220:	e58c2004 	str	r2, [ip, #4]
  10a224:	e58c3010 	str	r3, [ip, #16]
  10a228:	e59d3000 	ldr	r3, [sp]
  10a22c:	e58c3014 	str	r3, [ip, #20]
  10a230:	e12fff1e 	bx	lr
  10a234:	e59c3014 	ldr	r3, [ip, #20]
  10a238:	e3530000 	cmp	r3, #0	; 0x0
  10a23c:	e3a00000 	mov	r0, #0	; 0x0
  10a240:	03a00001 	moveq	r0, #1	; 0x1
  10a244:	058c1010 	streq	r1, [ip, #16]
  10a248:	058c2014 	streq	r2, [ip, #20]
  10a24c:	e12fff1e 	bx	lr

0010a250 <vListInitialise>:
  10a250:	e3e03000 	mvn	r3, #0	; 0x0
  10a254:	e5803008 	str	r3, [r0, #8]
  10a258:	e2802008 	add	r2, r0, #8	; 0x8
  10a25c:	e2833001 	add	r3, r3, #1	; 0x1
  10a260:	e580200c 	str	r2, [r0, #12]
  10a264:	e5802010 	str	r2, [r0, #16]
  10a268:	e5802004 	str	r2, [r0, #4]
  10a26c:	e5803000 	str	r3, [r0]
  10a270:	e12fff1e 	bx	lr

0010a274 <vListInitialiseItem>:
  10a274:	e3a03000 	mov	r3, #0	; 0x0
  10a278:	e5803010 	str	r3, [r0, #16]
  10a27c:	e12fff1e 	bx	lr

0010a280 <vListInsertEnd>:
  10a280:	e5902004 	ldr	r2, [r0, #4]
  10a284:	e5923004 	ldr	r3, [r2, #4]
  10a288:	e5813004 	str	r3, [r1, #4]
  10a28c:	e592c004 	ldr	ip, [r2, #4]
  10a290:	e5812008 	str	r2, [r1, #8]
  10a294:	e58c1008 	str	r1, [ip, #8]
  10a298:	e5821004 	str	r1, [r2, #4]
  10a29c:	e5903000 	ldr	r3, [r0]
  10a2a0:	e2833001 	add	r3, r3, #1	; 0x1
  10a2a4:	e5803000 	str	r3, [r0]
  10a2a8:	e5810010 	str	r0, [r1, #16]
  10a2ac:	e5801004 	str	r1, [r0, #4]
  10a2b0:	e12fff1e 	bx	lr

0010a2b4 <vListInsert>:
  10a2b4:	e52de004 	str	lr, [sp, #-4]!
  10a2b8:	e591e000 	ldr	lr, [r1]
  10a2bc:	e37e0001 	cmn	lr, #1	; 0x1
  10a2c0:	0590c010 	ldreq	ip, [r0, #16]
  10a2c4:	0a000009 	beq	10a2f0 <vListInsert+0x3c>
  10a2c8:	e280c008 	add	ip, r0, #8	; 0x8
  10a2cc:	e59c3004 	ldr	r3, [ip, #4]
  10a2d0:	e5932000 	ldr	r2, [r3]
  10a2d4:	e15e0002 	cmp	lr, r2
  10a2d8:	3a000004 	bcc	10a2f0 <vListInsert+0x3c>
  10a2dc:	e59cc004 	ldr	ip, [ip, #4]
  10a2e0:	e59c3004 	ldr	r3, [ip, #4]
  10a2e4:	e5932000 	ldr	r2, [r3]
  10a2e8:	e15e0002 	cmp	lr, r2
  10a2ec:	2afffffa 	bcs	10a2dc <vListInsert+0x28>
  10a2f0:	e59c3004 	ldr	r3, [ip, #4]
  10a2f4:	e5831008 	str	r1, [r3, #8]
  10a2f8:	e5813004 	str	r3, [r1, #4]
  10a2fc:	e58c1004 	str	r1, [ip, #4]
  10a300:	e5903000 	ldr	r3, [r0]
  10a304:	e2833001 	add	r3, r3, #1	; 0x1
  10a308:	e5803000 	str	r3, [r0]
  10a30c:	e5810010 	str	r0, [r1, #16]
  10a310:	e581c008 	str	ip, [r1, #8]
  10a314:	e49df004 	ldr	pc, [sp], #4

0010a318 <vListRemove>:
  10a318:	e5903004 	ldr	r3, [r0, #4]
  10a31c:	e5902008 	ldr	r2, [r0, #8]
  10a320:	e5832008 	str	r2, [r3, #8]
  10a324:	e5902008 	ldr	r2, [r0, #8]
  10a328:	e5901010 	ldr	r1, [r0, #16]
  10a32c:	e5823004 	str	r3, [r2, #4]
  10a330:	e5913004 	ldr	r3, [r1, #4]
  10a334:	e1530000 	cmp	r3, r0
  10a338:	e5913000 	ldr	r3, [r1]
  10a33c:	05812004 	streq	r2, [r1, #4]
  10a340:	e2433001 	sub	r3, r3, #1	; 0x1
  10a344:	e3a02000 	mov	r2, #0	; 0x0
  10a348:	e5802010 	str	r2, [r0, #16]
  10a34c:	e5813000 	str	r3, [r1]
  10a350:	e12fff1e 	bx	lr

0010a354 <uxQueueMessagesWaiting>:
  10a354:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10a358:	e1a04000 	mov	r4, r0
  10a35c:	eb0004de 	bl	10b6dc <vPortEnterCritical>
  10a360:	e5945038 	ldr	r5, [r4, #56]
  10a364:	eb0004e7 	bl	10b708 <vPortExitCritical>
  10a368:	e1a00005 	mov	r0, r5
  10a36c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

0010a370 <prvCopyDataFromQueue>:
  10a370:	e92d4010 	stmdb	sp!, {r4, lr}
  10a374:	e5904000 	ldr	r4, [r0]
  10a378:	e3540000 	cmp	r4, #0	; 0x0
  10a37c:	e1a0e000 	mov	lr, r0
  10a380:	e1a00001 	mov	r0, r1
  10a384:	08bd8010 	ldmeqia	sp!, {r4, pc}
  10a388:	e59ec00c 	ldr	ip, [lr, #12]
  10a38c:	e59e3040 	ldr	r3, [lr, #64]
  10a390:	e59e1004 	ldr	r1, [lr, #4]
  10a394:	e08cc003 	add	ip, ip, r3
  10a398:	e15c0001 	cmp	ip, r1
  10a39c:	e58ec00c 	str	ip, [lr, #12]
  10a3a0:	21a0c004 	movcs	ip, r4
  10a3a4:	e1a02003 	mov	r2, r3
  10a3a8:	e1a0100c 	mov	r1, ip
  10a3ac:	258ec00c 	strcs	ip, [lr, #12]
  10a3b0:	e8bd4010 	ldmia	sp!, {r4, lr}
  10a3b4:	eaffda04 	b	100bcc <memcpy>

0010a3b8 <prvCopyDataToQueue>:
  10a3b8:	e5903040 	ldr	r3, [r0, #64]
  10a3bc:	e3530000 	cmp	r3, #0	; 0x0
  10a3c0:	e92d4010 	stmdb	sp!, {r4, lr}
  10a3c4:	e1a04000 	mov	r4, r0
  10a3c8:	e1a00002 	mov	r0, r2
  10a3cc:	0a00000e 	beq	10a40c <prvCopyDataToQueue+0x54>
  10a3d0:	e3500000 	cmp	r0, #0	; 0x0
  10a3d4:	e1a02003 	mov	r2, r3
  10a3d8:	0a00000f 	beq	10a41c <prvCopyDataToQueue+0x64>
  10a3dc:	e1a02003 	mov	r2, r3
  10a3e0:	e594000c 	ldr	r0, [r4, #12]
  10a3e4:	ebffd9f8 	bl	100bcc <memcpy>
  10a3e8:	e594300c 	ldr	r3, [r4, #12]
  10a3ec:	e5941040 	ldr	r1, [r4, #64]
  10a3f0:	e5942000 	ldr	r2, [r4]
  10a3f4:	e0613003 	rsb	r3, r1, r3
  10a3f8:	e1530002 	cmp	r3, r2
  10a3fc:	e584300c 	str	r3, [r4, #12]
  10a400:	35943004 	ldrcc	r3, [r4, #4]
  10a404:	30613003 	rsbcc	r3, r1, r3
  10a408:	3584300c 	strcc	r3, [r4, #12]
  10a40c:	e5943038 	ldr	r3, [r4, #56]
  10a410:	e2833001 	add	r3, r3, #1	; 0x1
  10a414:	e5843038 	str	r3, [r4, #56]
  10a418:	e8bd8010 	ldmia	sp!, {r4, pc}
  10a41c:	e5940008 	ldr	r0, [r4, #8]
  10a420:	ebffd9e9 	bl	100bcc <memcpy>
  10a424:	e5943008 	ldr	r3, [r4, #8]
  10a428:	e5942040 	ldr	r2, [r4, #64]
  10a42c:	e5941004 	ldr	r1, [r4, #4]
  10a430:	e0833002 	add	r3, r3, r2
  10a434:	e1530001 	cmp	r3, r1
  10a438:	e5843008 	str	r3, [r4, #8]
  10a43c:	25943000 	ldrcs	r3, [r4]
  10a440:	25843008 	strcs	r3, [r4, #8]
  10a444:	e5943038 	ldr	r3, [r4, #56]
  10a448:	e2833001 	add	r3, r3, #1	; 0x1
  10a44c:	e5843038 	str	r3, [r4, #56]
  10a450:	e8bd8010 	ldmia	sp!, {r4, pc}

0010a454 <xQueueGenericSendFromISR>:
  10a454:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10a458:	e590c038 	ldr	ip, [r0, #56]
  10a45c:	e590e03c 	ldr	lr, [r0, #60]
  10a460:	e15c000e 	cmp	ip, lr
  10a464:	e1a05002 	mov	r5, r2
  10a468:	e1a04000 	mov	r4, r0
  10a46c:	e3a0c000 	mov	ip, #0	; 0x0
  10a470:	e1a02003 	mov	r2, r3
  10a474:	3a000001 	bcc	10a480 <xQueueGenericSendFromISR+0x2c>
  10a478:	e1a0000c 	mov	r0, ip
  10a47c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10a480:	ebffffcc 	bl	10a3b8 <prvCopyDataToQueue>
  10a484:	e5943048 	ldr	r3, [r4, #72]
  10a488:	e3730001 	cmn	r3, #1	; 0x1
  10a48c:	e2833001 	add	r3, r3, #1	; 0x1
  10a490:	e3a0c001 	mov	ip, #1	; 0x1
  10a494:	15843048 	strne	r3, [r4, #72]
  10a498:	1afffff6 	bne	10a478 <xQueueGenericSendFromISR+0x24>
  10a49c:	e5943024 	ldr	r3, [r4, #36]
  10a4a0:	e3530000 	cmp	r3, #0	; 0x0
  10a4a4:	e2840024 	add	r0, r4, #36	; 0x24
  10a4a8:	1a000001 	bne	10a4b4 <xQueueGenericSendFromISR+0x60>
  10a4ac:	e3a0c001 	mov	ip, #1	; 0x1
  10a4b0:	eafffff0 	b	10a478 <xQueueGenericSendFromISR+0x24>
  10a4b4:	eb0001a4 	bl	10ab4c <xTaskRemoveFromEventList>
  10a4b8:	e3a03001 	mov	r3, #1	; 0x1
  10a4bc:	e3500000 	cmp	r0, #0	; 0x0
  10a4c0:	e1a0c003 	mov	ip, r3
  10a4c4:	15853000 	strne	r3, [r5]
  10a4c8:	1affffea 	bne	10a478 <xQueueGenericSendFromISR+0x24>
  10a4cc:	eafffff6 	b	10a4ac <xQueueGenericSendFromISR+0x58>

0010a4d0 <prvUnlockQueue>:
  10a4d0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10a4d4:	e1a04000 	mov	r4, r0
  10a4d8:	eb00047f 	bl	10b6dc <vPortEnterCritical>
  10a4dc:	e5943048 	ldr	r3, [r4, #72]
  10a4e0:	e3530000 	cmp	r3, #0	; 0x0
  10a4e4:	da000016 	ble	10a544 <prvUnlockQueue+0x74>
  10a4e8:	e5943024 	ldr	r3, [r4, #36]
  10a4ec:	e3530000 	cmp	r3, #0	; 0x0
  10a4f0:	12845024 	addne	r5, r4, #36	; 0x24
  10a4f4:	1a000008 	bne	10a51c <prvUnlockQueue+0x4c>
  10a4f8:	ea000011 	b	10a544 <prvUnlockQueue+0x74>
  10a4fc:	e5943048 	ldr	r3, [r4, #72]
  10a500:	e2433001 	sub	r3, r3, #1	; 0x1
  10a504:	e3530000 	cmp	r3, #0	; 0x0
  10a508:	e5843048 	str	r3, [r4, #72]
  10a50c:	da00000c 	ble	10a544 <prvUnlockQueue+0x74>
  10a510:	e5943024 	ldr	r3, [r4, #36]
  10a514:	e3530000 	cmp	r3, #0	; 0x0
  10a518:	0a000009 	beq	10a544 <prvUnlockQueue+0x74>
  10a51c:	e1a00005 	mov	r0, r5
  10a520:	eb000189 	bl	10ab4c <xTaskRemoveFromEventList>
  10a524:	e3500000 	cmp	r0, #0	; 0x0
  10a528:	0afffff3 	beq	10a4fc <prvUnlockQueue+0x2c>
  10a52c:	eb000140 	bl	10aa34 <vTaskMissedYield>
  10a530:	e5943048 	ldr	r3, [r4, #72]
  10a534:	e2433001 	sub	r3, r3, #1	; 0x1
  10a538:	e3530000 	cmp	r3, #0	; 0x0
  10a53c:	e5843048 	str	r3, [r4, #72]
  10a540:	cafffff2 	bgt	10a510 <prvUnlockQueue+0x40>
  10a544:	e3e03000 	mvn	r3, #0	; 0x0
  10a548:	e5843048 	str	r3, [r4, #72]
  10a54c:	eb00046d 	bl	10b708 <vPortExitCritical>
  10a550:	eb000461 	bl	10b6dc <vPortEnterCritical>
  10a554:	e5943044 	ldr	r3, [r4, #68]
  10a558:	e3530000 	cmp	r3, #0	; 0x0
  10a55c:	da000016 	ble	10a5bc <prvUnlockQueue+0xec>
  10a560:	e5943010 	ldr	r3, [r4, #16]
  10a564:	e3530000 	cmp	r3, #0	; 0x0
  10a568:	12845010 	addne	r5, r4, #16	; 0x10
  10a56c:	1a000008 	bne	10a594 <prvUnlockQueue+0xc4>
  10a570:	ea000011 	b	10a5bc <prvUnlockQueue+0xec>
  10a574:	e5943044 	ldr	r3, [r4, #68]
  10a578:	e2433001 	sub	r3, r3, #1	; 0x1
  10a57c:	e3530000 	cmp	r3, #0	; 0x0
  10a580:	e5843044 	str	r3, [r4, #68]
  10a584:	da00000c 	ble	10a5bc <prvUnlockQueue+0xec>
  10a588:	e5943010 	ldr	r3, [r4, #16]
  10a58c:	e3530000 	cmp	r3, #0	; 0x0
  10a590:	0a000009 	beq	10a5bc <prvUnlockQueue+0xec>
  10a594:	e1a00005 	mov	r0, r5
  10a598:	eb00016b 	bl	10ab4c <xTaskRemoveFromEventList>
  10a59c:	e3500000 	cmp	r0, #0	; 0x0
  10a5a0:	0afffff3 	beq	10a574 <prvUnlockQueue+0xa4>
  10a5a4:	eb000122 	bl	10aa34 <vTaskMissedYield>
  10a5a8:	e5943044 	ldr	r3, [r4, #68]
  10a5ac:	e2433001 	sub	r3, r3, #1	; 0x1
  10a5b0:	e3530000 	cmp	r3, #0	; 0x0
  10a5b4:	e5843044 	str	r3, [r4, #68]
  10a5b8:	cafffff2 	bgt	10a588 <prvUnlockQueue+0xb8>
  10a5bc:	e3e03000 	mvn	r3, #0	; 0x0
  10a5c0:	e5843044 	str	r3, [r4, #68]
  10a5c4:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  10a5c8:	ea00044e 	b	10b708 <vPortExitCritical>

0010a5cc <xQueueGenericReceive>:
  10a5cc:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10a5d0:	e1a05000 	mov	r5, r0
  10a5d4:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10a5d8:	e1a06001 	mov	r6, r1
  10a5dc:	e1a07003 	mov	r7, r3
  10a5e0:	e3a04001 	mov	r4, #1	; 0x1
  10a5e4:	e58d2000 	str	r2, [sp]
  10a5e8:	ea00000d 	b	10a624 <xQueueGenericReceive+0x58>
  10a5ec:	eb00043a 	bl	10b6dc <vPortEnterCritical>
  10a5f0:	e5953038 	ldr	r3, [r5, #56]
  10a5f4:	e3530000 	cmp	r3, #0	; 0x0
  10a5f8:	1a000030 	bne	10a6c0 <xQueueGenericReceive+0xf4>
  10a5fc:	eb000441 	bl	10b708 <vPortExitCritical>
  10a600:	e59d3000 	ldr	r3, [sp]
  10a604:	e3530000 	cmp	r3, #0	; 0x0
  10a608:	0a000040 	beq	10a710 <xQueueGenericReceive+0x144>
  10a60c:	e28d0004 	add	r0, sp, #4	; 0x4
  10a610:	e1a0100d 	mov	r1, sp
  10a614:	eb00010b 	bl	10aa48 <xTaskCheckForTimeOut>
  10a618:	e3500000 	cmp	r0, #0	; 0x0
  10a61c:	e3e04000 	mvn	r4, #0	; 0x0
  10a620:	1a00003a 	bne	10a710 <xQueueGenericReceive+0x144>
  10a624:	e59d3000 	ldr	r3, [sp]
  10a628:	e3530000 	cmp	r3, #0	; 0x0
  10a62c:	0affffee 	beq	10a5ec <xQueueGenericReceive+0x20>
  10a630:	eb00013c 	bl	10ab28 <vTaskSuspendAll>
  10a634:	eb000428 	bl	10b6dc <vPortEnterCritical>
  10a638:	e5953044 	ldr	r3, [r5, #68]
  10a63c:	e3730001 	cmn	r3, #1	; 0x1
  10a640:	02833001 	addeq	r3, r3, #1	; 0x1
  10a644:	05853044 	streq	r3, [r5, #68]
  10a648:	e5953048 	ldr	r3, [r5, #72]
  10a64c:	e3730001 	cmn	r3, #1	; 0x1
  10a650:	02833001 	addeq	r3, r3, #1	; 0x1
  10a654:	05853048 	streq	r3, [r5, #72]
  10a658:	eb00042a 	bl	10b708 <vPortExitCritical>
  10a65c:	e3540001 	cmp	r4, #1	; 0x1
  10a660:	0a00002d 	beq	10a71c <xQueueGenericReceive+0x150>
  10a664:	eb00041c 	bl	10b6dc <vPortEnterCritical>
  10a668:	e5954038 	ldr	r4, [r5, #56]
  10a66c:	eb000425 	bl	10b708 <vPortExitCritical>
  10a670:	e3540000 	cmp	r4, #0	; 0x0
  10a674:	1a000021 	bne	10a700 <xQueueGenericReceive+0x134>
  10a678:	e28d0004 	add	r0, sp, #4	; 0x4
  10a67c:	e1a0100d 	mov	r1, sp
  10a680:	eb0000f0 	bl	10aa48 <xTaskCheckForTimeOut>
  10a684:	e3500000 	cmp	r0, #0	; 0x0
  10a688:	1a00001c 	bne	10a700 <xQueueGenericReceive+0x134>
  10a68c:	e59d1000 	ldr	r1, [sp]
  10a690:	e2850024 	add	r0, r5, #36	; 0x24
  10a694:	eb0001b0 	bl	10ad5c <vTaskPlaceOnEventList>
  10a698:	e1a00005 	mov	r0, r5
  10a69c:	ebffff8b 	bl	10a4d0 <prvUnlockQueue>
  10a6a0:	eb00027d 	bl	10b09c <xTaskResumeAll>
  10a6a4:	e3500000 	cmp	r0, #0	; 0x0
  10a6a8:	1affffcf 	bne	10a5ec <xQueueGenericReceive+0x20>
  10a6ac:	ef000000 	swi	0x00000000
  10a6b0:	eb000409 	bl	10b6dc <vPortEnterCritical>
  10a6b4:	e5953038 	ldr	r3, [r5, #56]
  10a6b8:	e3530000 	cmp	r3, #0	; 0x0
  10a6bc:	0affffce 	beq	10a5fc <xQueueGenericReceive+0x30>
  10a6c0:	e1a01006 	mov	r1, r6
  10a6c4:	e1a00005 	mov	r0, r5
  10a6c8:	e595400c 	ldr	r4, [r5, #12]
  10a6cc:	ebffff27 	bl	10a370 <prvCopyDataFromQueue>
  10a6d0:	e3570000 	cmp	r7, #0	; 0x0
  10a6d4:	0a000013 	beq	10a728 <xQueueGenericReceive+0x15c>
  10a6d8:	e5953024 	ldr	r3, [r5, #36]
  10a6dc:	e3530000 	cmp	r3, #0	; 0x0
  10a6e0:	e585400c 	str	r4, [r5, #12]
  10a6e4:	0a000015 	beq	10a740 <xQueueGenericReceive+0x174>
  10a6e8:	e2850024 	add	r0, r5, #36	; 0x24
  10a6ec:	eb000116 	bl	10ab4c <xTaskRemoveFromEventList>
  10a6f0:	e3500000 	cmp	r0, #0	; 0x0
  10a6f4:	0a000011 	beq	10a740 <xQueueGenericReceive+0x174>
  10a6f8:	ef000000 	swi	0x00000000
  10a6fc:	ea00000f 	b	10a740 <xQueueGenericReceive+0x174>
  10a700:	e1a00005 	mov	r0, r5
  10a704:	ebffff71 	bl	10a4d0 <prvUnlockQueue>
  10a708:	eb000263 	bl	10b09c <xTaskResumeAll>
  10a70c:	eaffffb6 	b	10a5ec <xQueueGenericReceive+0x20>
  10a710:	e3a00000 	mov	r0, #0	; 0x0
  10a714:	e28dd00c 	add	sp, sp, #12	; 0xc
  10a718:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10a71c:	e28d0004 	add	r0, sp, #4	; 0x4
  10a720:	eb0000bb 	bl	10aa14 <vTaskSetTimeOutState>
  10a724:	eaffffce 	b	10a664 <xQueueGenericReceive+0x98>
  10a728:	e5953038 	ldr	r3, [r5, #56]
  10a72c:	e2433001 	sub	r3, r3, #1	; 0x1
  10a730:	e5853038 	str	r3, [r5, #56]
  10a734:	e5952010 	ldr	r2, [r5, #16]
  10a738:	e3520000 	cmp	r2, #0	; 0x0
  10a73c:	1a000002 	bne	10a74c <xQueueGenericReceive+0x180>
  10a740:	eb0003f0 	bl	10b708 <vPortExitCritical>
  10a744:	e3a00001 	mov	r0, #1	; 0x1
  10a748:	eafffff1 	b	10a714 <xQueueGenericReceive+0x148>
  10a74c:	e2850010 	add	r0, r5, #16	; 0x10
  10a750:	eb0000fd 	bl	10ab4c <xTaskRemoveFromEventList>
  10a754:	e3500001 	cmp	r0, #1	; 0x1
  10a758:	1afffff8 	bne	10a740 <xQueueGenericReceive+0x174>
  10a75c:	ef000000 	swi	0x00000000
  10a760:	eafffff6 	b	10a740 <xQueueGenericReceive+0x174>

0010a764 <xQueueGenericSend>:
  10a764:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10a768:	e1a06000 	mov	r6, r0
  10a76c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10a770:	e1a07001 	mov	r7, r1
  10a774:	e1a08003 	mov	r8, r3
  10a778:	e3a04001 	mov	r4, #1	; 0x1
  10a77c:	e58d2000 	str	r2, [sp]
  10a780:	ea00000e 	b	10a7c0 <xQueueGenericSend+0x5c>
  10a784:	eb0003d4 	bl	10b6dc <vPortEnterCritical>
  10a788:	e5962038 	ldr	r2, [r6, #56]
  10a78c:	e596303c 	ldr	r3, [r6, #60]
  10a790:	e1520003 	cmp	r2, r3
  10a794:	3a000032 	bcc	10a864 <xQueueGenericSend+0x100>
  10a798:	eb0003da 	bl	10b708 <vPortExitCritical>
  10a79c:	e59d3000 	ldr	r3, [sp]
  10a7a0:	e3530000 	cmp	r3, #0	; 0x0
  10a7a4:	0a00003c 	beq	10a89c <xQueueGenericSend+0x138>
  10a7a8:	e28d0004 	add	r0, sp, #4	; 0x4
  10a7ac:	e1a0100d 	mov	r1, sp
  10a7b0:	eb0000a4 	bl	10aa48 <xTaskCheckForTimeOut>
  10a7b4:	e3500000 	cmp	r0, #0	; 0x0
  10a7b8:	e3e04000 	mvn	r4, #0	; 0x0
  10a7bc:	1a000036 	bne	10a89c <xQueueGenericSend+0x138>
  10a7c0:	e59d3000 	ldr	r3, [sp]
  10a7c4:	e3530000 	cmp	r3, #0	; 0x0
  10a7c8:	0affffed 	beq	10a784 <xQueueGenericSend+0x20>
  10a7cc:	eb0000d5 	bl	10ab28 <vTaskSuspendAll>
  10a7d0:	eb0003c1 	bl	10b6dc <vPortEnterCritical>
  10a7d4:	e5963044 	ldr	r3, [r6, #68]
  10a7d8:	e3730001 	cmn	r3, #1	; 0x1
  10a7dc:	02833001 	addeq	r3, r3, #1	; 0x1
  10a7e0:	05863044 	streq	r3, [r6, #68]
  10a7e4:	e5963048 	ldr	r3, [r6, #72]
  10a7e8:	e3730001 	cmn	r3, #1	; 0x1
  10a7ec:	02833001 	addeq	r3, r3, #1	; 0x1
  10a7f0:	05863048 	streq	r3, [r6, #72]
  10a7f4:	eb0003c3 	bl	10b708 <vPortExitCritical>
  10a7f8:	e3540001 	cmp	r4, #1	; 0x1
  10a7fc:	0a000029 	beq	10a8a8 <xQueueGenericSend+0x144>
  10a800:	eb0003b5 	bl	10b6dc <vPortEnterCritical>
  10a804:	e5965038 	ldr	r5, [r6, #56]
  10a808:	e596403c 	ldr	r4, [r6, #60]
  10a80c:	eb0003bd 	bl	10b708 <vPortExitCritical>
  10a810:	e1550004 	cmp	r5, r4
  10a814:	1a00001c 	bne	10a88c <xQueueGenericSend+0x128>
  10a818:	e28d0004 	add	r0, sp, #4	; 0x4
  10a81c:	e1a0100d 	mov	r1, sp
  10a820:	eb000088 	bl	10aa48 <xTaskCheckForTimeOut>
  10a824:	e3500000 	cmp	r0, #0	; 0x0
  10a828:	1a000017 	bne	10a88c <xQueueGenericSend+0x128>
  10a82c:	e59d1000 	ldr	r1, [sp]
  10a830:	e2860010 	add	r0, r6, #16	; 0x10
  10a834:	eb000148 	bl	10ad5c <vTaskPlaceOnEventList>
  10a838:	e1a00006 	mov	r0, r6
  10a83c:	ebffff23 	bl	10a4d0 <prvUnlockQueue>
  10a840:	eb000215 	bl	10b09c <xTaskResumeAll>
  10a844:	e3500000 	cmp	r0, #0	; 0x0
  10a848:	1affffcd 	bne	10a784 <xQueueGenericSend+0x20>
  10a84c:	ef000000 	swi	0x00000000
  10a850:	eb0003a1 	bl	10b6dc <vPortEnterCritical>
  10a854:	e5962038 	ldr	r2, [r6, #56]
  10a858:	e596303c 	ldr	r3, [r6, #60]
  10a85c:	e1520003 	cmp	r2, r3
  10a860:	2affffcc 	bcs	10a798 <xQueueGenericSend+0x34>
  10a864:	e1a01007 	mov	r1, r7
  10a868:	e1a02008 	mov	r2, r8
  10a86c:	e1a00006 	mov	r0, r6
  10a870:	ebfffed0 	bl	10a3b8 <prvCopyDataToQueue>
  10a874:	e5963024 	ldr	r3, [r6, #36]
  10a878:	e3530000 	cmp	r3, #0	; 0x0
  10a87c:	1a00000c 	bne	10a8b4 <xQueueGenericSend+0x150>
  10a880:	eb0003a0 	bl	10b708 <vPortExitCritical>
  10a884:	e3a00001 	mov	r0, #1	; 0x1
  10a888:	ea000004 	b	10a8a0 <xQueueGenericSend+0x13c>
  10a88c:	e1a00006 	mov	r0, r6
  10a890:	ebffff0e 	bl	10a4d0 <prvUnlockQueue>
  10a894:	eb000200 	bl	10b09c <xTaskResumeAll>
  10a898:	eaffffb9 	b	10a784 <xQueueGenericSend+0x20>
  10a89c:	e3a00000 	mov	r0, #0	; 0x0
  10a8a0:	e28dd00c 	add	sp, sp, #12	; 0xc
  10a8a4:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10a8a8:	e28d0004 	add	r0, sp, #4	; 0x4
  10a8ac:	eb000058 	bl	10aa14 <vTaskSetTimeOutState>
  10a8b0:	eaffffd2 	b	10a800 <xQueueGenericSend+0x9c>
  10a8b4:	e2860024 	add	r0, r6, #36	; 0x24
  10a8b8:	eb0000a3 	bl	10ab4c <xTaskRemoveFromEventList>
  10a8bc:	e3500001 	cmp	r0, #1	; 0x1
  10a8c0:	1affffee 	bne	10a880 <xQueueGenericSend+0x11c>
  10a8c4:	ef000000 	swi	0x00000000
  10a8c8:	eaffffec 	b	10a880 <xQueueGenericSend+0x11c>

0010a8cc <xQueueCreate>:
  10a8cc:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10a8d0:	e2507000 	subs	r7, r0, #0	; 0x0
  10a8d4:	e1a06001 	mov	r6, r1
  10a8d8:	e3a0004c 	mov	r0, #76	; 0x4c
  10a8dc:	1a000002 	bne	10a8ec <xQueueCreate+0x20>
  10a8e0:	e3a05000 	mov	r5, #0	; 0x0
  10a8e4:	e1a00005 	mov	r0, r5
  10a8e8:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10a8ec:	eb0003f8 	bl	10b8d4 <pvPortMalloc>
  10a8f0:	e3500000 	cmp	r0, #0	; 0x0
  10a8f4:	e1a05000 	mov	r5, r0
  10a8f8:	0afffff8 	beq	10a8e0 <xQueueCreate+0x14>
  10a8fc:	e0040796 	mul	r4, r6, r7
  10a900:	e2840001 	add	r0, r4, #1	; 0x1
  10a904:	eb0003f2 	bl	10b8d4 <pvPortMalloc>
  10a908:	e1a08000 	mov	r8, r0
  10a90c:	e3580000 	cmp	r8, #0	; 0x0
  10a910:	e0803004 	add	r3, r0, r4
  10a914:	e2472001 	sub	r2, r7, #1	; 0x1
  10a918:	e3e01000 	mvn	r1, #0	; 0x0
  10a91c:	e2850010 	add	r0, r5, #16	; 0x10
  10a920:	e5858000 	str	r8, [r5]
  10a924:	0a00000d 	beq	10a960 <xQueueCreate+0x94>
  10a928:	e0228296 	mla	r2, r6, r2, r8
  10a92c:	e5853004 	str	r3, [r5, #4]
  10a930:	e3a03000 	mov	r3, #0	; 0x0
  10a934:	e5853038 	str	r3, [r5, #56]
  10a938:	e585200c 	str	r2, [r5, #12]
  10a93c:	e585703c 	str	r7, [r5, #60]
  10a940:	e5856040 	str	r6, [r5, #64]
  10a944:	e5851048 	str	r1, [r5, #72]
  10a948:	e5858008 	str	r8, [r5, #8]
  10a94c:	e5851044 	str	r1, [r5, #68]
  10a950:	ebfffe3e 	bl	10a250 <vListInitialise>
  10a954:	e2850024 	add	r0, r5, #36	; 0x24
  10a958:	ebfffe3c 	bl	10a250 <vListInitialise>
  10a95c:	eaffffe0 	b	10a8e4 <xQueueCreate+0x18>
  10a960:	e1a00005 	mov	r0, r5
  10a964:	eb0003d2 	bl	10b8b4 <vPortFree>
  10a968:	e1a05008 	mov	r5, r8
  10a96c:	eaffffdc 	b	10a8e4 <xQueueCreate+0x18>

0010a970 <vTaskSwitchContext>:
  10a970:	e59f3088 	ldr	r3, [pc, #136]	; 10aa00 <prog+0xa9bc>
  10a974:	e5932000 	ldr	r2, [r3]
  10a978:	e3520000 	cmp	r2, #0	; 0x0
  10a97c:	159f3080 	ldrne	r3, [pc, #128]	; 10aa04 <prog+0xa9c0>
  10a980:	13a02001 	movne	r2, #1	; 0x1
  10a984:	15832000 	strne	r2, [r3]
  10a988:	112fff1e 	bxne	lr
  10a98c:	e59f1074 	ldr	r1, [pc, #116]	; 10aa08 <prog+0xa9c4>
  10a990:	e5913000 	ldr	r3, [r1]
  10a994:	e59f0070 	ldr	r0, [pc, #112]	; 10aa0c <prog+0xa9c8>
  10a998:	e0833103 	add	r3, r3, r3, lsl #2
  10a99c:	e7902103 	ldr	r2, [r0, r3, lsl #2]
  10a9a0:	e3520000 	cmp	r2, #0	; 0x0
  10a9a4:	1a000007 	bne	10a9c8 <vTaskSwitchContext+0x58>
  10a9a8:	e5913000 	ldr	r3, [r1]
  10a9ac:	e2433001 	sub	r3, r3, #1	; 0x1
  10a9b0:	e5813000 	str	r3, [r1]
  10a9b4:	e5912000 	ldr	r2, [r1]
  10a9b8:	e0822102 	add	r2, r2, r2, lsl #2
  10a9bc:	e7903102 	ldr	r3, [r0, r2, lsl #2]
  10a9c0:	e3530000 	cmp	r3, #0	; 0x0
  10a9c4:	0afffff7 	beq	10a9a8 <vTaskSwitchContext+0x38>
  10a9c8:	e5913000 	ldr	r3, [r1]
  10a9cc:	e0833103 	add	r3, r3, r3, lsl #2
  10a9d0:	e0802103 	add	r2, r0, r3, lsl #2
  10a9d4:	e5921004 	ldr	r1, [r2, #4]
  10a9d8:	e5911004 	ldr	r1, [r1, #4]
  10a9dc:	e2823008 	add	r3, r2, #8	; 0x8
  10a9e0:	e5821004 	str	r1, [r2, #4]
  10a9e4:	e1510003 	cmp	r1, r3
  10a9e8:	05911004 	ldreq	r1, [r1, #4]
  10a9ec:	e59f301c 	ldr	r3, [pc, #28]	; 10aa10 <prog+0xa9cc>
  10a9f0:	05821004 	streq	r1, [r2, #4]
  10a9f4:	e591200c 	ldr	r2, [r1, #12]
  10a9f8:	e5832000 	str	r2, [r3]
  10a9fc:	e12fff1e 	bx	lr
  10aa00:	00200d14 	eoreq	r0, r0, r4, lsl sp
  10aa04:	00200d08 	eoreq	r0, r0, r8, lsl #26
  10aa08:	00200d18 	eoreq	r0, r0, r8, lsl sp
  10aa0c:	00200d30 	eoreq	r0, r0, r0, lsr sp
  10aa10:	00200d04 	eoreq	r0, r0, r4, lsl #26

0010aa14 <vTaskSetTimeOutState>:
  10aa14:	e59f3010 	ldr	r3, [pc, #16]	; 10aa2c <prog+0xa9e8>
  10aa18:	e59f2010 	ldr	r2, [pc, #16]	; 10aa30 <prog+0xa9ec>
  10aa1c:	e5931000 	ldr	r1, [r3]
  10aa20:	e5923000 	ldr	r3, [r2]
  10aa24:	e880000a 	stmia	r0, {r1, r3}
  10aa28:	e12fff1e 	bx	lr
  10aa2c:	00200d0c 	eoreq	r0, r0, ip, lsl #26
  10aa30:	00200d10 	eoreq	r0, r0, r0, lsl sp

0010aa34 <vTaskMissedYield>:
  10aa34:	e59f3008 	ldr	r3, [pc, #8]	; 10aa44 <prog+0xaa00>
  10aa38:	e3a02001 	mov	r2, #1	; 0x1
  10aa3c:	e5832000 	str	r2, [r3]
  10aa40:	e12fff1e 	bx	lr
  10aa44:	00200d08 	eoreq	r0, r0, r8, lsl #26

0010aa48 <xTaskCheckForTimeOut>:
  10aa48:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  10aa4c:	e1a06001 	mov	r6, r1
  10aa50:	e1a04000 	mov	r4, r0
  10aa54:	eb000320 	bl	10b6dc <vPortEnterCritical>
  10aa58:	e596c000 	ldr	ip, [r6]
  10aa5c:	e37c0001 	cmn	ip, #1	; 0x1
  10aa60:	e3a05000 	mov	r5, #0	; 0x0
  10aa64:	0a000010 	beq	10aaac <xTaskCheckForTimeOut+0x64>
  10aa68:	e59f3090 	ldr	r3, [pc, #144]	; 10ab00 <prog+0xaabc>
  10aa6c:	e5942000 	ldr	r2, [r4]
  10aa70:	e5931000 	ldr	r1, [r3]
  10aa74:	e1520001 	cmp	r2, r1
  10aa78:	e59fe084 	ldr	lr, [pc, #132]	; 10ab04 <prog+0xaac0>
  10aa7c:	0a000016 	beq	10aadc <xTaskCheckForTimeOut+0x94>
  10aa80:	e59e3000 	ldr	r3, [lr]
  10aa84:	e5941004 	ldr	r1, [r4, #4]
  10aa88:	e1510003 	cmp	r1, r3
  10aa8c:	9a000005 	bls	10aaa8 <xTaskCheckForTimeOut+0x60>
  10aa90:	e59e3000 	ldr	r3, [lr]
  10aa94:	e0613003 	rsb	r3, r1, r3
  10aa98:	e15c0003 	cmp	ip, r3
  10aa9c:	e1a00004 	mov	r0, r4
  10aaa0:	e3a05000 	mov	r5, #0	; 0x0
  10aaa4:	8a000003 	bhi	10aab8 <xTaskCheckForTimeOut+0x70>
  10aaa8:	e3a05001 	mov	r5, #1	; 0x1
  10aaac:	eb000315 	bl	10b708 <vPortExitCritical>
  10aab0:	e1a00005 	mov	r0, r5
  10aab4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10aab8:	e59f2044 	ldr	r2, [pc, #68]	; 10ab04 <prog+0xaac0>
  10aabc:	e5923000 	ldr	r3, [r2]
  10aac0:	e0613003 	rsb	r3, r1, r3
  10aac4:	e063300c 	rsb	r3, r3, ip
  10aac8:	e5863000 	str	r3, [r6]
  10aacc:	ebffffd0 	bl	10aa14 <vTaskSetTimeOutState>
  10aad0:	eb00030c 	bl	10b708 <vPortExitCritical>
  10aad4:	e1a00005 	mov	r0, r5
  10aad8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10aadc:	e59fe020 	ldr	lr, [pc, #32]	; 10ab04 <prog+0xaac0>
  10aae0:	e5941004 	ldr	r1, [r4, #4]
  10aae4:	e59e3000 	ldr	r3, [lr]
  10aae8:	e0613003 	rsb	r3, r1, r3
  10aaec:	e15c0003 	cmp	ip, r3
  10aaf0:	e1a00004 	mov	r0, r4
  10aaf4:	e3a05000 	mov	r5, #0	; 0x0
  10aaf8:	9affffea 	bls	10aaa8 <xTaskCheckForTimeOut+0x60>
  10aafc:	eaffffed 	b	10aab8 <xTaskCheckForTimeOut+0x70>
  10ab00:	00200d0c 	eoreq	r0, r0, ip, lsl #26
  10ab04:	00200d10 	eoreq	r0, r0, r0, lsl sp

0010ab08 <xTaskGetTickCount>:
  10ab08:	e92d4010 	stmdb	sp!, {r4, lr}
  10ab0c:	eb0002f2 	bl	10b6dc <vPortEnterCritical>
  10ab10:	e59f300c 	ldr	r3, [pc, #12]	; 10ab24 <prog+0xaae0>
  10ab14:	e5934000 	ldr	r4, [r3]
  10ab18:	eb0002fa 	bl	10b708 <vPortExitCritical>
  10ab1c:	e1a00004 	mov	r0, r4
  10ab20:	e8bd8010 	ldmia	sp!, {r4, pc}
  10ab24:	00200d10 	eoreq	r0, r0, r0, lsl sp

0010ab28 <vTaskSuspendAll>:
  10ab28:	e52de004 	str	lr, [sp, #-4]!
  10ab2c:	eb0002ea 	bl	10b6dc <vPortEnterCritical>
  10ab30:	e59f2010 	ldr	r2, [pc, #16]	; 10ab48 <prog+0xab04>
  10ab34:	e5923000 	ldr	r3, [r2]
  10ab38:	e2833001 	add	r3, r3, #1	; 0x1
  10ab3c:	e5823000 	str	r3, [r2]
  10ab40:	e49de004 	ldr	lr, [sp], #4
  10ab44:	ea0002ef 	b	10b708 <vPortExitCritical>
  10ab48:	00200d14 	eoreq	r0, r0, r4, lsl sp

0010ab4c <xTaskRemoveFromEventList>:
  10ab4c:	e5903000 	ldr	r3, [r0]
  10ab50:	e3530000 	cmp	r3, #0	; 0x0
  10ab54:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  10ab58:	e1a06003 	mov	r6, r3
  10ab5c:	1590300c 	ldrne	r3, [r0, #12]
  10ab60:	1593600c 	ldrne	r6, [r3, #12]
  10ab64:	e2864018 	add	r4, r6, #24	; 0x18
  10ab68:	e1a00004 	mov	r0, r4
  10ab6c:	ebfffde9 	bl	10a318 <vListRemove>
  10ab70:	e59f3064 	ldr	r3, [pc, #100]	; 10abdc <prog+0xab98>
  10ab74:	e5932000 	ldr	r2, [r3]
  10ab78:	e2865004 	add	r5, r6, #4	; 0x4
  10ab7c:	e3520000 	cmp	r2, #0	; 0x0
  10ab80:	e1a00005 	mov	r0, r5
  10ab84:	e1a01004 	mov	r1, r4
  10ab88:	159f0050 	ldrne	r0, [pc, #80]	; 10abe0 <prog+0xab9c>
  10ab8c:	1a000009 	bne	10abb8 <xTaskRemoveFromEventList+0x6c>
  10ab90:	ebfffde0 	bl	10a318 <vListRemove>
  10ab94:	e59fe048 	ldr	lr, [pc, #72]	; 10abe4 <prog+0xaba0>
  10ab98:	e596c02c 	ldr	ip, [r6, #44]
  10ab9c:	e59e2000 	ldr	r2, [lr]
  10aba0:	e59f0040 	ldr	r0, [pc, #64]	; 10abe8 <prog+0xaba4>
  10aba4:	e15c0002 	cmp	ip, r2
  10aba8:	e08c310c 	add	r3, ip, ip, lsl #2
  10abac:	858ec000 	strhi	ip, [lr]
  10abb0:	e1a01005 	mov	r1, r5
  10abb4:	e0800103 	add	r0, r0, r3, lsl #2
  10abb8:	ebfffdb0 	bl	10a280 <vListInsertEnd>
  10abbc:	e59f3028 	ldr	r3, [pc, #40]	; 10abec <prog+0xaba8>
  10abc0:	e5932000 	ldr	r2, [r3]
  10abc4:	e596102c 	ldr	r1, [r6, #44]
  10abc8:	e592002c 	ldr	r0, [r2, #44]
  10abcc:	e1510000 	cmp	r1, r0
  10abd0:	33a00000 	movcc	r0, #0	; 0x0
  10abd4:	23a00001 	movcs	r0, #1	; 0x1
  10abd8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10abdc:	00200d14 	eoreq	r0, r0, r4, lsl sp
  10abe0:	00200dc4 	eoreq	r0, r0, r4, asr #27
  10abe4:	00200d18 	eoreq	r0, r0, r8, lsl sp
  10abe8:	00200d30 	eoreq	r0, r0, r0, lsr sp
  10abec:	00200d04 	eoreq	r0, r0, r4, lsl #26

0010abf0 <vTaskIncrementTick>:
  10abf0:	e59f3144 	ldr	r3, [pc, #324]	; 10ad3c <prog+0xacf8>
  10abf4:	e5932000 	ldr	r2, [r3]
  10abf8:	e3520000 	cmp	r2, #0	; 0x0
  10abfc:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  10ac00:	1a000039 	bne	10acec <vTaskIncrementTick+0xfc>
  10ac04:	e59f6134 	ldr	r6, [pc, #308]	; 10ad40 <prog+0xacfc>
  10ac08:	e5963000 	ldr	r3, [r6]
  10ac0c:	e2833001 	add	r3, r3, #1	; 0x1
  10ac10:	e5863000 	str	r3, [r6]
  10ac14:	e5962000 	ldr	r2, [r6]
  10ac18:	e3520000 	cmp	r2, #0	; 0x0
  10ac1c:	e1a0c006 	mov	ip, r6
  10ac20:	159fa11c 	ldrne	sl, [pc, #284]	; 10ad44 <prog+0xad00>
  10ac24:	0a000035 	beq	10ad00 <vTaskIncrementTick+0x110>
  10ac28:	e59a3000 	ldr	r3, [sl]
  10ac2c:	e5932000 	ldr	r2, [r3]
  10ac30:	e3520000 	cmp	r2, #0	; 0x0
  10ac34:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10ac38:	e59f3104 	ldr	r3, [pc, #260]	; 10ad44 <prog+0xad00>
  10ac3c:	e5932000 	ldr	r2, [r3]
  10ac40:	e592100c 	ldr	r1, [r2, #12]
  10ac44:	e591300c 	ldr	r3, [r1, #12]
  10ac48:	e3530000 	cmp	r3, #0	; 0x0
  10ac4c:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10ac50:	e1a04003 	mov	r4, r3
  10ac54:	e59c2000 	ldr	r2, [ip]
  10ac58:	e5933004 	ldr	r3, [r3, #4]
  10ac5c:	e1530002 	cmp	r3, r2
  10ac60:	959f80e0 	ldrls	r8, [pc, #224]	; 10ad48 <prog+0xad04>
  10ac64:	959f70e0 	ldrls	r7, [pc, #224]	; 10ad4c <prog+0xad08>
  10ac68:	9a000004 	bls	10ac80 <vTaskIncrementTick+0x90>
  10ac6c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10ac70:	e5962000 	ldr	r2, [r6]
  10ac74:	e5943004 	ldr	r3, [r4, #4]
  10ac78:	e1530002 	cmp	r3, r2
  10ac7c:	88bd85f0 	ldmhiia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10ac80:	e2845004 	add	r5, r4, #4	; 0x4
  10ac84:	e1a00005 	mov	r0, r5
  10ac88:	ebfffda2 	bl	10a318 <vListRemove>
  10ac8c:	e5943028 	ldr	r3, [r4, #40]
  10ac90:	e3530000 	cmp	r3, #0	; 0x0
  10ac94:	e2840018 	add	r0, r4, #24	; 0x18
  10ac98:	1bfffd9e 	blne	10a318 <vListRemove>
  10ac9c:	e594202c 	ldr	r2, [r4, #44]
  10aca0:	e5983000 	ldr	r3, [r8]
  10aca4:	e1520003 	cmp	r2, r3
  10aca8:	859f3098 	ldrhi	r3, [pc, #152]	; 10ad48 <prog+0xad04>
  10acac:	e0820102 	add	r0, r2, r2, lsl #2
  10acb0:	85832000 	strhi	r2, [r3]
  10acb4:	e1a01005 	mov	r1, r5
  10acb8:	e0870100 	add	r0, r7, r0, lsl #2
  10acbc:	ebfffd6f 	bl	10a280 <vListInsertEnd>
  10acc0:	e59a3000 	ldr	r3, [sl]
  10acc4:	e5932000 	ldr	r2, [r3]
  10acc8:	e3520000 	cmp	r2, #0	; 0x0
  10accc:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10acd0:	e59f306c 	ldr	r3, [pc, #108]	; 10ad44 <prog+0xad00>
  10acd4:	e5932000 	ldr	r2, [r3]
  10acd8:	e592100c 	ldr	r1, [r2, #12]
  10acdc:	e591300c 	ldr	r3, [r1, #12]
  10ace0:	e2534000 	subs	r4, r3, #0	; 0x0
  10ace4:	1affffe1 	bne	10ac70 <vTaskIncrementTick+0x80>
  10ace8:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10acec:	e59f205c 	ldr	r2, [pc, #92]	; 10ad50 <prog+0xad0c>
  10acf0:	e5923000 	ldr	r3, [r2]
  10acf4:	e2833001 	add	r3, r3, #1	; 0x1
  10acf8:	e5823000 	str	r3, [r2]
  10acfc:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10ad00:	e59fa03c 	ldr	sl, [pc, #60]	; 10ad44 <prog+0xad00>
  10ad04:	e59f1048 	ldr	r1, [pc, #72]	; 10ad54 <prog+0xad10>
  10ad08:	e59a0000 	ldr	r0, [sl]
  10ad0c:	e5913000 	ldr	r3, [r1]
  10ad10:	e59f2040 	ldr	r2, [pc, #64]	; 10ad58 <prog+0xad14>
  10ad14:	e58a3000 	str	r3, [sl]
  10ad18:	e5810000 	str	r0, [r1]
  10ad1c:	e5923000 	ldr	r3, [r2]
  10ad20:	e2833001 	add	r3, r3, #1	; 0x1
  10ad24:	e5823000 	str	r3, [r2]
  10ad28:	e59a3000 	ldr	r3, [sl]
  10ad2c:	e5932000 	ldr	r2, [r3]
  10ad30:	e3520000 	cmp	r2, #0	; 0x0
  10ad34:	1affffbf 	bne	10ac38 <vTaskIncrementTick+0x48>
  10ad38:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  10ad3c:	00200d14 	eoreq	r0, r0, r4, lsl sp
  10ad40:	00200d10 	eoreq	r0, r0, r0, lsl sp
  10ad44:	00200dbc 	streqh	r0, [r0], -ip
  10ad48:	00200d18 	eoreq	r0, r0, r8, lsl sp
  10ad4c:	00200d30 	eoreq	r0, r0, r0, lsr sp
  10ad50:	00200d1c 	eoreq	r0, r0, ip, lsl sp
  10ad54:	00200dc0 	eoreq	r0, r0, r0, asr #27
  10ad58:	00200d0c 	eoreq	r0, r0, ip, lsl #26

0010ad5c <vTaskPlaceOnEventList>:
  10ad5c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10ad60:	e59f406c 	ldr	r4, [pc, #108]	; 10add4 <prog+0xad90>
  10ad64:	e5943000 	ldr	r3, [r4]
  10ad68:	e1a05001 	mov	r5, r1
  10ad6c:	e2831018 	add	r1, r3, #24	; 0x18
  10ad70:	ebfffd4f 	bl	10a2b4 <vListInsert>
  10ad74:	e5940000 	ldr	r0, [r4]
  10ad78:	e2800004 	add	r0, r0, #4	; 0x4
  10ad7c:	ebfffd65 	bl	10a318 <vListRemove>
  10ad80:	e3750001 	cmn	r5, #1	; 0x1
  10ad84:	e59f004c 	ldr	r0, [pc, #76]	; 10add8 <prog+0xad94>
  10ad88:	e59f204c 	ldr	r2, [pc, #76]	; 10addc <prog+0xad98>
  10ad8c:	0a00000c 	beq	10adc4 <vTaskPlaceOnEventList+0x68>
  10ad90:	e5923000 	ldr	r3, [r2]
  10ad94:	e5941000 	ldr	r1, [r4]
  10ad98:	e5922000 	ldr	r2, [r2]
  10ad9c:	e0853003 	add	r3, r5, r3
  10ada0:	e1530002 	cmp	r3, r2
  10ada4:	e5813004 	str	r3, [r1, #4]
  10ada8:	359f3030 	ldrcc	r3, [pc, #48]	; 10ade0 <prog+0xad9c>
  10adac:	259f3030 	ldrcs	r3, [pc, #48]	; 10ade4 <prog+0xada0>
  10adb0:	e5930000 	ldr	r0, [r3]
  10adb4:	e5941000 	ldr	r1, [r4]
  10adb8:	e2811004 	add	r1, r1, #4	; 0x4
  10adbc:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  10adc0:	eafffd3b 	b	10a2b4 <vListInsert>
  10adc4:	e5941000 	ldr	r1, [r4]
  10adc8:	e2811004 	add	r1, r1, #4	; 0x4
  10adcc:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  10add0:	eafffd2a 	b	10a280 <vListInsertEnd>
  10add4:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10add8:	00200dec 	eoreq	r0, r0, ip, ror #27
  10addc:	00200d10 	eoreq	r0, r0, r0, lsl sp
  10ade0:	00200dc0 	eoreq	r0, r0, r0, asr #27
  10ade4:	00200dbc 	streqh	r0, [r0], -ip

0010ade8 <xTaskCreate>:
  10ade8:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10adec:	e1a02802 	mov	r2, r2, lsl #16
  10adf0:	e1a0a000 	mov	sl, r0
  10adf4:	e3a00044 	mov	r0, #68	; 0x44
  10adf8:	e1a05001 	mov	r5, r1
  10adfc:	e1a08003 	mov	r8, r3
  10ae00:	e1a07822 	mov	r7, r2, lsr #16
  10ae04:	e59db024 	ldr	fp, [sp, #36]
  10ae08:	eb0002b1 	bl	10b8d4 <pvPortMalloc>
  10ae0c:	e2506000 	subs	r6, r0, #0	; 0x0
  10ae10:	02400001 	subeq	r0, r0, #1	; 0x1
  10ae14:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10ae18:	e1a04107 	mov	r4, r7, lsl #2
  10ae1c:	e1a00004 	mov	r0, r4
  10ae20:	eb0002ab 	bl	10b8d4 <pvPortMalloc>
  10ae24:	e3500000 	cmp	r0, #0	; 0x0
  10ae28:	e5860030 	str	r0, [r6, #48]
  10ae2c:	0a00006b 	beq	10afe0 <xTaskCreate+0x1f8>
  10ae30:	e1a02004 	mov	r2, r4
  10ae34:	e3a010a5 	mov	r1, #165	; 0xa5
  10ae38:	ebffd78b 	bl	100c6c <memset>
  10ae3c:	e1a01005 	mov	r1, r5
  10ae40:	e3a02010 	mov	r2, #16	; 0x10
  10ae44:	e2860034 	add	r0, r6, #52	; 0x34
  10ae48:	ebffd80a 	bl	100e78 <strncpy>
  10ae4c:	e35b0004 	cmp	fp, #4	; 0x4
  10ae50:	31a0400b 	movcc	r4, fp
  10ae54:	23a04004 	movcs	r4, #4	; 0x4
  10ae58:	e3a03000 	mov	r3, #0	; 0x0
  10ae5c:	e2869004 	add	r9, r6, #4	; 0x4
  10ae60:	e5c63043 	strb	r3, [r6, #67]
  10ae64:	e586402c 	str	r4, [r6, #44]
  10ae68:	e1a00009 	mov	r0, r9
  10ae6c:	ebfffd00 	bl	10a274 <vListInitialiseItem>
  10ae70:	e2860018 	add	r0, r6, #24	; 0x18
  10ae74:	ebfffcfe 	bl	10a274 <vListInitialiseItem>
  10ae78:	e5960030 	ldr	r0, [r6, #48]
  10ae7c:	e2644005 	rsb	r4, r4, #5	; 0x5
  10ae80:	e0800107 	add	r0, r0, r7, lsl #2
  10ae84:	e1a0100a 	mov	r1, sl
  10ae88:	e1a02008 	mov	r2, r8
  10ae8c:	e5864018 	str	r4, [r6, #24]
  10ae90:	e5866010 	str	r6, [r6, #16]
  10ae94:	e5866024 	str	r6, [r6, #36]
  10ae98:	e2400004 	sub	r0, r0, #4	; 0x4
  10ae9c:	eb000177 	bl	10b480 <pxPortInitialiseStack>
  10aea0:	e5860000 	str	r0, [r6]
  10aea4:	eb00020c 	bl	10b6dc <vPortEnterCritical>
  10aea8:	e59f2140 	ldr	r2, [pc, #320]	; 10aff0 <prog+0xafac>
  10aeac:	e5923000 	ldr	r3, [r2]
  10aeb0:	e2833001 	add	r3, r3, #1	; 0x1
  10aeb4:	e5823000 	str	r3, [r2]
  10aeb8:	e5921000 	ldr	r1, [r2]
  10aebc:	e3510001 	cmp	r1, #1	; 0x1
  10aec0:	0a00002a 	beq	10af70 <xTaskCreate+0x188>
  10aec4:	e59f7128 	ldr	r7, [pc, #296]	; 10aff4 <prog+0xafb0>
  10aec8:	e5973000 	ldr	r3, [r7]
  10aecc:	e3530000 	cmp	r3, #0	; 0x0
  10aed0:	0a00001c 	beq	10af48 <xTaskCreate+0x160>
  10aed4:	e59f811c 	ldr	r8, [pc, #284]	; 10aff8 <prog+0xafb4>
  10aed8:	e59f111c 	ldr	r1, [pc, #284]	; 10affc <prog+0xafb8>
  10aedc:	e596202c 	ldr	r2, [r6, #44]
  10aee0:	e5913000 	ldr	r3, [r1]
  10aee4:	e1520003 	cmp	r2, r3
  10aee8:	85812000 	strhi	r2, [r1]
  10aeec:	e59f110c 	ldr	r1, [pc, #268]	; 10b000 <prog+0xafbc>
  10aef0:	e5913000 	ldr	r3, [r1]
  10aef4:	e0820102 	add	r0, r2, r2, lsl #2
  10aef8:	e1520003 	cmp	r2, r3
  10aefc:	85812000 	strhi	r2, [r1]
  10af00:	e0880100 	add	r0, r8, r0, lsl #2
  10af04:	e1a01009 	mov	r1, r9
  10af08:	ebfffcdc 	bl	10a280 <vListInsertEnd>
  10af0c:	eb0001fd 	bl	10b708 <vPortExitCritical>
  10af10:	e59d3028 	ldr	r3, [sp, #40]
  10af14:	e3530000 	cmp	r3, #0	; 0x0
  10af18:	15836000 	strne	r6, [r3]
  10af1c:	e5973000 	ldr	r3, [r7]
  10af20:	e3530000 	cmp	r3, #0	; 0x0
  10af24:	0a00000f 	beq	10af68 <xTaskCreate+0x180>
  10af28:	e59f30d4 	ldr	r3, [pc, #212]	; 10b004 <prog+0xafc0>
  10af2c:	e5932000 	ldr	r2, [r3]
  10af30:	e592102c 	ldr	r1, [r2, #44]
  10af34:	e151000b 	cmp	r1, fp
  10af38:	2a00000a 	bcs	10af68 <xTaskCreate+0x180>
  10af3c:	ef000000 	swi	0x00000000
  10af40:	e3a00001 	mov	r0, #1	; 0x1
  10af44:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10af48:	e59f10b4 	ldr	r1, [pc, #180]	; 10b004 <prog+0xafc0>
  10af4c:	e5913000 	ldr	r3, [r1]
  10af50:	e593202c 	ldr	r2, [r3, #44]
  10af54:	e15b0002 	cmp	fp, r2
  10af58:	259f8098 	ldrcs	r8, [pc, #152]	; 10aff8 <prog+0xafb4>
  10af5c:	25816000 	strcs	r6, [r1]
  10af60:	2affffdc 	bcs	10aed8 <xTaskCreate+0xf0>
  10af64:	eaffffda 	b	10aed4 <xTaskCreate+0xec>
  10af68:	e3a00001 	mov	r0, #1	; 0x1
  10af6c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10af70:	e59f308c 	ldr	r3, [pc, #140]	; 10b004 <prog+0xafc0>
  10af74:	e59f807c 	ldr	r8, [pc, #124]	; 10aff8 <prog+0xafb4>
  10af78:	e5836000 	str	r6, [r3]
  10af7c:	e1a04008 	mov	r4, r8
  10af80:	e2885064 	add	r5, r8, #100	; 0x64
  10af84:	e1a00004 	mov	r0, r4
  10af88:	e2844014 	add	r4, r4, #20	; 0x14
  10af8c:	ebfffcaf 	bl	10a250 <vListInitialise>
  10af90:	e1540005 	cmp	r4, r5
  10af94:	1afffffa 	bne	10af84 <xTaskCreate+0x19c>
  10af98:	e59f4068 	ldr	r4, [pc, #104]	; 10b008 <prog+0xafc4>
  10af9c:	e59f5068 	ldr	r5, [pc, #104]	; 10b00c <prog+0xafc8>
  10afa0:	e1a00004 	mov	r0, r4
  10afa4:	ebfffca9 	bl	10a250 <vListInitialise>
  10afa8:	e1a00005 	mov	r0, r5
  10afac:	ebfffca7 	bl	10a250 <vListInitialise>
  10afb0:	e59f0058 	ldr	r0, [pc, #88]	; 10b010 <prog+0xafcc>
  10afb4:	ebfffca5 	bl	10a250 <vListInitialise>
  10afb8:	e59f0054 	ldr	r0, [pc, #84]	; 10b014 <prog+0xafd0>
  10afbc:	ebfffca3 	bl	10a250 <vListInitialise>
  10afc0:	e59f0050 	ldr	r0, [pc, #80]	; 10b018 <prog+0xafd4>
  10afc4:	ebfffca1 	bl	10a250 <vListInitialise>
  10afc8:	e59f7024 	ldr	r7, [pc, #36]	; 10aff4 <prog+0xafb0>
  10afcc:	e59f3048 	ldr	r3, [pc, #72]	; 10b01c <prog+0xafd8>
  10afd0:	e59f2048 	ldr	r2, [pc, #72]	; 10b020 <prog+0xafdc>
  10afd4:	e5834000 	str	r4, [r3]
  10afd8:	e5825000 	str	r5, [r2]
  10afdc:	eaffffbd 	b	10aed8 <xTaskCreate+0xf0>
  10afe0:	e1a00006 	mov	r0, r6
  10afe4:	eb000232 	bl	10b8b4 <vPortFree>
  10afe8:	e3e00000 	mvn	r0, #0	; 0x0
  10afec:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10aff0:	00200d20 	eoreq	r0, r0, r0, lsr #26
  10aff4:	00200d24 	eoreq	r0, r0, r4, lsr #26
  10aff8:	00200d30 	eoreq	r0, r0, r0, lsr sp
  10affc:	00200d2c 	eoreq	r0, r0, ip, lsr #26
  10b000:	00200d18 	eoreq	r0, r0, r8, lsl sp
  10b004:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10b008:	00200d94 	mlaeq	r0, r4, sp, r0
  10b00c:	00200da8 	eoreq	r0, r0, r8, lsr #27
  10b010:	00200dc4 	eoreq	r0, r0, r4, asr #27
  10b014:	00200dd8 	ldreqd	r0, [r0], -r8
  10b018:	00200dec 	eoreq	r0, r0, ip, ror #27
  10b01c:	00200dbc 	streqh	r0, [r0], -ip
  10b020:	00200dc0 	eoreq	r0, r0, r0, asr #27

0010b024 <vTaskStartScheduler>:
  10b024:	e92d4010 	stmdb	sp!, {r4, lr}
  10b028:	e3a04000 	mov	r4, #0	; 0x0
  10b02c:	e24dd008 	sub	sp, sp, #8	; 0x8
  10b030:	e59f1054 	ldr	r1, [pc, #84]	; 10b08c <prog+0xb048>
  10b034:	e3a0206e 	mov	r2, #110	; 0x6e
  10b038:	e1a03004 	mov	r3, r4
  10b03c:	e59f004c 	ldr	r0, [pc, #76]	; 10b090 <prog+0xb04c>
  10b040:	e58d4000 	str	r4, [sp]
  10b044:	e58d4004 	str	r4, [sp, #4]
  10b048:	ebffff66 	bl	10ade8 <xTaskCreate>
  10b04c:	e3500001 	cmp	r0, #1	; 0x1
  10b050:	0a000001 	beq	10b05c <vTaskStartScheduler+0x38>
  10b054:	e28dd008 	add	sp, sp, #8	; 0x8
  10b058:	e8bd8010 	ldmia	sp!, {r4, pc}
  10b05c:	e92d0001 	stmdb	sp!, {r0}
  10b060:	e10f0000 	mrs	r0, CPSR
  10b064:	e38000c0 	orr	r0, r0, #192	; 0xc0
  10b068:	e129f000 	msr	CPSR_fc, r0
  10b06c:	e8bd0001 	ldmia	sp!, {r0}
  10b070:	e59f301c 	ldr	r3, [pc, #28]	; 10b094 <prog+0xb050>
  10b074:	e59f201c 	ldr	r2, [pc, #28]	; 10b098 <prog+0xb054>
  10b078:	e5830000 	str	r0, [r3]
  10b07c:	e5824000 	str	r4, [r2]
  10b080:	e28dd008 	add	sp, sp, #8	; 0x8
  10b084:	e8bd4010 	ldmia	sp!, {r4, lr}
  10b088:	ea00016c 	b	10b640 <xPortStartScheduler>
  10b08c:	0010cde8 	andeqs	ip, r0, r8, ror #27
  10b090:	0010b320 	andeqs	fp, r0, r0, lsr #6
  10b094:	00200d24 	eoreq	r0, r0, r4, lsr #26
  10b098:	00200d10 	eoreq	r0, r0, r0, lsl sp

0010b09c <xTaskResumeAll>:
  10b09c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10b0a0:	e59fb248 	ldr	fp, [pc, #584]	; 10b2f0 <prog+0xb2ac>
  10b0a4:	eb00018c 	bl	10b6dc <vPortEnterCritical>
  10b0a8:	e59b3000 	ldr	r3, [fp]
  10b0ac:	e2433001 	sub	r3, r3, #1	; 0x1
  10b0b0:	e58b3000 	str	r3, [fp]
  10b0b4:	e59b1000 	ldr	r1, [fp]
  10b0b8:	e3510000 	cmp	r1, #0	; 0x0
  10b0bc:	1a000006 	bne	10b0dc <xTaskResumeAll+0x40>
  10b0c0:	e59f322c 	ldr	r3, [pc, #556]	; 10b2f4 <prog+0xb2b0>
  10b0c4:	e5932000 	ldr	r2, [r3]
  10b0c8:	e3520000 	cmp	r2, #0	; 0x0
  10b0cc:	159f9224 	ldrne	r9, [pc, #548]	; 10b2f8 <prog+0xb2b4>
  10b0d0:	11a06001 	movne	r6, r1
  10b0d4:	11a0a009 	movne	sl, r9
  10b0d8:	1a00001a 	bne	10b148 <xTaskResumeAll+0xac>
  10b0dc:	eb000189 	bl	10b708 <vPortExitCritical>
  10b0e0:	e3a04000 	mov	r4, #0	; 0x0
  10b0e4:	e1a00004 	mov	r0, r4
  10b0e8:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10b0ec:	e599300c 	ldr	r3, [r9, #12]
  10b0f0:	e593400c 	ldr	r4, [r3, #12]
  10b0f4:	e3540000 	cmp	r4, #0	; 0x0
  10b0f8:	e2840018 	add	r0, r4, #24	; 0x18
  10b0fc:	e2845004 	add	r5, r4, #4	; 0x4
  10b100:	0a000015 	beq	10b15c <xTaskResumeAll+0xc0>
  10b104:	ebfffc83 	bl	10a318 <vListRemove>
  10b108:	e1a00005 	mov	r0, r5
  10b10c:	ebfffc81 	bl	10a318 <vListRemove>
  10b110:	e594202c 	ldr	r2, [r4, #44]
  10b114:	e5973000 	ldr	r3, [r7]
  10b118:	e0820102 	add	r0, r2, r2, lsl #2
  10b11c:	e1520003 	cmp	r2, r3
  10b120:	e1a01005 	mov	r1, r5
  10b124:	e0880100 	add	r0, r8, r0, lsl #2
  10b128:	85872000 	strhi	r2, [r7]
  10b12c:	ebfffc53 	bl	10a280 <vListInsertEnd>
  10b130:	e59f31c4 	ldr	r3, [pc, #452]	; 10b2fc <prog+0xb2b8>
  10b134:	e5932000 	ldr	r2, [r3]
  10b138:	e594102c 	ldr	r1, [r4, #44]
  10b13c:	e592302c 	ldr	r3, [r2, #44]
  10b140:	e1510003 	cmp	r1, r3
  10b144:	23a06001 	movcs	r6, #1	; 0x1
  10b148:	e59a3000 	ldr	r3, [sl]
  10b14c:	e3530000 	cmp	r3, #0	; 0x0
  10b150:	e59f81a8 	ldr	r8, [pc, #424]	; 10b300 <prog+0xb2bc>
  10b154:	e59f71a8 	ldr	r7, [pc, #424]	; 10b304 <prog+0xb2c0>
  10b158:	1affffe3 	bne	10b0ec <xTaskResumeAll+0x50>
  10b15c:	e59fa1a4 	ldr	sl, [pc, #420]	; 10b308 <prog+0xb2c4>
  10b160:	e59a3000 	ldr	r3, [sl]
  10b164:	e3530000 	cmp	r3, #0	; 0x0
  10b168:	0a000059 	beq	10b2d4 <xTaskResumeAll+0x238>
  10b16c:	e59a3000 	ldr	r3, [sl]
  10b170:	e3530000 	cmp	r3, #0	; 0x0
  10b174:	0a00004e 	beq	10b2b4 <xTaskResumeAll+0x218>
  10b178:	e59b3000 	ldr	r3, [fp]
  10b17c:	e3530000 	cmp	r3, #0	; 0x0
  10b180:	159a3000 	ldrne	r3, [sl]
  10b184:	12833001 	addne	r3, r3, #1	; 0x1
  10b188:	158a3000 	strne	r3, [sl]
  10b18c:	1a000042 	bne	10b29c <xTaskResumeAll+0x200>
  10b190:	e59f6174 	ldr	r6, [pc, #372]	; 10b30c <prog+0xb2c8>
  10b194:	e5963000 	ldr	r3, [r6]
  10b198:	e2833001 	add	r3, r3, #1	; 0x1
  10b19c:	e5863000 	str	r3, [r6]
  10b1a0:	e5962000 	ldr	r2, [r6]
  10b1a4:	e3520000 	cmp	r2, #0	; 0x0
  10b1a8:	e1a0c006 	mov	ip, r6
  10b1ac:	159f915c 	ldrne	r9, [pc, #348]	; 10b310 <prog+0xb2cc>
  10b1b0:	1a000009 	bne	10b1dc <xTaskResumeAll+0x140>
  10b1b4:	e59f9154 	ldr	r9, [pc, #340]	; 10b310 <prog+0xb2cc>
  10b1b8:	e59f1154 	ldr	r1, [pc, #340]	; 10b314 <prog+0xb2d0>
  10b1bc:	e5990000 	ldr	r0, [r9]
  10b1c0:	e5913000 	ldr	r3, [r1]
  10b1c4:	e59f214c 	ldr	r2, [pc, #332]	; 10b318 <prog+0xb2d4>
  10b1c8:	e5893000 	str	r3, [r9]
  10b1cc:	e5810000 	str	r0, [r1]
  10b1d0:	e5923000 	ldr	r3, [r2]
  10b1d4:	e2833001 	add	r3, r3, #1	; 0x1
  10b1d8:	e5823000 	str	r3, [r2]
  10b1dc:	e5993000 	ldr	r3, [r9]
  10b1e0:	e5932000 	ldr	r2, [r3]
  10b1e4:	e3520000 	cmp	r2, #0	; 0x0
  10b1e8:	0a00002b 	beq	10b29c <xTaskResumeAll+0x200>
  10b1ec:	e59f311c 	ldr	r3, [pc, #284]	; 10b310 <prog+0xb2cc>
  10b1f0:	e5932000 	ldr	r2, [r3]
  10b1f4:	e592100c 	ldr	r1, [r2, #12]
  10b1f8:	e591300c 	ldr	r3, [r1, #12]
  10b1fc:	e3530000 	cmp	r3, #0	; 0x0
  10b200:	0a000025 	beq	10b29c <xTaskResumeAll+0x200>
  10b204:	e1a04003 	mov	r4, r3
  10b208:	e59c2000 	ldr	r2, [ip]
  10b20c:	e5933004 	ldr	r3, [r3, #4]
  10b210:	e1530002 	cmp	r3, r2
  10b214:	959f70e8 	ldrls	r7, [pc, #232]	; 10b304 <prog+0xb2c0>
  10b218:	959f80e0 	ldrls	r8, [pc, #224]	; 10b300 <prog+0xb2bc>
  10b21c:	9a00000a 	bls	10b24c <xTaskResumeAll+0x1b0>
  10b220:	ea00001d 	b	10b29c <xTaskResumeAll+0x200>
  10b224:	e59f30e4 	ldr	r3, [pc, #228]	; 10b310 <prog+0xb2cc>
  10b228:	e5932000 	ldr	r2, [r3]
  10b22c:	e592100c 	ldr	r1, [r2, #12]
  10b230:	e591300c 	ldr	r3, [r1, #12]
  10b234:	e2534000 	subs	r4, r3, #0	; 0x0
  10b238:	0a000017 	beq	10b29c <xTaskResumeAll+0x200>
  10b23c:	e5962000 	ldr	r2, [r6]
  10b240:	e5943004 	ldr	r3, [r4, #4]
  10b244:	e1530002 	cmp	r3, r2
  10b248:	8a000013 	bhi	10b29c <xTaskResumeAll+0x200>
  10b24c:	e2845004 	add	r5, r4, #4	; 0x4
  10b250:	e1a00005 	mov	r0, r5
  10b254:	ebfffc2f 	bl	10a318 <vListRemove>
  10b258:	e5943028 	ldr	r3, [r4, #40]
  10b25c:	e3530000 	cmp	r3, #0	; 0x0
  10b260:	e2840018 	add	r0, r4, #24	; 0x18
  10b264:	1bfffc2b 	blne	10a318 <vListRemove>
  10b268:	e594202c 	ldr	r2, [r4, #44]
  10b26c:	e5973000 	ldr	r3, [r7]
  10b270:	e1520003 	cmp	r2, r3
  10b274:	859f3088 	ldrhi	r3, [pc, #136]	; 10b304 <prog+0xb2c0>
  10b278:	e0820102 	add	r0, r2, r2, lsl #2
  10b27c:	85832000 	strhi	r2, [r3]
  10b280:	e1a01005 	mov	r1, r5
  10b284:	e0880100 	add	r0, r8, r0, lsl #2
  10b288:	ebfffbfc 	bl	10a280 <vListInsertEnd>
  10b28c:	e5993000 	ldr	r3, [r9]
  10b290:	e5932000 	ldr	r2, [r3]
  10b294:	e3520000 	cmp	r2, #0	; 0x0
  10b298:	1affffe1 	bne	10b224 <xTaskResumeAll+0x188>
  10b29c:	e59a3000 	ldr	r3, [sl]
  10b2a0:	e2433001 	sub	r3, r3, #1	; 0x1
  10b2a4:	e58a3000 	str	r3, [sl]
  10b2a8:	e59a2000 	ldr	r2, [sl]
  10b2ac:	e3520000 	cmp	r2, #0	; 0x0
  10b2b0:	1affffb0 	bne	10b178 <xTaskResumeAll+0xdc>
  10b2b4:	e59f2060 	ldr	r2, [pc, #96]	; 10b31c <prog+0xb2d8>
  10b2b8:	e3a03000 	mov	r3, #0	; 0x0
  10b2bc:	e5823000 	str	r3, [r2]
  10b2c0:	ef000000 	swi	0x00000000
  10b2c4:	eb00010f 	bl	10b708 <vPortExitCritical>
  10b2c8:	e3a04001 	mov	r4, #1	; 0x1
  10b2cc:	e1a00004 	mov	r0, r4
  10b2d0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10b2d4:	e3560001 	cmp	r6, #1	; 0x1
  10b2d8:	0afffff5 	beq	10b2b4 <xTaskResumeAll+0x218>
  10b2dc:	e59f2038 	ldr	r2, [pc, #56]	; 10b31c <prog+0xb2d8>
  10b2e0:	e5923000 	ldr	r3, [r2]
  10b2e4:	e3530001 	cmp	r3, #1	; 0x1
  10b2e8:	1affff7b 	bne	10b0dc <xTaskResumeAll+0x40>
  10b2ec:	eafffff1 	b	10b2b8 <xTaskResumeAll+0x21c>
  10b2f0:	00200d14 	eoreq	r0, r0, r4, lsl sp
  10b2f4:	00200d20 	eoreq	r0, r0, r0, lsr #26
  10b2f8:	00200dc4 	eoreq	r0, r0, r4, asr #27
  10b2fc:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10b300:	00200d30 	eoreq	r0, r0, r0, lsr sp
  10b304:	00200d18 	eoreq	r0, r0, r8, lsl sp
  10b308:	00200d1c 	eoreq	r0, r0, ip, lsl sp
  10b30c:	00200d10 	eoreq	r0, r0, r0, lsl sp
  10b310:	00200dbc 	streqh	r0, [r0], -ip
  10b314:	00200dc0 	eoreq	r0, r0, r0, asr #27
  10b318:	00200d0c 	eoreq	r0, r0, ip, lsl #26
  10b31c:	00200d08 	eoreq	r0, r0, r8, lsl #26

0010b320 <prvIdleTask>:
  10b320:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  10b324:	e59f50a0 	ldr	r5, [pc, #160]	; 10b3cc <prog+0xb388>
  10b328:	e5953000 	ldr	r3, [r5]
  10b32c:	e59f709c 	ldr	r7, [pc, #156]	; 10b3d0 <prog+0xb38c>
  10b330:	e3530000 	cmp	r3, #0	; 0x0
  10b334:	e59f8098 	ldr	r8, [pc, #152]	; 10b3d4 <prog+0xb390>
  10b338:	e59f6098 	ldr	r6, [pc, #152]	; 10b3d8 <prog+0xb394>
  10b33c:	e287a008 	add	sl, r7, #8	; 0x8
  10b340:	1a000007 	bne	10b364 <prvIdleTask+0x44>
  10b344:	e5963000 	ldr	r3, [r6]
  10b348:	e3530001 	cmp	r3, #1	; 0x1
  10b34c:	9a000000 	bls	10b354 <prvIdleTask+0x34>
  10b350:	ef000000 	swi	0x00000000
  10b354:	ebfff697 	bl	108db8 <vApplicationIdleHook>
  10b358:	e5953000 	ldr	r3, [r5]
  10b35c:	e3530000 	cmp	r3, #0	; 0x0
  10b360:	0afffff7 	beq	10b344 <prvIdleTask+0x24>
  10b364:	ebfffdef 	bl	10ab28 <vTaskSuspendAll>
  10b368:	e5974000 	ldr	r4, [r7]
  10b36c:	ebffff4a 	bl	10b09c <xTaskResumeAll>
  10b370:	e3540000 	cmp	r4, #0	; 0x0
  10b374:	0afffff2 	beq	10b344 <prvIdleTask+0x24>
  10b378:	eb0000d7 	bl	10b6dc <vPortEnterCritical>
  10b37c:	e59f304c 	ldr	r3, [pc, #76]	; 10b3d0 <prog+0xb38c>
  10b380:	e5932000 	ldr	r2, [r3]
  10b384:	e3520000 	cmp	r2, #0	; 0x0
  10b388:	159a3004 	ldrne	r3, [sl, #4]
  10b38c:	e1a04002 	mov	r4, r2
  10b390:	1593400c 	ldrne	r4, [r3, #12]
  10b394:	e2840004 	add	r0, r4, #4	; 0x4
  10b398:	ebfffbde 	bl	10a318 <vListRemove>
  10b39c:	e5983000 	ldr	r3, [r8]
  10b3a0:	e2433001 	sub	r3, r3, #1	; 0x1
  10b3a4:	e5883000 	str	r3, [r8]
  10b3a8:	e5952000 	ldr	r2, [r5]
  10b3ac:	e2422001 	sub	r2, r2, #1	; 0x1
  10b3b0:	e5852000 	str	r2, [r5]
  10b3b4:	eb0000d3 	bl	10b708 <vPortExitCritical>
  10b3b8:	e5940030 	ldr	r0, [r4, #48]
  10b3bc:	eb00013c 	bl	10b8b4 <vPortFree>
  10b3c0:	e1a00004 	mov	r0, r4
  10b3c4:	eb00013a 	bl	10b8b4 <vPortFree>
  10b3c8:	eaffffdd 	b	10b344 <prvIdleTask+0x24>
  10b3cc:	00200d28 	eoreq	r0, r0, r8, lsr #26
  10b3d0:	00200dd8 	ldreqd	r0, [r0], -r8
  10b3d4:	00200d20 	eoreq	r0, r0, r0, lsr #26
  10b3d8:	00200d30 	eoreq	r0, r0, r0, lsr sp

0010b3dc <vTaskDelay>:
  10b3dc:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10b3e0:	e2505000 	subs	r5, r0, #0	; 0x0
  10b3e4:	e59f6084 	ldr	r6, [pc, #132]	; 10b470 <prog+0xb42c>
  10b3e8:	e59f7084 	ldr	r7, [pc, #132]	; 10b474 <prog+0xb430>
  10b3ec:	1a000001 	bne	10b3f8 <vTaskDelay+0x1c>
  10b3f0:	ef000000 	swi	0x00000000
  10b3f4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10b3f8:	ebfffdca 	bl	10ab28 <vTaskSuspendAll>
  10b3fc:	e5974000 	ldr	r4, [r7]
  10b400:	e5960000 	ldr	r0, [r6]
  10b404:	e2800004 	add	r0, r0, #4	; 0x4
  10b408:	ebfffbc2 	bl	10a318 <vListRemove>
  10b40c:	e5962000 	ldr	r2, [r6]
  10b410:	e5973000 	ldr	r3, [r7]
  10b414:	e0854004 	add	r4, r5, r4
  10b418:	e1540003 	cmp	r4, r3
  10b41c:	e5824004 	str	r4, [r2, #4]
  10b420:	2a000009 	bcs	10b44c <vTaskDelay+0x70>
  10b424:	e59f304c 	ldr	r3, [pc, #76]	; 10b478 <prog+0xb434>
  10b428:	e5930000 	ldr	r0, [r3]
  10b42c:	e5961000 	ldr	r1, [r6]
  10b430:	e2811004 	add	r1, r1, #4	; 0x4
  10b434:	ebfffb9e 	bl	10a2b4 <vListInsert>
  10b438:	ebffff17 	bl	10b09c <xTaskResumeAll>
  10b43c:	e3500000 	cmp	r0, #0	; 0x0
  10b440:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
  10b444:	ef000000 	swi	0x00000000
  10b448:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10b44c:	e59f3028 	ldr	r3, [pc, #40]	; 10b47c <prog+0xb438>
  10b450:	e5930000 	ldr	r0, [r3]
  10b454:	e5961000 	ldr	r1, [r6]
  10b458:	e2811004 	add	r1, r1, #4	; 0x4
  10b45c:	ebfffb94 	bl	10a2b4 <vListInsert>
  10b460:	ebffff0d 	bl	10b09c <xTaskResumeAll>
  10b464:	e3500000 	cmp	r0, #0	; 0x0
  10b468:	0afffff5 	beq	10b444 <vTaskDelay+0x68>
  10b46c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10b470:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10b474:	00200d10 	eoreq	r0, r0, r0, lsl sp
  10b478:	00200dc0 	eoreq	r0, r0, r0, asr #27
  10b47c:	00200dbc 	streqh	r0, [r0], -ip

0010b480 <pxPortInitialiseStack>:
  10b480:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10b484:	e2811004 	add	r1, r1, #4	; 0x4
  10b488:	e1a0b000 	mov	fp, r0
  10b48c:	e40b1004 	str	r1, [fp], #-4
  10b490:	e24b1004 	sub	r1, fp, #4	; 0x4
  10b494:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  10b498:	e2413004 	sub	r3, r1, #4	; 0x4
  10b49c:	e58d1004 	str	r1, [sp, #4]
  10b4a0:	e2431004 	sub	r1, r3, #4	; 0x4
  10b4a4:	e58d3008 	str	r3, [sp, #8]
  10b4a8:	e2413004 	sub	r3, r1, #4	; 0x4
  10b4ac:	e58d100c 	str	r1, [sp, #12]
  10b4b0:	e2431004 	sub	r1, r3, #4	; 0x4
  10b4b4:	e58d3010 	str	r3, [sp, #16]
  10b4b8:	e2413004 	sub	r3, r1, #4	; 0x4
  10b4bc:	e58d1014 	str	r1, [sp, #20]
  10b4c0:	e2431004 	sub	r1, r3, #4	; 0x4
  10b4c4:	e58d3018 	str	r3, [sp, #24]
  10b4c8:	e2413004 	sub	r3, r1, #4	; 0x4
  10b4cc:	e58d101c 	str	r1, [sp, #28]
  10b4d0:	e2431004 	sub	r1, r3, #4	; 0x4
  10b4d4:	e58d3020 	str	r3, [sp, #32]
  10b4d8:	e2413004 	sub	r3, r1, #4	; 0x4
  10b4dc:	e58d1024 	str	r1, [sp, #36]
  10b4e0:	e2431004 	sub	r1, r3, #4	; 0x4
  10b4e4:	e58d3028 	str	r3, [sp, #40]
  10b4e8:	e2413004 	sub	r3, r1, #4	; 0x4
  10b4ec:	e58d102c 	str	r1, [sp, #44]
  10b4f0:	e2431004 	sub	r1, r3, #4	; 0x4
  10b4f4:	e58d1034 	str	r1, [sp, #52]
  10b4f8:	e58d3030 	str	r3, [sp, #48]
  10b4fc:	e59d3034 	ldr	r3, [sp, #52]
  10b500:	e2433004 	sub	r3, r3, #4	; 0x4
  10b504:	e58d0000 	str	r0, [sp]
  10b508:	e58d3038 	str	r3, [sp, #56]
  10b50c:	e2430004 	sub	r0, r3, #4	; 0x4
  10b510:	e3a03caa 	mov	r3, #43520	; 0xaa00
  10b514:	e59d1000 	ldr	r1, [sp]
  10b518:	e28330aa 	add	r3, r3, #170	; 0xaa
  10b51c:	e1833803 	orr	r3, r3, r3, lsl #16
  10b520:	e5013004 	str	r3, [r1, #-4]
  10b524:	e3a03c12 	mov	r3, #4608	; 0x1200
  10b528:	e50b1004 	str	r1, [fp, #-4]
  10b52c:	e2833012 	add	r3, r3, #18	; 0x12
  10b530:	e59d1004 	ldr	r1, [sp, #4]
  10b534:	e1833803 	orr	r3, r3, r3, lsl #16
  10b538:	e3a09c11 	mov	r9, #4352	; 0x1100
  10b53c:	e3a0aa01 	mov	sl, #4096	; 0x1000
  10b540:	e5013004 	str	r3, [r1, #-4]
  10b544:	e2899011 	add	r9, r9, #17	; 0x11
  10b548:	e28d1008 	add	r1, sp, #8	; 0x8
  10b54c:	e891000a 	ldmia	r1, {r1, r3}
  10b550:	e28aa010 	add	sl, sl, #16	; 0x10
  10b554:	e1899809 	orr	r9, r9, r9, lsl #16
  10b558:	e18aa80a 	orr	sl, sl, sl, lsl #16
  10b55c:	e3a08c09 	mov	r8, #2304	; 0x900
  10b560:	e3a07b02 	mov	r7, #2048	; 0x800
  10b564:	e5019004 	str	r9, [r1, #-4]
  10b568:	e2888009 	add	r8, r8, #9	; 0x9
  10b56c:	e503a004 	str	sl, [r3, #-4]
  10b570:	e28d1010 	add	r1, sp, #16	; 0x10
  10b574:	e891000a 	ldmia	r1, {r1, r3}
  10b578:	e2877008 	add	r7, r7, #8	; 0x8
  10b57c:	e1888808 	orr	r8, r8, r8, lsl #16
  10b580:	e1877807 	orr	r7, r7, r7, lsl #16
  10b584:	e3a06c07 	mov	r6, #1792	; 0x700
  10b588:	e3a05c06 	mov	r5, #1536	; 0x600
  10b58c:	e5018004 	str	r8, [r1, #-4]
  10b590:	e2866007 	add	r6, r6, #7	; 0x7
  10b594:	e5037004 	str	r7, [r3, #-4]
  10b598:	e28d1018 	add	r1, sp, #24	; 0x18
  10b59c:	e891000a 	ldmia	r1, {r1, r3}
  10b5a0:	e2855006 	add	r5, r5, #6	; 0x6
  10b5a4:	e1866806 	orr	r6, r6, r6, lsl #16
  10b5a8:	e1855805 	orr	r5, r5, r5, lsl #16
  10b5ac:	e3a04c05 	mov	r4, #1280	; 0x500
  10b5b0:	e5016004 	str	r6, [r1, #-4]
  10b5b4:	e2844005 	add	r4, r4, #5	; 0x5
  10b5b8:	e5035004 	str	r5, [r3, #-4]
  10b5bc:	e59d1020 	ldr	r1, [sp, #32]
  10b5c0:	e1844804 	orr	r4, r4, r4, lsl #16
  10b5c4:	e3a0eb01 	mov	lr, #1024	; 0x400
  10b5c8:	e3a0cc03 	mov	ip, #768	; 0x300
  10b5cc:	e5014004 	str	r4, [r1, #-4]
  10b5d0:	e59d3024 	ldr	r3, [sp, #36]
  10b5d4:	e59d1028 	ldr	r1, [sp, #40]
  10b5d8:	e28ee004 	add	lr, lr, #4	; 0x4
  10b5dc:	e28cc003 	add	ip, ip, #3	; 0x3
  10b5e0:	e18ee80e 	orr	lr, lr, lr, lsl #16
  10b5e4:	e18cc80c 	orr	ip, ip, ip, lsl #16
  10b5e8:	e503e004 	str	lr, [r3, #-4]
  10b5ec:	e501c004 	str	ip, [r1, #-4]
  10b5f0:	e3a01c02 	mov	r1, #512	; 0x200
  10b5f4:	e59d302c 	ldr	r3, [sp, #44]
  10b5f8:	e2811002 	add	r1, r1, #2	; 0x2
  10b5fc:	e1811801 	orr	r1, r1, r1, lsl #16
  10b600:	e5031004 	str	r1, [r3, #-4]
  10b604:	e3a01c01 	mov	r1, #256	; 0x100
  10b608:	e59d3030 	ldr	r3, [sp, #48]
  10b60c:	e2811001 	add	r1, r1, #1	; 0x1
  10b610:	e1811801 	orr	r1, r1, r1, lsl #16
  10b614:	e5031004 	str	r1, [r3, #-4]
  10b618:	e59d3034 	ldr	r3, [sp, #52]
  10b61c:	e59d1038 	ldr	r1, [sp, #56]
  10b620:	e5032004 	str	r2, [r3, #-4]
  10b624:	e3a0301f 	mov	r3, #31	; 0x1f
  10b628:	e3a02000 	mov	r2, #0	; 0x0
  10b62c:	e5013004 	str	r3, [r1, #-4]
  10b630:	e5002004 	str	r2, [r0, #-4]
  10b634:	e2400004 	sub	r0, r0, #4	; 0x4
  10b638:	e28dd03c 	add	sp, sp, #60	; 0x3c
  10b63c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

0010b640 <xPortStartScheduler>:
  10b640:	e52de004 	str	lr, [sp, #-4]!
  10b644:	e3a01007 	mov	r1, #7	; 0x7
  10b648:	e3a02000 	mov	r2, #0	; 0x0
  10b64c:	e59f3030 	ldr	r3, [pc, #48]	; 10b684 <prog+0xb640>
  10b650:	e3a00001 	mov	r0, #1	; 0x1
  10b654:	ebfffacb 	bl	10a188 <AT91F_AIC_ConfigureIt>
  10b658:	e3a03403 	mov	r3, #50331648	; 0x3000000
  10b65c:	e2833ebb 	add	r3, r3, #2992	; 0xbb0
  10b660:	e3e02c02 	mvn	r2, #512	; 0x200
  10b664:	e2833003 	add	r3, r3, #3	; 0x3
  10b668:	e50230cf 	str	r3, [r2, #-207]
  10b66c:	e3a01002 	mov	r1, #2	; 0x2
  10b670:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10b674:	e5831021 	str	r1, [r3, #33]
  10b678:	eb000002 	bl	10b688 <vPortISRStartFirstTask>
  10b67c:	e3a00000 	mov	r0, #0	; 0x0
  10b680:	e49df004 	ldr	pc, [sp], #4
  10b684:	0010b74c 	andeqs	fp, r0, ip, asr #14

0010b688 <vPortISRStartFirstTask>:
  10b688:	e59f0044 	ldr	r0, [pc, #68]	; 10b6d4 <prog+0xb690>
  10b68c:	e5900000 	ldr	r0, [r0]
  10b690:	e590e000 	ldr	lr, [r0]
  10b694:	e59f003c 	ldr	r0, [pc, #60]	; 10b6d8 <prog+0xb694>
  10b698:	e8be0002 	ldmia	lr!, {r1}
  10b69c:	e5801000 	str	r1, [r0]
  10b6a0:	e8be0001 	ldmia	lr!, {r0}
  10b6a4:	e169f000 	msr	SPSR_fc, r0
  10b6a8:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10b6ac:	e1a00000 	nop			(mov r0,r0)
  10b6b0:	e59ee03c 	ldr	lr, [lr, #60]
  10b6b4:	e25ef004 	subs	pc, lr, #4	; 0x4
  10b6b8:	e59f300c 	ldr	r3, [pc, #12]	; 10b6cc <prog+0xb688>
  10b6bc:	e59f200c 	ldr	r2, [pc, #12]	; 10b6d0 <prog+0xb68c>
  10b6c0:	e5931000 	ldr	r1, [r3]
  10b6c4:	e5923000 	ldr	r3, [r2]
  10b6c8:	e12fff1e 	bx	lr
  10b6cc:	00200838 	eoreq	r0, r0, r8, lsr r8
  10b6d0:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10b6d4:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10b6d8:	00200838 	eoreq	r0, r0, r8, lsr r8

0010b6dc <vPortEnterCritical>:
  10b6dc:	e92d0001 	stmdb	sp!, {r0}
  10b6e0:	e10f0000 	mrs	r0, CPSR
  10b6e4:	e38000c0 	orr	r0, r0, #192	; 0xc0
  10b6e8:	e129f000 	msr	CPSR_fc, r0
  10b6ec:	e8bd0001 	ldmia	sp!, {r0}
  10b6f0:	e59f200c 	ldr	r2, [pc, #12]	; 10b704 <prog+0xb6c0>
  10b6f4:	e5923000 	ldr	r3, [r2]
  10b6f8:	e2833001 	add	r3, r3, #1	; 0x1
  10b6fc:	e5823000 	str	r3, [r2]
  10b700:	e12fff1e 	bx	lr
  10b704:	00200838 	eoreq	r0, r0, r8, lsr r8

0010b708 <vPortExitCritical>:
  10b708:	e59f2038 	ldr	r2, [pc, #56]	; 10b748 <prog+0xb704>
  10b70c:	e5923000 	ldr	r3, [r2]
  10b710:	e3530000 	cmp	r3, #0	; 0x0
  10b714:	012fff1e 	bxeq	lr
  10b718:	e5923000 	ldr	r3, [r2]
  10b71c:	e2433001 	sub	r3, r3, #1	; 0x1
  10b720:	e5823000 	str	r3, [r2]
  10b724:	e5922000 	ldr	r2, [r2]
  10b728:	e3520000 	cmp	r2, #0	; 0x0
  10b72c:	112fff1e 	bxne	lr
  10b730:	e92d0001 	stmdb	sp!, {r0}
  10b734:	e10f0000 	mrs	r0, CPSR
  10b738:	e3c000c0 	bic	r0, r0, #192	; 0xc0
  10b73c:	e129f000 	msr	CPSR_fc, r0
  10b740:	e8bd0001 	ldmia	sp!, {r0}
  10b744:	e12fff1e 	bx	lr
  10b748:	00200838 	eoreq	r0, r0, r8, lsr r8

0010b74c <vPreemptiveTick>:
  10b74c:	e92d0001 	stmdb	sp!, {r0}
  10b750:	e94d2000 	stmdb	sp, {sp}^
  10b754:	e1a00000 	nop			(mov r0,r0)
  10b758:	e24dd004 	sub	sp, sp, #4	; 0x4
  10b75c:	e8bd0001 	ldmia	sp!, {r0}
  10b760:	e9204000 	stmdb	r0!, {lr}
  10b764:	e1a0e000 	mov	lr, r0
  10b768:	e8bd0001 	ldmia	sp!, {r0}
  10b76c:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10b770:	e1a00000 	nop			(mov r0,r0)
  10b774:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10b778:	e14f0000 	mrs	r0, SPSR
  10b77c:	e92e0001 	stmdb	lr!, {r0}
  10b780:	e59f0078 	ldr	r0, [pc, #120]	; 10b800 <prog+0xb7bc>
  10b784:	e5900000 	ldr	r0, [r0]
  10b788:	e92e0001 	stmdb	lr!, {r0}
  10b78c:	e59f0070 	ldr	r0, [pc, #112]	; 10b804 <prog+0xb7c0>
  10b790:	e5900000 	ldr	r0, [r0]
  10b794:	e580e000 	str	lr, [r0]
  10b798:	e59f4058 	ldr	r4, [pc, #88]	; 10b7f8 <prog+0xb7b4>
  10b79c:	e59f5058 	ldr	r5, [pc, #88]	; 10b7fc <prog+0xb7b8>
  10b7a0:	e5943000 	ldr	r3, [r4]
  10b7a4:	e5952000 	ldr	r2, [r5]
  10b7a8:	ebfffd10 	bl	10abf0 <vTaskIncrementTick>
  10b7ac:	ebfffc6f 	bl	10a970 <vTaskSwitchContext>
  10b7b0:	e3e03c02 	mvn	r3, #512	; 0x200
  10b7b4:	e51310c7 	ldr	r1, [r3, #-199]
  10b7b8:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  10b7bc:	e5821031 	str	r1, [r2, #49]
  10b7c0:	e59f003c 	ldr	r0, [pc, #60]	; 10b804 <prog+0xb7c0>
  10b7c4:	e5900000 	ldr	r0, [r0]
  10b7c8:	e590e000 	ldr	lr, [r0]
  10b7cc:	e59f002c 	ldr	r0, [pc, #44]	; 10b800 <prog+0xb7bc>
  10b7d0:	e8be0002 	ldmia	lr!, {r1}
  10b7d4:	e5801000 	str	r1, [r0]
  10b7d8:	e8be0001 	ldmia	lr!, {r0}
  10b7dc:	e169f000 	msr	SPSR_fc, r0
  10b7e0:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10b7e4:	e1a00000 	nop			(mov r0,r0)
  10b7e8:	e59ee03c 	ldr	lr, [lr, #60]
  10b7ec:	e25ef004 	subs	pc, lr, #4	; 0x4
  10b7f0:	e5943000 	ldr	r3, [r4]
  10b7f4:	e5952000 	ldr	r2, [r5]
  10b7f8:	00200838 	eoreq	r0, r0, r8, lsr r8
  10b7fc:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10b800:	00200838 	eoreq	r0, r0, r8, lsr r8
  10b804:	00200d04 	eoreq	r0, r0, r4, lsl #26

0010b808 <swi_handler>:
  10b808:	e28ee004 	add	lr, lr, #4	; 0x4
  10b80c:	e92d0001 	stmdb	sp!, {r0}
  10b810:	e94d2000 	stmdb	sp, {sp}^
  10b814:	e1a00000 	nop			(mov r0,r0)
  10b818:	e24dd004 	sub	sp, sp, #4	; 0x4
  10b81c:	e8bd0001 	ldmia	sp!, {r0}
  10b820:	e9204000 	stmdb	r0!, {lr}
  10b824:	e1a0e000 	mov	lr, r0
  10b828:	e8bd0001 	ldmia	sp!, {r0}
  10b82c:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10b830:	e1a00000 	nop			(mov r0,r0)
  10b834:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10b838:	e14f0000 	mrs	r0, SPSR
  10b83c:	e92e0001 	stmdb	lr!, {r0}
  10b840:	e59f0064 	ldr	r0, [pc, #100]	; 10b8ac <prog+0xb868>
  10b844:	e5900000 	ldr	r0, [r0]
  10b848:	e92e0001 	stmdb	lr!, {r0}
  10b84c:	e59f005c 	ldr	r0, [pc, #92]	; 10b8b0 <prog+0xb86c>
  10b850:	e5900000 	ldr	r0, [r0]
  10b854:	e580e000 	str	lr, [r0]
  10b858:	e59f4044 	ldr	r4, [pc, #68]	; 10b8a4 <prog+0xb860>
  10b85c:	e59f5044 	ldr	r5, [pc, #68]	; 10b8a8 <prog+0xb864>
  10b860:	e5943000 	ldr	r3, [r4]
  10b864:	e5952000 	ldr	r2, [r5]
  10b868:	ebfffc40 	bl	10a970 <vTaskSwitchContext>
  10b86c:	e59f003c 	ldr	r0, [pc, #60]	; 10b8b0 <prog+0xb86c>
  10b870:	e5900000 	ldr	r0, [r0]
  10b874:	e590e000 	ldr	lr, [r0]
  10b878:	e59f002c 	ldr	r0, [pc, #44]	; 10b8ac <prog+0xb868>
  10b87c:	e8be0002 	ldmia	lr!, {r1}
  10b880:	e5801000 	str	r1, [r0]
  10b884:	e8be0001 	ldmia	lr!, {r0}
  10b888:	e169f000 	msr	SPSR_fc, r0
  10b88c:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10b890:	e1a00000 	nop			(mov r0,r0)
  10b894:	e59ee03c 	ldr	lr, [lr, #60]
  10b898:	e25ef004 	subs	pc, lr, #4	; 0x4
  10b89c:	e5943000 	ldr	r3, [r4]
  10b8a0:	e5952000 	ldr	r2, [r5]
  10b8a4:	00200838 	eoreq	r0, r0, r8, lsr r8
  10b8a8:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10b8ac:	00200838 	eoreq	r0, r0, r8, lsr r8
  10b8b0:	00200d04 	eoreq	r0, r0, r4, lsl #26

0010b8b4 <vPortFree>:
  10b8b4:	e92d4010 	stmdb	sp!, {r4, lr}
  10b8b8:	e2504000 	subs	r4, r0, #0	; 0x0
  10b8bc:	08bd8010 	ldmeqia	sp!, {r4, pc}
  10b8c0:	ebfffc98 	bl	10ab28 <vTaskSuspendAll>
  10b8c4:	e1a00004 	mov	r0, r4
  10b8c8:	ebffd2d9 	bl	100434 <free>
  10b8cc:	e8bd4010 	ldmia	sp!, {r4, lr}
  10b8d0:	eafffdf1 	b	10b09c <xTaskResumeAll>

0010b8d4 <pvPortMalloc>:
  10b8d4:	e92d4010 	stmdb	sp!, {r4, lr}
  10b8d8:	e1a04000 	mov	r4, r0
  10b8dc:	ebfffc91 	bl	10ab28 <vTaskSuspendAll>
  10b8e0:	e1a00004 	mov	r0, r4
  10b8e4:	ebffd2d7 	bl	100448 <malloc>
  10b8e8:	e1a04000 	mov	r4, r0
  10b8ec:	ebfffdea 	bl	10b09c <xTaskResumeAll>
  10b8f0:	e1a00004 	mov	r0, r4
  10b8f4:	e8bd8010 	ldmia	sp!, {r4, pc}

0010b8f8 <vDetachUSBInterface>:
  10b8f8:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  10b8fc:	e3a03801 	mov	r3, #65536	; 0x10000
  10b900:	e50230ff 	str	r3, [r2, #-255]
  10b904:	e50230ef 	str	r3, [r2, #-239]
  10b908:	e50230cf 	str	r3, [r2, #-207]
  10b90c:	e12fff1e 	bx	lr

0010b910 <vUSBRecvByte>:
  10b910:	e3500000 	cmp	r0, #0	; 0x0
  10b914:	13510000 	cmpne	r1, #0	; 0x0
  10b918:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10b91c:	e1a04000 	mov	r4, r0
  10b920:	e1a07002 	mov	r7, r2
  10b924:	c3a00000 	movgt	r0, #0	; 0x0
  10b928:	d3a00001 	movle	r0, #1	; 0x1
  10b92c:	da000015 	ble	10b988 <vUSBRecvByte+0x78>
  10b930:	e59f805c 	ldr	r8, [pc, #92]	; 10b994 <prog+0xb950>
  10b934:	e5983000 	ldr	r3, [r8]
  10b938:	e3530000 	cmp	r3, #0	; 0x0
  10b93c:	0a000011 	beq	10b988 <vUSBRecvByte+0x78>
  10b940:	e3510000 	cmp	r1, #0	; 0x0
  10b944:	11a05000 	movne	r5, r0
  10b948:	11a06001 	movne	r6, r1
  10b94c:	1a000003 	bne	10b960 <vUSBRecvByte+0x50>
  10b950:	ea00000c 	b	10b988 <vUSBRecvByte+0x78>
  10b954:	e2855001 	add	r5, r5, #1	; 0x1
  10b958:	e1560005 	cmp	r6, r5
  10b95c:	0a000007 	beq	10b980 <vUSBRecvByte+0x70>
  10b960:	e1a01004 	mov	r1, r4
  10b964:	e5980000 	ldr	r0, [r8]
  10b968:	e1a02007 	mov	r2, r7
  10b96c:	e3a03000 	mov	r3, #0	; 0x0
  10b970:	ebfffb15 	bl	10a5cc <xQueueGenericReceive>
  10b974:	e3500000 	cmp	r0, #0	; 0x0
  10b978:	e2844001 	add	r4, r4, #1	; 0x1
  10b97c:	1afffff4 	bne	10b954 <vUSBRecvByte+0x44>
  10b980:	e1a00005 	mov	r0, r5
  10b984:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10b988:	e3a05000 	mov	r5, #0	; 0x0
  10b98c:	e1a00005 	mov	r0, r5
  10b990:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10b994:	00200f24 	eoreq	r0, r0, r4, lsr #30

0010b998 <usb_send_buffer_zero_copy>:
  10b998:	e52de004 	str	lr, [sp, #-4]!
  10b99c:	e24dd014 	sub	sp, sp, #20	; 0x14
  10b9a0:	e58d3010 	str	r3, [sp, #16]
  10b9a4:	e59f3028 	ldr	r3, [pc, #40]	; 10b9d4 <prog+0xb990>
  10b9a8:	e3a0c000 	mov	ip, #0	; 0x0
  10b9ac:	e88d0003 	stmia	sp, {r0, r1}
  10b9b0:	e58d200c 	str	r2, [sp, #12]
  10b9b4:	e5930000 	ldr	r0, [r3]
  10b9b8:	e1a0100d 	mov	r1, sp
  10b9bc:	e1a0300c 	mov	r3, ip
  10b9c0:	e59d2018 	ldr	r2, [sp, #24]
  10b9c4:	e58dc008 	str	ip, [sp, #8]
  10b9c8:	ebfffb65 	bl	10a764 <xQueueGenericSend>
  10b9cc:	e28dd014 	add	sp, sp, #20	; 0x14
  10b9d0:	e8bd8000 	ldmia	sp!, {pc}
  10b9d4:	00200f2c 	eoreq	r0, r0, ip, lsr #30

0010b9d8 <vUSBSendByte>:
  10b9d8:	e52de004 	str	lr, [sp, #-4]!
  10b9dc:	e59f3028 	ldr	r3, [pc, #40]	; 10ba0c <prog+0xb9c8>
  10b9e0:	e24dd008 	sub	sp, sp, #8	; 0x8
  10b9e4:	e3a02000 	mov	r2, #0	; 0x0
  10b9e8:	e5cd0004 	strb	r0, [sp, #4]
  10b9ec:	e3a0c001 	mov	ip, #1	; 0x1
  10b9f0:	e5930000 	ldr	r0, [r3]
  10b9f4:	e28d1003 	add	r1, sp, #3	; 0x3
  10b9f8:	e1a03002 	mov	r3, r2
  10b9fc:	e5cdc003 	strb	ip, [sp, #3]
  10ba00:	ebfffb57 	bl	10a764 <xQueueGenericSend>
  10ba04:	e28dd008 	add	sp, sp, #8	; 0x8
  10ba08:	e8bd8000 	ldmia	sp!, {pc}
  10ba0c:	00200f28 	eoreq	r0, r0, r8, lsr #30

0010ba10 <prvSendStall>:
  10ba10:	e52de004 	str	lr, [sp, #-4]!
  10ba14:	ebffff30 	bl	10b6dc <vPortEnterCritical>
  10ba18:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10ba1c:	e5123fcf 	ldr	r3, [r2, #-4047]
  10ba20:	e3c33030 	bic	r3, r3, #48	; 0x30
  10ba24:	e383306f 	orr	r3, r3, #111	; 0x6f
  10ba28:	e5023fcf 	str	r3, [r2, #-4047]
  10ba2c:	e49de004 	ldr	lr, [sp], #4
  10ba30:	eaffff34 	b	10b708 <vPortExitCritical>

0010ba34 <prvSendZLP>:
  10ba34:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10ba38:	e5123fcf 	ldr	r3, [r2, #-4047]
  10ba3c:	e3130010 	tst	r3, #16	; 0x10
  10ba40:	e92d4010 	stmdb	sp!, {r4, lr}
  10ba44:	0a000005 	beq	10ba60 <prvSendZLP+0x2c>
  10ba48:	e1a04002 	mov	r4, r2
  10ba4c:	e3a00001 	mov	r0, #1	; 0x1
  10ba50:	ebfffe61 	bl	10b3dc <vTaskDelay>
  10ba54:	e5143fcf 	ldr	r3, [r4, #-4047]
  10ba58:	e3130010 	tst	r3, #16	; 0x10
  10ba5c:	1afffffa 	bne	10ba4c <prvSendZLP+0x18>
  10ba60:	ebffff1d 	bl	10b6dc <vPortEnterCritical>
  10ba64:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  10ba68:	e59f101c 	ldr	r1, [pc, #28]	; 10ba8c <prog+0xba48>
  10ba6c:	e5103fcf 	ldr	r3, [r0, #-4047]
  10ba70:	e5912080 	ldr	r2, [r1, #128]
  10ba74:	e3c33030 	bic	r3, r3, #48	; 0x30
  10ba78:	e383305f 	orr	r3, r3, #95	; 0x5f
  10ba7c:	e5812084 	str	r2, [r1, #132]
  10ba80:	e5003fcf 	str	r3, [r0, #-4047]
  10ba84:	e8bd4010 	ldmia	sp!, {r4, lr}
  10ba88:	eaffff1e 	b	10b708 <vPortExitCritical>
  10ba8c:	00200e14 	eoreq	r0, r0, r4, lsl lr

0010ba90 <prvSendNextSegment>:
  10ba90:	e92d4010 	stmdb	sp!, {r4, lr}
  10ba94:	e59f40e4 	ldr	r4, [pc, #228]	; 10bb80 <prog+0xbb3c>
  10ba98:	e5942084 	ldr	r2, [r4, #132]
  10ba9c:	e5943080 	ldr	r3, [r4, #128]
  10baa0:	e1520003 	cmp	r2, r3
  10baa4:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10baa8:	9a00002a 	bls	10bb58 <prvSendNextSegment+0xc8>
  10baac:	e0633002 	rsb	r3, r3, r2
  10bab0:	e58d3000 	str	r3, [sp]
  10bab4:	e59d2000 	ldr	r2, [sp]
  10bab8:	e3520008 	cmp	r2, #8	; 0x8
  10babc:	959d3000 	ldrls	r3, [sp]
  10bac0:	83a03008 	movhi	r3, #8	; 0x8
  10bac4:	858d3008 	strhi	r3, [sp, #8]
  10bac8:	958d3008 	strls	r3, [sp, #8]
  10bacc:	ea000001 	b	10bad8 <prvSendNextSegment+0x48>
  10bad0:	e3a00001 	mov	r0, #1	; 0x1
  10bad4:	ebfffe40 	bl	10b3dc <vTaskDelay>
  10bad8:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  10badc:	e5132fcf 	ldr	r2, [r3, #-4047]
  10bae0:	e3120010 	tst	r2, #16	; 0x10
  10bae4:	1afffff9 	bne	10bad0 <prvSendNextSegment+0x40>
  10bae8:	e59d3008 	ldr	r3, [sp, #8]
  10baec:	e3530000 	cmp	r3, #0	; 0x0
  10baf0:	0a00000b 	beq	10bb24 <prvSendNextSegment+0x94>
  10baf4:	e5941080 	ldr	r1, [r4, #128]
  10baf8:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  10bafc:	e7d43001 	ldrb	r3, [r4, r1]
  10bb00:	e5003faf 	str	r3, [r0, #-4015]
  10bb04:	e59d2008 	ldr	r2, [sp, #8]
  10bb08:	e2422001 	sub	r2, r2, #1	; 0x1
  10bb0c:	e58d2008 	str	r2, [sp, #8]
  10bb10:	e59d3008 	ldr	r3, [sp, #8]
  10bb14:	e3530000 	cmp	r3, #0	; 0x0
  10bb18:	e2811001 	add	r1, r1, #1	; 0x1
  10bb1c:	1afffff6 	bne	10bafc <prvSendNextSegment+0x6c>
  10bb20:	e5841080 	str	r1, [r4, #128]
  10bb24:	ebfffeec 	bl	10b6dc <vPortEnterCritical>
  10bb28:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  10bb2c:	e5112fcf 	ldr	r2, [r1, #-4047]
  10bb30:	e58d2004 	str	r2, [sp, #4]
  10bb34:	e59d3004 	ldr	r3, [sp, #4]
  10bb38:	e3c33030 	bic	r3, r3, #48	; 0x30
  10bb3c:	e383305f 	orr	r3, r3, #95	; 0x5f
  10bb40:	e58d3004 	str	r3, [sp, #4]
  10bb44:	e59d2004 	ldr	r2, [sp, #4]
  10bb48:	e5012fcf 	str	r2, [r1, #-4047]
  10bb4c:	e28dd00c 	add	sp, sp, #12	; 0xc
  10bb50:	e8bd4010 	ldmia	sp!, {r4, lr}
  10bb54:	eafffeeb 	b	10b708 <vPortExitCritical>
  10bb58:	e59f4024 	ldr	r4, [pc, #36]	; 10bb84 <prog+0xbb40>
  10bb5c:	e5943000 	ldr	r3, [r4]
  10bb60:	e3530004 	cmp	r3, #4	; 0x4
  10bb64:	0a000001 	beq	10bb70 <prvSendNextSegment+0xe0>
  10bb68:	e28dd00c 	add	sp, sp, #12	; 0xc
  10bb6c:	e8bd8010 	ldmia	sp!, {r4, pc}
  10bb70:	ebffffaf 	bl	10ba34 <prvSendZLP>
  10bb74:	e3a03000 	mov	r3, #0	; 0x0
  10bb78:	e5843000 	str	r3, [r4]
  10bb7c:	eafffff9 	b	10bb68 <prvSendNextSegment+0xd8>
  10bb80:	00200e14 	eoreq	r0, r0, r4, lsl lr
  10bb84:	00200e04 	eoreq	r0, r0, r4, lsl #28

0010bb88 <prvSendControlData>:
  10bb88:	e1a01801 	mov	r1, r1, lsl #16
  10bb8c:	e1a01821 	mov	r1, r1, lsr #16
  10bb90:	e1510002 	cmp	r1, r2
  10bb94:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10bb98:	e1a05002 	mov	r5, r2
  10bb9c:	93a02000 	movls	r2, #0	; 0x0
  10bba0:	83a02001 	movhi	r2, #1	; 0x1
  10bba4:	31a05001 	movcc	r5, r1
  10bba8:	3a000008 	bcc	10bbd0 <prvSendControlData+0x48>
  10bbac:	e3530000 	cmp	r3, #0	; 0x0
  10bbb0:	03a03000 	moveq	r3, #0	; 0x0
  10bbb4:	12023001 	andne	r3, r2, #1	; 0x1
  10bbb8:	e3530000 	cmp	r3, #0	; 0x0
  10bbbc:	0a000003 	beq	10bbd0 <prvSendControlData+0x48>
  10bbc0:	e3150007 	tst	r5, #7	; 0x7
  10bbc4:	059f302c 	ldreq	r3, [pc, #44]	; 10bbf8 <prog+0xbbb4>
  10bbc8:	03a02004 	moveq	r2, #4	; 0x4
  10bbcc:	05832000 	streq	r2, [r3]
  10bbd0:	e59f4024 	ldr	r4, [pc, #36]	; 10bbfc <prog+0xbbb8>
  10bbd4:	e1a01000 	mov	r1, r0
  10bbd8:	e1a02005 	mov	r2, r5
  10bbdc:	e1a00004 	mov	r0, r4
  10bbe0:	ebffd3f9 	bl	100bcc <memcpy>
  10bbe4:	e3a03000 	mov	r3, #0	; 0x0
  10bbe8:	e5843080 	str	r3, [r4, #128]
  10bbec:	e5845084 	str	r5, [r4, #132]
  10bbf0:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  10bbf4:	eaffffa5 	b	10ba90 <prvSendNextSegment>
  10bbf8:	00200e04 	eoreq	r0, r0, r4, lsl #28
  10bbfc:	00200e14 	eoreq	r0, r0, r4, lsl lr

0010bc00 <vUSBCDCTask>:
  10bc00:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10bc04:	e59fc964 	ldr	ip, [pc, #2404]	; 10c570 <prog+0xc52c>
  10bc08:	e24dd028 	sub	sp, sp, #40	; 0x28
  10bc0c:	e59c4010 	ldr	r4, [ip, #16]
  10bc10:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  10bc14:	e28dc004 	add	ip, sp, #4	; 0x4
  10bc18:	e58dc000 	str	ip, [sp]
  10bc1c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
  10bc20:	e58d4014 	str	r4, [sp, #20]
  10bc24:	ebfffeac 	bl	10b6dc <vPortEnterCritical>
  10bc28:	ebffff32 	bl	10b8f8 <vDetachUSBInterface>
  10bc2c:	ebfffeb5 	bl	10b708 <vPortExitCritical>
  10bc30:	e3a0003c 	mov	r0, #60	; 0x3c
  10bc34:	ebfffde8 	bl	10b3dc <vTaskDelay>
  10bc38:	ebfffea7 	bl	10b6dc <vPortEnterCritical>
  10bc3c:	e3a00004 	mov	r0, #4	; 0x4
  10bc40:	e1a01000 	mov	r1, r0
  10bc44:	ebfffb20 	bl	10a8cc <xQueueCreate>
  10bc48:	e59f1924 	ldr	r1, [pc, #2340]	; 10c574 <prog+0xc530>
  10bc4c:	e5810000 	str	r0, [r1]
  10bc50:	e3a01001 	mov	r1, #1	; 0x1
  10bc54:	e3a00b01 	mov	r0, #1024	; 0x400
  10bc58:	ebfffb1b 	bl	10a8cc <xQueueCreate>
  10bc5c:	e59fb914 	ldr	fp, [pc, #2324]	; 10c578 <prog+0xc534>
  10bc60:	e3a01005 	mov	r1, #5	; 0x5
  10bc64:	e58b0000 	str	r0, [fp]
  10bc68:	e3a000cd 	mov	r0, #205	; 0xcd
  10bc6c:	ebfffb16 	bl	10a8cc <xQueueCreate>
  10bc70:	e59f2904 	ldr	r2, [pc, #2308]	; 10c57c <prog+0xc538>
  10bc74:	e3a01014 	mov	r1, #20	; 0x14
  10bc78:	e5820000 	str	r0, [r2]
  10bc7c:	e3a00040 	mov	r0, #64	; 0x40
  10bc80:	ebfffb11 	bl	10a8cc <xQueueCreate>
  10bc84:	e59fc8e8 	ldr	ip, [pc, #2280]	; 10c574 <prog+0xc530>
  10bc88:	e59c3000 	ldr	r3, [ip]
  10bc8c:	e59f18ec 	ldr	r1, [pc, #2284]	; 10c580 <prog+0xc53c>
  10bc90:	e3530000 	cmp	r3, #0	; 0x0
  10bc94:	e5810000 	str	r0, [r1]
  10bc98:	0a000038 	beq	10bd80 <vUSBCDCTask+0x180>
  10bc9c:	e59b3000 	ldr	r3, [fp]
  10bca0:	e3530000 	cmp	r3, #0	; 0x0
  10bca4:	0a000035 	beq	10bd80 <vUSBCDCTask+0x180>
  10bca8:	e59f28cc 	ldr	r2, [pc, #2252]	; 10c57c <prog+0xc538>
  10bcac:	e5923000 	ldr	r3, [r2]
  10bcb0:	e3530000 	cmp	r3, #0	; 0x0
  10bcb4:	0a000031 	beq	10bd80 <vUSBCDCTask+0x180>
  10bcb8:	e3500000 	cmp	r0, #0	; 0x0
  10bcbc:	0a00002f 	beq	10bd80 <vUSBCDCTask+0x180>
  10bcc0:	e59fc8bc 	ldr	ip, [pc, #2236]	; 10c584 <prog+0xc540>
  10bcc4:	e59f08bc 	ldr	r0, [pc, #2236]	; 10c588 <prog+0xc544>
  10bcc8:	e59f18bc 	ldr	r1, [pc, #2236]	; 10c58c <prog+0xc548>
  10bccc:	e3a04000 	mov	r4, #0	; 0x0
  10bcd0:	e3a03002 	mov	r3, #2	; 0x2
  10bcd4:	e58c3000 	str	r3, [ip]
  10bcd8:	e5c04000 	strb	r4, [r0]
  10bcdc:	e5c14000 	strb	r4, [r1]
  10bce0:	e3e0ec03 	mvn	lr, #768	; 0x300
  10bce4:	e51e60d3 	ldr	r6, [lr, #-211]
  10bce8:	e3a0c080 	mov	ip, #128	; 0x80
  10bcec:	e3866201 	orr	r6, r6, #268435456	; 0x10000000
  10bcf0:	e50e60d3 	str	r6, [lr, #-211]
  10bcf4:	e50ec0ff 	str	ip, [lr, #-255]
  10bcf8:	e59fc890 	ldr	ip, [pc, #2192]	; 10c590 <prog+0xc54c>
  10bcfc:	e58c4080 	str	r4, [ip, #128]
  10bd00:	e59fc88c 	ldr	ip, [pc, #2188]	; 10c594 <prog+0xc550>
  10bd04:	e58c4080 	str	r4, [ip, #128]
  10bd08:	e59fc888 	ldr	ip, [pc, #2184]	; 10c598 <prog+0xc554>
  10bd0c:	e3e05a4f 	mvn	r5, #323584	; 0x4f000
  10bd10:	e3e07c0b 	mvn	r7, #2816	; 0xb00
  10bd14:	e3a08801 	mov	r8, #65536	; 0x10000
  10bd18:	e3a0ab02 	mov	sl, #2048	; 0x800
  10bd1c:	e3e09000 	mvn	r9, #0	; 0x0
  10bd20:	e50ea0ef 	str	sl, [lr, #-239]
  10bd24:	e1a02004 	mov	r2, r4
  10bd28:	e50780ff 	str	r8, [r7, #-255]
  10bd2c:	e3a01003 	mov	r1, #3	; 0x3
  10bd30:	e50780ef 	str	r8, [r7, #-239]
  10bd34:	e59f3860 	ldr	r3, [pc, #2144]	; 10c59c <prog+0xc558>
  10bd38:	e50780cf 	str	r8, [r7, #-207]
  10bd3c:	e58c4000 	str	r4, [ip]
  10bd40:	e5059feb 	str	r9, [r5, #-4075]
  10bd44:	e3a0000b 	mov	r0, #11	; 0xb
  10bd48:	e5059fdf 	str	r9, [r5, #-4063]
  10bd4c:	e5054f8b 	str	r4, [r5, #-3979]
  10bd50:	e5054fcf 	str	r4, [r5, #-4047]
  10bd54:	e5054fcb 	str	r4, [r5, #-4043]
  10bd58:	e5054fc7 	str	r4, [r5, #-4039]
  10bd5c:	e5054fc3 	str	r4, [r5, #-4035]
  10bd60:	e5054ffb 	str	r4, [r5, #-4091]
  10bd64:	e5054ff7 	str	r4, [r5, #-4087]
  10bd68:	ebfff906 	bl	10a188 <AT91F_AIC_ConfigureIt>
  10bd6c:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10bd70:	e3a00ffa 	mov	r0, #1000	; 0x3e8
  10bd74:	e583a021 	str	sl, [r3, #33]
  10bd78:	ebfffd97 	bl	10b3dc <vTaskDelay>
  10bd7c:	e50780cb 	str	r8, [r7, #-203]
  10bd80:	ebfffe60 	bl	10b708 <vPortExitCritical>
  10bd84:	e59f9814 	ldr	r9, [pc, #2068]	; 10c5a0 <prog+0xc55c>
  10bd88:	e28da01b 	add	sl, sp, #27	; 0x1b
  10bd8c:	e28d8027 	add	r8, sp, #39	; 0x27
  10bd90:	e28d2008 	add	r2, sp, #8	; 0x8
  10bd94:	e892000c 	ldmia	r2, {r2, r3}
  10bd98:	e59f17d4 	ldr	r1, [pc, #2004]	; 10c574 <prog+0xc530>
  10bd9c:	e1530002 	cmp	r3, r2
  10bda0:	33a02000 	movcc	r2, #0	; 0x0
  10bda4:	23a02001 	movcs	r2, #1	; 0x1
  10bda8:	e5910000 	ldr	r0, [r1]
  10bdac:	e3a03000 	mov	r3, #0	; 0x0
  10bdb0:	e28d1020 	add	r1, sp, #32	; 0x20
  10bdb4:	ebfffa04 	bl	10a5cc <xQueueGenericReceive>
  10bdb8:	e3500000 	cmp	r0, #0	; 0x0
  10bdbc:	0a000030 	beq	10be84 <vUSBCDCTask+0x284>
  10bdc0:	e59d5020 	ldr	r5, [sp, #32]
  10bdc4:	e5953000 	ldr	r3, [r5]
  10bdc8:	e3130001 	tst	r3, #1	; 0x1
  10bdcc:	0a000029 	beq	10be78 <vUSBCDCTask+0x278>
  10bdd0:	e5950004 	ldr	r0, [r5, #4]
  10bdd4:	e1a03820 	mov	r3, r0, lsr #16
  10bdd8:	e1a07a83 	mov	r7, r3, lsl #21
  10bddc:	e3100001 	tst	r0, #1	; 0x1
  10bde0:	e1a07aa7 	mov	r7, r7, lsr #21
  10bde4:	0a000013 	beq	10be38 <vUSBCDCTask+0x238>
  10bde8:	e59f27a8 	ldr	r2, [pc, #1960]	; 10c598 <prog+0xc554>
  10bdec:	e5926000 	ldr	r6, [r2]
  10bdf0:	e3560002 	cmp	r6, #2	; 0x2
  10bdf4:	0a000189 	beq	10c420 <prog+0xc3dc>
  10bdf8:	e3560003 	cmp	r6, #3	; 0x3
  10bdfc:	1a000184 	bne	10c414 <prog+0xc3d0>
  10be00:	e59f379c 	ldr	r3, [pc, #1948]	; 10c5a4 <prog+0xc560>
  10be04:	e5931000 	ldr	r1, [r3]
  10be08:	e3510000 	cmp	r1, #0	; 0x0
  10be0c:	13a02001 	movne	r2, #1	; 0x1
  10be10:	13e03a4f 	mvnne	r3, #323584	; 0x4f000
  10be14:	03e03a4f 	mvneq	r3, #323584	; 0x4f000
  10be18:	e59fc778 	ldr	ip, [pc, #1912]	; 10c598 <prog+0xc554>
  10be1c:	15032ffb 	strne	r2, [r3, #-4091]
  10be20:	05031ffb 	streq	r1, [r3, #-4091]
  10be24:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10be28:	e3813c01 	orr	r3, r1, #256	; 0x100
  10be2c:	e3a01000 	mov	r1, #0	; 0x0
  10be30:	e5023ff7 	str	r3, [r2, #-4087]
  10be34:	e58c1000 	str	r1, [ip]
  10be38:	e3100002 	tst	r0, #2	; 0x2
  10be3c:	0a000099 	beq	10c0a8 <vUSBCDCTask+0x4a8>
  10be40:	e59f074c 	ldr	r0, [pc, #1868]	; 10c594 <prog+0xc550>
  10be44:	e2800084 	add	r0, r0, #132	; 0x84
  10be48:	e8100009 	ldmda	r0, {r0, r3}
  10be4c:	e0433000 	sub	r3, r3, r0
  10be50:	e59f1738 	ldr	r1, [pc, #1848]	; 10c590 <prog+0xc54c>
  10be54:	e20340ff 	and	r4, r3, #255	; 0xff
  10be58:	e1570004 	cmp	r7, r4
  10be5c:	e5912084 	ldr	r2, [r1, #132]
  10be60:	320740ff 	andcc	r4, r7, #255	; 0xff
  10be64:	e3540000 	cmp	r4, #0	; 0x0
  10be68:	e5812080 	str	r2, [r1, #128]
  10be6c:	e59f6720 	ldr	r6, [pc, #1824]	; 10c594 <prog+0xc550>
  10be70:	1a000084 	bne	10c088 <vUSBCDCTask+0x488>
  10be74:	e59d5020 	ldr	r5, [sp, #32]
  10be78:	e5953000 	ldr	r3, [r5]
  10be7c:	e3130a01 	tst	r3, #4096	; 0x1000
  10be80:	1a0000d5 	bne	10c1dc <prog+0xc198>
  10be84:	e59f070c 	ldr	r0, [pc, #1804]	; 10c598 <prog+0xc554>
  10be88:	e5903000 	ldr	r3, [r0]
  10be8c:	e3530005 	cmp	r3, #5	; 0x5
  10be90:	1affffbe 	bne	10bd90 <vUSBCDCTask+0x190>
  10be94:	e59f16f0 	ldr	r1, [pc, #1776]	; 10c58c <prog+0xc548>
  10be98:	e5d13000 	ldrb	r3, [r1]
  10be9c:	e3530000 	cmp	r3, #0	; 0x0
  10bea0:	0affffba 	beq	10bd90 <vUSBCDCTask+0x190>
  10bea4:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  10bea8:	e5132fc7 	ldr	r2, [r3, #-4039]
  10beac:	e3120010 	tst	r2, #16	; 0x10
  10beb0:	1a000045 	bne	10bfcc <vUSBCDCTask+0x3cc>
  10beb4:	e59d000c 	ldr	r0, [sp, #12]
  10beb8:	e59d2008 	ldr	r2, [sp, #8]
  10bebc:	e1500002 	cmp	r0, r2
  10bec0:	2a0000af 	bcs	10c184 <prog+0xc140>
  10bec4:	e1500002 	cmp	r0, r2
  10bec8:	e3a04000 	mov	r4, #0	; 0x0
  10becc:	3a000027 	bcc	10bf70 <vUSBCDCTask+0x370>
  10bed0:	e59fc6a8 	ldr	ip, [pc, #1704]	; 10c580 <prog+0xc53c>
  10bed4:	e3a02000 	mov	r2, #0	; 0x0
  10bed8:	e59c0000 	ldr	r0, [ip]
  10bedc:	e28d1004 	add	r1, sp, #4	; 0x4
  10bee0:	e1a03002 	mov	r3, r2
  10bee4:	ebfff9b8 	bl	10a5cc <xQueueGenericReceive>
  10bee8:	e3500000 	cmp	r0, #0	; 0x0
  10beec:	058d0008 	streq	r0, [sp, #8]
  10bef0:	058d000c 	streq	r0, [sp, #12]
  10bef4:	0a000003 	beq	10bf08 <vUSBCDCTask+0x308>
  10bef8:	e59d000c 	ldr	r0, [sp, #12]
  10befc:	e59d2008 	ldr	r2, [sp, #8]
  10bf00:	e1500002 	cmp	r0, r2
  10bf04:	3a000019 	bcc	10bf70 <vUSBCDCTask+0x370>
  10bf08:	e59f166c 	ldr	r1, [pc, #1644]	; 10c57c <prog+0xc538>
  10bf0c:	e3a02000 	mov	r2, #0	; 0x0
  10bf10:	e5910000 	ldr	r0, [r1]
  10bf14:	e1a03002 	mov	r3, r2
  10bf18:	e1a0100a 	mov	r1, sl
  10bf1c:	ebfff9aa 	bl	10a5cc <xQueueGenericReceive>
  10bf20:	e3500000 	cmp	r0, #0	; 0x0
  10bf24:	0a000024 	beq	10bfbc <vUSBCDCTask+0x3bc>
  10bf28:	e5dd101b 	ldrb	r1, [sp, #27]
  10bf2c:	e3510000 	cmp	r1, #0	; 0x0
  10bf30:	da000007 	ble	10bf54 <vUSBCDCTask+0x354>
  10bf34:	e3a02000 	mov	r2, #0	; 0x0
  10bf38:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  10bf3c:	e2822001 	add	r2, r2, #1	; 0x1
  10bf40:	e7d2300a 	ldrb	r3, [r2, sl]
  10bf44:	e1520001 	cmp	r2, r1
  10bf48:	e5003fa7 	str	r3, [r0, #-4007]
  10bf4c:	e2844001 	add	r4, r4, #1	; 0x1
  10bf50:	1afffff9 	bne	10bf3c <vUSBCDCTask+0x33c>
  10bf54:	e2844001 	add	r4, r4, #1	; 0x1
  10bf58:	e354003b 	cmp	r4, #59	; 0x3b
  10bf5c:	ca000016 	bgt	10bfbc <vUSBCDCTask+0x3bc>
  10bf60:	e59d000c 	ldr	r0, [sp, #12]
  10bf64:	e59d2008 	ldr	r2, [sp, #8]
  10bf68:	e1500002 	cmp	r0, r2
  10bf6c:	2affffd7 	bcs	10bed0 <vUSBCDCTask+0x2d0>
  10bf70:	e59dc004 	ldr	ip, [sp, #4]
  10bf74:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  10bf78:	e1500002 	cmp	r0, r2
  10bf7c:	e2844001 	add	r4, r4, #1	; 0x1
  10bf80:	e2801001 	add	r1, r0, #1	; 0x1
  10bf84:	2a000007 	bcs	10bfa8 <vUSBCDCTask+0x3a8>
  10bf88:	e7dc3000 	ldrb	r3, [ip, r0]
  10bf8c:	e354003f 	cmp	r4, #63	; 0x3f
  10bf90:	e50e3fa7 	str	r3, [lr, #-4007]
  10bf94:	e1a00001 	mov	r0, r1
  10bf98:	e58d100c 	str	r1, [sp, #12]
  10bf9c:	dafffff5 	ble	10bf78 <vUSBCDCTask+0x378>
  10bfa0:	e1520001 	cmp	r2, r1
  10bfa4:	8a000004 	bhi	10bfbc <vUSBCDCTask+0x3bc>
  10bfa8:	e59d3010 	ldr	r3, [sp, #16]
  10bfac:	e3530000 	cmp	r3, #0	; 0x0
  10bfb0:	159d0014 	ldrne	r0, [sp, #20]
  10bfb4:	11a0e00f 	movne	lr, pc
  10bfb8:	112fff13 	bxne	r3
  10bfbc:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10bfc0:	e5123fc7 	ldr	r3, [r2, #-4039]
  10bfc4:	e3833010 	orr	r3, r3, #16	; 0x10
  10bfc8:	e5023fc7 	str	r3, [r2, #-4039]
  10bfcc:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10bfd0:	e5143fcb 	ldr	r3, [r4, #-4043]
  10bfd4:	e3130042 	tst	r3, #66	; 0x42
  10bfd8:	0affff6c 	beq	10bd90 <vUSBCDCTask+0x190>
  10bfdc:	e5143fcb 	ldr	r3, [r4, #-4043]
  10bfe0:	e59b0000 	ldr	r0, [fp]
  10bfe4:	e1a03823 	mov	r3, r3, lsr #16
  10bfe8:	e1a05a83 	mov	r5, r3, lsl #21
  10bfec:	ebfff8d8 	bl	10a354 <uxQueueMessagesWaiting>
  10bff0:	e1a05aa5 	mov	r5, r5, lsr #21
  10bff4:	e2600b01 	rsb	r0, r0, #1024	; 0x400
  10bff8:	e1550000 	cmp	r5, r0
  10bffc:	2affff63 	bcs	10bd90 <vUSBCDCTask+0x190>
  10c000:	e3550000 	cmp	r5, #0	; 0x0
  10c004:	0a00000b 	beq	10c038 <vUSBCDCTask+0x438>
  10c008:	e1a06004 	mov	r6, r4
  10c00c:	e3a04000 	mov	r4, #0	; 0x0
  10c010:	e516cfab 	ldr	ip, [r6, #-4011]
  10c014:	e3a02000 	mov	r2, #0	; 0x0
  10c018:	e2844001 	add	r4, r4, #1	; 0x1
  10c01c:	e59b0000 	ldr	r0, [fp]
  10c020:	e1a01008 	mov	r1, r8
  10c024:	e1a03002 	mov	r3, r2
  10c028:	e5cdc027 	strb	ip, [sp, #39]
  10c02c:	ebfff9cc 	bl	10a764 <xQueueGenericSend>
  10c030:	e1540005 	cmp	r4, r5
  10c034:	1afffff5 	bne	10c010 <vUSBCDCTask+0x410>
  10c038:	ebfffda7 	bl	10b6dc <vPortEnterCritical>
  10c03c:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10c040:	e59fc53c 	ldr	ip, [pc, #1340]	; 10c584 <prog+0xc540>
  10c044:	e5143fcb 	ldr	r3, [r4, #-4043]
  10c048:	e59c2000 	ldr	r2, [ip]
  10c04c:	e383304f 	orr	r3, r3, #79	; 0x4f
  10c050:	e1e02002 	mvn	r2, r2
  10c054:	e3c33030 	bic	r3, r3, #48	; 0x30
  10c058:	e0033002 	and	r3, r3, r2
  10c05c:	e5043fcb 	str	r3, [r4, #-4043]
  10c060:	ebfffda8 	bl	10b708 <vPortExitCritical>
  10c064:	e3a01002 	mov	r1, #2	; 0x2
  10c068:	e5041fef 	str	r1, [r4, #-4079]
  10c06c:	e59f0510 	ldr	r0, [pc, #1296]	; 10c584 <prog+0xc540>
  10c070:	e5903000 	ldr	r3, [r0]
  10c074:	e1530001 	cmp	r3, r1
  10c078:	03a03040 	moveq	r3, #64	; 0x40
  10c07c:	05803000 	streq	r3, [r0]
  10c080:	15801000 	strne	r1, [r0]
  10c084:	eaffffd0 	b	10bfcc <vUSBCDCTask+0x3cc>
  10c088:	e1a00006 	mov	r0, r6
  10c08c:	e2851008 	add	r1, r5, #8	; 0x8
  10c090:	e1a02004 	mov	r2, r4
  10c094:	ebffd2cc 	bl	100bcc <memcpy>
  10c098:	e5963080 	ldr	r3, [r6, #128]
  10c09c:	e0843003 	add	r3, r4, r3
  10c0a0:	e5863080 	str	r3, [r6, #128]
  10c0a4:	e5950004 	ldr	r0, [r5, #4]
  10c0a8:	e3100004 	tst	r0, #4	; 0x4
  10c0ac:	0a000020 	beq	10c134 <vUSBCDCTask+0x534>
  10c0b0:	e3570007 	cmp	r7, #7	; 0x7
  10c0b4:	9a00001e 	bls	10c134 <vUSBCDCTask+0x534>
  10c0b8:	e5d51008 	ldrb	r1, [r5, #8]
  10c0bc:	e5c91000 	strb	r1, [r9]
  10c0c0:	e5d52009 	ldrb	r2, [r5, #9]
  10c0c4:	e5c92001 	strb	r2, [r9, #1]
  10c0c8:	e5d5300b 	ldrb	r3, [r5, #11]
  10c0cc:	e1a03403 	mov	r3, r3, lsl #8
  10c0d0:	e1c930b2 	strh	r3, [r9, #2]
  10c0d4:	e5d5200a 	ldrb	r2, [r5, #10]
  10c0d8:	e1833002 	orr	r3, r3, r2
  10c0dc:	e1c930b2 	strh	r3, [r9, #2]
  10c0e0:	e5d5200d 	ldrb	r2, [r5, #13]
  10c0e4:	e1a02402 	mov	r2, r2, lsl #8
  10c0e8:	e1c920b4 	strh	r2, [r9, #4]
  10c0ec:	e5d5300c 	ldrb	r3, [r5, #12]
  10c0f0:	e1822003 	orr	r2, r2, r3
  10c0f4:	e1c920b4 	strh	r2, [r9, #4]
  10c0f8:	e5d5300f 	ldrb	r3, [r5, #15]
  10c0fc:	e1a03403 	mov	r3, r3, lsl #8
  10c100:	e1c930b6 	strh	r3, [r9, #6]
  10c104:	e5d5200e 	ldrb	r2, [r5, #14]
  10c108:	e59fc484 	ldr	ip, [pc, #1156]	; 10c594 <prog+0xc550>
  10c10c:	e1833002 	orr	r3, r3, r2
  10c110:	e3110080 	tst	r1, #128	; 0x80
  10c114:	e3a02000 	mov	r2, #0	; 0x0
  10c118:	e1c930b6 	strh	r3, [r9, #6]
  10c11c:	e58c2080 	str	r2, [ip, #128]
  10c120:	1a0000d9 	bne	10c48c <prog+0xc448>
  10c124:	e3530080 	cmp	r3, #128	; 0x80
  10c128:	958c3084 	strls	r3, [ip, #132]
  10c12c:	95950004 	ldrls	r0, [r5, #4]
  10c130:	8a000024 	bhi	10c1c8 <prog+0xc184>
  10c134:	e3100006 	tst	r0, #6	; 0x6
  10c138:	0affff4d 	beq	10be74 <vUSBCDCTask+0x274>
  10c13c:	e59f0450 	ldr	r0, [pc, #1104]	; 10c594 <prog+0xc550>
  10c140:	e2802080 	add	r2, r0, #128	; 0x80
  10c144:	e892000c 	ldmia	r2, {r2, r3}
  10c148:	e1520003 	cmp	r2, r3
  10c14c:	3affff48 	bcc	10be74 <vUSBCDCTask+0x274>
  10c150:	e5d93000 	ldrb	r3, [r9]
  10c154:	e2032060 	and	r2, r3, #96	; 0x60
  10c158:	e2033003 	and	r3, r3, #3	; 0x3
  10c15c:	e18331a2 	orr	r3, r3, r2, lsr #3
  10c160:	e3530005 	cmp	r3, #5	; 0x5
  10c164:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10c168:	ea000016 	b	10c1c8 <prog+0xc184>
  10c16c:	0010c268 	andeqs	ip, r0, r8, ror #4
  10c170:	0010c23c 	andeqs	ip, r0, ip, lsr r2
  10c174:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c178:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c17c:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c180:	0010c2a8 	andeqs	ip, r0, r8, lsr #5
  10c184:	e59f23f0 	ldr	r2, [pc, #1008]	; 10c57c <prog+0xc538>
  10c188:	e5920000 	ldr	r0, [r2]
  10c18c:	ebfff870 	bl	10a354 <uxQueueMessagesWaiting>
  10c190:	e3500000 	cmp	r0, #0	; 0x0
  10c194:	0a0000bf 	beq	10c498 <prog+0xc454>
  10c198:	e59d000c 	ldr	r0, [sp, #12]
  10c19c:	e59d2008 	ldr	r2, [sp, #8]
  10c1a0:	eaffff47 	b	10bec4 <vUSBCDCTask+0x2c4>
  10c1a4:	e1d920b2 	ldrh	r2, [r9, #2]
  10c1a8:	e1a03422 	mov	r3, r2, lsr #8
  10c1ac:	e3530002 	cmp	r3, #2	; 0x2
  10c1b0:	e59f13e8 	ldr	r1, [pc, #1000]	; 10c5a0 <prog+0xc55c>
  10c1b4:	0a0000cc 	beq	10c4ec <prog+0xc4a8>
  10c1b8:	e3530003 	cmp	r3, #3	; 0x3
  10c1bc:	0a0000c1 	beq	10c4c8 <prog+0xc484>
  10c1c0:	e3530001 	cmp	r3, #1	; 0x1
  10c1c4:	0a0000b9 	beq	10c4b0 <prog+0xc46c>
  10c1c8:	ebfffe10 	bl	10ba10 <prvSendStall>
  10c1cc:	e59d5020 	ldr	r5, [sp, #32]
  10c1d0:	e5953000 	ldr	r3, [r5]
  10c1d4:	e3130a01 	tst	r3, #4096	; 0x1000
  10c1d8:	0affff29 	beq	10be84 <vUSBCDCTask+0x284>
  10c1dc:	e59f13a8 	ldr	r1, [pc, #936]	; 10c58c <prog+0xc548>
  10c1e0:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10c1e4:	e3a02000 	mov	r2, #0	; 0x0
  10c1e8:	e3a0300f 	mov	r3, #15	; 0xf
  10c1ec:	e5c12000 	strb	r2, [r1]
  10c1f0:	e5043fd7 	str	r3, [r4, #-4055]
  10c1f4:	e5042fd7 	str	r2, [r4, #-4055]
  10c1f8:	e59f2398 	ldr	r2, [pc, #920]	; 10c598 <prog+0xc554>
  10c1fc:	e28330f1 	add	r3, r3, #241	; 0xf1
  10c200:	e3a05001 	mov	r5, #1	; 0x1
  10c204:	e5043ff7 	str	r3, [r4, #-4087]
  10c208:	e5825000 	str	r5, [r2]
  10c20c:	ebfffd32 	bl	10b6dc <vPortEnterCritical>
  10c210:	e5143fcf 	ldr	r3, [r4, #-4047]
  10c214:	e383304f 	orr	r3, r3, #79	; 0x4f
  10c218:	e3c33030 	bic	r3, r3, #48	; 0x30
  10c21c:	e3833902 	orr	r3, r3, #32768	; 0x8000
  10c220:	e5043fcf 	str	r3, [r4, #-4047]
  10c224:	e5045fef 	str	r5, [r4, #-4079]
  10c228:	ebfffd36 	bl	10b708 <vPortExitCritical>
  10c22c:	e59fc350 	ldr	ip, [pc, #848]	; 10c584 <prog+0xc540>
  10c230:	e3a03002 	mov	r3, #2	; 0x2
  10c234:	e58c3000 	str	r3, [ip]
  10c238:	eaffff11 	b	10be84 <vUSBCDCTask+0x284>
  10c23c:	e5d93001 	ldrb	r3, [r9, #1]
  10c240:	e3a0c000 	mov	ip, #0	; 0x0
  10c244:	e3530000 	cmp	r3, #0	; 0x0
  10c248:	e1cdc2b4 	strh	ip, [sp, #36]
  10c24c:	1affffdd 	bne	10c1c8 <prog+0xc184>
  10c250:	e3a01002 	mov	r1, #2	; 0x2
  10c254:	e28d0024 	add	r0, sp, #36	; 0x24
  10c258:	e1a02001 	mov	r2, r1
  10c25c:	ebfffe49 	bl	10bb88 <prvSendControlData>
  10c260:	e59d5020 	ldr	r5, [sp, #32]
  10c264:	eaffff03 	b	10be78 <vUSBCDCTask+0x278>
  10c268:	e5d93001 	ldrb	r3, [r9, #1]
  10c26c:	e3a01000 	mov	r1, #0	; 0x0
  10c270:	e1cd12b4 	strh	r1, [sp, #36]
  10c274:	e3530009 	cmp	r3, #9	; 0x9
  10c278:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10c27c:	eaffffd1 	b	10c1c8 <prog+0xc184>
  10c280:	0010c3a8 	andeqs	ip, r0, r8, lsr #7
  10c284:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c288:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c28c:	0010c35c 	andeqs	ip, r0, ip, asr r3
  10c290:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c294:	0010c368 	andeqs	ip, r0, r8, ror #6
  10c298:	0010c1a4 	andeqs	ip, r0, r4, lsr #3
  10c29c:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2a0:	0010c38c 	andeqs	ip, r0, ip, lsl #7
  10c2a4:	0010c344 	andeqs	ip, r0, r4, asr #6
  10c2a8:	e5d93001 	ldrb	r3, [r9, #1]
  10c2ac:	e3530022 	cmp	r3, #34	; 0x22
  10c2b0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10c2b4:	eaffffc3 	b	10c1c8 <prog+0xc184>
  10c2b8:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2bc:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2c0:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2c4:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2c8:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2cc:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2d0:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2d4:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2d8:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2dc:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2e0:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2e4:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2e8:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2ec:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2f0:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2f4:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2f8:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c2fc:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c300:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c304:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c308:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c30c:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c310:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c314:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c318:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c31c:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c320:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c324:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c328:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c32c:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c330:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c334:	0010c1c8 	andeqs	ip, r0, r8, asr #3
  10c338:	0010c3c4 	andeqs	ip, r0, r4, asr #7
  10c33c:	0010c3e0 	andeqs	ip, r0, r0, ror #7
  10c340:	0010c3fc 	ldreqsh	ip, [r0], -ip
  10c344:	e1d930b2 	ldrh	r3, [r9, #2]
  10c348:	e59f2238 	ldr	r2, [pc, #568]	; 10c588 <prog+0xc544>
  10c34c:	e5c23000 	strb	r3, [r2]
  10c350:	e59f3240 	ldr	r3, [pc, #576]	; 10c598 <prog+0xc554>
  10c354:	e3a02002 	mov	r2, #2	; 0x2
  10c358:	e5832000 	str	r2, [r3]
  10c35c:	ebfffdb4 	bl	10ba34 <prvSendZLP>
  10c360:	e59d5020 	ldr	r5, [sp, #32]
  10c364:	eafffec3 	b	10be78 <vUSBCDCTask+0x278>
  10c368:	ebfffdb1 	bl	10ba34 <prvSendZLP>
  10c36c:	e1d920b2 	ldrh	r2, [r9, #2]
  10c370:	e59f0220 	ldr	r0, [pc, #544]	; 10c598 <prog+0xc554>
  10c374:	e59f1228 	ldr	r1, [pc, #552]	; 10c5a4 <prog+0xc560>
  10c378:	e59d5020 	ldr	r5, [sp, #32]
  10c37c:	e3a03003 	mov	r3, #3	; 0x3
  10c380:	e5803000 	str	r3, [r0]
  10c384:	e5812000 	str	r2, [r1]
  10c388:	eafffeba 	b	10be78 <vUSBCDCTask+0x278>
  10c38c:	e3a01001 	mov	r1, #1	; 0x1
  10c390:	e59f01f0 	ldr	r0, [pc, #496]	; 10c588 <prog+0xc544>
  10c394:	e1a02001 	mov	r2, r1
  10c398:	e3a03000 	mov	r3, #0	; 0x0
  10c39c:	ebfffdf9 	bl	10bb88 <prvSendControlData>
  10c3a0:	e59d5020 	ldr	r5, [sp, #32]
  10c3a4:	eafffeb3 	b	10be78 <vUSBCDCTask+0x278>
  10c3a8:	e3a01002 	mov	r1, #2	; 0x2
  10c3ac:	e28d0024 	add	r0, sp, #36	; 0x24
  10c3b0:	e1a02001 	mov	r2, r1
  10c3b4:	e3a03000 	mov	r3, #0	; 0x0
  10c3b8:	ebfffdf2 	bl	10bb88 <prvSendControlData>
  10c3bc:	e59d5020 	ldr	r5, [sp, #32]
  10c3c0:	eafffeac 	b	10be78 <vUSBCDCTask+0x278>
  10c3c4:	ebfffd9a 	bl	10ba34 <prvSendZLP>
  10c3c8:	e59f01d8 	ldr	r0, [pc, #472]	; 10c5a8 <prog+0xc564>
  10c3cc:	e59f11c0 	ldr	r1, [pc, #448]	; 10c594 <prog+0xc550>
  10c3d0:	e3a02007 	mov	r2, #7	; 0x7
  10c3d4:	ebffd1fc 	bl	100bcc <memcpy>
  10c3d8:	e59d5020 	ldr	r5, [sp, #32]
  10c3dc:	eafffea5 	b	10be78 <vUSBCDCTask+0x278>
  10c3e0:	e59f01c0 	ldr	r0, [pc, #448]	; 10c5a8 <prog+0xc564>
  10c3e4:	e1d910b6 	ldrh	r1, [r9, #6]
  10c3e8:	e3a02007 	mov	r2, #7	; 0x7
  10c3ec:	e3a03000 	mov	r3, #0	; 0x0
  10c3f0:	ebfffde4 	bl	10bb88 <prvSendControlData>
  10c3f4:	e59d5020 	ldr	r5, [sp, #32]
  10c3f8:	eafffe9e 	b	10be78 <vUSBCDCTask+0x278>
  10c3fc:	ebfffd8c 	bl	10ba34 <prvSendZLP>
  10c400:	e1d930b2 	ldrh	r3, [r9, #2]
  10c404:	e59f0180 	ldr	r0, [pc, #384]	; 10c58c <prog+0xc548>
  10c408:	e59d5020 	ldr	r5, [sp, #32]
  10c40c:	e5c03000 	strb	r3, [r0]
  10c410:	eafffe98 	b	10be78 <vUSBCDCTask+0x278>
  10c414:	ebfffd9d 	bl	10ba90 <prvSendNextSegment>
  10c418:	e5950004 	ldr	r0, [r5, #4]
  10c41c:	eafffe85 	b	10be38 <vUSBCDCTask+0x238>
  10c420:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10c424:	e5046ffb 	str	r6, [r4, #-4091]
  10c428:	ebfffcab 	bl	10b6dc <vPortEnterCritical>
  10c42c:	e5143fcb 	ldr	r3, [r4, #-4043]
  10c430:	e383304f 	orr	r3, r3, #79	; 0x4f
  10c434:	e3c33030 	bic	r3, r3, #48	; 0x30
  10c438:	e3833c82 	orr	r3, r3, #33280	; 0x8200
  10c43c:	e5043fcb 	str	r3, [r4, #-4043]
  10c440:	e5046fef 	str	r6, [r4, #-4079]
  10c444:	e5143fc7 	ldr	r3, [r4, #-4039]
  10c448:	e383304f 	orr	r3, r3, #79	; 0x4f
  10c44c:	e3c33030 	bic	r3, r3, #48	; 0x30
  10c450:	e3a02004 	mov	r2, #4	; 0x4
  10c454:	e3833c86 	orr	r3, r3, #34304	; 0x8600
  10c458:	e5043fc7 	str	r3, [r4, #-4039]
  10c45c:	e5042fef 	str	r2, [r4, #-4079]
  10c460:	e5143fc3 	ldr	r3, [r4, #-4035]
  10c464:	e383304f 	orr	r3, r3, #79	; 0x4f
  10c468:	e3c33030 	bic	r3, r3, #48	; 0x30
  10c46c:	e3833c87 	orr	r3, r3, #34560	; 0x8700
  10c470:	e5043fc3 	str	r3, [r4, #-4035]
  10c474:	ebfffca3 	bl	10b708 <vPortExitCritical>
  10c478:	e59f3118 	ldr	r3, [pc, #280]	; 10c598 <prog+0xc554>
  10c47c:	e5950004 	ldr	r0, [r5, #4]
  10c480:	e3a02005 	mov	r2, #5	; 0x5
  10c484:	e5832000 	str	r2, [r3]
  10c488:	eafffe6a 	b	10be38 <vUSBCDCTask+0x238>
  10c48c:	e58c2084 	str	r2, [ip, #132]
  10c490:	e5950004 	ldr	r0, [r5, #4]
  10c494:	eaffff26 	b	10c134 <vUSBCDCTask+0x534>
  10c498:	e59f30e0 	ldr	r3, [pc, #224]	; 10c580 <prog+0xc53c>
  10c49c:	e5930000 	ldr	r0, [r3]
  10c4a0:	ebfff7ab 	bl	10a354 <uxQueueMessagesWaiting>
  10c4a4:	e3500000 	cmp	r0, #0	; 0x0
  10c4a8:	0afffec7 	beq	10bfcc <vUSBCDCTask+0x3cc>
  10c4ac:	eaffff39 	b	10c198 <prog+0xc154>
  10c4b0:	e1d110b6 	ldrh	r1, [r1, #6]
  10c4b4:	e59f00f0 	ldr	r0, [pc, #240]	; 10c5ac <prog+0xc568>
  10c4b8:	e3a02012 	mov	r2, #18	; 0x12
  10c4bc:	ebfffdb1 	bl	10bb88 <prvSendControlData>
  10c4c0:	e59d5020 	ldr	r5, [sp, #32]
  10c4c4:	eafffe6b 	b	10be78 <vUSBCDCTask+0x278>
  10c4c8:	e20230ff 	and	r3, r2, #255	; 0xff
  10c4cc:	e3530004 	cmp	r3, #4	; 0x4
  10c4d0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10c4d4:	eaffff3b 	b	10c1c8 <prog+0xc184>
  10c4d8:	0010c51c 	andeqs	ip, r0, ip, lsl r5
  10c4dc:	0010c538 	andeqs	ip, r0, r8, lsr r5
  10c4e0:	0010c554 	andeqs	ip, r0, r4, asr r5
  10c4e4:	0010c554 	andeqs	ip, r0, r4, asr r5
  10c4e8:	0010c554 	andeqs	ip, r0, r4, asr r5
  10c4ec:	e20230ff 	and	r3, r2, #255	; 0xff
  10c4f0:	e59fc0b8 	ldr	ip, [pc, #184]	; 10c5b0 <prog+0xc56c>
  10c4f4:	e3530002 	cmp	r3, #2	; 0x2
  10c4f8:	23a03002 	movcs	r3, #2	; 0x2
  10c4fc:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  10c500:	e59fc0ac 	ldr	ip, [pc, #172]	; 10c5b4 <prog+0xc570>
  10c504:	e1d110b6 	ldrh	r1, [r1, #6]
  10c508:	e79c0103 	ldr	r0, [ip, r3, lsl #2]
  10c50c:	e3a03001 	mov	r3, #1	; 0x1
  10c510:	ebfffd9c 	bl	10bb88 <prvSendControlData>
  10c514:	e59d5020 	ldr	r5, [sp, #32]
  10c518:	eafffe56 	b	10be78 <vUSBCDCTask+0x278>
  10c51c:	e59f0094 	ldr	r0, [pc, #148]	; 10c5b8 <prog+0xc574>
  10c520:	e1d910b6 	ldrh	r1, [r9, #6]
  10c524:	e3a02004 	mov	r2, #4	; 0x4
  10c528:	e3a03001 	mov	r3, #1	; 0x1
  10c52c:	ebfffd95 	bl	10bb88 <prvSendControlData>
  10c530:	e59d5020 	ldr	r5, [sp, #32]
  10c534:	eafffe4f 	b	10be78 <vUSBCDCTask+0x278>
  10c538:	e59f007c 	ldr	r0, [pc, #124]	; 10c5bc <prog+0xc578>
  10c53c:	e1d910b6 	ldrh	r1, [r9, #6]
  10c540:	e3a0201c 	mov	r2, #28	; 0x1c
  10c544:	e3a03001 	mov	r3, #1	; 0x1
  10c548:	ebfffd8e 	bl	10bb88 <prvSendControlData>
  10c54c:	e59d5020 	ldr	r5, [sp, #32]
  10c550:	eafffe48 	b	10be78 <vUSBCDCTask+0x278>
  10c554:	e59f0064 	ldr	r0, [pc, #100]	; 10c5c0 <prog+0xc57c>
  10c558:	e1d910b6 	ldrh	r1, [r9, #6]
  10c55c:	e3a0202c 	mov	r2, #44	; 0x2c
  10c560:	e3a03001 	mov	r3, #1	; 0x1
  10c564:	ebfffd87 	bl	10bb88 <prvSendControlData>
  10c568:	e59d5020 	ldr	r5, [sp, #32]
  10c56c:	eafffe41 	b	10be78 <vUSBCDCTask+0x278>
  10c570:	0010cedc 	ldreqsb	ip, [r0], -ip
  10c574:	002019d4 	ldreqd	r1, [r0], -r4
  10c578:	00200f24 	eoreq	r0, r0, r4, lsr #30
  10c57c:	00200f28 	eoreq	r0, r0, r8, lsr #30
  10c580:	00200f2c 	eoreq	r0, r0, ip, lsr #30
  10c584:	00200f34 	eoreq	r0, r0, r4, lsr pc
  10c588:	00200e00 	eoreq	r0, r0, r0, lsl #28
  10c58c:	00200f30 	eoreq	r0, r0, r0, lsr pc
  10c590:	00200e14 	eoreq	r0, r0, r4, lsl lr
  10c594:	00200e9c 	mlaeq	r0, ip, lr, r0
  10c598:	00200e04 	eoreq	r0, r0, r4, lsl #28
  10c59c:	0010c768 	andeqs	ip, r0, r8, ror #14
  10c5a0:	00200e0c 	eoreq	r0, r0, ip, lsl #28
  10c5a4:	00200e08 	eoreq	r0, r0, r8, lsl #28
  10c5a8:	0010cef0 	ldreqsh	ip, [r0], -r0
  10c5ac:	0010cec8 	andeqs	ip, r0, r8, asr #29
  10c5b0:	0010cec0 	andeqs	ip, r0, r0, asr #29
  10c5b4:	0020083c 	eoreq	r0, r0, ip, lsr r8
  10c5b8:	0010cded 	andeqs	ip, r0, sp, ror #27
  10c5bc:	0010cdf1 	ldreqsh	ip, [r0], -r1
  10c5c0:	0010ce0d 	andeqs	ip, r0, sp, lsl #28

0010c5c4 <vUSB_ISR_Handler>:
  10c5c4:	e59f2190 	ldr	r2, [pc, #400]	; 10c75c <prog+0xc718>
  10c5c8:	e5921000 	ldr	r1, [r2]
  10c5cc:	e5923000 	ldr	r3, [r2]
  10c5d0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10c5d4:	e2833001 	add	r3, r3, #1	; 0x1
  10c5d8:	e5823000 	str	r3, [r2]
  10c5dc:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10c5e0:	e514cfe3 	ldr	ip, [r4, #-4067]
  10c5e4:	e59f0174 	ldr	r0, [pc, #372]	; 10c760 <prog+0xc71c>
  10c5e8:	e514efcf 	ldr	lr, [r4, #-4047]
  10c5ec:	e2011003 	and	r1, r1, #3	; 0x3
  10c5f0:	e5143fe7 	ldr	r3, [r4, #-4071]
  10c5f4:	e1a01201 	mov	r1, r1, lsl #4
  10c5f8:	e24dd008 	sub	sp, sp, #8	; 0x8
  10c5fc:	e0812000 	add	r2, r1, r0
  10c600:	e3833a01 	orr	r3, r3, #4096	; 0x1000
  10c604:	e3a05000 	mov	r5, #0	; 0x0
  10c608:	e31e0006 	tst	lr, #6	; 0x6
  10c60c:	e781c000 	str	ip, [r1, r0]
  10c610:	e582e004 	str	lr, [r2, #4]
  10c614:	e5043fdf 	str	r3, [r4, #-4063]
  10c618:	e88d0024 	stmia	sp, {r2, r5}
  10c61c:	0a000019 	beq	10c688 <vUSB_ISR_Handler+0xc4>
  10c620:	e1a0382e 	mov	r3, lr, lsr #16
  10c624:	e1a0ca83 	mov	ip, r3, lsl #21
  10c628:	e1a0caac 	mov	ip, ip, lsr #21
  10c62c:	e15c0005 	cmp	ip, r5
  10c630:	0a000009 	beq	10c65c <vUSB_ISR_Handler+0x98>
  10c634:	e1a00005 	mov	r0, r5
  10c638:	e1a0e004 	mov	lr, r4
  10c63c:	e59d2000 	ldr	r2, [sp]
  10c640:	e2803001 	add	r3, r0, #1	; 0x1
  10c644:	e0802002 	add	r2, r0, r2
  10c648:	e51e1faf 	ldr	r1, [lr, #-4015]
  10c64c:	e20300ff 	and	r0, r3, #255	; 0xff
  10c650:	e15c0000 	cmp	ip, r0
  10c654:	e5c21008 	strb	r1, [r2, #8]
  10c658:	8afffff7 	bhi	10c63c <vUSB_ISR_Handler+0x78>
  10c65c:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  10c660:	e5113fcf 	ldr	r3, [r1, #-4047]
  10c664:	e3130004 	tst	r3, #4	; 0x4
  10c668:	1a000025 	bne	10c704 <vUSB_ISR_Handler+0x140>
  10c66c:	e5113fcf 	ldr	r3, [r1, #-4047]
  10c670:	e3c33002 	bic	r3, r3, #2	; 0x2
  10c674:	e5013fcf 	str	r3, [r1, #-4047]
  10c678:	e1a02001 	mov	r2, r1
  10c67c:	e5123fcf 	ldr	r3, [r2, #-4047]
  10c680:	e3130002 	tst	r3, #2	; 0x2
  10c684:	1afffffc 	bne	10c67c <vUSB_ISR_Handler+0xb8>
  10c688:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  10c68c:	e51e3fcb 	ldr	r3, [lr, #-4043]
  10c690:	e3130042 	tst	r3, #66	; 0x42
  10c694:	13a03002 	movne	r3, #2	; 0x2
  10c698:	150e3feb 	strne	r3, [lr, #-4075]
  10c69c:	e51e3fcf 	ldr	r3, [lr, #-4047]
  10c6a0:	e3c33009 	bic	r3, r3, #9	; 0x9
  10c6a4:	e50e3fcf 	str	r3, [lr, #-4047]
  10c6a8:	e51e2fcb 	ldr	r2, [lr, #-4043]
  10c6ac:	e3c2200d 	bic	r2, r2, #13	; 0xd
  10c6b0:	e50e2fcb 	str	r2, [lr, #-4043]
  10c6b4:	e51e3fc7 	ldr	r3, [lr, #-4039]
  10c6b8:	e3c3304f 	bic	r3, r3, #79	; 0x4f
  10c6bc:	e50e3fc7 	str	r3, [lr, #-4039]
  10c6c0:	e51ecfc3 	ldr	ip, [lr, #-4035]
  10c6c4:	e59f3098 	ldr	r3, [pc, #152]	; 10c764 <prog+0xc720>
  10c6c8:	e3ccc04f 	bic	ip, ip, #79	; 0x4f
  10c6cc:	e5930000 	ldr	r0, [r3]
  10c6d0:	e28d2004 	add	r2, sp, #4	; 0x4
  10c6d4:	e3a03000 	mov	r3, #0	; 0x0
  10c6d8:	e1a0100d 	mov	r1, sp
  10c6dc:	e50ecfc3 	str	ip, [lr, #-4035]
  10c6e0:	ebfff75b 	bl	10a454 <xQueueGenericSendFromISR>
  10c6e4:	e59d3004 	ldr	r3, [sp, #4]
  10c6e8:	e3a02000 	mov	r2, #0	; 0x0
  10c6ec:	e3530000 	cmp	r3, #0	; 0x0
  10c6f0:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10c6f4:	e5832031 	str	r2, [r3, #49]
  10c6f8:	1bfff89c 	blne	10a970 <vTaskSwitchContext>
  10c6fc:	e28dd008 	add	sp, sp, #8	; 0x8
  10c700:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10c704:	e35c0000 	cmp	ip, #0	; 0x0
  10c708:	1a000007 	bne	10c72c <vUSB_ISR_Handler+0x168>
  10c70c:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10c710:	e5123fcf 	ldr	r3, [r2, #-4047]
  10c714:	e3c33004 	bic	r3, r3, #4	; 0x4
  10c718:	e5023fcf 	str	r3, [r2, #-4047]
  10c71c:	e5123fcf 	ldr	r3, [r2, #-4047]
  10c720:	e3130004 	tst	r3, #4	; 0x4
  10c724:	1afffffc 	bne	10c71c <vUSB_ISR_Handler+0x158>
  10c728:	eaffffd6 	b	10c688 <vUSB_ISR_Handler+0xc4>
  10c72c:	e59d3000 	ldr	r3, [sp]
  10c730:	e1d320d8 	ldrsb	r2, [r3, #8]
  10c734:	e3520000 	cmp	r2, #0	; 0x0
  10c738:	aafffff3 	bge	10c70c <vUSB_ISR_Handler+0x148>
  10c73c:	e5113fcf 	ldr	r3, [r1, #-4047]
  10c740:	e3833080 	orr	r3, r3, #128	; 0x80
  10c744:	e5013fcf 	str	r3, [r1, #-4047]
  10c748:	e1a02001 	mov	r2, r1
  10c74c:	e5123fcf 	ldr	r3, [r2, #-4047]
  10c750:	e3130080 	tst	r3, #128	; 0x80
  10c754:	0afffffc 	beq	10c74c <vUSB_ISR_Handler+0x188>
  10c758:	eaffffeb 	b	10c70c <vUSB_ISR_Handler+0x148>
  10c75c:	00200f38 	eoreq	r0, r0, r8, lsr pc
  10c760:	00200f3c 	eoreq	r0, r0, ip, lsr pc
  10c764:	002019d4 	ldreqd	r1, [r0], -r4

0010c768 <vUSB_ISR_Wrapper>:
  10c768:	e92d0001 	stmdb	sp!, {r0}
  10c76c:	e94d2000 	stmdb	sp, {sp}^
  10c770:	e1a00000 	nop			(mov r0,r0)
  10c774:	e24dd004 	sub	sp, sp, #4	; 0x4
  10c778:	e8bd0001 	ldmia	sp!, {r0}
  10c77c:	e9204000 	stmdb	r0!, {lr}
  10c780:	e1a0e000 	mov	lr, r0
  10c784:	e8bd0001 	ldmia	sp!, {r0}
  10c788:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10c78c:	e1a00000 	nop			(mov r0,r0)
  10c790:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10c794:	e14f0000 	mrs	r0, SPSR
  10c798:	e92e0001 	stmdb	lr!, {r0}
  10c79c:	e59f0064 	ldr	r0, [pc, #100]	; 10c808 <prog+0xc7c4>
  10c7a0:	e5900000 	ldr	r0, [r0]
  10c7a4:	e92e0001 	stmdb	lr!, {r0}
  10c7a8:	e59f005c 	ldr	r0, [pc, #92]	; 10c80c <prog+0xc7c8>
  10c7ac:	e5900000 	ldr	r0, [r0]
  10c7b0:	e580e000 	str	lr, [r0]
  10c7b4:	e59f4044 	ldr	r4, [pc, #68]	; 10c800 <prog+0xc7bc>
  10c7b8:	e59f5044 	ldr	r5, [pc, #68]	; 10c804 <prog+0xc7c0>
  10c7bc:	e5943000 	ldr	r3, [r4]
  10c7c0:	e5952000 	ldr	r2, [r5]
  10c7c4:	ebffff7e 	bl	10c5c4 <vUSB_ISR_Handler>
  10c7c8:	e59f003c 	ldr	r0, [pc, #60]	; 10c80c <prog+0xc7c8>
  10c7cc:	e5900000 	ldr	r0, [r0]
  10c7d0:	e590e000 	ldr	lr, [r0]
  10c7d4:	e59f002c 	ldr	r0, [pc, #44]	; 10c808 <prog+0xc7c4>
  10c7d8:	e8be0002 	ldmia	lr!, {r1}
  10c7dc:	e5801000 	str	r1, [r0]
  10c7e0:	e8be0001 	ldmia	lr!, {r0}
  10c7e4:	e169f000 	msr	SPSR_fc, r0
  10c7e8:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10c7ec:	e1a00000 	nop			(mov r0,r0)
  10c7f0:	e59ee03c 	ldr	lr, [lr, #60]
  10c7f4:	e25ef004 	subs	pc, lr, #4	; 0x4
  10c7f8:	e5943000 	ldr	r3, [r4]
  10c7fc:	e5952000 	ldr	r2, [r5]
  10c800:	00200838 	eoreq	r0, r0, r8, lsr r8
  10c804:	00200d04 	eoreq	r0, r0, r4, lsl #26
  10c808:	00200838 	eoreq	r0, r0, r8, lsr r8
  10c80c:	00200d04 	eoreq	r0, r0, r4, lsl #26

0010c810 <zeroes.3055>:
  10c810:	30303030 30303030 30303030 30303030     0000000000000000

0010c820 <blanks.3054>:
  10c820:	20202020 20202020 20202020 20202020                     

0010c830 <_global_impure_ptr>:
  10c830:	00200414                                .. .

0010c834 <lconv>:
  10c834:	0010cf50 0010cdec 0010cdec 0010cdec     P...............
  10c844:	0010cdec 0010cdec 0010cdec 0010cdec     ................
  10c854:	0010cdec 0010cdec ffffffff ffffffff     ................

0010c864 <charset>:
  10c864:	0010cf90                                ....

0010c868 <__mprec_tens>:
  10c868:	3ff00000 00000000 40240000 00000000     ...?......$@....
  10c878:	40590000 00000000 408f4000 00000000     ..Y@.....@.@....
  10c888:	40c38800 00000000 40f86a00 00000000     ...@.....j.@....
  10c898:	412e8480 00000000 416312d0 00000000     ...A......cA....
  10c8a8:	4197d784 00000000 41cdcd65 00000000     ...A....e..A....
  10c8b8:	4202a05f 20000000 42374876 e8000000     _..B... vH7B....
  10c8c8:	426d1a94 a2000000 42a2309c e5400000     ..mB.....0.B..@.
  10c8d8:	42d6bcc4 1e900000 430c6bf5 26340000     ...B.....k.C..4&
  10c8e8:	4341c379 37e08000 43763457 85d8a000     y.AC...7W4vC....
  10c8f8:	43abc16d 674ec800 43e158e4 60913d00     m..C..Ng.X.C.=.`
  10c908:	4415af1d 78b58c40 444b1ae4 d6e2ef50     ...D@..x..KDP...
  10c918:	4480f0cf 064dd592 44b52d02 c7e14af6     ...D..M..-.D.J..
  10c928:	44ea7843 79d99db4                       Cx.D...y

0010c930 <__mprec_bigtens>:
  10c930:	4341c379 37e08000 4693b8b5 b5056e17     y.AC...7...F.n..
  10c940:	4d384f03 e93ff9f5 5a827748 f9301d32     .O8M..?.Hw.Z2.0.
  10c950:	75154fdd 7f73bf3c                       .O.u<.s.

0010c958 <__mprec_tinytens>:
  10c958:	3c9cd2b2 97d889bc 3949f623 d5a8a733     ...<....#.I93...
  10c968:	32a50ffd 44f4a73d 255bba08 cf8c979d     ...2=..D..[%....
  10c978:	0ac80628 64ac6f43                       (...Co.d

0010c980 <p05.2298>:
  10c980:	00000005 00000019 0000007d              ........}...

0010c98c <__thenan_df>:
	...
  10c9a0:	00425355 53425355 4c4c4548 00000000     USB.USBSHELL....
  10c9b0:	69676542 000a3a6e 5f46526e 78547852     Begin:..nRF_RxTx
  10c9c0:	00000000                                ....

0010c9c4 <tea_key>:
  10c9c4:	00112233 44556677 8899aabb ccddeeff     3"..wfUD........

0010c9d4 <broadcast_mac>:
  10c9d4:	41434544 00000044                       DECAD...

0010c9dc <crc32_table>:
  10c9dc:	00000000 77073096 ee0e612c 990951ba     .....0.w,a...Q..
  10c9ec:	076dc419 706af48f e963a535 9e6495a3     ..m...jp5.c...d.
  10c9fc:	0edb8832 79dcb8a4 e0d5e91e 97d2d988     2......y........
  10ca0c:	09b64c2b 7eb17cbd e7b82d07 90bf1d91     +L...|.~.-......
  10ca1c:	1db71064 6ab020f2 f3b97148 84be41de     d.... .jHq...A..
  10ca2c:	1adad47d 6ddde4eb f4d4b551 83d385c7     }......mQ.......
  10ca3c:	136c9856 646ba8c0 fd62f97a 8a65c9ec     V.l...kdz.b...e.
  10ca4c:	14015c4f 63066cd9 fa0f3d63 8d080df5     O\...l.cc=......
  10ca5c:	3b6e20c8 4c69105e d56041e4 a2677172     . n;^.iL.A`.rqg.
  10ca6c:	3c03e4d1 4b04d447 d20d85fd a50ab56b     ...<G..K....k...
  10ca7c:	35b5a8fa 42b2986c dbbbc9d6 acbcf940     ...5l..B....@...
  10ca8c:	32d86ce3 45df5c75 dcd60dcf abd13d59     .l.2u\.E....Y=..
  10ca9c:	26d930ac 51de003a c8d75180 bfd06116     .0.&:..Q.Q...a..
  10caac:	21b4f4b5 56b3c423 cfba9599 b8bda50f     ...!#..V........
  10cabc:	2802b89e 5f058808 c60cd9b2 b10be924     ...(..._....$...
  10cacc:	2f6f7c87 58684c11 c1611dab b6662d3d     .|o/.LhX..a.=-f.
  10cadc:	76dc4190 01db7106 98d220bc efd5102a     .A.v.q... ..*...
  10caec:	71b18589 06b6b51f 9fbfe4a5 e8b8d433     ...q........3...
  10cafc:	7807c9a2 0f00f934 9609a88e e10e9818     ...x4...........
  10cb0c:	7f6a0dbb 086d3d2d 91646c97 e6635c01     ..j.-=m..ld..\c.
  10cb1c:	6b6b51f4 1c6c6162 856530d8 f262004e     .Qkkbal..0e.N.b.
  10cb2c:	6c0695ed 1b01a57b 8208f4c1 f50fc457     ...l{.......W...
  10cb3c:	65b0d9c6 12b7e950 8bbeb8ea fcb9887c     ...eP.......|...
  10cb4c:	62dd1ddf 15da2d49 8cd37cf3 fbd44c65     ...bI-...|..eL..
  10cb5c:	4db26158 3ab551ce a3bc0074 d4bb30e2     Xa.M.Q.:t....0..
  10cb6c:	4adfa541 3dd895d7 a4d1c46d d3d6f4fb     A..J...=m.......
  10cb7c:	4369e96a 346ed9fc ad678846 da60b8d0     j.iC..n4F.g...`.
  10cb8c:	44042d73 33031de5 aa0a4c5f dd0d7cc9     s-.D...3_L...|..
  10cb9c:	5005713c 270241aa be0b1010 c90c2086     <q.P.A.'..... ..
  10cbac:	5768b525 206f85b3 b966d409 ce61e49f     %.hW..o ..f...a.
  10cbbc:	5edef90e 29d9c998 b0d09822 c7d7a8b4     ...^...)".......
  10cbcc:	59b33d17 2eb40d81 b7bd5c3b c0ba6cad     .=.Y....;\...l..
  10cbdc:	edb88320 9abfb3b6 03b6e20c 74b1d29a      ..............t
  10cbec:	ead54739 9dd277af 04db2615 73dc1683     9G...w...&.....s
  10cbfc:	e3630b12 94643b84 0d6d6a3e 7a6a5aa8     ..c..;d.>jm..Zjz
  10cc0c:	e40ecf0b 9309ff9d 0a00ae27 7d079eb1     ........'......}
  10cc1c:	f00f9344 8708a3d2 1e01f268 6906c2fe     D.......h......i
  10cc2c:	f762575d 806567cb 196c3671 6e6b06e7     ]Wb..ge.q6l...kn
  10cc3c:	fed41b76 89d32be0 10da7a5a 67dd4acc     v....+..Zz...J.g
  10cc4c:	f9b9df6f 8ebeeff9 17b7be43 60b08ed5     o.......C......`
  10cc5c:	d6d6a3e8 a1d1937e 38d8c2c4 4fdff252     ....~......8R..O
  10cc6c:	d1bb67f1 a6bc5767 3fb506dd 48b2364b     .g..gW.....?K6.H
  10cc7c:	d80d2bda af0a1b4c 36034af6 41047a60     .+..L....J.6`z.A
  10cc8c:	df60efc3 a867df55 316e8eef 4669be79     ..`.U.g...n1y.iF
  10cc9c:	cb61b38c bc66831a 256fd2a0 5268e236     ..a...f...o%6.hR
  10ccac:	cc0c7795 bb0b4703 220216b9 5505262f     .w...G....."/&.U
  10ccbc:	c5ba3bbe b2bd0b28 2bb45a92 5cb36a04     .;..(....Z.+.j.\
  10cccc:	c2d7ffa7 b5d0cf31 2cd99e8b 5bdeae1d     ....1......,...[
  10ccdc:	9b64c2b0 ec63f226 756aa39c 026d930a     ..d.&.c...ju..m.
  10ccec:	9c0906a9 eb0e363f 72076785 05005713     ....?6...g.r.W..
  10ccfc:	95bf4a82 e2b87a14 7bb12bae 0cb61b38     .J...z...+.{8...
  10cd0c:	92d28e9b e5d5be0d 7cdcefb7 0bdbdf21     ...........|!...
  10cd1c:	86d3d2d4 f1d4e242 68ddb3f8 1fda836e     ....B......hn...
  10cd2c:	81be16cd f6b9265b 6fb077e1 18b74777     ....[&...w.owG..
  10cd3c:	88085ae6 ff0f6a70 66063bca 11010b5c     .Z..pj...;.f\...
  10cd4c:	8f659eff f862ae69 616bffd3 166ccf45     ..e.i.b...kaE.l.
  10cd5c:	a00ae278 d70dd2ee 4e048354 3903b3c2     x.......T..N...9
  10cd6c:	a7672661 d06016f7 4969474d 3e6e77db     a&g...`.MGiI.wn>
  10cd7c:	aed16a4a d9d65adc 40df0b66 37d83bf0     Jj...Z..f..@.;.7
  10cd8c:	a9bcae53 debb9ec5 47b2cf7f 30b5ffe9     S..........G...0
  10cd9c:	bdbdf21c cabac28a 53b39330 24b4a3a6     ........0..S...$
  10cdac:	bad03605 cdd70693 54de5729 23d967bf     .6......)W.T.g.#
  10cdbc:	b3667a2e c4614ab8 5d681b02 2a6f2b94     .zf..Ja...h].+o*
  10cdcc:	b40bbe37 c30c8ea1 5a05df1b 2d02ef8d     7..........Z...-

0010cddc <rfbroadcast_mac>:
  10cddc:	43415354 00735042                                TSACB

0010cde1 <ACTIVATE_SEQUENCE.1822>:
  10cde1:	00007350                                         Ps

0010cde3 <C.2.1824>:
  10cde3:	00000000 4c444900 03040045                       .....IDLE.

0010cded <pxLanguageStringDescriptor>:
  10cded:	04090304                                ....

0010cdf1 <pxManufacturerStringDescriptor>:
  10cdf1:	0062031c 00740069 0061006d 0075006e     ..b.i.t.m.a.n.u.
  10ce01:	00610066 0074006b 00720075              f.a.k.t.u.r.

0010ce0d <pxProductStringDescriptor>:
  10ce0d:	004f0328 00650070 0042006e 00610065     (.O.p.e.n.B.e.a.
  10ce1d:	006f0063 0020006e 006c0042 006e0069     c.o.n. .B.l.i.n.
  10ce2d:	0065006b 006c006e 00000067              k.e.n.l.g...

0010ce39 <pxConfigDescriptor1>:
  10ce39:	00430209 80030102 000409fa 02020100     ..C.............
  10ce49:	24050401 04011000 05000224 01000624     ...$....$...$...
  10ce59:	00012405 83050701 ff000803 00010409     .$..............
  10ce69:	00000a02 01050700 00004002 02820507     .........@......
  10ce79:	09000040                                         @..

0010ce7c <pxConfigDescriptor2>:
  10ce7c:	00430209 80030202 00040932 02020100     ..C.....2.......
  10ce8c:	24050401 04011000 05000224 01000624     ...$....$...$...
  10ce9c:	00012405 83050701 ff000803 00010409     .$..............
  10ceac:	00000a02 01050700 00004002 02820507     .........@......
  10cebc:	00000040                                @...

0010cec0 <pxConfigDescriptorSizes>:
  10cec0:	00000043 00000043                       C...C...

0010cec8 <pxDeviceDescriptor>:
  10cec8:	01100112 08000002 08af16c0 02010110     ................
  10ced8:	00000200                                ....

0010cedc <C.25.4300>:
	...

0010cef0 <pxLineCoding>:
  10cef0:	0001c200 00080000 33323130 37363534     ........01234567
  10cf00:	62613938 66656463 00000000 00464e49     89abcdef....INF.
  10cf10:	004e414e 006e616e 33323130 37363534     NAN.nan.01234567
  10cf20:	42413938 46454443 00000000 20677562     89ABCDEF....bug 
  10cf30:	76206e69 69727066 3a66746e 64616220     in vfprintf: bad
  10cf40:	73616220 00000065 00666e69 00000030      base...inf.0...
  10cf50:	0000002e 6c756e28 0000296c 54552d43     ....(null)..C-UT
  10cf60:	00382d46 4a532d43 00005349 55452d43     F-8.C-SJIS..C-EU
  10cf70:	00504a43 494a2d43 00000053 69666e49     CJP.C-JIS...Infi
  10cf80:	7974696e 00000000 004e614e 00000043     nity....NaN.C...
  10cf90:	2d4f5349 39353838 0000312d 0074743a     ISO-8859-1..:tt.
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
  200448:	0010cf8c 00000000 00000000 00000000     ................
	...
  2004b8:	00000001 00000000 abcd330e e66d1234     .........3..4.m.
  2004c8:	0005deec 0000000b 00000000 00000000     ................
	...

00200814 <__mb_cur_max>:
  200814:	00000001                                ....

00200818 <__lc_ctype>:
  200818:	00000043 00000000 00000000              C...........

00200824 <jam_mac>:
  200824:	4d4d414a 434d5700                                JAMM.

00200829 <wmcu_mac>:
  200829:	55434d57 19000000                                WMCU...

00200830 <random_seed_v1>:
  200830:	52f7d319                                ...R

00200834 <random_seed_v2>:
  200834:	6e28014a                                J.(n

00200838 <ulCriticalNesting>:
  200838:	0000270f                                .'..

0020083c <pxConfigDescriptorList>:
  20083c:	0010ce39 0010ce7c                       9...|...

00200844 <xxtea_encode>:
  200844:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  200848:	e0803101 	add	r3, r0, r1, lsl #2
  20084c:	e1a09000 	mov	r9, r0
  200850:	e3a00034 	mov	r0, #52	; 0x34
  200854:	e1a04001 	mov	r4, r1
  200858:	e5135004 	ldr	r5, [r3, #-4]
  20085c:	e243b004 	sub	fp, r3, #4	; 0x4
  200860:	ebfbfe6f 	bl	100224 <__aeabi_idiv>
  200864:	e2800005 	add	r0, r0, #5	; 0x5
  200868:	e3700001 	cmn	r0, #1	; 0x1
  20086c:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200870:	e0803100 	add	r3, r0, r0, lsl #2
  200874:	e0603283 	rsb	r3, r0, r3, lsl #5
  200878:	e0833283 	add	r3, r3, r3, lsl #5
  20087c:	e0603103 	rsb	r3, r0, r3, lsl #2
  200880:	e0633283 	rsb	r3, r3, r3, lsl #5
  200884:	e0633403 	rsb	r3, r3, r3, lsl #8
  200888:	e0803083 	add	r3, r0, r3, lsl #1
  20088c:	e0803183 	add	r3, r0, r3, lsl #3
  200890:	e283a49f 	add	sl, r3, #-1627389952	; 0x9f000000
  200894:	e24aa732 	sub	sl, sl, #13107200	; 0xc80000
  200898:	e24aac86 	sub	sl, sl, #34304	; 0x8600
  20089c:	e59f80d8 	ldr	r8, [pc, #216]	; 20097c <.data+0x97c>
  2008a0:	e1a0c005 	mov	ip, r5
  2008a4:	e2447001 	sub	r7, r4, #1	; 0x1
  2008a8:	e24aa047 	sub	sl, sl, #71	; 0x47
  2008ac:	e3a05000 	mov	r5, #0	; 0x0
  2008b0:	e285549f 	add	r5, r5, #-1627389952	; 0x9f000000
  2008b4:	e2455732 	sub	r5, r5, #13107200	; 0xc80000
  2008b8:	e2455c86 	sub	r5, r5, #34304	; 0x8600
  2008bc:	e2455047 	sub	r5, r5, #71	; 0x47
  2008c0:	e3570000 	cmp	r7, #0	; 0x0
  2008c4:	e1a03125 	mov	r3, r5, lsr #2
  2008c8:	e2036003 	and	r6, r3, #3	; 0x3
  2008cc:	d3a01000 	movle	r1, #0	; 0x0
  2008d0:	da000016 	ble	200930 <xxtea_encode+0xec>
  2008d4:	e1a0e009 	mov	lr, r9
  2008d8:	e3a04000 	mov	r4, #0	; 0x0
  2008dc:	e2043003 	and	r3, r4, #3	; 0x3
  2008e0:	e59e2004 	ldr	r2, [lr, #4]
  2008e4:	e0263003 	eor	r3, r6, r3
  2008e8:	e7980103 	ldr	r0, [r8, r3, lsl #2]
  2008ec:	e1a0120c 	mov	r1, ip, lsl #4
  2008f0:	e1a03102 	mov	r3, r2, lsl #2
  2008f4:	e02111a2 	eor	r1, r1, r2, lsr #3
  2008f8:	e02c0000 	eor	r0, ip, r0
  2008fc:	e02332ac 	eor	r3, r3, ip, lsr #5
  200900:	e0252002 	eor	r2, r5, r2
  200904:	e0833001 	add	r3, r3, r1
  200908:	e0822000 	add	r2, r2, r0
  20090c:	e59e1000 	ldr	r1, [lr]
  200910:	e0233002 	eor	r3, r3, r2
  200914:	e2844001 	add	r4, r4, #1	; 0x1
  200918:	e0833001 	add	r3, r3, r1
  20091c:	e1570004 	cmp	r7, r4
  200920:	e48e3004 	str	r3, [lr], #4
  200924:	e1a0c003 	mov	ip, r3
  200928:	1affffeb 	bne	2008dc <xxtea_encode+0x98>
  20092c:	e2041003 	and	r1, r4, #3	; 0x3
  200930:	e5992000 	ldr	r2, [r9]
  200934:	e0261001 	eor	r1, r6, r1
  200938:	e7980101 	ldr	r0, [r8, r1, lsl #2]
  20093c:	e1a03102 	mov	r3, r2, lsl #2
  200940:	e1a0120c 	mov	r1, ip, lsl #4
  200944:	e02111a2 	eor	r1, r1, r2, lsr #3
  200948:	e02c0000 	eor	r0, ip, r0
  20094c:	e02332ac 	eor	r3, r3, ip, lsr #5
  200950:	e0252002 	eor	r2, r5, r2
  200954:	e0833001 	add	r3, r3, r1
  200958:	e0822000 	add	r2, r2, r0
  20095c:	e59b1000 	ldr	r1, [fp]
  200960:	e0233002 	eor	r3, r3, r2
  200964:	e0833001 	add	r3, r3, r1
  200968:	e155000a 	cmp	r5, sl
  20096c:	e58b3000 	str	r3, [fp]
  200970:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200974:	e1a0c003 	mov	ip, r3
  200978:	eaffffcc 	b	2008b0 <xxtea_encode+0x6c>
  20097c:	0010c9c4 	andeqs	ip, r0, r4, asr #19

00200980 <xxtea_decode>:
  200980:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  200984:	e1a09000 	mov	r9, r0
  200988:	e24dd00c 	sub	sp, sp, #12	; 0xc
  20098c:	e3a00034 	mov	r0, #52	; 0x34
  200990:	e58d1004 	str	r1, [sp, #4]
  200994:	ebfbfe22 	bl	100224 <__aeabi_idiv>
  200998:	e2800006 	add	r0, r0, #6	; 0x6
  20099c:	e0803100 	add	r3, r0, r0, lsl #2
  2009a0:	e0603283 	rsb	r3, r0, r3, lsl #5
  2009a4:	e0833283 	add	r3, r3, r3, lsl #5
  2009a8:	e0603103 	rsb	r3, r0, r3, lsl #2
  2009ac:	e0633283 	rsb	r3, r3, r3, lsl #5
  2009b0:	e0633403 	rsb	r3, r3, r3, lsl #8
  2009b4:	e0803083 	add	r3, r0, r3, lsl #1
  2009b8:	e0806183 	add	r6, r0, r3, lsl #3
  2009bc:	e3560000 	cmp	r6, #0	; 0x0
  2009c0:	e5994000 	ldr	r4, [r9]
  2009c4:	0a000041 	beq	200ad0 <xxtea_decode+0x150>
  2009c8:	e59d2004 	ldr	r2, [sp, #4]
  2009cc:	e1a02102 	mov	r2, r2, lsl #2
  2009d0:	e0893002 	add	r3, r9, r2
  2009d4:	e2433004 	sub	r3, r3, #4	; 0x4
  2009d8:	e58d3008 	str	r3, [sp, #8]
  2009dc:	e59d3004 	ldr	r3, [sp, #4]
  2009e0:	e58d2000 	str	r2, [sp]
  2009e4:	e59fa0ec 	ldr	sl, [pc, #236]	; 200ad8 <.data+0xad8>
  2009e8:	e1a05004 	mov	r5, r4
  2009ec:	e243b001 	sub	fp, r3, #1	; 0x1
  2009f0:	e35b0000 	cmp	fp, #0	; 0x0
  2009f4:	e1a03126 	mov	r3, r6, lsr #2
  2009f8:	e2038003 	and	r8, r3, #3	; 0x3
  2009fc:	d1a0e00b 	movle	lr, fp
  200a00:	da00001a 	ble	200a70 <xxtea_decode+0xf0>
  200a04:	e59d2004 	ldr	r2, [sp, #4]
  200a08:	e06b3002 	rsb	r3, fp, r2
  200a0c:	e2437001 	sub	r7, r3, #1	; 0x1
  200a10:	e59d3000 	ldr	r3, [sp]
  200a14:	e1a0e00b 	mov	lr, fp
  200a18:	e0834009 	add	r4, r3, r9
  200a1c:	e20e3003 	and	r3, lr, #3	; 0x3
  200a20:	e5140008 	ldr	r0, [r4, #-8]
  200a24:	e0283003 	eor	r3, r8, r3
  200a28:	e79ac103 	ldr	ip, [sl, r3, lsl #2]
  200a2c:	e1a02105 	mov	r2, r5, lsl #2
  200a30:	e1a03200 	mov	r3, r0, lsl #4
  200a34:	e02331a5 	eor	r3, r3, r5, lsr #3
  200a38:	e0261005 	eor	r1, r6, r5
  200a3c:	e020c00c 	eor	ip, r0, ip
  200a40:	e02222a0 	eor	r2, r2, r0, lsr #5
  200a44:	e0822003 	add	r2, r2, r3
  200a48:	e081100c 	add	r1, r1, ip
  200a4c:	e5143004 	ldr	r3, [r4, #-4]
  200a50:	e0222001 	eor	r2, r2, r1
  200a54:	e24ee001 	sub	lr, lr, #1	; 0x1
  200a58:	e0623003 	rsb	r3, r2, r3
  200a5c:	e15e0007 	cmp	lr, r7
  200a60:	e5243004 	str	r3, [r4, #-4]!
  200a64:	e1a05003 	mov	r5, r3
  200a68:	1affffeb 	bne	200a1c <xxtea_decode+0x9c>
  200a6c:	e5994000 	ldr	r4, [r9]
  200a70:	e59d2008 	ldr	r2, [sp, #8]
  200a74:	e20e3003 	and	r3, lr, #3	; 0x3
  200a78:	e5921000 	ldr	r1, [r2]
  200a7c:	e0283003 	eor	r3, r8, r3
  200a80:	e79a0103 	ldr	r0, [sl, r3, lsl #2]
  200a84:	e026c005 	eor	ip, r6, r5
  200a88:	e1a03105 	mov	r3, r5, lsl #2
  200a8c:	e2866461 	add	r6, r6, #1627389952	; 0x61000000
  200a90:	e1a02201 	mov	r2, r1, lsl #4
  200a94:	e0210000 	eor	r0, r1, r0
  200a98:	e02332a1 	eor	r3, r3, r1, lsr #5
  200a9c:	e02221a5 	eor	r2, r2, r5, lsr #3
  200aa0:	e2866732 	add	r6, r6, #13107200	; 0xc80000
  200aa4:	e0833002 	add	r3, r3, r2
  200aa8:	e08cc000 	add	ip, ip, r0
  200aac:	e2866c86 	add	r6, r6, #34304	; 0x8600
  200ab0:	e023300c 	eor	r3, r3, ip
  200ab4:	e2866047 	add	r6, r6, #71	; 0x47
  200ab8:	e0633004 	rsb	r3, r3, r4
  200abc:	e3560000 	cmp	r6, #0	; 0x0
  200ac0:	e5893000 	str	r3, [r9]
  200ac4:	e1a04003 	mov	r4, r3
  200ac8:	11a05003 	movne	r5, r3
  200acc:	1affffc7 	bne	2009f0 <xxtea_decode+0x70>
  200ad0:	e28dd00c 	add	sp, sp, #12	; 0xc
  200ad4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  200ad8:	0010c9c4 	andeqs	ip, r0, r4, asr #19

00200adc <crc32>:
  200adc:	e3510003 	cmp	r1, #3	; 0x3
  200ae0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  200ae4:	e1a0c001 	mov	ip, r1
  200ae8:	e1a04000 	mov	r4, r0
  200aec:	d3e0e000 	mvnle	lr, #0	; 0x0
  200af0:	da000015 	ble	200b4c <crc32+0x70>
  200af4:	e59f5088 	ldr	r5, [pc, #136]	; 200b84 <.data+0xb84>
  200af8:	e3e0e000 	mvn	lr, #0	; 0x0
  200afc:	e4940004 	ldr	r0, [r4], #4
  200b00:	e020300e 	eor	r3, r0, lr
  200b04:	e20330ff 	and	r3, r3, #255	; 0xff
  200b08:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200b0c:	e022242e 	eor	r2, r2, lr, lsr #8
  200b10:	e0223420 	eor	r3, r2, r0, lsr #8
  200b14:	e20330ff 	and	r3, r3, #255	; 0xff
  200b18:	e7951103 	ldr	r1, [r5, r3, lsl #2]
  200b1c:	e0211422 	eor	r1, r1, r2, lsr #8
  200b20:	e0213820 	eor	r3, r1, r0, lsr #16
  200b24:	e20330ff 	and	r3, r3, #255	; 0xff
  200b28:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200b2c:	e0222421 	eor	r2, r2, r1, lsr #8
  200b30:	e0220c20 	eor	r0, r2, r0, lsr #24
  200b34:	e20000ff 	and	r0, r0, #255	; 0xff
  200b38:	e7953100 	ldr	r3, [r5, r0, lsl #2]
  200b3c:	e24cc004 	sub	ip, ip, #4	; 0x4
  200b40:	e35c0003 	cmp	ip, #3	; 0x3
  200b44:	e023e422 	eor	lr, r3, r2, lsr #8
  200b48:	caffffeb 	bgt	200afc <crc32+0x20>
  200b4c:	e35c0000 	cmp	ip, #0	; 0x0
  200b50:	0a000009 	beq	200b7c <crc32+0xa0>
  200b54:	e59f5028 	ldr	r5, [pc, #40]	; 200b84 <.data+0xb84>
  200b58:	e3a01000 	mov	r1, #0	; 0x0
  200b5c:	e7d13004 	ldrb	r3, [r1, r4]
  200b60:	e023300e 	eor	r3, r3, lr
  200b64:	e20330ff 	and	r3, r3, #255	; 0xff
  200b68:	e7952103 	ldr	r2, [r5, r3, lsl #2]
  200b6c:	e2811001 	add	r1, r1, #1	; 0x1
  200b70:	e151000c 	cmp	r1, ip
  200b74:	e022e42e 	eor	lr, r2, lr, lsr #8
  200b78:	1afffff7 	bne	200b5c <crc32+0x80>
  200b7c:	e1e0000e 	mvn	r0, lr
  200b80:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  200b84:	0010c9dc 	ldreqsb	ip, [r0], -ip
