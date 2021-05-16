.model small
.stack 100h

.data
input_msg db "Input string: $"
output_msg_char db 13, 10, "Character: $"
output_msg_freq db 13, 10, "Frequency: $"

str_arr db 20 dup('?')

num_of_a db 030h
num_of_e db 030h
num_of_i db 030h
num_of_o db 030h
num_of_u db 030h

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
    
    
    process:
        mov dl, str_arr[si]
        
        cmp dl, 020h ; if space
        je back
        
        cmp dl, 'a'
        jne not_lower_a
        inc num_of_a
        
        back_e:
        cmp dl, 'e'
        jne not_lower_e
        inc num_of_e
        
        back_i:
        cmp dl, 'i'
        jne not_lower_i
        inc num_of_i
        
        back_o:
        cmp dl, 'o'
        jne not_lower_o
        inc num_of_i
        
        back_u:
        cmp dl, 'u'
        jne not_lower_u
        inc num_of_u
         
        
        back:
          inc si
          
    loop process
    
    ; show output of freq
    lea dx, output_msg_char
    mov ah, 09h
    int 21h
    
    mov dl, 'a'
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, 'e'
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, 'i'
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, 'o'
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, 'u'
    mov ah, 02h
    int 21h
    
    ; show output of freq
    lea dx, output_msg_freq
    mov ah, 09h
    int 21h
    
    mov dl, num_of_a
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, num_of_e
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, num_of_i
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, num_of_o
    mov ah, 02h
    int 21h
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    mov dl, num_of_u
    mov ah, 02h
    int 21h
    
    hlt
    
    not_lower_a:
        cmp dl, 'A'
        jne back_e
        
        inc num_of_a
        jmp back
    
    not_lower_e:
        cmp dl, 'E'
        jne back_i
        
        inc num_of_e
        jmp back
    
    not_lower_i:
        cmp dl, 'I'
        jne back_o
        
        inc num_of_i
        jmp back
        
    not_lower_o:
        cmp dl, 'O'
        jne back_u
        
        inc num_of_o
        jmp back
        
    not_lower_u:
        cmp dl, 'U'
        jne back
        
        inc num_of_u
        jmp back
                    
    
endp main
end main