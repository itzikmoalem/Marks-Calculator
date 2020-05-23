;---------------------------Sum of Grades----------------------------;
;---------------------------Itzik Moalem-----------------------------;

%include "io.inc"

section .data
    math db "Enter mark for math: ", 0
    math_percent db "Enter percent for math: ",0
    physics db "Enter mark for physics: ",0
    phy_percent db "Enter percent for physics: ",0
    comp db "Enter mark for computers: ",0
    comp_percent db "Enter percent for computers: ",0
    error db "Error! The sum of percent not equal 100, Please try again!",10,0
    result db "grade is ",0

section .bss
    name resd 20
    marks resd 3
    percent resd 3
    
section .text
global CMAIN

CMAIN:
    mov ebp, esp ; for correct debugging
    mov eax, 0  
    mov ebx, 100
    mov edx, 0
    mov ecx, 0
    mov esi, 0
    mov edi, 0
    PRINT_STRING "Enter student name: "
    GET_STRING name, 20
    PRINT_STRING name
    
input_data:

    PRINT_STRING math
    GET_DEC 4, eax
    mov [marks+esi*4], eax
    PRINT_DEC 4, eax
    NEWLINE
    
    PRINT_STRING math_percent
    GET_DEC 4, eax
    mov [percent+esi*4], eax
    PRINT_DEC 4, eax
    add ecx, eax
    inc esi
    NEWLINE
    PRINT_STRING physics 
    GET_DEC 4, eax
    mov [marks+esi*4], eax
    PRINT_DEC 4, eax
    NEWLINE
    
    PRINT_STRING phy_percent
    GET_DEC 4, eax
    mov [percent+esi*4], eax
    PRINT_DEC 4, eax
    add ecx, eax
    inc esi
    NEWLINE
    
    PRINT_STRING comp
    GET_DEC 4, eax
    mov [marks+esi*4], eax
    PRINT_DEC 4, eax
    NEWLINE
    
    PRINT_STRING comp_percent
    GET_DEC 4, eax
    mov [percent+esi*4], eax
    PRINT_DEC 4, eax
    add ecx, eax
    NEWLINE
    cmp ecx, 100
    mov esi,0  
    je calculate
    mov ecx, 0
    PRINT_STRING error
    jmp END
   ; jmp input_data
    
calculate:
    mov eax, [percent+esi*4]
    mov ecx, [marks+esi*4]
    imul eax, ecx
    add edi, eax
    cmp esi, 3
    je divide
    inc esi
    jmp calculate
    
divide:
    mov eax, 0
    mov eax, edi
    div ebx
    
    PRINT_STRING "Name: "
    PRINT_STRING name
    PRINT_STRING result
    PRINT_DEC 4,eax
    PRINT_STRING "."
    PRINT_DEC 4, edx
          
   END:   
      xor eax, eax
      ret
