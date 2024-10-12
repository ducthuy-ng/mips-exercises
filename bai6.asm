	.data
N:	.word	10
Fib:	.align 2
	.space 40

	.text 
	.globl main
	
main:
	# Calc Fib of N=5
	addi $a0, $0, 9
	jal fib_dynamic
	
	# Print result
	add $a0, $v0, $0
	addi $v0, $0, 1
	syscall
	
	# Exit
	addi $v0, $0, 10
	syscall
	
fib_dynamic:
	# Copy N
	add $t0, $0, $a0
	# Check if negative
	addi $v0, $0, 0
	ble $t0, $0, end_fib_dynamic
	
	# $t1 = &Fib
	la $t1, Fib
	
	# Correct offset
	# Check if N==0 or N==1
	addi $v0, $v0, 1
	addi $t0, $t0, -1
	beq $t0, $0, end_fib_dynamic
	sw $v0, ($t1)


	addi $t1, $t1, 4
	addi $t0, $t0, -1
	beq $t0, $0, end_fib_dynamic
	sw $v0, ($t1)
	
if_fib_dynamic:
	beq $t0, $0, endif_fib_dynamic
	
	lw $t2, ($t1)
	lw $t3, -4($t1)
	add $t2, $t2, $t3
	sw $t2, 4($t1)
	
	addi $t0, $t0, -1
	addi $t1, $t1, 4

	j if_fib_dynamic

endif_fib_dynamic:
	lw $v0, ($t1)
	
end_fib_dynamic: 
	jr $ra
