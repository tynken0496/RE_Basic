#Báo cáo Task 10_4

#Lập Trình Hợp Ngữ(Assembly)

	Tài liệu tham khảo : internet

	Thực hiện:  Nguyễn Văn Thành

	Cập nhật lần cuối: 06/02/2017

###Mục Lục

<a href="http://bit.ly/2iryedL">Giáo Trình</a>

[1. Bài 8(183)](#1)

[2. Bài 9(183)](#2)

[3. Bài 10(183)](#3)

[4. Bài 11(183)](#4)

[5. Bài 12(183)](#5)

[6. Bài 13(184)](#6)

[7. Bài 14(184)](#7)

####1. Bài 8 <a name="1"></a>

 - Đề : Viết một chương trình thông báo cho người sử dụng vào một ký tự, in ra trên các dòng liên tiếp nhau mã ASCII của ký tự đó dưới dạng nhị phân, số các chữ số 1 trong mã ASCII dưới dạng nhi phân đó.

	VÍ DỤ: 
	Đánh vào một ký tự : A
 	Mã ASCII của A dưới dạng nhi phân là : 01000001
 	Số các bit 1 là 2
 
 - Code:

```javascrypt
.model  small
.stack 100h
.data
    msg_1   db  "Danh vao mot ky tu: $"
    msg_2   db  13,10,"Ma ASCII cua ky tu duoi dang nhi phan la : $"
    msg_3   db  13,10,"So cac bit 1 la: $"
    a   db  ? 
    b   db  ?
.code 

    MOV ax,@data
    MOV ds,ax
    
    ;Nhap
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h
    
    Mov ah,1
    Int 21h 
    Mov a,al
    
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    ;xu ly 
    
      
    
    Mov bl,a
    Mov b,0
    Mov cx,9    ; Vi dich 8 bit + 1 bit khoang trang
  lap:   
    Shl bl,1    ; dich trau 1 bit
    Jc  inso_1  ; Neu CF = 1 thi nhay den inso_1
    cmp cx,5    ; Khi da in ra 4 bit thi cach
    je space
    Mov ah,2    ; In so 0
    Mov dl,'0'
    Int 21h   
    loop lap
    jmp In_Tong
    
    
  inso_1:
    Inc b       ; Tang b len 1 
    Mov ah,2    ; in so 1
    Mov dl,'1'
    Int 21h
    cmp cx,0
    je  In_Tong
    loop lap
  
  space:       ; in ra khoang trang
    Mov ah,2
    Mov dl,' '
    Int 21h
    cmp cx,0
    je  In_Tong
    loop lap 
    
    ; in msg_3
  In_Tong:  
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
       
    Mov bl,b            ; bao nhieu lan hien so 1 thi xuat ra
    Add bl,48
    Mov ah,2
    Mov dl,bl
    
    Int 21h
    
    DOS:
    Mov ah,4ch
    Int 21h
    
end    
```

 - Kết quả:

![Bài 8](http://i.imgur.com/qCSmPeY.gif)

####2. Bài 9 <a name="2"></a>

 - Đề bài : Viết chương trình thông báo cho người sử dụng đánh vào một ký tự và in mã ASCII của ký tự dưới dạng hex ở dòng tiếp theo.Lập lại cho đến khi người sử dụng đánh ENTER.

	Ví dụ:
	Đánh vào một ký tự: Z
	Mã ASCII của Z dưới dạng hex là 5A
	Đánh vào một ký tự:

 - Code:

```javascrypt
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
    
    cmp dl,39
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

```

 - Kết Quả:

![Bài 9](http://i.imgur.com/pPDxmO1.gif)

####3. Bài 10 <a name="3"></a>

 - Đề bài: Viết chương trình thông báo cho người sử dụng đánh vào một số hex nhỏ hơn hay bằng 4 chữ số. Đưa ra số dưới dạng nhị phân ở dòng kế tiếp. Khi người sử dụng đưa vào một ký tự không hợp lệ, thông báo để cho họ vào lại. Chương trình chỉ nhận các chữ in hoa.

	Ví Dụ:
	Đánh vào một số hex(0..FFFF): 1a
	Chữ số hex không hợp lệ, hãy nhập lại: 1ABC
	Dưới dạng nhị phân nó bằng: 0001101010111100
	Chương trình của bạn có thể bỏ qua các ký tự sau 4 ký tự đầu tiên.

 - Code:

```javascrypt
.model small
.stack  100h
.data
    msg_1   db  "Danh vao mot so hex(0..FFFF): $"
    msg_2   db  13,10,"Chu so hex khong hop le, hay nhap vao lai: $"                   
    msg_3   db  13,10,"Duoi dang nhi phan no bang: $"
count   db  ?
.code

    Mov ax,@data
    Mov ds,ax
    
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h

WHILE_1:    
    XOR BX,BX	           ; xoa bx
	MOV CL,4	
	MOV AH,1	
	INT 21H		
WHILE_:
	CMP AL,0DH 	           ;enter
	JE	END_WHILE          

	CMP AL,39H 
	JG	LETTER	           ; nhay neu lon hon  

	AND AL,0FH 
	JMP SHIFT 
LETTER:
	CMP AL,60H
	JG  LETTER_1
	SUB AL,37H
	
    
SHIFT:
	SHL	BX,CL              ; gianh cho cho gia tri moi

	OR BL,Al               ; chen 
	INT 21H
	JMP WHILE_ 

LETTER_1:
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    jmp WHILE_1:
    

	
END_WHILE:
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h

    xor cx,cx
    Mov cx,19

WHILE_2:
    inc count
    cmp count,5
    je  SPACE    
    SHL bx,1
    jc  NUMBER_1  ; nhay neu co nho 1
    jnc NUMBER_0  ; nhay neu co nho 0
    
SPACE:
    Mov ah,2
    Mov dl,' '
    Int 21h
    mov count,0
    loop WHILE_2 
        
NUMBER_0:
    Mov ah,2
    Mov dl,'0'
    Int 21h
    loop WHILE_2
      
NUMBER_1:
    Mov ah,2
    Mov dl,'1'
    Int 21h
    loop WHILE_2   

   

DOS:
    Mov ah,4ch
    Int 21h
```

 - Kết Quả:

![Bài 10](http://i.imgur.com/wPtIk1z.gif)

####4.Bài 11 <a name="4"></a>

 - Đề Bài: Viết chương trình thông báo cho người sử dụng đánh vào một số nhị phân có nhỏ hơn hay bằng 16 chữ số. Đưa ra số dưới dạng hex ở dòng kế tiếp. Khi người sử dụng đưa vào một ký tự không hợp lệ, thông báo để họ vào lại.

 	Ví Dụ: 
 	Đánh vào một số nhị phân(nhiều nhất 16 chu so): 111000001
 	Dưới dạng hex nó bằng: E1
 	Chương trình của bạn có thể bỏ qua các ký tự sau 16 ký tự đầu tiên.

 - Code:

```javascrypt
.model  small
.stack  100h
.data   
    msg_1   db  "Danh vao mot so nhi phan (nhieu nhat 16 chu so): $)"
    msg_2   db  13,10,"Duoi dang hex cua no bang: $"
    msg_3   db  13,10,"Nhap sai! Nhap so nhi phan: $"
count db    ?    
.code
    
    Mov ax,@data
    Mov ds,ax
    
    
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h
     
    xor bx,bx 
 Nhap:
    
    Mov ah,1
    Int 21h
    cmp al,'0'
    je  Nhap_1
    cmp al,'1'
    je Nhap_1
    cmp al,13
    je Bin
    jmp Nhap_Lai
    
 Nhap_Lai:
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
    
    jmp Nhap_1   
    
 Nhap_1:    
    and al,0Fh
    Shl bx,1
    or  bl,al
    Inc count
    cmp count,16
    je  Bin
    jmp Nhap:
  
  
 Bin: 
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    Mov cx,4
 hex:
    Mov dl,bh
    shr dl,4
    
    cmp dl,9
    Ja  letter
    
    cmp dl,0
    je  print_0
    
    add dl,30h
    rol bx,4
    jmp resuft
    
 letter:
    add dl,37h
    rol bx,4
    jmp resuft
    
 print_0:
    Mov ah,2
    Mov dl,'0'
    rol bx,4
    int 21h
    loop hex
       
 resuft:     
    mov ah,2
    int 21h
    loop hex
       
    Mov ah,4ch
    int 21h
end       
    
  
```

 - Kết Quả:

![Bài 11](http://i.imgur.com/vNeawg0.gif)


####5. Bài 12 <a name="5"></a>

 - Đề Bài: Viết một chương trình thông báo cho người sử dụng đưa vào 2 số nhị phân, mỗi số có 8 chữ số, in ra màn hình ở dòng tiếp theo tổng của chúng dưới dạng nhị phân. Mỗi khi người sử dụng đánh vào một ký tự không hợp leejj sẽ có thông báo yêu cầu vào lại. Mỗi số được nhận sau khi sử dụng đánh ENTER.
 	
 	Ví Dụ: 
 	Đánh vào một số nhị phân 8 chữ số: 11001010
 	Đánh vào một số nhị phân 8 chữ số: 10011100
 	Tổng của chúng dạng nhị phân bằng: 101100110

 - Code:

```javascrypt

```

 - Kết quả:

![Bài 12](http://i.imgur.com/uKccwcM.gif)

####6. Bài 13 <a name="6"></a>

 - Đề Bài: Viết một chương trình thông báo cho người sử dụng đưa vào 2 số hex không dấu trong từ 0 đến FFFFh, in ra màn hình ở dòng tiếp theo tổng của chúng dưới dạng hex. Mỗi khi người sử dụng đánh vào một ký tự không hợp lệ sẽ có thông báo yêu cầu vào lại. Chương trình của bạn phải có khả năng kiểm soát hiện tượng tràn không dấu. Mỗi số được nhận sau khi người sử dụng đánh ENTER.

 	Ví Dụ: 
 	Đánh vào một số hex, 0 - FFFF: 21AB
 	Đánh vào một số hex, 0 - FFFF: FE03
 	Tổng của chúng là: 11FAE

 - Code:

```javascrypt
.model  small
.stack  100h
.data
    msg_1   db  13,10,"Danh vao mot so hex,0-FFFF(thu nhat): $"
    msg_2   db  13,10,"Danh vao mot so hex,0-FFFF(thu hai): $"
    msg_3   db  13,10,"Tong cua chung la: $"
    msg_4   db  13,10,"Nhap sai!$"
    count   db  ?
    a       dw  ?
    b       dw  ?
    
.code
    Mov ax,@data
    Mov ds,ax
    
 messege_1:   
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h
    mov count,0
    
 hex_1:  
    Inc count
    
    Mov ah,1
    Int 21h
 while_1:
    cmp al,13    
    je messege_2
    
    cmp al,39h
    jg letter_1
    
   ;number 
    and al,0Fh
    shl bx,4
    or  bl,al
    cmp count,4
    je messege_2    
    jmp hex_1
 
 letter_1:
    cmp al,5Bh
    jg  fail_1            
    sub al,37h
    shl bx,4
    or  bl,al
    cmp count,4
    je messege_2 
    jmp hex_1
    
    
 fail_1:
    Mov ah,9
    Mov dx,offset msg_4
    int 21h
    
    jmp messege_1
    
 
     
              
 messege_2:
    Mov a,bx   
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    mov count,0
    xor dx,dx
    
 hex_2:  
    Inc count
    
    Mov ah,1
    Int 21h
 while_2:
    cmp al,13    
    je enter
    
    cmp al,39h
    jg letter_2
    
   ;number 
    and al,0Fh
    shl dx,4
    or  dl,al
    cmp count,4
    je enter       
    jmp hex_2
 
 letter_2:
    cmp al,60h
    jg  fail_2             
    sub al,37h
    shl dx,4
    or  dl,al 
    cmp count,4
    je enter 
    jmp hex_2
    
    
 fail_2:
    Mov ah,9
    Mov dx,offset msg_4
    int 21h
    
    jmp messege_2
    
 enter:
    Mov b,dx
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
    
    Mov dx,b   
    Add bx,dx
    jc tran_1     ;nhay neu nho
    jmp khongtran_1
     
 tran_1:
    Mov ah,2
    Mov dx,'1'
    int 21h
    
 khongtran_1:
           
     Mov cx,4
 hex:
    Mov dl,bh
    shr dl,4
    
    cmp dl,9
    Ja  letter
    
    cmp dl,0
    je  print_0
    
    add dl,30h
    rol bx,4
    jmp resuft
    
 letter:
    add dl,37h
    rol bx,4
    jmp resuft
    
 print_0:
    Mov ah,2
    Mov dl,'0'
    rol bx,4
    int 21h
    loop hex
       
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

```

 - Kết Quả:

![Bài 13](http://i.imgur.com/ja4aWuY.gif)

####7. Bài 14 <a name="7"></a>

 - Đề Bài: Viết một chương trình thông báo cho người sử dụng đánh vào một chuỗi các chữ số thập phân kết thúc bằng ENTER, và in ra màn hình ở dòng kế tiếp tổng của chúng ở dạng hex. Nếu người sử dụng đánh vào một ký tự không hợp lệ phải thông báo để họ vào lại.

 	Ví Dụ: 
 	Đánh vào một chuỗi các chữ số thập phân: 1299843
 	Tổng của các chữ số dưới dạng hex là: 0024

 - Code:

```javascryt
.model small
.stack 100h
.data
    msg_1   db  13,10,"Danh vao mot chuoi chu so thap phan: $"
    msg_2   db  13,10,"Tong cua cac chu so duoi dang hex la : $"
    msg_3   db  13,10,"Nhap sai!$"   
.code
    Mov ax,@data
    Mov ds,ax
  
  messege_1:  
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h
    ;xor ax,ax
  lap:  
   ; xor ax,ax     
    Mov ah,1
    Int 21h
    cmp al,13
    je  decima
    sub al,30h
    cmp al,11
    jg  fail
    Add dl,al
    Add bx,dx
    xor dx,dx
    jmp lap
  
  fail:
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
    jmp messege_1
    
    
  decima:
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    
    Mov cx,4   
 hex:
    Mov dl,bh
    shr dl,4
    
    cmp dl,9
    Ja  letter
    
    cmp dl,0
    je  print_0
    
    add dl,30h
    rol bx,4
    jmp resuft
    
 letter:
    add dl,37h
    rol bx,4
    jmp resuft
    
 print_0:
    Mov ah,2
    Mov dl,'0'
    rol bx,4
    int 21h
    loop hex
       
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

```

 - Kết Quả:

![Bài 14](http://i.imgur.com/3hFJGt3.gif)


