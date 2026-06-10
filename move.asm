org 100h

section .text
start:
    mov ax, 13h
    int 10h
    mov ax, 0A000h
    mov es, ax

game_loop:
    ; calculate position
    xor ax, ax
    mov al, [posY]

    mov bx, 320
    mul bx
    xor bx, bx
    mov bl, [posX]
    add ax, bx

    mov di, ax

    mov al, 14
    mov [es:di], al

    ; input
    mov ah, 01h
    int 16h
    jz no_key

    mov ah, 00h
    int 16h

    ; scan code for arrows
    cmp ah, 75
    je move_left
    cmp ah, 77
    je move_right
    cmp ah, 80
    je move_up
    cmp ah, 81
    je move_down
    cmp ah, 1
    je exit_game
    jmp no_key

move_left:

    dec byte [posX]
    jmp clear_pixel
move_right:

    inc byte [posX]
    jmp clear_pixel
move_up:

    inc byte [posY]
    jmp clear_pixel
move_down:

    dec byte [posY]
    jmp clear_pixel

clear_pixel:
    mov al, 0
    mov [es:di], al

no_key:
    mov cx, 0FFFFh

delay:
    loop delay
    jmp game_loop

exit_game:
    mov ax, 03h
    int 10h
    mov ax, 4C00h
    int 21h

section .data
    posX db 160
    posY db 100