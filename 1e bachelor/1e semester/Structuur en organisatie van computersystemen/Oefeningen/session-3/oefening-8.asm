.globl main
.data
	string: .string "hello"
	
.text
main:
	la t0, string
	addi a0, zero, -1
	stringiter:
	lbu t1, (t0)
	addi a0, a0, 1
	addi t0, t0, 1
	beqz t1, end
	j stringiter
	end:
	
	