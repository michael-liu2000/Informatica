.globl main

.data
	a: .string "abcde"
	b: .string "abcd"

.text
	streq:
		loop:
			lb t0, (a0)
			lb t1, (a1)
			bne t0, t1, notequal
			beqz t0, equal
			addi a0, a0, 1
			addi a1, a1, 1
			j loop
			
		equal:
			li a0, 1
			ret
			
		notequal:
			li a0, 0
			ret
	
	main:
		la a0, a
		la a1, b
		jal streq
		nop