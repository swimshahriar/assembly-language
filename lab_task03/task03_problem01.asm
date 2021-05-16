; div the num until the quotient 0
; for each div remainder should be stored
; to get result have to reverse the stored remainder


.model small
.stack 100h

.data
arr db 5 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr
    
    mov ax, 7d
    
    mov bl, 2
    
    div bl
    
    process:
        cmp al, 0
        je break
                  
        mov bh, [si]
        mov bh, ah
        
        inc si
        mov ah, 0d
        div bl
    
    jmp process
    
    
    break:
    
endp main
end main