.model small
.stack 100h

.data
arr1 db 1,2,3,4,5
arr2 db 5 dup<?>

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; int *si = arr1
    lea si, arr1
    
    ;int *di = arr2+4
    lea di, arr2+4
    
    ; al = *si
    mov al, [si]
    
    ; *di = al
    mov [di], al
    
    ; si++
    inc si
    ;di--
    dec di
    
    mov al, [si]
    
    mov [di], al
    
    inc si
    dec di
            
    mov al, [si]
    
    mov [di], al
    
    inc si
    dec di    
    
    mov al, [si]
    
    mov [di], al
    
    inc si
    dec di
    
    mov al, [si]
    
    mov [di], al
    
    inc si
    dec di
    
    mov al, [si]
    
    mov [di], al
    
   
endp main
end main