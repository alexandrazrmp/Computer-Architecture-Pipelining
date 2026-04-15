.text
.globl _start
.ent _start
_start:      
   
#due to continuous allocation of memory

   la $t0, N
   addi $t1,$zero, 200    # $t1 = 200 (μέγεθος του πίνακα)
   lw $t3,4($t0)  # $t3 = P (θετικοί)
   lw $t4,8($t0)  # $t4 = Z (μηδενικοί)
   lw $t6,16($t0) # $t6 = O (περιττοί)


   la $t0,A      # $t0 = διεύθυνση του πίνακα A

   loop:
    lw $t7, 0($t0)
    lw $t2, 4($t0)                # Load current element of A
    addi $t1, $t1, -8             # Decrement size counter
   
    
    slt $t8,$zero,$t7	#1 if positive?

    sltiu $s0,$t7,1	#1 if less than one

    andi $t9, $t7, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers


    lw $t7, 8($t0)               # Load current element of A


	
    slt $t8,$zero,$t2	#1 if positive?

    sltiu $s0,$t2,1	#1 if less than one

    andi $t9, $t2, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers


    lw $t2, 12($t0)


    slt $t8,$zero,$t7	#1 if positive?

    sltiu $s0,$t7,1	#1 if less than one

    andi $t9, $t7, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers

    lw $t7, 16($t0)

    slt $t8,$zero,$t2	#1 if positive?

    sltiu $s0,$t2,1	#1 if less than one

    andi $t9, $t2, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers
    
    lw $t2, 20($t0)


    slt $t8,$zero,$t7	#1 if positive?

    sltiu $s0,$t7,1	#1 if less than one

    andi $t9, $t7, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers


    lw $t7, 24($t0)               # Load current element of A


	
    slt $t8,$zero,$t2	#1 if positive?

    sltiu $s0,$t2,1	#1 if less than one

    andi $t9, $t2, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers


    lw $t2, 28($t0)


    slt $t8,$zero,$t7	#1 if positive?

    sltiu $s0,$t7,1	#1 if less than one

    andi $t9, $t7, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers



    slt $t8,$zero,$t2	#1 if positive?

    sltiu $s0,$t2,1	#1 if less than one

    andi $t9, $t2, 1  	 # Perform bitwise AND with 1

    add $t3,$t3,$t8	#updating positive numbers

    add $t4, $t4, $s0	#adding zero?

    add $t6,$t6,$t9	#adding odd numbers


    addi $t0, $t0, 32              # Move to next element in A	
#loop check
    bne $t1, $zero, loop  


#find negative and even sums
la $t0, N
lw $t2,0($t0)  # $t2 = N (αρνητικοί)
lw $t5,12($t0) # $t5 = E (άρτιοι)
addi $t1,$zero,200
sub $t5,$t1,$t6 #even numbers

sub $t2,$t1,$t3
sub $t2,$t2,$t4

   li $v0,10
   syscall
.end _start
   		  		
.data
.org 1000000

A:      .word -5, 2, 0, 12, -1, 7, 0, 9, -4, 0, -6, 15, -10, 8, 0, 2, -3, 4, -7, 11 
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