.model  small         ;khai bao kieu chuong trinh: small
.stack  100h          ;khai bao kich thuoc ngan xep 
.data
 message db '?$'      ;khai bao du lieu  
 message_1  db  0Dh,0Ah,"Nhap 2 chu so$"   
 message_2  db  0Dh,0Ah,"Nhap a: $ "
 message_3  db  0Dh,0Ah,"Nhap b: $ "
 message_4  db  0Dh,0Ah,"Tong cua $" 
 message_5  db  " va $"
 message_6  db  " la $"
 a  db  ?           
 b  db  ? 
 c  db  ? 

 
.code
Mov AX,@data          ;Lay dia chi data segment gan cho gia thanh ghi AX                                                  
Mov DS,AX             ;de chuyen sang cho thanh ghi DX

; Xuat chuoi 

Lea dx,message        ;goi -> xuat ra man hinh "?" 
Mov ah,9              ;Goi ham 9
Int 21h               ;De ngat 21h -> in           



; Xuat chuoi 1 
Lea dx,message_1
Mov ah,9
Int 21h  

;xuat chuoi 2     
Lea dx,message_2 
Mov ah,9
Int 21h    

;Nhap   
Mov ah,1
Int 21h
Mov a,AL

;xuat chuoi 3
Lea dx,message_3
Mov ah,9
Int 21h

;nhap

Mov ah,1
Int 21h
Mov b,AL

;Phep Cong

Mov al,a
Add al,b
Mov c,al 

;Ket qua

Lea dx,message_4 
Mov ah,9
Int 21h

Mov ah,2
Mov dl,a
Int 21h

Lea dx,message_5 
Mov ah,9
Int 21h         

Mov ah,2
Mov dl,b
Int 21h 

Lea dx,message_6 
Mov ah,9
Int 21h

   
Mov ah,2
Mov dl,c 
Sub dl,30h
Int 21h


Mov AH,4Ch            ;Thoat khoi chuong trinh 
int 21h

end