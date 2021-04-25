.model samll
.stack 100h

.data
x db 06h
y db 03h


.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; (x-1)^2
    mov al, x
    sub al, 1
    
    mov bl, al
    mul bl
    
    mov cx, ax
     
    ; (y-1)^2
    mov al, y
    sub al, 1
    
    mov bl, al
    mul bl
    
    add cx, ax
    
    ; storing data to mem.
    mov ax, 00000h
    mov ds, ax
    mov bx, 00000h
    mov word ptr ds:[bx], cx
    
    
endp main
end main