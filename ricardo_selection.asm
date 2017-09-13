WORD_SIZE equ 2
org 0x500
jmp 0x0000:start
letra times WORD_SIZE db 0

opc1 db '>i', 13,10,0
opc2 db ' j', 13,10,0
opc3 db ' n', 13,10,0

opc11 db ' i', 13,10,0
opc22 db '>j', 13,10,0
opc33 db ' n', 13,10,0

opc111 db ' i', 13,10,0
opc222 db ' j', 13,10,0
opc333 db '>n', 13,10,0

end db 'continua no proximo episodio...', 13,10,0

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
    mov bl, 10
 
    mov si, opc1
    call printa_string
    mov si, opc2
    call printa_string
    mov si, opc3
    call printa_string
    mov cx, 0

main:
    mov di, letra
    call ler_string
    call clear_ne
    mov dl, al
    cmp dl, 119
    je .funcao1
    jmp .funcao2

        .funcao1:
            dec cx
            
            cmp cx, -1
            je .negativo
            jmp .ok1

            .negativo:
                inc cx
                inc cx
                inc cx
                jmp .parte3
            .ok1:
                cmp cx, 1
                je .parte2
                jmp .parte1

        .funcao2:
            cmp dl, 0dh
            je new

            inc cx

            cmp cx, 3
            jl .ok2
            jmp .zero

            .zero:
                dec cx
                dec cx
                dec cx
                jmp .parte1
            .ok2:
               cmp cx, 1
                je .parte2
                jmp .parte3


        .parte1:
            mov si, opc1
            call printa_string
            mov si, opc2
            call printa_string
            mov si, opc3
            call printa_string
        jmp main
        .parte2:
            mov si, opc11
            call printa_string
            mov si, opc22
            call printa_string
            mov si, opc33
            call printa_string
        jmp main  
        .parte3:
            mov si, opc111
            call printa_string
            mov si, opc222
            call printa_string
            mov si, opc333
            call printa_string
        jmp main
new:
    mov si, end
    call printa_string
    ;programa termina aqui

    jmp 0x7e00  ;pula para o setor de endereco 0x7e00 (start do boot2)
ler_string:
    
    ;ler do teclado
    MOV AH, 0
    INT 16H

    ;mostra o que esta sendo digitado
    ;mov AH, 0xe ;Número da chamada
    ;mov BH, 0 ;Número da página.
    ;int 10h

    ;verifica se foi \n
    ;CMP AL, 0dh
    ;se foi, acabou
    ;JE .done

    ;senao, salva e le a prox
    stosb
    ;JMP ler_string

    ;.done:
        ;pula linha
        ;mov AH, 0xe ;Número da chamada
        ;mov AL, 10 ;Caractere em ASCII a se escrever
        ;mov BH, 0 ;Número da página.
        ;int 10h
        ;volta
        
        ret

hold:
    
    jmp hold


printa_string:
    lodsb       ;carrega uma letra de si em al e passa para o próximo caractere
    cmp al, 0   ;chegou no final? (equivalente a um \0)
    je .done
 
    mov ah, 0eh ;código da instrução para imprimir um caractere que está em al
    int 10h     ;interrupção de vídeo.

    ;chama delay pra dar delay
    ;call delay

    jmp printa_string ;loop

    .done:   
        ret

clear_ne:
    pusha
    mov ah, 0
    mov al, 12h
    int 10h
    popa
    ret
delay:
    pusha
    ;coloca 5000 no cx
    MOV     CX, 1H
    MOV     DX, 4248H
    MOV     AH, 86H
    INT     15H
    popa
            ret
