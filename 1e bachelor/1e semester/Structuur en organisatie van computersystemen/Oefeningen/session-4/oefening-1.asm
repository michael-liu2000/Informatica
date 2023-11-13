.globl main

.data
	x: .word 10
	y: .word 20
	z: .space 4
	
.text
	doubleit:
		add a0, a0, a0
		ret
	
	sum:
		addi sp, sp, -8
		sw ra, 4(sp)
		sw a0, 0(sp)
		
		mv a0, a1
		jal doubleit
		
		lw t0, 0(sp)
		add a0, a0, t0
		
		lw ra, 4(sp)
		addi sp, sp, 8
		ret
		
	main:
		lw a0, x
		lw a1, y
		jal sum
		sw a0, z, t0