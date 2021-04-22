include 'emu8086.inc'

.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cl, 00100001b
   
   shl cl, 1
   
   jc negative
   print 'positive'
   jmp break
   
   negative:
       print 'negative'
       
       
   break:
   
endp main
end main