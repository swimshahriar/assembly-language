.model small
.stack 100h

.data

arr db 2,3,5,6,7,9,10,1,8,13
len equ $-arr

minEl db 0
maxEl db 0


.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr
    
    mov cx, len
    mov al, [si]
    mov minEl, al
    
    inc si
    
    calculate:
        mov al, [si]
        cmp al, minEl
        jge maxNum
        jle minNum
        
        back:
            inc si
        
    loop calculate
    
    maxNum:
        mov maxEl, al
        
        jmp back
        
    minNum:
        mov minEl, al
        
        jmp back
     
     
endp main
end main