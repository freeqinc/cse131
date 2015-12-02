	
/*
 * Jesse Qin's CSE131 Compiler Generated Wed Dec 02 06:17:44 PST 2015
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
	.global 	i
i:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	j
j:
	.skip   	4
	
	.section	".text"
	.align  	4
	
	.section	".bss"
	.align  	4
	.global 	b1
b1:
	.skip   	4
	
	.section	".text"
	.align  	4
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! (i)>(0)
		set     	i, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		set     	0, %o1
		cmp     	%o0, %o1
		ble     	.$$.cmp.1
		mov     	%g0, %o0
		inc     	%o0
	.$$.cmp.1:
		set     	-4, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
		
		! b1 = (i)>(0)
		set     	b1, %o1
		add     	%g0, %o1, %o1
		set     	-4, %l7
		add     	%fp, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! if ( (b1)=((i)>(0)) )
		set     	b1, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		cmp     	%o0, %g0
		be      	.$$.else.1
		nop     
			
			! (i)-(1)
			set     	i, %l7
			add     	%g0, %l7, %l7
			ld      	[%l7], %o0
			set     	1, %o1
			sub     	%o0, %o1, %o0
			set     	-8, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! i = (i)-(1)
			set     	i, %o1
			add     	%g0, %o1, %o1
			set     	-8, %l7
			add     	%fp, %l7, %l7
			ld      	[%l7], %o0
			st      	%o0, [%o1]
			
			! j = (i)=((i)-(1))
			set     	j, %o1
			add     	%g0, %o1, %o1
			set     	i, %l7
			add     	%g0, %l7, %l7
			ld      	[%l7], %o0
			st      	%o0, [%o1]
			
			ba      	.$$.endif.1
			nop     
		
		! else
	.$$.else.1:
		
		! endif
	.$$.endif.1:
		
		! j = 9
		set     	j, %o1
		add     	%g0, %o1, %o1
		set     	9, %o0
		st      	%o0, [%o1]
		
		! i = (j)=(9)
		set     	i, %o1
		add     	%g0, %o1, %o1
		set     	j, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o0
		st      	%o0, [%o1]
		
		! cout << (i)=((j)=(9))
		set     	i, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << i
		set     	i, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
		call    	printf
		nop     
		
		! cout << j
		set     	j, %l7
		add     	%g0, %l7, %l7
		ld      	[%l7], %o1
		set     	.$$.intFmt, %o0
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
	SAVE.main.void = -(92 + 8) & -8
	
main.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
