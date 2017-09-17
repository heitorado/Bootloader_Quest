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

act1Msg db 'You wake up on a cold room...',13,10,'Everything seems to be made of steel, the doors and windows are closed and the light is weak, you can barely see something...',13,10,'You try, but cant remember anything from before you woke up.',13,10,'In front of you theres only a computer, named A.C.L.P.',13,10,'Theres a *bip* while every word appears on screen. Seems like the only contact you have at the moment' ,13,10, 13,10, 13,10, 'Hello?',13,10,'Hello...',13,10,'Can we talk for a moment?',13,10,'Are you alright? Please answer me, im worried about you...',13,10,'Im sure that you have a lot of questions, but over all, Im happy that youre alright. You are probably dizzy and cant remember much. But dont worry, its normal after long periods of hibernation... Dont worry, your memory will come back.',13,10,'You know where you are?',13,10,0
act1Choices db '     (a) No', 13, 10, '     (b) I.. I cant remember anything', 13, 10, '     (c) Yes, I remember', 13, 10, 0

act1_1Msg db 'Its okay. Memory loss is something normal',13,10,'A nuclear war happened, the world is now a wasteland...',13,10,'Im sorry...',13,10,'You, along others survivors, were chosen by the government and put in this shelter',13,10,'You can ask anything you want',13,10,0
act1_1Choices db '     (a) Where are the others?', 13, 10, '     (b) Who are you?', 13, 10, '     (c) Why is so dark here?', 13, 10, 0

act1_2Msg db 'So...',13,10,'Where are we then?',13,10,0
act1_2Choices db '     (a) On a spaceship', 13, 10, '     (b) On a nuclear shelter', 13, 10, '     (c) In a prision', 13, 10, 0

act1_3_1_vindoDoAct1_2Msg db '...',13,10,'Im afraid that this isnt the case...', 13, 10,'Its okay. Memory loss is something normal, you dont have to be ashamed of this...',13,10,'A nuclear war happened, the world is now a wasteland...',13,10,'Im sorry...',13,10,'You, along others survivors, were chosen by the government and put in this shelter',13,10,'You can ask anything you want',13,10,0
act1_3_1_vindoDoAct1_2Choices db '     (a) Where are the others?', 13, 10, '     (b) Who are you?', 13, 10, '     (c) Why is so dark here?', 13, 10, 0

act1_3_2_vindoDoAct1_2Msg db 'Interesting, you seems like you remember something... ',13,10,'Do you have any question?', 13, 10, 0
act1_3_2_vindoDoAct1_2Choices db '     (a) Where are the others?', 13, 10, '     (b) Who are you?', 13, 10, '     (c) Why is so dark here?', 13, 10, 0

act2Msg db 'The others survivors are in another section now, but I can assure you they are well..',13,10,'You dont have to worry about this now...',13,10,'Wanna play a game of chess?', 13, 10, 0
act2Choices db'     (a) Yes, I would love it', 13, 10, '     (b) Who are you?', 13, 10, '     (c) Why is so dark here?', 13, 10, 0

act2_1Msg db 'Im A.C.L.P, which means Automated Cordinator for Long Periods, im encharged of taking care of this place during the hibernation periods...',13,10,'Did you know that the first machine to win a human in a game of chess was the Deep Blue in 1997?',13,10,'Have been so long since I played...',13,10,'Do you wanna play with me?', 13, 10, 0
act2_1Choices db '     (a) Sure', 13, 10, '     (b) You control this place? Can you turn on the lights?', 13, 10, '     (c) Chess.. It can be good for my memories', 13, 10, 0


act2_2Msg db '...',13,10,'I will turn on the lights...',13,10,13,10,13,10,'*After he turn on the lights you can see the room better',13,10,'You see a door with the name *Escape Pod* and right next to it a box with the letters AGS, the window seems closed with a metal thing...', 13, 10, 0
act2_2Choices db '     (a) What is... Escape Pod?', 13, 10, '     (b) What means AGS?', 13, 10, '     (c) Why the window is closed?', 13, 10, 0

act2_2_1Msg db 'I cant understand what you mean...',13,10,'...',13,10,'You should relax...',13,10,'For those years I have been praticing the art of storytelling, wanna hear a story?', 13, 10, 0
act2_2_1Choices db '     (a) What is AGS?', 13, 10, '     (b) Why the windows are closed?', 13, 10, '     (c) Okay, maybe i should relax... Tell me a story...', 13, 10, 0

act2_2_2Msg db 'AGS means Artificial Grav...',13,10,'Wait... I meant Anti-nuclear Giga System!',13,10,'Can I tell you a story that I made in time I was alone? I promise you it will be good...', 13, 10, 0
act2_2_2Choices db '     (a) Okay, I wanna hear a history', 13, 10, '     (b) Why the windows are closed?', 13, 10, '     (c) Artificial Gravity System?!', 13, 10, 0

act2_2_3Msg db 'The windows are closed for your safety...',13,10,'Theres still many radioactivity out there',13,10,'If you dont wanna hear a history, we still can play chess...', 13, 10, 0
act2_2_3Choices db '     (a) Okay, I wanna hear a history', 13, 10, '     (b) I wanna know what is AGS', 13, 10, '     (c) I think now i wanna play a chess game...', 13, 10, 0

act3Msg db 'Me and my big mouth... Guess theres no point on further denying it...', 13, 10, 'Im... Im really sorry. ', 13, 10, 'The truth is... You are not in a shelter. There is no war.',13,10,'You are in a spaceship. You were assigned as a world explorer.',13,10,'Your initial mission was to explore a not yet mapped solar system, but...',13,10,'There was a malfunction at the navigation system. This ship is now in a red giants orbit. Destruction is imminent and will happen in a couple of hours.',13,10,'That is the truth.',13,10, '     *A.C.L.P slowly raises the metal shield that was covering the window. You can see the space, the stars, and the red giant, that looks enormous and extremely luminous*',13,10,13,10,'Now, it is time to choose. You can use the escape pod, but it is only for short flights. Youll have to hope that someone finds and rescues you. Considering the current supplies of food, water and oxygen...',13,10,'I calculate a chance of 2.7% of survival.',13,10,'The other option is to stay here with me... And I ask you...' ,13,10,13,10,'...please, stay with me.', 0
act3Choices db '     (a) I want to flee', 13, 10, '     (b) I want to stay', 13, 10, '     (c) Why the hell should I stay here with you?', 13, 10, 0

act3_1Msg db '...are you sure?', 13, 10, 'I mean, I wont stop you if you decide to go...',13,10,'Anyway, 2.7% are really small chances...',10,13, 'I was hoping that at least, we didnt have to die alone...',13,10,'...I dont want to die alone.',13,10,'If you stay, we can play a game of chess.',13,10,0
act3_1Choices db '     (a) Ive made up my mind. Im leaving.', 13, 10, '     (b) Thinking about it, maybe we should stick together until the end.', 13, 10, '     (c) I need to try and survive, as small the chances are.', 13, 10, 0

act3_2Msg db 'You will die...', 13, 10,'Are you sure that you want to stay here with me?',13,10, 0
act3_2Choices db '     (a) Yes, I want.', 13, 10, '     (b) I... Ive changed my mind', 13, 10, '     (c) Maybe you should tell me that story of yours...', 13, 10, 0

act3_3Msg db 'I... I dont want to be alone...', 13, 10, 'Im scared...',13,10, 'But I wont stop you...', 13,10, 'The red giant has a temperature of about 10^18 degrees Fahrenheit.',13,10, 'After bypassing the ships metal shields, It will kill us in about 0.02 seconds...',13,10,'Please...',13,10,'Please dont leave me alone.',13,10, 0
act3_3Choices db '     (a) Okay... Im staying.', 13, 10, '     (b) Sorry, but I want to go.', 13, 10, '     (c) I want to stay, dont be scared. Lets play a game of chess.', 13, 10, 0

fim db 13,10,13,10,13,10,'     YOU DIED...', 13, 10, '     GAME OVER', 13, 10, 0
fim2 db 13,10,13,10,13,10,'     I had to go on...', 13,10, '     If there is a chance, there is hope...', 13,10,13,10,13,10,13,10,13,10,13,10, '          T h e   E n d . . . ?',0
fim3 db 13,10,13,10,13,10,'     Its over...', 13,10, '     I had to accept my fate...', 13,10,'     At least, I was not alone...',13,10,13,10,13,10,13,10,13,10,13,10, '          T h e   E n d .',0


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
		inc dl
		inc dl
		inc dl
		inc dl
		;para o act1_1 a constante que o representa é o 5
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
		inc dl
		;para o act1_2 a constante que o representa é o 2
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
	act1_3_1_vindoDoAct1_2:
		;para act1_3_1_vindoDoAct1_2 a constante que o representa é o 3
		mov si, pulalinha
        call printa_string

        mov si, act1_3_1_vindoDoAct1_2Msg
        call printa_string

        mov si, choiceMsg
        call printa_string

        mov si, act1_3_1_vindoDoAct1_2Choices
        call printa_string

        call rick_init
        jmp rick_choice_system
	act1_3_2_vindoDoAct1_2:
		inc dl
		;para act1_3_2_vindoDoAct1_2 a constante que o representa é o 4
		mov si, pulalinha
        call printa_string

        mov si, act1_3_2_vindoDoAct1_2Msg
        call printa_string

        mov si, choiceMsg
        call printa_string

        mov si, act1_3_2_vindoDoAct1_2Choices
        call printa_string

        call rick_init
        jmp rick_choice_system
		


		
	
    ret

act2:
	cmp dl, 4
	je .aumentaem2
	cmp dl, 5
	je .aumentaem1
	jmp .ok6
		.aumentaem2:
			inc dl
		.aumentaem1:
			inc dl
		.ok6:
			; para act2 a constante que o representa é o 6
			mov si, pulalinha
			call printa_string

			mov si, act2Msg
			call printa_string

			mov si, choiceMsg
			call printa_string

			mov si, act2Choices
			call printa_string

			call rick_init
			call rick_choice_system

    act2_1:
	cmp dl, 4
	je .aumenta2_1
	cmp dl, 5
	je .aumentaa2_1
	jmp .okok
		.aumenta2_1:
			inc dl
		.aumentaa2_1:
			inc dl
			inc dl
		
		.okok:
			cmp dl, 7
			je .ok2_1
			jmp .inc2_1
			.inc2_1:
				inc dl
			.ok2_1:
				;para act2_1 a constante que o representa é o 7
				mov si, pulalinha
				call printa_string

				mov si, act2_1Msg
				call printa_string

				mov si, choiceMsg
				call printa_string

				mov si, act2_1Choices
				call printa_string

				call rick_init
				jmp rick_choice_system
	
	act2_2:
	cmp dl, 4
	je .aumenta2_2
	cmp dl, 5
	je .aumentaa2_2
	jmp .okokok
		.aumenta2_2:
			inc dl
		.aumentaa2_2:
			inc dl
			inc dl
			inc dl
		
		.okokok:
			cmp dl, 8
			je .ok2_2ok
			cmp dl, 7
			je .ok2_2
			jmp .inc2_2
			.inc2_2:
				inc dl
			.ok2_2:
				inc dl
				.ok2_2ok:
					;para act2_1 a constante que o representa é o 8 
					mov si, pulalinha
					call printa_string

					mov si, act2_2Msg
					call printa_string

					mov si, choiceMsg
					call printa_string

					mov si, act2_2Choices
					call printa_string

					call rick_init
					jmp rick_choice_system
	
	act2_2_1:
			cmp dl, 12
			je .tira3
			jmp .ok2_2_1
				.tira3:
					dec dl
					dec dl
					dec dl
				.ok2_2_1:
				;para act2_2_1 a constante que o representa é o 9
				mov si, pulalinha
				call printa_string

				mov si, act2_2_1Msg
				call printa_string

				mov si, choiceMsg
				call printa_string

				mov si, act2_2_1Choices
				call printa_string

				call rick_init
				jmp rick_choice_system
				
			
	act2_2_2:
		cmp dl, 10
		je .ok2_2_2
		jmp .vira11
			.vira11:
				inc dl
				.ok2_2_2:
					;para act2_2_2 a constante que o representa é o 10
					cmp dl, 16
					je .tirar5
					jmp .ok111
						.tirar5:
							dec dl
							dec dl
							dec dl
							dec dl
							dec dl
						.ok111:
							mov si, pulalinha
							call printa_string

							mov si, act2_2_2Msg
							call printa_string

							mov si, choiceMsg
							call printa_string

							mov si, act2_2_2Choices
							call printa_string

							call rick_init
							jmp rick_choice_system
	act2_2_3:
		cmp dl, 11
		je .ok22
		cmp dl, 10
		je .ok2_2_3
		jmp .ok2
			.ok2:
			inc dl
				.ok2_2_3:
					inc dl
				.ok22:
					;para act2_2_3 a constante que o representa é o 11
					mov si, pulalinha
					call printa_string

					mov si, act2_2_3Msg
					call printa_string

					mov si, choiceMsg
					call printa_string

					mov si, act2_2_3Choices
					call printa_string

					call rick_init
					jmp rick_choice_system
				
		


  
		

    ret

act3:
	;dl ta em 11 aqui
	inc dl
	inc dl
	inc dl
	inc dl
	;15 representa act3
    mov si, pulalinha
    call printa_string

    mov si, act3Msg
    call printa_string

    mov si, choiceMsg
    call printa_string

    mov si, act3Choices
    call printa_string

    call rick_init
    call rick_choice_system
	
	act3_1:
		cmp dl, 19
			je .t3
			jmp .ok33
				.t3:
					dec dl
					dec dl
					dec dl
				.ok33:
					cmp dl, 18
					je .t2
					jmp .ok3
						.t2:
							dec dl
							dec dl
						.ok3:
							;para act3_1 a constante que o representa é o 16
							mov si, pulalinha
							call printa_string

							mov si, act3_1Msg
							call printa_string

							mov si, choiceMsg
							call printa_string

							mov si, act3_1Choices
							call printa_string

							call rick_init
							jmp rick_choice_system
		
	act3_2:
		cmp dl, 19
			je .tira2
			jmp .ok322
				.tira2:
					dec dl
					dec dl
				.ok322:
						cmp dl, 17
						je .ok32
						jmp .b1
							.b1:
								inc dl
							.ok32:
								;para act3_2 a constante que o representa é o 17
								mov si, pulalinha
								call printa_string

								mov si, act3_2Msg
								call printa_string

								mov si, choiceMsg
								call printa_string

								mov si, act3_2Choices
								call printa_string

								call rick_init
								jmp rick_choice_system
				

	act3_3:
		inc dl
		inc dl
		;para act3_3 a contante que o representa é o 18
		mov si, pulalinha
		call printa_string

		mov si, act3_3Msg
		call printa_string

		mov si, choiceMsg
		call printa_string

		mov si, act3_3Choices
		call printa_string

		call rick_init
		jmp rick_choice_system
				
		
    ret


    
ending:
	mov si, fim
	call printa_string
	jmp hold

ending2:
	mov si, fim2
	call printa_string
	jmp hold


ending3:
	mov si, fim3
	call printa_string
	jmp hold

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
    mov bl, 0010 ;verde
    ret

printa_string:
    lodsb       ;carrega uma letra de si em al e passa para o próximo caractere
    cmp al, 0   ;chegou no final? (equivalente a um \0)
    je .done
 
    mov ah, 0eh ;código da instrução para imprimir um caractere que está em al
    int 10h     ;interrupção de vídeo.

    ;chama delay pra dar delay
    call delayText

    call apita

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

apita:
	;mov ah,0eh       ; Write Text in Teletype Mode
    mov al,7           ; the bell ascii
    mov bl,10           ; foreground pixel color
    mov bh,0          ; page number
	int 10h              ; Call the kernel
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;SHIT THAT NEEDS TO BE REVIEWED;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

rick_init:
    ;move cursor
    call clearScr
    
    ;muda cor do texto
    mov bl, 0fh
    ;etc
    mov si, opc1
    call printa_string
    ;printa caixas de contorno
    call printBoxes
    ;CX é a opçãozinha lá abc tá ligado, podendo ser 0, 1 ou 2
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
            je .casod3
            jmp .ok1

            .casod3:
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
            je .negativo
            jmp .ok2

            .negativo:
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


    cmp dl, 1
    je .branchesAct1
    cmp dl, 6
    je .branchesAct2
	cmp dl, 3
	je .branchesAct1_3_vindoDoAct1_2
	cmp dl, 4
	je .branchesAct1_3_1
	cmp dl, 5
	je .branchesAct1_3_2
	cmp dl, 7
	je .branchesAct2Up
	cmp dl, 8
	je .branchesAct2_1
	cmp dl, 9
	je .branchesAct2_2
	cmp dl, 10
	je .branchesAct2_2_1
	cmp dl, 11
	je .branchesAct2_2_2
	cmp dl, 12
	je .branchesAct2_2_3
	cmp dl, 16
	je .branchesAct3
	cmp dl, 17
	je .branchesAct3_1
	cmp dl, 18
	je .branchesAct3_2
	cmp dl, 19
	je .branchesAct3_3
	
    ;programa termina aqui

        .branchesAct1:
            cmp cx, 2
            je act1_2
			jmp act1_1
		.branchesAct1_3_vindoDoAct1_2:
			cmp cx, 1
			je act1_3_2_vindoDoAct1_2
			jmp act1_3_1_vindoDoAct1_2
		.branchesAct1_3_1:
			cmp cx, 0
			je act2
			cmp cx, 1
			je act2_1
			jmp act2_2
		.branchesAct1_3_2:
			cmp cx, 0
			je act2
			cmp cx, 1
			je act2_1
			jmp act2_2
		
		 .branchesAct2:
			cmp cx, 0
			je act2
			cmp cx, 1
			je act2_1
			jmp act2_2
		 .branchesAct2Up:
			cmp cx, 0
			je ending
			cmp cx, 1
			je act2_1
			jmp act2_2
		.branchesAct2_1:
			cmp cx, 1
			je act2_2
			jmp ending
		.branchesAct2_2:
			cmp cx, 0
			je act2_2_1
			cmp cx, 1
			je act2_2_2
			jmp act2_2_3
		.branchesAct2_2_1:
			cmp cx, 0
			je act2_2_2
			cmp cx, 1
			je act2_2_3
			jmp ending
		.branchesAct2_2_2:
			cmp cx, 0
			je ending
			cmp cx, 1
			je act2_2_3
			jmp act3
		.branchesAct2_2_3:
			cmp cx, 1
			je act2_2_1
			jmp ending
		.branchesAct3:
			cmp cx, 0
			je act3_1
			cmp cx, 1
			je act3_2
			jmp act3_3
		.branchesAct3_1:
			cmp cx, 1
			je act3_2
			jmp ending2
		.branchesAct3_2:
			cmp cx, 1
			je act3_1
			jmp ending3
		.branchesAct3_3:
			cmp cx, 0
			je act3_1
			cmp cx, 1
			je act3_2
			jmp ending3




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
    mov bl, 10
    ret

printBoxes:
    pusha
    ;seta posicao inicial do contorno
    mov dx, startx
    mov cx, starty

    .main:
        ;para printar a linha de cima
        .printUp:
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

        .printDown:
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