org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
    jmp main

; Prints string to the screen
print:
    push ax
    push si

.loop:
    lodsb ; Loads next char in al
    or al, al ; Null check
    jz .done

    mov ah, 0x0e
    mov bh, 0
    int 0x10

    jmp .loop

.done:
    pop ax
    pop si
    ret

; OS start
main:
    ; Initialize stuff
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; Set up stack
    mov ss, ax
    mov sp, 0x7C00

    ; Start printing
    mov si, about_msg
    call print

    hlt

; Don;t know why i need it
.halt:
    jmp .halt

; Start message
about_msg: db 'MountainOS 10, Build 1', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h