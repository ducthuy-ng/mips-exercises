	.data
cSpace: 	.asciiz " "
cEndLine: 	.asciiz "\n"
iArraySize: 	.word 10
iArray: .word 12, 32, 13, 43, 17, 1, -2, -45, 0, 11

	.text
main:
	# print integer array
	lw $t0, iArraySize # load size of iArray
	la $t1, iArray # Load base address of iArray
	jal print
	### StartCodeHere:
	jal sort
	### EndCodeHere:
	# print integer array
	lw $t0, iArraySize # load size of iArray
	la $t1, iArray # Load base address of iArray
	jal print
	#stop program
	li $v0, 10
	syscall
print: # print fuction
	add $t2, $0, $0 # index of iArray
loopPrint:
	beqz $t0, exitPrint # Check condition
	li $v0, 1 # service 1 is print integer
	add $t3, $t1, $t2 # load desired value into $a0
	lw $a0, ($t3)
	syscall
	li $v0, 4
	la $a0, cSpace # print space just like separator
	syscall
	addi $t0, $t0, -1 # decrease loop count
	addi $t2, $t2, 4 # increase index
	b loopPrint
exitPrint:
	li $v0, 4
	la $a0, cEndLine # print end line
	syscall
	jr $ra # end of print
	
	
sort:
	lw $t0, iArraySize
	la $t1, iArray

	
	# $t2=i, $t3=j
	addi $t2, $0, 0

	
	# $t4=N-1, $t5=N-2
	addi $t4, $t0, -1
	addi $t5, $t0, -2
	
# For i = 0 -> N-2
for_i_sort:
	bgt $t2, $t5, end_for_i
	
	# t3=j
	addi $t3, $t2, 1
for_j_sort:
	bgt $t3, $t4, end_for_j
	
if_ai_aj_sort:
	# $t6=&A[i], $t7=&A[j]
	sll $t6, $t2, 2
	sll $t7, $t3, 2
	add $t6, $t6, $t1
	add $t7, $t7, $t1
	
	lw $s0, ($t6)
	lw $s1, ($t7)
	
	# if A[i] > A[j]
	ble $s0, $s1, end_if_ai_aj_sort
	sw $s0, ($t7)
	sw $s1, ($t6)
	
end_if_ai_aj_sort:
	
	addi $t3, $t3, 1
	j for_j_sort
end_for_j:
	
	addi $t2, $t2, 1
	j for_i_sort
end_for_i:



	jr $ra
