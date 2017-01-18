.Model small
.stack 100h
.data 
    msg_0   db  0ah,0dh,0ah,0dh,"MENU$"
    msg_1   db  0ah,0dh,"a.Nhap tong cua 50 phan tu dau tien cua day so hoc: 1,5,9,13...$"
    msg_2   db  0ah,0dh,"b.Doc mot ky tu va hien thi no 80 lan tren dong tiep theo.$"
    msg_3   db  0ah,0dh,"c.Doc mot mat khau 5 ky tu va viet de len no bang cach tro ve dau dong roi hien thi 5 chu X. Ban khong can phai luu lai cac ky tu nay.$"
    msg_4   db  0dh,0ah,"Chon: $"
    msg_5   db  0ah,0dh,"Nhap ky tu: $"
    kytu    db  ?
    kytu_1  db  ?
    chon    db  ?
    msg_6   db  0ah,0dh,"Nhap password: $" 
    passwd  db  ?

.code

    Mov ax,@data
    Mov ds,ax
    
    ;Xuat ra man hinh
    
  quaylai:  
    Mov dx,offset msg_0
    mov ah,9
    int 21h 
    
    Mov dx,offset msg_1
    mov ah,9
    int 21h   
    
    Mov dx,offset msg_2
    mov ah,9
    int 21h   
    
    Mov dx,offset msg_3
    mov ah,9
    int 21h  
    
    Mov dx,offset msg_4
    mov ah,9
    int 21h
    
    Mov ah,1
    Int 21h       
    Mov kytu,al  
    
    ;case

    
    cmp kytu,'a'
    je  a
    
    cmp kytu,'b'
    je  b
    
    cmp kytu,'c'
    je  c
    
    
    a:
    
      Mov dx,1
      Mov cx,50       
      lap_a:
        Add dx,4
        loop lap_a    
      jmp quaylai
        
        
      
     
    b:  
        
        Mov dx,offset msg_5
        Mov ah,9
        Int 21h
        
        Mov ah,1
        Int 21h
        Mov kytu_1,al
        
        Mov cx,80
      lap_b:
        Mov ah,2
        Mov dl,kytu_1
        Int 21h
        loop lap_b
      jmp quaylai
        
          
    
    c:  
        Mov dx,offset msg_6
        Mov ah,9
        Int 21h
        mov ah,2
        mov dl,0Dh
        int 21h
        
        mov ah,2
        mov dl,0Ah
        int 21h
        
        Mov cx,5
        c_1:
        Mov ah,1
        Int 21h
        Mov passwd,dl
         ;chuyen ve dau dong
        loop c_1
        mov ah,2
        mov dl,0Dh
        int 21h
        
        Mov cx,5
    c_tt:

        Mov dl,'X'
        Mov passwd,dl
        
        Mov ah,2
        Mov dl,passwd
        Int 21h        
      loop c_tt
        
        
        
    
    
    DOS:
    
    Mov ah,4ch
    Int 21h
    
end
          
   