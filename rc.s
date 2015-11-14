	
/*
 * Jesse Qin's CSE131 Compiler Generated Sat Nov 14 00:08:06 PST 2015
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
	
	.section	".bss"
	.align  	4
	.global 	temporary3
temporary3:
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
	
