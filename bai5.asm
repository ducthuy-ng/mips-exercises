	.data 
	
	.text
	.globl main
main:
	addi $a0, $0, 20
	jal fib_recur
	add $a0, $0, $v0
	addi $v0, $0, 1
	syscall
	
	addi $v0, $0, 10
	syscall 
	

fib_recur:

# If Fib(1) || Fib(2)
if_zero:
	addi $t0, $0, 1
	blt $a0, $t0, else_zero
	
	addi $t0, $0, 2
	bgt $a0, $t0, else_zero
	
	addi $v0, $0, 1
	j end_fib_recur


else_zero:
	addi $sp, $sp, -4
	sw $ra, ($sp)

	addi $sp, $sp, -4
	sw $a0, ($sp)
	
	addi $a0, $a0, -1
	jal fib_recur
	
	addi $sp, $sp, -4
	sw $v0, ($sp)
	
	addi $a0, $a0, -1
	jal fib_recur
	
	lw $t0, ($sp)
	addi $sp, $sp, 4
	add $v0, $v0, $t0
	
	lw $a0, ($sp)
	addi $sp, $sp, 4
	
	lw $ra, ($sp)
	addi $sp, $sp, 4
	


end_fib_recur:
	jr $ra