org 0x500
jmp 0x0000:start

startmsg db 13, 10, 0
message1 db '     Loading Adventure...', 13, 10, 0
message2 db '     Beating gnomes out of the cpu...', 13, 10, 0
message3 db '     Clearing the fairy dust out of the fan...', 13, 10, 0
message4 db '     DEUS VULTing your core...', 13, 10, 0

start:
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov ax, 0x7e0 ;0x7e0<<1 = 0x7e00 (início de kernel.asm)
    mov es, ax
    xor bx, bx    ;posição es<<1+bx

    jmp reset

reset:
    mov ah, 00h ;reseta o controlador de disco
    mov dl, 0   ;floppy disk
    int 13h

    jc reset    ;se o acesso falhar, tenta novamente

    jmp load

load:
    mov ah, 02h ;lê um setor do disco
    mov al, 20  ;quantidade de setores ocupados pelo kernel
    mov ch, 0   ;track 0
    mov cl, 3   ;sector 3
    mov dh, 0   ;head 0
    mov dl, 0   ;drive 0
    int 13h

    jc load     ;se o acesso falhar, tenta novamente

    ;programa começa aqui

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
    mov bl, 0fh
    ;coloca apontador na mensagem
    mov si, startmsg
    call printa_string
    mov si, startmsg
    call printa_string


    mov si, message1
    call printa_string
    mov si, message2
    call printa_string
    mov si, message3
    call printa_string
    mov si, message4
    call printa_string
    call hold

    ;programa termina aqui

    jmp 0x7e00  ;pula para o setor de endereco 0x7e00 (start do boot2)


hold:
    
    jmp hold

;função para exibir a string na tela
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

;responsavel por fazer o texto printar caractere por caractere
delayText:
    ;coloca 5000 no cx
    MOV     CX, 1H
    MOV     DX, 4248H
    MOV     AH, 86H
    INT     15H
    ret