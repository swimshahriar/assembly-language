.model small
.stack 100h

.data
str1 db "Hello World, "
len1 equ $-str1
str2 db "this is Assembly Language Programming"
len2 equ $-str2

finalStr db 50 dup(?)


.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, finalStr
    lea di, str1
    lea bx, str2
    
    mov al, 0
    
    concatenateString1:
        cmp al, len1
        jg concatenateString2
        
        mov bl, [di]
        mov [si], bl
        
        inc al
        inc si
        inc di
            
    concatenateString2:
         mov bl, len1
         add bl, len2
    
         cmp al, bl
         jg break
         
         mov bl, [bx]
         mov [si], bl
         
         inc al
         inc si
         inc bx
         
         
    break:
    
endp main
end main