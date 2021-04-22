.model small
.stack 100h

.data
str1 db "Hello World, "
len1 equ $-str1
str2 db "this is Assembly Language Programming"
len2 equ $-str2

finalStr db 60 dup(?)


.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, finalStr
    lea di, str1
    lea bx, str2
    
    mov al, 0
    
    mov bl, len1
    add bl, len2
    
    concatenate:
        cmp al, len1
        jle concatenateString1
        
        cmp bl, al
        jge concatenateString2
        jl break
        
        
        
        back:
            inc al
            inc si   
    
    jmp concatenate
    
    concatenateString1:
        mov bl, [di]
        mov [si], bl
        
        inc di
        jmp back
            
    concatenateString2: 
         mov bl, [bx]
         mov [si], bl
         
         inc bx
         jmp back
         
    break:
    
endp main
end main