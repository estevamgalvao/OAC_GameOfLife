.data
	display:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	matrix:		.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	stringStart:	.asciz 	"Digite o numero de pontos a serem inseridos: "
	stringX:	.asciz	"Digite o ponto X: "
	stringY:	.asciz	"Digite o ponto Y: "





	#########################################################
	#							#
	#	s0: Quantidades de pontos X&Y
	#	s1: Ponto X atual
	#	s2: Ponto Y atual
	#	s3: 
	#	s4: 
	#	s5: 
	#	s6: 
	#	s7: 
	#	s8:
	#	s9:
	#	s10:
	#	s11:
	#

.text

getPoints:	#Conseguir X e Y, os quais o usuário gostaria de pintar no display e começar o jogo
	
	li	a7, 4
	la	a0, stringStart	#printo na tela a String de início
	ecall
	
	li	a7, 5		#espero o usuário digitar um inteiro (qtd de pontos)
	ecall
	
	mv	s0, a0		#guardo em S0 quantos pontos o usuário digitou

loopPoints:
	
	li	a7, 4
	la	a0, stringX	#printo na tela o pedido do ponto X
	ecall
	li	a7, 5		#espero o usuário digitar um inteiro (ponto X)
	ecall
	mv	s1, a0		#guardo em S1 o valor de X
	
	
	li	a7, 4
	la	a0, stringY	#printo na tela o pedido do ponto Y
	ecall
	li	a7, 5		#espero o usuário digitar um inteiro (ponto Y)
	ecall
	mv	s2, a0		#guardo em S2 o valor de Y
	
	
	addi 	sp, sp, -12	#alocando espaço na pilha para salvar nessa ordem: STACK POINTER -> X -> Y
	sw 	s1, 8(sp)	#salvando Y na pilha
	sw 	s1, 4(sp)	#salvando X na pilha
	sw 	ra, 0(sp)	#salvando SP na pilha
	
	call 	stampMatrix
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 12	#restaurando posição na pilha
	
	
	
	
	
	
	

####################################### F U N Ç Õ E S #######################################
stampMatrix:
	la	t0, matrix	#salvando o endereço inicial da matriz em t0
	addi	t0, t0, 76	#saltando 19(x4) casa para ir de fato na malha últil da matriz (pular bordas iniciais)
	
	# preciso deslocar meu registrador de endereço para o ponto inserido pelo usuário
	# isto é, a distância R do início da matriz até o ponto do usuário => R = 18*Y + X => R = (18*Y + X)x4 pois são word => R = 72Y + 4X
	
	lw	t2, 8(sp)	#salvando o valor de Y, que estava na pilha, em T1
	lw	t1, 4(sp)	#salvando o valor de X, que estava na pilha, em T1

	slli	t3, t2, 6	#shifto o valor de T2 (Y) 6 vezes -> Y*64 e salvo em T3
	slli	t4, t2, 3	#shifto o valor de T2 (Y) 3 vez -> Y*8 e salvo em T4
	add	t3, t3, t4	#somo o valor de T4 com o de T3 -> Y*64 + Y*8 => 72Y e salvo em T3
	
	slli	t4, t1, 2	#shifto o valor de T1 (X) 2 vezes -> X*4 e salvo em T4
	
	
	add	t0, t0, t3	#fiz o ponteiro da matriz + Y*72
	add	t0, t0, t4	#fiz o ponteiro da matriz + X*4
				#após isso, então, o ponteiro da matriz recebeu 72Y + 4X e está no pixel escolhido pelo usuário
	
	lw	t4, 0(t0)	#leio o valor guardado pelo ponteiro da matriz
	not	t4, t4		#inverto esse valor, pois na matriz só há 0 ou -1
	sw	t4, 0(t0)	#salvo o valor invertido na matriz, ou seja, marquei o ponto escolhido
	
	
	
	