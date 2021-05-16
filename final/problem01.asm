 .model small
 .stack 100h
 
 .data
 
 input_str db "Input String: $"
 upper_str db 13, 10, "Uppercase: $"
 lower_str db 13, 10, "Lowercase: $"
 
 str_arr db 20 dup('$')
 
 .code

 main proc
    mov ax, @data
    mov ds, ax
    
    ; string input prompt
    lea dx, input_str
    mov ah, 09h
    int 21h
    
    ; string input
    mov ah, 10 
    lea dx, str_arr
    mov str_arr, 20
    int 21h
    
    lea dx, upper_str
    mov ah, 09h
    int 21h
    
    mov ch, 0
    mov cl, str_arr[1]
    mov si, 2
    mov ah, 02h
    
   
        
    ; for uppercase    
    uppercase_output:
        mov dl, str_arr[si]
        
        
        cmp dl, 'a'
        jnae not_alpha1
        
        cmp dl, 'z'
        jnbe not_alpha1
        
        sub dl, 20h
        
        not_alpha1:
            int 21h
            inc si
        
    loop uppercase_output
    
    ; for lowercase
    lea dx, lower_str
    mov ah, 09h
    int 21h
    
    mov ch, 0
    mov cl, str_arr[1]
    mov si, 2
    mov ah, 02h
    
    lowercase_output:
        mov dl, str_arr[si]
        
        cmp dl, 'A'
        jnae not_alpha2
        
        cmp dl, 'Z'
        jnbe not_alpha2
        
        add dl, 20h
        
        not_alpha2:
            int 21h
            inc si
        
    loop lowercase_output
    
    
    
 endp main
 end main