.model small
.stack 100h

.data
input_msg db "Input string: $"
output_msg_alpha db 13, 10, "Total alphabet: $"
output_msg_num db 13, 10, "Total digits: $"

str_arr db 20 dup('?')

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ; show input msg
    lea dx, input_msg
    mov ah, 09h
    int 21h
    
    ; take input
    mov ah, 10
    lea dx, str_arr
    mov str_arr, 20
    int 21h
    
    
    mov ch, 0
    mov cl, str_arr[1]
    mov si, 2
    
    mov bl, 48
    mov bh, 48
    
    process:
        mov dl, str_arr[si]
        
        cmp dl, 020h ; if space
        je back
        cmp dl, 'a'
        jnae not_lower
        
        cmp dl, 'z'
        jnbe not_lower
        
        inc bl
         
        
        back:
          inc si
          
    loop process
    
    ; show output of char
    lea dx, output_msg_alpha
    mov ah, 09h
    int 21h
    
    mov dl, bl
    mov ah, 02h
    int 21h
    
    ; show output of digits
    lea dx, output_msg_num
    mov ah, 09h
    int 21h
    
    mov dl, bh
    mov ah, 02h
    int 21h
    
    
    
    hlt
    
    not_lower:
        cmp dl, 'A'
        jnae not_alpha
        
        cmp dl, 'Z'
        jnbe not_alpha
        
        inc bl
        jmp back
    
    not_alpha:
            cmp dl, 030h
            jnae back
            
            cmp dl, 039h
            jnbe back
            
            inc bh
            jmp back
                    
    
endp main
end main