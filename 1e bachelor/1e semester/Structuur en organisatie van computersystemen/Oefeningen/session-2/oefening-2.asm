.globl main
.data
	a: .word 5
	b: .space 4
.text
main:
	# Load values from .data
	lw t0, a
	la a0, b
	
	# Calculate factorial
	addi t1, zero, 1
	
	# while a > 0
	fac:
		mul t1, t1, t0
		addi t0, t0, -1
		blt zero, t0, fac
		
	# Store results
	sw t1, (a0)
	
	# Check results
	lw t2, (a0)
	
	
	
	