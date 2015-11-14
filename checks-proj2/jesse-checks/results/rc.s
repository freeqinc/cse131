	
/*
 * Generated Sat Nov 14 04:12:51 PST 2015
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
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 0) & -8
	
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
	
	! End of function pain.void
	call    	pain.void.fini
	nop     
	ret     
	restore 
	SAVE.pain.void = -(92 + 0) & -8
	
pain.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
