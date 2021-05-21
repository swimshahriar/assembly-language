.model small
.stack 100h

.data
bin_num db 20 dup(?)

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ; input string of numbers
    lea dx, bin_num
    mov ah, 10
    mov bin_num, 20
    int 21h        
    
    mov ch, 0
    lea si, bin_num+1
    mov cl, [si]
    
    lea si, bin_num+2
    
    mov bx, 030h
    
    actual_num:
        mov al, [si]
        sub al, 030h
        
        mov [si], al
        
        cmp [si], 1
        jne next
        
        inc bx
        
        next:
            inc si
    
    loop actual_num
    
    ; new line
    mov dx, 13
    mov ah, 02h
    int 21h
    
    mov dx, 10
    mov ah, 02h
    int 21h
    
    ; total 1
    mov dx, bx
    mov ah, 02h
    int 21h
    
endp main
end main