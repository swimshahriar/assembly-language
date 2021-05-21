.model small
.stack 100h

.data
input db 32 dup(?)


.code

main proc
    mov ax, @data
    mov ds, ax
    
    ; input digits
    lea dx, input
    mov ah, 10
    mov input, 32
    int 21h
    
    mov ch, 0
    lea si, input+1
    mov cl, [si]
    
    lea si, input+2
    
    mov bh, 0h ; total
    mov bl, 0h ; digits
    
    mov al, [si]
    sub al, 30h
    
    mov dl, al ; lowest
    mov dh, al ; highest
    
    calculation:
       mov al, [si]
       
       ; check for space
       cmp al, 20h
       je next
       
       ; actual number
       sub al, 30h
       
       ; calc total
       add bh, al
       
       inc bl
       
       ; check for lowest
       cmp al, dl
       jg check_for_highest
       
       mov dl, al
       
       check_for_highest:
            cmp al, dh
            jl next
            
            mov dh, al
      
       
       next: 
         inc si
    
    loop calculation
    
    ; lowest
    add dl, 30h
    mov ah, 02h
    int 21h
    
    ; highest
    mov dl, dh
    add dl, 30h
    mov ah, 02h
    int 21h
    
    ; avg
    mov ah, 0
    mov al, bh
    div bl
    
    mov dl, al
    add dl, 30h
    mov ah, 02h
    int 21h
    
endp main
end main
    