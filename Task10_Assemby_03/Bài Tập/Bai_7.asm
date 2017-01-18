.model small
.stack 100h
.data 
    msg_1   db   "a. Hay su dung vong lap LOOPE viet cac lenh doc cac ky tu den khi mot ky tu trang duoc danh dau vao hoac da nhap du 80 ky tu. $"
    msg_3   db  13,10,"b.Dung vong lap LOOPE viet cac lenh doc cac ky tu deb jgu nit ky tu ve dau dong duoc danh dau vao hoac da nhap du 80 kytu.$"
    msg_2   db  13,10," * Nhap ky tu: $" 
    msg_4   db  13,10,"_Chon: $"
    
.code

    Mov ax,@data
    Mov ds,ax
    
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h
    
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
    
    Mov ah,9
    Mov dx,offset msg_4
    Int 21h
    
    Mov ah,1
    Int 21h
    cmp al,'a'
    je A
    cmp al,'b'
    je B
     
 A:   
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    
    Mov cx,0
 LOOPE:
    
    Mov ah,1
    Int 21h
    inc cx 
    cmp al,32
    JE  DOS
    cmp cx,80
    JE DOS
    jmp LOOPE  
    
 B:
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
        
        
    
    Mov cx,0
 LOOPNE:
    
    Mov ah,1
    Int 21h
    inc cx 
    cmp al,13
    JE  DOS
    cmp cx,80
    JE DOS
    jmp LOOPNE
    
 DOS:
    Mov ah,4ch
    Int 21h
    
end   
      
    
    
    

    