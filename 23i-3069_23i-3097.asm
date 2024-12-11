


; ==============================================================================
;   BURHAN ASLAM & SHACE TARIQ
;   23I - 3097 & 23I - 3069
;   BS SE
;   FAST National Univeristy of Computer and Emerging Scinces, Islamabad Campus.
;   COAL Final Semester Project (FALL 2024)
;   BRICK BREAKER
;  =============================================================================




INCLUDE Irvine32.inc
INCLUDE macros.inc
Includelib winmm.lib

PlaySound PROTO,
pszSound:PTR BYTE,
hmod : DWORD,
fdwSound : DWORD

BUFFER_SIZE = 501
.386
.model flat, stdcall
.stack 4096

.data
asdfg dd 0
;/////////////////////////////////////////
;///////////////SOUND////////////////////
;////////////////////////////////////////
SND_FILENAME DWORD 00020000h
SND_LOOP DWORD  00000008h
SND_ASYNC DWORD 00000001h
SND_NOSTOP DWORD 00000010h
file  BYTE "explosion.wav", 0
file2 BYTE "ayein_meme.wav",0
file3 BYTE "Voicy_MemeOkay_.wav",0
file4 BYTE "victory.wav",0
file5 BYTE "among_us_trap_remix.wav",0
file6 BYTE "ChinTapakDamDam.wav",0
file7 BYTE "criquet.wav",0
file8 BYTE "moyemoye.wav",0
file9 BYTE "wot_victory.wav",0
file1 BYTE "oooeee.wav",0

screen  db "1----------------------------------------------------------------------------------------------------------------------2"
        db "|name:               Score:                      BRICKS BREAKER                                          Lives: $ $ $  |"
        db "|                                                  (Level   )                                                          |"
        db "3----------------------------------------------------------------------------------------------------------------------4"

layout2 db "1----------------------------------------------------------------------------------------------------------------------2"
        db "|             # ## #          # ## #          # ## #          # ## #          # ## #          # ## #                   |"                                                                                            
        db "|            # *  * #        # *  * #        # *  * #        # *  * #        # *  * #        # *  * #                  |"
        db "|           * *    * #      * *    * #      * *    * #      * *    * #      * *    * #      * *    * #                 |"
        db "|          # *      * #    # *      * #    # *      * #    # *      * #    # *      * #    # *      * #                |"    
        db "|         # *        * #  # *        * #  # *        * #  # *        * #  # *        * #  # *        * #               |"
        db "|          # *      * #    # *      * #    # *      * #    # *      * #    # *      * #    # *      * #                |"
        db "|           * *    * #      * *    * #      * *    * #      * *    * #      * *    * #      * *    * #                 |"
        db "|            # *  * #        # *  * #        # *  * #        # *  * #        # *  * #        # *  * #                  |"
        db "|             # ## #          # ## #          # ## #          # ## #          # ## #          # ## #                   |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                       O                                                                              |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                               ====================                                                                   |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "3----------------------------------------------------------------------------------------------------------------------4"
layout1 db "1----------------------------------------------------------------------------------------------------------------------2"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"    
        db "|                               #                                     #                                #               |"
        db "|                              # #                                   # #                              # #              |"
        db "|           #                 # # #                #                # # #                #           # # #             |"
        db "|          # #               # # # #              # #              # # # #              # #         # # # #            |"
        db "|         # # #               # # #              # # #              # # #              # # #         # # #             |"
        db "|        # # # #               # #              # # # #              # #              # # # #         # #              |"
        db "|         # # #                 #                # # #                #                # # #           #               |"
        db "|          # #                                    # #                                   # #                            |"
        db "|           #                                      #                                     #                             |"
        db "|                                                                                                                      |"
        db "|                                       O                                                                              |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                               =========================                                                              |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "3----------------------------------------------------------------------------------------------------------------------4"

pause1  db "1----------------------------------------------------------------------------------------------------------------------2"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                    ##########   ##########  #        #  ###########  ##########                                      |"
        db "|                    #        #   #        #  #        #  #            #                                               |"
        db "|                    #        #   #        #  #        #  #            #                                               |"
        db "|                    #        #   #        #  #        #  #            #                                               |"
        db "|                    ##########   ##########  #        #  #            #                                               |"
        db "|                    #            #        #  #        #  ###########  ##########                                      |"
        db "|                    #            #        #  #        #            #  #                                               |"
        db "|                    #            #        #  #        #            #  #                                               |"
        db "|                    #            #        #  #        #            #  #                                               |"
        db "|                    #            #        #  ##########  ###########  ##########                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                  1-------------------------------------------------------------2                                     |"
        db "|                  |    Press 'r' to resume                                      |                                     |"
        db "|                  |    Press 'm' to return to main menu                         |                                     |"
        db "|                  |    Press 'x' to exit                                        |                                     |"
        db "|                  3-------------------------------------------------------------4                                     |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "3----------------------------------------------------------------------------------------------------------------------4",


layout3 db "1----------------------------------------------------------------------------------------------------------------------2"
        db "|      +         #         #         #         #         *         #         #         %         #         #         * |"
        db "|     # #       # #       # #       % #       # #       # #       # #       # #       # #       # #       # #       # #|"    
        db "|    *   #     +   #     #   *     #   #     #   #     #   #     #   #     #   #     #   #     #   .     #   #     #   |"
        db "|   #     #   #     #   #     #   #     #   #     #   #     #   *     #   #     #   .     #   #     #   #     #   +    |"
        db "|  #   #   # #   #   # #   #   # #   #   # #   #   # #   #   # #   #   # #   #   # #   #   # #   #   # #   #   # #   . |"
        db "| #         #         #         #         .         #         .         #         #         #         #         #      |"
        db "|. .   #   # .   #   # .   #   . .   .   # .   *   . .   #   # #   #   # .   #   . .   #   . .   #   . .   #   . #   # |"
        db "|   .     #   .     #   .     #   %     %   .     .   .     .   .     #   .     .   .     .   .     .   .     .   #    |"
        db "|    .   #     .   #     .   .     %   %     .   .     .   .     .   %     .   *     .   .     .   .     .   .     *   |"
        db "|     . #       . #       . .       . .       . .       . .       . #       . .       . .       . .       . .       * #|"
        db "|      .         .         .         .         %         .         *         #         .         .         .         # |"
        db "|                                                                                                                      |"
        db "|                                       O                                                                              |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                               ===============                                                                        |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "|                                                                                                                      |"
        db "3----------------------------------------------------------------------------------------------------------------------4"




temp db 0
out_s db "YOU LOST!!! ",0AH,0
WIN_ST DB "YOU WON :)",0AH, 0
win_s db "LEVEL I COMPLETED!!! Press any key(char) to continue to level II or X to exit ",0
win_s2 db "LEVEL II COMPLETED!!! Press C to continue to level III or X to exit ",0
lev2_inp db ?
size2 dd ?
size1 dd ?
paddle_s dd 2312
paddle_e dd 2336
ball_pos dd 1600
ball_pos_constant dd 1600
ball_dx dd -1
ball_dy dd 1
paddle_1 dd 4
paddle_2 dd 5
out1 db 3
win1 db 0
win2 db 0
paddle_speed dd 3
;;;;
score dd 0 
score_x db 1
score_y db 1
lev dd 0
lives_position1 dd 232
lives_position2 dd 234
lives_position3 dd 236
double_pos_const dd 0
double_pos dd 2
p db ?
double_hit dd 0
removed_brick_count db 0


;User name

       brekN1 BYTE  "          .____  .___,  ___   ___ .__ __                                   ", 0ah
           BYTE     "          | |) ) |    \|_ _| / __\| |/ /                                   ", 0ah
         BYTE       "          |  _ \ | |) | | | | |   | ^ /                                    ", 0ah
          BYTE      "          | |_) || _ <  | | | |__,| . \                                    ",0ah
            BYTE    "          |____/ |_|\_\|___| \___||_|\_\                                   ",0ah
      BYTE" .____  .___,  .___,   _      ___ .__ __ .___, .___,                      ",0ah
     BYTE " | |) ) |    \ |  _|  / \    / __\| |/ / |  _| |    \                     ", 0ah
  BYTE    " |  _ \ | |) | | |_  / ^ \  | |   | ^ /  | |_  | |) |                     ",0ah
  BYTE    " | |_) || _ <  | |_ / ^^^ \ | |__,| . \  | |_  | _ <                      ", 0ah
  BYTE    " |____/ |_|\_\ |___/_/   \_\ \___||_|\_\ |___| |_|\_\                     ",    0ah               
      BYTE"                     Press 1 to Start                                     ", 0ah, 0




nameprmpt BYTE "Enter Your Name: ",0

;MEnu 


comment @
choice BYTE "                                            Enter your choice: ",0
menu2 BYTE " ",0ah,0
menu1 BYTE "                                             ====(WELCOME TO MAIN MENU)====   ",0
menu3 BYTE " ", 0
menu4 BYTE " ",0AH,0
menu5 BYTE "                                                  1. START GAME", 0Ah, 0
menu6 BYTE "                                                  2. INSTRUCTIONS", 0Ah, 0
menu7 BYTE "                                                  3. HIGH SCORES", 0Ah, 0
menu9 BYTE "                                                  4. LEVELS", 0Ah, 0
menu8 BYTE "                                                  5. EXIT", 0Ah, 0
inmenu BYTE ?

@


; ===========================(MENU)===============================
m1  db "******************************************************", 0Ah, 0
m2  db " ==============(WELCOME TO MAIN MENU)==========   ", 0
m3  db "1. START GAME", 0Ah, 0
m4  db "2. INSTRUCTIONS", 0Ah, 0
m5  db "3. HIGH SCORES", 0Ah, 0
m6  db "4. LEVELS", 0Ah, 0
m7  db "5. EXIT", 0Ah, 0
m8  db "******************************************************", 0Ah, 0
ii db "Plz Enter the value between 1 - 5 only  : ",0ah, 0     ; ii == invalid input.
cp db "Enter your choice : ", 0              ; cp = choice prompt.
choice db ?



inst  BYTE "==============(WELCOME TO INSTRUCTIONS)=============",0ah,0
inst3 BYTE "Use A ===> To move the paddle LEFT",0ah,0
inst4 BYTE "Use D ===> To move the paddle RIGHT",0ah,0
inst7 BYTE "Use P ===> To PAUSE the game",0ah,00
inst1 BYTE "Use R ===>  To RESUME the game",0ah,0
inst5 BYTE "Press 0 ===>  To EXIT game",0ah,0
inst6 BYTE "Press 1 ===> To come back to the menu",0ah,0
instS BYTE "Your SCORE is ====> ",0
inst_inp byte ?
 
 

LEV_ BYTE "=============(WELCOME TO LEVELS)==========",0AH,0
LEV1 BYTE "Press 1 ===> Level # 01",0AH,0
LEV2 BYTE "Press 2 ===> Level # 02",0AH,0
LEV3 BYTE "Press 3 ===> Level # 03",0AH,0
LEVC BYTE "Choose the Level from the following ====> ",0   ; pl = prompt level.


;//HIGH SCORE

HS1 BYTE "               HIGH SCORES  ",0AH,0

        ;;;FILE HANDLING 
 PRMPT BYTE "NAME                  SCORE               LEVEL",0AH,0
 inputname BYTE 25 DUP (?)
 levelno db 2
  filename BYTE "bhighscore.txt",0
 filename1 db "hs.txt",0
fileHandle Handle  ?
buffer BYTE BUFFER_SIZE DUP(?)
stringLength DWORD ?
    prompt1 BYTE "Cannot create file",0dh,0ah,0
    prompt2 BYTE "Enter message: ",0
    prompt4 BYTE "Enter size: ",0
    prompt3 BYTE "Enter a Number: ",0
    space db "      ", 0
    task1arr db 10 dup(0)
    task1arrsize db ?
    i db 0
	j db 0
	swapped db 0
   a dd ?
   b dd ?
   bytesW dd ?
   q db ?
  temp1 dd ?
  temp2 dd ?
    Istr BYTE 11 DUP(0)    ; Buffer to store the resulting string (including null terminator)
    len DWORD ? 
    
    cc1 db 0
    

    ;/////////////Game Over/////////////

gameOver BYTE "          ________   __  _______  ____ _   _________", 0ah,
              "         / ___/ _ | /  |/  / __/ / __ \ | / / __/ _ \", 0ah,
              "        / (_ / __ |/ /|_/ / _/  / /_/ / |/ / _// , _/", 0ah,
              "        \___/_/ |_/_/  /_/___/  \____/|___/___/_/|_|", 0ah, 0ah, 0
                                             




.code 




;;;;FILE HANDLING
writenum PROC
mov eax, 0
    push ecx
    mov edx,OFFSET filename
    call CreateOutputFile
    mov fileHandle,eax
    cmp eax, INVALID_HANDLE_VALUE ; error found?
    jne file_ok
    ; no: skip
    mov edx,OFFSET prompt1
    ; display error
    call WriteString
    jmp quit
    file_ok:
        mov eax,fileHandle
        mov edx, esi
        pop ecx
        call WriteToFile
        
        mov bytesW, eax
        MOV edx, Offset filename
        mov eax,fileHandle
        call CloseFile
    quit:
    ret
writenum endP



;2comment @
 Q2 PROC
    mov edx,OFFSET filename
    call OpenInputFile
    mov fileHandle,eax
    cmp eax,INVALID_HANDLE_VALUE 
    jne file_ok1
    mWrite "Cannot open file",0dh,0ah
    jmp quit1
    file_ok1:
        mov edx,OFFSET buffer
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc check_buffer_size

        check_buffer_size:
        cmp eax,BUFFER_SIZE
        ; buffer large enough?
        jb buf_size_ok
        ; yes
        mWrite "Error: Buffer too small for the file",0dh,0ah
        jmp quit1
        ; and quit
        buf_size_ok:
        mov b, eax
          
    quit1:
    mov eax, fileHandle
    CALL CLOSEFILE
    ret
Q2 endP
;@

ADD_SPACE PROC 
push edi
mov edi, offset space
SPACEl:
mov al, [edi]
MOV [ESI],AL
inc ebx
INC ESI
LOOP SPACEl
pop edi

RET
ADD_SPACE ENDP


WRITENAME PROC
MOV ebx, b
mov edi, offset inputname


mov esi, offset buffer 
mov ecx, lengthof inputname
add esi, ebx
addname:
mov al, [edi]
cmp al, 0
je finish
mov [esi], al
inc esi
inc ebx
inc edi

loop addname

;nexL:
;jmp nexL

finish:
mov esi, offset buffer
add esi, ebx
MOV ECX, 12
CALL ADD_SPACE

;;;score

    mov eax, score
    ;mov al, score          ; Load the number into eax
         ; Load the address of str into edx
    push ebx
    call itos
    pop ebx
    mov esi, offset buffer
    add esi, ebx

mov ecx, len
dec edi

addscr:
mov al, [edi]
MOV [ESI], al
inc ebx
dec edi
inc esi
loop addscr

MOV ECX, 18
CALL ADD_SPACE

mov eax, lev
call itos

mov esi, offset buffer
 add esi, ebx

mov ecx, len
dec edi

addslvl:
mov al, [edi]
MOV [ESI], al
inc ebx
dec edi
inc esi
loop addslvl
mov al, 0Ah
mov [esi], al

mov ecx, ebx
inc ecx
mov esi, offset buffer

call writenum


RET
WRITENAME ENDP

;;;;Int to string
itos PROC
push ebx

mov bl, 10
mov edi, offset Istr
mov len, 0
loop1:
cmp al, 0
je ex
div bl
mov q, al
add ah, 48
mov [edi], ah
inc edi
inc len
mov eax, 0
mov al,q
jmp loop1



ex:

;pop esi
pop ebx
;pop eax
ret
itos ENDP


;Name
SHOWNAME PROC


mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file
invoke PlaySound, esi, 0, eax
mov eax, lightcyan
call SetTextColor
mov edx, offset brekN1
call writestring

CALL READINT

call clrscr
mov edx,offset nameprmpt
call WriteString
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file2
invoke PlaySound, esi, 0, eax
mov edx,offset inputname 
mov ecx, sizeof inputname
call ReadString

mov a, eax

ret
SHOWNAME ENDP


;;;;;;;;;;INSTRUCTIONS;;;;;;;;;;;

INSTRUCTIONS PROC
mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file7
invoke PlaySound, esi, 0, eax

MOV EDX, OFFSET inst
CALL WRITESTRING

MOV EDX, OFFSET inst3
CALL WRITESTRING
MOV EDX, OFFSET inst4
CALL WRITESTRING
MOV EDX, OFFSET inst7
CALL WRITESTRING
MOV EDX, OFFSET inst1
CALL WRITESTRING
MOV EDX, OFFSET inst5
CALL WRITESTRING
MOV EDX, OFFSET inst6
CALL WRITESTRING

call readint
cmp al,0
je GLOBAL_EXIT
call clrscr
call MENU


exitI:
ret
INSTRUCTIONS ENDP



;;;;;;levels;;;;;;;;;
LEVELS PROC
mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file7
invoke PlaySound, esi, 0, eax


MOV EDX, OFFSET LEV_
CALL WRITESTRING
MOV EDX, OFFSET LEV1
CALL WRITESTRING
MOV EDX, OFFSET LEV2
CALL WRITESTRING
MOV EDX, OFFSET LEV3
CALL WRITESTRING

MOV EDX, offset inst5
call writestring
call crlf
MOV EDX, OFFSET LEVC
CALL WRITESTRING

call readint

cmp al,0
je GLOBAL_EXIT

cmp al, 3
je lev3Call
cmp al, 2
je lev2Call
mov lev,1
call level1
jmp reti
lev2Call:
mov lev, 2
call level2
jmp reti
lev3Call:
mov lev, 3
call level3

reti:
jmp GLOBAL_EXIT
RET
LEVELS ENDP



;========================MENU======================

MENU PROC

mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file4
invoke PlaySound, esi, 0, eax

  call clrscr

    mov eax, 2
    call settextcolor

    mov dl,30
    mov dh,3
    call gotoxy
    mov edx,OFFSET m1
    call writestring
    mov eax, 6
    call settextcolor
    mov dl,30
    mov dh,5
    call gotoxy
    mov edx, OFFSET m2
    call WriteString
    call crlf
    mov dl,30
    mov dh,7
    call gotoxy
    mov edx, OFFSET m3
    call WriteString
    call crlf
    mov dl,30
    mov dh,9
    call gotoxy
    mov edx, OFFSET m4
    call WriteString
    call crlf
    mov dl,30
    mov dh,11
    call gotoxy
    mov edx, OFFSET m5
    call WriteString
    call crlf
    mov dl,30
    mov dh,13
    call gotoxy
    mov edx, OFFSET m6
    call WriteString
    call crlf
    mov dl,30
    mov dh,15
    call gotoxy
    mov edx, OFFSET m7
    call WriteString
    call crlf
     mov eax,2               
    call SetTextColor
    mov dl,30
    mov dh,17
    call gotoxy
    mov edx, OFFSET m8
    call WriteString
    call crlf

mov eax, cyan
call settextcolor

mov edx, offset cp
call WriteString

mov edx, offset choice
mov ecx, sizeof choice

call Readdec                 ; reading integer value from the user.
mov choice, al               ; choice ==> value user entered for the menu

validate_input:
    cmp choice, 1
    jl not_valid

    cmp choice, 5
    jg not_valid

    jmp fine

not_valid:
    mov eax, red
    call settextcolor
    call crlf
    mov edx, offset ii
    call writeString
    call crlf

    mov eax, cyan
    call settextcolor


    mov edx, offset cp
    call writeString

    mov edx, offset choice
    mov ecx, sizeof choice

    call Readdec
    mov choice, al
    jmp validate_input

    fine:
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file3
invoke PlaySound, esi, 0, eax

cmp choice, 2
je InstL
cmp choice, 1
je GameL
cmp choice, 4
je levL
cmp choice,3
je HSL
jmp ex

HSL:
call clrscr
CALL SHOW_HIGHSCORES
jmp ex

levL:
call clrscr
call LEVELS

GameL:
call clrscr
call level1 
jmp ex

InstL:
call Clrscr
call INSTRUCTIONS
ex:
ret
MENU ENDP

;;;;;;;;;HIGH SCORES;;;;;;;;;;

SHOW_HIGHSCORES proc
mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file7
invoke PlaySound, esi, 0, eax
mov  edx, offset HS1
call writestring

mov edx, offset buffer
call writestring

MOV EDX, offset inst5
call writestring
MOV EDX, offset inst6
call writestring
call readint
cmp al, 0
je GLOBAL_EXIT
call clrscr
call MENU
RET
SHOW_HIGHSCORES ENDP




;=================
   level1 Proc
;=================
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file5
invoke PlaySound, esi, 0, eax
mov eax,1
mov lev,eax

gameloop:
cmp out1,0
jz out3
 cmp win1,1
 jz win_game

mov esi,offset layout1
call move_paddle
mov esi,offset layout1
call ball_movement
mov eax,40
call delay
mov dh,0
mov dl,0
call Gotoxy

mov eax,sizeof screen
mov edx,0
mov ebx,4
mul ebx
mov size1,eax
mov esi,offset screen
call draw
CALL SCORE_Display
mov eax,SIZEOF layout1
mov bx,25
mul bx
mov size1,eax
mov dh,4
mov dl,0
call Gotoxy
mov esi,offset layout1
call draw
mov esi,offset layout1
call win_1

jmp gameloop

out3:
call clrscr
call GAME_OVER

jmp l11

win_game:
mov al,0
mov win1,al
call clrscr
mov edx,offset win_s
call writeString
call readchar
cmp al, 'x'
je l11
lll:
call level2

l11:
ret

level1 endp


;=================
   level2 Proc
;=================
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file5
invoke PlaySound, esi, 0, eax
mov eax,2
mov lev,eax

mov eax,1600
mov ball_pos,eax

mov eax,0
mov ball_dx,eax

mov eax,1
mov ball_dx,eax


mov eax,2312
mov paddle_s,eax

mov eax,2331
mov paddle_e,eax

mov eax,3
mov paddle_1,eax

mov eax,4
mov paddle_2,eax

mov eax,4
mov paddle_speed,eax
mov eax,yellow
call settextcolor

gameloop:
mov eax, 40
call Delay
cmp out1,0
jz out3
 cmp win1,1
 jz win_game
mov esi,offset layout2
call move_paddle
mov esi,offset layout2
call ball_movement
mov esi,offset layout2
call ball_movement


mov dh,0
mov dl,0
call Gotoxy
mov eax,sizeof screen
mov edx,0
mov ebx,4
mul ebx
mov size1,eax
mov esi,offset screen
call draw
CALL SCORE_Display

mov eax,SIZEOF layout2
mov bx,25
mul bx
mov size1,eax

mov dh,4
mov dl,0
call Gotoxy
mov esi,offset layout2
call draw
mov esi,offset layout2
call win_1

jmp gameloop

out3:
call clrscr
call GAME_OVER
jmp l11

win_game:
mov al,0
mov win1,al
call clrscr
mov edx,offset win_s
call writeString
call readchar
cmp al, 'x'
je l11
lll:
call level3
l11:
ret

level2 endp



;=================
   level3 Proc
;=================
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file5
invoke PlaySound, esi, 0, eax
mov eax, cyan
call SetTextColor

mov eax,3
mov lev,eax

mov eax,1600
mov ball_pos,eax

mov eax,1    ;0
mov ball_dx,eax

mov eax,0   ; 1  
mov ball_dy,eax


mov eax,2312
mov paddle_s,eax

mov eax,2326
mov paddle_e,eax

mov eax,2
mov paddle_1,eax

mov eax,3
mov paddle_2,eax

mov eax,6
mov paddle_speed,eax
mov eax,cyan
call settextcolor

gameloop:
mov eax, 100
call Delay
cmp out1,0
jz out3
 cmp win1,1
 jz win_game
mov esi,offset layout3
call move_paddle
mov esi,offset layout3
call ball_movement
mov esi,offset layout3
call ball_movement


mov dh,0
mov dl,0
call Gotoxy
mov eax,sizeof screen
mov edx,0
mov ebx,4
mul ebx
mov size1,eax
mov esi,offset screen
call draw
CALL SCORE_Display

mov eax,SIZEOF layout3
mov bx,25
mul bx
mov size1,eax

mov dh,4
mov dl,0
call Gotoxy
mov esi,offset layout3
call draw
mov esi,offset layout3
call win_1

jmp gameloop

out3:
call clrscr

call GAME_OVER
jmp l11

win_game:
mov al,0
mov win1,al
call clrscr
;/////////WIN GAME
mov edx,offset win_s
call writeString
call readchar
cmp al, 'x'
je l11
lll:
;call level
l11:
ret

level3 endp



win_1 proc
mov ecx,size1


loop2:
mov al,[esi]
cmp al,'#'
jz l1

inc esi
loop loop2
mov al,1
mov win1,al
l1:
ret
win_1 endp

;////////////PAUSE
pause2 proc
push eax
push ebx
push size1

mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file6
invoke PlaySound, esi, 0, eax

mov eax, sizeof pause1
mov bx,25
mul bx
mov bx,ax
mov eax,0
mov eax,ebx
mov size1,eax 

loop1:
mov dh,0
mov dl,0
call gotoxy
mov esi,offset pause1
call draw

call readchar
mov p, al
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file6
invoke PlaySound, esi, 0, eax
cmp p, 'x'
jz GLOBAL_EXIT
cmp p, 'm'
jz mnu
cmp p,'r'
jz end1
jmp GLOBAL_EXIT
mnu:
call clrscr
call MENU 
jmp GLOBAL_EXIT
jmp loop1
end1:
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file5
invoke PlaySound, esi, 0, eax
pop size1
pop ebx
pop eax
ret
pause2 endp



draw proc
    
    mov ecx,size1
    loop1:

   

    mov al,[esi]
    cmp al,'|'
    je wallver

    cmp al,'-'
    je wallhor

    cmp al,'2'
    je rightup_corner

    cmp al,'1'
    je leftup_corner

    cmp al,'4'
    je rightdown_corner

    cmp al,'3'
    je leftdown_corner
    
    cmp al,'#'
    je brick

    cmp al,'.'
    je brick3

    cmp al,'*'
    je brick_2

    cmp al,'%'
    je fixedbricks

    cmp al,'$'
    je livee 

    cmp al,'O'
    je ball

    cmp al,'='
    je paddle

    cmp al,'+'
    je brick5

    jmp end1

    paddle:
    mov al,220
    jmp end1
    
    ball:
    mov al,'O'
    jmp end1

    brick_2:
    mov al,219   ; 177,176, 219
    jmp end1

    brick:
    mov al,178   ; 177,176, 219
    jmp end1

    brick3:
    mov al,176   ; 177,176, 219
    jmp end1

    brick5:
     mov al,254    ; 253
    jmp end1

    rightup_corner:
    mov al,187
    jmp end1
    
    leftup_corner:
    mov al,201
    jmp end1

    rightdown_corner:
    mov al,188
    jmp end1
    
    leftdown_corner:
    
    mov al,200
    jmp end1

    wallhor:
    mov al,205
    jmp end1

    
    livee:
    mov al, 3
    jmp end1

    fixedbricks:
    mov al,177
    jmp end1

    wallver:
    mov al,186
    end1:

   
    call WriteChar
    add esi,1
    loop loop1

ret
draw endp
;------------------------------

move_paddle proc
    mov ecx,paddle_speed
    mov ebp,esi
    call readkey
    cmp al,'p'
    jz pause2

    cmp al,'a'
    jz ll

    cmp al,'d'
    jz rr
    jmp end1
    mov asdfg,5
    loop_aaa:
    ll:
    mov esi,ebp
    call left
    loop ll
    dec asdfg
    cmp asdfg,0
    jg loop_aaa
    jmp end1
    
    rr:
    mov esi,ebp
    call right
    loop rr
    jmp end1

    end1:
ret
move_paddle endp
;-------------------------------
left proc
push eax
mov edi,esi
                     ;esi
mov eax,paddle_s     ; |
dec eax              ; _=========  esi+ paddle_s-1
add esi,eax
mov ah,[esi]
cmp ah,'|'
jz end1
cmp ah,'O'
jz end1


dec paddle_s
 
mov eax,paddle_e      ;=========< esi+paddle_e
add edi,eax
mov al,[edi]
mov ah,[esi]

mov [edi],ah
mov[esi],al

dec paddle_e
  
end1:
pop eax
ret
left endp
;-------------------------------


right proc
push eax
mov edi,esi

mov eax,paddle_e      ;=========_ esi+paddle_e
add edi,eax
inc edi
mov al,[edi]
cmp al,'|'
jz end1
cmp al,'O'
jz end1
                     ;esi
mov eax,paddle_s     ; |
add esi,eax          ; =========  esi+ paddle_s-1
mov ah,[esi]
 inc paddle_s

mov al,[edi]


mov [edi],ah
mov[esi],al

inc paddle_e
 
end1:
pop eax
ret
right endp

ball_movement Proc
mov ecx,esi
mov edi,esi
; ball y axis movement
 add esi,ball_pos
 cmp ball_dy,1
 jz up 
 cmp ball_dy,-1
 jz down


 up:
 mov ebx,ball_pos
 sub ebx,120
 add edi,ebx
 mov al,[edi]    ;*
 mov ah,[esi]

 cmp al,'-'
 jz change_direction1
 jnz e41

 e41:
 cmp al,' '

 jz take_mov1
 jnz e51
 jmp change_direction1


 e51:
 cmp al,'#'
 jz remove_brick1
 jnz e61
 jmp change_direction1


 e61:
 cmp al,'*'
 jz remove_brick_11
 jnz e71
 jmp change_direction1

 e71:
 cmp al,'.'
 jz remove_brick_11
 jnz e811   ;e81
 jmp change_direction1

 e811:
 cmp al,'+'
 jz remove_5_bricks
 jnz e81
 jmp change_direction1


 e81:     ; fixed brick 
 cmp al,'%'
 jmp change_direction1


 remove_5_bricks: 
 
 inc score

 mov al,' '
 mov [edi],ah
 mov [esi],al
 mov ebx,120
 sub ball_pos,ebx
 mov esi,ecx
 add esi,3000

 lll3:
 
 cmp edi, esi
 jae lk3
 cmp removed_brick_count,5
 jz end111
 inc edi
 inc edi
 inc edi
 mov al,[edi]
 cmp al,'#'
 jnz skip

 mov al,' '
 mov [edi],al
 inc removed_brick_count
 inc score

 skip:
 jmp  lll3
 jmp end111
 lk3:
 mov edi,ecx
 jmp lll3
 jmp end111
 
 brick_disappear:
 mov al,' '
 mov [edi],al
 inc removed_brick_count
 jmp  lll3
 end111:
 mov bl,0
mov removed_brick_count,bl
 jmp change_direction1



 remove_brick_11:
  
 cmp al,'.'
 mov al,'*'
 jz g1 
 mov al,'#'
 g1:
 mov [edi],al
 ;mov [esi],al
 ;mov ebx,120
 ;sub ball_pos,ebx
 jmp change_direction1


 remove_brick1:

 inc score
 mov al,' '
 mov [edi],ah
 mov [esi],al
 mov ebx,120
 sub ball_pos,ebx

 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 jmp change_direction1


 take_mov1:
 mov [edi],ah
 mov [esi],al
 mov ebx,120
 sub ball_pos,ebx
 jmp xxx


 change_direction1:
 mov eax,-1
 ;mov eax,ball_dy
 ;push ebx
 ;push edx
 ;mov ebx,-1
 ;mov edx,0
 ;mul ebx
 ;pop edx
 ;pop ebx
 mov ball_dy,eax
 jmp xxx

 
 e:
 jmp xxx

 down:
 mov esi,ecx
 add esi,ball_pos   ; ball position
 mov edi,ecx
  mov ebx,ball_pos
 add ebx,120
 add edi,ebx   ;next position
 mov al,[edi]
 mov ah,[esi]
 cmp al,'='
 jnz e3
 jz ee3

 ee3:
 call ball_paddle_collision
 jmp change_direction

 e3:
 cmp al,'-'
 jz out2
 jnz e4
 jmp change_direction

 e4:
 cmp al,' '

 jz take_mov
 jnz e5
 jmp change_direction


 e5:
 cmp al,'#'
 jz remove_brick
 jnz e6
 jmp change_direction

 e6:
 
 cmp al,'*'
 jz remove_brick_1
 jnz e7
 jmp change_direction

 e7:
  cmp al,'.'
 jz remove_brick_1
 jnz e88
 jmp change_direction


 e88:
 cmp al,'+'
 jz remove_51_bricks
 jnz e8

 e8:
 cmp al,'%'
 jmp change_direction


 remove_brick_1:
 inc score
 cmp al,'.'
 mov al,'*'
 jz g2
 mov al,'#'
 g2:
 
 mov [edi],al
 jmp change_direction



 remove_brick:
 inc score
 mov al,' '
 mov [edi],ah
 mov [esi],al
 mov ebx,120
 add ball_pos,ebx
 jmp change_direction

 take_mov:
 
 mov [edi],ah
 mov [esi],al
 mov ebx,120
 add ball_pos,ebx
 jmp xxx


 remove_51_bricks: 
 
 inc score
 mov al,' '
 mov [edi],ah
 mov [esi],al
 mov ebx,120
 add ball_pos,ebx
 mov esi,ecx
 add esi,3000
 
 lll31:
 
 cmp edi,esi
 jae lk31
 cmp removed_brick_count,5
 jz end111
 inc edi
 inc edi
 inc edi
 mov al,[edi]
 cmp al,'#'
 jnz skip1

 mov al,' '
 mov [edi],al
 inc removed_brick_count
 inc score

 skip1:
 jmp  lll31
 jmp end1111
 lk31:
 mov edi,ecx
 jmp lll31
 jmp end1111

 end1111:
 mov bl,0
mov removed_brick_count,bl
 jmp change_direction




 change_direction:
 
 mov eax,1
 ;mov eax,ball_dy
 ;push ebx
 ;push edx
 ;mov ebx,-1
 ;mov edx,0
 ;mul ebx
 ;pop edx
 ;pop ebx
 mov ball_dy,eax
 jmp xxx
 

 xxx:
 ; ball x axis movement

 cmp ball_dx,0
  jz yyy
  mov eax,double_pos_const
  mov double_pos,eax

 jmp yyy


 ;=========================================
 double_right:
 jmp bright
 jmp end1

 double_left:
 jmp bleft
 jmp end1

 bleft:
 mov eax,double_pos
  cmp eax, 0
  jz yyy

 dec double_pos
 mov eax,double_pos
 mov esi,ecx
 add esi,ball_pos
 mov edi,esi
 dec edi

 mov ah,[esi]
 mov al,[edi]

 cmp al,' '
 jnz r2
 jz r1

 r1:
 mov [edi], ah
 mov [esi],al
 dec ball_pos
 jmp yyy

 r2:
 cmp al,'|'
 jnz r4
 jz r3



 r4:
 cmp al,'#'
 jz r5
 jnz r_51

 r5:
 inc score
 mov al,' '
 mov [esi],al
 mov [edi],ah
 dec ball_pos
 jmp bleft
 jmp yyy

 r_51:
 cmp al,'*'
 jz rrr_1
 jnz r_52

 rrr_1:
 mov al,'#'
 ;mov [esi],al
 mov [edi],al
 ;dec ball_pos
 jmp yyy

 r_52:
 cmp al,'.'
 jz rrr_2
 jnz r_53

 rrr_2:
 
 mov al,'*'
 ;mov [esi],al
 mov [edi],al
 ;dec ball_pos
 jmp yyy


 r_53:
 cmp al,'%'
 jz rrr_3
 jnz r_54

 rrr_3:
 jmp r3
 
 jmp yyy

 r_54:
 cmp al,'+'
 jz rrr_4
 jnz r3

 rrr_4:
 mov al,' '
 ;mov [esi],al
 mov [edi],al
 ;dec ball_pos
 inc edi 
 mov esi,ecx
 add esi, 3000

 call magic_brick

 jmp r3

 magic_brick:
 cmp removed_brick_count,5
 jz r_end1
 cmp cc1,5
 jz r_end1

 cmp edi,esi
 jae rr444

  add edi,3
  mov al,[edi]
  cmp al,'#'
  jnz skip_l
 mov al,' '
 mov [edi],al
 inc removed_brick_count
 inc score
 skip_l:
 jmp magic_brick

 rr444:
 inc cc1 
 mov edi,ecx
 jmp magic_brick

 r_end1:
 mov bl,0
 mov removed_brick_count,bl
 jmp r3


 r3:
 mov eax,1
 mov double_pos_const,eax
 mov ball_dx,eax
 jmp yyy

 bright:
 mov eax, double_pos
 cmp eax, 0
  jz yyy
  
 dec double_pos
 mov eax,double_pos
 mov esi,ecx
 add esi,ball_pos
 mov edi,esi
 inc edi

 mov ah,[esi]
 mov al,[edi]

 cmp al,' '
 jnz r6
 jz r7


 r7:
 mov [edi], ah
 mov [esi],al
 inc ball_pos
 jmp yyy

 r6:
 cmp al,'|'
 jnz r8
 jz r10


 r10:
 mov eax,ball_dx
 cmp eax,2
 jz mov2
 mov eax,-1
 mov ball_dx,eax
 jmp yyy
 mov2:
 mov eax,-2
 mov ball_dx,eax
 jmp bright

 r8:
 cmp al,'#'
 jz r9
 jnz rrr888


 rrr888:
 cmp al,'*'
 jz rrr8881
 jnz rrr8882


 rrr8881:
 mov al,'#'
 mov [edi],al
 jmp r10


 rrr8882:
 cmp al,'.'
 jnz rrr8883
 mov al,'*'
 mov [edi],al
 jmp r10


 rrr8883:
 cmp al,'%'
 jnz  rrr8884
 jmp r10


  rrr8884:
  cmp al,'+'
  jnz yyy
  mov al,' '
 mov [edi],al
 
 inc edi 
 mov esi,ecx
 add esi, 3000

 call magic_brick_r
  jmp r10


  ;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


 magic_brick_r:
 cmp removed_brick_count,5
 jz r_end111
 cmp cc1,5
 jz r_end111

 cmp edi,esi
 jae rr443

  add edi,3
  mov al,[edi]
  cmp al,'#'
  jnz skip_r
 mov al,' '
 mov [edi],al
 inc removed_brick_count
 inc score
 skip_r:
 jmp magic_brick_r

 rr443:
 mov edi,ecx
 jmp magic_brick_r

 r_end111:
 mov bl,0
 mov removed_brick_count,bl
 jmp r10


 ;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



 r9:
 inc score
 mov al , ' '
 ;mov [esi],al
 mov [edi],al
 ;inc ball_pos
 jmp bright
 jmp yyy





 yyy:
 
 mov eax,double_pos
 cmp eax,0
 jz end1

 cmp ball_dx,2
 jz double_right
 cmp ball_dx,-2
 jz double_left
 cmp ball_dx,1
 jz bright
 cmp ball_dx,-1
 jz  bleft

; ball_dx dd 0
; ball_dy dd 1
jmp end1

out2:
push eax
dec out1
mov esi,ecx
mov edi,esi
add esi,ball_pos
add edi,ball_pos_constant
mov ah,[esi]
mov al,[edi]
mov [esi],al
mov [edi],ah

mov eax,ball_pos_constant
mov ball_pos,eax

mov eax,0
mov ball_dx,eax
mov eax,1
mov ball_dy,eax

mov al,out1
cmp al,2
jz remove_$1
jnz llt

llt:
cmp al,1
jz remove_$2
jnz lt1

lt1:
cmp al,0
jz remove_$1


remove_$1:
mov esi,offset screen
add esi,lives_position3
mov al,' '
mov [esi],al
jmp end3


remove_$2:
mov esi,offset screen
add esi,lives_position2
mov al,' '
mov [esi],al

jmp end3

remove_$3:
mov esi,offset screen
add esi,lives_position1
mov al,' '
mov [esi],al

jmp end3


end3:
pop eax



end1:
ret
ball_movement endp



ball_paddle_collision proc
                  ;     edi esi
                  ;      |   |  
                  ;    =====================
 mov esi,ecx
 add esi,paddle_s
 add esi,paddle_1     ;+4
 cmp edi,esi
 jbe left_2
 jg not_double_left
 jmp end1
 
 not_double_left:
 add esi,paddle_2     ;+5
 cmp edi,esi
 jbe left_1
 jg more_than_left1
 jmp end1

 
 left_1:
 mov eax,1
 mov double_pos_const,eax
  mov eax,-2
  mov ball_dx,eax
  mov eax,-1
  mov ball_dy,eax

 jmp end1

 
 more_than_left1:
 add esi,paddle_2     ;+5
 cmp edi,esi
 jbe straight
 jg more_than_straight
 jmp end1

 straight:
 mov eax,0
 mov ball_dx,eax
 mov eax,-1
 mov ball_dy,eax
 jmp end1

 more_than_straight:
 add esi,paddle_2     ;+5
 cmp edi,esi
 jbe right_1
 jg right_2
 jmp end1


 more_than_right_1:
 add esi,paddle_2     ;+5
 cmp edi,esi
 jbe right_2
 jmp end1


 left_2:
 mov eax,2
 mov double_pos_const,eax
  mov eax,-2
  mov ball_dx,eax
  mov eax,-1
  mov ball_dy,eax

 jmp end1

 right_1:
 mov eax,1
 mov double_pos_const,eax
  mov eax,1
  mov ball_dx,eax
  mov eax,-1
  mov ball_dy,eax
 jmp end1

 right_2:
 mov eax,2
 mov double_pos_const,eax
  mov eax,2
  mov ball_dx,eax
  mov eax,-1
  mov ball_dy,eax
 jmp end1


end1:
ret 
ball_paddle_collision endp



;------SCORE
SCORE_Display PROC
push eax
mov dl, 28
mov dh, 1
call gotoxy
mov eax, score
call writedec
mov dl, 58
mov dh, 2
call gotoxy
mov eax, lev
call writedec
pop eax
mov dl, 7
mov dh, 1
call gotoxy
mov ecx,20
mov edx, offset inputname
call writestring
ret
SCORE_Display ENDP


GAME_OVER PROC
mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file8
invoke PlaySound, esi, 0, eax

MOV ESI, OFFSET gameOver
mov size1, sizeof gameOver
CALL draw
MOV EDX, OFFSET out_S
CALL WRITESTRING
mov edx, offset instS
call writestring
mov eax, score
call writeint
call crlf
mov edx, offset inst5
call writestring
call readint

jmp GLOBAL_EXIT


RET
GAME_OVER ENDP

comment @
GAME_WON PROC

mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file9
invoke PlaySound, esi, 0, eax

MOV ESI, OFFSET gameOver
mov size1, sizeof gameOver
CALL draw
MOV EDX, OFFSET WIN_ST
CALL WRITESTRING
mov edx, offset instS
call writestring
mov eax, score
call writeint
call crlf
mov edx, offset inst5
call writestring
call readint

jmp GLOBAL_EXIT

call MENU

RET
GAME_WON ENDP
@

;========================MENU====================

main PROC

 call q2
 call SHOWNAME
 call Clrscr
 call MENU
 
 
GLOBAL_EXIT::

mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file1
invoke PlaySound, esi, 0, eax
call clrscr
CALL WRITENAME


main ENDP 
END main
