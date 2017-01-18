#Báo cáo Task 10_3

#Lập Trình Hợp Ngữ(Assembly)

	Tài liệu tham khảo : internet

	Thực hiện:  Nguyễn Văn Thành

	Cập nhật lần cuối: 18/01/2017

###Mục Lục
<a href="http://bit.ly/2iryedL">Giáo Trình</a>

[1. Bài 2: Trang 156](#1)

[2. Bài 3: Trang 156](#2)

[3. Bài 4: Trang 156](#3)

[4. Bài 5: Trang 156](#4)

[5. Bài 6: Trang 157](#5)

[6. Bài 7: Trang 157](#6)


#### 1. Bài 2:<a name="1"></a>

 - **Code**: 

```javascrypt

.model small
.stack 100h
.data
    msg db "Nhap A or B: $"
kytu db ?
.code

    Mov ax,data
    Mov ds,ax   
    ;xuat msg
    Lea dx,msg
    Mov ah,9
    Int 21h 
    ;nhap kytu
    Mov ah,1
    Int 21h
    Mov kytu,AL
             
  Case_ss:
    cmp kytu,'A'
    je A
     
    cmp kytu,'B'
    je B
        
        
  A:
    mov ah,2
    mov dl,0Ah
    int 21h
    jmp Thoat
     
  B:
    mov ah,2
    mov dl,0Dh
    int 21h
    jmp Thoat
      
      ;Hien thi dau va cuoi dong   
    Thoat:
    Mov ah,1
    Int 21h
       ;DOS 
    Mov ah,4Ch
    Int 21h

end
```

 - **Kết Quả:**

![Kết Quả](http://i.imgur.com/365Jx3B.gif)


#### 2. Bài 3<a name="2"></a>

 - **Code**: 

```javascrypt

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
    
```

 - **Kết Quả:**

![Kết Quả](http://i.imgur.com/1NMsHd0.gif)

#### 3. Bài 4<a name="3"></a>

 - **Code**: 

```javascrypt
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
          
   
```

 - **Kết Quả:**

![Kết Quả](http://i.imgur.com/JWmxGGQ.gif)

#### 4. Bài 5<a name="4"></a>

 - **Code**: 

```javascrypt
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
    
```

 - **Kết Quả:**

![Kết Quả](http://i.imgur.com/uakelZI.gif)

#### 5. Bài 6<a name="5"></a>

 - **Code**: 

```javascrypt
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
    
    
    
    
    
    
```

 - **Kết Quả:**

![Kết Quả](http://i.imgur.com/0NP2tys.gif)

#### 6. Bài 7<a name="6"></a>

 - **Code**: 

```javascrypt
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
      
    
    
    

    
```

 - **Kết Quả:**

![Kết Quả](http://i.imgur.com/rJGK17o.gif)