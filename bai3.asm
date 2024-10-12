	.data
iArraySize: .word   10
iArray:     .word   12, 32, 13, 43, 17, 1, -2, -45, 0, 11
numResult:  .asciiz "Minimum number: "
idxResult:  .asciiz "\nIndex: "
	.text
	.globl main 

main:
    ### StartCodeHere:
	jal searchMin
    ### EndCodeHere:
       # print your results
       la    $a0, numResult
       li    $v0, 4
       syscall
       move  $a0, $s0
       li    $v0, 1
       syscall
       la    $a0, idxResult
       li    $v0, 4
       syscall
       move  $a0, $s1
       li    $v0, 1
       syscall
       #stop program
       li    $v0, 10
       syscall
    #your function start from here

searchMin:
# $s0: Minimum, $s1: Minimum Index
# $t0: Indexer, $t1: ArraySize, $t2: Counter, $t3: iArray[Indexer]
	lw $s0, iArray
	add $s1, $0, $0
	
	la $t0, iArray
	lw $t1, iArraySize
	addi  $t2, $0, 1
	
beginLoopMin:
	bge $t2, $t1, endLoopMin
	addi $t0, $t0, 4
	lw $t3, 0($t0)
	bge $t3, $s0, endIfSmaller
ifSmaller:
	add $s0, $t3, $0
	add $s1, $t2, $0

endIfSmaller:
	addi $t2, $t2, 1
	j beginLoopMin
	
	
	
endLoopMin:
	jr $ra