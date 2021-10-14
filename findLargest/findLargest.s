        # Program to find largest integer within list values of size valueCount.
        # list of ints and list size internally stored at memory locations labeled "values" and "valueCount"
        # also displays relative location of value in the list.
        #       Written by Kollen Gruizenga
            
        .data
        .align  2
valueCount:.word 7
values:	.word	23,10,30,99,420,100,49

#---------------------------------------------------

        .text
        .globl  main

main:   move    $s0, $0		# s0: index = 0
        move    $s1, $0		# s1: running largest = 0
        move	$s2, $0		# s2: location of largest in list = 0
        la      $s7, valueCount	# s7: address of number of values in list (n)
        lw	$s3, 0($s7)	# s3: int value of valueCount

loop:   bge     $s0, $s3, done	# while (index < n)
        sll     $t0, $s0, 2	# convert array index into memory offset
        lw      $t1, values($t0)# t0 = next value in list
        ble	$t1, $s1, else	# if curr value > running largest
        addi	$s2, $s0, 0	#set location in list to index
        addi	$s1, $t1, 0	#set running largest to current value in $t1
        addi	$s0, $s0, 1	#index++
        J loop
else: 	addi	$s0, $s0, 1	#index++
	J loop

        
done:   move    $a0, $s1	# display largest value found
        li      $v0, 1
        syscall
        
        move    $a0, $s2	# display location of largest value in list
        li      $v0, 1
        syscall
        
        li      $v0, 10		# TTFN
        syscall
