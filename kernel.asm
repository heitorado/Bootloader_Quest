org 0x7e00
jmp 0x0000:start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;FOR USE WITH RICK'S CHOICE SYSTEM;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CursorCol db 0
CursorLin db 10

;para guardar entrada do teclado
input times 2 db 0

opc1 db '    >(a)', 13,10,0
opc2 db '     (b)', 13,10,0
opc3 db '     (c)', 13,10,0

opc11 db '     (a)', 13,10,0
opc22 db '    >(b)', 13,10,0
opc33 db '     (c)', 13,10,0

opc111 db '     (a)', 13,10,0
opc222 db '     (b)', 13,10,0
opc333 db '    >(c)', 13,10,0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


pulalinha db 13,10,0
choiceMsg db 13,10, '           ...what do you do?', 13, 10, 13, 10,  0

introMsg db '   You wake up on a cold ice cave. Your back and head hurts.', 13, 10, '   You struggle to make some sense out of this.', 13, 10, '   But everything you remember is that you were walking home last night.', 13, 10, '   Then suddenly, a shadow, a crack, a scream and a loud noise.', 13, 10, '   Your head hurts when you try to remember.', 13, 10, 13, 10,'   Behind you there is a dark cave. You cant see more than two feet inside it.', 13, 10, '   Fallen next to you, there is your old leather bag.', 13, 10, '   In front of you there is an ice stairway, with what seems to be light,',13,10,'   flickering from the underground.', 13, 10, 0
introChoices db '     (a) Check out the tunnel', 13, 10, '     (b) Search for any memories inside your bag', 13, 10, '     (c) Go down the ice stairway', 13, 10, 0

teste db 13,10,13,10, '     you stupid piece of shit. why would you choose that?', 13,10,0

start:
	xor ax, ax
	mov ds, ax
	mov es, ax

    ;inicializa modo de video
	call init

    ;começa historia
    call intro
    
    ;so pro programa nao fugir
	call hold

done:
	jmp $


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;HÍSTÓRIA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

intro:
    mov si, pulalinha
    call printa_string

    mov si, introMsg
    call printa_string

    mov si, choiceMsg
    call printa_string

    mov si, introChoices
    call printa_string

    call rick_init
    call rick_choice_system

    ret

act1:
act2:
act3:
act4:
act5:
ending:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNÇÕES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init:
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
    ret

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

print_nodelay:
    lodsb       ;carrega uma letra de si em al e passa para o próximo caractere
    cmp al, 0   ;chegou no final? (equivalente a um \0)
    je .done
 
    mov ah, 0eh ;código da instrução para imprimir um caractere que está em al
    int 10h     ;interrupção de vídeo.

    jmp print_nodelay ;loop

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

hold:

    jmp hold



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;SHIT THAT NEEDS TO BE REVIEWED;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

rick_init:
    ;move cursor
    call clearScr
    ;muda cor do texto
    mov bl, 10
    ;etc
    mov si, opc1
    call printa_string
    mov si, opc2
    call printa_string
    mov si, opc3
    call printa_string
    mov cx, 0
    ret

rick_choice_system:
    mov di, input
    call wait_choice_input
    call clearScr
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
            je confirm_choice

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
            call print_nodelay
            mov si, opc2
            call print_nodelay
            mov si, opc3
            call print_nodelay
        jmp rick_choice_system
        .parte2:
            mov si, opc11
            call print_nodelay
            mov si, opc22
            call print_nodelay
            mov si, opc33
            call print_nodelay
        jmp rick_choice_system  
        .parte3:
            mov si, opc111
            call print_nodelay
            mov si, opc222
            call print_nodelay
            mov si, opc333
            call print_nodelay
        jmp rick_choice_system

confirm_choice:
    mov si, teste
    call printa_string
    ;programa termina aqui

    jmp 0x7e00  ;pula para o setor de endereco 0x7e00 (start do boot2)


wait_choice_input:
    
    ;ler do teclado
    MOV AH, 0
    INT 16H
    stosb      
        ret

clearScr:
    pusha
    ;seta coluna do cursor
    mov dl, 0
    ;seta linha do cursor
    mov dh, 25
    ;interrupcao pra mudar a posição do cursor pra [dh,dl]
    mov ah, 02h
    mov bh, 00
    int 10h
    popa
    ret

;;;;;;;;original;;;;;
;clearScr:
;    pusha
;    mov ah, 0
;    mov al, 12h
;    int 10h
;    popa
;    ret