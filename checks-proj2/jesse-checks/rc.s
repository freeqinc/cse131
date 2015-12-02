	
/*
 * Jesse Qin's CSE131 Compiler Generated Wed Dec 02 07:01:30 PST 2015
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
	
	.global 	someVal
someVal:
someVal.void:
	set     	SAVE.someVal.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return 5;
		set     	5, %i0
		call    	someVal.void.fini
		nop     
		ret     
		restore 
	
	! End of function someVal.void
	call    	someVal.void.fini
	nop     
	ret     
	restore 
	SAVE.someVal.void = -(92 + 0) & -8
	
someVal.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
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
MYS1.MYS1.bool:
	set     	SAVE.MYS1.MYS1.bool, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		
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
		
		! this.i = 10
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	10, %o0
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
		
		! this.f = 5.5
		set     	-8, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		
		.section	".rodata"
		.align  	4
	.$$.float.1:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.1, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! this.b
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	8, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.b = boop
		set     	-12, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function MYS1.MYS1.bool
	call    	MYS1.MYS1.bool.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.MYS1.bool = -(92 + 12) & -8
	
MYS1.MYS1.bool.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.MYS1.float:
	set     	SAVE.MYS1.MYS1.float, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%f1, [%fp+72]
		
		! this.f
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	4, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.f = floop
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
	
	! End of function MYS1.MYS1.float
	call    	MYS1.MYS1.float.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.MYS1.float = -(92 + 4) & -8
	
MYS1.MYS1.float.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.MYS1.int.float.bool:
	set     	SAVE.MYS1.MYS1.int.float.bool, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		st      	%f2, [%fp+76]
		st      	%i3, [%fp+80]
		
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
		
		! this.i = a
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
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
		
		! this.f = b
		set     	-8, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	76, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! this.b
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	8, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.b = c
		set     	-12, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	80, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function MYS1.MYS1.int.float.bool
	call    	MYS1.MYS1.int.float.bool.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.MYS1.int.float.bool = -(92 + 12) & -8
	
MYS1.MYS1.int.float.bool.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.$MYS1.void:
	set     	SAVE.MYS1.$MYS1.void, %g1
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
		
		! this.i = 0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	0, %o0
		st      	%o0, [%o1]
	
	! End of function MYS1.$MYS1.void
	call    	MYS1.$MYS1.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.$MYS1.void = -(92 + 4) & -8
	
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
MYS1.fun1.float:
	set     	SAVE.MYS1.fun1.float, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%f1, [%fp+72]
		
		! return f;
		set     	72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		call    	MYS1.fun1.float.fini
		nop     
		ret     
		restore 
	
	! End of function MYS1.fun1.float
	call    	MYS1.fun1.float.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.fun1.float = -(92 + 0) & -8
	
MYS1.fun1.float.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.fun2.void:
	set     	SAVE.MYS1.fun2.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! this.f
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	4, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return this.f;
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %f0
		call    	MYS1.fun2.void.fini
		nop     
		ret     
		restore 
	
	! End of function MYS1.fun2.void
	call    	MYS1.fun2.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.fun2.void = -(92 + 4) & -8
	
MYS1.fun2.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MYS1.fun3.void:
	set     	SAVE.MYS1.fun3.void, %g1
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
		
		! return this.i;
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %i0
		call    	MYS1.fun3.void.fini
		nop     
		ret     
		restore 
	
	! End of function MYS1.fun3.void
	call    	MYS1.fun3.void.fini
	nop     
	ret     
	restore 
	SAVE.MYS1.fun3.void = -(92 + 4) & -8
	
MYS1.fun3.void.fini:
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
	.global 	extraCreds
extraCreds:
extraCreds.void:
	set     	SAVE.extraCreds.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! new( x )
		mov     	1, %o0
		set     	4, %o1
		call    	calloc
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! y = x
		set     	-8, %o1
		add     	%fp, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! delete( x )
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%g0, [%o1]
		
		! delete( y )
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%g0, [%o1]
	
	! End of function extraCreds.void
	call    	extraCreds.void.fini
	nop     
	ret     
	restore 
	SAVE.extraCreds.void = -(92 + 8) & -8
	
extraCreds.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".data"
	.align  	4
	.global 	intVar
intVar:
	.word   	5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	floatVar
floatVar:
	.single 	0r5.5
	
	.section	".text"
	.align  	4
	
	.section	".data"
	.align  	4
	.global 	boolVar
boolVar:
	.word   	1
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	temptemp
temptemp:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.temptemp:
	set     	SAVE..$.init.temptemp, %g1
	save    	%sp, %g1, %sp
		
		! temptemp = intVar
		set     	temptemp, %o1
		add     	%g0, %o1, %o1
		set     	intVar, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.temptemp
	call    	.$.init.temptemp.fini
	nop     
	ret     
	restore 
	SAVE..$.init.temptemp = -(92 + 0) & -8
	
.$.init.temptemp.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.temptemp
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
	
	.section	".bss"
	.align  	4
	.global 	intPtr
intPtr:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	floatPtr
floatPtr:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	boolPtr
boolPtr:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
stintPtr:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
stfloatPtr:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
stboolPtr:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arr1
arr1:
	.skip   	20
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	arr2
arr2:
	.skip   	20
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	stru1
stru1:
	.skip   	16
	
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
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.1:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.1, %o0
		set     	stru1, %o1
		add     	%g0, %o1, %o1
		st      	%o1, [%o0]
	
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
	.global 	stoooooper
stoooooper:
	.skip   	80
	
	.section	".text"
	.align  	4
.$.init.stoooooper:
	set     	SAVE..$.init.stoooooper, %g1
	save    	%sp, %g1, %sp
		
		! stoooooper[0]
		set     	0, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	16, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	stoooooper, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stoooooper[0].MYS1(...)
		set     	-4, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.2:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.2, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		st      	%o1, [%o0]
		
		! stoooooper[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	16, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	stoooooper, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stoooooper[1].MYS1(...)
		set     	-8, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.3:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.3, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		st      	%o1, [%o0]
		
		! stoooooper[2]
		set     	2, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	16, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	stoooooper, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stoooooper[2].MYS1(...)
		set     	-12, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.4:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.4, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		st      	%o1, [%o0]
		
		! stoooooper[3]
		set     	3, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	16, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	stoooooper, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stoooooper[3].MYS1(...)
		set     	-16, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.5:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.5, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		st      	%o1, [%o0]
		
		! stoooooper[4]
		set     	4, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	16, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	stoooooper, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stoooooper[4].MYS1(...)
		set     	-20, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.6:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.6, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		st      	%o1, [%o0]
	
	! End of function .$.init.stoooooper
	call    	.$.init.stoooooper.fini
	nop     
	ret     
	restore 
	SAVE..$.init.stoooooper = -(92 + 20) & -8
	
.$.init.stoooooper.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.stoooooper
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	struPtr1
struPtr1:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	struPtr2
struPtr2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.struPtr2:
	set     	SAVE..$.init.struPtr2, %g1
	save    	%sp, %g1, %sp
		
		! &stru1
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr2 = &stru1
		set     	struPtr2, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.struPtr2
	call    	.$.init.struPtr2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.struPtr2 = -(92 + 4) & -8
	
.$.init.struPtr2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.struPtr2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	xtraTest
xtraTest:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.xtraTest:
	set     	SAVE..$.init.xtraTest, %g1
	save    	%sp, %g1, %sp
		
		! arr2[0]
		set     	0, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	arr2, %o0
		add     	%g0, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! xtraTest = arr2[0]
		set     	xtraTest, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.xtraTest
	call    	.$.init.xtraTest.fini
	nop     
	ret     
	restore 
	SAVE..$.init.xtraTest = -(92 + 4) & -8
	
.$.init.xtraTest.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.xtraTest
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	xtraTest2
xtraTest2:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.xtraTest2:
	set     	SAVE..$.init.xtraTest2, %g1
	save    	%sp, %g1, %sp
		
		! stru1.fun3(...)
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		call    	MYS1.fun3.void
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! xtraTest2 = fun3(...)
		set     	xtraTest2, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.xtraTest2
	call    	.$.init.xtraTest2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.xtraTest2 = -(92 + 4) & -8
	
.$.init.xtraTest2.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.xtraTest2
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	myPtr1
myPtr1:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.myPtr1:
	set     	SAVE..$.init.myPtr1, %g1
	save    	%sp, %g1, %sp
		
		! &intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! myPtr1 = &intVar
		set     	myPtr1, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.myPtr1
	call    	.$.init.myPtr1.fini
	nop     
	ret     
	restore 
	SAVE..$.init.myPtr1 = -(92 + 4) & -8
	
.$.init.myPtr1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.myPtr1
	nop     
	
	.section	".text"
	.align  	4
	.global 	checkers
checkers:
checkers.void:
	set     	SAVE.checkers.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! intVar = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! (intVar)-(10)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	10, %o1
		sub     	%o0, %o1, %o0
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arr[(intVar)-(10)]
		set     	-28, %l7
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
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (intVar)+(5)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	5, %o1
		add     	%o0, %o1, %o0
		set     	-36, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arr[(intVar)+(5)]
		set     	-36, %l7
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
		set     	-40, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *intPtr
		set     	-44, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-48, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *intPtr = 5
		set     	-48, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
	
	! End of function checkers.void
	call    	checkers.void.fini
	nop     
	ret     
	restore 
	SAVE.checkers.void = -(92 + 48) & -8
	
checkers.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	typeCasts
typeCasts:
typeCasts.void:
	set     	SAVE.typeCasts.void, %g1
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
	.$$.float.2:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.2, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! boolVar = true
		set     	-12, %o1
		add     	%fp, %o1, %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intVar
		set     	-20, %o1
		add     	%fp, %o1, %o1
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (int)boolVar
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.cmp.1
		mov     	%g0, %o0
		mov     	1, %o0
	.$$.cmp.1:
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test1 = (int)boolVar
		set     	-28, %o1
		add     	%fp, %o1, %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (float)boolVar
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.cmp.2
		mov     	%g0, %o0
		mov     	1, %o0
	.$$.cmp.2:
		set     	-36, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! test2 = (float)boolVar
		set     	-40, %o1
		add     	%fp, %o1, %o1
		set     	-32, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (int*)boolVar
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.cmp.3
		mov     	%g0, %o0
		mov     	1, %o0
	.$$.cmp.3:
		set     	-44, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test3 = (int*)boolVar
		set     	-48, %o1
		add     	%fp, %o1, %o1
		set     	-44, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (bool)intVar
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.cmp.4
		mov     	%g0, %o0
		mov     	1, %o0
	.$$.cmp.4:
		set     	-52, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test4 = (bool)intVar
		set     	-56, %o1
		add     	%fp, %o1, %o1
		set     	-52, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (bool)floatVar
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-64, %l7
		add     	%fp, %l7, %l7
		st      	%g0, [%l7]
		ld      	[%l7], %f1
		fitos   	%f1, %f1
		fcmps   	%f0, %f1
		nop     
		fbe     	.$$.cmp.5
		mov     	%g0, %o0
		mov     	1, %o0
	.$$.cmp.5:
		set     	-60, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test5 = (bool)floatVar
		set     	-68, %o1
		add     	%fp, %o1, %o1
		set     	-60, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (bool)intPtr
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.cmp.6
		mov     	%g0, %o0
		mov     	1, %o0
	.$$.cmp.6:
		set     	-72, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test6 = (bool)intPtr
		set     	-76, %o1
		add     	%fp, %o1, %o1
		set     	-72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (int)floatVar
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		fstoi   	%f0, %f0
		set     	-80, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! test7 = (int)floatVar
		set     	-84, %o1
		add     	%fp, %o1, %o1
		set     	-80, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (int*)floatVar
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		fstoi   	%f0, %f0
		set     	-88, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! test8 = (int*)floatVar
		set     	-92, %o1
		add     	%fp, %o1, %o1
		set     	-88, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (float)intVar
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-100, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	-96, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! test9 = (float)intVar
		set     	-104, %o1
		add     	%fp, %o1, %o1
		set     	-96, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (float)intPtr
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-112, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	-108, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! test10 = (float)intPtr
		set     	-116, %o1
		add     	%fp, %o1, %o1
		set     	-108, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (int)intPtr
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-120, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test11 = (int)intPtr
		set     	-124, %o1
		add     	%fp, %o1, %o1
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (int*)intVar
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-128, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test12 = (int*)intVar
		set     	-132, %o1
		add     	%fp, %o1, %o1
		set     	-128, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (int)intVar
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-136, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test13 = (int)intVar
		set     	-140, %o1
		add     	%fp, %o1, %o1
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (float)floatVar
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		set     	-144, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! test14 = (float)floatVar
		set     	-148, %o1
		add     	%fp, %o1, %o1
		set     	-144, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! (bool)boolVar
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.cmp.7
		mov     	%g0, %o0
		mov     	1, %o0
	.$$.cmp.7:
		set     	-152, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test15 = (bool)boolVar
		set     	-156, %o1
		add     	%fp, %o1, %o1
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (int*)intPtr
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-160, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! test16 = (int*)intPtr
		set     	-164, %o1
		add     	%fp, %o1, %o1
		set     	-160, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function typeCasts.void
	call    	typeCasts.void.fini
	nop     
	ret     
	restore 
	SAVE.typeCasts.void = -(92 + 164) & -8
	
typeCasts.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	someStructs
someStructs:
someStructs.void:
	set     	SAVE.someStructs.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! s1.MYS1(...)
		set     	-16, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.7:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.7, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! s2.MYS2(...)
		set     	-28, %o0
		add     	%fp, %o0, %o0
		call    	MYS2.MYS2.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.8:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.8, %o0
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! s3.MYS1(...)
		set     	-44, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.9:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.9, %o0
		set     	-44, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! return;
		call    	someStructs.void.fini
		nop     
		ret     
		restore 
		
		! s4.MYS2(...)
		set     	-56, %o0
		add     	%fp, %o0, %o0
		call    	MYS2.MYS2.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.10:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.10, %o0
		set     	-56, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! &s1
		set     	-16, %o0
		add     	%fp, %o0, %o0
		set     	-60, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! sptr1 = &s1
		set     	-64, %o1
		add     	%fp, %o1, %o1
		set     	-60, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *sptr1
		set     	-64, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *sptr1.~MYS1(...)
		set     	-68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.$MYS1.void
		nop     
		
		! delete( sptr1 )
		set     	-64, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-64, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	-64, %o1
		add     	%fp, %o1, %o1
		st      	%g0, [%o1]
	
	! End of function someStructs.void
	call    	someStructs.void.fini
	nop     
	ret     
	restore 
	SAVE.someStructs.void = -(92 + 68) & -8
	
someStructs.void.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.10, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.10.fini.skip
	nop     
	call    	MYS2.$MYS2.void
	nop     
	set     	.$$.ctorDtor.10, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.10.fini.skip:
	set     	.$$.ctorDtor.9, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.9.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.9, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.9.fini.skip:
	set     	.$$.ctorDtor.8, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.8.fini.skip
	nop     
	call    	MYS2.$MYS2.void
	nop     
	set     	.$$.ctorDtor.8, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.8.fini.skip:
	set     	.$$.ctorDtor.7, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.7.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.7, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.7.fini.skip:
	ret     
	restore 
	
	.section	".data"
	.align  	4
statA:
	.word   	5
	
	.section	".text"
	.align  	4
	.global 	staticjesus
staticjesus:
staticjesus.void:
	set     	SAVE.staticjesus.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! intVar = 10
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	10, %o0
		st      	%o0, [%o1]
		
		! myStruct.MYS1(...)
		set     	-20, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.11:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.11, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		.section	".data"
		.align  	4
	staticjesus.void.statA:
		.word   	10
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	staticjesus.void.statB:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	staticjesus.void.statC:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statC:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statC, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statC.done
		nop     
		
		! statC = intVar
		set     	staticjesus.void.statC, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! End init guard
		set     	.$.init.staticjesus.void.statC, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statC.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statC_2:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statC_2:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statC_2, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statC_2.done
		nop     
			
			! (intVar)+(intVar)
			set     	-4, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			set     	-4, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o1
			add     	%o0, %o1, %o0
			set     	-24, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
		
		! statC_2 = (intVar)+(intVar)
		set     	staticjesus.void.statC_2, %o1
		add     	%g0, %o1, %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! End init guard
		set     	.$.init.staticjesus.void.statC_2, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statC_2.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statC_3:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statC_3:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statC_3, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statC_3.done
		nop     
			
			! someVal(...)
			call    	someVal.void
			nop     
			set     	-28, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
		
		! statC_3 = someVal(...)
		set     	staticjesus.void.statC_3, %o1
		add     	%g0, %o1, %o1
		set     	-28, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! End init guard
		set     	.$.init.staticjesus.void.statC_3, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statC_3.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statD:
		.skip   	20
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	staticjesus.void.statE:
		.skip   	16
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statE:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statE, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statE.done
		nop     
			
			! statE.MYS1(...)
			set     	staticjesus.void.statE, %o0
			add     	%g0, %o0, %o0
			call    	MYS1.MYS1.void
			nop     
			
			.section	".bss"
			.align  	4
		.$$.ctorDtor.12:
			.skip   	4
			
			.section	".text"
			.align  	4
			
			set     	.$$.ctorDtor.12, %o0
			set     	staticjesus.void.statE, %o1
			add     	%g0, %o1, %o1
			st      	%o1, [%o0]
		
		! End init guard
		set     	.$.init.staticjesus.void.statE, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statE.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statF:
		.skip   	16
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statF:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statF, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statF.done
		nop     
			
			! statF.MYS1(...)
			set     	staticjesus.void.statF, %o0
			add     	%g0, %o0, %o0
			call    	MYS1.MYS1.void
			nop     
			
			.section	".bss"
			.align  	4
		.$$.ctorDtor.13:
			.skip   	4
			
			.section	".text"
			.align  	4
			
			set     	.$$.ctorDtor.13, %o0
			set     	staticjesus.void.statF, %o1
			add     	%g0, %o1, %o1
			st      	%o1, [%o0]
		
		! End init guard
		set     	.$.init.staticjesus.void.statF, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statF.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statF_1:
		.skip   	16
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statF_1:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statF_1, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statF_1.done
		nop     
			
			! statF_1.MYS1(...)
			set     	staticjesus.void.statF_1, %o0
			add     	%g0, %o0, %o0
			! a <- 5
			set     	5, %o1
			! b <- 5.5
			
			.section	".rodata"
			.align  	4
		.$$.float.3:
			.single 	0r5.5
			
			.section	".text"
			.align  	4
			set     	.$$.float.3, %l7
			ld      	[%l7], %f2
			! c <- true
			set     	1, %o3
			call    	MYS1.MYS1.int.float.bool
			nop     
			
			.section	".bss"
			.align  	4
		.$$.ctorDtor.14:
			.skip   	4
			
			.section	".text"
			.align  	4
			
			set     	.$$.ctorDtor.14, %o0
			set     	staticjesus.void.statF_1, %o1
			add     	%g0, %o1, %o1
			st      	%o1, [%o0]
		
		! End init guard
		set     	.$.init.staticjesus.void.statF_1, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statF_1.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statG:
		.skip   	32
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statG:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statG, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statG.done
		nop     
			
			! statG[0]
			set     	0, %o0
			set     	2, %o1
			call    	.$$.arrCheck
			nop     
			set     	16, %o1
			call    	.mul
			nop     
			mov     	%o0, %o1
			set     	staticjesus.void.statG, %o0
			add     	%g0, %o0, %o0
			call    	.$$.ptrCheck
			nop     
			add     	%o0, %o1, %o0
			set     	-32, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! statG[0].MYS1(...)
			set     	-32, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			call    	MYS1.MYS1.void
			nop     
			
			.section	".bss"
			.align  	4
		.$$.ctorDtor.15:
			.skip   	4
			
			.section	".text"
			.align  	4
			
			set     	.$$.ctorDtor.15, %o0
			set     	-32, %o1
			add     	%fp, %o1, %o1
			ld      	[%o1], %o1
			st      	%o1, [%o0]
			
			! statG[1]
			set     	1, %o0
			set     	2, %o1
			call    	.$$.arrCheck
			nop     
			set     	16, %o1
			call    	.mul
			nop     
			mov     	%o0, %o1
			set     	staticjesus.void.statG, %o0
			add     	%g0, %o0, %o0
			call    	.$$.ptrCheck
			nop     
			add     	%o0, %o1, %o0
			set     	-36, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! statG[1].MYS1(...)
			set     	-36, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			call    	MYS1.MYS1.void
			nop     
			
			.section	".bss"
			.align  	4
		.$$.ctorDtor.16:
			.skip   	4
			
			.section	".text"
			.align  	4
			
			set     	.$$.ctorDtor.16, %o0
			set     	-36, %o1
			add     	%fp, %o1, %o1
			ld      	[%o1], %o1
			st      	%o1, [%o0]
		
		! End init guard
		set     	.$.init.staticjesus.void.statG, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statG.done:
		
		! statG_2[0]
		set     	0, %o0
		set     	2, %o1
		call    	.$$.arrCheck
		nop     
		set     	16, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-68, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-72, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! statG_2[0].MYS1(...)
		set     	-72, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.17:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.17, %o0
		set     	-72, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		st      	%o1, [%o0]
		
		! statG_2[1]
		set     	1, %o0
		set     	2, %o1
		call    	.$$.arrCheck
		nop     
		set     	16, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-68, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-76, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! statG_2[1].MYS1(...)
		set     	-76, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.18:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.18, %o0
		set     	-76, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		st      	%o1, [%o0]
		
		.section	".bss"
		.align  	4
	staticjesus.void.statH:
		.skip   	16
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statH:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statH, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statH.done
		nop     
			
			! statH[0]
			set     	0, %o0
			set     	1, %o1
			call    	.$$.arrCheck
			nop     
			set     	16, %o1
			call    	.mul
			nop     
			mov     	%o0, %o1
			set     	staticjesus.void.statH, %o0
			add     	%g0, %o0, %o0
			call    	.$$.ptrCheck
			nop     
			add     	%o0, %o1, %o0
			set     	-80, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! statH[0].MYS1(...)
			set     	-80, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			! a <- 5
			set     	5, %o1
			! b <- 5.5
			
			.section	".rodata"
			.align  	4
		.$$.float.4:
			.single 	0r5.5
			
			.section	".text"
			.align  	4
			set     	.$$.float.4, %l7
			ld      	[%l7], %f2
			! c <- true
			set     	1, %o3
			call    	MYS1.MYS1.int.float.bool
			nop     
			
			.section	".bss"
			.align  	4
		.$$.ctorDtor.19:
			.skip   	4
			
			.section	".text"
			.align  	4
			
			set     	.$$.ctorDtor.19, %o0
			set     	-80, %o1
			add     	%fp, %o1, %o1
			ld      	[%o1], %o1
			st      	%o1, [%o0]
		
		! End init guard
		set     	.$.init.staticjesus.void.statH, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statH.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statI:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statI:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statI, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statI.done
		nop     
			
			! &intVar
			set     	-4, %o0
			add     	%fp, %o0, %o0
			set     	-84, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
		
		! statI = &intVar
		set     	staticjesus.void.statI, %o1
		add     	%g0, %o1, %o1
		set     	-84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! End init guard
		set     	.$.init.staticjesus.void.statI, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statI.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statJ:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statJ:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statJ, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statJ.done
		nop     
			
			! *myPtr1
			set     	myPtr1, %l7
			add     	%g0, %l7, %l7
			ld      	[%l7], %o0
			call    	.$$.ptrCheck
			nop     
			set     	-88, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
		
		! statJ = *myPtr1
		set     	staticjesus.void.statJ, %o1
		add     	%g0, %o1, %o1
		set     	-88, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! End init guard
		set     	.$.init.staticjesus.void.statJ, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statJ.done:
		
		.section	".bss"
		.align  	4
	staticjesus.void.statK:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.staticjesus.void.statK:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.staticjesus.void.statK, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.staticjesus.void.statK.done
		nop     
			
			! *struPtr2
			set     	struPtr2, %l7
			add     	%g0, %l7, %l7
			ld      	[%l7], %o0
			call    	.$$.ptrCheck
			nop     
			set     	-92, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! *struPtr2.fun3(...)
			set     	-92, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			call    	MYS1.fun3.void
			nop     
			set     	-96, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
		
		! statK = fun3(...)
		set     	staticjesus.void.statK, %o1
		add     	%g0, %o1, %o1
		set     	-96, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! End init guard
		set     	.$.init.staticjesus.void.statK, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.staticjesus.void.statK.done:
		
		! (statA)+(statB)
		set     	staticjesus.void.statA, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	staticjesus.void.statB, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-100, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! temp = (statA)+(statB)
		set     	-104, %o1
		add     	%fp, %o1, %o1
		set     	-100, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! statA = 50
		set     	staticjesus.void.statA, %o1
		add     	%g0, %o1, %o1
		set     	50, %o0
		st      	%o0, [%o1]
		
		! statB = 500
		set     	staticjesus.void.statB, %o1
		add     	%g0, %o1, %o1
		set     	500, %o0
		st      	%o0, [%o1]
		
		! &statA
		set     	staticjesus.void.statA, %o0
		add     	%g0, %o0, %o0
		set     	-108, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr = &statA
		set     	-112, %o1
		add     	%fp, %o1, %o1
		set     	-108, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &statB
		set     	staticjesus.void.statB, %o0
		add     	%g0, %o0, %o0
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr = &statB
		set     	-112, %o1
		add     	%fp, %o1, %o1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function staticjesus.void
	call    	staticjesus.void.fini
	nop     
	ret     
	restore 
	SAVE.staticjesus.void = -(92 + 116) & -8
	
staticjesus.void.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.18, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.18.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.18, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.18.fini.skip:
	set     	.$$.ctorDtor.17, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.17.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.17, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.17.fini.skip:
	set     	.$$.ctorDtor.11, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.11.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.11, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.11.fini.skip:
	ret     
	restore 
	.global 	func1
func1:
func1.int$5$:
	set     	SAVE.func1.int$5$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! arr[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arr[1] = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
	
	! End of function func1.int$5$
	call    	func1.int$5$.fini
	nop     
	ret     
	restore 
	SAVE.func1.int$5$ = -(92 + 4) & -8
	
func1.int$5$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func2
func2:
func2.MYS1:
	set     	SAVE.func2.MYS1, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! struParam.i
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struParam.i = 69
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	69, %o0
		st      	%o0, [%o1]
		
		! struParam.fun3(...)
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.fun3.void
		nop     
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
	
	! End of function func2.MYS1
	call    	func2.MYS1.fini
	nop     
	ret     
	restore 
	SAVE.func2.MYS1 = -(92 + 8) & -8
	
func2.MYS1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func3
func3:
func3.int.float.bool:
	set     	SAVE.func3.int.float.bool, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		st      	%i2, [%fp+76]
		
		! a = 69
		set     	68, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	69, %o0
		st      	%o0, [%o1]
		
		! b = a
		set     	72, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		set     	-4, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! c = false
		set     	76, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	0, %o0
		st      	%o0, [%o1]
	
	! End of function func3.int.float.bool
	call    	func3.int.float.bool.fini
	nop     
	ret     
	restore 
	SAVE.func3.int.float.bool = -(92 + 4) & -8
	
func3.int.float.bool.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func4
func4:
func4.int$.float$.bool$.int$$5$.MYS1$:
	set     	SAVE.func4.int$.float$.bool$.int$$5$.MYS1$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		st      	%i2, [%fp+76]
		st      	%i3, [%fp+80]
		st      	%i4, [%fp+84]
		
		! *a
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *a = 6969
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	6969, %o0
		st      	%o0, [%o1]
		
		! *b
		set     	72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *a
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *b = *a
		set     	-8, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		set     	-16, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		st      	%f0, [%o1]
		
		! *c
		set     	76, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *c = true
		set     	-20, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! foreach ( ... )
		! traversal ptr = --array
		set     	80, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	4, %o1
		sub     	%o0, %o1, %o0
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
	.$$.loopCheck.1:
			! ++traversal ptr
			set     	-28, %o1
			add     	%fp, %o1, %o1
			ld      	[%o1], %o0
			set     	4, %o2
			add     	%o0, %o2, %o0
			st      	%o0, [%o1]
			! traversal ptr < array end addr?
			set     	80, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			set     	20, %o1
			add     	%o0, %o1, %o1
			set     	-28, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			cmp     	%o0, %o1
			bge     	.$$.loopEnd.1
			nop     
			! iterVar = currentElem
			set     	-24, %o1
			add     	%fp, %o1, %o1
			ld      	[%o0], %o0
			st      	%o0, [%o1]
			
			! Start of loop body
				
				! ptr = a
				set     	-24, %o1
				add     	%fp, %o1, %o1
				set     	68, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				st      	%o0, [%o1]
			
			! End of loop body
			ba      	.$$.loopCheck.1
			nop     
		.$$.loopEnd.1:
		
		! *struPtr
		set     	84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr.fun2(...)
		set     	-32, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.fun2.void
		nop     
		set     	-36, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! new( struPtr )
		mov     	1, %o0
		set     	16, %o1
		call    	calloc
		nop     
		set     	84, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr
		set     	84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-40, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr.MYS1(...)
		set     	-40, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		! *struPtr
		set     	84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-44, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr.~MYS1(...)
		set     	-44, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.$MYS1.void
		nop     
		
		! delete( struPtr )
		set     	84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	84, %o1
		add     	%fp, %o1, %o1
		st      	%g0, [%o1]
	
	! End of function func4.int$.float$.bool$.int$$5$.MYS1$
	call    	func4.int$.float$.bool$.int$$5$.MYS1$.fini
	nop     
	ret     
	restore 
	SAVE.func4.int$.float$.bool$.int$$5$.MYS1$ = -(92 + 44) & -8
	
func4.int$.float$.bool$.int$$5$.MYS1$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func5
func5:
func5.int$.float$.bool$.MYS1$:
	set     	SAVE.func5.int$.float$.bool$.MYS1$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		st      	%i2, [%fp+76]
		st      	%i3, [%fp+80]
		
		.section	".rodata"
		.align  	4
	.$$.str.1:
		.asciz  	"asdf "
		
		.section	".text"
		.align  	4
		! cout << "asdf "
		set     	.$$.strFmt, %o0
		set     	.$$.str.1, %o1
		call    	printf
		nop     
		
		! *struPtr
		set     	80, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr.fun3(...)
		set     	-4, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.fun3.void
		nop     
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! cout << fun3(...)
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! &intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! a = &intVar
		set     	68, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &floatVar
		set     	floatVar, %o0
		add     	%g0, %o0, %o0
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! b = &floatVar
		set     	72, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &boolVar
		set     	boolVar, %o0
		add     	%g0, %o0, %o0
		set     	-20, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! c = &boolVar
		set     	76, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-20, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru1
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr = &stru1
		set     	80, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-24, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! struPtr = struPtr1
		set     	80, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	struPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function func5.int$.float$.bool$.MYS1$
	call    	func5.int$.float$.bool$.MYS1$.fini
	nop     
	ret     
	restore 
	SAVE.func5.int$.float$.bool$.MYS1$ = -(92 + 24) & -8
	
func5.int$.float$.bool$.MYS1$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func5_1
func5_1:
func5_1.void:
	set     	SAVE.func5_1.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return 5;
		set     	5, %i0
		set     	-12, %l7
		add     	%fp, %l7, %l7
		st      	%i0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		call    	func5_1.void.fini
		nop     
		ret     
		restore 
	
	! End of function func5_1.void
	call    	func5_1.void.fini
	nop     
	ret     
	restore 
	SAVE.func5_1.void = -(92 + 12) & -8
	
func5_1.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func6
func6:
func6.int$:
	set     	SAVE.func6.int$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! ptr = a
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! return ptr;
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	func6.int$.fini
		nop     
		ret     
		restore 
	
	! End of function func6.int$
	call    	func6.int$.fini
	nop     
	ret     
	restore 
	SAVE.func6.int$ = -(92 + 4) & -8
	
func6.int$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func6.float$:
	set     	SAVE.func6.float$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! ptr = a
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! return ptr;
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	func6.float$.fini
		nop     
		ret     
		restore 
	
	! End of function func6.float$
	call    	func6.float$.fini
	nop     
	ret     
	restore 
	SAVE.func6.float$ = -(92 + 4) & -8
	
func6.float$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func6.bool$:
	set     	SAVE.func6.bool$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! ptr = a
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! return ptr;
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	func6.bool$.fini
		nop     
		ret     
		restore 
	
	! End of function func6.bool$
	call    	func6.bool$.fini
	nop     
	ret     
	restore 
	SAVE.func6.bool$ = -(92 + 4) & -8
	
func6.bool$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func6.MYS1$:
	set     	SAVE.func6.MYS1$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! ptr = a
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! return ptr;
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %i0
		call    	func6.MYS1$.fini
		nop     
		ret     
		restore 
	
	! End of function func6.MYS1$
	call    	func6.MYS1$.fini
	nop     
	ret     
	restore 
	SAVE.func6.MYS1$ = -(92 + 4) & -8
	
func6.MYS1$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func7
func7:
func7.int$:
	set     	SAVE.func7.int$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! *ptr
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return *ptr;
		set     	-4, %i0
		add     	%fp, %i0, %i0
		ld      	[%i0], %i0
		call    	func7.int$.fini
		nop     
		ret     
		restore 
	
	! End of function func7.int$
	call    	func7.int$.fini
	nop     
	ret     
	restore 
	SAVE.func7.int$ = -(92 + 4) & -8
	
func7.int$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func7.int:
	set     	SAVE.func7.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! return a;
		set     	68, %i0
		add     	%fp, %i0, %i0
		ld      	[%i0], %i0
		call    	func7.int.fini
		nop     
		ret     
		restore 
	
	! End of function func7.int
	call    	func7.int.fini
	nop     
	ret     
	restore 
	SAVE.func7.int = -(92 + 0) & -8
	
func7.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func7.int$.float:
	set     	SAVE.func7.int$.float, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%f1, [%fp+72]
		
		! *intPtr
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return *intPtr;
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %i0
		call    	func7.int$.float.fini
		nop     
		ret     
		restore 
	
	! End of function func7.int$.float
	call    	func7.int$.float.fini
	nop     
	ret     
	restore 
	SAVE.func7.int$.float = -(92 + 4) & -8
	
func7.int$.float.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func7.void:
	set     	SAVE.func7.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! return intVar;
		set     	intVar, %i0
		add     	%g0, %i0, %i0
		call    	func7.void.fini
		nop     
		ret     
		restore 
	
	! End of function func7.void
	call    	func7.void.fini
	nop     
	ret     
	restore 
	SAVE.func7.void = -(92 + 0) & -8
	
func7.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func7.float:
	set     	SAVE.func7.float, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! return f;
		set     	68, %i0
		add     	%fp, %i0, %i0
		ld      	[%i0], %i0
		call    	func7.float.fini
		nop     
		ret     
		restore 
	
	! End of function func7.float
	call    	func7.float.fini
	nop     
	ret     
	restore 
	SAVE.func7.float = -(92 + 0) & -8
	
func7.float.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func7.MYS1:
	set     	SAVE.func7.MYS1, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! return a;
		set     	68, %i0
		add     	%fp, %i0, %i0
		ld      	[%i0], %i0
		call    	func7.MYS1.fini
		nop     
		ret     
		restore 
	
	! End of function func7.MYS1
	call    	func7.MYS1.fini
	nop     
	ret     
	restore 
	SAVE.func7.MYS1 = -(92 + 0) & -8
	
func7.MYS1.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func7.MYS1$:
	set     	SAVE.func7.MYS1$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! *a
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return *a;
		set     	-4, %i0
		add     	%fp, %i0, %i0
		ld      	[%i0], %i0
		call    	func7.MYS1$.fini
		nop     
		ret     
		restore 
	
	! End of function func7.MYS1$
	call    	func7.MYS1$.fini
	nop     
	ret     
	restore 
	SAVE.func7.MYS1$ = -(92 + 4) & -8
	
func7.MYS1$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	func8
func8:
func8.int$:
	set     	SAVE.func8.int$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! return ptr;
		set     	68, %i0
		add     	%fp, %i0, %i0
		call    	func8.int$.fini
		nop     
		ret     
		restore 
	
	! End of function func8.int$
	call    	func8.int$.fini
	nop     
	ret     
	restore 
	SAVE.func8.int$ = -(92 + 0) & -8
	
func8.int$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
func8.int$$:
	set     	SAVE.func8.int$$, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! *ptr
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! return *ptr;
		set     	-4, %i0
		add     	%fp, %i0, %i0
		ld      	[%i0], %i0
		call    	func8.int$$.fini
		nop     
		ret     
		restore 
	
	! End of function func8.int$$
	call    	func8.int$$.fini
	nop     
	ret     
	restore 
	SAVE.func8.int$$ = -(92 + 4) & -8
	
func8.int$$.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	passbyjesus
passbyjesus:
passbyjesus.void:
	set     	SAVE.passbyjesus.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! arr[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-20, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-24, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arr[1] = 3
		set     	-24, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	3, %o0
		st      	%o0, [%o1]
		
		! func1(...)
		! arr <- arr
		set     	-20, %o0
		add     	%fp, %o0, %o0
		call    	func1.int$5$
		nop     
		
		! arr[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-20, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-28, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! cout << arr[1]
		set     	-28, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! stru1.MYS1(...)
		set     	-44, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.20:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.20, %o0
		set     	-44, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! func2(...)
		! struParam <- stru1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		call    	func2.MYS1
		nop     
		
		! stru1.i
		set     	-44, %o0
		add     	%fp, %o0, %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-48, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! cout << stru1.i
		set     	-48, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! func3(...)
		! a <- a
		set     	-52, %o0
		add     	%fp, %o0, %o0
		! b <- b
		set     	-56, %o1
		add     	%fp, %o1, %o1
		! c <- c
		set     	-60, %o2
		add     	%fp, %o2, %o2
		call    	func3.int.float.bool
		nop     
		
		! cout << a
		set     	-52, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.2:
		.asciz  	" "
		
		.section	".text"
		.align  	4
		! cout << " "
		set     	.$$.strFmt, %o0
		set     	.$$.str.2, %o1
		call    	printf
		nop     
		
		! cout << b
		set     	-56, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		call    	printFloat
		nop     
		
		.section	".rodata"
		.align  	4
	.$$.str.3:
		.asciz  	" "
		
		.section	".text"
		.align  	4
		! cout << " "
		set     	.$$.strFmt, %o0
		set     	.$$.str.3, %o1
		call    	printf
		nop     
		
		! cout << c
		set     	-60, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.printBool
		nop     
		
		! cout << endl
		set     	.$$.strEndl, %o0
		call    	printf
		nop     
		
		! &a
		set     	-52, %o0
		add     	%fp, %o0, %o0
		set     	-64, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &a
		set     	-68, %o1
		add     	%fp, %o1, %o1
		set     	-64, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &b
		set     	-56, %o0
		add     	%fp, %o0, %o0
		set     	-72, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! floatPtr = &b
		set     	-76, %o1
		add     	%fp, %o1, %o1
		set     	-72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &c
		set     	-60, %o0
		add     	%fp, %o0, %o0
		set     	-80, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! boolPtr = &c
		set     	-84, %o1
		add     	%fp, %o1, %o1
		set     	-80, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		set     	-108, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr = &stru1
		set     	-112, %o1
		add     	%fp, %o1, %o1
		set     	-108, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! func4(...)
		! a <- intPtr
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		! b <- floatPtr
		set     	-76, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		! c <- boolPtr
		set     	-84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o2
		! arr <- ptrArr
		set     	-104, %o3
		add     	%fp, %o3, %o3
		! struPtr <- struPtr
		set     	-112, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o4
		call    	func4.int$.float$.bool$.int$$5$.MYS1$
		nop     
		
		! &a
		set     	-52, %o0
		add     	%fp, %o0, %o0
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! &b
		set     	-56, %o0
		add     	%fp, %o0, %o0
		set     	-120, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! &c
		set     	-60, %o0
		add     	%fp, %o0, %o0
		set     	-124, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! &stru1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		set     	-128, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func4(...)
		! a <- &a
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		! b <- &b
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		! c <- &c
		set     	-124, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o2
		! arr <- ptrArr
		set     	-104, %o3
		add     	%fp, %o3, %o3
		! struPtr <- &stru1
		set     	-128, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o4
		call    	func4.int$.float$.bool$.int$$5$.MYS1$
		nop     
		
		! func5(...)
		! a <- intPtr
		set     	-68, %o0
		add     	%fp, %o0, %o0
		! b <- floatPtr
		set     	-76, %o1
		add     	%fp, %o1, %o1
		! c <- boolPtr
		set     	-84, %o2
		add     	%fp, %o2, %o2
		! struPtr <- struPtr
		set     	-112, %o3
		add     	%fp, %o3, %o3
		call    	func5.int$.float$.bool$.MYS1$
		nop     
		
		! func7(...)
		! a <- intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		call    	func7.int
		nop     
		set     	-132, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func7(...) = 5
		set     	-132, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! func7(...)
		! ptr <- intPtr
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func7.int$
		nop     
		set     	-136, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func7(...) = 10
		set     	-136, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	10, %o0
		st      	%o0, [%o1]
		
		! func7(...)
		! a <- intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		call    	func7.int
		nop     
		set     	-140, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (func7(...))+(10)
		set     	-140, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		set     	10, %o1
		add     	%o0, %o1, %o0
		set     	-144, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intVar = (func7(...))+(10)
		set     	intVar, %o1
		add     	%g0, %o1, %o1
		set     	-144, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! func7(...)
		! a <- intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		call    	func7.int
		nop     
		set     	-148, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func7(...) = 15
		set     	-148, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	15, %o0
		st      	%o0, [%o1]
		
		! func7(...)
		! a <- stru1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		call    	func7.MYS1
		nop     
		set     	-164, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func7(...) = stru1
		set     	-164, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	-44, %o1
		add     	%fp, %o1, %o1
		set     	16, %o2
		call    	memmove
		nop     
		
		! &stru1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		set     	-168, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr = &stru1
		set     	-112, %o1
		add     	%fp, %o1, %o1
		set     	-168, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! func7(...)
		! a <- struPtr
		set     	-112, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func7.MYS1$
		nop     
		set     	-184, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func7(...) = stru1
		set     	-184, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	-44, %o1
		add     	%fp, %o1, %o1
		set     	16, %o2
		call    	memmove
		nop     
		
		! func8(...)
		! ptr <- intPtr
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func8.int$
		nop     
		set     	-188, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! &intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		set     	-192, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func8(...) = &intVar
		set     	-188, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-192, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &a
		set     	-52, %o0
		add     	%fp, %o0, %o0
		set     	-196, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- &a
		set     	-196, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.int$
		nop     
		set     	-200, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = func6(...)
		set     	-68, %o1
		add     	%fp, %o1, %o1
		set     	-200, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- intPtr
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.int$
		nop     
		set     	-204, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = func6(...)
		set     	-68, %o1
		add     	%fp, %o1, %o1
		set     	-204, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &b
		set     	-56, %o0
		add     	%fp, %o0, %o0
		set     	-208, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- &b
		set     	-208, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.float$
		nop     
		set     	-212, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! floatPtr = func6(...)
		set     	-76, %o1
		add     	%fp, %o1, %o1
		set     	-212, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- floatPtr
		set     	-76, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.float$
		nop     
		set     	-216, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! floatPtr = func6(...)
		set     	-76, %o1
		add     	%fp, %o1, %o1
		set     	-216, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &c
		set     	-60, %o0
		add     	%fp, %o0, %o0
		set     	-220, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- &c
		set     	-220, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.bool$
		nop     
		set     	-224, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! boolPtr = func6(...)
		set     	-84, %o1
		add     	%fp, %o1, %o1
		set     	-224, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- boolPtr
		set     	-84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.bool$
		nop     
		set     	-228, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! boolPtr = func6(...)
		set     	-84, %o1
		add     	%fp, %o1, %o1
		set     	-228, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		set     	-232, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- &stru1
		set     	-232, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.MYS1$
		nop     
		set     	-236, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr = func6(...)
		set     	-112, %o1
		add     	%fp, %o1, %o1
		set     	-236, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! func6(...)
		! a <- struPtr
		set     	-112, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	func6.MYS1$
		nop     
		set     	-240, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr = func6(...)
		set     	-112, %o1
		add     	%fp, %o1, %o1
		set     	-240, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function passbyjesus.void
	call    	passbyjesus.void.fini
	nop     
	ret     
	restore 
	SAVE.passbyjesus.void = -(92 + 240) & -8
	
passbyjesus.void.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.20, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.20.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.20, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.20.fini.skip:
	ret     
	restore 
	.global 	heapjesus
heapjesus:
heapjesus.void:
	set     	SAVE.heapjesus.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! new( ptr1 )
		mov     	1, %o0
		set     	4, %o1
		call    	calloc
		nop     
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *ptr1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *ptr1 = 10
		set     	-8, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	10, %o0
		st      	%o0, [%o1]
	
	! End of function heapjesus.void
	call    	heapjesus.void.fini
	nop     
	ret     
	restore 
	SAVE.heapjesus.void = -(92 + 8) & -8
	
heapjesus.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! passbyjesus(...)
		call    	passbyjesus.void
		nop     
		
		! heapjesus(...)
		call    	heapjesus.void
		nop     
		
		! staticjesus(...)
		call    	staticjesus.void
		nop     
		
		! someStructs(...)
		call    	someStructs.void
		nop     
		
		! typeCasts(...)
		call    	typeCasts.void
		nop     
		
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
	.$$.float.5:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.5, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! boolVar = true
		set     	-12, %o1
		add     	%fp, %o1, %o1
		set     	1, %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intVar
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! arr[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-72, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! arr[1] = intPtr
		set     	-72, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! arr[1]
		set     	1, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-44, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-76, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *arr[1]
		set     	-76, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-80, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *arr[1] = 5
		set     	-80, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! stru2.MYS1(...)
		set     	-96, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.21:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.21, %o0
		set     	-96, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! stru3.MYS1(...)
		set     	-112, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.22:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.22, %o0
		set     	-112, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! struPtr1 = struPtr2
		set     	-116, %o1
		add     	%fp, %o1, %o1
		set     	struPtr2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru1
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		set     	-120, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr1 = &stru1
		set     	-116, %o1
		add     	%fp, %o1, %o1
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru2
		set     	-96, %o0
		add     	%fp, %o0, %o0
		set     	-124, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr1 = &stru2
		set     	-116, %o1
		add     	%fp, %o1, %o1
		set     	-124, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru1
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		set     	-128, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr1 = &stru1
		set     	-116, %o1
		add     	%fp, %o1, %o1
		set     	-128, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-132, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! stru2 = *struPtr1
		set     	-96, %o0
		add     	%fp, %o0, %o0
		set     	-132, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	16, %o2
		call    	memmove
		nop     
		
		! *struPtr2
		set     	struPtr2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-136, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-140, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr2 = *struPtr1
		set     	-136, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	-140, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	16, %o2
		call    	memmove
		nop     
		
		! &stru3
		set     	-112, %o0
		add     	%fp, %o0, %o0
		set     	-144, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr2 = &stru3
		set     	struPtr2, %o1
		add     	%g0, %o1, %o1
		set     	-144, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-148, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.i
		set     	-148, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-152, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.i = 5
		set     	-152, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-156, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.i
		set     	-156, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-160, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.i = 0
		set     	-160, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-164, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.fun3(...)
		set     	-164, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.fun3.void
		nop     
		set     	-168, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (5)+(fun3(...))
		set     	5, %o0
		set     	-168, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-172, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! strupper = (5)+(fun3(...))
		set     	-176, %o1
		add     	%fp, %o1, %o1
		set     	-172, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-180, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.fun1(...)
		set     	-180, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		! f <- 5.5
		
		.section	".rodata"
		.align  	4
	.$$.float.6:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.6, %l7
		ld      	[%l7], %f1
		call    	MYS1.fun1.float
		nop     
		set     	-184, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! (5)+(fun1(...))
		set     	5, %o0
		set     	-192, %l7
		add     	%fp, %l7, %l7
		st      	%o0, [%l7]
		ld      	[%l7], %f0
		fitos   	%f0, %f0
		set     	-184, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f1
		fadds   	%f0, %f1, %f0
		set     	-188, %o1
		add     	%fp, %o1, %o1
		st      	%f0, [%o1]
		
		! strupper2 = (5)+(fun1(...))
		set     	-196, %o1
		add     	%fp, %o1, %o1
		set     	-188, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %f0
		st      	%f0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-200, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.~MYS1(...)
		set     	-200, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.$MYS1.void
		nop     
		
		! delete( struPtr1 )
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%g0, [%o1]
		
		! new( intPtr )
		mov     	1, %o0
		set     	4, %o1
		call    	calloc
		nop     
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! new( struPtr1 )
		mov     	1, %o0
		set     	16, %o1
		call    	calloc
		nop     
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-204, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.MYS1(...)
		set     	-204, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		! new( struPtr1 )
		mov     	1, %o0
		set     	16, %o1
		call    	calloc
		nop     
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-208, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.MYS1(...)
		set     	-208, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		! floop <- 5.5
		
		.section	".rodata"
		.align  	4
	.$$.float.7:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.7, %l7
		ld      	[%l7], %f1
		call    	MYS1.MYS1.float
		nop     
		
		! new( struPtr2 )
		mov     	1, %o0
		set     	16, %o1
		call    	calloc
		nop     
		set     	struPtr2, %o1
		add     	%g0, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr2
		set     	struPtr2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-212, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr2.MYS1(...)
		set     	-212, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		! a <- 5
		set     	5, %o1
		! b <- 5.5
		
		.section	".rodata"
		.align  	4
	.$$.float.8:
		.single 	0r5.5
		
		.section	".text"
		.align  	4
		set     	.$$.float.8, %l7
		ld      	[%l7], %f2
		! c <- true
		set     	1, %o3
		call    	MYS1.MYS1.int.float.bool
		nop     
		
		! new( struPtr1 )
		mov     	1, %o0
		set     	16, %o1
		call    	calloc
		nop     
		set     	struPtr1, %o1
		add     	%g0, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1
		set     	struPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-216, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.MYS1(...)
		set     	-216, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.MYS1.void
		nop     
		
		! delete( intPtr )
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	-16, %o1
		add     	%fp, %o1, %o1
		st      	%g0, [%o1]
		
		! *struPtr1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-220, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.~MYS1(...)
		set     	-220, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.$MYS1.void
		nop     
		
		! delete( struPtr1 )
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%g0, [%o1]
		
		! *struPtr2
		set     	struPtr2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-224, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr2.~MYS1(...)
		set     	-224, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.$MYS1.void
		nop     
		
		! delete( struPtr2 )
		set     	struPtr2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	struPtr2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	struPtr2, %o1
		add     	%g0, %o1, %o1
		st      	%g0, [%o1]
		
		! *struPtr1
		set     	struPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-228, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *struPtr1.~MYS1(...)
		set     	-228, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		call    	MYS1.$MYS1.void
		nop     
		
		! delete( struPtr1 )
		set     	struPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	struPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		call    	free
		nop     
		set     	struPtr1, %o1
		add     	%g0, %o1, %o1
		st      	%g0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-232, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intVar
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-232, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! intArr[3]
		set     	3, %o0
		set     	5, %o1
		call    	.$$.arrCheck
		nop     
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-64, %o0
		add     	%fp, %o0, %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-236, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! &intArr[3]
		set     	-236, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	-240, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intArr[3]
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-240, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		set     	-244, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intVar
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-244, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! intVar2 = 10
		set     	-248, %o1
		add     	%fp, %o1, %o1
		set     	10, %o0
		st      	%o0, [%o1]
		
		! intVar3 = 15
		set     	-252, %o1
		add     	%fp, %o1, %o1
		set     	15, %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-256, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr1 = &intVar
		set     	-260, %o1
		add     	%fp, %o1, %o1
		set     	-256, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-264, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr2 = &intVar
		set     	-268, %o1
		add     	%fp, %o1, %o1
		set     	-264, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar2
		set     	-248, %o0
		add     	%fp, %o0, %o0
		set     	-272, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr3 = &intVar2
		set     	-276, %o1
		add     	%fp, %o1, %o1
		set     	-272, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		set     	-280, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr4 = &intVar
		set     	-284, %o1
		add     	%fp, %o1, %o1
		set     	-280, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar3
		set     	-252, %o0
		add     	%fp, %o0, %o0
		set     	-288, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr5 = &intVar3
		set     	-292, %o1
		add     	%fp, %o1, %o1
		set     	-288, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)==(ptr2)
		set     	-260, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-268, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.8
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.8:
		set     	-296, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)==(ptr2)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-296, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)==(ptr3)
		set     	-260, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-276, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.9
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.9:
		set     	-304, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)==(ptr3)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-304, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)!=(ptr2)
		set     	-260, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-268, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.10
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.10:
		set     	-308, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)!=(ptr2)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-308, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)!=(ptr3)
		set     	-260, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-276, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.11
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.11:
		set     	-312, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)!=(ptr3)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-312, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr4)==(myPtr1)
		set     	-284, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	myPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.12
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.12:
		set     	-316, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr4)==(myPtr1)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-316, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr3)==(myPtr1)
		set     	-276, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	myPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.13
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.13:
		set     	-320, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr3)==(myPtr1)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-320, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr2)!=(myPtr1)
		set     	-268, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	myPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.14
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.14:
		set     	-324, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr2)!=(myPtr1)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-324, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr3)++
		set     	-276, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	4, %o1
		add     	%o0, %o1, %o2
		set     	-328, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-276, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! ((ptr3)++)==(ptr5)
		set     	-328, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-292, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.15
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.15:
		set     	-332, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = ((ptr3)++)==(ptr5)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-332, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr3)--
		set     	-276, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	4, %o1
		sub     	%o0, %o1, %o2
		set     	-336, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-276, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! (ptr5)--
		set     	-292, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	4, %o1
		sub     	%o0, %o1, %o2
		set     	-340, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-292, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! (ptr3)==(ptr5)
		set     	-276, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-292, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.16
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.16:
		set     	-344, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr3)==(ptr5)
		set     	-300, %o1
		add     	%fp, %o1, %o1
		set     	-344, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! ptr1 = nullptr
		set     	-260, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! ptr2 = nullptr
		set     	-268, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! (struPtr1)++
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	16, %o1
		add     	%o0, %o1, %o2
		set     	-348, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! p1 = p2
		set     	-352, %o1
		add     	%fp, %o1, %o1
		set     	-356, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intPtr
		set     	-16, %o0
		add     	%fp, %o0, %o0
		set     	-360, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! pptr = &intPtr
		set     	-364, %o1
		add     	%fp, %o1, %o1
		set     	-360, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *pptr
		set     	-364, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-368, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr2 = *pptr
		set     	-268, %o1
		add     	%fp, %o1, %o1
		set     	-368, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &pptr
		set     	-364, %o0
		add     	%fp, %o0, %o0
		set     	-372, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ppptr = &pptr
		set     	-376, %o1
		add     	%fp, %o1, %o1
		set     	-372, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *ppptr
		set     	-376, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-380, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! **ppptr
		set     	-380, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-384, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr2 = **ppptr
		set     	-268, %o1
		add     	%fp, %o1, %o1
		set     	-384, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! intPtr[0]
		set     	0, %o0
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-388, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intVar = intPtr[0]
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	-388, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! intPtr[0]
		set     	0, %o0
		set     	4, %o1
		call    	.mul
		nop     
		mov     	%o0, %o1
		set     	-16, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		add     	%o0, %o1, %o0
		set     	-392, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr[0] = intVar2
		set     	-392, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-248, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-396, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intVar
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-396, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! foreach ( ... )
		! traversal ptr = --array
		set     	arr1, %o0
		add     	%g0, %o0, %o0
		set     	4, %o1
		sub     	%o0, %o1, %o0
		set     	-404, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
	.$$.loopCheck.2:
			! ++traversal ptr
			set     	-404, %o1
			add     	%fp, %o1, %o1
			ld      	[%o1], %o0
			set     	4, %o2
			add     	%o0, %o2, %o0
			st      	%o0, [%o1]
			! traversal ptr < array end addr?
			set     	arr1, %o0
			add     	%g0, %o0, %o0
			set     	20, %o1
			add     	%o0, %o1, %o1
			set     	-404, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			cmp     	%o0, %o1
			bge     	.$$.loopEnd.2
			nop     
			! iterVar = currentElem
			set     	-400, %o1
			add     	%fp, %o1, %o1
			ld      	[%o0], %o0
			st      	%o0, [%o1]
			
			! Start of loop body
				
				! &intVar
				set     	-4, %o0
				add     	%fp, %o0, %o0
				set     	-408, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! looper = &intVar
				set     	-400, %o1
				add     	%fp, %o1, %o1
				set     	-408, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				st      	%o0, [%o1]
				
				! (intVar)++
				set     	-4, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				set     	1, %o1
				add     	%o0, %o1, %o2
				set     	-412, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				set     	-4, %o1
				add     	%fp, %o1, %o1
				st      	%o2, [%o1]
				
				! *looper
				set     	-400, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				call    	.$$.ptrCheck
				nop     
				set     	-416, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! *looper = intVar
				set     	-416, %o1
				add     	%fp, %o1, %o1
				ld      	[%o1], %o1
				set     	-4, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				st      	%o0, [%o1]
				
				! *looper
				set     	-400, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				call    	.$$.ptrCheck
				nop     
				set     	-420, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! cout << *looper
				set     	-420, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %l7
				ld      	[%l7], %o1
				set     	.$$.intFmt, %o0
				call    	printf
				nop     
				
				.section	".rodata"
				.align  	4
			.$$.str.4:
				.asciz  	" "
				
				.section	".text"
				.align  	4
				! cout << " "
				set     	.$$.strFmt, %o0
				set     	.$$.str.4, %o1
				call    	printf
				nop     
				
				! *intPtr
				set     	-16, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				call    	.$$.ptrCheck
				nop     
				set     	-424, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! cout << *intPtr
				set     	-424, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %l7
				ld      	[%l7], %o1
				set     	.$$.intFmt, %o0
				call    	printf
				nop     
				
				! cout << endl
				set     	.$$.strEndl, %o0
				call    	printf
				nop     
			
			! End of loop body
			ba      	.$$.loopCheck.2
			nop     
		.$$.loopEnd.2:
		
		! extraCreds(...)
		call    	extraCreds.void
		nop     
		
		! checkers(...)
		call    	checkers.void
		nop     
		
		! exit(0)
		set     	0, %o0
		call    	exit
		nop     
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 424) & -8
	
main.void.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.22, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.22.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.22, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.22.fini.skip:
	set     	.$$.ctorDtor.21, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.21.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.21, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.21.fini.skip:
	ret     
	restore 
.$$.ctorDtor.19.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.19, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.19.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.19, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.19.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.19.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.16.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.16, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.16.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.16, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.16.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.16.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.15.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.15, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.15.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.15, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.15.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.15.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.14.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.14, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.14.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.14, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.14.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.14.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.13.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.13, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.13.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.13, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.13.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.13.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.12.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.12, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.12.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.12, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.12.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.12.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.6.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.6, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.6.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.6, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.6.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.6.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.5.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.5, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.5.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.5, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.5.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.5.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.4.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.4, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.4.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.4, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.4.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.4.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.3.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.3, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.3.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.3, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.3.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.3.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.2.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.2, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.2.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.2, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.2.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.2.fini
	nop     
	
	.section	".text"
	.align  	4
.$$.ctorDtor.1.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.1, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.1.fini.skip
	nop     
	call    	MYS1.$MYS1.void
	nop     
	set     	.$$.ctorDtor.1, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.1.fini.skip:
	ret     
	restore 
	
	.section	".fini"
	.align  	4
	call    	.$$.ctorDtor.1.fini
	nop     
	
	.section	".text"
	.align  	4
