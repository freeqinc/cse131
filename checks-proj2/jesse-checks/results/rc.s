	
/*
 * Generated Wed Dec 02 05:33:31 PST 2015
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
	
MS.MS.int:
	set     	SAVE.MS.MS.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		st      	%i1, [%fp+72]
		
		! this.x
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! this.x = v
		set     	-4, %o1
		add     	%fp, %o1, %o1
		ld      	[%o1], %o1
		set     	72, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		.section	".rodata"
		.align  	4
	.$$.str.1:
		.asciz  	"ctor called on "
		
		.section	".text"
		.align  	4
		! cout << "ctor called on "
		set     	.$$.strFmt, %o0
		set     	.$$.str.1, %o1
		call    	printf
		nop     
		
		! this.x
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! cout << this.x
		set     	-8, %l7
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
	
	! End of function MS.MS.int
	call    	MS.MS.int.fini
	nop     
	ret     
	restore 
	SAVE.MS.MS.int = -(92 + 8) & -8
	
MS.MS.int.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
MS.$MS.void:
	set     	SAVE.MS.$MS.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		.section	".rodata"
		.align  	4
	.$$.str.2:
		.asciz  	"dtor called on "
		
		.section	".text"
		.align  	4
		! cout << "dtor called on "
		set     	.$$.strFmt, %o0
		set     	.$$.str.2, %o1
		call    	printf
		nop     
		
		! this.x
		set     	68, %o0
		add     	%fp, %o0, %o0
		ld      	[%o0], %o0
		set     	0, %o1
		add     	%g0, %o1, %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! cout << this.x
		set     	-4, %l7
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
	
	! End of function MS.$MS.void
	call    	MS.$MS.void.fini
	nop     
	ret     
	restore 
	SAVE.MS.$MS.void = -(92 + 4) & -8
	
MS.$MS.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".bss"
	.align  	4
	.global 	structA
structA:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.structA:
	set     	SAVE..$.init.structA, %g1
	save    	%sp, %g1, %sp
		
		! structA.MS(...)
		set     	structA, %o0
		add     	%g0, %o0, %o0
		! v <- 1
		set     	1, %o1
		call    	MS.MS.int
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.1:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.1, %o0
		set     	structA, %o1
		add     	%g0, %o1, %o1
		st      	%o1, [%o0]
	
	! End of function .$.init.structA
	call    	.$.init.structA.fini
	nop     
	ret     
	restore 
	SAVE..$.init.structA = -(92 + 0) & -8
	
.$.init.structA.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.structA
	nop     
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
structB:
	.skip   	4
	
	.section	".text"
	.align  	4
.$.init.structB:
	set     	SAVE..$.init.structB, %g1
	save    	%sp, %g1, %sp
		
		! structB.MS(...)
		set     	structB, %o0
		add     	%g0, %o0, %o0
		! v <- 2
		set     	2, %o1
		call    	MS.MS.int
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.2:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.2, %o0
		set     	structB, %o1
		add     	%g0, %o1, %o1
		st      	%o1, [%o0]
	
	! End of function .$.init.structB
	call    	.$.init.structB.fini
	nop     
	ret     
	restore 
	SAVE..$.init.structB = -(92 + 0) & -8
	
.$.init.structB.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
	
	.section	".init"
	.align  	4
	call    	.$.init.structB
	nop     
	
	.section	".text"
	.align  	4
	.global 	foo
foo:
foo.int:
	set     	SAVE.foo.int, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		st      	%i0, [%fp+68]
		
		! structC.MS(...)
		set     	-4, %o0
		add     	%fp, %o0, %o0
		! v <- 3
		set     	3, %o1
		call    	MS.MS.int
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.3:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.3, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		.section	".bss"
		.align  	4
	foo.int.structD:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		.section	".bss"
		.align  	4
	.$.init.foo.int.structD:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		! Start init guard
		set     	.$.init.foo.int.structD, %o0
		ld      	[%o0], %o0
		cmp     	%o0, %g0
		bne     	.$.init.foo.int.structD.done
		nop     
			
			! structD.MS(...)
			set     	foo.int.structD, %o0
			add     	%g0, %o0, %o0
			! v <- 4
			set     	4, %o1
			call    	MS.MS.int
			nop     
			
			.section	".bss"
			.align  	4
		.$$.ctorDtor.4:
			.skip   	4
			
			.section	".text"
			.align  	4
			
			set     	.$$.ctorDtor.4, %o0
			set     	foo.int.structD, %o1
			add     	%g0, %o1, %o1
			st      	%o1, [%o0]
		
		! End init guard
		set     	.$.init.foo.int.structD, %o0
		mov     	1, %o1
		st      	%o1, [%o0]
	.$.init.foo.int.structD.done:
		
		! (x)==(4)
		set     	68, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	4, %o1
		cmp     	%o0, %o1
		bne     	.$$.cmp.1
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.1:
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! if ( (x)==(4) )
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.1
		nop     
			
			! return;
			call    	foo.int.fini
			nop     
			ret     
			restore 
			
			ba      	.$$.endif.1
			nop     
		
		! else
	.$$.else.1:
		
		! endif
	.$$.endif.1:
		
		! structE.MS(...)
		set     	-12, %o0
		add     	%fp, %o0, %o0
		! v <- 5
		set     	5, %o1
		call    	MS.MS.int
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.5:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.5, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
	
	! End of function foo.int
	call    	foo.int.fini
	nop     
	ret     
	restore 
	SAVE.foo.int = -(92 + 12) & -8
	
foo.int.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.5, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.5.fini.skip
	nop     
	call    	MS.$MS.void
	nop     
	set     	.$$.ctorDtor.5, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.5.fini.skip:
	set     	.$$.ctorDtor.3, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.3.fini.skip
	nop     
	call    	MS.$MS.void
	nop     
	set     	.$$.ctorDtor.3, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.3.fini.skip:
	ret     
	restore 
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! structF.MS(...)
		set     	-4, %o0
		add     	%fp, %o0, %o0
		! v <- 6
		set     	6, %o1
		call    	MS.MS.int
		nop     
		
		.section	".bss"
		.align  	4
	.$$.ctorDtor.6:
		.skip   	4
		
		.section	".text"
		.align  	4
		
		set     	.$$.ctorDtor.6, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o1, [%o0]
		
		! foo(...)
		! x <- 3
		set     	3, %o0
		call    	foo.int
		nop     
		
		! foo(...)
		! x <- 4
		set     	4, %o0
		call    	foo.int
		nop     
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 4) & -8
	
main.void.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.6, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.6.fini.skip
	nop     
	call    	MS.$MS.void
	nop     
	set     	.$$.ctorDtor.6, %o0
	st      	%g0, [%o0]
.$$.ctorDtor.6.fini.skip:
	ret     
	restore 
.$$.ctorDtor.4.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.4, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.4.fini.skip
	nop     
	call    	MS.$MS.void
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
.$$.ctorDtor.2.fini:
	save    	%sp, -96, %sp
	set     	.$$.ctorDtor.2, %o0
	ld      	[%o0], %o0
	cmp     	%o0, %g0
	be      	.$$.ctorDtor.2.fini.skip
	nop     
	call    	MS.$MS.void
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
	call    	MS.$MS.void
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
