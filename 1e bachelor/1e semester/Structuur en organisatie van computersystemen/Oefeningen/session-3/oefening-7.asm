.globl main
.data
	array: .word 1, 2, 3, 4, 5
	arraymultiplied: .word 5, 10, 15, 20, 25
	multiplier: .word 5

.text
main:
	# Load values/addresses
	la a0, array			# Array start
	addi t0, a0, 20		# Array end
	lw t1, multiplier
	
	# Iterate through the array
	iterate:
		lw t2, (a0)
		mv t3, t2
		
		addi t4, zero, 1	# multi loop counter
		multi:
			add t3, t3, t2
			addi t4, t4, 1
			blt t4, t1, multi
		
		# Store multiplied number
		sw t3, (a0)
		addi a0, a0, 4
		blt a0, t0, iterate
	
	test:
		# Load values/addresses
		la a0, array
		la a1, arraymultiplied
		
		addi t0, a0, 20
		addi t1, a1, 20
		
		addi t5, zero, 1
		iteratetest:
			lw t2, (a0)
			lw t3, (a1)
			bne t2, t3, failed
			beq t2, t3, next
			
			next:
			addi a0, a0, 4
			addi a1, a1, 4
			blt a0, t0, iteratetest
			ret
		
		failed:
			addi t5, zero, -1
			ret
	
	
	
	
	