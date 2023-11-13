.globl main
.data
	a: .word 2
	b: .word 3
	c: .space 4
	
.text
main:
	# Load values from .data
	lw t0, a
	lw t1, b
	la a0, c
	
	# Calculate power
	addi t2, zero, 0
	addi t3, zero, 1
	
	power: # t2 < b
		
		mul t3, t3, t0
		addi t2, t2, 1
		blt t2, t1, power
	
	# Store and check result
	sw t3, (a0)
	lw t4, (a0)
	
		