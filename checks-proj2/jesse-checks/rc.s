	
/*
 * Jesse Qin's CSE131 Compiler Generated Mon Nov 16 03:08:46 PST 2015
 */

	
	.section	".rodata"
	.align  	4
.$$.intFmt:
	.asciz  	"%d"
.$$.strFmt:
	.asciz  	"%s"
.$$.strTF:
	.asciz  	"false\0\0\0true"
.$$.strEndl:
	.asciz  	"\n"
.$$.strArrBound:
	.asciz  	"Index value of %d is outside legal range [0,%d).\n"
.$$.strNullPtr:
	.asciz  	"Attempt to dereference NULL pointer.\n"
	
	.section	".text"
	.align  	4
.$$.printBool:
	save    	%sp, -96, %sp
	set     	.$$.strTF, %o0
	cmp     	%g0, %i0
	be      	.$$.printBool2
	nop     
	add     	%o0, 8, %o0
.$$.printBool2:
	call    	printf
	nop     
	ret     
	restore 
	
.$$.arrCheck:
	save    	%sp, -96, %sp
	cmp     	%i0, %g0
	bl      	.$$.arrCheck2
	nop     
	cmp     	%i0, %i1
	bge     	.$$.arrCheck2
	nop     
	ret     
	restore 
.$$.arrCheck2:
	set     	.$$.strArrBound, %o0
	mov     	%i0, %o1
	call    	printf
	mov     	%i1, %o2
	call    	exit
	mov     	1, %o0
	ret     
	restore 
	
.$$.ptrCheck:
	save    	%sp, -96, %sp
	cmp     	%i0, %g0
	bne     	.$$.ptrCheck2
	nop     
	set     	.$$.strNullPtr, %o0
	call    	printf
	nop     
	call    	exit
	mov     	1, %o0
.$$.ptrCheck2:
	ret     
	restore 
	
	
	.section	".data"
	.align  	4
	.global 	var1
var1:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	var2
var2:
	.word   	0
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	var3
var3:
	.word   	1
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	var4
var4:
	.single 	0r459.25
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	aVar1
aVar1:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.aVar1:
	set     	SAVE..$.init.aVar1, %g1
	save    	%sp, %g1, %sp
		
		! aVar1 = var2
		set     	aVar1, %o1
		add     	%g0, %o1, %o1
		set     	var2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.aVar1
	call    	.$.init.aVar1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.aVar1 = -(92 + 0) & -8
	
.$.init.aVar1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.aVar1
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	aVar2
aVar2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.aVar2:
	set     	SAVE..$.init.aVar2, %g1
	save    	%sp, %g1, %sp
		
		! aVar2 = var4
		set     	aVar2, %o1
		add     	%g0, %o1, %o1
		set     	var4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.aVar2
	call    	.$.init.aVar2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.aVar2 = -(92 + 0) & -8
	
.$.init.aVar2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.aVar2
	nop     
	
	.section	".text"
	.align  	4
	
	! (var1)+(5)
	set     	var1, %l7
	add     	%g0, %l7, %l7
	ld      	[%l7], %o0
	set     	5, %o1
	add     	%o0, %o1, %o0
	set     	null, %o1
	add     	null, %o1, %o1
	st      	%o0, [%o1]
	
	! ((var1)+(5))+(5)
	set     	5, %o1
	add     	%o0, %o1, %o0
	set     	null, %o1
	add     	null, %o1, %o1
	st      	%o0, [%o1]
	
	.section	".bss"
	.align  	4
	.global 	arith1
arith1:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith1:
	set     	SAVE..$.init.arith1, %g1
	save    	%sp, %g1, %sp
		
		! arith1 = ((var1)+(5))+(5)
		set     	arith1, %o1
		add     	%g0, %o1, %o1
		set     	null, %l7
		add     	null, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith1
	call    	.$.init.arith1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith1 = -(92 + 0) & -8
	
.$.init.arith1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith1
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	cgInt
cgInt:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	cgFloat
cgFloat:
	.single 	0r5.5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	cgBool
cgBool:
	.word   	0
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	cgInt2
cgInt2:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	aVar3
aVar3:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	aVar4
aVar4:
	.single 	0r5.5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	temporary
temporary:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	temporary2
temporary2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.temporary2:
	set     	SAVE..$.init.temporary2, %g1
	save    	%sp, %g1, %sp
		
		! temporary2 = temporary
		set     	temporary2, %o1
		add     	%g0, %o1, %o1
		set     	temporary, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.temporary2
	call    	.$.init.temporary2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.temporary2 = -(92 + 0) & -8
	
.$.init.temporary2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.temporary2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	temporary3
temporary3:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.temporary3:
	set     	SAVE..$.init.temporary3, %g1
	save    	%sp, %g1, %sp
		
		! temporary3 = temporary2
		set     	temporary3, %o1
		add     	%g0, %o1, %o1
		set     	temporary2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.temporary3
	call    	.$.init.temporary3.fini
	nop     
	ret     
	restore 
	SAVE..$.init.temporary3 = -(92 + 0) & -8
	
.$.init.temporary3.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.temporary3
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	temporary4
temporary4:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.temporary4:
	set     	SAVE..$.init.temporary4, %g1
	save    	%sp, %g1, %sp
		
		! temporary4 = temporary3
		set     	temporary4, %o1
		add     	%g0, %o1, %o1
		set     	temporary3, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.temporary4
	call    	.$.init.temporary4.fini
	nop     
	ret     
	restore 
	SAVE..$.init.temporary4 = -(92 + 0) & -8
	
.$.init.temporary4.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.temporary4
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	gInt
gInt:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	gFloat
gFloat:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	gBool
gBool:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	var5
var5:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	var6
var6:
	.single 	0r5.0
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
st1:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
st2:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
st3:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
st4:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
st5:
	.word   	6
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
st6:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.st6:
	set     	SAVE..$.init.st6, %g1
	save    	%sp, %g1, %sp
		
		! st6 = st4
		set     	st6, %o1
		add     	%g0, %o1, %o1
		set     	st4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.st6
	call    	.$.init.st6.fini
	nop     
	ret     
	restore 
	SAVE..$.init.st6 = -(92 + 0) & -8
	
.$.init.st6.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.st6
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
st7:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
st8:
	.word   	6
	
	.section	".text"
	.align  	4
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! local2 = 6.6
		set     	-12, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.1:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.1, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! local2_2 = 6.6
		set     	-16, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.2:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.2, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! local3 = local2
		set     	-24, %o1
		add     	%fp, %o1, %o1
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! local4 = local1
		set     	-28, %o1
		add     	%fp, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! local5 = local11
		set     	-32, %o1
		add     	%fp, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! local6 = cgInt
		set     	-36, %o1
		add     	%fp, %o1, %o1
		set     	cgInt, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! local7 = 5
		set     	-40, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! clocal = 5
		set     	-44, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! clocal2 = 5
		set     	-48, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! clocal3 = 4.4
		set     	-52, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.3:
		.single 	0r4.4
		
		.section	".text"
		.align  	4
		set     	.$$.float.3, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! clocal4 = clocal3
		set     	-56, %o1
		add     	%fp, %o1, %o1
		set     	-52, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! c1 = 210
		set     	-60, %o1
		add     	%fp, %o1, %o1
		set     	210, %o0
		st      	%o0, [%o1]
		
		! c2 = (sizeof(int))+(c1)
		set     	-64, %o1
		add     	%fp, %o1, %o1
		set     	214, %o0
		st      	%o0, [%o1]
		
		! (local7)+(local7)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)+(local7))+(5)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-72, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith2 = ((local7)+(local7))+(5)
		set     	-76, %o1
		add     	%fp, %o1, %o1
		set     	-72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (local7)-(local7)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-80, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)-(local7))-(5)
		set     	-80, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		sub     	%o0, %o1, %o0
		set     	-84, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith3 = ((local7)-(local7))-(5)
		set     	-88, %o1
		add     	%fp, %o1, %o1
		set     	-84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! cout << (c1)+(210)
		set     	420, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << c2
		set     	-64, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! r1 = 420.25
		set     	-92, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.4:
		.single 	0r420.25
		
		.section	".text"
		.align  	4
		set     	.$$.float.4, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! cout << (r1)+(662.50)
		
		.section	".rodata"
		.align  	4
	.$$.float.5:
		.single 	0r1082.75
		
		.section	".text"
		.align  	4
		set     	.$$.float.5, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.1:
		.asciz  	"\n"
		
		.section	".text"
		.align  	4
		! cout << "\n"
		set     	.$$.strFmt, %o0
		set     	.$$.str.1, %o1
		call    	printf
		nop     
		
		! cout << sizeof(float)
		set     	4, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << ((sizeof(float))+(7.8))+(clocal3)
		
		.section	".rodata"
		.align  	4
	.$$.float.6:
		.single 	0r16.2
		
		.section	".text"
		.align  	4
		set     	.$$.float.6, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << local7
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << local7
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << 3
		set     	3, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << 1
		set     	1, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << 2
		set     	2, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << 3
		set     	3, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << 4
		set     	4, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << 5
		set     	5, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << 6.6
		
		.section	".rodata"
		.align  	4
	.$$.float.7:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.7, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << 6.6666
		
		.section	".rodata"
		.align  	4
	.$$.float.8:
		.single 	0r6.6666
		
		.section	".text"
		.align  	4
		set     	.$$.float.8, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << local2
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << true
		set     	1, %o0
		call    	.$$.printBool
		nop     
		
		! cout << cgBool
		set     	cgBool, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.printBool
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << 5
		set     	5, %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << 6.6
		
		.section	".rodata"
		.align  	4
	.$$.float.9:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.9, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << true
		set     	1, %o0
		call    	.$$.printBool
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.2:
		.asciz  	"string"
		
		.section	".text"
		.align  	4
		! cout << "string"
		set     	.$$.strFmt, %o0
		set     	.$$.str.2, %o1
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << cgInt
		set     	cgInt, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << cgFloat
		set     	cgFloat, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << cgBool
		set     	cgBool, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.printBool
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.3:
		.asciz  	"poop"
		
		.section	".text"
		.align  	4
		! cout << "poop"
		set     	.$$.strFmt, %o0
		set     	.$$.str.3, %o1
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 92) & -8
	
main.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	pain
pain:
pain.void:
	set     	SAVE.pain.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! pocal2 = 6.6
		set     	-12, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.10:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.10, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! pocal3 = pocal2
		set     	-20, %o1
		add     	%fp, %o1, %o1
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! pocal4 = pocal1
		set     	-24, %o1
		add     	%fp, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! pocal5 = pocal11
		set     	-28, %o1
		add     	%fp, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! var1 = var1
		set     	-32, %o1
		add     	%fp, %o1, %o1
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! var2 = pocal2
		set     	-36, %o1
		add     	%fp, %o1, %o1
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! var3 = cgFloat
		set     	-40, %o1
		add     	%fp, %o1, %o1
		set     	cgFloat, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function pain.void
	call    	pain.void.fini
	nop     
	ret     
	restore 
	SAVE.pain.void = -(92 + 40) & -8
	
pain.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	zain
zain:
zain.void:
	set     	SAVE.zain.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! var1 = 6
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	6, %o0
		st      	%o0, [%o1]
		
		! var2 = var1
		set     	-8, %o1
		add     	%fp, %o1, %o1
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function zain.void
	call    	zain.void.fini
	nop     
	ret     
	restore 
	SAVE.zain.void = -(92 + 8) & -8
	
zain.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
