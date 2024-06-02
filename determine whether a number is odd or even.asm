.MODEL SMALL
.STACK


.DATA
    MESSAGE DB 0DH, 0AH, 'Enter a number: $'
    ODD_MESSAGE DB 0DH, 0AH, 'The number is odd. $'
    EVEN_MESSAGE DB 0DH, 0AH, 'The number is even. $'
    NUMBER DB ?


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX


    ; Display message asking for input
    MOV DX, OFFSET MESSAGE
    MOV AH, 09H
    INT 21H


    ; Read number from the user
    MOV AH, 01H
    INT 21H
    SUB AL, 30H  ; Convert ASCII digit to binary


    ; Check if the number is odd or even
    TEST AL, 01H  ; Perform bitwise AND with 00000001
    JNZ ODD  ; Jump if the result is not zero (odd)


    ; Number is even
    MOV DX, OFFSET EVEN_MESSAGE
    MOV AH, 09H
    INT 21H
    JMP EXIT_PROGRAM


ODD:
    ; Number is odd
    MOV DX, OFFSET ODD_MESSAGE
    MOV AH, 09H
    INT 21H


EXIT_PROGRAM:
    ; Exit the program
    MOV AH, 4CH
    INT 21H


MAIN ENDP
END MAIN
