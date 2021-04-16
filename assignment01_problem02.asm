.model small
.stack 100h

.data
fibSeries db 23 dup(?)


.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, fibSeries
    
    mov al, 0
    mov [si], al
    inc si
    
    inc al
    mov [si], al
    inc si
    inc al
    
    mov ah, 23
    
    calculate:
         cmp al, ah
         jg break
         
         ; n - 1
         dec si
         mov bl, [si]
         
         ; n - 2
         dec si
         mov bh, [si]
         
         ; F(n-2) + F(n-1)
         add bh, bl
         
         inc si
         inc si
         
         mov [si], bh
         
         inc si
         inc al
    
     jmp calculate
     
     break:
     
endp main
end main