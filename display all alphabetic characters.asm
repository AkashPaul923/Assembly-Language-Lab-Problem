;PROGRAM TO PRINT A TO Z AND a TO z
.MODEL SMALL
.STACK 100
.DATA
.CODE
  MOV CX,26
  MOV DX,65

  L1:
     MOV AH,2
     INT 21H
     INC DX
  LOOP L1
  
  
  MOV AH,0Eh 
  MOV AL,0Dh 
  INT 10H 
  MOV AL,0AH 
  INT 10H


  MOV CX,26
  MOV DX,97

  L2:
     MOV AH,2
     INT 21H
     INC DX
  LOOP L2

  MOV AH,4CH
  INT 21H

  
END