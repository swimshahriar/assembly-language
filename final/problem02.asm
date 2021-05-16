include "emu8086.inc" 
 
 .model small
 .stack 100h
 
 .data
 
 input_msg db "Input: $"
 
 .code

 main proc
    mov ax, @data
    mov ds, ax
    
    ; input msg
    lea dx, input_msg
    mov ah, 09h
    int 21h
    
    ; input
    mov ah, 01h 
    int 21h
    sub al, 30h
    
    mov bx, 0
    mov cl, al
    
    
    outer_loop:
        mov dh, bl
        add dh, 1
        
        GOTOXY 0, dh
        
        mov bh, 0
        
        inner_loop:
            cmp bh, bl
            jz one
            jnz zero
            
            one:
                mov dl, 31h
                mov ah, 02h
                int 21h
                jmp exit
                
            zero:
                mov dl, 30h
                mov ah, 02h
                int 21h
                
            exit:
            inc bh
            cmp bh, cl
            jnz inner_loop 
    
        inc bl
        cmp bl, cl
        jnz outer_loop
    
    
    
 endp main
 end main