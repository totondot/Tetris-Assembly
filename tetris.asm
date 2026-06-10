org 100h

section .text
start:
    mov ax, 13h
    int 10h
    mov ax, 0A000h
    mov es, ax

game_loop:
    mov ax, [posY]
    mov bx, 320
    mul bx
    add ax, [posX]
    mov di, ax

    mov al, 14
    mov [es:di], al

    inc word [gravityCounter]
    cmp word [gravityCounter], 150
    jl skip_gravity

    mov word [gravityCounter], 0

    mov al, 0
    mov [es:di], al

    add word [posY], 1

    cmp word [posY], 199
    jne skip_gravity

    jmp game_over

skip_gravity:
    mov ah, 01h
    int 16h
    jz no_key

    mov ah, 00h
    int 16h

    cmp ah, 75
    je handle_left
    cmp ah, 77
    je handle_right
    cmp ah, 81
    je handle_down
    cmp ah, 1
    je exit_game
    jmp no_key

handle_left:
    mov al, 0
    mov [es:di], al
    cmp word [posX], 10
    jle no_key
    dec word [posX]
    jmp no_key

handle_right:
    mov al, 0
    mov [es:di], al
    cmp word [posX], 309
    jge no_key
    inc word [posX]
    jmp no_key

handle_down:
    mov al, 0
    mov [es:di], al
    add word [posY], 1
    jmp no_key

no_key:
    mov cx, 0FFFh

delay:
    loop delay
    jmp game_loop

game_over:
    mov al, 4
    mov [es:di], al

    mov ah, 00h
    int 16h
    jmp exit_game

exit_game:
    mov ax, 03h
    int 10h
    mov ax, 4C00h
    int 21h

section .data
    posX dw 160
    posY dw 0
    gravityCounter dw 0
