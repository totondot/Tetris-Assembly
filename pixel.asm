org 100h

section .text
start:
    ; switch to VGA mode 13h
    mov ax, 13h
    int 10h

    ; draw a pixel
    mov ax, 0A000h
    mov es, ax ; es points to screen memory

    mov di, 7DA0h
    mov al, 14
    mov [es:di], al
    ;int 21h

    mov di, 968Ch
    mov al, 14
    mov [es:di], al
    ;int 21h

    mov di, 96B4h
    mov al, 14
    mov [es:di], al
    ;int 21h

    
    ; wait for key press
    mov ah, 00h
    int 16h

    ; return to text mode
    mov ax, 03h
    int 10h

    mov ax, 4C00h
    int 21h