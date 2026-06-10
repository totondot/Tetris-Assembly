org 100h
section .text
start:
    mov ah, 09h
    mov dx, msg1
    int 21h

    mov ah, 09h
    mov dx, msg2
    int 21h

    mov ax, 4C00h
    int 21h

section .data
    msg1 db 'Hello, Machine Chode!$', 0Dh, 0Ah
    msg2 db 'Tetris Loading.....$', 0Dh, 0Ah 