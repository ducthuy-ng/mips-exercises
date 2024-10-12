	.text
	.globl main
main:
	addi $t0, $0, 2
	addi $t1, $0, 10
	
	addi $sp, $sp, -4
	sw $t0, ($sp)
	
	addi $sp, $sp, -4
	sw $t1, ($sp)
	
	jal add
	
	lw $a0, ($sp)
	addi $sp, $sp, 4
	
	addi $v0, $0, 1
	syscall
	
	
	addi $v0, $0, 10
	syscall
	
	
	
add:
	lw $t0, ($sp)
	addi $sp, $sp, 4
	
	lw $t1, ($sp)
	addi $sp, $sp, 4
	
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, ($sp)
	
	jr $ra