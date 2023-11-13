.globl main
.data
	string: .string "hello"
	
.text
main:
	addi a0, zero, 0
	stringiter:
	
	la t0, string
	lw t1, (t0)
	addi a0, a0, 1
	beqz t1, end
	j stringiter
	end:
	
	