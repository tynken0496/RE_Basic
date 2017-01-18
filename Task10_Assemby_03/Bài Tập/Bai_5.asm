.Model small
.Stack 100h
.Data
    msg_1   db  "So chia : $"
    msg_2   db  13,10,"So bi chia : $"
    msg_3   db  13,10,"Thuong: $"
a   db  ?
b   db  ?
    
.Code

    Mov ax,@data
    Mov ds,ax  
    
    
    ;Nhap so chia
    
    Mov dx,offset msg_1
    Mov ah,9
    Int 21h
      
    Mov ah,1 
    Int 21h
    Sub al,48
    Mov a,al
    
    ;Nhap so bi chia
    
    Mov dx,offset msg_2
    Mov ah,9
    Int 21h
    
    Mov ah,1
    Int 21h
    Sub al,48 
    Mov b,al
    
    ;Tinh
    Mov ax,0
    Mov bx,0
    Mov al,a
    Mov bl,b
    Mov cx,0
 Tinh:   
    Sub al,bl
    cmp al,bl
    inc cx
    jna Ket_Qua
    jmp Tinh
               
 
 Ket_Qua:
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
 
    Mov ah,2
    Mov dx,cx
    Add dx,48
    Int 21h              
               
 DOS:
    
     
    Mov ah,4ch
    Int 21h
    