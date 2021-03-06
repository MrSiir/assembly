section   .bss
    maxlines equ 8
    dataSize equ 44
    output resb dataSize

section   .text
        global  _start

_start:
        mov       rdx, output             ; rdx holds address of next byte to write
        mov       r8, 1                   ; initial line length
        mov       r9, 0                   ; number of stars written on line so far
line:
        mov       byte [rdx], '*'         ; write single star
        inc       rdx                     ; advance pointer to next cell to write
        inc       r9                      ; "count" number so far on line
        cmp       r9, r8                  ; did we reach the number of stars for this line?
        jne       line                    ; not yet, keep writing on this line
lineDone:
        ;mov       byte [rdx], 10          ; write a new line char
        mov byte [rdx], '|'
        inc       rdx                     ; and move pointer to where next char goes
        inc       r8                      ; next line will be one char longer
        mov       r9, 0                   ; reset count of stars written on this line
        cmp       r8, maxlines            ; wait, did we already finish the last line?
        jng       line                    ; if not, begin writing this line
done:
        mov rax, 4
        mov rbx, 1
        mov rcx, output
        mov rdx, dataSize
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, 10
        mov edx, 1
        int 80h

        mov rax, 1
        mov rbx, 0
        int 80h