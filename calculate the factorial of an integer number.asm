.MODEL SMALL
.STACK 100H
.DATA
.CODE


MAIN PROC


    
    MOV CX, 6
    MOV AX, 1


    TOP:
    MUL CX
    LOOP TOP


    MOV BX, 10
    MOV CX, 0
    
    CONVERT:
    XOR DX, DX
    DIV BX
    ADD DL, 30H
    PUSH DX
    INC CX
    OR AX, AX
    JNZ CONVERT
    
    DISPLAY:
    POP DX
    MOV AH, 02H
    INT 21H
    LOOP DISPLAY
    
    MOV AH, 4CH
    INT 21H


MAIN ENDP
END MAIN
