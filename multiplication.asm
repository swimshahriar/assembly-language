.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax
        
    mov ax, 0FFFFh
    mov bl, 0FFh
    mul bl
    
endp main
end main