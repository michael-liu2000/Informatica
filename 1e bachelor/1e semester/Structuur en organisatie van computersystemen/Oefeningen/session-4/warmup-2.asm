.globl main

.data
	stack: .space 5
	
.text
main:
	la sp, stack
	li t1, 4
	li t2, 5
	addi sp, sp, -8
	sw t1, 0(sp)
	sw t1, 4(sp)
	
	
	li t1, 0
	li t2, 0
	
	lw t1, 0(sp)
	addi sp, sp, 4
	lw t2, 0(sp)
	addi sp, sp, 4