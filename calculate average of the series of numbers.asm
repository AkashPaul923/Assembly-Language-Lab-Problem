.model small
.stack
.data
    count dw 4        ; Number of elements in the array
    numbers db 2, 3, 1, 2   ; Example array with five elements
    sum dw 0          ; Variable to store the sum of numbers
    average db 0      ; Variable to store the average
    msg db "Average: $"
.code
main proc
    mov ax, @data
    mov ds, ax


    ; Calculate the sum of numbers
    mov cx, count
    mov si, offset numbers
    xor bx, bx


sum_loop:
    mov al, byte ptr [si]
    add bx, ax
    inc si
    loop sum_loop


    ; Calculate the average
    mov ax, bx
    cwd             ; Sign extend the 16-bit value in AX to DX:AX
    idiv count


    mov sum, bx        ; Store the sum
    mov average, al    ; Store the average


    ; Display the average
    mov dx, offset msg
    mov ah, 09h
    int 21h


    mov dl, average
    add dl, 30h        ; Convert the average to ASCII
    mov ah, 02h
    int 21h


    mov ah, 4Ch
    int 21h
main endp
end main
