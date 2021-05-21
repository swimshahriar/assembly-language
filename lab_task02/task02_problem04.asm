.model small
.stack 100h

.data

input_str db 20 dup(?)

.code
             
main proc
    mov ax, @data
    mov ds, ax
    
    ; input string
    lea dx, input_str
    mov ah, 10
    mov input_str, 20
    int 21h
    
    ; new line
    mov dx, 13
    mov ah, 02
    int 21h
    
    mov dx, 10
    mov ah, 02
    int 21h
    
    
    ; input char
    mov ah, 01
    int 21h
    
    mov bh, al
    
    ; new line
    mov dx, 13
    mov ah, 02
    int 21h
    
    mov dx, 10
    mov ah, 02
    int 21h
    
    lea si, input_str+1
    
    mov ch, 0
    mov cl, [si]
    
    lea si, input_str+2
    
    find_char:
       mov bl, [si]
       cmp bl, bh ; al -> char to find
       jne next
       
       mov dl, ch
       add dl, 30h
       mov ah, 02
       int 21h
       jmp break
       
       
       next:
        inc si
        inc ch
    
    
    loop find_char
    
    break:
    
endp main
end main