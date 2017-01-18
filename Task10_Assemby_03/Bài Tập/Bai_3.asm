
.model small
.stack 100h
.data
    msg_1 db "a.AX=1+4+7+...+148.$"
    msg_2 db 0Ah,0Dh,"b.AX=100+95+...+5.$"
    msg_3 db 0Ah,0Dh,"Chon a or b: $"
    msg_4 db 0ah,0dh,"Ket Qua: $"
kytu db ?

.code

    Mov ax,@data
    Mov ds,ax
    
    ;xuat msg_1
    Mov dx, offset msg_1
    Mov ah,9
    Int 21h
    
    ;xuat msg_2
    Mov dx,offset msg_2
    Mov ah,9
    Int 21h
    
    ;xuat msg3:
    Mov dx,offset msg_3
    Mov ah,9
    Int 21h
    
    ;Nhap kytu
    
    Mov ah,1
    Int 21h
    Mov kytu,AL
    
    
    ;case
    Mov ax,01 
    Mov bx,0

    Cmp kytu,'a' 
    je  a
    
    Mov ax,100
    Mov bx,95        
    Cmp kytu,'b'
    je  b
    
    
 a: 
    add ax,bx
    add bx,3
    
    cmp bx,148   ;so sanh voi bx, neu bx>148 thi thoat
    ja DOS
    
    jmp a
    
 b:  
    add ax,bx
    sub bx,5
    
    cmp bx,5  ;so sanh voi bx, neu bx<5 thi thoat
    jb DOS
    
    jmp a
    
       
    DOS: 
    Mov AH,4Ch    
    Int 21h

end    
    