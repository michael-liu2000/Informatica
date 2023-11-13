.globl main

.data
	a: .word 1
	b: .word 2
	result: .space 0
	
.text
main:
	lw a0, a
	lw a1, b
	jal ra, sum
	la t0, result
	sw a0, (t0)
	ecall
	
sum:
	add a0, a0, a1
	jalr ra