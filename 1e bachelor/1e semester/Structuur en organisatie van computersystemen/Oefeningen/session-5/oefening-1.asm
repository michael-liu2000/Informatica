.globl main
.data
	in1: .word 1, 2, 3, 4, 5
	in2: .word 1, 2, 3, 4, 5
	out: .space 20
	n: .word 5
	
.text
	sum:
		li t0, 0
		loop:
			beq a3, t0, end
			lw t2, (a0)
			lw t3, (a1)
			add t4, t2, t3
			sw t4, (a2)
			addi a0, a0, 4
			addi a1, a1, 4
			addi a2, a2, 4
			addi t0, t0, 1
			j loop
			
		end:
			la a0, out
			lw t0, 0(a0)
			lw t0, 4(a0)
			lw t0, 8(a0)
			lw t0, 12(a0)
			lw t0, 16(a0)
			ret
		
	main:
		la a0, in1
		la a1, in2
		la a2, out
		lw a3, n
		jal sum