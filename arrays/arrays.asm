section .text
    global _start ;must be declared for linker
    
_start:

    mov eax,3 ;number of bytes that will be summed
    mov ebx,0 ;sum will go here
    mov ecx,x ;will point to element to add to sum
    
top: add ebx, [ecx]
    
    add ecx, 1 ;move pointer to next element
    dec eax    ;decrement eax
    jnz top    ;if eax not zero, jumps to top
    
done:
    
    add ebx,'0'
    mov [sum], ebx ;done, store the sum in sum
    
display:
    
    mov edx, 1      ;len to print
    mov ecx, sum    ;what to print
    mov ebx, 1      ;where to print (stdout)
    mov eax, 4      ;system call sys_write
    int 0x80        ;kernel call
    
    mov eax, 1      ;system call exit
    int 0x80
    
section .data
global x
x:
    db 2
    db 4
    db 3
    
sum:
    db 0