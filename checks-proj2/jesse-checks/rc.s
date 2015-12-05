	
/*
 * Jesse Qin's CSE131 Compiler Generated Fri Dec 04 22:02:49 PST 2015
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
	
	.global 	main
main:
main.void:
	set     	SAVE.main.void, %g1
	save    	%sp, %g1, %sp
		
		! Store params
		
		! a = 3
		set     	-4, %o1
		add     	%fp, %o1, %o1
		set     	3, %o0
		st      	%o0, [%o1]
		
		! foreach ( ... )
		! traversal ptr = --array
		set     	-24, %o0
		add     	%fp, %o0, %o0
		set     	4, %o1
		sub     	%o0, %o1, %o0
		set     	-32, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
	.$$.loopCheck.1:
			! ++traversal ptr
			set     	-32, %o1
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
			set     	-32, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			cmp     	%o0, %o1
			bge     	.$$.loopEnd.1
			nop     
			! iterVar = currentElem
			set     	-28, %o1
			add     	%fp, %o1, %o1
			st      	%o0, [%o1]
			
			! Start of loop body
				
				! (a)++
				set     	-4, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				set     	1, %o1
				add     	%o0, %o1, %o2
				set     	-36, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				set     	-4, %o1
				add     	%fp, %o1, %o1
				st      	%o2, [%o1]
				
				! i = (a)++
				set     	-28, %o1
				add     	%fp, %o1, %o1
				ld      	[%o1], %o1
				set     	-36, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				st      	%o0, [%o1]
			
			! End of loop body
			ba      	.$$.loopCheck.1
			nop     
		.$$.loopEnd.1:
		
		! p = 0
		set     	-52, %o1
		add     	%fp, %o1, %o1
		set     	0, %o0
		st      	%o0, [%o1]
		
		! foreach ( ... )
		! traversal ptr = --array
		set     	-24, %o0
		add     	%fp, %o0, %o0
		set     	4, %o1
		sub     	%o0, %o1, %o0
		set     	-60, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
	.$$.loopCheck.2:
			! ++traversal ptr
			set     	-60, %o1
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
			set     	-60, %o0
			add     	%fp, %o0, %o0
			ld      	[%o0], %o0
			cmp     	%o0, %o1
			bge     	.$$.loopEnd.2
			nop     
			! iterVar = currentElem
			set     	-56, %o1
			add     	%fp, %o1, %o1
			ld      	[%o0], %o0
			st      	%o0, [%o1]
			
			! Start of loop body
				
				! cout << i
				set     	-56, %l7
				add     	%fp, %l7, %l7
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
		
		! foreach ( ... )
		! traversal ptr = --array
		set     	-24, %o0
		add     	%fp, %o0, %o0
		set     	4, %o1
		sub     	%o0, %o1, %o0
		set     	-68, %o1
		add     	%fp, %o1, %o1
		st      	%o0, [%o1]
	.$$.loopCheck.3:
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
			bge     	.$$.loopEnd.3
			nop     
			! iterVar = currentElem
			set     	-64, %o1
			add     	%fp, %o1, %o1
			ld      	[%o0], %o0
			st      	%o0, [%o1]
			
			! Start of loop body
				
				! (p)+(i)
				set     	-52, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				set     	-64, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o1
				add     	%o0, %o1, %o0
				set     	-72, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
				
				! p = (p)+(i)
				set     	-52, %o1
				add     	%fp, %o1, %o1
				set     	-72, %l7
				add     	%fp, %l7, %l7
				ld      	[%l7], %o0
				st      	%o0, [%o1]
				
				! foreach ( ... )
				! traversal ptr = --array
				set     	-48, %o0
				add     	%fp, %o0, %o0
				set     	4, %o1
				sub     	%o0, %o1, %o0
				set     	-80, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
			.$$.loopCheck.4:
					! ++traversal ptr
					set     	-80, %o1
					add     	%fp, %o1, %o1
					ld      	[%o1], %o0
					set     	4, %o2
					add     	%o0, %o2, %o0
					st      	%o0, [%o1]
					! traversal ptr < array end addr?
					set     	-48, %o0
					add     	%fp, %o0, %o0
					set     	12, %o1
					add     	%o0, %o1, %o1
					set     	-80, %o0
					add     	%fp, %o0, %o0
					ld      	[%o0], %o0
					cmp     	%o0, %o1
					bge     	.$$.loopEnd.4
					nop     
					! iterVar = currentElem
					set     	-76, %o1
					add     	%fp, %o1, %o1
					st      	%o0, [%o1]
					
					! Start of loop body
						
						! s = p
						set     	-76, %o1
						add     	%fp, %o1, %o1
						ld      	[%o1], %o1
						set     	-52, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %o0
						st      	%o0, [%o1]
					
					! End of loop body
					ba      	.$$.loopCheck.4
					nop     
				.$$.loopEnd.4:
				
				! foreach ( ... )
				! traversal ptr = --array
				set     	-48, %o0
				add     	%fp, %o0, %o0
				set     	4, %o1
				sub     	%o0, %o1, %o0
				set     	-88, %o1
				add     	%fp, %o1, %o1
				st      	%o0, [%o1]
			.$$.loopCheck.5:
					! ++traversal ptr
					set     	-88, %o1
					add     	%fp, %o1, %o1
					ld      	[%o1], %o0
					set     	4, %o2
					add     	%o0, %o2, %o0
					st      	%o0, [%o1]
					! traversal ptr < array end addr?
					set     	-48, %o0
					add     	%fp, %o0, %o0
					set     	12, %o1
					add     	%o0, %o1, %o1
					set     	-88, %o0
					add     	%fp, %o0, %o0
					ld      	[%o0], %o0
					cmp     	%o0, %o1
					bge     	.$$.loopEnd.5
					nop     
					! iterVar = currentElem
					set     	-84, %o1
					add     	%fp, %o1, %o1
					ld      	[%o0], %o0
					st      	%o0, [%o1]
					
					! Start of loop body
						
						! cout << s
						set     	-84, %l7
						add     	%fp, %l7, %l7
						ld      	[%l7], %o1
						set     	.$$.intFmt, %o0
						call    	printf
						nop     
						
						! cout << endl
						set     	.$$.strEndl, %o0
						call    	printf
						nop     
					
					! End of loop body
					ba      	.$$.loopCheck.5
					nop     
				.$$.loopEnd.5:
			
			! End of loop body
			ba      	.$$.loopCheck.3
			nop     
		.$$.loopEnd.3:
		
		! return 0;
		set     	0, %i0
		call    	main.void.fini
		nop     
		ret     
		restore 
	
	! End of function main.void
	call    	main.void.fini
	nop     
	ret     
	restore 
	SAVE.main.void = -(92 + 88) & -8
	
main.void.fini:
	save    	%sp, -96, %sp
	ret     
	restore 
