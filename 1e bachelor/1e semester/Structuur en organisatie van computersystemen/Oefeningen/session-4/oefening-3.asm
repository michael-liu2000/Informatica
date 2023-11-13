.text
callersaveregisterwipe: # Don't modify this function!
    mv t0, ra
    li ra, 0
    li t1, 0
    li t2, 0
    li t3, 0
    li t4, 0
    li t5, 0
    li t6, 0
    li a0, 0
    li a1, 0
    li a2, 0
    li a3, 0
    li a4, 0
    li a5, 0
    li a6, 0
    li a7, 0
    jr t0

sum_fixme:
    # TODO
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 8(sp)
    sw a1, 4(sp)

    jal callersaveregisterwipe # Don't modify this line

    # TODO
    lw a0, 8(sp)
    lw a1, 4(sp)
    sw s0, 0(sp)
    
    add s0, a0, a1  # Don't modify this line
    mv  a0, s0      # Don't modify this line

    # TODO
    lw ra, 12(sp)
    lw s0, 0(sp)
	addi sp, sp, 16
	
    ret # Don't modify this line
    
.globl main
main: # Don't modify this function!
    li a0, 1
    li a1, 2
    li s0, 0xdeadbeef
    jal sum_fixme
    # Correct execution should terminate 1) Without errors, 2) with the value 3 in a0 AND 3) with the value 0xdeadbeef in s0
