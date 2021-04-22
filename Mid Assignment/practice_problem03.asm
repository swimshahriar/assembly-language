; S. M. Shahriar - 1721152042

.model small
.stack 100h

.data

; initialized array
givenArr db 6,3,1,4,0,8,9,2,7,5

; uninitialized array
evenArr db ?,?,?,?,?
oddArr db ?,?,?,?,?

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ; pointer for 3 arrays
    lea si, givenArr
    lea di, evenArr
    lea bx, oddArr
    
    ; for index 0
    mov al, [si]
    mov [di], al
    
    inc si
    inc di
    
    ; for index 1
    mov al, [si] 
    mov [bx], al
    
    inc si
    inc bx
    
    ; for index 2
    mov al, [si]
    mov [di], al
    
    inc si
    inc di
    
    ; for index 3
    mov al, [si] 
    mov [bx], al
    
    inc si
    inc bx
    
    ; for index 4
    mov al, [si]
    mov [di], al
    
    inc si
    inc di
    
    ; for index 5
    mov al, [si] 
    mov [bx], al
    
    inc si
    inc bx
    
    ; for index 6
    mov al, [si]
    mov [di], al
    
    inc si
    inc di
    
    ; for index 7
    mov al, [si] 
    mov [bx], al
    
    inc si
    inc bx
    
    ; for index 8
    mov al, [si]
    mov [di], al
    
    inc si
    inc di
    
    ; for index 9
    mov al, [si] 
    mov [bx], al
    
    
endp main
end main