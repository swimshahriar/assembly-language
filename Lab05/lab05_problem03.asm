.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 00000h
    mov ds, ax
    mov bx, 00000h
    mov word ptr ds:[bx], 1
    
    mov ax, 00000h
    mov ds, ax
    mov bx, 00001h
    mov word ptr ds:[bx], 1
    
    mov cx, 21
    
    process:
        mov ax, word ptr ds:[bx]
        
        sub bx, 00001h
        mov dx, word ptr ds:[bx]
        
        add ax, dx
        
        add bx, 00002h
        
        mov word ptr ds:[bx], ax
         
        
    loop process
    
    hlt
    
endp main
end main