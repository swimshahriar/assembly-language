.model small
.stack 100h

.data

arr db 5,2,8,9,12,3
len equ $-arr ; length of the arr

even db 0 ; sum of even numbers
odd db 0  ; sum of odd numbers

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr ; pointer of arr
    
    mov dl, 0
    
    process:
         cmp dl, len
         jz break ; jump to break if dl - len = 0
         
         mov cl, 2
         
         mov ah, 0 
         mov al, [si]
         div cl
         
         cmp ah, 0
         je evenBlock
         jne oddBlock
         
         back:
            inc dl
            inc si
         
     jmp process
     
    oddBlock:
            mov al, [si]
            add odd, al
            jmp back
         
    evenBlock:
            mov al, [si]
            add even, al
            jmp back    
         
    break:
        mov dl, even
        mov dh, odd
        
        
endp main
end main