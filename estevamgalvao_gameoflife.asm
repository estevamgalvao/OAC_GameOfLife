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
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	auxMatrix:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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

	stringStart:	.asciz 	"Digite o numero de pontos a serem inseridos: "
	stringX:	.asciz	"Digite o ponto X: "
	stringY:	.asciz	"Digite o ponto Y: "



	#########################################################
	#							#
	#	s0: Quantidades de pontos X&Y			#
	#	s1: Ponto X atual				#
	#	s2: Ponto Y atual				#
	#	s3: Endereço Matriz				#
	#	s4: Endereço Display				#
	#	s5: Endereço Matriz Auxiliar			#
	#	s6: 						#
	#	s7: 						#
	#	s8:						#
	#	s9:						#
	#	s10:						#
	#	s11:						#
	#							#
	#########################################################

.text

getPoints:	#Conseguir X e Y, os quais o usuário gostaria de pintar no display e começar o jogo

	la	s3, matrix
	la	s4, display
	la	s5, auxMatrix
	
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
	
	
	addi 	sp, sp, -16	#alocando espaço na pilha para salvar nessa ordem: STACK POINTER -> X -> Y -> endereço matriz
	sw	s3, 12(sp)	#salvando o endereço da matriz na pilha
	sw 	s2, 8(sp)	#salvando Y na pilha
	sw 	s1, 4(sp)	#salvando X na pilha
	sw 	ra, 0(sp)	#salvando SP na pilha
	
	call 	userStampMatrix	#marco o ponto (X,Y) na matriz
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 16	#restaurando posição na pilha
	
	###################
	# MARQUEI O PONTO #
	###################
	
	addi	s0, s0, -1
	
	bnez 	s0, loopPoints
	
	
	addi 	sp, sp, -12
	sw	s5, 8(sp)
	sw 	s3, 4(sp)
	sw 	ra, 0(sp)
	
	call	updateAuxMatrix
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 12




	addi 	sp, sp, -12
	sw	s4, 8(sp)
	sw 	s5, 4(sp)
	sw 	ra, 0(sp)
	
	call	updateDisplay
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 12


	#######################
	# ATUALIZEI O DISPLAY #
	#######################
	
	li	s6, 10000
	
firstDelay:

	addi	s6, s6, -1
	bnez 	s6, firstDelay
	
loopKeepPlaying:

	addi	sp, sp, -12
	sw	s5, 8(sp)
	sw	s3, 4(sp)
	sw	ra, 0(sp)
	
	call	play
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 12
	
	#######################
	# JOGUEI GAME OF LIFE #
	#######################
	
	
	
	addi 	sp, sp, -12
	sw	s4, 8(sp)
	sw 	s5, 4(sp)
	sw 	ra, 0(sp)
	
	call	updateDisplay
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 12
	
	#######################
	# ATUALIZEI O DISPLAY #
	#######################
	
	
	addi 	sp, sp, -12
	sw	s5, 8(sp)
	sw 	s3, 4(sp)
	sw 	ra, 0(sp)
	
	call	updateMatrix
	
	lw 	ra, 0(sp)
	addi 	sp, sp, 12
	
	############################################
	# ATUALIZEI A MATRIZ PARA A PRÓXIMA RODADA #
	############################################
	
	
	li	s6, 10000
	
delay:

	addi	s6, s6, -1
	bnez 	s6, delay
	
	j	loopKeepPlaying
	
	
	#### EXIT ####
	li	a7, 10
	ecall
	##############
	
	
	

############################################################################################
#					F U N Ç Õ E S					   #
#											   #
############################################################################################


userStampMatrix: ##################### MARCAR NA MATRIZ O PIXEL ESCOLHIDO PELO USUÁRIO ####################

	lw	t0, 12(sp)	#salvando o endereço inicial da matriz em T0
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
	




updateDisplay: ##################### ATUALIZAR O DISPLAY DE ACORDO COM A MATRIZ ####################

	lw	t0, 4(sp)	#salvando o endereço inicial da matriz auxiliar em T0
	
	lw	t1, 8(sp)	#salvando o endereço do display em T1
	
	li	t3, 15		#colunas
	li	t6, 15		#linhas
	
compareDisplay:

	lw	t4, 0(t0)	#carrego o valor do pixel da matriz auxiliar e salvo em T4
	lw	t5, 0(t1)	#carrego o valor do pixel do display e salvo em T5
	
	bne   	t4, t5, paintDisplay	#comparo se eles são iguais, caso não, vou para label de pintar o display

updateDisplayContinue:

	beqz  	t3, jumpLine	#caso meu contador de colunas chegou ao fim, significa que eu tenho que decrementar o contador de linhas
	
	
jumpPixel:
	
	addi	t0, t0, 4	#incremento meu ponteiro da matriz auxiliar para próxima casa
	addi	t1, t1, 4	#incremento meu ponteiro do display para próxima casa
	addi	t3, t3, -1	#decremento meu contador de colunas
	j	compareDisplay

paintDisplay:

	not	t5, t5		#inverto o valor do pixel no display
	sw	t5, 0(t1)	#pinto ele no endereço apontado pelo "ponteiro" do display
	j	updateDisplayContinue	#volto a função de updateDisplay para verificar os outros pixels

jumpLine:
	
	beqz 	t6, returnFromDisplay	#caso eu entrei aqui, ou seja, minhas colunas já são 0 e meu T6 também for0, significa que minha matriz acabou
	
	addi	t0, t0, 4	#incremento meu ponteiro da matriz auxiliar para próxima casa
	addi	t1, t1, 4	#incremento meu ponteiro do display para próxima casa
	addi	t6, t6, -1	#decremento meu contador de linhas pois desci uma linha
	
	li	t3, 15		#reinicio meu contador de colunas

	j	compareDisplay	#voltar para comparar o pŕoximo pixel

returnFromDisplay:
	
	ret			#retornar a main
	


updateAuxMatrix: ##################### ATUALIZAR O MATRIZ AUXILIAR DE ACORDO COM A MATRIZ ####################

	lw	t0, 4(sp)	#salvando o endereço inicial da matriz em T0
	addi	t0, t0, 76	#saltando 19(x4) casa para ir de fato na malha últil da matriz (pular bordas iniciais)
	
	lw	t1, 8(sp)	#salvando o endereço do AuxMatrix em T1
	
	li	t3, 15		#colunas
	li	t6, 15		#linhas
	
compareAuxMatrix:

	lw	t4, 0(t0)	#carrego o valor do pixel da matriz e salvo em T4
	lw	t5, 0(t1)	#carrego o valor do pixel do AuxMatrix e salvo em T5
	
	bne   	t4, t5, paintAuxMatrix	#comparo se eles são iguais, caso não, vou para label de pintar o AuxMatrix

updateAuxMatrixContinue:

	beqz  	t3, jumpAuxMatrixBorder	#caso meu contador de colunas chegou ao fim, significa que eu tenho que pular bordas na matriz
	
	
jumpAuxMatrixPixel:
	
	addi	t0, t0, 4	#incremento meu ponteiro da matriz para próxima casa
	addi	t1, t1, 4	#incremento meu ponteiro do AuxMatrix para próxima casa
	addi	t3, t3, -1	#decremento meu contador de colunas
	j	compareAuxMatrix

paintAuxMatrix:

	not	t5, t5		#inverto o valor do pixel no AuxMatrix
	sw	t5, 0(t1)	#pinto ele no endereço apontado pelo "ponteiro" do AuxMatrix
	j	updateAuxMatrixContinue	#volto a função de updateAuxMatrix para verificar os outros pixels

jumpAuxMatrixBorder:
	
	beqz 	t6, returnFromAuxMatrix	#caso eu entrei aqui, ou seja, minhas colunas já são 0 e meu T6 também for0, significa que minha matriz acabou
	
	addi	t0, t0, 12	#pulo 3 casas para chegar no próximo pixel da linha de baixo pulando as bordas
	addi	t1, t1, 4	#incremento meu ponteiro da AuxMatrix para próxima casa
	addi	t6, t6, -1	#decremento meu contador de linhas pois desci uma linha
	
	li	t3, 15		#reinicio meu contador de colunas

	j	compareAuxMatrix	#voltar para comparar o pŕoximo pixel

returnFromAuxMatrix:
	
	ret			#retornar a main
	



updateMatrix: ##################### ATUALIZAR O MATRIZ DE ACORDO COM A MATRIZ AUXILIAR ####################

	lw	t0, 4(sp)	#salvando o endereço inicial da matriz em T0
	addi	t0, t0, 76	#saltando 19(x4) casa para ir de fato na malha últil da matriz (pular bordas iniciais)
	
	lw	t1, 8(sp)	#salvando o endereço da matriz auxiliar em T1
	
	li	t3, 15		#colunas
	li	t6, 15		#linhas
	
compareMatrix:

	lw	t4, 0(t0)	#carrego o valor do pixel da matriz e salvo em T4
	lw	t5, 0(t1)	#carrego o valor do pixel do Matrix e salvo em T5
	
	bne   	t4, t5, paintMatrix	#comparo se eles são iguais, caso não, vou para label de pintar o Matrix

updateMatrixContinue:

	beqz  	t3, jumpMatrixBorder	#caso meu contador de colunas chegou ao fim, significa que eu tenho que pular bordas na matriz
	
	
jumpMatrixPixel:
	
	addi	t0, t0, 4	#incremento meu ponteiro da matriz para próxima casa
	addi	t1, t1, 4	#incremento meu ponteiro da matriz auxiliar para próxima casa
	addi	t3, t3, -1	#decremento meu contador de colunas
	j	compareMatrix

paintMatrix:

	not	t4, t4		#inverto o valor do pixel na matriz
	sw	t4, 0(t0)	#pinto ele no endereço apontado pelo "ponteiro" da matriz
	j	updateMatrixContinue	#volto a função de updateMatrix para verificar os outros pixels

jumpMatrixBorder:
	
	beqz 	t6, returnFromMatrix	#caso eu entrei aqui, ou seja, minhas colunas já são 0 e meu T6 também for0, significa que minha matriz acabou
	
	addi	t0, t0, 12	#pulo 3 casas para chegar no próximo pixel da linha de baixo pulando as bordas
	addi	t1, t1, 4	#incremento meu ponteiro da matriz auxiliar para próxima casa
	addi	t6, t6, -1	#decremento meu contador de linhas pois desci uma linha
	
	li	t3, 15		#reinicio meu contador de colunas

	j	compareMatrix	#voltar para comparar o pŕoximo pixel

returnFromMatrix:
	
	ret			#retornar a main






play: ##################### GAME OF LIFE ATUALIZANDO A MATRIZ ####################
	
	
	lw	t6, 8(sp)	#salvando o endereço inicial da matriz auxiliar em T6
	lw	t0, 4(sp)	#salvando o endereço inicial da matriz em T0
	addi	t0, t0, 76	#saltando 19(x4) casa para ir de fato na malha últil da matriz (pular bordas iniciais)
	
	
	
	li	t1, 15		#colunas
	li	t2, 15		#linhas
	li	t5, -2

	
sumNeighborhood:
	
	li	t3, 0		#zerando o acumulador que irá verificar a soma dos 8 vizinhos
				#faço a verificação de cada vizinho logo abaixo
	lw	t4, -76(t0)
	add	t3, t3, t4
	
	lw	t4, -72(t0)
	add	t3, t3, t4
	
	lw	t4, -68(t0)
	add	t3, t3, t4
	
	lw	t4, -4(t0)
	add	t3, t3, t4
	
	lw	t4, 4(t0)
	add	t3, t3, t4
	
	lw	t4, 68(t0)
	add	t3, t3, t4
	
	lw	t4, 72(t0)
	add	t3, t3, t4
	
	lw	t4, 76(t0)
	add	t3, t3, t4
	
	lw	t4, 0(t0)
	
	beqz 	t4, deadPixel
	
alivePixel:
	li	t5, -2
	beq 	t3, t5, nextPixel	#se o pixel está vivo, verifico se ele tem 2 outros vizinhos vivos
	li	t5, -3	
	beq 	t3, t5, nextPixel	#se o pixel está vivo, verifico se ele tem 3 outros vizinhos vivos
	j	switchLife

deadPixel:
	
	li	t5, -3	
	beq 	t3, t5, switchLife	#se o pixel está morto, verifico se ele tem 3 vizinhos vivos
	j	nextPixel
	

switchLife:
	
	not	t4, t4
	sw	t4, 0(t6)	#inverto o valor do pixel selecionado, indicando que ele estava morto e agora vivo ou vice-versa
	j	nextPixel
	
nextPixel:

	beqz  	t1, jumpPlayBorder	#caso meu contador de colunas chegou ao fim, significa que eu tenho que pular bordas na matriz
	

jumpPlayPixel:
	
	addi	t0, t0, 4	#incremento meu ponteiro da matriz para próxima casa
	addi	t6, t6, 4	#incremento meu ponteiro da matriz auxiliar para próxima casa
	addi	t1, t1, -1	#decremento meu contador de colunas
	j	sumNeighborhood
	
	
jumpPlayBorder:
	
	beqz 	t2, returnFromPlay	#caso eu entrei aqui, ou seja, minhas colunas já são 0 e meu T2 também for0, significa que minha matriz acabou
	
	addi	t0, t0, 12	#pulo 3 casas para chegar no próximo pixel da linha de baixo pulando as bordas
	addi	t6, t6, 4	#incremento meu ponteiro da matriz auxiliar para próxima casa
	addi	t2, t2, -1	#decremento meu contador de linhas pois desci uma linha
	
	li	t1, 15		#reinicio meu contador de colunas

	j	sumNeighborhood	#voltar para verificar a vizinhaça do pŕoximo pixel
	

returnFromPlay:
	
	ret
