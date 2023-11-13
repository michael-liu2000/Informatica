.globl main

.data
	string: .asciz "blossom"
	search: .asciz "loss"

.text
main:
	la a0, string
	la a1, search
	
	stringiter:
		lbu t0, (a0)
		lbu t1, (a1)
		
		
		beq t0, t1, match
		
		continue:
		addi a0, a0, 1
		beqz t0, end
		j stringiter
		
	match:
		mv t3, a0
		mv t4, a1
	
		keepmatching:
			addi t3, t3, 1
			addi t4, t4, 1
			lbu t5, (t3)
			lbu t6, (t4)
			beqz t5, end
			beqz t6, found
			beq t5, t6, keepmatching
			j continue
		
	found:
		li a2, 1
		ret
		
		
	end:
		li a2, -1
		ret
		
	
