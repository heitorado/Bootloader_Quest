org 0x500
jmp 0x0000:start

;para guardar entrada do teclado
input times 2 db 0

dual_enter db 13, 10, 13,10, 0
four_enter db 13,10, 13,10, 13,10, 13,10, 13,10, 0
message1 db '    >Rebooting A.C.L.P....', 13, 10, 13, 10, 0
message2 db '    >Checking for Oxygen Leaks...', 13, 10, 13, 10, 0
message3 db '    >Aligning Solar Panels...', 13, 10, 13, 10, 0
message4 db '    >Purging Water Filter...', 13, 10, 13, 10, 0
message5 db '    >Calibrating door mechanisms...', 13, 10, 13, 10, 0
;message6 db '    >Petting the wolf companion...', 13, 10, 0
;message7 db '    >Lighting the bonfire...', 13, 10, 0
;message8 db '    >Paying tip for the troll...', 13, 10, 0
;message9 db '    >Expelling the orcs...', 13, 10, 0
startKernelMsg db '      >Press Any Key to CONTINUE<', 0

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
    mov al, 13
    int 10h

    ;Alterando cor de Fundo
    mov ah, 0xb
    mov bh, 0
    mov bl, 0
    int 10h

    ;muda cor do texto
    mov bl, 0fh ;branco
    ;mov bl, 10 ;verde
    ;coloca apontador na mensagem
    mov si, dual_enter
    call printa_string


    ;sequencia que mostra mensagens de carregamento
    mov si, message1
    call printa_string
    mov si, message2
    call printa_string
    mov si, message3
    call printa_string
    mov si, message4
    call printa_string
    mov si, message5
    call printa_string
    ;mov si, message6
    ;call printa_string
    ;mov si, message7
    ;call printa_string
    ;mov si, message8
    ;call printa_string
    ;mov si, message9
    ;call printa_string

    ;mostra contorno da barra de loading
    call load_contour
    call load_bar

    ;chama mensagem de start
    mov si, four_enter
    call printa_string
  
    mov si, startKernelMsg
    call printa_string
    
    ;espera usuario pressionar uma tecla
    call wait_confirmation

    ;programa termina aqui

    jmp 0x7e00  ;pula para o setor de endereco 0x7e00 (start do boot2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNÇÕES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
    pusha
    ;coloca 5000 no cx
    MOV     CX, 0H
    MOV     DX, 9248H ;;valor rapido: 4248H
    MOV     AH, 86H
    INT     15H
    popa
    ret

load_contour:
    ;seta posicao inicial do contorno
    mov dx, 110
    mov cx, 40

    .main:
        ;para printar o retangulo branco que aparecerá por fora
        .printOuterx:
            mov ah, 0ch ;pixel na coordenada [dx, cx]
            mov bh, 0
            mov al, 0fh ;cor do pixel (branco)
            int 10h ;interrupção de video
            inc cx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em x
            cmp cx, 270
            je .printOutery
            jmp .printOuterx

        ;para descer a linha (incrementar dx)
        .printOutery:
            ;esse valor deve ser igual o cx original, para manter o tamanho
            mov cx, 40
            inc dx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em y
            cmp dx, 130
            je .InnerCoord
            jmp .printOuterx
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        .InnerCoord: ;muda as coordenadas para deixar uma borda
            mov dx, 111
            mov cx, 41
            jmp .printInnerx
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;para "cavar" o retangulo branco por dentro
        .printInnerx:
            mov ah, 0ch ;pixel na coordenada [dx, cx]
            mov bh, 0
            mov al, 0 ;cor do pixel (preto)
            int 10h ;interrupção de video
            inc cx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em x
            cmp cx, 269
            je .printInnery
            jmp .printInnerx

        ;para descer a linha (incrementar dx)
        .printInnery:
            ;esse valor deve ser igual o cx original, para manter o tamanho
            mov cx, 41
            inc dx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em y
            cmp dx, 129
            je .done
            jmp .printInnerx

            .done:
                ret

load_bar:
    ;seta posicao inicial da barra
    mov dx, 112
    mov cx, 42

    .main:
        ;para printar o retangulo branco que aparecerá por fora

        .printy:
            mov ah, 0ch ;pixel na coordenada [dx, cx]
            mov bh, 0
            mov al, 1 ;cor do pixel (branco)
            int 10h ;interrupção de video
            inc dx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em y
            cmp dx, 128
            je .printx
            jmp .printy

        ;para descer a linha (incrementar dx)
        .printx:
            ;esse valor deve ser igual o cx original, para manter o tamanho
            mov dx, 112
            inc cx  ;incrementa para printar o proximo pixel

            ;ve se ja chegou no tamanho desejado em x
            cmp cx, 268

            call delayText

            je .done
            jmp .printy
        
            .done:
                ret

wait_confirmation:
    pusha
    .main:
        ;coloca apontador na variavel
        mov di, input
        ;ler do teclado
        MOV AH, 0
        INT 16H

        stosb
        ;verifica se foi 'alguma coisa'
        mov dl, al
        cmp dl, 0
        ;se foi, acabou
        JNE .done
        ;senao, continua esperando
        JMP .main

    .done:
        popa
        ret