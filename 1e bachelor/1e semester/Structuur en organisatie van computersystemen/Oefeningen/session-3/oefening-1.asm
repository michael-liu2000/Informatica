.globl main
.data
	a: .word 6
	b: .word 4
	operation: .word 2 # operation
	d: .space 4
	
.text
main:
	lw t0, operation
	lw t2, a
	lw t3, b
	la a0, d
	
	# Switch to case
	mv t4, zero
	switch:
		beq t0, t4, case0
		addi t4, t4, 1
		beq t0, t4, case1
		addi t4, t4, 1
		beq t0, t4, case2
		addi t4, t4, 1
		beq t0, t4, case3
		j continue
	
	# switch cases
	case0:
		add t5, t2, t3
		j continue
	case1:
		sub t5, t2, t3
		j continue
	case2:
		addi t5, t2, 5
		j continue
	case3:
		addi t5, t3, 5
		j continue
	
	continue:
		# Store and check result
		sw t5, (a0)
		lw t6, (a0)	
