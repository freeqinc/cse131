	
/*
 * Generated Fri Nov 13 23:52:02 PST 2015
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
	
	
	.section	".bss"
	.align  	4
	.global 	gInt
gInt:
	.skip   	4
	
	.section	".text"
	.align  	4
	
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
		
		! (5)+(temporary)
		set     	5, %o0
		set     	temporary, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! temporary2 = (5)+(temporary)
		set     	temporary2, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.temporary2
	call    	.$.init.temporary2.fini
	nop     
	ret     
	restore 
	SAVE..$.init.temporary2 = -(92 + 4) & -8
	
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
		
		! --(temporary)
		set     	temporary, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	1, %o1
		sub     	%o0, %o1, %o2
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o2, [%o1]
		set     	temporary, %o1
		add     	%g0, %o1, %o1
		st      	%o2, [%o1]
		
		! (--(temporary))*(2)
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		set     	2, %o1
		call    	.mul
		nop     
		mov     	%o0, %o0
		set     	-8, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! (temporary2)+((--(temporary))*(2))
		set     	temporary2, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	-8, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o1
		add     	%o0, %o1, %o0
		set     	-12, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! temporary3 = (temporary2)+((--(temporary))*(2))
		set     	temporary3, %o1
		add     	%g0, %o1, %o1
		set     	-12, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
	
	! End of function .$.init.temporary3
	call    	.$.init.temporary3.fini
	nop     
	ret     
	restore 
	SAVE..$.init.temporary3 = -(92 + 12) & -8
	
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
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! local1 = 5
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	5, %o0
		st      	%o0, [%o1]
		
		! local2 = 6
		set     	-8, %o1
		add     	%fp, %o1, %o1
		set     	6, %o0
		st      	%o0, [%o1]
		
		! local3 = 10
		set     	-12, %o1
		add     	%fp, %o1, %o1
		set     	10, %o0
		st      	%o0, [%o1]
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 12) & -8
	
main.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
