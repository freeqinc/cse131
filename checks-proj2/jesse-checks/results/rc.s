	
/*
 * Generated Sun Nov 29 03:52:21 PST 2015
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
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
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
		
		! stru2.MYS1(...)
		set     	-76, %o0
		add     	%fp, %o0, %o0
		call    	MYS1.MYS1.void
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.2:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.2, %o0
		set     	-76, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! struPtr1 = struPtr2
		set     	-80, %o1
		add     	%fp, %o1, %o1
		set     	struPtr2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru1
		set     	stru1, %o0
		add     	%g0, %o0, %o0
		set     	-84, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr1 = &stru1
		set     	-80, %o1
		add     	%fp, %o1, %o1
		set     	-84, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &stru2
		set     	-76, %o0
		add     	%fp, %o0, %o0
		set     	-88, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! struPtr1 = &stru2
		set     	-80, %o1
		add     	%fp, %o1, %o1
		set     	-88, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-92, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intVar
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-92, %l7
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
		set     	-96, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! &intArr[3]
		set     	-96, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	-100, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intArr[3]
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-100, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		set     	-104, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intPtr = &intVar
		set     	-16, %o1
		add     	%fp, %o1, %o1
		set     	-104, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! intVar2 = 10
		set     	-108, %o1
		add     	%fp, %o1, %o1
		set     	10, %o0
		st      	%o0, [%o1]
		
		! intVar3 = 15
		set     	-112, %o1
		add     	%fp, %o1, %o1
		set     	15, %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-116, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr1 = &intVar
		set     	-120, %o1
		add     	%fp, %o1, %o1
		set     	-116, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	-4, %o0
		add     	%fp, %o0, %o0
		set     	-124, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr2 = &intVar
		set     	-128, %o1
		add     	%fp, %o1, %o1
		set     	-124, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar2
		set     	-108, %o0
		add     	%fp, %o0, %o0
		set     	-132, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr3 = &intVar2
		set     	-136, %o1
		add     	%fp, %o1, %o1
		set     	-132, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar
		set     	intVar, %o0
		add     	%g0, %o0, %o0
		set     	-140, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr4 = &intVar
		set     	-144, %o1
		add     	%fp, %o1, %o1
		set     	-140, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &intVar3
		set     	-112, %o0
		add     	%fp, %o0, %o0
		set     	-148, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr5 = &intVar3
		set     	-152, %o1
		add     	%fp, %o1, %o1
		set     	-148, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)==(ptr2)
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-128, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.1
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.1:
		set     	-156, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)==(ptr2)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-156, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)==(ptr3)
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.2
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.2:
		set     	-164, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)==(ptr3)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-164, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)!=(ptr2)
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-128, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.3
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.3:
		set     	-168, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)!=(ptr2)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-168, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr1)!=(ptr3)
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.4
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.4:
		set     	-172, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr1)!=(ptr3)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-172, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr4)==(myPtr1)
		set     	-144, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	myPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.5
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.5:
		set     	-176, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr4)==(myPtr1)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-176, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr3)==(myPtr1)
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	myPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.6
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.6:
		set     	-180, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr3)==(myPtr1)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-180, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr2)!=(myPtr1)
		set     	-128, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	myPtr1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		be      	.$$.cmp.7
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.7:
		set     	-184, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr2)!=(myPtr1)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-184, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr3)++
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	4, %o1
		add     	%o0, %o1, %o2
		set     	-188, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-136, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! ((ptr3)++)==(ptr5)
		set     	-188, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.8
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.8:
		set     	-192, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = ((ptr3)++)==(ptr5)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-192, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! (ptr3)--
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	4, %o1
		sub     	%o0, %o1, %o2
		set     	-196, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-136, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! (ptr5)--
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	4, %o1
		sub     	%o0, %o1, %o2
		set     	-200, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-152, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! (ptr3)==(ptr5)
		set     	-136, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	-152, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.9
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.9:
		set     	-204, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! booltest = (ptr3)==(ptr5)
		set     	-160, %o1
		add     	%fp, %o1, %o1
		set     	-204, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! ptr1 = nullptr
		set     	-120, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! ptr2 = nullptr
		set     	-128, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! (struPtr1)++
		set     	-80, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	12, %o1
		add     	%o0, %o1, %o2
		set     	-208, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		set     	-80, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		
		! p1 = p2
		set     	-212, %o1
		add     	%fp, %o1, %o1
		set     	-216, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *ptr1
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-220, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! intVar = *ptr1
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	-220, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *ptr1
		set     	-120, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-224, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! *ptr1 = intVar3
		set     	-224, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	-112, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &ptr1
		set     	-120, %o0
		add     	%fp, %o0, %o0
		set     	-228, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! pptr = &ptr1
		set     	-232, %o1
		add     	%fp, %o1, %o1
		set     	-228, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *pptr
		set     	-232, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-236, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr2 = *pptr
		set     	-128, %o1
		add     	%fp, %o1, %o1
		set     	-236, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! &pptr
		set     	-232, %o0
		add     	%fp, %o0, %o0
		set     	-240, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ppptr = &pptr
		set     	-244, %o1
		add     	%fp, %o1, %o1
		set     	-240, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! *ppptr
		set     	-244, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-248, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! **ppptr
		set     	-248, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		call    	.$$.ptrCheck
		nop     
		set     	-252, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! ptr2 = **ppptr
		set     	-128, %o1
		add     	%fp, %o1, %o1
		set     	-252, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 252) & -8
	
main.void.fini:
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
