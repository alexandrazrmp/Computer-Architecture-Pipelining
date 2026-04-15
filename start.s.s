.text
.globl _start
.ent _start
_start:      

   la $t0,A      # $t0 = διεύθυνση του πίνακα A
   addi $t1,$zero, 200    # $t1 = 200 (μέγεθος του πίνακα)
        
   li $t2, 0      # $t2 = N (αρνητικοί)
   li $t3, 0      # $t3 = P (θετικοί)
   li $t4, 0     # $t4 = Z (μηδενικοί)
   li $t5, 0      # $t5 = E (άρτιοι)
   li $t6, 0      # $t6 = O (περιττοί)

loop: 
	lw $t7,0($t0)
	addi $t1,$t1,-1
	addi $t0,$t0,4
	slt $t8,$t7,$zero
	beq $t7,$zero,Zero #May have problem
	beq $t8,$zero,Positive
          bne $t8,$zero,Negative
EvenOdd:
  	andi $t9, $t7, 1 # Perform bitwise AND with 1 
  	beq $t9, $zero, is_even # If result is 0, jump to is_even 
	j is_odd
Positive: 
   	addi $t3,$t3,1
	j EvenOdd
Zero: 
   	addi $t4,$t4,1
	j EvenOdd
Negative: 
   	addi $t2,$t2,1
	j EvenOdd
is_even:
	addi $t5,$t5,1
	j check
is_odd:
	addi $t6,$t6,1   
	
check:   
	bne $t1,$zero,loop
     
   li $v0,10
   syscall
.end _start
   		  		
.data
.org 10000000
A:      .word -5, 3, 0, 12, -1, 7, 0, 9, -4, 0, -6, 15, -10, 8, 0, 2, -3, 4, -7, 11 
        .word 0, -2, 6, 13, -9, 17, -8, 0, 4, 0, 5, -6, 1, -12, 10, 0, -15, 3, -4, 9 
        .word 0, 8, -1, 7, 0, -10, 11, -3, 6, 0, 5, 12, -9, 0, 14, 8, 0, -7, 1, -5 
        .word 3, -8, 2, -4, 0, 10, -2, 6, 7, 0, -6, 3, -1, 12, 5, 8, 9, -3, 0, 15 
        .word -10, 6, 13, -9, 17, 0, 8, 10, 5, -2, 0, -4, -15, 9, 0, -8, 11, 7, 0, -7 
        .word 4, -3, 0, 12, 6, -5, 8, 1, 0, -2, 4, -1, 10, -3, 7, 9, 0, -10, 5, 12 
        .word 0, 3, 7, 6, -6, 9, -8, 2, -4, 0, 14, 0, -9, 5, 7, -7, 10, 1, 0, -3 
        .word 13, -2, 8, 9, -12, 4, 0, 6, 1, -5, 3, 11, 0, -4, 10, -3, 9, 0, 15, -8
        .word 7, -4, 0, 5, 8, 1, -9, 6, -1, 10,-6, -3, 11, 2, 14, -13, 17, -8, 5, -7
        .word 17, 15, -13, 1, 20, 16, -19, -16, 9, -1, -10, 14, 7, 6, -6, 9, -5, -19, 7, -19
     
 N: .word 0
 P: .word 0
 Z: .word 0
 E: .word 0
 O: .word 0