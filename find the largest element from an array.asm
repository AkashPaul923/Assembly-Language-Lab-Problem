.model small
.stack
.data
    array db 7, 5, 3, 9, 0, 1, 2
    size equ 7
    maxVal db 0
    msg db "The largest element is: $"


.code
main proc
    mov ax, @data
    mov ds, ax


    ; Initialize maxVal with the first element of the array
    mov al, array
    mov maxVal, al


    ; Loop through the array to find the largest element
    mov cx, size
    mov si, offset array + 1 ; Start from the second element


loop_start:
    mov al, byte ptr [si]
    cmp al, maxVal
    jle not_largest


    ; Update maxVal if a larger element is found
    mov maxVal, al


not_largest:
    inc si
    loop loop_start


    ; Display the largest element
    mov dx, offset msg
    mov ah, 09h
    int 21h


    mov dl, maxVal
    add dl, 30h  ; Convert to ASCII
    mov ah, 02h
    int 21h


    ; Exit the program
    mov ah, 4Ch
    int 21h


main endp
end main
