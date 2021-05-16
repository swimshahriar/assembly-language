.model small
.stack 100h

.data
arr db 2,5,4,3,7,8,1,9,6,0
len equ $-arr
max_num db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr
    
    mov cx, len
    
    mov al, [si]
    mov max_num, al
    
    inc si
    
    find_max_num:
        mov al, [si]
        cmp al, max_num
        jge greater_num
        
        back:
            inc si
    
    
    
    loop find_max_num
    
    
    hlt
    
    greater_num:
        mov al, [si]
        mov max_num, al
        
        jmp back
    
endp main
end main