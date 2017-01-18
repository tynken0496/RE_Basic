.Model small 
.Stack  100h
.Data
    msg_1   db   "Thua so : $"
    msg_2   db   13,10,"Thua so: $"
    msg_3   db   13,10,"Tich = $"
 a  db  ?
 b  db  ?
 c  db  ?
 
.code
    Mov ax,@data
    Mov ds,ax 
    
    
    ;Thua so
    
    Mov dx,offset msg_1
    Mov ah,9
    Int 21h
      
    Mov ah,1 
    Int 21h
    Sub al,48
    Mov a,al
    
    ;Thua so
    
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
    Mov cx,0
    Mov al,a
    Mov bl,a
    Mov cl,b
 Tinh:   
    cmp cl,1
    je Ket_Qua
    Add al,bl
    Mov c,al
    dec cl 
    jmp Tinh
               
 
 Ket_Qua:
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
 
    Mov ah,2
    Mov al,c
    Mov dl,al
    Add dl,48
    Int 21h              
               
 DOS:
    
     
    Mov ah,4ch
    Int 21h
    
    
    
    
    
    