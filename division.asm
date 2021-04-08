.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 0FFFFh
    mov bh, 0FFh
    div bh
    
endp main
end main