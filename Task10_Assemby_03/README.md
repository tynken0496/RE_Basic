#Báo cáo Task 10_2

#Lập Trình Hợp Ngữ(Assembly)

	Tài liệu tham khảo : internet

	Thực hiện:  Nguyễn Văn Thành

	Cập nhật lần cuối: 

###Mục Lục

[1. Tổng quan](#1)

[2. Lệnh nhảy](#2)

 - [2.1. Một ví dụ về lệnh nhảy](#2.1)

 - [2.2. Các lệnh nhảy có điều kiện](#2.2)
 <ul>
 <li>[2.2.1. Phạm vi của lệnh nhảy có điều kiện](#2.2.1)</li>
 <li>[2.2.2. CPU thực hiện một lệnh nhảy như thế nào](#2.2.2)</li>
 <li>[2.2.3. Các lệnh nhảy có dấu](#2.2.3)</li>
 <li>[2.2.4. Các lệnh nhảy không dấu](#2.2.4)</li>
 <li>[2.2.5. Các lệnh nhảy điều kiện đơn](#2.2.5)</li>
 </ul>

 - [2.3. Lệnh JMP](#2.3)

[3. Lệnh so sánh](#3)

 - [3.1. Lệnh CMP](#3.1)

 - [3.2. Dịch các lệnh có điều kiện](#3.2)

 - [3.3. So sánh các lệnh nhảy có dấu và không dấu](#3.3)

 - [3.4. Làm việc với các ký tự](#3.4)

[4. Cấu trúc rẽ nhánh](#4)

 - [4.1. Case](#4.1)

 - [4.2. Các nhánh với điều kiện kép](#4.2)

 - [4.3. Các điều kiện AND](#4.3)

 - [4.4. Các điều kiện OR](#4.4)

[5. Các cấu trúc lặp](#5)

 - [5.1. Vòng lặp FOR](#5.1)

 - [5.2. Vòng lặp WHILE](#5.2)

 - [5.3. Vòng lặp REPEAT](#5.3)

 - [5.4. So sánh WHILE và REPEAT](#5.4)

#### 1. Tổng quan<a name="1"></a>

 - Để đảm bảo thực hiện được các công việc có ích, các chương trình bằng **Hợp ngữ** phải có các phương pháp chọn lựa và lặp lại các đoạn mã lệnh. Trong phần này, sẽ chỉ ra các phương pháp đó được thực hiện như thế nào nhờ các lệnh **nhảy** và **lặp**.

 - Các lệnh **nhảy** và **lặp** chuyển điều khiển cho các phần khác trong chương trình. Sự chuyển giao này có thể không có điều kiện, có thể phục thuộc vào các tổ hợp riêng rẽ các cờ trạng thái.
 
 - Sau khi làm quen với các **cấu trúc nhảy**, chúng ta sẽ sử dụng chúng để thực hiện các **cấu trúc chọn lựa** và **lặp** của ngôn ngữ bậc cao. Các ứng dụng này sẽ làm cho việc đổi một thuật toán với các lệnh giải sang các lệnh hợp ngữ dễ dàng hơn.

#### 2. Lệnh nhảy<a name="2"></a>

##### 2.1. Một ví dụ về lệnh nhảy<a name="2.1"></a>

 - Để bạn có khái niệm về cách thức làm việc của cấu trúc nhảy, ta sẽ viết một chương trình hiển thị toàn bộ tập ý tự của IBM

 - Chương trình PGM6_1.ASM

```javascrypt
TITLE PGM6_1 ;hiển thị các ký tự IBM
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    MOV Ah,2    ;hàm hiển thị ký tự
    MOV CX,256  ;số kỹ tự được hiển thị
    MOV DL,0    ;DL chứa mã ASCII ký tự NULL
   PRINT_LOOP:
    INT 21h
    INC DL      ;tăng mã ascii
    DEC CX      ;giảm bộ đếm 
    JNZ PRINT_LOOP  ;lặp lại nếu CX khác 0
   ;Trở về DOS
    MOV AH,4Ch
    INT 21H
   MAIN ENDP
END MAIN
```

 - Tập hợp ký tự **IBM** bao gồm 256 ký tự. Các ký tự có mã từ 32 đến 127 là các ký tự **ASCII chuẩn** in được đã giới thiệu trong phần trước. IBM cũng cung cấp một hệ thống các ký tự đồ hoạ có mã từ 0 đến 32 và từ 128 đến 255.

 - Để hiển thị các ký tự chúng ta dùng một vòng lặp (từ dòng 9 đến dòng 13). Trước khi vào vòng lặp AH được khởi tạo giá trị 2 (hàm hiển thị một ký tự) và DL được đặt bằng 0 là mã ASCII ký tự đầu tiên. CX là bộ đếm vòng lặp, nó được đặt bằng 256 trước khi vào vòng lặp và giảm 1 sau khi mỗi ký tự được hiển thị.

 - Lệnh **JNZ** (Jump of NOT ZERO) điều khiển vòng lặp. Nếu kết quả của lệnh kế trước (Dec cx) khác 0, lệnh **JNZ** sẽ chuyển điều khiển đến lệnh có nhãn PRINT_LOOP. Cuối cùng khi DX bằng 0 chương trình tiếp tục thực hiện các lệnh trở về DOS. Tất nhiên với các mã ASCII của các ký tự điều khiển như lùi một ký tự, về đầu dòng v.v.. các chức năng điều khiển sẽ được thực hiện thay vì hiển thị chúng.

 - Lưu ý: PRINT_LOOP là nhãn dòng lệnh lần đầu tiên chúng ta sử dụng trong một chương trình. Các nhãn cần thiết khi một lệnh trỏ đến các lệnh khác giống như trong trường hợp trên. Nhãn kết thúc bằng dấu hai chấm và để dễ nhận ra, chúng được đặt riêng một dòng. Các nhã tham trỏ tới lệnh ngay sau chúng.


 - Kết quả:

![kq](http://i.imgur.com/qQpfgzi.gif)

#####2.2 Các lệnh nhảy có điều kiện <a name="2.2"></a>

 - **JNZ** là một ví dụ của lệnh nhảy có điều kiện. Cú pháp:

`JNZ nhãn_đích`

 - Nếu như điều kiện của lệnh nhảy được thoả mãn, lệnh có nhãn_đích sẽ được thi hành. Lệnh này có thể ở trước hoặc sau lệnh nhảy. Nếu điều kiện không thoả mãn, lệnh ngay sau lệnh nhảy được thi hành. Với lệnh **JNZ** điều kiện này là kết quả của lệnh trước nó khác 0.

#####2.2.1 Phạm vi của lệnh nhảy có điều kiện<a name="2.2.1"></a>

 - Cấu trúc mã máy của lệnh nhảy có điều kiện đòi hỏi **nhãn_đích**phải đứng trước lệnh nhảy không quá 126 byte hoặc đúng sau không quá 127 byte.

#####2.2.2 CPU thực hiện một lệnh nhảy như thế nào?<a name="2.2.2"></a>

 - Để thực hiện một lệnh nhảy, **CPU** nhìn vào thanh ghi cờ. Ta đã biết rằng thanh ghi phản ánh kết quả công việc gần nhất mà bộ vi xử lý thực hiện. Nếu điều kiện của lệnh nhảy (được phát biểu như một tổ hợp các sự lập cờ trạng thái) thoả mãn. CPU điều chỉnh **IP** trỏ đến nhãn đích và như thế lệnh ở sau nhãn này được thi hành tiếp theo. Nếu điều kiện nhảy không thoả mãn, **IP** không bị sửa đổi. Điều này có nghĩa là lệnh trên dòng tiếp theo sẽ được thi hành.

 - Trong chương trình trên. CPU thi hành lệnh **JNZ PRINT_LOOP phụ thuộc vào ZF. Nếu ZF = 0 điều khiển sẽ được chuyển tới nhãn **PRINT_LOOP**, nếu ZF = 1 chương trình tiếp tục thực hiện lệnh **MOV AH,4CH**

#####2.2.3. Các lệnh nhảy có dấu<a name="2.2.3"></a>

 - Các lệnh nhảy có dấu được dùng khi kếtquả trả về là các số có dấu:

![kq](http://i.imgur.com/WCj5yXn.png)

#####2.2.4. Các lệnh nhảy có dấu<a name="2.2.4"></a>

 - Các lệnh nhảy không dấu dùng với các số không dấu:

![kq](http://i.imgur.com/V7TS07d.png)

#####2.2.5. Các lệnh nhảy điều kiện đơn<a name="2.2.5"></a>

 - Các lệnh nhảy điều kiện đơn: Điều kiện phụ thuộc vào một cờ riêng biệt:

![kq](http://i.imgur.com/mqUzZHG.png)


#####2.3. Lệnh JMP<a name="2.3"></a>

 - Lệnh **JMP** (jump) dẫn đến việc chuyển điều khiển không điều kiện (nhảy không điều kiện). Cú pháp:

`JMP đích`

 - Ở đây đích phải là một nhãn trong cùng một đoạn với **JMP**

 - **JMP** có thể được dùng để khắc phục khoảng giới hạn của lệnh nhảy có điều kiện. Ví dụ: Giả sử chúng ta muốn tực hiện vòng lặp:

```javascrypt
TOP:
;thân vòng lặp
    DEC CX      ; giảm bộ đếm
    JNZ TOP     ; lặp nếu CX > 0
    MOV AX, BX  
```
 - Nhưng thân vòng lặp lại chứa quá nhiều lệnh đến mức nhãn **TOP** nằm ngoai khoảng giới hạn của lệnh **JNZ** (nhiều hơn 126 byte trước **JNZ TOP**). Chúng ta có thể sửa lại:

```javascrypt
TOP:
; thân vòng lặp
    DEC CX  ;giảm bộ đếm
    JNZ BOTTOM  ; lặp nếu cx > 0
    JMP EXIT
BOTTOM: JMP TOP
EXIT: 	MOV AX,BX
```

####3. Lệnh so sánh<a name="3"></a>

##### 3.1. Lệnh CMP<a name="3.1"></a>
 - Các điều kiện nhảy thường được cung cấp bởi lệnh **CMP**(compare). Nó có dạng sau:

`CMP đích, nguồn`

 - Lệnh này so sánh toán tử đích với toán tử nguồn bằng cách lấy toán tử đích trừ đi toán tử nguồn. Kết quả được lưu lại nhưng các cờ bị ảnh hưởng. Các toán hạng của lệnh **CMP** không thể cùng là các ô nhớ. Toán hạng đích không phép là hằng số. **Chú ý:** CMP giống hệt như **SUB** ngoại từ việc toán hạng đích không thay đổi.

 - Ví dụ: Giả thiết chương trình chứa hai dòng lệnh sau đây:
```javascrypt
 	CMP AX,BX
	JG BELOW
```
 - Ở đây AX=7FFFh, BX=0001. Kết quả so sánh AX và BX là 7FFFh - 0001h = 7FFEh.

 - Bảng các lệnh nhảy chỉ ra rằng điều kiện nhảy cho lệnh JG đã được thoả mãn bởi vì ZF = SF = OF = 0, và do đó điều khiển được chuyển đến nhãn BELOW.

##### 3.2. Dịch các lệnh có điều kiện<a name="3.2"></a>

 - Trong ví dụ vừa nêu, khi xem xét các cờ sau lệnh **CMP** ta thấy rằng điều khiển sẽ được chuyển đến nhãn **BELOW**. Đó cũng là cách CPU thực hiện một lệnh nhảy có điều kiện. Người lập trình không cần thiết là phải suy nghĩ nhiều về các cờ, bạn có thể chỉ dùng tên của lệnh nhảy để quyết định việc chuyển điều khiển đến nhãn đích. Các lệnh sau đây:

```javascrypt
	CMP AX,BX
	JG BELOW
```

 - Nếu như AX lớn hơn BX (coi là số có dấu) thì JG (jump if greater than) sẽ chuyển đến Below.

 - Đặc biệt cả khi nghĩ rằng lệnh **CMP** được thiết kế chỉ dùng cho các lệnh nhảy có điều kiện, chúng vẫn có thể đi kèm với các lệnh khác như trong chương trình PGM6_1. Một ví dụ khác:

```javascrypt
DEC AX
JL THERE
```

 - Trường hợp này nếu nội dung của **AX** (coi là số có dấu) nhỏ hơn 0, điều khiển sẽ được chuyển đến **There**.

##### 3.3. So sánh các lệnh nhảy có dấu và không dấu<a name="3.3"></a>

 - Mỗi lệnh nhảy có dấu đều tương ứng với một lệnh nhảy không dấu. Ví dụ lệnh nhảy có dấu **JG** và lệnh nhảy không dấu **JA**. Dùng lệnh nhảy có dấu hay không dấu tuỳ thuộc vào kiểu số được đưa ra. Trên thực tế, như bảng các lệnh nhảy chỉ ra, các lệnh này thao tác với các cờ khác nhau: Các lệnh nhảy có dấu sử dụng các cờ **ZF**, **SF** và **OF** trong khi các lệnh nhảy không dấu lại dùng các cờ **ZF** và **CF**. Sử dụng không đúng loại có thể đưa đến kết quả sai.

 - Ví dụ: Giả thiết rằng chúng ta làm việc với các số không dấu. Nếu như AX = 7FFFh và BX = 8000h, khi ta thực hiện:

```javascrypt
	CMP AX,BX
	JA BELLOW
```
- Thậm chí 7FFFh > 8000h trong dạng có dấu, chương trình vẫn không nhảy đến nhãn **BELOW**. Nguyên nhân ở đây là 7FFFh < 8000h ở dạng không dấu và ở đây chúng ta lại dùng lệnh nhảy không dấu **JA**.

##### 3.4. Làm việc với các ký tự<a name="3.4"></a>

 - Khi làm việc với tập hợp ký tự **ASCII** chuẩn cả các lệnh nhảy có điều kiện và không điều kiện đều có thể sử dụng bởi lẽ bit dấu của byte chứa mã ký tự luôn là 0. Dù sao thì các lệnh nhảy không dấu phải được sử dụng khi so sánh các ký tự **ASCII** mở rộng (mã từ 80h đến FFh).

 - Ví dụ 6.1:
    Giả sử AX và BX chứa các số có dấu. Hãy viết các lệnh để đưa số lớn nhất vào CX.

 - **Trả lời:**

		MOV CX,AX   ;đưa AX vào CX
		CMP BX, CX  ; BX lớn hơn
		JLE NEXT    ;không, tiếp tục
		MOV CX, BX  ; đúng, đưa BX vào CX
	NEXT:

#### 4. Cấu trúc rẽ nhánh<a name="4"></a>

 - Trong các ngôn ngữ bậc cao, các cấu trúc rẽ nhánh của một chương trình để chọn các đường dẫn khác nhau và phụ thuộc vào các điều kiện. Phần này ta sẽ xem xét 3 cấu trúc:

```javascrypt
IF điều_kiện
    THEN
        nhánh_đúng
END_IF
```

Xem hình 6.2.

![hinh](http://i.imgur.com/wPxw7S1.png)

 - Điều_kiện là một biểu thức có thể đúng hoặc sai. Nếu nó đúng, nhánh_đúng sẽ được thực hiện. Ngược lại, cấu trúc không thực hiện lệnh nào, chương trình tiếp tục thực hiện với các lệnh sau.

 - Ví dụ 6.2: Thay số trong AX bằng giá trị tuyệt đối của nó
 
 - **Trả lời:** Một thuật toán với mã lệnh giải:

```javascrypt
IF AX > 0
THEN
    thay AX bằng -AX
END_IF

    Nó có thể được mã hoá như sau:

; IF AX < 0
    CMP AX,0        ;AX < 0
    JNL END_IF      ; không, thoát ra
; THEN
    NEG AX          ; đúng, đổi dấu
END IF:
```

 - Điều kiện AX < 0 được kiểm tra bởi lệnh CMP AX,0. Nếu AX không nhỏ hơn 0, ta không phai làm gì cả, JNL được dùng để nhảy qua lệnh NEG AX, nếu điều kiện AX < 0 thoả mãn, chương trình tiếp tục thực hiện lệnh NEG AX.

```javascrypt
IF_THEN_ELSE.

IF điều_kiện
THEN
    nhánh_đúng
ELSE
    nhánh_sai
END_IF
```

Xem hình 6.3 :

![image](http://i.imgur.com/DFiH9pF.png)

 - Trong cấu trúc này nếu **điều_kiện** là đúng nhóm lệnh **nhánh_đúng** sẽ được thi hành. Còn nếu **điều_kiện** sai, nhóm lệnh nhánh)sai sẽ được thi hành.

 - **Ví dụ 6.3:** Giả sử AL và BL chứa các ký tự ASCII mở rộng. Hãy hiện thị ký tự đứng trước trong bảng mã.

 - **Trả lời:**
```javascrypt
IF AL <= BL
    THEN
        hiển thị ký tự trong AL
ELSE
        hiển thị ký tự trong BL
END_IF
```
    Ta có thể mã hoá nó như sau:
```javascrypt
    MOV AH,2    ;chuẩn bị hiển thị
;IF AL <= BL
    CMP AL,BL   ; AL <= BL
    JNBE ELSE_  ;không, hiển thị ký tự trong BL
;THEN
    MOV DL,AL   ; chuyển ký tụ vào DL để hiển thị
    JMP DISPLAY ; tới DISPLAY
ELSE_:			;BL < AL
    MOV DL,BL   ;chuyển ký tự vào DL để hiển thị
DISPLAY:
    int 21h     ;hiển thị nó.
;END_IF
```
 - _Chú ý:_ Ta dùng nhãn **ELSE_** vì **ELSE** là từ dành riêng.

 - Điều kiện: **AL** <= **BL** được kiểm tra bởi lệnh `CMP AL,BL`. Nếu nó sai, chương trình sẽ nhảy qua **nhánh_đúng** tới **ELSE**. Chúng ta sử dụng lệnh nhảy không dấu **JNBE** bởi lẽ chúng ta đang so sánh các kí tự mở rộng.

 - Nếu **AL** <= **BL** thoả mãn, nhánh_đúng được thực hiện. Lưu ý rằng chỉ thị `JMP DISPLAY` là cần thiết để nhảy qua **nhánh_sai**. Điều này khác trong với ngôn ngữ bậc cao: **nhánh_sai** được tự động nhảy qua nếu nhánh đúng được thực hiện.

#####4.1. Case<a name="4.1"></a>

 - **CASE** là một cấu trúc đa nhánh, nó kiểm tra các thanh ghi, các biến hay các biểu thức với các giá trị riêng rẽ trong miền giá trị. Dạng tổng quát của nó là:

```javascrypt
    CASE phát_biểu
        giá_trị_1: Dòng_lệnh_1
        giá_trị_2: dòng_lệnh_2
        .
        .
        giá_trị_n: dòng_lệnh_n
    END_CASE
```
**Xem hình 6.4**
![6.4](http://i.imgur.com/LesV6PN.png)

 - Trong cấu trúc này phát_biểu được kiểm tra, nếu giá trị của nó bằng với giá_trị_i thì dòng_lệnh_i sẽ được thi hành. Ta giả thiết tập hợp giá_trị_1... giá_trị_n tách biệt nhau

 - **Ví dụ 6.4**: Nếu AX chứa một số âm, hãy nhập -1 vào BX, nếu AX chứa 0, cho BX bằng 0, nếu AX dương đổi BX thành 1.

    **Lời giải**:
```javascrypt
CASE AX

    <0: gán BX bằng -1
    =0: gán BX bằng 0
    >0: gán BX bằng 1
END_CASE

    Ta có thể mã hoá như sau:

;case AX
    CMP AX,0    ;kiểm tra AX
    JL NEGATIVE ;AX<0
    JE ZERO     ;AX=0
    JG POSITIVE ;AX>0
NEGATIVE:
    MOV BX,-1   ;nhập -1 vào BX
    JMP end_case ;rồi thoát
ZERO:
    MOV BX,0    ;nhập 0 vào BX
    JMP END_CASE ;rồi thoát
POSITIVE:
    MOV BX,1    ;nhập 1 vào BX
END_CASE:
```

##### 4.2 Các nhánh với điều kiện kép<a name="4.2"></a>

 - Đôi khi điều kiện nhánh của IF hay CASE có dạng:

`	điều_kiện_1 AND điều_kiện_2`
hay

`	điều_kiện_1 OR điều_kiện_2`

 - Ở đây **điều_kiện_1** và **điều_kiện_2** có thể **đúng** hoặc **sai**. Đầu tiên chúng ta hãy xem xét điều kiện **AND** (AND condition), sau đó đến điều kiện **OR**(Or condition).

##### 4.3. Các điều kiện AND<a name="4.3"></a>

 - Điều kiện AND chỉ đúng khi cả hai điều kiện: **điều_kiện_1** và **điều_kiện_2** cũng đúng. Ngược lại nếu một trong chúng sai, điều kiện **AND** cũng sẽ sai.

 - Ví dụ 6.6: Đọc một ký tự. Nếu là chữ hoa thì hiển thị nó.

 - Lời giải:

```Javascrypt
;Đọc 1 ký tự (vào DL)
IF ('A' <= ký_tự) và (ký_tự <= 'Z')
THEN
    hiển thị ký tự
END_IF
```

 - Để mã hoá, đầu tiên chúng ta kiểm tra xem ký tự trong AL có đứng sau 'A' trong bảng mã hay không, nếu sai ta có kết thúc. Nếu đúng, trước khi hiểu thị ký tự ta vẫn còn phải kiểm tra ký tự có đứng trước 'Z' hay không. Sau đây là mã lệnh:

```javascrypt
;đọc một ký tự
    MOV AH,1    ;chuẩn bị đọc
    INT 21h     ;ký tự vào AL
;if ('A' <= ký_tự) và (ký_tự <= 'Z')
    CMP AL,'A'  ;ký_tự >='A' ?
    JNGE END_IF ;không, thoát ra
    CMP AL,'Z'  ;ký tự <='Z' ?
    JNGE END_IF ;không, thoát ra
;THEN hiển thị ký tự
    MOV DL,AL   ;lấy ký tự
    MOV AH,2    ;chuẩn bị hiển thị
    INT 21h     ;hiển thị ký tự
END_IF:
```

##### 4.4. Các điều kiện OR<a name="4.4"></a>

 - **Điều_kiện_1** OR **Điều_kiện_2** là đúng khi **điều_kiện_1** hoặc **điều_kiện_2**đúng. Nó chỉ sai khi cả hai điều kiện thành phần cùng sai.

 - **Ví dụ 6.7:** Đọc một ký tự. Nếu 'y' hay 'Y' thì hiển thị nó. Nếu ngược lại, kết thức chương trình.

 - **Lời giải:**

```javascrypt
;Đọc một ký tự (vào AL).
IF (ký_tự - 'Y') hoặc (ký_tự = 'Y')
THEN
    hiển thị ký tự
ELSE
    kết thúc chương trình.
END_IF
```

 - Để mã hoá, đầu tiên chúng ta sẽ kiểm tra ký_tự ='y'?. Nếu thoả mãn, điều kiện OR đúng và chúng ta có thể thực hiện dòng lệnh THEN. Ngược lại vẫn cơ hội để điều kiện OR đúng, đó là khi ký_tự bằng 'Y', và dòng lệnh Then vẫn được thi hành. Nếu điều này vẫn sai, điều kiện OR là sai và chúng ta sẽ thực hiện dòng lệnh ELSE. Sau đây là mã lệnh

```javascrypt
;đọc một ký tự
    MOV AH,1    ;chuẩn bị đọc
    INT 21h     ;ký tự trong AL
;IF (ký_tự='y') hoặc (ký_tự = 'Y')
    CMP AL,'y'  ;ký_tự ='y'?
    JE THEN     ;đúng, chueyẻn đến hiển thị ký tự
    CMP AL,'Y'  ;ký_tự = 'Y'
    JE THEN     ;đúng, chuyển đến hiển thị ký tự
    JE THEN     ;đúng, chuyển đến hiển thị ký tự
    JMP ELSE_   ;sai, kết thúc
THEN:
    MOV AH,2    ;chuẩn bị hiển thị
    MOV DL, AL  ;lấy ký tự
    INT 21h     ;hiển thị nó
    JMP END_IF  ;và thoát ra
ELSE_:
    MOV AH,4Ch  ;
    Int 21h     ;trở về dos
END_IF:
```

####5. Các cấu trúc lặp<a name="5"></a>

 - Một vòng lặp là một chuỗi các lệnh được lặp lại. Số lần lặp có thể đã xác định trước hoặc phụ thuộc vào các điều kiện.

##### 5.1. Vòng lặp FOR <a name="5.1"></a>

 - Đây là một cấu trúc lặp mà số lần lặp lại các dòng lệnh đã biết trước (vòng lặp điều khiển bằng biến đếm). Dạng mã lệnh giả:

```javascrypt
FOR số_lần_lặp DO
    các dòng lệnh
END_FOR
```

**Xem hình 6.5:**

![image](http://i.imgur.com/9RwkiKf.png)


 - Ta có thể sử dụng lệnh **LOOP** để thực hiện vòng lặp **FOR**. Lệnh này có dạng:

 ` LOOP nhãn_đích`

 - Bộ đếm vòng lặp là thanh ghi **CX** được khởi tạo bằng **số_lần_lặp**. Mỗi lần thực hiện lệnh **LOOP**, thanh ghi **CX** tự động giảm đi 1 và nếu **CX** khác 0 thì điều khiển được chuyển tới nhãn đích. Nếu **CX** = 0, lệnh tiếp sau lệnh **LOOP** sẽ được thi hành. Nhãn đích phải ở trước lệnh lặp khôg quá 126 byte
    Vòng lặp **FOR** có thể được thực hiện nhờ lệnh **LOOP** như sau:

```javascrypt
;khởi tạo CX bằng số_lần_lặp
TOP:
    ;thân vòng lặp
    LOOP Top
```

 - **Ví dụ 6.8:** Viết một vòng lặp điều khiển bằng biến đếm hiển thị một dòng 80 dấu *

 - **Lời giải:**

```javascrypt
FOR 80 times DO
    hiển thị '*'
END_FOR
```

 Mã lệnh là:

```javascrypt
    MOV CX,80   ;số các dấu sao được hiển thị
    MOV AH,2    ;hàm hiển thị ký tự
    MOV DL,'*'  ;ký tự hiển thị
TOP:
    INT 21h     ;hiển thị một dấu sao
    LOOP TOP    ;lặp lại 80 lần
```

 - Bạn hãy lưu ý rằng vòng lặp **FOR** thực hiện bởi lệnh **LOOP** sẽ được thự hiện ít nhất một lần. Thực ra nếu **CX** bằng 0 khi vào vòng lặp, lệnh **LOOP** giảim **CX** thành 0FFFFh và lệnh **LOOP** sẽ được thực hiện 0FFFFh = 65535 lần nữa. Để khắc phục điều này, lệnh **JCXZ** (`jump if CX is zero`) được đặt trước vòng lặp. Cú pháp của nó là:

    `JCXZ nhãn_đích`

 - Nếu CX bằng 0, điều khiển sẽ được chuyển đến nhãn đích. Như vậy vòng lặp sẽ bị bỏ qua nếu CX bằng 0:

```javascrypt
    JCXZ SKIP
TOP:
    ;thân vòng lặp
    LOOP TOP
SKIP:
```

##### 5.2. Vòng lặp WHILE <a name="5.2"></a>

 - Đây là vòng lặp phụ thuộc vào một điều kiện. Dạng mã lệnh giả:

```javascrypt
WHILE điều_kiện DO
    Các dòng lệnh
END_WHILE
```
Xem hình 6.6

![6.6](http://i.imgur.com/zFl07xC.png)

 - **Điều_kiện** được kiểm tra ở đầu vòng lặp. Nếu nó đúng thì các dòng lệnh sẽ được thi hành. Ngược lại nếu **điều_kiện sai**, chương trình sẽ tiếp tục thực hiện lệnh ở sau vòng lặp. Rất có thể ngay sau khi khửoi đầu **điều_kiện** đã không thỏa mãn. Trong trường hợp này thân vòng lặp sẽ không được thực hiện lần nào. Vòng lặp tiếp tục được thực hiện khi điều kiện còn đúng.

 - **Ví dụ 6.9:** Viết các lệnh để đếm số ký tự trong một dòng
    **Lời giải:**

```javascrypt
khởi tạo bộ đếm băng 0, đọc 1 ký tự
WHILE ký tự <> ký tự về đầu dòng DO
    đếm = đếm + 1
    đọc một ký tự
END_WHILE
```
    Các lệnh là:

```javascrypt
    MOV DX,0    ;DX đếm số ký tự
    MOV AH, 1   ;chuẩn bị đọc
    INT 21h     ;ký tự trong AL
WHILE_:
    CMP AL,0dh      ;CR?
    JE END_WHILE    ;đúng, thoát ra
    INC DX          ;không phải cr, tăng bộ đếm
    INT 21h         ;đọc một lý tự
    JMP WHILE_      ;lặp lại
END_WHILE:
```
 - Lưu ý là do vòng lặp **WHILE** kiểm tra điều kiện kết thúc ở đầu vòng lặp nên bạn cần chắc chắn rằng bất cứ biến nào liên quan đến điều kiện vòng lặp đều phải đực khởi tạo trước khi vào vòng lặp.Vì vậy bạn phải đọc một ký tự trước khi vào vòng lặp rồi lại phải đọc ký tự khác ở cuối nó. Ta dùng nhãn **WHILE_ **vì **WHILE** là từ dành riêng.

##### 5.3. Vòng lặp REPEAT <a name="5.3"></a>

 - Có một vòng lặp có điều kiện khác đó là vòng lặp **REPEAT**. Dạng mã lệnh giải của nó là:

````javascrypt
REPEAT
    các dòng lệnh
UNTIL điều_kiện
```
**Xem hình 6.7**
![6.7](http://i.imgur.com/7l3C5J5.png)



 - Trong một vòng lặp **REPEAT**...**UNTIL**, các dòng lệnh được thi hành sau đó mới kiểm tra điều kiện. Nếu **điều_kiện** đúng, vòng lặp kết thúc, nếu nó sai điều khiển rẽ nhánh đến đầu vòng lặp.

 - **Ví dụ:** Viết các lệnh đọc vào các ký tự, kết thúc khi gặp một ký tự trắng:

  **Lời giải**

```javascrypt
REPEAT
    đọc một ký tự
Until ký_tự_trắng
```

    Các lệnh là:
```javascrypt
    MOV AH,1        ;chuẩn bị đọc
REPEAT:
    INT 21h         ;ký tự trắng trong AL
;intil
    CMP al,' '      ; ký tự trắng ?
    JNE REPEAT      ;không, đọc tiếp
```


##### 5.4. So sánh WHILE và REPEAT <a name="5.4"></a>

 - Trong nhiều trường hợp khi cần một vòng lặp có điều kiện, sử dụng vòng lặp **WHILE** và **REPEAT** là tuỳ ý thích mỗi người. Ưu điểm của vòng lặp **WHILE** là vòng lặp có thể được bỏ qua khi điều kiện kết thúc khởi tạo với giá trị **logic sai**, trong khi đó các lệnh trong vòng lặp **REPEAT** luôn được tực hiện ít nhất một lần. Tuy nhiên các lệnh cho một vòng lặp **REPEAT** có vẻ ngắn hơn đôi chút bởi lẽ nó chỉ có một lệnh nhảy có điều kiện ở cuối trong khi vòn lặp **WHILE** có những hai: một lệnh nhảy có điều kiện ở đầu và lệnh **JMP** ở cuối.

-------------------------------------------------------------------------------------------------------------------------------------------------
END