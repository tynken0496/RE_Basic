#Lập Trình hợp ngữ (Assembly)

	Tài liệu tham khảo: Internet

	Thực hiện: Nguyễn Văn Thành

	Cập nhật lần cuối: 10/01/2017

###Mục lục
<a href="http://bit.ly/2iryedL">Giáo Trình</a>

 - [1. Bài 7: Giáo trình Assembly(Trang109)](#1)

 - [2. Bài 8: Giáo trình Assembly(Trang109)](#2)

 - [3. Bài 9: Giáo trình Assembly(Trang110)](#3)

 - [4. Bài 10: Giáo trình Assembly(Trang110)](#4)

 - [5. Bài 11: Giáo trình Assembly(Trang110)](#5)

 - [6. Bài 12: Giáo trình Assembly(Trang110)](#6)

#### 1. Bài 7: Giáo trình Assembly(Trang109)<a name="1"></a>
	Trích đề bài : Hãy viết các lệnh (Không phải các chương trình đầy đủ) thực hiện các công việc sau đây:
	a. Đọc một ký tự và hiển thị nó ở vị trí tiếp theo trên cùng 1 dòng.
	b. Đọc một chữ hoa(bỏ qua việc kiểm tra lỗi) và hiển thị nó ở vị trí tiếp theo trên cùng một dòng dưới dạng chữ thường.

 - Code: 

```javascrypt
.model small
.stack
.data
    message_1   db  "Nhap 1 ky tu: $"
    message_2   db  "Ky tu da nhap: $"  
    message_3   db 0Dh,0Ah,"Nhap vao ky tu hoa : $"  
    message_4   db 0Dh,0Ah,"Chuyen sang ky tu thuong la: $"
kytu db ?
kytuhoa db  ?

.code
    Mov ax,@data
    Mov ds,ax
    
    ;Xuat message_1
    
    Lea dx,message_1
    Mov ah,9
    Int 21h
    
    ;Nhap 
    
    Mov ah,1
    Int 21h
    Mov kytu,al
    
    ; Xuong dong 
    
    mov ah,2
    mov dl,0Ah
    int 21h
    
    ;Xuat message_2 
    
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    ;Hien ky tu 
    
    Mov ah,2
    Mov dl,kytu
    Int 21h   
             
    ;Xuat message_3
    Lea dx,message_3
    Mov ah,9
    Int 21h  
    

    ;Nhap vao 1 ki tu hoa va doi thanh ki tu thuong
             
    Mov ah,1
    Int 21h ; Doc 1 ki tu hoa va luu vao AL
    Add al,20h ; Doi thanh ki tu thuong
    Mov kytuhoa,al
    
    ;Xuat ky tu thuong    
    Lea dx,message_4
    Mov ah,9
    Int 21h
    Mov ah,2
    Mov dl,kytuhoa
    Int 21h
    
    ;DOS
    Mov ah,4Ch
    Int 21h

end
```

 - Kết quả: 

![Ketqua](http://i.imgur.com/SKQkimv.gif)

#### 2. Bài 8: Giáo trình Assembly(Trang109)<a name="2"></a>
	Trích đề bài: Viết một chương trình thực hiện các công việc sau đây:
	a. Hiển thị dấu hỏi chấm (?).
	b. Đọc hai chữ số thập phân có tổng nhỏ hơn 10.
	c. Hiển thị các số đo với tổng của chúng với dòng thông báo tương ứng.

 - Code:

```javascrypt
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
```
 - Kết quả:

![KQ](http://i.imgur.com/awiNaC8.gif)


#### 3. Bài 9: Giáo trình Assembly(Trang110)<a name="3"></a>
	Trích dẫn : 
	Hãy viết một chương trình thực hiện các công việc sau đây:
	a. Đưa ra thông báo cho người sử dụng.
	b. Đọc 3 chứ cái đầu của họ, tên đệm, tên của một người.
	c. Hiển thị chúng từ trên xuống trên lề trái.
	Ví Dụ:
	Bạn hãy vào 3 chữ cái đầu: NTB
	N
	T
	B

 - Code:

```Javascrypt
.model  small
.stack  100h
.data
    message     db  "Ban hay nhap 3 chu cai dau: $"  
    CLRF db 13,10,'$'
    a   db   ?
    b   db   ?
    c   db   ?
.code
    Mov ax,@data
    Mov ds,ax
    
    ;xuat chuoi
    
    Lea dx,message
    Mov ah,9
    Int 21h
    
    ;Nhap
    
    Mov ah,1
    Int 21h
    Mov a,AL
    
    Mov ah,1
    Int 21h
    Mov b,AL
    
    Mov ah,1
    Int 21h
    Mov c,AL     
    
 ;Xuat KQ 
    ; Xuong dong va ve dau dong     
    Lea dx,CLRF  
    Mov ah,9
    Int 21h
    
    ;Xuat a
    Mov ah,2
    Mov dl,a
    Int 21h   
    
    ; Xuong dong va ve dau dong     
    Lea dx,CLRF  
    Mov ah,9
    Int 21h
    
    ;Xuat b
    Mov ah,2
    Mov dl,b
    Int 21h   
    
    ; Xuong dong va ve dau dong     
    Lea dx,CLRF  
    Mov ah,9
    Int 21h
    
    ;Xuat c
    Mov ah,2
    Mov dl,c
    Int 21h   
    
 ;DOS
  Mov ah,4ch
  Int 21h
end
```
 - Kết Quả:

![KQ](http://i.imgur.com/KrS07pv.gif)