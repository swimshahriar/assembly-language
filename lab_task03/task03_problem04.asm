.model small
.stack 100h

.data

arr1 db 1,2,3,4,5
len1 equ $-arr1
arr2 db 5,4,3,2,1
len2 equ $-arr2

sum db 5 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr1
    lea di, arr2
    lea bx, sum
    
    mov cx, len1
                       
    process:
        mov al, [si]
        mov ah, [di]
            
        add al, ah
        
        mov [bx], al
        
        inc si
        inc di
        inc bx
        
        
        
    loop process
        
    
endp main
end main