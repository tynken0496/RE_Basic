.model normal
.stack 100h
.data
    msg_1   db  "Danh vao mot ky tu: $"
    msg_2   db  13,10,"Ma ASCII cua ky tu duoi dang hex la: $"
    dem db  ?
    a   dw  ?
.code

    Mov ax,@data
    Mov ds,ax
    
    ;nhap
    
    Mov ah,9
    Mov dx, offset msg_1
    Int 21h
    
	Mov ah,1
	INT 21H		
    Mov bh,al
    
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    Mov cx,2   
 hex:
    Mov dl,bh
    shr dl,4
    
    cmp dl,9
    Ja  letter
    
    add dl,30h
    rol bx,4
    jmp resuft
    
 letter:
    add dl,37h
    rol bx,4
       
 resuft:     
    mov ah,2
    int 21h
    loop hex
    
    Mov ah,2
    Mov dx,'h'
    Int 21h   
    Mov ah,4ch
    int 21h
end       
