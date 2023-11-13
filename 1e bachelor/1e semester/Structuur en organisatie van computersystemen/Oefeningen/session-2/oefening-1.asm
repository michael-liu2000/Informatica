.globl main
.data
	a: .word 2
	b: .word 3
	c: .space 4
	
.text
main:
	# Load values from data
	lw t0, a
	lw t1, b
	la a0, c
	
	# Squaring
	mul t2, t0, t0
	mul t3, t1, t1
	
	# Adding squares
	add t4, t2, t3
	
	# Write to c
	sw t4, (a0)
	
	# Check squared value
	lw t5, c