.model small
.stack 100h

.data
arr db 5,2,8,9,12,3,1,6,13,15,7,10
len equ $-arr

zeros db 5 dup(?)
ones db 5 dup(?)
twos db 5 dup(?)

index_for_zeros dw 0
index_for_ones dw 0
index_for_twos dw 0

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr
    lea di, zeros
    mov index_for_zeros, di
    
    lea di, ones
    mov index_for_ones, di
    
    lea di, twos
    mov index_for_twos, di
    
    mov cl, 3
    mov ch, 0
    
    process:
         cmp ch, len
         jz break
         
         mov ah, 0
         mov al, [si]
         div cl
         
         cmp ah, 1 ; any_num/3 gives either 0, 1 or 2 as a remainder
         jz arrOnes
         jl arrZeros
         jg arrTwos
         
         back:
            inc si
            inc ch
            
     jmp process
     
     arrZeros:
          mov al, [si]
          mov di, index_for_zeros
          mov [di], al
          
          inc di
          inc index_for_zeros
          
          jmp back
     
     arrOnes:
        mov al, [si]
        mov di, index_for_ones
        mov [di], al
        
        inc di
        inc index_for_ones
        
        jmp back
        
     arrTwos:
        mov al, [si]
        mov di, index_for_twos
        mov [di], al
        
        inc di
        inc index_for_twos
        
        jmp back
        
    break:

endp main
end main