	
/*
 * Jesse Qin's CSE131 Compiler Generated Sat Nov 28 04:02:17 PST 2015
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
	
	.section	".bss"
	.align  	4
	.global 	garith1
garith1:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.garith1:
	set     	SAVE..$.init.garith1, %g1
	save    	%sp, %g1, %sp
		
		! (var1)+(5)
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((var1)+(5))+(5)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! garith1 = ((var1)+(5))+(5)
		set     	garith1, %o1
		add     	%g0, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.garith1
	call    	.$.init.garith1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.garith1 = -(92 + 8) & -8
	
.$.init.garith1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.garith1
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	garith2
garith2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.garith2:
	set     	SAVE..$.init.garith2, %g1
	save    	%sp, %g1, %sp
		
		! (var1)+(5)
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((var1)+(5))+(5)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! garith2 = ((var1)+(5))+(5)
		set     	garith2, %o1
		add     	%g0, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.garith2
	call    	.$.init.garith2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.garith2 = -(92 + 8) & -8
	
.$.init.garith2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.garith2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	test500
test500:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.test500:
	set     	SAVE..$.init.test500, %g1
	save    	%sp, %g1, %sp
		
		! (var1)+(var4)
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	-8, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	var4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! test500 = (var1)+(var4)
		set     	test500, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.test500
	call    	.$.init.test500.fini
	nop     
	ret     
	restore 
	SAVE..$.init.test500 = -(92 + 8) & -8
	
.$.init.test500.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.test500
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
	
	.section	".bss"
	.align  	4
	.global 	intArr1
intArr1:
	.skip   	16
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	floatArr1
floatArr1:
	.skip   	20
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	boolArr1
boolArr1:
	.skip   	24
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
intArr2:
	.skip   	20
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
floatArr2:
	.skip   	24
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
boolArr2:
	.skip   	28
	
	.section	".text"
	.align  	4
MYS1.MYS1.void:
	set     	SAVE.MYS1.MYS1.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! this.i
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.i = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! this.f
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	4, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.f = 5
		set     	-8, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		set     	-12, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
	
	! End of function MYS1.MYS1.void
	call    	MYS1.MYS1.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.MYS1.void = -(92 + 12) & -8
	
MYS1.MYS1.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.$MYS1.void:
	set     	SAVE.MYS1.$MYS1.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function MYS1.$MYS1.void
	call    	MYS1.$MYS1.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.$MYS1.void = -(92 + 0) & -8
	
MYS1.$MYS1.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.fun1.void:
	set     	SAVE.MYS1.fun1.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function MYS1.fun1.void
	call    	MYS1.fun1.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.fun1.void = -(92 + 0) & -8
	
MYS1.fun1.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.fun1.int:
	set     	SAVE.MYS1.fun1.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
	
	! End of function MYS1.fun1.int
	call    	MYS1.fun1.int.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.fun1.int = -(92 + 0) & -8
	
MYS1.fun1.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1_2.MYS1_2.void:
	set     	SAVE.MYS1_2.MYS1_2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! this.i
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.i = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! this.f
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	4, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.f = 5
		set     	-8, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		set     	-12, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! this.b
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	8, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.1
		nop     
		
		! Short Circuit RHS
		set     	cgBool, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.1
		nop     
		ba      	.$$.andorEnd.1
		mov     	1, %g0
	.$$.andorSkip.1:
		mov     	0, %g0
	.$$.andorEnd.1:
		
		! this.b = (true)&&(cgBool)
		set     	-16, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	0, %o0
		st      	%o0, [%o1]
	
	! End of function MYS1_2.MYS1_2.void
	call    	MYS1_2.MYS1_2.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1_2.MYS1_2.void = -(92 + 16) & -8
	
MYS1_2.MYS1_2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1_2.$MYS1_2.void:
	set     	SAVE.MYS1_2.$MYS1_2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function MYS1_2.$MYS1_2.void
	call    	MYS1_2.$MYS1_2.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1_2.$MYS1_2.void = -(92 + 0) & -8
	
MYS1_2.$MYS1_2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1_2.fun1.void:
	set     	SAVE.MYS1_2.fun1.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function MYS1_2.fun1.void
	call    	MYS1_2.fun1.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1_2.fun1.void = -(92 + 0) & -8
	
MYS1_2.fun1.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1_2.fun1.int:
	set     	SAVE.MYS1_2.fun1.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
	
	! End of function MYS1_2.fun1.int
	call    	MYS1_2.fun1.int.fini
	nop     
	ret     
	restore 
	SAVE.MYS1_2.fun1.int = -(92 + 0) & -8
	
MYS1_2.fun1.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS2.MYS2.void:
	set     	SAVE.MYS2.MYS2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function MYS2.MYS2.void
	call    	MYS2.MYS2.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS2.MYS2.void = -(92 + 0) & -8
	
MYS2.MYS2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS2.$MYS2.void:
	set     	SAVE.MYS2.$MYS2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function MYS2.$MYS2.void
	call    	MYS2.$MYS2.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS2.$MYS2.void = -(92 + 0) & -8
	
MYS2.$MYS2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".bss"
	.align  	4
	.global 	stru1
stru1:
	.skip   	12
	
	.section	".text"
	.align  	4
.$.init.stru1:
	set     	SAVE..$.init.stru1, %g1
	save    	%sp, %g1, %sp
		
		! stru1.MYS1(...)
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
	
	! End of function .$.init.stru1
	call    	.$.init.stru1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.stru1 = -(92 + 0) & -8
	
.$.init.stru1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.stru1
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
stru2:
	.skip   	12
	
	.section	".text"
	.align  	4
.$.init.stru2:
	set     	SAVE..$.init.stru2, %g1
	save    	%sp, %g1, %sp
		
		! stru2.MYS1(...)
		set     	stru2, %o0
		add     	%g0, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
	
	! End of function .$.init.stru2
	call    	.$.init.stru2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.stru2 = -(92 + 0) & -8
	
.$.init.stru2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.stru2
	nop     
	
	.section	".text"
	.align  	4
	.global 	structs
structs:
structs.void:
	set     	SAVE.structs.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! intVar = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! floatVar = 5.5
		set     	-8, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.1:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.1, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! boolVar = true
		set     	-12, %o1
		add     	%fp, %o1, %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! stru1.MYS1(...)
		set     	-24, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		! stru1_2.MYS1_2(...)
		set     	-36, %o0
		add     	%fp, %o0, %o0
		call    	MYS1_2.MYS1_2.void
		nop     
		
		! stru2.MYS2(...)
		set     	-48, %o0
		add     	%fp, %o0, %o0
		call    	MYS2.MYS2.void
		nop     
		
		! stru1.i
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-52, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stru1.i = 5
		set     	-52, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! stru1.i
		set     	-24, %o0
		add     	%fp, %o0, %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-56, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stru1.i = 10
		set     	-56, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	10, %o0
		st      	%o0, [%o1]
		
		! stru2.f
		set     	-48, %o0
		add     	%fp, %o0, %o0
		set     	4, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-60, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stru2.f = 5
		set     	-60, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		set     	-64, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! stru1.f
		set     	-24, %o0
		add     	%fp, %o0, %o0
		set     	4, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stru2.f
		set     	-48, %o0
		add     	%fp, %o0, %o0
		set     	4, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-72, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stru1.f = stru2.f
		set     	-68, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! stru1.fun1(...)
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		call    	MYS1.fun1.void
		nop     
		
		! stru1.fun1(...)
		set     	-24, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.fun1.void
		nop     
		
		! stru1.fun1(...)
		set     	-24, %o0
		add     	%fp, %o0, %o0
		! i <- intVar
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		call    	MYS1.fun1.int
		nop     
	
	! End of function structs.void
	call    	structs.void.fini
	nop     
	ret     
	restore 
	SAVE.structs.void = -(92 + 72) & -8
	
structs.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	arrays
arrays:
arrays.void:
	set     	SAVE.arrays.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! index = 3
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	3, %o0
		st      	%o0, [%o1]
		
		! intArr1[0]
		set     	0, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-24, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intArr1[0] = 99
		set     	-28, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	99, %o0
		st      	%o0, [%o1]
		
		! intArr1[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-24, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intArr1[1] = 5
		set     	-32, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! intArr1[index]
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-24, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-36, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intArr1[index] = 69
		set     	-36, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	69, %o0
		st      	%o0, [%o1]
		
		! intArr1[0]
		set     	0, %o0
		set     	4, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	intArr1, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-40, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intArr1[0] = 0
		set     	-40, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! intArr2[0]
		set     	0, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	intArr2, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-44, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intArr2[0] = 0
		set     	-44, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! (index)+(1)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		add     	%o0, %o1, %o0
		set     	-48, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! floatArr2[(index)+(1)]
		set     	-48, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	6, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	floatArr2, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-52, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intArr1[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-24, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-56, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! floatArr2[(index)+(1)] = intArr1[1]
		set     	-52, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-56, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		set     	-60, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! foreach ( ... )
		! traversal ptr = --array
		set     	-24, %o0
		add     	%fp, %o0, %o0
		set     	4, %o1
		sub     	%o0, %o1, %o0
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
	.$$.loopCheck.1:
			! ++traversal ptr
			set     	-68, %o1
			add     	%fp, %o1, %o1
			ld      	[%o1], %o0
			set     	4, %o2
			add     	%o0, %o2, %o0
			st      	%o0, [%o1]
			! traversal ptr < array end addr?
			set     	-24, %o0
			add     	%fp, %o0, %o0
			set     	20, %o1
			add     	%o0, %o1, %o1
			set     	-68, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			cmp     	%o0, %o1
			bge     	.$$.loopEnd.1
			nop     
			! iterVar = currentElem
			set     	-64, %o1
			add     	%fp, %o1, %o1
			ld      	[%o0], %o0
			st      	%o0, [%o1]
			
			! Start of loop body
				
				! foreach ( ... )
				! traversal ptr = --array
				set     	intArr2, %o0
				add     	%g0, %o0, %o0
				set     	4, %o1
				sub     	%o0, %o1, %o0
				set     	-76, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
			.$$.loopCheck.2:
					! ++traversal ptr
					set     	-76, %o1
					add     	%fp, %o1, %o1
					ld      	[%o1], %o0
					set     	4, %o2
					add     	%o0, %o2, %o0
					st      	%o0, [%o1]
					! traversal ptr < array end addr?
					set     	intArr2, %o0
					add     	%g0, %o0, %o0
					set     	20, %o1
					add     	%o0, %o1, %o1
					set     	-76, %o0
					add     	%fp, %o0, %o0
					ld      	[%o0], %o0
					cmp     	%o0, %o1
					bge     	.$$.loopEnd.2
					nop     
					! iterVar = currentElem
					set     	-72, %o1
					add     	%fp, %o1, %o1
					ld      	[%o0], %f0
					fitos   	%f0, %f0
					st      	%f0, [%o1]
					
					! Start of loop body
						
						! cout << val1
						set     	-64, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %o1
						set     	.$$.intFmt, %o0
						call    	printf
						nop     
						
						.section	".rodata"
						.align  	4
					.$$.str.1:
						.asciz  	" "
						
						.section	".text"
						.align  	4
						! cout << " "
						set     	.$$.strFmt, %o0
						set     	.$$.str.1, %o1
						call    	printf
						nop     
						
						! cout << val2
						set     	-72, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %f0
						call    	printFloat
						nop     
						
						! cout << endl
						set     	.$$.strEndl, %o0
						call    	printf
						nop     
						
						! continue
						ba      	.$$.loopCheck.2
						nop     
						
						! break
						ba      	.$$.loopEnd.2
						nop     
					
					! End of loop body
					ba      	.$$.loopCheck.2
					nop     
				.$$.loopEnd.2:
				
				! continue
				ba      	.$$.loopCheck.1
				nop     
				
				! break
				ba      	.$$.loopEnd.1
				nop     
			
			! End of loop body
			ba      	.$$.loopCheck.1
			nop     
		.$$.loopEnd.1:
	
	! End of function arrays.void
	call    	arrays.void.fini
	nop     
	ret     
	restore 
	SAVE.arrays.void = -(92 + 76) & -8
	
arrays.void.fini:
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
	.$$.float.2:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.2, %l7
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
		
		! if ( (5)>(10) )
		set     	0, %o0
		cmp     	%o0, %g0
		be      	.$$.else.1
		nop     
			
			! (var1)>(5)
			set     	-32, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			set     	5, %o1
			cmp     	%o0, %o1
			ble     	.$$.cmp.1
			mov     	%g0, %o0
			inc     	%o0
		.$$.cmp.1:
			set     	-44, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! if ( (var1)>(5) )
			set     	-44, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			be      	.$$.else.2
			nop     
				
				! if ( false )
				set     	0, %o0
				cmp     	%o0, %g0
				be      	.$$.else.3
				nop     
					
					ba      	.$$.endif.3
					nop     
				
				! else
			.$$.else.3:
				
				! endif
			.$$.endif.3:
				
				ba      	.$$.endif.2
				nop     
			
			! else
		.$$.else.2:
			
			! endif
		.$$.endif.2:
			
			ba      	.$$.endif.1
			nop     
		
		! else
	.$$.else.1:
			
			! if ( (99)>(cgInt) )
			set     	1, %o0
			cmp     	%o0, %g0
			be      	.$$.else.4
			nop     
				
				! (var1)>(11)
				set     	-32, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				set     	11, %o1
				cmp     	%o0, %o1
				ble     	.$$.cmp.2
				mov     	%g0, %o0
				inc     	%o0
			.$$.cmp.2:
				set     	-48, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! if ( (var1)>(11) )
				set     	-48, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				cmp     	%o0, %g0
				be      	.$$.else.5
				nop     
					
					ba      	.$$.endif.5
					nop     
				
				! else
			.$$.else.5:
				
				! endif
			.$$.endif.5:
				
				ba      	.$$.endif.4
				nop     
			
			! else
		.$$.else.4:
			
			! endif
		.$$.endif.4:
		
		! endif
	.$$.endif.1:
		
		! sometester = 5
		set     	-52, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! (sometester)>(10)
		set     	-52, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	10, %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.3
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.3:
		set     	-56, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest = (sometester)>(10)
		set     	-60, %o1
		add     	%fp, %o1, %o1
		set     	-56, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function pain.void
	call    	pain.void.fini
	nop     
	ret     
	restore 
	SAVE.pain.void = -(92 + 60) & -8
	
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
	.global 	func1
func1:
func1.void:
	set     	SAVE.func1.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return 5;
		set     	5, %i0
		call    	func1.void.fini
		nop     
		ret     
		restore 
	
	! End of function func1.void
	call    	func1.void.fini
	nop     
	ret     
	restore 
	SAVE.func1.void = -(92 + 0) & -8
	
func1.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func1_2
func1_2:
func1_2.void:
	set     	SAVE.func1_2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! func1(...)
		call    	func1.void
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func1_2(...)
		call    	func1_2.void
		nop     
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (var1)+(5)
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return (var1)+(5);
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	func1_2.void.fini
		nop     
		ret     
		restore 
	
	! End of function func1_2.void
	call    	func1_2.void.fini
	nop     
	ret     
	restore 
	SAVE.func1_2.void = -(92 + 12) & -8
	
func1_2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func1_3
func1_3:
func1_3.void:
	set     	SAVE.func1_3.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! func1(...)
		call    	func1.void
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (func1(...))+(var1)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! z = (func1(...))+(var1)
		set     	-12, %o1
		add     	%fp, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! exit(z)
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	exit
		nop     
		
		! func1(...)
		call    	func1.void
		nop     
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (func1(...))+(var1)
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	var1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! exit((func1(...))+(var1))
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	exit
		nop     
		
		! exit(5)
		set     	5, %o0
		call    	exit
		nop     
		
		! func1(...)
		call    	func1.void
		nop     
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return func1(...);
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	func1_3.void.fini
		nop     
		ret     
		restore 
	
	! End of function func1_3.void
	call    	func1_3.void.fini
	nop     
	ret     
	restore 
	SAVE.func1_3.void = -(92 + 24) & -8
	
func1_3.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func2
func2:
func2.void:
	set     	SAVE.func2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return 5.5;
		
		.section	".rodata"
		.align  	4
	.$$.float.3:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.3, %l7
		ld      	[%l7], %f0
		call    	func2.void.fini
		nop     
		ret     
		restore 
	
	! End of function func2.void
	call    	func2.void.fini
	nop     
	ret     
	restore 
	SAVE.func2.void = -(92 + 0) & -8
	
func2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func2_2
func2_2:
func2_2.void:
	set     	SAVE.func2_2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return (5.5)+(cgFloat);
		
		.section	".rodata"
		.align  	4
	.$$.float.4:
		.single 	0r11.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.4, %l7
		ld      	[%l7], %f0
		call    	func2_2.void.fini
		nop     
		ret     
		restore 
	
	! End of function func2_2.void
	call    	func2_2.void.fini
	nop     
	ret     
	restore 
	SAVE.func2_2.void = -(92 + 0) & -8
	
func2_2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func3
func3:
func3.void:
	set     	SAVE.func3.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return true;
		set     	1, %i0
		call    	func3.void.fini
		nop     
		ret     
		restore 
	
	! End of function func3.void
	call    	func3.void.fini
	nop     
	ret     
	restore 
	SAVE.func3.void = -(92 + 0) & -8
	
func3.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func3_2
func3_2:
func3_2.void:
	set     	SAVE.func3_2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! foo = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! bar = 6
		set     	-8, %o1
		add     	%fp, %o1, %o1
		set     	6, %o0
		st      	%o0, [%o1]
		
		! (foo)>(bar)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.4
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.4:
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return (foo)>(bar);
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	func3_2.void.fini
		nop     
		ret     
		restore 
	
	! End of function func3_2.void
	call    	func3_2.void.fini
	nop     
	ret     
	restore 
	SAVE.func3_2.void = -(92 + 12) & -8
	
func3_2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func4
func4:
func4.void:
	set     	SAVE.func4.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return;
		call    	func4.void.fini
		nop     
		ret     
		restore 
	
	! End of function func4.void
	call    	func4.void.fini
	nop     
	ret     
	restore 
	SAVE.func4.void = -(92 + 0) & -8
	
func4.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	fun1
fun1:
fun1.int:
	set     	SAVE.fun1.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function fun1.int
	call    	fun1.int.fini
	nop     
	ret     
	restore 
	SAVE.fun1.int = -(92 + 0) & -8
	
fun1.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
fun1.float.int:
	set     	SAVE.fun1.float.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%f0, [%fp+68]
		st      	%i1, [%fp+72]
	
	! End of function fun1.float.int
	call    	fun1.float.int.fini
	nop     
	ret     
	restore 
	SAVE.fun1.float.int = -(92 + 0) & -8
	
fun1.float.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
fun1.float.int.bool:
	set     	SAVE.fun1.float.int.bool, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		st      	%i2, [%fp+76]
	
	! End of function fun1.float.int.bool
	call    	fun1.float.int.bool.fini
	nop     
	ret     
	restore 
	SAVE.fun1.float.int.bool = -(92 + 0) & -8
	
fun1.float.int.bool.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
fun1.float.int.bool.int.int.int:
	set     	SAVE.fun1.float.int.bool.int.int.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		st      	%i2, [%fp+76]
		st      	%i3, [%fp+80]
		st      	%i4, [%fp+84]
		st      	%i5, [%fp+88]
	
	! End of function fun1.float.int.bool.int.int.int
	call    	fun1.float.int.bool.int.int.int.fini
	nop     
	ret     
	restore 
	SAVE.fun1.float.int.bool.int.int.int = -(92 + 0) & -8
	
fun1.float.int.bool.int.int.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
fun1.bool:
	set     	SAVE.fun1.bool, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function fun1.bool
	call    	fun1.bool.fini
	nop     
	ret     
	restore 
	SAVE.fun1.bool = -(92 + 0) & -8
	
fun1.bool.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
fun1.float:
	set     	SAVE.fun1.float, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
	
	! End of function fun1.float
	call    	fun1.float.fini
	nop     
	ret     
	restore 
	SAVE.fun1.float = -(92 + 0) & -8
	
fun1.float.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	fun2
fun2:
fun2.int.float.bool:
	set     	SAVE.fun2.int.float.bool, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%f1, [%fp+72]
		st      	%i2, [%fp+76]
	
	! End of function fun2.int.float.bool
	call    	fun2.int.float.bool.fini
	nop     
	ret     
	restore 
	SAVE.fun2.int.float.bool = -(92 + 0) & -8
	
fun2.int.float.bool.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	fun3
fun3:
fun3.float:
	set     	SAVE.fun3.float, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%f0, [%fp+68]
	
	! End of function fun3.float
	call    	fun3.float.fini
	nop     
	ret     
	restore 
	SAVE.fun3.float = -(92 + 0) & -8
	
fun3.float.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	fun4
fun4:
fun4.int:
	set     	SAVE.fun4.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! fun4(...)
		! i <- 5
		set     	5, %o0
		call    	fun4.int
		nop     
	
	! End of function fun4.int
	call    	fun4.int.fini
	nop     
	ret     
	restore 
	SAVE.fun4.int = -(92 + 0) & -8
	
fun4.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	fun5
fun5:
fun5.int:
	set     	SAVE.fun5.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! i = 10
		set     	68, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	10, %o0
		st      	%o0, [%o1]
		
		! (i)+(5)
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return (i)+(5);
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	fun5.int.fini
		nop     
		ret     
		restore 
	
	! End of function fun5.int
	call    	fun5.int.fini
	nop     
	ret     
	restore 
	SAVE.fun5.int = -(92 + 4) & -8
	
fun5.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! structs(...)
		call    	structs.void
		nop     
		
		! arrays(...)
		call    	arrays.void
		nop     
		
		! localInt = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! localFloat = 5.5
		set     	-8, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.5:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.5, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! localBool = true
		set     	-12, %o1
		add     	%fp, %o1, %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! fun1(...)
		! i <- localInt
		set     	-4, %o0
		add     	%fp, %o0, %o0
		call    	fun1.int
		nop     
		
		! fun1(...)
		! f <- localFloat
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		! i <- localInt
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		call    	fun1.float.int
		nop     
		
		! fun1(...)
		! f <- localFloat
		set     	-8, %o0
		add     	%fp, %o0, %o0
		! i <- localInt
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		! b <- localBool
		set     	-12, %o2
		add     	%fp, %o2, %o2
		call    	fun1.float.int.bool
		nop     
		
		! fun1(...)
		! a <- localFloat
		set     	-8, %o0
		add     	%fp, %o0, %o0
		! b <- localInt
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		! c <- localBool
		set     	-12, %o2
		add     	%fp, %o2, %o2
		! d <- localInt
		set     	-4, %o3
		add     	%fp, %o3, %o3
		! f <- localInt
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o4
		! z <- localInt
		set     	-4, %o5
		add     	%fp, %o5, %o5
		call    	fun1.float.int.bool.int.int.int
		nop     
		
		! fun1(...)
		! f <- localFloat
		set     	-8, %o0
		add     	%fp, %o0, %o0
		call    	fun1.float
		nop     
		
		! fun3(...)
		! f <- localInt
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-16, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		call    	fun3.float
		nop     
		
		! fun2(...)
		! i <- localInt
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		! f <- localFloat
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		! b <- localBool
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o2
		call    	fun2.int.float.bool
		nop     
		
		! fun5(...)
		! i <- localInt
		set     	-4, %o0
		add     	%fp, %o0, %o0
		call    	fun5.int
		nop     
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (fun5(...))+(10)
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	10, %o1
		add     	%o0, %o1, %o0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! funcall1 = (fun5(...))+(10)
		set     	-28, %o1
		add     	%fp, %o1, %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! local2 = 6.6
		set     	-40, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.6:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.6, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! local2_2 = 6.6
		set     	-44, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.7:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! local3 = local2
		set     	-52, %o1
		add     	%fp, %o1, %o1
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! local4 = local1
		set     	-56, %o1
		add     	%fp, %o1, %o1
		set     	-32, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! local5 = local11
		set     	-60, %o1
		add     	%fp, %o1, %o1
		set     	-36, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! local6 = cgInt
		set     	-64, %o1
		add     	%fp, %o1, %o1
		set     	cgInt, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! local7 = 5
		set     	-68, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! clocal = 5
		set     	-72, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! clocal2 = 5
		set     	-76, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! clocal3 = 4.4
		set     	-80, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.8:
		.single 	0r4.4
		
		.section	".text"
		.align  	4
		set     	.$$.float.8, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! clocal4 = clocal3
		set     	-84, %o1
		add     	%fp, %o1, %o1
		set     	-80, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! c1 = 210
		set     	-88, %o1
		add     	%fp, %o1, %o1
		set     	210, %o0
		st      	%o0, [%o1]
		
		! c2 = (sizeof(int))+(c1)
		set     	-92, %o1
		add     	%fp, %o1, %o1
		set     	214, %o0
		st      	%o0, [%o1]
		
		! -(local7)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		neg     	%o0, %o0
		set     	-96, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((5)+(10))-(-(local7))
		set     	15, %o0
		set     	-96, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-100, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((5)+(10))-(-(local7)))+(-(clocal2))
		set     	-100, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-5, %o1
		add     	%o0, %o1, %o0
		set     	-104, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! +(local7)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		mov     	%o0, %o0
		set     	-108, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((5)+(10))-(-(local7)))+(-(clocal2)))+(+(local7))
		set     	-104, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-108, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-112, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((((5)+(10))-(-(local7)))+(-(clocal2)))+(+(local7)))+(+(clocal2))
		set     	-112, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith1 = (((((5)+(10))-(-(local7)))+(-(clocal2)))+(+(local7)))+(+(clocal2))
		set     	-120, %o1
		add     	%fp, %o1, %o1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (local7)+(local7)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-124, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)+(local7))+(5)
		set     	-124, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-128, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith2 = ((local7)+(local7))+(5)
		set     	-132, %o1
		add     	%fp, %o1, %o1
		set     	-128, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (local7)-(local7)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-136, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)-(local7))-(5)
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		sub     	%o0, %o1, %o0
		set     	-140, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith3 = ((local7)-(local7))-(5)
		set     	-144, %o1
		add     	%fp, %o1, %o1
		set     	-140, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! +(local7)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		mov     	%o0, %o0
		set     	-148, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith4 = +(local7)
		set     	-152, %o1
		add     	%fp, %o1, %o1
		set     	-148, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (local7)/(clocal2)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-76, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		call    	.div
		nop     
		mov     	%o0, %o0
		set     	-156, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)/(clocal2))*(local7)
		set     	-156, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		call    	.mul
		nop     
		mov     	%o0, %o0
		set     	-160, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((local7)/(clocal2))*(local7))%(clocal)
		set     	-160, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		call    	.rem
		nop     
		mov     	%o0, %o0
		set     	-164, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((local7)/(clocal2))*(local7))%(clocal))/(5)
		set     	-164, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		call    	.div
		nop     
		mov     	%o0, %o0
		set     	-168, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((((local7)/(clocal2))*(local7))%(clocal))/(5))*(10)
		set     	-168, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	10, %o1
		call    	.mul
		nop     
		mov     	%o0, %o0
		set     	-172, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((((local7)/(clocal2))*(local7))%(clocal))/(5))*(10))%(5)
		set     	-172, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		call    	.rem
		nop     
		mov     	%o0, %o0
		set     	-176, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith5 = ((((((local7)/(clocal2))*(local7))%(clocal))/(5))*(10))%(5)
		set     	-180, %o1
		add     	%fp, %o1, %o1
		set     	-176, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (local7)&(5)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		and     	%o0, %o1, %o0
		set     	-184, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (local6)&(5)
		set     	-64, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		and     	%o0, %o1, %o0
		set     	-188, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (clocal2)^((local6)&(5))
		set     	-76, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-188, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		xor     	%o0, %o1, %o0
		set     	-192, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)&(5))|((clocal2)^((local6)&(5)))
		set     	-184, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-192, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		or      	%o0, %o1, %o0
		set     	-196, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((local7)&(5))|((clocal2)^((local6)&(5))))|((10)^(3))
		set     	-196, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	9, %o1
		or      	%o0, %o1, %o0
		set     	-200, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (local7)&(local6)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-64, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		and     	%o0, %o1, %o0
		set     	-204, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (local7)^((local7)&(local6))
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-204, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		xor     	%o0, %o1, %o0
		set     	-208, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((local7)&(5))|((clocal2)^((local6)&(5))))|((10)^(3)))|((local7)^((local7)&(local6)))
		set     	-200, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-208, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		or      	%o0, %o1, %o0
		set     	-212, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith6 = ((((local7)&(5))|((clocal2)^((local6)&(5))))|((10)^(3)))|((local7)^((local7)&(local6)))
		set     	-216, %o1
		add     	%fp, %o1, %o1
		set     	-212, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! --(local7)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		sub     	%o0, %o1, %o2
		set     	-220, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! ((5)+(10))-(--(local7))
		set     	15, %o0
		set     	-220, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-224, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ++(local7)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		add     	%o0, %o1, %o2
		set     	-228, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! (((5)+(10))-(--(local7)))+(++(local7))
		set     	-224, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-228, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-232, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2))
		set     	-232, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-5, %o1
		add     	%o0, %o1, %o0
		set     	-236, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (arith6)++
		set     	-216, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		add     	%o0, %o1, %o2
		set     	-240, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-216, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! (((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2)))+((arith6)++)
		set     	-236, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-240, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-244, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (arith5)--
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		sub     	%o0, %o1, %o2
		set     	-248, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-180, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! ((((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2)))+((arith6)++))-((arith5)--)
		set     	-244, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-248, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-252, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith7 = ((((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2)))+((arith6)++))-((arith5)--)
		set     	-256, %o1
		add     	%fp, %o1, %o1
		set     	-252, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! ((5.5)+(10.10))-(local2)
		
		.section	".rodata"
		.align  	4
	.$$.float.9:
		.single 	0r15.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.9, %l7
		ld      	[%l7], %f0
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-260, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (((5.5)+(10.10))-(local2))+(local2_2)
		set     	-260, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-44, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-264, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! +(local2)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		fmovs   	%f0, %f0
		set     	-268, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((((5.5)+(10.10))-(local2))+(local2_2))-(+(local2))
		set     	-264, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-268, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-272, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! -(local2_2)
		set     	-44, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		fnegs   	%f0, %f0
		set     	-276, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (((((5.5)+(10.10))-(local2))+(local2_2))-(+(local2)))+(-(local2_2))
		set     	-272, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-276, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-280, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arith8 = (((((5.5)+(10.10))-(local2))+(local2_2))-(+(local2)))+(-(local2_2))
		set     	-284, %o1
		add     	%fp, %o1, %o1
		set     	-280, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (local2)/(local2_2)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-44, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fdivs   	%f0, %f1, %f0
		set     	-288, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((local2)/(local2_2))*(local2)
		set     	-288, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fmuls   	%f0, %f1, %f0
		set     	-292, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (((local2)/(local2_2))*(local2))/(5.5)
		set     	-292, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.10:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.10, %l7
		ld      	[%l7], %f1
		fdivs   	%f0, %f1, %f0
		set     	-296, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((((local2)/(local2_2))*(local2))/(5.5))*(10.5)
		set     	-296, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.11:
		.single 	0r10.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.11, %l7
		ld      	[%l7], %f1
		fmuls   	%f0, %f1, %f0
		set     	-300, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arith9 = ((((local2)/(local2_2))*(local2))/(5.5))*(10.5)
		set     	-304, %o1
		add     	%fp, %o1, %o1
		set     	-300, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! --(local2)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.12:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.12, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f2
		set     	-308, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		set     	-40, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		
		! arithtest1 = --(local2)
		set     	-312, %o1
		add     	%fp, %o1, %o1
		set     	-308, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (local2)-(1.0)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.13:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.13, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-316, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arithtest2 = (local2)-(1.0)
		set     	-320, %o1
		add     	%fp, %o1, %o1
		set     	-316, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! --(local2)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.14:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.14, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f2
		set     	-324, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		set     	-40, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		
		! ((5.5)+(10.10))-(--(local2))
		
		.section	".rodata"
		.align  	4
	.$$.float.15:
		.single 	0r15.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.15, %l7
		ld      	[%l7], %f0
		set     	-324, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-328, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ++(local2_2)
		set     	-44, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.16:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.16, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f2
		set     	-332, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		set     	-44, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		
		! (((5.5)+(10.10))-(--(local2)))+(++(local2_2))
		set     	-328, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-332, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-336, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! -(local2)
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		fnegs   	%f0, %f0
		set     	-340, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2))
		set     	-336, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-340, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-344, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (arith8)++
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.17:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.17, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f2
		set     	-348, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		set     	-284, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		
		! (((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2)))+((arith8)++)
		set     	-344, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-348, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-352, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (arith9)--
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.18:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.18, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f2
		set     	-356, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		set     	-304, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		
		! ((((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2)))+((arith8)++))-((arith9)--)
		set     	-352, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-356, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-360, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arith10 = ((((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2)))+((arith8)++))-((arith9)--)
		set     	-364, %o1
		add     	%fp, %o1, %o1
		set     	-360, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! sometester = 5
		set     	-368, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! (sometester)>(10)
		set     	-368, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	10, %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.5
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.5:
		set     	-372, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest = (sometester)>(10)
		set     	-376, %o1
		add     	%fp, %o1, %o1
		set     	-372, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (sometester)>(sometester)
		set     	-368, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-368, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.6
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.6:
		set     	-380, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest2 = (sometester)>(sometester)
		set     	-384, %o1
		add     	%fp, %o1, %o1
		set     	-380, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! bFalse = false
		set     	-388, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! bTrue = true
		set     	-392, %o1
		add     	%fp, %o1, %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! (arith8)>(9.5)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.19:
		.single 	0r9.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.19, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.7
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.7:
		set     	-396, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest3 = (arith8)>(9.5)
		set     	-400, %o1
		add     	%fp, %o1, %o1
		set     	-396, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)>(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.8
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.8:
		set     	-404, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest4 = (arith8)>(arith9)
		set     	-408, %o1
		add     	%fp, %o1, %o1
		set     	-404, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith4)>=(arith5)
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bl      	.$$.cmp.9
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.9:
		set     	-412, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest5 = (arith4)>=(arith5)
		set     	-416, %o1
		add     	%fp, %o1, %o1
		set     	-412, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)>=(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbl     	.$$.cmp.10
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.10:
		set     	-420, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest6 = (arith8)>=(arith9)
		set     	-424, %o1
		add     	%fp, %o1, %o1
		set     	-420, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith4)<(arith5)
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bge     	.$$.cmp.11
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.11:
		set     	-428, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest7 = (arith4)<(arith5)
		set     	-432, %o1
		add     	%fp, %o1, %o1
		set     	-428, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)<(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbge    	.$$.cmp.12
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.12:
		set     	-436, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest8 = (arith8)<(arith9)
		set     	-440, %o1
		add     	%fp, %o1, %o1
		set     	-436, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith4)<=(arith5)
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bg      	.$$.cmp.13
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.13:
		set     	-444, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest9 = (arith4)<=(arith5)
		set     	-448, %o1
		add     	%fp, %o1, %o1
		set     	-444, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)<=(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbg     	.$$.cmp.14
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.14:
		set     	-452, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest10 = (arith8)<=(arith9)
		set     	-456, %o1
		add     	%fp, %o1, %o1
		set     	-452, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith4)==(arith5)
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.15
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.15:
		set     	-460, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest11 = (arith4)==(arith5)
		set     	-464, %o1
		add     	%fp, %o1, %o1
		set     	-460, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)==(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbne    	.$$.cmp.16
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.16:
		set     	-468, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest12 = (arith8)==(arith9)
		set     	-472, %o1
		add     	%fp, %o1, %o1
		set     	-468, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith4)!=(arith5)
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.17
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.17:
		set     	-476, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest13 = (arith4)!=(arith5)
		set     	-480, %o1
		add     	%fp, %o1, %o1
		set     	-476, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)!=(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.18
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.18:
		set     	-484, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest14 = (arith8)!=(arith9)
		set     	-488, %o1
		add     	%fp, %o1, %o1
		set     	-484, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)!=(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.19
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.19:
		set     	-492, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! !((arith8)!=(arith9))
		set     	-492, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		xor     	%o0, 1, %o0
		set     	-496, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest15 = !((arith8)!=(arith9))
		set     	-500, %o1
		add     	%fp, %o1, %o1
		set     	-496, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! !(sometest14)
		set     	-488, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		xor     	%o0, 1, %o0
		set     	-504, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest16 = !(sometest14)
		set     	-508, %o1
		add     	%fp, %o1, %o1
		set     	-504, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.2
		nop     
		
		! Short Circuit RHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.2
		nop     
		ba      	.$$.andorEnd.2
		mov     	1, %g0
	.$$.andorSkip.2:
		mov     	0, %g0
	.$$.andorEnd.2:
		
		! sometest17 = (true)&&(true)
		set     	-512, %o1
		add     	%fp, %o1, %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	0, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.3
		nop     
		
		! Short Circuit RHS
		set     	0, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.3
		nop     
		ba      	.$$.andorEnd.3
		mov     	1, %g0
	.$$.andorSkip.3:
		mov     	0, %g0
	.$$.andorEnd.3:
		
		! sometest18 = (false)&&(false)
		set     	-516, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.4
		nop     
		
		! (bFalse)&&(bTrue)
		
		! Short Circuit RHS
		set     	-392, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.4
		nop     
		ba      	.$$.andorEnd.4
		mov     	1, %o0
	.$$.andorSkip.4:
		mov     	0, %o0
	.$$.andorEnd.4:
		set     	-520, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest19 = (bFalse)&&(bTrue)
		set     	-524, %o1
		add     	%fp, %o1, %o1
		set     	-520, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-392, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.5
		nop     
		
		! (bTrue)&&(bFalse)
		
		! Short Circuit RHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.5
		nop     
		ba      	.$$.andorEnd.5
		mov     	1, %o0
	.$$.andorSkip.5:
		mov     	0, %o0
	.$$.andorEnd.5:
		set     	-528, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest20 = (bTrue)&&(bFalse)
		set     	-532, %o1
		add     	%fp, %o1, %o1
		set     	-528, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.6
		nop     
		
		! (bFalse)&&(bFalse)
		
		! Short Circuit RHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.6
		nop     
		ba      	.$$.andorEnd.6
		mov     	1, %o0
	.$$.andorSkip.6:
		mov     	0, %o0
	.$$.andorEnd.6:
		set     	-536, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest21 = (bFalse)&&(bFalse)
		set     	-540, %o1
		add     	%fp, %o1, %o1
		set     	-536, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)>(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.20
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.20:
		set     	-544, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-544, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.7
		nop     
		
		! (arith8)!=(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.21
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.21:
		set     	-548, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! !((arith8)!=(arith9))
		set     	-548, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		xor     	%o0, 1, %o0
		set     	-552, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((arith8)>(arith9))&&(!((arith8)!=(arith9)))
		
		! Short Circuit RHS
		set     	-552, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.7
		nop     
		ba      	.$$.andorEnd.7
		mov     	1, %o0
	.$$.andorSkip.7:
		mov     	0, %o0
	.$$.andorEnd.7:
		set     	-556, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest22 = ((arith8)>(arith9))&&(!((arith8)!=(arith9)))
		set     	-560, %o1
		add     	%fp, %o1, %o1
		set     	-556, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	1, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.8
		nop     
		
		! Short Circuit RHS
		set     	1, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.8
		nop     
		ba      	.$$.andorEnd.8
		mov     	0, %g0
	.$$.andorSkip.8:
		mov     	1, %g0
	.$$.andorEnd.8:
		
		! sometest23 = (true)||(true)
		set     	-564, %o1
		add     	%fp, %o1, %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	0, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.9
		nop     
		
		! Short Circuit RHS
		set     	0, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.9
		nop     
		ba      	.$$.andorEnd.9
		mov     	0, %g0
	.$$.andorSkip.9:
		mov     	1, %g0
	.$$.andorEnd.9:
		
		! sometest24 = (false)||(false)
		set     	-568, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.10
		nop     
		
		! (bFalse)||(bTrue)
		
		! Short Circuit RHS
		set     	-392, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.10
		nop     
		ba      	.$$.andorEnd.10
		mov     	0, %o0
	.$$.andorSkip.10:
		mov     	1, %o0
	.$$.andorEnd.10:
		set     	-572, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest25 = (bFalse)||(bTrue)
		set     	-576, %o1
		add     	%fp, %o1, %o1
		set     	-572, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-392, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.11
		nop     
		
		! (bTrue)||(bFalse)
		
		! Short Circuit RHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.11
		nop     
		ba      	.$$.andorEnd.11
		mov     	0, %o0
	.$$.andorSkip.11:
		mov     	1, %o0
	.$$.andorEnd.11:
		set     	-580, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest26 = (bTrue)||(bFalse)
		set     	-584, %o1
		add     	%fp, %o1, %o1
		set     	-580, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.12
		nop     
		
		! (bFalse)||(bFalse)
		
		! Short Circuit RHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.12
		nop     
		ba      	.$$.andorEnd.12
		mov     	0, %o0
	.$$.andorSkip.12:
		mov     	1, %o0
	.$$.andorEnd.12:
		set     	-588, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest27 = (bFalse)||(bFalse)
		set     	-592, %o1
		add     	%fp, %o1, %o1
		set     	-588, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.13
		nop     
		
		! (true)&&(bFalse)
		
		! Short Circuit RHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.13
		nop     
		ba      	.$$.andorEnd.13
		mov     	1, %o0
	.$$.andorSkip.13:
		mov     	0, %o0
	.$$.andorEnd.13:
		set     	-596, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest28 = (true)&&(bFalse)
		set     	-600, %o1
		add     	%fp, %o1, %o1
		set     	-596, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-392, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.14
		nop     
		
		! Short Circuit LHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.15
		nop     
		
		! (bFalse)&&(bTrue)
		
		! Short Circuit RHS
		set     	-392, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.15
		nop     
		ba      	.$$.andorEnd.15
		mov     	1, %o0
	.$$.andorSkip.15:
		mov     	0, %o0
	.$$.andorEnd.15:
		set     	-604, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (bTrue)||((bFalse)&&(bTrue))
		
		! Short Circuit RHS
		set     	-604, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.14
		nop     
		ba      	.$$.andorEnd.14
		mov     	0, %o0
	.$$.andorSkip.14:
		mov     	1, %o0
	.$$.andorEnd.14:
		set     	-608, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest29 = (bTrue)||((bFalse)&&(bTrue))
		set     	-612, %o1
		add     	%fp, %o1, %o1
		set     	-608, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (arith8)>(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.22
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.22:
		set     	-616, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-616, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.16
		nop     
		
		! Short Circuit LHS
		set     	-564, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.17
		nop     
		
		! (sometest23)&&(sometest27)
		
		! Short Circuit RHS
		set     	-592, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.17
		nop     
		ba      	.$$.andorEnd.17
		mov     	1, %o0
	.$$.andorSkip.17:
		mov     	0, %o0
	.$$.andorEnd.17:
		set     	-620, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((arith8)>(arith9))||((sometest23)&&(sometest27))
		
		! Short Circuit RHS
		set     	-620, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.16
		nop     
		ba      	.$$.andorEnd.16
		mov     	0, %o0
	.$$.andorSkip.16:
		mov     	1, %o0
	.$$.andorEnd.16:
		set     	-624, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-624, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.18
		nop     
		
		! Short Circuit LHS
		set     	-532, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.19
		nop     
		
		! (sometest20)&&(true)
		
		! Short Circuit RHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.19
		nop     
		ba      	.$$.andorEnd.19
		mov     	1, %o0
	.$$.andorSkip.19:
		mov     	0, %o0
	.$$.andorEnd.19:
		set     	-628, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((arith8)>(arith9))||((sometest23)&&(sometest27)))||((sometest20)&&(true))
		
		! Short Circuit RHS
		set     	-628, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.18
		nop     
		ba      	.$$.andorEnd.18
		mov     	0, %o0
	.$$.andorSkip.18:
		mov     	1, %o0
	.$$.andorEnd.18:
		set     	-632, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-632, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.20
		nop     
		
		! ((((arith8)>(arith9))||((sometest23)&&(sometest27)))||((sometest20)&&(true)))||(false)
		
		! Short Circuit RHS
		set     	0, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.20
		nop     
		ba      	.$$.andorEnd.20
		mov     	0, %o0
	.$$.andorSkip.20:
		mov     	1, %o0
	.$$.andorEnd.20:
		set     	-636, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest30 = ((((arith8)>(arith9))||((sometest23)&&(sometest27)))||((sometest20)&&(true)))||(false)
		set     	-640, %o1
		add     	%fp, %o1, %o1
		set     	-636, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! intVarCin = 0
		set     	-644, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! floatVarCin = .0
		set     	-648, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.20:
		.single 	0r0.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.20, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (0)*(floatVarCin)
		set     	0, %o0
		set     	-656, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	-648, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fmuls   	%f0, %f1, %f0
		set     	-652, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! fito1 = (0)*(floatVarCin)
		set     	-660, %o1
		add     	%fp, %o1, %o1
		set     	-652, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (floatVarCin)*(0)
		set     	-648, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	0, %o1
		set     	-668, %l7
		add     	%fp, %l7, %l7
		st      	%o1, [%l7]
		ld      	[%l7], %f1
		fitos   	%f1, %f1
		fmuls   	%f0, %f1, %f0
		set     	-664, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! fito2 = (floatVarCin)*(0)
		set     	-672, %o1
		add     	%fp, %o1, %o1
		set     	-664, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (intVarCin)!=(floatVarCin)
		set     	-644, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-680, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	-648, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.23
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.23:
		set     	-676, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! fito3 = (intVarCin)!=(floatVarCin)
		set     	-684, %o1
		add     	%fp, %o1, %o1
		set     	-676, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (floatVarCin)>(intVarCin)
		set     	-648, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-644, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		set     	-692, %l7
		add     	%fp, %l7, %l7
		st      	%o1, [%l7]
		ld      	[%l7], %f1
		fitos   	%f1, %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.24
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.24:
		set     	-688, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! fito4 = (floatVarCin)>(intVarCin)
		set     	-696, %o1
		add     	%fp, %o1, %o1
		set     	-688, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! fito5 = 5
		set     	-700, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		set     	-704, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! fito6 = intVarCin
		set     	-708, %o1
		add     	%fp, %o1, %o1
		set     	-644, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-712, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! (intVarCin)*(intVarCin)
		set     	-644, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-644, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		call    	.mul
		nop     
		mov     	%o0, %o0
		set     	-716, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! fito7 = (intVarCin)*(intVarCin)
		set     	-720, %o1
		add     	%fp, %o1, %o1
		set     	-716, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-724, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! fito8 = (cgInt)+(cgFloat)
		set     	-728, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.21:
		.single 	0r10.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.21, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! fito9 = cgInt
		set     	-732, %o1
		add     	%fp, %o1, %o1
		set     	cgInt, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	-736, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! Short Circuit LHS
		set     	1, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.21
		nop     
		
		! Short Circuit LHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.22
		nop     
		
		! (arith8)>(arith9)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.25
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.25:
		set     	-740, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (true)&&((arith8)>(arith9))
		
		! Short Circuit RHS
		set     	-740, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.22
		nop     
		ba      	.$$.andorEnd.22
		mov     	1, %o0
	.$$.andorSkip.22:
		mov     	0, %o0
	.$$.andorEnd.22:
		set     	-744, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (!(false))||((true)&&((arith8)>(arith9)))
		
		! Short Circuit RHS
		set     	-744, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.21
		nop     
		ba      	.$$.andorEnd.21
		mov     	0, %o0
	.$$.andorSkip.21:
		mov     	1, %o0
	.$$.andorEnd.21:
		set     	-748, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-748, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.23
		nop     
		
		! Short Circuit LHS
		set     	-564, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.24
		nop     
		
		! (sometest23)&&(sometest27)
		
		! Short Circuit RHS
		set     	-592, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.24
		nop     
		ba      	.$$.andorEnd.24
		mov     	1, %o0
	.$$.andorSkip.24:
		mov     	0, %o0
	.$$.andorEnd.24:
		set     	-752, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((!(false))||((true)&&((arith8)>(arith9))))||((sometest23)&&(sometest27))
		
		! Short Circuit RHS
		set     	-752, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.23
		nop     
		ba      	.$$.andorEnd.23
		mov     	0, %o0
	.$$.andorSkip.23:
		mov     	1, %o0
	.$$.andorEnd.23:
		set     	-756, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-756, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.25
		nop     
		
		! Short Circuit LHS
		set     	-532, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.26
		nop     
		
		! (sometest20)&&(true)
		
		! Short Circuit RHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.26
		nop     
		ba      	.$$.andorEnd.26
		mov     	1, %o0
	.$$.andorSkip.26:
		mov     	0, %o0
	.$$.andorEnd.26:
		set     	-760, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((!(false))||((true)&&((arith8)>(arith9))))||((sometest23)&&(sometest27)))||((sometest20)&&(true))
		
		! Short Circuit RHS
		set     	-760, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.25
		nop     
		ba      	.$$.andorEnd.25
		mov     	0, %o0
	.$$.andorSkip.25:
		mov     	1, %o0
	.$$.andorEnd.25:
		set     	-764, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-764, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.27
		nop     
		
		! ((((!(false))||((true)&&((arith8)>(arith9))))||((sometest23)&&(sometest27)))||((sometest20)&&(true)))||(false)
		
		! Short Circuit RHS
		set     	0, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.27
		nop     
		ba      	.$$.andorEnd.27
		mov     	0, %o0
	.$$.andorSkip.27:
		mov     	1, %o0
	.$$.andorEnd.27:
		set     	-768, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! if ( ((((!(false))||((true)&&((arith8)>(arith9))))||((sometest23)&&(sometest27)))||((sometest20)&&(true)))||(false) )
		set     	-768, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.6
		nop     
			
			ba      	.$$.endif.6
			nop     
		
		! else
	.$$.else.6:
		
		! endif
	.$$.endif.6:
		
		! if ( (1)>(3) )
		set     	0, %o0
		cmp     	%o0, %g0
		be      	.$$.else.7
		nop     
			
			.section	".rodata"
			.align  	4
		.$$.str.2:
			.asciz  	"yay"
			
			.section	".text"
			.align  	4
			! cout << "yay"
			set     	.$$.strFmt, %o0
			set     	.$$.str.2, %o1
			call    	printf
			nop     
			
			! cout << endl
			set     	.$$.strEndl, %o0
			call    	printf
			nop     
			
			ba      	.$$.endif.7
			nop     
		
		! else
	.$$.else.7:
			
			.section	".rodata"
			.align  	4
		.$$.str.3:
			.asciz  	"bae"
			
			.section	".text"
			.align  	4
			! cout << "bae"
			set     	.$$.strFmt, %o0
			set     	.$$.str.3, %o1
			call    	printf
			nop     
			
			! cout << endl
			set     	.$$.strEndl, %o0
			call    	printf
			nop     
		
		! endif
	.$$.endif.7:
		
		! if ( (3)>(1) )
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.else.8
		nop     
			
			.section	".rodata"
			.align  	4
		.$$.str.4:
			.asciz  	"yay"
			
			.section	".text"
			.align  	4
			! cout << "yay"
			set     	.$$.strFmt, %o0
			set     	.$$.str.4, %o1
			call    	printf
			nop     
			
			! cout << endl
			set     	.$$.strEndl, %o0
			call    	printf
			nop     
			
			! if ( true )
			set     	1, %o0
			cmp     	%o0, %g0
			be      	.$$.else.9
			nop     
				
				.section	".rodata"
				.align  	4
			.$$.str.5:
				.asciz  	"nested"
				
				.section	".text"
				.align  	4
				! cout << "nested"
				set     	.$$.strFmt, %o0
				set     	.$$.str.5, %o1
				call    	printf
				nop     
				
				! cout << endl
				set     	.$$.strEndl, %o0
				call    	printf
				nop     
				
				ba      	.$$.endif.9
				nop     
			
			! else
		.$$.else.9:
				
				! if ( false )
				set     	0, %o0
				cmp     	%o0, %g0
				be      	.$$.else.10
				nop     
					
					.section	".rodata"
					.align  	4
				.$$.str.6:
					.asciz  	"double nested"
					
					.section	".text"
					.align  	4
					! cout << "double nested"
					set     	.$$.strFmt, %o0
					set     	.$$.str.6, %o1
					call    	printf
					nop     
					
					! cout << endl
					set     	.$$.strEndl, %o0
					call    	printf
					nop     
					
					ba      	.$$.endif.10
					nop     
				
				! else
			.$$.else.10:
				
				! endif
			.$$.endif.10:
				
				! (arith8)-(arith8)
				set     	-284, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %f0
				set     	-284, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %f1
				fsubs   	%f0, %f1, %f0
				set     	-772, %o1
				add     	%fp, %o1, %o1
				st      	%f0, [%o1]
				
				! ((arith8)-(arith8))>(6.9)
				set     	-772, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %f0
				
				.section	".rodata"
				.align  	4
			.$$.float.22:
				.single 	0r6.9
				
				.section	".text"
				.align  	4
				set     	.$$.float.22, %l7
				ld      	[%l7], %f1
				fcmps   	%f0, %f1
				nop     
				fble    	.$$.cmp.26
				mov     	%g0, %o0
				inc     	%o0
			.$$.cmp.26:
				set     	-776, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! if ( ((arith8)-(arith8))>(6.9) )
				set     	-776, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				cmp     	%o0, %g0
				be      	.$$.else.11
				nop     
					
					ba      	.$$.endif.11
					nop     
				
				! else
			.$$.else.11:
				
				! endif
			.$$.endif.11:
			
			! endif
		.$$.endif.9:
			
			ba      	.$$.endif.8
			nop     
		
		! else
	.$$.else.8:
		
		! endif
	.$$.endif.8:
		
		! (arith5)-(arith2)
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-132, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-780, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (local7)>((arith5)-(arith2))
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-780, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.27
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.27:
		set     	-784, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! if ( (local7)>((arith5)-(arith2)) )
		set     	-784, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.12
		nop     
			
			.section	".rodata"
			.align  	4
		.$$.str.7:
			.asciz  	"yay"
			
			.section	".text"
			.align  	4
			! cout << "yay"
			set     	.$$.strFmt, %o0
			set     	.$$.str.7, %o1
			call    	printf
			nop     
			
			! cout << endl
			set     	.$$.strEndl, %o0
			call    	printf
			nop     
			
			ba      	.$$.endif.12
			nop     
		
		! else
	.$$.else.12:
		
		! endif
	.$$.endif.12:
		
		! (local7)+(arith5)
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-788, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! -(arith2)
		set     	-132, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		neg     	%o0, %o0
		set     	-792, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)+(arith5))>(-(arith2))
		set     	-788, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-792, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.28
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.28:
		set     	-796, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! if ( ((local7)+(arith5))>(-(arith2)) )
		set     	-796, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.13
		nop     
			
			.section	".rodata"
			.align  	4
		.$$.str.8:
			.asciz  	"yay"
			
			.section	".text"
			.align  	4
			! cout << "yay"
			set     	.$$.strFmt, %o0
			set     	.$$.str.8, %o1
			call    	printf
			nop     
			
			! cout << endl
			set     	.$$.strEndl, %o0
			call    	printf
			nop     
			
			ba      	.$$.endif.13
			nop     
		
		! else
	.$$.else.13:
		
		! endif
	.$$.endif.13:
		
		! (arith8)-(arith8)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-800, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((arith8)-(arith8))>(6.9)
		set     	-800, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.23:
		.single 	0r6.9
		
		.section	".text"
		.align  	4
		set     	.$$.float.23, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.29
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.29:
		set     	-804, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! if ( ((arith8)-(arith8))>(6.9) )
		set     	-804, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.14
		nop     
			
			.section	".rodata"
			.align  	4
		.$$.str.9:
			.asciz  	"stay"
			
			.section	".text"
			.align  	4
			! cout << "stay"
			set     	.$$.strFmt, %o0
			set     	.$$.str.9, %o1
			call    	printf
			nop     
			
			! cout << endl
			set     	.$$.strEndl, %o0
			call    	printf
			nop     
			
			ba      	.$$.endif.14
			nop     
		
		! else
	.$$.else.14:
		
		! endif
	.$$.endif.14:
		
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
		set     	-92, %l7
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
		set     	-808, %o1
		add     	%fp, %o1, %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.24:
		.single 	0r420.25
		
		.section	".text"
		.align  	4
		set     	.$$.float.24, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! cout << (r1)+(662.50)
		
		.section	".rodata"
		.align  	4
	.$$.float.25:
		.single 	0r1082.75
		
		.section	".text"
		.align  	4
		set     	.$$.float.25, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.10:
		.asciz  	"\n"
		
		.section	".text"
		.align  	4
		! cout << "\n"
		set     	.$$.strFmt, %o0
		set     	.$$.str.10, %o1
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
	.$$.float.26:
		.single 	0r16.2
		
		.section	".text"
		.align  	4
		set     	.$$.float.26, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! (arith10)--
		set     	-364, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.27:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.27, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f2
		set     	-812, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		set     	-364, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		
		! ((arith10)--)*(arith9)
		set     	-812, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fmuls   	%f0, %f1, %f0
		set     	-816, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (arith10)++
		set     	-364, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.28:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.28, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f2
		set     	-820, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		set     	-364, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		
		! (((arith10)--)*(arith9))/((arith10)++)
		set     	-816, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-820, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fdivs   	%f0, %f1, %f0
		set     	-824, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (arith9)+((((arith10)--)*(arith9))/((arith10)++))
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-824, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-828, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! cout << (arith9)+((((arith10)--)*(arith9))/((arith10)++))
		set     	-828, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << local7
		set     	-68, %l7
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
		set     	-68, %l7
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
	.$$.float.29:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.29, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << 6.6666
		
		.section	".rodata"
		.align  	4
	.$$.float.30:
		.single 	0r6.6666
		
		.section	".text"
		.align  	4
		set     	.$$.float.30, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << local2
		set     	-40, %l7
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
	.$$.float.31:
		.single 	0r6.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.31, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << true
		set     	1, %o0
		call    	.$$.printBool
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.11:
		.asciz  	"string"
		
		.section	".text"
		.align  	4
		! cout << "string"
		set     	.$$.strFmt, %o0
		set     	.$$.str.11, %o1
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
	.$$.str.12:
		.asciz  	"poop"
		
		.section	".text"
		.align  	4
		! cout << "poop"
		set     	.$$.strFmt, %o0
		set     	.$$.str.12, %o1
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! cout << intVarCin
		set     	-644, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.13:
		.asciz  	" "
		
		.section	".text"
		.align  	4
		! cout << " "
		set     	.$$.strFmt, %o0
		set     	.$$.str.13, %o1
		call    	printf
		nop     
		
		! cout << floatVarCin
		set     	-648, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! localFloat = localInt
		set     	-8, %o1
		add     	%fp, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-832, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! ((localFloat)=(localInt))>(0)
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	0, %o1
		set     	-840, %l7
		add     	%fp, %l7, %l7
		st      	%o1, [%l7]
		ld      	[%l7], %f1
		fitos   	%f1, %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.30
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.30:
		set     	-836, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-836, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.28
		nop     
		
		! (((localFloat)=(localInt))>(0))&&(localBool)
		
		! Short Circuit RHS
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.28
		nop     
		ba      	.$$.andorEnd.28
		mov     	1, %o0
	.$$.andorSkip.28:
		mov     	0, %o0
	.$$.andorEnd.28:
		set     	-844, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! if ( (((localFloat)=(localInt))>(0))&&(localBool) )
		set     	-844, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.15
		nop     
			
			! (localInt)-(cgInt)
			set     	-4, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			set     	cgInt, %l7
			add     	%g0, %l7, %l7
			ld      	[%l7], %o1
			sub     	%o0, %o1, %o0
			set     	-848, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! localInt = (localInt)-(cgInt)
			set     	-4, %o1
			add     	%fp, %o1, %o1
			set     	-848, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			st      	%o0, [%o1]
			
			! localFloat = (localInt)=((localInt)-(cgInt))
			set     	-8, %o1
			add     	%fp, %o1, %o1
			set     	-4, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			set     	-852, %l7
			add     	%fp, %l7, %l7
			st      	%o0, [%l7]
			ld      	[%l7], %f0
			fitos   	%f0, %f0
			st      	%f0, [%o1]
			
			! (localFloat)!=(localInt)
			set     	-8, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %f0
			set     	-4, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o1
			set     	-860, %l7
			add     	%fp, %l7, %l7
			st      	%o1, [%l7]
			ld      	[%l7], %f1
			fitos   	%f1, %f1
			fcmps   	%f0, %f1
			nop     
			fbe     	.$$.cmp.31
			mov     	%g0, %o0
			inc     	%o0
		.$$.cmp.31:
			set     	-856, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! Short Circuit LHS
			set     	-856, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			be      	.$$.andorSkip.29
			nop     
			
			! ((localFloat)!=(localInt))&&(cgBool)
			
			! Short Circuit RHS
			set     	cgBool, %l7
			add     	%g0, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			be      	.$$.andorSkip.29
			nop     
			ba      	.$$.andorEnd.29
			mov     	1, %o0
		.$$.andorSkip.29:
			mov     	0, %o0
		.$$.andorEnd.29:
			set     	-864, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! sometest25 = ((localFloat)!=(localInt))&&(cgBool)
			set     	-576, %o1
			add     	%fp, %o1, %o1
			set     	-864, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			st      	%o0, [%o1]
			
			! localBool = (sometest25)=(((localFloat)!=(localInt))&&(cgBool))
			set     	-12, %o1
			add     	%fp, %o1, %o1
			set     	-576, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			st      	%o0, [%o1]
			
			ba      	.$$.endif.15
			nop     
		
		! else
	.$$.else.15:
		
		! endif
	.$$.endif.15:
		
		! Short Circuit LHS
		set     	-392, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.30
		nop     
		
		! (bTrue)&&(bFalse)
		
		! Short Circuit RHS
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.30
		nop     
		ba      	.$$.andorEnd.30
		mov     	1, %o0
	.$$.andorSkip.30:
		mov     	0, %o0
	.$$.andorEnd.30:
		set     	-868, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! if ( (bTrue)&&(bFalse) )
		set     	-868, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.16
		nop     
			
			.section	".rodata"
			.align  	4
		.$$.str.14:
			.asciz  	"This should not print."
			
			.section	".text"
			.align  	4
			! cout << "This should not print."
			set     	.$$.strFmt, %o0
			set     	.$$.str.14, %o1
			call    	printf
			nop     
			
			! cout << endl
			set     	.$$.strEndl, %o0
			call    	printf
			nop     
			
			! (localFloat)>(10)
			set     	-8, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %f0
			set     	10, %o1
			set     	-876, %l7
			add     	%fp, %l7, %l7
			st      	%o1, [%l7]
			ld      	[%l7], %f1
			fitos   	%f1, %f1
			fcmps   	%f0, %f1
			nop     
			fble    	.$$.cmp.32
			mov     	%g0, %o0
			inc     	%o0
		.$$.cmp.32:
			set     	-872, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! localBool = (localFloat)>(10)
			set     	-12, %o1
			add     	%fp, %o1, %o1
			set     	-872, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			st      	%o0, [%o1]
			
			! if ( (localBool)=((localFloat)>(10)) )
			set     	-12, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			be      	.$$.else.17
			nop     
				
				ba      	.$$.endif.17
				nop     
			
			! else
		.$$.else.17:
			
			! endif
		.$$.endif.17:
			
			ba      	.$$.endif.16
			nop     
		
		! else
	.$$.else.16:
			
			! Short Circuit LHS
			set     	-388, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			bne     	.$$.andorSkip.31
			nop     
			
			! (bFalse)||(bFalse)
			
			! Short Circuit RHS
			set     	-388, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			bne     	.$$.andorSkip.31
			nop     
			ba      	.$$.andorEnd.31
			mov     	0, %o0
		.$$.andorSkip.31:
			mov     	1, %o0
		.$$.andorEnd.31:
			set     	-880, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! ((bFalse)||(bFalse))==(bTrue)
			set     	-880, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			set     	-392, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o1
			cmp     	%o0, %o1
			bne     	.$$.cmp.33
			mov     	%g0, %o0
			inc     	%o0
		.$$.cmp.33:
			set     	-884, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! if ( ((bFalse)||(bFalse))==(bTrue) )
			set     	-884, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			be      	.$$.else.18
			nop     
				
				.section	".rodata"
				.align  	4
			.$$.str.15:
				.asciz  	"This neither."
				
				.section	".text"
				.align  	4
				! cout << "This neither."
				set     	.$$.strFmt, %o0
				set     	.$$.str.15, %o1
				call    	printf
				nop     
				
				! cout << endl
				set     	.$$.strEndl, %o0
				call    	printf
				nop     
				
				ba      	.$$.endif.18
				nop     
			
			! else
		.$$.else.18:
				
				.section	".rodata"
				.align  	4
			.$$.str.16:
				.asciz  	"Yup"
				
				.section	".text"
				.align  	4
				! cout << "Yup"
				set     	.$$.strFmt, %o0
				set     	.$$.str.16, %o1
				call    	printf
				nop     
				
				! cout << endl
				set     	.$$.strEndl, %o0
				call    	printf
				nop     
			
			! endif
		.$$.endif.18:
		
		! endif
	.$$.endif.16:
		
		! looper1 = 0
		set     	-888, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! while ( ... )
	.$$.loopCheck.3:
			
			! (looper1)<(10)
			set     	-888, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			set     	10, %o1
			cmp     	%o0, %o1
			bge     	.$$.cmp.34
			mov     	%g0, %o0
			inc     	%o0
		.$$.cmp.34:
			set     	-892, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! Check loop condition
			set     	-892, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			cmp     	%o0, %g0
			be      	.$$.loopEnd.3
			nop     
			
			! Start of loop body
				
				! cout << looper1
				set     	-888, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o1
				set     	.$$.intFmt, %o0
				call    	printf
				nop     
				
				! cout << endl
				set     	.$$.strEndl, %o0
				call    	printf
				nop     
				
				! (looper1)+(1)
				set     	-888, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				set     	1, %o1
				add     	%o0, %o1, %o0
				set     	-896, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! looper1 = (looper1)+(1)
				set     	-888, %o1
				add     	%fp, %o1, %o1
				set     	-896, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				st      	%o0, [%o1]
				
				! (looper1)==(3)
				set     	-888, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				set     	3, %o1
				cmp     	%o0, %o1
				bne     	.$$.cmp.35
				mov     	%g0, %o0
				inc     	%o0
			.$$.cmp.35:
				set     	-900, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! if ( (looper1)==(3) )
				set     	-900, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				cmp     	%o0, %g0
				be      	.$$.else.19
				nop     
					
					! continue
					ba      	.$$.loopCheck.3
					nop     
					
					ba      	.$$.endif.19
					nop     
				
				! else
			.$$.else.19:
				
				! endif
			.$$.endif.19:
				
				! (looper1)==(6)
				set     	-888, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				set     	6, %o1
				cmp     	%o0, %o1
				bne     	.$$.cmp.36
				mov     	%g0, %o0
				inc     	%o0
			.$$.cmp.36:
				set     	-904, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! if ( (looper1)==(6) )
				set     	-904, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				cmp     	%o0, %g0
				be      	.$$.else.20
				nop     
					
					! break
					ba      	.$$.loopEnd.3
					nop     
					
					ba      	.$$.endif.20
					nop     
				
				! else
			.$$.else.20:
				
				! endif
			.$$.endif.20:
				
				! while ( ... )
			.$$.loopCheck.4:
					
					! (looper1)<(0)
					set     	-888, %l7
					add     	%fp, %l7, %l7
					ld      	[%l7], %o0
					set     	0, %o1
					cmp     	%o0, %o1
					bge     	.$$.cmp.37
					mov     	%g0, %o0
					inc     	%o0
				.$$.cmp.37:
					set     	-908, %o1
					add     	%fp, %o1, %o1
					st      	%o0, [%o1]
					
					! Check loop condition
					set     	-908, %l7
					add     	%fp, %l7, %l7
					ld      	[%l7], %o0
					cmp     	%o0, %g0
					be      	.$$.loopEnd.4
					nop     
					
					! Start of loop body
						
						! (looper1)==(8)
						set     	-888, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %o0
						set     	8, %o1
						cmp     	%o0, %o1
						bne     	.$$.cmp.38
						mov     	%g0, %o0
						inc     	%o0
					.$$.cmp.38:
						set     	-912, %o1
						add     	%fp, %o1, %o1
						st      	%o0, [%o1]
						
						! if ( (looper1)==(8) )
						set     	-912, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %o0
						cmp     	%o0, %g0
						be      	.$$.else.21
						nop     
							
							! continue
							ba      	.$$.loopCheck.4
							nop     
							
							ba      	.$$.endif.21
							nop     
						
						! else
					.$$.else.21:
						
						! endif
					.$$.endif.21:
						
						! (looper1)==(9)
						set     	-888, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %o0
						set     	9, %o1
						cmp     	%o0, %o1
						bne     	.$$.cmp.39
						mov     	%g0, %o0
						inc     	%o0
					.$$.cmp.39:
						set     	-916, %o1
						add     	%fp, %o1, %o1
						st      	%o0, [%o1]
						
						! if ( (looper1)==(9) )
						set     	-916, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %o0
						cmp     	%o0, %g0
						be      	.$$.else.22
						nop     
							
							! break
							ba      	.$$.loopEnd.4
							nop     
							
							ba      	.$$.endif.22
							nop     
						
						! else
					.$$.else.22:
						
						! endif
					.$$.endif.22:
						
						! continue
						ba      	.$$.loopCheck.4
						nop     
						
						! break
						ba      	.$$.loopEnd.4
						nop     
					
					! End of loop body
					ba      	.$$.loopCheck.4
					nop     
				.$$.loopEnd.4:
			
			! End of loop body
			ba      	.$$.loopCheck.3
			nop     
		.$$.loopEnd.3:
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 916) & -8
	
main.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".bss"
	.align  	4
	.global 	local1
local1:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	local11
local11:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	local2
local2:
	.single 	0r6.6
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	local2_2
local2_2:
	.single 	0r6.6
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	local111
local111:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	local3
local3:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.local3:
	set     	SAVE..$.init.local3, %g1
	save    	%sp, %g1, %sp
		
		! local3 = local2
		set     	local3, %o1
		add     	%g0, %o1, %o1
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.local3
	call    	.$.init.local3.fini
	nop     
	ret     
	restore 
	SAVE..$.init.local3 = -(92 + 0) & -8
	
.$.init.local3.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.local3
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	local4
local4:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.local4:
	set     	SAVE..$.init.local4, %g1
	save    	%sp, %g1, %sp
		
		! local4 = local1
		set     	local4, %o1
		add     	%g0, %o1, %o1
		set     	local1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.local4
	call    	.$.init.local4.fini
	nop     
	ret     
	restore 
	SAVE..$.init.local4 = -(92 + 0) & -8
	
.$.init.local4.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.local4
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	local5
local5:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.local5:
	set     	SAVE..$.init.local5, %g1
	save    	%sp, %g1, %sp
		
		! local5 = local11
		set     	local5, %o1
		add     	%g0, %o1, %o1
		set     	local11, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.local5
	call    	.$.init.local5.fini
	nop     
	ret     
	restore 
	SAVE..$.init.local5 = -(92 + 0) & -8
	
.$.init.local5.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.local5
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	local6
local6:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	local7
local7:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	clocal
clocal:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	clocal2
clocal2:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	clocal3
clocal3:
	.single 	0r4.4
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	clocal4
clocal4:
	.single 	0r4.4
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	c1
c1:
	.word   	210
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	c2
c2:
	.word   	214
	
	.section	".text"
	.align  	4
	
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
		
		! -(local7)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		neg     	%o0, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((5)+(10))-(-(local7))
		set     	15, %o0
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((5)+(10))-(-(local7)))+(-(clocal2))
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-5, %o1
		add     	%o0, %o1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! +(local7)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		mov     	%o0, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((5)+(10))-(-(local7)))+(-(clocal2)))+(+(local7))
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((((5)+(10))-(-(local7)))+(-(clocal2)))+(+(local7)))+(+(clocal2))
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith1 = (((((5)+(10))-(-(local7)))+(-(clocal2)))+(+(local7)))+(+(clocal2))
		set     	arith1, %o1
		add     	%g0, %o1, %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith1
	call    	.$.init.arith1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith1 = -(92 + 24) & -8
	
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
	
	.section	".bss"
	.align  	4
	.global 	arith2
arith2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith2:
	set     	SAVE..$.init.arith2, %g1
	save    	%sp, %g1, %sp
		
		! (local7)+(local7)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)+(local7))+(5)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith2 = ((local7)+(local7))+(5)
		set     	arith2, %o1
		add     	%g0, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith2
	call    	.$.init.arith2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith2 = -(92 + 8) & -8
	
.$.init.arith2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith3
arith3:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith3:
	set     	SAVE..$.init.arith3, %g1
	save    	%sp, %g1, %sp
		
		! (local7)-(local7)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)-(local7))-(5)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		sub     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith3 = ((local7)-(local7))-(5)
		set     	arith3, %o1
		add     	%g0, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith3
	call    	.$.init.arith3.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith3 = -(92 + 8) & -8
	
.$.init.arith3.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith3
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith4
arith4:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith4:
	set     	SAVE..$.init.arith4, %g1
	save    	%sp, %g1, %sp
		
		! +(local7)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		mov     	%o0, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith4 = +(local7)
		set     	arith4, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith4
	call    	.$.init.arith4.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith4 = -(92 + 4) & -8
	
.$.init.arith4.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith4
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith5
arith5:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith5:
	set     	SAVE..$.init.arith5, %g1
	save    	%sp, %g1, %sp
		
		! (local7)/(clocal2)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	clocal2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		call    	.div
		nop     
		mov     	%o0, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)/(clocal2))*(local7)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		call    	.mul
		nop     
		mov     	%o0, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((local7)/(clocal2))*(local7))%(clocal)
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	clocal, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		call    	.rem
		nop     
		mov     	%o0, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((local7)/(clocal2))*(local7))%(clocal))/(5)
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		call    	.div
		nop     
		mov     	%o0, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((((local7)/(clocal2))*(local7))%(clocal))/(5))*(10)
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	10, %o1
		call    	.mul
		nop     
		mov     	%o0, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((((local7)/(clocal2))*(local7))%(clocal))/(5))*(10))%(5)
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		call    	.rem
		nop     
		mov     	%o0, %o0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith5 = ((((((local7)/(clocal2))*(local7))%(clocal))/(5))*(10))%(5)
		set     	arith5, %o1
		add     	%g0, %o1, %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith5
	call    	.$.init.arith5.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith5 = -(92 + 24) & -8
	
.$.init.arith5.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith5
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith6
arith6:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith6:
	set     	SAVE..$.init.arith6, %g1
	save    	%sp, %g1, %sp
		
		! (local7)&(5)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		and     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (local6)&(5)
		set     	local6, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		and     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (clocal2)^((local6)&(5))
		set     	clocal2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		xor     	%o0, %o1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((local7)&(5))|((clocal2)^((local6)&(5)))
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		or      	%o0, %o1, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((local7)&(5))|((clocal2)^((local6)&(5))))|((10)^(3))
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	9, %o1
		or      	%o0, %o1, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (local7)&(local6)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	local6, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		and     	%o0, %o1, %o0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (local7)^((local7)&(local6))
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		xor     	%o0, %o1, %o0
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((local7)&(5))|((clocal2)^((local6)&(5))))|((10)^(3)))|((local7)^((local7)&(local6)))
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-28, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		or      	%o0, %o1, %o0
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith6 = ((((local7)&(5))|((clocal2)^((local6)&(5))))|((10)^(3)))|((local7)^((local7)&(local6)))
		set     	arith6, %o1
		add     	%g0, %o1, %o1
		set     	-32, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith6
	call    	.$.init.arith6.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith6 = -(92 + 32) & -8
	
.$.init.arith6.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith6
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith7
arith7:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith7:
	set     	SAVE..$.init.arith7, %g1
	save    	%sp, %g1, %sp
		
		! --(local7)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		sub     	%o0, %o1, %o2
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		set     	local7, %o1
		add     	%g0, %o1, %o1
		st      	%o2, [%o1]
		
		! ((5)+(10))-(--(local7))
		set     	15, %o0
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ++(local7)
		set     	local7, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		add     	%o0, %o1, %o2
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		set     	local7, %o1
		add     	%g0, %o1, %o1
		st      	%o2, [%o1]
		
		! (((5)+(10))-(--(local7)))+(++(local7))
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2))
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-5, %o1
		add     	%o0, %o1, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (arith6)++
		set     	arith6, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		add     	%o0, %o1, %o2
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	arith6, %o1
		add     	%g0, %o1, %o1
		st      	%o2, [%o1]
		
		! (((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2)))+((arith6)++)
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (arith5)--
		set     	arith5, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		sub     	%o0, %o1, %o2
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	arith5, %o1
		add     	%g0, %o1, %o1
		st      	%o2, [%o1]
		
		! ((((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2)))+((arith6)++))-((arith5)--)
		set     	-28, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-32, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		sub     	%o0, %o1, %o0
		set     	-36, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arith7 = ((((((5)+(10))-(--(local7)))+(++(local7)))+(-(clocal2)))+((arith6)++))-((arith5)--)
		set     	arith7, %o1
		add     	%g0, %o1, %o1
		set     	-36, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.arith7
	call    	.$.init.arith7.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith7 = -(92 + 36) & -8
	
.$.init.arith7.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith7
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith8
arith8:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith8:
	set     	SAVE..$.init.arith8, %g1
	save    	%sp, %g1, %sp
		
		! ((5.5)+(10.10))-(local2)
		
		.section	".rodata"
		.align  	4
	.$$.float.32:
		.single 	0r15.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.32, %l7
		ld      	[%l7], %f0
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (((5.5)+(10.10))-(local2))+(local2_2)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	local2_2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! +(local2)
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		fmovs   	%f0, %f0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((((5.5)+(10.10))-(local2))+(local2_2))-(+(local2))
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! -(local2_2)
		set     	local2_2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		fnegs   	%f0, %f0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (((((5.5)+(10.10))-(local2))+(local2_2))-(+(local2)))+(-(local2_2))
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arith8 = (((((5.5)+(10.10))-(local2))+(local2_2))-(+(local2)))+(-(local2_2))
		set     	arith8, %o1
		add     	%g0, %o1, %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.arith8
	call    	.$.init.arith8.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith8 = -(92 + 24) & -8
	
.$.init.arith8.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith8
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith9
arith9:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith9:
	set     	SAVE..$.init.arith9, %g1
	save    	%sp, %g1, %sp
		
		! (local2)/(local2_2)
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	local2_2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fdivs   	%f0, %f1, %f0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((local2)/(local2_2))*(local2)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fmuls   	%f0, %f1, %f0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (((local2)/(local2_2))*(local2))/(5.5)
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.33:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.33, %l7
		ld      	[%l7], %f1
		fdivs   	%f0, %f1, %f0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((((local2)/(local2_2))*(local2))/(5.5))*(10.5)
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.34:
		.single 	0r10.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.34, %l7
		ld      	[%l7], %f1
		fmuls   	%f0, %f1, %f0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arith9 = ((((local2)/(local2_2))*(local2))/(5.5))*(10.5)
		set     	arith9, %o1
		add     	%g0, %o1, %o1
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.arith9
	call    	.$.init.arith9.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith9 = -(92 + 16) & -8
	
.$.init.arith9.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith9
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arithtest1
arithtest1:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arithtest1:
	set     	SAVE..$.init.arithtest1, %g1
	save    	%sp, %g1, %sp
		
		! --(local2)
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.35:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.35, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f2
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		set     	local2, %o1
		add     	%g0, %o1, %o1
		st      	%f2, [%o1]
		
		! arithtest1 = --(local2)
		set     	arithtest1, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.arithtest1
	call    	.$.init.arithtest1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arithtest1 = -(92 + 4) & -8
	
.$.init.arithtest1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arithtest1
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arithtest2
arithtest2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arithtest2:
	set     	SAVE..$.init.arithtest2, %g1
	save    	%sp, %g1, %sp
		
		! (local2)-(1.0)
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.36:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.36, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arithtest2 = (local2)-(1.0)
		set     	arithtest2, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.arithtest2
	call    	.$.init.arithtest2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arithtest2 = -(92 + 4) & -8
	
.$.init.arithtest2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arithtest2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arith10
arith10:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.arith10:
	set     	SAVE..$.init.arith10, %g1
	save    	%sp, %g1, %sp
		
		! --(local2)
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.37:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.37, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f2
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		set     	local2, %o1
		add     	%g0, %o1, %o1
		st      	%f2, [%o1]
		
		! ((5.5)+(10.10))-(--(local2))
		
		.section	".rodata"
		.align  	4
	.$$.float.38:
		.single 	0r15.6
		
		.section	".text"
		.align  	4
		set     	.$$.float.38, %l7
		ld      	[%l7], %f0
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ++(local2_2)
		set     	local2_2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.39:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.39, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f2
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%f2, [%o1]
		set     	local2_2, %o1
		add     	%g0, %o1, %o1
		st      	%f2, [%o1]
		
		! (((5.5)+(10.10))-(--(local2)))+(++(local2_2))
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! -(local2)
		set     	local2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		fnegs   	%f0, %f0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! ((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2))
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (arith8)++
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.40:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.40, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f2
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		set     	arith8, %o1
		add     	%g0, %o1, %o1
		st      	%f2, [%o1]
		
		! (((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2)))+((arith8)++)
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-28, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (arith9)--
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.41:
		.single 	0r1.0
		
		.section	".text"
		.align  	4
		set     	.$$.float.41, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f2
		set     	-36, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		set     	arith9, %o1
		add     	%g0, %o1, %o1
		st      	%f2, [%o1]
		
		! ((((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2)))+((arith8)++))-((arith9)--)
		set     	-32, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-36, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fsubs   	%f0, %f1, %f0
		set     	-40, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! arith10 = ((((((5.5)+(10.10))-(--(local2)))+(++(local2_2)))+(-(local2)))+((arith8)++))-((arith9)--)
		set     	arith10, %o1
		add     	%g0, %o1, %o1
		set     	-40, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.arith10
	call    	.$.init.arith10.fini
	nop     
	ret     
	restore 
	SAVE..$.init.arith10 = -(92 + 40) & -8
	
.$.init.arith10.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.arith10
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	sometester
sometester:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest
sometest:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest:
	set     	SAVE..$.init.sometest, %g1
	save    	%sp, %g1, %sp
		
		! (sometester)>(10)
		set     	sometester, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	10, %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.40
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.40:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest = (sometester)>(10)
		set     	sometest, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest
	call    	.$.init.sometest.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest = -(92 + 4) & -8
	
.$.init.sometest.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest2
sometest2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest2:
	set     	SAVE..$.init.sometest2, %g1
	save    	%sp, %g1, %sp
		
		! (sometester)>(sometester)
		set     	sometester, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	sometester, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.41
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.41:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest2 = (sometester)>(sometester)
		set     	sometest2, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest2
	call    	.$.init.sometest2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest2 = -(92 + 4) & -8
	
.$.init.sometest2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	bFalse
bFalse:
	.word   	0
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	bTrue
bTrue:
	.word   	1
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest3
sometest3:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest3:
	set     	SAVE..$.init.sometest3, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)>(9.5)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		
		.section	".rodata"
		.align  	4
	.$$.float.42:
		.single 	0r9.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.42, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.42
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.42:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest3 = (arith8)>(9.5)
		set     	sometest3, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest3
	call    	.$.init.sometest3.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest3 = -(92 + 4) & -8
	
.$.init.sometest3.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest3
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest4
sometest4:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest4:
	set     	SAVE..$.init.sometest4, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)>(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.43
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.43:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest4 = (arith8)>(arith9)
		set     	sometest4, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest4
	call    	.$.init.sometest4.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest4 = -(92 + 4) & -8
	
.$.init.sometest4.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest4
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest5
sometest5:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest5:
	set     	SAVE..$.init.sometest5, %g1
	save    	%sp, %g1, %sp
		
		! (arith4)>=(arith5)
		set     	arith4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	arith5, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bl      	.$$.cmp.44
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.44:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest5 = (arith4)>=(arith5)
		set     	sometest5, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest5
	call    	.$.init.sometest5.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest5 = -(92 + 4) & -8
	
.$.init.sometest5.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest5
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest6
sometest6:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest6:
	set     	SAVE..$.init.sometest6, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)>=(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbl     	.$$.cmp.45
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.45:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest6 = (arith8)>=(arith9)
		set     	sometest6, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest6
	call    	.$.init.sometest6.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest6 = -(92 + 4) & -8
	
.$.init.sometest6.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest6
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest7
sometest7:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest7:
	set     	SAVE..$.init.sometest7, %g1
	save    	%sp, %g1, %sp
		
		! (arith4)<(arith5)
		set     	arith4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	arith5, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bge     	.$$.cmp.46
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.46:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest7 = (arith4)<(arith5)
		set     	sometest7, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest7
	call    	.$.init.sometest7.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest7 = -(92 + 4) & -8
	
.$.init.sometest7.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest7
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest8
sometest8:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest8:
	set     	SAVE..$.init.sometest8, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)<(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbge    	.$$.cmp.47
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.47:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest8 = (arith8)<(arith9)
		set     	sometest8, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest8
	call    	.$.init.sometest8.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest8 = -(92 + 4) & -8
	
.$.init.sometest8.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest8
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest9
sometest9:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest9:
	set     	SAVE..$.init.sometest9, %g1
	save    	%sp, %g1, %sp
		
		! (arith4)<=(arith5)
		set     	arith4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	arith5, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bg      	.$$.cmp.48
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.48:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest9 = (arith4)<=(arith5)
		set     	sometest9, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest9
	call    	.$.init.sometest9.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest9 = -(92 + 4) & -8
	
.$.init.sometest9.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest9
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest10
sometest10:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest10:
	set     	SAVE..$.init.sometest10, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)<=(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbg     	.$$.cmp.49
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.49:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest10 = (arith8)<=(arith9)
		set     	sometest10, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest10
	call    	.$.init.sometest10.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest10 = -(92 + 4) & -8
	
.$.init.sometest10.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest10
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest11
sometest11:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest11:
	set     	SAVE..$.init.sometest11, %g1
	save    	%sp, %g1, %sp
		
		! (arith4)==(arith5)
		set     	arith4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	arith5, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.50
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.50:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest11 = (arith4)==(arith5)
		set     	sometest11, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest11
	call    	.$.init.sometest11.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest11 = -(92 + 4) & -8
	
.$.init.sometest11.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest11
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest12
sometest12:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest12:
	set     	SAVE..$.init.sometest12, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)==(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbne    	.$$.cmp.51
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.51:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest12 = (arith8)==(arith9)
		set     	sometest12, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest12
	call    	.$.init.sometest12.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest12 = -(92 + 4) & -8
	
.$.init.sometest12.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest12
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest13
sometest13:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest13:
	set     	SAVE..$.init.sometest13, %g1
	save    	%sp, %g1, %sp
		
		! (arith4)!=(arith5)
		set     	arith4, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	arith5, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.52
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.52:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest13 = (arith4)!=(arith5)
		set     	sometest13, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest13
	call    	.$.init.sometest13.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest13 = -(92 + 4) & -8
	
.$.init.sometest13.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest13
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest14
sometest14:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest14:
	set     	SAVE..$.init.sometest14, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)!=(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.53
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.53:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest14 = (arith8)!=(arith9)
		set     	sometest14, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest14
	call    	.$.init.sometest14.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest14 = -(92 + 4) & -8
	
.$.init.sometest14.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest14
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest15
sometest15:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest15:
	set     	SAVE..$.init.sometest15, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)!=(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.54
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.54:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! !((arith8)!=(arith9))
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		xor     	%o0, 1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest15 = !((arith8)!=(arith9))
		set     	sometest15, %o1
		add     	%g0, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest15
	call    	.$.init.sometest15.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest15 = -(92 + 8) & -8
	
.$.init.sometest15.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest15
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest16
sometest16:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest16:
	set     	SAVE..$.init.sometest16, %g1
	save    	%sp, %g1, %sp
		
		! !(sometest14)
		set     	sometest14, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		xor     	%o0, 1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest16 = !(sometest14)
		set     	sometest16, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest16
	call    	.$.init.sometest16.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest16 = -(92 + 4) & -8
	
.$.init.sometest16.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest16
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	sometest17
sometest17:
	.word   	1
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	sometest18
sometest18:
	.word   	0
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest19
sometest19:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest19:
	set     	SAVE..$.init.sometest19, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.34
		nop     
		
		! (bFalse)&&(bTrue)
		
		! Short Circuit RHS
		set     	bTrue, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.34
		nop     
		ba      	.$$.andorEnd.34
		mov     	1, %o0
	.$$.andorSkip.34:
		mov     	0, %o0
	.$$.andorEnd.34:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest19 = (bFalse)&&(bTrue)
		set     	sometest19, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest19
	call    	.$.init.sometest19.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest19 = -(92 + 4) & -8
	
.$.init.sometest19.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest19
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest20
sometest20:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest20:
	set     	SAVE..$.init.sometest20, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	bTrue, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.35
		nop     
		
		! (bTrue)&&(bFalse)
		
		! Short Circuit RHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.35
		nop     
		ba      	.$$.andorEnd.35
		mov     	1, %o0
	.$$.andorSkip.35:
		mov     	0, %o0
	.$$.andorEnd.35:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest20 = (bTrue)&&(bFalse)
		set     	sometest20, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest20
	call    	.$.init.sometest20.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest20 = -(92 + 4) & -8
	
.$.init.sometest20.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest20
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest21
sometest21:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest21:
	set     	SAVE..$.init.sometest21, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.36
		nop     
		
		! (bFalse)&&(bFalse)
		
		! Short Circuit RHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.36
		nop     
		ba      	.$$.andorEnd.36
		mov     	1, %o0
	.$$.andorSkip.36:
		mov     	0, %o0
	.$$.andorEnd.36:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest21 = (bFalse)&&(bFalse)
		set     	sometest21, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest21
	call    	.$.init.sometest21.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest21 = -(92 + 4) & -8
	
.$.init.sometest21.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest21
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest22
sometest22:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest22:
	set     	SAVE..$.init.sometest22, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)>(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.55
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.55:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.37
		nop     
		
		! (arith8)!=(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.56
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.56:
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! !((arith8)!=(arith9))
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		xor     	%o0, 1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((arith8)>(arith9))&&(!((arith8)!=(arith9)))
		
		! Short Circuit RHS
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.37
		nop     
		ba      	.$$.andorEnd.37
		mov     	1, %o0
	.$$.andorSkip.37:
		mov     	0, %o0
	.$$.andorEnd.37:
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest22 = ((arith8)>(arith9))&&(!((arith8)!=(arith9)))
		set     	sometest22, %o1
		add     	%g0, %o1, %o1
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest22
	call    	.$.init.sometest22.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest22 = -(92 + 16) & -8
	
.$.init.sometest22.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest22
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	sometest23
sometest23:
	.word   	1
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	sometest24
sometest24:
	.word   	0
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest25
sometest25:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest25:
	set     	SAVE..$.init.sometest25, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.40
		nop     
		
		! (bFalse)||(bTrue)
		
		! Short Circuit RHS
		set     	bTrue, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.40
		nop     
		ba      	.$$.andorEnd.40
		mov     	0, %o0
	.$$.andorSkip.40:
		mov     	1, %o0
	.$$.andorEnd.40:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest25 = (bFalse)||(bTrue)
		set     	sometest25, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest25
	call    	.$.init.sometest25.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest25 = -(92 + 4) & -8
	
.$.init.sometest25.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest25
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest26
sometest26:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest26:
	set     	SAVE..$.init.sometest26, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	bTrue, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.41
		nop     
		
		! (bTrue)||(bFalse)
		
		! Short Circuit RHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.41
		nop     
		ba      	.$$.andorEnd.41
		mov     	0, %o0
	.$$.andorSkip.41:
		mov     	1, %o0
	.$$.andorEnd.41:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest26 = (bTrue)||(bFalse)
		set     	sometest26, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest26
	call    	.$.init.sometest26.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest26 = -(92 + 4) & -8
	
.$.init.sometest26.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest26
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest27
sometest27:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest27:
	set     	SAVE..$.init.sometest27, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.42
		nop     
		
		! (bFalse)||(bFalse)
		
		! Short Circuit RHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.42
		nop     
		ba      	.$$.andorEnd.42
		mov     	0, %o0
	.$$.andorSkip.42:
		mov     	1, %o0
	.$$.andorEnd.42:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest27 = (bFalse)||(bFalse)
		set     	sometest27, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest27
	call    	.$.init.sometest27.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest27 = -(92 + 4) & -8
	
.$.init.sometest27.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest27
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest28
sometest28:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest28:
	set     	SAVE..$.init.sometest28, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.43
		nop     
		
		! (true)&&(bFalse)
		
		! Short Circuit RHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.43
		nop     
		ba      	.$$.andorEnd.43
		mov     	1, %o0
	.$$.andorSkip.43:
		mov     	0, %o0
	.$$.andorEnd.43:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest28 = (true)&&(bFalse)
		set     	sometest28, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest28
	call    	.$.init.sometest28.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest28 = -(92 + 4) & -8
	
.$.init.sometest28.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest28
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest29
sometest29:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest29:
	set     	SAVE..$.init.sometest29, %g1
	save    	%sp, %g1, %sp
		
		! Short Circuit LHS
		set     	bTrue, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.44
		nop     
		
		! Short Circuit LHS
		set     	bFalse, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.45
		nop     
		
		! (bFalse)&&(bTrue)
		
		! Short Circuit RHS
		set     	bTrue, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.45
		nop     
		ba      	.$$.andorEnd.45
		mov     	1, %o0
	.$$.andorSkip.45:
		mov     	0, %o0
	.$$.andorEnd.45:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (bTrue)||((bFalse)&&(bTrue))
		
		! Short Circuit RHS
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.44
		nop     
		ba      	.$$.andorEnd.44
		mov     	0, %o0
	.$$.andorSkip.44:
		mov     	1, %o0
	.$$.andorEnd.44:
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest29 = (bTrue)||((bFalse)&&(bTrue))
		set     	sometest29, %o1
		add     	%g0, %o1, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest29
	call    	.$.init.sometest29.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest29 = -(92 + 8) & -8
	
.$.init.sometest29.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest29
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	sometest30
sometest30:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.sometest30:
	set     	SAVE..$.init.sometest30, %g1
	save    	%sp, %g1, %sp
		
		! (arith8)>(arith9)
		set     	arith8, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	arith9, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.57
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.57:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.46
		nop     
		
		! Short Circuit LHS
		set     	sometest23, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.47
		nop     
		
		! (sometest23)&&(sometest27)
		
		! Short Circuit RHS
		set     	sometest27, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.47
		nop     
		ba      	.$$.andorEnd.47
		mov     	1, %o0
	.$$.andorSkip.47:
		mov     	0, %o0
	.$$.andorEnd.47:
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ((arith8)>(arith9))||((sometest23)&&(sometest27))
		
		! Short Circuit RHS
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.46
		nop     
		ba      	.$$.andorEnd.46
		mov     	0, %o0
	.$$.andorSkip.46:
		mov     	1, %o0
	.$$.andorEnd.46:
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.48
		nop     
		
		! Short Circuit LHS
		set     	sometest20, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.49
		nop     
		
		! (sometest20)&&(true)
		
		! Short Circuit RHS
		set     	1, %o0
		cmp     	%o0, %g0
		be      	.$$.andorSkip.49
		nop     
		ba      	.$$.andorEnd.49
		mov     	1, %o0
	.$$.andorSkip.49:
		mov     	0, %o0
	.$$.andorEnd.49:
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (((arith8)>(arith9))||((sometest23)&&(sometest27)))||((sometest20)&&(true))
		
		! Short Circuit RHS
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.48
		nop     
		ba      	.$$.andorEnd.48
		mov     	0, %o0
	.$$.andorSkip.48:
		mov     	1, %o0
	.$$.andorEnd.48:
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! Short Circuit LHS
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.50
		nop     
		
		! ((((arith8)>(arith9))||((sometest23)&&(sometest27)))||((sometest20)&&(true)))||(false)
		
		! Short Circuit RHS
		set     	0, %o0
		cmp     	%o0, %g0
		bne     	.$$.andorSkip.50
		nop     
		ba      	.$$.andorEnd.50
		mov     	0, %o0
	.$$.andorSkip.50:
		mov     	1, %o0
	.$$.andorEnd.50:
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sometest30 = ((((arith8)>(arith9))||((sometest23)&&(sometest27)))||((sometest20)&&(true)))||(false)
		set     	sometest30, %o1
		add     	%g0, %o1, %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.sometest30
	call    	.$.init.sometest30.fini
	nop     
	ret     
	restore 
	SAVE..$.init.sometest30 = -(92 + 24) & -8
	
.$.init.sometest30.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.sometest30
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	intVarCin
intVarCin:
	.word   	0
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	floatVarCin
floatVarCin:
	.single 	0r0.0
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	fito1
fito1:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.fito1:
	set     	SAVE..$.init.fito1, %g1
	save    	%sp, %g1, %sp
		
		! (0)*(floatVarCin)
		set     	0, %o0
		set     	-8, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	floatVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fmuls   	%f0, %f1, %f0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! fito1 = (0)*(floatVarCin)
		set     	fito1, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.fito1
	call    	.$.init.fito1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.fito1 = -(92 + 8) & -8
	
.$.init.fito1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.fito1
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	fito2
fito2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.fito2:
	set     	SAVE..$.init.fito2, %g1
	save    	%sp, %g1, %sp
		
		! (floatVarCin)*(0)
		set     	floatVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	0, %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		st      	%o1, [%l7]
		ld      	[%l7], %f1
		fitos   	%f1, %f1
		fmuls   	%f0, %f1, %f0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! fito2 = (floatVarCin)*(0)
		set     	fito2, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.fito2
	call    	.$.init.fito2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.fito2 = -(92 + 8) & -8
	
.$.init.fito2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.fito2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	fito3
fito3:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.fito3:
	set     	SAVE..$.init.fito3, %g1
	save    	%sp, %g1, %sp
		
		! (intVarCin)!=(floatVarCin)
		set     	intVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	-8, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	floatVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.58
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.58:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! fito3 = (intVarCin)!=(floatVarCin)
		set     	fito3, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.fito3
	call    	.$.init.fito3.fini
	nop     
	ret     
	restore 
	SAVE..$.init.fito3 = -(92 + 8) & -8
	
.$.init.fito3.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.fito3
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	fito4
fito4:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.fito4:
	set     	SAVE..$.init.fito4, %g1
	save    	%sp, %g1, %sp
		
		! (floatVarCin)>(intVarCin)
		set     	floatVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %f0
		set     	intVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		set     	-8, %l7
		add     	%fp, %l7, %l7
		st      	%o1, [%l7]
		ld      	[%l7], %f1
		fitos   	%f1, %f1
		fcmps   	%f0, %f1
		nop     
		fble    	.$$.cmp.59
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.59:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! fito4 = (floatVarCin)>(intVarCin)
		set     	fito4, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.fito4
	call    	.$.init.fito4.fini
	nop     
	ret     
	restore 
	SAVE..$.init.fito4 = -(92 + 8) & -8
	
.$.init.fito4.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.fito4
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	fito5
fito5:
	.single 	0r5.0
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	fito6
fito6:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.fito6:
	set     	SAVE..$.init.fito6, %g1
	save    	%sp, %g1, %sp
		
		! fito6 = intVarCin
		set     	fito6, %o1
		add     	%g0, %o1, %o1
		set     	intVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	-4, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.fito6
	call    	.$.init.fito6.fini
	nop     
	ret     
	restore 
	SAVE..$.init.fito6 = -(92 + 4) & -8
	
.$.init.fito6.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.fito6
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	fito7
fito7:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.fito7:
	set     	SAVE..$.init.fito7, %g1
	save    	%sp, %g1, %sp
		
		! (intVarCin)*(intVarCin)
		set     	intVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	intVarCin, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		call    	.mul
		nop     
		mov     	%o0, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! fito7 = (intVarCin)*(intVarCin)
		set     	fito7, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-8, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
	
	! End of function .$.init.fito7
	call    	.$.init.fito7.fini
	nop     
	ret     
	restore 
	SAVE..$.init.fito7 = -(92 + 8) & -8
	
.$.init.fito7.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.fito7
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	fito8
fito8:
	.single 	0r10.5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	fito9
fito9:
	.single 	0r5.0
	
	.section	".text"
	.align  	4
