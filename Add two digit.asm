.MODEL SMALL

.STACK 100H

.DATA

.CODE

main proc

mov ah,1
int 21h 
mov bl,al

mov ah,1
int 21h 
mov cl,al

mov ah,0Eh 
mov al,0Dh 
int 10h 
mov al,0Ah 
int 10h

add bl,cl
sub bl,48

mov ah,2 
mov dl,bl 
int 21h


mov ah, 4ch 
int 21h

main endp 
END MAIN