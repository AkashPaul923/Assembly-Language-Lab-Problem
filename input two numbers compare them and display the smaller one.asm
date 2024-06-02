.model small
.stack
.data
    num1 db ?
    num2 db ?
    msg1 db 0dh, 0ah, "Enter first number: $"
    msg2 db 0dh, 0ah, "Enter second number: $"
    msg3 db 0dh, 0ah, "The smaller number is: $"


.code
main proc
    mov ax, @data
    mov ds, ax


    ; Read first number
    mov dx, offset msg1
    mov ah, 9
    int 21h


    mov ah, 1
    int 21h
    sub al, 30h  ; Convert ASCII digit to binary
    mov num1, al


    ; Read second number
    mov dx, offset msg2
    mov ah, 9
    int 21h


    mov ah, 1
    int 21h
    sub al, 30h  ; Convert ASCII digit to binary
    mov num2, al


    ; Compare the numbers
    mov al, num1
    cmp al, num2
    jge num2_smaller


num1_smaller:
    ; Display num1 as the smaller number
    mov dx, offset msg3
    mov ah, 9
    int 21h


    mov dl, num1
    add dl, 30h  ; Convert to ASCII
    mov ah, 2
    int 21h
    jmp exit_program


num2_smaller:
    ; Display num2 as the smaller number
    mov dx, offset msg3
    mov ah, 9
    int 21h


    mov dl, num2
    add dl, 30h  ; Convert to ASCII
    mov ah, 2
    int 21h


exit_program:
    ; Exit the program
    mov ah, 4Ch
    int 21h


main endp
end main
