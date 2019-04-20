.data	

vetor:		.word	0,0,-1
			-1,0,0
			-1,0,-1

zero:		.word 	0

.text
	la	s0, vetor
	addi	s0, s0, 16
	
	mv	s1, s0
	
	mv	s2, zero
	addi	s2, s2, 4
	
	mv	s3, zero
	
loopToBack:
	addi	s1, s1, -4
	
	lw	t0, 0(s1)
	add	s3, s3, t0
	
	addi	s2, s2, -1

	bnez  	s2, loopToBack


	mv	s1, s0
	
	mv	s2, zero
	addi	s2, s2, 4
	
	

loopToFront:
	addi	s1, s1, 4
	
	lw	t0, 0(s1)
	add	s3, s3, t0
	
	addi	s2, s2, -1
	
	bnez 	s2, loopToFront

	#### EXIT ####
	li	a7, 10
	ecall
	##############
	
	
	
		
	