.model small
.stack 100h

.data
    numbers db 9, 4, 2, 3, 5     

.code
main:
    mov ax, @data            
    mov ds, ax

    mov cx,4                   
outer_loop:
    mov bx, cx              

    mov si, 0                   
inner_loop:
    mov al, [numbers + si]    
    mov ah, [numbers + si + 1] 

    cmp al, ah                 
    jle no_swap               

    mov [numbers + si], ah      
    mov [numbers + si + 1], al

no_swap:
    inc si                      
    dec bx                     
    jnz inner_loop              

    loop outer_loop              

   
    mov cx, 5                
    mov si, 0                  
print_loop:
    mov dl, [numbers + si]     
    add dl, 30h               
    mov ah, 02h                
    int 21h               

    inc si                    
    loop print_loop          

    mov ax, 4C00h             
    int 21h

end main