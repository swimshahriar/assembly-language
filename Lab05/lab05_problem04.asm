.model small
.stack 100h

.data
marks db 7,6,5,4,7,6,6,8,3,10
len equ $-marks

freq db 11 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, marks
    lea bx, marks
    lea di, freq
    
    mov al, 1
    
    inc bx
    
    mov ah, [si]
    process1:
        cmp al, 10
        jg break
        
        jle process2
        
        
        back:
            inc si
            inc al
        
        
    jmp process1    
    
    process2:
       
        
        inc bx 
      
    
    jmp process2
    
    
    break:
        
    
endp main
end main