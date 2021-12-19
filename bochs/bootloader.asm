[org 0x7c00]

mov ax, 0x0000
mov ds, ax

jmp main

printstr:
        pusha
        mov ah, 0x0e
loop_printstr:
        mov al, [bx]
        int 0x10
        add bx, 0x1
        mov cx, [bx]
        cmp cl, 0
        jne loop_printstr

        popa
        ret

main:
        mov bx, MSG_HOLA_MUNDO
        call printstr
        hlt


MSG_HOLA_MUNDO db "Hola Mundo",0

times 0x1fe-($-$$) db 0
dw 0xaa55