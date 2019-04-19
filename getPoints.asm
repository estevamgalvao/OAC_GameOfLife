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
	
	matrix:		.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6

	stringStart:	.asciz 	"Digite o numero de pontos a serem inseridos: "
	stringX:	.asciz	"Digite o ponto X: "
	stringY:	.asciz	"Digite o ponto Y: "





	#########################################################
	#							#
	#	s0: Quantidades de pontos X&Y
	#	s1: Ponto X atual
	#	s2: Ponto Y atual
	#	s3: Contador 15
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
	sw 	s2, 8(sp)	#salvando Y na pilha
	sw 	s1, 4(sp)	#salvando X na pilha
	sw 	ra, 0(sp)	#salvando SP na pilha
	
	call 	userStampMatrix	#marco o ponto (X,Y) na matriz
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 12	#restaurando posição na pilha
	
	###################
	# MARQUEI O PONTO #
	###################
	
	addi	s0, s0, -1
	
	bnez 	s0, loopPoints
	
	
	addi sp, sp, -4
	sw ra,  0(sp)
	
	call updateDisplay
	
	lw ra, 0(sp)
	addi sp, sp, 4

		

	
	
	#### EXIT ####
	li	a7, 10
	ecall
	##############
	
	
	
	
	
	

############################################################################################
#					F U N Ç Õ E S					   #
#											   #
############################################################################################
userStampMatrix:

	la	t0, matrix	#salvando o endereço inicial da matriz em T0
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
	
	ret 
	
##################### ATUALIZAR O DISPLAY DE ACORDO COM A MATRIZ ####################

updateDisplay:

	la	t0, matrix	#salvando o endereço inicial da matriz em T0
	addi	t0, t0, 76	#saltando 19(x4) casa para ir de fato na malha últil da matriz (pular bordas iniciais)
	
	la	t1, display	#salvando o endereço do display em T1
	
	li	t3, 15		#PAREI AQUI ACABEI DE INICIALIZAR O CONTADOR PARA VARRER O DISPLAY E A MATRIZ E ENTÃO ATUALIZAR O DISPLAY
	li	t6, 15
	
compareDisplay:

	lw	t4, 0(t0)	#carrego o valor do pixel na matriz e salvo em T4
	lw	t5, 0(t1)	#carrego o valor do pixel no display e salvo em T5
	
	bne   	t4, t5, paintDisplay	#comparo se eles são iguais, caso não, vou para label de pintar o display

updateDisplayContinue:

	beqz  	t3, jumpBorder	#caso meu contador de colunas chegou ao fim, significa que eu tenho que pular bordas na matriz
	
	
jumpPixel:
	
	addi	t0, t0, 4	#incremento meu ponteiro da matriz para próxima casa
	addi	t1, t1, 4	#incremento meu ponteiro do display para próxima casa
	addi	t3, t3, -1	#decremento meu contador de colunas
	j	compareDisplay

paintDisplay:

	not	t5, t5		#inverto o valor do pixel no display
	sw	t5, 0(t1)	#pinto ele no endereço apontado pelo "ponteiro" do display
	j	updateDisplayContinue	#volto a função de updateDisplay para verificar os outros pixels

jumpBorder:
	
	beqz 	t6, returnFromDisplay	#caso eu entrei aqui, ou seja, minhas colunas já são 0 e meu T6 também for0, significa que minha matriz acabou
	
	addi	t0, t0, 12	#pulo 3 casas para chegar no próximo pixel da linha de baixo pulando as bordas
	addi	t1, t1, 4	#incremento meu ponteiro do display para próxima casa
	addi	t6, t6, -1	#decremento meu contador de linhas pois desci uma linha
	
	li	t3, 15		#reinicio meu contador de colunas

	j	compareDisplay

returnFromDisplay:
	
	ret
	
