.model small
.stack 100h

.data


.code
main proc
    mov ax, @data
    mov ds, ax
    
        mov ah, 01h
        int 21h
        
        mov cl, 01h
        add cl, al
        
        
        
   
endp main
end main