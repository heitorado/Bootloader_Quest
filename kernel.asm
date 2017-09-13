org 0x7e00
jmp 0x0000:start

pulalinha db 13,10,0
message db '   O romance inicia-se numa situacao posterior a todos os seus acontecimentos.', 13, 10, 0
message2 db '   Bento Santiago, ja um homem de idade, conta ao leitor como recebeu a alcunha de Dom Casmurro.',13, 10, 0
message3 db '   A expressao fora inventada por um jovem poeta, que tentara ler para ele no trem alguns de seus versos.', 13, 10, 'Como Bento cochilara durante a leitura, o rapaz ficou chateado e comecou a chama-lo daquela forma.', 13, 10, 0

start:
	xor ax, ax
	mov ds, ax
	mov es, ax

	;Iniciando modo de video
    mov ah, 0
    mov al, 12h
    int 10h

    ;Alterando cor de Fundo
    mov ah, 0xb
    mov bh, 0
    mov bl, 0
    int 10h

    ;muda cor do texto
    mov bl, 0fh ;branco

    mov si, pulalinha
    call printa_string
	mov si, message
	call printa_string
	mov si, message2
	call printa_string
	mov si, message3
	call printa_string

	call hold



hold:

 	jmp hold

done:
	jmp $

printa_string:
    lodsb       ;carrega uma letra de si em al e passa para o próximo caractere
    cmp al, 0   ;chegou no final? (equivalente a um \0)
    je .done
 
    mov ah, 0eh ;código da instrução para imprimir um caractere que está em al
    int 10h     ;interrupção de vídeo.

    ;chama delay pra dar delay
    call delayText

    jmp printa_string ;loop

    .done:   
        ret


delayText:
    pusha
    ;coloca 5000 no cx
    MOV     CX, 0H
    MOV     DX, 9248H
    MOV     AH, 86H
    INT     15H
    popa
    ret