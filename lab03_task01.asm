.model small
.stack 100h

.data
str db 'This is string'
len equ $-str


.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, len
    mov al, 0
    
    countStringLength:
          inc al
          
    loop countStringLength
    
    break:
    
endp main
end main