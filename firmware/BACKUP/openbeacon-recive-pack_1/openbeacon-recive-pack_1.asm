
openbeacon-recive-pack_1.elf:     file format elf32-littlearm

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
  100024:	0010a6a4 	andeqs	sl, r0, r4, lsr #13

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
  100090:	eb0023e9 	bl	10903c <AT91F_LowLevelInit>
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
  1000f8:	00200830 	eoreq	r0, r0, r0, lsr r8
  1000fc:	002011f0 	streqd	r1, [r0], -r0
  100100:	00200000 	eoreq	r0, r0, r0
  100104:	0010ba24 	andeqs	fp, r0, r4, lsr #20
  100108:	00200830 	eoreq	r0, r0, r0, lsr r8
  10010c:	00203ffc 	streqd	r3, [r0], -ip
  100110:	00108bd4 	ldreqsb	r8, [r0], -r4

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
  100200:	eb000007 	bl	100224 <__aeabi_idiv0>
  100204:	e3a00000 	mov	r0, #0	; 0x0
  100208:	e49df008 	ldr	pc, [sp], #8

0010020c <__aeabi_uidivmod>:
  10020c:	e92d4003 	stmdb	sp!, {r0, r1, lr}
  100210:	ebffffbf 	bl	100114 <__aeabi_uidiv>
  100214:	e8bd4006 	ldmia	sp!, {r1, r2, lr}
  100218:	e0030092 	mul	r3, r2, r0
  10021c:	e0411003 	sub	r1, r1, r3
  100220:	e12fff1e 	bx	lr

00100224 <__aeabi_idiv0>:
  100224:	e12fff1e 	bx	lr

00100228 <free>:
  100228:	e59f3008 	ldr	r3, [pc, #8]	; 100238 <prog+0x1f4>
  10022c:	e1a01000 	mov	r1, r0
  100230:	e5930000 	ldr	r0, [r3]
  100234:	ea001321 	b	104ec0 <_free_r>
  100238:	00200410 	eoreq	r0, r0, r0, lsl r4

0010023c <malloc>:
  10023c:	e59f3008 	ldr	r3, [pc, #8]	; 10024c <prog+0x208>
  100240:	e1a01000 	mov	r1, r0
  100244:	e5930000 	ldr	r0, [r3]
  100248:	ea000000 	b	100250 <_malloc_r>
  10024c:	00200410 	eoreq	r0, r0, r0, lsl r4

00100250 <_malloc_r>:
  100250:	e281300b 	add	r3, r1, #11	; 0xb
  100254:	e3530016 	cmp	r3, #22	; 0x16
  100258:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10025c:	83c35007 	bichi	r5, r3, #7	; 0x7
  100260:	93a05010 	movls	r5, #16	; 0x10
  100264:	93a03000 	movls	r3, #0	; 0x0
  100268:	81a03fa5 	movhi	r3, r5, lsr #31
  10026c:	e1550001 	cmp	r5, r1
  100270:	33833001 	orrcc	r3, r3, #1	; 0x1
  100274:	e3530000 	cmp	r3, #0	; 0x0
  100278:	e1a07000 	mov	r7, r0
  10027c:	13a0300c 	movne	r3, #12	; 0xc
  100280:	e24dd004 	sub	sp, sp, #4	; 0x4
  100284:	13a00000 	movne	r0, #0	; 0x0
  100288:	15873000 	strne	r3, [r7]
  10028c:	1a000017 	bne	1002f0 <_malloc_r+0xa0>
  100290:	e1a00007 	mov	r0, r7
  100294:	eb000217 	bl	100af8 <__malloc_lock>
  100298:	e3550f7e 	cmp	r5, #504	; 0x1f8
  10029c:	2a000015 	bcs	1002f8 <_malloc_r+0xa8>
  1002a0:	e59f86fc 	ldr	r8, [pc, #1788]	; 1009a4 <prog+0x960>
  1002a4:	e1a021a5 	mov	r2, r5, lsr #3
  1002a8:	e0883182 	add	r3, r8, r2, lsl #3
  1002ac:	e593400c 	ldr	r4, [r3, #12]
  1002b0:	e1530004 	cmp	r3, r4
  1002b4:	e1a0a008 	mov	sl, r8
  1002b8:	0a0000cd 	beq	1005f4 <_malloc_r+0x3a4>
  1002bc:	e5943004 	ldr	r3, [r4, #4]
  1002c0:	e3c33003 	bic	r3, r3, #3	; 0x3
  1002c4:	e0843003 	add	r3, r4, r3
  1002c8:	e5932004 	ldr	r2, [r3, #4]
  1002cc:	e594000c 	ldr	r0, [r4, #12]
  1002d0:	e5941008 	ldr	r1, [r4, #8]
  1002d4:	e3822001 	orr	r2, r2, #1	; 0x1
  1002d8:	e5801008 	str	r1, [r0, #8]
  1002dc:	e581000c 	str	r0, [r1, #12]
  1002e0:	e5832004 	str	r2, [r3, #4]
  1002e4:	e1a00007 	mov	r0, r7
  1002e8:	eb000203 	bl	100afc <__malloc_unlock>
  1002ec:	e2840008 	add	r0, r4, #8	; 0x8
  1002f0:	e28dd004 	add	sp, sp, #4	; 0x4
  1002f4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1002f8:	e1b024a5 	movs	r2, r5, lsr #9
  1002fc:	01a001a5 	moveq	r0, r5, lsr #3
  100300:	01a03180 	moveq	r3, r0, lsl #3
  100304:	1a000027 	bne	1003a8 <_malloc_r+0x158>
  100308:	e59f8694 	ldr	r8, [pc, #1684]	; 1009a4 <prog+0x960>
  10030c:	e0831008 	add	r1, r3, r8
  100310:	e591400c 	ldr	r4, [r1, #12]
  100314:	e1510004 	cmp	r1, r4
  100318:	e1a0a008 	mov	sl, r8
  10031c:	1a000005 	bne	100338 <_malloc_r+0xe8>
  100320:	ea00000a 	b	100350 <_malloc_r+0x100>
  100324:	e3520000 	cmp	r2, #0	; 0x0
  100328:	aa000047 	bge	10044c <_malloc_r+0x1fc>
  10032c:	e594400c 	ldr	r4, [r4, #12]
  100330:	e1510004 	cmp	r1, r4
  100334:	0a000005 	beq	100350 <_malloc_r+0x100>
  100338:	e5943004 	ldr	r3, [r4, #4]
  10033c:	e3c33003 	bic	r3, r3, #3	; 0x3
  100340:	e0652003 	rsb	r2, r5, r3
  100344:	e352000f 	cmp	r2, #15	; 0xf
  100348:	dafffff5 	ble	100324 <_malloc_r+0xd4>
  10034c:	e2400001 	sub	r0, r0, #1	; 0x1
  100350:	e280e001 	add	lr, r0, #1	; 0x1
  100354:	e59f664c 	ldr	r6, [pc, #1612]	; 1009a8 <prog+0x964>
  100358:	e5964008 	ldr	r4, [r6, #8]
  10035c:	e1560004 	cmp	r6, r4
  100360:	0a000076 	beq	100540 <_malloc_r+0x2f0>
  100364:	e5943004 	ldr	r3, [r4, #4]
  100368:	e3c32003 	bic	r2, r3, #3	; 0x3
  10036c:	e0650002 	rsb	r0, r5, r2
  100370:	e350000f 	cmp	r0, #15	; 0xf
  100374:	ca000027 	bgt	100418 <_malloc_r+0x1c8>
  100378:	e3500000 	cmp	r0, #0	; 0x0
  10037c:	e586600c 	str	r6, [r6, #12]
  100380:	e5866008 	str	r6, [r6, #8]
  100384:	ba00003c 	blt	10047c <_malloc_r+0x22c>
  100388:	e0842002 	add	r2, r4, r2
  10038c:	e5923004 	ldr	r3, [r2, #4]
  100390:	e3833001 	orr	r3, r3, #1	; 0x1
  100394:	e1a00007 	mov	r0, r7
  100398:	e5823004 	str	r3, [r2, #4]
  10039c:	eb0001d6 	bl	100afc <__malloc_unlock>
  1003a0:	e2840008 	add	r0, r4, #8	; 0x8
  1003a4:	eaffffd1 	b	1002f0 <_malloc_r+0xa0>
  1003a8:	e3520004 	cmp	r2, #4	; 0x4
  1003ac:	91a03325 	movls	r3, r5, lsr #6
  1003b0:	92830038 	addls	r0, r3, #56	; 0x38
  1003b4:	91a03180 	movls	r3, r0, lsl #3
  1003b8:	9affffd2 	bls	100308 <_malloc_r+0xb8>
  1003bc:	e3520014 	cmp	r2, #20	; 0x14
  1003c0:	9282005b 	addls	r0, r2, #91	; 0x5b
  1003c4:	91a03180 	movls	r3, r0, lsl #3
  1003c8:	9affffce 	bls	100308 <_malloc_r+0xb8>
  1003cc:	e3520054 	cmp	r2, #84	; 0x54
  1003d0:	91a03625 	movls	r3, r5, lsr #12
  1003d4:	9283006e 	addls	r0, r3, #110	; 0x6e
  1003d8:	91a03180 	movls	r3, r0, lsl #3
  1003dc:	9affffc9 	bls	100308 <_malloc_r+0xb8>
  1003e0:	e3520f55 	cmp	r2, #340	; 0x154
  1003e4:	91a037a5 	movls	r3, r5, lsr #15
  1003e8:	92830077 	addls	r0, r3, #119	; 0x77
  1003ec:	91a03180 	movls	r3, r0, lsl #3
  1003f0:	9affffc4 	bls	100308 <_malloc_r+0xb8>
  1003f4:	e3a03e55 	mov	r3, #1360	; 0x550
  1003f8:	e2833004 	add	r3, r3, #4	; 0x4
  1003fc:	e1520003 	cmp	r2, r3
  100400:	91a03925 	movls	r3, r5, lsr #18
  100404:	9283007c 	addls	r0, r3, #124	; 0x7c
  100408:	83a0007e 	movhi	r0, #126	; 0x7e
  10040c:	82433f59 	subhi	r3, r3, #356	; 0x164
  100410:	91a03180 	movls	r3, r0, lsl #3
  100414:	eaffffbb 	b	100308 <_malloc_r+0xb8>
  100418:	e0842005 	add	r2, r4, r5
  10041c:	e3801001 	orr	r1, r0, #1	; 0x1
  100420:	e3853001 	orr	r3, r5, #1	; 0x1
  100424:	e7820000 	str	r0, [r2, r0]
  100428:	e5843004 	str	r3, [r4, #4]
  10042c:	e586200c 	str	r2, [r6, #12]
  100430:	e5862008 	str	r2, [r6, #8]
  100434:	e1a00007 	mov	r0, r7
  100438:	e9820042 	stmib	r2, {r1, r6}
  10043c:	e582600c 	str	r6, [r2, #12]
  100440:	eb0001ad 	bl	100afc <__malloc_unlock>
  100444:	e2840008 	add	r0, r4, #8	; 0x8
  100448:	eaffffa8 	b	1002f0 <_malloc_r+0xa0>
  10044c:	e0840003 	add	r0, r4, r3
  100450:	e5903004 	ldr	r3, [r0, #4]
  100454:	e594100c 	ldr	r1, [r4, #12]
  100458:	e5942008 	ldr	r2, [r4, #8]
  10045c:	e3833001 	orr	r3, r3, #1	; 0x1
  100460:	e5803004 	str	r3, [r0, #4]
  100464:	e5812008 	str	r2, [r1, #8]
  100468:	e1a00007 	mov	r0, r7
  10046c:	e582100c 	str	r1, [r2, #12]
  100470:	eb0001a1 	bl	100afc <__malloc_unlock>
  100474:	e2840008 	add	r0, r4, #8	; 0x8
  100478:	eaffff9c 	b	1002f0 <_malloc_r+0xa0>
  10047c:	e3520c02 	cmp	r2, #512	; 0x200
  100480:	3a0000a0 	bcc	100708 <_malloc_r+0x4b8>
  100484:	e1b014a2 	movs	r1, r2, lsr #9
  100488:	01a011a2 	moveq	r1, r2, lsr #3
  10048c:	01a03181 	moveq	r3, r1, lsl #3
  100490:	0a00001a 	beq	100500 <_malloc_r+0x2b0>
  100494:	e3510004 	cmp	r1, #4	; 0x4
  100498:	91a03322 	movls	r3, r2, lsr #6
  10049c:	92831038 	addls	r1, r3, #56	; 0x38
  1004a0:	91a03181 	movls	r3, r1, lsl #3
  1004a4:	9a000015 	bls	100500 <_malloc_r+0x2b0>
  1004a8:	e3510014 	cmp	r1, #20	; 0x14
  1004ac:	9281105b 	addls	r1, r1, #91	; 0x5b
  1004b0:	91a03181 	movls	r3, r1, lsl #3
  1004b4:	9a000011 	bls	100500 <_malloc_r+0x2b0>
  1004b8:	e3510054 	cmp	r1, #84	; 0x54
  1004bc:	91a03622 	movls	r3, r2, lsr #12
  1004c0:	9283106e 	addls	r1, r3, #110	; 0x6e
  1004c4:	91a03181 	movls	r3, r1, lsl #3
  1004c8:	9a00000c 	bls	100500 <_malloc_r+0x2b0>
  1004cc:	e3510f55 	cmp	r1, #340	; 0x154
  1004d0:	91a037a2 	movls	r3, r2, lsr #15
  1004d4:	92831077 	addls	r1, r3, #119	; 0x77
  1004d8:	91a03181 	movls	r3, r1, lsl #3
  1004dc:	9a000007 	bls	100500 <_malloc_r+0x2b0>
  1004e0:	e3a03e55 	mov	r3, #1360	; 0x550
  1004e4:	e2833004 	add	r3, r3, #4	; 0x4
  1004e8:	e1510003 	cmp	r1, r3
  1004ec:	91a03922 	movls	r3, r2, lsr #18
  1004f0:	9283107c 	addls	r1, r3, #124	; 0x7c
  1004f4:	83a0107e 	movhi	r1, #126	; 0x7e
  1004f8:	82433f59 	subhi	r3, r3, #356	; 0x164
  1004fc:	91a03181 	movls	r3, r1, lsl #3
  100500:	e088c003 	add	ip, r8, r3
  100504:	e59c0008 	ldr	r0, [ip, #8]
  100508:	e15c0000 	cmp	ip, r0
  10050c:	0a0000eb 	beq	1008c0 <_malloc_r+0x670>
  100510:	e5903004 	ldr	r3, [r0, #4]
  100514:	e3c33003 	bic	r3, r3, #3	; 0x3
  100518:	e1520003 	cmp	r2, r3
  10051c:	2a000002 	bcs	10052c <_malloc_r+0x2dc>
  100520:	e5900008 	ldr	r0, [r0, #8]
  100524:	e15c0000 	cmp	ip, r0
  100528:	1afffff8 	bne	100510 <_malloc_r+0x2c0>
  10052c:	e590c00c 	ldr	ip, [r0, #12]
  100530:	e584c00c 	str	ip, [r4, #12]
  100534:	e5840008 	str	r0, [r4, #8]
  100538:	e580400c 	str	r4, [r0, #12]
  10053c:	e58c4008 	str	r4, [ip, #8]
  100540:	e59a0004 	ldr	r0, [sl, #4]
  100544:	e35e0000 	cmp	lr, #0	; 0x0
  100548:	e28e3003 	add	r3, lr, #3	; 0x3
  10054c:	a1a0300e 	movge	r3, lr
  100550:	e1a03143 	mov	r3, r3, asr #2
  100554:	e3a02001 	mov	r2, #1	; 0x1
  100558:	e1a02312 	mov	r2, r2, lsl r3
  10055c:	e1520000 	cmp	r2, r0
  100560:	8a000029 	bhi	10060c <_malloc_r+0x3bc>
  100564:	e1120000 	tst	r2, r0
  100568:	0a000073 	beq	10073c <_malloc_r+0x4ec>
  10056c:	e088918e 	add	r9, r8, lr, lsl #3
  100570:	e1a0a00e 	mov	sl, lr
  100574:	e1a01009 	mov	r1, r9
  100578:	e591400c 	ldr	r4, [r1, #12]
  10057c:	e1510004 	cmp	r1, r4
  100580:	1a000005 	bne	10059c <_malloc_r+0x34c>
  100584:	ea000076 	b	100764 <_malloc_r+0x514>
  100588:	e35c0000 	cmp	ip, #0	; 0x0
  10058c:	aa000079 	bge	100778 <_malloc_r+0x528>
  100590:	e594400c 	ldr	r4, [r4, #12]
  100594:	e1510004 	cmp	r1, r4
  100598:	0a000071 	beq	100764 <_malloc_r+0x514>
  10059c:	e5943004 	ldr	r3, [r4, #4]
  1005a0:	e3c33003 	bic	r3, r3, #3	; 0x3
  1005a4:	e065c003 	rsb	ip, r5, r3
  1005a8:	e35c000f 	cmp	ip, #15	; 0xf
  1005ac:	dafffff5 	ble	100588 <_malloc_r+0x338>
  1005b0:	e3853001 	orr	r3, r5, #1	; 0x1
  1005b4:	e0842005 	add	r2, r4, r5
  1005b8:	e594000c 	ldr	r0, [r4, #12]
  1005bc:	e5843004 	str	r3, [r4, #4]
  1005c0:	e5b41008 	ldr	r1, [r4, #8]!
  1005c4:	e38c3001 	orr	r3, ip, #1	; 0x1
  1005c8:	e5801008 	str	r1, [r0, #8]
  1005cc:	e581000c 	str	r0, [r1, #12]
  1005d0:	e5862008 	str	r2, [r6, #8]
  1005d4:	e586200c 	str	r2, [r6, #12]
  1005d8:	e1a00007 	mov	r0, r7
  1005dc:	e782c00c 	str	ip, [r2, ip]
  1005e0:	e9820048 	stmib	r2, {r3, r6}
  1005e4:	e582600c 	str	r6, [r2, #12]
  1005e8:	eb000143 	bl	100afc <__malloc_unlock>
  1005ec:	e1a00004 	mov	r0, r4
  1005f0:	eaffff3e 	b	1002f0 <_malloc_r+0xa0>
  1005f4:	e2843008 	add	r3, r4, #8	; 0x8
  1005f8:	e593400c 	ldr	r4, [r3, #12]
  1005fc:	e1530004 	cmp	r3, r4
  100600:	1affff2d 	bne	1002bc <_malloc_r+0x6c>
  100604:	e282e002 	add	lr, r2, #2	; 0x2
  100608:	eaffff51 	b	100354 <_malloc_r+0x104>
  10060c:	e59f2390 	ldr	r2, [pc, #912]	; 1009a4 <prog+0x960>
  100610:	e5924008 	ldr	r4, [r2, #8]
  100614:	e5943004 	ldr	r3, [r4, #4]
  100618:	e3c38003 	bic	r8, r3, #3	; 0x3
  10061c:	e0650008 	rsb	r0, r5, r8
  100620:	e350000f 	cmp	r0, #15	; 0xf
  100624:	c3a03000 	movgt	r3, #0	; 0x0
  100628:	d3a03001 	movle	r3, #1	; 0x1
  10062c:	e1550008 	cmp	r5, r8
  100630:	83833001 	orrhi	r3, r3, #1	; 0x1
  100634:	e3530000 	cmp	r3, #0	; 0x0
  100638:	e1a09004 	mov	r9, r4
  10063c:	0a000026 	beq	1006dc <_malloc_r+0x48c>
  100640:	e59f3364 	ldr	r3, [pc, #868]	; 1009ac <prog+0x968>
  100644:	e59fb364 	ldr	fp, [pc, #868]	; 1009b0 <prog+0x96c>
  100648:	e5932000 	ldr	r2, [r3]
  10064c:	e59b1000 	ldr	r1, [fp]
  100650:	e2822010 	add	r2, r2, #16	; 0x10
  100654:	e3710001 	cmn	r1, #1	; 0x1
  100658:	e0856002 	add	r6, r5, r2
  10065c:	12863eff 	addne	r3, r6, #4080	; 0xff0
  100660:	1283300f 	addne	r3, r3, #15	; 0xf
  100664:	13c36eff 	bicne	r6, r3, #4080	; 0xff0
  100668:	13c6600f 	bicne	r6, r6, #15	; 0xf
  10066c:	e1a00007 	mov	r0, r7
  100670:	e1a01006 	mov	r1, r6
  100674:	eb0021d0 	bl	108dbc <_sbrk_r>
  100678:	e3700001 	cmn	r0, #1	; 0x1
  10067c:	0a00008c 	beq	1008b4 <_malloc_r+0x664>
  100680:	e0841008 	add	r1, r4, r8
  100684:	e1510000 	cmp	r1, r0
  100688:	e1a0a000 	mov	sl, r0
  10068c:	9a000045 	bls	1007a8 <_malloc_r+0x558>
  100690:	e59f330c 	ldr	r3, [pc, #780]	; 1009a4 <prog+0x960>
  100694:	e1540003 	cmp	r4, r3
  100698:	0a0000a5 	beq	100934 <_malloc_r+0x6e4>
  10069c:	e59f3300 	ldr	r3, [pc, #768]	; 1009a4 <prog+0x960>
  1006a0:	e5934008 	ldr	r4, [r3, #8]
  1006a4:	e5942004 	ldr	r2, [r4, #4]
  1006a8:	e3c22003 	bic	r2, r2, #3	; 0x3
  1006ac:	e0650002 	rsb	r0, r5, r2
  1006b0:	e350000f 	cmp	r0, #15	; 0xf
  1006b4:	c3a03000 	movgt	r3, #0	; 0x0
  1006b8:	d3a03001 	movle	r3, #1	; 0x1
  1006bc:	e1550002 	cmp	r5, r2
  1006c0:	83833001 	orrhi	r3, r3, #1	; 0x1
  1006c4:	e3530000 	cmp	r3, #0	; 0x0
  1006c8:	0a000003 	beq	1006dc <_malloc_r+0x48c>
  1006cc:	e1a00007 	mov	r0, r7
  1006d0:	eb000109 	bl	100afc <__malloc_unlock>
  1006d4:	e3a00000 	mov	r0, #0	; 0x0
  1006d8:	eaffff04 	b	1002f0 <_malloc_r+0xa0>
  1006dc:	e0841005 	add	r1, r4, r5
  1006e0:	e3802001 	orr	r2, r0, #1	; 0x1
  1006e4:	e3853001 	orr	r3, r5, #1	; 0x1
  1006e8:	e5843004 	str	r3, [r4, #4]
  1006ec:	e5812004 	str	r2, [r1, #4]
  1006f0:	e59f22ac 	ldr	r2, [pc, #684]	; 1009a4 <prog+0x960>
  1006f4:	e1a00007 	mov	r0, r7
  1006f8:	e5821008 	str	r1, [r2, #8]
  1006fc:	eb0000fe 	bl	100afc <__malloc_unlock>
  100700:	e2840008 	add	r0, r4, #8	; 0x8
  100704:	eafffef9 	b	1002f0 <_malloc_r+0xa0>
  100708:	e1a021a2 	mov	r2, r2, lsr #3
  10070c:	e59a0004 	ldr	r0, [sl, #4]
  100710:	e1a01122 	mov	r1, r2, lsr #2
  100714:	e3a03001 	mov	r3, #1	; 0x1
  100718:	e1800113 	orr	r0, r0, r3, lsl r1
  10071c:	e0882182 	add	r2, r8, r2, lsl #3
  100720:	e5923008 	ldr	r3, [r2, #8]
  100724:	e584200c 	str	r2, [r4, #12]
  100728:	e5843008 	str	r3, [r4, #8]
  10072c:	e58a0004 	str	r0, [sl, #4]
  100730:	e583400c 	str	r4, [r3, #12]
  100734:	e5824008 	str	r4, [r2, #8]
  100738:	eaffff81 	b	100544 <_malloc_r+0x2f4>
  10073c:	e1a02082 	mov	r2, r2, lsl #1
  100740:	e3ce3003 	bic	r3, lr, #3	; 0x3
  100744:	e1100002 	tst	r0, r2
  100748:	e283e004 	add	lr, r3, #4	; 0x4
  10074c:	1affff86 	bne	10056c <_malloc_r+0x31c>
  100750:	e1a02082 	mov	r2, r2, lsl #1
  100754:	e1100002 	tst	r0, r2
  100758:	e28ee004 	add	lr, lr, #4	; 0x4
  10075c:	0afffffb 	beq	100750 <_malloc_r+0x500>
  100760:	eaffff81 	b	10056c <_malloc_r+0x31c>
  100764:	e28aa001 	add	sl, sl, #1	; 0x1
  100768:	e31a0003 	tst	sl, #3	; 0x3
  10076c:	0a000059 	beq	1008d8 <_malloc_r+0x688>
  100770:	e2811008 	add	r1, r1, #8	; 0x8
  100774:	eaffff7f 	b	100578 <_malloc_r+0x328>
  100778:	e0841003 	add	r1, r4, r3
  10077c:	e5913004 	ldr	r3, [r1, #4]
  100780:	e594000c 	ldr	r0, [r4, #12]
  100784:	e5b42008 	ldr	r2, [r4, #8]!
  100788:	e3833001 	orr	r3, r3, #1	; 0x1
  10078c:	e5802008 	str	r2, [r0, #8]
  100790:	e582000c 	str	r0, [r2, #12]
  100794:	e5813004 	str	r3, [r1, #4]
  100798:	e1a00007 	mov	r0, r7
  10079c:	eb0000d6 	bl	100afc <__malloc_unlock>
  1007a0:	e1a00004 	mov	r0, r4
  1007a4:	eafffed1 	b	1002f0 <_malloc_r+0xa0>
  1007a8:	e59fc204 	ldr	ip, [pc, #516]	; 1009b4 <prog+0x970>
  1007ac:	e59c3000 	ldr	r3, [ip]
  1007b0:	e0862003 	add	r2, r6, r3
  1007b4:	e58c2000 	str	r2, [ip]
  1007b8:	0a000062 	beq	100948 <_malloc_r+0x6f8>
  1007bc:	e59b3000 	ldr	r3, [fp]
  1007c0:	e3730001 	cmn	r3, #1	; 0x1
  1007c4:	10613000 	rsbne	r3, r1, r0
  1007c8:	059f31e0 	ldreq	r3, [pc, #480]	; 1009b0 <prog+0x96c>
  1007cc:	10823003 	addne	r3, r2, r3
  1007d0:	05830000 	streq	r0, [r3]
  1007d4:	158c3000 	strne	r3, [ip]
  1007d8:	e2103007 	ands	r3, r0, #7	; 0x7
  1007dc:	12631008 	rsbne	r1, r3, #8	; 0x8
  1007e0:	1080a001 	addne	sl, r0, r1
  1007e4:	01a01003 	moveq	r1, r3
  1007e8:	e08a3006 	add	r3, sl, r6
  1007ec:	e1a03a03 	mov	r3, r3, lsl #20
  1007f0:	e1a03a23 	mov	r3, r3, lsr #20
  1007f4:	e2633a01 	rsb	r3, r3, #4096	; 0x1000
  1007f8:	e0814003 	add	r4, r1, r3
  1007fc:	e1a01004 	mov	r1, r4
  100800:	e1a00007 	mov	r0, r7
  100804:	e58dc000 	str	ip, [sp]
  100808:	eb00216b 	bl	108dbc <_sbrk_r>
  10080c:	e3700001 	cmn	r0, #1	; 0x1
  100810:	106a3000 	rsbne	r3, sl, r0
  100814:	e59dc000 	ldr	ip, [sp]
  100818:	10833004 	addne	r3, r3, r4
  10081c:	13830001 	orrne	r0, r3, #1	; 0x1
  100820:	e59f217c 	ldr	r2, [pc, #380]	; 1009a4 <prog+0x960>
  100824:	e59c3000 	ldr	r3, [ip]
  100828:	03a04000 	moveq	r4, #0	; 0x0
  10082c:	02800002 	addeq	r0, r0, #2	; 0x2
  100830:	e0843003 	add	r3, r4, r3
  100834:	e1590002 	cmp	r9, r2
  100838:	e1a0400a 	mov	r4, sl
  10083c:	e58c3000 	str	r3, [ip]
  100840:	e58a0004 	str	r0, [sl, #4]
  100844:	e582a008 	str	sl, [r2, #8]
  100848:	0a00000f 	beq	10088c <_malloc_r+0x63c>
  10084c:	e358000f 	cmp	r8, #15	; 0xf
  100850:	93a03001 	movls	r3, #1	; 0x1
  100854:	958a3004 	strls	r3, [sl, #4]
  100858:	9affff91 	bls	1006a4 <_malloc_r+0x454>
  10085c:	e5993004 	ldr	r3, [r9, #4]
  100860:	e248200c 	sub	r2, r8, #12	; 0xc
  100864:	e3c22007 	bic	r2, r2, #7	; 0x7
  100868:	e2033001 	and	r3, r3, #1	; 0x1
  10086c:	e1823003 	orr	r3, r2, r3
  100870:	e3a01005 	mov	r1, #5	; 0x5
  100874:	e352000f 	cmp	r2, #15	; 0xf
  100878:	e0892002 	add	r2, r9, r2
  10087c:	e5893004 	str	r3, [r9, #4]
  100880:	e5821008 	str	r1, [r2, #8]
  100884:	e5821004 	str	r1, [r2, #4]
  100888:	8a000038 	bhi	100970 <_malloc_r+0x720>
  10088c:	e59f1124 	ldr	r1, [pc, #292]	; 1009b8 <prog+0x974>
  100890:	e59c2000 	ldr	r2, [ip]
  100894:	e5913000 	ldr	r3, [r1]
  100898:	e1520003 	cmp	r2, r3
  10089c:	85812000 	strhi	r2, [r1]
  1008a0:	e59f1114 	ldr	r1, [pc, #276]	; 1009bc <prog+0x978>
  1008a4:	e5913000 	ldr	r3, [r1]
  1008a8:	e1520003 	cmp	r2, r3
  1008ac:	85812000 	strhi	r2, [r1]
  1008b0:	eaffff7b 	b	1006a4 <_malloc_r+0x454>
  1008b4:	e59f20e8 	ldr	r2, [pc, #232]	; 1009a4 <prog+0x960>
  1008b8:	e5924008 	ldr	r4, [r2, #8]
  1008bc:	eaffff78 	b	1006a4 <_malloc_r+0x454>
  1008c0:	e59a3004 	ldr	r3, [sl, #4]
  1008c4:	e1a01121 	mov	r1, r1, lsr #2
  1008c8:	e3a02001 	mov	r2, #1	; 0x1
  1008cc:	e1833112 	orr	r3, r3, r2, lsl r1
  1008d0:	e58a3004 	str	r3, [sl, #4]
  1008d4:	eaffff15 	b	100530 <_malloc_r+0x2e0>
  1008d8:	e1a0c00e 	mov	ip, lr
  1008dc:	e1a01009 	mov	r1, r9
  1008e0:	e31c0003 	tst	ip, #3	; 0x3
  1008e4:	e2411008 	sub	r1, r1, #8	; 0x8
  1008e8:	e24cc001 	sub	ip, ip, #1	; 0x1
  1008ec:	0a000027 	beq	100990 <_malloc_r+0x740>
  1008f0:	e5913008 	ldr	r3, [r1, #8]
  1008f4:	e1530001 	cmp	r3, r1
  1008f8:	0afffff8 	beq	1008e0 <_malloc_r+0x690>
  1008fc:	e1a02082 	mov	r2, r2, lsl #1
  100900:	e1520000 	cmp	r2, r0
  100904:	8affff40 	bhi	10060c <_malloc_r+0x3bc>
  100908:	e3520000 	cmp	r2, #0	; 0x0
  10090c:	0affff3e 	beq	10060c <_malloc_r+0x3bc>
  100910:	e1120000 	tst	r2, r0
  100914:	11a0e00a 	movne	lr, sl
  100918:	1affff13 	bne	10056c <_malloc_r+0x31c>
  10091c:	e1a02082 	mov	r2, r2, lsl #1
  100920:	e1100002 	tst	r0, r2
  100924:	e28aa004 	add	sl, sl, #4	; 0x4
  100928:	0afffffb 	beq	10091c <_malloc_r+0x6cc>
  10092c:	e1a0e00a 	mov	lr, sl
  100930:	eaffff0d 	b	10056c <_malloc_r+0x31c>
  100934:	e59fc078 	ldr	ip, [pc, #120]	; 1009b4 <prog+0x970>
  100938:	e59c3000 	ldr	r3, [ip]
  10093c:	e0862003 	add	r2, r6, r3
  100940:	e58c2000 	str	r2, [ip]
  100944:	eaffff9c 	b	1007bc <_malloc_r+0x56c>
  100948:	e1a03a00 	mov	r3, r0, lsl #20
  10094c:	e1a03a23 	mov	r3, r3, lsr #20
  100950:	e3530000 	cmp	r3, #0	; 0x0
  100954:	1affff98 	bne	1007bc <_malloc_r+0x56c>
  100958:	e59f2044 	ldr	r2, [pc, #68]	; 1009a4 <prog+0x960>
  10095c:	e0863008 	add	r3, r6, r8
  100960:	e5924008 	ldr	r4, [r2, #8]
  100964:	e3833001 	orr	r3, r3, #1	; 0x1
  100968:	e5843004 	str	r3, [r4, #4]
  10096c:	eaffffc6 	b	10088c <_malloc_r+0x63c>
  100970:	e2891008 	add	r1, r9, #8	; 0x8
  100974:	e1a00007 	mov	r0, r7
  100978:	e58dc000 	str	ip, [sp]
  10097c:	eb00114f 	bl	104ec0 <_free_r>
  100980:	e59f301c 	ldr	r3, [pc, #28]	; 1009a4 <prog+0x960>
  100984:	e59dc000 	ldr	ip, [sp]
  100988:	e5934008 	ldr	r4, [r3, #8]
  10098c:	eaffffbe 	b	10088c <_malloc_r+0x63c>
  100990:	e1e03002 	mvn	r3, r2
  100994:	e0000003 	and	r0, r0, r3
  100998:	e59f3004 	ldr	r3, [pc, #4]	; 1009a4 <prog+0x960>
  10099c:	e5830004 	str	r0, [r3, #4]
  1009a0:	eaffffd5 	b	1008fc <_malloc_r+0x6ac>
  1009a4:	00200000 	eoreq	r0, r0, r0
  1009a8:	00200008 	eoreq	r0, r0, r8
  1009ac:	00200830 	eoreq	r0, r0, r0, lsr r8
  1009b0:	0020040c 	eoreq	r0, r0, ip, lsl #8
  1009b4:	0020083c 	eoreq	r0, r0, ip, lsr r8
  1009b8:	00200834 	eoreq	r0, r0, r4, lsr r8
  1009bc:	00200838 	eoreq	r0, r0, r8, lsr r8

001009c0 <memcpy>:
  1009c0:	e352000f 	cmp	r2, #15	; 0xf
  1009c4:	e52de004 	str	lr, [sp, #-4]!
  1009c8:	e1a0c000 	mov	ip, r0
  1009cc:	e1a0e002 	mov	lr, r2
  1009d0:	9a000002 	bls	1009e0 <memcpy+0x20>
  1009d4:	e1813000 	orr	r3, r1, r0
  1009d8:	e3130003 	tst	r3, #3	; 0x3
  1009dc:	0a000008 	beq	100a04 <memcpy+0x44>
  1009e0:	e35e0000 	cmp	lr, #0	; 0x0
  1009e4:	049df004 	ldreq	pc, [sp], #4
  1009e8:	e3a02000 	mov	r2, #0	; 0x0
  1009ec:	e4d13001 	ldrb	r3, [r1], #1
  1009f0:	e7c2300c 	strb	r3, [r2, ip]
  1009f4:	e2822001 	add	r2, r2, #1	; 0x1
  1009f8:	e152000e 	cmp	r2, lr
  1009fc:	1afffffa 	bne	1009ec <memcpy+0x2c>
  100a00:	e49df004 	ldr	pc, [sp], #4
  100a04:	e5913000 	ldr	r3, [r1]
  100a08:	e58c3000 	str	r3, [ip]
  100a0c:	e5912004 	ldr	r2, [r1, #4]
  100a10:	e58c2004 	str	r2, [ip, #4]
  100a14:	e5913008 	ldr	r3, [r1, #8]
  100a18:	e58c3008 	str	r3, [ip, #8]
  100a1c:	e24ee010 	sub	lr, lr, #16	; 0x10
  100a20:	e591300c 	ldr	r3, [r1, #12]
  100a24:	e35e000f 	cmp	lr, #15	; 0xf
  100a28:	e58c300c 	str	r3, [ip, #12]
  100a2c:	e2811010 	add	r1, r1, #16	; 0x10
  100a30:	e28cc010 	add	ip, ip, #16	; 0x10
  100a34:	8afffff2 	bhi	100a04 <memcpy+0x44>
  100a38:	e35e0003 	cmp	lr, #3	; 0x3
  100a3c:	9affffe7 	bls	1009e0 <memcpy+0x20>
  100a40:	e24ee004 	sub	lr, lr, #4	; 0x4
  100a44:	e4913004 	ldr	r3, [r1], #4
  100a48:	e35e0003 	cmp	lr, #3	; 0x3
  100a4c:	e48c3004 	str	r3, [ip], #4
  100a50:	8afffffa 	bhi	100a40 <memcpy+0x80>
  100a54:	e35e0000 	cmp	lr, #0	; 0x0
  100a58:	1affffe2 	bne	1009e8 <memcpy+0x28>
  100a5c:	e49df004 	ldr	pc, [sp], #4

00100a60 <memset>:
  100a60:	e3520003 	cmp	r2, #3	; 0x3
  100a64:	e20110ff 	and	r1, r1, #255	; 0xff
  100a68:	e1a0c000 	mov	ip, r0
  100a6c:	9a000001 	bls	100a78 <memset+0x18>
  100a70:	e3100003 	tst	r0, #3	; 0x3
  100a74:	0a000008 	beq	100a9c <memset+0x3c>
  100a78:	e3520000 	cmp	r2, #0	; 0x0
  100a7c:	012fff1e 	bxeq	lr
  100a80:	e20110ff 	and	r1, r1, #255	; 0xff
  100a84:	e3a03000 	mov	r3, #0	; 0x0
  100a88:	e7c3100c 	strb	r1, [r3, ip]
  100a8c:	e2833001 	add	r3, r3, #1	; 0x1
  100a90:	e1530002 	cmp	r3, r2
  100a94:	1afffffb 	bne	100a88 <memset+0x28>
  100a98:	e12fff1e 	bx	lr
  100a9c:	e1813401 	orr	r3, r1, r1, lsl #8
  100aa0:	e352000f 	cmp	r2, #15	; 0xf
  100aa4:	e183c803 	orr	ip, r3, r3, lsl #16
  100aa8:	e1a03000 	mov	r3, r0
  100aac:	9a000009 	bls	100ad8 <memset+0x78>
  100ab0:	e2422010 	sub	r2, r2, #16	; 0x10
  100ab4:	e352000f 	cmp	r2, #15	; 0xf
  100ab8:	e583c000 	str	ip, [r3]
  100abc:	e583c004 	str	ip, [r3, #4]
  100ac0:	e583c008 	str	ip, [r3, #8]
  100ac4:	e583c00c 	str	ip, [r3, #12]
  100ac8:	e2833010 	add	r3, r3, #16	; 0x10
  100acc:	8afffff7 	bhi	100ab0 <memset+0x50>
  100ad0:	e3520003 	cmp	r2, #3	; 0x3
  100ad4:	9a000003 	bls	100ae8 <memset+0x88>
  100ad8:	e2422004 	sub	r2, r2, #4	; 0x4
  100adc:	e3520003 	cmp	r2, #3	; 0x3
  100ae0:	e483c004 	str	ip, [r3], #4
  100ae4:	8afffffb 	bhi	100ad8 <memset+0x78>
  100ae8:	e3520000 	cmp	r2, #0	; 0x0
  100aec:	e1a0c003 	mov	ip, r3
  100af0:	1affffe2 	bne	100a80 <memset+0x20>
  100af4:	e12fff1e 	bx	lr

00100af8 <__malloc_lock>:
  100af8:	e12fff1e 	bx	lr

00100afc <__malloc_unlock>:
  100afc:	e12fff1e 	bx	lr

00100b00 <sprintf>:
  100b00:	e92d000e 	stmdb	sp!, {r1, r2, r3}
  100b04:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100b08:	e59f2060 	ldr	r2, [pc, #96]	; 100b70 <prog+0xb2c>
  100b0c:	e24dd060 	sub	sp, sp, #96	; 0x60
  100b10:	e28d4070 	add	r4, sp, #112	; 0x70
  100b14:	e3e0c102 	mvn	ip, #-2147483648	; 0x80000000
  100b18:	e1a0e000 	mov	lr, r0
  100b1c:	e1a03004 	mov	r3, r4
  100b20:	e58dc014 	str	ip, [sp, #20]
  100b24:	e58dc008 	str	ip, [sp, #8]
  100b28:	e5920000 	ldr	r0, [r2]
  100b2c:	e3e0c000 	mvn	ip, #0	; 0x0
  100b30:	e59d206c 	ldr	r2, [sp, #108]
  100b34:	e1a0100d 	mov	r1, sp
  100b38:	e3a05f82 	mov	r5, #520	; 0x208
  100b3c:	e58de010 	str	lr, [sp, #16]
  100b40:	e1cd50bc 	strh	r5, [sp, #12]
  100b44:	e58de000 	str	lr, [sp]
  100b48:	e1cdc0be 	strh	ip, [sp, #14]
  100b4c:	e58d405c 	str	r4, [sp, #92]
  100b50:	eb00009a 	bl	100dc0 <_vfprintf_r>
  100b54:	e59d3000 	ldr	r3, [sp]
  100b58:	e3a02000 	mov	r2, #0	; 0x0
  100b5c:	e5c32000 	strb	r2, [r3]
  100b60:	e28dd060 	add	sp, sp, #96	; 0x60
  100b64:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  100b68:	e28dd00c 	add	sp, sp, #12	; 0xc
  100b6c:	e12fff1e 	bx	lr
  100b70:	00200410 	eoreq	r0, r0, r0, lsl r4

00100b74 <_sprintf_r>:
  100b74:	e92d000c 	stmdb	sp!, {r2, r3}
  100b78:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100b7c:	e24dd060 	sub	sp, sp, #96	; 0x60
  100b80:	e28d4070 	add	r4, sp, #112	; 0x70
  100b84:	e3e0c102 	mvn	ip, #-2147483648	; 0x80000000
  100b88:	e1a0e001 	mov	lr, r1
  100b8c:	e1a03004 	mov	r3, r4
  100b90:	e59d206c 	ldr	r2, [sp, #108]
  100b94:	e58dc014 	str	ip, [sp, #20]
  100b98:	e58dc008 	str	ip, [sp, #8]
  100b9c:	e1a0100d 	mov	r1, sp
  100ba0:	e3e0c000 	mvn	ip, #0	; 0x0
  100ba4:	e3a05f82 	mov	r5, #520	; 0x208
  100ba8:	e58de010 	str	lr, [sp, #16]
  100bac:	e1cd50bc 	strh	r5, [sp, #12]
  100bb0:	e58de000 	str	lr, [sp]
  100bb4:	e1cdc0be 	strh	ip, [sp, #14]
  100bb8:	e58d405c 	str	r4, [sp, #92]
  100bbc:	eb00007f 	bl	100dc0 <_vfprintf_r>
  100bc0:	e59d3000 	ldr	r3, [sp]
  100bc4:	e3a02000 	mov	r2, #0	; 0x0
  100bc8:	e5c32000 	strb	r2, [r3]
  100bcc:	e28dd060 	add	sp, sp, #96	; 0x60
  100bd0:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  100bd4:	e28dd008 	add	sp, sp, #8	; 0x8
  100bd8:	e12fff1e 	bx	lr

00100bdc <strlen>:
  100bdc:	e3100003 	tst	r0, #3	; 0x3
  100be0:	e1a01000 	mov	r1, r0
  100be4:	1a000018 	bne	100c4c <strlen+0x70>
  100be8:	e5902000 	ldr	r2, [r0]
  100bec:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100bf0:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100bf4:	e2433c01 	sub	r3, r3, #256	; 0x100
  100bf8:	e2433001 	sub	r3, r3, #1	; 0x1
  100bfc:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100c00:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100c04:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100c08:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100c0c:	e1d32002 	bics	r2, r3, r2
  100c10:	e1a02000 	mov	r2, r0
  100c14:	1a00000b 	bne	100c48 <strlen+0x6c>
  100c18:	e5b02004 	ldr	r2, [r0, #4]!
  100c1c:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  100c20:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100c24:	e2433c01 	sub	r3, r3, #256	; 0x100
  100c28:	e2433001 	sub	r3, r3, #1	; 0x1
  100c2c:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100c30:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100c34:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100c38:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100c3c:	e1d32002 	bics	r2, r3, r2
  100c40:	0afffff4 	beq	100c18 <strlen+0x3c>
  100c44:	e1a02000 	mov	r2, r0
  100c48:	e1a00002 	mov	r0, r2
  100c4c:	e5d03000 	ldrb	r3, [r0]
  100c50:	e3530000 	cmp	r3, #0	; 0x0
  100c54:	0a000002 	beq	100c64 <strlen+0x88>
  100c58:	e5f03001 	ldrb	r3, [r0, #1]!
  100c5c:	e3530000 	cmp	r3, #0	; 0x0
  100c60:	1afffffc 	bne	100c58 <strlen+0x7c>
  100c64:	e0610000 	rsb	r0, r1, r0
  100c68:	e12fff1e 	bx	lr

00100c6c <strncpy>:
  100c6c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  100c70:	e1a04001 	mov	r4, r1
  100c74:	e1811000 	orr	r1, r1, r0
  100c78:	e3110003 	tst	r1, #3	; 0x3
  100c7c:	13a03000 	movne	r3, #0	; 0x0
  100c80:	03a03001 	moveq	r3, #1	; 0x1
  100c84:	e3520003 	cmp	r2, #3	; 0x3
  100c88:	93a03000 	movls	r3, #0	; 0x0
  100c8c:	82033001 	andhi	r3, r3, #1	; 0x1
  100c90:	e3530000 	cmp	r3, #0	; 0x0
  100c94:	01a01004 	moveq	r1, r4
  100c98:	e1a05000 	mov	r5, r0
  100c9c:	e1a0e002 	mov	lr, r2
  100ca0:	01a04000 	moveq	r4, r0
  100ca4:	0a000018 	beq	100d0c <strncpy+0xa0>
  100ca8:	e3520003 	cmp	r2, #3	; 0x3
  100cac:	e1a0c004 	mov	ip, r4
  100cb0:	9a000013 	bls	100d04 <strncpy+0x98>
  100cb4:	e5941000 	ldr	r1, [r4]
  100cb8:	ea000005 	b	100cd4 <strncpy+0x68>
  100cbc:	e24ee004 	sub	lr, lr, #4	; 0x4
  100cc0:	e35e0003 	cmp	lr, #3	; 0x3
  100cc4:	e4801004 	str	r1, [r0], #4
  100cc8:	e28cc004 	add	ip, ip, #4	; 0x4
  100ccc:	9a00000c 	bls	100d04 <strncpy+0x98>
  100cd0:	e59c1000 	ldr	r1, [ip]
  100cd4:	e28134ff 	add	r3, r1, #-16777216	; 0xff000000
  100cd8:	e2433801 	sub	r3, r3, #65536	; 0x10000
  100cdc:	e2433c01 	sub	r3, r3, #256	; 0x100
  100ce0:	e2433001 	sub	r3, r3, #1	; 0x1
  100ce4:	e1e02001 	mvn	r2, r1
  100ce8:	e0033002 	and	r3, r3, r2
  100cec:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  100cf0:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  100cf4:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  100cf8:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  100cfc:	e3530000 	cmp	r3, #0	; 0x0
  100d00:	0affffed 	beq	100cbc <strncpy+0x50>
  100d04:	e1a04000 	mov	r4, r0
  100d08:	e1a0100c 	mov	r1, ip
  100d0c:	e35e0000 	cmp	lr, #0	; 0x0
  100d10:	0a000018 	beq	100d78 <strncpy+0x10c>
  100d14:	e5d13000 	ldrb	r3, [r1]
  100d18:	e24e2001 	sub	r2, lr, #1	; 0x1
  100d1c:	e3530000 	cmp	r3, #0	; 0x0
  100d20:	e1a0c004 	mov	ip, r4
  100d24:	e4cc3001 	strb	r3, [ip], #1
  100d28:	1284e002 	addne	lr, r4, #2	; 0x2
  100d2c:	10810002 	addne	r0, r1, r2
  100d30:	0a000008 	beq	100d58 <strncpy+0xec>
  100d34:	e1500001 	cmp	r0, r1
  100d38:	e1a0c00e 	mov	ip, lr
  100d3c:	e2422001 	sub	r2, r2, #1	; 0x1
  100d40:	e28ee001 	add	lr, lr, #1	; 0x1
  100d44:	0a00000b 	beq	100d78 <strncpy+0x10c>
  100d48:	e5f13001 	ldrb	r3, [r1, #1]!
  100d4c:	e3530000 	cmp	r3, #0	; 0x0
  100d50:	e54c3001 	strb	r3, [ip, #-1]
  100d54:	1afffff6 	bne	100d34 <strncpy+0xc8>
  100d58:	e3520000 	cmp	r2, #0	; 0x0
  100d5c:	0a000005 	beq	100d78 <strncpy+0x10c>
  100d60:	e3a03000 	mov	r3, #0	; 0x0
  100d64:	e1a01003 	mov	r1, r3
  100d68:	e7c3100c 	strb	r1, [r3, ip]
  100d6c:	e2833001 	add	r3, r3, #1	; 0x1
  100d70:	e1520003 	cmp	r2, r3
  100d74:	1afffffb 	bne	100d68 <strncpy+0xfc>
  100d78:	e1a00005 	mov	r0, r5
  100d7c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00100d80 <__sprint>:
  100d80:	e5913008 	ldr	r3, [r1, #8]
  100d84:	e3530000 	cmp	r3, #0	; 0x0
  100d88:	e92d4010 	stmdb	sp!, {r4, lr}
  100d8c:	e1a02003 	mov	r2, r3
  100d90:	e1a04001 	mov	r4, r1
  100d94:	05813004 	streq	r3, [r1, #4]
  100d98:	1a000001 	bne	100da4 <__sprint+0x24>
  100d9c:	e1a00002 	mov	r0, r2
  100da0:	e8bd8010 	ldmia	sp!, {r4, pc}
  100da4:	eb0010ed 	bl	105160 <__sfvwrite>
  100da8:	e1a02000 	mov	r2, r0
  100dac:	e3a03000 	mov	r3, #0	; 0x0
  100db0:	e1a00002 	mov	r0, r2
  100db4:	e5843004 	str	r3, [r4, #4]
  100db8:	e5843008 	str	r3, [r4, #8]
  100dbc:	e8bd8010 	ldmia	sp!, {r4, pc}

00100dc0 <_vfprintf_r>:
  100dc0:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  100dc4:	e24dde6b 	sub	sp, sp, #1712	; 0x6b0
  100dc8:	e1a0a001 	mov	sl, r1
  100dcc:	e58d0010 	str	r0, [sp, #16]
  100dd0:	e1a04002 	mov	r4, r2
  100dd4:	e1a09003 	mov	r9, r3
  100dd8:	eb001228 	bl	105680 <localeconv>
  100ddc:	e59d1010 	ldr	r1, [sp, #16]
  100de0:	e5900000 	ldr	r0, [r0]
  100de4:	e3510000 	cmp	r1, #0	; 0x0
  100de8:	e58d0028 	str	r0, [sp, #40]
  100dec:	0a000002 	beq	100dfc <_vfprintf_r+0x3c>
  100df0:	e5913038 	ldr	r3, [r1, #56]
  100df4:	e3530000 	cmp	r3, #0	; 0x0
  100df8:	0a0000cf 	beq	10113c <prog+0x10f8>
  100dfc:	e1dac0bc 	ldrh	ip, [sl, #12]
  100e00:	e31c0008 	tst	ip, #8	; 0x8
  100e04:	0a0000cf 	beq	101148 <prog+0x1104>
  100e08:	e59a3010 	ldr	r3, [sl, #16]
  100e0c:	e3530000 	cmp	r3, #0	; 0x0
  100e10:	0a0000cc 	beq	101148 <prog+0x1104>
  100e14:	e20c301a 	and	r3, ip, #26	; 0x1a
  100e18:	e353000a 	cmp	r3, #10	; 0xa
  100e1c:	1a00002d 	bne	100ed8 <_vfprintf_r+0x118>
  100e20:	e1da30fe 	ldrsh	r3, [sl, #14]
  100e24:	e3530000 	cmp	r3, #0	; 0x0
  100e28:	ba00002a 	blt	100ed8 <_vfprintf_r+0x118>
  100e2c:	e3ccc002 	bic	ip, ip, #2	; 0x2
  100e30:	e28d8c05 	add	r8, sp, #1280	; 0x500
  100e34:	e1c8ccb0 	strh	ip, [r8, #192]
  100e38:	e3a0c000 	mov	ip, #0	; 0x0
  100e3c:	e58dc5cc 	str	ip, [sp, #1484]
  100e40:	e28d7e5b 	add	r7, sp, #1456	; 0x5b0
  100e44:	e1dac0be 	ldrh	ip, [sl, #14]
  100e48:	e59a501c 	ldr	r5, [sl, #28]
  100e4c:	e59a6024 	ldr	r6, [sl, #36]
  100e50:	e28de060 	add	lr, sp, #96	; 0x60
  100e54:	e2877004 	add	r7, r7, #4	; 0x4
  100e58:	e24ee008 	sub	lr, lr, #8	; 0x8
  100e5c:	e1a02004 	mov	r2, r4
  100e60:	e59d0010 	ldr	r0, [sp, #16]
  100e64:	e3a04b01 	mov	r4, #1024	; 0x400
  100e68:	e1a03009 	mov	r3, r9
  100e6c:	e1a01007 	mov	r1, r7
  100e70:	e1c8ccb2 	strh	ip, [r8, #194]
  100e74:	e58d55d0 	str	r5, [sp, #1488]
  100e78:	e58d65d8 	str	r6, [sp, #1496]
  100e7c:	e58de5c4 	str	lr, [sp, #1476]
  100e80:	e58d45c8 	str	r4, [sp, #1480]
  100e84:	e58de5b4 	str	lr, [sp, #1460]
  100e88:	e58d45bc 	str	r4, [sp, #1468]
  100e8c:	ebffffcb 	bl	100dc0 <_vfprintf_r>
  100e90:	e3500000 	cmp	r0, #0	; 0x0
  100e94:	e58d0020 	str	r0, [sp, #32]
  100e98:	ba000005 	blt	100eb4 <_vfprintf_r+0xf4>
  100e9c:	e1a00007 	mov	r0, r7
  100ea0:	eb000ef0 	bl	104a68 <fflush>
  100ea4:	e59d1020 	ldr	r1, [sp, #32]
  100ea8:	e3500000 	cmp	r0, #0	; 0x0
  100eac:	13e01000 	mvnne	r1, #0	; 0x0
  100eb0:	e58d1020 	str	r1, [sp, #32]
  100eb4:	e28d2c05 	add	r2, sp, #1280	; 0x500
  100eb8:	e1d23cb0 	ldrh	r3, [r2, #192]
  100ebc:	e3130040 	tst	r3, #64	; 0x40
  100ec0:	11da30bc 	ldrneh	r3, [sl, #12]
  100ec4:	13833040 	orrne	r3, r3, #64	; 0x40
  100ec8:	11ca30bc 	strneh	r3, [sl, #12]
  100ecc:	e59d0020 	ldr	r0, [sp, #32]
  100ed0:	e28dde6b 	add	sp, sp, #1712	; 0x6b0
  100ed4:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  100ed8:	e58d4018 	str	r4, [sp, #24]
  100edc:	e3a03000 	mov	r3, #0	; 0x0
  100ee0:	e3a04000 	mov	r4, #0	; 0x0
  100ee4:	e3a06000 	mov	r6, #0	; 0x0
  100ee8:	e28d8e61 	add	r8, sp, #1552	; 0x610
  100eec:	e58d3048 	str	r3, [sp, #72]
  100ef0:	e58d404c 	str	r4, [sp, #76]
  100ef4:	e58d6020 	str	r6, [sp, #32]
  100ef8:	e58d6030 	str	r6, [sp, #48]
  100efc:	e58d6040 	str	r6, [sp, #64]
  100f00:	e58d6044 	str	r6, [sp, #68]
  100f04:	e58d8678 	str	r8, [sp, #1656]
  100f08:	e58d6680 	str	r6, [sp, #1664]
  100f0c:	e58d667c 	str	r6, [sp, #1660]
  100f10:	e1a05006 	mov	r5, r6
  100f14:	e59d4018 	ldr	r4, [sp, #24]
  100f18:	e5d43000 	ldrb	r3, [r4]
  100f1c:	e3530000 	cmp	r3, #0	; 0x0
  100f20:	13530025 	cmpne	r3, #37	; 0x25
  100f24:	0a000017 	beq	100f88 <_vfprintf_r+0x1c8>
  100f28:	e59d2018 	ldr	r2, [sp, #24]
  100f2c:	e5f23001 	ldrb	r3, [r2, #1]!
  100f30:	e3530000 	cmp	r3, #0	; 0x0
  100f34:	13530025 	cmpne	r3, #37	; 0x25
  100f38:	1afffffb 	bne	100f2c <_vfprintf_r+0x16c>
  100f3c:	e59d5018 	ldr	r5, [sp, #24]
  100f40:	e0527005 	subs	r7, r2, r5
  100f44:	e1a04002 	mov	r4, r2
  100f48:	0a00000e 	beq	100f88 <_vfprintf_r+0x1c8>
  100f4c:	e59d567c 	ldr	r5, [sp, #1660]
  100f50:	e59d6680 	ldr	r6, [sp, #1664]
  100f54:	e2855001 	add	r5, r5, #1	; 0x1
  100f58:	e59dc018 	ldr	ip, [sp, #24]
  100f5c:	e3550007 	cmp	r5, #7	; 0x7
  100f60:	e0866007 	add	r6, r6, r7
  100f64:	e588c000 	str	ip, [r8]
  100f68:	e5887004 	str	r7, [r8, #4]
  100f6c:	e58d6680 	str	r6, [sp, #1664]
  100f70:	e58d567c 	str	r5, [sp, #1660]
  100f74:	d2888008 	addle	r8, r8, #8	; 0x8
  100f78:	ca00041d 	bgt	101ff4 <prog+0x1fb0>
  100f7c:	e59d1020 	ldr	r1, [sp, #32]
  100f80:	e0811007 	add	r1, r1, r7
  100f84:	e58d1020 	str	r1, [sp, #32]
  100f88:	e5d43000 	ldrb	r3, [r4]
  100f8c:	e3530000 	cmp	r3, #0	; 0x0
  100f90:	0a0006ef 	beq	102b54 <prog+0x2b10>
  100f94:	e3a03000 	mov	r3, #0	; 0x0
  100f98:	e5cd36af 	strb	r3, [sp, #1711]
  100f9c:	e58d3024 	str	r3, [sp, #36]
  100fa0:	e3a02000 	mov	r2, #0	; 0x0
  100fa4:	e5d43001 	ldrb	r3, [r4, #1]
  100fa8:	e2844001 	add	r4, r4, #1	; 0x1
  100fac:	e58d4018 	str	r4, [sp, #24]
  100fb0:	e58d2054 	str	r2, [sp, #84]
  100fb4:	e3e06000 	mvn	r6, #0	; 0x0
  100fb8:	e59dc018 	ldr	ip, [sp, #24]
  100fbc:	e28cc001 	add	ip, ip, #1	; 0x1
  100fc0:	e58dc018 	str	ip, [sp, #24]
  100fc4:	e1a07003 	mov	r7, r3
  100fc8:	e2473020 	sub	r3, r7, #32	; 0x20
  100fcc:	e3530058 	cmp	r3, #88	; 0x58
  100fd0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  100fd4:	ea000198 	b	10163c <prog+0x15f8>
  100fd8:	00101454 	andeqs	r1, r0, r4, asr r4
  100fdc:	0010163c 	andeqs	r1, r0, ip, lsr r6
  100fe0:	0010163c 	andeqs	r1, r0, ip, lsr r6
  100fe4:	0010146c 	andeqs	r1, r0, ip, ror #8
  100fe8:	0010163c 	andeqs	r1, r0, ip, lsr r6
  100fec:	0010163c 	andeqs	r1, r0, ip, lsr r6
  100ff0:	0010163c 	andeqs	r1, r0, ip, lsr r6
  100ff4:	0010163c 	andeqs	r1, r0, ip, lsr r6
  100ff8:	0010163c 	andeqs	r1, r0, ip, lsr r6
  100ffc:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101000:	00101484 	andeqs	r1, r0, r4, lsl #9
  101004:	001014a8 	andeqs	r1, r0, r8, lsr #9
  101008:	0010163c 	andeqs	r1, r0, ip, lsr r6
  10100c:	0010143c 	andeqs	r1, r0, ip, lsr r4
  101010:	00101b68 	andeqs	r1, r0, r8, ror #22
  101014:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101018:	00101b20 	andeqs	r1, r0, r0, lsr #22
  10101c:	00101b38 	andeqs	r1, r0, r8, lsr fp
  101020:	00101b38 	andeqs	r1, r0, r8, lsr fp
  101024:	00101b38 	andeqs	r1, r0, r8, lsr fp
  101028:	00101b38 	andeqs	r1, r0, r8, lsr fp
  10102c:	00101b38 	andeqs	r1, r0, r8, lsr fp
  101030:	00101b38 	andeqs	r1, r0, r8, lsr fp
  101034:	00101b38 	andeqs	r1, r0, r8, lsr fp
  101038:	00101b38 	andeqs	r1, r0, r8, lsr fp
  10103c:	00101b38 	andeqs	r1, r0, r8, lsr fp
  101040:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101044:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101048:	0010163c 	andeqs	r1, r0, ip, lsr r6
  10104c:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101050:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101054:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101058:	0010163c 	andeqs	r1, r0, ip, lsr r6
  10105c:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101060:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101064:	00101510 	andeqs	r1, r0, r0, lsl r5
  101068:	001011a8 	andeqs	r1, r0, r8, lsr #3
  10106c:	0010158c 	andeqs	r1, r0, ip, lsl #11
  101070:	0010158c 	andeqs	r1, r0, ip, lsl #11
  101074:	0010158c 	andeqs	r1, r0, ip, lsl #11
  101078:	0010163c 	andeqs	r1, r0, ip, lsr r6
  10107c:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101080:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101084:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101088:	00101b08 	andeqs	r1, r0, r8, lsl #22
  10108c:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101090:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101094:	00101240 	andeqs	r1, r0, r0, asr #4
  101098:	0010163c 	andeqs	r1, r0, ip, lsr r6
  10109c:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010a0:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010a4:	00101960 	andeqs	r1, r0, r0, ror #18
  1010a8:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010ac:	001013f8 	ldreqsh	r1, [r0], -r8
  1010b0:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010b4:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010b8:	001014bc 	ldreqh	r1, [r0], -ip
  1010bc:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010c0:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010c4:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010c8:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010cc:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010d0:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010d4:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010d8:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010dc:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010e0:	0010163c 	andeqs	r1, r0, ip, lsr r6
  1010e4:	00101510 	andeqs	r1, r0, r0, lsl r5
  1010e8:	001011b4 	ldreqh	r1, [r0], -r4
  1010ec:	0010158c 	andeqs	r1, r0, ip, lsl #11
  1010f0:	0010158c 	andeqs	r1, r0, ip, lsl #11
  1010f4:	0010158c 	andeqs	r1, r0, ip, lsl #11
  1010f8:	00101624 	andeqs	r1, r0, r4, lsr #12
  1010fc:	001011b4 	ldreqh	r1, [r0], -r4
  101100:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101104:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101108:	00101a94 	muleqs	r0, r4, sl
  10110c:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101110:	00101ac4 	andeqs	r1, r0, r4, asr #21
  101114:	0010124c 	andeqs	r1, r0, ip, asr #4
  101118:	0010191c 	andeqs	r1, r0, ip, lsl r9
  10111c:	00101948 	andeqs	r1, r0, r8, asr #18
  101120:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101124:	00101960 	andeqs	r1, r0, r0, ror #18
  101128:	0010163c 	andeqs	r1, r0, ip, lsr r6
  10112c:	00101404 	andeqs	r1, r0, r4, lsl #8
  101130:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101134:	0010163c 	andeqs	r1, r0, ip, lsr r6
  101138:	00101910 	andeqs	r1, r0, r0, lsl r9
  10113c:	e1a00001 	mov	r0, r1
  101140:	eb000e9b 	bl	104bb4 <__sinit>
  101144:	eaffff2c 	b	100dfc <_vfprintf_r+0x3c>
  101148:	e1a0000a 	mov	r0, sl
  10114c:	eb000873 	bl	103320 <__swsetup>
  101150:	e3500000 	cmp	r0, #0	; 0x0
  101154:	1a000010 	bne	10119c <prog+0x1158>
  101158:	e1dac0bc 	ldrh	ip, [sl, #12]
  10115c:	eaffff2c 	b	100e14 <_vfprintf_r+0x54>
  101160:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101164:	e1a0000a 	mov	r0, sl
  101168:	e2811008 	add	r1, r1, #8	; 0x8
  10116c:	ebffff03 	bl	100d80 <__sprint>
  101170:	e3500000 	cmp	r0, #0	; 0x0
  101174:	0a0001d8 	beq	1018dc <prog+0x1898>
  101178:	e59d1044 	ldr	r1, [sp, #68]
  10117c:	e3510000 	cmp	r1, #0	; 0x0
  101180:	0a000002 	beq	101190 <prog+0x114c>
  101184:	e59d0010 	ldr	r0, [sp, #16]
  101188:	e59d1044 	ldr	r1, [sp, #68]
  10118c:	eb000f4b 	bl	104ec0 <_free_r>
  101190:	e1da30bc 	ldrh	r3, [sl, #12]
  101194:	e3130040 	tst	r3, #64	; 0x40
  101198:	0affff4b 	beq	100ecc <_vfprintf_r+0x10c>
  10119c:	e3e02000 	mvn	r2, #0	; 0x0
  1011a0:	e58d2020 	str	r2, [sp, #32]
  1011a4:	eaffff48 	b	100ecc <_vfprintf_r+0x10c>
  1011a8:	e59d3054 	ldr	r3, [sp, #84]
  1011ac:	e3833010 	orr	r3, r3, #16	; 0x10
  1011b0:	e58d3054 	str	r3, [sp, #84]
  1011b4:	e59d4054 	ldr	r4, [sp, #84]
  1011b8:	e3140010 	tst	r4, #16	; 0x10
  1011bc:	1a000002 	bne	1011cc <prog+0x1188>
  1011c0:	e59d5054 	ldr	r5, [sp, #84]
  1011c4:	e3150040 	tst	r5, #64	; 0x40
  1011c8:	1a000414 	bne	102220 <prog+0x21dc>
  1011cc:	e5991000 	ldr	r1, [r9]
  1011d0:	e2899004 	add	r9, r9, #4	; 0x4
  1011d4:	e58d9050 	str	r9, [sp, #80]
  1011d8:	e3510000 	cmp	r1, #0	; 0x0
  1011dc:	b3a0302d 	movlt	r3, #45	; 0x2d
  1011e0:	a3a02001 	movge	r2, #1	; 0x1
  1011e4:	b2611000 	rsblt	r1, r1, #0	; 0x0
  1011e8:	b3a02001 	movlt	r2, #1	; 0x1
  1011ec:	b5cd36af 	strltb	r3, [sp, #1711]
  1011f0:	e3560000 	cmp	r6, #0	; 0x0
  1011f4:	aa00001f 	bge	101278 <prog+0x1234>
  1011f8:	e3520001 	cmp	r2, #1	; 0x1
  1011fc:	0a000384 	beq	102014 <prog+0x1fd0>
  101200:	328d0e5b 	addcc	r0, sp, #1456	; 0x5b0
  101204:	32800004 	addcc	r0, r0, #4	; 0x4
  101208:	3a0002c1 	bcc	101d14 <prog+0x1cd0>
  10120c:	e3520002 	cmp	r2, #2	; 0x2
  101210:	0a00047e 	beq	102410 <prog+0x23cc>
  101214:	e59f0fcc 	ldr	r0, [pc, #4044]	; 1021e8 <prog+0x21a4>
  101218:	ebfffe6f 	bl	100bdc <strlen>
  10121c:	e59fcfc4 	ldr	ip, [pc, #4036]	; 1021e8 <prog+0x21a4>
  101220:	e1560000 	cmp	r6, r0
  101224:	a1a01006 	movge	r1, r6
  101228:	b1a01000 	movlt	r1, r0
  10122c:	e1a0b000 	mov	fp, r0
  101230:	e58dc01c 	str	ip, [sp, #28]
  101234:	e58d103c 	str	r1, [sp, #60]
  101238:	e58d6038 	str	r6, [sp, #56]
  10123c:	ea00002c 	b	1012f4 <prog+0x12b0>
  101240:	e59d2054 	ldr	r2, [sp, #84]
  101244:	e3822010 	orr	r2, r2, #16	; 0x10
  101248:	e58d2054 	str	r2, [sp, #84]
  10124c:	e59d3054 	ldr	r3, [sp, #84]
  101250:	e2132010 	ands	r2, r3, #16	; 0x10
  101254:	0a0003a4 	beq	1020ec <prog+0x20a8>
  101258:	e5991000 	ldr	r1, [r9]
  10125c:	e2899004 	add	r9, r9, #4	; 0x4
  101260:	e58d9050 	str	r9, [sp, #80]
  101264:	e3a02000 	mov	r2, #0	; 0x0
  101268:	e3a03000 	mov	r3, #0	; 0x0
  10126c:	e3560000 	cmp	r6, #0	; 0x0
  101270:	e5cd36af 	strb	r3, [sp, #1711]
  101274:	baffffdf 	blt	1011f8 <prog+0x11b4>
  101278:	e59d3054 	ldr	r3, [sp, #84]
  10127c:	e3560000 	cmp	r6, #0	; 0x0
  101280:	03510000 	cmpeq	r1, #0	; 0x0
  101284:	e3c33080 	bic	r3, r3, #128	; 0x80
  101288:	e58d3054 	str	r3, [sp, #84]
  10128c:	1affffd9 	bne	1011f8 <prog+0x11b4>
  101290:	e3520000 	cmp	r2, #0	; 0x0
  101294:	128d2e5b 	addne	r2, sp, #1456	; 0x5b0
  101298:	12822004 	addne	r2, r2, #4	; 0x4
  10129c:	158d201c 	strne	r2, [sp, #28]
  1012a0:	1a000009 	bne	1012cc <prog+0x1288>
  1012a4:	e59d3054 	ldr	r3, [sp, #84]
  1012a8:	e3130001 	tst	r3, #1	; 0x1
  1012ac:	028d4e5b 	addeq	r4, sp, #1456	; 0x5b0
  1012b0:	128d5e5b 	addne	r5, sp, #1456	; 0x5b0
  1012b4:	02844004 	addeq	r4, r4, #4	; 0x4
  1012b8:	13a03030 	movne	r3, #48	; 0x30
  1012bc:	12855003 	addne	r5, r5, #3	; 0x3
  1012c0:	058d401c 	streq	r4, [sp, #28]
  1012c4:	15cd35b3 	strneb	r3, [sp, #1459]
  1012c8:	158d501c 	strne	r5, [sp, #28]
  1012cc:	e28d5e45 	add	r5, sp, #1104	; 0x450
  1012d0:	e59dc01c 	ldr	ip, [sp, #28]
  1012d4:	e2855008 	add	r5, r5, #8	; 0x8
  1012d8:	e06c3005 	rsb	r3, ip, r5
  1012dc:	e283bf57 	add	fp, r3, #348	; 0x15c
  1012e0:	e156000b 	cmp	r6, fp
  1012e4:	a1a01006 	movge	r1, r6
  1012e8:	b1a0100b 	movlt	r1, fp
  1012ec:	e58d103c 	str	r1, [sp, #60]
  1012f0:	e58d6038 	str	r6, [sp, #56]
  1012f4:	e5dd36af 	ldrb	r3, [sp, #1711]
  1012f8:	e3530000 	cmp	r3, #0	; 0x0
  1012fc:	0a0000dc 	beq	101674 <prog+0x1630>
  101300:	e59d103c 	ldr	r1, [sp, #60]
  101304:	e59d4054 	ldr	r4, [sp, #84]
  101308:	e2811001 	add	r1, r1, #1	; 0x1
  10130c:	e2144084 	ands	r4, r4, #132	; 0x84
  101310:	e58d103c 	str	r1, [sp, #60]
  101314:	e58d4014 	str	r4, [sp, #20]
  101318:	1a0000de 	bne	101698 <prog+0x1654>
  10131c:	e59d5024 	ldr	r5, [sp, #36]
  101320:	e59dc03c 	ldr	ip, [sp, #60]
  101324:	e06c4005 	rsb	r4, ip, r5
  101328:	e3540000 	cmp	r4, #0	; 0x0
  10132c:	da0000d9 	ble	101698 <prog+0x1654>
  101330:	e3540010 	cmp	r4, #16	; 0x10
  101334:	da000484 	ble	10254c <prog+0x2508>
  101338:	e59d6680 	ldr	r6, [sp, #1664]
  10133c:	e59d567c 	ldr	r5, [sp, #1660]
  101340:	e59f9ec8 	ldr	r9, [pc, #3784]	; 102210 <prog+0x21cc>
  101344:	ea000002 	b	101354 <prog+0x1310>
  101348:	e2444010 	sub	r4, r4, #16	; 0x10
  10134c:	e3540010 	cmp	r4, #16	; 0x10
  101350:	da000015 	ble	1013ac <prog+0x1368>
  101354:	e2855001 	add	r5, r5, #1	; 0x1
  101358:	e28d1e67 	add	r1, sp, #1648	; 0x670
  10135c:	e2866010 	add	r6, r6, #16	; 0x10
  101360:	e3a03010 	mov	r3, #16	; 0x10
  101364:	e3550007 	cmp	r5, #7	; 0x7
  101368:	e5883004 	str	r3, [r8, #4]
  10136c:	e5889000 	str	r9, [r8]
  101370:	e1a0000a 	mov	r0, sl
  101374:	e2811008 	add	r1, r1, #8	; 0x8
  101378:	e2888008 	add	r8, r8, #8	; 0x8
  10137c:	e58d6680 	str	r6, [sp, #1664]
  101380:	e58d567c 	str	r5, [sp, #1660]
  101384:	daffffef 	ble	101348 <prog+0x1304>
  101388:	ebfffe7c 	bl	100d80 <__sprint>
  10138c:	e3500000 	cmp	r0, #0	; 0x0
  101390:	1affff78 	bne	101178 <prog+0x1134>
  101394:	e2444010 	sub	r4, r4, #16	; 0x10
  101398:	e3540010 	cmp	r4, #16	; 0x10
  10139c:	e28d8e61 	add	r8, sp, #1552	; 0x610
  1013a0:	e59d6680 	ldr	r6, [sp, #1664]
  1013a4:	e59d567c 	ldr	r5, [sp, #1660]
  1013a8:	caffffe9 	bgt	101354 <prog+0x1310>
  1013ac:	e2855001 	add	r5, r5, #1	; 0x1
  1013b0:	e0866004 	add	r6, r6, r4
  1013b4:	e3550007 	cmp	r5, #7	; 0x7
  1013b8:	e5889000 	str	r9, [r8]
  1013bc:	e5884004 	str	r4, [r8, #4]
  1013c0:	e58d6680 	str	r6, [sp, #1664]
  1013c4:	e58d567c 	str	r5, [sp, #1660]
  1013c8:	d2888008 	addle	r8, r8, #8	; 0x8
  1013cc:	da0000b3 	ble	1016a0 <prog+0x165c>
  1013d0:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1013d4:	e1a0000a 	mov	r0, sl
  1013d8:	e2811008 	add	r1, r1, #8	; 0x8
  1013dc:	ebfffe67 	bl	100d80 <__sprint>
  1013e0:	e3500000 	cmp	r0, #0	; 0x0
  1013e4:	1affff63 	bne	101178 <prog+0x1134>
  1013e8:	e59d6680 	ldr	r6, [sp, #1664]
  1013ec:	e59d567c 	ldr	r5, [sp, #1660]
  1013f0:	e28d8e61 	add	r8, sp, #1552	; 0x610
  1013f4:	ea0000a9 	b	1016a0 <prog+0x165c>
  1013f8:	e59d1054 	ldr	r1, [sp, #84]
  1013fc:	e3811010 	orr	r1, r1, #16	; 0x10
  101400:	e58d1054 	str	r1, [sp, #84]
  101404:	e59d2054 	ldr	r2, [sp, #84]
  101408:	e3120010 	tst	r2, #16	; 0x10
  10140c:	1a000002 	bne	10141c <prog+0x13d8>
  101410:	e59d3054 	ldr	r3, [sp, #84]
  101414:	e3130040 	tst	r3, #64	; 0x40
  101418:	1a00036b 	bne	1021cc <prog+0x2188>
  10141c:	e5991000 	ldr	r1, [r9]
  101420:	e3a02001 	mov	r2, #1	; 0x1
  101424:	e2899004 	add	r9, r9, #4	; 0x4
  101428:	e58d9050 	str	r9, [sp, #80]
  10142c:	eaffff8d 	b	101268 <prog+0x1224>
  101430:	e26cc000 	rsb	ip, ip, #0	; 0x0
  101434:	e58dc024 	str	ip, [sp, #36]
  101438:	e1a09002 	mov	r9, r2
  10143c:	e59d1018 	ldr	r1, [sp, #24]
  101440:	e59d2054 	ldr	r2, [sp, #84]
  101444:	e5d13000 	ldrb	r3, [r1]
  101448:	e3822004 	orr	r2, r2, #4	; 0x4
  10144c:	e58d2054 	str	r2, [sp, #84]
  101450:	eafffed8 	b	100fb8 <_vfprintf_r+0x1f8>
  101454:	e5dd36af 	ldrb	r3, [sp, #1711]
  101458:	e3530000 	cmp	r3, #0	; 0x0
  10145c:	0a000355 	beq	1021b8 <prog+0x2174>
  101460:	e59d5018 	ldr	r5, [sp, #24]
  101464:	e5d53000 	ldrb	r3, [r5]
  101468:	eafffed2 	b	100fb8 <_vfprintf_r+0x1f8>
  10146c:	e59d4018 	ldr	r4, [sp, #24]
  101470:	e59d5054 	ldr	r5, [sp, #84]
  101474:	e5d43000 	ldrb	r3, [r4]
  101478:	e3855001 	orr	r5, r5, #1	; 0x1
  10147c:	e58d5054 	str	r5, [sp, #84]
  101480:	eafffecc 	b	100fb8 <_vfprintf_r+0x1f8>
  101484:	e599c000 	ldr	ip, [r9]
  101488:	e35c0000 	cmp	ip, #0	; 0x0
  10148c:	e58dc024 	str	ip, [sp, #36]
  101490:	e2892004 	add	r2, r9, #4	; 0x4
  101494:	baffffe5 	blt	101430 <prog+0x13ec>
  101498:	e59d4018 	ldr	r4, [sp, #24]
  10149c:	e5d43000 	ldrb	r3, [r4]
  1014a0:	e1a09002 	mov	r9, r2
  1014a4:	eafffec3 	b	100fb8 <_vfprintf_r+0x1f8>
  1014a8:	e3a0302b 	mov	r3, #43	; 0x2b
  1014ac:	e5cd36af 	strb	r3, [sp, #1711]
  1014b0:	e59d4018 	ldr	r4, [sp, #24]
  1014b4:	e5d43000 	ldrb	r3, [r4]
  1014b8:	eafffebe 	b	100fb8 <_vfprintf_r+0x1f8>
  1014bc:	e59f4d28 	ldr	r4, [pc, #3368]	; 1021ec <prog+0x21a8>
  1014c0:	e58d4040 	str	r4, [sp, #64]
  1014c4:	e59d5054 	ldr	r5, [sp, #84]
  1014c8:	e3150010 	tst	r5, #16	; 0x10
  1014cc:	1a000002 	bne	1014dc <prog+0x1498>
  1014d0:	e59dc054 	ldr	ip, [sp, #84]
  1014d4:	e31c0040 	tst	ip, #64	; 0x40
  1014d8:	1a000356 	bne	102238 <prog+0x21f4>
  1014dc:	e5991000 	ldr	r1, [r9]
  1014e0:	e2899004 	add	r9, r9, #4	; 0x4
  1014e4:	e58d9050 	str	r9, [sp, #80]
  1014e8:	e59d3054 	ldr	r3, [sp, #84]
  1014ec:	e3510000 	cmp	r1, #0	; 0x0
  1014f0:	03a03000 	moveq	r3, #0	; 0x0
  1014f4:	12033001 	andne	r3, r3, #1	; 0x1
  1014f8:	e3530000 	cmp	r3, #0	; 0x0
  1014fc:	159d2054 	ldrne	r2, [sp, #84]
  101500:	13822002 	orrne	r2, r2, #2	; 0x2
  101504:	158d2054 	strne	r2, [sp, #84]
  101508:	e3a02002 	mov	r2, #2	; 0x2
  10150c:	eaffff55 	b	101268 <prog+0x1224>
  101510:	e3570043 	cmp	r7, #67	; 0x43
  101514:	0a000002 	beq	101524 <prog+0x14e0>
  101518:	e59d1054 	ldr	r1, [sp, #84]
  10151c:	e3110010 	tst	r1, #16	; 0x10
  101520:	0a00037a 	beq	102310 <prog+0x22cc>
  101524:	e28d4d1a 	add	r4, sp, #1664	; 0x680
  101528:	e284400c 	add	r4, r4, #12	; 0xc
  10152c:	e28d5e45 	add	r5, sp, #1104	; 0x450
  101530:	e3a01000 	mov	r1, #0	; 0x0
  101534:	e3a02008 	mov	r2, #8	; 0x8
  101538:	e1a00004 	mov	r0, r4
  10153c:	e2855008 	add	r5, r5, #8	; 0x8
  101540:	ebfffd46 	bl	100a60 <memset>
  101544:	e1a03004 	mov	r3, r4
  101548:	e59d0010 	ldr	r0, [sp, #16]
  10154c:	e1a01005 	mov	r1, r5
  101550:	e5992000 	ldr	r2, [r9]
  101554:	eb0005eb 	bl	102d08 <_wcrtomb_r>
  101558:	e3700001 	cmn	r0, #1	; 0x1
  10155c:	e1a0b000 	mov	fp, r0
  101560:	0a000565 	beq	102afc <prog+0x2ab8>
  101564:	e2899004 	add	r9, r9, #4	; 0x4
  101568:	e58d9050 	str	r9, [sp, #80]
  10156c:	e35b0000 	cmp	fp, #0	; 0x0
  101570:	a1a0200b 	movge	r2, fp
  101574:	b3a02000 	movlt	r2, #0	; 0x0
  101578:	e3a03000 	mov	r3, #0	; 0x0
  10157c:	e58d203c 	str	r2, [sp, #60]
  101580:	e58d501c 	str	r5, [sp, #28]
  101584:	e5cd36af 	strb	r3, [sp, #1711]
  101588:	ea000037 	b	10166c <prog+0x1628>
  10158c:	e3760001 	cmn	r6, #1	; 0x1
  101590:	02866007 	addeq	r6, r6, #7	; 0x7
  101594:	0a000002 	beq	1015a4 <prog+0x1560>
  101598:	e3570047 	cmp	r7, #71	; 0x47
  10159c:	13570067 	cmpne	r7, #103	; 0x67
  1015a0:	0a000362 	beq	102330 <prog+0x22ec>
  1015a4:	e59dc054 	ldr	ip, [sp, #84]
  1015a8:	e31c0008 	tst	ip, #8	; 0x8
  1015ac:	0a0002fb 	beq	1021a0 <prog+0x215c>
  1015b0:	e8990006 	ldmia	r9, {r1, r2}
  1015b4:	e2899008 	add	r9, r9, #8	; 0x8
  1015b8:	e58d1048 	str	r1, [sp, #72]
  1015bc:	e58d204c 	str	r2, [sp, #76]
  1015c0:	e58d9050 	str	r9, [sp, #80]
  1015c4:	e28d0048 	add	r0, sp, #72	; 0x48
  1015c8:	e8900003 	ldmia	r0, {r0, r1}
  1015cc:	eb00159e 	bl	106c4c <isinf>
  1015d0:	e2504000 	subs	r4, r0, #0	; 0x0
  1015d4:	0a0003c4 	beq	1024ec <prog+0x24a8>
  1015d8:	e3a03000 	mov	r3, #0	; 0x0
  1015dc:	e28d0048 	add	r0, sp, #72	; 0x48
  1015e0:	e8900003 	ldmia	r0, {r0, r1}
  1015e4:	e3a02000 	mov	r2, #0	; 0x0
  1015e8:	eb001b70 	bl	1083b0 <__ltdf2>
  1015ec:	e3500000 	cmp	r0, #0	; 0x0
  1015f0:	b3a0302d 	movlt	r3, #45	; 0x2d
  1015f4:	b5cd36af 	strltb	r3, [sp, #1711]
  1015f8:	e2473045 	sub	r3, r7, #69	; 0x45
  1015fc:	e3530002 	cmp	r3, #2	; 0x2
  101600:	8a0003a8 	bhi	1024a8 <prog+0x2464>
  101604:	e3a03003 	mov	r3, #3	; 0x3
  101608:	e59f4be0 	ldr	r4, [pc, #3040]	; 1021f0 <prog+0x21ac>
  10160c:	e3a05000 	mov	r5, #0	; 0x0
  101610:	e1a0b003 	mov	fp, r3
  101614:	e58d303c 	str	r3, [sp, #60]
  101618:	e58d401c 	str	r4, [sp, #28]
  10161c:	e58d5038 	str	r5, [sp, #56]
  101620:	eaffff33 	b	1012f4 <prog+0x12b0>
  101624:	e59d5018 	ldr	r5, [sp, #24]
  101628:	e59dc054 	ldr	ip, [sp, #84]
  10162c:	e5d53000 	ldrb	r3, [r5]
  101630:	e38cc040 	orr	ip, ip, #64	; 0x40
  101634:	e58dc054 	str	ip, [sp, #84]
  101638:	eafffe5e 	b	100fb8 <_vfprintf_r+0x1f8>
  10163c:	e3570000 	cmp	r7, #0	; 0x0
  101640:	0a000543 	beq	102b54 <prog+0x2b10>
  101644:	e28d3e45 	add	r3, sp, #1104	; 0x450
  101648:	e2833008 	add	r3, r3, #8	; 0x8
  10164c:	e3a02001 	mov	r2, #1	; 0x1
  101650:	e58d301c 	str	r3, [sp, #28]
  101654:	e3a03000 	mov	r3, #0	; 0x0
  101658:	e58d203c 	str	r2, [sp, #60]
  10165c:	e58d9050 	str	r9, [sp, #80]
  101660:	e5cd36af 	strb	r3, [sp, #1711]
  101664:	e5cd7458 	strb	r7, [sp, #1112]
  101668:	e1a0b002 	mov	fp, r2
  10166c:	e3a05000 	mov	r5, #0	; 0x0
  101670:	e58d5038 	str	r5, [sp, #56]
  101674:	e59d2054 	ldr	r2, [sp, #84]
  101678:	e3120002 	tst	r2, #2	; 0x2
  10167c:	159d303c 	ldrne	r3, [sp, #60]
  101680:	e59d4054 	ldr	r4, [sp, #84]
  101684:	12833002 	addne	r3, r3, #2	; 0x2
  101688:	158d303c 	strne	r3, [sp, #60]
  10168c:	e2144084 	ands	r4, r4, #132	; 0x84
  101690:	e58d4014 	str	r4, [sp, #20]
  101694:	0affff20 	beq	10131c <prog+0x12d8>
  101698:	e59d6680 	ldr	r6, [sp, #1664]
  10169c:	e59d567c 	ldr	r5, [sp, #1660]
  1016a0:	e5dd36af 	ldrb	r3, [sp, #1711]
  1016a4:	e3530000 	cmp	r3, #0	; 0x0
  1016a8:	0a000147 	beq	101bcc <prog+0x1b88>
  1016ac:	e2855001 	add	r5, r5, #1	; 0x1
  1016b0:	e28d3e6a 	add	r3, sp, #1696	; 0x6a0
  1016b4:	e2866001 	add	r6, r6, #1	; 0x1
  1016b8:	e283300f 	add	r3, r3, #15	; 0xf
  1016bc:	e3a02001 	mov	r2, #1	; 0x1
  1016c0:	e3550007 	cmp	r5, #7	; 0x7
  1016c4:	e5883000 	str	r3, [r8]
  1016c8:	e5882004 	str	r2, [r8, #4]
  1016cc:	e58d6680 	str	r6, [sp, #1664]
  1016d0:	e58d567c 	str	r5, [sp, #1660]
  1016d4:	ca00014d 	bgt	101c10 <prog+0x1bcc>
  1016d8:	e2888008 	add	r8, r8, #8	; 0x8
  1016dc:	e59d2014 	ldr	r2, [sp, #20]
  1016e0:	e3520080 	cmp	r2, #128	; 0x80
  1016e4:	0a000155 	beq	101c40 <prog+0x1bfc>
  1016e8:	e59d1038 	ldr	r1, [sp, #56]
  1016ec:	e06b4001 	rsb	r4, fp, r1
  1016f0:	e3540000 	cmp	r4, #0	; 0x0
  1016f4:	da00002e 	ble	1017b4 <prog+0x1770>
  1016f8:	e3540010 	cmp	r4, #16	; 0x10
  1016fc:	da000367 	ble	1024a0 <prog+0x245c>
  101700:	e59f9b0c 	ldr	r9, [pc, #2828]	; 102214 <prog+0x21d0>
  101704:	ea000002 	b	101714 <prog+0x16d0>
  101708:	e2444010 	sub	r4, r4, #16	; 0x10
  10170c:	e3540010 	cmp	r4, #16	; 0x10
  101710:	da000015 	ble	10176c <prog+0x1728>
  101714:	e2855001 	add	r5, r5, #1	; 0x1
  101718:	e28d1e67 	add	r1, sp, #1648	; 0x670
  10171c:	e2866010 	add	r6, r6, #16	; 0x10
  101720:	e3a03010 	mov	r3, #16	; 0x10
  101724:	e3550007 	cmp	r5, #7	; 0x7
  101728:	e5883004 	str	r3, [r8, #4]
  10172c:	e5889000 	str	r9, [r8]
  101730:	e1a0000a 	mov	r0, sl
  101734:	e2811008 	add	r1, r1, #8	; 0x8
  101738:	e2888008 	add	r8, r8, #8	; 0x8
  10173c:	e58d6680 	str	r6, [sp, #1664]
  101740:	e58d567c 	str	r5, [sp, #1660]
  101744:	daffffef 	ble	101708 <prog+0x16c4>
  101748:	ebfffd8c 	bl	100d80 <__sprint>
  10174c:	e3500000 	cmp	r0, #0	; 0x0
  101750:	1afffe88 	bne	101178 <prog+0x1134>
  101754:	e2444010 	sub	r4, r4, #16	; 0x10
  101758:	e3540010 	cmp	r4, #16	; 0x10
  10175c:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101760:	e59d6680 	ldr	r6, [sp, #1664]
  101764:	e59d567c 	ldr	r5, [sp, #1660]
  101768:	caffffe9 	bgt	101714 <prog+0x16d0>
  10176c:	e2855001 	add	r5, r5, #1	; 0x1
  101770:	e0866004 	add	r6, r6, r4
  101774:	e3550007 	cmp	r5, #7	; 0x7
  101778:	e5889000 	str	r9, [r8]
  10177c:	e5884004 	str	r4, [r8, #4]
  101780:	e58d6680 	str	r6, [sp, #1664]
  101784:	e58d567c 	str	r5, [sp, #1660]
  101788:	d2888008 	addle	r8, r8, #8	; 0x8
  10178c:	da000008 	ble	1017b4 <prog+0x1770>
  101790:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101794:	e1a0000a 	mov	r0, sl
  101798:	e2811008 	add	r1, r1, #8	; 0x8
  10179c:	ebfffd77 	bl	100d80 <__sprint>
  1017a0:	e3500000 	cmp	r0, #0	; 0x0
  1017a4:	1afffe73 	bne	101178 <prog+0x1134>
  1017a8:	e59d6680 	ldr	r6, [sp, #1664]
  1017ac:	e59d567c 	ldr	r5, [sp, #1660]
  1017b0:	e28d8e61 	add	r8, sp, #1552	; 0x610
  1017b4:	e59d2054 	ldr	r2, [sp, #84]
  1017b8:	e3120c01 	tst	r2, #256	; 0x100
  1017bc:	1a000163 	bne	101d50 <prog+0x1d0c>
  1017c0:	e2855001 	add	r5, r5, #1	; 0x1
  1017c4:	e59d301c 	ldr	r3, [sp, #28]
  1017c8:	e086600b 	add	r6, r6, fp
  1017cc:	e3550007 	cmp	r5, #7	; 0x7
  1017d0:	e8880808 	stmia	r8, {r3, fp}
  1017d4:	e58d6680 	str	r6, [sp, #1664]
  1017d8:	e58d567c 	str	r5, [sp, #1660]
  1017dc:	d288c008 	addle	ip, r8, #8	; 0x8
  1017e0:	ca0001c6 	bgt	101f00 <prog+0x1ebc>
  1017e4:	e59d1054 	ldr	r1, [sp, #84]
  1017e8:	e3110004 	tst	r1, #4	; 0x4
  1017ec:	0a000031 	beq	1018b8 <prog+0x1874>
  1017f0:	e59d2024 	ldr	r2, [sp, #36]
  1017f4:	e59d303c 	ldr	r3, [sp, #60]
  1017f8:	e0634002 	rsb	r4, r3, r2
  1017fc:	e3540000 	cmp	r4, #0	; 0x0
  101800:	da00002c 	ble	1018b8 <prog+0x1874>
  101804:	e3540010 	cmp	r4, #16	; 0x10
  101808:	da000393 	ble	10265c <prog+0x2618>
  10180c:	e59d567c 	ldr	r5, [sp, #1660]
  101810:	e59f99f8 	ldr	r9, [pc, #2552]	; 102210 <prog+0x21cc>
  101814:	ea000002 	b	101824 <prog+0x17e0>
  101818:	e2444010 	sub	r4, r4, #16	; 0x10
  10181c:	e3540010 	cmp	r4, #16	; 0x10
  101820:	da000015 	ble	10187c <prog+0x1838>
  101824:	e2855001 	add	r5, r5, #1	; 0x1
  101828:	e28d1e67 	add	r1, sp, #1648	; 0x670
  10182c:	e2866010 	add	r6, r6, #16	; 0x10
  101830:	e3a03010 	mov	r3, #16	; 0x10
  101834:	e3550007 	cmp	r5, #7	; 0x7
  101838:	e58c3004 	str	r3, [ip, #4]
  10183c:	e58c9000 	str	r9, [ip]
  101840:	e1a0000a 	mov	r0, sl
  101844:	e2811008 	add	r1, r1, #8	; 0x8
  101848:	e28cc008 	add	ip, ip, #8	; 0x8
  10184c:	e58d6680 	str	r6, [sp, #1664]
  101850:	e58d567c 	str	r5, [sp, #1660]
  101854:	daffffef 	ble	101818 <prog+0x17d4>
  101858:	ebfffd48 	bl	100d80 <__sprint>
  10185c:	e3500000 	cmp	r0, #0	; 0x0
  101860:	1afffe44 	bne	101178 <prog+0x1134>
  101864:	e2444010 	sub	r4, r4, #16	; 0x10
  101868:	e3540010 	cmp	r4, #16	; 0x10
  10186c:	e28dce61 	add	ip, sp, #1552	; 0x610
  101870:	e59d6680 	ldr	r6, [sp, #1664]
  101874:	e59d567c 	ldr	r5, [sp, #1660]
  101878:	caffffe9 	bgt	101824 <prog+0x17e0>
  10187c:	e2855001 	add	r5, r5, #1	; 0x1
  101880:	e0866004 	add	r6, r6, r4
  101884:	e3550007 	cmp	r5, #7	; 0x7
  101888:	e58c9000 	str	r9, [ip]
  10188c:	e58c4004 	str	r4, [ip, #4]
  101890:	e58d6680 	str	r6, [sp, #1664]
  101894:	e58d567c 	str	r5, [sp, #1660]
  101898:	da000006 	ble	1018b8 <prog+0x1874>
  10189c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1018a0:	e1a0000a 	mov	r0, sl
  1018a4:	e2811008 	add	r1, r1, #8	; 0x8
  1018a8:	ebfffd34 	bl	100d80 <__sprint>
  1018ac:	e3500000 	cmp	r0, #0	; 0x0
  1018b0:	1afffe30 	bne	101178 <prog+0x1134>
  1018b4:	e59d6680 	ldr	r6, [sp, #1664]
  1018b8:	e28d4020 	add	r4, sp, #32	; 0x20
  1018bc:	e8940030 	ldmia	r4, {r4, r5}
  1018c0:	e59d803c 	ldr	r8, [sp, #60]
  1018c4:	e1550008 	cmp	r5, r8
  1018c8:	a0844005 	addge	r4, r4, r5
  1018cc:	b0844008 	addlt	r4, r4, r8
  1018d0:	e3560000 	cmp	r6, #0	; 0x0
  1018d4:	e58d4020 	str	r4, [sp, #32]
  1018d8:	1afffe20 	bne	101160 <prog+0x111c>
  1018dc:	e59dc044 	ldr	ip, [sp, #68]
  1018e0:	e3a05000 	mov	r5, #0	; 0x0
  1018e4:	e35c0000 	cmp	ip, #0	; 0x0
  1018e8:	e58d567c 	str	r5, [sp, #1660]
  1018ec:	028d8e61 	addeq	r8, sp, #1552	; 0x610
  1018f0:	0a000004 	beq	101908 <prog+0x18c4>
  1018f4:	e1a0100c 	mov	r1, ip
  1018f8:	e59d0010 	ldr	r0, [sp, #16]
  1018fc:	eb000d6f 	bl	104ec0 <_free_r>
  101900:	e58d5044 	str	r5, [sp, #68]
  101904:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101908:	e59d9050 	ldr	r9, [sp, #80]
  10190c:	eafffd80 	b	100f14 <_vfprintf_r+0x154>
  101910:	e59f18dc 	ldr	r1, [pc, #2268]	; 1021f4 <prog+0x21b0>
  101914:	e58d1040 	str	r1, [sp, #64]
  101918:	eafffee9 	b	1014c4 <prog+0x1480>
  10191c:	e59dc054 	ldr	ip, [sp, #84]
  101920:	e5991000 	ldr	r1, [r9]
  101924:	e59f58c8 	ldr	r5, [pc, #2248]	; 1021f4 <prog+0x21b0>
  101928:	e38cc002 	orr	ip, ip, #2	; 0x2
  10192c:	e2899004 	add	r9, r9, #4	; 0x4
  101930:	e3a07078 	mov	r7, #120	; 0x78
  101934:	e3a02002 	mov	r2, #2	; 0x2
  101938:	e58d5040 	str	r5, [sp, #64]
  10193c:	e58dc054 	str	ip, [sp, #84]
  101940:	e58d9050 	str	r9, [sp, #80]
  101944:	eafffe47 	b	101268 <prog+0x1224>
  101948:	e59d5018 	ldr	r5, [sp, #24]
  10194c:	e59dc054 	ldr	ip, [sp, #84]
  101950:	e5d53000 	ldrb	r3, [r5]
  101954:	e38cc010 	orr	ip, ip, #16	; 0x10
  101958:	e58dc054 	str	ip, [sp, #84]
  10195c:	eafffd95 	b	100fb8 <_vfprintf_r+0x1f8>
  101960:	e3a04000 	mov	r4, #0	; 0x0
  101964:	e5cd46af 	strb	r4, [sp, #1711]
  101968:	e5991000 	ldr	r1, [r9]
  10196c:	e2899004 	add	r9, r9, #4	; 0x4
  101970:	e1510004 	cmp	r1, r4
  101974:	e58d101c 	str	r1, [sp, #28]
  101978:	e58d9050 	str	r9, [sp, #80]
  10197c:	0a000330 	beq	102644 <prog+0x2600>
  101980:	e3570053 	cmp	r7, #83	; 0x53
  101984:	0a000002 	beq	101994 <prog+0x1950>
  101988:	e59d2054 	ldr	r2, [sp, #84]
  10198c:	e2125010 	ands	r5, r2, #16	; 0x10
  101990:	0a000269 	beq	10233c <prog+0x22f8>
  101994:	e28d9d1a 	add	r9, sp, #1664	; 0x680
  101998:	e59d301c 	ldr	r3, [sp, #28]
  10199c:	e2899004 	add	r9, r9, #4	; 0x4
  1019a0:	e1a00009 	mov	r0, r9
  1019a4:	e1a01004 	mov	r1, r4
  1019a8:	e3a02008 	mov	r2, #8	; 0x8
  1019ac:	e58d36a4 	str	r3, [sp, #1700]
  1019b0:	ebfffc2a 	bl	100a60 <memset>
  1019b4:	e3560000 	cmp	r6, #0	; 0x0
  1019b8:	ba000443 	blt	102acc <prog+0x2a88>
  1019bc:	e28d5e45 	add	r5, sp, #1104	; 0x450
  1019c0:	e1a0b004 	mov	fp, r4
  1019c4:	e2855008 	add	r5, r5, #8	; 0x8
  1019c8:	e59d36a4 	ldr	r3, [sp, #1700]
  1019cc:	e793c004 	ldr	ip, [r3, r4]
  1019d0:	e35c0000 	cmp	ip, #0	; 0x0
  1019d4:	e1a0200c 	mov	r2, ip
  1019d8:	e59d0010 	ldr	r0, [sp, #16]
  1019dc:	e1a01005 	mov	r1, r5
  1019e0:	e1a03009 	mov	r3, r9
  1019e4:	0a000009 	beq	101a10 <prog+0x19cc>
  1019e8:	eb0004c6 	bl	102d08 <_wcrtomb_r>
  1019ec:	e3700001 	cmn	r0, #1	; 0x1
  1019f0:	e08b3000 	add	r3, fp, r0
  1019f4:	0a000440 	beq	102afc <prog+0x2ab8>
  1019f8:	e1560003 	cmp	r6, r3
  1019fc:	ba000003 	blt	101a10 <prog+0x19cc>
  101a00:	e1a0b003 	mov	fp, r3
  101a04:	e2844004 	add	r4, r4, #4	; 0x4
  101a08:	1affffee 	bne	1019c8 <prog+0x1984>
  101a0c:	e1a0b006 	mov	fp, r6
  101a10:	e35b0000 	cmp	fp, #0	; 0x0
  101a14:	058db038 	streq	fp, [sp, #56]
  101a18:	058db03c 	streq	fp, [sp, #60]
  101a1c:	0afffe34 	beq	1012f4 <prog+0x12b0>
  101a20:	e59d0010 	ldr	r0, [sp, #16]
  101a24:	e28b1001 	add	r1, fp, #1	; 0x1
  101a28:	ebfffa08 	bl	100250 <_malloc_r>
  101a2c:	e3500000 	cmp	r0, #0	; 0x0
  101a30:	0a000431 	beq	102afc <prog+0x2ab8>
  101a34:	e58d0044 	str	r0, [sp, #68]
  101a38:	e3a01000 	mov	r1, #0	; 0x0
  101a3c:	e3a02008 	mov	r2, #8	; 0x8
  101a40:	e1a00009 	mov	r0, r9
  101a44:	ebfffc05 	bl	100a60 <memset>
  101a48:	e28d2e6a 	add	r2, sp, #1696	; 0x6a0
  101a4c:	e59d0010 	ldr	r0, [sp, #16]
  101a50:	e59d1044 	ldr	r1, [sp, #68]
  101a54:	e2822004 	add	r2, r2, #4	; 0x4
  101a58:	e1a0300b 	mov	r3, fp
  101a5c:	e58d9000 	str	r9, [sp]
  101a60:	eb0004c8 	bl	102d88 <_wcsrtombs_r>
  101a64:	e15b0000 	cmp	fp, r0
  101a68:	1a000492 	bne	102cb8 <prog+0x2c74>
  101a6c:	e3a03000 	mov	r3, #0	; 0x0
  101a70:	e59dc044 	ldr	ip, [sp, #68]
  101a74:	e15b0003 	cmp	fp, r3
  101a78:	a1a0500b 	movge	r5, fp
  101a7c:	b1a05003 	movlt	r5, r3
  101a80:	e58d503c 	str	r5, [sp, #60]
  101a84:	e58d3038 	str	r3, [sp, #56]
  101a88:	e58dc01c 	str	ip, [sp, #28]
  101a8c:	e7cc300b 	strb	r3, [ip, fp]
  101a90:	eafffe17 	b	1012f4 <prog+0x12b0>
  101a94:	e59d1018 	ldr	r1, [sp, #24]
  101a98:	e5d13000 	ldrb	r3, [r1]
  101a9c:	e353006c 	cmp	r3, #108	; 0x6c
  101aa0:	059d2054 	ldreq	r2, [sp, #84]
  101aa4:	159d4054 	ldrne	r4, [sp, #84]
  101aa8:	05f13001 	ldreqb	r3, [r1, #1]!
  101aac:	03822010 	orreq	r2, r2, #16	; 0x10
  101ab0:	13844010 	orrne	r4, r4, #16	; 0x10
  101ab4:	058d1018 	streq	r1, [sp, #24]
  101ab8:	058d2054 	streq	r2, [sp, #84]
  101abc:	158d4054 	strne	r4, [sp, #84]
  101ac0:	eafffd3c 	b	100fb8 <_vfprintf_r+0x1f8>
  101ac4:	e59d3054 	ldr	r3, [sp, #84]
  101ac8:	e3130010 	tst	r3, #16	; 0x10
  101acc:	1a0001df 	bne	102250 <prog+0x220c>
  101ad0:	e59d5054 	ldr	r5, [sp, #84]
  101ad4:	e3150040 	tst	r5, #64	; 0x40
  101ad8:	15993000 	ldrne	r3, [r9]
  101adc:	05993000 	ldreq	r3, [r9]
  101ae0:	12899004 	addne	r9, r9, #4	; 0x4
  101ae4:	02899004 	addeq	r9, r9, #4	; 0x4
  101ae8:	158d9050 	strne	r9, [sp, #80]
  101aec:	058d9050 	streq	r9, [sp, #80]
  101af0:	159dc020 	ldrne	ip, [sp, #32]
  101af4:	059d1020 	ldreq	r1, [sp, #32]
  101af8:	e59d9050 	ldr	r9, [sp, #80]
  101afc:	11c3c0b0 	strneh	ip, [r3]
  101b00:	05831000 	streq	r1, [r3]
  101b04:	eafffd02 	b	100f14 <_vfprintf_r+0x154>
  101b08:	e59d2018 	ldr	r2, [sp, #24]
  101b0c:	e59d4054 	ldr	r4, [sp, #84]
  101b10:	e5d23000 	ldrb	r3, [r2]
  101b14:	e3844008 	orr	r4, r4, #8	; 0x8
  101b18:	e58d4054 	str	r4, [sp, #84]
  101b1c:	eafffd25 	b	100fb8 <_vfprintf_r+0x1f8>
  101b20:	e59d5018 	ldr	r5, [sp, #24]
  101b24:	e59dc054 	ldr	ip, [sp, #84]
  101b28:	e5d53000 	ldrb	r3, [r5]
  101b2c:	e38cc080 	orr	ip, ip, #128	; 0x80
  101b30:	e58dc054 	str	ip, [sp, #84]
  101b34:	eafffd1f 	b	100fb8 <_vfprintf_r+0x1f8>
  101b38:	e3a03000 	mov	r3, #0	; 0x0
  101b3c:	e59d1018 	ldr	r1, [sp, #24]
  101b40:	e0832103 	add	r2, r3, r3, lsl #2
  101b44:	e0872082 	add	r2, r7, r2, lsl #1
  101b48:	e4d17001 	ldrb	r7, [r1], #1
  101b4c:	e2473030 	sub	r3, r7, #48	; 0x30
  101b50:	e3530009 	cmp	r3, #9	; 0x9
  101b54:	e58d1018 	str	r1, [sp, #24]
  101b58:	e2423030 	sub	r3, r2, #48	; 0x30
  101b5c:	9afffff6 	bls	101b3c <prog+0x1af8>
  101b60:	e58d3024 	str	r3, [sp, #36]
  101b64:	eafffd17 	b	100fc8 <_vfprintf_r+0x208>
  101b68:	e59d2018 	ldr	r2, [sp, #24]
  101b6c:	e4d23001 	ldrb	r3, [r2], #1
  101b70:	e353002a 	cmp	r3, #42	; 0x2a
  101b74:	0a000439 	beq	102c60 <prog+0x2c1c>
  101b78:	e1a07003 	mov	r7, r3
  101b7c:	e2433030 	sub	r3, r3, #48	; 0x30
  101b80:	e3530009 	cmp	r3, #9	; 0x9
  101b84:	83a06000 	movhi	r6, #0	; 0x0
  101b88:	8a00000d 	bhi	101bc4 <prog+0x1b80>
  101b8c:	e59d1018 	ldr	r1, [sp, #24]
  101b90:	e3a02000 	mov	r2, #0	; 0x0
  101b94:	e0822102 	add	r2, r2, r2, lsl #2
  101b98:	e0872082 	add	r2, r7, r2, lsl #1
  101b9c:	e5f17001 	ldrb	r7, [r1, #1]!
  101ba0:	e2473030 	sub	r3, r7, #48	; 0x30
  101ba4:	e3530009 	cmp	r3, #9	; 0x9
  101ba8:	e2422030 	sub	r2, r2, #48	; 0x30
  101bac:	9afffff8 	bls	101b94 <prog+0x1b50>
  101bb0:	e3e03000 	mvn	r3, #0	; 0x0
  101bb4:	e1520003 	cmp	r2, r3
  101bb8:	a1a06002 	movge	r6, r2
  101bbc:	b1a06003 	movlt	r6, r3
  101bc0:	e2812001 	add	r2, r1, #1	; 0x1
  101bc4:	e58d2018 	str	r2, [sp, #24]
  101bc8:	eafffcfe 	b	100fc8 <_vfprintf_r+0x208>
  101bcc:	e59d1054 	ldr	r1, [sp, #84]
  101bd0:	e3110002 	tst	r1, #2	; 0x2
  101bd4:	0afffec0 	beq	1016dc <prog+0x1698>
  101bd8:	e3a03030 	mov	r3, #48	; 0x30
  101bdc:	e5cd36ad 	strb	r3, [sp, #1709]
  101be0:	e2855001 	add	r5, r5, #1	; 0x1
  101be4:	e28d3e6a 	add	r3, sp, #1696	; 0x6a0
  101be8:	e2866002 	add	r6, r6, #2	; 0x2
  101bec:	e283300d 	add	r3, r3, #13	; 0xd
  101bf0:	e3a02002 	mov	r2, #2	; 0x2
  101bf4:	e3550007 	cmp	r5, #7	; 0x7
  101bf8:	e5cd76ae 	strb	r7, [sp, #1710]
  101bfc:	e58d6680 	str	r6, [sp, #1664]
  101c00:	e5883000 	str	r3, [r8]
  101c04:	e5882004 	str	r2, [r8, #4]
  101c08:	e58d567c 	str	r5, [sp, #1660]
  101c0c:	dafffeb1 	ble	1016d8 <prog+0x1694>
  101c10:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101c14:	e1a0000a 	mov	r0, sl
  101c18:	e2811008 	add	r1, r1, #8	; 0x8
  101c1c:	ebfffc57 	bl	100d80 <__sprint>
  101c20:	e3500000 	cmp	r0, #0	; 0x0
  101c24:	1afffd53 	bne	101178 <prog+0x1134>
  101c28:	e59d2014 	ldr	r2, [sp, #20]
  101c2c:	e3520080 	cmp	r2, #128	; 0x80
  101c30:	e59d6680 	ldr	r6, [sp, #1664]
  101c34:	e59d567c 	ldr	r5, [sp, #1660]
  101c38:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101c3c:	1afffea9 	bne	1016e8 <prog+0x16a4>
  101c40:	e59d3024 	ldr	r3, [sp, #36]
  101c44:	e59dc03c 	ldr	ip, [sp, #60]
  101c48:	e06c4003 	rsb	r4, ip, r3
  101c4c:	e3540000 	cmp	r4, #0	; 0x0
  101c50:	dafffea4 	ble	1016e8 <prog+0x16a4>
  101c54:	e3540010 	cmp	r4, #16	; 0x10
  101c58:	da00032e 	ble	102918 <prog+0x28d4>
  101c5c:	e59f95b0 	ldr	r9, [pc, #1456]	; 102214 <prog+0x21d0>
  101c60:	ea000002 	b	101c70 <prog+0x1c2c>
  101c64:	e2444010 	sub	r4, r4, #16	; 0x10
  101c68:	e3540010 	cmp	r4, #16	; 0x10
  101c6c:	da000015 	ble	101cc8 <prog+0x1c84>
  101c70:	e2855001 	add	r5, r5, #1	; 0x1
  101c74:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101c78:	e2866010 	add	r6, r6, #16	; 0x10
  101c7c:	e3a03010 	mov	r3, #16	; 0x10
  101c80:	e3550007 	cmp	r5, #7	; 0x7
  101c84:	e5883004 	str	r3, [r8, #4]
  101c88:	e5889000 	str	r9, [r8]
  101c8c:	e1a0000a 	mov	r0, sl
  101c90:	e2811008 	add	r1, r1, #8	; 0x8
  101c94:	e2888008 	add	r8, r8, #8	; 0x8
  101c98:	e58d6680 	str	r6, [sp, #1664]
  101c9c:	e58d567c 	str	r5, [sp, #1660]
  101ca0:	daffffef 	ble	101c64 <prog+0x1c20>
  101ca4:	ebfffc35 	bl	100d80 <__sprint>
  101ca8:	e3500000 	cmp	r0, #0	; 0x0
  101cac:	1afffd31 	bne	101178 <prog+0x1134>
  101cb0:	e2444010 	sub	r4, r4, #16	; 0x10
  101cb4:	e3540010 	cmp	r4, #16	; 0x10
  101cb8:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101cbc:	e59d6680 	ldr	r6, [sp, #1664]
  101cc0:	e59d567c 	ldr	r5, [sp, #1660]
  101cc4:	caffffe9 	bgt	101c70 <prog+0x1c2c>
  101cc8:	e2855001 	add	r5, r5, #1	; 0x1
  101ccc:	e0866004 	add	r6, r6, r4
  101cd0:	e3550007 	cmp	r5, #7	; 0x7
  101cd4:	e5889000 	str	r9, [r8]
  101cd8:	e5884004 	str	r4, [r8, #4]
  101cdc:	e58d6680 	str	r6, [sp, #1664]
  101ce0:	e58d567c 	str	r5, [sp, #1660]
  101ce4:	d2888008 	addle	r8, r8, #8	; 0x8
  101ce8:	dafffe7e 	ble	1016e8 <prog+0x16a4>
  101cec:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101cf0:	e1a0000a 	mov	r0, sl
  101cf4:	e2811008 	add	r1, r1, #8	; 0x8
  101cf8:	ebfffc20 	bl	100d80 <__sprint>
  101cfc:	e3500000 	cmp	r0, #0	; 0x0
  101d00:	1afffd1c 	bne	101178 <prog+0x1134>
  101d04:	e59d6680 	ldr	r6, [sp, #1664]
  101d08:	e59d567c 	ldr	r5, [sp, #1660]
  101d0c:	e28d8e61 	add	r8, sp, #1552	; 0x610
  101d10:	eafffe74 	b	1016e8 <prog+0x16a4>
  101d14:	e2013007 	and	r3, r1, #7	; 0x7
  101d18:	e2833030 	add	r3, r3, #48	; 0x30
  101d1c:	e1b011a1 	movs	r1, r1, lsr #3
  101d20:	e5603001 	strb	r3, [r0, #-1]!
  101d24:	1afffffa 	bne	101d14 <prog+0x1cd0>
  101d28:	e59d5054 	ldr	r5, [sp, #84]
  101d2c:	e3150001 	tst	r5, #1	; 0x1
  101d30:	e58d001c 	str	r0, [sp, #28]
  101d34:	0afffd64 	beq	1012cc <prog+0x1288>
  101d38:	e3530030 	cmp	r3, #48	; 0x30
  101d3c:	11a0c000 	movne	ip, r0
  101d40:	13a03030 	movne	r3, #48	; 0x30
  101d44:	156c3001 	strneb	r3, [ip, #-1]!
  101d48:	158dc01c 	strne	ip, [sp, #28]
  101d4c:	eafffd5e 	b	1012cc <prog+0x1288>
  101d50:	e3570065 	cmp	r7, #101	; 0x65
  101d54:	da000072 	ble	101f24 <prog+0x1ee0>
  101d58:	e28d0048 	add	r0, sp, #72	; 0x48
  101d5c:	e8900003 	ldmia	r0, {r0, r1}
  101d60:	e3a02000 	mov	r2, #0	; 0x0
  101d64:	e3a03000 	mov	r3, #0	; 0x0
  101d68:	eb001908 	bl	108190 <__eqdf2>
  101d6c:	e3500000 	cmp	r0, #0	; 0x0
  101d70:	1a00003a 	bne	101e60 <prog+0x1e1c>
  101d74:	e2855001 	add	r5, r5, #1	; 0x1
  101d78:	e59f3488 	ldr	r3, [pc, #1160]	; 102208 <prog+0x21c4>
  101d7c:	e3550007 	cmp	r5, #7	; 0x7
  101d80:	e2866001 	add	r6, r6, #1	; 0x1
  101d84:	e3a02001 	mov	r2, #1	; 0x1
  101d88:	e5883000 	str	r3, [r8]
  101d8c:	e5882004 	str	r2, [r8, #4]
  101d90:	e58d6680 	str	r6, [sp, #1664]
  101d94:	e58d567c 	str	r5, [sp, #1660]
  101d98:	d288c008 	addle	ip, r8, #8	; 0x8
  101d9c:	ca0001c9 	bgt	1024c8 <prog+0x2484>
  101da0:	e59d36a8 	ldr	r3, [sp, #1704]
  101da4:	e59d4034 	ldr	r4, [sp, #52]
  101da8:	e1530004 	cmp	r3, r4
  101dac:	aa0000f7 	bge	102190 <prog+0x214c>
  101db0:	e59d567c 	ldr	r5, [sp, #1660]
  101db4:	e59d8028 	ldr	r8, [sp, #40]
  101db8:	e2855001 	add	r5, r5, #1	; 0x1
  101dbc:	e3550007 	cmp	r5, #7	; 0x7
  101dc0:	e2866001 	add	r6, r6, #1	; 0x1
  101dc4:	e3a03001 	mov	r3, #1	; 0x1
  101dc8:	e58c3004 	str	r3, [ip, #4]
  101dcc:	e58c8000 	str	r8, [ip]
  101dd0:	e58d6680 	str	r6, [sp, #1664]
  101dd4:	e58d567c 	str	r5, [sp, #1660]
  101dd8:	d28cc008 	addle	ip, ip, #8	; 0x8
  101ddc:	ca0001d1 	bgt	102528 <prog+0x24e4>
  101de0:	e59d1034 	ldr	r1, [sp, #52]
  101de4:	e2414001 	sub	r4, r1, #1	; 0x1
  101de8:	e3540000 	cmp	r4, #0	; 0x0
  101dec:	dafffe7c 	ble	1017e4 <prog+0x17a0>
  101df0:	e3540010 	cmp	r4, #16	; 0x10
  101df4:	da00018f 	ble	102438 <prog+0x23f4>
  101df8:	e59d567c 	ldr	r5, [sp, #1660]
  101dfc:	e59f9410 	ldr	r9, [pc, #1040]	; 102214 <prog+0x21d0>
  101e00:	ea000002 	b	101e10 <prog+0x1dcc>
  101e04:	e2444010 	sub	r4, r4, #16	; 0x10
  101e08:	e3540010 	cmp	r4, #16	; 0x10
  101e0c:	da00018b 	ble	102440 <prog+0x23fc>
  101e10:	e2855001 	add	r5, r5, #1	; 0x1
  101e14:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101e18:	e2866010 	add	r6, r6, #16	; 0x10
  101e1c:	e3a03010 	mov	r3, #16	; 0x10
  101e20:	e3550007 	cmp	r5, #7	; 0x7
  101e24:	e58c3004 	str	r3, [ip, #4]
  101e28:	e58c9000 	str	r9, [ip]
  101e2c:	e1a0000a 	mov	r0, sl
  101e30:	e2811008 	add	r1, r1, #8	; 0x8
  101e34:	e28cc008 	add	ip, ip, #8	; 0x8
  101e38:	e58d6680 	str	r6, [sp, #1664]
  101e3c:	e58d567c 	str	r5, [sp, #1660]
  101e40:	daffffef 	ble	101e04 <prog+0x1dc0>
  101e44:	ebfffbcd 	bl	100d80 <__sprint>
  101e48:	e3500000 	cmp	r0, #0	; 0x0
  101e4c:	1afffcc9 	bne	101178 <prog+0x1134>
  101e50:	e59d6680 	ldr	r6, [sp, #1664]
  101e54:	e59d567c 	ldr	r5, [sp, #1660]
  101e58:	e28dce61 	add	ip, sp, #1552	; 0x610
  101e5c:	eaffffe8 	b	101e04 <prog+0x1dc0>
  101e60:	e59d06a8 	ldr	r0, [sp, #1704]
  101e64:	e3500000 	cmp	r0, #0	; 0x0
  101e68:	da0001bb 	ble	10255c <prog+0x2518>
  101e6c:	e59dc034 	ldr	ip, [sp, #52]
  101e70:	e150000c 	cmp	r0, ip
  101e74:	aa0000fc 	bge	10226c <prog+0x2228>
  101e78:	e2855001 	add	r5, r5, #1	; 0x1
  101e7c:	e59d401c 	ldr	r4, [sp, #28]
  101e80:	e0866000 	add	r6, r6, r0
  101e84:	e3550007 	cmp	r5, #7	; 0x7
  101e88:	e5884000 	str	r4, [r8]
  101e8c:	e5880004 	str	r0, [r8, #4]
  101e90:	e58d6680 	str	r6, [sp, #1664]
  101e94:	e58d567c 	str	r5, [sp, #1660]
  101e98:	d2881008 	addle	r1, r8, #8	; 0x8
  101e9c:	ca000288 	bgt	1028c4 <prog+0x2880>
  101ea0:	e2855001 	add	r5, r5, #1	; 0x1
  101ea4:	e59f3350 	ldr	r3, [pc, #848]	; 1021fc <prog+0x21b8>
  101ea8:	e2866001 	add	r6, r6, #1	; 0x1
  101eac:	e3550007 	cmp	r5, #7	; 0x7
  101eb0:	e3a02001 	mov	r2, #1	; 0x1
  101eb4:	e5813000 	str	r3, [r1]
  101eb8:	e5812004 	str	r2, [r1, #4]
  101ebc:	e58d6680 	str	r6, [sp, #1664]
  101ec0:	e58d567c 	str	r5, [sp, #1660]
  101ec4:	e1a04000 	mov	r4, r0
  101ec8:	d281c008 	addle	ip, r1, #8	; 0x8
  101ecc:	ca000271 	bgt	102898 <prog+0x2854>
  101ed0:	e59d8034 	ldr	r8, [sp, #52]
  101ed4:	e59d101c 	ldr	r1, [sp, #28]
  101ed8:	e0602008 	rsb	r2, r0, r8
  101edc:	e2855001 	add	r5, r5, #1	; 0x1
  101ee0:	e0843001 	add	r3, r4, r1
  101ee4:	e0866002 	add	r6, r6, r2
  101ee8:	e3550007 	cmp	r5, #7	; 0x7
  101eec:	e58c3000 	str	r3, [ip]
  101ef0:	e58c2004 	str	r2, [ip, #4]
  101ef4:	e58d6680 	str	r6, [sp, #1664]
  101ef8:	e58d567c 	str	r5, [sp, #1660]
  101efc:	da000141 	ble	102408 <prog+0x23c4>
  101f00:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101f04:	e1a0000a 	mov	r0, sl
  101f08:	e2811008 	add	r1, r1, #8	; 0x8
  101f0c:	ebfffb9b 	bl	100d80 <__sprint>
  101f10:	e3500000 	cmp	r0, #0	; 0x0
  101f14:	1afffc97 	bne	101178 <prog+0x1134>
  101f18:	e59d6680 	ldr	r6, [sp, #1664]
  101f1c:	e28dce61 	add	ip, sp, #1552	; 0x610
  101f20:	eafffe2f 	b	1017e4 <prog+0x17a0>
  101f24:	e59d2034 	ldr	r2, [sp, #52]
  101f28:	e3520001 	cmp	r2, #1	; 0x1
  101f2c:	da00014d 	ble	102468 <prog+0x2424>
  101f30:	e59d401c 	ldr	r4, [sp, #28]
  101f34:	e5d42000 	ldrb	r2, [r4]
  101f38:	e2855001 	add	r5, r5, #1	; 0x1
  101f3c:	e5cd26ad 	strb	r2, [sp, #1709]
  101f40:	e3a0302e 	mov	r3, #46	; 0x2e
  101f44:	e28d2e6a 	add	r2, sp, #1696	; 0x6a0
  101f48:	e5cd36ae 	strb	r3, [sp, #1710]
  101f4c:	e2866002 	add	r6, r6, #2	; 0x2
  101f50:	e3550007 	cmp	r5, #7	; 0x7
  101f54:	e282200d 	add	r2, r2, #13	; 0xd
  101f58:	e243302c 	sub	r3, r3, #44	; 0x2c
  101f5c:	e888000c 	stmia	r8, {r2, r3}
  101f60:	e58d6680 	str	r6, [sp, #1664]
  101f64:	e58d567c 	str	r5, [sp, #1660]
  101f68:	d2884008 	addle	r4, r8, #8	; 0x8
  101f6c:	ca00007d 	bgt	102168 <prog+0x2124>
  101f70:	e28d0048 	add	r0, sp, #72	; 0x48
  101f74:	e8900003 	ldmia	r0, {r0, r1}
  101f78:	e3a02000 	mov	r2, #0	; 0x0
  101f7c:	e3a03000 	mov	r3, #0	; 0x0
  101f80:	eb0018a4 	bl	108218 <__nedf2>
  101f84:	e3500000 	cmp	r0, #0	; 0x0
  101f88:	0a000038 	beq	102070 <prog+0x202c>
  101f8c:	e59d8034 	ldr	r8, [sp, #52]
  101f90:	e59dc01c 	ldr	ip, [sp, #28]
  101f94:	e2855001 	add	r5, r5, #1	; 0x1
  101f98:	e0883006 	add	r3, r8, r6
  101f9c:	e2436001 	sub	r6, r3, #1	; 0x1
  101fa0:	e28c2001 	add	r2, ip, #1	; 0x1
  101fa4:	e2483001 	sub	r3, r8, #1	; 0x1
  101fa8:	e3550007 	cmp	r5, #7	; 0x7
  101fac:	e884000c 	stmia	r4, {r2, r3}
  101fb0:	e58d6680 	str	r6, [sp, #1664]
  101fb4:	e58d567c 	str	r5, [sp, #1660]
  101fb8:	ca000060 	bgt	102140 <prog+0x20fc>
  101fbc:	e2844008 	add	r4, r4, #8	; 0x8
  101fc0:	e59d3030 	ldr	r3, [sp, #48]
  101fc4:	e2855001 	add	r5, r5, #1	; 0x1
  101fc8:	e0866003 	add	r6, r6, r3
  101fcc:	e59d8030 	ldr	r8, [sp, #48]
  101fd0:	e28d3e69 	add	r3, sp, #1680	; 0x690
  101fd4:	e3550007 	cmp	r5, #7	; 0x7
  101fd8:	e2833005 	add	r3, r3, #5	; 0x5
  101fdc:	e8840108 	stmia	r4, {r3, r8}
  101fe0:	e58d6680 	str	r6, [sp, #1664]
  101fe4:	e58d567c 	str	r5, [sp, #1660]
  101fe8:	d284c008 	addle	ip, r4, #8	; 0x8
  101fec:	dafffdfc 	ble	1017e4 <prog+0x17a0>
  101ff0:	eaffffc2 	b	101f00 <prog+0x1ebc>
  101ff4:	e28d1e67 	add	r1, sp, #1648	; 0x670
  101ff8:	e1a0000a 	mov	r0, sl
  101ffc:	e2811008 	add	r1, r1, #8	; 0x8
  102000:	ebfffb5e 	bl	100d80 <__sprint>
  102004:	e3500000 	cmp	r0, #0	; 0x0
  102008:	1afffc60 	bne	101190 <prog+0x114c>
  10200c:	e28d8e61 	add	r8, sp, #1552	; 0x610
  102010:	eafffbd9 	b	100f7c <_vfprintf_r+0x1bc>
  102014:	e3510009 	cmp	r1, #9	; 0x9
  102018:	928d4e5b 	addls	r4, sp, #1456	; 0x5b0
  10201c:	92844003 	addls	r4, r4, #3	; 0x3
  102020:	958d401c 	strls	r4, [sp, #28]
  102024:	9a00000d 	bls	102060 <prog+0x201c>
  102028:	e28d0e5b 	add	r0, sp, #1456	; 0x5b0
  10202c:	e59fc1c4 	ldr	ip, [pc, #452]	; 1021f8 <prog+0x21b4>
  102030:	e2800004 	add	r0, r0, #4	; 0x4
  102034:	e083219c 	umull	r2, r3, ip, r1
  102038:	e1a031a3 	mov	r3, r3, lsr #3
  10203c:	e0832103 	add	r2, r3, r3, lsl #2
  102040:	e0412082 	sub	r2, r1, r2, lsl #1
  102044:	e2822030 	add	r2, r2, #48	; 0x30
  102048:	e3530009 	cmp	r3, #9	; 0x9
  10204c:	e1a01003 	mov	r1, r3
  102050:	e5602001 	strb	r2, [r0, #-1]!
  102054:	8afffff6 	bhi	102034 <prog+0x1ff0>
  102058:	e2400001 	sub	r0, r0, #1	; 0x1
  10205c:	e58d001c 	str	r0, [sp, #28]
  102060:	e59d401c 	ldr	r4, [sp, #28]
  102064:	e2813030 	add	r3, r1, #48	; 0x30
  102068:	e5c43000 	strb	r3, [r4]
  10206c:	eafffc96 	b	1012cc <prog+0x1288>
  102070:	e59d1034 	ldr	r1, [sp, #52]
  102074:	e2417001 	sub	r7, r1, #1	; 0x1
  102078:	e3570000 	cmp	r7, #0	; 0x0
  10207c:	daffffcf 	ble	101fc0 <prog+0x1f7c>
  102080:	e3570010 	cmp	r7, #16	; 0x10
  102084:	da000024 	ble	10211c <prog+0x20d8>
  102088:	e59f9184 	ldr	r9, [pc, #388]	; 102214 <prog+0x21d0>
  10208c:	ea000002 	b	10209c <prog+0x2058>
  102090:	e2477010 	sub	r7, r7, #16	; 0x10
  102094:	e3570010 	cmp	r7, #16	; 0x10
  102098:	da000020 	ble	102120 <prog+0x20dc>
  10209c:	e2855001 	add	r5, r5, #1	; 0x1
  1020a0:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1020a4:	e2866010 	add	r6, r6, #16	; 0x10
  1020a8:	e3a03010 	mov	r3, #16	; 0x10
  1020ac:	e3550007 	cmp	r5, #7	; 0x7
  1020b0:	e5843004 	str	r3, [r4, #4]
  1020b4:	e5849000 	str	r9, [r4]
  1020b8:	e1a0000a 	mov	r0, sl
  1020bc:	e2811008 	add	r1, r1, #8	; 0x8
  1020c0:	e2844008 	add	r4, r4, #8	; 0x8
  1020c4:	e58d6680 	str	r6, [sp, #1664]
  1020c8:	e58d567c 	str	r5, [sp, #1660]
  1020cc:	daffffef 	ble	102090 <prog+0x204c>
  1020d0:	ebfffb2a 	bl	100d80 <__sprint>
  1020d4:	e3500000 	cmp	r0, #0	; 0x0
  1020d8:	1afffc26 	bne	101178 <prog+0x1134>
  1020dc:	e59d6680 	ldr	r6, [sp, #1664]
  1020e0:	e59d567c 	ldr	r5, [sp, #1660]
  1020e4:	e28d4e61 	add	r4, sp, #1552	; 0x610
  1020e8:	eaffffe8 	b	102090 <prog+0x204c>
  1020ec:	e59d4054 	ldr	r4, [sp, #84]
  1020f0:	e2143040 	ands	r3, r4, #64	; 0x40
  1020f4:	15993000 	ldrne	r3, [r9]
  1020f8:	05991000 	ldreq	r1, [r9]
  1020fc:	11a03803 	movne	r3, r3, lsl #16
  102100:	12899004 	addne	r9, r9, #4	; 0x4
  102104:	02899004 	addeq	r9, r9, #4	; 0x4
  102108:	11a01823 	movne	r1, r3, lsr #16
  10210c:	01a02003 	moveq	r2, r3
  102110:	158d9050 	strne	r9, [sp, #80]
  102114:	058d9050 	streq	r9, [sp, #80]
  102118:	eafffc52 	b	101268 <prog+0x1224>
  10211c:	e59f90f0 	ldr	r9, [pc, #240]	; 102214 <prog+0x21d0>
  102120:	e2855001 	add	r5, r5, #1	; 0x1
  102124:	e0866007 	add	r6, r6, r7
  102128:	e3550007 	cmp	r5, #7	; 0x7
  10212c:	e5849000 	str	r9, [r4]
  102130:	e5847004 	str	r7, [r4, #4]
  102134:	e58d6680 	str	r6, [sp, #1664]
  102138:	e58d567c 	str	r5, [sp, #1660]
  10213c:	daffff9e 	ble	101fbc <prog+0x1f78>
  102140:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102144:	e1a0000a 	mov	r0, sl
  102148:	e2811008 	add	r1, r1, #8	; 0x8
  10214c:	ebfffb0b 	bl	100d80 <__sprint>
  102150:	e3500000 	cmp	r0, #0	; 0x0
  102154:	1afffc07 	bne	101178 <prog+0x1134>
  102158:	e59d6680 	ldr	r6, [sp, #1664]
  10215c:	e59d567c 	ldr	r5, [sp, #1660]
  102160:	e28d4e61 	add	r4, sp, #1552	; 0x610
  102164:	eaffff95 	b	101fc0 <prog+0x1f7c>
  102168:	e28d1e67 	add	r1, sp, #1648	; 0x670
  10216c:	e1a0000a 	mov	r0, sl
  102170:	e2811008 	add	r1, r1, #8	; 0x8
  102174:	ebfffb01 	bl	100d80 <__sprint>
  102178:	e3500000 	cmp	r0, #0	; 0x0
  10217c:	1afffbfd 	bne	101178 <prog+0x1134>
  102180:	e59d6680 	ldr	r6, [sp, #1664]
  102184:	e59d567c 	ldr	r5, [sp, #1660]
  102188:	e28d4e61 	add	r4, sp, #1552	; 0x610
  10218c:	eaffff77 	b	101f70 <prog+0x1f2c>
  102190:	e59d5054 	ldr	r5, [sp, #84]
  102194:	e3150001 	tst	r5, #1	; 0x1
  102198:	0afffd91 	beq	1017e4 <prog+0x17a0>
  10219c:	eaffff03 	b	101db0 <prog+0x1d6c>
  1021a0:	e899000c 	ldmia	r9, {r2, r3}
  1021a4:	e2899008 	add	r9, r9, #8	; 0x8
  1021a8:	e58d2048 	str	r2, [sp, #72]
  1021ac:	e58d304c 	str	r3, [sp, #76]
  1021b0:	e58d9050 	str	r9, [sp, #80]
  1021b4:	eafffd02 	b	1015c4 <prog+0x1580>
  1021b8:	e2833020 	add	r3, r3, #32	; 0x20
  1021bc:	e5cd36af 	strb	r3, [sp, #1711]
  1021c0:	e59d2018 	ldr	r2, [sp, #24]
  1021c4:	e5d23000 	ldrb	r3, [r2]
  1021c8:	eafffb7a 	b	100fb8 <_vfprintf_r+0x1f8>
  1021cc:	e5993000 	ldr	r3, [r9]
  1021d0:	e1a03803 	mov	r3, r3, lsl #16
  1021d4:	e2899004 	add	r9, r9, #4	; 0x4
  1021d8:	e1a01823 	mov	r1, r3, lsr #16
  1021dc:	e3a02001 	mov	r2, #1	; 0x1
  1021e0:	e58d9050 	str	r9, [sp, #80]
  1021e4:	eafffc1f 	b	101268 <prog+0x1224>
  1021e8:	0010b9b0 	ldreqh	fp, [r0], -r0
  1021ec:	0010b99c 	muleqs	r0, ip, r9
  1021f0:	0010b990 	muleqs	r0, r0, r9
  1021f4:	0010b97c 	andeqs	fp, r0, ip, ror r9
  1021f8:	cccccccd 	stcgtl	12, cr12, [ip], {205}
  1021fc:	0010b9d4 	ldreqsb	fp, [r0], -r4
  102200:	0010b9cc 	andeqs	fp, r0, ip, asr #19
  102204:	0010b994 	muleqs	r0, r4, r9
  102208:	0010b9d0 	ldreqsb	fp, [r0], -r0
  10220c:	0010b9d8 	ldreqsb	fp, [r0], -r8
  102210:	0010b6bc 	ldreqh	fp, [r0], -ip
  102214:	0010b6ac 	andeqs	fp, r0, ip, lsr #13
  102218:	0010b998 	muleqs	r0, r8, r9
  10221c:	66666667 	strvsbt	r6, [r6], -r7, ror #12
  102220:	e5993000 	ldr	r3, [r9]
  102224:	e1a03803 	mov	r3, r3, lsl #16
  102228:	e2899004 	add	r9, r9, #4	; 0x4
  10222c:	e1a01843 	mov	r1, r3, asr #16
  102230:	e58d9050 	str	r9, [sp, #80]
  102234:	eafffbe7 	b	1011d8 <prog+0x1194>
  102238:	e5993000 	ldr	r3, [r9]
  10223c:	e1a03803 	mov	r3, r3, lsl #16
  102240:	e2899004 	add	r9, r9, #4	; 0x4
  102244:	e1a01823 	mov	r1, r3, lsr #16
  102248:	e58d9050 	str	r9, [sp, #80]
  10224c:	eafffca5 	b	1014e8 <prog+0x14a4>
  102250:	e5993000 	ldr	r3, [r9]
  102254:	e2899004 	add	r9, r9, #4	; 0x4
  102258:	e58d9050 	str	r9, [sp, #80]
  10225c:	e59d4020 	ldr	r4, [sp, #32]
  102260:	e59d9050 	ldr	r9, [sp, #80]
  102264:	e5834000 	str	r4, [r3]
  102268:	eafffb29 	b	100f14 <_vfprintf_r+0x154>
  10226c:	e2855001 	add	r5, r5, #1	; 0x1
  102270:	e59d101c 	ldr	r1, [sp, #28]
  102274:	e086600c 	add	r6, r6, ip
  102278:	e3550007 	cmp	r5, #7	; 0x7
  10227c:	e8881002 	stmia	r8, {r1, ip}
  102280:	e58d6680 	str	r6, [sp, #1664]
  102284:	e58d567c 	str	r5, [sp, #1660]
  102288:	d288c008 	addle	ip, r8, #8	; 0x8
  10228c:	ca000197 	bgt	1028f0 <prog+0x28ac>
  102290:	e59d2034 	ldr	r2, [sp, #52]
  102294:	e0624000 	rsb	r4, r2, r0
  102298:	e3540000 	cmp	r4, #0	; 0x0
  10229c:	da00004b 	ble	1023d0 <prog+0x238c>
  1022a0:	e3540010 	cmp	r4, #16	; 0x10
  1022a4:	da000036 	ble	102384 <prog+0x2340>
  1022a8:	e59d567c 	ldr	r5, [sp, #1660]
  1022ac:	e51f90a0 	ldr	r9, [pc, #-160]	; 102214 <prog+0x21d0>
  1022b0:	ea000002 	b	1022c0 <prog+0x227c>
  1022b4:	e2444010 	sub	r4, r4, #16	; 0x10
  1022b8:	e3540010 	cmp	r4, #16	; 0x10
  1022bc:	da000032 	ble	10238c <prog+0x2348>
  1022c0:	e2855001 	add	r5, r5, #1	; 0x1
  1022c4:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1022c8:	e2866010 	add	r6, r6, #16	; 0x10
  1022cc:	e3a03010 	mov	r3, #16	; 0x10
  1022d0:	e3550007 	cmp	r5, #7	; 0x7
  1022d4:	e58c3004 	str	r3, [ip, #4]
  1022d8:	e58c9000 	str	r9, [ip]
  1022dc:	e1a0000a 	mov	r0, sl
  1022e0:	e2811008 	add	r1, r1, #8	; 0x8
  1022e4:	e28cc008 	add	ip, ip, #8	; 0x8
  1022e8:	e58d6680 	str	r6, [sp, #1664]
  1022ec:	e58d567c 	str	r5, [sp, #1660]
  1022f0:	daffffef 	ble	1022b4 <prog+0x2270>
  1022f4:	ebfffaa1 	bl	100d80 <__sprint>
  1022f8:	e3500000 	cmp	r0, #0	; 0x0
  1022fc:	1afffb9d 	bne	101178 <prog+0x1134>
  102300:	e59d6680 	ldr	r6, [sp, #1664]
  102304:	e59d567c 	ldr	r5, [sp, #1660]
  102308:	e28dce61 	add	ip, sp, #1552	; 0x610
  10230c:	eaffffe8 	b	1022b4 <prog+0x2270>
  102310:	e5993000 	ldr	r3, [r9]
  102314:	e28d5e45 	add	r5, sp, #1104	; 0x450
  102318:	e2899004 	add	r9, r9, #4	; 0x4
  10231c:	e3a0b001 	mov	fp, #1	; 0x1
  102320:	e2855008 	add	r5, r5, #8	; 0x8
  102324:	e5cd3458 	strb	r3, [sp, #1112]
  102328:	e58d9050 	str	r9, [sp, #80]
  10232c:	eafffc8e 	b	10156c <prog+0x1528>
  102330:	e3560000 	cmp	r6, #0	; 0x0
  102334:	03a06001 	moveq	r6, #1	; 0x1
  102338:	eafffc99 	b	1015a4 <prog+0x1560>
  10233c:	e3560000 	cmp	r6, #0	; 0x0
  102340:	ba000187 	blt	102964 <prog+0x2920>
  102344:	e59d001c 	ldr	r0, [sp, #28]
  102348:	e1a01005 	mov	r1, r5
  10234c:	e1a02006 	mov	r2, r6
  102350:	eb000d43 	bl	105864 <memchr>
  102354:	e3500000 	cmp	r0, #0	; 0x0
  102358:	0a0001f6 	beq	102b38 <prog+0x2af4>
  10235c:	e59d201c 	ldr	r2, [sp, #28]
  102360:	e062b000 	rsb	fp, r2, r0
  102364:	e156000b 	cmp	r6, fp
  102368:	ba00016c 	blt	102920 <prog+0x28dc>
  10236c:	e35b0000 	cmp	fp, #0	; 0x0
  102370:	a1a0300b 	movge	r3, fp
  102374:	b3a03000 	movlt	r3, #0	; 0x0
  102378:	e58d303c 	str	r3, [sp, #60]
  10237c:	e58d5038 	str	r5, [sp, #56]
  102380:	eafffbdb 	b	1012f4 <prog+0x12b0>
  102384:	e59d567c 	ldr	r5, [sp, #1660]
  102388:	e51f917c 	ldr	r9, [pc, #-380]	; 102214 <prog+0x21d0>
  10238c:	e2855001 	add	r5, r5, #1	; 0x1
  102390:	e0866004 	add	r6, r6, r4
  102394:	e3550007 	cmp	r5, #7	; 0x7
  102398:	e58c9000 	str	r9, [ip]
  10239c:	e58c4004 	str	r4, [ip, #4]
  1023a0:	e58d6680 	str	r6, [sp, #1664]
  1023a4:	e58d567c 	str	r5, [sp, #1660]
  1023a8:	d28cc008 	addle	ip, ip, #8	; 0x8
  1023ac:	da000007 	ble	1023d0 <prog+0x238c>
  1023b0:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1023b4:	e1a0000a 	mov	r0, sl
  1023b8:	e2811008 	add	r1, r1, #8	; 0x8
  1023bc:	ebfffa6f 	bl	100d80 <__sprint>
  1023c0:	e3500000 	cmp	r0, #0	; 0x0
  1023c4:	1afffb6b 	bne	101178 <prog+0x1134>
  1023c8:	e59d6680 	ldr	r6, [sp, #1664]
  1023cc:	e28dce61 	add	ip, sp, #1552	; 0x610
  1023d0:	e59d3054 	ldr	r3, [sp, #84]
  1023d4:	e3130001 	tst	r3, #1	; 0x1
  1023d8:	0afffd01 	beq	1017e4 <prog+0x17a0>
  1023dc:	e59d567c 	ldr	r5, [sp, #1660]
  1023e0:	e51f31ec 	ldr	r3, [pc, #-492]	; 1021fc <prog+0x21b8>
  1023e4:	e2855001 	add	r5, r5, #1	; 0x1
  1023e8:	e2866001 	add	r6, r6, #1	; 0x1
  1023ec:	e3a02001 	mov	r2, #1	; 0x1
  1023f0:	e3550007 	cmp	r5, #7	; 0x7
  1023f4:	e58c3000 	str	r3, [ip]
  1023f8:	e58c2004 	str	r2, [ip, #4]
  1023fc:	e58d6680 	str	r6, [sp, #1664]
  102400:	e58d567c 	str	r5, [sp, #1660]
  102404:	cafffebd 	bgt	101f00 <prog+0x1ebc>
  102408:	e28cc008 	add	ip, ip, #8	; 0x8
  10240c:	eafffcf4 	b	1017e4 <prog+0x17a0>
  102410:	e28d0e5b 	add	r0, sp, #1456	; 0x5b0
  102414:	e2800004 	add	r0, r0, #4	; 0x4
  102418:	e59d5040 	ldr	r5, [sp, #64]
  10241c:	e201300f 	and	r3, r1, #15	; 0xf
  102420:	e7d52003 	ldrb	r2, [r5, r3]
  102424:	e1b01221 	movs	r1, r1, lsr #4
  102428:	e5602001 	strb	r2, [r0, #-1]!
  10242c:	1afffff9 	bne	102418 <prog+0x23d4>
  102430:	e58d001c 	str	r0, [sp, #28]
  102434:	eafffba4 	b	1012cc <prog+0x1288>
  102438:	e59d567c 	ldr	r5, [sp, #1660]
  10243c:	e51f9230 	ldr	r9, [pc, #-560]	; 102214 <prog+0x21d0>
  102440:	e2855001 	add	r5, r5, #1	; 0x1
  102444:	e0866004 	add	r6, r6, r4
  102448:	e3550007 	cmp	r5, #7	; 0x7
  10244c:	e58c9000 	str	r9, [ip]
  102450:	e58c4004 	str	r4, [ip, #4]
  102454:	e58d6680 	str	r6, [sp, #1664]
  102458:	e58d567c 	str	r5, [sp, #1660]
  10245c:	cafffea7 	bgt	101f00 <prog+0x1ebc>
  102460:	e28cc008 	add	ip, ip, #8	; 0x8
  102464:	eafffcde 	b	1017e4 <prog+0x17a0>
  102468:	e59d3054 	ldr	r3, [sp, #84]
  10246c:	e3130001 	tst	r3, #1	; 0x1
  102470:	1afffeae 	bne	101f30 <prog+0x1eec>
  102474:	e2855001 	add	r5, r5, #1	; 0x1
  102478:	e59d201c 	ldr	r2, [sp, #28]
  10247c:	e2866001 	add	r6, r6, #1	; 0x1
  102480:	e3550007 	cmp	r5, #7	; 0x7
  102484:	e3a03001 	mov	r3, #1	; 0x1
  102488:	e888000c 	stmia	r8, {r2, r3}
  10248c:	e58d6680 	str	r6, [sp, #1664]
  102490:	e58d567c 	str	r5, [sp, #1660]
  102494:	d2884008 	addle	r4, r8, #8	; 0x8
  102498:	dafffec8 	ble	101fc0 <prog+0x1f7c>
  10249c:	eaffff27 	b	102140 <prog+0x20fc>
  1024a0:	e51f9294 	ldr	r9, [pc, #-660]	; 102214 <prog+0x21d0>
  1024a4:	eafffcb0 	b	10176c <prog+0x1728>
  1024a8:	e3a04003 	mov	r4, #3	; 0x3
  1024ac:	e51f52b4 	ldr	r5, [pc, #-692]	; 102200 <prog+0x21bc>
  1024b0:	e3a0c000 	mov	ip, #0	; 0x0
  1024b4:	e1a0b004 	mov	fp, r4
  1024b8:	e58d403c 	str	r4, [sp, #60]
  1024bc:	e58d501c 	str	r5, [sp, #28]
  1024c0:	e58dc038 	str	ip, [sp, #56]
  1024c4:	eafffb8a 	b	1012f4 <prog+0x12b0>
  1024c8:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1024cc:	e1a0000a 	mov	r0, sl
  1024d0:	e2811008 	add	r1, r1, #8	; 0x8
  1024d4:	ebfffa29 	bl	100d80 <__sprint>
  1024d8:	e3500000 	cmp	r0, #0	; 0x0
  1024dc:	1afffb25 	bne	101178 <prog+0x1134>
  1024e0:	e59d6680 	ldr	r6, [sp, #1664]
  1024e4:	e28dce61 	add	ip, sp, #1552	; 0x610
  1024e8:	eafffe2c 	b	101da0 <prog+0x1d5c>
  1024ec:	e28d0048 	add	r0, sp, #72	; 0x48
  1024f0:	e8900003 	ldmia	r0, {r0, r1}
  1024f4:	eb0011e3 	bl	106c88 <isnan>
  1024f8:	e3500000 	cmp	r0, #0	; 0x0
  1024fc:	0a000059 	beq	102668 <prog+0x2624>
  102500:	e2473045 	sub	r3, r7, #69	; 0x45
  102504:	e3530002 	cmp	r3, #2	; 0x2
  102508:	8a00011e 	bhi	102988 <prog+0x2944>
  10250c:	e3a0c003 	mov	ip, #3	; 0x3
  102510:	e51f1314 	ldr	r1, [pc, #-788]	; 102204 <prog+0x21c0>
  102514:	e1a0b00c 	mov	fp, ip
  102518:	e58dc03c 	str	ip, [sp, #60]
  10251c:	e58d101c 	str	r1, [sp, #28]
  102520:	e58d4038 	str	r4, [sp, #56]
  102524:	eafffb72 	b	1012f4 <prog+0x12b0>
  102528:	e28d1e67 	add	r1, sp, #1648	; 0x670
  10252c:	e1a0000a 	mov	r0, sl
  102530:	e2811008 	add	r1, r1, #8	; 0x8
  102534:	ebfffa11 	bl	100d80 <__sprint>
  102538:	e3500000 	cmp	r0, #0	; 0x0
  10253c:	1afffb0d 	bne	101178 <prog+0x1134>
  102540:	e59d6680 	ldr	r6, [sp, #1664]
  102544:	e28dce61 	add	ip, sp, #1552	; 0x610
  102548:	eafffe24 	b	101de0 <prog+0x1d9c>
  10254c:	e59d6680 	ldr	r6, [sp, #1664]
  102550:	e59d567c 	ldr	r5, [sp, #1660]
  102554:	e51f934c 	ldr	r9, [pc, #-844]	; 102210 <prog+0x21cc>
  102558:	eafffb93 	b	1013ac <prog+0x1368>
  10255c:	e2855001 	add	r5, r5, #1	; 0x1
  102560:	e51f3360 	ldr	r3, [pc, #-864]	; 102208 <prog+0x21c4>
  102564:	e3550007 	cmp	r5, #7	; 0x7
  102568:	e2866001 	add	r6, r6, #1	; 0x1
  10256c:	e3a02001 	mov	r2, #1	; 0x1
  102570:	e5883000 	str	r3, [r8]
  102574:	e5882004 	str	r2, [r8, #4]
  102578:	e58d6680 	str	r6, [sp, #1664]
  10257c:	e58d567c 	str	r5, [sp, #1660]
  102580:	d288c008 	addle	ip, r8, #8	; 0x8
  102584:	ca0000ec 	bgt	10293c <prog+0x28f8>
  102588:	e3500000 	cmp	r0, #0	; 0x0
  10258c:	1a000002 	bne	10259c <prog+0x2558>
  102590:	e59d2034 	ldr	r2, [sp, #52]
  102594:	e3520000 	cmp	r2, #0	; 0x0
  102598:	0afffc91 	beq	1017e4 <prog+0x17a0>
  10259c:	e59d567c 	ldr	r5, [sp, #1660]
  1025a0:	e3a03001 	mov	r3, #1	; 0x1
  1025a4:	e2855001 	add	r5, r5, #1	; 0x1
  1025a8:	e58c3004 	str	r3, [ip, #4]
  1025ac:	e59d3028 	ldr	r3, [sp, #40]
  1025b0:	e2866001 	add	r6, r6, #1	; 0x1
  1025b4:	e3550007 	cmp	r5, #7	; 0x7
  1025b8:	e58c3000 	str	r3, [ip]
  1025bc:	e58d6680 	str	r6, [sp, #1664]
  1025c0:	e58d567c 	str	r5, [sp, #1660]
  1025c4:	d28c2008 	addle	r2, ip, #8	; 0x8
  1025c8:	ca00014f 	bgt	102b0c <prog+0x2ac8>
  1025cc:	e2604000 	rsb	r4, r0, #0	; 0x0
  1025d0:	e3540000 	cmp	r4, #0	; 0x0
  1025d4:	da0000a3 	ble	102868 <prog+0x2824>
  1025d8:	e3540010 	cmp	r4, #16	; 0x10
  1025dc:	da00008e 	ble	10281c <prog+0x27d8>
  1025e0:	e51f93d4 	ldr	r9, [pc, #-980]	; 102214 <prog+0x21d0>
  1025e4:	ea000002 	b	1025f4 <prog+0x25b0>
  1025e8:	e2444010 	sub	r4, r4, #16	; 0x10
  1025ec:	e3540010 	cmp	r4, #16	; 0x10
  1025f0:	da00008a 	ble	102820 <prog+0x27dc>
  1025f4:	e2855001 	add	r5, r5, #1	; 0x1
  1025f8:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1025fc:	e2866010 	add	r6, r6, #16	; 0x10
  102600:	e3a03010 	mov	r3, #16	; 0x10
  102604:	e3550007 	cmp	r5, #7	; 0x7
  102608:	e5823004 	str	r3, [r2, #4]
  10260c:	e5829000 	str	r9, [r2]
  102610:	e1a0000a 	mov	r0, sl
  102614:	e2811008 	add	r1, r1, #8	; 0x8
  102618:	e2822008 	add	r2, r2, #8	; 0x8
  10261c:	e58d6680 	str	r6, [sp, #1664]
  102620:	e58d567c 	str	r5, [sp, #1660]
  102624:	daffffef 	ble	1025e8 <prog+0x25a4>
  102628:	ebfff9d4 	bl	100d80 <__sprint>
  10262c:	e3500000 	cmp	r0, #0	; 0x0
  102630:	1afffad0 	bne	101178 <prog+0x1134>
  102634:	e59d6680 	ldr	r6, [sp, #1664]
  102638:	e59d567c 	ldr	r5, [sp, #1660]
  10263c:	e28d2e61 	add	r2, sp, #1552	; 0x610
  102640:	eaffffe8 	b	1025e8 <prog+0x25a4>
  102644:	e3a03006 	mov	r3, #6	; 0x6
  102648:	e51f4444 	ldr	r4, [pc, #-1092]	; 10220c <prog+0x21c8>
  10264c:	e1a0b003 	mov	fp, r3
  102650:	e58d303c 	str	r3, [sp, #60]
  102654:	e58d401c 	str	r4, [sp, #28]
  102658:	eafffc03 	b	10166c <prog+0x1628>
  10265c:	e59d567c 	ldr	r5, [sp, #1660]
  102660:	e51f9458 	ldr	r9, [pc, #-1112]	; 102210 <prog+0x21cc>
  102664:	eafffc84 	b	10187c <prog+0x1838>
  102668:	e59d4054 	ldr	r4, [sp, #84]
  10266c:	e3570066 	cmp	r7, #102	; 0x66
  102670:	e3844c01 	orr	r4, r4, #256	; 0x100
  102674:	e58d4054 	str	r4, [sp, #84]
  102678:	01a0b006 	moveq	fp, r6
  10267c:	03a02003 	moveq	r2, #3	; 0x3
  102680:	0a000005 	beq	10269c <prog+0x2658>
  102684:	e3570045 	cmp	r7, #69	; 0x45
  102688:	13570065 	cmpne	r7, #101	; 0x65
  10268c:	11a0b006 	movne	fp, r6
  102690:	13a02002 	movne	r2, #2	; 0x2
  102694:	0286b001 	addeq	fp, r6, #1	; 0x1
  102698:	03a02002 	moveq	r2, #2	; 0x2
  10269c:	e28d3048 	add	r3, sp, #72	; 0x48
  1026a0:	e8930018 	ldmia	r3, {r3, r4}
  1026a4:	e3530000 	cmp	r3, #0	; 0x0
  1026a8:	a3a0c000 	movge	ip, #0	; 0x0
  1026ac:	b3a0c02d 	movlt	ip, #45	; 0x2d
  1026b0:	b59d1048 	ldrlt	r1, [sp, #72]
  1026b4:	b59d304c 	ldrlt	r3, [sp, #76]
  1026b8:	a58dc02c 	strge	ip, [sp, #44]
  1026bc:	b58dc02c 	strlt	ip, [sp, #44]
  1026c0:	e28dce6a 	add	ip, sp, #1696	; 0x6a0
  1026c4:	e28cc008 	add	ip, ip, #8	; 0x8
  1026c8:	a1a05004 	movge	r5, r4
  1026cc:	b1a05003 	movlt	r5, r3
  1026d0:	a1a04003 	movge	r4, r3
  1026d4:	b2814102 	addlt	r4, r1, #-2147483648	; 0x80000000
  1026d8:	e58dc004 	str	ip, [sp, #4]
  1026dc:	e28dce69 	add	ip, sp, #1680	; 0x690
  1026e0:	e1a03002 	mov	r3, r2
  1026e4:	e28dee6a 	add	lr, sp, #1696	; 0x6a0
  1026e8:	e28cc00c 	add	ip, ip, #12	; 0xc
  1026ec:	e59d0010 	ldr	r0, [sp, #16]
  1026f0:	e1a01004 	mov	r1, r4
  1026f4:	e1a02005 	mov	r2, r5
  1026f8:	e58de008 	str	lr, [sp, #8]
  1026fc:	e58dc00c 	str	ip, [sp, #12]
  102700:	e58db000 	str	fp, [sp]
  102704:	eb0003c5 	bl	103620 <_dtoa_r>
  102708:	e3570067 	cmp	r7, #103	; 0x67
  10270c:	13570047 	cmpne	r7, #71	; 0x47
  102710:	e58d001c 	str	r0, [sp, #28]
  102714:	1a000003 	bne	102728 <prog+0x26e4>
  102718:	e59d1054 	ldr	r1, [sp, #84]
  10271c:	e3110001 	tst	r1, #1	; 0x1
  102720:	059d269c 	ldreq	r2, [sp, #1692]
  102724:	0a000019 	beq	102790 <prog+0x274c>
  102728:	e59d201c 	ldr	r2, [sp, #28]
  10272c:	e3570066 	cmp	r7, #102	; 0x66
  102730:	e082900b 	add	r9, r2, fp
  102734:	0a00012d 	beq	102bf0 <prog+0x2bac>
  102738:	e3a02000 	mov	r2, #0	; 0x0
  10273c:	e1a00004 	mov	r0, r4
  102740:	e1a01005 	mov	r1, r5
  102744:	e3a03000 	mov	r3, #0	; 0x0
  102748:	eb001690 	bl	108190 <__eqdf2>
  10274c:	e3500000 	cmp	r0, #0	; 0x0
  102750:	01a02009 	moveq	r2, r9
  102754:	058d269c 	streq	r2, [sp, #1692]
  102758:	0a00000c 	beq	102790 <prog+0x274c>
  10275c:	e59d269c 	ldr	r2, [sp, #1692]
  102760:	e1590002 	cmp	r9, r2
  102764:	9a000009 	bls	102790 <prog+0x274c>
  102768:	e0623009 	rsb	r3, r2, r9
  10276c:	e0833002 	add	r3, r3, r2
  102770:	e2821001 	add	r1, r2, #1	; 0x1
  102774:	e3a00030 	mov	r0, #48	; 0x30
  102778:	e1510003 	cmp	r1, r3
  10277c:	e5410001 	strb	r0, [r1, #-1]
  102780:	e1a02001 	mov	r2, r1
  102784:	e58d169c 	str	r1, [sp, #1692]
  102788:	e2811001 	add	r1, r1, #1	; 0x1
  10278c:	1afffff9 	bne	102778 <prog+0x2734>
  102790:	e59d401c 	ldr	r4, [sp, #28]
  102794:	e3570067 	cmp	r7, #103	; 0x67
  102798:	13a03000 	movne	r3, #0	; 0x0
  10279c:	03a03001 	moveq	r3, #1	; 0x1
  1027a0:	e3570067 	cmp	r7, #103	; 0x67
  1027a4:	13570047 	cmpne	r7, #71	; 0x47
  1027a8:	e0645002 	rsb	r5, r4, r2
  1027ac:	1a000082 	bne	1029bc <prog+0x2978>
  1027b0:	e59d06a8 	ldr	r0, [sp, #1704]
  1027b4:	e3700004 	cmn	r0, #4	; 0x4
  1027b8:	da0000bd 	ble	102ab4 <prog+0x2a70>
  1027bc:	e1560000 	cmp	r6, r0
  1027c0:	a3a07067 	movge	r7, #103	; 0x67
  1027c4:	ba0000ba 	blt	102ab4 <prog+0x2a70>
  1027c8:	e1550000 	cmp	r5, r0
  1027cc:	e1a0b000 	mov	fp, r0
  1027d0:	ca0000fd 	bgt	102bcc <prog+0x2b88>
  1027d4:	e59d1054 	ldr	r1, [sp, #84]
  1027d8:	e3110001 	tst	r1, #1	; 0x1
  1027dc:	1280b001 	addne	fp, r0, #1	; 0x1
  1027e0:	1a0000f4 	bne	102bb8 <prog+0x2b74>
  1027e4:	e35b0000 	cmp	fp, #0	; 0x0
  1027e8:	a1a0200b 	movge	r2, fp
  1027ec:	b3a02000 	movlt	r2, #0	; 0x0
  1027f0:	e58d203c 	str	r2, [sp, #60]
  1027f4:	e59dc02c 	ldr	ip, [sp, #44]
  1027f8:	e35c0000 	cmp	ip, #0	; 0x0
  1027fc:	1a000068 	bne	1029a4 <prog+0x2960>
  102800:	e35b0000 	cmp	fp, #0	; 0x0
  102804:	a1a0100b 	movge	r1, fp
  102808:	b3a01000 	movlt	r1, #0	; 0x0
  10280c:	e58d103c 	str	r1, [sp, #60]
  102810:	e58d5034 	str	r5, [sp, #52]
  102814:	e58dc038 	str	ip, [sp, #56]
  102818:	eafffab5 	b	1012f4 <prog+0x12b0>
  10281c:	e51f9610 	ldr	r9, [pc, #-1552]	; 102214 <prog+0x21d0>
  102820:	e2855001 	add	r5, r5, #1	; 0x1
  102824:	e0866004 	add	r6, r6, r4
  102828:	e3550007 	cmp	r5, #7	; 0x7
  10282c:	e5829000 	str	r9, [r2]
  102830:	e5824004 	str	r4, [r2, #4]
  102834:	e58d6680 	str	r6, [sp, #1664]
  102838:	e58d567c 	str	r5, [sp, #1660]
  10283c:	d2822008 	addle	r2, r2, #8	; 0x8
  102840:	da000008 	ble	102868 <prog+0x2824>
  102844:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102848:	e1a0000a 	mov	r0, sl
  10284c:	e2811008 	add	r1, r1, #8	; 0x8
  102850:	ebfff94a 	bl	100d80 <__sprint>
  102854:	e3500000 	cmp	r0, #0	; 0x0
  102858:	1afffa46 	bne	101178 <prog+0x1134>
  10285c:	e59d6680 	ldr	r6, [sp, #1664]
  102860:	e59d567c 	ldr	r5, [sp, #1660]
  102864:	e28d2e61 	add	r2, sp, #1552	; 0x610
  102868:	e59d4034 	ldr	r4, [sp, #52]
  10286c:	e2855001 	add	r5, r5, #1	; 0x1
  102870:	e59d801c 	ldr	r8, [sp, #28]
  102874:	e3550007 	cmp	r5, #7	; 0x7
  102878:	e0866004 	add	r6, r6, r4
  10287c:	e5828000 	str	r8, [r2]
  102880:	e5824004 	str	r4, [r2, #4]
  102884:	e58d6680 	str	r6, [sp, #1664]
  102888:	e58d567c 	str	r5, [sp, #1660]
  10288c:	d282c008 	addle	ip, r2, #8	; 0x8
  102890:	dafffbd3 	ble	1017e4 <prog+0x17a0>
  102894:	eafffd99 	b	101f00 <prog+0x1ebc>
  102898:	e28d1e67 	add	r1, sp, #1648	; 0x670
  10289c:	e1a0000a 	mov	r0, sl
  1028a0:	e2811008 	add	r1, r1, #8	; 0x8
  1028a4:	ebfff935 	bl	100d80 <__sprint>
  1028a8:	e3500000 	cmp	r0, #0	; 0x0
  1028ac:	1afffa31 	bne	101178 <prog+0x1134>
  1028b0:	e59d6680 	ldr	r6, [sp, #1664]
  1028b4:	e59d567c 	ldr	r5, [sp, #1660]
  1028b8:	e59d06a8 	ldr	r0, [sp, #1704]
  1028bc:	e28dce61 	add	ip, sp, #1552	; 0x610
  1028c0:	eafffd82 	b	101ed0 <prog+0x1e8c>
  1028c4:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1028c8:	e1a0000a 	mov	r0, sl
  1028cc:	e2811008 	add	r1, r1, #8	; 0x8
  1028d0:	ebfff92a 	bl	100d80 <__sprint>
  1028d4:	e3500000 	cmp	r0, #0	; 0x0
  1028d8:	1afffa26 	bne	101178 <prog+0x1134>
  1028dc:	e59d6680 	ldr	r6, [sp, #1664]
  1028e0:	e59d567c 	ldr	r5, [sp, #1660]
  1028e4:	e59d06a8 	ldr	r0, [sp, #1704]
  1028e8:	e28d1e61 	add	r1, sp, #1552	; 0x610
  1028ec:	eafffd6b 	b	101ea0 <prog+0x1e5c>
  1028f0:	e28d1e67 	add	r1, sp, #1648	; 0x670
  1028f4:	e1a0000a 	mov	r0, sl
  1028f8:	e2811008 	add	r1, r1, #8	; 0x8
  1028fc:	ebfff91f 	bl	100d80 <__sprint>
  102900:	e3500000 	cmp	r0, #0	; 0x0
  102904:	1afffa1b 	bne	101178 <prog+0x1134>
  102908:	e59d6680 	ldr	r6, [sp, #1664]
  10290c:	e59d06a8 	ldr	r0, [sp, #1704]
  102910:	e28dce61 	add	ip, sp, #1552	; 0x610
  102914:	eafffe5d 	b	102290 <prog+0x224c>
  102918:	e51f970c 	ldr	r9, [pc, #-1804]	; 102214 <prog+0x21d0>
  10291c:	eafffce9 	b	101cc8 <prog+0x1c84>
  102920:	e3560000 	cmp	r6, #0	; 0x0
  102924:	a1a04006 	movge	r4, r6
  102928:	b3a04000 	movlt	r4, #0	; 0x0
  10292c:	e1a0b006 	mov	fp, r6
  102930:	e58d403c 	str	r4, [sp, #60]
  102934:	e58d5038 	str	r5, [sp, #56]
  102938:	eafffa6d 	b	1012f4 <prog+0x12b0>
  10293c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102940:	e1a0000a 	mov	r0, sl
  102944:	e2811008 	add	r1, r1, #8	; 0x8
  102948:	ebfff90c 	bl	100d80 <__sprint>
  10294c:	e3500000 	cmp	r0, #0	; 0x0
  102950:	1afffa08 	bne	101178 <prog+0x1134>
  102954:	e59d6680 	ldr	r6, [sp, #1664]
  102958:	e59d06a8 	ldr	r0, [sp, #1704]
  10295c:	e28dce61 	add	ip, sp, #1552	; 0x610
  102960:	eaffff08 	b	102588 <prog+0x2544>
  102964:	e59d001c 	ldr	r0, [sp, #28]
  102968:	ebfff89b 	bl	100bdc <strlen>
  10296c:	e3500000 	cmp	r0, #0	; 0x0
  102970:	a1a0c000 	movge	ip, r0
  102974:	b3a0c000 	movlt	ip, #0	; 0x0
  102978:	e1a0b000 	mov	fp, r0
  10297c:	e58dc03c 	str	ip, [sp, #60]
  102980:	e58d5038 	str	r5, [sp, #56]
  102984:	eafffa5a 	b	1012f4 <prog+0x12b0>
  102988:	e3a02003 	mov	r2, #3	; 0x3
  10298c:	e51f377c 	ldr	r3, [pc, #-1916]	; 102218 <prog+0x21d4>
  102990:	e1a0b002 	mov	fp, r2
  102994:	e58d203c 	str	r2, [sp, #60]
  102998:	e58d301c 	str	r3, [sp, #28]
  10299c:	e58d4038 	str	r4, [sp, #56]
  1029a0:	eafffa53 	b	1012f4 <prog+0x12b0>
  1029a4:	e3a02000 	mov	r2, #0	; 0x0
  1029a8:	e3a0302d 	mov	r3, #45	; 0x2d
  1029ac:	e58d5034 	str	r5, [sp, #52]
  1029b0:	e58d2038 	str	r2, [sp, #56]
  1029b4:	e5cd36af 	strb	r3, [sp, #1711]
  1029b8:	eafffa50 	b	101300 <prog+0x12bc>
  1029bc:	e3570065 	cmp	r7, #101	; 0x65
  1029c0:	ca000069 	bgt	102b6c <prog+0x2b28>
  1029c4:	e59d06a8 	ldr	r0, [sp, #1704]
  1029c8:	e20730ff 	and	r3, r7, #255	; 0xff
  1029cc:	e2400001 	sub	r0, r0, #1	; 0x1
  1029d0:	e3500000 	cmp	r0, #0	; 0x0
  1029d4:	e5cd3695 	strb	r3, [sp, #1685]
  1029d8:	e1a0c000 	mov	ip, r0
  1029dc:	b3a0302d 	movlt	r3, #45	; 0x2d
  1029e0:	a3a0302b 	movge	r3, #43	; 0x2b
  1029e4:	b260c000 	rsblt	ip, r0, #0	; 0x0
  1029e8:	b5cd3696 	strltb	r3, [sp, #1686]
  1029ec:	a5cd3696 	strgeb	r3, [sp, #1686]
  1029f0:	e35c0009 	cmp	ip, #9	; 0x9
  1029f4:	d28c2030 	addle	r2, ip, #48	; 0x30
  1029f8:	d5cd2698 	strleb	r2, [sp, #1688]
  1029fc:	d3a03030 	movle	r3, #48	; 0x30
  102a00:	d28d2e69 	addle	r2, sp, #1680	; 0x690
  102a04:	e58d06a8 	str	r0, [sp, #1704]
  102a08:	d5cd3697 	strleb	r3, [sp, #1687]
  102a0c:	d2822009 	addle	r2, r2, #9	; 0x9
  102a10:	da00001a 	ble	102a80 <prog+0x2a3c>
  102a14:	e28d4e67 	add	r4, sp, #1648	; 0x670
  102a18:	e2844008 	add	r4, r4, #8	; 0x8
  102a1c:	e51f0808 	ldr	r0, [pc, #-2056]	; 10221c <prog+0x21d8>
  102a20:	e1a0e004 	mov	lr, r4
  102a24:	e0c31c90 	smull	r1, r3, r0, ip
  102a28:	e1a02fcc 	mov	r2, ip, asr #31
  102a2c:	e0622143 	rsb	r2, r2, r3, asr #2
  102a30:	e0821102 	add	r1, r2, r2, lsl #2
  102a34:	e04c1081 	sub	r1, ip, r1, lsl #1
  102a38:	e2811030 	add	r1, r1, #48	; 0x30
  102a3c:	e3520009 	cmp	r2, #9	; 0x9
  102a40:	e1a0c002 	mov	ip, r2
  102a44:	e56e1001 	strb	r1, [lr, #-1]!
  102a48:	cafffff5 	bgt	102a24 <prog+0x29e0>
  102a4c:	e24e0001 	sub	r0, lr, #1	; 0x1
  102a50:	e1500004 	cmp	r0, r4
  102a54:	e2823030 	add	r3, r2, #48	; 0x30
  102a58:	228d2e69 	addcs	r2, sp, #1680	; 0x690
  102a5c:	e54e3001 	strb	r3, [lr, #-1]
  102a60:	22822007 	addcs	r2, r2, #7	; 0x7
  102a64:	2a000005 	bcs	102a80 <prog+0x2a3c>
  102a68:	e28d2e69 	add	r2, sp, #1680	; 0x690
  102a6c:	e2822007 	add	r2, r2, #7	; 0x7
  102a70:	e4d03001 	ldrb	r3, [r0], #1
  102a74:	e1500004 	cmp	r0, r4
  102a78:	e4c23001 	strb	r3, [r2], #1
  102a7c:	3afffffb 	bcc	102a70 <prog+0x2a2c>
  102a80:	e28d3e69 	add	r3, sp, #1680	; 0x690
  102a84:	e2833005 	add	r3, r3, #5	; 0x5
  102a88:	e0632002 	rsb	r2, r3, r2
  102a8c:	e3550001 	cmp	r5, #1	; 0x1
  102a90:	e58d2030 	str	r2, [sp, #48]
  102a94:	e085b002 	add	fp, r5, r2
  102a98:	da000043 	ble	102bac <prog+0x2b68>
  102a9c:	e28bb001 	add	fp, fp, #1	; 0x1
  102aa0:	e35b0000 	cmp	fp, #0	; 0x0
  102aa4:	a1a0400b 	movge	r4, fp
  102aa8:	b3a04000 	movlt	r4, #0	; 0x0
  102aac:	e58d403c 	str	r4, [sp, #60]
  102ab0:	eaffff4f 	b	1027f4 <prog+0x27b0>
  102ab4:	e3530000 	cmp	r3, #0	; 0x0
  102ab8:	13a03065 	movne	r3, #101	; 0x65
  102abc:	11a07003 	movne	r7, r3
  102ac0:	03a03045 	moveq	r3, #69	; 0x45
  102ac4:	01a07003 	moveq	r7, r3
  102ac8:	eaffffbf 	b	1029cc <prog+0x2988>
  102acc:	e3a01000 	mov	r1, #0	; 0x0
  102ad0:	e28d2e6a 	add	r2, sp, #1696	; 0x6a0
  102ad4:	e59d0010 	ldr	r0, [sp, #16]
  102ad8:	e2822004 	add	r2, r2, #4	; 0x4
  102adc:	e1a03001 	mov	r3, r1
  102ae0:	e58d9000 	str	r9, [sp]
  102ae4:	eb0000a7 	bl	102d88 <_wcsrtombs_r>
  102ae8:	e3700001 	cmn	r0, #1	; 0x1
  102aec:	e1a0b000 	mov	fp, r0
  102af0:	159d401c 	ldrne	r4, [sp, #28]
  102af4:	158d46a4 	strne	r4, [sp, #1700]
  102af8:	1afffbc4 	bne	101a10 <prog+0x19cc>
  102afc:	e1da30bc 	ldrh	r3, [sl, #12]
  102b00:	e3833040 	orr	r3, r3, #64	; 0x40
  102b04:	e1ca30bc 	strh	r3, [sl, #12]
  102b08:	eafff9a0 	b	101190 <prog+0x114c>
  102b0c:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102b10:	e1a0000a 	mov	r0, sl
  102b14:	e2811008 	add	r1, r1, #8	; 0x8
  102b18:	ebfff898 	bl	100d80 <__sprint>
  102b1c:	e3500000 	cmp	r0, #0	; 0x0
  102b20:	1afff994 	bne	101178 <prog+0x1134>
  102b24:	e59d6680 	ldr	r6, [sp, #1664]
  102b28:	e59d567c 	ldr	r5, [sp, #1660]
  102b2c:	e59d06a8 	ldr	r0, [sp, #1704]
  102b30:	e28d2e61 	add	r2, sp, #1552	; 0x610
  102b34:	eafffea4 	b	1025cc <prog+0x2588>
  102b38:	e3560000 	cmp	r6, #0	; 0x0
  102b3c:	a1a01006 	movge	r1, r6
  102b40:	b3a01000 	movlt	r1, #0	; 0x0
  102b44:	e1a0b006 	mov	fp, r6
  102b48:	e58d103c 	str	r1, [sp, #60]
  102b4c:	e58d0038 	str	r0, [sp, #56]
  102b50:	eafff9e7 	b	1012f4 <prog+0x12b0>
  102b54:	e59d3680 	ldr	r3, [sp, #1664]
  102b58:	e3530000 	cmp	r3, #0	; 0x0
  102b5c:	1a000031 	bne	102c28 <prog+0x2be4>
  102b60:	e3a03000 	mov	r3, #0	; 0x0
  102b64:	e58d367c 	str	r3, [sp, #1660]
  102b68:	eafff988 	b	101190 <prog+0x114c>
  102b6c:	e3570066 	cmp	r7, #102	; 0x66
  102b70:	159d06a8 	ldrne	r0, [sp, #1704]
  102b74:	1affff13 	bne	1027c8 <prog+0x2784>
  102b78:	e59db6a8 	ldr	fp, [sp, #1704]
  102b7c:	e35b0000 	cmp	fp, #0	; 0x0
  102b80:	da00003e 	ble	102c80 <prog+0x2c3c>
  102b84:	e3560000 	cmp	r6, #0	; 0x0
  102b88:	1a00002d 	bne	102c44 <prog+0x2c00>
  102b8c:	e59dc054 	ldr	ip, [sp, #84]
  102b90:	e31c0001 	tst	ip, #1	; 0x1
  102b94:	1a00002a 	bne	102c44 <prog+0x2c00>
  102b98:	e35b0000 	cmp	fp, #0	; 0x0
  102b9c:	a1a0100b 	movge	r1, fp
  102ba0:	b3a01000 	movlt	r1, #0	; 0x0
  102ba4:	e58d103c 	str	r1, [sp, #60]
  102ba8:	eaffff11 	b	1027f4 <prog+0x27b0>
  102bac:	e59d2054 	ldr	r2, [sp, #84]
  102bb0:	e3120001 	tst	r2, #1	; 0x1
  102bb4:	1affffb8 	bne	102a9c <prog+0x2a58>
  102bb8:	e35b0000 	cmp	fp, #0	; 0x0
  102bbc:	a1a0300b 	movge	r3, fp
  102bc0:	b3a03000 	movlt	r3, #0	; 0x0
  102bc4:	e58d303c 	str	r3, [sp, #60]
  102bc8:	eaffff09 	b	1027f4 <prog+0x27b0>
  102bcc:	e3500000 	cmp	r0, #0	; 0x0
  102bd0:	c3a00001 	movgt	r0, #1	; 0x1
  102bd4:	d26b0002 	rsble	r0, fp, #2	; 0x2
  102bd8:	e080b005 	add	fp, r0, r5
  102bdc:	e35b0000 	cmp	fp, #0	; 0x0
  102be0:	a1a0400b 	movge	r4, fp
  102be4:	b3a04000 	movlt	r4, #0	; 0x0
  102be8:	e58d403c 	str	r4, [sp, #60]
  102bec:	eaffff00 	b	1027f4 <prog+0x27b0>
  102bf0:	e5d23000 	ldrb	r3, [r2]
  102bf4:	e3530030 	cmp	r3, #48	; 0x30
  102bf8:	1a000007 	bne	102c1c <prog+0x2bd8>
  102bfc:	e1a00004 	mov	r0, r4
  102c00:	e1a01005 	mov	r1, r5
  102c04:	e3a02000 	mov	r2, #0	; 0x0
  102c08:	e3a03000 	mov	r3, #0	; 0x0
  102c0c:	eb001581 	bl	108218 <__nedf2>
  102c10:	e3500000 	cmp	r0, #0	; 0x0
  102c14:	126b0001 	rsbne	r0, fp, #1	; 0x1
  102c18:	158d06a8 	strne	r0, [sp, #1704]
  102c1c:	e59d06a8 	ldr	r0, [sp, #1704]
  102c20:	e0899000 	add	r9, r9, r0
  102c24:	eafffec3 	b	102738 <prog+0x26f4>
  102c28:	e28d1e67 	add	r1, sp, #1648	; 0x670
  102c2c:	e1a0000a 	mov	r0, sl
  102c30:	e2811008 	add	r1, r1, #8	; 0x8
  102c34:	ebfff851 	bl	100d80 <__sprint>
  102c38:	e3500000 	cmp	r0, #0	; 0x0
  102c3c:	1afff953 	bne	101190 <prog+0x114c>
  102c40:	eaffffc6 	b	102b60 <prog+0x2b1c>
  102c44:	e28b3001 	add	r3, fp, #1	; 0x1
  102c48:	e086b003 	add	fp, r6, r3
  102c4c:	e35b0000 	cmp	fp, #0	; 0x0
  102c50:	a1a0200b 	movge	r2, fp
  102c54:	b3a02000 	movlt	r2, #0	; 0x0
  102c58:	e58d203c 	str	r2, [sp, #60]
  102c5c:	eafffee4 	b	1027f4 <prog+0x27b0>
  102c60:	e5996000 	ldr	r6, [r9]
  102c64:	e3560000 	cmp	r6, #0	; 0x0
  102c68:	e2891004 	add	r1, r9, #4	; 0x4
  102c6c:	ba000015 	blt	102cc8 <prog+0x2c84>
  102c70:	e58d2018 	str	r2, [sp, #24]
  102c74:	e5d23000 	ldrb	r3, [r2]
  102c78:	e1a09001 	mov	r9, r1
  102c7c:	eafff8cd 	b	100fb8 <_vfprintf_r+0x1f8>
  102c80:	e3560000 	cmp	r6, #0	; 0x0
  102c84:	1a000005 	bne	102ca0 <prog+0x2c5c>
  102c88:	e59d3054 	ldr	r3, [sp, #84]
  102c8c:	e3130001 	tst	r3, #1	; 0x1
  102c90:	03a04001 	moveq	r4, #1	; 0x1
  102c94:	058d403c 	streq	r4, [sp, #60]
  102c98:	01a0b004 	moveq	fp, r4
  102c9c:	0afffed4 	beq	1027f4 <prog+0x27b0>
  102ca0:	e286b002 	add	fp, r6, #2	; 0x2
  102ca4:	e35b0000 	cmp	fp, #0	; 0x0
  102ca8:	a1a0c00b 	movge	ip, fp
  102cac:	b3a0c000 	movlt	ip, #0	; 0x0
  102cb0:	e58dc03c 	str	ip, [sp, #60]
  102cb4:	eafffece 	b	1027f4 <prog+0x27b0>
  102cb8:	e1da30bc 	ldrh	r3, [sl, #12]
  102cbc:	e3833040 	orr	r3, r3, #64	; 0x40
  102cc0:	e1ca30bc 	strh	r3, [sl, #12]
  102cc4:	eafff92e 	b	101184 <prog+0x1140>
  102cc8:	e58d2018 	str	r2, [sp, #24]
  102ccc:	e5d23000 	ldrb	r3, [r2]
  102cd0:	e1a09001 	mov	r9, r1
  102cd4:	e3e06000 	mvn	r6, #0	; 0x0
  102cd8:	eafff8b6 	b	100fb8 <_vfprintf_r+0x1f8>

00102cdc <vfprintf>:
  102cdc:	e52de004 	str	lr, [sp, #-4]!
  102ce0:	e1a03002 	mov	r3, r2
  102ce4:	e59f2018 	ldr	r2, [pc, #24]	; 102d04 <prog+0x2cc0>
  102ce8:	e1a0c000 	mov	ip, r0
  102cec:	e1a0e001 	mov	lr, r1
  102cf0:	e5920000 	ldr	r0, [r2]
  102cf4:	e1a0100c 	mov	r1, ip
  102cf8:	e1a0200e 	mov	r2, lr
  102cfc:	e49de004 	ldr	lr, [sp], #4
  102d00:	eafff82e 	b	100dc0 <_vfprintf_r>
  102d04:	00200410 	eoreq	r0, r0, r0, lsl r4

00102d08 <_wcrtomb_r>:
  102d08:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102d0c:	e251c000 	subs	ip, r1, #0	; 0x0
  102d10:	e24dd00c 	sub	sp, sp, #12	; 0xc
  102d14:	e1a05000 	mov	r5, r0
  102d18:	e1a04003 	mov	r4, r3
  102d1c:	0a00000a 	beq	102d4c <_wcrtomb_r+0x44>
  102d20:	eb000076 	bl	102f00 <_wctomb_r>
  102d24:	e3700001 	cmn	r0, #1	; 0x1
  102d28:	e1a01000 	mov	r1, r0
  102d2c:	11a01000 	movne	r1, r0
  102d30:	03a03000 	moveq	r3, #0	; 0x0
  102d34:	03a0208a 	moveq	r2, #138	; 0x8a
  102d38:	e1a00001 	mov	r0, r1
  102d3c:	05843000 	streq	r3, [r4]
  102d40:	05852000 	streq	r2, [r5]
  102d44:	e28dd00c 	add	sp, sp, #12	; 0xc
  102d48:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  102d4c:	e1a0200c 	mov	r2, ip
  102d50:	e28d1002 	add	r1, sp, #2	; 0x2
  102d54:	eb000069 	bl	102f00 <_wctomb_r>
  102d58:	eafffff1 	b	102d24 <_wcrtomb_r+0x1c>

00102d5c <wcrtomb>:
  102d5c:	e52de004 	str	lr, [sp, #-4]!
  102d60:	e1a03002 	mov	r3, r2
  102d64:	e59f2018 	ldr	r2, [pc, #24]	; 102d84 <prog+0x2d40>
  102d68:	e1a0c000 	mov	ip, r0
  102d6c:	e1a0e001 	mov	lr, r1
  102d70:	e5920000 	ldr	r0, [r2]
  102d74:	e1a0100c 	mov	r1, ip
  102d78:	e1a0200e 	mov	r2, lr
  102d7c:	e49de004 	ldr	lr, [sp], #4
  102d80:	eaffffe0 	b	102d08 <_wcrtomb_r>
  102d84:	00200410 	eoreq	r0, r0, r0, lsl r4

00102d88 <_wcsrtombs_r>:
  102d88:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  102d8c:	e3510000 	cmp	r1, #0	; 0x0
  102d90:	e24dd014 	sub	sp, sp, #20	; 0x14
  102d94:	e58d1000 	str	r1, [sp]
  102d98:	e58d0004 	str	r0, [sp, #4]
  102d9c:	e1a0b002 	mov	fp, r2
  102da0:	e1a06003 	mov	r6, r3
  102da4:	e59d9038 	ldr	r9, [sp, #56]
  102da8:	0a000039 	beq	102e94 <_wcsrtombs_r+0x10c>
  102dac:	e3530000 	cmp	r3, #0	; 0x0
  102db0:	e5928000 	ldr	r8, [r2]
  102db4:	0a000039 	beq	102ea0 <_wcsrtombs_r+0x118>
  102db8:	e59d4000 	ldr	r4, [sp]
  102dbc:	e3a05000 	mov	r5, #0	; 0x0
  102dc0:	e59d0004 	ldr	r0, [sp, #4]
  102dc4:	e28d100a 	add	r1, sp, #10	; 0xa
  102dc8:	e5982000 	ldr	r2, [r8]
  102dcc:	e1a03009 	mov	r3, r9
  102dd0:	e599a000 	ldr	sl, [r9]
  102dd4:	e5997004 	ldr	r7, [r9, #4]
  102dd8:	ebffffca 	bl	102d08 <_wcrtomb_r>
  102ddc:	e3700001 	cmn	r0, #1	; 0x1
  102de0:	0a00001f 	beq	102e64 <_wcsrtombs_r+0xdc>
  102de4:	e0603006 	rsb	r3, r0, r6
  102de8:	e1530005 	cmp	r3, r5
  102dec:	33a02000 	movcc	r2, #0	; 0x0
  102df0:	23a02001 	movcs	r2, #1	; 0x1
  102df4:	e1500006 	cmp	r0, r6
  102df8:	23a02000 	movcs	r2, #0	; 0x0
  102dfc:	e3520000 	cmp	r2, #0	; 0x0
  102e00:	0a000020 	beq	102e88 <_wcsrtombs_r+0x100>
  102e04:	e59d1000 	ldr	r1, [sp]
  102e08:	e3510000 	cmp	r1, #0	; 0x0
  102e0c:	e0855000 	add	r5, r5, r0
  102e10:	0a00000c 	beq	102e48 <_wcsrtombs_r+0xc0>
  102e14:	e3500000 	cmp	r0, #0	; 0x0
  102e18:	da000007 	ble	102e3c <_wcsrtombs_r+0xb4>
  102e1c:	e3a02000 	mov	r2, #0	; 0x0
  102e20:	e282100a 	add	r1, r2, #10	; 0xa
  102e24:	e7d1300d 	ldrb	r3, [r1, sp]
  102e28:	e7c23004 	strb	r3, [r2, r4]
  102e2c:	e2822001 	add	r2, r2, #1	; 0x1
  102e30:	e1500002 	cmp	r0, r2
  102e34:	1afffff9 	bne	102e20 <_wcsrtombs_r+0x98>
  102e38:	e0844000 	add	r4, r4, r0
  102e3c:	e59b3000 	ldr	r3, [fp]
  102e40:	e2833004 	add	r3, r3, #4	; 0x4
  102e44:	e58b3000 	str	r3, [fp]
  102e48:	e5983000 	ldr	r3, [r8]
  102e4c:	e3530000 	cmp	r3, #0	; 0x0
  102e50:	0a000014 	beq	102ea8 <_wcsrtombs_r+0x120>
  102e54:	e1550006 	cmp	r5, r6
  102e58:	2a000007 	bcs	102e7c <_wcsrtombs_r+0xf4>
  102e5c:	e2888004 	add	r8, r8, #4	; 0x4
  102e60:	eaffffd6 	b	102dc0 <_wcsrtombs_r+0x38>
  102e64:	e59d1004 	ldr	r1, [sp, #4]
  102e68:	e3a0308a 	mov	r3, #138	; 0x8a
  102e6c:	e3a02000 	mov	r2, #0	; 0x0
  102e70:	e5813000 	str	r3, [r1]
  102e74:	e5892000 	str	r2, [r9]
  102e78:	e1a05000 	mov	r5, r0
  102e7c:	e1a00005 	mov	r0, r5
  102e80:	e28dd014 	add	sp, sp, #20	; 0x14
  102e84:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  102e88:	e5897004 	str	r7, [r9, #4]
  102e8c:	e589a000 	str	sl, [r9]
  102e90:	eafffff9 	b	102e7c <_wcsrtombs_r+0xf4>
  102e94:	e5928000 	ldr	r8, [r2]
  102e98:	e3e06000 	mvn	r6, #0	; 0x0
  102e9c:	eaffffc5 	b	102db8 <_wcsrtombs_r+0x30>
  102ea0:	e3a05000 	mov	r5, #0	; 0x0
  102ea4:	eafffff4 	b	102e7c <_wcsrtombs_r+0xf4>
  102ea8:	e59d2000 	ldr	r2, [sp]
  102eac:	e2455001 	sub	r5, r5, #1	; 0x1
  102eb0:	e3520000 	cmp	r2, #0	; 0x0
  102eb4:	158b3000 	strne	r3, [fp]
  102eb8:	e5893000 	str	r3, [r9]
  102ebc:	eaffffee 	b	102e7c <_wcsrtombs_r+0xf4>

00102ec0 <wcsrtombs>:
  102ec0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  102ec4:	e59fc030 	ldr	ip, [pc, #48]	; 102efc <prog+0x2eb8>
  102ec8:	e59ce000 	ldr	lr, [ip]
  102ecc:	e1a04000 	mov	r4, r0
  102ed0:	e1a0c001 	mov	ip, r1
  102ed4:	e1a05002 	mov	r5, r2
  102ed8:	e24dd004 	sub	sp, sp, #4	; 0x4
  102edc:	e58d3000 	str	r3, [sp]
  102ee0:	e1a0000e 	mov	r0, lr
  102ee4:	e1a01004 	mov	r1, r4
  102ee8:	e1a0200c 	mov	r2, ip
  102eec:	e1a03005 	mov	r3, r5
  102ef0:	ebffffa4 	bl	102d88 <_wcsrtombs_r>
  102ef4:	e28dd004 	add	sp, sp, #4	; 0x4
  102ef8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  102efc:	00200410 	eoreq	r0, r0, r0, lsl r4

00102f00 <_wctomb_r>:
  102f00:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  102f04:	e59f0400 	ldr	r0, [pc, #1024]	; 10330c <prog+0x32c8>
  102f08:	e1a07001 	mov	r7, r1
  102f0c:	e1a04002 	mov	r4, r2
  102f10:	e1a05003 	mov	r5, r3
  102f14:	ebfff730 	bl	100bdc <strlen>
  102f18:	e3500001 	cmp	r0, #1	; 0x1
  102f1c:	9a000025 	bls	102fb8 <_wctomb_r+0xb8>
  102f20:	e59f03e4 	ldr	r0, [pc, #996]	; 10330c <prog+0x32c8>
  102f24:	e59f13e4 	ldr	r1, [pc, #996]	; 103310 <prog+0x32cc>
  102f28:	eb000fa2 	bl	106db8 <strcmp>
  102f2c:	e3500000 	cmp	r0, #0	; 0x0
  102f30:	1a000012 	bne	102f80 <_wctomb_r+0x80>
  102f34:	e3570000 	cmp	r7, #0	; 0x0
  102f38:	0a000020 	beq	102fc0 <_wctomb_r+0xc0>
  102f3c:	e354007f 	cmp	r4, #127	; 0x7f
  102f40:	da000018 	ble	102fa8 <_wctomb_r+0xa8>
  102f44:	e2443080 	sub	r3, r4, #128	; 0x80
  102f48:	e3530d1e 	cmp	r3, #1920	; 0x780
  102f4c:	2a000063 	bcs	1030e0 <_wctomb_r+0x1e0>
  102f50:	e2043d1f 	and	r3, r4, #1984	; 0x7c0
  102f54:	e204203f 	and	r2, r4, #63	; 0x3f
  102f58:	e1a03343 	mov	r3, r3, asr #6
  102f5c:	e3a06002 	mov	r6, #2	; 0x2
  102f60:	e1e03d03 	mvn	r3, r3, lsl #26
  102f64:	e1e02c82 	mvn	r2, r2, lsl #25
  102f68:	e1e03d23 	mvn	r3, r3, lsr #26
  102f6c:	e1e02ca2 	mvn	r2, r2, lsr #25
  102f70:	e1a00006 	mov	r0, r6
  102f74:	e5c72001 	strb	r2, [r7, #1]
  102f78:	e5c73000 	strb	r3, [r7]
  102f7c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  102f80:	e59f0384 	ldr	r0, [pc, #900]	; 10330c <prog+0x32c8>
  102f84:	e59f1388 	ldr	r1, [pc, #904]	; 103314 <prog+0x32d0>
  102f88:	eb000f8a 	bl	106db8 <strcmp>
  102f8c:	e3500000 	cmp	r0, #0	; 0x0
  102f90:	1a00000d 	bne	102fcc <_wctomb_r+0xcc>
  102f94:	e3570000 	cmp	r7, #0	; 0x0
  102f98:	0a000008 	beq	102fc0 <_wctomb_r+0xc0>
  102f9c:	e1a03444 	mov	r3, r4, asr #8
  102fa0:	e213e0ff 	ands	lr, r3, #255	; 0xff
  102fa4:	1a000034 	bne	10307c <_wctomb_r+0x17c>
  102fa8:	e5c74000 	strb	r4, [r7]
  102fac:	e3a06001 	mov	r6, #1	; 0x1
  102fb0:	e1a00006 	mov	r0, r6
  102fb4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  102fb8:	e3570000 	cmp	r7, #0	; 0x0
  102fbc:	1afffff9 	bne	102fa8 <_wctomb_r+0xa8>
  102fc0:	e3a06000 	mov	r6, #0	; 0x0
  102fc4:	e1a00006 	mov	r0, r6
  102fc8:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  102fcc:	e59f0338 	ldr	r0, [pc, #824]	; 10330c <prog+0x32c8>
  102fd0:	e59f1340 	ldr	r1, [pc, #832]	; 103318 <prog+0x32d4>
  102fd4:	eb000f77 	bl	106db8 <strcmp>
  102fd8:	e3500000 	cmp	r0, #0	; 0x0
  102fdc:	1a00000a 	bne	10300c <_wctomb_r+0x10c>
  102fe0:	e3570000 	cmp	r7, #0	; 0x0
  102fe4:	0afffff5 	beq	102fc0 <_wctomb_r+0xc0>
  102fe8:	e1a03444 	mov	r3, r4, asr #8
  102fec:	e213e0ff 	ands	lr, r3, #255	; 0xff
  102ff0:	0affffec 	beq	102fa8 <_wctomb_r+0xa8>
  102ff4:	e28e305f 	add	r3, lr, #95	; 0x5f
  102ff8:	e20330ff 	and	r3, r3, #255	; 0xff
  102ffc:	e353005d 	cmp	r3, #93	; 0x5d
  103000:	9a00002f 	bls	1030c4 <_wctomb_r+0x1c4>
  103004:	e3e06000 	mvn	r6, #0	; 0x0
  103008:	eaffffe8 	b	102fb0 <_wctomb_r+0xb0>
  10300c:	e59f02f8 	ldr	r0, [pc, #760]	; 10330c <prog+0x32c8>
  103010:	e59f1304 	ldr	r1, [pc, #772]	; 10331c <prog+0x32d8>
  103014:	eb000f67 	bl	106db8 <strcmp>
  103018:	e3500000 	cmp	r0, #0	; 0x0
  10301c:	1affffe5 	bne	102fb8 <_wctomb_r+0xb8>
  103020:	e3570000 	cmp	r7, #0	; 0x0
  103024:	03a06001 	moveq	r6, #1	; 0x1
  103028:	0affffe0 	beq	102fb0 <_wctomb_r+0xb0>
  10302c:	e1a03444 	mov	r3, r4, asr #8
  103030:	e213e0ff 	ands	lr, r3, #255	; 0xff
  103034:	e20400ff 	and	r0, r4, #255	; 0xff
  103038:	1a000044 	bne	103150 <_wctomb_r+0x250>
  10303c:	e5953000 	ldr	r3, [r5]
  103040:	e3530000 	cmp	r3, #0	; 0x0
  103044:	03a06001 	moveq	r6, #1	; 0x1
  103048:	0a000009 	beq	103074 <_wctomb_r+0x174>
  10304c:	e1a01007 	mov	r1, r7
  103050:	e3a0301b 	mov	r3, #27	; 0x1b
  103054:	e585e000 	str	lr, [r5]
  103058:	e4c13001 	strb	r3, [r1], #1
  10305c:	e3a02028 	mov	r2, #40	; 0x28
  103060:	e2833027 	add	r3, r3, #39	; 0x27
  103064:	e5c72001 	strb	r2, [r7, #1]
  103068:	e5c13001 	strb	r3, [r1, #1]
  10306c:	e2817002 	add	r7, r1, #2	; 0x2
  103070:	e3a06004 	mov	r6, #4	; 0x4
  103074:	e5c70000 	strb	r0, [r7]
  103078:	eaffffcc 	b	102fb0 <_wctomb_r+0xb0>
  10307c:	e28e207f 	add	r2, lr, #127	; 0x7f
  103080:	e28e3020 	add	r3, lr, #32	; 0x20
  103084:	e20220ff 	and	r2, r2, #255	; 0xff
  103088:	e20330ff 	and	r3, r3, #255	; 0xff
  10308c:	e353000f 	cmp	r3, #15	; 0xf
  103090:	8352001e 	cmphi	r2, #30	; 0x1e
  103094:	8affffda 	bhi	103004 <_wctomb_r+0x104>
  103098:	e20400ff 	and	r0, r4, #255	; 0xff
  10309c:	e2403080 	sub	r3, r0, #128	; 0x80
  1030a0:	e20330ff 	and	r3, r3, #255	; 0xff
  1030a4:	e2402040 	sub	r2, r0, #64	; 0x40
  1030a8:	e353007c 	cmp	r3, #124	; 0x7c
  1030ac:	8352003e 	cmphi	r2, #62	; 0x3e
  1030b0:	8affffd3 	bhi	103004 <_wctomb_r+0x104>
  1030b4:	e3a06002 	mov	r6, #2	; 0x2
  1030b8:	e5c70001 	strb	r0, [r7, #1]
  1030bc:	e5c7e000 	strb	lr, [r7]
  1030c0:	eaffffba 	b	102fb0 <_wctomb_r+0xb0>
  1030c4:	e20400ff 	and	r0, r4, #255	; 0xff
  1030c8:	e280305f 	add	r3, r0, #95	; 0x5f
  1030cc:	e20330ff 	and	r3, r3, #255	; 0xff
  1030d0:	e353005d 	cmp	r3, #93	; 0x5d
  1030d4:	9afffff6 	bls	1030b4 <_wctomb_r+0x1b4>
  1030d8:	e3e06000 	mvn	r6, #0	; 0x0
  1030dc:	eaffffb3 	b	102fb0 <_wctomb_r+0xb0>
  1030e0:	e2443b02 	sub	r3, r4, #2048	; 0x800
  1030e4:	e3530b3e 	cmp	r3, #63488	; 0xf800
  1030e8:	3a00004f 	bcc	10322c <_wctomb_r+0x32c>
  1030ec:	e2443801 	sub	r3, r4, #65536	; 0x10000
  1030f0:	e353081f 	cmp	r3, #2031616	; 0x1f0000
  1030f4:	2a00002d 	bcs	1031b0 <_wctomb_r+0x2b0>
  1030f8:	e2043707 	and	r3, r4, #1835008	; 0x1c0000
  1030fc:	e1a03943 	mov	r3, r3, asr #18
  103100:	e1e03e03 	mvn	r3, r3, lsl #28
  103104:	e2042a3f 	and	r2, r4, #258048	; 0x3f000
  103108:	e2041d3f 	and	r1, r4, #4032	; 0xfc0
  10310c:	e1a0c007 	mov	ip, r7
  103110:	e1e03e23 	mvn	r3, r3, lsr #28
  103114:	e1a02642 	mov	r2, r2, asr #12
  103118:	e1a01341 	mov	r1, r1, asr #6
  10311c:	e204003f 	and	r0, r4, #63	; 0x3f
  103120:	e4cc3001 	strb	r3, [ip], #1
  103124:	e1e02c82 	mvn	r2, r2, lsl #25
  103128:	e1e01c81 	mvn	r1, r1, lsl #25
  10312c:	e1e00c80 	mvn	r0, r0, lsl #25
  103130:	e1e02ca2 	mvn	r2, r2, lsr #25
  103134:	e1e01ca1 	mvn	r1, r1, lsr #25
  103138:	e1e00ca0 	mvn	r0, r0, lsr #25
  10313c:	e3a06004 	mov	r6, #4	; 0x4
  103140:	e5c72001 	strb	r2, [r7, #1]
  103144:	e5cc0002 	strb	r0, [ip, #2]
  103148:	e5cc1001 	strb	r1, [ip, #1]
  10314c:	eaffff97 	b	102fb0 <_wctomb_r+0xb0>
  103150:	e24e3021 	sub	r3, lr, #33	; 0x21
  103154:	e353005d 	cmp	r3, #93	; 0x5d
  103158:	8affffa9 	bhi	103004 <_wctomb_r+0x104>
  10315c:	e2403021 	sub	r3, r0, #33	; 0x21
  103160:	e353005d 	cmp	r3, #93	; 0x5d
  103164:	8affffa6 	bhi	103004 <_wctomb_r+0x104>
  103168:	e5953000 	ldr	r3, [r5]
  10316c:	e3530000 	cmp	r3, #0	; 0x0
  103170:	13a06002 	movne	r6, #2	; 0x2
  103174:	1a00000a 	bne	1031a4 <_wctomb_r+0x2a4>
  103178:	e1a01007 	mov	r1, r7
  10317c:	e3a03001 	mov	r3, #1	; 0x1
  103180:	e3a0201b 	mov	r2, #27	; 0x1b
  103184:	e5853000 	str	r3, [r5]
  103188:	e4c12001 	strb	r2, [r1], #1
  10318c:	e2833023 	add	r3, r3, #35	; 0x23
  103190:	e2822027 	add	r2, r2, #39	; 0x27
  103194:	e5c73001 	strb	r3, [r7, #1]
  103198:	e5c12001 	strb	r2, [r1, #1]
  10319c:	e2817002 	add	r7, r1, #2	; 0x2
  1031a0:	e3a06005 	mov	r6, #5	; 0x5
  1031a4:	e5c70001 	strb	r0, [r7, #1]
  1031a8:	e5c7e000 	strb	lr, [r7]
  1031ac:	eaffff7f 	b	102fb0 <_wctomb_r+0xb0>
  1031b0:	e2443602 	sub	r3, r4, #2097152	; 0x200000
  1031b4:	e353063e 	cmp	r3, #65011712	; 0x3e00000
  1031b8:	2a00002f 	bcs	10327c <_wctomb_r+0x37c>
  1031bc:	e2043403 	and	r3, r4, #50331648	; 0x3000000
  1031c0:	e1a03c43 	mov	r3, r3, asr #24
  1031c4:	e1e03e83 	mvn	r3, r3, lsl #29
  1031c8:	e1a0e007 	mov	lr, r7
  1031cc:	e1e03ea3 	mvn	r3, r3, lsr #29
  1031d0:	e204273f 	and	r2, r4, #16515072	; 0xfc0000
  1031d4:	e2041a3f 	and	r1, r4, #258048	; 0x3f000
  1031d8:	e2040d3f 	and	r0, r4, #4032	; 0xfc0
  1031dc:	e4ce3001 	strb	r3, [lr], #1
  1031e0:	e1a02942 	mov	r2, r2, asr #18
  1031e4:	e1a01641 	mov	r1, r1, asr #12
  1031e8:	e1a00340 	mov	r0, r0, asr #6
  1031ec:	e204303f 	and	r3, r4, #63	; 0x3f
  1031f0:	e1e02c82 	mvn	r2, r2, lsl #25
  1031f4:	e1e01c81 	mvn	r1, r1, lsl #25
  1031f8:	e1e00c80 	mvn	r0, r0, lsl #25
  1031fc:	e1e03c83 	mvn	r3, r3, lsl #25
  103200:	e28ec001 	add	ip, lr, #1	; 0x1
  103204:	e1e02ca2 	mvn	r2, r2, lsr #25
  103208:	e1e01ca1 	mvn	r1, r1, lsr #25
  10320c:	e1e00ca0 	mvn	r0, r0, lsr #25
  103210:	e1e03ca3 	mvn	r3, r3, lsr #25
  103214:	e3a06005 	mov	r6, #5	; 0x5
  103218:	e5c72001 	strb	r2, [r7, #1]
  10321c:	e5ce1001 	strb	r1, [lr, #1]
  103220:	e5cc3002 	strb	r3, [ip, #2]
  103224:	e5cc0001 	strb	r0, [ip, #1]
  103228:	eaffff60 	b	102fb0 <_wctomb_r+0xb0>
  10322c:	e2443b36 	sub	r3, r4, #55296	; 0xd800
  103230:	e3530b02 	cmp	r3, #2048	; 0x800
  103234:	3affff72 	bcc	103004 <_wctomb_r+0x104>
  103238:	e2043a0f 	and	r3, r4, #61440	; 0xf000
  10323c:	e1a03643 	mov	r3, r3, asr #12
  103240:	e1e03d83 	mvn	r3, r3, lsl #27
  103244:	e2042d3f 	and	r2, r4, #4032	; 0xfc0
  103248:	e1a00007 	mov	r0, r7
  10324c:	e1e03da3 	mvn	r3, r3, lsr #27
  103250:	e1a02342 	mov	r2, r2, asr #6
  103254:	e204103f 	and	r1, r4, #63	; 0x3f
  103258:	e4c03001 	strb	r3, [r0], #1
  10325c:	e1e02c82 	mvn	r2, r2, lsl #25
  103260:	e1e01c81 	mvn	r1, r1, lsl #25
  103264:	e1e02ca2 	mvn	r2, r2, lsr #25
  103268:	e1e01ca1 	mvn	r1, r1, lsr #25
  10326c:	e3a06003 	mov	r6, #3	; 0x3
  103270:	e5c72001 	strb	r2, [r7, #1]
  103274:	e5c01001 	strb	r1, [r0, #1]
  103278:	eaffff4c 	b	102fb0 <_wctomb_r+0xb0>
  10327c:	e374037f 	cmn	r4, #-67108863	; 0xfc000001
  103280:	daffff5f 	ble	103004 <_wctomb_r+0x104>
  103284:	e2043101 	and	r3, r4, #1073741824	; 0x40000000
  103288:	e1a03f43 	mov	r3, r3, asr #30
  10328c:	e1e03f03 	mvn	r3, r3, lsl #30
  103290:	e1a0e007 	mov	lr, r7
  103294:	e1e03f23 	mvn	r3, r3, lsr #30
  103298:	e4ce3001 	strb	r3, [lr], #1
  10329c:	e204243f 	and	r2, r4, #1056964608	; 0x3f000000
  1032a0:	e204373f 	and	r3, r4, #16515072	; 0xfc0000
  1032a4:	e2041a3f 	and	r1, r4, #258048	; 0x3f000
  1032a8:	e2040d3f 	and	r0, r4, #4032	; 0xfc0
  1032ac:	e204c03f 	and	ip, r4, #63	; 0x3f
  1032b0:	e1a02c42 	mov	r2, r2, asr #24
  1032b4:	e1a03943 	mov	r3, r3, asr #18
  1032b8:	e1a01641 	mov	r1, r1, asr #12
  1032bc:	e1a00340 	mov	r0, r0, asr #6
  1032c0:	e28e5001 	add	r5, lr, #1	; 0x1
  1032c4:	e1e02c82 	mvn	r2, r2, lsl #25
  1032c8:	e1e03c83 	mvn	r3, r3, lsl #25
  1032cc:	e1e01c81 	mvn	r1, r1, lsl #25
  1032d0:	e1e00c80 	mvn	r0, r0, lsl #25
  1032d4:	e1e0cc8c 	mvn	ip, ip, lsl #25
  1032d8:	e2854001 	add	r4, r5, #1	; 0x1
  1032dc:	e1e02ca2 	mvn	r2, r2, lsr #25
  1032e0:	e1e03ca3 	mvn	r3, r3, lsr #25
  1032e4:	e1e01ca1 	mvn	r1, r1, lsr #25
  1032e8:	e1e00ca0 	mvn	r0, r0, lsr #25
  1032ec:	e1e0ccac 	mvn	ip, ip, lsr #25
  1032f0:	e3a06006 	mov	r6, #6	; 0x6
  1032f4:	e5c72001 	strb	r2, [r7, #1]
  1032f8:	e5ce3001 	strb	r3, [lr, #1]
  1032fc:	e5c51001 	strb	r1, [r5, #1]
  103300:	e5c4c002 	strb	ip, [r4, #2]
  103304:	e5c40001 	strb	r0, [r4, #1]
  103308:	eaffff28 	b	102fb0 <_wctomb_r+0xb0>
  10330c:	00200818 	eoreq	r0, r0, r8, lsl r8
  103310:	0010b9e0 	andeqs	fp, r0, r0, ror #19
  103314:	0010b9e8 	andeqs	fp, r0, r8, ror #19
  103318:	0010b9f0 	ldreqsh	fp, [r0], -r0
  10331c:	0010b9f8 	ldreqsh	fp, [r0], -r8

00103320 <__swsetup>:
  103320:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  103324:	e59f60ec 	ldr	r6, [pc, #236]	; 103418 <prog+0x33d4>
  103328:	e5962000 	ldr	r2, [r6]
  10332c:	e3520000 	cmp	r2, #0	; 0x0
  103330:	e1a04000 	mov	r4, r0
  103334:	0a000002 	beq	103344 <__swsetup+0x24>
  103338:	e5923038 	ldr	r3, [r2, #56]
  10333c:	e3530000 	cmp	r3, #0	; 0x0
  103340:	0a000015 	beq	10339c <__swsetup+0x7c>
  103344:	e1d420bc 	ldrh	r2, [r4, #12]
  103348:	e2125008 	ands	r5, r2, #8	; 0x8
  10334c:	15941010 	ldrne	r1, [r4, #16]
  103350:	0a000017 	beq	1033b4 <__swsetup+0x94>
  103354:	e3510000 	cmp	r1, #0	; 0x0
  103358:	0a000012 	beq	1033a8 <__swsetup+0x88>
  10335c:	e1d430bc 	ldrh	r3, [r4, #12]
  103360:	e2132001 	ands	r2, r3, #1	; 0x1
  103364:	1a000005 	bne	103380 <__swsetup+0x60>
  103368:	e3130002 	tst	r3, #2	; 0x2
  10336c:	05943014 	ldreq	r3, [r4, #20]
  103370:	11a03002 	movne	r3, r2
  103374:	e3a00000 	mov	r0, #0	; 0x0
  103378:	e5843008 	str	r3, [r4, #8]
  10337c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  103380:	e5943014 	ldr	r3, [r4, #20]
  103384:	e3a02000 	mov	r2, #0	; 0x0
  103388:	e2633000 	rsb	r3, r3, #0	; 0x0
  10338c:	e1a00002 	mov	r0, r2
  103390:	e5843018 	str	r3, [r4, #24]
  103394:	e5842008 	str	r2, [r4, #8]
  103398:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10339c:	e1a00002 	mov	r0, r2
  1033a0:	eb000603 	bl	104bb4 <__sinit>
  1033a4:	eaffffe6 	b	103344 <__swsetup+0x24>
  1033a8:	e1a00004 	mov	r0, r4
  1033ac:	eb0008d7 	bl	105710 <__smakebuf>
  1033b0:	eaffffe9 	b	10335c <__swsetup+0x3c>
  1033b4:	e3120010 	tst	r2, #16	; 0x10
  1033b8:	03e00000 	mvneq	r0, #0	; 0x0
  1033bc:	08bd8070 	ldmeqia	sp!, {r4, r5, r6, pc}
  1033c0:	e3120004 	tst	r2, #4	; 0x4
  1033c4:	05941010 	ldreq	r1, [r4, #16]
  1033c8:	0a00000f 	beq	10340c <__swsetup+0xec>
  1033cc:	e5941030 	ldr	r1, [r4, #48]
  1033d0:	e3510000 	cmp	r1, #0	; 0x0
  1033d4:	0a000006 	beq	1033f4 <__swsetup+0xd4>
  1033d8:	e2843040 	add	r3, r4, #64	; 0x40
  1033dc:	e1510003 	cmp	r1, r3
  1033e0:	0a000002 	beq	1033f0 <__swsetup+0xd0>
  1033e4:	e5960000 	ldr	r0, [r6]
  1033e8:	eb0006b4 	bl	104ec0 <_free_r>
  1033ec:	e1d420bc 	ldrh	r2, [r4, #12]
  1033f0:	e5845030 	str	r5, [r4, #48]
  1033f4:	e3c23024 	bic	r3, r2, #36	; 0x24
  1033f8:	e1c430bc 	strh	r3, [r4, #12]
  1033fc:	e5941010 	ldr	r1, [r4, #16]
  103400:	e3a03000 	mov	r3, #0	; 0x0
  103404:	e1d420bc 	ldrh	r2, [r4, #12]
  103408:	e884000a 	stmia	r4, {r1, r3}
  10340c:	e3823008 	orr	r3, r2, #8	; 0x8
  103410:	e1c430bc 	strh	r3, [r4, #12]
  103414:	eaffffce 	b	103354 <__swsetup+0x34>
  103418:	00200410 	eoreq	r0, r0, r0, lsl r4

0010341c <quorem>:
  10341c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  103420:	e5903010 	ldr	r3, [r0, #16]
  103424:	e5912010 	ldr	r2, [r1, #16]
  103428:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10342c:	e1520003 	cmp	r2, r3
  103430:	e58d0000 	str	r0, [sp]
  103434:	e1a09001 	mov	r9, r1
  103438:	c3a00000 	movgt	r0, #0	; 0x0
  10343c:	ca000044 	bgt	103554 <quorem+0x138>
  103440:	e2815014 	add	r5, r1, #20	; 0x14
  103444:	e59d1000 	ldr	r1, [sp]
  103448:	e2427001 	sub	r7, r2, #1	; 0x1
  10344c:	e1a03107 	mov	r3, r7, lsl #2
  103450:	e2818014 	add	r8, r1, #20	; 0x14
  103454:	e7932008 	ldr	r2, [r3, r8]
  103458:	e7951003 	ldr	r1, [r5, r3]
  10345c:	e1a00002 	mov	r0, r2
  103460:	e2811001 	add	r1, r1, #1	; 0x1
  103464:	e085b003 	add	fp, r5, r3
  103468:	e0833008 	add	r3, r3, r8
  10346c:	e98d000c 	stmib	sp, {r2, r3}
  103470:	ebfff327 	bl	100114 <__aeabi_uidiv>
  103474:	e250a000 	subs	sl, r0, #0	; 0x0
  103478:	1a000037 	bne	10355c <quorem+0x140>
  10347c:	e1a01009 	mov	r1, r9
  103480:	e59d0000 	ldr	r0, [sp]
  103484:	eb0009b8 	bl	105b6c <__mcmp>
  103488:	e3500000 	cmp	r0, #0	; 0x0
  10348c:	ba00002f 	blt	103550 <quorem+0x134>
  103490:	e3a04000 	mov	r4, #0	; 0x0
  103494:	e28aa001 	add	sl, sl, #1	; 0x1
  103498:	e1a0e008 	mov	lr, r8
  10349c:	e1a00004 	mov	r0, r4
  1034a0:	e4952004 	ldr	r2, [r5], #4
  1034a4:	e1a03802 	mov	r3, r2, lsl #16
  1034a8:	e1a03823 	mov	r3, r3, lsr #16
  1034ac:	e59ec000 	ldr	ip, [lr]
  1034b0:	e0803003 	add	r3, r0, r3
  1034b4:	e1a00823 	mov	r0, r3, lsr #16
  1034b8:	e0800822 	add	r0, r0, r2, lsr #16
  1034bc:	e1a03803 	mov	r3, r3, lsl #16
  1034c0:	e1a0180c 	mov	r1, ip, lsl #16
  1034c4:	e1a02800 	mov	r2, r0, lsl #16
  1034c8:	e1a01821 	mov	r1, r1, lsr #16
  1034cc:	e1a03823 	mov	r3, r3, lsr #16
  1034d0:	e0631001 	rsb	r1, r3, r1
  1034d4:	e1a02822 	mov	r2, r2, lsr #16
  1034d8:	e0811004 	add	r1, r1, r4
  1034dc:	e062282c 	rsb	r2, r2, ip, lsr #16
  1034e0:	e0822841 	add	r2, r2, r1, asr #16
  1034e4:	e15b0005 	cmp	fp, r5
  1034e8:	e1ce20b2 	strh	r2, [lr, #2]
  1034ec:	e1a00820 	mov	r0, r0, lsr #16
  1034f0:	e0ce10b4 	strh	r1, [lr], #4
  1034f4:	e1a04842 	mov	r4, r2, asr #16
  1034f8:	2affffe8 	bcs	1034a0 <quorem+0x84>
  1034fc:	e1a02107 	mov	r2, r7, lsl #2
  103500:	e7983002 	ldr	r3, [r8, r2]
  103504:	e3530000 	cmp	r3, #0	; 0x0
  103508:	e0883002 	add	r3, r8, r2
  10350c:	1a00000f 	bne	103550 <quorem+0x134>
  103510:	e2432004 	sub	r2, r3, #4	; 0x4
  103514:	e1580002 	cmp	r8, r2
  103518:	2a00000a 	bcs	103548 <quorem+0x12c>
  10351c:	e5133004 	ldr	r3, [r3, #-4]
  103520:	e3530000 	cmp	r3, #0	; 0x0
  103524:	0a000003 	beq	103538 <quorem+0x11c>
  103528:	ea000006 	b	103548 <quorem+0x12c>
  10352c:	e5923000 	ldr	r3, [r2]
  103530:	e3530000 	cmp	r3, #0	; 0x0
  103534:	1a000003 	bne	103548 <quorem+0x12c>
  103538:	e2422004 	sub	r2, r2, #4	; 0x4
  10353c:	e1580002 	cmp	r8, r2
  103540:	e2477001 	sub	r7, r7, #1	; 0x1
  103544:	3afffff8 	bcc	10352c <quorem+0x110>
  103548:	e59d3000 	ldr	r3, [sp]
  10354c:	e5837010 	str	r7, [r3, #16]
  103550:	e1a0000a 	mov	r0, sl
  103554:	e28dd00c 	add	sp, sp, #12	; 0xc
  103558:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10355c:	e3a06000 	mov	r6, #0	; 0x0
  103560:	e1a0e008 	mov	lr, r8
  103564:	e1a04005 	mov	r4, r5
  103568:	e1a0c006 	mov	ip, r6
  10356c:	e4942004 	ldr	r2, [r4], #4
  103570:	e1a03802 	mov	r3, r2, lsl #16
  103574:	e1a03823 	mov	r3, r3, lsr #16
  103578:	e021ca93 	mla	r1, r3, sl, ip
  10357c:	e1a02822 	mov	r2, r2, lsr #16
  103580:	e1a03821 	mov	r3, r1, lsr #16
  103584:	e02c3a92 	mla	ip, r2, sl, r3
  103588:	e59e0000 	ldr	r0, [lr]
  10358c:	e1a01801 	mov	r1, r1, lsl #16
  103590:	e1a02800 	mov	r2, r0, lsl #16
  103594:	e1a0380c 	mov	r3, ip, lsl #16
  103598:	e1a02822 	mov	r2, r2, lsr #16
  10359c:	e1a01821 	mov	r1, r1, lsr #16
  1035a0:	e0612002 	rsb	r2, r1, r2
  1035a4:	e1a03823 	mov	r3, r3, lsr #16
  1035a8:	e0822006 	add	r2, r2, r6
  1035ac:	e0633820 	rsb	r3, r3, r0, lsr #16
  1035b0:	e0833842 	add	r3, r3, r2, asr #16
  1035b4:	e15b0004 	cmp	fp, r4
  1035b8:	e1ce30b2 	strh	r3, [lr, #2]
  1035bc:	e1a0c82c 	mov	ip, ip, lsr #16
  1035c0:	e0ce20b4 	strh	r2, [lr], #4
  1035c4:	e1a06843 	mov	r6, r3, asr #16
  1035c8:	2affffe7 	bcs	10356c <quorem+0x150>
  1035cc:	e59d3004 	ldr	r3, [sp, #4]
  1035d0:	e3530000 	cmp	r3, #0	; 0x0
  1035d4:	1affffa8 	bne	10347c <quorem+0x60>
  1035d8:	e59d1008 	ldr	r1, [sp, #8]
  1035dc:	e2412004 	sub	r2, r1, #4	; 0x4
  1035e0:	e1580002 	cmp	r8, r2
  1035e4:	2a00000a 	bcs	103614 <quorem+0x1f8>
  1035e8:	e5113004 	ldr	r3, [r1, #-4]
  1035ec:	e3530000 	cmp	r3, #0	; 0x0
  1035f0:	0a000003 	beq	103604 <quorem+0x1e8>
  1035f4:	ea000006 	b	103614 <quorem+0x1f8>
  1035f8:	e5923000 	ldr	r3, [r2]
  1035fc:	e3530000 	cmp	r3, #0	; 0x0
  103600:	1a000003 	bne	103614 <quorem+0x1f8>
  103604:	e2422004 	sub	r2, r2, #4	; 0x4
  103608:	e1580002 	cmp	r8, r2
  10360c:	e2477001 	sub	r7, r7, #1	; 0x1
  103610:	3afffff8 	bcc	1035f8 <quorem+0x1dc>
  103614:	e59d2000 	ldr	r2, [sp]
  103618:	e5827010 	str	r7, [r2, #16]
  10361c:	eaffff96 	b	10347c <quorem+0x60>

00103620 <_dtoa_r>:
  103620:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  103624:	e590c040 	ldr	ip, [r0, #64]
  103628:	e24dd050 	sub	sp, sp, #80	; 0x50
  10362c:	e35c0000 	cmp	ip, #0	; 0x0
  103630:	e58d0008 	str	r0, [sp, #8]
  103634:	e58d3004 	str	r3, [sp, #4]
  103638:	e1a08001 	mov	r8, r1
  10363c:	e1a09002 	mov	r9, r2
  103640:	e59d407c 	ldr	r4, [sp, #124]
  103644:	0a00000a 	beq	103674 <_dtoa_r+0x54>
  103648:	e5903044 	ldr	r3, [r0, #68]
  10364c:	e58c3004 	str	r3, [ip, #4]
  103650:	e5902044 	ldr	r2, [r0, #68]
  103654:	e3a03001 	mov	r3, #1	; 0x1
  103658:	e1a03213 	mov	r3, r3, lsl r2
  10365c:	e1a0100c 	mov	r1, ip
  103660:	e58c3008 	str	r3, [ip, #8]
  103664:	eb0008fe 	bl	105a64 <_Bfree>
  103668:	e59d2008 	ldr	r2, [sp, #8]
  10366c:	e3a03000 	mov	r3, #0	; 0x0
  103670:	e5823040 	str	r3, [r2, #64]
  103674:	e2583000 	subs	r3, r8, #0	; 0x0
  103678:	b3c38102 	biclt	r8, r3, #-2147483648	; 0x80000000
  10367c:	a3a03000 	movge	r3, #0	; 0x0
  103680:	b3a03001 	movlt	r3, #1	; 0x1
  103684:	e3c82102 	bic	r2, r8, #-2147483648	; 0x80000000
  103688:	b5843000 	strlt	r3, [r4]
  10368c:	a5843000 	strge	r3, [r4]
  103690:	e1a02a22 	mov	r2, r2, lsr #20
  103694:	e3a0347f 	mov	r3, #2130706432	; 0x7f000000
  103698:	e283360f 	add	r3, r3, #15728640	; 0xf00000
  10369c:	e1a02a02 	mov	r2, r2, lsl #20
  1036a0:	e1520003 	cmp	r2, r3
  1036a4:	e1a04008 	mov	r4, r8
  1036a8:	0a000087 	beq	1038cc <prog+0x3888>
  1036ac:	e1a00008 	mov	r0, r8
  1036b0:	e1a01009 	mov	r1, r9
  1036b4:	e3a02000 	mov	r2, #0	; 0x0
  1036b8:	e3a03000 	mov	r3, #0	; 0x0
  1036bc:	e58d800c 	str	r8, [sp, #12]
  1036c0:	e58d9010 	str	r9, [sp, #16]
  1036c4:	eb0012d3 	bl	108218 <__nedf2>
  1036c8:	e3500000 	cmp	r0, #0	; 0x0
  1036cc:	1a00000b 	bne	103700 <_dtoa_r+0xe0>
  1036d0:	e59d2080 	ldr	r2, [sp, #128]
  1036d4:	e59dc078 	ldr	ip, [sp, #120]
  1036d8:	e3520000 	cmp	r2, #0	; 0x0
  1036dc:	e3a03001 	mov	r3, #1	; 0x1
  1036e0:	e58c3000 	str	r3, [ip]
  1036e4:	159de080 	ldrne	lr, [sp, #128]
  1036e8:	159f3448 	ldrne	r3, [pc, #1096]	; 103b38 <prog+0x3af4>
  1036ec:	059f0448 	ldreq	r0, [pc, #1096]	; 103b3c <prog+0x3af8>
  1036f0:	158e3000 	strne	r3, [lr]
  1036f4:	12430001 	subne	r0, r3, #1	; 0x1
  1036f8:	e28dd050 	add	sp, sp, #80	; 0x50
  1036fc:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  103700:	e28d100c 	add	r1, sp, #12	; 0xc
  103704:	e8910006 	ldmia	r1, {r1, r2}
  103708:	e28d3048 	add	r3, sp, #72	; 0x48
  10370c:	e28dc04c 	add	ip, sp, #76	; 0x4c
  103710:	e59d0008 	ldr	r0, [sp, #8]
  103714:	e58dc000 	str	ip, [sp]
  103718:	eb0009c7 	bl	105e3c <_d2b>
  10371c:	e1a03a28 	mov	r3, r8, lsr #20
  103720:	e1a02a83 	mov	r2, r3, lsl #21
  103724:	e1a02aa2 	mov	r2, r2, lsr #21
  103728:	e3520000 	cmp	r2, #0	; 0x0
  10372c:	e58d0038 	str	r0, [sp, #56]
  103730:	0a00007c 	beq	103928 <prog+0x38e4>
  103734:	e28d000c 	add	r0, sp, #12	; 0xc
  103738:	e8900003 	ldmia	r0, {r0, r1}
  10373c:	e3c034ff 	bic	r3, r0, #-16777216	; 0xff000000
  103740:	e2426fff 	sub	r6, r2, #1020	; 0x3fc
  103744:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  103748:	e3a02000 	mov	r2, #0	; 0x0
  10374c:	e38305ff 	orr	r0, r3, #1069547520	; 0x3fc00000
  103750:	e59d704c 	ldr	r7, [sp, #76]
  103754:	e58d2034 	str	r2, [sp, #52]
  103758:	e2466003 	sub	r6, r6, #3	; 0x3
  10375c:	e3800603 	orr	r0, r0, #3145728	; 0x300000
  103760:	e3a025ff 	mov	r2, #1069547520	; 0x3fc00000
  103764:	e282270e 	add	r2, r2, #3670016	; 0x380000
  103768:	e3a03000 	mov	r3, #0	; 0x0
  10376c:	eb0010db 	bl	107ae0 <__subdf3>
  103770:	e28f2fea 	add	r2, pc, #936	; 0x3a8
  103774:	e892000c 	ldmia	r2, {r2, r3}
  103778:	eb001117 	bl	107bdc <__muldf3>
  10377c:	e28f2fe9 	add	r2, pc, #932	; 0x3a4
  103780:	e892000c 	ldmia	r2, {r2, r3}
  103784:	eb0010ed 	bl	107b40 <__adddf3>
  103788:	e1a04000 	mov	r4, r0
  10378c:	e1a00006 	mov	r0, r6
  103790:	e1a05001 	mov	r5, r1
  103794:	eb001322 	bl	108424 <__floatsidf>
  103798:	e28f2e39 	add	r2, pc, #912	; 0x390
  10379c:	e892000c 	ldmia	r2, {r2, r3}
  1037a0:	eb00110d 	bl	107bdc <__muldf3>
  1037a4:	e1a02000 	mov	r2, r0
  1037a8:	e1a03001 	mov	r3, r1
  1037ac:	e1a00004 	mov	r0, r4
  1037b0:	e1a01005 	mov	r1, r5
  1037b4:	eb0010e1 	bl	107b40 <__adddf3>
  1037b8:	e1a04000 	mov	r4, r0
  1037bc:	e1a05001 	mov	r5, r1
  1037c0:	eb001355 	bl	10851c <__fixdfsi>
  1037c4:	e1a01005 	mov	r1, r5
  1037c8:	e58d0024 	str	r0, [sp, #36]
  1037cc:	e3a02000 	mov	r2, #0	; 0x0
  1037d0:	e1a00004 	mov	r0, r4
  1037d4:	e3a03000 	mov	r3, #0	; 0x0
  1037d8:	eb0012f4 	bl	1083b0 <__ltdf2>
  1037dc:	e3500000 	cmp	r0, #0	; 0x0
  1037e0:	ba0002fd 	blt	1043dc <prog+0x4398>
  1037e4:	e59de024 	ldr	lr, [sp, #36]
  1037e8:	e35e0016 	cmp	lr, #22	; 0x16
  1037ec:	83a00001 	movhi	r0, #1	; 0x1
  1037f0:	858d0028 	strhi	r0, [sp, #40]
  1037f4:	8a00000e 	bhi	103834 <_dtoa_r+0x214>
  1037f8:	e59d2024 	ldr	r2, [sp, #36]
  1037fc:	e59f1344 	ldr	r1, [pc, #836]	; 103b48 <prog+0x3b04>
  103800:	e0811182 	add	r1, r1, r2, lsl #3
  103804:	e891000c 	ldmia	r1, {r2, r3}
  103808:	e28d000c 	add	r0, sp, #12	; 0xc
  10380c:	e8900003 	ldmia	r0, {r0, r1}
  103810:	eb0012e6 	bl	1083b0 <__ltdf2>
  103814:	e3500000 	cmp	r0, #0	; 0x0
  103818:	b59dc024 	ldrlt	ip, [sp, #36]
  10381c:	a3a03000 	movge	r3, #0	; 0x0
  103820:	b24cc001 	sublt	ip, ip, #1	; 0x1
  103824:	b3a0e000 	movlt	lr, #0	; 0x0
  103828:	a58d3028 	strge	r3, [sp, #40]
  10382c:	b58dc024 	strlt	ip, [sp, #36]
  103830:	b58de028 	strlt	lr, [sp, #40]
  103834:	e0663007 	rsb	r3, r6, r7
  103838:	e2532001 	subs	r2, r3, #1	; 0x1
  10383c:	e59d1024 	ldr	r1, [sp, #36]
  103840:	42622000 	rsbmi	r2, r2, #0	; 0x0
  103844:	53a00000 	movpl	r0, #0	; 0x0
  103848:	51a0b002 	movpl	fp, r2
  10384c:	458d2014 	strmi	r2, [sp, #20]
  103850:	43a0b000 	movmi	fp, #0	; 0x0
  103854:	558d0014 	strpl	r0, [sp, #20]
  103858:	e3510000 	cmp	r1, #0	; 0x0
  10385c:	a3a02000 	movge	r2, #0	; 0x0
  103860:	a08bb001 	addge	fp, fp, r1
  103864:	a58d1030 	strge	r1, [sp, #48]
  103868:	a58d2018 	strge	r2, [sp, #24]
  10386c:	ba0002e6 	blt	10440c <prog+0x43c8>
  103870:	e59d1004 	ldr	r1, [sp, #4]
  103874:	e3510009 	cmp	r1, #9	; 0x9
  103878:	83a02000 	movhi	r2, #0	; 0x0
  10387c:	858d2004 	strhi	r2, [sp, #4]
  103880:	83a05001 	movhi	r5, #1	; 0x1
  103884:	8a00003e 	bhi	103984 <prog+0x3940>
  103888:	e59d3004 	ldr	r3, [sp, #4]
  10388c:	e3530005 	cmp	r3, #5	; 0x5
  103890:	c59dc004 	ldrgt	ip, [sp, #4]
  103894:	c24cc004 	subgt	ip, ip, #4	; 0x4
  103898:	c58dc004 	strgt	ip, [sp, #4]
  10389c:	e59de004 	ldr	lr, [sp, #4]
  1038a0:	d3a00001 	movle	r0, #1	; 0x1
  1038a4:	c3a00000 	movgt	r0, #0	; 0x0
  1038a8:	e35e0005 	cmp	lr, #5	; 0x5
  1038ac:	979ff10e 	ldrls	pc, [pc, lr, lsl #2]
  1038b0:	ea000279 	b	10429c <prog+0x4258>
  1038b4:	00103980 	andeqs	r3, r0, r0, lsl #19
  1038b8:	00103980 	andeqs	r3, r0, r0, lsl #19
  1038bc:	0010438c 	andeqs	r4, r0, ip, lsl #7
  1038c0:	00104300 	andeqs	r4, r0, r0, lsl #6
  1038c4:	00104344 	andeqs	r4, r0, r4, asr #6
  1038c8:	00104380 	andeqs	r4, r0, r0, lsl #7
  1038cc:	e3a03c27 	mov	r3, #9984	; 0x2700
  1038d0:	e59dc078 	ldr	ip, [sp, #120]
  1038d4:	e283300f 	add	r3, r3, #15	; 0xf
  1038d8:	e3590000 	cmp	r9, #0	; 0x0
  1038dc:	e58c3000 	str	r3, [ip]
  1038e0:	0a00000a 	beq	103910 <prog+0x38cc>
  1038e4:	e59f0254 	ldr	r0, [pc, #596]	; 103b40 <prog+0x3afc>
  1038e8:	e59de080 	ldr	lr, [sp, #128]
  1038ec:	e35e0000 	cmp	lr, #0	; 0x0
  1038f0:	0affff80 	beq	1036f8 <_dtoa_r+0xd8>
  1038f4:	e5d03003 	ldrb	r3, [r0, #3]
  1038f8:	e59d1080 	ldr	r1, [sp, #128]
  1038fc:	e3530000 	cmp	r3, #0	; 0x0
  103900:	e2803003 	add	r3, r0, #3	; 0x3
  103904:	12803008 	addne	r3, r0, #8	; 0x8
  103908:	e5813000 	str	r3, [r1]
  10390c:	eaffff79 	b	1036f8 <_dtoa_r+0xd8>
  103910:	e3c834ff 	bic	r3, r8, #-16777216	; 0xff000000
  103914:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  103918:	e3530000 	cmp	r3, #0	; 0x0
  10391c:	059f0220 	ldreq	r0, [pc, #544]	; 103b44 <prog+0x3b00>
  103920:	0afffff0 	beq	1038e8 <prog+0x38a4>
  103924:	eaffffee 	b	1038e4 <prog+0x38a0>
  103928:	e28d2048 	add	r2, sp, #72	; 0x48
  10392c:	e8920084 	ldmia	r2, {r2, r7}
  103930:	e2873e43 	add	r3, r7, #1072	; 0x430
  103934:	e2833002 	add	r3, r3, #2	; 0x2
  103938:	e0835002 	add	r5, r3, r2
  10393c:	e3550020 	cmp	r5, #32	; 0x20
  103940:	c2453020 	subgt	r3, r5, #32	; 0x20
  103944:	c1a03339 	movgt	r3, r9, lsr r3
  103948:	c2652040 	rsbgt	r2, r5, #64	; 0x40
  10394c:	d2653020 	rsble	r3, r5, #32	; 0x20
  103950:	c1834218 	orrgt	r4, r3, r8, lsl r2
  103954:	d1a04319 	movle	r4, r9, lsl r3
  103958:	e1a00004 	mov	r0, r4
  10395c:	eb0012b0 	bl	108424 <__floatsidf>
  103960:	e3540000 	cmp	r4, #0	; 0x0
  103964:	ba0003c4 	blt	10487c <prog+0x4838>
  103968:	e2456e43 	sub	r6, r5, #1072	; 0x430
  10396c:	e3a03001 	mov	r3, #1	; 0x1
  103970:	e2466003 	sub	r6, r6, #3	; 0x3
  103974:	e240061f 	sub	r0, r0, #32505856	; 0x1f00000
  103978:	e58d3034 	str	r3, [sp, #52]
  10397c:	eaffff77 	b	103760 <_dtoa_r+0x140>
  103980:	e1a05000 	mov	r5, r0
  103984:	e3a03000 	mov	r3, #0	; 0x0
  103988:	e3e0c000 	mvn	ip, #0	; 0x0
  10398c:	e3a0e001 	mov	lr, #1	; 0x1
  103990:	e58d3074 	str	r3, [sp, #116]
  103994:	e58dc020 	str	ip, [sp, #32]
  103998:	e58dc01c 	str	ip, [sp, #28]
  10399c:	e58de02c 	str	lr, [sp, #44]
  1039a0:	e1a04003 	mov	r4, r3
  1039a4:	e59dc008 	ldr	ip, [sp, #8]
  1039a8:	e3a03000 	mov	r3, #0	; 0x0
  1039ac:	e58c3044 	str	r3, [ip, #68]
  1039b0:	e59d0008 	ldr	r0, [sp, #8]
  1039b4:	e5901044 	ldr	r1, [r0, #68]
  1039b8:	eb0008f9 	bl	105da4 <_Balloc>
  1039bc:	e59dc008 	ldr	ip, [sp, #8]
  1039c0:	e1150004 	tst	r5, r4
  1039c4:	e58d0040 	str	r0, [sp, #64]
  1039c8:	e58c0040 	str	r0, [ip, #64]
  1039cc:	0a0000d8 	beq	103d34 <prog+0x3cf0>
  1039d0:	e59de024 	ldr	lr, [sp, #36]
  1039d4:	e35e0000 	cmp	lr, #0	; 0x0
  1039d8:	da000385 	ble	1047f4 <prog+0x47b0>
  1039dc:	e59f3164 	ldr	r3, [pc, #356]	; 103b48 <prog+0x3b04>
  1039e0:	e20e200f 	and	r2, lr, #15	; 0xf
  1039e4:	e1a0424e 	mov	r4, lr, asr #4
  1039e8:	e0833182 	add	r3, r3, r2, lsl #3
  1039ec:	e3140010 	tst	r4, #16	; 0x10
  1039f0:	e8930060 	ldmia	r3, {r5, r6}
  1039f4:	03a0a002 	moveq	sl, #2	; 0x2
  1039f8:	1a0001b0 	bne	1040c0 <prog+0x407c>
  1039fc:	e3540000 	cmp	r4, #0	; 0x0
  103a00:	0a00000c 	beq	103a38 <prog+0x39f4>
  103a04:	e59f7140 	ldr	r7, [pc, #320]	; 103b4c <prog+0x3b08>
  103a08:	e3140001 	tst	r4, #1	; 0x1
  103a0c:	e1a00005 	mov	r0, r5
  103a10:	e1a01006 	mov	r1, r6
  103a14:	0a000004 	beq	103a2c <prog+0x39e8>
  103a18:	e897000c 	ldmia	r7, {r2, r3}
  103a1c:	eb00106e 	bl	107bdc <__muldf3>
  103a20:	e28aa001 	add	sl, sl, #1	; 0x1
  103a24:	e1a05000 	mov	r5, r0
  103a28:	e1a06001 	mov	r6, r1
  103a2c:	e1b040c4 	movs	r4, r4, asr #1
  103a30:	e2877008 	add	r7, r7, #8	; 0x8
  103a34:	1afffff3 	bne	103a08 <prog+0x39c4>
  103a38:	e1a00008 	mov	r0, r8
  103a3c:	e1a01009 	mov	r1, r9
  103a40:	e1a02005 	mov	r2, r5
  103a44:	e1a03006 	mov	r3, r6
  103a48:	eb001147 	bl	107f6c <__divdf3>
  103a4c:	e1a08000 	mov	r8, r0
  103a50:	e1a09001 	mov	r9, r1
  103a54:	e59d1028 	ldr	r1, [sp, #40]
  103a58:	e3510000 	cmp	r1, #0	; 0x0
  103a5c:	0a00003b 	beq	103b50 <prog+0x3b0c>
  103a60:	e3a025ff 	mov	r2, #1069547520	; 0x3fc00000
  103a64:	e2822603 	add	r2, r2, #3145728	; 0x300000
  103a68:	e3a03000 	mov	r3, #0	; 0x0
  103a6c:	e1a00008 	mov	r0, r8
  103a70:	e1a01009 	mov	r1, r9
  103a74:	eb00124d 	bl	1083b0 <__ltdf2>
  103a78:	e59d201c 	ldr	r2, [sp, #28]
  103a7c:	e3500000 	cmp	r0, #0	; 0x0
  103a80:	e3a03000 	mov	r3, #0	; 0x0
  103a84:	b3a03001 	movlt	r3, #1	; 0x1
  103a88:	e3520000 	cmp	r2, #0	; 0x0
  103a8c:	d3a03000 	movle	r3, #0	; 0x0
  103a90:	c2033001 	andgt	r3, r3, #1	; 0x1
  103a94:	e3530000 	cmp	r3, #0	; 0x0
  103a98:	e1a04008 	mov	r4, r8
  103a9c:	e1a05009 	mov	r5, r9
  103aa0:	0a00002a 	beq	103b50 <prog+0x3b0c>
  103aa4:	e59d3020 	ldr	r3, [sp, #32]
  103aa8:	e3530000 	cmp	r3, #0	; 0x0
  103aac:	da00009e 	ble	103d2c <prog+0x3ce8>
  103ab0:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103ab4:	e2822709 	add	r2, r2, #2359296	; 0x240000
  103ab8:	e3a03000 	mov	r3, #0	; 0x0
  103abc:	e1a00008 	mov	r0, r8
  103ac0:	e1a01009 	mov	r1, r9
  103ac4:	eb001044 	bl	107bdc <__muldf3>
  103ac8:	e1a04000 	mov	r4, r0
  103acc:	e28a0001 	add	r0, sl, #1	; 0x1
  103ad0:	e1a05001 	mov	r5, r1
  103ad4:	eb001252 	bl	108424 <__floatsidf>
  103ad8:	e1a02000 	mov	r2, r0
  103adc:	e1a03001 	mov	r3, r1
  103ae0:	e1a00004 	mov	r0, r4
  103ae4:	e1a01005 	mov	r1, r5
  103ae8:	eb00103b 	bl	107bdc <__muldf3>
  103aec:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103af0:	e2822707 	add	r2, r2, #1835008	; 0x1c0000
  103af4:	e3a03000 	mov	r3, #0	; 0x0
  103af8:	eb001010 	bl	107b40 <__adddf3>
  103afc:	e28da020 	add	sl, sp, #32	; 0x20
  103b00:	e89a1400 	ldmia	sl, {sl, ip}
  103b04:	e24cc001 	sub	ip, ip, #1	; 0x1
  103b08:	e1a07001 	mov	r7, r1
  103b0c:	e1a08004 	mov	r8, r4
  103b10:	e1a09005 	mov	r9, r5
  103b14:	e240650d 	sub	r6, r0, #54525952	; 0x3400000
  103b18:	e58dc044 	str	ip, [sp, #68]
  103b1c:	ea00001c 	b	103b94 <prog+0x3b50>
  103b20:	3fd287a7 	swicc	0x00d287a7
  103b24:	636f4361 	cmnvs	pc, #-2080374783	; 0x84000001
  103b28:	3fc68a28 	swicc	0x00c68a28
  103b2c:	8b60c8b3 	blhi	1935e00 <__stack_end__+0x1731e04>
  103b30:	3fd34413 	swicc	0x00d34413
  103b34:	509f79fb 	ldrplsh	r7, [pc], fp
  103b38:	0010b9d1 	ldreqsb	fp, [r0], -r1
  103b3c:	0010b9d0 	ldreqsb	fp, [r0], -r0
  103b40:	0010ba0c 	andeqs	fp, r0, ip, lsl #20
  103b44:	0010ba00 	andeqs	fp, r0, r0, lsl #20
  103b48:	0010b704 	andeqs	fp, r0, r4, lsl #14
  103b4c:	0010b7cc 	andeqs	fp, r0, ip, asr #15
  103b50:	e1a0000a 	mov	r0, sl
  103b54:	eb001232 	bl	108424 <__floatsidf>
  103b58:	e1a02008 	mov	r2, r8
  103b5c:	e1a03009 	mov	r3, r9
  103b60:	eb00101d 	bl	107bdc <__muldf3>
  103b64:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103b68:	e2822707 	add	r2, r2, #1835008	; 0x1c0000
  103b6c:	e3a03000 	mov	r3, #0	; 0x0
  103b70:	eb000ff2 	bl	107b40 <__adddf3>
  103b74:	e59de01c 	ldr	lr, [sp, #28]
  103b78:	e35e0000 	cmp	lr, #0	; 0x0
  103b7c:	e1a07001 	mov	r7, r1
  103b80:	e240650d 	sub	r6, r0, #54525952	; 0x3400000
  103b84:	0a000158 	beq	1040ec <prog+0x40a8>
  103b88:	e59d0024 	ldr	r0, [sp, #36]
  103b8c:	e59da01c 	ldr	sl, [sp, #28]
  103b90:	e58d0044 	str	r0, [sp, #68]
  103b94:	e59d102c 	ldr	r1, [sp, #44]
  103b98:	e3510000 	cmp	r1, #0	; 0x0
  103b9c:	0a0002c1 	beq	1046a8 <prog+0x4664>
  103ba0:	e51f1060 	ldr	r1, [pc, #-96]	; 103b48 <prog+0x3b04>
  103ba4:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  103ba8:	e081118a 	add	r1, r1, sl, lsl #3
  103bac:	e911000c 	ldmdb	r1, {r2, r3}
  103bb0:	e2800602 	add	r0, r0, #2097152	; 0x200000
  103bb4:	e3a01000 	mov	r1, #0	; 0x0
  103bb8:	eb0010eb 	bl	107f6c <__divdf3>
  103bbc:	e1a02006 	mov	r2, r6
  103bc0:	e1a03007 	mov	r3, r7
  103bc4:	eb000fc5 	bl	107ae0 <__subdf3>
  103bc8:	e1a06008 	mov	r6, r8
  103bcc:	e1a07009 	mov	r7, r9
  103bd0:	e1a08000 	mov	r8, r0
  103bd4:	e1a09001 	mov	r9, r1
  103bd8:	e1a00006 	mov	r0, r6
  103bdc:	e1a01007 	mov	r1, r7
  103be0:	eb00124d 	bl	10851c <__fixdfsi>
  103be4:	e1a04000 	mov	r4, r0
  103be8:	eb00120d 	bl	108424 <__floatsidf>
  103bec:	e1a02000 	mov	r2, r0
  103bf0:	e1a03001 	mov	r3, r1
  103bf4:	e1a00006 	mov	r0, r6
  103bf8:	e1a01007 	mov	r1, r7
  103bfc:	eb000fb7 	bl	107ae0 <__subdf3>
  103c00:	e59d7040 	ldr	r7, [sp, #64]
  103c04:	e2844030 	add	r4, r4, #48	; 0x30
  103c08:	e4c74001 	strb	r4, [r7], #1
  103c0c:	e1a02008 	mov	r2, r8
  103c10:	e1a03009 	mov	r3, r9
  103c14:	e1a05000 	mov	r5, r0
  103c18:	e1a06001 	mov	r6, r1
  103c1c:	eb0011e3 	bl	1083b0 <__ltdf2>
  103c20:	e3500000 	cmp	r0, #0	; 0x0
  103c24:	ba00003d 	blt	103d20 <prog+0x3cdc>
  103c28:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  103c2c:	e1a02005 	mov	r2, r5
  103c30:	e1a03006 	mov	r3, r6
  103c34:	e2800603 	add	r0, r0, #3145728	; 0x300000
  103c38:	e3a01000 	mov	r1, #0	; 0x0
  103c3c:	eb000fa7 	bl	107ae0 <__subdf3>
  103c40:	e1a02008 	mov	r2, r8
  103c44:	e1a03009 	mov	r3, r9
  103c48:	eb0011d8 	bl	1083b0 <__ltdf2>
  103c4c:	e3500000 	cmp	r0, #0	; 0x0
  103c50:	ba000088 	blt	103e78 <prog+0x3e34>
  103c54:	e35a0001 	cmp	sl, #1	; 0x1
  103c58:	ca00000a 	bgt	103c88 <prog+0x3c44>
  103c5c:	ea000032 	b	103d2c <prog+0x3ce8>
  103c60:	eb000f9e 	bl	107ae0 <__subdf3>
  103c64:	e1a02008 	mov	r2, r8
  103c68:	e1a03009 	mov	r3, r9
  103c6c:	eb0011cf 	bl	1083b0 <__ltdf2>
  103c70:	e59d2040 	ldr	r2, [sp, #64]
  103c74:	e3500000 	cmp	r0, #0	; 0x0
  103c78:	e08a3002 	add	r3, sl, r2
  103c7c:	ba00007d 	blt	103e78 <prog+0x3e34>
  103c80:	e1570003 	cmp	r7, r3
  103c84:	0a000028 	beq	103d2c <prog+0x3ce8>
  103c88:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103c8c:	e1a00008 	mov	r0, r8
  103c90:	e1a01009 	mov	r1, r9
  103c94:	e2822709 	add	r2, r2, #2359296	; 0x240000
  103c98:	e3a03000 	mov	r3, #0	; 0x0
  103c9c:	eb000fce 	bl	107bdc <__muldf3>
  103ca0:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103ca4:	e2822709 	add	r2, r2, #2359296	; 0x240000
  103ca8:	e3a03000 	mov	r3, #0	; 0x0
  103cac:	e1a08000 	mov	r8, r0
  103cb0:	e1a09001 	mov	r9, r1
  103cb4:	e1a00005 	mov	r0, r5
  103cb8:	e1a01006 	mov	r1, r6
  103cbc:	eb000fc6 	bl	107bdc <__muldf3>
  103cc0:	e1a06001 	mov	r6, r1
  103cc4:	e1a05000 	mov	r5, r0
  103cc8:	eb001213 	bl	10851c <__fixdfsi>
  103ccc:	e1a04000 	mov	r4, r0
  103cd0:	eb0011d3 	bl	108424 <__floatsidf>
  103cd4:	e1a02000 	mov	r2, r0
  103cd8:	e1a03001 	mov	r3, r1
  103cdc:	e1a00005 	mov	r0, r5
  103ce0:	e1a01006 	mov	r1, r6
  103ce4:	eb000f7d 	bl	107ae0 <__subdf3>
  103ce8:	e2844030 	add	r4, r4, #48	; 0x30
  103cec:	e1a02008 	mov	r2, r8
  103cf0:	e1a03009 	mov	r3, r9
  103cf4:	e4c74001 	strb	r4, [r7], #1
  103cf8:	e1a06001 	mov	r6, r1
  103cfc:	e1a05000 	mov	r5, r0
  103d00:	eb0011aa 	bl	1083b0 <__ltdf2>
  103d04:	e3500000 	cmp	r0, #0	; 0x0
  103d08:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  103d0c:	e1a02005 	mov	r2, r5
  103d10:	e1a03006 	mov	r3, r6
  103d14:	e2800603 	add	r0, r0, #3145728	; 0x300000
  103d18:	e3a01000 	mov	r1, #0	; 0x0
  103d1c:	aaffffcf 	bge	103c60 <prog+0x3c1c>
  103d20:	e59d3044 	ldr	r3, [sp, #68]
  103d24:	e58d3024 	str	r3, [sp, #36]
  103d28:	ea00011a 	b	104198 <prog+0x4154>
  103d2c:	e28d800c 	add	r8, sp, #12	; 0xc
  103d30:	e8980300 	ldmia	r8, {r8, r9}
  103d34:	e59d2048 	ldr	r2, [sp, #72]
  103d38:	e59de024 	ldr	lr, [sp, #36]
  103d3c:	e1e03002 	mvn	r3, r2
  103d40:	e1a03fa3 	mov	r3, r3, lsr #31
  103d44:	e35e000e 	cmp	lr, #14	; 0xe
  103d48:	c3a03000 	movgt	r3, #0	; 0x0
  103d4c:	e3530000 	cmp	r3, #0	; 0x0
  103d50:	0a00005d 	beq	103ecc <prog+0x3e88>
  103d54:	e59d001c 	ldr	r0, [sp, #28]
  103d58:	e59d1074 	ldr	r1, [sp, #116]
  103d5c:	e51f321c 	ldr	r3, [pc, #-540]	; 103b48 <prog+0x3b04>
  103d60:	e3500000 	cmp	r0, #0	; 0x0
  103d64:	c3a02000 	movgt	r2, #0	; 0x0
  103d68:	d3a02001 	movle	r2, #1	; 0x1
  103d6c:	e083318e 	add	r3, r3, lr, lsl #3
  103d70:	e0121fa1 	ands	r1, r2, r1, lsr #31
  103d74:	e8930c00 	ldmia	r3, {sl, fp}
  103d78:	1a000137 	bne	10425c <prog+0x4218>
  103d7c:	e59d3040 	ldr	r3, [sp, #64]
  103d80:	e59d201c 	ldr	r2, [sp, #28]
  103d84:	e1a04008 	mov	r4, r8
  103d88:	e1a05009 	mov	r5, r9
  103d8c:	e0828003 	add	r8, r2, r3
  103d90:	e1a07003 	mov	r7, r3
  103d94:	ea000007 	b	103db8 <prog+0x3d74>
  103d98:	eb000f8f 	bl	107bdc <__muldf3>
  103d9c:	e3a02000 	mov	r2, #0	; 0x0
  103da0:	e3a03000 	mov	r3, #0	; 0x0
  103da4:	e1a04000 	mov	r4, r0
  103da8:	e1a05001 	mov	r5, r1
  103dac:	eb001119 	bl	108218 <__nedf2>
  103db0:	e3500000 	cmp	r0, #0	; 0x0
  103db4:	0a0000f7 	beq	104198 <prog+0x4154>
  103db8:	e1a0200a 	mov	r2, sl
  103dbc:	e1a0300b 	mov	r3, fp
  103dc0:	e1a00004 	mov	r0, r4
  103dc4:	e1a01005 	mov	r1, r5
  103dc8:	eb001067 	bl	107f6c <__divdf3>
  103dcc:	eb0011d2 	bl	10851c <__fixdfsi>
  103dd0:	e1a06000 	mov	r6, r0
  103dd4:	eb001192 	bl	108424 <__floatsidf>
  103dd8:	e1a02000 	mov	r2, r0
  103ddc:	e1a03001 	mov	r3, r1
  103de0:	e1a0000a 	mov	r0, sl
  103de4:	e1a0100b 	mov	r1, fp
  103de8:	eb000f7b 	bl	107bdc <__muldf3>
  103dec:	e1a02000 	mov	r2, r0
  103df0:	e1a03001 	mov	r3, r1
  103df4:	e1a00004 	mov	r0, r4
  103df8:	e1a01005 	mov	r1, r5
  103dfc:	eb000f37 	bl	107ae0 <__subdf3>
  103e00:	e286c030 	add	ip, r6, #48	; 0x30
  103e04:	e4c7c001 	strb	ip, [r7], #1
  103e08:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  103e0c:	e1580007 	cmp	r8, r7
  103e10:	e2822709 	add	r2, r2, #2359296	; 0x240000
  103e14:	e3a03000 	mov	r3, #0	; 0x0
  103e18:	1affffde 	bne	103d98 <prog+0x3d54>
  103e1c:	e1a02000 	mov	r2, r0
  103e20:	e1a03001 	mov	r3, r1
  103e24:	eb000f45 	bl	107b40 <__adddf3>
  103e28:	e1a04000 	mov	r4, r0
  103e2c:	e1a05001 	mov	r5, r1
  103e30:	e1a0000a 	mov	r0, sl
  103e34:	e1a0100b 	mov	r1, fp
  103e38:	e1a02004 	mov	r2, r4
  103e3c:	e1a03005 	mov	r3, r5
  103e40:	eb00115a 	bl	1083b0 <__ltdf2>
  103e44:	e3500000 	cmp	r0, #0	; 0x0
  103e48:	ba000008 	blt	103e70 <prog+0x3e2c>
  103e4c:	e1a0000a 	mov	r0, sl
  103e50:	e1a0100b 	mov	r1, fp
  103e54:	e1a02004 	mov	r2, r4
  103e58:	e1a03005 	mov	r3, r5
  103e5c:	eb0010cb 	bl	108190 <__eqdf2>
  103e60:	e3500000 	cmp	r0, #0	; 0x0
  103e64:	1a0000cb 	bne	104198 <prog+0x4154>
  103e68:	e3160001 	tst	r6, #1	; 0x1
  103e6c:	0a0000c9 	beq	104198 <prog+0x4154>
  103e70:	e59d0024 	ldr	r0, [sp, #36]
  103e74:	e58d0044 	str	r0, [sp, #68]
  103e78:	e1a02007 	mov	r2, r7
  103e7c:	e59d3040 	ldr	r3, [sp, #64]
  103e80:	e0671003 	rsb	r1, r7, r3
  103e84:	e5723001 	ldrb	r3, [r2, #-1]!
  103e88:	e3530039 	cmp	r3, #57	; 0x39
  103e8c:	1a000008 	bne	103eb4 <prog+0x3e70>
  103e90:	e59dc040 	ldr	ip, [sp, #64]
  103e94:	e15c0002 	cmp	ip, r2
  103e98:	1afffff7 	bne	103e7c <prog+0x3e38>
  103e9c:	e3a03030 	mov	r3, #48	; 0x30
  103ea0:	e5cc3000 	strb	r3, [ip]
  103ea4:	e59de044 	ldr	lr, [sp, #68]
  103ea8:	e28ee001 	add	lr, lr, #1	; 0x1
  103eac:	e7d13007 	ldrb	r3, [r1, r7]
  103eb0:	e58de044 	str	lr, [sp, #68]
  103eb4:	e2833001 	add	r3, r3, #1	; 0x1
  103eb8:	e4c23001 	strb	r3, [r2], #1
  103ebc:	e59dc044 	ldr	ip, [sp, #68]
  103ec0:	e1a07002 	mov	r7, r2
  103ec4:	e58dc024 	str	ip, [sp, #36]
  103ec8:	ea0000b2 	b	104198 <prog+0x4154>
  103ecc:	e59de02c 	ldr	lr, [sp, #44]
  103ed0:	e35e0000 	cmp	lr, #0	; 0x0
  103ed4:	1a0000bf 	bne	1041d8 <prog+0x4194>
  103ed8:	e59d7014 	ldr	r7, [sp, #20]
  103edc:	e59d5018 	ldr	r5, [sp, #24]
  103ee0:	e1a0a00e 	mov	sl, lr
  103ee4:	e3570000 	cmp	r7, #0	; 0x0
  103ee8:	c35b0000 	cmpgt	fp, #0	; 0x0
  103eec:	da000007 	ble	103f10 <prog+0x3ecc>
  103ef0:	e59de014 	ldr	lr, [sp, #20]
  103ef4:	e157000b 	cmp	r7, fp
  103ef8:	b1a03007 	movlt	r3, r7
  103efc:	a1a0300b 	movge	r3, fp
  103f00:	e063e00e 	rsb	lr, r3, lr
  103f04:	e58de014 	str	lr, [sp, #20]
  103f08:	e063b00b 	rsb	fp, r3, fp
  103f0c:	e0637007 	rsb	r7, r3, r7
  103f10:	e59d0018 	ldr	r0, [sp, #24]
  103f14:	e3500000 	cmp	r0, #0	; 0x0
  103f18:	da000015 	ble	103f74 <prog+0x3f30>
  103f1c:	e59d102c 	ldr	r1, [sp, #44]
  103f20:	e3510000 	cmp	r1, #0	; 0x0
  103f24:	0a00027b 	beq	104918 <prog+0x48d4>
  103f28:	e3550000 	cmp	r5, #0	; 0x0
  103f2c:	da00000d 	ble	103f68 <prog+0x3f24>
  103f30:	e1a0100a 	mov	r1, sl
  103f34:	e1a02005 	mov	r2, r5
  103f38:	e59d0008 	ldr	r0, [sp, #8]
  103f3c:	eb00093f 	bl	106440 <_pow5mult>
  103f40:	e1a0a000 	mov	sl, r0
  103f44:	e1a0100a 	mov	r1, sl
  103f48:	e59d2038 	ldr	r2, [sp, #56]
  103f4c:	e59d0008 	ldr	r0, [sp, #8]
  103f50:	eb000890 	bl	106198 <_multiply>
  103f54:	e59d1038 	ldr	r1, [sp, #56]
  103f58:	e1a04000 	mov	r4, r0
  103f5c:	e59d0008 	ldr	r0, [sp, #8]
  103f60:	eb0006bf 	bl	105a64 <_Bfree>
  103f64:	e58d4038 	str	r4, [sp, #56]
  103f68:	e59d3018 	ldr	r3, [sp, #24]
  103f6c:	e0532005 	subs	r2, r3, r5
  103f70:	1a000270 	bne	104938 <prog+0x48f4>
  103f74:	e59d0008 	ldr	r0, [sp, #8]
  103f78:	e3a01001 	mov	r1, #1	; 0x1
  103f7c:	eb0008f5 	bl	106358 <_i2b>
  103f80:	e59dc030 	ldr	ip, [sp, #48]
  103f84:	e35c0000 	cmp	ip, #0	; 0x0
  103f88:	e1a06000 	mov	r6, r0
  103f8c:	da000004 	ble	103fa4 <prog+0x3f60>
  103f90:	e1a01000 	mov	r1, r0
  103f94:	e1a0200c 	mov	r2, ip
  103f98:	e59d0008 	ldr	r0, [sp, #8]
  103f9c:	eb000927 	bl	106440 <_pow5mult>
  103fa0:	e1a06000 	mov	r6, r0
  103fa4:	e59de004 	ldr	lr, [sp, #4]
  103fa8:	e35e0001 	cmp	lr, #1	; 0x1
  103fac:	da0000f9 	ble	104398 <prog+0x4354>
  103fb0:	e3a04000 	mov	r4, #0	; 0x0
  103fb4:	e59d1030 	ldr	r1, [sp, #48]
  103fb8:	e3510000 	cmp	r1, #0	; 0x0
  103fbc:	03a03001 	moveq	r3, #1	; 0x1
  103fc0:	1a000232 	bne	104890 <prog+0x484c>
  103fc4:	e08b3003 	add	r3, fp, r3
  103fc8:	e213301f 	ands	r3, r3, #31	; 0x1f
  103fcc:	03a0301c 	moveq	r3, #28	; 0x1c
  103fd0:	0a000119 	beq	10443c <prog+0x43f8>
  103fd4:	e2633020 	rsb	r3, r3, #32	; 0x20
  103fd8:	e3530004 	cmp	r3, #4	; 0x4
  103fdc:	da000113 	ble	104430 <prog+0x43ec>
  103fe0:	e59d2014 	ldr	r2, [sp, #20]
  103fe4:	e2433004 	sub	r3, r3, #4	; 0x4
  103fe8:	e0822003 	add	r2, r2, r3
  103fec:	e58d2014 	str	r2, [sp, #20]
  103ff0:	e08bb003 	add	fp, fp, r3
  103ff4:	e0877003 	add	r7, r7, r3
  103ff8:	e59de014 	ldr	lr, [sp, #20]
  103ffc:	e35e0000 	cmp	lr, #0	; 0x0
  104000:	da000004 	ble	104018 <prog+0x3fd4>
  104004:	e59d1038 	ldr	r1, [sp, #56]
  104008:	e1a0200e 	mov	r2, lr
  10400c:	e59d0008 	ldr	r0, [sp, #8]
  104010:	eb000823 	bl	1060a4 <_lshift>
  104014:	e58d0038 	str	r0, [sp, #56]
  104018:	e35b0000 	cmp	fp, #0	; 0x0
  10401c:	da000004 	ble	104034 <prog+0x3ff0>
  104020:	e1a01006 	mov	r1, r6
  104024:	e1a0200b 	mov	r2, fp
  104028:	e59d0008 	ldr	r0, [sp, #8]
  10402c:	eb00081c 	bl	1060a4 <_lshift>
  104030:	e1a06000 	mov	r6, r0
  104034:	e59d0028 	ldr	r0, [sp, #40]
  104038:	e3500000 	cmp	r0, #0	; 0x0
  10403c:	1a000219 	bne	1048a8 <prog+0x4864>
  104040:	e59de01c 	ldr	lr, [sp, #28]
  104044:	e59d0004 	ldr	r0, [sp, #4]
  104048:	e35e0000 	cmp	lr, #0	; 0x0
  10404c:	c3a03000 	movgt	r3, #0	; 0x0
  104050:	d3a03001 	movle	r3, #1	; 0x1
  104054:	e3500002 	cmp	r0, #2	; 0x2
  104058:	d3a03000 	movle	r3, #0	; 0x0
  10405c:	e3530000 	cmp	r3, #0	; 0x0
  104060:	0a0000fb 	beq	104454 <prog+0x4410>
  104064:	e35e0000 	cmp	lr, #0	; 0x0
  104068:	ba000037 	blt	10414c <prog+0x4108>
  10406c:	e1a01006 	mov	r1, r6
  104070:	e3a02005 	mov	r2, #5	; 0x5
  104074:	e3a03000 	mov	r3, #0	; 0x0
  104078:	e59d0008 	ldr	r0, [sp, #8]
  10407c:	eb0008bd 	bl	106378 <_multadd>
  104080:	e1a06000 	mov	r6, r0
  104084:	e1a01006 	mov	r1, r6
  104088:	e59d0038 	ldr	r0, [sp, #56]
  10408c:	eb0006b6 	bl	105b6c <__mcmp>
  104090:	e3500000 	cmp	r0, #0	; 0x0
  104094:	da00002c 	ble	10414c <prog+0x4108>
  104098:	e59d7040 	ldr	r7, [sp, #64]
  10409c:	e3a03031 	mov	r3, #49	; 0x31
  1040a0:	e4c73001 	strb	r3, [r7], #1
  1040a4:	e59d3024 	ldr	r3, [sp, #36]
  1040a8:	e3a0c000 	mov	ip, #0	; 0x0
  1040ac:	e2833001 	add	r3, r3, #1	; 0x1
  1040b0:	e1a0b00a 	mov	fp, sl
  1040b4:	e58d3024 	str	r3, [sp, #36]
  1040b8:	e58dc03c 	str	ip, [sp, #60]
  1040bc:	ea000029 	b	104168 <prog+0x4124>
  1040c0:	e51f157c 	ldr	r1, [pc, #-1404]	; 103b4c <prog+0x3b08>
  1040c4:	e2812020 	add	r2, r1, #32	; 0x20
  1040c8:	e892000c 	ldmia	r2, {r2, r3}
  1040cc:	e28d000c 	add	r0, sp, #12	; 0xc
  1040d0:	e8900003 	ldmia	r0, {r0, r1}
  1040d4:	eb000fa4 	bl	107f6c <__divdf3>
  1040d8:	e204400f 	and	r4, r4, #15	; 0xf
  1040dc:	e1a08000 	mov	r8, r0
  1040e0:	e1a09001 	mov	r9, r1
  1040e4:	e3a0a003 	mov	sl, #3	; 0x3
  1040e8:	eafffe43 	b	1039fc <prog+0x39b8>
  1040ec:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  1040f0:	e1a00008 	mov	r0, r8
  1040f4:	e1a01009 	mov	r1, r9
  1040f8:	e2822705 	add	r2, r2, #1310720	; 0x140000
  1040fc:	e3a03000 	mov	r3, #0	; 0x0
  104100:	eb000e76 	bl	107ae0 <__subdf3>
  104104:	e1a02006 	mov	r2, r6
  104108:	e1a03007 	mov	r3, r7
  10410c:	e1a08000 	mov	r8, r0
  104110:	e1a09001 	mov	r9, r1
  104114:	eb001061 	bl	1082a0 <__gtdf2>
  104118:	e3500000 	cmp	r0, #0	; 0x0
  10411c:	e1a04006 	mov	r4, r6
  104120:	e1a05007 	mov	r5, r7
  104124:	ca000059 	bgt	104290 <prog+0x424c>
  104128:	e2862102 	add	r2, r6, #-2147483648	; 0x80000000
  10412c:	e1a03007 	mov	r3, r7
  104130:	e1a00008 	mov	r0, r8
  104134:	e1a01009 	mov	r1, r9
  104138:	eb00109c 	bl	1083b0 <__ltdf2>
  10413c:	e3500000 	cmp	r0, #0	; 0x0
  104140:	aafffef9 	bge	103d2c <prog+0x3ce8>
  104144:	e3a06000 	mov	r6, #0	; 0x0
  104148:	e1a0a006 	mov	sl, r6
  10414c:	e59d1074 	ldr	r1, [sp, #116]
  104150:	e3a02000 	mov	r2, #0	; 0x0
  104154:	e1e01001 	mvn	r1, r1
  104158:	e58d1024 	str	r1, [sp, #36]
  10415c:	e59d7040 	ldr	r7, [sp, #64]
  104160:	e58d203c 	str	r2, [sp, #60]
  104164:	e1a0b00a 	mov	fp, sl
  104168:	e1a01006 	mov	r1, r6
  10416c:	e59d0008 	ldr	r0, [sp, #8]
  104170:	eb00063b 	bl	105a64 <_Bfree>
  104174:	e35b0000 	cmp	fp, #0	; 0x0
  104178:	0a000006 	beq	104198 <prog+0x4154>
  10417c:	e59d203c 	ldr	r2, [sp, #60]
  104180:	e3520000 	cmp	r2, #0	; 0x0
  104184:	1152000b 	cmpne	r2, fp
  104188:	1a000142 	bne	104698 <prog+0x4654>
  10418c:	e1a0100b 	mov	r1, fp
  104190:	e59d0008 	ldr	r0, [sp, #8]
  104194:	eb000632 	bl	105a64 <_Bfree>
  104198:	e59d1038 	ldr	r1, [sp, #56]
  10419c:	e59d0008 	ldr	r0, [sp, #8]
  1041a0:	eb00062f 	bl	105a64 <_Bfree>
  1041a4:	e3a03000 	mov	r3, #0	; 0x0
  1041a8:	e59dc024 	ldr	ip, [sp, #36]
  1041ac:	e59de080 	ldr	lr, [sp, #128]
  1041b0:	e5c73000 	strb	r3, [r7]
  1041b4:	e59d0078 	ldr	r0, [sp, #120]
  1041b8:	e35e0000 	cmp	lr, #0	; 0x0
  1041bc:	e28c2001 	add	r2, ip, #1	; 0x1
  1041c0:	e5802000 	str	r2, [r0]
  1041c4:	159d1080 	ldrne	r1, [sp, #128]
  1041c8:	059d0040 	ldreq	r0, [sp, #64]
  1041cc:	159d0040 	ldrne	r0, [sp, #64]
  1041d0:	15817000 	strne	r7, [r1]
  1041d4:	eafffd47 	b	1036f8 <_dtoa_r+0xd8>
  1041d8:	e59d0004 	ldr	r0, [sp, #4]
  1041dc:	e3500001 	cmp	r0, #1	; 0x1
  1041e0:	da0001d9 	ble	10494c <prog+0x4908>
  1041e4:	e59d301c 	ldr	r3, [sp, #28]
  1041e8:	e59dc018 	ldr	ip, [sp, #24]
  1041ec:	e2432001 	sub	r2, r3, #1	; 0x1
  1041f0:	e15c0002 	cmp	ip, r2
  1041f4:	b59de018 	ldrlt	lr, [sp, #24]
  1041f8:	b59d0030 	ldrlt	r0, [sp, #48]
  1041fc:	b06e3002 	rsblt	r3, lr, r2
  104200:	e59d101c 	ldr	r1, [sp, #28]
  104204:	b08ee003 	addlt	lr, lr, r3
  104208:	b0800003 	addlt	r0, r0, r3
  10420c:	a062500c 	rsbge	r5, r2, ip
  104210:	b58de018 	strlt	lr, [sp, #24]
  104214:	b58d0030 	strlt	r0, [sp, #48]
  104218:	b3a05000 	movlt	r5, #0	; 0x0
  10421c:	e3510000 	cmp	r1, #0	; 0x0
  104220:	b59d301c 	ldrlt	r3, [sp, #28]
  104224:	b59d2014 	ldrlt	r2, [sp, #20]
  104228:	a59d7014 	ldrge	r7, [sp, #20]
  10422c:	b0637002 	rsblt	r7, r3, r2
  104230:	a1a03001 	movge	r3, r1
  104234:	b3a03000 	movlt	r3, #0	; 0x0
  104238:	e59dc014 	ldr	ip, [sp, #20]
  10423c:	e59d0008 	ldr	r0, [sp, #8]
  104240:	e08cc003 	add	ip, ip, r3
  104244:	e3a01001 	mov	r1, #1	; 0x1
  104248:	e08bb003 	add	fp, fp, r3
  10424c:	e58dc014 	str	ip, [sp, #20]
  104250:	eb000840 	bl	106358 <_i2b>
  104254:	e1a0a000 	mov	sl, r0
  104258:	eaffff21 	b	103ee4 <prog+0x3ea0>
  10425c:	e3500000 	cmp	r0, #0	; 0x0
  104260:	baffffb7 	blt	104144 <prog+0x4100>
  104264:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  104268:	e2822705 	add	r2, r2, #1310720	; 0x140000
  10426c:	e3a03000 	mov	r3, #0	; 0x0
  104270:	e1a0000a 	mov	r0, sl
  104274:	e1a0100b 	mov	r1, fp
  104278:	eb000e57 	bl	107bdc <__muldf3>
  10427c:	e1a02008 	mov	r2, r8
  104280:	e1a03009 	mov	r3, r9
  104284:	eb001027 	bl	108328 <__gedf2>
  104288:	e3500000 	cmp	r0, #0	; 0x0
  10428c:	aaffffac 	bge	104144 <prog+0x4100>
  104290:	e3a06000 	mov	r6, #0	; 0x0
  104294:	e1a0a006 	mov	sl, r6
  104298:	eaffff7e 	b	104098 <prog+0x4054>
  10429c:	e3e02000 	mvn	r2, #0	; 0x0
  1042a0:	e3a03001 	mov	r3, #1	; 0x1
  1042a4:	e58d2020 	str	r2, [sp, #32]
  1042a8:	e58d201c 	str	r2, [sp, #28]
  1042ac:	e58d302c 	str	r3, [sp, #44]
  1042b0:	e59dc008 	ldr	ip, [sp, #8]
  1042b4:	e3560017 	cmp	r6, #23	; 0x17
  1042b8:	e3a03000 	mov	r3, #0	; 0x0
  1042bc:	e58c3044 	str	r3, [ip, #68]
  1042c0:	81a01003 	movhi	r1, r3
  1042c4:	83a02004 	movhi	r2, #4	; 0x4
  1042c8:	9a0001e0 	bls	104a50 <prog+0x4a0c>
  1042cc:	e1a02082 	mov	r2, r2, lsl #1
  1042d0:	e2823014 	add	r3, r2, #20	; 0x14
  1042d4:	e1560003 	cmp	r6, r3
  1042d8:	e2811001 	add	r1, r1, #1	; 0x1
  1042dc:	2afffffa 	bcs	1042cc <prog+0x4288>
  1042e0:	e59d301c 	ldr	r3, [sp, #28]
  1042e4:	e59d2008 	ldr	r2, [sp, #8]
  1042e8:	e353000e 	cmp	r3, #14	; 0xe
  1042ec:	83a04000 	movhi	r4, #0	; 0x0
  1042f0:	93a04001 	movls	r4, #1	; 0x1
  1042f4:	e1a05000 	mov	r5, r0
  1042f8:	e5821044 	str	r1, [r2, #68]
  1042fc:	eafffdab 	b	1039b0 <prog+0x396c>
  104300:	e3a03000 	mov	r3, #0	; 0x0
  104304:	e58d302c 	str	r3, [sp, #44]
  104308:	e59dc074 	ldr	ip, [sp, #116]
  10430c:	e59de024 	ldr	lr, [sp, #36]
  104310:	e28c3001 	add	r3, ip, #1	; 0x1
  104314:	e08e6003 	add	r6, lr, r3
  104318:	e3560000 	cmp	r6, #0	; 0x0
  10431c:	e2461001 	sub	r1, r6, #1	; 0x1
  104320:	e58d1020 	str	r1, [sp, #32]
  104324:	c58d601c 	strgt	r6, [sp, #28]
  104328:	caffffe0 	bgt	1042b0 <prog+0x426c>
  10432c:	e356000e 	cmp	r6, #14	; 0xe
  104330:	83a04000 	movhi	r4, #0	; 0x0
  104334:	93a04001 	movls	r4, #1	; 0x1
  104338:	e1a05000 	mov	r5, r0
  10433c:	e58d601c 	str	r6, [sp, #28]
  104340:	eafffd97 	b	1039a4 <prog+0x3960>
  104344:	e3a02001 	mov	r2, #1	; 0x1
  104348:	e58d202c 	str	r2, [sp, #44]
  10434c:	e59d2074 	ldr	r2, [sp, #116]
  104350:	e3520000 	cmp	r2, #0	; 0x0
  104354:	c58d2020 	strgt	r2, [sp, #32]
  104358:	c1a06002 	movgt	r6, r2
  10435c:	c58d201c 	strgt	r2, [sp, #28]
  104360:	caffffd2 	bgt	1042b0 <prog+0x426c>
  104364:	e3a02001 	mov	r2, #1	; 0x1
  104368:	e1a04002 	mov	r4, r2
  10436c:	e1a05000 	mov	r5, r0
  104370:	e58d201c 	str	r2, [sp, #28]
  104374:	e58d2074 	str	r2, [sp, #116]
  104378:	e58d2020 	str	r2, [sp, #32]
  10437c:	eafffd88 	b	1039a4 <prog+0x3960>
  104380:	e3a01001 	mov	r1, #1	; 0x1
  104384:	e58d102c 	str	r1, [sp, #44]
  104388:	eaffffde 	b	104308 <prog+0x42c4>
  10438c:	e3a01000 	mov	r1, #0	; 0x0
  104390:	e58d102c 	str	r1, [sp, #44]
  104394:	eaffffec 	b	10434c <prog+0x4308>
  104398:	e3590000 	cmp	r9, #0	; 0x0
  10439c:	1affff03 	bne	103fb0 <prog+0x3f6c>
  1043a0:	e3c834ff 	bic	r3, r8, #-16777216	; 0xff000000
  1043a4:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  1043a8:	e3530000 	cmp	r3, #0	; 0x0
  1043ac:	1afffeff 	bne	103fb0 <prog+0x3f6c>
  1043b0:	e3c83102 	bic	r3, r8, #-2147483648	; 0x80000000
  1043b4:	e1a03a23 	mov	r3, r3, lsr #20
  1043b8:	e1a03a03 	mov	r3, r3, lsl #20
  1043bc:	e3530000 	cmp	r3, #0	; 0x0
  1043c0:	0afffefa 	beq	103fb0 <prog+0x3f6c>
  1043c4:	e59d0014 	ldr	r0, [sp, #20]
  1043c8:	e28bb001 	add	fp, fp, #1	; 0x1
  1043cc:	e2800001 	add	r0, r0, #1	; 0x1
  1043d0:	e3a04001 	mov	r4, #1	; 0x1
  1043d4:	e58d0014 	str	r0, [sp, #20]
  1043d8:	eafffef5 	b	103fb4 <prog+0x3f70>
  1043dc:	e59d0024 	ldr	r0, [sp, #36]
  1043e0:	eb00100f 	bl	108424 <__floatsidf>
  1043e4:	e1a02000 	mov	r2, r0
  1043e8:	e1a03001 	mov	r3, r1
  1043ec:	e1a00004 	mov	r0, r4
  1043f0:	e1a01005 	mov	r1, r5
  1043f4:	eb000f87 	bl	108218 <__nedf2>
  1043f8:	e3500000 	cmp	r0, #0	; 0x0
  1043fc:	159dc024 	ldrne	ip, [sp, #36]
  104400:	124cc001 	subne	ip, ip, #1	; 0x1
  104404:	158dc024 	strne	ip, [sp, #36]
  104408:	eafffcf5 	b	1037e4 <_dtoa_r+0x1c4>
  10440c:	e59d3014 	ldr	r3, [sp, #20]
  104410:	e59dc024 	ldr	ip, [sp, #36]
  104414:	e3a00000 	mov	r0, #0	; 0x0
  104418:	e06c3003 	rsb	r3, ip, r3
  10441c:	e26ce000 	rsb	lr, ip, #0	; 0x0
  104420:	e58d3014 	str	r3, [sp, #20]
  104424:	e58de018 	str	lr, [sp, #24]
  104428:	e58d0030 	str	r0, [sp, #48]
  10442c:	eafffd0f 	b	103870 <_dtoa_r+0x250>
  104430:	e3530003 	cmp	r3, #3	; 0x3
  104434:	cafffeef 	bgt	103ff8 <prog+0x3fb4>
  104438:	e283301c 	add	r3, r3, #28	; 0x1c
  10443c:	e59dc014 	ldr	ip, [sp, #20]
  104440:	e08bb003 	add	fp, fp, r3
  104444:	e08cc003 	add	ip, ip, r3
  104448:	e0877003 	add	r7, r7, r3
  10444c:	e58dc014 	str	ip, [sp, #20]
  104450:	eafffee8 	b	103ff8 <prog+0x3fb4>
  104454:	e59de02c 	ldr	lr, [sp, #44]
  104458:	e35e0000 	cmp	lr, #0	; 0x0
  10445c:	03a04000 	moveq	r4, #0	; 0x0
  104460:	0a00004c 	beq	104598 <prog+0x4554>
  104464:	e3570000 	cmp	r7, #0	; 0x0
  104468:	da000004 	ble	104480 <prog+0x443c>
  10446c:	e1a0100a 	mov	r1, sl
  104470:	e1a02007 	mov	r2, r7
  104474:	e59d0008 	ldr	r0, [sp, #8]
  104478:	eb000709 	bl	1060a4 <_lshift>
  10447c:	e1a0a000 	mov	sl, r0
  104480:	e3540000 	cmp	r4, #0	; 0x0
  104484:	01a0b00a 	moveq	fp, sl
  104488:	1a00014f 	bne	1049cc <prog+0x4988>
  10448c:	e58da03c 	str	sl, [sp, #60]
  104490:	e59d5040 	ldr	r5, [sp, #64]
  104494:	e2097001 	and	r7, r9, #1	; 0x1
  104498:	e1a01006 	mov	r1, r6
  10449c:	e59d0038 	ldr	r0, [sp, #56]
  1044a0:	ebfffbdd 	bl	10341c <quorem>
  1044a4:	e59d103c 	ldr	r1, [sp, #60]
  1044a8:	e2809030 	add	r9, r0, #48	; 0x30
  1044ac:	e59d0038 	ldr	r0, [sp, #56]
  1044b0:	eb0005ad 	bl	105b6c <__mcmp>
  1044b4:	e1a01006 	mov	r1, r6
  1044b8:	e1a08000 	mov	r8, r0
  1044bc:	e1a0200b 	mov	r2, fp
  1044c0:	e59d0008 	ldr	r0, [sp, #8]
  1044c4:	eb0006a9 	bl	105f70 <__mdiff>
  1044c8:	e590300c 	ldr	r3, [r0, #12]
  1044cc:	e3530000 	cmp	r3, #0	; 0x0
  1044d0:	e1a04000 	mov	r4, r0
  1044d4:	13a0a001 	movne	sl, #1	; 0x1
  1044d8:	0a000061 	beq	104664 <prog+0x4620>
  1044dc:	e1a01004 	mov	r1, r4
  1044e0:	e59d0008 	ldr	r0, [sp, #8]
  1044e4:	eb00055e 	bl	105a64 <_Bfree>
  1044e8:	e59d2004 	ldr	r2, [sp, #4]
  1044ec:	e19a2002 	orrs	r2, sl, r2
  1044f0:	1a000001 	bne	1044fc <prog+0x44b8>
  1044f4:	e3570000 	cmp	r7, #0	; 0x0
  1044f8:	0a00014b 	beq	104a2c <prog+0x49e8>
  1044fc:	e3580000 	cmp	r8, #0	; 0x0
  104500:	ba000120 	blt	104988 <prog+0x4944>
  104504:	e59d3004 	ldr	r3, [sp, #4]
  104508:	e1983003 	orrs	r3, r8, r3
  10450c:	1a000001 	bne	104518 <prog+0x44d4>
  104510:	e3570000 	cmp	r7, #0	; 0x0
  104514:	0a00011b 	beq	104988 <prog+0x4944>
  104518:	e35a0000 	cmp	sl, #0	; 0x0
  10451c:	ca00013a 	bgt	104a0c <prog+0x49c8>
  104520:	e4c59001 	strb	r9, [r5], #1
  104524:	e59dc01c 	ldr	ip, [sp, #28]
  104528:	e59de040 	ldr	lr, [sp, #64]
  10452c:	e08c300e 	add	r3, ip, lr
  104530:	e1550003 	cmp	r5, r3
  104534:	0a00002a 	beq	1045e4 <prog+0x45a0>
  104538:	e59d1038 	ldr	r1, [sp, #56]
  10453c:	e59d0008 	ldr	r0, [sp, #8]
  104540:	e3a0200a 	mov	r2, #10	; 0xa
  104544:	e3a03000 	mov	r3, #0	; 0x0
  104548:	eb00078a 	bl	106378 <_multadd>
  10454c:	e58d0038 	str	r0, [sp, #56]
  104550:	e59d003c 	ldr	r0, [sp, #60]
  104554:	e150000b 	cmp	r0, fp
  104558:	0a000046 	beq	104678 <prog+0x4634>
  10455c:	e59d103c 	ldr	r1, [sp, #60]
  104560:	e3a0200a 	mov	r2, #10	; 0xa
  104564:	e3a03000 	mov	r3, #0	; 0x0
  104568:	e59d0008 	ldr	r0, [sp, #8]
  10456c:	eb000781 	bl	106378 <_multadd>
  104570:	e1a0100b 	mov	r1, fp
  104574:	e58d003c 	str	r0, [sp, #60]
  104578:	e3a0200a 	mov	r2, #10	; 0xa
  10457c:	e59d0008 	ldr	r0, [sp, #8]
  104580:	e3a03000 	mov	r3, #0	; 0x0
  104584:	eb00077b 	bl	106378 <_multadd>
  104588:	e1a0b000 	mov	fp, r0
  10458c:	eaffffc1 	b	104498 <prog+0x4454>
  104590:	eb000778 	bl	106378 <_multadd>
  104594:	e58d0038 	str	r0, [sp, #56]
  104598:	e1a01006 	mov	r1, r6
  10459c:	e59d0038 	ldr	r0, [sp, #56]
  1045a0:	ebfffb9d 	bl	10341c <quorem>
  1045a4:	e59dc040 	ldr	ip, [sp, #64]
  1045a8:	e2809030 	add	r9, r0, #48	; 0x30
  1045ac:	e59d1038 	ldr	r1, [sp, #56]
  1045b0:	e59d0008 	ldr	r0, [sp, #8]
  1045b4:	e7c4900c 	strb	r9, [r4, ip]
  1045b8:	e59de01c 	ldr	lr, [sp, #28]
  1045bc:	e2844001 	add	r4, r4, #1	; 0x1
  1045c0:	e15e0004 	cmp	lr, r4
  1045c4:	e3a0200a 	mov	r2, #10	; 0xa
  1045c8:	e3a03000 	mov	r3, #0	; 0x0
  1045cc:	caffffef 	bgt	104590 <prog+0x454c>
  1045d0:	e59d0040 	ldr	r0, [sp, #64]
  1045d4:	e3a01000 	mov	r1, #0	; 0x0
  1045d8:	e58d103c 	str	r1, [sp, #60]
  1045dc:	e0805004 	add	r5, r0, r4
  1045e0:	e1a0b00a 	mov	fp, sl
  1045e4:	e59d1038 	ldr	r1, [sp, #56]
  1045e8:	e3a02001 	mov	r2, #1	; 0x1
  1045ec:	e59d0008 	ldr	r0, [sp, #8]
  1045f0:	eb0006ab 	bl	1060a4 <_lshift>
  1045f4:	e1a01006 	mov	r1, r6
  1045f8:	e58d0038 	str	r0, [sp, #56]
  1045fc:	eb00055a 	bl	105b6c <__mcmp>
  104600:	e3500000 	cmp	r0, #0	; 0x0
  104604:	da00000d 	ble	104640 <prog+0x45fc>
  104608:	e1a02005 	mov	r2, r5
  10460c:	e5723001 	ldrb	r3, [r2, #-1]!
  104610:	e3530039 	cmp	r3, #57	; 0x39
  104614:	1a0000d7 	bne	104978 <prog+0x4934>
  104618:	e59d0040 	ldr	r0, [sp, #64]
  10461c:	e1500002 	cmp	r0, r2
  104620:	1afffff9 	bne	10460c <prog+0x45c8>
  104624:	e1a07000 	mov	r7, r0
  104628:	e3a03031 	mov	r3, #49	; 0x31
  10462c:	e4c73001 	strb	r3, [r7], #1
  104630:	e59d1024 	ldr	r1, [sp, #36]
  104634:	e2811001 	add	r1, r1, #1	; 0x1
  104638:	e58d1024 	str	r1, [sp, #36]
  10463c:	eafffec9 	b	104168 <prog+0x4124>
  104640:	1a000001 	bne	10464c <prog+0x4608>
  104644:	e3190001 	tst	r9, #1	; 0x1
  104648:	1affffee 	bne	104608 <prog+0x45c4>
  10464c:	e1a02005 	mov	r2, r5
  104650:	e5723001 	ldrb	r3, [r2, #-1]!
  104654:	e3530030 	cmp	r3, #48	; 0x30
  104658:	0afffffc 	beq	104650 <prog+0x460c>
  10465c:	e2827001 	add	r7, r2, #1	; 0x1
  104660:	eafffec0 	b	104168 <prog+0x4124>
  104664:	e59d0038 	ldr	r0, [sp, #56]
  104668:	e1a01004 	mov	r1, r4
  10466c:	eb00053e 	bl	105b6c <__mcmp>
  104670:	e1a0a000 	mov	sl, r0
  104674:	eaffff98 	b	1044dc <prog+0x4498>
  104678:	e1a0100b 	mov	r1, fp
  10467c:	e59d0008 	ldr	r0, [sp, #8]
  104680:	e3a0200a 	mov	r2, #10	; 0xa
  104684:	e3a03000 	mov	r3, #0	; 0x0
  104688:	eb00073a 	bl	106378 <_multadd>
  10468c:	e1a0b000 	mov	fp, r0
  104690:	e58d003c 	str	r0, [sp, #60]
  104694:	eaffff7f 	b	104498 <prog+0x4454>
  104698:	e1a01002 	mov	r1, r2
  10469c:	e59d0008 	ldr	r0, [sp, #8]
  1046a0:	eb0004ef 	bl	105a64 <_Bfree>
  1046a4:	eafffeb8 	b	10418c <prog+0x4148>
  1046a8:	e51fcb68 	ldr	ip, [pc, #-2920]	; 103b48 <prog+0x3b04>
  1046ac:	e08cc18a 	add	ip, ip, sl, lsl #3
  1046b0:	e91c000c 	ldmdb	ip, {r2, r3}
  1046b4:	e1a00006 	mov	r0, r6
  1046b8:	e1a01007 	mov	r1, r7
  1046bc:	eb000d46 	bl	107bdc <__muldf3>
  1046c0:	e1a05008 	mov	r5, r8
  1046c4:	e1a06009 	mov	r6, r9
  1046c8:	e1a08000 	mov	r8, r0
  1046cc:	e1a09001 	mov	r9, r1
  1046d0:	e1a00005 	mov	r0, r5
  1046d4:	e1a01006 	mov	r1, r6
  1046d8:	eb000f8f 	bl	10851c <__fixdfsi>
  1046dc:	e1a04000 	mov	r4, r0
  1046e0:	eb000f4f 	bl	108424 <__floatsidf>
  1046e4:	e1a02000 	mov	r2, r0
  1046e8:	e1a03001 	mov	r3, r1
  1046ec:	e1a00005 	mov	r0, r5
  1046f0:	e1a01006 	mov	r1, r6
  1046f4:	eb000cf9 	bl	107ae0 <__subdf3>
  1046f8:	e59d7040 	ldr	r7, [sp, #64]
  1046fc:	e2844030 	add	r4, r4, #48	; 0x30
  104700:	e35a0001 	cmp	sl, #1	; 0x1
  104704:	e4c74001 	strb	r4, [r7], #1
  104708:	e1a05000 	mov	r5, r0
  10470c:	e1a06001 	mov	r6, r1
  104710:	13a07001 	movne	r7, #1	; 0x1
  104714:	0a000018 	beq	10477c <prog+0x4738>
  104718:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  10471c:	e2822709 	add	r2, r2, #2359296	; 0x240000
  104720:	e3a03000 	mov	r3, #0	; 0x0
  104724:	e1a00005 	mov	r0, r5
  104728:	e1a01006 	mov	r1, r6
  10472c:	eb000d2a 	bl	107bdc <__muldf3>
  104730:	e1a06001 	mov	r6, r1
  104734:	e1a05000 	mov	r5, r0
  104738:	eb000f77 	bl	10851c <__fixdfsi>
  10473c:	e1a04000 	mov	r4, r0
  104740:	eb000f37 	bl	108424 <__floatsidf>
  104744:	e1a02000 	mov	r2, r0
  104748:	e1a03001 	mov	r3, r1
  10474c:	e1a00005 	mov	r0, r5
  104750:	e1a01006 	mov	r1, r6
  104754:	eb000ce1 	bl	107ae0 <__subdf3>
  104758:	e59dc040 	ldr	ip, [sp, #64]
  10475c:	e2844030 	add	r4, r4, #48	; 0x30
  104760:	e7c7400c 	strb	r4, [r7, ip]
  104764:	e2877001 	add	r7, r7, #1	; 0x1
  104768:	e157000a 	cmp	r7, sl
  10476c:	e1a05000 	mov	r5, r0
  104770:	e1a06001 	mov	r6, r1
  104774:	1affffe7 	bne	104718 <prog+0x46d4>
  104778:	e08c7007 	add	r7, ip, r7
  10477c:	e3a025ff 	mov	r2, #1069547520	; 0x3fc00000
  104780:	e2822602 	add	r2, r2, #2097152	; 0x200000
  104784:	e3a03000 	mov	r3, #0	; 0x0
  104788:	e1a00008 	mov	r0, r8
  10478c:	e1a01009 	mov	r1, r9
  104790:	eb000cea 	bl	107b40 <__adddf3>
  104794:	e1a02005 	mov	r2, r5
  104798:	e1a03006 	mov	r3, r6
  10479c:	eb000f03 	bl	1083b0 <__ltdf2>
  1047a0:	e3500000 	cmp	r0, #0	; 0x0
  1047a4:	bafffdb3 	blt	103e78 <prog+0x3e34>
  1047a8:	e3a005ff 	mov	r0, #1069547520	; 0x3fc00000
  1047ac:	e1a02008 	mov	r2, r8
  1047b0:	e1a03009 	mov	r3, r9
  1047b4:	e2800602 	add	r0, r0, #2097152	; 0x200000
  1047b8:	e3a01000 	mov	r1, #0	; 0x0
  1047bc:	eb000cc7 	bl	107ae0 <__subdf3>
  1047c0:	e1a02005 	mov	r2, r5
  1047c4:	e1a03006 	mov	r3, r6
  1047c8:	eb000eb4 	bl	1082a0 <__gtdf2>
  1047cc:	e3500000 	cmp	r0, #0	; 0x0
  1047d0:	dafffd55 	ble	103d2c <prog+0x3ce8>
  1047d4:	e1a02007 	mov	r2, r7
  1047d8:	e5723001 	ldrb	r3, [r2, #-1]!
  1047dc:	e3530030 	cmp	r3, #48	; 0x30
  1047e0:	0afffffc 	beq	1047d8 <prog+0x4794>
  1047e4:	e59d3044 	ldr	r3, [sp, #68]
  1047e8:	e2827001 	add	r7, r2, #1	; 0x1
  1047ec:	e58d3024 	str	r3, [sp, #36]
  1047f0:	eafffe68 	b	104198 <prog+0x4154>
  1047f4:	e59d0024 	ldr	r0, [sp, #36]
  1047f8:	e2605000 	rsb	r5, r0, #0	; 0x0
  1047fc:	e3550000 	cmp	r5, #0	; 0x0
  104800:	0a00004a 	beq	104930 <prog+0x48ec>
  104804:	e51f1cc4 	ldr	r1, [pc, #-3268]	; 103b48 <prog+0x3b04>
  104808:	e205300f 	and	r3, r5, #15	; 0xf
  10480c:	e0811183 	add	r1, r1, r3, lsl #3
  104810:	e891000c 	ldmia	r1, {r2, r3}
  104814:	e28d000c 	add	r0, sp, #12	; 0xc
  104818:	e8900003 	ldmia	r0, {r0, r1}
  10481c:	eb000cee 	bl	107bdc <__muldf3>
  104820:	e1b05245 	movs	r5, r5, asr #4
  104824:	e1a03000 	mov	r3, r0
  104828:	e1a04001 	mov	r4, r1
  10482c:	e1a08000 	mov	r8, r0
  104830:	e1a09001 	mov	r9, r1
  104834:	0a00003d 	beq	104930 <prog+0x48ec>
  104838:	e51f6cf4 	ldr	r6, [pc, #-3316]	; 103b4c <prog+0x3b08>
  10483c:	e3a0a002 	mov	sl, #2	; 0x2
  104840:	e3150001 	tst	r5, #1	; 0x1
  104844:	e1a00003 	mov	r0, r3
  104848:	e1a01004 	mov	r1, r4
  10484c:	0a000004 	beq	104864 <prog+0x4820>
  104850:	e896000c 	ldmia	r6, {r2, r3}
  104854:	eb000ce0 	bl	107bdc <__muldf3>
  104858:	e28aa001 	add	sl, sl, #1	; 0x1
  10485c:	e1a03000 	mov	r3, r0
  104860:	e1a04001 	mov	r4, r1
  104864:	e1b050c5 	movs	r5, r5, asr #1
  104868:	e2866008 	add	r6, r6, #8	; 0x8
  10486c:	1afffff3 	bne	104840 <prog+0x47fc>
  104870:	e1a08003 	mov	r8, r3
  104874:	e1a09004 	mov	r9, r4
  104878:	eafffc75 	b	103a54 <prog+0x3a10>
  10487c:	e3a02441 	mov	r2, #1090519040	; 0x41000000
  104880:	e282260f 	add	r2, r2, #15728640	; 0xf00000
  104884:	e3a03000 	mov	r3, #0	; 0x0
  104888:	eb000cac 	bl	107b40 <__adddf3>
  10488c:	eafffc35 	b	103968 <prog+0x3924>
  104890:	e5963010 	ldr	r3, [r6, #16]
  104894:	e0863103 	add	r3, r6, r3, lsl #2
  104898:	e5930010 	ldr	r0, [r3, #16]
  10489c:	eb000477 	bl	105a80 <_hi0bits>
  1048a0:	e2603020 	rsb	r3, r0, #32	; 0x20
  1048a4:	eafffdc6 	b	103fc4 <prog+0x3f80>
  1048a8:	e59d0038 	ldr	r0, [sp, #56]
  1048ac:	e1a01006 	mov	r1, r6
  1048b0:	eb0004ad 	bl	105b6c <__mcmp>
  1048b4:	e3500000 	cmp	r0, #0	; 0x0
  1048b8:	aafffde0 	bge	104040 <prog+0x3ffc>
  1048bc:	e3a03000 	mov	r3, #0	; 0x0
  1048c0:	e59d1038 	ldr	r1, [sp, #56]
  1048c4:	e3a0200a 	mov	r2, #10	; 0xa
  1048c8:	e59d0008 	ldr	r0, [sp, #8]
  1048cc:	eb0006a9 	bl	106378 <_multadd>
  1048d0:	e59d102c 	ldr	r1, [sp, #44]
  1048d4:	e59d2024 	ldr	r2, [sp, #36]
  1048d8:	e3510000 	cmp	r1, #0	; 0x0
  1048dc:	059d3020 	ldreq	r3, [sp, #32]
  1048e0:	e2422001 	sub	r2, r2, #1	; 0x1
  1048e4:	e58d0038 	str	r0, [sp, #56]
  1048e8:	e58d2024 	str	r2, [sp, #36]
  1048ec:	058d301c 	streq	r3, [sp, #28]
  1048f0:	0afffdd2 	beq	104040 <prog+0x3ffc>
  1048f4:	e1a0100a 	mov	r1, sl
  1048f8:	e59d0008 	ldr	r0, [sp, #8]
  1048fc:	e3a0200a 	mov	r2, #10	; 0xa
  104900:	e3a03000 	mov	r3, #0	; 0x0
  104904:	eb00069b 	bl	106378 <_multadd>
  104908:	e59dc020 	ldr	ip, [sp, #32]
  10490c:	e1a0a000 	mov	sl, r0
  104910:	e58dc01c 	str	ip, [sp, #28]
  104914:	eafffdc9 	b	104040 <prog+0x3ffc>
  104918:	e59d1038 	ldr	r1, [sp, #56]
  10491c:	e59d2018 	ldr	r2, [sp, #24]
  104920:	e59d0008 	ldr	r0, [sp, #8]
  104924:	eb0006c5 	bl	106440 <_pow5mult>
  104928:	e58d0038 	str	r0, [sp, #56]
  10492c:	eafffd90 	b	103f74 <prog+0x3f30>
  104930:	e3a0a002 	mov	sl, #2	; 0x2
  104934:	eafffc46 	b	103a54 <prog+0x3a10>
  104938:	e59d1038 	ldr	r1, [sp, #56]
  10493c:	e59d0008 	ldr	r0, [sp, #8]
  104940:	eb0006be 	bl	106440 <_pow5mult>
  104944:	e58d0038 	str	r0, [sp, #56]
  104948:	eafffd89 	b	103f74 <prog+0x3f30>
  10494c:	e59d1034 	ldr	r1, [sp, #52]
  104950:	e3510000 	cmp	r1, #0	; 0x0
  104954:	059d304c 	ldreq	r3, [sp, #76]
  104958:	12823e43 	addne	r3, r2, #1072	; 0x430
  10495c:	159d7014 	ldrne	r7, [sp, #20]
  104960:	159d5018 	ldrne	r5, [sp, #24]
  104964:	059d7014 	ldreq	r7, [sp, #20]
  104968:	059d5018 	ldreq	r5, [sp, #24]
  10496c:	12833003 	addne	r3, r3, #3	; 0x3
  104970:	02633036 	rsbeq	r3, r3, #54	; 0x36
  104974:	eafffe2f 	b	104238 <prog+0x41f4>
  104978:	e2833001 	add	r3, r3, #1	; 0x1
  10497c:	e4c23001 	strb	r3, [r2], #1
  104980:	e1a07002 	mov	r7, r2
  104984:	eafffdf7 	b	104168 <prog+0x4124>
  104988:	e35a0000 	cmp	sl, #0	; 0x0
  10498c:	da00000b 	ble	1049c0 <prog+0x497c>
  104990:	e59d1038 	ldr	r1, [sp, #56]
  104994:	e3a02001 	mov	r2, #1	; 0x1
  104998:	e59d0008 	ldr	r0, [sp, #8]
  10499c:	eb0005c0 	bl	1060a4 <_lshift>
  1049a0:	e1a01006 	mov	r1, r6
  1049a4:	e58d0038 	str	r0, [sp, #56]
  1049a8:	eb00046f 	bl	105b6c <__mcmp>
  1049ac:	e3500000 	cmp	r0, #0	; 0x0
  1049b0:	da000022 	ble	104a40 <prog+0x49fc>
  1049b4:	e2899001 	add	r9, r9, #1	; 0x1
  1049b8:	e359003a 	cmp	r9, #58	; 0x3a
  1049bc:	0a000017 	beq	104a20 <prog+0x49dc>
  1049c0:	e4c59001 	strb	r9, [r5], #1
  1049c4:	e1a07005 	mov	r7, r5
  1049c8:	eafffde6 	b	104168 <prog+0x4124>
  1049cc:	e59a1004 	ldr	r1, [sl, #4]
  1049d0:	e59d0008 	ldr	r0, [sp, #8]
  1049d4:	eb0004f2 	bl	105da4 <_Balloc>
  1049d8:	e59a2010 	ldr	r2, [sl, #16]
  1049dc:	e1a02102 	mov	r2, r2, lsl #2
  1049e0:	e1a04000 	mov	r4, r0
  1049e4:	e2822008 	add	r2, r2, #8	; 0x8
  1049e8:	e28a100c 	add	r1, sl, #12	; 0xc
  1049ec:	e280000c 	add	r0, r0, #12	; 0xc
  1049f0:	ebffeff2 	bl	1009c0 <memcpy>
  1049f4:	e59d0008 	ldr	r0, [sp, #8]
  1049f8:	e1a01004 	mov	r1, r4
  1049fc:	e3a02001 	mov	r2, #1	; 0x1
  104a00:	eb0005a7 	bl	1060a4 <_lshift>
  104a04:	e1a0b000 	mov	fp, r0
  104a08:	eafffe9f 	b	10448c <prog+0x4448>
  104a0c:	e3590039 	cmp	r9, #57	; 0x39
  104a10:	12893001 	addne	r3, r9, #1	; 0x1
  104a14:	14c53001 	strneb	r3, [r5], #1
  104a18:	11a07005 	movne	r7, r5
  104a1c:	1afffdd1 	bne	104168 <prog+0x4124>
  104a20:	e3a03039 	mov	r3, #57	; 0x39
  104a24:	e4c53001 	strb	r3, [r5], #1
  104a28:	eafffef6 	b	104608 <prog+0x45c4>
  104a2c:	e3590039 	cmp	r9, #57	; 0x39
  104a30:	0afffffa 	beq	104a20 <prog+0x49dc>
  104a34:	e3580000 	cmp	r8, #0	; 0x0
  104a38:	c2899001 	addgt	r9, r9, #1	; 0x1
  104a3c:	eaffffdf 	b	1049c0 <prog+0x497c>
  104a40:	1affffde 	bne	1049c0 <prog+0x497c>
  104a44:	e3190001 	tst	r9, #1	; 0x1
  104a48:	0affffdc 	beq	1049c0 <prog+0x497c>
  104a4c:	eaffffd8 	b	1049b4 <prog+0x4970>
  104a50:	e59de01c 	ldr	lr, [sp, #28]
  104a54:	e1a05000 	mov	r5, r0
  104a58:	e35e000e 	cmp	lr, #14	; 0xe
  104a5c:	83a04000 	movhi	r4, #0	; 0x0
  104a60:	93a04001 	movls	r4, #1	; 0x1
  104a64:	eafffbd1 	b	1039b0 <prog+0x396c>

00104a68 <fflush>:
  104a68:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  104a6c:	e2506000 	subs	r6, r0, #0	; 0x0
  104a70:	0a00002c 	beq	104b28 <fflush+0xc0>
  104a74:	e59f30c0 	ldr	r3, [pc, #192]	; 104b3c <prog+0x4af8>
  104a78:	e5930000 	ldr	r0, [r3]
  104a7c:	e3500000 	cmp	r0, #0	; 0x0
  104a80:	0a000002 	beq	104a90 <fflush+0x28>
  104a84:	e5903038 	ldr	r3, [r0, #56]
  104a88:	e3530000 	cmp	r3, #0	; 0x0
  104a8c:	0a000023 	beq	104b20 <fflush+0xb8>
  104a90:	e1d610fc 	ldrsh	r1, [r6, #12]
  104a94:	e3110008 	tst	r1, #8	; 0x8
  104a98:	0a00001c 	beq	104b10 <fflush+0xa8>
  104a9c:	e5965010 	ldr	r5, [r6, #16]
  104aa0:	e3550000 	cmp	r5, #0	; 0x0
  104aa4:	0a000019 	beq	104b10 <fflush+0xa8>
  104aa8:	e5963000 	ldr	r3, [r6]
  104aac:	e3110003 	tst	r1, #3	; 0x3
  104ab0:	e0654003 	rsb	r4, r5, r3
  104ab4:	e5865000 	str	r5, [r6]
  104ab8:	13a03000 	movne	r3, #0	; 0x0
  104abc:	0a000015 	beq	104b18 <fflush+0xb0>
  104ac0:	e3540000 	cmp	r4, #0	; 0x0
  104ac4:	e5863008 	str	r3, [r6, #8]
  104ac8:	ca000002 	bgt	104ad8 <fflush+0x70>
  104acc:	ea00000f 	b	104b10 <fflush+0xa8>
  104ad0:	e3540000 	cmp	r4, #0	; 0x0
  104ad4:	da00000d 	ble	104b10 <fflush+0xa8>
  104ad8:	e1a01005 	mov	r1, r5
  104adc:	e1a02004 	mov	r2, r4
  104ae0:	e596001c 	ldr	r0, [r6, #28]
  104ae4:	e1a0e00f 	mov	lr, pc
  104ae8:	e596f024 	ldr	pc, [r6, #36]
  104aec:	e3500000 	cmp	r0, #0	; 0x0
  104af0:	e0855000 	add	r5, r5, r0
  104af4:	e0604004 	rsb	r4, r0, r4
  104af8:	cafffff4 	bgt	104ad0 <fflush+0x68>
  104afc:	e1d630bc 	ldrh	r3, [r6, #12]
  104b00:	e3e00000 	mvn	r0, #0	; 0x0
  104b04:	e3833040 	orr	r3, r3, #64	; 0x40
  104b08:	e1c630bc 	strh	r3, [r6, #12]
  104b0c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  104b10:	e3a00000 	mov	r0, #0	; 0x0
  104b14:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  104b18:	e5963014 	ldr	r3, [r6, #20]
  104b1c:	eaffffe7 	b	104ac0 <fflush+0x58>
  104b20:	eb000023 	bl	104bb4 <__sinit>
  104b24:	eaffffd9 	b	104a90 <fflush+0x28>
  104b28:	e59f3010 	ldr	r3, [pc, #16]	; 104b40 <prog+0x4afc>
  104b2c:	e59f1010 	ldr	r1, [pc, #16]	; 104b44 <prog+0x4b00>
  104b30:	e5930000 	ldr	r0, [r3]
  104b34:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
  104b38:	ea0002a8 	b	1055e0 <_fwalk>
  104b3c:	00200410 	eoreq	r0, r0, r0, lsl r4
  104b40:	0010b6cc 	andeqs	fp, r0, ip, asr #13
  104b44:	00104a68 	andeqs	r4, r0, r8, ror #20

00104b48 <std>:
  104b48:	e59f3044 	ldr	r3, [pc, #68]	; 104b94 <prog+0x4b50>
  104b4c:	e580302c 	str	r3, [r0, #44]
  104b50:	e59f3040 	ldr	r3, [pc, #64]	; 104b98 <prog+0x4b54>
  104b54:	e1c020be 	strh	r2, [r0, #14]
  104b58:	e5803020 	str	r3, [r0, #32]
  104b5c:	e59f2038 	ldr	r2, [pc, #56]	; 104b9c <prog+0x4b58>
  104b60:	e59f3038 	ldr	r3, [pc, #56]	; 104ba0 <prog+0x4b5c>
  104b64:	e3a0c000 	mov	ip, #0	; 0x0
  104b68:	e1c010bc 	strh	r1, [r0, #12]
  104b6c:	e580c018 	str	ip, [r0, #24]
  104b70:	e5802024 	str	r2, [r0, #36]
  104b74:	e5803028 	str	r3, [r0, #40]
  104b78:	e580c000 	str	ip, [r0]
  104b7c:	e580c004 	str	ip, [r0, #4]
  104b80:	e580c008 	str	ip, [r0, #8]
  104b84:	e580c010 	str	ip, [r0, #16]
  104b88:	e580c014 	str	ip, [r0, #20]
  104b8c:	e580001c 	str	r0, [r0, #28]
  104b90:	e12fff1e 	bx	lr
  104b94:	00106cb8 	ldreqh	r6, [r0], -r8
  104b98:	00106d74 	andeqs	r6, r0, r4, ror sp
  104b9c:	00106d14 	andeqs	r6, r0, r4, lsl sp
  104ba0:	00106ccc 	andeqs	r6, r0, ip, asr #25

00104ba4 <__sfp_lock_acquire>:
  104ba4:	e12fff1e 	bx	lr

00104ba8 <__sfp_lock_release>:
  104ba8:	e12fff1e 	bx	lr

00104bac <__sinit_lock_acquire>:
  104bac:	e12fff1e 	bx	lr

00104bb0 <__sinit_lock_release>:
  104bb0:	e12fff1e 	bx	lr

00104bb4 <__sinit>:
  104bb4:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  104bb8:	e590e038 	ldr	lr, [r0, #56]
  104bbc:	e25e2000 	subs	r2, lr, #0	; 0x0
  104bc0:	e3a06001 	mov	r6, #1	; 0x1
  104bc4:	e3a01004 	mov	r1, #4	; 0x4
  104bc8:	e1a04000 	mov	r4, r0
  104bcc:	e2805fbb 	add	r5, r0, #748	; 0x2ec
  104bd0:	e1a03000 	mov	r3, r0
  104bd4:	18bd8070 	ldmneia	sp!, {r4, r5, r6, pc}
  104bd8:	e59f0048 	ldr	r0, [pc, #72]	; 104c28 <prog+0x4be4>
  104bdc:	e3a0c003 	mov	ip, #3	; 0x3
  104be0:	e584003c 	str	r0, [r4, #60]
  104be4:	e584c2e4 	str	ip, [r4, #740]
  104be8:	e584e2e0 	str	lr, [r4, #736]
  104bec:	e5940004 	ldr	r0, [r4, #4]
  104bf0:	e58452e8 	str	r5, [r4, #744]
  104bf4:	e5846038 	str	r6, [r4, #56]
  104bf8:	ebffffd2 	bl	104b48 <std>
  104bfc:	e1a02006 	mov	r2, r6
  104c00:	e5940008 	ldr	r0, [r4, #8]
  104c04:	e1a03004 	mov	r3, r4
  104c08:	e3a01009 	mov	r1, #9	; 0x9
  104c0c:	ebffffcd 	bl	104b48 <std>
  104c10:	e594000c 	ldr	r0, [r4, #12]
  104c14:	e1a03004 	mov	r3, r4
  104c18:	e3a0100a 	mov	r1, #10	; 0xa
  104c1c:	e3a02002 	mov	r2, #2	; 0x2
  104c20:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
  104c24:	eaffffc7 	b	104b48 <std>
  104c28:	00104c6c 	andeqs	r4, r0, ip, ror #24

00104c2c <__fp_lock>:
  104c2c:	e3a00000 	mov	r0, #0	; 0x0
  104c30:	e12fff1e 	bx	lr

00104c34 <__fp_unlock>:
  104c34:	e3a00000 	mov	r0, #0	; 0x0
  104c38:	e12fff1e 	bx	lr

00104c3c <__fp_unlock_all>:
  104c3c:	e59f3008 	ldr	r3, [pc, #8]	; 104c4c <prog+0x4c08>
  104c40:	e59f1008 	ldr	r1, [pc, #8]	; 104c50 <prog+0x4c0c>
  104c44:	e5930000 	ldr	r0, [r3]
  104c48:	ea000264 	b	1055e0 <_fwalk>
  104c4c:	00200410 	eoreq	r0, r0, r0, lsl r4
  104c50:	00104c34 	andeqs	r4, r0, r4, lsr ip

00104c54 <__fp_lock_all>:
  104c54:	e59f3008 	ldr	r3, [pc, #8]	; 104c64 <prog+0x4c20>
  104c58:	e59f1008 	ldr	r1, [pc, #8]	; 104c68 <prog+0x4c24>
  104c5c:	e5930000 	ldr	r0, [r3]
  104c60:	ea00025e 	b	1055e0 <_fwalk>
  104c64:	00200410 	eoreq	r0, r0, r0, lsl r4
  104c68:	00104c2c 	andeqs	r4, r0, ip, lsr #24

00104c6c <_cleanup_r>:
  104c6c:	e59f1000 	ldr	r1, [pc, #0]	; 104c74 <prog+0x4c30>
  104c70:	ea00025a 	b	1055e0 <_fwalk>
  104c74:	00107754 	andeqs	r7, r0, r4, asr r7

00104c78 <_cleanup>:
  104c78:	e59f3004 	ldr	r3, [pc, #4]	; 104c84 <prog+0x4c40>
  104c7c:	e5930000 	ldr	r0, [r3]
  104c80:	eafffff9 	b	104c6c <_cleanup_r>
  104c84:	0010b6cc 	andeqs	fp, r0, ip, asr #13

00104c88 <__sfmoreglue>:
  104c88:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  104c8c:	e0814081 	add	r4, r1, r1, lsl #1
  104c90:	e0614184 	rsb	r4, r1, r4, lsl #3
  104c94:	e1a04104 	mov	r4, r4, lsl #2
  104c98:	e1a06001 	mov	r6, r1
  104c9c:	e284100c 	add	r1, r4, #12	; 0xc
  104ca0:	ebffed6a 	bl	100250 <_malloc_r>
  104ca4:	e250c000 	subs	ip, r0, #0	; 0x0
  104ca8:	e3a0e000 	mov	lr, #0	; 0x0
  104cac:	e28c300c 	add	r3, ip, #12	; 0xc
  104cb0:	e1a0500c 	mov	r5, ip
  104cb4:	e1a00003 	mov	r0, r3
  104cb8:	e1a0100e 	mov	r1, lr
  104cbc:	e1a02004 	mov	r2, r4
  104cc0:	158c6004 	strne	r6, [ip, #4]
  104cc4:	158ce000 	strne	lr, [ip]
  104cc8:	158c3008 	strne	r3, [ip, #8]
  104ccc:	1bffef63 	blne	100a60 <memset>
  104cd0:	e1a00005 	mov	r0, r5
  104cd4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

00104cd8 <__sfp>:
  104cd8:	e59f30e0 	ldr	r3, [pc, #224]	; 104dc0 <prog+0x4d7c>
  104cdc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  104ce0:	e5934000 	ldr	r4, [r3]
  104ce4:	e5942038 	ldr	r2, [r4, #56]
  104ce8:	e3520000 	cmp	r2, #0	; 0x0
  104cec:	e1a05000 	mov	r5, r0
  104cf0:	0a000025 	beq	104d8c <__sfp+0xb4>
  104cf4:	e2844e2e 	add	r4, r4, #736	; 0x2e0
  104cf8:	e5943004 	ldr	r3, [r4, #4]
  104cfc:	e2531001 	subs	r1, r3, #1	; 0x1
  104d00:	e5940008 	ldr	r0, [r4, #8]
  104d04:	4a00000b 	bmi	104d38 <__sfp+0x60>
  104d08:	e1d030fc 	ldrsh	r3, [r0, #12]
  104d0c:	e3530000 	cmp	r3, #0	; 0x0
  104d10:	0a00000d 	beq	104d4c <__sfp+0x74>
  104d14:	e3a02000 	mov	r2, #0	; 0x0
  104d18:	ea000002 	b	104d28 <__sfp+0x50>
  104d1c:	e1d030fc 	ldrsh	r3, [r0, #12]
  104d20:	e3530000 	cmp	r3, #0	; 0x0
  104d24:	0a000008 	beq	104d4c <__sfp+0x74>
  104d28:	e1520001 	cmp	r2, r1
  104d2c:	e280005c 	add	r0, r0, #92	; 0x5c
  104d30:	e2822001 	add	r2, r2, #1	; 0x1
  104d34:	1afffff8 	bne	104d1c <__sfp+0x44>
  104d38:	e5940000 	ldr	r0, [r4]
  104d3c:	e3500000 	cmp	r0, #0	; 0x0
  104d40:	0a000014 	beq	104d98 <__sfp+0xc0>
  104d44:	e1a04000 	mov	r4, r0
  104d48:	eaffffea 	b	104cf8 <__sfp+0x20>
  104d4c:	e3a03000 	mov	r3, #0	; 0x0
  104d50:	e5803048 	str	r3, [r0, #72]
  104d54:	e5803000 	str	r3, [r0]
  104d58:	e5803008 	str	r3, [r0, #8]
  104d5c:	e5803004 	str	r3, [r0, #4]
  104d60:	e5803010 	str	r3, [r0, #16]
  104d64:	e5803014 	str	r3, [r0, #20]
  104d68:	e5803018 	str	r3, [r0, #24]
  104d6c:	e5803030 	str	r3, [r0, #48]
  104d70:	e5803034 	str	r3, [r0, #52]
  104d74:	e5803044 	str	r3, [r0, #68]
  104d78:	e3e03000 	mvn	r3, #0	; 0x0
  104d7c:	e1c030be 	strh	r3, [r0, #14]
  104d80:	e3a03001 	mov	r3, #1	; 0x1
  104d84:	e1c030bc 	strh	r3, [r0, #12]
  104d88:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  104d8c:	e1a00004 	mov	r0, r4
  104d90:	ebffff87 	bl	104bb4 <__sinit>
  104d94:	eaffffd6 	b	104cf4 <__sfp+0x1c>
  104d98:	e1a00005 	mov	r0, r5
  104d9c:	e3a01004 	mov	r1, #4	; 0x4
  104da0:	ebffffb8 	bl	104c88 <__sfmoreglue>
  104da4:	e3500000 	cmp	r0, #0	; 0x0
  104da8:	e5840000 	str	r0, [r4]
  104dac:	1affffe4 	bne	104d44 <__sfp+0x6c>
  104db0:	e3a0300c 	mov	r3, #12	; 0xc
  104db4:	e3a00000 	mov	r0, #0	; 0x0
  104db8:	e5853000 	str	r3, [r5]
  104dbc:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  104dc0:	0010b6cc 	andeqs	fp, r0, ip, asr #13

00104dc4 <_malloc_trim_r>:
  104dc4:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  104dc8:	e59f70e4 	ldr	r7, [pc, #228]	; 104eb4 <prog+0x4e70>
  104dcc:	e1a04001 	mov	r4, r1
  104dd0:	e1a05000 	mov	r5, r0
  104dd4:	ebffef47 	bl	100af8 <__malloc_lock>
  104dd8:	e5973008 	ldr	r3, [r7, #8]
  104ddc:	e5932004 	ldr	r2, [r3, #4]
  104de0:	e3c26003 	bic	r6, r2, #3	; 0x3
  104de4:	e0644006 	rsb	r4, r4, r6
  104de8:	e2844efe 	add	r4, r4, #4064	; 0xfe0
  104dec:	e284400f 	add	r4, r4, #15	; 0xf
  104df0:	e1a04624 	mov	r4, r4, lsr #12
  104df4:	e2444001 	sub	r4, r4, #1	; 0x1
  104df8:	e1a04604 	mov	r4, r4, lsl #12
  104dfc:	e3540a01 	cmp	r4, #4096	; 0x1000
  104e00:	e3a01000 	mov	r1, #0	; 0x0
  104e04:	e1a00005 	mov	r0, r5
  104e08:	ba000006 	blt	104e28 <_malloc_trim_r+0x64>
  104e0c:	eb000fea 	bl	108dbc <_sbrk_r>
  104e10:	e5973008 	ldr	r3, [r7, #8]
  104e14:	e0863003 	add	r3, r6, r3
  104e18:	e1500003 	cmp	r0, r3
  104e1c:	e2641000 	rsb	r1, r4, #0	; 0x0
  104e20:	e1a00005 	mov	r0, r5
  104e24:	0a000002 	beq	104e34 <_malloc_trim_r+0x70>
  104e28:	ebffef33 	bl	100afc <__malloc_unlock>
  104e2c:	e3a00000 	mov	r0, #0	; 0x0
  104e30:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  104e34:	eb000fe0 	bl	108dbc <_sbrk_r>
  104e38:	e0643006 	rsb	r3, r4, r6
  104e3c:	e3700001 	cmn	r0, #1	; 0x1
  104e40:	e3a01000 	mov	r1, #0	; 0x0
  104e44:	e59fe06c 	ldr	lr, [pc, #108]	; 104eb8 <prog+0x4e74>
  104e48:	e383c001 	orr	ip, r3, #1	; 0x1
  104e4c:	e1a00005 	mov	r0, r5
  104e50:	0a000008 	beq	104e78 <_malloc_trim_r+0xb4>
  104e54:	e59e3000 	ldr	r3, [lr]
  104e58:	e5972008 	ldr	r2, [r7, #8]
  104e5c:	e0643003 	rsb	r3, r4, r3
  104e60:	e1a00005 	mov	r0, r5
  104e64:	e582c004 	str	ip, [r2, #4]
  104e68:	e58e3000 	str	r3, [lr]
  104e6c:	ebffef22 	bl	100afc <__malloc_unlock>
  104e70:	e3a00001 	mov	r0, #1	; 0x1
  104e74:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  104e78:	eb000fcf 	bl	108dbc <_sbrk_r>
  104e7c:	e5971008 	ldr	r1, [r7, #8]
  104e80:	e1a0e000 	mov	lr, r0
  104e84:	e061300e 	rsb	r3, r1, lr
  104e88:	e353000f 	cmp	r3, #15	; 0xf
  104e8c:	e1a00005 	mov	r0, r5
  104e90:	e383c001 	orr	ip, r3, #1	; 0x1
  104e94:	daffffe3 	ble	104e28 <_malloc_trim_r+0x64>
  104e98:	e59f301c 	ldr	r3, [pc, #28]	; 104ebc <prog+0x4e78>
  104e9c:	e5932000 	ldr	r2, [r3]
  104ea0:	e59f3010 	ldr	r3, [pc, #16]	; 104eb8 <prog+0x4e74>
  104ea4:	e062200e 	rsb	r2, r2, lr
  104ea8:	e5832000 	str	r2, [r3]
  104eac:	e581c004 	str	ip, [r1, #4]
  104eb0:	eaffffdc 	b	104e28 <_malloc_trim_r+0x64>
  104eb4:	00200000 	eoreq	r0, r0, r0
  104eb8:	0020083c 	eoreq	r0, r0, ip, lsr r8
  104ebc:	0020040c 	eoreq	r0, r0, ip, lsl #8

00104ec0 <_free_r>:
  104ec0:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  104ec4:	e2514000 	subs	r4, r1, #0	; 0x0
  104ec8:	e1a08000 	mov	r8, r0
  104ecc:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  104ed0:	ebffef08 	bl	100af8 <__malloc_lock>
  104ed4:	e244e008 	sub	lr, r4, #8	; 0x8
  104ed8:	e59e0004 	ldr	r0, [lr, #4]
  104edc:	e59f726c 	ldr	r7, [pc, #620]	; 105150 <prog+0x510c>
  104ee0:	e3c01001 	bic	r1, r0, #1	; 0x1
  104ee4:	e08ec001 	add	ip, lr, r1
  104ee8:	e5973008 	ldr	r3, [r7, #8]
  104eec:	e59c2004 	ldr	r2, [ip, #4]
  104ef0:	e15c0003 	cmp	ip, r3
  104ef4:	e3c25003 	bic	r5, r2, #3	; 0x3
  104ef8:	e1a0a007 	mov	sl, r7
  104efc:	0a000077 	beq	1050e0 <_free_r+0x220>
  104f00:	e2106001 	ands	r6, r0, #1	; 0x1
  104f04:	e58c5004 	str	r5, [ip, #4]
  104f08:	13a00000 	movne	r0, #0	; 0x0
  104f0c:	0a000018 	beq	104f74 <_free_r+0xb4>
  104f10:	e08c3005 	add	r3, ip, r5
  104f14:	e5932004 	ldr	r2, [r3, #4]
  104f18:	e3120001 	tst	r2, #1	; 0x1
  104f1c:	0a000007 	beq	104f40 <_free_r+0x80>
  104f20:	e3813001 	orr	r3, r1, #1	; 0x1
  104f24:	e3500000 	cmp	r0, #0	; 0x0
  104f28:	e58e3004 	str	r3, [lr, #4]
  104f2c:	e781100e 	str	r1, [r1, lr]
  104f30:	0a00001f 	beq	104fb4 <_free_r+0xf4>
  104f34:	e1a00008 	mov	r0, r8
  104f38:	e8bd45f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, lr}
  104f3c:	eaffeeee 	b	100afc <__malloc_unlock>
  104f40:	e3500000 	cmp	r0, #0	; 0x0
  104f44:	e0811005 	add	r1, r1, r5
  104f48:	159c2008 	ldrne	r2, [ip, #8]
  104f4c:	0a00004a 	beq	10507c <_free_r+0x1bc>
  104f50:	e59c300c 	ldr	r3, [ip, #12]
  104f54:	e3500000 	cmp	r0, #0	; 0x0
  104f58:	e5832008 	str	r2, [r3, #8]
  104f5c:	e582300c 	str	r3, [r2, #12]
  104f60:	e3813001 	orr	r3, r1, #1	; 0x1
  104f64:	e58e3004 	str	r3, [lr, #4]
  104f68:	e781100e 	str	r1, [r1, lr]
  104f6c:	1afffff0 	bne	104f34 <_free_r+0x74>
  104f70:	ea00000f 	b	104fb4 <_free_r+0xf4>
  104f74:	e5142008 	ldr	r2, [r4, #-8]
  104f78:	e062e00e 	rsb	lr, r2, lr
  104f7c:	e59e0008 	ldr	r0, [lr, #8]
  104f80:	e2873008 	add	r3, r7, #8	; 0x8
  104f84:	e1500003 	cmp	r0, r3
  104f88:	159e300c 	ldrne	r3, [lr, #12]
  104f8c:	15830008 	strne	r0, [r3, #8]
  104f90:	1580300c 	strne	r3, [r0, #12]
  104f94:	e08c3005 	add	r3, ip, r5
  104f98:	e0811002 	add	r1, r1, r2
  104f9c:	e5932004 	ldr	r2, [r3, #4]
  104fa0:	03a00001 	moveq	r0, #1	; 0x1
  104fa4:	11a00006 	movne	r0, r6
  104fa8:	e3120001 	tst	r2, #1	; 0x1
  104fac:	1affffdb 	bne	104f20 <_free_r+0x60>
  104fb0:	eaffffe2 	b	104f40 <_free_r+0x80>
  104fb4:	e3510c02 	cmp	r1, #512	; 0x200
  104fb8:	3a00003b 	bcc	1050ac <_free_r+0x1ec>
  104fbc:	e1b024a1 	movs	r2, r1, lsr #9
  104fc0:	01a021a1 	moveq	r2, r1, lsr #3
  104fc4:	01a03182 	moveq	r3, r2, lsl #3
  104fc8:	0a00001a 	beq	105038 <_free_r+0x178>
  104fcc:	e3520004 	cmp	r2, #4	; 0x4
  104fd0:	91a03321 	movls	r3, r1, lsr #6
  104fd4:	92832038 	addls	r2, r3, #56	; 0x38
  104fd8:	91a03182 	movls	r3, r2, lsl #3
  104fdc:	9a000015 	bls	105038 <_free_r+0x178>
  104fe0:	e3520014 	cmp	r2, #20	; 0x14
  104fe4:	9282205b 	addls	r2, r2, #91	; 0x5b
  104fe8:	91a03182 	movls	r3, r2, lsl #3
  104fec:	9a000011 	bls	105038 <_free_r+0x178>
  104ff0:	e3520054 	cmp	r2, #84	; 0x54
  104ff4:	91a03621 	movls	r3, r1, lsr #12
  104ff8:	9283206e 	addls	r2, r3, #110	; 0x6e
  104ffc:	91a03182 	movls	r3, r2, lsl #3
  105000:	9a00000c 	bls	105038 <_free_r+0x178>
  105004:	e3520f55 	cmp	r2, #340	; 0x154
  105008:	91a037a1 	movls	r3, r1, lsr #15
  10500c:	92832077 	addls	r2, r3, #119	; 0x77
  105010:	91a03182 	movls	r3, r2, lsl #3
  105014:	9a000007 	bls	105038 <_free_r+0x178>
  105018:	e3a03e55 	mov	r3, #1360	; 0x550
  10501c:	e2833004 	add	r3, r3, #4	; 0x4
  105020:	e1520003 	cmp	r2, r3
  105024:	91a03921 	movls	r3, r1, lsr #18
  105028:	9283207c 	addls	r2, r3, #124	; 0x7c
  10502c:	83a0207e 	movhi	r2, #126	; 0x7e
  105030:	82433f59 	subhi	r3, r3, #356	; 0x164
  105034:	91a03182 	movls	r3, r2, lsl #3
  105038:	e083c00a 	add	ip, r3, sl
  10503c:	e59c0008 	ldr	r0, [ip, #8]
  105040:	e15c0000 	cmp	ip, r0
  105044:	0a00003b 	beq	105138 <_free_r+0x278>
  105048:	e5903004 	ldr	r3, [r0, #4]
  10504c:	e3c33003 	bic	r3, r3, #3	; 0x3
  105050:	e1510003 	cmp	r1, r3
  105054:	2a000002 	bcs	105064 <_free_r+0x1a4>
  105058:	e5900008 	ldr	r0, [r0, #8]
  10505c:	e15c0000 	cmp	ip, r0
  105060:	1afffff8 	bne	105048 <_free_r+0x188>
  105064:	e590c00c 	ldr	ip, [r0, #12]
  105068:	e58ec00c 	str	ip, [lr, #12]
  10506c:	e58e0008 	str	r0, [lr, #8]
  105070:	e580e00c 	str	lr, [r0, #12]
  105074:	e58ce008 	str	lr, [ip, #8]
  105078:	eaffffad 	b	104f34 <_free_r+0x74>
  10507c:	e59c2008 	ldr	r2, [ip, #8]
  105080:	e59f30cc 	ldr	r3, [pc, #204]	; 105154 <prog+0x5110>
  105084:	e1520003 	cmp	r2, r3
  105088:	1affffb0 	bne	104f50 <_free_r+0x90>
  10508c:	e3813001 	orr	r3, r1, #1	; 0x1
  105090:	e582e00c 	str	lr, [r2, #12]
  105094:	e582e008 	str	lr, [r2, #8]
  105098:	e781100e 	str	r1, [r1, lr]
  10509c:	e58e3004 	str	r3, [lr, #4]
  1050a0:	e58e2008 	str	r2, [lr, #8]
  1050a4:	e58e200c 	str	r2, [lr, #12]
  1050a8:	eaffffa1 	b	104f34 <_free_r+0x74>
  1050ac:	e1a011a1 	mov	r1, r1, lsr #3
  1050b0:	e5972004 	ldr	r2, [r7, #4]
  1050b4:	e1a00121 	mov	r0, r1, lsr #2
  1050b8:	e3a03001 	mov	r3, #1	; 0x1
  1050bc:	e1822013 	orr	r2, r2, r3, lsl r0
  1050c0:	e08a1181 	add	r1, sl, r1, lsl #3
  1050c4:	e5913008 	ldr	r3, [r1, #8]
  1050c8:	e58e100c 	str	r1, [lr, #12]
  1050cc:	e58e3008 	str	r3, [lr, #8]
  1050d0:	e5872004 	str	r2, [r7, #4]
  1050d4:	e583e00c 	str	lr, [r3, #12]
  1050d8:	e581e008 	str	lr, [r1, #8]
  1050dc:	eaffff94 	b	104f34 <_free_r+0x74>
  1050e0:	e3100001 	tst	r0, #1	; 0x1
  1050e4:	e0810005 	add	r0, r1, r5
  1050e8:	1a000006 	bne	105108 <_free_r+0x248>
  1050ec:	e5141008 	ldr	r1, [r4, #-8]
  1050f0:	e061e00e 	rsb	lr, r1, lr
  1050f4:	e59e200c 	ldr	r2, [lr, #12]
  1050f8:	e59e3008 	ldr	r3, [lr, #8]
  1050fc:	e5823008 	str	r3, [r2, #8]
  105100:	e583200c 	str	r2, [r3, #12]
  105104:	e0800001 	add	r0, r0, r1
  105108:	e59f3048 	ldr	r3, [pc, #72]	; 105158 <prog+0x5114>
  10510c:	e5932000 	ldr	r2, [r3]
  105110:	e3803001 	orr	r3, r0, #1	; 0x1
  105114:	e1500002 	cmp	r0, r2
  105118:	e587e008 	str	lr, [r7, #8]
  10511c:	e58e3004 	str	r3, [lr, #4]
  105120:	3affff83 	bcc	104f34 <_free_r+0x74>
  105124:	e59f3030 	ldr	r3, [pc, #48]	; 10515c <prog+0x5118>
  105128:	e1a00008 	mov	r0, r8
  10512c:	e5931000 	ldr	r1, [r3]
  105130:	ebffff23 	bl	104dc4 <_malloc_trim_r>
  105134:	eaffff7e 	b	104f34 <_free_r+0x74>
  105138:	e5973004 	ldr	r3, [r7, #4]
  10513c:	e1a01122 	mov	r1, r2, lsr #2
  105140:	e3a02001 	mov	r2, #1	; 0x1
  105144:	e1833112 	orr	r3, r3, r2, lsl r1
  105148:	e5873004 	str	r3, [r7, #4]
  10514c:	eaffffc5 	b	105068 <_free_r+0x1a8>
  105150:	00200000 	eoreq	r0, r0, r0
  105154:	00200008 	eoreq	r0, r0, r8
  105158:	00200408 	eoreq	r0, r0, r8, lsl #8
  10515c:	00200830 	eoreq	r0, r0, r0, lsr r8

00105160 <__sfvwrite>:
  105160:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  105164:	e5913008 	ldr	r3, [r1, #8]
  105168:	e3530000 	cmp	r3, #0	; 0x0
  10516c:	e24dd004 	sub	sp, sp, #4	; 0x4
  105170:	e1a0a001 	mov	sl, r1
  105174:	e1a06000 	mov	r6, r0
  105178:	0a00001c 	beq	1051f0 <__sfvwrite+0x90>
  10517c:	e1d010bc 	ldrh	r1, [r0, #12]
  105180:	e3110008 	tst	r1, #8	; 0x8
  105184:	0a0000e8 	beq	10552c <__sfvwrite+0x3cc>
  105188:	e5903010 	ldr	r3, [r0, #16]
  10518c:	e3530000 	cmp	r3, #0	; 0x0
  105190:	0a0000e5 	beq	10552c <__sfvwrite+0x3cc>
  105194:	e3110002 	tst	r1, #2	; 0x2
  105198:	13a04000 	movne	r4, #0	; 0x0
  10519c:	e59a8000 	ldr	r8, [sl]
  1051a0:	11a05004 	movne	r5, r4
  1051a4:	0a000018 	beq	10520c <__sfvwrite+0xac>
  1051a8:	e3540000 	cmp	r4, #0	; 0x0
  1051ac:	e1a01005 	mov	r1, r5
  1051b0:	0a000011 	beq	1051fc <__sfvwrite+0x9c>
  1051b4:	e3540b01 	cmp	r4, #1024	; 0x400
  1051b8:	31a02004 	movcc	r2, r4
  1051bc:	23a02b01 	movcs	r2, #1024	; 0x400
  1051c0:	e596001c 	ldr	r0, [r6, #28]
  1051c4:	e1a0e00f 	mov	lr, pc
  1051c8:	e596f024 	ldr	pc, [r6, #36]
  1051cc:	e3500000 	cmp	r0, #0	; 0x0
  1051d0:	e0604004 	rsb	r4, r0, r4
  1051d4:	e0855000 	add	r5, r5, r0
  1051d8:	da00005b 	ble	10534c <__sfvwrite+0x1ec>
  1051dc:	e59a3008 	ldr	r3, [sl, #8]
  1051e0:	e0603003 	rsb	r3, r0, r3
  1051e4:	e3530000 	cmp	r3, #0	; 0x0
  1051e8:	e58a3008 	str	r3, [sl, #8]
  1051ec:	1affffed 	bne	1051a8 <__sfvwrite+0x48>
  1051f0:	e3a00000 	mov	r0, #0	; 0x0
  1051f4:	e28dd004 	add	sp, sp, #4	; 0x4
  1051f8:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1051fc:	e5985000 	ldr	r5, [r8]
  105200:	e5984004 	ldr	r4, [r8, #4]
  105204:	e2888008 	add	r8, r8, #8	; 0x8
  105208:	eaffffe6 	b	1051a8 <__sfvwrite+0x48>
  10520c:	e2112001 	ands	r2, r1, #1	; 0x1
  105210:	13a07000 	movne	r7, #0	; 0x0
  105214:	11a09007 	movne	r9, r7
  105218:	158d7000 	strne	r7, [sp]
  10521c:	11a0b007 	movne	fp, r7
  105220:	0a00005b 	beq	105394 <__sfvwrite+0x234>
  105224:	e3570000 	cmp	r7, #0	; 0x0
  105228:	0a000025 	beq	1052c4 <__sfvwrite+0x164>
  10522c:	e59d3000 	ldr	r3, [sp]
  105230:	e3530000 	cmp	r3, #0	; 0x0
  105234:	0a000049 	beq	105360 <__sfvwrite+0x200>
  105238:	e596c014 	ldr	ip, [r6, #20]
  10523c:	e5961008 	ldr	r1, [r6, #8]
  105240:	e5960000 	ldr	r0, [r6]
  105244:	e5962010 	ldr	r2, [r6, #16]
  105248:	e157000b 	cmp	r7, fp
  10524c:	31a05007 	movcc	r5, r7
  105250:	21a0500b 	movcs	r5, fp
  105254:	e08c4001 	add	r4, ip, r1
  105258:	e1500002 	cmp	r0, r2
  10525c:	93a03000 	movls	r3, #0	; 0x0
  105260:	83a03001 	movhi	r3, #1	; 0x1
  105264:	e1550004 	cmp	r5, r4
  105268:	d3a03000 	movle	r3, #0	; 0x0
  10526c:	e3530000 	cmp	r3, #0	; 0x0
  105270:	1a00002b 	bne	105324 <__sfvwrite+0x1c4>
  105274:	e155000c 	cmp	r5, ip
  105278:	ba000017 	blt	1052dc <__sfvwrite+0x17c>
  10527c:	e1a0200c 	mov	r2, ip
  105280:	e596001c 	ldr	r0, [r6, #28]
  105284:	e1a01009 	mov	r1, r9
  105288:	e1a0e00f 	mov	lr, pc
  10528c:	e596f024 	ldr	pc, [r6, #36]
  105290:	e2504000 	subs	r4, r0, #0	; 0x0
  105294:	da00002c 	ble	10534c <__sfvwrite+0x1ec>
  105298:	e05bb004 	subs	fp, fp, r4
  10529c:	0a00001a 	beq	10530c <__sfvwrite+0x1ac>
  1052a0:	e59a3008 	ldr	r3, [sl, #8]
  1052a4:	e0643003 	rsb	r3, r4, r3
  1052a8:	e3530000 	cmp	r3, #0	; 0x0
  1052ac:	e58a3008 	str	r3, [sl, #8]
  1052b0:	0affffce 	beq	1051f0 <__sfvwrite+0x90>
  1052b4:	e0647007 	rsb	r7, r4, r7
  1052b8:	e3570000 	cmp	r7, #0	; 0x0
  1052bc:	e0899004 	add	r9, r9, r4
  1052c0:	1affffd9 	bne	10522c <__sfvwrite+0xcc>
  1052c4:	e5989000 	ldr	r9, [r8]
  1052c8:	e5987004 	ldr	r7, [r8, #4]
  1052cc:	e3a03000 	mov	r3, #0	; 0x0
  1052d0:	e2888008 	add	r8, r8, #8	; 0x8
  1052d4:	e58d3000 	str	r3, [sp]
  1052d8:	eaffffd1 	b	105224 <__sfvwrite+0xc4>
  1052dc:	e1a02005 	mov	r2, r5
  1052e0:	e1a01009 	mov	r1, r9
  1052e4:	eb00019f 	bl	105968 <memmove>
  1052e8:	e5963008 	ldr	r3, [r6, #8]
  1052ec:	e5962000 	ldr	r2, [r6]
  1052f0:	e1a04005 	mov	r4, r5
  1052f4:	e0653003 	rsb	r3, r5, r3
  1052f8:	e0822005 	add	r2, r2, r5
  1052fc:	e05bb004 	subs	fp, fp, r4
  105300:	e5863008 	str	r3, [r6, #8]
  105304:	e5862000 	str	r2, [r6]
  105308:	1affffe4 	bne	1052a0 <__sfvwrite+0x140>
  10530c:	e1a00006 	mov	r0, r6
  105310:	ebfffdd4 	bl	104a68 <fflush>
  105314:	e3500000 	cmp	r0, #0	; 0x0
  105318:	1a00000b 	bne	10534c <__sfvwrite+0x1ec>
  10531c:	e58d0000 	str	r0, [sp]
  105320:	eaffffde 	b	1052a0 <__sfvwrite+0x140>
  105324:	e1a01009 	mov	r1, r9
  105328:	e1a02004 	mov	r2, r4
  10532c:	eb00018d 	bl	105968 <memmove>
  105330:	e5963000 	ldr	r3, [r6]
  105334:	e0833004 	add	r3, r3, r4
  105338:	e5863000 	str	r3, [r6]
  10533c:	e1a00006 	mov	r0, r6
  105340:	ebfffdc8 	bl	104a68 <fflush>
  105344:	e3500000 	cmp	r0, #0	; 0x0
  105348:	0affffd2 	beq	105298 <__sfvwrite+0x138>
  10534c:	e1d630bc 	ldrh	r3, [r6, #12]
  105350:	e3e00000 	mvn	r0, #0	; 0x0
  105354:	e3833040 	orr	r3, r3, #64	; 0x40
  105358:	e1c630bc 	strh	r3, [r6, #12]
  10535c:	eaffffa4 	b	1051f4 <__sfvwrite+0x94>
  105360:	e1a00009 	mov	r0, r9
  105364:	e3a0100a 	mov	r1, #10	; 0xa
  105368:	e1a02007 	mov	r2, r7
  10536c:	eb00013c 	bl	105864 <memchr>
  105370:	e3500000 	cmp	r0, #0	; 0x0
  105374:	10693000 	rsbne	r3, r9, r0
  105378:	1283b001 	addne	fp, r3, #1	; 0x1
  10537c:	03a03001 	moveq	r3, #1	; 0x1
  105380:	13a03001 	movne	r3, #1	; 0x1
  105384:	0287b001 	addeq	fp, r7, #1	; 0x1
  105388:	158d3000 	strne	r3, [sp]
  10538c:	058d3000 	streq	r3, [sp]
  105390:	eaffffa8 	b	105238 <__sfvwrite+0xd8>
  105394:	e1a07002 	mov	r7, r2
  105398:	e1a09002 	mov	r9, r2
  10539c:	e3570000 	cmp	r7, #0	; 0x0
  1053a0:	0a000020 	beq	105428 <__sfvwrite+0x2c8>
  1053a4:	e3110c02 	tst	r1, #512	; 0x200
  1053a8:	e5964008 	ldr	r4, [r6, #8]
  1053ac:	0a000021 	beq	105438 <__sfvwrite+0x2d8>
  1053b0:	e1570004 	cmp	r7, r4
  1053b4:	e1a02004 	mov	r2, r4
  1053b8:	9a000001 	bls	1053c4 <__sfvwrite+0x264>
  1053bc:	e3110080 	tst	r1, #128	; 0x80
  1053c0:	1a000047 	bne	1054e4 <__sfvwrite+0x384>
  1053c4:	e1570002 	cmp	r7, r2
  1053c8:	31a02007 	movcc	r2, r7
  1053cc:	e5960000 	ldr	r0, [r6]
  1053d0:	e1a01009 	mov	r1, r9
  1053d4:	31a04007 	movcc	r4, r7
  1053d8:	eb000162 	bl	105968 <memmove>
  1053dc:	e5963008 	ldr	r3, [r6, #8]
  1053e0:	e5962000 	ldr	r2, [r6]
  1053e4:	e0643003 	rsb	r3, r4, r3
  1053e8:	e0822004 	add	r2, r2, r4
  1053ec:	e5863008 	str	r3, [r6, #8]
  1053f0:	e5862000 	str	r2, [r6]
  1053f4:	e1a05007 	mov	r5, r7
  1053f8:	e1a00007 	mov	r0, r7
  1053fc:	e1a04007 	mov	r4, r7
  105400:	e59a3008 	ldr	r3, [sl, #8]
  105404:	e0643003 	rsb	r3, r4, r3
  105408:	e3530000 	cmp	r3, #0	; 0x0
  10540c:	e58a3008 	str	r3, [sl, #8]
  105410:	0affff76 	beq	1051f0 <__sfvwrite+0x90>
  105414:	e0657007 	rsb	r7, r5, r7
  105418:	e3570000 	cmp	r7, #0	; 0x0
  10541c:	e1d610bc 	ldrh	r1, [r6, #12]
  105420:	e0899000 	add	r9, r9, r0
  105424:	1affffde 	bne	1053a4 <__sfvwrite+0x244>
  105428:	e5989000 	ldr	r9, [r8]
  10542c:	e5987004 	ldr	r7, [r8, #4]
  105430:	e2888008 	add	r8, r8, #8	; 0x8
  105434:	eaffffd8 	b	10539c <__sfvwrite+0x23c>
  105438:	e5960000 	ldr	r0, [r6]
  10543c:	e5963010 	ldr	r3, [r6, #16]
  105440:	e1500003 	cmp	r0, r3
  105444:	81570004 	cmphi	r7, r4
  105448:	e1a05004 	mov	r5, r4
  10544c:	8a000018 	bhi	1054b4 <__sfvwrite+0x354>
  105450:	e5962014 	ldr	r2, [r6, #20]
  105454:	e1570002 	cmp	r7, r2
  105458:	3a000008 	bcc	105480 <__sfvwrite+0x320>
  10545c:	e596001c 	ldr	r0, [r6, #28]
  105460:	e1a01009 	mov	r1, r9
  105464:	e1a0e00f 	mov	lr, pc
  105468:	e596f024 	ldr	pc, [r6, #36]
  10546c:	e2504000 	subs	r4, r0, #0	; 0x0
  105470:	daffffb5 	ble	10534c <__sfvwrite+0x1ec>
  105474:	e1a05004 	mov	r5, r4
  105478:	e1a00004 	mov	r0, r4
  10547c:	eaffffdf 	b	105400 <__sfvwrite+0x2a0>
  105480:	e1a02007 	mov	r2, r7
  105484:	e1a01009 	mov	r1, r9
  105488:	eb000136 	bl	105968 <memmove>
  10548c:	e5963008 	ldr	r3, [r6, #8]
  105490:	e5962000 	ldr	r2, [r6]
  105494:	e0673003 	rsb	r3, r7, r3
  105498:	e0822007 	add	r2, r2, r7
  10549c:	e1a04007 	mov	r4, r7
  1054a0:	e1a05007 	mov	r5, r7
  1054a4:	e1a00007 	mov	r0, r7
  1054a8:	e5863008 	str	r3, [r6, #8]
  1054ac:	e5862000 	str	r2, [r6]
  1054b0:	eaffffd2 	b	105400 <__sfvwrite+0x2a0>
  1054b4:	e1a01009 	mov	r1, r9
  1054b8:	e1a02004 	mov	r2, r4
  1054bc:	eb000129 	bl	105968 <memmove>
  1054c0:	e5963000 	ldr	r3, [r6]
  1054c4:	e0833004 	add	r3, r3, r4
  1054c8:	e5863000 	str	r3, [r6]
  1054cc:	e1a00006 	mov	r0, r6
  1054d0:	ebfffd64 	bl	104a68 <fflush>
  1054d4:	e3500000 	cmp	r0, #0	; 0x0
  1054d8:	e1a00004 	mov	r0, r4
  1054dc:	0affffc7 	beq	105400 <__sfvwrite+0x2a0>
  1054e0:	eaffff99 	b	10534c <__sfvwrite+0x1ec>
  1054e4:	e5961010 	ldr	r1, [r6, #16]
  1054e8:	e5963000 	ldr	r3, [r6]
  1054ec:	e59fb060 	ldr	fp, [pc, #96]	; 105554 <prog+0x5510>
  1054f0:	e0614003 	rsb	r4, r1, r3
  1054f4:	e0875004 	add	r5, r7, r4
  1054f8:	e59b0000 	ldr	r0, [fp]
  1054fc:	e1a02005 	mov	r2, r5
  105500:	eb000443 	bl	106614 <_realloc_r>
  105504:	e3500000 	cmp	r0, #0	; 0x0
  105508:	0a00000d 	beq	105544 <__sfvwrite+0x3e4>
  10550c:	e0803004 	add	r3, r0, r4
  105510:	e1a02007 	mov	r2, r7
  105514:	e1a04007 	mov	r4, r7
  105518:	e5863000 	str	r3, [r6]
  10551c:	e5865014 	str	r5, [r6, #20]
  105520:	e5860010 	str	r0, [r6, #16]
  105524:	e5867008 	str	r7, [r6, #8]
  105528:	eaffffa5 	b	1053c4 <__sfvwrite+0x264>
  10552c:	ebfff77b 	bl	103320 <__swsetup>
  105530:	e3500000 	cmp	r0, #0	; 0x0
  105534:	13e00000 	mvnne	r0, #0	; 0x0
  105538:	1affff2d 	bne	1051f4 <__sfvwrite+0x94>
  10553c:	e1d610bc 	ldrh	r1, [r6, #12]
  105540:	eaffff13 	b	105194 <__sfvwrite+0x34>
  105544:	e59b0000 	ldr	r0, [fp]
  105548:	e5961010 	ldr	r1, [r6, #16]
  10554c:	ebfffe5b 	bl	104ec0 <_free_r>
  105550:	eaffff7d 	b	10534c <__sfvwrite+0x1ec>
  105554:	00200410 	eoreq	r0, r0, r0, lsl r4

00105558 <_fwalk_reent>:
  105558:	e92d47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
  10555c:	e1a08000 	mov	r8, r0
  105560:	e1a0a001 	mov	sl, r1
  105564:	ebfffd8e 	bl	104ba4 <__sfp_lock_acquire>
  105568:	e2987e2e 	adds	r7, r8, #736	; 0x2e0
  10556c:	01a09007 	moveq	r9, r7
  105570:	0a000017 	beq	1055d4 <_fwalk_reent+0x7c>
  105574:	e3a09000 	mov	r9, #0	; 0x0
  105578:	e5973004 	ldr	r3, [r7, #4]
  10557c:	e2536001 	subs	r6, r3, #1	; 0x1
  105580:	e5974008 	ldr	r4, [r7, #8]
  105584:	4a00000f 	bmi	1055c8 <_fwalk_reent+0x70>
  105588:	e3a05000 	mov	r5, #0	; 0x0
  10558c:	e1d430fc 	ldrsh	r3, [r4, #12]
  105590:	e3530000 	cmp	r3, #0	; 0x0
  105594:	0a000007 	beq	1055b8 <_fwalk_reent+0x60>
  105598:	e1d430fe 	ldrsh	r3, [r4, #14]
  10559c:	e3730001 	cmn	r3, #1	; 0x1
  1055a0:	e1a01004 	mov	r1, r4
  1055a4:	e1a00008 	mov	r0, r8
  1055a8:	0a000002 	beq	1055b8 <_fwalk_reent+0x60>
  1055ac:	e1a0e00f 	mov	lr, pc
  1055b0:	e12fff1a 	bx	sl
  1055b4:	e1899000 	orr	r9, r9, r0
  1055b8:	e1560005 	cmp	r6, r5
  1055bc:	e284405c 	add	r4, r4, #92	; 0x5c
  1055c0:	e2855001 	add	r5, r5, #1	; 0x1
  1055c4:	1afffff0 	bne	10558c <_fwalk_reent+0x34>
  1055c8:	e5977000 	ldr	r7, [r7]
  1055cc:	e3570000 	cmp	r7, #0	; 0x0
  1055d0:	1affffe8 	bne	105578 <_fwalk_reent+0x20>
  1055d4:	ebfffd73 	bl	104ba8 <__sfp_lock_release>
  1055d8:	e1a00009 	mov	r0, r9
  1055dc:	e8bd87f0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

001055e0 <_fwalk>:
  1055e0:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  1055e4:	e1a04000 	mov	r4, r0
  1055e8:	e1a08001 	mov	r8, r1
  1055ec:	ebfffd6c 	bl	104ba4 <__sfp_lock_acquire>
  1055f0:	e2947e2e 	adds	r7, r4, #736	; 0x2e0
  1055f4:	01a0a007 	moveq	sl, r7
  1055f8:	0a000016 	beq	105658 <_fwalk+0x78>
  1055fc:	e3a0a000 	mov	sl, #0	; 0x0
  105600:	e5973004 	ldr	r3, [r7, #4]
  105604:	e2536001 	subs	r6, r3, #1	; 0x1
  105608:	e5974008 	ldr	r4, [r7, #8]
  10560c:	4a00000e 	bmi	10564c <_fwalk+0x6c>
  105610:	e3a05000 	mov	r5, #0	; 0x0
  105614:	e1d430fc 	ldrsh	r3, [r4, #12]
  105618:	e3530000 	cmp	r3, #0	; 0x0
  10561c:	0a000006 	beq	10563c <_fwalk+0x5c>
  105620:	e1d430fe 	ldrsh	r3, [r4, #14]
  105624:	e3730001 	cmn	r3, #1	; 0x1
  105628:	e1a00004 	mov	r0, r4
  10562c:	0a000002 	beq	10563c <_fwalk+0x5c>
  105630:	e1a0e00f 	mov	lr, pc
  105634:	e12fff18 	bx	r8
  105638:	e18aa000 	orr	sl, sl, r0
  10563c:	e1560005 	cmp	r6, r5
  105640:	e284405c 	add	r4, r4, #92	; 0x5c
  105644:	e2855001 	add	r5, r5, #1	; 0x1
  105648:	1afffff1 	bne	105614 <_fwalk+0x34>
  10564c:	e5977000 	ldr	r7, [r7]
  105650:	e3570000 	cmp	r7, #0	; 0x0
  105654:	1affffe9 	bne	105600 <_fwalk+0x20>
  105658:	ebfffd52 	bl	104ba8 <__sfp_lock_release>
  10565c:	e1a0000a 	mov	r0, sl
  105660:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}

00105664 <__locale_charset>:
  105664:	e59f3004 	ldr	r3, [pc, #4]	; 105670 <prog+0x562c>
  105668:	e5930000 	ldr	r0, [r3]
  10566c:	e12fff1e 	bx	lr
  105670:	0010b700 	andeqs	fp, r0, r0, lsl #14

00105674 <_localeconv_r>:
  105674:	e59f0000 	ldr	r0, [pc, #0]	; 10567c <prog+0x5638>
  105678:	e12fff1e 	bx	lr
  10567c:	0010b6d0 	ldreqsb	fp, [r0], -r0

00105680 <localeconv>:
  105680:	e59f3004 	ldr	r3, [pc, #4]	; 10568c <prog+0x5648>
  105684:	e5930000 	ldr	r0, [r3]
  105688:	eafffff9 	b	105674 <_localeconv_r>
  10568c:	00200410 	eoreq	r0, r0, r0, lsl r4

00105690 <_setlocale_r>:
  105690:	e59f3054 	ldr	r3, [pc, #84]	; 1056ec <prog+0x56a8>
  105694:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  105698:	e2524000 	subs	r4, r2, #0	; 0x0
  10569c:	e1a05000 	mov	r5, r0
  1056a0:	e1a06001 	mov	r6, r1
  1056a4:	e1a00004 	mov	r0, r4
  1056a8:	e1a01003 	mov	r1, r3
  1056ac:	0a000007 	beq	1056d0 <_setlocale_r+0x40>
  1056b0:	eb0005c0 	bl	106db8 <strcmp>
  1056b4:	e3500000 	cmp	r0, #0	; 0x0
  1056b8:	e59f1030 	ldr	r1, [pc, #48]	; 1056f0 <prog+0x56ac>
  1056bc:	e1a00004 	mov	r0, r4
  1056c0:	1a000004 	bne	1056d8 <_setlocale_r+0x48>
  1056c4:	e5854034 	str	r4, [r5, #52]
  1056c8:	e5856030 	str	r6, [r5, #48]
  1056cc:	e59f3018 	ldr	r3, [pc, #24]	; 1056ec <prog+0x56a8>
  1056d0:	e1a00003 	mov	r0, r3
  1056d4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  1056d8:	eb0005b6 	bl	106db8 <strcmp>
  1056dc:	e3500000 	cmp	r0, #0	; 0x0
  1056e0:	e3a03000 	mov	r3, #0	; 0x0
  1056e4:	0afffff6 	beq	1056c4 <_setlocale_r+0x34>
  1056e8:	eafffff8 	b	1056d0 <_setlocale_r+0x40>
  1056ec:	0010ba10 	andeqs	fp, r0, r0, lsl sl
  1056f0:	0010b870 	andeqs	fp, r0, r0, ror r8

001056f4 <setlocale>:
  1056f4:	e1a02001 	mov	r2, r1
  1056f8:	e59f100c 	ldr	r1, [pc, #12]	; 10570c <prog+0x56c8>
  1056fc:	e1a03000 	mov	r3, r0
  105700:	e5910000 	ldr	r0, [r1]
  105704:	e1a01003 	mov	r1, r3
  105708:	eaffffe0 	b	105690 <_setlocale_r>
  10570c:	00200410 	eoreq	r0, r0, r0, lsl r4

00105710 <__smakebuf>:
  105710:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  105714:	e1d030bc 	ldrh	r3, [r0, #12]
  105718:	e3130002 	tst	r3, #2	; 0x2
  10571c:	12802043 	addne	r2, r0, #67	; 0x43
  105720:	13a03001 	movne	r3, #1	; 0x1
  105724:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  105728:	e1a04000 	mov	r4, r0
  10572c:	15803014 	strne	r3, [r0, #20]
  105730:	15802010 	strne	r2, [r0, #16]
  105734:	15802000 	strne	r2, [r0]
  105738:	1a000025 	bne	1057d4 <__smakebuf+0xc4>
  10573c:	e1d010fe 	ldrsh	r1, [r0, #14]
  105740:	e3510000 	cmp	r1, #0	; 0x0
  105744:	ba000024 	blt	1057dc <__smakebuf+0xcc>
  105748:	e59f5108 	ldr	r5, [pc, #264]	; 105858 <prog+0x5814>
  10574c:	e1a0200d 	mov	r2, sp
  105750:	e5950000 	ldr	r0, [r5]
  105754:	eb000d94 	bl	108dac <_fstat_r>
  105758:	e3500000 	cmp	r0, #0	; 0x0
  10575c:	b1d430bc 	ldrlth	r3, [r4, #12]
  105760:	ba00001e 	blt	1057e0 <__smakebuf+0xd0>
  105764:	e59d3004 	ldr	r3, [sp, #4]
  105768:	e2033a0f 	and	r3, r3, #61440	; 0xf000
  10576c:	e3530a02 	cmp	r3, #8192	; 0x2000
  105770:	13a06000 	movne	r6, #0	; 0x0
  105774:	03a06001 	moveq	r6, #1	; 0x1
  105778:	e3530902 	cmp	r3, #32768	; 0x8000
  10577c:	0a000022 	beq	10580c <__smakebuf+0xfc>
  105780:	e1d430bc 	ldrh	r3, [r4, #12]
  105784:	e3833b02 	orr	r3, r3, #2048	; 0x800
  105788:	e1c430bc 	strh	r3, [r4, #12]
  10578c:	e5950000 	ldr	r0, [r5]
  105790:	e3a01b01 	mov	r1, #1024	; 0x400
  105794:	ebffeaad 	bl	100250 <_malloc_r>
  105798:	e3500000 	cmp	r0, #0	; 0x0
  10579c:	0a000024 	beq	105834 <__smakebuf+0x124>
  1057a0:	e59f30b0 	ldr	r3, [pc, #176]	; 105858 <prog+0x5814>
  1057a4:	e1d420bc 	ldrh	r2, [r4, #12]
  1057a8:	e5931000 	ldr	r1, [r3]
  1057ac:	e59f30a8 	ldr	r3, [pc, #168]	; 10585c <prog+0x5818>
  1057b0:	e3822080 	orr	r2, r2, #128	; 0x80
  1057b4:	e581303c 	str	r3, [r1, #60]
  1057b8:	e3560000 	cmp	r6, #0	; 0x0
  1057bc:	e3a03b01 	mov	r3, #1024	; 0x400
  1057c0:	e1c420bc 	strh	r2, [r4, #12]
  1057c4:	e5840010 	str	r0, [r4, #16]
  1057c8:	e5843014 	str	r3, [r4, #20]
  1057cc:	e5840000 	str	r0, [r4]
  1057d0:	1a000006 	bne	1057f0 <__smakebuf+0xe0>
  1057d4:	e28dd03c 	add	sp, sp, #60	; 0x3c
  1057d8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  1057dc:	e59f5074 	ldr	r5, [pc, #116]	; 105858 <prog+0x5814>
  1057e0:	e3833b02 	orr	r3, r3, #2048	; 0x800
  1057e4:	e3a06000 	mov	r6, #0	; 0x0
  1057e8:	e1c430bc 	strh	r3, [r4, #12]
  1057ec:	eaffffe6 	b	10578c <__smakebuf+0x7c>
  1057f0:	e1d400fe 	ldrsh	r0, [r4, #14]
  1057f4:	eb0005b6 	bl	106ed4 <isatty>
  1057f8:	e3500000 	cmp	r0, #0	; 0x0
  1057fc:	11d430bc 	ldrneh	r3, [r4, #12]
  105800:	13833001 	orrne	r3, r3, #1	; 0x1
  105804:	11c430bc 	strneh	r3, [r4, #12]
  105808:	eafffff1 	b	1057d4 <__smakebuf+0xc4>
  10580c:	e5942028 	ldr	r2, [r4, #40]
  105810:	e59f3048 	ldr	r3, [pc, #72]	; 105860 <prog+0x581c>
  105814:	e1520003 	cmp	r2, r3
  105818:	1affffd8 	bne	105780 <__smakebuf+0x70>
  10581c:	e1d430bc 	ldrh	r3, [r4, #12]
  105820:	e3a02b01 	mov	r2, #1024	; 0x400
  105824:	e3833b01 	orr	r3, r3, #1024	; 0x400
  105828:	e1c430bc 	strh	r3, [r4, #12]
  10582c:	e584204c 	str	r2, [r4, #76]
  105830:	eaffffd5 	b	10578c <__smakebuf+0x7c>
  105834:	e1d430bc 	ldrh	r3, [r4, #12]
  105838:	e2841043 	add	r1, r4, #67	; 0x43
  10583c:	e3833002 	orr	r3, r3, #2	; 0x2
  105840:	e3a02001 	mov	r2, #1	; 0x1
  105844:	e5842014 	str	r2, [r4, #20]
  105848:	e1c430bc 	strh	r3, [r4, #12]
  10584c:	e5841010 	str	r1, [r4, #16]
  105850:	e5841000 	str	r1, [r4]
  105854:	eaffffde 	b	1057d4 <__smakebuf+0xc4>
  105858:	00200410 	eoreq	r0, r0, r0, lsl r4
  10585c:	00104c6c 	andeqs	r4, r0, ip, ror #24
  105860:	00106ccc 	andeqs	r6, r0, ip, asr #25

00105864 <memchr>:
  105864:	e1a0c002 	mov	ip, r2
  105868:	e35c0003 	cmp	ip, #3	; 0x3
  10586c:	e52de004 	str	lr, [sp, #-4]!
  105870:	e1a02000 	mov	r2, r0
  105874:	e20110ff 	and	r1, r1, #255	; 0xff
  105878:	9a000001 	bls	105884 <memchr+0x20>
  10587c:	e2103003 	ands	r3, r0, #3	; 0x3
  105880:	0a00000e 	beq	1058c0 <memchr+0x5c>
  105884:	e25c2001 	subs	r2, ip, #1	; 0x1
  105888:	3a00000a 	bcc	1058b8 <memchr+0x54>
  10588c:	e5d03000 	ldrb	r3, [r0]
  105890:	e1510003 	cmp	r1, r3
  105894:	049df004 	ldreq	pc, [sp], #4
  105898:	e3a0c000 	mov	ip, #0	; 0x0
  10589c:	ea000002 	b	1058ac <memchr+0x48>
  1058a0:	e5f03001 	ldrb	r3, [r0, #1]!
  1058a4:	e1510003 	cmp	r1, r3
  1058a8:	0a00002b 	beq	10595c <memchr+0xf8>
  1058ac:	e152000c 	cmp	r2, ip
  1058b0:	e28cc001 	add	ip, ip, #1	; 0x1
  1058b4:	1afffff9 	bne	1058a0 <memchr+0x3c>
  1058b8:	e3a00000 	mov	r0, #0	; 0x0
  1058bc:	e49df004 	ldr	pc, [sp], #4
  1058c0:	e1a0e003 	mov	lr, r3
  1058c4:	e2833001 	add	r3, r3, #1	; 0x1
  1058c8:	e3530004 	cmp	r3, #4	; 0x4
  1058cc:	e081e40e 	add	lr, r1, lr, lsl #8
  1058d0:	1afffffb 	bne	1058c4 <memchr+0x60>
  1058d4:	e1a00002 	mov	r0, r2
  1058d8:	e5902000 	ldr	r2, [r0]
  1058dc:	e022200e 	eor	r2, r2, lr
  1058e0:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  1058e4:	e2433801 	sub	r3, r3, #65536	; 0x10000
  1058e8:	e2433c01 	sub	r3, r3, #256	; 0x100
  1058ec:	e2433001 	sub	r3, r3, #1	; 0x1
  1058f0:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  1058f4:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  1058f8:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  1058fc:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  105900:	e1d32002 	bics	r2, r3, r2
  105904:	e24cc004 	sub	ip, ip, #4	; 0x4
  105908:	0a00000f 	beq	10594c <memchr+0xe8>
  10590c:	e5d03000 	ldrb	r3, [r0]
  105910:	e1510003 	cmp	r1, r3
  105914:	e1a02000 	mov	r2, r0
  105918:	0a000010 	beq	105960 <memchr+0xfc>
  10591c:	e5d03001 	ldrb	r3, [r0, #1]
  105920:	e1510003 	cmp	r1, r3
  105924:	e2802001 	add	r2, r0, #1	; 0x1
  105928:	0a00000c 	beq	105960 <memchr+0xfc>
  10592c:	e5d03002 	ldrb	r3, [r0, #2]
  105930:	e1510003 	cmp	r1, r3
  105934:	e2802002 	add	r2, r0, #2	; 0x2
  105938:	0a000008 	beq	105960 <memchr+0xfc>
  10593c:	e5d03003 	ldrb	r3, [r0, #3]
  105940:	e1510003 	cmp	r1, r3
  105944:	e2802003 	add	r2, r0, #3	; 0x3
  105948:	0a000004 	beq	105960 <memchr+0xfc>
  10594c:	e35c0003 	cmp	ip, #3	; 0x3
  105950:	e2800004 	add	r0, r0, #4	; 0x4
  105954:	8affffdf 	bhi	1058d8 <memchr+0x74>
  105958:	eaffffc9 	b	105884 <memchr+0x20>
  10595c:	e49df004 	ldr	pc, [sp], #4
  105960:	e1a00002 	mov	r0, r2
  105964:	e49df004 	ldr	pc, [sp], #4

00105968 <memmove>:
  105968:	e1500001 	cmp	r0, r1
  10596c:	e92d4010 	stmdb	sp!, {r4, lr}
  105970:	e1a0c000 	mov	ip, r0
  105974:	e1a04001 	mov	r4, r1
  105978:	e1a0e002 	mov	lr, r2
  10597c:	9a000011 	bls	1059c8 <memmove+0x60>
  105980:	e0813002 	add	r3, r1, r2
  105984:	e1500003 	cmp	r0, r3
  105988:	2a00000e 	bcs	1059c8 <memmove+0x60>
  10598c:	e2522001 	subs	r2, r2, #1	; 0x1
  105990:	38bd8010 	ldmccia	sp!, {r4, pc}
  105994:	e1a01003 	mov	r1, r3
  105998:	e0623003 	rsb	r3, r2, r3
  10599c:	e243c001 	sub	ip, r3, #1	; 0x1
  1059a0:	e080200e 	add	r2, r0, lr
  1059a4:	e5713001 	ldrb	r3, [r1, #-1]!
  1059a8:	e15c0001 	cmp	ip, r1
  1059ac:	e5623001 	strb	r3, [r2, #-1]!
  1059b0:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1059b4:	e5713001 	ldrb	r3, [r1, #-1]!
  1059b8:	e15c0001 	cmp	ip, r1
  1059bc:	e5623001 	strb	r3, [r2, #-1]!
  1059c0:	1afffff7 	bne	1059a4 <memmove+0x3c>
  1059c4:	e8bd8010 	ldmia	sp!, {r4, pc}
  1059c8:	e35e000f 	cmp	lr, #15	; 0xf
  1059cc:	8a000008 	bhi	1059f4 <memmove+0x8c>
  1059d0:	e35e0000 	cmp	lr, #0	; 0x0
  1059d4:	08bd8010 	ldmeqia	sp!, {r4, pc}
  1059d8:	e3a02000 	mov	r2, #0	; 0x0
  1059dc:	e4d13001 	ldrb	r3, [r1], #1
  1059e0:	e7c2300c 	strb	r3, [r2, ip]
  1059e4:	e2822001 	add	r2, r2, #1	; 0x1
  1059e8:	e152000e 	cmp	r2, lr
  1059ec:	1afffffa 	bne	1059dc <memmove+0x74>
  1059f0:	e8bd8010 	ldmia	sp!, {r4, pc}
  1059f4:	e1843000 	orr	r3, r4, r0
  1059f8:	e3130003 	tst	r3, #3	; 0x3
  1059fc:	1afffff3 	bne	1059d0 <memmove+0x68>
  105a00:	e1a01004 	mov	r1, r4
  105a04:	e1a0c000 	mov	ip, r0
  105a08:	e5913000 	ldr	r3, [r1]
  105a0c:	e58c3000 	str	r3, [ip]
  105a10:	e5912004 	ldr	r2, [r1, #4]
  105a14:	e58c2004 	str	r2, [ip, #4]
  105a18:	e5913008 	ldr	r3, [r1, #8]
  105a1c:	e58c3008 	str	r3, [ip, #8]
  105a20:	e24ee010 	sub	lr, lr, #16	; 0x10
  105a24:	e591300c 	ldr	r3, [r1, #12]
  105a28:	e35e000f 	cmp	lr, #15	; 0xf
  105a2c:	e58c300c 	str	r3, [ip, #12]
  105a30:	e2811010 	add	r1, r1, #16	; 0x10
  105a34:	e28cc010 	add	ip, ip, #16	; 0x10
  105a38:	8afffff2 	bhi	105a08 <memmove+0xa0>
  105a3c:	e35e0003 	cmp	lr, #3	; 0x3
  105a40:	9affffe2 	bls	1059d0 <memmove+0x68>
  105a44:	e24ee004 	sub	lr, lr, #4	; 0x4
  105a48:	e4913004 	ldr	r3, [r1], #4
  105a4c:	e35e0003 	cmp	lr, #3	; 0x3
  105a50:	e48c3004 	str	r3, [ip], #4
  105a54:	8afffffa 	bhi	105a44 <memmove+0xdc>
  105a58:	e35e0000 	cmp	lr, #0	; 0x0
  105a5c:	1affffdd 	bne	1059d8 <memmove+0x70>
  105a60:	e8bd8010 	ldmia	sp!, {r4, pc}

00105a64 <_Bfree>:
  105a64:	e251c000 	subs	ip, r1, #0	; 0x0
  105a68:	1590104c 	ldrne	r1, [r0, #76]
  105a6c:	159c2004 	ldrne	r2, [ip, #4]
  105a70:	17913102 	ldrne	r3, [r1, r2, lsl #2]
  105a74:	158c3000 	strne	r3, [ip]
  105a78:	1781c102 	strne	ip, [r1, r2, lsl #2]
  105a7c:	e12fff1e 	bx	lr

00105a80 <_hi0bits>:
  105a80:	e1a03820 	mov	r3, r0, lsr #16
  105a84:	e1a03803 	mov	r3, r3, lsl #16
  105a88:	e3530000 	cmp	r3, #0	; 0x0
  105a8c:	01a00800 	moveq	r0, r0, lsl #16
  105a90:	13a03000 	movne	r3, #0	; 0x0
  105a94:	03a03010 	moveq	r3, #16	; 0x10
  105a98:	e31004ff 	tst	r0, #-16777216	; 0xff000000
  105a9c:	01a00400 	moveq	r0, r0, lsl #8
  105aa0:	02833008 	addeq	r3, r3, #8	; 0x8
  105aa4:	e310020f 	tst	r0, #-268435456	; 0xf0000000
  105aa8:	01a00200 	moveq	r0, r0, lsl #4
  105aac:	02833004 	addeq	r3, r3, #4	; 0x4
  105ab0:	e3100103 	tst	r0, #-1073741824	; 0xc0000000
  105ab4:	01a00100 	moveq	r0, r0, lsl #2
  105ab8:	02833002 	addeq	r3, r3, #2	; 0x2
  105abc:	e3500000 	cmp	r0, #0	; 0x0
  105ac0:	ba000002 	blt	105ad0 <_hi0bits+0x50>
  105ac4:	e3100101 	tst	r0, #1073741824	; 0x40000000
  105ac8:	03a03020 	moveq	r3, #32	; 0x20
  105acc:	12833001 	addne	r3, r3, #1	; 0x1
  105ad0:	e1a00003 	mov	r0, r3
  105ad4:	e12fff1e 	bx	lr

00105ad8 <_lo0bits>:
  105ad8:	e5902000 	ldr	r2, [r0]
  105adc:	e1a01000 	mov	r1, r0
  105ae0:	e2120007 	ands	r0, r2, #7	; 0x7
  105ae4:	0a00000a 	beq	105b14 <_lo0bits+0x3c>
  105ae8:	e3120001 	tst	r2, #1	; 0x1
  105aec:	13a00000 	movne	r0, #0	; 0x0
  105af0:	112fff1e 	bxne	lr
  105af4:	e3120002 	tst	r2, #2	; 0x2
  105af8:	11a030a2 	movne	r3, r2, lsr #1
  105afc:	01a03122 	moveq	r3, r2, lsr #2
  105b00:	13a00001 	movne	r0, #1	; 0x1
  105b04:	03a00002 	moveq	r0, #2	; 0x2
  105b08:	15813000 	strne	r3, [r1]
  105b0c:	05813000 	streq	r3, [r1]
  105b10:	e12fff1e 	bx	lr
  105b14:	e1a03802 	mov	r3, r2, lsl #16
  105b18:	e1a03823 	mov	r3, r3, lsr #16
  105b1c:	e3530000 	cmp	r3, #0	; 0x0
  105b20:	01a02822 	moveq	r2, r2, lsr #16
  105b24:	03a00010 	moveq	r0, #16	; 0x10
  105b28:	e31200ff 	tst	r2, #255	; 0xff
  105b2c:	01a02422 	moveq	r2, r2, lsr #8
  105b30:	02800008 	addeq	r0, r0, #8	; 0x8
  105b34:	e312000f 	tst	r2, #15	; 0xf
  105b38:	01a02222 	moveq	r2, r2, lsr #4
  105b3c:	02800004 	addeq	r0, r0, #4	; 0x4
  105b40:	e3120003 	tst	r2, #3	; 0x3
  105b44:	01a02122 	moveq	r2, r2, lsr #2
  105b48:	02800002 	addeq	r0, r0, #2	; 0x2
  105b4c:	e3120001 	tst	r2, #1	; 0x1
  105b50:	1a000003 	bne	105b64 <_lo0bits+0x8c>
  105b54:	e1b020a2 	movs	r2, r2, lsr #1
  105b58:	03a00020 	moveq	r0, #32	; 0x20
  105b5c:	012fff1e 	bxeq	lr
  105b60:	e2800001 	add	r0, r0, #1	; 0x1
  105b64:	e5812000 	str	r2, [r1]
  105b68:	e12fff1e 	bx	lr

00105b6c <__mcmp>:
  105b6c:	e5903010 	ldr	r3, [r0, #16]
  105b70:	e5912010 	ldr	r2, [r1, #16]
  105b74:	e52de004 	str	lr, [sp, #-4]!
  105b78:	e053e002 	subs	lr, r3, r2
  105b7c:	1a00000c 	bne	105bb4 <__mcmp+0x48>
  105b80:	e1a02102 	mov	r2, r2, lsl #2
  105b84:	e2800014 	add	r0, r0, #20	; 0x14
  105b88:	e2823014 	add	r3, r2, #20	; 0x14
  105b8c:	e0811003 	add	r1, r1, r3
  105b90:	e080c002 	add	ip, r0, r2
  105b94:	e51c2004 	ldr	r2, [ip, #-4]
  105b98:	e5113004 	ldr	r3, [r1, #-4]
  105b9c:	e1520003 	cmp	r2, r3
  105ba0:	e24cc004 	sub	ip, ip, #4	; 0x4
  105ba4:	e2411004 	sub	r1, r1, #4	; 0x4
  105ba8:	1a000003 	bne	105bbc <__mcmp+0x50>
  105bac:	e150000c 	cmp	r0, ip
  105bb0:	3afffff7 	bcc	105b94 <__mcmp+0x28>
  105bb4:	e1a0000e 	mov	r0, lr
  105bb8:	e49df004 	ldr	pc, [sp], #4
  105bbc:	33e0e000 	mvncc	lr, #0	; 0x0
  105bc0:	23a0e001 	movcs	lr, #1	; 0x1
  105bc4:	e1a0000e 	mov	r0, lr
  105bc8:	e49df004 	ldr	pc, [sp], #4

00105bcc <_ulp>:
  105bcc:	e3c00102 	bic	r0, r0, #-2147483648	; 0x80000000
  105bd0:	e1a00a20 	mov	r0, r0, lsr #20
  105bd4:	e1a00a00 	mov	r0, r0, lsl #20
  105bd8:	e240250d 	sub	r2, r0, #54525952	; 0x3400000
  105bdc:	e3520000 	cmp	r2, #0	; 0x0
  105be0:	e2623000 	rsb	r3, r2, #0	; 0x0
  105be4:	e1a0ca43 	mov	ip, r3, asr #20
  105be8:	c1a00002 	movgt	r0, r2
  105bec:	c3a01000 	movgt	r1, #0	; 0x0
  105bf0:	c12fff1e 	bxgt	lr
  105bf4:	e35c0013 	cmp	ip, #19	; 0x13
  105bf8:	e24c3014 	sub	r3, ip, #20	; 0x14
  105bfc:	d3a03702 	movle	r3, #524288	; 0x80000
  105c00:	d1a00c53 	movle	r0, r3, asr ip
  105c04:	d3a01000 	movle	r1, #0	; 0x0
  105c08:	d12fff1e 	bxle	lr
  105c0c:	e353001e 	cmp	r3, #30	; 0x1e
  105c10:	e263201f 	rsb	r2, r3, #31	; 0x1f
  105c14:	e3a03001 	mov	r3, #1	; 0x1
  105c18:	d3a03001 	movle	r3, #1	; 0x1
  105c1c:	d1a03213 	movle	r3, r3, lsl r2
  105c20:	e3a00000 	mov	r0, #0	; 0x0
  105c24:	e1a01003 	mov	r1, r3
  105c28:	e12fff1e 	bx	lr

00105c2c <_b2d>:
  105c2c:	e5903010 	ldr	r3, [r0, #16]
  105c30:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  105c34:	e2806014 	add	r6, r0, #20	; 0x14
  105c38:	e0863103 	add	r3, r6, r3, lsl #2
  105c3c:	e5137004 	ldr	r7, [r3, #-4]
  105c40:	e1a00007 	mov	r0, r7
  105c44:	e1a04001 	mov	r4, r1
  105c48:	e2435004 	sub	r5, r3, #4	; 0x4
  105c4c:	ebffff8b 	bl	105a80 <_hi0bits>
  105c50:	e2603020 	rsb	r3, r0, #32	; 0x20
  105c54:	e350000a 	cmp	r0, #10	; 0xa
  105c58:	e1a02000 	mov	r2, r0
  105c5c:	e5843000 	str	r3, [r4]
  105c60:	ca00000a 	bgt	105c90 <_b2d+0x64>
  105c64:	e1560005 	cmp	r6, r5
  105c68:	35153004 	ldrcc	r3, [r5, #-4]
  105c6c:	e260c00b 	rsb	ip, r0, #11	; 0xb
  105c70:	31a0ec33 	movcc	lr, r3, lsr ip
  105c74:	e1a03c37 	mov	r3, r7, lsr ip
  105c78:	23a0e000 	movcs	lr, #0	; 0x0
  105c7c:	e2822015 	add	r2, r2, #21	; 0x15
  105c80:	e18e1217 	orr	r1, lr, r7, lsl r2
  105c84:	e38305ff 	orr	r0, r3, #1069547520	; 0x3fc00000
  105c88:	e3800603 	orr	r0, r0, #3145728	; 0x300000
  105c8c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  105c90:	e1560005 	cmp	r6, r5
  105c94:	23a0e000 	movcs	lr, #0	; 0x0
  105c98:	3535e004 	ldrcc	lr, [r5, #-4]!
  105c9c:	e250200b 	subs	r2, r0, #11	; 0xb
  105ca0:	1a000003 	bne	105cb4 <_b2d+0x88>
  105ca4:	e38705ff 	orr	r0, r7, #1069547520	; 0x3fc00000
  105ca8:	e3800603 	orr	r0, r0, #3145728	; 0x300000
  105cac:	e1a0100e 	mov	r1, lr
  105cb0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  105cb4:	e1550006 	cmp	r5, r6
  105cb8:	85153004 	ldrhi	r3, [r5, #-4]
  105cbc:	e262c020 	rsb	ip, r2, #32	; 0x20
  105cc0:	81a04c33 	movhi	r4, r3, lsr ip
  105cc4:	e1a03217 	mov	r3, r7, lsl r2
  105cc8:	e38335ff 	orr	r3, r3, #1069547520	; 0x3fc00000
  105ccc:	93a04000 	movls	r4, #0	; 0x0
  105cd0:	e3833603 	orr	r3, r3, #3145728	; 0x300000
  105cd4:	e1830c3e 	orr	r0, r3, lr, lsr ip
  105cd8:	e184121e 	orr	r1, r4, lr, lsl r2
  105cdc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00105ce0 <_ratio>:
  105ce0:	e92d43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
  105ce4:	e24dd008 	sub	sp, sp, #8	; 0x8
  105ce8:	e1a04001 	mov	r4, r1
  105cec:	e28d1004 	add	r1, sp, #4	; 0x4
  105cf0:	e1a05000 	mov	r5, r0
  105cf4:	ebffffcc 	bl	105c2c <_b2d>
  105cf8:	e1a06000 	mov	r6, r0
  105cfc:	e1a07001 	mov	r7, r1
  105d00:	e1a00004 	mov	r0, r4
  105d04:	e1a0100d 	mov	r1, sp
  105d08:	ebffffc7 	bl	105c2c <_b2d>
  105d0c:	e5942010 	ldr	r2, [r4, #16]
  105d10:	e1a09001 	mov	r9, r1
  105d14:	e5951010 	ldr	r1, [r5, #16]
  105d18:	e59d3004 	ldr	r3, [sp, #4]
  105d1c:	e0621001 	rsb	r1, r2, r1
  105d20:	e59d2000 	ldr	r2, [sp]
  105d24:	e0623003 	rsb	r3, r2, r3
  105d28:	e0833281 	add	r3, r3, r1, lsl #5
  105d2c:	e1a08000 	mov	r8, r0
  105d30:	e3530000 	cmp	r3, #0	; 0x0
  105d34:	c0866a03 	addgt	r6, r6, r3, lsl #20
  105d38:	d0488a03 	suble	r8, r8, r3, lsl #20
  105d3c:	e1a00006 	mov	r0, r6
  105d40:	e1a01007 	mov	r1, r7
  105d44:	e1a02008 	mov	r2, r8
  105d48:	e1a03009 	mov	r3, r9
  105d4c:	eb000886 	bl	107f6c <__divdf3>
  105d50:	e28dd008 	add	sp, sp, #8	; 0x8
  105d54:	e8bd83f0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, pc}

00105d58 <_mprec_log10>:
  105d58:	e3500017 	cmp	r0, #23	; 0x17
  105d5c:	e92d4010 	stmdb	sp!, {r4, lr}
  105d60:	e1a04000 	mov	r4, r0
  105d64:	c3a005ff 	movgt	r0, #1069547520	; 0x3fc00000
  105d68:	c2800603 	addgt	r0, r0, #3145728	; 0x300000
  105d6c:	c3a01000 	movgt	r1, #0	; 0x0
  105d70:	ca000003 	bgt	105d84 <_mprec_log10+0x2c>
  105d74:	e59f3024 	ldr	r3, [pc, #36]	; 105da0 <prog+0x5d5c>
  105d78:	e0833184 	add	r3, r3, r4, lsl #3
  105d7c:	e8930003 	ldmia	r3, {r0, r1}
  105d80:	e8bd8010 	ldmia	sp!, {r4, pc}
  105d84:	e3a02101 	mov	r2, #1073741824	; 0x40000000
  105d88:	e2822709 	add	r2, r2, #2359296	; 0x240000
  105d8c:	e3a03000 	mov	r3, #0	; 0x0
  105d90:	eb000791 	bl	107bdc <__muldf3>
  105d94:	e2544001 	subs	r4, r4, #1	; 0x1
  105d98:	1afffff9 	bne	105d84 <_mprec_log10+0x2c>
  105d9c:	e8bd8010 	ldmia	sp!, {r4, pc}
  105da0:	0010b704 	andeqs	fp, r0, r4, lsl #14

00105da4 <_Balloc>:
  105da4:	e590c04c 	ldr	ip, [r0, #76]
  105da8:	e35c0000 	cmp	ip, #0	; 0x0
  105dac:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  105db0:	e3a02010 	mov	r2, #16	; 0x10
  105db4:	e1a06001 	mov	r6, r1
  105db8:	e1a04000 	mov	r4, r0
  105dbc:	e3a01004 	mov	r1, #4	; 0x4
  105dc0:	0a00000c 	beq	105df8 <_Balloc+0x54>
  105dc4:	e79c5106 	ldr	r5, [ip, r6, lsl #2]
  105dc8:	e3550000 	cmp	r5, #0	; 0x0
  105dcc:	15953000 	ldrne	r3, [r5]
  105dd0:	e3a02001 	mov	r2, #1	; 0x1
  105dd4:	e1a00004 	mov	r0, r4
  105dd8:	e1a01002 	mov	r1, r2
  105ddc:	178c3106 	strne	r3, [ip, r6, lsl #2]
  105de0:	0a00000b 	beq	105e14 <_Balloc+0x70>
  105de4:	e3a03000 	mov	r3, #0	; 0x0
  105de8:	e585300c 	str	r3, [r5, #12]
  105dec:	e5853010 	str	r3, [r5, #16]
  105df0:	e1a00005 	mov	r0, r5
  105df4:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  105df8:	eb0005e4 	bl	107590 <_calloc_r>
  105dfc:	e3500000 	cmp	r0, #0	; 0x0
  105e00:	e1a0c000 	mov	ip, r0
  105e04:	e1a05000 	mov	r5, r0
  105e08:	e584004c 	str	r0, [r4, #76]
  105e0c:	1affffec 	bne	105dc4 <_Balloc+0x20>
  105e10:	eafffff6 	b	105df0 <_Balloc+0x4c>
  105e14:	e1a04612 	mov	r4, r2, lsl r6
  105e18:	e1a02104 	mov	r2, r4, lsl #2
  105e1c:	e2822014 	add	r2, r2, #20	; 0x14
  105e20:	eb0005da 	bl	107590 <_calloc_r>
  105e24:	e3500000 	cmp	r0, #0	; 0x0
  105e28:	0afffff0 	beq	105df0 <_Balloc+0x4c>
  105e2c:	e1a05000 	mov	r5, r0
  105e30:	e5806004 	str	r6, [r0, #4]
  105e34:	e5804008 	str	r4, [r0, #8]
  105e38:	eaffffe9 	b	105de4 <_Balloc+0x40>

00105e3c <_d2b>:
  105e3c:	e92d47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
  105e40:	e1a04001 	mov	r4, r1
  105e44:	e24dd008 	sub	sp, sp, #8	; 0x8
  105e48:	e3a01001 	mov	r1, #1	; 0x1
  105e4c:	e1a05002 	mov	r5, r2
  105e50:	e1a0a003 	mov	sl, r3
  105e54:	e59d9028 	ldr	r9, [sp, #40]
  105e58:	ebffffd1 	bl	105da4 <_Balloc>
  105e5c:	e3c42102 	bic	r2, r4, #-2147483648	; 0x80000000
  105e60:	e3c434ff 	bic	r3, r4, #-16777216	; 0xff000000
  105e64:	e3c3360f 	bic	r3, r3, #15728640	; 0xf00000
  105e68:	e1b07a22 	movs	r7, r2, lsr #20
  105e6c:	e58d3000 	str	r3, [sp]
  105e70:	13833601 	orrne	r3, r3, #1048576	; 0x100000
  105e74:	158d3000 	strne	r3, [sp]
  105e78:	e3550000 	cmp	r5, #0	; 0x0
  105e7c:	e1a06000 	mov	r6, r0
  105e80:	e2808014 	add	r8, r0, #20	; 0x14
  105e84:	0a000022 	beq	105f14 <_d2b+0xd8>
  105e88:	e28d0008 	add	r0, sp, #8	; 0x8
  105e8c:	e5205004 	str	r5, [r0, #-4]!
  105e90:	ebffff10 	bl	105ad8 <_lo0bits>
  105e94:	e3500000 	cmp	r0, #0	; 0x0
  105e98:	0a000030 	beq	105f60 <_d2b+0x124>
  105e9c:	e89d000c 	ldmia	sp, {r2, r3}
  105ea0:	e2601020 	rsb	r1, r0, #32	; 0x20
  105ea4:	e1833112 	orr	r3, r3, r2, lsl r1
  105ea8:	e5863014 	str	r3, [r6, #20]
  105eac:	e59d3000 	ldr	r3, [sp]
  105eb0:	e1a03033 	mov	r3, r3, lsr r0
  105eb4:	e58d3000 	str	r3, [sp]
  105eb8:	e3530000 	cmp	r3, #0	; 0x0
  105ebc:	03a04001 	moveq	r4, #1	; 0x1
  105ec0:	13a04002 	movne	r4, #2	; 0x2
  105ec4:	e3570000 	cmp	r7, #0	; 0x0
  105ec8:	e5883004 	str	r3, [r8, #4]
  105ecc:	10803007 	addne	r3, r0, r7
  105ed0:	12433e43 	subne	r3, r3, #1072	; 0x430
  105ed4:	12433003 	subne	r3, r3, #3	; 0x3
  105ed8:	12602035 	rsbne	r2, r0, #53	; 0x35
  105edc:	e5864010 	str	r4, [r6, #16]
  105ee0:	158a3000 	strne	r3, [sl]
  105ee4:	15892000 	strne	r2, [r9]
  105ee8:	1a000019 	bne	105f54 <_d2b+0x118>
  105eec:	e2403e43 	sub	r3, r0, #1072	; 0x430
  105ef0:	e0882104 	add	r2, r8, r4, lsl #2
  105ef4:	e2433002 	sub	r3, r3, #2	; 0x2
  105ef8:	e58a3000 	str	r3, [sl]
  105efc:	e5120004 	ldr	r0, [r2, #-4]
  105f00:	ebfffede 	bl	105a80 <_hi0bits>
  105f04:	e1a04284 	mov	r4, r4, lsl #5
  105f08:	e0604004 	rsb	r4, r0, r4
  105f0c:	e5894000 	str	r4, [r9]
  105f10:	ea00000f 	b	105f54 <_d2b+0x118>
  105f14:	e1a0000d 	mov	r0, sp
  105f18:	ebfffeee 	bl	105ad8 <_lo0bits>
  105f1c:	e59d3000 	ldr	r3, [sp]
  105f20:	e3570000 	cmp	r7, #0	; 0x0
  105f24:	e2800020 	add	r0, r0, #32	; 0x20
  105f28:	e5863014 	str	r3, [r6, #20]
  105f2c:	10803007 	addne	r3, r0, r7
  105f30:	e3a02001 	mov	r2, #1	; 0x1
  105f34:	12433e43 	subne	r3, r3, #1072	; 0x430
  105f38:	e5862010 	str	r2, [r6, #16]
  105f3c:	e1a04002 	mov	r4, r2
  105f40:	12433003 	subne	r3, r3, #3	; 0x3
  105f44:	12602035 	rsbne	r2, r0, #53	; 0x35
  105f48:	158a3000 	strne	r3, [sl]
  105f4c:	15892000 	strne	r2, [r9]
  105f50:	0affffe5 	beq	105eec <_d2b+0xb0>
  105f54:	e1a00006 	mov	r0, r6
  105f58:	e28dd008 	add	sp, sp, #8	; 0x8
  105f5c:	e8bd87f0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
  105f60:	e59d3004 	ldr	r3, [sp, #4]
  105f64:	e5863014 	str	r3, [r6, #20]
  105f68:	e59d3000 	ldr	r3, [sp]
  105f6c:	eaffffd1 	b	105eb8 <_d2b+0x7c>

00105f70 <__mdiff>:
  105f70:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  105f74:	e1a04001 	mov	r4, r1
  105f78:	e1a07000 	mov	r7, r0
  105f7c:	e1a01002 	mov	r1, r2
  105f80:	e1a00004 	mov	r0, r4
  105f84:	e1a05002 	mov	r5, r2
  105f88:	ebfffef7 	bl	105b6c <__mcmp>
  105f8c:	e2506000 	subs	r6, r0, #0	; 0x0
  105f90:	0a00003a 	beq	106080 <__mdiff+0x110>
  105f94:	b1a03005 	movlt	r3, r5
  105f98:	b1a05004 	movlt	r5, r4
  105f9c:	b1a04003 	movlt	r4, r3
  105fa0:	e1a00007 	mov	r0, r7
  105fa4:	e5941004 	ldr	r1, [r4, #4]
  105fa8:	b3a0a001 	movlt	sl, #1	; 0x1
  105fac:	a3a0a000 	movge	sl, #0	; 0x0
  105fb0:	ebffff7b 	bl	105da4 <_Balloc>
  105fb4:	e5953010 	ldr	r3, [r5, #16]
  105fb8:	e5946010 	ldr	r6, [r4, #16]
  105fbc:	e284e014 	add	lr, r4, #20	; 0x14
  105fc0:	e2854014 	add	r4, r5, #20	; 0x14
  105fc4:	e580a00c 	str	sl, [r0, #12]
  105fc8:	e1a08000 	mov	r8, r0
  105fcc:	e0847103 	add	r7, r4, r3, lsl #2
  105fd0:	e08ea106 	add	sl, lr, r6, lsl #2
  105fd4:	e280c014 	add	ip, r0, #20	; 0x14
  105fd8:	e3a05000 	mov	r5, #0	; 0x0
  105fdc:	e4942004 	ldr	r2, [r4], #4
  105fe0:	e49e0004 	ldr	r0, [lr], #4
  105fe4:	e1a01802 	mov	r1, r2, lsl #16
  105fe8:	e1a03800 	mov	r3, r0, lsl #16
  105fec:	e1a03823 	mov	r3, r3, lsr #16
  105ff0:	e1a01821 	mov	r1, r1, lsr #16
  105ff4:	e0613003 	rsb	r3, r1, r3
  105ff8:	e1a02822 	mov	r2, r2, lsr #16
  105ffc:	e0833005 	add	r3, r3, r5
  106000:	e0622820 	rsb	r2, r2, r0, lsr #16
  106004:	e0822843 	add	r2, r2, r3, asr #16
  106008:	e1570004 	cmp	r7, r4
  10600c:	e1cc20b2 	strh	r2, [ip, #2]
  106010:	e1a05842 	mov	r5, r2, asr #16
  106014:	e0cc30b4 	strh	r3, [ip], #4
  106018:	8affffef 	bhi	105fdc <__mdiff+0x6c>
  10601c:	e15a000e 	cmp	sl, lr
  106020:	9a00000a 	bls	106050 <__mdiff+0xe0>
  106024:	e49e3004 	ldr	r3, [lr], #4
  106028:	e1a02803 	mov	r2, r3, lsl #16
  10602c:	e1a02822 	mov	r2, r2, lsr #16
  106030:	e0822005 	add	r2, r2, r5
  106034:	e1a01842 	mov	r1, r2, asr #16
  106038:	e0811823 	add	r1, r1, r3, lsr #16
  10603c:	e15a000e 	cmp	sl, lr
  106040:	e1cc10b2 	strh	r1, [ip, #2]
  106044:	e1a05841 	mov	r5, r1, asr #16
  106048:	e0cc20b4 	strh	r2, [ip], #4
  10604c:	8afffff4 	bhi	106024 <__mdiff+0xb4>
  106050:	e51c3004 	ldr	r3, [ip, #-4]
  106054:	e3530000 	cmp	r3, #0	; 0x0
  106058:	1a000005 	bne	106074 <__mdiff+0x104>
  10605c:	e1a0200c 	mov	r2, ip
  106060:	e5123008 	ldr	r3, [r2, #-8]
  106064:	e3530000 	cmp	r3, #0	; 0x0
  106068:	e2466001 	sub	r6, r6, #1	; 0x1
  10606c:	e2422004 	sub	r2, r2, #4	; 0x4
  106070:	0afffffa 	beq	106060 <__mdiff+0xf0>
  106074:	e1a00008 	mov	r0, r8
  106078:	e5886010 	str	r6, [r8, #16]
  10607c:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  106080:	e1a00007 	mov	r0, r7
  106084:	e1a01006 	mov	r1, r6
  106088:	ebffff45 	bl	105da4 <_Balloc>
  10608c:	e3a03001 	mov	r3, #1	; 0x1
  106090:	e1a08000 	mov	r8, r0
  106094:	e5803010 	str	r3, [r0, #16]
  106098:	e5806014 	str	r6, [r0, #20]
  10609c:	e1a00008 	mov	r0, r8
  1060a0:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}

001060a4 <_lshift>:
  1060a4:	e5913010 	ldr	r3, [r1, #16]
  1060a8:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  1060ac:	e2833001 	add	r3, r3, #1	; 0x1
  1060b0:	e1a042c2 	mov	r4, r2, asr #5
  1060b4:	e1a06002 	mov	r6, r2
  1060b8:	e5912008 	ldr	r2, [r1, #8]
  1060bc:	e0845003 	add	r5, r4, r3
  1060c0:	e1550002 	cmp	r5, r2
  1060c4:	e1a07001 	mov	r7, r1
  1060c8:	e1a0a000 	mov	sl, r0
  1060cc:	e5911004 	ldr	r1, [r1, #4]
  1060d0:	da000003 	ble	1060e4 <_lshift+0x40>
  1060d4:	e1a02082 	mov	r2, r2, lsl #1
  1060d8:	e1550002 	cmp	r5, r2
  1060dc:	e2811001 	add	r1, r1, #1	; 0x1
  1060e0:	cafffffb 	bgt	1060d4 <_lshift+0x30>
  1060e4:	e1a0000a 	mov	r0, sl
  1060e8:	ebffff2d 	bl	105da4 <_Balloc>
  1060ec:	e3540000 	cmp	r4, #0	; 0x0
  1060f0:	e1a08000 	mov	r8, r0
  1060f4:	e2800014 	add	r0, r0, #20	; 0x14
  1060f8:	da000005 	ble	106114 <_lshift+0x70>
  1060fc:	e3a03000 	mov	r3, #0	; 0x0
  106100:	e1a02003 	mov	r2, r3
  106104:	e2833001 	add	r3, r3, #1	; 0x1
  106108:	e1540003 	cmp	r4, r3
  10610c:	e4802004 	str	r2, [r0], #4
  106110:	1afffffb 	bne	106104 <_lshift+0x60>
  106114:	e5973010 	ldr	r3, [r7, #16]
  106118:	e2871014 	add	r1, r7, #20	; 0x14
  10611c:	e216401f 	ands	r4, r6, #31	; 0x1f
  106120:	e081c103 	add	ip, r1, r3, lsl #2
  106124:	0a000012 	beq	106174 <_lshift+0xd0>
  106128:	e264e020 	rsb	lr, r4, #32	; 0x20
  10612c:	e3a02000 	mov	r2, #0	; 0x0
  106130:	e5913000 	ldr	r3, [r1]
  106134:	e1823413 	orr	r3, r2, r3, lsl r4
  106138:	e4803004 	str	r3, [r0], #4
  10613c:	e4912004 	ldr	r2, [r1], #4
  106140:	e15c0001 	cmp	ip, r1
  106144:	e1a02e32 	mov	r2, r2, lsr lr
  106148:	8afffff8 	bhi	106130 <_lshift+0x8c>
  10614c:	e3520000 	cmp	r2, #0	; 0x0
  106150:	e5802000 	str	r2, [r0]
  106154:	12855001 	addne	r5, r5, #1	; 0x1
  106158:	e2453001 	sub	r3, r5, #1	; 0x1
  10615c:	e1a0000a 	mov	r0, sl
  106160:	e5883010 	str	r3, [r8, #16]
  106164:	e1a01007 	mov	r1, r7
  106168:	ebfffe3d 	bl	105a64 <_Bfree>
  10616c:	e1a00008 	mov	r0, r8
  106170:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  106174:	e4913004 	ldr	r3, [r1], #4
  106178:	e15c0001 	cmp	ip, r1
  10617c:	e4803004 	str	r3, [r0], #4
  106180:	9afffff4 	bls	106158 <_lshift+0xb4>
  106184:	e4913004 	ldr	r3, [r1], #4
  106188:	e15c0001 	cmp	ip, r1
  10618c:	e4803004 	str	r3, [r0], #4
  106190:	8afffff7 	bhi	106174 <_lshift+0xd0>
  106194:	eaffffef 	b	106158 <_lshift+0xb4>

00106198 <_multiply>:
  106198:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10619c:	e5918010 	ldr	r8, [r1, #16]
  1061a0:	e5925010 	ldr	r5, [r2, #16]
  1061a4:	e1580005 	cmp	r8, r5
  1061a8:	b1a03002 	movlt	r3, r2
  1061ac:	e1a06002 	mov	r6, r2
  1061b0:	b1a06001 	movlt	r6, r1
  1061b4:	e1a04001 	mov	r4, r1
  1061b8:	b1a08005 	movlt	r8, r5
  1061bc:	b1a04003 	movlt	r4, r3
  1061c0:	b5965010 	ldrlt	r5, [r6, #16]
  1061c4:	e994000a 	ldmib	r4, {r1, r3}
  1061c8:	e0889005 	add	r9, r8, r5
  1061cc:	e1590003 	cmp	r9, r3
  1061d0:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1061d4:	c2811001 	addgt	r1, r1, #1	; 0x1
  1061d8:	ebfffef1 	bl	105da4 <_Balloc>
  1061dc:	e2801014 	add	r1, r0, #20	; 0x14
  1061e0:	e58d0000 	str	r0, [sp]
  1061e4:	e0810109 	add	r0, r1, r9, lsl #2
  1061e8:	e1510000 	cmp	r1, r0
  1061ec:	e58d0004 	str	r0, [sp, #4]
  1061f0:	2a000005 	bcs	10620c <_multiply+0x74>
  1061f4:	e1a03001 	mov	r3, r1
  1061f8:	e3a02000 	mov	r2, #0	; 0x0
  1061fc:	e4832004 	str	r2, [r3], #4
  106200:	e59d0004 	ldr	r0, [sp, #4]
  106204:	e1500003 	cmp	r0, r3
  106208:	8afffffb 	bhi	1061fc <_multiply+0x64>
  10620c:	e2867014 	add	r7, r6, #20	; 0x14
  106210:	e0875105 	add	r5, r7, r5, lsl #2
  106214:	e284b014 	add	fp, r4, #20	; 0x14
  106218:	e1570005 	cmp	r7, r5
  10621c:	e58d5008 	str	r5, [sp, #8]
  106220:	e08b8108 	add	r8, fp, r8, lsl #2
  106224:	2a000038 	bcs	10630c <_multiply+0x174>
  106228:	e1a0a001 	mov	sl, r1
  10622c:	e5973000 	ldr	r3, [r7]
  106230:	e1a06803 	mov	r6, r3, lsl #16
  106234:	e1a06826 	mov	r6, r6, lsr #16
  106238:	e3560000 	cmp	r6, #0	; 0x0
  10623c:	0a000015 	beq	106298 <_multiply+0x100>
  106240:	e1a0500b 	mov	r5, fp
  106244:	e1a0400a 	mov	r4, sl
  106248:	e3a03000 	mov	r3, #0	; 0x0
  10624c:	e594c000 	ldr	ip, [r4]
  106250:	e4950004 	ldr	r0, [r5], #4
  106254:	e1a0280c 	mov	r2, ip, lsl #16
  106258:	e1a01800 	mov	r1, r0, lsl #16
  10625c:	e1a02822 	mov	r2, r2, lsr #16
  106260:	e0832002 	add	r2, r3, r2
  106264:	e1a01821 	mov	r1, r1, lsr #16
  106268:	e1a00820 	mov	r0, r0, lsr #16
  10626c:	e1a0c82c 	mov	ip, ip, lsr #16
  106270:	e02e2691 	mla	lr, r1, r6, r2
  106274:	e023c690 	mla	r3, r0, r6, ip
  106278:	e1580005 	cmp	r8, r5
  10627c:	e083382e 	add	r3, r3, lr, lsr #16
  106280:	e1c430b2 	strh	r3, [r4, #2]
  106284:	e0c4e0b4 	strh	lr, [r4], #4
  106288:	e1a03823 	mov	r3, r3, lsr #16
  10628c:	8affffee 	bhi	10624c <_multiply+0xb4>
  106290:	e5843000 	str	r3, [r4]
  106294:	e5973000 	ldr	r3, [r7]
  106298:	e1b05823 	movs	r5, r3, lsr #16
  10629c:	0a000015 	beq	1062f8 <_multiply+0x160>
  1062a0:	e59ae000 	ldr	lr, [sl]
  1062a4:	e1a0c00a 	mov	ip, sl
  1062a8:	e1a0400b 	mov	r4, fp
  1062ac:	e3a00000 	mov	r0, #0	; 0x0
  1062b0:	e4941004 	ldr	r1, [r4], #4
  1062b4:	e59c2000 	ldr	r2, [ip]
  1062b8:	e1a03801 	mov	r3, r1, lsl #16
  1062bc:	e0802822 	add	r2, r0, r2, lsr #16
  1062c0:	e1a03823 	mov	r3, r3, lsr #16
  1062c4:	e0202593 	mla	r0, r3, r5, r2
  1062c8:	e1cce0b0 	strh	lr, [ip]
  1062cc:	e1cc00b2 	strh	r0, [ip, #2]
  1062d0:	e5bc3004 	ldr	r3, [ip, #4]!
  1062d4:	e1a03803 	mov	r3, r3, lsl #16
  1062d8:	e1a01821 	mov	r1, r1, lsr #16
  1062dc:	e1a03823 	mov	r3, r3, lsr #16
  1062e0:	e0223591 	mla	r2, r1, r5, r3
  1062e4:	e1580004 	cmp	r8, r4
  1062e8:	e082e820 	add	lr, r2, r0, lsr #16
  1062ec:	e1a0082e 	mov	r0, lr, lsr #16
  1062f0:	8affffee 	bhi	1062b0 <_multiply+0x118>
  1062f4:	e58ce000 	str	lr, [ip]
  1062f8:	e59d2008 	ldr	r2, [sp, #8]
  1062fc:	e2877004 	add	r7, r7, #4	; 0x4
  106300:	e1520007 	cmp	r2, r7
  106304:	828aa004 	addhi	sl, sl, #4	; 0x4
  106308:	8affffc7 	bhi	10622c <_multiply+0x94>
  10630c:	e3590000 	cmp	r9, #0	; 0x0
  106310:	da00000b 	ble	106344 <_multiply+0x1ac>
  106314:	e59d0004 	ldr	r0, [sp, #4]
  106318:	e5103004 	ldr	r3, [r0, #-4]
  10631c:	e3530000 	cmp	r3, #0	; 0x0
  106320:	1a000007 	bne	106344 <_multiply+0x1ac>
  106324:	e1a02000 	mov	r2, r0
  106328:	ea000003 	b	10633c <_multiply+0x1a4>
  10632c:	e5123008 	ldr	r3, [r2, #-8]
  106330:	e3530000 	cmp	r3, #0	; 0x0
  106334:	e2422004 	sub	r2, r2, #4	; 0x4
  106338:	1a000001 	bne	106344 <_multiply+0x1ac>
  10633c:	e2599001 	subs	r9, r9, #1	; 0x1
  106340:	1afffff9 	bne	10632c <_multiply+0x194>
  106344:	e59d2000 	ldr	r2, [sp]
  106348:	e1a00002 	mov	r0, r2
  10634c:	e5829010 	str	r9, [r2, #16]
  106350:	e28dd00c 	add	sp, sp, #12	; 0xc
  106354:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

00106358 <_i2b>:
  106358:	e92d4010 	stmdb	sp!, {r4, lr}
  10635c:	e1a04001 	mov	r4, r1
  106360:	e3a01001 	mov	r1, #1	; 0x1
  106364:	ebfffe8e 	bl	105da4 <_Balloc>
  106368:	e3a03001 	mov	r3, #1	; 0x1
  10636c:	e5803010 	str	r3, [r0, #16]
  106370:	e5804014 	str	r4, [r0, #20]
  106374:	e8bd8010 	ldmia	sp!, {r4, pc}

00106378 <_multadd>:
  106378:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10637c:	e5916010 	ldr	r6, [r1, #16]
  106380:	e1a07001 	mov	r7, r1
  106384:	e1a08000 	mov	r8, r0
  106388:	e1a04002 	mov	r4, r2
  10638c:	e1a05003 	mov	r5, r3
  106390:	e281c014 	add	ip, r1, #20	; 0x14
  106394:	e3a0e000 	mov	lr, #0	; 0x0
  106398:	e59c1000 	ldr	r1, [ip]
  10639c:	e1a03801 	mov	r3, r1, lsl #16
  1063a0:	e1a03823 	mov	r3, r3, lsr #16
  1063a4:	e0225394 	mla	r2, r4, r3, r5
  1063a8:	e1a01821 	mov	r1, r1, lsr #16
  1063ac:	e1a03822 	mov	r3, r2, lsr #16
  1063b0:	e0203194 	mla	r0, r4, r1, r3
  1063b4:	e1a02802 	mov	r2, r2, lsl #16
  1063b8:	e1a02822 	mov	r2, r2, lsr #16
  1063bc:	e28ee001 	add	lr, lr, #1	; 0x1
  1063c0:	e0822800 	add	r2, r2, r0, lsl #16
  1063c4:	e156000e 	cmp	r6, lr
  1063c8:	e48c2004 	str	r2, [ip], #4
  1063cc:	e1a05820 	mov	r5, r0, lsr #16
  1063d0:	cafffff0 	bgt	106398 <_multadd+0x20>
  1063d4:	e3550000 	cmp	r5, #0	; 0x0
  1063d8:	0a000006 	beq	1063f8 <_multadd+0x80>
  1063dc:	e5973008 	ldr	r3, [r7, #8]
  1063e0:	e1560003 	cmp	r6, r3
  1063e4:	aa000005 	bge	106400 <_multadd+0x88>
  1063e8:	e2862001 	add	r2, r6, #1	; 0x1
  1063ec:	e0873106 	add	r3, r7, r6, lsl #2
  1063f0:	e5835014 	str	r5, [r3, #20]
  1063f4:	e5872010 	str	r2, [r7, #16]
  1063f8:	e1a00007 	mov	r0, r7
  1063fc:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  106400:	e5971004 	ldr	r1, [r7, #4]
  106404:	e1a00008 	mov	r0, r8
  106408:	e2811001 	add	r1, r1, #1	; 0x1
  10640c:	ebfffe64 	bl	105da4 <_Balloc>
  106410:	e5972010 	ldr	r2, [r7, #16]
  106414:	e1a02102 	mov	r2, r2, lsl #2
  106418:	e287100c 	add	r1, r7, #12	; 0xc
  10641c:	e1a04000 	mov	r4, r0
  106420:	e2822008 	add	r2, r2, #8	; 0x8
  106424:	e280000c 	add	r0, r0, #12	; 0xc
  106428:	ebffe964 	bl	1009c0 <memcpy>
  10642c:	e1a01007 	mov	r1, r7
  106430:	e1a00008 	mov	r0, r8
  106434:	ebfffd8a 	bl	105a64 <_Bfree>
  106438:	e1a07004 	mov	r7, r4
  10643c:	eaffffe9 	b	1063e8 <_multadd+0x70>

00106440 <_pow5mult>:
  106440:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  106444:	e1a04002 	mov	r4, r2
  106448:	e2122003 	ands	r2, r2, #3	; 0x3
  10644c:	e1a07000 	mov	r7, r0
  106450:	e1a08001 	mov	r8, r1
  106454:	1a000025 	bne	1064f0 <_pow5mult+0xb0>
  106458:	e1b06144 	movs	r6, r4, asr #2
  10645c:	0a00001c 	beq	1064d4 <_pow5mult+0x94>
  106460:	e5975048 	ldr	r5, [r7, #72]
  106464:	e3550000 	cmp	r5, #0	; 0x0
  106468:	1a000009 	bne	106494 <_pow5mult+0x54>
  10646c:	ea000026 	b	10650c <_pow5mult+0xcc>
  106470:	e1b060c6 	movs	r6, r6, asr #1
  106474:	e1a01005 	mov	r1, r5
  106478:	e1a02005 	mov	r2, r5
  10647c:	e1a00007 	mov	r0, r7
  106480:	0a000013 	beq	1064d4 <_pow5mult+0x94>
  106484:	e5954000 	ldr	r4, [r5]
  106488:	e3540000 	cmp	r4, #0	; 0x0
  10648c:	0a000012 	beq	1064dc <_pow5mult+0x9c>
  106490:	e1a05004 	mov	r5, r4
  106494:	e3160001 	tst	r6, #1	; 0x1
  106498:	e1a02005 	mov	r2, r5
  10649c:	e1a00007 	mov	r0, r7
  1064a0:	e1a01008 	mov	r1, r8
  1064a4:	0afffff1 	beq	106470 <_pow5mult+0x30>
  1064a8:	ebffff3a 	bl	106198 <_multiply>
  1064ac:	e1a01008 	mov	r1, r8
  1064b0:	e1a04000 	mov	r4, r0
  1064b4:	e1a00007 	mov	r0, r7
  1064b8:	ebfffd69 	bl	105a64 <_Bfree>
  1064bc:	e1b060c6 	movs	r6, r6, asr #1
  1064c0:	e1a08004 	mov	r8, r4
  1064c4:	e1a01005 	mov	r1, r5
  1064c8:	e1a02005 	mov	r2, r5
  1064cc:	e1a00007 	mov	r0, r7
  1064d0:	1affffeb 	bne	106484 <_pow5mult+0x44>
  1064d4:	e1a00008 	mov	r0, r8
  1064d8:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1064dc:	ebffff2d 	bl	106198 <_multiply>
  1064e0:	e5850000 	str	r0, [r5]
  1064e4:	e1a05000 	mov	r5, r0
  1064e8:	e5804000 	str	r4, [r0]
  1064ec:	eaffffe8 	b	106494 <_pow5mult+0x54>
  1064f0:	e59f3038 	ldr	r3, [pc, #56]	; 106530 <prog+0x64ec>
  1064f4:	e0833102 	add	r3, r3, r2, lsl #2
  1064f8:	e5132004 	ldr	r2, [r3, #-4]
  1064fc:	e3a03000 	mov	r3, #0	; 0x0
  106500:	ebffff9c 	bl	106378 <_multadd>
  106504:	e1a08000 	mov	r8, r0
  106508:	eaffffd2 	b	106458 <_pow5mult+0x18>
  10650c:	e3a01e27 	mov	r1, #624	; 0x270
  106510:	e2811001 	add	r1, r1, #1	; 0x1
  106514:	e1a00007 	mov	r0, r7
  106518:	ebffff8e 	bl	106358 <_i2b>
  10651c:	e3a03000 	mov	r3, #0	; 0x0
  106520:	e1a05000 	mov	r5, r0
  106524:	e5870048 	str	r0, [r7, #72]
  106528:	e5803000 	str	r3, [r0]
  10652c:	eaffffd8 	b	106494 <_pow5mult+0x54>
  106530:	0010b81c 	andeqs	fp, r0, ip, lsl r8

00106534 <_s2b>:
  106534:	e59fc0d4 	ldr	ip, [pc, #212]	; 106610 <prog+0x65cc>
  106538:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10653c:	e1a08003 	mov	r8, r3
  106540:	e2833008 	add	r3, r3, #8	; 0x8
  106544:	e0ce439c 	smull	r4, lr, ip, r3
  106548:	e1a03fc3 	mov	r3, r3, asr #31
  10654c:	e063c0ce 	rsb	ip, r3, lr, asr #1
  106550:	e35c0001 	cmp	ip, #1	; 0x1
  106554:	e1a05001 	mov	r5, r1
  106558:	e1a06000 	mov	r6, r0
  10655c:	e1a07002 	mov	r7, r2
  106560:	d3a01000 	movle	r1, #0	; 0x0
  106564:	da000005 	ble	106580 <_s2b+0x4c>
  106568:	e3a03001 	mov	r3, #1	; 0x1
  10656c:	e3a01000 	mov	r1, #0	; 0x0
  106570:	e1a03083 	mov	r3, r3, lsl #1
  106574:	e15c0003 	cmp	ip, r3
  106578:	e2811001 	add	r1, r1, #1	; 0x1
  10657c:	cafffffb 	bgt	106570 <_s2b+0x3c>
  106580:	e1a00006 	mov	r0, r6
  106584:	ebfffe06 	bl	105da4 <_Balloc>
  106588:	e59d3018 	ldr	r3, [sp, #24]
  10658c:	e3570009 	cmp	r7, #9	; 0x9
  106590:	e3a02001 	mov	r2, #1	; 0x1
  106594:	e5803014 	str	r3, [r0, #20]
  106598:	e5802010 	str	r2, [r0, #16]
  10659c:	d285700a 	addle	r7, r5, #10	; 0xa
  1065a0:	d3a04009 	movle	r4, #9	; 0x9
  1065a4:	da00000b 	ble	1065d8 <_s2b+0xa4>
  1065a8:	e3a04009 	mov	r4, #9	; 0x9
  1065ac:	e7d43005 	ldrb	r3, [r4, r5]
  1065b0:	e1a01000 	mov	r1, r0
  1065b4:	e2433030 	sub	r3, r3, #48	; 0x30
  1065b8:	e2844001 	add	r4, r4, #1	; 0x1
  1065bc:	e1a00006 	mov	r0, r6
  1065c0:	e3a0200a 	mov	r2, #10	; 0xa
  1065c4:	ebffff6b 	bl	106378 <_multadd>
  1065c8:	e1570004 	cmp	r7, r4
  1065cc:	1afffff6 	bne	1065ac <_s2b+0x78>
  1065d0:	e0853004 	add	r3, r5, r4
  1065d4:	e2837001 	add	r7, r3, #1	; 0x1
  1065d8:	e1580004 	cmp	r8, r4
  1065dc:	d8bd81f0 	ldmleia	sp!, {r4, r5, r6, r7, r8, pc}
  1065e0:	e0645008 	rsb	r5, r4, r8
  1065e4:	e3a04000 	mov	r4, #0	; 0x0
  1065e8:	e7d43007 	ldrb	r3, [r4, r7]
  1065ec:	e1a01000 	mov	r1, r0
  1065f0:	e2433030 	sub	r3, r3, #48	; 0x30
  1065f4:	e2844001 	add	r4, r4, #1	; 0x1
  1065f8:	e1a00006 	mov	r0, r6
  1065fc:	e3a0200a 	mov	r2, #10	; 0xa
  106600:	ebffff5c 	bl	106378 <_multadd>
  106604:	e1550004 	cmp	r5, r4
  106608:	1afffff6 	bne	1065e8 <_s2b+0xb4>
  10660c:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  106610:	38e38e39 	stmccia	r3!, {r0, r3, r4, r5, r9, sl, fp, pc}^

00106614 <_realloc_r>:
  106614:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  106618:	e251a000 	subs	sl, r1, #0	; 0x0
  10661c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  106620:	e1a06002 	mov	r6, r2
  106624:	e58d0000 	str	r0, [sp]
  106628:	0a00008d 	beq	106864 <_realloc_r+0x250>
  10662c:	ebffe931 	bl	100af8 <__malloc_lock>
  106630:	e286300b 	add	r3, r6, #11	; 0xb
  106634:	e3530016 	cmp	r3, #22	; 0x16
  106638:	83c3e007 	bichi	lr, r3, #7	; 0x7
  10663c:	93a0e010 	movls	lr, #16	; 0x10
  106640:	958de004 	strls	lr, [sp, #4]
  106644:	858de004 	strhi	lr, [sp, #4]
  106648:	e59d0004 	ldr	r0, [sp, #4]
  10664c:	93a03000 	movls	r3, #0	; 0x0
  106650:	81a03fae 	movhi	r3, lr, lsr #31
  106654:	e1500006 	cmp	r0, r6
  106658:	33833001 	orrcc	r3, r3, #1	; 0x1
  10665c:	e24a5008 	sub	r5, sl, #8	; 0x8
  106660:	e3530000 	cmp	r3, #0	; 0x0
  106664:	e5959004 	ldr	r9, [r5, #4]
  106668:	1a0000d0 	bne	1069b0 <_realloc_r+0x39c>
  10666c:	e3c94003 	bic	r4, r9, #3	; 0x3
  106670:	e154000e 	cmp	r4, lr
  106674:	a1a08005 	movge	r8, r5
  106678:	a1a07004 	movge	r7, r4
  10667c:	a1a0c008 	movge	ip, r8
  106680:	a2884008 	addge	r4, r8, #8	; 0x8
  106684:	aa00004a 	bge	1067b4 <_realloc_r+0x1a0>
  106688:	e59f25b8 	ldr	r2, [pc, #1464]	; 106c48 <prog+0x6c04>
  10668c:	e592b008 	ldr	fp, [r2, #8]
  106690:	e0850004 	add	r0, r5, r4
  106694:	e150000b 	cmp	r0, fp
  106698:	e1a08005 	mov	r8, r5
  10669c:	0a0000c8 	beq	1069c4 <_realloc_r+0x3b0>
  1066a0:	e5901004 	ldr	r1, [r0, #4]
  1066a4:	e3c13001 	bic	r3, r1, #1	; 0x1
  1066a8:	e0833000 	add	r3, r3, r0
  1066ac:	e5932004 	ldr	r2, [r3, #4]
  1066b0:	e3120001 	tst	r2, #1	; 0x1
  1066b4:	0a00005f 	beq	106838 <_realloc_r+0x224>
  1066b8:	e3a0c000 	mov	ip, #0	; 0x0
  1066bc:	e1a0000c 	mov	r0, ip
  1066c0:	e3190001 	tst	r9, #1	; 0x1
  1066c4:	1a00006a 	bne	106874 <_realloc_r+0x260>
  1066c8:	e5953000 	ldr	r3, [r5]
  1066cc:	e0633005 	rsb	r3, r3, r5
  1066d0:	e5932004 	ldr	r2, [r3, #4]
  1066d4:	e3500000 	cmp	r0, #0	; 0x0
  1066d8:	e58d3008 	str	r3, [sp, #8]
  1066dc:	e3c22003 	bic	r2, r2, #3	; 0x3
  1066e0:	0a000083 	beq	1068f4 <_realloc_r+0x2e0>
  1066e4:	e150000b 	cmp	r0, fp
  1066e8:	0a0000f9 	beq	106ad4 <_realloc_r+0x4c0>
  1066ec:	e0849002 	add	r9, r4, r2
  1066f0:	e08c7009 	add	r7, ip, r9
  1066f4:	e157000e 	cmp	r7, lr
  1066f8:	ba00007e 	blt	1068f8 <_realloc_r+0x2e4>
  1066fc:	e2802008 	add	r2, r0, #8	; 0x8
  106700:	e892000c 	ldmia	r2, {r2, r3}
  106704:	e5832008 	str	r2, [r3, #8]
  106708:	e582300c 	str	r3, [r2, #12]
  10670c:	e59d3008 	ldr	r3, [sp, #8]
  106710:	e2444004 	sub	r4, r4, #4	; 0x4
  106714:	e593200c 	ldr	r2, [r3, #12]
  106718:	e59d8008 	ldr	r8, [sp, #8]
  10671c:	e5933008 	ldr	r3, [r3, #8]
  106720:	e3540024 	cmp	r4, #36	; 0x24
  106724:	e5823008 	str	r3, [r2, #8]
  106728:	e583200c 	str	r2, [r3, #12]
  10672c:	e2885008 	add	r5, r8, #8	; 0x8
  106730:	8a0000d4 	bhi	106a88 <_realloc_r+0x474>
  106734:	e3540013 	cmp	r4, #19	; 0x13
  106738:	e1a0c00a 	mov	ip, sl
  10673c:	e1a0e005 	mov	lr, r5
  106740:	9a000011 	bls	10678c <_realloc_r+0x178>
  106744:	e1a0000a 	mov	r0, sl
  106748:	e4903004 	ldr	r3, [r0], #4
  10674c:	e5883008 	str	r3, [r8, #8]
  106750:	e59a2004 	ldr	r2, [sl, #4]
  106754:	e354001b 	cmp	r4, #27	; 0x1b
  106758:	e588200c 	str	r2, [r8, #12]
  10675c:	e288e010 	add	lr, r8, #16	; 0x10
  106760:	e280c004 	add	ip, r0, #4	; 0x4
  106764:	9a000008 	bls	10678c <_realloc_r+0x178>
  106768:	e5903004 	ldr	r3, [r0, #4]
  10676c:	e5883010 	str	r3, [r8, #16]
  106770:	e59c2004 	ldr	r2, [ip, #4]
  106774:	e28c3004 	add	r3, ip, #4	; 0x4
  106778:	e3540024 	cmp	r4, #36	; 0x24
  10677c:	e5882014 	str	r2, [r8, #20]
  106780:	e288e018 	add	lr, r8, #24	; 0x18
  106784:	e283c004 	add	ip, r3, #4	; 0x4
  106788:	0a000119 	beq	106bf4 <_realloc_r+0x5e0>
  10678c:	e1a0200c 	mov	r2, ip
  106790:	e4920004 	ldr	r0, [r2], #4
  106794:	e1a0100e 	mov	r1, lr
  106798:	e4810004 	str	r0, [r1], #4
  10679c:	e59c3004 	ldr	r3, [ip, #4]
  1067a0:	e58e3004 	str	r3, [lr, #4]
  1067a4:	e5920004 	ldr	r0, [r2, #4]
  1067a8:	e59dc008 	ldr	ip, [sp, #8]
  1067ac:	e5810004 	str	r0, [r1, #4]
  1067b0:	e1a04005 	mov	r4, r5
  1067b4:	e59d1004 	ldr	r1, [sp, #4]
  1067b8:	e0610007 	rsb	r0, r1, r7
  1067bc:	e350000f 	cmp	r0, #15	; 0xf
  1067c0:	8a00000d 	bhi	1067fc <_realloc_r+0x1e8>
  1067c4:	e59c3004 	ldr	r3, [ip, #4]
  1067c8:	e2033001 	and	r3, r3, #1	; 0x1
  1067cc:	e1873003 	orr	r3, r7, r3
  1067d0:	e58c3004 	str	r3, [ip, #4]
  1067d4:	e0872008 	add	r2, r7, r8
  1067d8:	e5923004 	ldr	r3, [r2, #4]
  1067dc:	e3833001 	orr	r3, r3, #1	; 0x1
  1067e0:	e5823004 	str	r3, [r2, #4]
  1067e4:	e59d0000 	ldr	r0, [sp]
  1067e8:	ebffe8c3 	bl	100afc <__malloc_unlock>
  1067ec:	e1a06004 	mov	r6, r4
  1067f0:	e1a00006 	mov	r0, r6
  1067f4:	e28dd00c 	add	sp, sp, #12	; 0xc
  1067f8:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1067fc:	e59c3004 	ldr	r3, [ip, #4]
  106800:	e2033001 	and	r3, r3, #1	; 0x1
  106804:	e1813003 	orr	r3, r1, r3
  106808:	e3802001 	orr	r2, r0, #1	; 0x1
  10680c:	e0811008 	add	r1, r1, r8
  106810:	e58c3004 	str	r3, [ip, #4]
  106814:	e5812004 	str	r2, [r1, #4]
  106818:	e0810000 	add	r0, r1, r0
  10681c:	e5903004 	ldr	r3, [r0, #4]
  106820:	e3833001 	orr	r3, r3, #1	; 0x1
  106824:	e5803004 	str	r3, [r0, #4]
  106828:	e2811008 	add	r1, r1, #8	; 0x8
  10682c:	e59d0000 	ldr	r0, [sp]
  106830:	ebfff9a2 	bl	104ec0 <_free_r>
  106834:	eaffffea 	b	1067e4 <_realloc_r+0x1d0>
  106838:	e3c1c003 	bic	ip, r1, #3	; 0x3
  10683c:	e084700c 	add	r7, r4, ip
  106840:	e15e0007 	cmp	lr, r7
  106844:	caffff9d 	bgt	1066c0 <_realloc_r+0xac>
  106848:	e2802008 	add	r2, r0, #8	; 0x8
  10684c:	e892000c 	ldmia	r2, {r2, r3}
  106850:	e1a0c005 	mov	ip, r5
  106854:	e2854008 	add	r4, r5, #8	; 0x8
  106858:	e5832008 	str	r2, [r3, #8]
  10685c:	e582300c 	str	r3, [r2, #12]
  106860:	eaffffd3 	b	1067b4 <_realloc_r+0x1a0>
  106864:	e1a01002 	mov	r1, r2
  106868:	e28dd00c 	add	sp, sp, #12	; 0xc
  10686c:	e8bd4ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  106870:	eaffe676 	b	100250 <_malloc_r>
  106874:	e1a01006 	mov	r1, r6
  106878:	e59d0000 	ldr	r0, [sp]
  10687c:	ebffe673 	bl	100250 <_malloc_r>
  106880:	e2506000 	subs	r6, r0, #0	; 0x0
  106884:	0a000017 	beq	1068e8 <_realloc_r+0x2d4>
  106888:	e5953004 	ldr	r3, [r5, #4]
  10688c:	e3c33001 	bic	r3, r3, #1	; 0x1
  106890:	e0853003 	add	r3, r5, r3
  106894:	e2462008 	sub	r2, r6, #8	; 0x8
  106898:	e1520003 	cmp	r2, r3
  10689c:	0a0000c9 	beq	106bc8 <_realloc_r+0x5b4>
  1068a0:	e2441004 	sub	r1, r4, #4	; 0x4
  1068a4:	e3510024 	cmp	r1, #36	; 0x24
  1068a8:	8a000085 	bhi	106ac4 <_realloc_r+0x4b0>
  1068ac:	e3510013 	cmp	r1, #19	; 0x13
  1068b0:	e1a0c00a 	mov	ip, sl
  1068b4:	e1a0e006 	mov	lr, r6
  1068b8:	8a000057 	bhi	106a1c <_realloc_r+0x408>
  1068bc:	e1a0000c 	mov	r0, ip
  1068c0:	e4902004 	ldr	r2, [r0], #4
  1068c4:	e1a0100e 	mov	r1, lr
  1068c8:	e4812004 	str	r2, [r1], #4
  1068cc:	e59c3004 	ldr	r3, [ip, #4]
  1068d0:	e58e3004 	str	r3, [lr, #4]
  1068d4:	e5902004 	ldr	r2, [r0, #4]
  1068d8:	e5812004 	str	r2, [r1, #4]
  1068dc:	e1a0100a 	mov	r1, sl
  1068e0:	e59d0000 	ldr	r0, [sp]
  1068e4:	ebfff975 	bl	104ec0 <_free_r>
  1068e8:	e59d0000 	ldr	r0, [sp]
  1068ec:	ebffe882 	bl	100afc <__malloc_unlock>
  1068f0:	eaffffbe 	b	1067f0 <_realloc_r+0x1dc>
  1068f4:	e0849002 	add	r9, r4, r2
  1068f8:	e159000e 	cmp	r9, lr
  1068fc:	baffffdc 	blt	106874 <_realloc_r+0x260>
  106900:	e59d0008 	ldr	r0, [sp, #8]
  106904:	e2444004 	sub	r4, r4, #4	; 0x4
  106908:	e590200c 	ldr	r2, [r0, #12]
  10690c:	e5903008 	ldr	r3, [r0, #8]
  106910:	e3540024 	cmp	r4, #36	; 0x24
  106914:	e1a08000 	mov	r8, r0
  106918:	e5823008 	str	r3, [r2, #8]
  10691c:	e583200c 	str	r2, [r3, #12]
  106920:	e2805008 	add	r5, r0, #8	; 0x8
  106924:	8a00005e 	bhi	106aa4 <_realloc_r+0x490>
  106928:	e3540013 	cmp	r4, #19	; 0x13
  10692c:	e1a0c00a 	mov	ip, sl
  106930:	e1a0e005 	mov	lr, r5
  106934:	9a000011 	bls	106980 <_realloc_r+0x36c>
  106938:	e1a0000a 	mov	r0, sl
  10693c:	e4903004 	ldr	r3, [r0], #4
  106940:	e5883008 	str	r3, [r8, #8]
  106944:	e59a2004 	ldr	r2, [sl, #4]
  106948:	e354001b 	cmp	r4, #27	; 0x1b
  10694c:	e588200c 	str	r2, [r8, #12]
  106950:	e288e010 	add	lr, r8, #16	; 0x10
  106954:	e280c004 	add	ip, r0, #4	; 0x4
  106958:	9a000008 	bls	106980 <_realloc_r+0x36c>
  10695c:	e5903004 	ldr	r3, [r0, #4]
  106960:	e5883010 	str	r3, [r8, #16]
  106964:	e59c2004 	ldr	r2, [ip, #4]
  106968:	e28c3004 	add	r3, ip, #4	; 0x4
  10696c:	e3540024 	cmp	r4, #36	; 0x24
  106970:	e5882014 	str	r2, [r8, #20]
  106974:	e288e018 	add	lr, r8, #24	; 0x18
  106978:	e283c004 	add	ip, r3, #4	; 0x4
  10697c:	0a0000a3 	beq	106c10 <_realloc_r+0x5fc>
  106980:	e1a0200c 	mov	r2, ip
  106984:	e4921004 	ldr	r1, [r2], #4
  106988:	e1a0000e 	mov	r0, lr
  10698c:	e4801004 	str	r1, [r0], #4
  106990:	e59c3004 	ldr	r3, [ip, #4]
  106994:	e58e3004 	str	r3, [lr, #4]
  106998:	e59dc008 	ldr	ip, [sp, #8]
  10699c:	e5921004 	ldr	r1, [r2, #4]
  1069a0:	e1a07009 	mov	r7, r9
  1069a4:	e1a04005 	mov	r4, r5
  1069a8:	e5801004 	str	r1, [r0, #4]
  1069ac:	eaffff80 	b	1067b4 <_realloc_r+0x1a0>
  1069b0:	e59d1000 	ldr	r1, [sp]
  1069b4:	e3a0300c 	mov	r3, #12	; 0xc
  1069b8:	e3a06000 	mov	r6, #0	; 0x0
  1069bc:	e5813000 	str	r3, [r1]
  1069c0:	eaffff8a 	b	1067f0 <_realloc_r+0x1dc>
  1069c4:	e5903004 	ldr	r3, [r0, #4]
  1069c8:	e59d1004 	ldr	r1, [sp, #4]
  1069cc:	e3c3c003 	bic	ip, r3, #3	; 0x3
  1069d0:	e084200c 	add	r2, r4, ip
  1069d4:	e2813010 	add	r3, r1, #16	; 0x10
  1069d8:	e1520003 	cmp	r2, r3
  1069dc:	baffff37 	blt	1066c0 <_realloc_r+0xac>
  1069e0:	e0613002 	rsb	r3, r1, r2
  1069e4:	e3833001 	orr	r3, r3, #1	; 0x1
  1069e8:	e0851001 	add	r1, r5, r1
  1069ec:	e5813004 	str	r3, [r1, #4]
  1069f0:	e5952004 	ldr	r2, [r5, #4]
  1069f4:	e59d3004 	ldr	r3, [sp, #4]
  1069f8:	e2022001 	and	r2, r2, #1	; 0x1
  1069fc:	e1832002 	orr	r2, r3, r2
  106a00:	e5852004 	str	r2, [r5, #4]
  106a04:	e59f223c 	ldr	r2, [pc, #572]	; 106c48 <prog+0x6c04>
  106a08:	e59d0000 	ldr	r0, [sp]
  106a0c:	e5821008 	str	r1, [r2, #8]
  106a10:	ebffe839 	bl	100afc <__malloc_unlock>
  106a14:	e2856008 	add	r6, r5, #8	; 0x8
  106a18:	eaffff74 	b	1067f0 <_realloc_r+0x1dc>
  106a1c:	e1a0400a 	mov	r4, sl
  106a20:	e4943004 	ldr	r3, [r4], #4
  106a24:	e1a00006 	mov	r0, r6
  106a28:	e4803004 	str	r3, [r0], #4
  106a2c:	e59a2004 	ldr	r2, [sl, #4]
  106a30:	e351001b 	cmp	r1, #27	; 0x1b
  106a34:	e5862004 	str	r2, [r6, #4]
  106a38:	e280e004 	add	lr, r0, #4	; 0x4
  106a3c:	e284c004 	add	ip, r4, #4	; 0x4
  106a40:	9affff9d 	bls	1068bc <_realloc_r+0x2a8>
  106a44:	e5943004 	ldr	r3, [r4, #4]
  106a48:	e5803004 	str	r3, [r0, #4]
  106a4c:	e59c2004 	ldr	r2, [ip, #4]
  106a50:	e3510024 	cmp	r1, #36	; 0x24
  106a54:	e28c3004 	add	r3, ip, #4	; 0x4
  106a58:	e28e1004 	add	r1, lr, #4	; 0x4
  106a5c:	e58e2004 	str	r2, [lr, #4]
  106a60:	e283c004 	add	ip, r3, #4	; 0x4
  106a64:	e281e004 	add	lr, r1, #4	; 0x4
  106a68:	1affff93 	bne	1068bc <_realloc_r+0x2a8>
  106a6c:	e5933004 	ldr	r3, [r3, #4]
  106a70:	e5813004 	str	r3, [r1, #4]
  106a74:	e59c2004 	ldr	r2, [ip, #4]
  106a78:	e28cc008 	add	ip, ip, #8	; 0x8
  106a7c:	e58e2004 	str	r2, [lr, #4]
  106a80:	e28ee008 	add	lr, lr, #8	; 0x8
  106a84:	eaffff8c 	b	1068bc <_realloc_r+0x2a8>
  106a88:	e1a02004 	mov	r2, r4
  106a8c:	e1a0100a 	mov	r1, sl
  106a90:	e1a00005 	mov	r0, r5
  106a94:	ebfffbb3 	bl	105968 <memmove>
  106a98:	e1a04005 	mov	r4, r5
  106a9c:	e1a0c008 	mov	ip, r8
  106aa0:	eaffff43 	b	1067b4 <_realloc_r+0x1a0>
  106aa4:	e1a02004 	mov	r2, r4
  106aa8:	e1a0100a 	mov	r1, sl
  106aac:	e1a00005 	mov	r0, r5
  106ab0:	ebfffbac 	bl	105968 <memmove>
  106ab4:	e1a07009 	mov	r7, r9
  106ab8:	e1a04005 	mov	r4, r5
  106abc:	e1a0c008 	mov	ip, r8
  106ac0:	eaffff3b 	b	1067b4 <_realloc_r+0x1a0>
  106ac4:	e1a02001 	mov	r2, r1
  106ac8:	e1a0100a 	mov	r1, sl
  106acc:	ebfffba5 	bl	105968 <memmove>
  106ad0:	eaffff81 	b	1068dc <_realloc_r+0x2c8>
  106ad4:	e59d0004 	ldr	r0, [sp, #4]
  106ad8:	e0849002 	add	r9, r4, r2
  106adc:	e08c7009 	add	r7, ip, r9
  106ae0:	e2803010 	add	r3, r0, #16	; 0x10
  106ae4:	e1570003 	cmp	r7, r3
  106ae8:	baffff82 	blt	1068f8 <_realloc_r+0x2e4>
  106aec:	e59d1008 	ldr	r1, [sp, #8]
  106af0:	e2444004 	sub	r4, r4, #4	; 0x4
  106af4:	e591200c 	ldr	r2, [r1, #12]
  106af8:	e5913008 	ldr	r3, [r1, #8]
  106afc:	e3540024 	cmp	r4, #36	; 0x24
  106b00:	e5823008 	str	r3, [r2, #8]
  106b04:	e583200c 	str	r2, [r3, #12]
  106b08:	e2816008 	add	r6, r1, #8	; 0x8
  106b0c:	8a000033 	bhi	106be0 <_realloc_r+0x5cc>
  106b10:	e3540013 	cmp	r4, #19	; 0x13
  106b14:	e1a0c00a 	mov	ip, sl
  106b18:	e1a0e006 	mov	lr, r6
  106b1c:	9a000011 	bls	106b68 <_realloc_r+0x554>
  106b20:	e1a0000a 	mov	r0, sl
  106b24:	e4903004 	ldr	r3, [r0], #4
  106b28:	e5813008 	str	r3, [r1, #8]
  106b2c:	e59a2004 	ldr	r2, [sl, #4]
  106b30:	e354001b 	cmp	r4, #27	; 0x1b
  106b34:	e581200c 	str	r2, [r1, #12]
  106b38:	e281e010 	add	lr, r1, #16	; 0x10
  106b3c:	e280c004 	add	ip, r0, #4	; 0x4
  106b40:	9a000008 	bls	106b68 <_realloc_r+0x554>
  106b44:	e5903004 	ldr	r3, [r0, #4]
  106b48:	e5813010 	str	r3, [r1, #16]
  106b4c:	e59c2004 	ldr	r2, [ip, #4]
  106b50:	e28c3004 	add	r3, ip, #4	; 0x4
  106b54:	e3540024 	cmp	r4, #36	; 0x24
  106b58:	e5812014 	str	r2, [r1, #20]
  106b5c:	e281e018 	add	lr, r1, #24	; 0x18
  106b60:	e283c004 	add	ip, r3, #4	; 0x4
  106b64:	0a000030 	beq	106c2c <_realloc_r+0x618>
  106b68:	e1a0000c 	mov	r0, ip
  106b6c:	e4902004 	ldr	r2, [r0], #4
  106b70:	e1a0100e 	mov	r1, lr
  106b74:	e4812004 	str	r2, [r1], #4
  106b78:	e59c3004 	ldr	r3, [ip, #4]
  106b7c:	e58e3004 	str	r3, [lr, #4]
  106b80:	e5902004 	ldr	r2, [r0, #4]
  106b84:	e5812004 	str	r2, [r1, #4]
  106b88:	e59d2004 	ldr	r2, [sp, #4]
  106b8c:	e59d0008 	ldr	r0, [sp, #8]
  106b90:	e0623007 	rsb	r3, r2, r7
  106b94:	e0801002 	add	r1, r0, r2
  106b98:	e3833001 	orr	r3, r3, #1	; 0x1
  106b9c:	e5813004 	str	r3, [r1, #4]
  106ba0:	e5902004 	ldr	r2, [r0, #4]
  106ba4:	e59d3004 	ldr	r3, [sp, #4]
  106ba8:	e2022001 	and	r2, r2, #1	; 0x1
  106bac:	e1832002 	orr	r2, r3, r2
  106bb0:	e5802004 	str	r2, [r0, #4]
  106bb4:	e59f208c 	ldr	r2, [pc, #140]	; 106c48 <prog+0x6c04>
  106bb8:	e59d0000 	ldr	r0, [sp]
  106bbc:	e5821008 	str	r1, [r2, #8]
  106bc0:	ebffe7cd 	bl	100afc <__malloc_unlock>
  106bc4:	eaffff09 	b	1067f0 <_realloc_r+0x1dc>
  106bc8:	e5923004 	ldr	r3, [r2, #4]
  106bcc:	e3c33003 	bic	r3, r3, #3	; 0x3
  106bd0:	e0847003 	add	r7, r4, r3
  106bd4:	e1a0c005 	mov	ip, r5
  106bd8:	e2854008 	add	r4, r5, #8	; 0x8
  106bdc:	eafffef4 	b	1067b4 <_realloc_r+0x1a0>
  106be0:	e1a0100a 	mov	r1, sl
  106be4:	e1a02004 	mov	r2, r4
  106be8:	e1a00006 	mov	r0, r6
  106bec:	ebfffb5d 	bl	105968 <memmove>
  106bf0:	eaffffe4 	b	106b88 <_realloc_r+0x574>
  106bf4:	e5933004 	ldr	r3, [r3, #4]
  106bf8:	e5883018 	str	r3, [r8, #24]
  106bfc:	e59c2004 	ldr	r2, [ip, #4]
  106c00:	e288e020 	add	lr, r8, #32	; 0x20
  106c04:	e28cc008 	add	ip, ip, #8	; 0x8
  106c08:	e588201c 	str	r2, [r8, #28]
  106c0c:	eafffede 	b	10678c <_realloc_r+0x178>
  106c10:	e5933004 	ldr	r3, [r3, #4]
  106c14:	e5883018 	str	r3, [r8, #24]
  106c18:	e59c2004 	ldr	r2, [ip, #4]
  106c1c:	e288e020 	add	lr, r8, #32	; 0x20
  106c20:	e28cc008 	add	ip, ip, #8	; 0x8
  106c24:	e588201c 	str	r2, [r8, #28]
  106c28:	eaffff54 	b	106980 <_realloc_r+0x36c>
  106c2c:	e5933004 	ldr	r3, [r3, #4]
  106c30:	e5813018 	str	r3, [r1, #24]
  106c34:	e59c2004 	ldr	r2, [ip, #4]
  106c38:	e281e020 	add	lr, r1, #32	; 0x20
  106c3c:	e28cc008 	add	ip, ip, #8	; 0x8
  106c40:	e581201c 	str	r2, [r1, #28]
  106c44:	eaffffc7 	b	106b68 <_realloc_r+0x554>
  106c48:	00200000 	eoreq	r0, r0, r0

00106c4c <isinf>:
  106c4c:	e2612000 	rsb	r2, r1, #0	; 0x0
  106c50:	e1822001 	orr	r2, r2, r1
  106c54:	e3c03102 	bic	r3, r0, #-2147483648	; 0x80000000
  106c58:	e3a0047f 	mov	r0, #2130706432	; 0x7f000000
  106c5c:	e1833fa2 	orr	r3, r3, r2, lsr #31
  106c60:	e280060f 	add	r0, r0, #15728640	; 0xf00000
  106c64:	e0630000 	rsb	r0, r3, r0
  106c68:	e52d4004 	str	r4, [sp, #-4]!
  106c6c:	e2602000 	rsb	r2, r0, #0	; 0x0
  106c70:	e1800002 	orr	r0, r0, r2
  106c74:	e1a00fa0 	mov	r0, r0, lsr #31
  106c78:	e1a04001 	mov	r4, r1
  106c7c:	e2600001 	rsb	r0, r0, #1	; 0x1
  106c80:	e8bd0010 	ldmia	sp!, {r4}
  106c84:	e12fff1e 	bx	lr

00106c88 <isnan>:
  106c88:	e52d4004 	str	r4, [sp, #-4]!
  106c8c:	e2612000 	rsb	r2, r1, #0	; 0x0
  106c90:	e1822001 	orr	r2, r2, r1
  106c94:	e3c03102 	bic	r3, r0, #-2147483648	; 0x80000000
  106c98:	e3a0047f 	mov	r0, #2130706432	; 0x7f000000
  106c9c:	e1833fa2 	orr	r3, r3, r2, lsr #31
  106ca0:	e280060f 	add	r0, r0, #15728640	; 0xf00000
  106ca4:	e0630000 	rsb	r0, r3, r0
  106ca8:	e1a04001 	mov	r4, r1
  106cac:	e1a00fa0 	mov	r0, r0, lsr #31
  106cb0:	e8bd0010 	ldmia	sp!, {r4}
  106cb4:	e12fff1e 	bx	lr

00106cb8 <__sclose>:
  106cb8:	e59f3008 	ldr	r3, [pc, #8]	; 106cc8 <prog+0x6c84>
  106cbc:	e1d010fe 	ldrsh	r1, [r0, #14]
  106cc0:	e5930000 	ldr	r0, [r3]
  106cc4:	ea000834 	b	108d9c <_close_r>
  106cc8:	00200410 	eoreq	r0, r0, r0, lsl r4

00106ccc <__sseek>:
  106ccc:	e1a03002 	mov	r3, r2
  106cd0:	e59f2038 	ldr	r2, [pc, #56]	; 106d10 <prog+0x6ccc>
  106cd4:	e92d4010 	stmdb	sp!, {r4, lr}
  106cd8:	e1a04000 	mov	r4, r0
  106cdc:	e5920000 	ldr	r0, [r2]
  106ce0:	e1a02001 	mov	r2, r1
  106ce4:	e1d410fe 	ldrsh	r1, [r4, #14]
  106ce8:	eb00082d 	bl	108da4 <_lseek_r>
  106cec:	e3700001 	cmn	r0, #1	; 0x1
  106cf0:	01d430bc 	ldreqh	r3, [r4, #12]
  106cf4:	11d430bc 	ldrneh	r3, [r4, #12]
  106cf8:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
  106cfc:	13833a01 	orrne	r3, r3, #4096	; 0x1000
  106d00:	01c430bc 	streqh	r3, [r4, #12]
  106d04:	11c430bc 	strneh	r3, [r4, #12]
  106d08:	15840050 	strne	r0, [r4, #80]
  106d0c:	e8bd8010 	ldmia	sp!, {r4, pc}
  106d10:	00200410 	eoreq	r0, r0, r0, lsl r4

00106d14 <__swrite>:
  106d14:	e1d0c0bc 	ldrh	ip, [r0, #12]
  106d18:	e31c0c01 	tst	ip, #256	; 0x100
  106d1c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  106d20:	e3a03002 	mov	r3, #2	; 0x2
  106d24:	e59f7044 	ldr	r7, [pc, #68]	; 106d70 <prog+0x6d2c>
  106d28:	e1a06002 	mov	r6, r2
  106d2c:	e1a04000 	mov	r4, r0
  106d30:	e1a05001 	mov	r5, r1
  106d34:	e3a02000 	mov	r2, #0	; 0x0
  106d38:	059f7030 	ldreq	r7, [pc, #48]	; 106d70 <prog+0x6d2c>
  106d3c:	0a000003 	beq	106d50 <__swrite+0x3c>
  106d40:	e5970000 	ldr	r0, [r7]
  106d44:	e1d410fe 	ldrsh	r1, [r4, #14]
  106d48:	eb000815 	bl	108da4 <_lseek_r>
  106d4c:	e1d4c0bc 	ldrh	ip, [r4, #12]
  106d50:	e5970000 	ldr	r0, [r7]
  106d54:	e1d410fe 	ldrsh	r1, [r4, #14]
  106d58:	e3ccca01 	bic	ip, ip, #4096	; 0x1000
  106d5c:	e1a02005 	mov	r2, r5
  106d60:	e1a03006 	mov	r3, r6
  106d64:	e1c4c0bc 	strh	ip, [r4, #12]
  106d68:	e8bd40f0 	ldmia	sp!, {r4, r5, r6, r7, lr}
  106d6c:	ea00081e 	b	108dec <_write_r>
  106d70:	00200410 	eoreq	r0, r0, r0, lsl r4

00106d74 <__sread>:
  106d74:	e1a03002 	mov	r3, r2
  106d78:	e59f2034 	ldr	r2, [pc, #52]	; 106db4 <prog+0x6d70>
  106d7c:	e92d4010 	stmdb	sp!, {r4, lr}
  106d80:	e1a04000 	mov	r4, r0
  106d84:	e5920000 	ldr	r0, [r2]
  106d88:	e1a02001 	mov	r2, r1
  106d8c:	e1d410fe 	ldrsh	r1, [r4, #14]
  106d90:	eb00082d 	bl	108e4c <_read_r>
  106d94:	e3500000 	cmp	r0, #0	; 0x0
  106d98:	a5943050 	ldrge	r3, [r4, #80]
  106d9c:	b1d430bc 	ldrlth	r3, [r4, #12]
  106da0:	a0833000 	addge	r3, r3, r0
  106da4:	b3c33a01 	biclt	r3, r3, #4096	; 0x1000
  106da8:	a5843050 	strge	r3, [r4, #80]
  106dac:	b1c430bc 	strlth	r3, [r4, #12]
  106db0:	e8bd8010 	ldmia	sp!, {r4, pc}
  106db4:	00200410 	eoreq	r0, r0, r0, lsl r4

00106db8 <strcmp>:
  106db8:	e1803001 	orr	r3, r0, r1
  106dbc:	e3130003 	tst	r3, #3	; 0x3
  106dc0:	e1a02000 	mov	r2, r0
  106dc4:	1a00001d 	bne	106e40 <strcmp+0x88>
  106dc8:	e5902000 	ldr	r2, [r0]
  106dcc:	e5913000 	ldr	r3, [r1]
  106dd0:	e1520003 	cmp	r2, r3
  106dd4:	1a000018 	bne	106e3c <strcmp+0x84>
  106dd8:	e28234ff 	add	r3, r2, #-16777216	; 0xff000000
  106ddc:	e2433801 	sub	r3, r3, #65536	; 0x10000
  106de0:	e2433c01 	sub	r3, r3, #256	; 0x100
  106de4:	e2433001 	sub	r3, r3, #1	; 0x1
  106de8:	e3c3347f 	bic	r3, r3, #2130706432	; 0x7f000000
  106dec:	e3c3387f 	bic	r3, r3, #8323072	; 0x7f0000
  106df0:	e3c33c7f 	bic	r3, r3, #32512	; 0x7f00
  106df4:	e3c3307f 	bic	r3, r3, #127	; 0x7f
  106df8:	e1d32002 	bics	r2, r3, r2
  106dfc:	0a000002 	beq	106e0c <strcmp+0x54>
  106e00:	ea00001e 	b	106e80 <strcmp+0xc8>
  106e04:	e1d2c00c 	bics	ip, r2, ip
  106e08:	1a00001c 	bne	106e80 <strcmp+0xc8>
  106e0c:	e5b0c004 	ldr	ip, [r0, #4]!
  106e10:	e28c34ff 	add	r3, ip, #-16777216	; 0xff000000
  106e14:	e2433801 	sub	r3, r3, #65536	; 0x10000
  106e18:	e2433c01 	sub	r3, r3, #256	; 0x100
  106e1c:	e2433001 	sub	r3, r3, #1	; 0x1
  106e20:	e3c3247f 	bic	r2, r3, #2130706432	; 0x7f000000
  106e24:	e5b13004 	ldr	r3, [r1, #4]!
  106e28:	e3c2287f 	bic	r2, r2, #8323072	; 0x7f0000
  106e2c:	e3c22c7f 	bic	r2, r2, #32512	; 0x7f00
  106e30:	e15c0003 	cmp	ip, r3
  106e34:	e3c2207f 	bic	r2, r2, #127	; 0x7f
  106e38:	0afffff1 	beq	106e04 <strcmp+0x4c>
  106e3c:	e1a02000 	mov	r2, r0
  106e40:	e5d23000 	ldrb	r3, [r2]
  106e44:	e3530000 	cmp	r3, #0	; 0x0
  106e48:	1a000004 	bne	106e60 <strcmp+0xa8>
  106e4c:	ea000008 	b	106e74 <strcmp+0xbc>
  106e50:	e5f23001 	ldrb	r3, [r2, #1]!
  106e54:	e3530000 	cmp	r3, #0	; 0x0
  106e58:	e2811001 	add	r1, r1, #1	; 0x1
  106e5c:	0a000004 	beq	106e74 <strcmp+0xbc>
  106e60:	e5d10000 	ldrb	r0, [r1]
  106e64:	e1500003 	cmp	r0, r3
  106e68:	0afffff8 	beq	106e50 <strcmp+0x98>
  106e6c:	e0600003 	rsb	r0, r0, r3
  106e70:	e12fff1e 	bx	lr
  106e74:	e5d10000 	ldrb	r0, [r1]
  106e78:	e0600003 	rsb	r0, r0, r3
  106e7c:	e12fff1e 	bx	lr
  106e80:	e3a00000 	mov	r0, #0	; 0x0
  106e84:	e12fff1e 	bx	lr

00106e88 <findslot>:
  106e88:	e59f2024 	ldr	r2, [pc, #36]	; 106eb4 <prog+0x6e70>
  106e8c:	e1a01000 	mov	r1, r0
  106e90:	e3a00000 	mov	r0, #0	; 0x0
  106e94:	e5923000 	ldr	r3, [r2]
  106e98:	e1530001 	cmp	r3, r1
  106e9c:	e2822008 	add	r2, r2, #8	; 0x8
  106ea0:	012fff1e 	bxeq	lr
  106ea4:	e2800001 	add	r0, r0, #1	; 0x1
  106ea8:	e3500014 	cmp	r0, #20	; 0x14
  106eac:	1afffff8 	bne	106e94 <findslot+0xc>
  106eb0:	e12fff1e 	bx	lr
  106eb4:	00200874 	eoreq	r0, r0, r4, ror r8

00106eb8 <_getpid>:
  106eb8:	e3a00001 	mov	r0, #1	; 0x1
  106ebc:	e12fff1e 	bx	lr

00106ec0 <_link>:
  106ec0:	e3e00000 	mvn	r0, #0	; 0x0
  106ec4:	e12fff1e 	bx	lr

00106ec8 <_unlink>:
  106ec8:	e3e00000 	mvn	r0, #0	; 0x0
  106ecc:	e12fff1e 	bx	lr

00106ed0 <_raise>:
  106ed0:	e12fff1e 	bx	lr

00106ed4 <isatty>:
  106ed4:	e3a00001 	mov	r0, #1	; 0x1
  106ed8:	e12fff1e 	bx	lr

00106edc <_rename>:
  106edc:	e52de004 	str	lr, [sp, #-4]!
  106ee0:	eb0001d2 	bl	107630 <__errno>
  106ee4:	e3a03058 	mov	r3, #88	; 0x58
  106ee8:	e5803000 	str	r3, [r0]
  106eec:	e3e00000 	mvn	r0, #0	; 0x0
  106ef0:	e49df004 	ldr	pc, [sp], #4

00106ef4 <_system>:
  106ef4:	e3500000 	cmp	r0, #0	; 0x0
  106ef8:	e52de004 	str	lr, [sp, #-4]!
  106efc:	049df004 	ldreq	pc, [sp], #4
  106f00:	eb0001ca 	bl	107630 <__errno>
  106f04:	e3a03058 	mov	r3, #88	; 0x58
  106f08:	e5803000 	str	r3, [r0]
  106f0c:	e3e00000 	mvn	r0, #0	; 0x0
  106f10:	e49df004 	ldr	pc, [sp], #4

00106f14 <_sbrk>:
  106f14:	e59f1044 	ldr	r1, [pc, #68]	; 106f60 <prog+0x6f1c>
  106f18:	e5913000 	ldr	r3, [r1]
  106f1c:	e52de004 	str	lr, [sp, #-4]!
  106f20:	e3530000 	cmp	r3, #0	; 0x0
  106f24:	059f3038 	ldreq	r3, [pc, #56]	; 106f64 <prog+0x6f20>
  106f28:	e0830000 	add	r0, r3, r0
  106f2c:	05813000 	streq	r3, [r1]
  106f30:	e150000d 	cmp	r0, sp
  106f34:	e1a02003 	mov	r2, r3
  106f38:	95810000 	strls	r0, [r1]
  106f3c:	8a000001 	bhi	106f48 <_sbrk+0x34>
  106f40:	e1a00002 	mov	r0, r2
  106f44:	e49df004 	ldr	pc, [sp], #4
  106f48:	eb0001b8 	bl	107630 <__errno>
  106f4c:	e3e02000 	mvn	r2, #0	; 0x0
  106f50:	e3a0300c 	mov	r3, #12	; 0xc
  106f54:	e5803000 	str	r3, [r0]
  106f58:	e1a00002 	mov	r0, r2
  106f5c:	e49df004 	ldr	pc, [sp], #4
  106f60:	00200864 	eoreq	r0, r0, r4, ror #16
  106f64:	002011f0 	streqd	r1, [r0], -r0

00106f68 <_fstat>:
  106f68:	e92d4010 	stmdb	sp!, {r4, lr}
  106f6c:	e1a00001 	mov	r0, r1
  106f70:	e1a04001 	mov	r4, r1
  106f74:	e3a0203c 	mov	r2, #60	; 0x3c
  106f78:	e3a01000 	mov	r1, #0	; 0x0
  106f7c:	ebffe6b7 	bl	100a60 <memset>
  106f80:	e3a03b01 	mov	r3, #1024	; 0x400
  106f84:	e3a02a02 	mov	r2, #8192	; 0x2000
  106f88:	e3a00000 	mov	r0, #0	; 0x0
  106f8c:	e584302c 	str	r3, [r4, #44]
  106f90:	e5842004 	str	r2, [r4, #4]
  106f94:	e8bd8010 	ldmia	sp!, {r4, pc}

00106f98 <remap_handle>:
  106f98:	e59f3064 	ldr	r3, [pc, #100]	; 107004 <prog+0x6fc0>
  106f9c:	e5932000 	ldr	r2, [r3]
  106fa0:	e3520000 	cmp	r2, #0	; 0x0
  106fa4:	e92d4010 	stmdb	sp!, {r4, lr}
  106fa8:	e1a04000 	mov	r4, r0
  106fac:	0a000002 	beq	106fbc <remap_handle+0x24>
  106fb0:	e5923038 	ldr	r3, [r2, #56]
  106fb4:	e3530000 	cmp	r3, #0	; 0x0
  106fb8:	0a00000b 	beq	106fec <remap_handle+0x54>
  106fbc:	e3540000 	cmp	r4, #0	; 0x0
  106fc0:	1a000002 	bne	106fd0 <remap_handle+0x38>
  106fc4:	e59f303c 	ldr	r3, [pc, #60]	; 107008 <prog+0x6fc4>
  106fc8:	e5930000 	ldr	r0, [r3]
  106fcc:	e8bd8010 	ldmia	sp!, {r4, pc}
  106fd0:	e3540001 	cmp	r4, #1	; 0x1
  106fd4:	0a000007 	beq	106ff8 <remap_handle+0x60>
  106fd8:	e3540002 	cmp	r4, #2	; 0x2
  106fdc:	059f3028 	ldreq	r3, [pc, #40]	; 10700c <prog+0x6fc8>
  106fe0:	05930000 	ldreq	r0, [r3]
  106fe4:	12440020 	subne	r0, r4, #32	; 0x20
  106fe8:	e8bd8010 	ldmia	sp!, {r4, pc}
  106fec:	e1a00002 	mov	r0, r2
  106ff0:	ebfff6ef 	bl	104bb4 <__sinit>
  106ff4:	eafffff0 	b	106fbc <remap_handle+0x24>
  106ff8:	e59f3010 	ldr	r3, [pc, #16]	; 107010 <prog+0x6fcc>
  106ffc:	e5930000 	ldr	r0, [r3]
  107000:	e8bd8010 	ldmia	sp!, {r4, pc}
  107004:	00200410 	eoreq	r0, r0, r0, lsl r4
  107008:	00200868 	eoreq	r0, r0, r8, ror #16
  10700c:	00200870 	eoreq	r0, r0, r0, ror r8
  107010:	0020086c 	eoreq	r0, r0, ip, ror #16

00107014 <initialise_monitor_handles>:
  107014:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  107018:	e59f709c 	ldr	r7, [pc, #156]	; 1070bc <prog+0x7078>
  10701c:	e24dd00c 	sub	sp, sp, #12	; 0xc
  107020:	e3a08003 	mov	r8, #3	; 0x3
  107024:	e3a03000 	mov	r3, #0	; 0x0
  107028:	e58d7000 	str	r7, [sp]
  10702c:	e3a06001 	mov	r6, #1	; 0x1
  107030:	e58d8008 	str	r8, [sp, #8]
  107034:	e1a0500d 	mov	r5, sp
  107038:	e58d3004 	str	r3, [sp, #4]
  10703c:	e1a00006 	mov	r0, r6
  107040:	e1a0100d 	mov	r1, sp
  107044:	ef123456 	swi	0x00123456
  107048:	e1a04000 	mov	r4, r0
  10704c:	e59fa06c 	ldr	sl, [pc, #108]	; 1070c0 <prog+0x707c>
  107050:	e58a4000 	str	r4, [sl]
  107054:	e3a04004 	mov	r4, #4	; 0x4
  107058:	e58d7000 	str	r7, [sp]
  10705c:	e58d8008 	str	r8, [sp, #8]
  107060:	e58d4004 	str	r4, [sp, #4]
  107064:	e1a00006 	mov	r0, r6
  107068:	e1a0100d 	mov	r1, sp
  10706c:	ef123456 	swi	0x00123456
  107070:	e1a04000 	mov	r4, r0
  107074:	e59f3048 	ldr	r3, [pc, #72]	; 1070c4 <prog+0x7080>
  107078:	e59f2048 	ldr	r2, [pc, #72]	; 1070c8 <prog+0x7084>
  10707c:	e59f0048 	ldr	r0, [pc, #72]	; 1070cc <prog+0x7088>
  107080:	e5834000 	str	r4, [r3]
  107084:	e5824000 	str	r4, [r2]
  107088:	e3e03000 	mvn	r3, #0	; 0x0
  10708c:	e28020a0 	add	r2, r0, #160	; 0xa0
  107090:	e4803008 	str	r3, [r0], #8
  107094:	e1500002 	cmp	r0, r2
  107098:	1afffffc 	bne	107090 <initialise_monitor_handles+0x7c>
  10709c:	e59a3000 	ldr	r3, [sl]
  1070a0:	e24020a0 	sub	r2, r0, #160	; 0xa0
  1070a4:	e3a01000 	mov	r1, #0	; 0x0
  1070a8:	e50030a0 	str	r3, [r0, #-160]
  1070ac:	e582100c 	str	r1, [r2, #12]
  1070b0:	e9820012 	stmib	r2, {r1, r4}
  1070b4:	e28dd00c 	add	sp, sp, #12	; 0xc
  1070b8:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  1070bc:	0010ba20 	andeqs	fp, r0, r0, lsr #20
  1070c0:	00200868 	eoreq	r0, r0, r8, ror #16
  1070c4:	00200870 	eoreq	r0, r0, r0, ror r8
  1070c8:	0020086c 	eoreq	r0, r0, ip, ror #16
  1070cc:	00200874 	eoreq	r0, r0, r4, ror r8

001070d0 <_times>:
  1070d0:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  1070d4:	e1a05000 	mov	r5, r0
  1070d8:	e3a04010 	mov	r4, #16	; 0x10
  1070dc:	e3a06000 	mov	r6, #0	; 0x0
  1070e0:	e1a00004 	mov	r0, r4
  1070e4:	e1a01006 	mov	r1, r6
  1070e8:	ef123456 	swi	0x00123456
  1070ec:	e1a04000 	mov	r4, r0
  1070f0:	e1550006 	cmp	r5, r6
  1070f4:	e1a00004 	mov	r0, r4
  1070f8:	1585600c 	strne	r6, [r5, #12]
  1070fc:	15854000 	strne	r4, [r5]
  107100:	15856004 	strne	r6, [r5, #4]
  107104:	15856008 	strne	r6, [r5, #8]
  107108:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

0010710c <_gettimeofday>:
  10710c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  107110:	e2507000 	subs	r7, r0, #0	; 0x0
  107114:	e1a06001 	mov	r6, r1
  107118:	0a000007 	beq	10713c <_gettimeofday+0x30>
  10711c:	e3a05011 	mov	r5, #17	; 0x11
  107120:	e3a04000 	mov	r4, #0	; 0x0
  107124:	e1a00005 	mov	r0, r5
  107128:	e1a01004 	mov	r1, r4
  10712c:	ef123456 	swi	0x00123456
  107130:	e1a05000 	mov	r5, r0
  107134:	e5874004 	str	r4, [r7, #4]
  107138:	e5875000 	str	r5, [r7]
  10713c:	e3a03000 	mov	r3, #0	; 0x0
  107140:	e1560003 	cmp	r6, r3
  107144:	e3a00000 	mov	r0, #0	; 0x0
  107148:	15863004 	strne	r3, [r6, #4]
  10714c:	15863000 	strne	r3, [r6]
  107150:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00107154 <_kill>:
  107154:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  107158:	e3a05802 	mov	r5, #131072	; 0x20000
  10715c:	e2855026 	add	r5, r5, #38	; 0x26
  107160:	e3a04018 	mov	r4, #24	; 0x18
  107164:	e1a00004 	mov	r0, r4
  107168:	e1a01005 	mov	r1, r5
  10716c:	ef123456 	swi	0x00123456
  107170:	e1a04000 	mov	r4, r0
  107174:	e1a00004 	mov	r0, r4
  107178:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

0010717c <_exit>:
  10717c:	e3a05802 	mov	r5, #131072	; 0x20000
  107180:	e2855026 	add	r5, r5, #38	; 0x26
  107184:	e3a04018 	mov	r4, #24	; 0x18
  107188:	e1a00004 	mov	r0, r4
  10718c:	e1a01005 	mov	r1, r5
  107190:	ef123456 	swi	0x00123456
  107194:	e1a04000 	mov	r4, r0
  107198:	e12fff1e 	bx	lr

0010719c <_swiclose>:
  10719c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1071a0:	e24dd004 	sub	sp, sp, #4	; 0x4
  1071a4:	ebffff7b 	bl	106f98 <remap_handle>
  1071a8:	e58d0000 	str	r0, [sp]
  1071ac:	ebffff35 	bl	106e88 <findslot>
  1071b0:	e3500014 	cmp	r0, #20	; 0x14
  1071b4:	159f3028 	ldrne	r3, [pc, #40]	; 1071e4 <prog+0x71a0>
  1071b8:	13e02000 	mvnne	r2, #0	; 0x0
  1071bc:	17832180 	strne	r2, [r3, r0, lsl #3]
  1071c0:	e3a04002 	mov	r4, #2	; 0x2
  1071c4:	e1a0500d 	mov	r5, sp
  1071c8:	e1a00004 	mov	r0, r4
  1071cc:	e1a0100d 	mov	r1, sp
  1071d0:	ef123456 	swi	0x00123456
  1071d4:	e1a04000 	mov	r4, r0
  1071d8:	e1a00004 	mov	r0, r4
  1071dc:	e28dd004 	add	sp, sp, #4	; 0x4
  1071e0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1071e4:	00200874 	eoreq	r0, r0, r4, ror r8

001071e8 <_swiwrite>:
  1071e8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1071ec:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1071f0:	e1a04001 	mov	r4, r1
  1071f4:	e1a05002 	mov	r5, r2
  1071f8:	ebffff66 	bl	106f98 <remap_handle>
  1071fc:	e88d0031 	stmia	sp, {r0, r4, r5}
  107200:	e3a04005 	mov	r4, #5	; 0x5
  107204:	e1a0500d 	mov	r5, sp
  107208:	e1a00004 	mov	r0, r4
  10720c:	e1a0100d 	mov	r1, sp
  107210:	ef123456 	swi	0x00123456
  107214:	e1a04000 	mov	r4, r0
  107218:	e1a00004 	mov	r0, r4
  10721c:	e28dd00c 	add	sp, sp, #12	; 0xc
  107220:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107224 <_swilseek>:
  107224:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  107228:	e24dd008 	sub	sp, sp, #8	; 0x8
  10722c:	e1a04002 	mov	r4, r2
  107230:	e1a05001 	mov	r5, r1
  107234:	e1a08000 	mov	r8, r0
  107238:	ebffff56 	bl	106f98 <remap_handle>
  10723c:	e1a07000 	mov	r7, r0
  107240:	ebffff10 	bl	106e88 <findslot>
  107244:	e3540001 	cmp	r4, #1	; 0x1
  107248:	e1a06000 	mov	r6, r0
  10724c:	0a00001a 	beq	1072bc <_swilseek+0x98>
  107250:	e3540002 	cmp	r4, #2	; 0x2
  107254:	11a0700d 	movne	r7, sp
  107258:	0a00001f 	beq	1072dc <_swilseek+0xb8>
  10725c:	e1a00008 	mov	r0, r8
  107260:	ebffff4c 	bl	106f98 <remap_handle>
  107264:	e3a0400a 	mov	r4, #10	; 0xa
  107268:	e88d0021 	stmia	sp, {r0, r5}
  10726c:	e1a00004 	mov	r0, r4
  107270:	e1a01007 	mov	r1, r7
  107274:	ef123456 	swi	0x00123456
  107278:	e1a04000 	mov	r4, r0
  10727c:	e2744001 	rsbs	r4, r4, #1	; 0x1
  107280:	33a04000 	movcc	r4, #0	; 0x0
  107284:	e3560014 	cmp	r6, #20	; 0x14
  107288:	03a03000 	moveq	r3, #0	; 0x0
  10728c:	12043001 	andne	r3, r4, #1	; 0x1
  107290:	e3530000 	cmp	r3, #0	; 0x0
  107294:	159f3064 	ldrne	r3, [pc, #100]	; 107300 <prog+0x72bc>
  107298:	10833186 	addne	r3, r3, r6, lsl #3
  10729c:	15835004 	strne	r5, [r3, #4]
  1072a0:	e3540000 	cmp	r4, #0	; 0x0
  1072a4:	0a000002 	beq	1072b4 <_swilseek+0x90>
  1072a8:	e1a00005 	mov	r0, r5
  1072ac:	e28dd008 	add	sp, sp, #8	; 0x8
  1072b0:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1072b4:	e3e05000 	mvn	r5, #0	; 0x0
  1072b8:	eafffffa 	b	1072a8 <_swilseek+0x84>
  1072bc:	e3500014 	cmp	r0, #20	; 0x14
  1072c0:	0afffffb 	beq	1072b4 <_swilseek+0x90>
  1072c4:	e59f3034 	ldr	r3, [pc, #52]	; 107300 <prog+0x72bc>
  1072c8:	e0833180 	add	r3, r3, r0, lsl #3
  1072cc:	e5932004 	ldr	r2, [r3, #4]
  1072d0:	e1a0700d 	mov	r7, sp
  1072d4:	e0855002 	add	r5, r5, r2
  1072d8:	eaffffdf 	b	10725c <_swilseek+0x38>
  1072dc:	e58d7000 	str	r7, [sp]
  1072e0:	e284400a 	add	r4, r4, #10	; 0xa
  1072e4:	e1a0700d 	mov	r7, sp
  1072e8:	e1a00004 	mov	r0, r4
  1072ec:	e1a0100d 	mov	r1, sp
  1072f0:	ef123456 	swi	0x00123456
  1072f4:	e1a04000 	mov	r4, r0
  1072f8:	e0855004 	add	r5, r5, r4
  1072fc:	eaffffd6 	b	10725c <_swilseek+0x38>
  107300:	00200874 	eoreq	r0, r0, r4, ror r8

00107304 <error>:
  107304:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  107308:	e1a07000 	mov	r7, r0
  10730c:	eb0000c7 	bl	107630 <__errno>
  107310:	e3a04013 	mov	r4, #19	; 0x13
  107314:	e1a06000 	mov	r6, r0
  107318:	e3a05000 	mov	r5, #0	; 0x0
  10731c:	e1a00004 	mov	r0, r4
  107320:	e1a01005 	mov	r1, r5
  107324:	ef123456 	swi	0x00123456
  107328:	e1a04000 	mov	r4, r0
  10732c:	e1a00007 	mov	r0, r7
  107330:	e5864000 	str	r4, [r6]
  107334:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00107338 <_swiopen>:
  107338:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10733c:	e1a07000 	mov	r7, r0
  107340:	e24dd00c 	sub	sp, sp, #12	; 0xc
  107344:	e3e00000 	mvn	r0, #0	; 0x0
  107348:	e1a05001 	mov	r5, r1
  10734c:	ebfffecd 	bl	106e88 <findslot>
  107350:	e3500014 	cmp	r0, #20	; 0x14
  107354:	e1a06000 	mov	r6, r0
  107358:	03e00000 	mvneq	r0, #0	; 0x0
  10735c:	0a000019 	beq	1073c8 <_swiopen+0x90>
  107360:	e2054002 	and	r4, r5, #2	; 0x2
  107364:	e3150c02 	tst	r5, #512	; 0x200
  107368:	13844004 	orrne	r4, r4, #4	; 0x4
  10736c:	e3150b01 	tst	r5, #1024	; 0x400
  107370:	13844004 	orrne	r4, r4, #4	; 0x4
  107374:	e3150008 	tst	r5, #8	; 0x8
  107378:	13c43004 	bicne	r3, r4, #4	; 0x4
  10737c:	e1a00007 	mov	r0, r7
  107380:	13834008 	orrne	r4, r3, #8	; 0x8
  107384:	e58d7000 	str	r7, [sp]
  107388:	ebffe613 	bl	100bdc <strlen>
  10738c:	e3a05001 	mov	r5, #1	; 0x1
  107390:	e58d4004 	str	r4, [sp, #4]
  107394:	e58d0008 	str	r0, [sp, #8]
  107398:	e1a00005 	mov	r0, r5
  10739c:	e1a0100d 	mov	r1, sp
  1073a0:	ef123456 	swi	0x00123456
  1073a4:	e1a04000 	mov	r4, r0
  1073a8:	e3540000 	cmp	r4, #0	; 0x0
  1073ac:	ba000007 	blt	1073d0 <_swiopen+0x98>
  1073b0:	e59f1024 	ldr	r1, [pc, #36]	; 1073dc <prog+0x7398>
  1073b4:	e3a03000 	mov	r3, #0	; 0x0
  1073b8:	e0812186 	add	r2, r1, r6, lsl #3
  1073bc:	e5823004 	str	r3, [r2, #4]
  1073c0:	e7814186 	str	r4, [r1, r6, lsl #3]
  1073c4:	e2840020 	add	r0, r4, #32	; 0x20
  1073c8:	e28dd00c 	add	sp, sp, #12	; 0xc
  1073cc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1073d0:	e1a00004 	mov	r0, r4
  1073d4:	ebffffca 	bl	107304 <error>
  1073d8:	eafffffa 	b	1073c8 <_swiopen+0x90>
  1073dc:	00200874 	eoreq	r0, r0, r4, ror r8

001073e0 <_write>:
  1073e0:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  1073e4:	e1a06002 	mov	r6, r2
  1073e8:	e1a05001 	mov	r5, r1
  1073ec:	e1a04000 	mov	r4, r0
  1073f0:	ebfffee8 	bl	106f98 <remap_handle>
  1073f4:	ebfffea3 	bl	106e88 <findslot>
  1073f8:	e1a02006 	mov	r2, r6
  1073fc:	e1a07000 	mov	r7, r0
  107400:	e1a01005 	mov	r1, r5
  107404:	e1a00004 	mov	r0, r4
  107408:	ebffff76 	bl	1071e8 <_swiwrite>
  10740c:	e1a02000 	mov	r2, r0
  107410:	e3e00000 	mvn	r0, #0	; 0x0
  107414:	e1520000 	cmp	r2, r0
  107418:	11560002 	cmpne	r6, r2
  10741c:	0a000008 	beq	107444 <_write+0x64>
  107420:	e59f3024 	ldr	r3, [pc, #36]	; 10744c <prog+0x7408>
  107424:	e3570014 	cmp	r7, #20	; 0x14
  107428:	e0831187 	add	r1, r3, r7, lsl #3
  10742c:	e0620006 	rsb	r0, r2, r6
  107430:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
  107434:	e5913004 	ldr	r3, [r1, #4]
  107438:	e0833000 	add	r3, r3, r0
  10743c:	e5813004 	str	r3, [r1, #4]
  107440:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  107444:	e8bd40f0 	ldmia	sp!, {r4, r5, r6, r7, lr}
  107448:	eaffffad 	b	107304 <error>
  10744c:	00200874 	eoreq	r0, r0, r4, ror r8

00107450 <wrap>:
  107450:	e3700001 	cmn	r0, #1	; 0x1
  107454:	112fff1e 	bxne	lr
  107458:	eaffffa9 	b	107304 <error>

0010745c <_close>:
  10745c:	e52de004 	str	lr, [sp, #-4]!
  107460:	ebffff4d 	bl	10719c <_swiclose>
  107464:	e49de004 	ldr	lr, [sp], #4
  107468:	eafffff8 	b	107450 <wrap>

0010746c <_open>:
  10746c:	e92d000e 	stmdb	sp!, {r1, r2, r3}
  107470:	e52de004 	str	lr, [sp, #-4]!
  107474:	e59d1004 	ldr	r1, [sp, #4]
  107478:	ebffffae 	bl	107338 <_swiopen>
  10747c:	ebfffff3 	bl	107450 <wrap>
  107480:	e49de004 	ldr	lr, [sp], #4
  107484:	e28dd00c 	add	sp, sp, #12	; 0xc
  107488:	e12fff1e 	bx	lr

0010748c <_stat>:
  10748c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  107490:	e1a04001 	mov	r4, r1
  107494:	e3a01000 	mov	r1, #0	; 0x0
  107498:	ebfffff3 	bl	10746c <_open>
  10749c:	e2505000 	subs	r5, r0, #0	; 0x0
  1074a0:	e3a01000 	mov	r1, #0	; 0x0
  1074a4:	e3a0203c 	mov	r2, #60	; 0x3c
  1074a8:	e1a00004 	mov	r0, r4
  1074ac:	e3e03000 	mvn	r3, #0	; 0x0
  1074b0:	ba000007 	blt	1074d4 <_stat+0x48>
  1074b4:	ebffe569 	bl	100a60 <memset>
  1074b8:	e3a03b01 	mov	r3, #1024	; 0x400
  1074bc:	e3a02c81 	mov	r2, #33024	; 0x8100
  1074c0:	e584302c 	str	r3, [r4, #44]
  1074c4:	e5842004 	str	r2, [r4, #4]
  1074c8:	e1a00005 	mov	r0, r5
  1074cc:	ebffff32 	bl	10719c <_swiclose>
  1074d0:	e3a03000 	mov	r3, #0	; 0x0
  1074d4:	e1a00003 	mov	r0, r3
  1074d8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

001074dc <_lseek>:
  1074dc:	e52de004 	str	lr, [sp, #-4]!
  1074e0:	ebffff4f 	bl	107224 <_swilseek>
  1074e4:	e49de004 	ldr	lr, [sp], #4
  1074e8:	eaffffd8 	b	107450 <wrap>

001074ec <_swiread>:
  1074ec:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1074f0:	e24dd00c 	sub	sp, sp, #12	; 0xc
  1074f4:	e1a04001 	mov	r4, r1
  1074f8:	e1a05002 	mov	r5, r2
  1074fc:	ebfffea5 	bl	106f98 <remap_handle>
  107500:	e88d0031 	stmia	sp, {r0, r4, r5}
  107504:	e3a04006 	mov	r4, #6	; 0x6
  107508:	e1a0500d 	mov	r5, sp
  10750c:	e1a00004 	mov	r0, r4
  107510:	e1a0100d 	mov	r1, sp
  107514:	ef123456 	swi	0x00123456
  107518:	e1a04000 	mov	r4, r0
  10751c:	e1a00004 	mov	r0, r4
  107520:	e28dd00c 	add	sp, sp, #12	; 0xc
  107524:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107528 <_read>:
  107528:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10752c:	e1a06002 	mov	r6, r2
  107530:	e1a05001 	mov	r5, r1
  107534:	e1a04000 	mov	r4, r0
  107538:	ebfffe96 	bl	106f98 <remap_handle>
  10753c:	ebfffe51 	bl	106e88 <findslot>
  107540:	e1a01005 	mov	r1, r5
  107544:	e1a07000 	mov	r7, r0
  107548:	e1a02006 	mov	r2, r6
  10754c:	e1a00004 	mov	r0, r4
  107550:	ebffffe5 	bl	1074ec <_swiread>
  107554:	e2501000 	subs	r1, r0, #0	; 0x0
  107558:	e3e00000 	mvn	r0, #0	; 0x0
  10755c:	ba000008 	blt	107584 <_read+0x5c>
  107560:	e59f3024 	ldr	r3, [pc, #36]	; 10758c <prog+0x7548>
  107564:	e3570014 	cmp	r7, #20	; 0x14
  107568:	e0832187 	add	r2, r3, r7, lsl #3
  10756c:	e0610006 	rsb	r0, r1, r6
  107570:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
  107574:	e5923004 	ldr	r3, [r2, #4]
  107578:	e0833000 	add	r3, r3, r0
  10757c:	e5823004 	str	r3, [r2, #4]
  107580:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  107584:	e8bd40f0 	ldmia	sp!, {r4, r5, r6, r7, lr}
  107588:	eaffff5d 	b	107304 <error>
  10758c:	00200874 	eoreq	r0, r0, r4, ror r8

00107590 <_calloc_r>:
  107590:	e92d4010 	stmdb	sp!, {r4, lr}
  107594:	e0010192 	mul	r1, r2, r1
  107598:	ebffe32c 	bl	100250 <_malloc_r>
  10759c:	e2504000 	subs	r4, r0, #0	; 0x0
  1075a0:	0a00000f 	beq	1075e4 <_calloc_r+0x54>
  1075a4:	e5143004 	ldr	r3, [r4, #-4]
  1075a8:	e3c33003 	bic	r3, r3, #3	; 0x3
  1075ac:	e2433004 	sub	r3, r3, #4	; 0x4
  1075b0:	e3a0c000 	mov	ip, #0	; 0x0
  1075b4:	e3530024 	cmp	r3, #36	; 0x24
  1075b8:	e1a02003 	mov	r2, r3
  1075bc:	e1a0100c 	mov	r1, ip
  1075c0:	8a000017 	bhi	107624 <_calloc_r+0x94>
  1075c4:	e3530013 	cmp	r3, #19	; 0x13
  1075c8:	e1a01004 	mov	r1, r4
  1075cc:	e1a02004 	mov	r2, r4
  1075d0:	8a000005 	bhi	1075ec <_calloc_r+0x5c>
  1075d4:	e1a03002 	mov	r3, r2
  1075d8:	e483c004 	str	ip, [r3], #4
  1075dc:	e582c004 	str	ip, [r2, #4]
  1075e0:	e583c004 	str	ip, [r3, #4]
  1075e4:	e1a00004 	mov	r0, r4
  1075e8:	e8bd8010 	ldmia	sp!, {r4, pc}
  1075ec:	e481c004 	str	ip, [r1], #4
  1075f0:	e353001b 	cmp	r3, #27	; 0x1b
  1075f4:	e2812004 	add	r2, r1, #4	; 0x4
  1075f8:	e584c004 	str	ip, [r4, #4]
  1075fc:	e282e004 	add	lr, r2, #4	; 0x4
  107600:	9afffff3 	bls	1075d4 <_calloc_r+0x44>
  107604:	e3530024 	cmp	r3, #36	; 0x24
  107608:	e581c004 	str	ip, [r1, #4]
  10760c:	e582c004 	str	ip, [r2, #4]
  107610:	e28e2004 	add	r2, lr, #4	; 0x4
  107614:	058ec004 	streq	ip, [lr, #4]
  107618:	0582c004 	streq	ip, [r2, #4]
  10761c:	02822008 	addeq	r2, r2, #8	; 0x8
  107620:	eaffffeb 	b	1075d4 <_calloc_r+0x44>
  107624:	ebffe50d 	bl	100a60 <memset>
  107628:	e1a00004 	mov	r0, r4
  10762c:	e8bd8010 	ldmia	sp!, {r4, pc}

00107630 <__errno>:
  107630:	e59f3004 	ldr	r3, [pc, #4]	; 10763c <prog+0x75f8>
  107634:	e5930000 	ldr	r0, [r3]
  107638:	e12fff1e 	bx	lr
  10763c:	00200410 	eoreq	r0, r0, r0, lsl r4

00107640 <_fclose_r>:
  107640:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  107644:	e2515000 	subs	r5, r1, #0	; 0x0
  107648:	e1a06000 	mov	r6, r0
  10764c:	01a04005 	moveq	r4, r5
  107650:	0a00002b 	beq	107704 <_fclose_r+0xc4>
  107654:	ebfff552 	bl	104ba4 <__sfp_lock_acquire>
  107658:	e3560000 	cmp	r6, #0	; 0x0
  10765c:	0a000002 	beq	10766c <_fclose_r+0x2c>
  107660:	e5963038 	ldr	r3, [r6, #56]
  107664:	e3530000 	cmp	r3, #0	; 0x0
  107668:	0a000027 	beq	10770c <_fclose_r+0xcc>
  10766c:	e1d540bc 	ldrh	r4, [r5, #12]
  107670:	e3540000 	cmp	r4, #0	; 0x0
  107674:	0a000021 	beq	107700 <_fclose_r+0xc0>
  107678:	e2140008 	ands	r0, r4, #8	; 0x8
  10767c:	1a000025 	bne	107718 <_fclose_r+0xd8>
  107680:	e595302c 	ldr	r3, [r5, #44]
  107684:	e3530000 	cmp	r3, #0	; 0x0
  107688:	e1a04000 	mov	r4, r0
  10768c:	0a000004 	beq	1076a4 <_fclose_r+0x64>
  107690:	e595001c 	ldr	r0, [r5, #28]
  107694:	e1a0e00f 	mov	lr, pc
  107698:	e12fff13 	bx	r3
  10769c:	e3500000 	cmp	r0, #0	; 0x0
  1076a0:	b3e04000 	mvnlt	r4, #0	; 0x0
  1076a4:	e1d530bc 	ldrh	r3, [r5, #12]
  1076a8:	e3130080 	tst	r3, #128	; 0x80
  1076ac:	1a000020 	bne	107734 <_fclose_r+0xf4>
  1076b0:	e5951030 	ldr	r1, [r5, #48]
  1076b4:	e3510000 	cmp	r1, #0	; 0x0
  1076b8:	0a000006 	beq	1076d8 <_fclose_r+0x98>
  1076bc:	e2853040 	add	r3, r5, #64	; 0x40
  1076c0:	e1510003 	cmp	r1, r3
  1076c4:	159f3084 	ldrne	r3, [pc, #132]	; 107750 <prog+0x770c>
  1076c8:	15930000 	ldrne	r0, [r3]
  1076cc:	1bfff5fb 	blne	104ec0 <_free_r>
  1076d0:	e3a03000 	mov	r3, #0	; 0x0
  1076d4:	e5853030 	str	r3, [r5, #48]
  1076d8:	e5951044 	ldr	r1, [r5, #68]
  1076dc:	e3510000 	cmp	r1, #0	; 0x0
  1076e0:	0a000004 	beq	1076f8 <_fclose_r+0xb8>
  1076e4:	e59f3064 	ldr	r3, [pc, #100]	; 107750 <prog+0x770c>
  1076e8:	e5930000 	ldr	r0, [r3]
  1076ec:	ebfff5f3 	bl	104ec0 <_free_r>
  1076f0:	e3a03000 	mov	r3, #0	; 0x0
  1076f4:	e5853044 	str	r3, [r5, #68]
  1076f8:	e3a03000 	mov	r3, #0	; 0x0
  1076fc:	e1c530bc 	strh	r3, [r5, #12]
  107700:	ebfff528 	bl	104ba8 <__sfp_lock_release>
  107704:	e1a00004 	mov	r0, r4
  107708:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  10770c:	e1a00006 	mov	r0, r6
  107710:	ebfff527 	bl	104bb4 <__sinit>
  107714:	eaffffd4 	b	10766c <_fclose_r+0x2c>
  107718:	e1a00005 	mov	r0, r5
  10771c:	ebfff4d1 	bl	104a68 <fflush>
  107720:	e595302c 	ldr	r3, [r5, #44]
  107724:	e3530000 	cmp	r3, #0	; 0x0
  107728:	e1a04000 	mov	r4, r0
  10772c:	1affffd7 	bne	107690 <_fclose_r+0x50>
  107730:	eaffffdb 	b	1076a4 <_fclose_r+0x64>
  107734:	e5951010 	ldr	r1, [r5, #16]
  107738:	e1a00006 	mov	r0, r6
  10773c:	ebfff5df 	bl	104ec0 <_free_r>
  107740:	e5951030 	ldr	r1, [r5, #48]
  107744:	e3510000 	cmp	r1, #0	; 0x0
  107748:	1affffdb 	bne	1076bc <_fclose_r+0x7c>
  10774c:	eaffffe1 	b	1076d8 <_fclose_r+0x98>
  107750:	00200410 	eoreq	r0, r0, r0, lsl r4

00107754 <fclose>:
  107754:	e59f3008 	ldr	r3, [pc, #8]	; 107764 <prog+0x7720>
  107758:	e1a01000 	mov	r1, r0
  10775c:	e5930000 	ldr	r0, [r3]
  107760:	eaffffb6 	b	107640 <_fclose_r>
  107764:	00200410 	eoreq	r0, r0, r0, lsl r4

00107768 <nan>:
  107768:	e59f0000 	ldr	r0, [pc, #0]	; 107770 <prog+0x772c>
  10776c:	e12fff1e 	bx	lr
  107770:	0010b828 	andeqs	fp, r0, r8, lsr #16

00107774 <isnan>:
  107774:	e5900000 	ldr	r0, [r0]
  107778:	e3500001 	cmp	r0, #1	; 0x1
  10777c:	83a00000 	movhi	r0, #0	; 0x0
  107780:	93a00001 	movls	r0, #1	; 0x1
  107784:	e12fff1e 	bx	lr

00107788 <isinf>:
  107788:	e5900000 	ldr	r0, [r0]
  10778c:	e3500004 	cmp	r0, #4	; 0x4
  107790:	13a00000 	movne	r0, #0	; 0x0
  107794:	03a00001 	moveq	r0, #1	; 0x1
  107798:	e12fff1e 	bx	lr

0010779c <iszero>:
  10779c:	e5900000 	ldr	r0, [r0]
  1077a0:	e3500002 	cmp	r0, #2	; 0x2
  1077a4:	13a00000 	movne	r0, #0	; 0x0
  1077a8:	03a00001 	moveq	r0, #1	; 0x1
  1077ac:	e12fff1e 	bx	lr

001077b0 <_fpadd_parts>:
  1077b0:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1077b4:	e24dd004 	sub	sp, sp, #4	; 0x4
  1077b8:	e1a07001 	mov	r7, r1
  1077bc:	e1a06002 	mov	r6, r2
  1077c0:	e1a05000 	mov	r5, r0
  1077c4:	ebffffea 	bl	107774 <isnan>
  1077c8:	e3500000 	cmp	r0, #0	; 0x0
  1077cc:	0a000002 	beq	1077dc <_fpadd_parts+0x2c>
  1077d0:	e1a00005 	mov	r0, r5
  1077d4:	e28dd004 	add	sp, sp, #4	; 0x4
  1077d8:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1077dc:	e1a00007 	mov	r0, r7
  1077e0:	ebffffe3 	bl	107774 <isnan>
  1077e4:	e3500000 	cmp	r0, #0	; 0x0
  1077e8:	0a000001 	beq	1077f4 <_fpadd_parts+0x44>
  1077ec:	e1a05007 	mov	r5, r7
  1077f0:	eafffff6 	b	1077d0 <_fpadd_parts+0x20>
  1077f4:	e1a00005 	mov	r0, r5
  1077f8:	ebffffe2 	bl	107788 <isinf>
  1077fc:	e3500000 	cmp	r0, #0	; 0x0
  107800:	1a000068 	bne	1079a8 <_fpadd_parts+0x1f8>
  107804:	e1a00007 	mov	r0, r7
  107808:	ebffffde 	bl	107788 <isinf>
  10780c:	e3500000 	cmp	r0, #0	; 0x0
  107810:	1afffff5 	bne	1077ec <_fpadd_parts+0x3c>
  107814:	e1a00007 	mov	r0, r7
  107818:	ebffffdf 	bl	10779c <iszero>
  10781c:	e3500000 	cmp	r0, #0	; 0x0
  107820:	1a00006b 	bne	1079d4 <_fpadd_parts+0x224>
  107824:	e1a00005 	mov	r0, r5
  107828:	ebffffdb 	bl	10779c <iszero>
  10782c:	e3500000 	cmp	r0, #0	; 0x0
  107830:	1affffed 	bne	1077ec <_fpadd_parts+0x3c>
  107834:	e5953008 	ldr	r3, [r5, #8]
  107838:	e597c008 	ldr	ip, [r7, #8]
  10783c:	e06ce003 	rsb	lr, ip, r3
  107840:	e58d3000 	str	r3, [sp]
  107844:	e02e3fce 	eor	r3, lr, lr, asr #31
  107848:	e0433fce 	sub	r3, r3, lr, asr #31
  10784c:	e353003f 	cmp	r3, #63	; 0x3f
  107850:	e285a00c 	add	sl, r5, #12	; 0xc
  107854:	e89a0c00 	ldmia	sl, {sl, fp}
  107858:	e287800c 	add	r8, r7, #12	; 0xc
  10785c:	e8980300 	ldmia	r8, {r8, r9}
  107860:	ca000081 	bgt	107a6c <_fpadd_parts+0x2bc>
  107864:	e59d4000 	ldr	r4, [sp]
  107868:	e154000c 	cmp	r4, ip
  10786c:	da00000b 	ble	1078a0 <_fpadd_parts+0xf0>
  107870:	e2800001 	add	r0, r0, #1	; 0x1
  107874:	e3a03001 	mov	r3, #1	; 0x1
  107878:	e3a04000 	mov	r4, #0	; 0x0
  10787c:	e1b020a9 	movs	r2, r9, lsr #1
  107880:	e1a01068 	mov	r1, r8, rrx
  107884:	e0088003 	and	r8, r8, r3
  107888:	e0099004 	and	r9, r9, r4
  10788c:	e150000e 	cmp	r0, lr
  107890:	e1888001 	orr	r8, r8, r1
  107894:	e1899002 	orr	r9, r9, r2
  107898:	1afffff4 	bne	107870 <_fpadd_parts+0xc0>
  10789c:	e08cc000 	add	ip, ip, r0
  1078a0:	e59d4000 	ldr	r4, [sp]
  1078a4:	e154000c 	cmp	r4, ip
  1078a8:	aa00000f 	bge	1078ec <_fpadd_parts+0x13c>
  1078ac:	e064c00c 	rsb	ip, r4, ip
  1078b0:	e3a00000 	mov	r0, #0	; 0x0
  1078b4:	e2800001 	add	r0, r0, #1	; 0x1
  1078b8:	e3a03001 	mov	r3, #1	; 0x1
  1078bc:	e3a04000 	mov	r4, #0	; 0x0
  1078c0:	e1b020ab 	movs	r2, fp, lsr #1
  1078c4:	e1a0106a 	mov	r1, sl, rrx
  1078c8:	e00aa003 	and	sl, sl, r3
  1078cc:	e00bb004 	and	fp, fp, r4
  1078d0:	e15c0000 	cmp	ip, r0
  1078d4:	e18aa001 	orr	sl, sl, r1
  1078d8:	e18bb002 	orr	fp, fp, r2
  1078dc:	1afffff4 	bne	1078b4 <_fpadd_parts+0x104>
  1078e0:	e59d4000 	ldr	r4, [sp]
  1078e4:	e0844000 	add	r4, r4, r0
  1078e8:	e58d4000 	str	r4, [sp]
  1078ec:	e5950004 	ldr	r0, [r5, #4]
  1078f0:	e5973004 	ldr	r3, [r7, #4]
  1078f4:	e1500003 	cmp	r0, r3
  1078f8:	0a000068 	beq	107aa0 <_fpadd_parts+0x2f0>
  1078fc:	e3500000 	cmp	r0, #0	; 0x0
  107900:	0a000061 	beq	107a8c <_fpadd_parts+0x2dc>
  107904:	e1a01008 	mov	r1, r8
  107908:	e1a02009 	mov	r2, r9
  10790c:	e051100a 	subs	r1, r1, sl
  107910:	e0c2200b 	sbc	r2, r2, fp
  107914:	e3520000 	cmp	r2, #0	; 0x0
  107918:	ba000067 	blt	107abc <_fpadd_parts+0x30c>
  10791c:	e586100c 	str	r1, [r6, #12]
  107920:	e5862010 	str	r2, [r6, #16]
  107924:	e59d4000 	ldr	r4, [sp]
  107928:	e3a03000 	mov	r3, #0	; 0x0
  10792c:	e9860018 	stmib	r6, {r3, r4}
  107930:	e286100c 	add	r1, r6, #12	; 0xc
  107934:	e8910006 	ldmia	r1, {r1, r2}
  107938:	e3e07000 	mvn	r7, #0	; 0x0
  10793c:	e0977001 	adds	r7, r7, r1
  107940:	e3e08000 	mvn	r8, #0	; 0x0
  107944:	e0a88002 	adc	r8, r8, r2
  107948:	e378021f 	cmn	r8, #-268435455	; 0xf0000001
  10794c:	e1a0a001 	mov	sl, r1
  107950:	e1a0b002 	mov	fp, r2
  107954:	8a000030 	bhi	107a1c <_fpadd_parts+0x26c>
  107958:	0a00002d 	beq	107a14 <_fpadd_parts+0x264>
  10795c:	e5963008 	ldr	r3, [r6, #8]
  107960:	e09a100a 	adds	r1, sl, sl
  107964:	e3e07000 	mvn	r7, #0	; 0x0
  107968:	e0ab200b 	adc	r2, fp, fp
  10796c:	e3e08000 	mvn	r8, #0	; 0x0
  107970:	e0977001 	adds	r7, r7, r1
  107974:	e0a88002 	adc	r8, r8, r2
  107978:	e2433001 	sub	r3, r3, #1	; 0x1
  10797c:	e378021f 	cmn	r8, #-268435455	; 0xf0000001
  107980:	e586100c 	str	r1, [r6, #12]
  107984:	e5862010 	str	r2, [r6, #16]
  107988:	e5863008 	str	r3, [r6, #8]
  10798c:	e1a0a001 	mov	sl, r1
  107990:	e1a0b002 	mov	fp, r2
  107994:	8a000020 	bhi	107a1c <_fpadd_parts+0x26c>
  107998:	1afffff0 	bne	107960 <_fpadd_parts+0x1b0>
  10799c:	e3770002 	cmn	r7, #2	; 0x2
  1079a0:	8a00001d 	bhi	107a1c <_fpadd_parts+0x26c>
  1079a4:	eaffffed 	b	107960 <_fpadd_parts+0x1b0>
  1079a8:	e1a00007 	mov	r0, r7
  1079ac:	ebffff75 	bl	107788 <isinf>
  1079b0:	e3500000 	cmp	r0, #0	; 0x0
  1079b4:	0affff85 	beq	1077d0 <_fpadd_parts+0x20>
  1079b8:	e5972004 	ldr	r2, [r7, #4]
  1079bc:	e5953004 	ldr	r3, [r5, #4]
  1079c0:	e1530002 	cmp	r3, r2
  1079c4:	0affff81 	beq	1077d0 <_fpadd_parts+0x20>
  1079c8:	e28dd004 	add	sp, sp, #4	; 0x4
  1079cc:	e8bd4ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  1079d0:	eaffff64 	b	107768 <nan>
  1079d4:	e1a00005 	mov	r0, r5
  1079d8:	ebffff6f 	bl	10779c <iszero>
  1079dc:	e3500000 	cmp	r0, #0	; 0x0
  1079e0:	0affff7a 	beq	1077d0 <_fpadd_parts+0x20>
  1079e4:	e1a0c005 	mov	ip, r5
  1079e8:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  1079ec:	e1a0e006 	mov	lr, r6
  1079f0:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
  1079f4:	e5953010 	ldr	r3, [r5, #16]
  1079f8:	e5863010 	str	r3, [r6, #16]
  1079fc:	e5952004 	ldr	r2, [r5, #4]
  107a00:	e5973004 	ldr	r3, [r7, #4]
  107a04:	e1a05006 	mov	r5, r6
  107a08:	e0022003 	and	r2, r2, r3
  107a0c:	e5862004 	str	r2, [r6, #4]
  107a10:	eaffff6e 	b	1077d0 <_fpadd_parts+0x20>
  107a14:	e3770002 	cmn	r7, #2	; 0x2
  107a18:	9affffcf 	bls	10795c <_fpadd_parts+0x1ac>
  107a1c:	e372021e 	cmn	r2, #-536870911	; 0xe0000001
  107a20:	e3a03003 	mov	r3, #3	; 0x3
  107a24:	e5863000 	str	r3, [r6]
  107a28:	91a05006 	movls	r5, r6
  107a2c:	9affff67 	bls	1077d0 <_fpadd_parts+0x20>
  107a30:	e5960008 	ldr	r0, [r6, #8]
  107a34:	e3a03001 	mov	r3, #1	; 0x1
  107a38:	e3a04000 	mov	r4, #0	; 0x0
  107a3c:	e1b080a2 	movs	r8, r2, lsr #1
  107a40:	e1a07061 	mov	r7, r1, rrx
  107a44:	e0011003 	and	r1, r1, r3
  107a48:	e0022004 	and	r2, r2, r4
  107a4c:	e1877001 	orr	r7, r7, r1
  107a50:	e1888002 	orr	r8, r8, r2
  107a54:	e2800001 	add	r0, r0, #1	; 0x1
  107a58:	e1a05006 	mov	r5, r6
  107a5c:	e586700c 	str	r7, [r6, #12]
  107a60:	e5868010 	str	r8, [r6, #16]
  107a64:	e5860008 	str	r0, [r6, #8]
  107a68:	eaffff58 	b	1077d0 <_fpadd_parts+0x20>
  107a6c:	e59d3000 	ldr	r3, [sp]
  107a70:	e153000c 	cmp	r3, ip
  107a74:	d3a0a000 	movle	sl, #0	; 0x0
  107a78:	d3a0b000 	movle	fp, #0	; 0x0
  107a7c:	c3a08000 	movgt	r8, #0	; 0x0
  107a80:	c3a09000 	movgt	r9, #0	; 0x0
  107a84:	d58dc000 	strle	ip, [sp]
  107a88:	eaffff97 	b	1078ec <_fpadd_parts+0x13c>
  107a8c:	e1a0100a 	mov	r1, sl
  107a90:	e1a0200b 	mov	r2, fp
  107a94:	e0511008 	subs	r1, r1, r8
  107a98:	e0c22009 	sbc	r2, r2, r9
  107a9c:	eaffff9c 	b	107914 <_fpadd_parts+0x164>
  107aa0:	e09a1008 	adds	r1, sl, r8
  107aa4:	e0ab2009 	adc	r2, fp, r9
  107aa8:	e586100c 	str	r1, [r6, #12]
  107aac:	e5862010 	str	r2, [r6, #16]
  107ab0:	e59d4000 	ldr	r4, [sp]
  107ab4:	e9860011 	stmib	r6, {r0, r4}
  107ab8:	eaffffd7 	b	107a1c <_fpadd_parts+0x26c>
  107abc:	e3a03001 	mov	r3, #1	; 0x1
  107ac0:	e5863004 	str	r3, [r6, #4]
  107ac4:	e59d3000 	ldr	r3, [sp]
  107ac8:	e2711000 	rsbs	r1, r1, #0	; 0x0
  107acc:	e2e22000 	rsc	r2, r2, #0	; 0x0
  107ad0:	e5863008 	str	r3, [r6, #8]
  107ad4:	e586100c 	str	r1, [r6, #12]
  107ad8:	e5862010 	str	r2, [r6, #16]
  107adc:	eaffff93 	b	107930 <_fpadd_parts+0x180>

00107ae0 <__subdf3>:
  107ae0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  107ae4:	e24dd04c 	sub	sp, sp, #76	; 0x4c
  107ae8:	e28d5028 	add	r5, sp, #40	; 0x28
  107aec:	e58d0044 	str	r0, [sp, #68]
  107af0:	e58d1048 	str	r1, [sp, #72]
  107af4:	e28d4014 	add	r4, sp, #20	; 0x14
  107af8:	e28d0044 	add	r0, sp, #68	; 0x44
  107afc:	e1a01005 	mov	r1, r5
  107b00:	e58d203c 	str	r2, [sp, #60]
  107b04:	e58d3040 	str	r3, [sp, #64]
  107b08:	eb00037e 	bl	108908 <__unpack_d>
  107b0c:	e28d003c 	add	r0, sp, #60	; 0x3c
  107b10:	e1a01004 	mov	r1, r4
  107b14:	eb00037b 	bl	108908 <__unpack_d>
  107b18:	e59d3018 	ldr	r3, [sp, #24]
  107b1c:	e1a01004 	mov	r1, r4
  107b20:	e2233001 	eor	r3, r3, #1	; 0x1
  107b24:	e1a0200d 	mov	r2, sp
  107b28:	e1a00005 	mov	r0, r5
  107b2c:	e58d3018 	str	r3, [sp, #24]
  107b30:	ebffff1e 	bl	1077b0 <_fpadd_parts>
  107b34:	eb0002b6 	bl	108614 <__pack_d>
  107b38:	e28dd04c 	add	sp, sp, #76	; 0x4c
  107b3c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107b40 <__adddf3>:
  107b40:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  107b44:	e24dd04c 	sub	sp, sp, #76	; 0x4c
  107b48:	e28d5028 	add	r5, sp, #40	; 0x28
  107b4c:	e58d0044 	str	r0, [sp, #68]
  107b50:	e58d1048 	str	r1, [sp, #72]
  107b54:	e28d4014 	add	r4, sp, #20	; 0x14
  107b58:	e28d0044 	add	r0, sp, #68	; 0x44
  107b5c:	e1a01005 	mov	r1, r5
  107b60:	e58d203c 	str	r2, [sp, #60]
  107b64:	e58d3040 	str	r3, [sp, #64]
  107b68:	eb000366 	bl	108908 <__unpack_d>
  107b6c:	e28d003c 	add	r0, sp, #60	; 0x3c
  107b70:	e1a01004 	mov	r1, r4
  107b74:	eb000363 	bl	108908 <__unpack_d>
  107b78:	e1a01004 	mov	r1, r4
  107b7c:	e1a0200d 	mov	r2, sp
  107b80:	e1a00005 	mov	r0, r5
  107b84:	ebffff09 	bl	1077b0 <_fpadd_parts>
  107b88:	eb0002a1 	bl	108614 <__pack_d>
  107b8c:	e28dd04c 	add	sp, sp, #76	; 0x4c
  107b90:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

00107b94 <nan>:
  107b94:	e59f0000 	ldr	r0, [pc, #0]	; 107b9c <prog+0x7b58>
  107b98:	e12fff1e 	bx	lr
  107b9c:	0010b828 	andeqs	fp, r0, r8, lsr #16

00107ba0 <isnan>:
  107ba0:	e5900000 	ldr	r0, [r0]
  107ba4:	e3500001 	cmp	r0, #1	; 0x1
  107ba8:	83a00000 	movhi	r0, #0	; 0x0
  107bac:	93a00001 	movls	r0, #1	; 0x1
  107bb0:	e12fff1e 	bx	lr

00107bb4 <isinf>:
  107bb4:	e5900000 	ldr	r0, [r0]
  107bb8:	e3500004 	cmp	r0, #4	; 0x4
  107bbc:	13a00000 	movne	r0, #0	; 0x0
  107bc0:	03a00001 	moveq	r0, #1	; 0x1
  107bc4:	e12fff1e 	bx	lr

00107bc8 <iszero>:
  107bc8:	e5900000 	ldr	r0, [r0]
  107bcc:	e3500002 	cmp	r0, #2	; 0x2
  107bd0:	13a00000 	movne	r0, #0	; 0x0
  107bd4:	03a00001 	moveq	r0, #1	; 0x1
  107bd8:	e12fff1e 	bx	lr

00107bdc <__muldf3>:
  107bdc:	e92d4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
  107be0:	e24dd064 	sub	sp, sp, #100	; 0x64
  107be4:	e28d5040 	add	r5, sp, #64	; 0x40
  107be8:	e58d005c 	str	r0, [sp, #92]
  107bec:	e58d1060 	str	r1, [sp, #96]
  107bf0:	e28d702c 	add	r7, sp, #44	; 0x2c
  107bf4:	e28d005c 	add	r0, sp, #92	; 0x5c
  107bf8:	e1a01005 	mov	r1, r5
  107bfc:	e58d2054 	str	r2, [sp, #84]
  107c00:	e58d3058 	str	r3, [sp, #88]
  107c04:	eb00033f 	bl	108908 <__unpack_d>
  107c08:	e1a01007 	mov	r1, r7
  107c0c:	e28d0054 	add	r0, sp, #84	; 0x54
  107c10:	eb00033c 	bl	108908 <__unpack_d>
  107c14:	e1a00005 	mov	r0, r5
  107c18:	ebffffe0 	bl	107ba0 <isnan>
  107c1c:	e3500000 	cmp	r0, #0	; 0x0
  107c20:	0a000008 	beq	107c48 <__muldf3+0x6c>
  107c24:	e59d3044 	ldr	r3, [sp, #68]
  107c28:	e59d2030 	ldr	r2, [sp, #48]
  107c2c:	e0533002 	subs	r3, r3, r2
  107c30:	13a03001 	movne	r3, #1	; 0x1
  107c34:	e58d3044 	str	r3, [sp, #68]
  107c38:	e1a00005 	mov	r0, r5
  107c3c:	eb000274 	bl	108614 <__pack_d>
  107c40:	e28dd064 	add	sp, sp, #100	; 0x64
  107c44:	e8bd8df0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
  107c48:	e1a00007 	mov	r0, r7
  107c4c:	ebffffd3 	bl	107ba0 <isnan>
  107c50:	e3500000 	cmp	r0, #0	; 0x0
  107c54:	0a000006 	beq	107c74 <__muldf3+0x98>
  107c58:	e59d2030 	ldr	r2, [sp, #48]
  107c5c:	e59d3044 	ldr	r3, [sp, #68]
  107c60:	e1a00007 	mov	r0, r7
  107c64:	e0533002 	subs	r3, r3, r2
  107c68:	13a03001 	movne	r3, #1	; 0x1
  107c6c:	e58d3030 	str	r3, [sp, #48]
  107c70:	eafffff1 	b	107c3c <__muldf3+0x60>
  107c74:	e1a00005 	mov	r0, r5
  107c78:	ebffffcd 	bl	107bb4 <isinf>
  107c7c:	e3500000 	cmp	r0, #0	; 0x0
  107c80:	1a000009 	bne	107cac <__muldf3+0xd0>
  107c84:	e1a00007 	mov	r0, r7
  107c88:	ebffffc9 	bl	107bb4 <isinf>
  107c8c:	e3500000 	cmp	r0, #0	; 0x0
  107c90:	0a00000b 	beq	107cc4 <__muldf3+0xe8>
  107c94:	e1a00005 	mov	r0, r5
  107c98:	ebffffca 	bl	107bc8 <iszero>
  107c9c:	e3500000 	cmp	r0, #0	; 0x0
  107ca0:	0affffec 	beq	107c58 <__muldf3+0x7c>
  107ca4:	ebffffba 	bl	107b94 <nan>
  107ca8:	eaffffe3 	b	107c3c <__muldf3+0x60>
  107cac:	e1a00007 	mov	r0, r7
  107cb0:	ebffffc4 	bl	107bc8 <iszero>
  107cb4:	e3500000 	cmp	r0, #0	; 0x0
  107cb8:	0affffd9 	beq	107c24 <__muldf3+0x48>
  107cbc:	ebffffb4 	bl	107b94 <nan>
  107cc0:	eaffffdd 	b	107c3c <__muldf3+0x60>
  107cc4:	e1a00005 	mov	r0, r5
  107cc8:	ebffffbe 	bl	107bc8 <iszero>
  107ccc:	e3500000 	cmp	r0, #0	; 0x0
  107cd0:	1affffd3 	bne	107c24 <__muldf3+0x48>
  107cd4:	e1a00007 	mov	r0, r7
  107cd8:	ebffffba 	bl	107bc8 <iszero>
  107cdc:	e3500000 	cmp	r0, #0	; 0x0
  107ce0:	1affffdc 	bne	107c58 <__muldf3+0x7c>
  107ce4:	e28d5038 	add	r5, sp, #56	; 0x38
  107ce8:	e8950060 	ldmia	r5, {r5, r6}
  107cec:	e1a03006 	mov	r3, r6
  107cf0:	e3a04000 	mov	r4, #0	; 0x0
  107cf4:	e28d704c 	add	r7, sp, #76	; 0x4c
  107cf8:	e8970180 	ldmia	r7, {r7, r8}
  107cfc:	e58d3010 	str	r3, [sp, #16]
  107d00:	e58d4014 	str	r4, [sp, #20]
  107d04:	e59d0010 	ldr	r0, [sp, #16]
  107d08:	e1a01008 	mov	r1, r8
  107d0c:	e3a08000 	mov	r8, #0	; 0x0
  107d10:	e0843097 	umull	r3, r4, r7, r0
  107d14:	e3a06000 	mov	r6, #0	; 0x0
  107d18:	e1a0a001 	mov	sl, r1
  107d1c:	e3a0b000 	mov	fp, #0	; 0x0
  107d20:	e1a02004 	mov	r2, r4
  107d24:	e1a01003 	mov	r1, r3
  107d28:	e0a2159a 	umlal	r1, r2, sl, r5
  107d2c:	e88d0006 	stmia	sp, {r1, r2}
  107d30:	e0810795 	umull	r0, r1, r5, r7
  107d34:	e1540002 	cmp	r4, r2
  107d38:	e1a05000 	mov	r5, r0
  107d3c:	e1a06001 	mov	r6, r1
  107d40:	8a00005f 	bhi	107ec4 <__muldf3+0x2e8>
  107d44:	0a00005b 	beq	107eb8 <__muldf3+0x2dc>
  107d48:	e3a02000 	mov	r2, #0	; 0x0
  107d4c:	e3a03000 	mov	r3, #0	; 0x0
  107d50:	e58d2008 	str	r2, [sp, #8]
  107d54:	e58d300c 	str	r3, [sp, #12]
  107d58:	e59d4000 	ldr	r4, [sp]
  107d5c:	e3a03000 	mov	r3, #0	; 0x0
  107d60:	e0937005 	adds	r7, r3, r5
  107d64:	e1a01004 	mov	r1, r4
  107d68:	e3a02000 	mov	r2, #0	; 0x0
  107d6c:	e0a18006 	adc	r8, r1, r6
  107d70:	e1560008 	cmp	r6, r8
  107d74:	8a000046 	bhi	107e94 <__muldf3+0x2b8>
  107d78:	0a000043 	beq	107e8c <__muldf3+0x2b0>
  107d7c:	e59d0010 	ldr	r0, [sp, #16]
  107d80:	e000009b 	mul	r0, fp, r0
  107d84:	e59dc010 	ldr	ip, [sp, #16]
  107d88:	e0821a9c 	umull	r1, r2, ip, sl
  107d8c:	e59dc014 	ldr	ip, [sp, #20]
  107d90:	e02c0c9a 	mla	ip, sl, ip, r0
  107d94:	e59d0004 	ldr	r0, [sp, #4]
  107d98:	e08c2002 	add	r2, ip, r2
  107d9c:	e0905001 	adds	r5, r0, r1
  107da0:	e3a04000 	mov	r4, #0	; 0x0
  107da4:	e0a46002 	adc	r6, r4, r2
  107da8:	e28d1008 	add	r1, sp, #8	; 0x8
  107dac:	e8910006 	ldmia	r1, {r1, r2}
  107db0:	e0955001 	adds	r5, r5, r1
  107db4:	e59d1048 	ldr	r1, [sp, #72]
  107db8:	e0a66002 	adc	r6, r6, r2
  107dbc:	e59d0044 	ldr	r0, [sp, #68]
  107dc0:	e59d3030 	ldr	r3, [sp, #48]
  107dc4:	e59d2034 	ldr	r2, [sp, #52]
  107dc8:	e2811004 	add	r1, r1, #4	; 0x4
  107dcc:	e0500003 	subs	r0, r0, r3
  107dd0:	13a00001 	movne	r0, #1	; 0x1
  107dd4:	e0822001 	add	r2, r2, r1
  107dd8:	e376021e 	cmn	r6, #-536870911	; 0xe0000001
  107ddc:	e58d001c 	str	r0, [sp, #28]
  107de0:	e58d2020 	str	r2, [sp, #32]
  107de4:	9a00000e 	bls	107e24 <__muldf3+0x248>
  107de8:	e3a00001 	mov	r0, #1	; 0x1
  107dec:	e3a0a000 	mov	sl, #0	; 0x0
  107df0:	e3a0b102 	mov	fp, #-2147483648	; 0x80000000
  107df4:	e1150000 	tst	r5, r0
  107df8:	e2822001 	add	r2, r2, #1	; 0x1
  107dfc:	0a000003 	beq	107e10 <__muldf3+0x234>
  107e00:	e1b040a8 	movs	r4, r8, lsr #1
  107e04:	e1a03067 	mov	r3, r7, rrx
  107e08:	e183700a 	orr	r7, r3, sl
  107e0c:	e184800b 	orr	r8, r4, fp
  107e10:	e1b060a6 	movs	r6, r6, lsr #1
  107e14:	e1a05065 	mov	r5, r5, rrx
  107e18:	e376021e 	cmn	r6, #-536870911	; 0xe0000001
  107e1c:	8afffff4 	bhi	107df4 <__muldf3+0x218>
  107e20:	e58d2020 	str	r2, [sp, #32]
  107e24:	e376021f 	cmn	r6, #-268435455	; 0xf0000001
  107e28:	8a00000d 	bhi	107e64 <__muldf3+0x288>
  107e2c:	e59d3020 	ldr	r3, [sp, #32]
  107e30:	e3a01001 	mov	r1, #1	; 0x1
  107e34:	e3a02000 	mov	r2, #0	; 0x0
  107e38:	e0955005 	adds	r5, r5, r5
  107e3c:	e0a66006 	adc	r6, r6, r6
  107e40:	e3580000 	cmp	r8, #0	; 0x0
  107e44:	b1866002 	orrlt	r6, r6, r2
  107e48:	b1855001 	orrlt	r5, r5, r1
  107e4c:	e0977007 	adds	r7, r7, r7
  107e50:	e0a88008 	adc	r8, r8, r8
  107e54:	e376021f 	cmn	r6, #-268435455	; 0xf0000001
  107e58:	e2433001 	sub	r3, r3, #1	; 0x1
  107e5c:	9afffff5 	bls	107e38 <__muldf3+0x25c>
  107e60:	e58d3020 	str	r3, [sp, #32]
  107e64:	e20530ff 	and	r3, r5, #255	; 0xff
  107e68:	e3a04000 	mov	r4, #0	; 0x0
  107e6c:	e3530080 	cmp	r3, #128	; 0x80
  107e70:	0a000018 	beq	107ed8 <__muldf3+0x2fc>
  107e74:	e3a03003 	mov	r3, #3	; 0x3
  107e78:	e28d0018 	add	r0, sp, #24	; 0x18
  107e7c:	e58d5024 	str	r5, [sp, #36]
  107e80:	e58d6028 	str	r6, [sp, #40]
  107e84:	e58d3018 	str	r3, [sp, #24]
  107e88:	eaffff6b 	b	107c3c <__muldf3+0x60>
  107e8c:	e1550007 	cmp	r5, r7
  107e90:	9affffb9 	bls	107d7c <__muldf3+0x1a0>
  107e94:	e28d0008 	add	r0, sp, #8	; 0x8
  107e98:	e8900003 	ldmia	r0, {r0, r1}
  107e9c:	e3a03001 	mov	r3, #1	; 0x1
  107ea0:	e0900003 	adds	r0, r0, r3
  107ea4:	e3a04000 	mov	r4, #0	; 0x0
  107ea8:	e0a11004 	adc	r1, r1, r4
  107eac:	e58d0008 	str	r0, [sp, #8]
  107eb0:	e58d100c 	str	r1, [sp, #12]
  107eb4:	eaffffb0 	b	107d7c <__muldf3+0x1a0>
  107eb8:	e59d1000 	ldr	r1, [sp]
  107ebc:	e1530001 	cmp	r3, r1
  107ec0:	9affffa0 	bls	107d48 <__muldf3+0x16c>
  107ec4:	e3a03000 	mov	r3, #0	; 0x0
  107ec8:	e3a04001 	mov	r4, #1	; 0x1
  107ecc:	e58d3008 	str	r3, [sp, #8]
  107ed0:	e58d400c 	str	r4, [sp, #12]
  107ed4:	eaffff9f 	b	107d58 <__muldf3+0x17c>
  107ed8:	e3540000 	cmp	r4, #0	; 0x0
  107edc:	1affffe4 	bne	107e74 <__muldf3+0x298>
  107ee0:	e3a01c01 	mov	r1, #256	; 0x100
  107ee4:	e3a02000 	mov	r2, #0	; 0x0
  107ee8:	e0053001 	and	r3, r5, r1
  107eec:	e0064002 	and	r4, r6, r2
  107ef0:	e1933004 	orrs	r3, r3, r4
  107ef4:	1affffde 	bne	107e74 <__muldf3+0x298>
  107ef8:	e1977008 	orrs	r7, r7, r8
  107efc:	0affffdc 	beq	107e74 <__muldf3+0x298>
  107f00:	e3a03080 	mov	r3, #128	; 0x80
  107f04:	e0933005 	adds	r3, r3, r5
  107f08:	e3a04000 	mov	r4, #0	; 0x0
  107f0c:	e0a44006 	adc	r4, r4, r6
  107f10:	e3e010ff 	mvn	r1, #255	; 0xff
  107f14:	e3e02000 	mvn	r2, #0	; 0x0
  107f18:	e0035001 	and	r5, r3, r1
  107f1c:	e0046002 	and	r6, r4, r2
  107f20:	eaffffd3 	b	107e74 <__muldf3+0x298>

00107f24 <nan>:
  107f24:	e59f0000 	ldr	r0, [pc, #0]	; 107f2c <prog+0x7ee8>
  107f28:	e12fff1e 	bx	lr
  107f2c:	0010b828 	andeqs	fp, r0, r8, lsr #16

00107f30 <isnan>:
  107f30:	e5900000 	ldr	r0, [r0]
  107f34:	e3500001 	cmp	r0, #1	; 0x1
  107f38:	83a00000 	movhi	r0, #0	; 0x0
  107f3c:	93a00001 	movls	r0, #1	; 0x1
  107f40:	e12fff1e 	bx	lr

00107f44 <isinf>:
  107f44:	e5900000 	ldr	r0, [r0]
  107f48:	e3500004 	cmp	r0, #4	; 0x4
  107f4c:	13a00000 	movne	r0, #0	; 0x0
  107f50:	03a00001 	moveq	r0, #1	; 0x1
  107f54:	e12fff1e 	bx	lr

00107f58 <iszero>:
  107f58:	e5900000 	ldr	r0, [r0]
  107f5c:	e3500002 	cmp	r0, #2	; 0x2
  107f60:	13a00000 	movne	r0, #0	; 0x0
  107f64:	03a00001 	moveq	r0, #1	; 0x1
  107f68:	e12fff1e 	bx	lr

00107f6c <__divdf3>:
  107f6c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  107f70:	e24dd038 	sub	sp, sp, #56	; 0x38
  107f74:	e28d7014 	add	r7, sp, #20	; 0x14
  107f78:	e58d0030 	str	r0, [sp, #48]
  107f7c:	e58d1034 	str	r1, [sp, #52]
  107f80:	e28d0030 	add	r0, sp, #48	; 0x30
  107f84:	e1a01007 	mov	r1, r7
  107f88:	e58d2028 	str	r2, [sp, #40]
  107f8c:	e58d302c 	str	r3, [sp, #44]
  107f90:	eb00025c 	bl	108908 <__unpack_d>
  107f94:	e1a0100d 	mov	r1, sp
  107f98:	e28d0028 	add	r0, sp, #40	; 0x28
  107f9c:	eb000259 	bl	108908 <__unpack_d>
  107fa0:	e1a00007 	mov	r0, r7
  107fa4:	ebffffe1 	bl	107f30 <isnan>
  107fa8:	e3500000 	cmp	r0, #0	; 0x0
  107fac:	e1a0500d 	mov	r5, sp
  107fb0:	0a000003 	beq	107fc4 <__divdf3+0x58>
  107fb4:	e1a00007 	mov	r0, r7
  107fb8:	eb000195 	bl	108614 <__pack_d>
  107fbc:	e28dd038 	add	sp, sp, #56	; 0x38
  107fc0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  107fc4:	e1a0000d 	mov	r0, sp
  107fc8:	ebffffd8 	bl	107f30 <isnan>
  107fcc:	e3500000 	cmp	r0, #0	; 0x0
  107fd0:	11a0000d 	movne	r0, sp
  107fd4:	1afffff7 	bne	107fb8 <__divdf3+0x4c>
  107fd8:	e59d3018 	ldr	r3, [sp, #24]
  107fdc:	e59d2004 	ldr	r2, [sp, #4]
  107fe0:	e0233002 	eor	r3, r3, r2
  107fe4:	e58d3018 	str	r3, [sp, #24]
  107fe8:	e1a00007 	mov	r0, r7
  107fec:	ebffffd4 	bl	107f44 <isinf>
  107ff0:	e3500000 	cmp	r0, #0	; 0x0
  107ff4:	0a000005 	beq	108010 <__divdf3+0xa4>
  107ff8:	e59d2014 	ldr	r2, [sp, #20]
  107ffc:	e59d3000 	ldr	r3, [sp]
  108000:	e1520003 	cmp	r2, r3
  108004:	1affffea 	bne	107fb4 <__divdf3+0x48>
  108008:	ebffffc5 	bl	107f24 <nan>
  10800c:	eaffffe9 	b	107fb8 <__divdf3+0x4c>
  108010:	e1a00007 	mov	r0, r7
  108014:	ebffffcf 	bl	107f58 <iszero>
  108018:	e2506000 	subs	r6, r0, #0	; 0x0
  10801c:	1afffff5 	bne	107ff8 <__divdf3+0x8c>
  108020:	e1a0000d 	mov	r0, sp
  108024:	ebffffc6 	bl	107f44 <isinf>
  108028:	e3500000 	cmp	r0, #0	; 0x0
  10802c:	0a000006 	beq	10804c <__divdf3+0xe0>
  108030:	e3a03000 	mov	r3, #0	; 0x0
  108034:	e3a04000 	mov	r4, #0	; 0x0
  108038:	e1a00007 	mov	r0, r7
  10803c:	e58d601c 	str	r6, [sp, #28]
  108040:	e58d3020 	str	r3, [sp, #32]
  108044:	e58d4024 	str	r4, [sp, #36]
  108048:	eaffffda 	b	107fb8 <__divdf3+0x4c>
  10804c:	e1a0000d 	mov	r0, sp
  108050:	ebffffc0 	bl	107f58 <iszero>
  108054:	e3500000 	cmp	r0, #0	; 0x0
  108058:	13a03004 	movne	r3, #4	; 0x4
  10805c:	11a00007 	movne	r0, r7
  108060:	158d3014 	strne	r3, [sp, #20]
  108064:	1affffd3 	bne	107fb8 <__divdf3+0x4c>
  108068:	e59d201c 	ldr	r2, [sp, #28]
  10806c:	e28d0020 	add	r0, sp, #32	; 0x20
  108070:	e8900003 	ldmia	r0, {r0, r1}
  108074:	e28d800c 	add	r8, sp, #12	; 0xc
  108078:	e8980300 	ldmia	r8, {r8, r9}
  10807c:	e59d3008 	ldr	r3, [sp, #8]
  108080:	e1590001 	cmp	r9, r1
  108084:	e0632002 	rsb	r2, r3, r2
  108088:	e58d201c 	str	r2, [sp, #28]
  10808c:	8a000022 	bhi	10811c <__divdf3+0x1b0>
  108090:	0a00001f 	beq	108114 <__divdf3+0x1a8>
  108094:	e3a02000 	mov	r2, #0	; 0x0
  108098:	e3a03201 	mov	r3, #268435456	; 0x10000000
  10809c:	e3a0a000 	mov	sl, #0	; 0x0
  1080a0:	e3a0b000 	mov	fp, #0	; 0x0
  1080a4:	e3a0c000 	mov	ip, #0	; 0x0
  1080a8:	ea00000b 	b	1080dc <__divdf3+0x170>
  1080ac:	e0500008 	subs	r0, r0, r8
  1080b0:	e0c11009 	sbc	r1, r1, r9
  1080b4:	e18aa002 	orr	sl, sl, r2
  1080b8:	e18bb003 	orr	fp, fp, r3
  1080bc:	e0905000 	adds	r5, r0, r0
  1080c0:	e0a16001 	adc	r6, r1, r1
  1080c4:	e1b030a3 	movs	r3, r3, lsr #1
  1080c8:	e1a02062 	mov	r2, r2, rrx
  1080cc:	e35c003d 	cmp	ip, #61	; 0x3d
  1080d0:	e1a00005 	mov	r0, r5
  1080d4:	e1a01006 	mov	r1, r6
  1080d8:	0a000006 	beq	1080f8 <__divdf3+0x18c>
  1080dc:	e1590001 	cmp	r9, r1
  1080e0:	e28cc001 	add	ip, ip, #1	; 0x1
  1080e4:	8afffff4 	bhi	1080bc <__divdf3+0x150>
  1080e8:	1affffef 	bne	1080ac <__divdf3+0x140>
  1080ec:	e1580000 	cmp	r8, r0
  1080f0:	8afffff1 	bhi	1080bc <__divdf3+0x150>
  1080f4:	eaffffec 	b	1080ac <__divdf3+0x140>
  1080f8:	e20a20ff 	and	r2, sl, #255	; 0xff
  1080fc:	e3a03000 	mov	r3, #0	; 0x0
  108100:	e3520080 	cmp	r2, #128	; 0x80
  108104:	0a000009 	beq	108130 <__divdf3+0x1c4>
  108108:	e58da020 	str	sl, [sp, #32]
  10810c:	e58db024 	str	fp, [sp, #36]
  108110:	eaffffa7 	b	107fb4 <__divdf3+0x48>
  108114:	e1580000 	cmp	r8, r0
  108118:	9affffdd 	bls	108094 <__divdf3+0x128>
  10811c:	e0900000 	adds	r0, r0, r0
  108120:	e2423001 	sub	r3, r2, #1	; 0x1
  108124:	e0a11001 	adc	r1, r1, r1
  108128:	e58d301c 	str	r3, [sp, #28]
  10812c:	eaffffd8 	b	108094 <__divdf3+0x128>
  108130:	e3530000 	cmp	r3, #0	; 0x0
  108134:	1afffff3 	bne	108108 <__divdf3+0x19c>
  108138:	e3a01c01 	mov	r1, #256	; 0x100
  10813c:	e3a02000 	mov	r2, #0	; 0x0
  108140:	e00a3001 	and	r3, sl, r1
  108144:	e00b4002 	and	r4, fp, r2
  108148:	e1933004 	orrs	r3, r3, r4
  10814c:	1affffed 	bne	108108 <__divdf3+0x19c>
  108150:	e1955006 	orrs	r5, r5, r6
  108154:	0affffeb 	beq	108108 <__divdf3+0x19c>
  108158:	e3a03080 	mov	r3, #128	; 0x80
  10815c:	e093300a 	adds	r3, r3, sl
  108160:	e3a04000 	mov	r4, #0	; 0x0
  108164:	e0a4400b 	adc	r4, r4, fp
  108168:	e3e010ff 	mvn	r1, #255	; 0xff
  10816c:	e3e02000 	mvn	r2, #0	; 0x0
  108170:	e003a001 	and	sl, r3, r1
  108174:	e004b002 	and	fp, r4, r2
  108178:	eaffffe2 	b	108108 <__divdf3+0x19c>

0010817c <isnan>:
  10817c:	e5900000 	ldr	r0, [r0]
  108180:	e3500001 	cmp	r0, #1	; 0x1
  108184:	83a00000 	movhi	r0, #0	; 0x0
  108188:	93a00001 	movls	r0, #1	; 0x1
  10818c:	e12fff1e 	bx	lr

00108190 <__eqdf2>:
  108190:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  108194:	e24dd038 	sub	sp, sp, #56	; 0x38
  108198:	e28d5014 	add	r5, sp, #20	; 0x14
  10819c:	e58d0030 	str	r0, [sp, #48]
  1081a0:	e58d1034 	str	r1, [sp, #52]
  1081a4:	e28d0030 	add	r0, sp, #48	; 0x30
  1081a8:	e1a01005 	mov	r1, r5
  1081ac:	e58d2028 	str	r2, [sp, #40]
  1081b0:	e58d302c 	str	r3, [sp, #44]
  1081b4:	eb0001d3 	bl	108908 <__unpack_d>
  1081b8:	e1a0100d 	mov	r1, sp
  1081bc:	e28d0028 	add	r0, sp, #40	; 0x28
  1081c0:	eb0001d0 	bl	108908 <__unpack_d>
  1081c4:	e1a00005 	mov	r0, r5
  1081c8:	ebffffeb 	bl	10817c <isnan>
  1081cc:	e3500000 	cmp	r0, #0	; 0x0
  1081d0:	e1a0400d 	mov	r4, sp
  1081d4:	e1a0000d 	mov	r0, sp
  1081d8:	0a000002 	beq	1081e8 <__eqdf2+0x58>
  1081dc:	e3a00001 	mov	r0, #1	; 0x1
  1081e0:	e28dd038 	add	sp, sp, #56	; 0x38
  1081e4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1081e8:	ebffffe3 	bl	10817c <isnan>
  1081ec:	e3500000 	cmp	r0, #0	; 0x0
  1081f0:	e1a0100d 	mov	r1, sp
  1081f4:	e1a00005 	mov	r0, r5
  1081f8:	1afffff7 	bne	1081dc <__eqdf2+0x4c>
  1081fc:	eb000219 	bl	108a68 <__fpcmp_parts_d>
  108200:	eafffff6 	b	1081e0 <__eqdf2+0x50>

00108204 <isnan>:
  108204:	e5900000 	ldr	r0, [r0]
  108208:	e3500001 	cmp	r0, #1	; 0x1
  10820c:	83a00000 	movhi	r0, #0	; 0x0
  108210:	93a00001 	movls	r0, #1	; 0x1
  108214:	e12fff1e 	bx	lr

00108218 <__nedf2>:
  108218:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10821c:	e24dd038 	sub	sp, sp, #56	; 0x38
  108220:	e28d5014 	add	r5, sp, #20	; 0x14
  108224:	e58d0030 	str	r0, [sp, #48]
  108228:	e58d1034 	str	r1, [sp, #52]
  10822c:	e28d0030 	add	r0, sp, #48	; 0x30
  108230:	e1a01005 	mov	r1, r5
  108234:	e58d2028 	str	r2, [sp, #40]
  108238:	e58d302c 	str	r3, [sp, #44]
  10823c:	eb0001b1 	bl	108908 <__unpack_d>
  108240:	e1a0100d 	mov	r1, sp
  108244:	e28d0028 	add	r0, sp, #40	; 0x28
  108248:	eb0001ae 	bl	108908 <__unpack_d>
  10824c:	e1a00005 	mov	r0, r5
  108250:	ebffffeb 	bl	108204 <isnan>
  108254:	e3500000 	cmp	r0, #0	; 0x0
  108258:	e1a0400d 	mov	r4, sp
  10825c:	e1a0000d 	mov	r0, sp
  108260:	0a000002 	beq	108270 <__nedf2+0x58>
  108264:	e3a00001 	mov	r0, #1	; 0x1
  108268:	e28dd038 	add	sp, sp, #56	; 0x38
  10826c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108270:	ebffffe3 	bl	108204 <isnan>
  108274:	e3500000 	cmp	r0, #0	; 0x0
  108278:	e1a0100d 	mov	r1, sp
  10827c:	e1a00005 	mov	r0, r5
  108280:	1afffff7 	bne	108264 <__nedf2+0x4c>
  108284:	eb0001f7 	bl	108a68 <__fpcmp_parts_d>
  108288:	eafffff6 	b	108268 <__nedf2+0x50>

0010828c <isnan>:
  10828c:	e5900000 	ldr	r0, [r0]
  108290:	e3500001 	cmp	r0, #1	; 0x1
  108294:	83a00000 	movhi	r0, #0	; 0x0
  108298:	93a00001 	movls	r0, #1	; 0x1
  10829c:	e12fff1e 	bx	lr

001082a0 <__gtdf2>:
  1082a0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1082a4:	e24dd038 	sub	sp, sp, #56	; 0x38
  1082a8:	e28d5014 	add	r5, sp, #20	; 0x14
  1082ac:	e58d0030 	str	r0, [sp, #48]
  1082b0:	e58d1034 	str	r1, [sp, #52]
  1082b4:	e28d0030 	add	r0, sp, #48	; 0x30
  1082b8:	e1a01005 	mov	r1, r5
  1082bc:	e58d2028 	str	r2, [sp, #40]
  1082c0:	e58d302c 	str	r3, [sp, #44]
  1082c4:	eb00018f 	bl	108908 <__unpack_d>
  1082c8:	e1a0100d 	mov	r1, sp
  1082cc:	e28d0028 	add	r0, sp, #40	; 0x28
  1082d0:	eb00018c 	bl	108908 <__unpack_d>
  1082d4:	e1a00005 	mov	r0, r5
  1082d8:	ebffffeb 	bl	10828c <isnan>
  1082dc:	e3500000 	cmp	r0, #0	; 0x0
  1082e0:	e1a0400d 	mov	r4, sp
  1082e4:	e1a0000d 	mov	r0, sp
  1082e8:	0a000002 	beq	1082f8 <__gtdf2+0x58>
  1082ec:	e3e00000 	mvn	r0, #0	; 0x0
  1082f0:	e28dd038 	add	sp, sp, #56	; 0x38
  1082f4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  1082f8:	ebffffe3 	bl	10828c <isnan>
  1082fc:	e3500000 	cmp	r0, #0	; 0x0
  108300:	e1a0100d 	mov	r1, sp
  108304:	e1a00005 	mov	r0, r5
  108308:	1afffff7 	bne	1082ec <__gtdf2+0x4c>
  10830c:	eb0001d5 	bl	108a68 <__fpcmp_parts_d>
  108310:	eafffff6 	b	1082f0 <__gtdf2+0x50>

00108314 <isnan>:
  108314:	e5900000 	ldr	r0, [r0]
  108318:	e3500001 	cmp	r0, #1	; 0x1
  10831c:	83a00000 	movhi	r0, #0	; 0x0
  108320:	93a00001 	movls	r0, #1	; 0x1
  108324:	e12fff1e 	bx	lr

00108328 <__gedf2>:
  108328:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10832c:	e24dd038 	sub	sp, sp, #56	; 0x38
  108330:	e28d5014 	add	r5, sp, #20	; 0x14
  108334:	e58d0030 	str	r0, [sp, #48]
  108338:	e58d1034 	str	r1, [sp, #52]
  10833c:	e28d0030 	add	r0, sp, #48	; 0x30
  108340:	e1a01005 	mov	r1, r5
  108344:	e58d2028 	str	r2, [sp, #40]
  108348:	e58d302c 	str	r3, [sp, #44]
  10834c:	eb00016d 	bl	108908 <__unpack_d>
  108350:	e1a0100d 	mov	r1, sp
  108354:	e28d0028 	add	r0, sp, #40	; 0x28
  108358:	eb00016a 	bl	108908 <__unpack_d>
  10835c:	e1a00005 	mov	r0, r5
  108360:	ebffffeb 	bl	108314 <isnan>
  108364:	e3500000 	cmp	r0, #0	; 0x0
  108368:	e1a0400d 	mov	r4, sp
  10836c:	e1a0000d 	mov	r0, sp
  108370:	0a000002 	beq	108380 <__gedf2+0x58>
  108374:	e3e00000 	mvn	r0, #0	; 0x0
  108378:	e28dd038 	add	sp, sp, #56	; 0x38
  10837c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108380:	ebffffe3 	bl	108314 <isnan>
  108384:	e3500000 	cmp	r0, #0	; 0x0
  108388:	e1a0100d 	mov	r1, sp
  10838c:	e1a00005 	mov	r0, r5
  108390:	1afffff7 	bne	108374 <__gedf2+0x4c>
  108394:	eb0001b3 	bl	108a68 <__fpcmp_parts_d>
  108398:	eafffff6 	b	108378 <__gedf2+0x50>

0010839c <isnan>:
  10839c:	e5900000 	ldr	r0, [r0]
  1083a0:	e3500001 	cmp	r0, #1	; 0x1
  1083a4:	83a00000 	movhi	r0, #0	; 0x0
  1083a8:	93a00001 	movls	r0, #1	; 0x1
  1083ac:	e12fff1e 	bx	lr

001083b0 <__ltdf2>:
  1083b0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  1083b4:	e24dd038 	sub	sp, sp, #56	; 0x38
  1083b8:	e28d5014 	add	r5, sp, #20	; 0x14
  1083bc:	e58d0030 	str	r0, [sp, #48]
  1083c0:	e58d1034 	str	r1, [sp, #52]
  1083c4:	e28d0030 	add	r0, sp, #48	; 0x30
  1083c8:	e1a01005 	mov	r1, r5
  1083cc:	e58d2028 	str	r2, [sp, #40]
  1083d0:	e58d302c 	str	r3, [sp, #44]
  1083d4:	eb00014b 	bl	108908 <__unpack_d>
  1083d8:	e1a0100d 	mov	r1, sp
  1083dc:	e28d0028 	add	r0, sp, #40	; 0x28
  1083e0:	eb000148 	bl	108908 <__unpack_d>
  1083e4:	e1a00005 	mov	r0, r5
  1083e8:	ebffffeb 	bl	10839c <isnan>
  1083ec:	e3500000 	cmp	r0, #0	; 0x0
  1083f0:	e1a0400d 	mov	r4, sp
  1083f4:	e1a0000d 	mov	r0, sp
  1083f8:	0a000002 	beq	108408 <__ltdf2+0x58>
  1083fc:	e3a00001 	mov	r0, #1	; 0x1
  108400:	e28dd038 	add	sp, sp, #56	; 0x38
  108404:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108408:	ebffffe3 	bl	10839c <isnan>
  10840c:	e3500000 	cmp	r0, #0	; 0x0
  108410:	e1a0100d 	mov	r1, sp
  108414:	e1a00005 	mov	r0, r5
  108418:	1afffff7 	bne	1083fc <__ltdf2+0x4c>
  10841c:	eb000191 	bl	108a68 <__fpcmp_parts_d>
  108420:	eafffff6 	b	108400 <__ltdf2+0x50>

00108424 <__floatsidf>:
  108424:	e92d4010 	stmdb	sp!, {r4, lr}
  108428:	e3a03003 	mov	r3, #3	; 0x3
  10842c:	e24dd014 	sub	sp, sp, #20	; 0x14
  108430:	e3500000 	cmp	r0, #0	; 0x0
  108434:	e58d3000 	str	r3, [sp]
  108438:	e1a02fa0 	mov	r2, r0, lsr #31
  10843c:	02433001 	subeq	r3, r3, #1	; 0x1
  108440:	e58d2004 	str	r2, [sp, #4]
  108444:	058d3000 	streq	r3, [sp]
  108448:	0a00001b 	beq	1084bc <__floatsidf+0x98>
  10844c:	e3520000 	cmp	r2, #0	; 0x0
  108450:	e3a0203c 	mov	r2, #60	; 0x3c
  108454:	e58d2008 	str	r2, [sp, #8]
  108458:	0a00001b 	beq	1084cc <__floatsidf+0xa8>
  10845c:	e3500102 	cmp	r0, #-2147483648	; 0x80000000
  108460:	03a004c1 	moveq	r0, #-1056964608	; 0xc1000000
  108464:	0280060e 	addeq	r0, r0, #14680064	; 0xe00000
  108468:	03a01000 	moveq	r1, #0	; 0x0
  10846c:	0a000014 	beq	1084c4 <__floatsidf+0xa0>
  108470:	e2603000 	rsb	r3, r0, #0	; 0x0
  108474:	e1a04fc3 	mov	r4, r3, asr #31
  108478:	e58d300c 	str	r3, [sp, #12]
  10847c:	e58d4010 	str	r4, [sp, #16]
  108480:	e28d000c 	add	r0, sp, #12	; 0xc
  108484:	e8900003 	ldmia	r0, {r0, r1}
  108488:	e371021f 	cmn	r1, #-268435455	; 0xf0000001
  10848c:	8a00000a 	bhi	1084bc <__floatsidf+0x98>
  108490:	e59d2008 	ldr	r2, [sp, #8]
  108494:	e0903000 	adds	r3, r0, r0
  108498:	e0a14001 	adc	r4, r1, r1
  10849c:	e2422001 	sub	r2, r2, #1	; 0x1
  1084a0:	e374021f 	cmn	r4, #-268435455	; 0xf0000001
  1084a4:	e1a00003 	mov	r0, r3
  1084a8:	e1a01004 	mov	r1, r4
  1084ac:	e58d300c 	str	r3, [sp, #12]
  1084b0:	e58d4010 	str	r4, [sp, #16]
  1084b4:	e58d2008 	str	r2, [sp, #8]
  1084b8:	9afffff5 	bls	108494 <__floatsidf+0x70>
  1084bc:	e1a0000d 	mov	r0, sp
  1084c0:	eb000053 	bl	108614 <__pack_d>
  1084c4:	e28dd014 	add	sp, sp, #20	; 0x14
  1084c8:	e8bd8010 	ldmia	sp!, {r4, pc}
  1084cc:	e1a03000 	mov	r3, r0
  1084d0:	e1a04fc3 	mov	r4, r3, asr #31
  1084d4:	e58d300c 	str	r3, [sp, #12]
  1084d8:	e58d4010 	str	r4, [sp, #16]
  1084dc:	eaffffe7 	b	108480 <__floatsidf+0x5c>

001084e0 <isnan>:
  1084e0:	e5900000 	ldr	r0, [r0]
  1084e4:	e3500001 	cmp	r0, #1	; 0x1
  1084e8:	83a00000 	movhi	r0, #0	; 0x0
  1084ec:	93a00001 	movls	r0, #1	; 0x1
  1084f0:	e12fff1e 	bx	lr

001084f4 <isinf>:
  1084f4:	e5900000 	ldr	r0, [r0]
  1084f8:	e3500004 	cmp	r0, #4	; 0x4
  1084fc:	13a00000 	movne	r0, #0	; 0x0
  108500:	03a00001 	moveq	r0, #1	; 0x1
  108504:	e12fff1e 	bx	lr

00108508 <iszero>:
  108508:	e5900000 	ldr	r0, [r0]
  10850c:	e3500002 	cmp	r0, #2	; 0x2
  108510:	13a00000 	movne	r0, #0	; 0x0
  108514:	03a00001 	moveq	r0, #1	; 0x1
  108518:	e12fff1e 	bx	lr

0010851c <__fixdfsi>:
  10851c:	e92d4010 	stmdb	sp!, {r4, lr}
  108520:	e24dd01c 	sub	sp, sp, #28	; 0x1c
  108524:	e28d301c 	add	r3, sp, #28	; 0x1c
  108528:	e9230003 	stmdb	r3!, {r0, r1}
  10852c:	e1a0100d 	mov	r1, sp
  108530:	e1a00003 	mov	r0, r3
  108534:	eb0000f3 	bl	108908 <__unpack_d>
  108538:	e1a0000d 	mov	r0, sp
  10853c:	ebfffff1 	bl	108508 <iszero>
  108540:	e3500000 	cmp	r0, #0	; 0x0
  108544:	e1a0400d 	mov	r4, sp
  108548:	0a000002 	beq	108558 <__fixdfsi+0x3c>
  10854c:	e3a00000 	mov	r0, #0	; 0x0
  108550:	e28dd01c 	add	sp, sp, #28	; 0x1c
  108554:	e8bd8010 	ldmia	sp!, {r4, pc}
  108558:	e1a0000d 	mov	r0, sp
  10855c:	ebffffdf 	bl	1084e0 <isnan>
  108560:	e3500000 	cmp	r0, #0	; 0x0
  108564:	1afffff8 	bne	10854c <__fixdfsi+0x30>
  108568:	e1a0000d 	mov	r0, sp
  10856c:	ebffffe0 	bl	1084f4 <isinf>
  108570:	e3500000 	cmp	r0, #0	; 0x0
  108574:	0a000004 	beq	10858c <__fixdfsi+0x70>
  108578:	e59d3004 	ldr	r3, [sp, #4]
  10857c:	e3530000 	cmp	r3, #0	; 0x0
  108580:	03e00102 	mvneq	r0, #-2147483648	; 0x80000000
  108584:	13a00102 	movne	r0, #-2147483648	; 0x80000000
  108588:	eafffff0 	b	108550 <__fixdfsi+0x34>
  10858c:	e59d3008 	ldr	r3, [sp, #8]
  108590:	e3530000 	cmp	r3, #0	; 0x0
  108594:	baffffec 	blt	10854c <__fixdfsi+0x30>
  108598:	e353001e 	cmp	r3, #30	; 0x1e
  10859c:	cafffff5 	bgt	108578 <__fixdfsi+0x5c>
  1085a0:	e59d200c 	ldr	r2, [sp, #12]
  1085a4:	e263103c 	rsb	r1, r3, #60	; 0x3c
  1085a8:	e1a03132 	mov	r3, r2, lsr r1
  1085ac:	e59d0010 	ldr	r0, [sp, #16]
  1085b0:	e261c020 	rsb	ip, r1, #32	; 0x20
  1085b4:	e1833c10 	orr	r3, r3, r0, lsl ip
  1085b8:	e251e020 	subs	lr, r1, #32	; 0x20
  1085bc:	51a03e30 	movpl	r3, r0, lsr lr
  1085c0:	e1a04130 	mov	r4, r0, lsr r1
  1085c4:	e59d2004 	ldr	r2, [sp, #4]
  1085c8:	e3520000 	cmp	r2, #0	; 0x0
  1085cc:	e1a00003 	mov	r0, r3
  1085d0:	12630000 	rsbne	r0, r3, #0	; 0x0
  1085d4:	eaffffdd 	b	108550 <__fixdfsi+0x34>

001085d8 <isnan>:
  1085d8:	e5900000 	ldr	r0, [r0]
  1085dc:	e3500001 	cmp	r0, #1	; 0x1
  1085e0:	83a00000 	movhi	r0, #0	; 0x0
  1085e4:	93a00001 	movls	r0, #1	; 0x1
  1085e8:	e12fff1e 	bx	lr

001085ec <isinf>:
  1085ec:	e5900000 	ldr	r0, [r0]
  1085f0:	e3500004 	cmp	r0, #4	; 0x4
  1085f4:	13a00000 	movne	r0, #0	; 0x0
  1085f8:	03a00001 	moveq	r0, #1	; 0x1
  1085fc:	e12fff1e 	bx	lr

00108600 <iszero>:
  108600:	e5900000 	ldr	r0, [r0]
  108604:	e3500002 	cmp	r0, #2	; 0x2
  108608:	13a00000 	movne	r0, #0	; 0x0
  10860c:	03a00001 	moveq	r0, #1	; 0x1
  108610:	e12fff1e 	bx	lr

00108614 <__pack_d>:
  108614:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  108618:	e24dd008 	sub	sp, sp, #8	; 0x8
  10861c:	e1a05000 	mov	r5, r0
  108620:	ebffffec 	bl	1085d8 <isnan>
  108624:	e3500000 	cmp	r0, #0	; 0x0
  108628:	e3a08000 	mov	r8, #0	; 0x0
  10862c:	e285a00c 	add	sl, r5, #12	; 0xc
  108630:	e89a0c00 	ldmia	sl, {sl, fp}
  108634:	e5959004 	ldr	r9, [r5, #4]
  108638:	0a000019 	beq	1086a4 <__pack_d+0x90>
  10863c:	e3a04702 	mov	r4, #524288	; 0x80000
  108640:	e3a03000 	mov	r3, #0	; 0x0
  108644:	e18b1004 	orr	r1, fp, r4
  108648:	e3a04601 	mov	r4, #1048576	; 0x100000
  10864c:	e18a0003 	orr	r0, sl, r3
  108650:	e3a0ce7f 	mov	ip, #2032	; 0x7f0
  108654:	e3e03000 	mvn	r3, #0	; 0x0
  108658:	e2444001 	sub	r4, r4, #1	; 0x1
  10865c:	e0000003 	and	r0, r0, r3
  108660:	e0011004 	and	r1, r1, r4
  108664:	e28cc00f 	add	ip, ip, #15	; 0xf
  108668:	e1a03a28 	mov	r3, r8, lsr #20
  10866c:	e1833601 	orr	r3, r3, r1, lsl #12
  108670:	e1a08663 	mov	r8, r3, ror #12
  108674:	e3c8247f 	bic	r2, r8, #2130706432	; 0x7f000000
  108678:	e3c2260f 	bic	r2, r2, #15728640	; 0xf00000
  10867c:	e1828a0c 	orr	r8, r2, ip, lsl #20
  108680:	e3c83102 	bic	r3, r8, #-2147483648	; 0x80000000
  108684:	e1833f89 	orr	r3, r3, r9, lsl #31
  108688:	e1a02000 	mov	r2, r0
  10868c:	e1a08000 	mov	r8, r0
  108690:	e1a07003 	mov	r7, r3
  108694:	e1a00003 	mov	r0, r3
  108698:	e1a01002 	mov	r1, r2
  10869c:	e28dd008 	add	sp, sp, #8	; 0x8
  1086a0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  1086a4:	e1a00005 	mov	r0, r5
  1086a8:	ebffffcf 	bl	1085ec <isinf>
  1086ac:	e3500000 	cmp	r0, #0	; 0x0
  1086b0:	0a000004 	beq	1086c8 <__pack_d+0xb4>
  1086b4:	e3a0ce7f 	mov	ip, #2032	; 0x7f0
  1086b8:	e28cc00f 	add	ip, ip, #15	; 0xf
  1086bc:	e3a00000 	mov	r0, #0	; 0x0
  1086c0:	e3a01000 	mov	r1, #0	; 0x0
  1086c4:	eaffffe7 	b	108668 <__pack_d+0x54>
  1086c8:	e1a00005 	mov	r0, r5
  1086cc:	ebffffcb 	bl	108600 <iszero>
  1086d0:	e250c000 	subs	ip, r0, #0	; 0x0
  1086d4:	1a000023 	bne	108768 <__pack_d+0x154>
  1086d8:	e19a100b 	orrs	r1, sl, fp
  1086dc:	0a000021 	beq	108768 <__pack_d+0x154>
  1086e0:	e5950008 	ldr	r0, [r5, #8]
  1086e4:	e3e03fff 	mvn	r3, #1020	; 0x3fc
  1086e8:	e2433001 	sub	r3, r3, #1	; 0x1
  1086ec:	e1500003 	cmp	r0, r3
  1086f0:	ba000020 	blt	108778 <__pack_d+0x164>
  1086f4:	e3500b01 	cmp	r0, #1024	; 0x400
  1086f8:	aaffffed 	bge	1086b4 <__pack_d+0xa0>
  1086fc:	e20a20ff 	and	r2, sl, #255	; 0xff
  108700:	e3a03000 	mov	r3, #0	; 0x0
  108704:	e2800fff 	add	r0, r0, #1020	; 0x3fc
  108708:	e3520080 	cmp	r2, #128	; 0x80
  10870c:	e2800003 	add	r0, r0, #3	; 0x3
  108710:	0a000054 	beq	108868 <__pack_d+0x254>
  108714:	e3a0307f 	mov	r3, #127	; 0x7f
  108718:	e3a04000 	mov	r4, #0	; 0x0
  10871c:	e09aa003 	adds	sl, sl, r3
  108720:	e0abb004 	adc	fp, fp, r4
  108724:	e37b021e 	cmn	fp, #-536870911	; 0xe0000001
  108728:	9a000002 	bls	108738 <__pack_d+0x124>
  10872c:	e1b0b0ab 	movs	fp, fp, lsr #1
  108730:	e1a0a06a 	mov	sl, sl, rrx
  108734:	e2800001 	add	r0, r0, #1	; 0x1
  108738:	e3c02b3e 	bic	r2, r0, #63488	; 0xf800
  10873c:	e3a04601 	mov	r4, #1048576	; 0x100000
  108740:	e1a0042a 	mov	r0, sl, lsr #8
  108744:	e1a02802 	mov	r2, r2, lsl #16
  108748:	e1800c0b 	orr	r0, r0, fp, lsl #24
  10874c:	e1a0142b 	mov	r1, fp, lsr #8
  108750:	e3e03000 	mvn	r3, #0	; 0x0
  108754:	e2444001 	sub	r4, r4, #1	; 0x1
  108758:	e0000003 	and	r0, r0, r3
  10875c:	e0011004 	and	r1, r1, r4
  108760:	e1a0c822 	mov	ip, r2, lsr #16
  108764:	eaffffbf 	b	108668 <__pack_d+0x54>
  108768:	e3a00000 	mov	r0, #0	; 0x0
  10876c:	e3a01000 	mov	r1, #0	; 0x0
  108770:	e3a0c000 	mov	ip, #0	; 0x0
  108774:	eaffffbb 	b	108668 <__pack_d+0x54>
  108778:	e26003bf 	rsb	r0, r0, #-67108862	; 0xfc000002
  10877c:	e28007ff 	add	r0, r0, #66846720	; 0x3fc0000
  108780:	e2800bff 	add	r0, r0, #261120	; 0x3fc00
  108784:	e3500038 	cmp	r0, #56	; 0x38
  108788:	c1a0000c 	movgt	r0, ip
  10878c:	c3a0a000 	movgt	sl, #0	; 0x0
  108790:	c3a0b000 	movgt	fp, #0	; 0x0
  108794:	ca00002a 	bgt	108844 <__pack_d+0x230>
  108798:	e1a0503a 	mov	r5, sl, lsr r0
  10879c:	e2601020 	rsb	r1, r0, #32	; 0x20
  1087a0:	e3a0e001 	mov	lr, #1	; 0x1
  1087a4:	e185511b 	orr	r5, r5, fp, lsl r1
  1087a8:	e18c413e 	orr	r4, ip, lr, lsr r1
  1087ac:	e2402020 	sub	r2, r0, #32	; 0x20
  1087b0:	e3520000 	cmp	r2, #0	; 0x0
  1087b4:	e1a0301e 	mov	r3, lr, lsl r0
  1087b8:	a1a0421e 	movge	r4, lr, lsl r2
  1087bc:	e1a01005 	mov	r1, r5
  1087c0:	a1a0123b 	movge	r1, fp, lsr r2
  1087c4:	e1a0003b 	mov	r0, fp, lsr r0
  1087c8:	e3e05000 	mvn	r5, #0	; 0x0
  1087cc:	e0933005 	adds	r3, r3, r5
  1087d0:	e3e06000 	mvn	r6, #0	; 0x0
  1087d4:	e0a44006 	adc	r4, r4, r6
  1087d8:	e00b2004 	and	r2, fp, r4
  1087dc:	e58d1000 	str	r1, [sp]
  1087e0:	e58d0004 	str	r0, [sp, #4]
  1087e4:	e00a1003 	and	r1, sl, r3
  1087e8:	e1911002 	orrs	r1, r1, r2
  1087ec:	e89d0060 	ldmia	sp, {r5, r6}
  1087f0:	e3a02000 	mov	r2, #0	; 0x0
  1087f4:	13a02001 	movne	r2, #1	; 0x1
  1087f8:	e1855002 	orr	r5, r5, r2
  1087fc:	e205a0ff 	and	sl, r5, #255	; 0xff
  108800:	e3a0b000 	mov	fp, #0	; 0x0
  108804:	e3a03000 	mov	r3, #0	; 0x0
  108808:	13a03000 	movne	r3, #0	; 0x0
  10880c:	e35a0080 	cmp	sl, #128	; 0x80
  108810:	e1866003 	orr	r6, r6, r3
  108814:	0a000020 	beq	10889c <__pack_d+0x288>
  108818:	e3a0307f 	mov	r3, #127	; 0x7f
  10881c:	e0933005 	adds	r3, r3, r5
  108820:	e3a04000 	mov	r4, #0	; 0x0
  108824:	e0a44006 	adc	r4, r4, r6
  108828:	e3540201 	cmp	r4, #268435456	; 0x10000000
  10882c:	31a0200c 	movcc	r2, ip
  108830:	21a0200e 	movcs	r2, lr
  108834:	e1a0a423 	mov	sl, r3, lsr #8
  108838:	e1a00002 	mov	r0, r2
  10883c:	e18aac04 	orr	sl, sl, r4, lsl #24
  108840:	e1a0b424 	mov	fp, r4, lsr #8
  108844:	e3c02b3e 	bic	r2, r0, #63488	; 0xf800
  108848:	e3a04601 	mov	r4, #1048576	; 0x100000
  10884c:	e1a02802 	mov	r2, r2, lsl #16
  108850:	e3e03000 	mvn	r3, #0	; 0x0
  108854:	e2444001 	sub	r4, r4, #1	; 0x1
  108858:	e00a0003 	and	r0, sl, r3
  10885c:	e00b1004 	and	r1, fp, r4
  108860:	e1a0c822 	mov	ip, r2, lsr #16
  108864:	eaffff7f 	b	108668 <__pack_d+0x54>
  108868:	e3530000 	cmp	r3, #0	; 0x0
  10886c:	1affffa8 	bne	108714 <__pack_d+0x100>
  108870:	e3a01c01 	mov	r1, #256	; 0x100
  108874:	e3a02000 	mov	r2, #0	; 0x0
  108878:	e00a3001 	and	r3, sl, r1
  10887c:	e00b4002 	and	r4, fp, r2
  108880:	e1933004 	orrs	r3, r3, r4
  108884:	0affffa6 	beq	108724 <__pack_d+0x110>
  108888:	e3a03080 	mov	r3, #128	; 0x80
  10888c:	e3a04000 	mov	r4, #0	; 0x0
  108890:	e09aa003 	adds	sl, sl, r3
  108894:	e0abb004 	adc	fp, fp, r4
  108898:	eaffffa1 	b	108724 <__pack_d+0x110>
  10889c:	e35b0000 	cmp	fp, #0	; 0x0
  1088a0:	1affffdc 	bne	108818 <__pack_d+0x204>
  1088a4:	e3a01c01 	mov	r1, #256	; 0x100
  1088a8:	e3a02000 	mov	r2, #0	; 0x0
  1088ac:	e0053001 	and	r3, r5, r1
  1088b0:	e0064002 	and	r4, r6, r2
  1088b4:	e1933004 	orrs	r3, r3, r4
  1088b8:	1a000006 	bne	1088d8 <__pack_d+0x2c4>
  1088bc:	e3560201 	cmp	r6, #268435456	; 0x10000000
  1088c0:	21a0300e 	movcs	r3, lr
  1088c4:	e1a0a425 	mov	sl, r5, lsr #8
  1088c8:	e1a00003 	mov	r0, r3
  1088cc:	e18aac06 	orr	sl, sl, r6, lsl #24
  1088d0:	e1a0b426 	mov	fp, r6, lsr #8
  1088d4:	eaffffda 	b	108844 <__pack_d+0x230>
  1088d8:	e3a03080 	mov	r3, #128	; 0x80
  1088dc:	e0933005 	adds	r3, r3, r5
  1088e0:	e3a04000 	mov	r4, #0	; 0x0
  1088e4:	e0a44006 	adc	r4, r4, r6
  1088e8:	e3540201 	cmp	r4, #268435456	; 0x10000000
  1088ec:	21a0200e 	movcs	r2, lr
  1088f0:	31a0200b 	movcc	r2, fp
  1088f4:	e1a0a423 	mov	sl, r3, lsr #8
  1088f8:	e1a00002 	mov	r0, r2
  1088fc:	e18aac04 	orr	sl, sl, r4, lsl #24
  108900:	e1a0b424 	mov	fp, r4, lsr #8
  108904:	eaffffce 	b	108844 <__pack_d+0x230>

00108908 <__unpack_d>:
  108908:	e92d0070 	stmdb	sp!, {r4, r5, r6}
  10890c:	e5904000 	ldr	r4, [r0]
  108910:	e1a02a24 	mov	r2, r4, lsr #20
  108914:	e5903004 	ldr	r3, [r0, #4]
  108918:	e3c22b3e 	bic	r2, r2, #63488	; 0xf800
  10891c:	e1a0c001 	mov	ip, r1
  108920:	e3c464ff 	bic	r6, r4, #-16777216	; 0xff000000
  108924:	e1a01fa4 	mov	r1, r4, lsr #31
  108928:	e2520000 	subs	r0, r2, #0	; 0x0
  10892c:	e1a05003 	mov	r5, r3
  108930:	e58c1004 	str	r1, [ip, #4]
  108934:	e3c6660f 	bic	r6, r6, #15728640	; 0xf00000
  108938:	1a000005 	bne	108954 <__unpack_d+0x4c>
  10893c:	e1953006 	orrs	r3, r5, r6
  108940:	03a03002 	moveq	r3, #2	; 0x2
  108944:	058c3000 	streq	r3, [ip]
  108948:	1a000014 	bne	1089a0 <__unpack_d+0x98>
  10894c:	e8bd0070 	ldmia	sp!, {r4, r5, r6}
  108950:	e12fff1e 	bx	lr
  108954:	e3a03e7f 	mov	r3, #2032	; 0x7f0
  108958:	e283300f 	add	r3, r3, #15	; 0xf
  10895c:	e1500003 	cmp	r0, r3
  108960:	0a000022 	beq	1089f0 <__unpack_d+0xe8>
  108964:	e1a04406 	mov	r4, r6, lsl #8
  108968:	e1844c25 	orr	r4, r4, r5, lsr #24
  10896c:	e1a03405 	mov	r3, r5, lsl #8
  108970:	e3a01000 	mov	r1, #0	; 0x0
  108974:	e3a02201 	mov	r2, #268435456	; 0x10000000
  108978:	e2400fff 	sub	r0, r0, #1020	; 0x3fc
  10897c:	e1835001 	orr	r5, r3, r1
  108980:	e1846002 	orr	r6, r4, r2
  108984:	e2400003 	sub	r0, r0, #3	; 0x3
  108988:	e3a03003 	mov	r3, #3	; 0x3
  10898c:	e58c500c 	str	r5, [ip, #12]
  108990:	e58c6010 	str	r6, [ip, #16]
  108994:	e58c0008 	str	r0, [ip, #8]
  108998:	e58c3000 	str	r3, [ip]
  10899c:	eaffffea 	b	10894c <__unpack_d+0x44>
  1089a0:	e1a02406 	mov	r2, r6, lsl #8
  1089a4:	e3e00fff 	mvn	r0, #1020	; 0x3fc
  1089a8:	e1822c25 	orr	r2, r2, r5, lsr #24
  1089ac:	e2400001 	sub	r0, r0, #1	; 0x1
  1089b0:	e3a03003 	mov	r3, #3	; 0x3
  1089b4:	e372021f 	cmn	r2, #-268435455	; 0xf0000001
  1089b8:	e1a01405 	mov	r1, r5, lsl #8
  1089bc:	e58c3000 	str	r3, [ip]
  1089c0:	e58c0008 	str	r0, [ip, #8]
  1089c4:	8a000006 	bhi	1089e4 <__unpack_d+0xdc>
  1089c8:	e1a03000 	mov	r3, r0
  1089cc:	e0911001 	adds	r1, r1, r1
  1089d0:	e0a22002 	adc	r2, r2, r2
  1089d4:	e372021f 	cmn	r2, #-268435455	; 0xf0000001
  1089d8:	e2433001 	sub	r3, r3, #1	; 0x1
  1089dc:	9afffffa 	bls	1089cc <__unpack_d+0xc4>
  1089e0:	e58c3008 	str	r3, [ip, #8]
  1089e4:	e58c100c 	str	r1, [ip, #12]
  1089e8:	e58c2010 	str	r2, [ip, #16]
  1089ec:	eaffffd6 	b	10894c <__unpack_d+0x44>
  1089f0:	e1953006 	orrs	r3, r5, r6
  1089f4:	03a03004 	moveq	r3, #4	; 0x4
  1089f8:	058c3000 	streq	r3, [ip]
  1089fc:	0affffd2 	beq	10894c <__unpack_d+0x44>
  108a00:	e3a01000 	mov	r1, #0	; 0x0
  108a04:	e3a02702 	mov	r2, #524288	; 0x80000
  108a08:	e0053001 	and	r3, r5, r1
  108a0c:	e0064002 	and	r4, r6, r2
  108a10:	e1933004 	orrs	r3, r3, r4
  108a14:	13a03001 	movne	r3, #1	; 0x1
  108a18:	158c3000 	strne	r3, [ip]
  108a1c:	058c3000 	streq	r3, [ip]
  108a20:	e58c500c 	str	r5, [ip, #12]
  108a24:	e58c6010 	str	r6, [ip, #16]
  108a28:	eaffffc7 	b	10894c <__unpack_d+0x44>

00108a2c <isnan>:
  108a2c:	e5900000 	ldr	r0, [r0]
  108a30:	e3500001 	cmp	r0, #1	; 0x1
  108a34:	83a00000 	movhi	r0, #0	; 0x0
  108a38:	93a00001 	movls	r0, #1	; 0x1
  108a3c:	e12fff1e 	bx	lr

00108a40 <isinf>:
  108a40:	e5900000 	ldr	r0, [r0]
  108a44:	e3500004 	cmp	r0, #4	; 0x4
  108a48:	13a00000 	movne	r0, #0	; 0x0
  108a4c:	03a00001 	moveq	r0, #1	; 0x1
  108a50:	e12fff1e 	bx	lr

00108a54 <iszero>:
  108a54:	e5900000 	ldr	r0, [r0]
  108a58:	e3500002 	cmp	r0, #2	; 0x2
  108a5c:	13a00000 	movne	r0, #0	; 0x0
  108a60:	03a00001 	moveq	r0, #1	; 0x1
  108a64:	e12fff1e 	bx	lr

00108a68 <__fpcmp_parts_d>:
  108a68:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  108a6c:	e1a04001 	mov	r4, r1
  108a70:	e1a05000 	mov	r5, r0
  108a74:	ebffffec 	bl	108a2c <isnan>
  108a78:	e3500000 	cmp	r0, #0	; 0x0
  108a7c:	0a000001 	beq	108a88 <__fpcmp_parts_d+0x20>
  108a80:	e3a00001 	mov	r0, #1	; 0x1
  108a84:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108a88:	e1a00004 	mov	r0, r4
  108a8c:	ebffffe6 	bl	108a2c <isnan>
  108a90:	e3500000 	cmp	r0, #0	; 0x0
  108a94:	1afffff9 	bne	108a80 <__fpcmp_parts_d+0x18>
  108a98:	e1a00005 	mov	r0, r5
  108a9c:	ebffffe7 	bl	108a40 <isinf>
  108aa0:	e3500000 	cmp	r0, #0	; 0x0
  108aa4:	1a000013 	bne	108af8 <__fpcmp_parts_d+0x90>
  108aa8:	e1a00004 	mov	r0, r4
  108aac:	ebffffe3 	bl	108a40 <isinf>
  108ab0:	e3500000 	cmp	r0, #0	; 0x0
  108ab4:	1a000021 	bne	108b40 <__fpcmp_parts_d+0xd8>
  108ab8:	e1a00005 	mov	r0, r5
  108abc:	ebffffe4 	bl	108a54 <iszero>
  108ac0:	e3500000 	cmp	r0, #0	; 0x0
  108ac4:	1a000017 	bne	108b28 <__fpcmp_parts_d+0xc0>
  108ac8:	e1a00004 	mov	r0, r4
  108acc:	ebffffe0 	bl	108a54 <iszero>
  108ad0:	e3500000 	cmp	r0, #0	; 0x0
  108ad4:	1a00000f 	bne	108b18 <__fpcmp_parts_d+0xb0>
  108ad8:	e595c004 	ldr	ip, [r5, #4]
  108adc:	e5943004 	ldr	r3, [r4, #4]
  108ae0:	e15c0003 	cmp	ip, r3
  108ae4:	0a000019 	beq	108b50 <__fpcmp_parts_d+0xe8>
  108ae8:	e35c0000 	cmp	ip, #0	; 0x0
  108aec:	0affffe3 	beq	108a80 <__fpcmp_parts_d+0x18>
  108af0:	e3e00000 	mvn	r0, #0	; 0x0
  108af4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108af8:	e1a00004 	mov	r0, r4
  108afc:	ebffffcf 	bl	108a40 <isinf>
  108b00:	e3500000 	cmp	r0, #0	; 0x0
  108b04:	0a000003 	beq	108b18 <__fpcmp_parts_d+0xb0>
  108b08:	e5942004 	ldr	r2, [r4, #4]
  108b0c:	e5953004 	ldr	r3, [r5, #4]
  108b10:	e0630002 	rsb	r0, r3, r2
  108b14:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108b18:	e5953004 	ldr	r3, [r5, #4]
  108b1c:	e3530000 	cmp	r3, #0	; 0x0
  108b20:	0affffd6 	beq	108a80 <__fpcmp_parts_d+0x18>
  108b24:	eafffff1 	b	108af0 <__fpcmp_parts_d+0x88>
  108b28:	e1a00004 	mov	r0, r4
  108b2c:	ebffffc8 	bl	108a54 <iszero>
  108b30:	e3500000 	cmp	r0, #0	; 0x0
  108b34:	0a000001 	beq	108b40 <__fpcmp_parts_d+0xd8>
  108b38:	e3a00000 	mov	r0, #0	; 0x0
  108b3c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108b40:	e5943004 	ldr	r3, [r4, #4]
  108b44:	e3530000 	cmp	r3, #0	; 0x0
  108b48:	1affffcc 	bne	108a80 <__fpcmp_parts_d+0x18>
  108b4c:	eaffffe7 	b	108af0 <__fpcmp_parts_d+0x88>
  108b50:	e5952008 	ldr	r2, [r5, #8]
  108b54:	e5943008 	ldr	r3, [r4, #8]
  108b58:	e1520003 	cmp	r2, r3
  108b5c:	caffffe1 	bgt	108ae8 <__fpcmp_parts_d+0x80>
  108b60:	ba00000b 	blt	108b94 <__fpcmp_parts_d+0x12c>
  108b64:	e285200c 	add	r2, r5, #12	; 0xc
  108b68:	e892000c 	ldmia	r2, {r2, r3}
  108b6c:	e284000c 	add	r0, r4, #12	; 0xc
  108b70:	e8900003 	ldmia	r0, {r0, r1}
  108b74:	e1530001 	cmp	r3, r1
  108b78:	8affffda 	bhi	108ae8 <__fpcmp_parts_d+0x80>
  108b7c:	0a000007 	beq	108ba0 <__fpcmp_parts_d+0x138>
  108b80:	e1510003 	cmp	r1, r3
  108b84:	8a000002 	bhi	108b94 <__fpcmp_parts_d+0x12c>
  108b88:	1affffea 	bne	108b38 <__fpcmp_parts_d+0xd0>
  108b8c:	e1500002 	cmp	r0, r2
  108b90:	9affffe8 	bls	108b38 <__fpcmp_parts_d+0xd0>
  108b94:	e35c0000 	cmp	ip, #0	; 0x0
  108b98:	1affffb8 	bne	108a80 <__fpcmp_parts_d+0x18>
  108b9c:	eaffffd3 	b	108af0 <__fpcmp_parts_d+0x88>
  108ba0:	e1520000 	cmp	r2, r0
  108ba4:	9afffff5 	bls	108b80 <__fpcmp_parts_d+0x118>
  108ba8:	eaffffce 	b	108ae8 <__fpcmp_parts_d+0x80>

00108bac <vApplicationIdleHook>:
  108bac:	e3a034a5 	mov	r3, #-1526726656	; 0xa5000000
  108bb0:	e2833001 	add	r3, r3, #1	; 0x1
  108bb4:	e3e02c02 	mvn	r2, #512	; 0x200
  108bb8:	e50230bf 	str	r3, [r2, #-191]
  108bbc:	e12fff1e 	bx	lr

00108bc0 <vResetEnv>:
  108bc0:	e59f0008 	ldr	r0, [pc, #8]	; 108bd0 <prog+0x8b8c>
  108bc4:	e3a01000 	mov	r1, #0	; 0x0
  108bc8:	e3a02080 	mov	r2, #128	; 0x80
  108bcc:	eaffdfa3 	b	100a60 <memset>
  108bd0:	0020116c 	eoreq	r1, r0, ip, ror #2

00108bd4 <mainloop>:
  108bd4:	e3a04000 	mov	r4, #0	; 0x0
  108bd8:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  108bdc:	e3a0200c 	mov	r2, #12	; 0xc
  108be0:	e5834031 	str	r4, [r3, #49]
  108be4:	e2833b03 	add	r3, r3, #3072	; 0xc00
  108be8:	e24dd008 	sub	sp, sp, #8	; 0x8
  108bec:	e50320ef 	str	r2, [r3, #-239]
  108bf0:	eb0000ae 	bl	108eb0 <led_init>
  108bf4:	eb0000d9 	bl	108f60 <env_init>
  108bf8:	eb0000dd 	bl	108f74 <env_load>
  108bfc:	e1500004 	cmp	r0, r4
  108c00:	0a00000c 	beq	108c38 <mainloop+0x64>
  108c04:	eb00000f 	bl	108c48 <vUSBShellInit>
  108c08:	e3a0c002 	mov	ip, #2	; 0x2
  108c0c:	e1a03004 	mov	r3, r4
  108c10:	e59f1028 	ldr	r1, [pc, #40]	; 108c40 <prog+0x8bfc>
  108c14:	e3a02c02 	mov	r2, #512	; 0x200
  108c18:	e59f0024 	ldr	r0, [pc, #36]	; 108c44 <prog+0x8c00>
  108c1c:	e58dc000 	str	ip, [sp]
  108c20:	e58d4004 	str	r4, [sp, #4]
  108c24:	eb000416 	bl	109c84 <xTaskCreate>
  108c28:	e3a00001 	mov	r0, #1	; 0x1
  108c2c:	eb0000a5 	bl	108ec8 <led_set_green>
  108c30:	eb0004a2 	bl	109ec0 <vTaskStartScheduler>
  108c34:	eafffffe 	b	108c34 <mainloop+0x60>
  108c38:	ebffffe0 	bl	108bc0 <vResetEnv>
  108c3c:	eafffff0 	b	108c04 <mainloop+0x30>
  108c40:	0010b83c 	andeqs	fp, r0, ip, lsr r8
  108c44:	0010aa9c 	muleqs	r0, ip, sl

00108c48 <vUSBShellInit>:
  108c48:	e52de004 	str	lr, [sp, #-4]!
  108c4c:	e3a0c000 	mov	ip, #0	; 0x0
  108c50:	e24dd008 	sub	sp, sp, #8	; 0x8
  108c54:	e1a0300c 	mov	r3, ip
  108c58:	e59f1018 	ldr	r1, [pc, #24]	; 108c78 <prog+0x8c34>
  108c5c:	e3a02c02 	mov	r2, #512	; 0x200
  108c60:	e59f0014 	ldr	r0, [pc, #20]	; 108c7c <prog+0x8c38>
  108c64:	e58dc000 	str	ip, [sp]
  108c68:	e58dc004 	str	ip, [sp, #4]
  108c6c:	eb000404 	bl	109c84 <xTaskCreate>
  108c70:	e28dd008 	add	sp, sp, #8	; 0x8
  108c74:	e8bd8000 	ldmia	sp!, {pc}
  108c78:	0010b840 	andeqs	fp, r0, r0, asr #16
  108c7c:	00108ce8 	andeqs	r8, r0, r8, ror #25

00108c80 <printDebug>:
  108c80:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  108c84:	e59f5058 	ldr	r5, [pc, #88]	; 108ce4 <prog+0x8ca0>
  108c88:	e2854007 	add	r4, r5, #7	; 0x7
  108c8c:	e24dd004 	sub	sp, sp, #4	; 0x4
  108c90:	e1a01000 	mov	r1, r0
  108c94:	e3a06000 	mov	r6, #0	; 0x0
  108c98:	e3a03003 	mov	r3, #3	; 0x3
  108c9c:	e1a00004 	mov	r0, r4
  108ca0:	e5c53002 	strb	r3, [r5, #2]
  108ca4:	e5c56001 	strb	r6, [r5, #1]
  108ca8:	ebffdf94 	bl	100b00 <sprintf>
  108cac:	e1a00004 	mov	r0, r4
  108cb0:	ebffdfc9 	bl	100bdc <strlen>
  108cb4:	e2804004 	add	r4, r0, #4	; 0x4
  108cb8:	e20440ff 	and	r4, r4, #255	; 0xff
  108cbc:	e3e0c000 	mvn	ip, #0	; 0x0
  108cc0:	e1a02006 	mov	r2, r6
  108cc4:	e1a00005 	mov	r0, r5
  108cc8:	e2841004 	add	r1, r4, #4	; 0x4
  108ccc:	e1a03006 	mov	r3, r6
  108cd0:	e58dc000 	str	ip, [sp]
  108cd4:	e5c54000 	strb	r4, [r5]
  108cd8:	eb0006d5 	bl	10a834 <usb_send_buffer_zero_copy>
  108cdc:	e28dd004 	add	sp, sp, #4	; 0x4
  108ce0:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  108ce4:	00200b90 	mlaeq	r0, r0, fp, r0

00108ce8 <usbshell_task>:
  108ce8:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  108cec:	e3a06c4e 	mov	r6, #19968	; 0x4e00
  108cf0:	e24dd004 	sub	sp, sp, #4	; 0x4
  108cf4:	e2866020 	add	r6, r6, #32	; 0x20
  108cf8:	e3a05000 	mov	r5, #0	; 0x0
  108cfc:	e28d4003 	add	r4, sp, #3	; 0x3
  108d00:	ea000001 	b	108d0c <usbshell_task+0x24>
  108d04:	e1550006 	cmp	r5, r6
  108d08:	0a000020 	beq	108d90 <usbshell_task+0xa8>
  108d0c:	e1a00004 	mov	r0, r4
  108d10:	e3a01001 	mov	r1, #1	; 0x1
  108d14:	e3a02064 	mov	r2, #100	; 0x64
  108d18:	eb0006a3 	bl	10a7ac <vUSBRecvByte>
  108d1c:	e3500000 	cmp	r0, #0	; 0x0
  108d20:	e2855001 	add	r5, r5, #1	; 0x1
  108d24:	0afffff6 	beq	108d04 <usbshell_task+0x1c>
  108d28:	e3a05001 	mov	r5, #1	; 0x1
  108d2c:	ea000004 	b	108d44 <usbshell_task+0x5c>
  108d30:	e3550001 	cmp	r5, #1	; 0x1
  108d34:	0a000008 	beq	108d5c <usbshell_task+0x74>
  108d38:	e59f0058 	ldr	r0, [pc, #88]	; 108d98 <prog+0x8d54>
  108d3c:	ebffffcf 	bl	108c80 <printDebug>
  108d40:	e3a05000 	mov	r5, #0	; 0x0
  108d44:	e1a00004 	mov	r0, r4
  108d48:	e3a01001 	mov	r1, #1	; 0x1
  108d4c:	e3a02064 	mov	r2, #100	; 0x64
  108d50:	eb000695 	bl	10a7ac <vUSBRecvByte>
  108d54:	e3500000 	cmp	r0, #0	; 0x0
  108d58:	0afffff4 	beq	108d30 <usbshell_task+0x48>
  108d5c:	e1a00004 	mov	r0, r4
  108d60:	e3a01001 	mov	r1, #1	; 0x1
  108d64:	e3a02064 	mov	r2, #100	; 0x64
  108d68:	eb00068f 	bl	10a7ac <vUSBRecvByte>
  108d6c:	e3500000 	cmp	r0, #0	; 0x0
  108d70:	0afffff0 	beq	108d38 <usbshell_task+0x50>
  108d74:	e1a00004 	mov	r0, r4
  108d78:	e3a01001 	mov	r1, #1	; 0x1
  108d7c:	e3a02064 	mov	r2, #100	; 0x64
  108d80:	eb000689 	bl	10a7ac <vUSBRecvByte>
  108d84:	e3500000 	cmp	r0, #0	; 0x0
  108d88:	1afffff3 	bne	108d5c <usbshell_task+0x74>
  108d8c:	eaffffe9 	b	108d38 <usbshell_task+0x50>
  108d90:	e1a05000 	mov	r5, r0
  108d94:	eaffffea 	b	108d44 <usbshell_task+0x5c>
  108d98:	0010b84c 	andeqs	fp, r0, ip, asr #16

00108d9c <_close_r>:
  108d9c:	e3a00000 	mov	r0, #0	; 0x0
  108da0:	e12fff1e 	bx	lr

00108da4 <_lseek_r>:
  108da4:	e3a00000 	mov	r0, #0	; 0x0
  108da8:	e12fff1e 	bx	lr

00108dac <_fstat_r>:
  108dac:	e3a03a02 	mov	r3, #8192	; 0x2000
  108db0:	e3a00000 	mov	r0, #0	; 0x0
  108db4:	e5823004 	str	r3, [r2, #4]
  108db8:	e12fff1e 	bx	lr

00108dbc <_sbrk_r>:
  108dbc:	e59f2018 	ldr	r2, [pc, #24]	; 108ddc <prog+0x8d98>
  108dc0:	e5920000 	ldr	r0, [r2]
  108dc4:	e3500000 	cmp	r0, #0	; 0x0
  108dc8:	059f0010 	ldreq	r0, [pc, #16]	; 108de0 <prog+0x8d9c>
  108dcc:	e0803001 	add	r3, r0, r1
  108dd0:	05820000 	streq	r0, [r2]
  108dd4:	e5823000 	str	r3, [r2]
  108dd8:	e12fff1e 	bx	lr
  108ddc:	00200914 	eoreq	r0, r0, r4, lsl r9
  108de0:	002011f0 	streqd	r1, [r0], -r0

00108de4 <my_putc>:
  108de4:	e20000ff 	and	r0, r0, #255	; 0xff
  108de8:	ea0006a1 	b	10a874 <vUSBSendByte>

00108dec <_write_r>:
  108dec:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  108df0:	e2536000 	subs	r6, r3, #0	; 0x0
  108df4:	e1a05002 	mov	r5, r2
  108df8:	0a000011 	beq	108e44 <_write_r+0x58>
  108dfc:	e3a04000 	mov	r4, #0	; 0x0
  108e00:	ea000004 	b	108e18 <_write_r+0x2c>
  108e04:	e1a00003 	mov	r0, r3
  108e08:	e2844001 	add	r4, r4, #1	; 0x1
  108e0c:	ebfffff4 	bl	108de4 <my_putc>
  108e10:	e1560004 	cmp	r6, r4
  108e14:	0a00000a 	beq	108e44 <_write_r+0x58>
  108e18:	e7d43005 	ldrb	r3, [r4, r5]
  108e1c:	e353000a 	cmp	r3, #10	; 0xa
  108e20:	e3a0000d 	mov	r0, #13	; 0xd
  108e24:	1afffff6 	bne	108e04 <_write_r+0x18>
  108e28:	ebffffed 	bl	108de4 <my_putc>
  108e2c:	e7d43005 	ldrb	r3, [r4, r5]
  108e30:	e2844001 	add	r4, r4, #1	; 0x1
  108e34:	e1a00003 	mov	r0, r3
  108e38:	ebffffe9 	bl	108de4 <my_putc>
  108e3c:	e1560004 	cmp	r6, r4
  108e40:	1afffff4 	bne	108e18 <_write_r+0x2c>
  108e44:	e1a00006 	mov	r0, r6
  108e48:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

00108e4c <_read_r>:
  108e4c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  108e50:	e2535000 	subs	r5, r3, #0	; 0x0
  108e54:	e24dd004 	sub	sp, sp, #4	; 0x4
  108e58:	e1a06002 	mov	r6, r2
  108e5c:	01a04005 	moveq	r4, r5
  108e60:	0a00000f 	beq	108ea4 <_read_r+0x58>
  108e64:	e3a04000 	mov	r4, #0	; 0x0
  108e68:	e28d7003 	add	r7, sp, #3	; 0x3
  108e6c:	ea000003 	b	108e80 <_read_r+0x34>
  108e70:	e7c40006 	strb	r0, [r4, r6]
  108e74:	e2844001 	add	r4, r4, #1	; 0x1
  108e78:	e1550004 	cmp	r5, r4
  108e7c:	0a000008 	beq	108ea4 <_read_r+0x58>
  108e80:	e1a00007 	mov	r0, r7
  108e84:	e3a01001 	mov	r1, #1	; 0x1
  108e88:	e3e02000 	mvn	r2, #0	; 0x0
  108e8c:	eb000646 	bl	10a7ac <vUSBRecvByte>
  108e90:	e20000ff 	and	r0, r0, #255	; 0xff
  108e94:	e350000d 	cmp	r0, #13	; 0xd
  108e98:	1afffff4 	bne	108e70 <_read_r+0x24>
  108e9c:	e3a03000 	mov	r3, #0	; 0x0
  108ea0:	e7c63004 	strb	r3, [r6, r4]
  108ea4:	e0640005 	rsb	r0, r4, r5
  108ea8:	e28dd004 	add	sp, sp, #4	; 0x4
  108eac:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

00108eb0 <led_init>:
  108eb0:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  108eb4:	e3a03501 	mov	r3, #4194304	; 0x400000
  108eb8:	e50230ff 	str	r3, [r2, #-255]
  108ebc:	e50230ef 	str	r3, [r2, #-239]
  108ec0:	e50230cf 	str	r3, [r2, #-207]
  108ec4:	e12fff1e 	bx	lr

00108ec8 <led_set_green>:
  108ec8:	e31000ff 	tst	r0, #255	; 0xff
  108ecc:	13a02501 	movne	r2, #4194304	; 0x400000
  108ed0:	13e03c0b 	mvnne	r3, #2816	; 0xb00
  108ed4:	03a02501 	moveq	r2, #4194304	; 0x400000
  108ed8:	03e03c0b 	mvneq	r3, #2816	; 0xb00
  108edc:	150320cb 	strne	r2, [r3, #-203]
  108ee0:	050320cf 	streq	r2, [r3, #-207]
  108ee4:	e12fff1e 	bx	lr

00108ee8 <env_crc16>:
  108ee8:	e3500000 	cmp	r0, #0	; 0x0
  108eec:	13510000 	cmpne	r1, #0	; 0x0
  108ef0:	e52de004 	str	lr, [sp, #-4]!
  108ef4:	e1a0e000 	mov	lr, r0
  108ef8:	0a000015 	beq	108f54 <env_crc16+0x6c>
  108efc:	e3510000 	cmp	r1, #0	; 0x0
  108f00:	0a000013 	beq	108f54 <env_crc16+0x6c>
  108f04:	e3a00801 	mov	r0, #65536	; 0x10000
  108f08:	e2400001 	sub	r0, r0, #1	; 0x1
  108f0c:	e3a0c000 	mov	ip, #0	; 0x0
  108f10:	e7dc200e 	ldrb	r2, [ip, lr]
  108f14:	e1a03400 	mov	r3, r0, lsl #8
  108f18:	e1833420 	orr	r3, r3, r0, lsr #8
  108f1c:	e0233002 	eor	r3, r3, r2
  108f20:	e1a03803 	mov	r3, r3, lsl #16
  108f24:	e1a03823 	mov	r3, r3, lsr #16
  108f28:	e20320ff 	and	r2, r3, #255	; 0xff
  108f2c:	e0233222 	eor	r3, r3, r2, lsr #4
  108f30:	e0233603 	eor	r3, r3, r3, lsl #12
  108f34:	e1a03803 	mov	r3, r3, lsl #16
  108f38:	e1a03823 	mov	r3, r3, lsr #16
  108f3c:	e28cc001 	add	ip, ip, #1	; 0x1
  108f40:	e20320ff 	and	r2, r3, #255	; 0xff
  108f44:	e15c0001 	cmp	ip, r1
  108f48:	e0230282 	eor	r0, r3, r2, lsl #5
  108f4c:	1affffef 	bne	108f10 <env_crc16+0x28>
  108f50:	e49df004 	ldr	pc, [sp], #4
  108f54:	e3a00801 	mov	r0, #65536	; 0x10000
  108f58:	e2400001 	sub	r0, r0, #1	; 0x1
  108f5c:	e49df004 	ldr	pc, [sp], #4

00108f60 <env_init>:
  108f60:	e3a03831 	mov	r3, #3211264	; 0x310000
  108f64:	e2833c03 	add	r3, r3, #768	; 0x300
  108f68:	e3e02000 	mvn	r2, #0	; 0x0
  108f6c:	e502309f 	str	r3, [r2, #-159]
  108f70:	e12fff1e 	bx	lr

00108f74 <env_load>:
  108f74:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  108f78:	e59f50b8 	ldr	r5, [pc, #184]	; 109038 <prog+0x8ff4>
  108f7c:	e3a0194f 	mov	r1, #1294336	; 0x13c000
  108f80:	e2811a03 	add	r1, r1, #12288	; 0x3000
  108f84:	e3a02080 	mov	r2, #128	; 0x80
  108f88:	e1a00005 	mov	r0, r5
  108f8c:	ebffde8b 	bl	1009c0 <memcpy>
  108f90:	e5d52001 	ldrb	r2, [r5, #1]
  108f94:	e5d53000 	ldrb	r3, [r5]
  108f98:	e5d51002 	ldrb	r1, [r5, #2]
  108f9c:	e1833402 	orr	r3, r3, r2, lsl #8
  108fa0:	e5d50003 	ldrb	r0, [r5, #3]
  108fa4:	e3e024f3 	mvn	r2, #-218103808	; 0xf3000000
  108fa8:	e1833801 	orr	r3, r3, r1, lsl #16
  108fac:	e24229cd 	sub	r2, r2, #3358720	; 0x334000
  108fb0:	e1833c00 	orr	r3, r3, r0, lsl #24
  108fb4:	e2422e11 	sub	r2, r2, #272	; 0x110
  108fb8:	e1530002 	cmp	r3, r2
  108fbc:	0a000001 	beq	108fc8 <env_load+0x54>
  108fc0:	e3a00000 	mov	r0, #0	; 0x0
  108fc4:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  108fc8:	e5d53004 	ldrb	r3, [r5, #4]
  108fcc:	e5d52005 	ldrb	r2, [r5, #5]
  108fd0:	e5d5c006 	ldrb	ip, [r5, #6]
  108fd4:	e5d51007 	ldrb	r1, [r5, #7]
  108fd8:	e1833402 	orr	r3, r3, r2, lsl #8
  108fdc:	e183380c 	orr	r3, r3, ip, lsl #16
  108fe0:	e1833c01 	orr	r3, r3, r1, lsl #24
  108fe4:	e3530080 	cmp	r3, #128	; 0x80
  108fe8:	e1a00005 	mov	r0, r5
  108fec:	e3a0e000 	mov	lr, #0	; 0x0
  108ff0:	e1a01003 	mov	r1, r3
  108ff4:	1afffff1 	bne	108fc0 <env_load+0x4c>
  108ff8:	e5d54008 	ldrb	r4, [r5, #8]
  108ffc:	e5d53009 	ldrb	r3, [r5, #9]
  109000:	e5d5200a 	ldrb	r2, [r5, #10]
  109004:	e5d5c00b 	ldrb	ip, [r5, #11]
  109008:	e1844403 	orr	r4, r4, r3, lsl #8
  10900c:	e1844802 	orr	r4, r4, r2, lsl #16
  109010:	e1844c0c 	orr	r4, r4, ip, lsl #24
  109014:	e5c5e00b 	strb	lr, [r5, #11]
  109018:	e5c5e008 	strb	lr, [r5, #8]
  10901c:	e5c5e009 	strb	lr, [r5, #9]
  109020:	e5c5e00a 	strb	lr, [r5, #10]
  109024:	ebffffaf 	bl	108ee8 <env_crc16>
  109028:	e1540000 	cmp	r4, r0
  10902c:	13a00000 	movne	r0, #0	; 0x0
  109030:	03a00001 	moveq	r0, #1	; 0x1
  109034:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  109038:	0020116c 	eoreq	r1, r0, ip, ror #2

0010903c <AT91F_LowLevelInit>:
  10903c:	e3a0184b 	mov	r1, #4915200	; 0x4b0000
  109040:	e3a00502 	mov	r0, #8388608	; 0x800000
  109044:	e3a0cc06 	mov	ip, #1536	; 0x600
  109048:	e52de004 	str	lr, [sp, #-4]!
  10904c:	e2811c01 	add	r1, r1, #256	; 0x100
  109050:	e2800d82 	add	r0, r0, #8320	; 0x2080
  109054:	e28cc001 	add	ip, ip, #1	; 0x1
  109058:	e3e0ec03 	mvn	lr, #768	; 0x300
  10905c:	e3e03000 	mvn	r3, #0	; 0x0
  109060:	e3e02c02 	mvn	r2, #512	; 0x200
  109064:	e503109f 	str	r1, [r3, #-159]
  109068:	e50200bb 	str	r0, [r2, #-187]
  10906c:	e50ec0df 	str	ip, [lr, #-223]
  109070:	e51e3097 	ldr	r3, [lr, #-151]
  109074:	e3130001 	tst	r3, #1	; 0x1
  109078:	0afffffc 	beq	109070 <AT91F_LowLevelInit+0x34>
  10907c:	e3a03819 	mov	r3, #1638400	; 0x190000
  109080:	e2833b07 	add	r3, r3, #7168	; 0x1c00
  109084:	e2833005 	add	r3, r3, #5	; 0x5
  109088:	e50e30d3 	str	r3, [lr, #-211]
  10908c:	e3e02c03 	mvn	r2, #768	; 0x300
  109090:	e5123097 	ldr	r3, [r2, #-151]
  109094:	e3130004 	tst	r3, #4	; 0x4
  109098:	0afffffc 	beq	109090 <AT91F_LowLevelInit+0x54>
  10909c:	e3a03004 	mov	r3, #4	; 0x4
  1090a0:	e50230cf 	str	r3, [r2, #-207]
  1090a4:	e3e02c03 	mvn	r2, #768	; 0x300
  1090a8:	e5123097 	ldr	r3, [r2, #-151]
  1090ac:	e3130008 	tst	r3, #8	; 0x8
  1090b0:	0afffffc 	beq	1090a8 <AT91F_LowLevelInit+0x6c>
  1090b4:	e51230cf 	ldr	r3, [r2, #-207]
  1090b8:	e3833003 	orr	r3, r3, #3	; 0x3
  1090bc:	e50230cf 	str	r3, [r2, #-207]
  1090c0:	e3e02c03 	mvn	r2, #768	; 0x300
  1090c4:	e5123097 	ldr	r3, [r2, #-151]
  1090c8:	e3130008 	tst	r3, #8	; 0x8
  1090cc:	0afffffc 	beq	1090c4 <AT91F_LowLevelInit+0x88>
  1090d0:	e49df004 	ldr	pc, [sp], #4

001090d4 <AT91F_AIC_ConfigureIt>:
  1090d4:	e92d4010 	stmdb	sp!, {r4, lr}
  1090d8:	e3a0e001 	mov	lr, #1	; 0x1
  1090dc:	e1a0e01e 	mov	lr, lr, lsl r0
  1090e0:	e1a0c100 	mov	ip, r0, lsl #2
  1090e4:	e51c0f80 	ldr	r0, [ip, #-3968]
  1090e8:	e1822001 	orr	r2, r2, r1
  1090ec:	e24c4a01 	sub	r4, ip, #4096	; 0x1000
  1090f0:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  1090f4:	e1a00003 	mov	r0, r3
  1090f8:	e581e025 	str	lr, [r1, #37]
  1090fc:	e50c3f80 	str	r3, [ip, #-3968]
  109100:	e5842000 	str	r2, [r4]
  109104:	e581e029 	str	lr, [r1, #41]
  109108:	e8bd8010 	ldmia	sp!, {r4, pc}

0010910c <vListInitialise>:
  10910c:	e3e03000 	mvn	r3, #0	; 0x0
  109110:	e5803008 	str	r3, [r0, #8]
  109114:	e2802008 	add	r2, r0, #8	; 0x8
  109118:	e2833001 	add	r3, r3, #1	; 0x1
  10911c:	e580200c 	str	r2, [r0, #12]
  109120:	e5802010 	str	r2, [r0, #16]
  109124:	e5802004 	str	r2, [r0, #4]
  109128:	e5803000 	str	r3, [r0]
  10912c:	e12fff1e 	bx	lr

00109130 <vListInitialiseItem>:
  109130:	e3a03000 	mov	r3, #0	; 0x0
  109134:	e5803010 	str	r3, [r0, #16]
  109138:	e12fff1e 	bx	lr

0010913c <vListInsertEnd>:
  10913c:	e5902004 	ldr	r2, [r0, #4]
  109140:	e5923004 	ldr	r3, [r2, #4]
  109144:	e5813004 	str	r3, [r1, #4]
  109148:	e592c004 	ldr	ip, [r2, #4]
  10914c:	e5812008 	str	r2, [r1, #8]
  109150:	e58c1008 	str	r1, [ip, #8]
  109154:	e5821004 	str	r1, [r2, #4]
  109158:	e5903000 	ldr	r3, [r0]
  10915c:	e2833001 	add	r3, r3, #1	; 0x1
  109160:	e5803000 	str	r3, [r0]
  109164:	e5810010 	str	r0, [r1, #16]
  109168:	e5801004 	str	r1, [r0, #4]
  10916c:	e12fff1e 	bx	lr

00109170 <vListInsert>:
  109170:	e52de004 	str	lr, [sp, #-4]!
  109174:	e591e000 	ldr	lr, [r1]
  109178:	e37e0001 	cmn	lr, #1	; 0x1
  10917c:	0590c010 	ldreq	ip, [r0, #16]
  109180:	0a000009 	beq	1091ac <vListInsert+0x3c>
  109184:	e280c008 	add	ip, r0, #8	; 0x8
  109188:	e59c3004 	ldr	r3, [ip, #4]
  10918c:	e5932000 	ldr	r2, [r3]
  109190:	e15e0002 	cmp	lr, r2
  109194:	3a000004 	bcc	1091ac <vListInsert+0x3c>
  109198:	e59cc004 	ldr	ip, [ip, #4]
  10919c:	e59c3004 	ldr	r3, [ip, #4]
  1091a0:	e5932000 	ldr	r2, [r3]
  1091a4:	e15e0002 	cmp	lr, r2
  1091a8:	2afffffa 	bcs	109198 <vListInsert+0x28>
  1091ac:	e59c3004 	ldr	r3, [ip, #4]
  1091b0:	e5831008 	str	r1, [r3, #8]
  1091b4:	e5813004 	str	r3, [r1, #4]
  1091b8:	e58c1004 	str	r1, [ip, #4]
  1091bc:	e5903000 	ldr	r3, [r0]
  1091c0:	e2833001 	add	r3, r3, #1	; 0x1
  1091c4:	e5803000 	str	r3, [r0]
  1091c8:	e5810010 	str	r0, [r1, #16]
  1091cc:	e581c008 	str	ip, [r1, #8]
  1091d0:	e49df004 	ldr	pc, [sp], #4

001091d4 <vListRemove>:
  1091d4:	e5903004 	ldr	r3, [r0, #4]
  1091d8:	e5902008 	ldr	r2, [r0, #8]
  1091dc:	e5832008 	str	r2, [r3, #8]
  1091e0:	e5902008 	ldr	r2, [r0, #8]
  1091e4:	e5901010 	ldr	r1, [r0, #16]
  1091e8:	e5823004 	str	r3, [r2, #4]
  1091ec:	e5913004 	ldr	r3, [r1, #4]
  1091f0:	e1530000 	cmp	r3, r0
  1091f4:	e5913000 	ldr	r3, [r1]
  1091f8:	05812004 	streq	r2, [r1, #4]
  1091fc:	e2433001 	sub	r3, r3, #1	; 0x1
  109200:	e3a02000 	mov	r2, #0	; 0x0
  109204:	e5802010 	str	r2, [r0, #16]
  109208:	e5813000 	str	r3, [r1]
  10920c:	e12fff1e 	bx	lr

00109210 <uxQueueMessagesWaiting>:
  109210:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  109214:	e1a04000 	mov	r4, r0
  109218:	eb0004d6 	bl	10a578 <vPortEnterCritical>
  10921c:	e5945038 	ldr	r5, [r4, #56]
  109220:	eb0004df 	bl	10a5a4 <vPortExitCritical>
  109224:	e1a00005 	mov	r0, r5
  109228:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

0010922c <prvCopyDataFromQueue>:
  10922c:	e92d4010 	stmdb	sp!, {r4, lr}
  109230:	e5904000 	ldr	r4, [r0]
  109234:	e3540000 	cmp	r4, #0	; 0x0
  109238:	e1a0e000 	mov	lr, r0
  10923c:	e1a00001 	mov	r0, r1
  109240:	08bd8010 	ldmeqia	sp!, {r4, pc}
  109244:	e59ec00c 	ldr	ip, [lr, #12]
  109248:	e59e3040 	ldr	r3, [lr, #64]
  10924c:	e59e1004 	ldr	r1, [lr, #4]
  109250:	e08cc003 	add	ip, ip, r3
  109254:	e15c0001 	cmp	ip, r1
  109258:	e58ec00c 	str	ip, [lr, #12]
  10925c:	21a0c004 	movcs	ip, r4
  109260:	e1a02003 	mov	r2, r3
  109264:	e1a0100c 	mov	r1, ip
  109268:	258ec00c 	strcs	ip, [lr, #12]
  10926c:	e8bd4010 	ldmia	sp!, {r4, lr}
  109270:	eaffddd2 	b	1009c0 <memcpy>

00109274 <prvCopyDataToQueue>:
  109274:	e5903040 	ldr	r3, [r0, #64]
  109278:	e3530000 	cmp	r3, #0	; 0x0
  10927c:	e92d4010 	stmdb	sp!, {r4, lr}
  109280:	e1a04000 	mov	r4, r0
  109284:	e1a00002 	mov	r0, r2
  109288:	0a00000e 	beq	1092c8 <prvCopyDataToQueue+0x54>
  10928c:	e3500000 	cmp	r0, #0	; 0x0
  109290:	e1a02003 	mov	r2, r3
  109294:	0a00000f 	beq	1092d8 <prvCopyDataToQueue+0x64>
  109298:	e1a02003 	mov	r2, r3
  10929c:	e594000c 	ldr	r0, [r4, #12]
  1092a0:	ebffddc6 	bl	1009c0 <memcpy>
  1092a4:	e594300c 	ldr	r3, [r4, #12]
  1092a8:	e5941040 	ldr	r1, [r4, #64]
  1092ac:	e5942000 	ldr	r2, [r4]
  1092b0:	e0613003 	rsb	r3, r1, r3
  1092b4:	e1530002 	cmp	r3, r2
  1092b8:	e584300c 	str	r3, [r4, #12]
  1092bc:	35943004 	ldrcc	r3, [r4, #4]
  1092c0:	30613003 	rsbcc	r3, r1, r3
  1092c4:	3584300c 	strcc	r3, [r4, #12]
  1092c8:	e5943038 	ldr	r3, [r4, #56]
  1092cc:	e2833001 	add	r3, r3, #1	; 0x1
  1092d0:	e5843038 	str	r3, [r4, #56]
  1092d4:	e8bd8010 	ldmia	sp!, {r4, pc}
  1092d8:	e5940008 	ldr	r0, [r4, #8]
  1092dc:	ebffddb7 	bl	1009c0 <memcpy>
  1092e0:	e5943008 	ldr	r3, [r4, #8]
  1092e4:	e5942040 	ldr	r2, [r4, #64]
  1092e8:	e5941004 	ldr	r1, [r4, #4]
  1092ec:	e0833002 	add	r3, r3, r2
  1092f0:	e1530001 	cmp	r3, r1
  1092f4:	e5843008 	str	r3, [r4, #8]
  1092f8:	25943000 	ldrcs	r3, [r4]
  1092fc:	25843008 	strcs	r3, [r4, #8]
  109300:	e5943038 	ldr	r3, [r4, #56]
  109304:	e2833001 	add	r3, r3, #1	; 0x1
  109308:	e5843038 	str	r3, [r4, #56]
  10930c:	e8bd8010 	ldmia	sp!, {r4, pc}

00109310 <xQueueGenericSendFromISR>:
  109310:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  109314:	e590c038 	ldr	ip, [r0, #56]
  109318:	e590e03c 	ldr	lr, [r0, #60]
  10931c:	e15c000e 	cmp	ip, lr
  109320:	e1a05002 	mov	r5, r2
  109324:	e1a04000 	mov	r4, r0
  109328:	e3a0c000 	mov	ip, #0	; 0x0
  10932c:	e1a02003 	mov	r2, r3
  109330:	3a000001 	bcc	10933c <xQueueGenericSendFromISR+0x2c>
  109334:	e1a0000c 	mov	r0, ip
  109338:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10933c:	ebffffcc 	bl	109274 <prvCopyDataToQueue>
  109340:	e5943048 	ldr	r3, [r4, #72]
  109344:	e3730001 	cmn	r3, #1	; 0x1
  109348:	e2833001 	add	r3, r3, #1	; 0x1
  10934c:	e3a0c001 	mov	ip, #1	; 0x1
  109350:	15843048 	strne	r3, [r4, #72]
  109354:	1afffff6 	bne	109334 <xQueueGenericSendFromISR+0x24>
  109358:	e5943024 	ldr	r3, [r4, #36]
  10935c:	e3530000 	cmp	r3, #0	; 0x0
  109360:	e2840024 	add	r0, r4, #36	; 0x24
  109364:	1a000001 	bne	109370 <xQueueGenericSendFromISR+0x60>
  109368:	e3a0c001 	mov	ip, #1	; 0x1
  10936c:	eafffff0 	b	109334 <xQueueGenericSendFromISR+0x24>
  109370:	eb00019c 	bl	1099e8 <xTaskRemoveFromEventList>
  109374:	e3a03001 	mov	r3, #1	; 0x1
  109378:	e3500000 	cmp	r0, #0	; 0x0
  10937c:	e1a0c003 	mov	ip, r3
  109380:	15853000 	strne	r3, [r5]
  109384:	1affffea 	bne	109334 <xQueueGenericSendFromISR+0x24>
  109388:	eafffff6 	b	109368 <xQueueGenericSendFromISR+0x58>

0010938c <prvUnlockQueue>:
  10938c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  109390:	e1a04000 	mov	r4, r0
  109394:	eb000477 	bl	10a578 <vPortEnterCritical>
  109398:	e5943048 	ldr	r3, [r4, #72]
  10939c:	e3530000 	cmp	r3, #0	; 0x0
  1093a0:	da000016 	ble	109400 <prvUnlockQueue+0x74>
  1093a4:	e5943024 	ldr	r3, [r4, #36]
  1093a8:	e3530000 	cmp	r3, #0	; 0x0
  1093ac:	12845024 	addne	r5, r4, #36	; 0x24
  1093b0:	1a000008 	bne	1093d8 <prvUnlockQueue+0x4c>
  1093b4:	ea000011 	b	109400 <prvUnlockQueue+0x74>
  1093b8:	e5943048 	ldr	r3, [r4, #72]
  1093bc:	e2433001 	sub	r3, r3, #1	; 0x1
  1093c0:	e3530000 	cmp	r3, #0	; 0x0
  1093c4:	e5843048 	str	r3, [r4, #72]
  1093c8:	da00000c 	ble	109400 <prvUnlockQueue+0x74>
  1093cc:	e5943024 	ldr	r3, [r4, #36]
  1093d0:	e3530000 	cmp	r3, #0	; 0x0
  1093d4:	0a000009 	beq	109400 <prvUnlockQueue+0x74>
  1093d8:	e1a00005 	mov	r0, r5
  1093dc:	eb000181 	bl	1099e8 <xTaskRemoveFromEventList>
  1093e0:	e3500000 	cmp	r0, #0	; 0x0
  1093e4:	0afffff3 	beq	1093b8 <prvUnlockQueue+0x2c>
  1093e8:	eb000140 	bl	1098f0 <vTaskMissedYield>
  1093ec:	e5943048 	ldr	r3, [r4, #72]
  1093f0:	e2433001 	sub	r3, r3, #1	; 0x1
  1093f4:	e3530000 	cmp	r3, #0	; 0x0
  1093f8:	e5843048 	str	r3, [r4, #72]
  1093fc:	cafffff2 	bgt	1093cc <prvUnlockQueue+0x40>
  109400:	e3e03000 	mvn	r3, #0	; 0x0
  109404:	e5843048 	str	r3, [r4, #72]
  109408:	eb000465 	bl	10a5a4 <vPortExitCritical>
  10940c:	eb000459 	bl	10a578 <vPortEnterCritical>
  109410:	e5943044 	ldr	r3, [r4, #68]
  109414:	e3530000 	cmp	r3, #0	; 0x0
  109418:	da000016 	ble	109478 <prvUnlockQueue+0xec>
  10941c:	e5943010 	ldr	r3, [r4, #16]
  109420:	e3530000 	cmp	r3, #0	; 0x0
  109424:	12845010 	addne	r5, r4, #16	; 0x10
  109428:	1a000008 	bne	109450 <prvUnlockQueue+0xc4>
  10942c:	ea000011 	b	109478 <prvUnlockQueue+0xec>
  109430:	e5943044 	ldr	r3, [r4, #68]
  109434:	e2433001 	sub	r3, r3, #1	; 0x1
  109438:	e3530000 	cmp	r3, #0	; 0x0
  10943c:	e5843044 	str	r3, [r4, #68]
  109440:	da00000c 	ble	109478 <prvUnlockQueue+0xec>
  109444:	e5943010 	ldr	r3, [r4, #16]
  109448:	e3530000 	cmp	r3, #0	; 0x0
  10944c:	0a000009 	beq	109478 <prvUnlockQueue+0xec>
  109450:	e1a00005 	mov	r0, r5
  109454:	eb000163 	bl	1099e8 <xTaskRemoveFromEventList>
  109458:	e3500000 	cmp	r0, #0	; 0x0
  10945c:	0afffff3 	beq	109430 <prvUnlockQueue+0xa4>
  109460:	eb000122 	bl	1098f0 <vTaskMissedYield>
  109464:	e5943044 	ldr	r3, [r4, #68]
  109468:	e2433001 	sub	r3, r3, #1	; 0x1
  10946c:	e3530000 	cmp	r3, #0	; 0x0
  109470:	e5843044 	str	r3, [r4, #68]
  109474:	cafffff2 	bgt	109444 <prvUnlockQueue+0xb8>
  109478:	e3e03000 	mvn	r3, #0	; 0x0
  10947c:	e5843044 	str	r3, [r4, #68]
  109480:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  109484:	ea000446 	b	10a5a4 <vPortExitCritical>

00109488 <xQueueGenericReceive>:
  109488:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10948c:	e1a05000 	mov	r5, r0
  109490:	e24dd00c 	sub	sp, sp, #12	; 0xc
  109494:	e1a06001 	mov	r6, r1
  109498:	e1a07003 	mov	r7, r3
  10949c:	e3a04001 	mov	r4, #1	; 0x1
  1094a0:	e58d2000 	str	r2, [sp]
  1094a4:	ea00000d 	b	1094e0 <xQueueGenericReceive+0x58>
  1094a8:	eb000432 	bl	10a578 <vPortEnterCritical>
  1094ac:	e5953038 	ldr	r3, [r5, #56]
  1094b0:	e3530000 	cmp	r3, #0	; 0x0
  1094b4:	1a000030 	bne	10957c <xQueueGenericReceive+0xf4>
  1094b8:	eb000439 	bl	10a5a4 <vPortExitCritical>
  1094bc:	e59d3000 	ldr	r3, [sp]
  1094c0:	e3530000 	cmp	r3, #0	; 0x0
  1094c4:	0a000040 	beq	1095cc <xQueueGenericReceive+0x144>
  1094c8:	e28d0004 	add	r0, sp, #4	; 0x4
  1094cc:	e1a0100d 	mov	r1, sp
  1094d0:	eb00010b 	bl	109904 <xTaskCheckForTimeOut>
  1094d4:	e3500000 	cmp	r0, #0	; 0x0
  1094d8:	e3e04000 	mvn	r4, #0	; 0x0
  1094dc:	1a00003a 	bne	1095cc <xQueueGenericReceive+0x144>
  1094e0:	e59d3000 	ldr	r3, [sp]
  1094e4:	e3530000 	cmp	r3, #0	; 0x0
  1094e8:	0affffee 	beq	1094a8 <xQueueGenericReceive+0x20>
  1094ec:	eb000134 	bl	1099c4 <vTaskSuspendAll>
  1094f0:	eb000420 	bl	10a578 <vPortEnterCritical>
  1094f4:	e5953044 	ldr	r3, [r5, #68]
  1094f8:	e3730001 	cmn	r3, #1	; 0x1
  1094fc:	02833001 	addeq	r3, r3, #1	; 0x1
  109500:	05853044 	streq	r3, [r5, #68]
  109504:	e5953048 	ldr	r3, [r5, #72]
  109508:	e3730001 	cmn	r3, #1	; 0x1
  10950c:	02833001 	addeq	r3, r3, #1	; 0x1
  109510:	05853048 	streq	r3, [r5, #72]
  109514:	eb000422 	bl	10a5a4 <vPortExitCritical>
  109518:	e3540001 	cmp	r4, #1	; 0x1
  10951c:	0a00002d 	beq	1095d8 <xQueueGenericReceive+0x150>
  109520:	eb000414 	bl	10a578 <vPortEnterCritical>
  109524:	e5954038 	ldr	r4, [r5, #56]
  109528:	eb00041d 	bl	10a5a4 <vPortExitCritical>
  10952c:	e3540000 	cmp	r4, #0	; 0x0
  109530:	1a000021 	bne	1095bc <xQueueGenericReceive+0x134>
  109534:	e28d0004 	add	r0, sp, #4	; 0x4
  109538:	e1a0100d 	mov	r1, sp
  10953c:	eb0000f0 	bl	109904 <xTaskCheckForTimeOut>
  109540:	e3500000 	cmp	r0, #0	; 0x0
  109544:	1a00001c 	bne	1095bc <xQueueGenericReceive+0x134>
  109548:	e59d1000 	ldr	r1, [sp]
  10954c:	e2850024 	add	r0, r5, #36	; 0x24
  109550:	eb0001a8 	bl	109bf8 <vTaskPlaceOnEventList>
  109554:	e1a00005 	mov	r0, r5
  109558:	ebffff8b 	bl	10938c <prvUnlockQueue>
  10955c:	eb000275 	bl	109f38 <xTaskResumeAll>
  109560:	e3500000 	cmp	r0, #0	; 0x0
  109564:	1affffcf 	bne	1094a8 <xQueueGenericReceive+0x20>
  109568:	ef000000 	swi	0x00000000
  10956c:	eb000401 	bl	10a578 <vPortEnterCritical>
  109570:	e5953038 	ldr	r3, [r5, #56]
  109574:	e3530000 	cmp	r3, #0	; 0x0
  109578:	0affffce 	beq	1094b8 <xQueueGenericReceive+0x30>
  10957c:	e1a01006 	mov	r1, r6
  109580:	e1a00005 	mov	r0, r5
  109584:	e595400c 	ldr	r4, [r5, #12]
  109588:	ebffff27 	bl	10922c <prvCopyDataFromQueue>
  10958c:	e3570000 	cmp	r7, #0	; 0x0
  109590:	0a000013 	beq	1095e4 <xQueueGenericReceive+0x15c>
  109594:	e5953024 	ldr	r3, [r5, #36]
  109598:	e3530000 	cmp	r3, #0	; 0x0
  10959c:	e585400c 	str	r4, [r5, #12]
  1095a0:	0a000015 	beq	1095fc <xQueueGenericReceive+0x174>
  1095a4:	e2850024 	add	r0, r5, #36	; 0x24
  1095a8:	eb00010e 	bl	1099e8 <xTaskRemoveFromEventList>
  1095ac:	e3500000 	cmp	r0, #0	; 0x0
  1095b0:	0a000011 	beq	1095fc <xQueueGenericReceive+0x174>
  1095b4:	ef000000 	swi	0x00000000
  1095b8:	ea00000f 	b	1095fc <xQueueGenericReceive+0x174>
  1095bc:	e1a00005 	mov	r0, r5
  1095c0:	ebffff71 	bl	10938c <prvUnlockQueue>
  1095c4:	eb00025b 	bl	109f38 <xTaskResumeAll>
  1095c8:	eaffffb6 	b	1094a8 <xQueueGenericReceive+0x20>
  1095cc:	e3a00000 	mov	r0, #0	; 0x0
  1095d0:	e28dd00c 	add	sp, sp, #12	; 0xc
  1095d4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  1095d8:	e28d0004 	add	r0, sp, #4	; 0x4
  1095dc:	eb0000bb 	bl	1098d0 <vTaskSetTimeOutState>
  1095e0:	eaffffce 	b	109520 <xQueueGenericReceive+0x98>
  1095e4:	e5953038 	ldr	r3, [r5, #56]
  1095e8:	e2433001 	sub	r3, r3, #1	; 0x1
  1095ec:	e5853038 	str	r3, [r5, #56]
  1095f0:	e5952010 	ldr	r2, [r5, #16]
  1095f4:	e3520000 	cmp	r2, #0	; 0x0
  1095f8:	1a000002 	bne	109608 <xQueueGenericReceive+0x180>
  1095fc:	eb0003e8 	bl	10a5a4 <vPortExitCritical>
  109600:	e3a00001 	mov	r0, #1	; 0x1
  109604:	eafffff1 	b	1095d0 <xQueueGenericReceive+0x148>
  109608:	e2850010 	add	r0, r5, #16	; 0x10
  10960c:	eb0000f5 	bl	1099e8 <xTaskRemoveFromEventList>
  109610:	e3500001 	cmp	r0, #1	; 0x1
  109614:	1afffff8 	bne	1095fc <xQueueGenericReceive+0x174>
  109618:	ef000000 	swi	0x00000000
  10961c:	eafffff6 	b	1095fc <xQueueGenericReceive+0x174>

00109620 <xQueueGenericSend>:
  109620:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  109624:	e1a06000 	mov	r6, r0
  109628:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10962c:	e1a07001 	mov	r7, r1
  109630:	e1a08003 	mov	r8, r3
  109634:	e3a04001 	mov	r4, #1	; 0x1
  109638:	e58d2000 	str	r2, [sp]
  10963c:	ea00000e 	b	10967c <xQueueGenericSend+0x5c>
  109640:	eb0003cc 	bl	10a578 <vPortEnterCritical>
  109644:	e5962038 	ldr	r2, [r6, #56]
  109648:	e596303c 	ldr	r3, [r6, #60]
  10964c:	e1520003 	cmp	r2, r3
  109650:	3a000032 	bcc	109720 <xQueueGenericSend+0x100>
  109654:	eb0003d2 	bl	10a5a4 <vPortExitCritical>
  109658:	e59d3000 	ldr	r3, [sp]
  10965c:	e3530000 	cmp	r3, #0	; 0x0
  109660:	0a00003c 	beq	109758 <xQueueGenericSend+0x138>
  109664:	e28d0004 	add	r0, sp, #4	; 0x4
  109668:	e1a0100d 	mov	r1, sp
  10966c:	eb0000a4 	bl	109904 <xTaskCheckForTimeOut>
  109670:	e3500000 	cmp	r0, #0	; 0x0
  109674:	e3e04000 	mvn	r4, #0	; 0x0
  109678:	1a000036 	bne	109758 <xQueueGenericSend+0x138>
  10967c:	e59d3000 	ldr	r3, [sp]
  109680:	e3530000 	cmp	r3, #0	; 0x0
  109684:	0affffed 	beq	109640 <xQueueGenericSend+0x20>
  109688:	eb0000cd 	bl	1099c4 <vTaskSuspendAll>
  10968c:	eb0003b9 	bl	10a578 <vPortEnterCritical>
  109690:	e5963044 	ldr	r3, [r6, #68]
  109694:	e3730001 	cmn	r3, #1	; 0x1
  109698:	02833001 	addeq	r3, r3, #1	; 0x1
  10969c:	05863044 	streq	r3, [r6, #68]
  1096a0:	e5963048 	ldr	r3, [r6, #72]
  1096a4:	e3730001 	cmn	r3, #1	; 0x1
  1096a8:	02833001 	addeq	r3, r3, #1	; 0x1
  1096ac:	05863048 	streq	r3, [r6, #72]
  1096b0:	eb0003bb 	bl	10a5a4 <vPortExitCritical>
  1096b4:	e3540001 	cmp	r4, #1	; 0x1
  1096b8:	0a000029 	beq	109764 <xQueueGenericSend+0x144>
  1096bc:	eb0003ad 	bl	10a578 <vPortEnterCritical>
  1096c0:	e5965038 	ldr	r5, [r6, #56]
  1096c4:	e596403c 	ldr	r4, [r6, #60]
  1096c8:	eb0003b5 	bl	10a5a4 <vPortExitCritical>
  1096cc:	e1550004 	cmp	r5, r4
  1096d0:	1a00001c 	bne	109748 <xQueueGenericSend+0x128>
  1096d4:	e28d0004 	add	r0, sp, #4	; 0x4
  1096d8:	e1a0100d 	mov	r1, sp
  1096dc:	eb000088 	bl	109904 <xTaskCheckForTimeOut>
  1096e0:	e3500000 	cmp	r0, #0	; 0x0
  1096e4:	1a000017 	bne	109748 <xQueueGenericSend+0x128>
  1096e8:	e59d1000 	ldr	r1, [sp]
  1096ec:	e2860010 	add	r0, r6, #16	; 0x10
  1096f0:	eb000140 	bl	109bf8 <vTaskPlaceOnEventList>
  1096f4:	e1a00006 	mov	r0, r6
  1096f8:	ebffff23 	bl	10938c <prvUnlockQueue>
  1096fc:	eb00020d 	bl	109f38 <xTaskResumeAll>
  109700:	e3500000 	cmp	r0, #0	; 0x0
  109704:	1affffcd 	bne	109640 <xQueueGenericSend+0x20>
  109708:	ef000000 	swi	0x00000000
  10970c:	eb000399 	bl	10a578 <vPortEnterCritical>
  109710:	e5962038 	ldr	r2, [r6, #56]
  109714:	e596303c 	ldr	r3, [r6, #60]
  109718:	e1520003 	cmp	r2, r3
  10971c:	2affffcc 	bcs	109654 <xQueueGenericSend+0x34>
  109720:	e1a01007 	mov	r1, r7
  109724:	e1a02008 	mov	r2, r8
  109728:	e1a00006 	mov	r0, r6
  10972c:	ebfffed0 	bl	109274 <prvCopyDataToQueue>
  109730:	e5963024 	ldr	r3, [r6, #36]
  109734:	e3530000 	cmp	r3, #0	; 0x0
  109738:	1a00000c 	bne	109770 <xQueueGenericSend+0x150>
  10973c:	eb000398 	bl	10a5a4 <vPortExitCritical>
  109740:	e3a00001 	mov	r0, #1	; 0x1
  109744:	ea000004 	b	10975c <xQueueGenericSend+0x13c>
  109748:	e1a00006 	mov	r0, r6
  10974c:	ebffff0e 	bl	10938c <prvUnlockQueue>
  109750:	eb0001f8 	bl	109f38 <xTaskResumeAll>
  109754:	eaffffb9 	b	109640 <xQueueGenericSend+0x20>
  109758:	e3a00000 	mov	r0, #0	; 0x0
  10975c:	e28dd00c 	add	sp, sp, #12	; 0xc
  109760:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  109764:	e28d0004 	add	r0, sp, #4	; 0x4
  109768:	eb000058 	bl	1098d0 <vTaskSetTimeOutState>
  10976c:	eaffffd2 	b	1096bc <xQueueGenericSend+0x9c>
  109770:	e2860024 	add	r0, r6, #36	; 0x24
  109774:	eb00009b 	bl	1099e8 <xTaskRemoveFromEventList>
  109778:	e3500001 	cmp	r0, #1	; 0x1
  10977c:	1affffee 	bne	10973c <xQueueGenericSend+0x11c>
  109780:	ef000000 	swi	0x00000000
  109784:	eaffffec 	b	10973c <xQueueGenericSend+0x11c>

00109788 <xQueueCreate>:
  109788:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10978c:	e2507000 	subs	r7, r0, #0	; 0x0
  109790:	e1a06001 	mov	r6, r1
  109794:	e3a0004c 	mov	r0, #76	; 0x4c
  109798:	1a000002 	bne	1097a8 <xQueueCreate+0x20>
  10979c:	e3a05000 	mov	r5, #0	; 0x0
  1097a0:	e1a00005 	mov	r0, r5
  1097a4:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  1097a8:	eb0003f0 	bl	10a770 <pvPortMalloc>
  1097ac:	e3500000 	cmp	r0, #0	; 0x0
  1097b0:	e1a05000 	mov	r5, r0
  1097b4:	0afffff8 	beq	10979c <xQueueCreate+0x14>
  1097b8:	e0040796 	mul	r4, r6, r7
  1097bc:	e2840001 	add	r0, r4, #1	; 0x1
  1097c0:	eb0003ea 	bl	10a770 <pvPortMalloc>
  1097c4:	e1a08000 	mov	r8, r0
  1097c8:	e3580000 	cmp	r8, #0	; 0x0
  1097cc:	e0803004 	add	r3, r0, r4
  1097d0:	e2472001 	sub	r2, r7, #1	; 0x1
  1097d4:	e3e01000 	mvn	r1, #0	; 0x0
  1097d8:	e2850010 	add	r0, r5, #16	; 0x10
  1097dc:	e5858000 	str	r8, [r5]
  1097e0:	0a00000d 	beq	10981c <xQueueCreate+0x94>
  1097e4:	e0228296 	mla	r2, r6, r2, r8
  1097e8:	e5853004 	str	r3, [r5, #4]
  1097ec:	e3a03000 	mov	r3, #0	; 0x0
  1097f0:	e5853038 	str	r3, [r5, #56]
  1097f4:	e585200c 	str	r2, [r5, #12]
  1097f8:	e585703c 	str	r7, [r5, #60]
  1097fc:	e5856040 	str	r6, [r5, #64]
  109800:	e5851048 	str	r1, [r5, #72]
  109804:	e5858008 	str	r8, [r5, #8]
  109808:	e5851044 	str	r1, [r5, #68]
  10980c:	ebfffe3e 	bl	10910c <vListInitialise>
  109810:	e2850024 	add	r0, r5, #36	; 0x24
  109814:	ebfffe3c 	bl	10910c <vListInitialise>
  109818:	eaffffe0 	b	1097a0 <xQueueCreate+0x18>
  10981c:	e1a00005 	mov	r0, r5
  109820:	eb0003ca 	bl	10a750 <vPortFree>
  109824:	e1a05008 	mov	r5, r8
  109828:	eaffffdc 	b	1097a0 <xQueueCreate+0x18>

0010982c <vTaskSwitchContext>:
  10982c:	e59f3088 	ldr	r3, [pc, #136]	; 1098bc <prog+0x9878>
  109830:	e5932000 	ldr	r2, [r3]
  109834:	e3520000 	cmp	r2, #0	; 0x0
  109838:	159f3080 	ldrne	r3, [pc, #128]	; 1098c0 <prog+0x987c>
  10983c:	13a02001 	movne	r2, #1	; 0x1
  109840:	15832000 	strne	r2, [r3]
  109844:	112fff1e 	bxne	lr
  109848:	e59f1074 	ldr	r1, [pc, #116]	; 1098c4 <prog+0x9880>
  10984c:	e5913000 	ldr	r3, [r1]
  109850:	e59f0070 	ldr	r0, [pc, #112]	; 1098c8 <prog+0x9884>
  109854:	e0833103 	add	r3, r3, r3, lsl #2
  109858:	e7902103 	ldr	r2, [r0, r3, lsl #2]
  10985c:	e3520000 	cmp	r2, #0	; 0x0
  109860:	1a000007 	bne	109884 <vTaskSwitchContext+0x58>
  109864:	e5913000 	ldr	r3, [r1]
  109868:	e2433001 	sub	r3, r3, #1	; 0x1
  10986c:	e5813000 	str	r3, [r1]
  109870:	e5912000 	ldr	r2, [r1]
  109874:	e0822102 	add	r2, r2, r2, lsl #2
  109878:	e7903102 	ldr	r3, [r0, r2, lsl #2]
  10987c:	e3530000 	cmp	r3, #0	; 0x0
  109880:	0afffff7 	beq	109864 <vTaskSwitchContext+0x38>
  109884:	e5913000 	ldr	r3, [r1]
  109888:	e0833103 	add	r3, r3, r3, lsl #2
  10988c:	e0802103 	add	r2, r0, r3, lsl #2
  109890:	e5921004 	ldr	r1, [r2, #4]
  109894:	e5911004 	ldr	r1, [r1, #4]
  109898:	e2823008 	add	r3, r2, #8	; 0x8
  10989c:	e5821004 	str	r1, [r2, #4]
  1098a0:	e1510003 	cmp	r1, r3
  1098a4:	05911004 	ldreq	r1, [r1, #4]
  1098a8:	e59f301c 	ldr	r3, [pc, #28]	; 1098cc <prog+0x9888>
  1098ac:	05821004 	streq	r1, [r2, #4]
  1098b0:	e591200c 	ldr	r2, [r1, #12]
  1098b4:	e5832000 	str	r2, [r3]
  1098b8:	e12fff1e 	bx	lr
  1098bc:	00200928 	eoreq	r0, r0, r8, lsr #18
  1098c0:	0020091c 	eoreq	r0, r0, ip, lsl r9
  1098c4:	0020092c 	eoreq	r0, r0, ip, lsr #18
  1098c8:	00200944 	eoreq	r0, r0, r4, asr #18
  1098cc:	00200918 	eoreq	r0, r0, r8, lsl r9

001098d0 <vTaskSetTimeOutState>:
  1098d0:	e59f3010 	ldr	r3, [pc, #16]	; 1098e8 <prog+0x98a4>
  1098d4:	e59f2010 	ldr	r2, [pc, #16]	; 1098ec <prog+0x98a8>
  1098d8:	e5931000 	ldr	r1, [r3]
  1098dc:	e5923000 	ldr	r3, [r2]
  1098e0:	e880000a 	stmia	r0, {r1, r3}
  1098e4:	e12fff1e 	bx	lr
  1098e8:	00200920 	eoreq	r0, r0, r0, lsr #18
  1098ec:	00200924 	eoreq	r0, r0, r4, lsr #18

001098f0 <vTaskMissedYield>:
  1098f0:	e59f3008 	ldr	r3, [pc, #8]	; 109900 <prog+0x98bc>
  1098f4:	e3a02001 	mov	r2, #1	; 0x1
  1098f8:	e5832000 	str	r2, [r3]
  1098fc:	e12fff1e 	bx	lr
  109900:	0020091c 	eoreq	r0, r0, ip, lsl r9

00109904 <xTaskCheckForTimeOut>:
  109904:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  109908:	e1a06001 	mov	r6, r1
  10990c:	e1a04000 	mov	r4, r0
  109910:	eb000318 	bl	10a578 <vPortEnterCritical>
  109914:	e596c000 	ldr	ip, [r6]
  109918:	e37c0001 	cmn	ip, #1	; 0x1
  10991c:	e3a05000 	mov	r5, #0	; 0x0
  109920:	0a000010 	beq	109968 <xTaskCheckForTimeOut+0x64>
  109924:	e59f3090 	ldr	r3, [pc, #144]	; 1099bc <prog+0x9978>
  109928:	e5942000 	ldr	r2, [r4]
  10992c:	e5931000 	ldr	r1, [r3]
  109930:	e1520001 	cmp	r2, r1
  109934:	e59fe084 	ldr	lr, [pc, #132]	; 1099c0 <prog+0x997c>
  109938:	0a000016 	beq	109998 <xTaskCheckForTimeOut+0x94>
  10993c:	e59e3000 	ldr	r3, [lr]
  109940:	e5941004 	ldr	r1, [r4, #4]
  109944:	e1510003 	cmp	r1, r3
  109948:	9a000005 	bls	109964 <xTaskCheckForTimeOut+0x60>
  10994c:	e59e3000 	ldr	r3, [lr]
  109950:	e0613003 	rsb	r3, r1, r3
  109954:	e15c0003 	cmp	ip, r3
  109958:	e1a00004 	mov	r0, r4
  10995c:	e3a05000 	mov	r5, #0	; 0x0
  109960:	8a000003 	bhi	109974 <xTaskCheckForTimeOut+0x70>
  109964:	e3a05001 	mov	r5, #1	; 0x1
  109968:	eb00030d 	bl	10a5a4 <vPortExitCritical>
  10996c:	e1a00005 	mov	r0, r5
  109970:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109974:	e59f2044 	ldr	r2, [pc, #68]	; 1099c0 <prog+0x997c>
  109978:	e5923000 	ldr	r3, [r2]
  10997c:	e0613003 	rsb	r3, r1, r3
  109980:	e063300c 	rsb	r3, r3, ip
  109984:	e5863000 	str	r3, [r6]
  109988:	ebffffd0 	bl	1098d0 <vTaskSetTimeOutState>
  10998c:	eb000304 	bl	10a5a4 <vPortExitCritical>
  109990:	e1a00005 	mov	r0, r5
  109994:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109998:	e59fe020 	ldr	lr, [pc, #32]	; 1099c0 <prog+0x997c>
  10999c:	e5941004 	ldr	r1, [r4, #4]
  1099a0:	e59e3000 	ldr	r3, [lr]
  1099a4:	e0613003 	rsb	r3, r1, r3
  1099a8:	e15c0003 	cmp	ip, r3
  1099ac:	e1a00004 	mov	r0, r4
  1099b0:	e3a05000 	mov	r5, #0	; 0x0
  1099b4:	9affffea 	bls	109964 <xTaskCheckForTimeOut+0x60>
  1099b8:	eaffffed 	b	109974 <xTaskCheckForTimeOut+0x70>
  1099bc:	00200920 	eoreq	r0, r0, r0, lsr #18
  1099c0:	00200924 	eoreq	r0, r0, r4, lsr #18

001099c4 <vTaskSuspendAll>:
  1099c4:	e52de004 	str	lr, [sp, #-4]!
  1099c8:	eb0002ea 	bl	10a578 <vPortEnterCritical>
  1099cc:	e59f2010 	ldr	r2, [pc, #16]	; 1099e4 <prog+0x99a0>
  1099d0:	e5923000 	ldr	r3, [r2]
  1099d4:	e2833001 	add	r3, r3, #1	; 0x1
  1099d8:	e5823000 	str	r3, [r2]
  1099dc:	e49de004 	ldr	lr, [sp], #4
  1099e0:	ea0002ef 	b	10a5a4 <vPortExitCritical>
  1099e4:	00200928 	eoreq	r0, r0, r8, lsr #18

001099e8 <xTaskRemoveFromEventList>:
  1099e8:	e5903000 	ldr	r3, [r0]
  1099ec:	e3530000 	cmp	r3, #0	; 0x0
  1099f0:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
  1099f4:	e1a06003 	mov	r6, r3
  1099f8:	1590300c 	ldrne	r3, [r0, #12]
  1099fc:	1593600c 	ldrne	r6, [r3, #12]
  109a00:	e2864018 	add	r4, r6, #24	; 0x18
  109a04:	e1a00004 	mov	r0, r4
  109a08:	ebfffdf1 	bl	1091d4 <vListRemove>
  109a0c:	e59f3064 	ldr	r3, [pc, #100]	; 109a78 <prog+0x9a34>
  109a10:	e5932000 	ldr	r2, [r3]
  109a14:	e2865004 	add	r5, r6, #4	; 0x4
  109a18:	e3520000 	cmp	r2, #0	; 0x0
  109a1c:	e1a00005 	mov	r0, r5
  109a20:	e1a01004 	mov	r1, r4
  109a24:	159f0050 	ldrne	r0, [pc, #80]	; 109a7c <prog+0x9a38>
  109a28:	1a000009 	bne	109a54 <xTaskRemoveFromEventList+0x6c>
  109a2c:	ebfffde8 	bl	1091d4 <vListRemove>
  109a30:	e59fe048 	ldr	lr, [pc, #72]	; 109a80 <prog+0x9a3c>
  109a34:	e596c02c 	ldr	ip, [r6, #44]
  109a38:	e59e2000 	ldr	r2, [lr]
  109a3c:	e59f0040 	ldr	r0, [pc, #64]	; 109a84 <prog+0x9a40>
  109a40:	e15c0002 	cmp	ip, r2
  109a44:	e08c310c 	add	r3, ip, ip, lsl #2
  109a48:	858ec000 	strhi	ip, [lr]
  109a4c:	e1a01005 	mov	r1, r5
  109a50:	e0800103 	add	r0, r0, r3, lsl #2
  109a54:	ebfffdb8 	bl	10913c <vListInsertEnd>
  109a58:	e59f3028 	ldr	r3, [pc, #40]	; 109a88 <prog+0x9a44>
  109a5c:	e5932000 	ldr	r2, [r3]
  109a60:	e596102c 	ldr	r1, [r6, #44]
  109a64:	e592002c 	ldr	r0, [r2, #44]
  109a68:	e1510000 	cmp	r1, r0
  109a6c:	33a00000 	movcc	r0, #0	; 0x0
  109a70:	23a00001 	movcs	r0, #1	; 0x1
  109a74:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
  109a78:	00200928 	eoreq	r0, r0, r8, lsr #18
  109a7c:	002009d8 	ldreqd	r0, [r0], -r8
  109a80:	0020092c 	eoreq	r0, r0, ip, lsr #18
  109a84:	00200944 	eoreq	r0, r0, r4, asr #18
  109a88:	00200918 	eoreq	r0, r0, r8, lsl r9

00109a8c <vTaskIncrementTick>:
  109a8c:	e59f3144 	ldr	r3, [pc, #324]	; 109bd8 <prog+0x9b94>
  109a90:	e5932000 	ldr	r2, [r3]
  109a94:	e3520000 	cmp	r2, #0	; 0x0
  109a98:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  109a9c:	1a000039 	bne	109b88 <vTaskIncrementTick+0xfc>
  109aa0:	e59f6134 	ldr	r6, [pc, #308]	; 109bdc <prog+0x9b98>
  109aa4:	e5963000 	ldr	r3, [r6]
  109aa8:	e2833001 	add	r3, r3, #1	; 0x1
  109aac:	e5863000 	str	r3, [r6]
  109ab0:	e5962000 	ldr	r2, [r6]
  109ab4:	e3520000 	cmp	r2, #0	; 0x0
  109ab8:	e1a0c006 	mov	ip, r6
  109abc:	159fa11c 	ldrne	sl, [pc, #284]	; 109be0 <prog+0x9b9c>
  109ac0:	0a000035 	beq	109b9c <vTaskIncrementTick+0x110>
  109ac4:	e59a3000 	ldr	r3, [sl]
  109ac8:	e5932000 	ldr	r2, [r3]
  109acc:	e3520000 	cmp	r2, #0	; 0x0
  109ad0:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109ad4:	e59f3104 	ldr	r3, [pc, #260]	; 109be0 <prog+0x9b9c>
  109ad8:	e5932000 	ldr	r2, [r3]
  109adc:	e592100c 	ldr	r1, [r2, #12]
  109ae0:	e591300c 	ldr	r3, [r1, #12]
  109ae4:	e3530000 	cmp	r3, #0	; 0x0
  109ae8:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109aec:	e1a04003 	mov	r4, r3
  109af0:	e59c2000 	ldr	r2, [ip]
  109af4:	e5933004 	ldr	r3, [r3, #4]
  109af8:	e1530002 	cmp	r3, r2
  109afc:	959f80e0 	ldrls	r8, [pc, #224]	; 109be4 <prog+0x9ba0>
  109b00:	959f70e0 	ldrls	r7, [pc, #224]	; 109be8 <prog+0x9ba4>
  109b04:	9a000004 	bls	109b1c <vTaskIncrementTick+0x90>
  109b08:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109b0c:	e5962000 	ldr	r2, [r6]
  109b10:	e5943004 	ldr	r3, [r4, #4]
  109b14:	e1530002 	cmp	r3, r2
  109b18:	88bd85f0 	ldmhiia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109b1c:	e2845004 	add	r5, r4, #4	; 0x4
  109b20:	e1a00005 	mov	r0, r5
  109b24:	ebfffdaa 	bl	1091d4 <vListRemove>
  109b28:	e5943028 	ldr	r3, [r4, #40]
  109b2c:	e3530000 	cmp	r3, #0	; 0x0
  109b30:	e2840018 	add	r0, r4, #24	; 0x18
  109b34:	1bfffda6 	blne	1091d4 <vListRemove>
  109b38:	e594202c 	ldr	r2, [r4, #44]
  109b3c:	e5983000 	ldr	r3, [r8]
  109b40:	e1520003 	cmp	r2, r3
  109b44:	859f3098 	ldrhi	r3, [pc, #152]	; 109be4 <prog+0x9ba0>
  109b48:	e0820102 	add	r0, r2, r2, lsl #2
  109b4c:	85832000 	strhi	r2, [r3]
  109b50:	e1a01005 	mov	r1, r5
  109b54:	e0870100 	add	r0, r7, r0, lsl #2
  109b58:	ebfffd77 	bl	10913c <vListInsertEnd>
  109b5c:	e59a3000 	ldr	r3, [sl]
  109b60:	e5932000 	ldr	r2, [r3]
  109b64:	e3520000 	cmp	r2, #0	; 0x0
  109b68:	08bd85f0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109b6c:	e59f306c 	ldr	r3, [pc, #108]	; 109be0 <prog+0x9b9c>
  109b70:	e5932000 	ldr	r2, [r3]
  109b74:	e592100c 	ldr	r1, [r2, #12]
  109b78:	e591300c 	ldr	r3, [r1, #12]
  109b7c:	e2534000 	subs	r4, r3, #0	; 0x0
  109b80:	1affffe1 	bne	109b0c <vTaskIncrementTick+0x80>
  109b84:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109b88:	e59f205c 	ldr	r2, [pc, #92]	; 109bec <prog+0x9ba8>
  109b8c:	e5923000 	ldr	r3, [r2]
  109b90:	e2833001 	add	r3, r3, #1	; 0x1
  109b94:	e5823000 	str	r3, [r2]
  109b98:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109b9c:	e59fa03c 	ldr	sl, [pc, #60]	; 109be0 <prog+0x9b9c>
  109ba0:	e59f1048 	ldr	r1, [pc, #72]	; 109bf0 <prog+0x9bac>
  109ba4:	e59a0000 	ldr	r0, [sl]
  109ba8:	e5913000 	ldr	r3, [r1]
  109bac:	e59f2040 	ldr	r2, [pc, #64]	; 109bf4 <prog+0x9bb0>
  109bb0:	e58a3000 	str	r3, [sl]
  109bb4:	e5810000 	str	r0, [r1]
  109bb8:	e5923000 	ldr	r3, [r2]
  109bbc:	e2833001 	add	r3, r3, #1	; 0x1
  109bc0:	e5823000 	str	r3, [r2]
  109bc4:	e59a3000 	ldr	r3, [sl]
  109bc8:	e5932000 	ldr	r2, [r3]
  109bcc:	e3520000 	cmp	r2, #0	; 0x0
  109bd0:	1affffbf 	bne	109ad4 <vTaskIncrementTick+0x48>
  109bd4:	e8bd85f0 	ldmia	sp!, {r4, r5, r6, r7, r8, sl, pc}
  109bd8:	00200928 	eoreq	r0, r0, r8, lsr #18
  109bdc:	00200924 	eoreq	r0, r0, r4, lsr #18
  109be0:	002009d0 	ldreqd	r0, [r0], -r0
  109be4:	0020092c 	eoreq	r0, r0, ip, lsr #18
  109be8:	00200944 	eoreq	r0, r0, r4, asr #18
  109bec:	00200930 	eoreq	r0, r0, r0, lsr r9
  109bf0:	002009d4 	ldreqd	r0, [r0], -r4
  109bf4:	00200920 	eoreq	r0, r0, r0, lsr #18

00109bf8 <vTaskPlaceOnEventList>:
  109bf8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  109bfc:	e59f406c 	ldr	r4, [pc, #108]	; 109c70 <prog+0x9c2c>
  109c00:	e5943000 	ldr	r3, [r4]
  109c04:	e1a05001 	mov	r5, r1
  109c08:	e2831018 	add	r1, r3, #24	; 0x18
  109c0c:	ebfffd57 	bl	109170 <vListInsert>
  109c10:	e5940000 	ldr	r0, [r4]
  109c14:	e2800004 	add	r0, r0, #4	; 0x4
  109c18:	ebfffd6d 	bl	1091d4 <vListRemove>
  109c1c:	e3750001 	cmn	r5, #1	; 0x1
  109c20:	e59f004c 	ldr	r0, [pc, #76]	; 109c74 <prog+0x9c30>
  109c24:	e59f204c 	ldr	r2, [pc, #76]	; 109c78 <prog+0x9c34>
  109c28:	0a00000c 	beq	109c60 <vTaskPlaceOnEventList+0x68>
  109c2c:	e5923000 	ldr	r3, [r2]
  109c30:	e5941000 	ldr	r1, [r4]
  109c34:	e5922000 	ldr	r2, [r2]
  109c38:	e0853003 	add	r3, r5, r3
  109c3c:	e1530002 	cmp	r3, r2
  109c40:	e5813004 	str	r3, [r1, #4]
  109c44:	359f3030 	ldrcc	r3, [pc, #48]	; 109c7c <prog+0x9c38>
  109c48:	259f3030 	ldrcs	r3, [pc, #48]	; 109c80 <prog+0x9c3c>
  109c4c:	e5930000 	ldr	r0, [r3]
  109c50:	e5941000 	ldr	r1, [r4]
  109c54:	e2811004 	add	r1, r1, #4	; 0x4
  109c58:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  109c5c:	eafffd43 	b	109170 <vListInsert>
  109c60:	e5941000 	ldr	r1, [r4]
  109c64:	e2811004 	add	r1, r1, #4	; 0x4
  109c68:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  109c6c:	eafffd32 	b	10913c <vListInsertEnd>
  109c70:	00200918 	eoreq	r0, r0, r8, lsl r9
  109c74:	00200a00 	eoreq	r0, r0, r0, lsl #20
  109c78:	00200924 	eoreq	r0, r0, r4, lsr #18
  109c7c:	002009d4 	ldreqd	r0, [r0], -r4
  109c80:	002009d0 	ldreqd	r0, [r0], -r0

00109c84 <xTaskCreate>:
  109c84:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  109c88:	e1a02802 	mov	r2, r2, lsl #16
  109c8c:	e1a0a000 	mov	sl, r0
  109c90:	e3a00044 	mov	r0, #68	; 0x44
  109c94:	e1a05001 	mov	r5, r1
  109c98:	e1a08003 	mov	r8, r3
  109c9c:	e1a07822 	mov	r7, r2, lsr #16
  109ca0:	e59db024 	ldr	fp, [sp, #36]
  109ca4:	eb0002b1 	bl	10a770 <pvPortMalloc>
  109ca8:	e2506000 	subs	r6, r0, #0	; 0x0
  109cac:	02400001 	subeq	r0, r0, #1	; 0x1
  109cb0:	08bd8ff0 	ldmeqia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  109cb4:	e1a04107 	mov	r4, r7, lsl #2
  109cb8:	e1a00004 	mov	r0, r4
  109cbc:	eb0002ab 	bl	10a770 <pvPortMalloc>
  109cc0:	e3500000 	cmp	r0, #0	; 0x0
  109cc4:	e5860030 	str	r0, [r6, #48]
  109cc8:	0a00006b 	beq	109e7c <xTaskCreate+0x1f8>
  109ccc:	e1a02004 	mov	r2, r4
  109cd0:	e3a010a5 	mov	r1, #165	; 0xa5
  109cd4:	ebffdb61 	bl	100a60 <memset>
  109cd8:	e1a01005 	mov	r1, r5
  109cdc:	e3a02010 	mov	r2, #16	; 0x10
  109ce0:	e2860034 	add	r0, r6, #52	; 0x34
  109ce4:	ebffdbe0 	bl	100c6c <strncpy>
  109ce8:	e35b0004 	cmp	fp, #4	; 0x4
  109cec:	31a0400b 	movcc	r4, fp
  109cf0:	23a04004 	movcs	r4, #4	; 0x4
  109cf4:	e3a03000 	mov	r3, #0	; 0x0
  109cf8:	e2869004 	add	r9, r6, #4	; 0x4
  109cfc:	e5c63043 	strb	r3, [r6, #67]
  109d00:	e586402c 	str	r4, [r6, #44]
  109d04:	e1a00009 	mov	r0, r9
  109d08:	ebfffd08 	bl	109130 <vListInitialiseItem>
  109d0c:	e2860018 	add	r0, r6, #24	; 0x18
  109d10:	ebfffd06 	bl	109130 <vListInitialiseItem>
  109d14:	e5960030 	ldr	r0, [r6, #48]
  109d18:	e2644005 	rsb	r4, r4, #5	; 0x5
  109d1c:	e0800107 	add	r0, r0, r7, lsl #2
  109d20:	e1a0100a 	mov	r1, sl
  109d24:	e1a02008 	mov	r2, r8
  109d28:	e5864018 	str	r4, [r6, #24]
  109d2c:	e5866010 	str	r6, [r6, #16]
  109d30:	e5866024 	str	r6, [r6, #36]
  109d34:	e2400004 	sub	r0, r0, #4	; 0x4
  109d38:	eb000177 	bl	10a31c <pxPortInitialiseStack>
  109d3c:	e5860000 	str	r0, [r6]
  109d40:	eb00020c 	bl	10a578 <vPortEnterCritical>
  109d44:	e59f2140 	ldr	r2, [pc, #320]	; 109e8c <prog+0x9e48>
  109d48:	e5923000 	ldr	r3, [r2]
  109d4c:	e2833001 	add	r3, r3, #1	; 0x1
  109d50:	e5823000 	str	r3, [r2]
  109d54:	e5921000 	ldr	r1, [r2]
  109d58:	e3510001 	cmp	r1, #1	; 0x1
  109d5c:	0a00002a 	beq	109e0c <xTaskCreate+0x188>
  109d60:	e59f7128 	ldr	r7, [pc, #296]	; 109e90 <prog+0x9e4c>
  109d64:	e5973000 	ldr	r3, [r7]
  109d68:	e3530000 	cmp	r3, #0	; 0x0
  109d6c:	0a00001c 	beq	109de4 <xTaskCreate+0x160>
  109d70:	e59f811c 	ldr	r8, [pc, #284]	; 109e94 <prog+0x9e50>
  109d74:	e59f111c 	ldr	r1, [pc, #284]	; 109e98 <prog+0x9e54>
  109d78:	e596202c 	ldr	r2, [r6, #44]
  109d7c:	e5913000 	ldr	r3, [r1]
  109d80:	e1520003 	cmp	r2, r3
  109d84:	85812000 	strhi	r2, [r1]
  109d88:	e59f110c 	ldr	r1, [pc, #268]	; 109e9c <prog+0x9e58>
  109d8c:	e5913000 	ldr	r3, [r1]
  109d90:	e0820102 	add	r0, r2, r2, lsl #2
  109d94:	e1520003 	cmp	r2, r3
  109d98:	85812000 	strhi	r2, [r1]
  109d9c:	e0880100 	add	r0, r8, r0, lsl #2
  109da0:	e1a01009 	mov	r1, r9
  109da4:	ebfffce4 	bl	10913c <vListInsertEnd>
  109da8:	eb0001fd 	bl	10a5a4 <vPortExitCritical>
  109dac:	e59d3028 	ldr	r3, [sp, #40]
  109db0:	e3530000 	cmp	r3, #0	; 0x0
  109db4:	15836000 	strne	r6, [r3]
  109db8:	e5973000 	ldr	r3, [r7]
  109dbc:	e3530000 	cmp	r3, #0	; 0x0
  109dc0:	0a00000f 	beq	109e04 <xTaskCreate+0x180>
  109dc4:	e59f30d4 	ldr	r3, [pc, #212]	; 109ea0 <prog+0x9e5c>
  109dc8:	e5932000 	ldr	r2, [r3]
  109dcc:	e592102c 	ldr	r1, [r2, #44]
  109dd0:	e151000b 	cmp	r1, fp
  109dd4:	2a00000a 	bcs	109e04 <xTaskCreate+0x180>
  109dd8:	ef000000 	swi	0x00000000
  109ddc:	e3a00001 	mov	r0, #1	; 0x1
  109de0:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  109de4:	e59f10b4 	ldr	r1, [pc, #180]	; 109ea0 <prog+0x9e5c>
  109de8:	e5913000 	ldr	r3, [r1]
  109dec:	e593202c 	ldr	r2, [r3, #44]
  109df0:	e15b0002 	cmp	fp, r2
  109df4:	259f8098 	ldrcs	r8, [pc, #152]	; 109e94 <prog+0x9e50>
  109df8:	25816000 	strcs	r6, [r1]
  109dfc:	2affffdc 	bcs	109d74 <xTaskCreate+0xf0>
  109e00:	eaffffda 	b	109d70 <xTaskCreate+0xec>
  109e04:	e3a00001 	mov	r0, #1	; 0x1
  109e08:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  109e0c:	e59f308c 	ldr	r3, [pc, #140]	; 109ea0 <prog+0x9e5c>
  109e10:	e59f807c 	ldr	r8, [pc, #124]	; 109e94 <prog+0x9e50>
  109e14:	e5836000 	str	r6, [r3]
  109e18:	e1a04008 	mov	r4, r8
  109e1c:	e2885064 	add	r5, r8, #100	; 0x64
  109e20:	e1a00004 	mov	r0, r4
  109e24:	e2844014 	add	r4, r4, #20	; 0x14
  109e28:	ebfffcb7 	bl	10910c <vListInitialise>
  109e2c:	e1540005 	cmp	r4, r5
  109e30:	1afffffa 	bne	109e20 <xTaskCreate+0x19c>
  109e34:	e59f4068 	ldr	r4, [pc, #104]	; 109ea4 <prog+0x9e60>
  109e38:	e59f5068 	ldr	r5, [pc, #104]	; 109ea8 <prog+0x9e64>
  109e3c:	e1a00004 	mov	r0, r4
  109e40:	ebfffcb1 	bl	10910c <vListInitialise>
  109e44:	e1a00005 	mov	r0, r5
  109e48:	ebfffcaf 	bl	10910c <vListInitialise>
  109e4c:	e59f0058 	ldr	r0, [pc, #88]	; 109eac <prog+0x9e68>
  109e50:	ebfffcad 	bl	10910c <vListInitialise>
  109e54:	e59f0054 	ldr	r0, [pc, #84]	; 109eb0 <prog+0x9e6c>
  109e58:	ebfffcab 	bl	10910c <vListInitialise>
  109e5c:	e59f0050 	ldr	r0, [pc, #80]	; 109eb4 <prog+0x9e70>
  109e60:	ebfffca9 	bl	10910c <vListInitialise>
  109e64:	e59f7024 	ldr	r7, [pc, #36]	; 109e90 <prog+0x9e4c>
  109e68:	e59f3048 	ldr	r3, [pc, #72]	; 109eb8 <prog+0x9e74>
  109e6c:	e59f2048 	ldr	r2, [pc, #72]	; 109ebc <prog+0x9e78>
  109e70:	e5834000 	str	r4, [r3]
  109e74:	e5825000 	str	r5, [r2]
  109e78:	eaffffbd 	b	109d74 <xTaskCreate+0xf0>
  109e7c:	e1a00006 	mov	r0, r6
  109e80:	eb000232 	bl	10a750 <vPortFree>
  109e84:	e3e00000 	mvn	r0, #0	; 0x0
  109e88:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  109e8c:	00200934 	eoreq	r0, r0, r4, lsr r9
  109e90:	00200938 	eoreq	r0, r0, r8, lsr r9
  109e94:	00200944 	eoreq	r0, r0, r4, asr #18
  109e98:	00200940 	eoreq	r0, r0, r0, asr #18
  109e9c:	0020092c 	eoreq	r0, r0, ip, lsr #18
  109ea0:	00200918 	eoreq	r0, r0, r8, lsl r9
  109ea4:	002009a8 	eoreq	r0, r0, r8, lsr #19
  109ea8:	002009bc 	streqh	r0, [r0], -ip
  109eac:	002009d8 	ldreqd	r0, [r0], -r8
  109eb0:	002009ec 	eoreq	r0, r0, ip, ror #19
  109eb4:	00200a00 	eoreq	r0, r0, r0, lsl #20
  109eb8:	002009d0 	ldreqd	r0, [r0], -r0
  109ebc:	002009d4 	ldreqd	r0, [r0], -r4

00109ec0 <vTaskStartScheduler>:
  109ec0:	e92d4010 	stmdb	sp!, {r4, lr}
  109ec4:	e3a04000 	mov	r4, #0	; 0x0
  109ec8:	e24dd008 	sub	sp, sp, #8	; 0x8
  109ecc:	e59f1054 	ldr	r1, [pc, #84]	; 109f28 <prog+0x9ee4>
  109ed0:	e3a0206e 	mov	r2, #110	; 0x6e
  109ed4:	e1a03004 	mov	r3, r4
  109ed8:	e59f004c 	ldr	r0, [pc, #76]	; 109f2c <prog+0x9ee8>
  109edc:	e58d4000 	str	r4, [sp]
  109ee0:	e58d4004 	str	r4, [sp, #4]
  109ee4:	ebffff66 	bl	109c84 <xTaskCreate>
  109ee8:	e3500001 	cmp	r0, #1	; 0x1
  109eec:	0a000001 	beq	109ef8 <vTaskStartScheduler+0x38>
  109ef0:	e28dd008 	add	sp, sp, #8	; 0x8
  109ef4:	e8bd8010 	ldmia	sp!, {r4, pc}
  109ef8:	e92d0001 	stmdb	sp!, {r0}
  109efc:	e10f0000 	mrs	r0, CPSR
  109f00:	e38000c0 	orr	r0, r0, #192	; 0xc0
  109f04:	e129f000 	msr	CPSR_fc, r0
  109f08:	e8bd0001 	ldmia	sp!, {r0}
  109f0c:	e59f301c 	ldr	r3, [pc, #28]	; 109f30 <prog+0x9eec>
  109f10:	e59f201c 	ldr	r2, [pc, #28]	; 109f34 <prog+0x9ef0>
  109f14:	e5830000 	str	r0, [r3]
  109f18:	e5824000 	str	r4, [r2]
  109f1c:	e28dd008 	add	sp, sp, #8	; 0x8
  109f20:	e8bd4010 	ldmia	sp!, {r4, lr}
  109f24:	ea00016c 	b	10a4dc <xPortStartScheduler>
  109f28:	0010b86c 	andeqs	fp, r0, ip, ror #16
  109f2c:	0010a1bc 	ldreqh	sl, [r0], -ip
  109f30:	00200938 	eoreq	r0, r0, r8, lsr r9
  109f34:	00200924 	eoreq	r0, r0, r4, lsr #18

00109f38 <xTaskResumeAll>:
  109f38:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  109f3c:	e59fb248 	ldr	fp, [pc, #584]	; 10a18c <prog+0xa148>
  109f40:	eb00018c 	bl	10a578 <vPortEnterCritical>
  109f44:	e59b3000 	ldr	r3, [fp]
  109f48:	e2433001 	sub	r3, r3, #1	; 0x1
  109f4c:	e58b3000 	str	r3, [fp]
  109f50:	e59b1000 	ldr	r1, [fp]
  109f54:	e3510000 	cmp	r1, #0	; 0x0
  109f58:	1a000006 	bne	109f78 <xTaskResumeAll+0x40>
  109f5c:	e59f322c 	ldr	r3, [pc, #556]	; 10a190 <prog+0xa14c>
  109f60:	e5932000 	ldr	r2, [r3]
  109f64:	e3520000 	cmp	r2, #0	; 0x0
  109f68:	159f9224 	ldrne	r9, [pc, #548]	; 10a194 <prog+0xa150>
  109f6c:	11a06001 	movne	r6, r1
  109f70:	11a0a009 	movne	sl, r9
  109f74:	1a00001a 	bne	109fe4 <xTaskResumeAll+0xac>
  109f78:	eb000189 	bl	10a5a4 <vPortExitCritical>
  109f7c:	e3a04000 	mov	r4, #0	; 0x0
  109f80:	e1a00004 	mov	r0, r4
  109f84:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  109f88:	e599300c 	ldr	r3, [r9, #12]
  109f8c:	e593400c 	ldr	r4, [r3, #12]
  109f90:	e3540000 	cmp	r4, #0	; 0x0
  109f94:	e2840018 	add	r0, r4, #24	; 0x18
  109f98:	e2845004 	add	r5, r4, #4	; 0x4
  109f9c:	0a000015 	beq	109ff8 <xTaskResumeAll+0xc0>
  109fa0:	ebfffc8b 	bl	1091d4 <vListRemove>
  109fa4:	e1a00005 	mov	r0, r5
  109fa8:	ebfffc89 	bl	1091d4 <vListRemove>
  109fac:	e594202c 	ldr	r2, [r4, #44]
  109fb0:	e5973000 	ldr	r3, [r7]
  109fb4:	e0820102 	add	r0, r2, r2, lsl #2
  109fb8:	e1520003 	cmp	r2, r3
  109fbc:	e1a01005 	mov	r1, r5
  109fc0:	e0880100 	add	r0, r8, r0, lsl #2
  109fc4:	85872000 	strhi	r2, [r7]
  109fc8:	ebfffc5b 	bl	10913c <vListInsertEnd>
  109fcc:	e59f31c4 	ldr	r3, [pc, #452]	; 10a198 <prog+0xa154>
  109fd0:	e5932000 	ldr	r2, [r3]
  109fd4:	e594102c 	ldr	r1, [r4, #44]
  109fd8:	e592302c 	ldr	r3, [r2, #44]
  109fdc:	e1510003 	cmp	r1, r3
  109fe0:	23a06001 	movcs	r6, #1	; 0x1
  109fe4:	e59a3000 	ldr	r3, [sl]
  109fe8:	e3530000 	cmp	r3, #0	; 0x0
  109fec:	e59f81a8 	ldr	r8, [pc, #424]	; 10a19c <prog+0xa158>
  109ff0:	e59f71a8 	ldr	r7, [pc, #424]	; 10a1a0 <prog+0xa15c>
  109ff4:	1affffe3 	bne	109f88 <xTaskResumeAll+0x50>
  109ff8:	e59fa1a4 	ldr	sl, [pc, #420]	; 10a1a4 <prog+0xa160>
  109ffc:	e59a3000 	ldr	r3, [sl]
  10a000:	e3530000 	cmp	r3, #0	; 0x0
  10a004:	0a000059 	beq	10a170 <xTaskResumeAll+0x238>
  10a008:	e59a3000 	ldr	r3, [sl]
  10a00c:	e3530000 	cmp	r3, #0	; 0x0
  10a010:	0a00004e 	beq	10a150 <xTaskResumeAll+0x218>
  10a014:	e59b3000 	ldr	r3, [fp]
  10a018:	e3530000 	cmp	r3, #0	; 0x0
  10a01c:	159a3000 	ldrne	r3, [sl]
  10a020:	12833001 	addne	r3, r3, #1	; 0x1
  10a024:	158a3000 	strne	r3, [sl]
  10a028:	1a000042 	bne	10a138 <xTaskResumeAll+0x200>
  10a02c:	e59f6174 	ldr	r6, [pc, #372]	; 10a1a8 <prog+0xa164>
  10a030:	e5963000 	ldr	r3, [r6]
  10a034:	e2833001 	add	r3, r3, #1	; 0x1
  10a038:	e5863000 	str	r3, [r6]
  10a03c:	e5962000 	ldr	r2, [r6]
  10a040:	e3520000 	cmp	r2, #0	; 0x0
  10a044:	e1a0c006 	mov	ip, r6
  10a048:	159f915c 	ldrne	r9, [pc, #348]	; 10a1ac <prog+0xa168>
  10a04c:	1a000009 	bne	10a078 <xTaskResumeAll+0x140>
  10a050:	e59f9154 	ldr	r9, [pc, #340]	; 10a1ac <prog+0xa168>
  10a054:	e59f1154 	ldr	r1, [pc, #340]	; 10a1b0 <prog+0xa16c>
  10a058:	e5990000 	ldr	r0, [r9]
  10a05c:	e5913000 	ldr	r3, [r1]
  10a060:	e59f214c 	ldr	r2, [pc, #332]	; 10a1b4 <prog+0xa170>
  10a064:	e5893000 	str	r3, [r9]
  10a068:	e5810000 	str	r0, [r1]
  10a06c:	e5923000 	ldr	r3, [r2]
  10a070:	e2833001 	add	r3, r3, #1	; 0x1
  10a074:	e5823000 	str	r3, [r2]
  10a078:	e5993000 	ldr	r3, [r9]
  10a07c:	e5932000 	ldr	r2, [r3]
  10a080:	e3520000 	cmp	r2, #0	; 0x0
  10a084:	0a00002b 	beq	10a138 <xTaskResumeAll+0x200>
  10a088:	e59f311c 	ldr	r3, [pc, #284]	; 10a1ac <prog+0xa168>
  10a08c:	e5932000 	ldr	r2, [r3]
  10a090:	e592100c 	ldr	r1, [r2, #12]
  10a094:	e591300c 	ldr	r3, [r1, #12]
  10a098:	e3530000 	cmp	r3, #0	; 0x0
  10a09c:	0a000025 	beq	10a138 <xTaskResumeAll+0x200>
  10a0a0:	e1a04003 	mov	r4, r3
  10a0a4:	e59c2000 	ldr	r2, [ip]
  10a0a8:	e5933004 	ldr	r3, [r3, #4]
  10a0ac:	e1530002 	cmp	r3, r2
  10a0b0:	959f70e8 	ldrls	r7, [pc, #232]	; 10a1a0 <prog+0xa15c>
  10a0b4:	959f80e0 	ldrls	r8, [pc, #224]	; 10a19c <prog+0xa158>
  10a0b8:	9a00000a 	bls	10a0e8 <xTaskResumeAll+0x1b0>
  10a0bc:	ea00001d 	b	10a138 <xTaskResumeAll+0x200>
  10a0c0:	e59f30e4 	ldr	r3, [pc, #228]	; 10a1ac <prog+0xa168>
  10a0c4:	e5932000 	ldr	r2, [r3]
  10a0c8:	e592100c 	ldr	r1, [r2, #12]
  10a0cc:	e591300c 	ldr	r3, [r1, #12]
  10a0d0:	e2534000 	subs	r4, r3, #0	; 0x0
  10a0d4:	0a000017 	beq	10a138 <xTaskResumeAll+0x200>
  10a0d8:	e5962000 	ldr	r2, [r6]
  10a0dc:	e5943004 	ldr	r3, [r4, #4]
  10a0e0:	e1530002 	cmp	r3, r2
  10a0e4:	8a000013 	bhi	10a138 <xTaskResumeAll+0x200>
  10a0e8:	e2845004 	add	r5, r4, #4	; 0x4
  10a0ec:	e1a00005 	mov	r0, r5
  10a0f0:	ebfffc37 	bl	1091d4 <vListRemove>
  10a0f4:	e5943028 	ldr	r3, [r4, #40]
  10a0f8:	e3530000 	cmp	r3, #0	; 0x0
  10a0fc:	e2840018 	add	r0, r4, #24	; 0x18
  10a100:	1bfffc33 	blne	1091d4 <vListRemove>
  10a104:	e594202c 	ldr	r2, [r4, #44]
  10a108:	e5973000 	ldr	r3, [r7]
  10a10c:	e1520003 	cmp	r2, r3
  10a110:	859f3088 	ldrhi	r3, [pc, #136]	; 10a1a0 <prog+0xa15c>
  10a114:	e0820102 	add	r0, r2, r2, lsl #2
  10a118:	85832000 	strhi	r2, [r3]
  10a11c:	e1a01005 	mov	r1, r5
  10a120:	e0880100 	add	r0, r8, r0, lsl #2
  10a124:	ebfffc04 	bl	10913c <vListInsertEnd>
  10a128:	e5993000 	ldr	r3, [r9]
  10a12c:	e5932000 	ldr	r2, [r3]
  10a130:	e3520000 	cmp	r2, #0	; 0x0
  10a134:	1affffe1 	bne	10a0c0 <xTaskResumeAll+0x188>
  10a138:	e59a3000 	ldr	r3, [sl]
  10a13c:	e2433001 	sub	r3, r3, #1	; 0x1
  10a140:	e58a3000 	str	r3, [sl]
  10a144:	e59a2000 	ldr	r2, [sl]
  10a148:	e3520000 	cmp	r2, #0	; 0x0
  10a14c:	1affffb0 	bne	10a014 <xTaskResumeAll+0xdc>
  10a150:	e59f2060 	ldr	r2, [pc, #96]	; 10a1b8 <prog+0xa174>
  10a154:	e3a03000 	mov	r3, #0	; 0x0
  10a158:	e5823000 	str	r3, [r2]
  10a15c:	ef000000 	swi	0x00000000
  10a160:	eb00010f 	bl	10a5a4 <vPortExitCritical>
  10a164:	e3a04001 	mov	r4, #1	; 0x1
  10a168:	e1a00004 	mov	r0, r4
  10a16c:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
  10a170:	e3560001 	cmp	r6, #1	; 0x1
  10a174:	0afffff5 	beq	10a150 <xTaskResumeAll+0x218>
  10a178:	e59f2038 	ldr	r2, [pc, #56]	; 10a1b8 <prog+0xa174>
  10a17c:	e5923000 	ldr	r3, [r2]
  10a180:	e3530001 	cmp	r3, #1	; 0x1
  10a184:	1affff7b 	bne	109f78 <xTaskResumeAll+0x40>
  10a188:	eafffff1 	b	10a154 <xTaskResumeAll+0x21c>
  10a18c:	00200928 	eoreq	r0, r0, r8, lsr #18
  10a190:	00200934 	eoreq	r0, r0, r4, lsr r9
  10a194:	002009d8 	ldreqd	r0, [r0], -r8
  10a198:	00200918 	eoreq	r0, r0, r8, lsl r9
  10a19c:	00200944 	eoreq	r0, r0, r4, asr #18
  10a1a0:	0020092c 	eoreq	r0, r0, ip, lsr #18
  10a1a4:	00200930 	eoreq	r0, r0, r0, lsr r9
  10a1a8:	00200924 	eoreq	r0, r0, r4, lsr #18
  10a1ac:	002009d0 	ldreqd	r0, [r0], -r0
  10a1b0:	002009d4 	ldreqd	r0, [r0], -r4
  10a1b4:	00200920 	eoreq	r0, r0, r0, lsr #18
  10a1b8:	0020091c 	eoreq	r0, r0, ip, lsl r9

0010a1bc <prvIdleTask>:
  10a1bc:	e92d45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
  10a1c0:	e59f50a0 	ldr	r5, [pc, #160]	; 10a268 <prog+0xa224>
  10a1c4:	e5953000 	ldr	r3, [r5]
  10a1c8:	e59f709c 	ldr	r7, [pc, #156]	; 10a26c <prog+0xa228>
  10a1cc:	e3530000 	cmp	r3, #0	; 0x0
  10a1d0:	e59f8098 	ldr	r8, [pc, #152]	; 10a270 <prog+0xa22c>
  10a1d4:	e59f6098 	ldr	r6, [pc, #152]	; 10a274 <prog+0xa230>
  10a1d8:	e287a008 	add	sl, r7, #8	; 0x8
  10a1dc:	1a000007 	bne	10a200 <prvIdleTask+0x44>
  10a1e0:	e5963000 	ldr	r3, [r6]
  10a1e4:	e3530001 	cmp	r3, #1	; 0x1
  10a1e8:	9a000000 	bls	10a1f0 <prvIdleTask+0x34>
  10a1ec:	ef000000 	swi	0x00000000
  10a1f0:	ebfffa6d 	bl	108bac <vApplicationIdleHook>
  10a1f4:	e5953000 	ldr	r3, [r5]
  10a1f8:	e3530000 	cmp	r3, #0	; 0x0
  10a1fc:	0afffff7 	beq	10a1e0 <prvIdleTask+0x24>
  10a200:	ebfffdef 	bl	1099c4 <vTaskSuspendAll>
  10a204:	e5974000 	ldr	r4, [r7]
  10a208:	ebffff4a 	bl	109f38 <xTaskResumeAll>
  10a20c:	e3540000 	cmp	r4, #0	; 0x0
  10a210:	0afffff2 	beq	10a1e0 <prvIdleTask+0x24>
  10a214:	eb0000d7 	bl	10a578 <vPortEnterCritical>
  10a218:	e59f304c 	ldr	r3, [pc, #76]	; 10a26c <prog+0xa228>
  10a21c:	e5932000 	ldr	r2, [r3]
  10a220:	e3520000 	cmp	r2, #0	; 0x0
  10a224:	159a3004 	ldrne	r3, [sl, #4]
  10a228:	e1a04002 	mov	r4, r2
  10a22c:	1593400c 	ldrne	r4, [r3, #12]
  10a230:	e2840004 	add	r0, r4, #4	; 0x4
  10a234:	ebfffbe6 	bl	1091d4 <vListRemove>
  10a238:	e5983000 	ldr	r3, [r8]
  10a23c:	e2433001 	sub	r3, r3, #1	; 0x1
  10a240:	e5883000 	str	r3, [r8]
  10a244:	e5952000 	ldr	r2, [r5]
  10a248:	e2422001 	sub	r2, r2, #1	; 0x1
  10a24c:	e5852000 	str	r2, [r5]
  10a250:	eb0000d3 	bl	10a5a4 <vPortExitCritical>
  10a254:	e5940030 	ldr	r0, [r4, #48]
  10a258:	eb00013c 	bl	10a750 <vPortFree>
  10a25c:	e1a00004 	mov	r0, r4
  10a260:	eb00013a 	bl	10a750 <vPortFree>
  10a264:	eaffffdd 	b	10a1e0 <prvIdleTask+0x24>
  10a268:	0020093c 	eoreq	r0, r0, ip, lsr r9
  10a26c:	002009ec 	eoreq	r0, r0, ip, ror #19
  10a270:	00200934 	eoreq	r0, r0, r4, lsr r9
  10a274:	00200944 	eoreq	r0, r0, r4, asr #18

0010a278 <vTaskDelay>:
  10a278:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
  10a27c:	e2505000 	subs	r5, r0, #0	; 0x0
  10a280:	e59f6084 	ldr	r6, [pc, #132]	; 10a30c <prog+0xa2c8>
  10a284:	e59f7084 	ldr	r7, [pc, #132]	; 10a310 <prog+0xa2cc>
  10a288:	1a000001 	bne	10a294 <vTaskDelay+0x1c>
  10a28c:	ef000000 	swi	0x00000000
  10a290:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10a294:	ebfffdca 	bl	1099c4 <vTaskSuspendAll>
  10a298:	e5974000 	ldr	r4, [r7]
  10a29c:	e5960000 	ldr	r0, [r6]
  10a2a0:	e2800004 	add	r0, r0, #4	; 0x4
  10a2a4:	ebfffbca 	bl	1091d4 <vListRemove>
  10a2a8:	e5962000 	ldr	r2, [r6]
  10a2ac:	e5973000 	ldr	r3, [r7]
  10a2b0:	e0854004 	add	r4, r5, r4
  10a2b4:	e1540003 	cmp	r4, r3
  10a2b8:	e5824004 	str	r4, [r2, #4]
  10a2bc:	2a000009 	bcs	10a2e8 <vTaskDelay+0x70>
  10a2c0:	e59f304c 	ldr	r3, [pc, #76]	; 10a314 <prog+0xa2d0>
  10a2c4:	e5930000 	ldr	r0, [r3]
  10a2c8:	e5961000 	ldr	r1, [r6]
  10a2cc:	e2811004 	add	r1, r1, #4	; 0x4
  10a2d0:	ebfffba6 	bl	109170 <vListInsert>
  10a2d4:	ebffff17 	bl	109f38 <xTaskResumeAll>
  10a2d8:	e3500000 	cmp	r0, #0	; 0x0
  10a2dc:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
  10a2e0:	ef000000 	swi	0x00000000
  10a2e4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10a2e8:	e59f3028 	ldr	r3, [pc, #40]	; 10a318 <prog+0xa2d4>
  10a2ec:	e5930000 	ldr	r0, [r3]
  10a2f0:	e5961000 	ldr	r1, [r6]
  10a2f4:	e2811004 	add	r1, r1, #4	; 0x4
  10a2f8:	ebfffb9c 	bl	109170 <vListInsert>
  10a2fc:	ebffff0d 	bl	109f38 <xTaskResumeAll>
  10a300:	e3500000 	cmp	r0, #0	; 0x0
  10a304:	0afffff5 	beq	10a2e0 <vTaskDelay+0x68>
  10a308:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
  10a30c:	00200918 	eoreq	r0, r0, r8, lsl r9
  10a310:	00200924 	eoreq	r0, r0, r4, lsr #18
  10a314:	002009d4 	ldreqd	r0, [r0], -r4
  10a318:	002009d0 	ldreqd	r0, [r0], -r0

0010a31c <pxPortInitialiseStack>:
  10a31c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10a320:	e2811004 	add	r1, r1, #4	; 0x4
  10a324:	e1a0b000 	mov	fp, r0
  10a328:	e40b1004 	str	r1, [fp], #-4
  10a32c:	e24b1004 	sub	r1, fp, #4	; 0x4
  10a330:	e24dd03c 	sub	sp, sp, #60	; 0x3c
  10a334:	e2413004 	sub	r3, r1, #4	; 0x4
  10a338:	e58d1004 	str	r1, [sp, #4]
  10a33c:	e2431004 	sub	r1, r3, #4	; 0x4
  10a340:	e58d3008 	str	r3, [sp, #8]
  10a344:	e2413004 	sub	r3, r1, #4	; 0x4
  10a348:	e58d100c 	str	r1, [sp, #12]
  10a34c:	e2431004 	sub	r1, r3, #4	; 0x4
  10a350:	e58d3010 	str	r3, [sp, #16]
  10a354:	e2413004 	sub	r3, r1, #4	; 0x4
  10a358:	e58d1014 	str	r1, [sp, #20]
  10a35c:	e2431004 	sub	r1, r3, #4	; 0x4
  10a360:	e58d3018 	str	r3, [sp, #24]
  10a364:	e2413004 	sub	r3, r1, #4	; 0x4
  10a368:	e58d101c 	str	r1, [sp, #28]
  10a36c:	e2431004 	sub	r1, r3, #4	; 0x4
  10a370:	e58d3020 	str	r3, [sp, #32]
  10a374:	e2413004 	sub	r3, r1, #4	; 0x4
  10a378:	e58d1024 	str	r1, [sp, #36]
  10a37c:	e2431004 	sub	r1, r3, #4	; 0x4
  10a380:	e58d3028 	str	r3, [sp, #40]
  10a384:	e2413004 	sub	r3, r1, #4	; 0x4
  10a388:	e58d102c 	str	r1, [sp, #44]
  10a38c:	e2431004 	sub	r1, r3, #4	; 0x4
  10a390:	e58d1034 	str	r1, [sp, #52]
  10a394:	e58d3030 	str	r3, [sp, #48]
  10a398:	e59d3034 	ldr	r3, [sp, #52]
  10a39c:	e2433004 	sub	r3, r3, #4	; 0x4
  10a3a0:	e58d0000 	str	r0, [sp]
  10a3a4:	e58d3038 	str	r3, [sp, #56]
  10a3a8:	e2430004 	sub	r0, r3, #4	; 0x4
  10a3ac:	e3a03caa 	mov	r3, #43520	; 0xaa00
  10a3b0:	e59d1000 	ldr	r1, [sp]
  10a3b4:	e28330aa 	add	r3, r3, #170	; 0xaa
  10a3b8:	e1833803 	orr	r3, r3, r3, lsl #16
  10a3bc:	e5013004 	str	r3, [r1, #-4]
  10a3c0:	e3a03c12 	mov	r3, #4608	; 0x1200
  10a3c4:	e50b1004 	str	r1, [fp, #-4]
  10a3c8:	e2833012 	add	r3, r3, #18	; 0x12
  10a3cc:	e59d1004 	ldr	r1, [sp, #4]
  10a3d0:	e1833803 	orr	r3, r3, r3, lsl #16
  10a3d4:	e3a09c11 	mov	r9, #4352	; 0x1100
  10a3d8:	e3a0aa01 	mov	sl, #4096	; 0x1000
  10a3dc:	e5013004 	str	r3, [r1, #-4]
  10a3e0:	e2899011 	add	r9, r9, #17	; 0x11
  10a3e4:	e28d1008 	add	r1, sp, #8	; 0x8
  10a3e8:	e891000a 	ldmia	r1, {r1, r3}
  10a3ec:	e28aa010 	add	sl, sl, #16	; 0x10
  10a3f0:	e1899809 	orr	r9, r9, r9, lsl #16
  10a3f4:	e18aa80a 	orr	sl, sl, sl, lsl #16
  10a3f8:	e3a08c09 	mov	r8, #2304	; 0x900
  10a3fc:	e3a07b02 	mov	r7, #2048	; 0x800
  10a400:	e5019004 	str	r9, [r1, #-4]
  10a404:	e2888009 	add	r8, r8, #9	; 0x9
  10a408:	e503a004 	str	sl, [r3, #-4]
  10a40c:	e28d1010 	add	r1, sp, #16	; 0x10
  10a410:	e891000a 	ldmia	r1, {r1, r3}
  10a414:	e2877008 	add	r7, r7, #8	; 0x8
  10a418:	e1888808 	orr	r8, r8, r8, lsl #16
  10a41c:	e1877807 	orr	r7, r7, r7, lsl #16
  10a420:	e3a06c07 	mov	r6, #1792	; 0x700
  10a424:	e3a05c06 	mov	r5, #1536	; 0x600
  10a428:	e5018004 	str	r8, [r1, #-4]
  10a42c:	e2866007 	add	r6, r6, #7	; 0x7
  10a430:	e5037004 	str	r7, [r3, #-4]
  10a434:	e28d1018 	add	r1, sp, #24	; 0x18
  10a438:	e891000a 	ldmia	r1, {r1, r3}
  10a43c:	e2855006 	add	r5, r5, #6	; 0x6
  10a440:	e1866806 	orr	r6, r6, r6, lsl #16
  10a444:	e1855805 	orr	r5, r5, r5, lsl #16
  10a448:	e3a04c05 	mov	r4, #1280	; 0x500
  10a44c:	e5016004 	str	r6, [r1, #-4]
  10a450:	e2844005 	add	r4, r4, #5	; 0x5
  10a454:	e5035004 	str	r5, [r3, #-4]
  10a458:	e59d1020 	ldr	r1, [sp, #32]
  10a45c:	e1844804 	orr	r4, r4, r4, lsl #16
  10a460:	e3a0eb01 	mov	lr, #1024	; 0x400
  10a464:	e3a0cc03 	mov	ip, #768	; 0x300
  10a468:	e5014004 	str	r4, [r1, #-4]
  10a46c:	e59d3024 	ldr	r3, [sp, #36]
  10a470:	e59d1028 	ldr	r1, [sp, #40]
  10a474:	e28ee004 	add	lr, lr, #4	; 0x4
  10a478:	e28cc003 	add	ip, ip, #3	; 0x3
  10a47c:	e18ee80e 	orr	lr, lr, lr, lsl #16
  10a480:	e18cc80c 	orr	ip, ip, ip, lsl #16
  10a484:	e503e004 	str	lr, [r3, #-4]
  10a488:	e501c004 	str	ip, [r1, #-4]
  10a48c:	e3a01c02 	mov	r1, #512	; 0x200
  10a490:	e59d302c 	ldr	r3, [sp, #44]
  10a494:	e2811002 	add	r1, r1, #2	; 0x2
  10a498:	e1811801 	orr	r1, r1, r1, lsl #16
  10a49c:	e5031004 	str	r1, [r3, #-4]
  10a4a0:	e3a01c01 	mov	r1, #256	; 0x100
  10a4a4:	e59d3030 	ldr	r3, [sp, #48]
  10a4a8:	e2811001 	add	r1, r1, #1	; 0x1
  10a4ac:	e1811801 	orr	r1, r1, r1, lsl #16
  10a4b0:	e5031004 	str	r1, [r3, #-4]
  10a4b4:	e59d3034 	ldr	r3, [sp, #52]
  10a4b8:	e59d1038 	ldr	r1, [sp, #56]
  10a4bc:	e5032004 	str	r2, [r3, #-4]
  10a4c0:	e3a0301f 	mov	r3, #31	; 0x1f
  10a4c4:	e3a02000 	mov	r2, #0	; 0x0
  10a4c8:	e5013004 	str	r3, [r1, #-4]
  10a4cc:	e5002004 	str	r2, [r0, #-4]
  10a4d0:	e2400004 	sub	r0, r0, #4	; 0x4
  10a4d4:	e28dd03c 	add	sp, sp, #60	; 0x3c
  10a4d8:	e8bd8ff0 	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

0010a4dc <xPortStartScheduler>:
  10a4dc:	e52de004 	str	lr, [sp, #-4]!
  10a4e0:	e3a01007 	mov	r1, #7	; 0x7
  10a4e4:	e3a02000 	mov	r2, #0	; 0x0
  10a4e8:	e59f3030 	ldr	r3, [pc, #48]	; 10a520 <prog+0xa4dc>
  10a4ec:	e3a00001 	mov	r0, #1	; 0x1
  10a4f0:	ebfffaf7 	bl	1090d4 <AT91F_AIC_ConfigureIt>
  10a4f4:	e3a03403 	mov	r3, #50331648	; 0x3000000
  10a4f8:	e2833ebb 	add	r3, r3, #2992	; 0xbb0
  10a4fc:	e3e02c02 	mvn	r2, #512	; 0x200
  10a500:	e2833003 	add	r3, r3, #3	; 0x3
  10a504:	e50230cf 	str	r3, [r2, #-207]
  10a508:	e3a01002 	mov	r1, #2	; 0x2
  10a50c:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10a510:	e5831021 	str	r1, [r3, #33]
  10a514:	eb000002 	bl	10a524 <vPortISRStartFirstTask>
  10a518:	e3a00000 	mov	r0, #0	; 0x0
  10a51c:	e49df004 	ldr	pc, [sp], #4
  10a520:	0010a5e8 	andeqs	sl, r0, r8, ror #11

0010a524 <vPortISRStartFirstTask>:
  10a524:	e59f0044 	ldr	r0, [pc, #68]	; 10a570 <prog+0xa52c>
  10a528:	e5900000 	ldr	r0, [r0]
  10a52c:	e590e000 	ldr	lr, [r0]
  10a530:	e59f003c 	ldr	r0, [pc, #60]	; 10a574 <prog+0xa530>
  10a534:	e8be0002 	ldmia	lr!, {r1}
  10a538:	e5801000 	str	r1, [r0]
  10a53c:	e8be0001 	ldmia	lr!, {r0}
  10a540:	e169f000 	msr	SPSR_fc, r0
  10a544:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10a548:	e1a00000 	nop			(mov r0,r0)
  10a54c:	e59ee03c 	ldr	lr, [lr, #60]
  10a550:	e25ef004 	subs	pc, lr, #4	; 0x4
  10a554:	e59f300c 	ldr	r3, [pc, #12]	; 10a568 <prog+0xa524>
  10a558:	e59f200c 	ldr	r2, [pc, #12]	; 10a56c <prog+0xa528>
  10a55c:	e5931000 	ldr	r1, [r3]
  10a560:	e5923000 	ldr	r3, [r2]
  10a564:	e12fff1e 	bx	lr
  10a568:	00200824 	eoreq	r0, r0, r4, lsr #16
  10a56c:	00200918 	eoreq	r0, r0, r8, lsl r9
  10a570:	00200918 	eoreq	r0, r0, r8, lsl r9
  10a574:	00200824 	eoreq	r0, r0, r4, lsr #16

0010a578 <vPortEnterCritical>:
  10a578:	e92d0001 	stmdb	sp!, {r0}
  10a57c:	e10f0000 	mrs	r0, CPSR
  10a580:	e38000c0 	orr	r0, r0, #192	; 0xc0
  10a584:	e129f000 	msr	CPSR_fc, r0
  10a588:	e8bd0001 	ldmia	sp!, {r0}
  10a58c:	e59f200c 	ldr	r2, [pc, #12]	; 10a5a0 <prog+0xa55c>
  10a590:	e5923000 	ldr	r3, [r2]
  10a594:	e2833001 	add	r3, r3, #1	; 0x1
  10a598:	e5823000 	str	r3, [r2]
  10a59c:	e12fff1e 	bx	lr
  10a5a0:	00200824 	eoreq	r0, r0, r4, lsr #16

0010a5a4 <vPortExitCritical>:
  10a5a4:	e59f2038 	ldr	r2, [pc, #56]	; 10a5e4 <prog+0xa5a0>
  10a5a8:	e5923000 	ldr	r3, [r2]
  10a5ac:	e3530000 	cmp	r3, #0	; 0x0
  10a5b0:	012fff1e 	bxeq	lr
  10a5b4:	e5923000 	ldr	r3, [r2]
  10a5b8:	e2433001 	sub	r3, r3, #1	; 0x1
  10a5bc:	e5823000 	str	r3, [r2]
  10a5c0:	e5922000 	ldr	r2, [r2]
  10a5c4:	e3520000 	cmp	r2, #0	; 0x0
  10a5c8:	112fff1e 	bxne	lr
  10a5cc:	e92d0001 	stmdb	sp!, {r0}
  10a5d0:	e10f0000 	mrs	r0, CPSR
  10a5d4:	e3c000c0 	bic	r0, r0, #192	; 0xc0
  10a5d8:	e129f000 	msr	CPSR_fc, r0
  10a5dc:	e8bd0001 	ldmia	sp!, {r0}
  10a5e0:	e12fff1e 	bx	lr
  10a5e4:	00200824 	eoreq	r0, r0, r4, lsr #16

0010a5e8 <vPreemptiveTick>:
  10a5e8:	e92d0001 	stmdb	sp!, {r0}
  10a5ec:	e94d2000 	stmdb	sp, {sp}^
  10a5f0:	e1a00000 	nop			(mov r0,r0)
  10a5f4:	e24dd004 	sub	sp, sp, #4	; 0x4
  10a5f8:	e8bd0001 	ldmia	sp!, {r0}
  10a5fc:	e9204000 	stmdb	r0!, {lr}
  10a600:	e1a0e000 	mov	lr, r0
  10a604:	e8bd0001 	ldmia	sp!, {r0}
  10a608:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10a60c:	e1a00000 	nop			(mov r0,r0)
  10a610:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10a614:	e14f0000 	mrs	r0, SPSR
  10a618:	e92e0001 	stmdb	lr!, {r0}
  10a61c:	e59f0078 	ldr	r0, [pc, #120]	; 10a69c <prog+0xa658>
  10a620:	e5900000 	ldr	r0, [r0]
  10a624:	e92e0001 	stmdb	lr!, {r0}
  10a628:	e59f0070 	ldr	r0, [pc, #112]	; 10a6a0 <prog+0xa65c>
  10a62c:	e5900000 	ldr	r0, [r0]
  10a630:	e580e000 	str	lr, [r0]
  10a634:	e59f4058 	ldr	r4, [pc, #88]	; 10a694 <prog+0xa650>
  10a638:	e59f5058 	ldr	r5, [pc, #88]	; 10a698 <prog+0xa654>
  10a63c:	e5943000 	ldr	r3, [r4]
  10a640:	e5952000 	ldr	r2, [r5]
  10a644:	ebfffd10 	bl	109a8c <vTaskIncrementTick>
  10a648:	ebfffc77 	bl	10982c <vTaskSwitchContext>
  10a64c:	e3e03c02 	mvn	r3, #512	; 0x200
  10a650:	e51310c7 	ldr	r1, [r3, #-199]
  10a654:	e3e02c0f 	mvn	r2, #3840	; 0xf00
  10a658:	e5821031 	str	r1, [r2, #49]
  10a65c:	e59f003c 	ldr	r0, [pc, #60]	; 10a6a0 <prog+0xa65c>
  10a660:	e5900000 	ldr	r0, [r0]
  10a664:	e590e000 	ldr	lr, [r0]
  10a668:	e59f002c 	ldr	r0, [pc, #44]	; 10a69c <prog+0xa658>
  10a66c:	e8be0002 	ldmia	lr!, {r1}
  10a670:	e5801000 	str	r1, [r0]
  10a674:	e8be0001 	ldmia	lr!, {r0}
  10a678:	e169f000 	msr	SPSR_fc, r0
  10a67c:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10a680:	e1a00000 	nop			(mov r0,r0)
  10a684:	e59ee03c 	ldr	lr, [lr, #60]
  10a688:	e25ef004 	subs	pc, lr, #4	; 0x4
  10a68c:	e5943000 	ldr	r3, [r4]
  10a690:	e5952000 	ldr	r2, [r5]
  10a694:	00200824 	eoreq	r0, r0, r4, lsr #16
  10a698:	00200918 	eoreq	r0, r0, r8, lsl r9
  10a69c:	00200824 	eoreq	r0, r0, r4, lsr #16
  10a6a0:	00200918 	eoreq	r0, r0, r8, lsl r9

0010a6a4 <swi_handler>:
  10a6a4:	e28ee004 	add	lr, lr, #4	; 0x4
  10a6a8:	e92d0001 	stmdb	sp!, {r0}
  10a6ac:	e94d2000 	stmdb	sp, {sp}^
  10a6b0:	e1a00000 	nop			(mov r0,r0)
  10a6b4:	e24dd004 	sub	sp, sp, #4	; 0x4
  10a6b8:	e8bd0001 	ldmia	sp!, {r0}
  10a6bc:	e9204000 	stmdb	r0!, {lr}
  10a6c0:	e1a0e000 	mov	lr, r0
  10a6c4:	e8bd0001 	ldmia	sp!, {r0}
  10a6c8:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10a6cc:	e1a00000 	nop			(mov r0,r0)
  10a6d0:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10a6d4:	e14f0000 	mrs	r0, SPSR
  10a6d8:	e92e0001 	stmdb	lr!, {r0}
  10a6dc:	e59f0064 	ldr	r0, [pc, #100]	; 10a748 <prog+0xa704>
  10a6e0:	e5900000 	ldr	r0, [r0]
  10a6e4:	e92e0001 	stmdb	lr!, {r0}
  10a6e8:	e59f005c 	ldr	r0, [pc, #92]	; 10a74c <prog+0xa708>
  10a6ec:	e5900000 	ldr	r0, [r0]
  10a6f0:	e580e000 	str	lr, [r0]
  10a6f4:	e59f4044 	ldr	r4, [pc, #68]	; 10a740 <prog+0xa6fc>
  10a6f8:	e59f5044 	ldr	r5, [pc, #68]	; 10a744 <prog+0xa700>
  10a6fc:	e5943000 	ldr	r3, [r4]
  10a700:	e5952000 	ldr	r2, [r5]
  10a704:	ebfffc48 	bl	10982c <vTaskSwitchContext>
  10a708:	e59f003c 	ldr	r0, [pc, #60]	; 10a74c <prog+0xa708>
  10a70c:	e5900000 	ldr	r0, [r0]
  10a710:	e590e000 	ldr	lr, [r0]
  10a714:	e59f002c 	ldr	r0, [pc, #44]	; 10a748 <prog+0xa704>
  10a718:	e8be0002 	ldmia	lr!, {r1}
  10a71c:	e5801000 	str	r1, [r0]
  10a720:	e8be0001 	ldmia	lr!, {r0}
  10a724:	e169f000 	msr	SPSR_fc, r0
  10a728:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10a72c:	e1a00000 	nop			(mov r0,r0)
  10a730:	e59ee03c 	ldr	lr, [lr, #60]
  10a734:	e25ef004 	subs	pc, lr, #4	; 0x4
  10a738:	e5943000 	ldr	r3, [r4]
  10a73c:	e5952000 	ldr	r2, [r5]
  10a740:	00200824 	eoreq	r0, r0, r4, lsr #16
  10a744:	00200918 	eoreq	r0, r0, r8, lsl r9
  10a748:	00200824 	eoreq	r0, r0, r4, lsr #16
  10a74c:	00200918 	eoreq	r0, r0, r8, lsl r9

0010a750 <vPortFree>:
  10a750:	e92d4010 	stmdb	sp!, {r4, lr}
  10a754:	e2504000 	subs	r4, r0, #0	; 0x0
  10a758:	08bd8010 	ldmeqia	sp!, {r4, pc}
  10a75c:	ebfffc98 	bl	1099c4 <vTaskSuspendAll>
  10a760:	e1a00004 	mov	r0, r4
  10a764:	ebffd6af 	bl	100228 <free>
  10a768:	e8bd4010 	ldmia	sp!, {r4, lr}
  10a76c:	eafffdf1 	b	109f38 <xTaskResumeAll>

0010a770 <pvPortMalloc>:
  10a770:	e92d4010 	stmdb	sp!, {r4, lr}
  10a774:	e1a04000 	mov	r4, r0
  10a778:	ebfffc91 	bl	1099c4 <vTaskSuspendAll>
  10a77c:	e1a00004 	mov	r0, r4
  10a780:	ebffd6ad 	bl	10023c <malloc>
  10a784:	e1a04000 	mov	r4, r0
  10a788:	ebfffdea 	bl	109f38 <xTaskResumeAll>
  10a78c:	e1a00004 	mov	r0, r4
  10a790:	e8bd8010 	ldmia	sp!, {r4, pc}

0010a794 <vDetachUSBInterface>:
  10a794:	e3e02c0b 	mvn	r2, #2816	; 0xb00
  10a798:	e3a03801 	mov	r3, #65536	; 0x10000
  10a79c:	e50230ff 	str	r3, [r2, #-255]
  10a7a0:	e50230ef 	str	r3, [r2, #-239]
  10a7a4:	e50230cf 	str	r3, [r2, #-207]
  10a7a8:	e12fff1e 	bx	lr

0010a7ac <vUSBRecvByte>:
  10a7ac:	e3500000 	cmp	r0, #0	; 0x0
  10a7b0:	13510000 	cmpne	r1, #0	; 0x0
  10a7b4:	e92d41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
  10a7b8:	e1a04000 	mov	r4, r0
  10a7bc:	e1a07002 	mov	r7, r2
  10a7c0:	c3a00000 	movgt	r0, #0	; 0x0
  10a7c4:	d3a00001 	movle	r0, #1	; 0x1
  10a7c8:	da000015 	ble	10a824 <vUSBRecvByte+0x78>
  10a7cc:	e59f805c 	ldr	r8, [pc, #92]	; 10a830 <prog+0xa7ec>
  10a7d0:	e5983000 	ldr	r3, [r8]
  10a7d4:	e3530000 	cmp	r3, #0	; 0x0
  10a7d8:	0a000011 	beq	10a824 <vUSBRecvByte+0x78>
  10a7dc:	e3510000 	cmp	r1, #0	; 0x0
  10a7e0:	11a05000 	movne	r5, r0
  10a7e4:	11a06001 	movne	r6, r1
  10a7e8:	1a000003 	bne	10a7fc <vUSBRecvByte+0x50>
  10a7ec:	ea00000c 	b	10a824 <vUSBRecvByte+0x78>
  10a7f0:	e2855001 	add	r5, r5, #1	; 0x1
  10a7f4:	e1560005 	cmp	r6, r5
  10a7f8:	0a000007 	beq	10a81c <vUSBRecvByte+0x70>
  10a7fc:	e1a01004 	mov	r1, r4
  10a800:	e5980000 	ldr	r0, [r8]
  10a804:	e1a02007 	mov	r2, r7
  10a808:	e3a03000 	mov	r3, #0	; 0x0
  10a80c:	ebfffb1d 	bl	109488 <xQueueGenericReceive>
  10a810:	e3500000 	cmp	r0, #0	; 0x0
  10a814:	e2844001 	add	r4, r4, #1	; 0x1
  10a818:	1afffff4 	bne	10a7f0 <vUSBRecvByte+0x44>
  10a81c:	e1a00005 	mov	r0, r5
  10a820:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10a824:	e3a05000 	mov	r5, #0	; 0x0
  10a828:	e1a00005 	mov	r0, r5
  10a82c:	e8bd81f0 	ldmia	sp!, {r4, r5, r6, r7, r8, pc}
  10a830:	00200b38 	eoreq	r0, r0, r8, lsr fp

0010a834 <usb_send_buffer_zero_copy>:
  10a834:	e52de004 	str	lr, [sp, #-4]!
  10a838:	e24dd014 	sub	sp, sp, #20	; 0x14
  10a83c:	e58d3010 	str	r3, [sp, #16]
  10a840:	e59f3028 	ldr	r3, [pc, #40]	; 10a870 <prog+0xa82c>
  10a844:	e3a0c000 	mov	ip, #0	; 0x0
  10a848:	e88d0003 	stmia	sp, {r0, r1}
  10a84c:	e58d200c 	str	r2, [sp, #12]
  10a850:	e5930000 	ldr	r0, [r3]
  10a854:	e1a0100d 	mov	r1, sp
  10a858:	e1a0300c 	mov	r3, ip
  10a85c:	e59d2018 	ldr	r2, [sp, #24]
  10a860:	e58dc008 	str	ip, [sp, #8]
  10a864:	ebfffb6d 	bl	109620 <xQueueGenericSend>
  10a868:	e28dd014 	add	sp, sp, #20	; 0x14
  10a86c:	e8bd8000 	ldmia	sp!, {pc}
  10a870:	00200b40 	eoreq	r0, r0, r0, asr #22

0010a874 <vUSBSendByte>:
  10a874:	e52de004 	str	lr, [sp, #-4]!
  10a878:	e59f3028 	ldr	r3, [pc, #40]	; 10a8a8 <prog+0xa864>
  10a87c:	e24dd008 	sub	sp, sp, #8	; 0x8
  10a880:	e3a02000 	mov	r2, #0	; 0x0
  10a884:	e5cd0004 	strb	r0, [sp, #4]
  10a888:	e3a0c001 	mov	ip, #1	; 0x1
  10a88c:	e5930000 	ldr	r0, [r3]
  10a890:	e28d1003 	add	r1, sp, #3	; 0x3
  10a894:	e1a03002 	mov	r3, r2
  10a898:	e5cdc003 	strb	ip, [sp, #3]
  10a89c:	ebfffb5f 	bl	109620 <xQueueGenericSend>
  10a8a0:	e28dd008 	add	sp, sp, #8	; 0x8
  10a8a4:	e8bd8000 	ldmia	sp!, {pc}
  10a8a8:	00200b3c 	eoreq	r0, r0, ip, lsr fp

0010a8ac <prvSendStall>:
  10a8ac:	e52de004 	str	lr, [sp, #-4]!
  10a8b0:	ebffff30 	bl	10a578 <vPortEnterCritical>
  10a8b4:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10a8b8:	e5123fcf 	ldr	r3, [r2, #-4047]
  10a8bc:	e3c33030 	bic	r3, r3, #48	; 0x30
  10a8c0:	e383306f 	orr	r3, r3, #111	; 0x6f
  10a8c4:	e5023fcf 	str	r3, [r2, #-4047]
  10a8c8:	e49de004 	ldr	lr, [sp], #4
  10a8cc:	eaffff34 	b	10a5a4 <vPortExitCritical>

0010a8d0 <prvSendZLP>:
  10a8d0:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10a8d4:	e5123fcf 	ldr	r3, [r2, #-4047]
  10a8d8:	e3130010 	tst	r3, #16	; 0x10
  10a8dc:	e92d4010 	stmdb	sp!, {r4, lr}
  10a8e0:	0a000005 	beq	10a8fc <prvSendZLP+0x2c>
  10a8e4:	e1a04002 	mov	r4, r2
  10a8e8:	e3a00001 	mov	r0, #1	; 0x1
  10a8ec:	ebfffe61 	bl	10a278 <vTaskDelay>
  10a8f0:	e5143fcf 	ldr	r3, [r4, #-4047]
  10a8f4:	e3130010 	tst	r3, #16	; 0x10
  10a8f8:	1afffffa 	bne	10a8e8 <prvSendZLP+0x18>
  10a8fc:	ebffff1d 	bl	10a578 <vPortEnterCritical>
  10a900:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  10a904:	e59f101c 	ldr	r1, [pc, #28]	; 10a928 <prog+0xa8e4>
  10a908:	e5103fcf 	ldr	r3, [r0, #-4047]
  10a90c:	e5912080 	ldr	r2, [r1, #128]
  10a910:	e3c33030 	bic	r3, r3, #48	; 0x30
  10a914:	e383305f 	orr	r3, r3, #95	; 0x5f
  10a918:	e5812084 	str	r2, [r1, #132]
  10a91c:	e5003fcf 	str	r3, [r0, #-4047]
  10a920:	e8bd4010 	ldmia	sp!, {r4, lr}
  10a924:	eaffff1e 	b	10a5a4 <vPortExitCritical>
  10a928:	00200a28 	eoreq	r0, r0, r8, lsr #20

0010a92c <prvSendNextSegment>:
  10a92c:	e92d4010 	stmdb	sp!, {r4, lr}
  10a930:	e59f40e4 	ldr	r4, [pc, #228]	; 10aa1c <prog+0xa9d8>
  10a934:	e5942084 	ldr	r2, [r4, #132]
  10a938:	e5943080 	ldr	r3, [r4, #128]
  10a93c:	e1520003 	cmp	r2, r3
  10a940:	e24dd00c 	sub	sp, sp, #12	; 0xc
  10a944:	9a00002a 	bls	10a9f4 <prvSendNextSegment+0xc8>
  10a948:	e0633002 	rsb	r3, r3, r2
  10a94c:	e58d3000 	str	r3, [sp]
  10a950:	e59d2000 	ldr	r2, [sp]
  10a954:	e3520008 	cmp	r2, #8	; 0x8
  10a958:	959d3000 	ldrls	r3, [sp]
  10a95c:	83a03008 	movhi	r3, #8	; 0x8
  10a960:	858d3008 	strhi	r3, [sp, #8]
  10a964:	958d3008 	strls	r3, [sp, #8]
  10a968:	ea000001 	b	10a974 <prvSendNextSegment+0x48>
  10a96c:	e3a00001 	mov	r0, #1	; 0x1
  10a970:	ebfffe40 	bl	10a278 <vTaskDelay>
  10a974:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  10a978:	e5132fcf 	ldr	r2, [r3, #-4047]
  10a97c:	e3120010 	tst	r2, #16	; 0x10
  10a980:	1afffff9 	bne	10a96c <prvSendNextSegment+0x40>
  10a984:	e59d3008 	ldr	r3, [sp, #8]
  10a988:	e3530000 	cmp	r3, #0	; 0x0
  10a98c:	0a00000b 	beq	10a9c0 <prvSendNextSegment+0x94>
  10a990:	e5941080 	ldr	r1, [r4, #128]
  10a994:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  10a998:	e7d43001 	ldrb	r3, [r4, r1]
  10a99c:	e5003faf 	str	r3, [r0, #-4015]
  10a9a0:	e59d2008 	ldr	r2, [sp, #8]
  10a9a4:	e2422001 	sub	r2, r2, #1	; 0x1
  10a9a8:	e58d2008 	str	r2, [sp, #8]
  10a9ac:	e59d3008 	ldr	r3, [sp, #8]
  10a9b0:	e3530000 	cmp	r3, #0	; 0x0
  10a9b4:	e2811001 	add	r1, r1, #1	; 0x1
  10a9b8:	1afffff6 	bne	10a998 <prvSendNextSegment+0x6c>
  10a9bc:	e5841080 	str	r1, [r4, #128]
  10a9c0:	ebfffeec 	bl	10a578 <vPortEnterCritical>
  10a9c4:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  10a9c8:	e5112fcf 	ldr	r2, [r1, #-4047]
  10a9cc:	e58d2004 	str	r2, [sp, #4]
  10a9d0:	e59d3004 	ldr	r3, [sp, #4]
  10a9d4:	e3c33030 	bic	r3, r3, #48	; 0x30
  10a9d8:	e383305f 	orr	r3, r3, #95	; 0x5f
  10a9dc:	e58d3004 	str	r3, [sp, #4]
  10a9e0:	e59d2004 	ldr	r2, [sp, #4]
  10a9e4:	e5012fcf 	str	r2, [r1, #-4047]
  10a9e8:	e28dd00c 	add	sp, sp, #12	; 0xc
  10a9ec:	e8bd4010 	ldmia	sp!, {r4, lr}
  10a9f0:	eafffeeb 	b	10a5a4 <vPortExitCritical>
  10a9f4:	e59f4024 	ldr	r4, [pc, #36]	; 10aa20 <prog+0xa9dc>
  10a9f8:	e5943000 	ldr	r3, [r4]
  10a9fc:	e3530004 	cmp	r3, #4	; 0x4
  10aa00:	0a000001 	beq	10aa0c <prvSendNextSegment+0xe0>
  10aa04:	e28dd00c 	add	sp, sp, #12	; 0xc
  10aa08:	e8bd8010 	ldmia	sp!, {r4, pc}
  10aa0c:	ebffffaf 	bl	10a8d0 <prvSendZLP>
  10aa10:	e3a03000 	mov	r3, #0	; 0x0
  10aa14:	e5843000 	str	r3, [r4]
  10aa18:	eafffff9 	b	10aa04 <prvSendNextSegment+0xd8>
  10aa1c:	00200a28 	eoreq	r0, r0, r8, lsr #20
  10aa20:	00200a18 	eoreq	r0, r0, r8, lsl sl

0010aa24 <prvSendControlData>:
  10aa24:	e1a01801 	mov	r1, r1, lsl #16
  10aa28:	e1a01821 	mov	r1, r1, lsr #16
  10aa2c:	e1510002 	cmp	r1, r2
  10aa30:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10aa34:	e1a05002 	mov	r5, r2
  10aa38:	93a02000 	movls	r2, #0	; 0x0
  10aa3c:	83a02001 	movhi	r2, #1	; 0x1
  10aa40:	31a05001 	movcc	r5, r1
  10aa44:	3a000008 	bcc	10aa6c <prvSendControlData+0x48>
  10aa48:	e3530000 	cmp	r3, #0	; 0x0
  10aa4c:	03a03000 	moveq	r3, #0	; 0x0
  10aa50:	12023001 	andne	r3, r2, #1	; 0x1
  10aa54:	e3530000 	cmp	r3, #0	; 0x0
  10aa58:	0a000003 	beq	10aa6c <prvSendControlData+0x48>
  10aa5c:	e3150007 	tst	r5, #7	; 0x7
  10aa60:	059f302c 	ldreq	r3, [pc, #44]	; 10aa94 <prog+0xaa50>
  10aa64:	03a02004 	moveq	r2, #4	; 0x4
  10aa68:	05832000 	streq	r2, [r3]
  10aa6c:	e59f4024 	ldr	r4, [pc, #36]	; 10aa98 <prog+0xaa54>
  10aa70:	e1a01000 	mov	r1, r0
  10aa74:	e1a02005 	mov	r2, r5
  10aa78:	e1a00004 	mov	r0, r4
  10aa7c:	ebffd7cf 	bl	1009c0 <memcpy>
  10aa80:	e3a03000 	mov	r3, #0	; 0x0
  10aa84:	e5843080 	str	r3, [r4, #128]
  10aa88:	e5845084 	str	r5, [r4, #132]
  10aa8c:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
  10aa90:	eaffffa5 	b	10a92c <prvSendNextSegment>
  10aa94:	00200a18 	eoreq	r0, r0, r8, lsl sl
  10aa98:	00200a28 	eoreq	r0, r0, r8, lsr #20

0010aa9c <vUSBCDCTask>:
  10aa9c:	e92d4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  10aaa0:	e59fc964 	ldr	ip, [pc, #2404]	; 10b40c <prog+0xb3c8>
  10aaa4:	e24dd028 	sub	sp, sp, #40	; 0x28
  10aaa8:	e59c4010 	ldr	r4, [ip, #16]
  10aaac:	e8bc000f 	ldmia	ip!, {r0, r1, r2, r3}
  10aab0:	e28dc004 	add	ip, sp, #4	; 0x4
  10aab4:	e58dc000 	str	ip, [sp]
  10aab8:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
  10aabc:	e58d4014 	str	r4, [sp, #20]
  10aac0:	ebfffeac 	bl	10a578 <vPortEnterCritical>
  10aac4:	ebffff32 	bl	10a794 <vDetachUSBInterface>
  10aac8:	ebfffeb5 	bl	10a5a4 <vPortExitCritical>
  10aacc:	e3a0003c 	mov	r0, #60	; 0x3c
  10aad0:	ebfffde8 	bl	10a278 <vTaskDelay>
  10aad4:	ebfffea7 	bl	10a578 <vPortEnterCritical>
  10aad8:	e3a00004 	mov	r0, #4	; 0x4
  10aadc:	e1a01000 	mov	r1, r0
  10aae0:	ebfffb28 	bl	109788 <xQueueCreate>
  10aae4:	e59f1924 	ldr	r1, [pc, #2340]	; 10b410 <prog+0xb3cc>
  10aae8:	e5810000 	str	r0, [r1]
  10aaec:	e3a01001 	mov	r1, #1	; 0x1
  10aaf0:	e3a00b01 	mov	r0, #1024	; 0x400
  10aaf4:	ebfffb23 	bl	109788 <xQueueCreate>
  10aaf8:	e59fb914 	ldr	fp, [pc, #2324]	; 10b414 <prog+0xb3d0>
  10aafc:	e3a01005 	mov	r1, #5	; 0x5
  10ab00:	e58b0000 	str	r0, [fp]
  10ab04:	e3a000cd 	mov	r0, #205	; 0xcd
  10ab08:	ebfffb1e 	bl	109788 <xQueueCreate>
  10ab0c:	e59f2904 	ldr	r2, [pc, #2308]	; 10b418 <prog+0xb3d4>
  10ab10:	e3a01014 	mov	r1, #20	; 0x14
  10ab14:	e5820000 	str	r0, [r2]
  10ab18:	e3a00040 	mov	r0, #64	; 0x40
  10ab1c:	ebfffb19 	bl	109788 <xQueueCreate>
  10ab20:	e59fc8e8 	ldr	ip, [pc, #2280]	; 10b410 <prog+0xb3cc>
  10ab24:	e59c3000 	ldr	r3, [ip]
  10ab28:	e59f18ec 	ldr	r1, [pc, #2284]	; 10b41c <prog+0xb3d8>
  10ab2c:	e3530000 	cmp	r3, #0	; 0x0
  10ab30:	e5810000 	str	r0, [r1]
  10ab34:	0a000038 	beq	10ac1c <vUSBCDCTask+0x180>
  10ab38:	e59b3000 	ldr	r3, [fp]
  10ab3c:	e3530000 	cmp	r3, #0	; 0x0
  10ab40:	0a000035 	beq	10ac1c <vUSBCDCTask+0x180>
  10ab44:	e59f28cc 	ldr	r2, [pc, #2252]	; 10b418 <prog+0xb3d4>
  10ab48:	e5923000 	ldr	r3, [r2]
  10ab4c:	e3530000 	cmp	r3, #0	; 0x0
  10ab50:	0a000031 	beq	10ac1c <vUSBCDCTask+0x180>
  10ab54:	e3500000 	cmp	r0, #0	; 0x0
  10ab58:	0a00002f 	beq	10ac1c <vUSBCDCTask+0x180>
  10ab5c:	e59fc8bc 	ldr	ip, [pc, #2236]	; 10b420 <prog+0xb3dc>
  10ab60:	e59f08bc 	ldr	r0, [pc, #2236]	; 10b424 <prog+0xb3e0>
  10ab64:	e59f18bc 	ldr	r1, [pc, #2236]	; 10b428 <prog+0xb3e4>
  10ab68:	e3a04000 	mov	r4, #0	; 0x0
  10ab6c:	e3a03002 	mov	r3, #2	; 0x2
  10ab70:	e58c3000 	str	r3, [ip]
  10ab74:	e5c04000 	strb	r4, [r0]
  10ab78:	e5c14000 	strb	r4, [r1]
  10ab7c:	e3e0ec03 	mvn	lr, #768	; 0x300
  10ab80:	e51e60d3 	ldr	r6, [lr, #-211]
  10ab84:	e3a0c080 	mov	ip, #128	; 0x80
  10ab88:	e3866201 	orr	r6, r6, #268435456	; 0x10000000
  10ab8c:	e50e60d3 	str	r6, [lr, #-211]
  10ab90:	e50ec0ff 	str	ip, [lr, #-255]
  10ab94:	e59fc890 	ldr	ip, [pc, #2192]	; 10b42c <prog+0xb3e8>
  10ab98:	e58c4080 	str	r4, [ip, #128]
  10ab9c:	e59fc88c 	ldr	ip, [pc, #2188]	; 10b430 <prog+0xb3ec>
  10aba0:	e58c4080 	str	r4, [ip, #128]
  10aba4:	e59fc888 	ldr	ip, [pc, #2184]	; 10b434 <prog+0xb3f0>
  10aba8:	e3e05a4f 	mvn	r5, #323584	; 0x4f000
  10abac:	e3e07c0b 	mvn	r7, #2816	; 0xb00
  10abb0:	e3a08801 	mov	r8, #65536	; 0x10000
  10abb4:	e3a0ab02 	mov	sl, #2048	; 0x800
  10abb8:	e3e09000 	mvn	r9, #0	; 0x0
  10abbc:	e50ea0ef 	str	sl, [lr, #-239]
  10abc0:	e1a02004 	mov	r2, r4
  10abc4:	e50780ff 	str	r8, [r7, #-255]
  10abc8:	e3a01003 	mov	r1, #3	; 0x3
  10abcc:	e50780ef 	str	r8, [r7, #-239]
  10abd0:	e59f3860 	ldr	r3, [pc, #2144]	; 10b438 <prog+0xb3f4>
  10abd4:	e50780cf 	str	r8, [r7, #-207]
  10abd8:	e58c4000 	str	r4, [ip]
  10abdc:	e5059feb 	str	r9, [r5, #-4075]
  10abe0:	e3a0000b 	mov	r0, #11	; 0xb
  10abe4:	e5059fdf 	str	r9, [r5, #-4063]
  10abe8:	e5054f8b 	str	r4, [r5, #-3979]
  10abec:	e5054fcf 	str	r4, [r5, #-4047]
  10abf0:	e5054fcb 	str	r4, [r5, #-4043]
  10abf4:	e5054fc7 	str	r4, [r5, #-4039]
  10abf8:	e5054fc3 	str	r4, [r5, #-4035]
  10abfc:	e5054ffb 	str	r4, [r5, #-4091]
  10ac00:	e5054ff7 	str	r4, [r5, #-4087]
  10ac04:	ebfff932 	bl	1090d4 <AT91F_AIC_ConfigureIt>
  10ac08:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10ac0c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
  10ac10:	e583a021 	str	sl, [r3, #33]
  10ac14:	ebfffd97 	bl	10a278 <vTaskDelay>
  10ac18:	e50780cb 	str	r8, [r7, #-203]
  10ac1c:	ebfffe60 	bl	10a5a4 <vPortExitCritical>
  10ac20:	e59f9814 	ldr	r9, [pc, #2068]	; 10b43c <prog+0xb3f8>
  10ac24:	e28da01b 	add	sl, sp, #27	; 0x1b
  10ac28:	e28d8027 	add	r8, sp, #39	; 0x27
  10ac2c:	e28d2008 	add	r2, sp, #8	; 0x8
  10ac30:	e892000c 	ldmia	r2, {r2, r3}
  10ac34:	e59f17d4 	ldr	r1, [pc, #2004]	; 10b410 <prog+0xb3cc>
  10ac38:	e1530002 	cmp	r3, r2
  10ac3c:	33a02000 	movcc	r2, #0	; 0x0
  10ac40:	23a02001 	movcs	r2, #1	; 0x1
  10ac44:	e5910000 	ldr	r0, [r1]
  10ac48:	e3a03000 	mov	r3, #0	; 0x0
  10ac4c:	e28d1020 	add	r1, sp, #32	; 0x20
  10ac50:	ebfffa0c 	bl	109488 <xQueueGenericReceive>
  10ac54:	e3500000 	cmp	r0, #0	; 0x0
  10ac58:	0a000030 	beq	10ad20 <vUSBCDCTask+0x284>
  10ac5c:	e59d5020 	ldr	r5, [sp, #32]
  10ac60:	e5953000 	ldr	r3, [r5]
  10ac64:	e3130001 	tst	r3, #1	; 0x1
  10ac68:	0a000029 	beq	10ad14 <vUSBCDCTask+0x278>
  10ac6c:	e5950004 	ldr	r0, [r5, #4]
  10ac70:	e1a03820 	mov	r3, r0, lsr #16
  10ac74:	e1a07a83 	mov	r7, r3, lsl #21
  10ac78:	e3100001 	tst	r0, #1	; 0x1
  10ac7c:	e1a07aa7 	mov	r7, r7, lsr #21
  10ac80:	0a000013 	beq	10acd4 <vUSBCDCTask+0x238>
  10ac84:	e59f27a8 	ldr	r2, [pc, #1960]	; 10b434 <prog+0xb3f0>
  10ac88:	e5926000 	ldr	r6, [r2]
  10ac8c:	e3560002 	cmp	r6, #2	; 0x2
  10ac90:	0a000189 	beq	10b2bc <prog+0xb278>
  10ac94:	e3560003 	cmp	r6, #3	; 0x3
  10ac98:	1a000184 	bne	10b2b0 <prog+0xb26c>
  10ac9c:	e59f379c 	ldr	r3, [pc, #1948]	; 10b440 <prog+0xb3fc>
  10aca0:	e5931000 	ldr	r1, [r3]
  10aca4:	e3510000 	cmp	r1, #0	; 0x0
  10aca8:	13a02001 	movne	r2, #1	; 0x1
  10acac:	13e03a4f 	mvnne	r3, #323584	; 0x4f000
  10acb0:	03e03a4f 	mvneq	r3, #323584	; 0x4f000
  10acb4:	e59fc778 	ldr	ip, [pc, #1912]	; 10b434 <prog+0xb3f0>
  10acb8:	15032ffb 	strne	r2, [r3, #-4091]
  10acbc:	05031ffb 	streq	r1, [r3, #-4091]
  10acc0:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10acc4:	e3813c01 	orr	r3, r1, #256	; 0x100
  10acc8:	e3a01000 	mov	r1, #0	; 0x0
  10accc:	e5023ff7 	str	r3, [r2, #-4087]
  10acd0:	e58c1000 	str	r1, [ip]
  10acd4:	e3100002 	tst	r0, #2	; 0x2
  10acd8:	0a000099 	beq	10af44 <vUSBCDCTask+0x4a8>
  10acdc:	e59f074c 	ldr	r0, [pc, #1868]	; 10b430 <prog+0xb3ec>
  10ace0:	e2800084 	add	r0, r0, #132	; 0x84
  10ace4:	e8100009 	ldmda	r0, {r0, r3}
  10ace8:	e0433000 	sub	r3, r3, r0
  10acec:	e59f1738 	ldr	r1, [pc, #1848]	; 10b42c <prog+0xb3e8>
  10acf0:	e20340ff 	and	r4, r3, #255	; 0xff
  10acf4:	e1570004 	cmp	r7, r4
  10acf8:	e5912084 	ldr	r2, [r1, #132]
  10acfc:	320740ff 	andcc	r4, r7, #255	; 0xff
  10ad00:	e3540000 	cmp	r4, #0	; 0x0
  10ad04:	e5812080 	str	r2, [r1, #128]
  10ad08:	e59f6720 	ldr	r6, [pc, #1824]	; 10b430 <prog+0xb3ec>
  10ad0c:	1a000084 	bne	10af24 <vUSBCDCTask+0x488>
  10ad10:	e59d5020 	ldr	r5, [sp, #32]
  10ad14:	e5953000 	ldr	r3, [r5]
  10ad18:	e3130a01 	tst	r3, #4096	; 0x1000
  10ad1c:	1a0000d5 	bne	10b078 <prog+0xb034>
  10ad20:	e59f070c 	ldr	r0, [pc, #1804]	; 10b434 <prog+0xb3f0>
  10ad24:	e5903000 	ldr	r3, [r0]
  10ad28:	e3530005 	cmp	r3, #5	; 0x5
  10ad2c:	1affffbe 	bne	10ac2c <vUSBCDCTask+0x190>
  10ad30:	e59f16f0 	ldr	r1, [pc, #1776]	; 10b428 <prog+0xb3e4>
  10ad34:	e5d13000 	ldrb	r3, [r1]
  10ad38:	e3530000 	cmp	r3, #0	; 0x0
  10ad3c:	0affffba 	beq	10ac2c <vUSBCDCTask+0x190>
  10ad40:	e3e03a4f 	mvn	r3, #323584	; 0x4f000
  10ad44:	e5132fc7 	ldr	r2, [r3, #-4039]
  10ad48:	e3120010 	tst	r2, #16	; 0x10
  10ad4c:	1a000045 	bne	10ae68 <vUSBCDCTask+0x3cc>
  10ad50:	e59d000c 	ldr	r0, [sp, #12]
  10ad54:	e59d2008 	ldr	r2, [sp, #8]
  10ad58:	e1500002 	cmp	r0, r2
  10ad5c:	2a0000af 	bcs	10b020 <prog+0xafdc>
  10ad60:	e1500002 	cmp	r0, r2
  10ad64:	e3a04000 	mov	r4, #0	; 0x0
  10ad68:	3a000027 	bcc	10ae0c <vUSBCDCTask+0x370>
  10ad6c:	e59fc6a8 	ldr	ip, [pc, #1704]	; 10b41c <prog+0xb3d8>
  10ad70:	e3a02000 	mov	r2, #0	; 0x0
  10ad74:	e59c0000 	ldr	r0, [ip]
  10ad78:	e28d1004 	add	r1, sp, #4	; 0x4
  10ad7c:	e1a03002 	mov	r3, r2
  10ad80:	ebfff9c0 	bl	109488 <xQueueGenericReceive>
  10ad84:	e3500000 	cmp	r0, #0	; 0x0
  10ad88:	058d0008 	streq	r0, [sp, #8]
  10ad8c:	058d000c 	streq	r0, [sp, #12]
  10ad90:	0a000003 	beq	10ada4 <vUSBCDCTask+0x308>
  10ad94:	e59d000c 	ldr	r0, [sp, #12]
  10ad98:	e59d2008 	ldr	r2, [sp, #8]
  10ad9c:	e1500002 	cmp	r0, r2
  10ada0:	3a000019 	bcc	10ae0c <vUSBCDCTask+0x370>
  10ada4:	e59f166c 	ldr	r1, [pc, #1644]	; 10b418 <prog+0xb3d4>
  10ada8:	e3a02000 	mov	r2, #0	; 0x0
  10adac:	e5910000 	ldr	r0, [r1]
  10adb0:	e1a03002 	mov	r3, r2
  10adb4:	e1a0100a 	mov	r1, sl
  10adb8:	ebfff9b2 	bl	109488 <xQueueGenericReceive>
  10adbc:	e3500000 	cmp	r0, #0	; 0x0
  10adc0:	0a000024 	beq	10ae58 <vUSBCDCTask+0x3bc>
  10adc4:	e5dd101b 	ldrb	r1, [sp, #27]
  10adc8:	e3510000 	cmp	r1, #0	; 0x0
  10adcc:	da000007 	ble	10adf0 <vUSBCDCTask+0x354>
  10add0:	e3a02000 	mov	r2, #0	; 0x0
  10add4:	e3e00a4f 	mvn	r0, #323584	; 0x4f000
  10add8:	e2822001 	add	r2, r2, #1	; 0x1
  10addc:	e7d2300a 	ldrb	r3, [r2, sl]
  10ade0:	e1520001 	cmp	r2, r1
  10ade4:	e5003fa7 	str	r3, [r0, #-4007]
  10ade8:	e2844001 	add	r4, r4, #1	; 0x1
  10adec:	1afffff9 	bne	10add8 <vUSBCDCTask+0x33c>
  10adf0:	e2844001 	add	r4, r4, #1	; 0x1
  10adf4:	e354003b 	cmp	r4, #59	; 0x3b
  10adf8:	ca000016 	bgt	10ae58 <vUSBCDCTask+0x3bc>
  10adfc:	e59d000c 	ldr	r0, [sp, #12]
  10ae00:	e59d2008 	ldr	r2, [sp, #8]
  10ae04:	e1500002 	cmp	r0, r2
  10ae08:	2affffd7 	bcs	10ad6c <vUSBCDCTask+0x2d0>
  10ae0c:	e59dc004 	ldr	ip, [sp, #4]
  10ae10:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  10ae14:	e1500002 	cmp	r0, r2
  10ae18:	e2844001 	add	r4, r4, #1	; 0x1
  10ae1c:	e2801001 	add	r1, r0, #1	; 0x1
  10ae20:	2a000007 	bcs	10ae44 <vUSBCDCTask+0x3a8>
  10ae24:	e7dc3000 	ldrb	r3, [ip, r0]
  10ae28:	e354003f 	cmp	r4, #63	; 0x3f
  10ae2c:	e50e3fa7 	str	r3, [lr, #-4007]
  10ae30:	e1a00001 	mov	r0, r1
  10ae34:	e58d100c 	str	r1, [sp, #12]
  10ae38:	dafffff5 	ble	10ae14 <vUSBCDCTask+0x378>
  10ae3c:	e1520001 	cmp	r2, r1
  10ae40:	8a000004 	bhi	10ae58 <vUSBCDCTask+0x3bc>
  10ae44:	e59d3010 	ldr	r3, [sp, #16]
  10ae48:	e3530000 	cmp	r3, #0	; 0x0
  10ae4c:	159d0014 	ldrne	r0, [sp, #20]
  10ae50:	11a0e00f 	movne	lr, pc
  10ae54:	112fff13 	bxne	r3
  10ae58:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10ae5c:	e5123fc7 	ldr	r3, [r2, #-4039]
  10ae60:	e3833010 	orr	r3, r3, #16	; 0x10
  10ae64:	e5023fc7 	str	r3, [r2, #-4039]
  10ae68:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10ae6c:	e5143fcb 	ldr	r3, [r4, #-4043]
  10ae70:	e3130042 	tst	r3, #66	; 0x42
  10ae74:	0affff6c 	beq	10ac2c <vUSBCDCTask+0x190>
  10ae78:	e5143fcb 	ldr	r3, [r4, #-4043]
  10ae7c:	e59b0000 	ldr	r0, [fp]
  10ae80:	e1a03823 	mov	r3, r3, lsr #16
  10ae84:	e1a05a83 	mov	r5, r3, lsl #21
  10ae88:	ebfff8e0 	bl	109210 <uxQueueMessagesWaiting>
  10ae8c:	e1a05aa5 	mov	r5, r5, lsr #21
  10ae90:	e2600b01 	rsb	r0, r0, #1024	; 0x400
  10ae94:	e1550000 	cmp	r5, r0
  10ae98:	2affff63 	bcs	10ac2c <vUSBCDCTask+0x190>
  10ae9c:	e3550000 	cmp	r5, #0	; 0x0
  10aea0:	0a00000b 	beq	10aed4 <vUSBCDCTask+0x438>
  10aea4:	e1a06004 	mov	r6, r4
  10aea8:	e3a04000 	mov	r4, #0	; 0x0
  10aeac:	e516cfab 	ldr	ip, [r6, #-4011]
  10aeb0:	e3a02000 	mov	r2, #0	; 0x0
  10aeb4:	e2844001 	add	r4, r4, #1	; 0x1
  10aeb8:	e59b0000 	ldr	r0, [fp]
  10aebc:	e1a01008 	mov	r1, r8
  10aec0:	e1a03002 	mov	r3, r2
  10aec4:	e5cdc027 	strb	ip, [sp, #39]
  10aec8:	ebfff9d4 	bl	109620 <xQueueGenericSend>
  10aecc:	e1540005 	cmp	r4, r5
  10aed0:	1afffff5 	bne	10aeac <vUSBCDCTask+0x410>
  10aed4:	ebfffda7 	bl	10a578 <vPortEnterCritical>
  10aed8:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10aedc:	e59fc53c 	ldr	ip, [pc, #1340]	; 10b420 <prog+0xb3dc>
  10aee0:	e5143fcb 	ldr	r3, [r4, #-4043]
  10aee4:	e59c2000 	ldr	r2, [ip]
  10aee8:	e383304f 	orr	r3, r3, #79	; 0x4f
  10aeec:	e1e02002 	mvn	r2, r2
  10aef0:	e3c33030 	bic	r3, r3, #48	; 0x30
  10aef4:	e0033002 	and	r3, r3, r2
  10aef8:	e5043fcb 	str	r3, [r4, #-4043]
  10aefc:	ebfffda8 	bl	10a5a4 <vPortExitCritical>
  10af00:	e3a01002 	mov	r1, #2	; 0x2
  10af04:	e5041fef 	str	r1, [r4, #-4079]
  10af08:	e59f0510 	ldr	r0, [pc, #1296]	; 10b420 <prog+0xb3dc>
  10af0c:	e5903000 	ldr	r3, [r0]
  10af10:	e1530001 	cmp	r3, r1
  10af14:	03a03040 	moveq	r3, #64	; 0x40
  10af18:	05803000 	streq	r3, [r0]
  10af1c:	15801000 	strne	r1, [r0]
  10af20:	eaffffd0 	b	10ae68 <vUSBCDCTask+0x3cc>
  10af24:	e1a00006 	mov	r0, r6
  10af28:	e2851008 	add	r1, r5, #8	; 0x8
  10af2c:	e1a02004 	mov	r2, r4
  10af30:	ebffd6a2 	bl	1009c0 <memcpy>
  10af34:	e5963080 	ldr	r3, [r6, #128]
  10af38:	e0843003 	add	r3, r4, r3
  10af3c:	e5863080 	str	r3, [r6, #128]
  10af40:	e5950004 	ldr	r0, [r5, #4]
  10af44:	e3100004 	tst	r0, #4	; 0x4
  10af48:	0a000020 	beq	10afd0 <vUSBCDCTask+0x534>
  10af4c:	e3570007 	cmp	r7, #7	; 0x7
  10af50:	9a00001e 	bls	10afd0 <vUSBCDCTask+0x534>
  10af54:	e5d51008 	ldrb	r1, [r5, #8]
  10af58:	e5c91000 	strb	r1, [r9]
  10af5c:	e5d52009 	ldrb	r2, [r5, #9]
  10af60:	e5c92001 	strb	r2, [r9, #1]
  10af64:	e5d5300b 	ldrb	r3, [r5, #11]
  10af68:	e1a03403 	mov	r3, r3, lsl #8
  10af6c:	e1c930b2 	strh	r3, [r9, #2]
  10af70:	e5d5200a 	ldrb	r2, [r5, #10]
  10af74:	e1833002 	orr	r3, r3, r2
  10af78:	e1c930b2 	strh	r3, [r9, #2]
  10af7c:	e5d5200d 	ldrb	r2, [r5, #13]
  10af80:	e1a02402 	mov	r2, r2, lsl #8
  10af84:	e1c920b4 	strh	r2, [r9, #4]
  10af88:	e5d5300c 	ldrb	r3, [r5, #12]
  10af8c:	e1822003 	orr	r2, r2, r3
  10af90:	e1c920b4 	strh	r2, [r9, #4]
  10af94:	e5d5300f 	ldrb	r3, [r5, #15]
  10af98:	e1a03403 	mov	r3, r3, lsl #8
  10af9c:	e1c930b6 	strh	r3, [r9, #6]
  10afa0:	e5d5200e 	ldrb	r2, [r5, #14]
  10afa4:	e59fc484 	ldr	ip, [pc, #1156]	; 10b430 <prog+0xb3ec>
  10afa8:	e1833002 	orr	r3, r3, r2
  10afac:	e3110080 	tst	r1, #128	; 0x80
  10afb0:	e3a02000 	mov	r2, #0	; 0x0
  10afb4:	e1c930b6 	strh	r3, [r9, #6]
  10afb8:	e58c2080 	str	r2, [ip, #128]
  10afbc:	1a0000d9 	bne	10b328 <prog+0xb2e4>
  10afc0:	e3530080 	cmp	r3, #128	; 0x80
  10afc4:	958c3084 	strls	r3, [ip, #132]
  10afc8:	95950004 	ldrls	r0, [r5, #4]
  10afcc:	8a000024 	bhi	10b064 <prog+0xb020>
  10afd0:	e3100006 	tst	r0, #6	; 0x6
  10afd4:	0affff4d 	beq	10ad10 <vUSBCDCTask+0x274>
  10afd8:	e59f0450 	ldr	r0, [pc, #1104]	; 10b430 <prog+0xb3ec>
  10afdc:	e2802080 	add	r2, r0, #128	; 0x80
  10afe0:	e892000c 	ldmia	r2, {r2, r3}
  10afe4:	e1520003 	cmp	r2, r3
  10afe8:	3affff48 	bcc	10ad10 <vUSBCDCTask+0x274>
  10afec:	e5d93000 	ldrb	r3, [r9]
  10aff0:	e2032060 	and	r2, r3, #96	; 0x60
  10aff4:	e2033003 	and	r3, r3, #3	; 0x3
  10aff8:	e18331a2 	orr	r3, r3, r2, lsr #3
  10affc:	e3530005 	cmp	r3, #5	; 0x5
  10b000:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10b004:	ea000016 	b	10b064 <prog+0xb020>
  10b008:	0010b104 	andeqs	fp, r0, r4, lsl #2
  10b00c:	0010b0d8 	ldreqsb	fp, [r0], -r8
  10b010:	0010b064 	andeqs	fp, r0, r4, rrx
  10b014:	0010b064 	andeqs	fp, r0, r4, rrx
  10b018:	0010b064 	andeqs	fp, r0, r4, rrx
  10b01c:	0010b144 	andeqs	fp, r0, r4, asr #2
  10b020:	e59f23f0 	ldr	r2, [pc, #1008]	; 10b418 <prog+0xb3d4>
  10b024:	e5920000 	ldr	r0, [r2]
  10b028:	ebfff878 	bl	109210 <uxQueueMessagesWaiting>
  10b02c:	e3500000 	cmp	r0, #0	; 0x0
  10b030:	0a0000bf 	beq	10b334 <prog+0xb2f0>
  10b034:	e59d000c 	ldr	r0, [sp, #12]
  10b038:	e59d2008 	ldr	r2, [sp, #8]
  10b03c:	eaffff47 	b	10ad60 <vUSBCDCTask+0x2c4>
  10b040:	e1d920b2 	ldrh	r2, [r9, #2]
  10b044:	e1a03422 	mov	r3, r2, lsr #8
  10b048:	e3530002 	cmp	r3, #2	; 0x2
  10b04c:	e59f13e8 	ldr	r1, [pc, #1000]	; 10b43c <prog+0xb3f8>
  10b050:	0a0000cc 	beq	10b388 <prog+0xb344>
  10b054:	e3530003 	cmp	r3, #3	; 0x3
  10b058:	0a0000c1 	beq	10b364 <prog+0xb320>
  10b05c:	e3530001 	cmp	r3, #1	; 0x1
  10b060:	0a0000b9 	beq	10b34c <prog+0xb308>
  10b064:	ebfffe10 	bl	10a8ac <prvSendStall>
  10b068:	e59d5020 	ldr	r5, [sp, #32]
  10b06c:	e5953000 	ldr	r3, [r5]
  10b070:	e3130a01 	tst	r3, #4096	; 0x1000
  10b074:	0affff29 	beq	10ad20 <vUSBCDCTask+0x284>
  10b078:	e59f13a8 	ldr	r1, [pc, #936]	; 10b428 <prog+0xb3e4>
  10b07c:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10b080:	e3a02000 	mov	r2, #0	; 0x0
  10b084:	e3a0300f 	mov	r3, #15	; 0xf
  10b088:	e5c12000 	strb	r2, [r1]
  10b08c:	e5043fd7 	str	r3, [r4, #-4055]
  10b090:	e5042fd7 	str	r2, [r4, #-4055]
  10b094:	e59f2398 	ldr	r2, [pc, #920]	; 10b434 <prog+0xb3f0>
  10b098:	e28330f1 	add	r3, r3, #241	; 0xf1
  10b09c:	e3a05001 	mov	r5, #1	; 0x1
  10b0a0:	e5043ff7 	str	r3, [r4, #-4087]
  10b0a4:	e5825000 	str	r5, [r2]
  10b0a8:	ebfffd32 	bl	10a578 <vPortEnterCritical>
  10b0ac:	e5143fcf 	ldr	r3, [r4, #-4047]
  10b0b0:	e383304f 	orr	r3, r3, #79	; 0x4f
  10b0b4:	e3c33030 	bic	r3, r3, #48	; 0x30
  10b0b8:	e3833902 	orr	r3, r3, #32768	; 0x8000
  10b0bc:	e5043fcf 	str	r3, [r4, #-4047]
  10b0c0:	e5045fef 	str	r5, [r4, #-4079]
  10b0c4:	ebfffd36 	bl	10a5a4 <vPortExitCritical>
  10b0c8:	e59fc350 	ldr	ip, [pc, #848]	; 10b420 <prog+0xb3dc>
  10b0cc:	e3a03002 	mov	r3, #2	; 0x2
  10b0d0:	e58c3000 	str	r3, [ip]
  10b0d4:	eaffff11 	b	10ad20 <vUSBCDCTask+0x284>
  10b0d8:	e5d93001 	ldrb	r3, [r9, #1]
  10b0dc:	e3a0c000 	mov	ip, #0	; 0x0
  10b0e0:	e3530000 	cmp	r3, #0	; 0x0
  10b0e4:	e1cdc2b4 	strh	ip, [sp, #36]
  10b0e8:	1affffdd 	bne	10b064 <prog+0xb020>
  10b0ec:	e3a01002 	mov	r1, #2	; 0x2
  10b0f0:	e28d0024 	add	r0, sp, #36	; 0x24
  10b0f4:	e1a02001 	mov	r2, r1
  10b0f8:	ebfffe49 	bl	10aa24 <prvSendControlData>
  10b0fc:	e59d5020 	ldr	r5, [sp, #32]
  10b100:	eaffff03 	b	10ad14 <vUSBCDCTask+0x278>
  10b104:	e5d93001 	ldrb	r3, [r9, #1]
  10b108:	e3a01000 	mov	r1, #0	; 0x0
  10b10c:	e1cd12b4 	strh	r1, [sp, #36]
  10b110:	e3530009 	cmp	r3, #9	; 0x9
  10b114:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10b118:	eaffffd1 	b	10b064 <prog+0xb020>
  10b11c:	0010b244 	andeqs	fp, r0, r4, asr #4
  10b120:	0010b064 	andeqs	fp, r0, r4, rrx
  10b124:	0010b064 	andeqs	fp, r0, r4, rrx
  10b128:	0010b1f8 	ldreqsh	fp, [r0], -r8
  10b12c:	0010b064 	andeqs	fp, r0, r4, rrx
  10b130:	0010b204 	andeqs	fp, r0, r4, lsl #4
  10b134:	0010b040 	andeqs	fp, r0, r0, asr #32
  10b138:	0010b064 	andeqs	fp, r0, r4, rrx
  10b13c:	0010b228 	andeqs	fp, r0, r8, lsr #4
  10b140:	0010b1e0 	andeqs	fp, r0, r0, ror #3
  10b144:	e5d93001 	ldrb	r3, [r9, #1]
  10b148:	e3530022 	cmp	r3, #34	; 0x22
  10b14c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10b150:	eaffffc3 	b	10b064 <prog+0xb020>
  10b154:	0010b064 	andeqs	fp, r0, r4, rrx
  10b158:	0010b064 	andeqs	fp, r0, r4, rrx
  10b15c:	0010b064 	andeqs	fp, r0, r4, rrx
  10b160:	0010b064 	andeqs	fp, r0, r4, rrx
  10b164:	0010b064 	andeqs	fp, r0, r4, rrx
  10b168:	0010b064 	andeqs	fp, r0, r4, rrx
  10b16c:	0010b064 	andeqs	fp, r0, r4, rrx
  10b170:	0010b064 	andeqs	fp, r0, r4, rrx
  10b174:	0010b064 	andeqs	fp, r0, r4, rrx
  10b178:	0010b064 	andeqs	fp, r0, r4, rrx
  10b17c:	0010b064 	andeqs	fp, r0, r4, rrx
  10b180:	0010b064 	andeqs	fp, r0, r4, rrx
  10b184:	0010b064 	andeqs	fp, r0, r4, rrx
  10b188:	0010b064 	andeqs	fp, r0, r4, rrx
  10b18c:	0010b064 	andeqs	fp, r0, r4, rrx
  10b190:	0010b064 	andeqs	fp, r0, r4, rrx
  10b194:	0010b064 	andeqs	fp, r0, r4, rrx
  10b198:	0010b064 	andeqs	fp, r0, r4, rrx
  10b19c:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1a0:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1a4:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1a8:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1ac:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1b0:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1b4:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1b8:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1bc:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1c0:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1c4:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1c8:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1cc:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1d0:	0010b064 	andeqs	fp, r0, r4, rrx
  10b1d4:	0010b260 	andeqs	fp, r0, r0, ror #4
  10b1d8:	0010b27c 	andeqs	fp, r0, ip, ror r2
  10b1dc:	0010b298 	muleqs	r0, r8, r2
  10b1e0:	e1d930b2 	ldrh	r3, [r9, #2]
  10b1e4:	e59f2238 	ldr	r2, [pc, #568]	; 10b424 <prog+0xb3e0>
  10b1e8:	e5c23000 	strb	r3, [r2]
  10b1ec:	e59f3240 	ldr	r3, [pc, #576]	; 10b434 <prog+0xb3f0>
  10b1f0:	e3a02002 	mov	r2, #2	; 0x2
  10b1f4:	e5832000 	str	r2, [r3]
  10b1f8:	ebfffdb4 	bl	10a8d0 <prvSendZLP>
  10b1fc:	e59d5020 	ldr	r5, [sp, #32]
  10b200:	eafffec3 	b	10ad14 <vUSBCDCTask+0x278>
  10b204:	ebfffdb1 	bl	10a8d0 <prvSendZLP>
  10b208:	e1d920b2 	ldrh	r2, [r9, #2]
  10b20c:	e59f0220 	ldr	r0, [pc, #544]	; 10b434 <prog+0xb3f0>
  10b210:	e59f1228 	ldr	r1, [pc, #552]	; 10b440 <prog+0xb3fc>
  10b214:	e59d5020 	ldr	r5, [sp, #32]
  10b218:	e3a03003 	mov	r3, #3	; 0x3
  10b21c:	e5803000 	str	r3, [r0]
  10b220:	e5812000 	str	r2, [r1]
  10b224:	eafffeba 	b	10ad14 <vUSBCDCTask+0x278>
  10b228:	e3a01001 	mov	r1, #1	; 0x1
  10b22c:	e59f01f0 	ldr	r0, [pc, #496]	; 10b424 <prog+0xb3e0>
  10b230:	e1a02001 	mov	r2, r1
  10b234:	e3a03000 	mov	r3, #0	; 0x0
  10b238:	ebfffdf9 	bl	10aa24 <prvSendControlData>
  10b23c:	e59d5020 	ldr	r5, [sp, #32]
  10b240:	eafffeb3 	b	10ad14 <vUSBCDCTask+0x278>
  10b244:	e3a01002 	mov	r1, #2	; 0x2
  10b248:	e28d0024 	add	r0, sp, #36	; 0x24
  10b24c:	e1a02001 	mov	r2, r1
  10b250:	e3a03000 	mov	r3, #0	; 0x0
  10b254:	ebfffdf2 	bl	10aa24 <prvSendControlData>
  10b258:	e59d5020 	ldr	r5, [sp, #32]
  10b25c:	eafffeac 	b	10ad14 <vUSBCDCTask+0x278>
  10b260:	ebfffd9a 	bl	10a8d0 <prvSendZLP>
  10b264:	e59f01d8 	ldr	r0, [pc, #472]	; 10b444 <prog+0xb400>
  10b268:	e59f11c0 	ldr	r1, [pc, #448]	; 10b430 <prog+0xb3ec>
  10b26c:	e3a02007 	mov	r2, #7	; 0x7
  10b270:	ebffd5d2 	bl	1009c0 <memcpy>
  10b274:	e59d5020 	ldr	r5, [sp, #32]
  10b278:	eafffea5 	b	10ad14 <vUSBCDCTask+0x278>
  10b27c:	e59f01c0 	ldr	r0, [pc, #448]	; 10b444 <prog+0xb400>
  10b280:	e1d910b6 	ldrh	r1, [r9, #6]
  10b284:	e3a02007 	mov	r2, #7	; 0x7
  10b288:	e3a03000 	mov	r3, #0	; 0x0
  10b28c:	ebfffde4 	bl	10aa24 <prvSendControlData>
  10b290:	e59d5020 	ldr	r5, [sp, #32]
  10b294:	eafffe9e 	b	10ad14 <vUSBCDCTask+0x278>
  10b298:	ebfffd8c 	bl	10a8d0 <prvSendZLP>
  10b29c:	e1d930b2 	ldrh	r3, [r9, #2]
  10b2a0:	e59f0180 	ldr	r0, [pc, #384]	; 10b428 <prog+0xb3e4>
  10b2a4:	e59d5020 	ldr	r5, [sp, #32]
  10b2a8:	e5c03000 	strb	r3, [r0]
  10b2ac:	eafffe98 	b	10ad14 <vUSBCDCTask+0x278>
  10b2b0:	ebfffd9d 	bl	10a92c <prvSendNextSegment>
  10b2b4:	e5950004 	ldr	r0, [r5, #4]
  10b2b8:	eafffe85 	b	10acd4 <vUSBCDCTask+0x238>
  10b2bc:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10b2c0:	e5046ffb 	str	r6, [r4, #-4091]
  10b2c4:	ebfffcab 	bl	10a578 <vPortEnterCritical>
  10b2c8:	e5143fcb 	ldr	r3, [r4, #-4043]
  10b2cc:	e383304f 	orr	r3, r3, #79	; 0x4f
  10b2d0:	e3c33030 	bic	r3, r3, #48	; 0x30
  10b2d4:	e3833c82 	orr	r3, r3, #33280	; 0x8200
  10b2d8:	e5043fcb 	str	r3, [r4, #-4043]
  10b2dc:	e5046fef 	str	r6, [r4, #-4079]
  10b2e0:	e5143fc7 	ldr	r3, [r4, #-4039]
  10b2e4:	e383304f 	orr	r3, r3, #79	; 0x4f
  10b2e8:	e3c33030 	bic	r3, r3, #48	; 0x30
  10b2ec:	e3a02004 	mov	r2, #4	; 0x4
  10b2f0:	e3833c86 	orr	r3, r3, #34304	; 0x8600
  10b2f4:	e5043fc7 	str	r3, [r4, #-4039]
  10b2f8:	e5042fef 	str	r2, [r4, #-4079]
  10b2fc:	e5143fc3 	ldr	r3, [r4, #-4035]
  10b300:	e383304f 	orr	r3, r3, #79	; 0x4f
  10b304:	e3c33030 	bic	r3, r3, #48	; 0x30
  10b308:	e3833c87 	orr	r3, r3, #34560	; 0x8700
  10b30c:	e5043fc3 	str	r3, [r4, #-4035]
  10b310:	ebfffca3 	bl	10a5a4 <vPortExitCritical>
  10b314:	e59f3118 	ldr	r3, [pc, #280]	; 10b434 <prog+0xb3f0>
  10b318:	e5950004 	ldr	r0, [r5, #4]
  10b31c:	e3a02005 	mov	r2, #5	; 0x5
  10b320:	e5832000 	str	r2, [r3]
  10b324:	eafffe6a 	b	10acd4 <vUSBCDCTask+0x238>
  10b328:	e58c2084 	str	r2, [ip, #132]
  10b32c:	e5950004 	ldr	r0, [r5, #4]
  10b330:	eaffff26 	b	10afd0 <vUSBCDCTask+0x534>
  10b334:	e59f30e0 	ldr	r3, [pc, #224]	; 10b41c <prog+0xb3d8>
  10b338:	e5930000 	ldr	r0, [r3]
  10b33c:	ebfff7b3 	bl	109210 <uxQueueMessagesWaiting>
  10b340:	e3500000 	cmp	r0, #0	; 0x0
  10b344:	0afffec7 	beq	10ae68 <vUSBCDCTask+0x3cc>
  10b348:	eaffff39 	b	10b034 <prog+0xaff0>
  10b34c:	e1d110b6 	ldrh	r1, [r1, #6]
  10b350:	e59f00f0 	ldr	r0, [pc, #240]	; 10b448 <prog+0xb404>
  10b354:	e3a02012 	mov	r2, #18	; 0x12
  10b358:	ebfffdb1 	bl	10aa24 <prvSendControlData>
  10b35c:	e59d5020 	ldr	r5, [sp, #32]
  10b360:	eafffe6b 	b	10ad14 <vUSBCDCTask+0x278>
  10b364:	e20230ff 	and	r3, r2, #255	; 0xff
  10b368:	e3530004 	cmp	r3, #4	; 0x4
  10b36c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
  10b370:	eaffff3b 	b	10b064 <prog+0xb020>
  10b374:	0010b3b8 	ldreqh	fp, [r0], -r8
  10b378:	0010b3d4 	ldreqsb	fp, [r0], -r4
  10b37c:	0010b3f0 	ldreqsh	fp, [r0], -r0
  10b380:	0010b3f0 	ldreqsh	fp, [r0], -r0
  10b384:	0010b3f0 	ldreqsh	fp, [r0], -r0
  10b388:	e20230ff 	and	r3, r2, #255	; 0xff
  10b38c:	e59fc0b8 	ldr	ip, [pc, #184]	; 10b44c <prog+0xb408>
  10b390:	e3530002 	cmp	r3, #2	; 0x2
  10b394:	23a03002 	movcs	r3, #2	; 0x2
  10b398:	e79c2103 	ldr	r2, [ip, r3, lsl #2]
  10b39c:	e59fc0ac 	ldr	ip, [pc, #172]	; 10b450 <prog+0xb40c>
  10b3a0:	e1d110b6 	ldrh	r1, [r1, #6]
  10b3a4:	e79c0103 	ldr	r0, [ip, r3, lsl #2]
  10b3a8:	e3a03001 	mov	r3, #1	; 0x1
  10b3ac:	ebfffd9c 	bl	10aa24 <prvSendControlData>
  10b3b0:	e59d5020 	ldr	r5, [sp, #32]
  10b3b4:	eafffe56 	b	10ad14 <vUSBCDCTask+0x278>
  10b3b8:	e59f0094 	ldr	r0, [pc, #148]	; 10b454 <prog+0xb410>
  10b3bc:	e1d910b6 	ldrh	r1, [r9, #6]
  10b3c0:	e3a02004 	mov	r2, #4	; 0x4
  10b3c4:	e3a03001 	mov	r3, #1	; 0x1
  10b3c8:	ebfffd95 	bl	10aa24 <prvSendControlData>
  10b3cc:	e59d5020 	ldr	r5, [sp, #32]
  10b3d0:	eafffe4f 	b	10ad14 <vUSBCDCTask+0x278>
  10b3d4:	e59f007c 	ldr	r0, [pc, #124]	; 10b458 <prog+0xb414>
  10b3d8:	e1d910b6 	ldrh	r1, [r9, #6]
  10b3dc:	e3a0201c 	mov	r2, #28	; 0x1c
  10b3e0:	e3a03001 	mov	r3, #1	; 0x1
  10b3e4:	ebfffd8e 	bl	10aa24 <prvSendControlData>
  10b3e8:	e59d5020 	ldr	r5, [sp, #32]
  10b3ec:	eafffe48 	b	10ad14 <vUSBCDCTask+0x278>
  10b3f0:	e59f0064 	ldr	r0, [pc, #100]	; 10b45c <prog+0xb418>
  10b3f4:	e1d910b6 	ldrh	r1, [r9, #6]
  10b3f8:	e3a0202c 	mov	r2, #44	; 0x2c
  10b3fc:	e3a03001 	mov	r3, #1	; 0x1
  10b400:	ebfffd87 	bl	10aa24 <prvSendControlData>
  10b404:	e59d5020 	ldr	r5, [sp, #32]
  10b408:	eafffe41 	b	10ad14 <vUSBCDCTask+0x278>
  10b40c:	0010b960 	andeqs	fp, r0, r0, ror #18
  10b410:	002011ec 	eoreq	r1, r0, ip, ror #3
  10b414:	00200b38 	eoreq	r0, r0, r8, lsr fp
  10b418:	00200b3c 	eoreq	r0, r0, ip, lsr fp
  10b41c:	00200b40 	eoreq	r0, r0, r0, asr #22
  10b420:	00200b48 	eoreq	r0, r0, r8, asr #22
  10b424:	00200a14 	eoreq	r0, r0, r4, lsl sl
  10b428:	00200b44 	eoreq	r0, r0, r4, asr #22
  10b42c:	00200a28 	eoreq	r0, r0, r8, lsr #20
  10b430:	00200ab0 	streqh	r0, [r0], -r0
  10b434:	00200a18 	eoreq	r0, r0, r8, lsl sl
  10b438:	0010b604 	andeqs	fp, r0, r4, lsl #12
  10b43c:	00200a20 	eoreq	r0, r0, r0, lsr #20
  10b440:	00200a1c 	eoreq	r0, r0, ip, lsl sl
  10b444:	0010b974 	andeqs	fp, r0, r4, ror r9
  10b448:	0010b94c 	andeqs	fp, r0, ip, asr #18
  10b44c:	0010b944 	andeqs	fp, r0, r4, asr #18
  10b450:	00200828 	eoreq	r0, r0, r8, lsr #16
  10b454:	0010b871 	andeqs	fp, r0, r1, ror r8
  10b458:	0010b875 	andeqs	fp, r0, r5, ror r8
  10b45c:	0010b891 	muleqs	r0, r1, r8

0010b460 <vUSB_ISR_Handler>:
  10b460:	e59f2190 	ldr	r2, [pc, #400]	; 10b5f8 <prog+0xb5b4>
  10b464:	e5921000 	ldr	r1, [r2]
  10b468:	e5923000 	ldr	r3, [r2]
  10b46c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
  10b470:	e2833001 	add	r3, r3, #1	; 0x1
  10b474:	e5823000 	str	r3, [r2]
  10b478:	e3e04a4f 	mvn	r4, #323584	; 0x4f000
  10b47c:	e514cfe3 	ldr	ip, [r4, #-4067]
  10b480:	e59f0174 	ldr	r0, [pc, #372]	; 10b5fc <prog+0xb5b8>
  10b484:	e514efcf 	ldr	lr, [r4, #-4047]
  10b488:	e2011003 	and	r1, r1, #3	; 0x3
  10b48c:	e5143fe7 	ldr	r3, [r4, #-4071]
  10b490:	e1a01201 	mov	r1, r1, lsl #4
  10b494:	e24dd008 	sub	sp, sp, #8	; 0x8
  10b498:	e0812000 	add	r2, r1, r0
  10b49c:	e3833a01 	orr	r3, r3, #4096	; 0x1000
  10b4a0:	e3a05000 	mov	r5, #0	; 0x0
  10b4a4:	e31e0006 	tst	lr, #6	; 0x6
  10b4a8:	e781c000 	str	ip, [r1, r0]
  10b4ac:	e582e004 	str	lr, [r2, #4]
  10b4b0:	e5043fdf 	str	r3, [r4, #-4063]
  10b4b4:	e88d0024 	stmia	sp, {r2, r5}
  10b4b8:	0a000019 	beq	10b524 <vUSB_ISR_Handler+0xc4>
  10b4bc:	e1a0382e 	mov	r3, lr, lsr #16
  10b4c0:	e1a0ca83 	mov	ip, r3, lsl #21
  10b4c4:	e1a0caac 	mov	ip, ip, lsr #21
  10b4c8:	e15c0005 	cmp	ip, r5
  10b4cc:	0a000009 	beq	10b4f8 <vUSB_ISR_Handler+0x98>
  10b4d0:	e1a00005 	mov	r0, r5
  10b4d4:	e1a0e004 	mov	lr, r4
  10b4d8:	e59d2000 	ldr	r2, [sp]
  10b4dc:	e2803001 	add	r3, r0, #1	; 0x1
  10b4e0:	e0802002 	add	r2, r0, r2
  10b4e4:	e51e1faf 	ldr	r1, [lr, #-4015]
  10b4e8:	e20300ff 	and	r0, r3, #255	; 0xff
  10b4ec:	e15c0000 	cmp	ip, r0
  10b4f0:	e5c21008 	strb	r1, [r2, #8]
  10b4f4:	8afffff7 	bhi	10b4d8 <vUSB_ISR_Handler+0x78>
  10b4f8:	e3e01a4f 	mvn	r1, #323584	; 0x4f000
  10b4fc:	e5113fcf 	ldr	r3, [r1, #-4047]
  10b500:	e3130004 	tst	r3, #4	; 0x4
  10b504:	1a000025 	bne	10b5a0 <vUSB_ISR_Handler+0x140>
  10b508:	e5113fcf 	ldr	r3, [r1, #-4047]
  10b50c:	e3c33002 	bic	r3, r3, #2	; 0x2
  10b510:	e5013fcf 	str	r3, [r1, #-4047]
  10b514:	e1a02001 	mov	r2, r1
  10b518:	e5123fcf 	ldr	r3, [r2, #-4047]
  10b51c:	e3130002 	tst	r3, #2	; 0x2
  10b520:	1afffffc 	bne	10b518 <vUSB_ISR_Handler+0xb8>
  10b524:	e3e0ea4f 	mvn	lr, #323584	; 0x4f000
  10b528:	e51e3fcb 	ldr	r3, [lr, #-4043]
  10b52c:	e3130042 	tst	r3, #66	; 0x42
  10b530:	13a03002 	movne	r3, #2	; 0x2
  10b534:	150e3feb 	strne	r3, [lr, #-4075]
  10b538:	e51e3fcf 	ldr	r3, [lr, #-4047]
  10b53c:	e3c33009 	bic	r3, r3, #9	; 0x9
  10b540:	e50e3fcf 	str	r3, [lr, #-4047]
  10b544:	e51e2fcb 	ldr	r2, [lr, #-4043]
  10b548:	e3c2200d 	bic	r2, r2, #13	; 0xd
  10b54c:	e50e2fcb 	str	r2, [lr, #-4043]
  10b550:	e51e3fc7 	ldr	r3, [lr, #-4039]
  10b554:	e3c3304f 	bic	r3, r3, #79	; 0x4f
  10b558:	e50e3fc7 	str	r3, [lr, #-4039]
  10b55c:	e51ecfc3 	ldr	ip, [lr, #-4035]
  10b560:	e59f3098 	ldr	r3, [pc, #152]	; 10b600 <prog+0xb5bc>
  10b564:	e3ccc04f 	bic	ip, ip, #79	; 0x4f
  10b568:	e5930000 	ldr	r0, [r3]
  10b56c:	e28d2004 	add	r2, sp, #4	; 0x4
  10b570:	e3a03000 	mov	r3, #0	; 0x0
  10b574:	e1a0100d 	mov	r1, sp
  10b578:	e50ecfc3 	str	ip, [lr, #-4035]
  10b57c:	ebfff763 	bl	109310 <xQueueGenericSendFromISR>
  10b580:	e59d3004 	ldr	r3, [sp, #4]
  10b584:	e3a02000 	mov	r2, #0	; 0x0
  10b588:	e3530000 	cmp	r3, #0	; 0x0
  10b58c:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  10b590:	e5832031 	str	r2, [r3, #49]
  10b594:	1bfff8a4 	blne	10982c <vTaskSwitchContext>
  10b598:	e28dd008 	add	sp, sp, #8	; 0x8
  10b59c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
  10b5a0:	e35c0000 	cmp	ip, #0	; 0x0
  10b5a4:	1a000007 	bne	10b5c8 <vUSB_ISR_Handler+0x168>
  10b5a8:	e3e02a4f 	mvn	r2, #323584	; 0x4f000
  10b5ac:	e5123fcf 	ldr	r3, [r2, #-4047]
  10b5b0:	e3c33004 	bic	r3, r3, #4	; 0x4
  10b5b4:	e5023fcf 	str	r3, [r2, #-4047]
  10b5b8:	e5123fcf 	ldr	r3, [r2, #-4047]
  10b5bc:	e3130004 	tst	r3, #4	; 0x4
  10b5c0:	1afffffc 	bne	10b5b8 <vUSB_ISR_Handler+0x158>
  10b5c4:	eaffffd6 	b	10b524 <vUSB_ISR_Handler+0xc4>
  10b5c8:	e59d3000 	ldr	r3, [sp]
  10b5cc:	e1d320d8 	ldrsb	r2, [r3, #8]
  10b5d0:	e3520000 	cmp	r2, #0	; 0x0
  10b5d4:	aafffff3 	bge	10b5a8 <vUSB_ISR_Handler+0x148>
  10b5d8:	e5113fcf 	ldr	r3, [r1, #-4047]
  10b5dc:	e3833080 	orr	r3, r3, #128	; 0x80
  10b5e0:	e5013fcf 	str	r3, [r1, #-4047]
  10b5e4:	e1a02001 	mov	r2, r1
  10b5e8:	e5123fcf 	ldr	r3, [r2, #-4047]
  10b5ec:	e3130080 	tst	r3, #128	; 0x80
  10b5f0:	0afffffc 	beq	10b5e8 <vUSB_ISR_Handler+0x188>
  10b5f4:	eaffffeb 	b	10b5a8 <vUSB_ISR_Handler+0x148>
  10b5f8:	00200b4c 	eoreq	r0, r0, ip, asr #22
  10b5fc:	00200b50 	eoreq	r0, r0, r0, asr fp
  10b600:	002011ec 	eoreq	r1, r0, ip, ror #3

0010b604 <vUSB_ISR_Wrapper>:
  10b604:	e92d0001 	stmdb	sp!, {r0}
  10b608:	e94d2000 	stmdb	sp, {sp}^
  10b60c:	e1a00000 	nop			(mov r0,r0)
  10b610:	e24dd004 	sub	sp, sp, #4	; 0x4
  10b614:	e8bd0001 	ldmia	sp!, {r0}
  10b618:	e9204000 	stmdb	r0!, {lr}
  10b61c:	e1a0e000 	mov	lr, r0
  10b620:	e8bd0001 	ldmia	sp!, {r0}
  10b624:	e94e7fff 	stmdb	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10b628:	e1a00000 	nop			(mov r0,r0)
  10b62c:	e24ee03c 	sub	lr, lr, #60	; 0x3c
  10b630:	e14f0000 	mrs	r0, SPSR
  10b634:	e92e0001 	stmdb	lr!, {r0}
  10b638:	e59f0064 	ldr	r0, [pc, #100]	; 10b6a4 <prog+0xb660>
  10b63c:	e5900000 	ldr	r0, [r0]
  10b640:	e92e0001 	stmdb	lr!, {r0}
  10b644:	e59f005c 	ldr	r0, [pc, #92]	; 10b6a8 <prog+0xb664>
  10b648:	e5900000 	ldr	r0, [r0]
  10b64c:	e580e000 	str	lr, [r0]
  10b650:	e59f4044 	ldr	r4, [pc, #68]	; 10b69c <prog+0xb658>
  10b654:	e59f5044 	ldr	r5, [pc, #68]	; 10b6a0 <prog+0xb65c>
  10b658:	e5943000 	ldr	r3, [r4]
  10b65c:	e5952000 	ldr	r2, [r5]
  10b660:	ebffff7e 	bl	10b460 <vUSB_ISR_Handler>
  10b664:	e59f003c 	ldr	r0, [pc, #60]	; 10b6a8 <prog+0xb664>
  10b668:	e5900000 	ldr	r0, [r0]
  10b66c:	e590e000 	ldr	lr, [r0]
  10b670:	e59f002c 	ldr	r0, [pc, #44]	; 10b6a4 <prog+0xb660>
  10b674:	e8be0002 	ldmia	lr!, {r1}
  10b678:	e5801000 	str	r1, [r0]
  10b67c:	e8be0001 	ldmia	lr!, {r0}
  10b680:	e169f000 	msr	SPSR_fc, r0
  10b684:	e8de7fff 	ldmia	lr, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
  10b688:	e1a00000 	nop			(mov r0,r0)
  10b68c:	e59ee03c 	ldr	lr, [lr, #60]
  10b690:	e25ef004 	subs	pc, lr, #4	; 0x4
  10b694:	e5943000 	ldr	r3, [r4]
  10b698:	e5952000 	ldr	r2, [r5]
  10b69c:	00200824 	eoreq	r0, r0, r4, lsr #16
  10b6a0:	00200918 	eoreq	r0, r0, r8, lsl r9
  10b6a4:	00200824 	eoreq	r0, r0, r4, lsr #16
  10b6a8:	00200918 	eoreq	r0, r0, r8, lsl r9

0010b6ac <zeroes.3055>:
  10b6ac:	30303030 30303030 30303030 30303030     0000000000000000

0010b6bc <blanks.3054>:
  10b6bc:	20202020 20202020 20202020 20202020                     

0010b6cc <_global_impure_ptr>:
  10b6cc:	00200414                                .. .

0010b6d0 <lconv>:
  10b6d0:	0010b9d4 0010b870 0010b870 0010b870     ....p...p...p...
  10b6e0:	0010b870 0010b870 0010b870 0010b870     p...p...p...p...
  10b6f0:	0010b870 0010b870 ffffffff ffffffff     p...p...........

0010b700 <charset>:
  10b700:	0010ba14                                ....

0010b704 <__mprec_tens>:
  10b704:	3ff00000 00000000 40240000 00000000     ...?......$@....
  10b714:	40590000 00000000 408f4000 00000000     ..Y@.....@.@....
  10b724:	40c38800 00000000 40f86a00 00000000     ...@.....j.@....
  10b734:	412e8480 00000000 416312d0 00000000     ...A......cA....
  10b744:	4197d784 00000000 41cdcd65 00000000     ...A....e..A....
  10b754:	4202a05f 20000000 42374876 e8000000     _..B... vH7B....
  10b764:	426d1a94 a2000000 42a2309c e5400000     ..mB.....0.B..@.
  10b774:	42d6bcc4 1e900000 430c6bf5 26340000     ...B.....k.C..4&
  10b784:	4341c379 37e08000 43763457 85d8a000     y.AC...7W4vC....
  10b794:	43abc16d 674ec800 43e158e4 60913d00     m..C..Ng.X.C.=.`
  10b7a4:	4415af1d 78b58c40 444b1ae4 d6e2ef50     ...D@..x..KDP...
  10b7b4:	4480f0cf 064dd592 44b52d02 c7e14af6     ...D..M..-.D.J..
  10b7c4:	44ea7843 79d99db4                       Cx.D...y

0010b7cc <__mprec_bigtens>:
  10b7cc:	4341c379 37e08000 4693b8b5 b5056e17     y.AC...7...F.n..
  10b7dc:	4d384f03 e93ff9f5 5a827748 f9301d32     .O8M..?.Hw.Z2.0.
  10b7ec:	75154fdd 7f73bf3c                       .O.u<.s.

0010b7f4 <__mprec_tinytens>:
  10b7f4:	3c9cd2b2 97d889bc 3949f623 d5a8a733     ...<....#.I93...
  10b804:	32a50ffd 44f4a73d 255bba08 cf8c979d     ...2=..D..[%....
  10b814:	0ac80628 64ac6f43                       (...Co.d

0010b81c <p05.2298>:
  10b81c:	00000005 00000019 0000007d              ........}...

0010b828 <__thenan_df>:
	...
  10b83c:	00425355 53425355 4c4c4548 00000000     USB.USBSHELL....
  10b84c:	6c6c6148 57202c6f 646c726f 202c2121     Hallo, World!!, 
  10b85c:	206c614d 206e6965 74736554 00000021     Mal ein Test!...
  10b86c:	454c4449 09030400                                IDLE.

0010b871 <pxLanguageStringDescriptor>:
  10b871:	04090304                                ....

0010b875 <pxManufacturerStringDescriptor>:
  10b875:	0062031c 00740069 0061006d 0075006e     ..b.i.t.m.a.n.u.
  10b885:	00610066 0074006b 00720075              f.a.k.t.u.r.

0010b891 <pxProductStringDescriptor>:
  10b891:	004f0328 00650070 0042006e 00610065     (.O.p.e.n.B.e.a.
  10b8a1:	006f0063 0020006e 006c0042 006e0069     c.o.n. .B.l.i.n.
  10b8b1:	0065006b 006c006e 00000067              k.e.n.l.g...

0010b8bd <pxConfigDescriptor1>:
  10b8bd:	00430209 80030102 000409fa 02020100     ..C.............
  10b8cd:	24050401 04011000 05000224 01000624     ...$....$...$...
  10b8dd:	00012405 83050701 ff000803 00010409     .$..............
  10b8ed:	00000a02 01050700 00004002 02820507     .........@......
  10b8fd:	09000040                                         @..

0010b900 <pxConfigDescriptor2>:
  10b900:	00430209 80030202 00040932 02020100     ..C.....2.......
  10b910:	24050401 04011000 05000224 01000624     ...$....$...$...
  10b920:	00012405 83050701 ff000803 00010409     .$..............
  10b930:	00000a02 01050700 00004002 02820507     .........@......
  10b940:	00000040                                @...

0010b944 <pxConfigDescriptorSizes>:
  10b944:	00000043 00000043                       C...C...

0010b94c <pxDeviceDescriptor>:
  10b94c:	01100112 08000002 08af16c0 02010110     ................
  10b95c:	00000200                                ....

0010b960 <C.25.4299>:
	...

0010b974 <pxLineCoding>:
  10b974:	0001c200 00080000 33323130 37363534     ........01234567
  10b984:	62613938 66656463 00000000 00464e49     89abcdef....INF.
  10b994:	004e414e 006e616e 33323130 37363534     NAN.nan.01234567
  10b9a4:	42413938 46454443 00000000 20677562     89ABCDEF....bug 
  10b9b4:	76206e69 69727066 3a66746e 64616220     in vfprintf: bad
  10b9c4:	73616220 00000065 00666e69 00000030      base...inf.0...
  10b9d4:	0000002e 6c756e28 0000296c 54552d43     ....(null)..C-UT
  10b9e4:	00382d46 4a532d43 00005349 55452d43     F-8.C-SJIS..C-EU
  10b9f4:	00504a43 494a2d43 00000053 69666e49     CJP.C-JIS...Infi
  10ba04:	7974696e 00000000 004e614e 00000043     nity....NaN.C...
  10ba14:	2d4f5349 39353838 0000312d 0074743a     ISO-8859-1..:tt.
