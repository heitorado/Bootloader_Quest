
org 0x7e00
jmp 0x0000:start

;;FOR PRINTING STROKES AT CHOICE SYSTEM
startx equ 395
endx equ 450
starty equ 165
endy equ 415

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;FOR USE WITH RICK'S CHOICE SYSTEM;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CursorCol db 0
CursorLin db 10

;para guardar entrada do teclado
input times 2 db 0

opc1 db '                       >(a)          (b)          (c)', 13,10,0
opc2 db '                        (a)         >(b)          (c)', 13,10,0
opc3 db '                        (a)          (b)         >(c)', 13,10,0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


pulalinha db 13,10,0
choiceMsg db 13,10,13, 10,  0

act1Msg db 'Voce acorda em uma sala fria...',13,10,'Tudo parece ser feito de metal, as portas e janelas trancadas, a luz esta muito fraca e voce mal consegue ver alem disso...',13,10,'Voce nao lembra de nada anterior ao momento que voce acordou',13,10,'Na sua frente, ha apenas um computador, embaixo tem escrito em letras grandes C.A.L.D.',13,10,'Ele emite um *bip* enquanto palavras aparecem em sua tela, parece ser seu unico contato no momento' ,13,10, 13,10, 13,10, 'Ola?',13,10,'Ola...',13,10,'Podemos falar um instante?',13,10,'Voce esta bem? Por favor me responda, estou preoucupado...',13,10,'Tenho certeza que voce tem muitas perguntas, mas acima de tudo, estou feliz que voce esta bem, voce provavelmente esta desorientado, nao se preoucupe e normal apos longos periodos de hibernacao, nao se preoucupe sua memoria vai voltar...',13,10,'Voce sabe onde estamos?',13,10,0
act1Choices db '     (a) Nao', 13, 10, '     (b) Nao consigo me lembrar', 13, 10, '     (c) Sim, eu lembro', 13, 10, 0
act1_1Msg db '1.1Voce acorda em uma sala fria...',13,10,'Tudo parece ser feito de metal, as portas e janelas trancadas, a luz esta muito fraca e voce mal consegue ver alem disso...',13,10,'Voce nao lembra de nada anterior ao momento que voce acordou',13,10,'Na sua frente, ha apenas um computador, embaixo tem escrito em letras grandes C.A.L.D.',13,10,'Ele emite um *bip* enquanto palavras aparecem em sua tela, parece ser seu unico contato no momento' ,13,10, 13,10, 13,10, 'Ola?',13,10,'Ola...',13,10,'Podemos falar um instante?',13,10,'Voce esta bem? Por favor me responda, estou preoucupado...',13,10,'Tenho certeza que voce tem muitas perguntas, mas acima de tudo, estou feliz que voce esta bem, voce provavelmente esta desorientado, nao se preoucupe e normal apos longos periodos de hibernacao, nao se preoucupe sua memoria vai voltar...',13,10,'Voce sabe onde estamos?',13,10,0
act1_1Choices db '1.1     (a) Nao', 13, 10, '     (b) Nao consigo me lembrar', 13, 10, '     (c) Sim, eu lembro', 13, 10, 0
act1_2Msg db '1.2Voce acorda em uma sala fria...',13,10,'Tudo parece ser feito de metal, as portas e janelas trancadas, a luz esta muito fraca e voce mal consegue ver alem disso...',13,10,'Voce nao lembra de nada anterior ao momento que voce acordou',13,10,'Na sua frente, ha apenas um computador, embaixo tem escrito em letras grandes C.A.L.D.',13,10,'Ele emite um *bip* enquanto palavras aparecem em sua tela, parece ser seu unico contato no momento' ,13,10, 13,10, 13,10, 'Ola?',13,10,'Ola...',13,10,'Podemos falar um instante?',13,10,'Voce esta bem? Por favor me responda, estou preoucupado...',13,10,'Tenho certeza que voce tem muitas perguntas, mas acima de tudo, estou feliz que voce esta bem, voce provavelmente esta desorientado, nao se preoucupe e normal apos longos periodos de hibernacao, nao se preoucupe sua memoria vai voltar...',13,10,'Voce sabe onde estamos?',13,10,0
act1_2Choices db '1.2     (a) Nao', 13, 10, '     (b) Nao consigo me lembrar', 13, 10, '     (c) Sim, eu lembro', 13, 10, 0


act2Msg db '   ACT 1You wake up on a cold ice cave. Your back and head hurts.', 13, 10, '   You struggle to make some sense out of this.', 13, 10, '   But everything you remember is that you were walking home last night.', 13, 10, '   Then suddenly, a shadow, a crack, a scream and a loud noise.', 13, 10, '   Your head hurts when you try to remember.', 13, 10, 13, 10,'   Behind you there is a dark cave. You cant see more than two feet inside it.', 13, 10, '   Fallen next to you, there is your old leather bag.', 13, 10, '   In front of you there is an ice stairway, with what seems to be light,',13,10,'   flickering from the underground.', 13, 10, 0
act3Msg db '   ACT 2You wake up on a cold ice cave. Your back and head hurts.', 13, 10, '   You struggle to make some sense out of this.', 13, 10, '   But everything you remember is that you were walking home last night.', 13, 10, '   Then suddenly, a shadow, a crack, a scream and a loud noise.', 13, 10, '   Your head hurts when you try to remember.', 13, 10, 13, 10,'   Behind you there is a dark cave. You cant see more than two feet inside it.', 13, 10, '   Fallen next to you, there is your old leather bag.', 13, 10, '   In front of you there is an ice stairway, with what seems to be light,',13,10,'   flickering from the underground.', 13, 10, 0
act4Msg db '   ACT 3You wake up on a cold ice cave. Your back and head hurts.', 13, 10, '   You struggle to make some sense out of this.', 13, 10, '   But everything you remember is that you were walking home last night.', 13, 10, '   Then suddenly, a shadow, a crack, a scream and a loud noise.', 13, 10, '   Your head hurts when you try to remember.', 13, 10, 13, 10,'   Behind you there is a dark cave. You cant see more than two feet inside it.', 13, 10, '   Fallen next to you, there is your old leather bag.', 13, 10, '   In front of you there is an ice stairway, with what seems to be light,',13,10,'   flickering from the underground.', 13, 10, 0
act5Msg db '   ACT 4You wake up on a cold ice cave. Your back and head hurts.', 13, 10, '   You struggle to make some sense out of this.', 13, 10, '   But everything you remember is that you were walking home last night.', 13, 10, '   Then suddenly, a shadow, a crack, a scream and a loud noise.', 13, 10, '   Your head hurts when you try to remember.', 13, 10, 13, 10,'   Behind you there is a dark cave. You cant see more than two feet inside it.', 13, 10, '   Fallen next to you, there is your old leather bag.', 13, 10, '   In front of you there is an ice stairway, with what seems to be light,',13,10,'   flickering from the underground.', 13, 10, 0

;teste db 13,10,13,10, '     you stupid piece of shit. why would you choose that?', 13,10,0

start:
    xor ax, ax
    mov ds, ax
    mov es, ax

    ;inicializa modo de video
    call init

    ;começa historia
    call act1
    
    ;so pro programa nao fugir
    call hold

done:
    jmp $


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;HÍSTÓRIA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

act1:
    mov dl, 0

    mov si, pulalinha
    call printa_string

    mov si, act1Msg
    call printa_string

    mov si, choiceMsg
    call printa_string

    mov si, act1Choices
    call printa_string

    call rick_init
    jmp rick_choice_system

    act1_1:
        mov si, pulalinha
        call printa_string

        mov si, act1_1Msg
        call printa_string

        mov si, choiceMsg
        call printa_string

        mov si, act1_1Choices
        call printa_string

        call rick_init
        jmp rick_choice_system

    act1_2:
        mov si, pulalinha
        call printa_string

        mov si, act1_2Msg
        call printa_string

        mov si, choiceMsg
        call printa_string

        mov si, act1_2Choices
        call printa_string

        call rick_init
        jmp rick_choice_system

    ret

act2:
    mov si, pulalinha
    call printa_string

    mov si, act1Msg
    call printa_string

    mov si, choiceMsg
    call printa_string

    mov si, act1Choices
    call printa_string

    call rick_init
    call rick_choice_system

    ret
act3:
    mov si, pulalinha
    call printa_string

    mov si, act2Msg
    call printa_string

    mov si, choiceMsg
    call printa_string

    mov si, act1Choices
    call printa_string

    call rick_init
    call rick_choice_system

    ret
act4:
    mov si, pulalinha
    call printa_string

    mov si, act3Msg
    call printa_string

    mov si, choiceMsg
    call printa_string

    mov si, act1Choices
    call printa_string

    call rick_init
    call rick_choice_system

    ret
act5:
    mov si, pulalinha
    call printa_string

    mov si, act4Msg
    call printa_string

    mov si, choiceMsg
    call printa_string

    mov si, act1Choices
    call printa_string

    call rick_init
    call rick_choice_system

    ret
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
    mov bl, 0010 ;branco
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
    MOV     CX, 0h
    MOV     DX, 100000
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
    ;printa caixas de contorno
    call printBoxes
    
    mov cx, 0
    ret

rick_choice_system:
    mov di, input
    call wait_choice_input
    call clearScr
    cmp al, 100
    je .funcao1
    jmp .funcao2

        .funcao1:
            inc cx
            
            cmp cx, 3
            je .negativo
            jmp .ok1

            .negativo:
                dec cx
                dec cx
                dec cx
                jmp .parte1
            .ok1:
                cmp cx, 1
                je .parte2
                jmp .parte3

        .funcao2:
            cmp al, 0dh
            je confirm_choice

            dec cx

            cmp cx, -1
            je .zero
            jmp .ok2

            .zero:
                inc cx
                inc cx
                inc cx
                jmp .parte3
            .ok2:
               cmp cx, 1
                je .parte2
                jmp .parte1


        .parte1:
            mov si, opc1
            call print_nodelay
            call printBoxes
        jmp rick_choice_system
        .parte2:
            mov si, opc2
            call print_nodelay
            call printBoxes
        jmp rick_choice_system  
        .parte3:
            mov si, opc3
            call print_nodelay
            call printBoxes
        jmp rick_choice_system

confirm_choice:
    ;mov si, teste
    ;call printa_string
    call clearAll
    inc dl

    ;navega pelo ato 1
    cmp dl, 1
    je .branchesAct1

    ;se vai pro ato 2
    cmp dl, 2
    je .branchesAct1_x
    ;se vai pro ato 3
    cmp dl, 3
    je act4
    ;se vai pro ato 4
    cmp dl, 4
    je act5
    ;se vai pro ato 5
    cmp dl, 5
    je ending
    ;programa termina aqui

        .branchesAct1
            cmp cx, 2
            je act1_2
            jmp act1_1
        .branchesAct1_x
            cmp 





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


clearAll:
    pusha
    mov ah, 0
    mov al, 12h
    int 10h
    popa
    mov bl, 0fh
    ret

printBoxes:
    pusha
    ;seta posicao inicial do contorno
    mov dx, startx
    mov cx, starty

    .main:
        ;para printar a linha de cima
        .printUp
            mov ah, 0ch ;pixel na coordenada [dx, cx]
            mov bh, 0
            mov al, 0fh ;cor do pixel (branco)
            int 10h ;interrupção de video
            inc cx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em x
            cmp cx, endx
            jne .printUp
            mov cx, starty
            jmp .printSidesX

        ;para printar as bordas laterais
        .printSidesX:
            ;ve se ja chegou no tamanho desejado em x
            cmp cx, starty
            je .printPixel
            jmp .continue

            .printPixel:
                mov ah, 0ch ;pixel na coordenada [dx, cx]
                mov bh, 0
                mov al, 0fh ;cor do pixel (branco)
                int 10h ;interrupção de video
                cmp cx, endx
                je .printSidesY

            .continue:
                inc cx  ;incrementa para printar o proximo pixel

            cmp cx, endx
            je .printPixel
            jmp .printSidesX

        ;para descer a linha (incrementar dx)
        .printSidesY:
            ;esse valor deve ser igual o cx original, para manter o tamanho
            mov cx, starty
            inc dx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em y
            cmp dx, endy
            je .printDown
            jmp .printSidesX

        .printDown
            mov ah, 0ch ;pixel na coordenada [dx, cx]
            mov bh, 0
            mov al, 0fh ;cor do pixel (branco)
            int 10h ;interrupção de video
            inc cx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em x
            cmp cx, endx
            jne .printDown
            jmp .done


            .done:
                popa
                ret