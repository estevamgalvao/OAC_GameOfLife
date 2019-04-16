.data
	display:	.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
				

	
	matriz:		.space	324 # preencho 18x18 espaços com 0
	
	
	
	#matriz:		.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
				0,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
				0,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,0
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
	
	
	#display:	.word	0x10040000 #começa em 0x10010400
	blue:		.word	0xFF
	green:		.word	0xFF00
	red:		.word	0xFF0000
	white:		.word 	0xFFFFFF
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

	la	t0, display 	#carrego o endereço do primeiro pixel do display
	la	t2, white 	#carrego o endereço da cor WHITE
	lw	t1, 0(t2) 	#carrego o valor de 0 casas descoladas do endereço de WHITE
	
	sw	t1, 0(t0)	#pinto o primeiro pixel do display com o valor carregado em t1
	sw	t1, 4(t0)	#pinto o segundo pixel do display com o valor carregado em t1
	sw	t1, 8(t0)	#pinto o terceiro pixel do display com o valor carregado em t1

	li	a7, 4
	la	a0, stringStart	#printo na tela a String de início
	ecall
	
	li	a7, 5		#espero o usuário digitar um inteiro (qtd de pontos)
	ecall
				#evitando usar o mov porque ele altera regis. temporários
	la	t2, auxAdress	#carrego o endereço de auxAdress
	sw	a0, 0(t2)	#armazeno o valor de a0 (qtd de pontos) em auxAdress
	lw	s1, 0(t2) 	#leio o valor guardado em auxAdress e salvo em s1
	
	
	call 	writeUser
	
	#### EXIT ####
	li	a7, 10
	ecall
	##############



copyToDisplay:
	la	s4, matriz	#carrego o endereço do primeiro pixel da matriz
	addi	s4, s4, 19	#faço o endereço de início ir uma linha pra baixo e uma coluna pro lado 18x18 -> 19 casas
	
	la	s5, display	#carrego o endereço do primeiro pixel do display
loopCopyToDisplay:

	li	s6, s6, 15
	li	s7, s7, 15
	
	lw	t0, 0(s4)	#carrego o valor do pixel atual na matriz
	lw	t1, 0(s5)	#carrego o valor do pixel atual no display
	
	bne  	t0,t1,inverseDisplay
	
	addi	s4, s4, 1	#ando um byte inteiro no "ponteiro" da matriz
	addi	s5, s5, 4	#ando 4 bytes pois a exibição no display é em word
	
	addi	s6, s6, -1
	beqz 	s6, loop2CopyToDisplay
	



inverseDisplay:
	not 	t2, t1
	sw	t2, 0(s5)
	
loop2CopyToDisplay:
		
	
	
	
######################################### FUNÇÃO DE ESCRITA DOS PONTOS DO USUÁRIO ##############################################
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
	
	add	s4, s4, s3	
	add	s4, s4, s2
	
	not	t0, 0(s4)	#inverto o valor de todos os bits do endereço e em seguida salvo no mesmo endereço
	sw	t0, 0(s4)	#setei a matriz para começar sempre com 0, então meus valores serão sempre -1 ou 0 dentro da matriz
	
	ret


	
	
	
###########################################################################################################