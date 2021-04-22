.model small
.stack 100h

.data
arr1 db 1,2,3,4,5
arr2 db 5 dup<?>

.code

main proc
    mov ax, @data
    mov ds, ax
    
    
    
    
endp main
end main