.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; mul
    mov al, 03h
    mov bl, 01h
    
    mul bl
    
    ; storing mul value in the mem.
    mov cx, 00000h
    mov ds, cx
    mov bx, 00000h
    mov word ptr ds:[bx], ax
    
    ; div
    mov al, 06h
    mov bl, 03h
    
    div bl
    
    ; storing div value in the mem.
    mov cx, 00000h
    mov ds, cx
    mov bx, 00010h
    mov byte ptr ds:[bx], al
    
    
    
endp main
end main