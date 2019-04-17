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
				

	
	#matriz:		.space	324 # preencho 18x18 espaços com 0
	
	
	
	matriz:		.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0
				0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
	
	
	#display:	.word	0x10040000 #começa em 0x10010400
	blue:		.word	0xFF
	green:		.word	0xFF00
	red:		.word	0xFF0000
	white:		.word 	0xFFFFFFFF
	#white:		.byte	0xFF			= azul
	stringStart:	.asciz 	"Digite o numero de pontos a serem inseridos: "
	stringX:	.asciz	"Digite o ponto X: "
	stringY:	.asciz	"Digite o ponto Y: "
	auxAdress:	.word	0x00


#########################################################
#							#
#       s1: Quantidade de pontos a serem inseridos	#
#	s2: Ponto X Atual
#	s3: Ponto Y Atual
#	s4: Endereço inicial matriz
#	s5: Endereço inicial display
#	s6: Contador de colunas
#	s7: Contador de linhas
#	s8:
#	s9:
#	s10:
#	s11:
#


.text 

main:
	################### TESTE DE PINTURA COM NOT ######################
	la	t0, display 	#carrego o endereço do primeiro pixel do display
	la	t2, white 	#carrego o endereço da cor WHITE
	lw	t1, 0(t2) 	#carrego o valor de 0 casas descoladas do endereço de WHITE
	
	sw	t1, 0(t0)	#pinto o primeiro pixel do display com o valor carregado em t1
	sw	t1, 4(t0)	#pinto o segundo pixel do display com o valor carregado em t1
	sw	t1, 8(t0)	#pinto o terceiro pixel do display com o valor carregado em t1
	
	
	lw	t5, 4(t0)
	not	t5, t5
	sw	t5, 4(t0)
	not	t5, t5
	sw	t5, 12(t0)
	###################################################################
	
	li	a7, 4
	la	a0, stringStart	#printo na tela a String de início
	ecall
	
	li	a7, 5		#espero o usuário digitar um inteiro (qtd de pontos)
	ecall
				#evitando usar o mov porque ele altera regis. temporários
	la	t2, auxAdress	#carrego o endereço de auxAdress
	sw	a0, 0(t2)	#armazeno o valor de a0 (qtd de pontos) em auxAdress
	lw	s1, 0(t2) 	#leio o valor guardado em auxAdress e salvo em s1
	
	addi sp, sp, -4
	sw ra,  0(sp)
	
	call 	writeUser
	
	lw ra, 0(sp)
	addi sp, sp, 4
	
	addi sp, sp, -4
	sw ra,  0(sp)
	
	call 	copyToDisplay
	
	lw ra, 0(sp)
	addi sp, sp, 4
	
	#### EXIT ####
	li	a7, 10
	ecall
	##############

######################################### FUNÇÃO DE COPIAR CONTEÚDO DA MATRIZ PRO DISPLAY ##############################################
# Ultilizo: t2, t0, t1 #
copyToDisplay:
	la	s4, matriz	#carrego o endereço do primeiro pixel da matriz
	addi	s4, s4, 19	#faço o endereço de início ir uma linha pra baixo e uma coluna pro lado 18x18 -> 19 casas
	
	la	s5, display	#carrego o endereço do primeiro pixel do display

	li	s6, 15		#inicio contador de colunas
	li	s7, 15		#inicio contador de linhas

loopCopyToDisplay:
	
	lw	t0, 0(s4)	#carrego o valor do pixel atual na matriz
	lw	t1, 0(s5)	#carrego o valor do pixel atual no display
	
	bne  	t0,t1,inverseDisplay	#comparo se os valores são iguais, caso não sejam quero inverter o valor do display -> lembrando que meus valores na matriz só podem ser -1 ou 0
	
	addi	s4, s4, 4	#ando um byte inteiro no "ponteiro" da matriz
	addi	s5, s5, 16	#ando 4 bytes pois a exibição no display é em word
	
	
	addi	s6, s6, -1	#decremento meu contador em 1
	beqz 	s6, jumpBorderCopyToDisplay
	



inverseDisplay:
	not 	t2, t1
	sw	t2, 0(s5)
	
jumpBorderCopyToDisplay:
	addi	s4, s4, 3	#faço o ponteiro da matriz pular a borda do final e do início da próxima linha e parar na primeira casa da "malha últil"
	addi 	s7, s7, -1	#decremento o contador de linhas porque acabei de descer uma linha
	li	s6, 15		#restauro o contador de colunas pois voltei para a coluna 0
	
	li 	t3, -1
	bltz 	s7, jumpEndLineCopyToDisplay	#verifico se essa é a última linha
	j 	loopCopyToDisplay

jumpEndLineCopyToDisplay:
	ret
	
	
	
######################################### FUNÇÃO DE ESCRITA DOS PONTOS DO USUÁRIO ##############################################
# Ultilizo: t2, t0, t1 #
writeUser:
	la	s4, matriz
	addi	s4, s4, 19	#faço o endereço de início ir uma linha pra baixo e uma coluna pro lado 18x18 -> 19 casas
	
	
	
	
	li	a7, 4
	la	a0, stringX	#printo na tela o pedido do ponto X
	ecall

	li	a7, 5		#espero o usuário digitar um inteiro (ponto X)
	ecall
				#evitando usar o mov porque ele altera regis. temporários
	la	t2, auxAdress	#carrego o endereço de auxAdress
	sw	a0, 0(t2)	#armazeno o valor de a0 (ponto X) em auxAdress
	lw	s2, 0(t2) 	#leio o valor guardado em auxAdress e salvo em s2
	
	
	
	
	
	li	a7, 4
	la	a0, stringY	#printo na tela o pedido do ponto Y
	ecall

	li	a7, 5		#espero o usuário digitar um inteiro (ponto Y)
	ecall
				#evitando usar o mov porque ele altera regis. temporários
	la	t2, auxAdress	#carrego o endereço de auxAdress
	sw	a0, 0(t2)	#armazeno o valor de a0 (ponto Y) em auxAdress
	lw	s3, 0(t2) 	#leio o valor guardado em auxAdress e salvo em s3
		
	
	# preciso deslocar meu registrador de endereço para o ponto inserido pelo usuário
	# isto é, a distância R do início da matriz até o ponto do usuário => R = 18*Y + X
	
	slli	t0,s3,4		#shifto o valor de s3 (Y) 4 vezes -> Y*16 e salvo em t0
	slli	s3,s3,1		#shifto o valor de s3 (Y) 1 vez -> Y*2 e salvo em s3
	add	s3,s3,t0	#somo o valor de t0 com o de s3 -> Y*16 + Y*2 => Y*18
	
	add	s4, s4, s3	#fiz o ponteiro da matriz receber + Y*18
	add	s4, s4, s2	#fiz o ponteiro da matriz receber + X
	
	lw	t1, 0(s4)	#carrego o valor do pixel atual em t1
	
	not	t1, t1		#inverto o valor de todos os bits do endereço
	sw	t1, 0(s4)	#setei a matriz para começar sempre com 0, então meus valores serão sempre -1 ou 0 dentro da matriz
	
	ret


	
	
	
###########################################################################################################
