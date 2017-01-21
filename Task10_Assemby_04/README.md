#Báo cáo Task 10_4

# Lập Trình hợp ngữ (Assembly)(tiếp theo)

	Tài liệu tham khảo : internet

	Thực hiện:  Nguyễn Văn Thành

	Cập nhật lần cuối: 21/01/2017

###Mục Lục

#CÁC LỆNH LOGIC,DỊCH VÀ QUAY

[1. Tổng quan](#1)

[2. Các lệnh lôgic](#2)

 - [2.1. Các lệnh AND,OR và XOR](#2.1)

 - [2.2. Lệnh NOT ](#2.2)

 - [2.3. Lệnh TEST](#2.3)

[3. Các lệnh dịch](#3)

 - [3.1. Các lệnh dịch trái](#3.1)

 - [3.2. Các lệnh dịch phải](#3.2)

[4. Các lệnh quay](#4)

 - [4.1. Lệnh quay trái](#4.1)

 - [4.2. Lệnh quay phải](#4.2)

 - [4.3. Lệnh quay trái qua cờ nhớ](#2.3)

 - [4.4. Lệnh quay phải qua cờ nhớ](#4.4)

 - [4.5. Một ứng dụng: Đảo các mẫu bit](#4.5)

[5. Vào ra với các số nhị phân và số hex](#5)

 - [5.1. Nhập các số nhị phân](#5.1)

 - [5.2. Nhập các số hex](#5.2)

 - [5.3. Đưa ra số hex](#5.3)


#### 1. Tổng quan<a name ="1"></a>

 - Ở phần này chúng ta sẽ nghiên cứu về các chỉ thị dùng để thay đổi đến từng bit trong byte hay word. Khả năng thao tác với các bit.

 - Chúng ta sẽ nghiên cứu về các lệnh logic **AND**, **OR**,**XOR** và **NOT**. Các lệnh này có thể sử dụng để xóa, thiết lập và kiểm tra từng bit trong các thanh ghi hay các biến. Chúng ta sẽ sử dụng các lệnh này để thực hiện một số công việc quen thuuoj như đổi chữ thường thành chứ hoa hay còn mới như xác định xem một thanh ghi chứ số chẵn hay lẽ.

 - Các lệnh biên dịch, các bit có thể được dịch phải hoặc dich trái trong các thanh ghi hay trong một ô nhớ. Khi một bit bị dịch ra khỏi thanh ghi nó sẽ được chứ trong cờ CF. Vì dịch trái cũng có nghĩa là nhân đôi số và dịch phải có nghĩa là chia đôi nó, lệnh này cho phép chúng ta thcuwj hiện phép nhân và chia cho một lũy thừa của 2.

 - Các lệnh quay: Các lệnh này làm việc giống như các lệnh dịch ngoại trừ một điều là khi một bit bị ra khỏi một phía của toán hạng nó sẽ được đưa trở về phía kia của toán hạng đó. Các lệnh này có thể được sử dụng trong các TH về phía kia cảu tán hạng đó. Các lệnh này có thể được sử dụng trong các TH chúng ta muốn kiểm tra hoặc thay đổi các bit hay nhóm các bit.

 - Sử dụng các lệnh loogic, dịch và lệnh quay để thực hiện các thao tác vào ra với số nhị phân và số hex. Khả năng đọc và viết các số cho phép chúng ta giải quyết rất nhiều vấn đề khác nhau.


#### 2. Các lệnh lôgic <a name="2"></a>

 - Thay đổi từng bit trong máy tính bằng các lệnh lôgic. Các giá trị nhị phân 0 và 1 được xem như là các giá trị lôgic **TRUE** và **FALSE** một các tương ứng. 

 - Khi lệnh lôgic được áp dụng với các toán hạng 8 và 16 bit kết quả nhận được bằng cách áp dụng chúng với từng bit một.


 VD: 
```javascrypt
 1. 10101010 AND 11110000

		10101010
AND		11110000
	=	10100000


 2. 10101010 OR 11110000

 		10101010
OR  	11110000
	=	11111010

 3. 10101010 XOR 11110000

 		10101010
 XOR	11110000
 	=	01011010

 4. NOT 10101010

 		10101010
 NOT 	01010101

```

##### 2.1. Các lệnh AND,OR và XOR<a name="2.1"></a>
	
 - Các lệnh **AND**, **OR** và **XOR** thực hiện các thao tác logic như tên gọi của chúng. Cú pháp như sau:
  - AND: Đích, Nguồn
  - OR:	 Đích, Nguồn
  - XOR: Đích, Nguồn

 -  Kết quả các thao tác được chứa trong toán hạng đích, nó phải là một thanh ghi hay một ô nhớ. Toán hạng nguồn có thể là hằng số, thanh ghi hay ô nhớ, tuy nhiên các thao tác giữa 2 ô nhớ là không hợp lệ.

###### Ảnh hưởng tới cờ: 

```javascrypt
	SF,ZF,PF phản ánh kết quả của lệnh
	AF không xác định
	CF, OF = 0
```
 - Khi sử dụng các lệnh **AND**, **OR**, **XOR** chúng ta có thể thay đổi một các có chọn lọc các bit của toán hạng đích. Để làm điều đó chúng ta tạo lên một mẫu bit mặt nạ (gọi là MASK). Các bit của mặt nạ được chọn để sao cho các bit tương ứng của toán hạng đích được thay đổi đúng như chúng ta mong muốn khi lệnh logic được thực hiên.
 - Để chọn các bit mặt nạ chúng ta sử dụng các tính chất sau đây của các lệnh **AND**, **OR** và **XOR**.

 - Từ đó chúng ta rút ra kết luận sau:

```javascrypt 

  1. Lệnh AND có thể sử dụng để xóa các bit nhất định của toán hạng đích trong khi giữ nguyên những bit còn lại. Bit 0 của mặt nạ xóa bit tương ứng, còn bit 1 của mặt nạ giữ nguyên bit tương ứng của toán hạng đích.
  
  2. Lệnh OR có thể dùng để thiết lập các bit xác định của toán hạng đích trong khi vẫn giữ nguyên những bit còn lại. Bit 1 của mặt nạ sẽ thiết lập bit tương ứng trong khi bit 0 của nó sẽ giữ nguyên bit tương ứng của toán hạng đích.
  
  3. Lệnh XOR có thể dùng để đảo các bit xác định của toán hạng đích trong khi vẫn giữ nguyên những bit còn lại. Bit 1 của mặt nạ làm đảo bit tương ứng còn bit 0 vẫn giữ nguyên bit tương ứng của toán hạng đích.
```
 
 **Ví dụ 1** : Xóa bit dấu của AL trong khi giữ nguyên các bit còn lại. 

 **Trả lời :**

    Sử dụng lệnh AND với 0111111b = 7Fh làm mặt nạ : AND AL, 7Fh.

Ví dụ 2: thiết lập các bit trọng lượng cao nhất cà thấp nhất của AL trong khi giữ nguyên các bit còn lại. 

**Trả lời :**

    Sử dụng câu lệnh OR với 10000001b =81h làm mặt nạ : OR AL,81h

Ví dụ 3: Thay đổi bit dấu của DX 

**Trả lời :**

    Sử dụng mặt nạ 8000h với lênh XOR chúng ta có XOR DX,8000h

**Chú ý:** Để tránh nhầm lẫn khi viết, tốt nhất các bạn nên biểu diễn mặt nạ dưới dạng số hex thay vì dưới dạng số nhị phân đặc biệt là khi sử dụng mặt nạ 16 bit

**Các lệnh logic đặc biệt có ích khi thực hiện các công việc dưới đây:**

######Đỗi mã ASCII của một số thành số tương ứng.

 - Chúng ta đã thấy rằng khi một chương trình đọc một ký tự từ bàn phím. AL sẽ chứa mã ASCII của ký tự đó. Điều đó cũng đúng với các ký tự biễu diễn số. Chẳng hạn khi phím "5" được ấn, AL sẽ chứa 35h thay vì 5. Để nhận được 5 trong thành ghi AL có thể làm như sau:

	`SUB AL,30h`

 - Một phương pháp khác là sử dụng lệnh **AND** để xóa nửa byte cao của AL:

   	`AND AL,0Fh`

 - Vì mã ASCII của các chữ số từ "0" đến "9" là từ 30h đến 39h. Phương pháp này có thể dùng để đổi mã ASCII của bất kỳ chữ số nào thành giá trị thập phân tương ứng.
 
 - Bằng cách sử dụng lệnh **AND** thay cho lệnh **SUB** chúng ta nhấn mạnh rằng chúng đang thay đổi những mẫu bit của AL, nhờ đó chương trình trở nên dễ đọc hơn.

######Đổi chữ thường thành chữ hoa

 - Mã ASCII của các chữ thường từ "a" đến "z" nằm từ 61h đến 7Ah . Mã ASCII của các chữ hoa từ "A" đến "Z" nằm từ 41h đến 5Ah. bởi vậy chẳng hạn nếu DL chứa mã ASCII cả một chữ thường chúng ta có thể đổi ra chữ hoa bằng cách thực hiện lệnh:

	`SUB DL,20h`

 - Phương pháp này được sử dụng trong chương 4, tuy nhiên nếu chúng ta so sánh mã ASCII dạng nhị phân của các chữ thường và chữ hoa tương ứng sẽ thấy rằng:

| Ký tự | Mã ASCII | Ký Tự | Mã ASCII |
|-------|----------|-------|----------|
|   a   |  0110001 |   A   |  0100001 |
|   b   |  0110010 |   B   |  0100010 |
|   .   |     .    |   .   |    .     |
|   .   |     .    |   .   |    .     |
|   .   |     .    |   .   |    .     |
|   z   | 01111010 |   Z   | 01011010 |


 - Rõ ràng là để đổi chữ thường thành chữ hoa chúng ta chỉ cần xóa bit 6. Điều này có thể thực hiện bằng cách dùng lệnh **AND** với mặt nạ 11011111b hay 0DFh. Do đó nếu một chữ thường chứa trong DL thì ta có thể đổi nó thành chữ in như sau: 
 	`AND DL,0DFh`

![1](http://i.imgur.com/Zfdq68Z.gif)

######Xóa một thanh ghi
 - Chúng ta đã biết 2 cách để xóa một thanh ghi chẳng hạn để xóa thanh ghi **AX** ta làm như sau:

	`MOV AX,0`

hay

	`SUB AX,AX`

 - Bằng cách sử dụng một tính chất là 1 XOR 1 = 0 và 0 XOR 0 = 0 chúng ta có một phương pháp thứ 3 như sau:

	`XOR AX,AX`

 - Mã máy cho lệnh đầu tiên là 3 byte so với 2 bute của mỗi lệnh sau như vậy các lệnh sau hiệu quả hơn. tuy nhiên các thao tác giữa ô nhớ là không hợp lệ nên khi cần xóa một ô nhớ thì chúng ra bắt buộc phải sử dụng lệnh thứ nhất.

**Kiểm tra xem một thanh ghi có bằng 0 hay không **

 - Vì 0 OR 1 = 1 và 0 OR 0 = 0 có vẽ như chúng ta sẽ phí thời gian nếu thự hiện lệnh sau:

    `OR CX,CX`

 - Bởi vì chúng không làm thay đổi nội dung của **CX** tuy nhiên chúng lại tác động đến cờ **CF** và **SF** do đó trong trường hợp đặc biệt khi **CX** chứa 0 thì **ZF** = 1 và vì vậy nó có thể được dùng thay thế cho lệnh :

	`CMP CX,0`

 - Để kiểm tra xem nội dung của một thanh ghi có bằng 0 hay không hoặc để kiểm tra dấu của số chứa trong thanh ghi.



##### 2.2. Lệnh NOT <a name="2.2"></a>


2.2 lệnh NOT

 - Lệnh NOT dùng để lấy bù 1 của một toán hạng đích, cú pháp như sau:

	`NOT toán hạng đích`

 - Lệnh này không làm ảnh hưởng tới các cờ. 
 **Ví dụ :** 
 Trả lời :
    Dùng lệnh NOT :

	`NOT AX`

##### 2.3. Lệnh TEST<a name="2.3"></a>

 - Lệnh TEST thực hiện các thao tác và logic giữa toán hạng đích với toán hạng nguồn nhưng không làm thay đổi toán hạng đích. mục tiêu của lệnh **TEST** là thiết lập cờ. Cú pháp:

	`TEST toán hạng đích,toán hạng nguồn`

 - Các cờ bị tác động:
    SF,ZF,PF phản ánh kết quả
    AF không xác định
    CF,OF = 0

######Kiểm tra các bit

 - Lệnh TEST có thể sử dụng để kiểm tra các bit riêng biệt trong một toán hạng. Mặt nạ có giá trị 1 ở các bit tương ứng với các bit cần kiểm tra trong toán hạng đích và giá trị 0 ở các bit khác. Vì 1 AND b = b và 0 AND b = 0 kết quả của lệnh:

	`TEST toán hạng đích,mặt nạ`

 - Sẽ có giá trị 1 ở các bit đã chọn khi và chỉ khi toán hạng đích cũng có giá trị 1 ở các vị trí đó, còn lại các bit khác có giá trị 0. Nếu toán hạng đích có giá trị 0 ở tất cả các bit được kiểm tra thì kết quả sẽ bằng 0 và cờ **ZF** được thiết lập 1.

**Ví dụ :** Viết đoạn lệnh thực hiện lệnh nhảy đến nhãn BELOW nếu AL chứa số chẵn. 
Trả lời :

 - Vì các số chẵn có bit 0 bằng 0 nên mặt nạ là 00000001b = 1. chúng ta có:
```javascrypt
 BELOW:
 TEST   AL,1    ;AL chứ số chẵn?
 JZ     BELOW   ; đúng! nhảy đến BELOW
```
![2](http://i.imgur.com/KM2iRrk.gif)

#### 3. Các lệnh dịch<a name="3"></a>

 - Các lệnh dịch và quay dịch các bit trong toán hạng đích sang trái hoặc một số vị trí. Đối với lệnh dịch các bit bị dịch ra khỏi toán hạng sẽ bị mất, còn với lệnh quay các bit dịch ra khỏi một phía của toán hạng đích sẽ được đưa trở lại phía kia. Các lệnh này có 2 dạng sau:

 - Khi muốn dịch hoặc quay 1 vị trí chúng ta có:

 `Mã Lệnh 		toán hạng đích,1`

 - Khi muốn dịch hoặc quay N vị trí chúng ta có:

 `Max Lệnh 		toán hạng đích,CL`

 - Trong đó CL chứa N. Trong cả 2 trường hợp toán hạng đích là một thanh ghi 8 hoặc 16 bit hay là một ô nhớ. Chú ý rằng trong các bộ bi xử lý tiên tiến của INTEL, các lệnh quay hoặc dịch cho phép sử dụng các hằng số 8 bit. Như chúng ta sẽ thấy ngay sau đây các lệnh này có thể dùng để nhân hoặc chia cho lũy thừa của 2, và chúng ta sẽ sử dụng chúng trong các chương trình vào ra với số nhị phân và số hex.


##### 3.1. Các lệnh dịch trái<a name="3.1">

#####Lệnh SHL

 - Lệnh SHL (shift left) dịch các bit của toán hạng đích sang bên trái, cú pháp cho lệnh dịch một vị trí như sau: 

 	`SHL toán hạng đích,1`
 
 - Một giá trị 0 sẽ được đưa vào vị trí bên phải nhất của toán hạng đích , còn bít **msb** của nó sẽ được đưa vào cờ CF.

 ![3](http://i.imgur.com/YUBic2Q.png)
    
 - Nếu số đếm vị trí dịch N khác 1 thì lện có dạng như sau:

	`SHL toán hạng đích,CL`

 - Trong đó CL chứ N. trong trường hợp này N phép dịch trái đơn được thực hiện. giá trị CL vẫn giữ nguyên không thay đổi khi lệnh thực hiện xong.
   - Các cờ bị tác động:
   - SF,PF,ZF phản ánh kết quả
   - AF không xác định
   - CF chứ bit cuối cùng được dịch ra khỏi toán hạng
   - OF bằng 1 nếu kết quả bị thay đổi dấu trọng phép dịch cuối cùng.

**Ví dụ:** 

 - Giả sử DH chứ 8Ah và CL chứa 3, cho biết giá trị của Dh và CF sau khi lệnh: `SHL DH,CL` được thực hiện

**Trả lời:**

 - Giá trị nhị phân trong **DH** là **10001010**. Sau 3 lần dịch **CF** sẽ chứa giá trị 0 còn nội dung của **DH** có thể nhận được bằng cách xóa đi 3 bit bên trái nhất của **DH** và thêm 3 bit 0 vào bên phải của nó. Bởi vậy chúng ta nhận được kết quả: **01010000b = 50h**.

```javascrypt
	MOV		DH,8Ah  ; DH = 10001010b
	MOV 	CF,3
	SHL		DH,CL 	
	; 3 bit trái nhất bị xóa đi : xxx01010. Thêm 3 bit 0 vào phải nhất 01010000.
```

######Thực hiện phép nhân bằng cách dịch trái

 - Giả sử có số thập phân 235, nếu mỗi chữ số của nó được dịch sang bên trái một vị trí và thêm vào bên phải chữ số 0 thì ta nhận được 2350 có nghĩa là bằng 235 nhân 10.
 
 - Tương tự như vậy việc dịch trái một số nhị phân cũng nhân nó với 2. Ví dụ AL chứa 5 = 00000101b. Sau khi dịch trái một bit chúng ta có 00001010b = 10d nghĩa là bằng 2 nhân 5 . Tiếp tục dịch trái chúng ta nhận được 00010100b = 20d nghĩa là lại nhân đôi nó 1 lần nữa.

######Lệnh SAL

 - Như vậy lệnh **SHL** có thể dùng để nhân một toán hạng với lũy thừa của 2 tuy nhiên để làm nổi bật bản chất số học của thao tác, lệnh **SAL** (shift arithmetic left) thường được sử dụng để thay cho việc nhân các số. Cả 2 lệnh đều tạo ra cùng một mã máy.

 - Các số âm cũng có thể được nhân 2 bằng cách dịch trái. Ví dụ: nếu AX chứa FFFFh(-1) chúng ta dịch trái nó 3 bit thì sẽ nhận được AX = FFF8h (-8).

**Sự tràn**

 - Khi chúng ta sử dụng lệnh dịch trái để làm phép nhân hiện tượng tràn có thể xảy ra. Với lệnh dịch trái một bit **CF** và **OF** tương ứng chỉ ra một cách chính xác sự tràn không dấu và có dấu. Tuy nhiên cờ tràn không còn đáng tin cậy trong lệnh dịch trái nhiều bit. Sỡ dĩ như vậy vì lệnh dịch nhiều bit thực ra là nhiều lệnh dịch 1 bit, và cờ **CF**, **OF** chỉ phản ánh kết quả của sự dịch cuối cùng . Ví dụ khi BL chứ 80h,CL chứ 2 và chúng ta thực hiện SHL BL,CL thì CF = OF = 0 mặc dù cả 2 hiện tượng tràn có dấu và không dấu đều xảy ra.

**Ví dụ :** Viết một đoạn lệnh thực hiện phép nhân AX với 8, giả sử hiện tượng tràn không xảy ra. 

**Trả lời :**

 - Để thực hiện phép nhân 8 chúng ta cần thực hiện 3 lần dịch trái:

```javascrypt
MOV     CL,3    ;số lần dịch
SHL     AX,CL   ; nhân AX với 8
```




##### 3.2. Các lệnh dịch phải<a name="3.2">

######Lệnh SHR

 - Lệnh SHR (shift right) dịch các bit của toán hạng đích sang bên phải cú pháp cho câu lệnh dịch một vị trí như sau:

	`SHR     toán hạng đích,1`

 - Một giá trị 0 sẽ được đưa vào bit MSB của toán hạng đích, còn bên phải nhất của nó (LSB) sẽ được đưa vào cờ CF.

![4](http://i.imgur.com/dyNL8ly.png)
 
 - Nếu số đếm vị trí dịch N khác 1 thì lệnh có dạng sau:

	`SHR     toán hạng đích,CL`

 - Trong đó CL chứ N. Trong trường hợp này N phép dịch phải đơn được thực hiện. Giá trị của CL vẫn giữ nguyên không đổi khi lệnh thực hiện xong .
 
 - Các cờ bị tác động cũng giống như trong trường hợp dịch trái.

**Ví dụ:** Giả sử DH chứa 8Ah và CL chứa 2 , cho biết giá trị của DH và CF sau lệnh SHL DH,CL được thực hiện.

**Trả lời:**

	Giá trị nhị phân trong DH là 10001010. Sau 2 lần dịch CF sẽ chứa giá trị 1 còn nội dung của DH có thể nhận được bằng cách xóa đi 2 bit bên trái nhất của DH và thêm 2 bit 0 vào bên phải nó. bởi cậy chúng ta nhận được kết quả 00100010b = 22h.

###### Lệnh SAR

 - Lệnh **SAR** (shift arimethic right) làm việc gần giống lệnh **SHR** với một điểm khác biệt là bit msb của toán hạng đích giữ nguyên giá trị ban đầu của nó. Cú pháp như sau:

    `SAR    toán hạng đích,1`
Và
    `SAR    toán hạng đích,CL`

 - Các cờ bị tác động giống như lệnh SHR

![5](http://i.imgur.com/YXwKAN0.png)


###### Thực hiện phép chia bằng phép dịch phải

 - Vì việc dịch trái nhân đôi giá trị của toán hạng đích cho nên cũng có lý do khi đoán rằng dịch phải sẽ chia đôi nó. Điều đó đúng cho các số chẵn, đối với số lẽ , dịch phải sẽ chia đôi nó và làm tròn xuống số nguyên gần nhất. Ví dụ nếu BL chứa 00000101b= 5 thì sau khi dịch phải BL sẽ chứa 00000010b= 2. Phép chia không dấu và có dấu.


######Phép chia không dấu và có dấu

 - Trong phép chia bằng cách dịch phải chúng ta phải phân biệt 2 trường hợp đối với các số không dấu và có dấu. Nếu đang làm việc với các số không dấu chúng ta phải sử dụng lệnh **SAR** vì lệnh này giữ nguyên dấu.

**Ví dụ 1:** Sử dụng các phép dịch phải để thực hiện phép chia số không dấu 65143 cho 4, thương số chứa trong **AX**.

**Trả lời :**

 - Để chia cho 4 chúng ta cần dịch phải 2 lần, do số bị chia là số không dấu chúng ta sử dụng lệnh SHR. đoạn lệnh như sau:

```javascrypt
	 MOV    AX,65143    ;AX chứa số bị chia
	 MOV    CL,2        ;CX chứa số lần dịch phải 
	 SHR    AX,CL       ;chia cho 4
```

**Ví dụ 2:** Giả sử AL chứa -15, hãy cho biết giá trị thập phân của Al sau khi thực hiện lệnh `SAR AL,1`. 

**Trả lời :**

 - Lệnh **SAR** chia số cho 2 và làm tròn xuống. Chia -15 cho 2 chúng ta nhận được -7,2 sau khi làm tròn chúng ta nhận được -8. dưới dạng số nhị phân chúng ta có -15 = 11110001b. sau khi dịch phải chúng ta có 11111000b =-8.

######Các phép nhân và chia tổng quát hơn

 - Chúng ta đã thấy rằng việc nhân và chia cho lũy thừa của 2 có thể thực hiện bằng các lệnh dịch trái và phải. Để nhân với một số bất kỳ như 10d chúng ta có thể kết hợp các lệnh dịch và cộng.

####4. Các lệnh quay<a name="4"></a>
##### 4.1. Lệnh quay trái<a name="4.1"></a>

 - Lệnh **ROL** (rotate left) dịch các bit sang bên trái. Bit msb được dịch vào bit bên phải nhất đồng thời được đưa vào cờ CF. các bạn có thể tưởng tượng các bit của toán hạng đích tạo thành một vòng trong với bit lsb. Cú pháp:

```javascrypt
	ROL     toán hạng đích,1
Và 
	ROL     toán hạng đích, CL
```

![6](http://i.imgur.com/RIn1mT7.png)


##### 4.2. Lệnh quay phải<a name="4.2"></a>

 -  Lệnh **ROR**( rotate right) làm việc giống như lệnh **ROL** trừ một điểm khác biệt là các bit được dịch sang phải, bit bên phải nhất được dịch vào bit msb đồng thời cũng được đưa vào cờ CF. Cú pháp của lệnh:

```javascrypt
	ROR     toán hạng đích,1
Và 
	ROR     toán hạng đích, CL
```

![7](http://i.imgur.com/z3FKqRj.png)

**Ví dụ:** Sử dụng lệnh **ROL** để đếm số bit 1 trong thanh **BX** mà không làm thay đổi nội dung của nó, kết quả trong **AX**.

**Lời giải:**
```javascrypt
    XOR     AX,AX       ;AX đếm số bit
    MOV     CX,16       ;Biến đếm vòng lặp
TOP:
    ROL     BX,1        ;CF chứa bit bị đưa ra
    JNC     NEXT        ;bit 0?
    INC     AX          ;không phải !, tăng số bit  1
NEXT:   
    LOOP    TOP:        ;lặp lại cho đến khi làm xong

```
 - Trong ví dụ trên đây, chúng ta đã sử dụng lệnh JNC(jump if no carry), lệnh này thực hện nhảy nếu CF = 0. Chúng ta sẽ sử dụng để đưa ra nội dung của một thanh ghi dưới dạng nhị phân.

##### 4.3. Lệnh quay trái qua cờ nhớ<a name="4.3"></a>

 - Lệnh **RCL** (rotate carry left) dịch các bit của toán hạng đích sang trái. Bit msb được đặt vào cờ CF, giá trị cũ của CF được đưa vào bit phải nhất của toán hạng đích. Nói cách khác **RCL** làm việc giống như **ROl** ngoại trừ một điều là cờ CF cũng là một phần của vòng tròn tạo lên bởi các bit đang được quay. Cú pháp:

```javascrypt
    RCL     toán hạng đích, 1 
Hay
    RCL     toán hạng đích,,CL
```
![8](http://i.imgur.com/VQzAG66.png)

##### 4.4. Lệnh quay phải qua cờ nhớ<a name="4.4"></a>
 
 - Lệnh **RCR** (rotate carry right) hoạt động giống như lệnh **RCL** nhưng các bit được quay sang phải, cú pháp của lệnh như sau:

```javascrypt
    RCR     toán hạng đích,1
Hay
    RCR     toán hạng đích,CL
```

 - Hình ảnh minh họa cho lệnh RCR:

![9](http://i.imgur.com/JMwvavj.png)

**Ví dụ:**  Giả sử DH chứa 8Ah, CF =1 , và CL bằng 3. cho biết nội dung của DH và CF khi thực hiện lệnh RCR DH,CL?

**Trả lời :**

|                 | CF |    DH    |
|-----------------|----|----------|     
| Các giá trị đầu | 1  | 10001010 |
| Sau 1 lần dịch  | 0  | 11000101 | 
| Sau 2 lần dich  | 1  | 01100010 |
| Sau 3 lần dịch  | 0  | 10110001 |

 - Như vậy sau khi thực hiện lệnh DH chứ 10110001b = B1h

 - Tác động của các lệnh quay đến cờ
  - SF, PF, ZF phán ánh kết quả
  - AF không xác định
  - CF = bit cuối cùng bị dịch ra khỏi toán hạng
  - OF = 1 nếu kết quả đổi dấu trong lần quay cuối


##### 4.5. Một ứng dụng: Đảo các mẫu bit<a name="4.5"></a>


 - Chúng ta hãy xem xét vẫn đề đảo các mẫu bit trong một byte hoặc một word để làm một ví dụ về ứng dụng của các lệnh quay và dịch. Chẳng hạn **AL** chứa 11011100 chúng ta muốn đổi thành 00111011. Một phương pháp đơn giản là sử dụng lệnh SHL để dịch các bit ra khỏi đầu bên trái của AL rồi dùng lệnh RCR để đưa nó vào đầu bên trái của một thanh ghi khác như BL chẳng hạn sau khi lặp lại công việc đó 8 lần BL sẽ chứa các mẫu bit đã đảo ngược của AL và có thể chép lại nội dung của nó vào AL đoạn lệnh như sau:

```javascrypt
		MOV     CX,8        ;lấy số lần thực hiện
REVERSE:        
		SHL     AL,1        ;lấy bit vào CF
		RCR     BL,1        ;quay để đưa nó vào BL
		LOOP    REVERSE     ;lặp cho đến khi DO xong
		MOV     AL,BL       ;AL chứa mẫu bit đảo ngược
```

#### 5. Vào ra với các số nhị phân và số hex<a name="5"></a>
 
 - Một ứng dụng khá tiện lợi của các lệnh quay và dịch là thực hiện các thao tác vào/ra với các số nhị phân và số hex.

##### 5.1. Nhập các số nhị phân<a name="5.1"></a>
 
 - Để nhập các số nhị phân chúng ta giả thiết rằng chuong trình đọc vào các số nhị ohaan từ bàn phím kết thúc bằng phím ENTER. Các số thực sự ở dạng chuỗi các chữ số 0 và 1, Khi mỗi ký tự được nhập chúng ta phải đổi chúng ra giá trị của từng bit rồi kết hợp các bit vào trong thanh ghi. Thuật toán sau thực hiện việc đọc một số nhị phân từ bàn phím sau đó lưu nó vào thanh ghi BX.

#####CODE
```javascrypt
	XOR	BX,BX; xóa BX
	MOV	AH,1;Hàm con đọc ký tự từ bàn phím
	INT 21H;Đọc ký tự 
WHILE_:
	CMP	AL,0DH;CR?
	JE	END_WHILE;đúng !, kết thúc
	AND	AL,0FH;Không  ! đổi ra giá trị nhị phân
	SHL	BX,1 ;Giành chổ cho giá trị mới
	OR  BL,Al; chèn giá trị mới vào BX
	INT 21H;Đọc tiếp ký tự
	JMP WHILE_;Lặp lại
END_WHILE:

```



##### 5.2. Nhập các số hex<a name="5.2"></a>

 - Việc nhập các số hex bao gồm chữ số từu "0" đến "9" và các chữ cái từ "A" đến "F" kết thúc bằng ký tự CR. Để đơn giản chúng ta giả thiết:

 - Chỉ sử dụng ký tự hoa

 - Người dử dụng chỉ đưa tối đa 4 chứ số hex.

 - Quá trình đổi các ký tự thành giá trị nhị phân phức tạp hơn so với trường hợp nhập số nhị phân, ngoài ra BX phải được dịch 4 lần để giành chổ cho một giá trị hex.

 - Biểu diễn việc nhập 6ABh

```javascrypt
	XOR BX,BX	; Xóa BX
	MOV CL,4	; Bộ đếm 4 lần dịch
	MOV AH,1	; Hàm con nhập ký tự từ bàn phím
	INT 21H		; Nhập một ký tự
WHILE_:
	CMP AL,0DH 	; CR?
	JE	END_WHILE; Đúng !, kết thúc
; Đổi ký tự ra giá trị nhị phân
	CMP AL,39H ;Đó là chữ ?
	JG	LETTER	;Không phải !, đó là một chữ cái
; Nhập một số
	AND AL,0FH ;Đổi chữ số ra giá trị nhị phân
	JMP SHIFT ; Đem chèn vào BX
LETTER:
	SUB AL,37H
SHIFT:
	SHL	BX,CL ;Giành chỗ cho giá trị mới
	;Đưa giá trị vào BX
	OR BL,Al ;Chèn giá trị mới vào 4 bit thấp của BX
	INT 21H
	JMP WHILE_ ; Lặp lại cho đến khi phím ENTER được ấn
END_WHILE:

```


##### 5.3. Đưa ra số hex<a name="5.3"></a>

 Biểu diễn việc dưa ra số 4CA9h trong BX

 BX=4CA9h= 0100 1100 1010 1001

```javascrypt
 Chuyển BH vào BL
 	DL= 0100 1100
 Dịch phải DL 4 lần 
 	DL= 0000 0100
 Đổi thành ký tự và đưa ra
 	DL= 0011 0100 = 34h = '4'
 Quay BX 4 lần về bên trái
 	BX = 1100 1010 1001 0101
 Chuyển BH vào DL
 	DL = 1100 1010
 Dịch phải DL 4 lần
 	DL = 0000 1100
 Đổi thành ký tự và đưa ra
 	DL = 0100 0011 = 43h = 'C'
 Quay BX 4 lần về bên trái 
 	BX = 10101001 0100 1100
 Chuyển BH vào DL
 	DL = 1010 1001
 Dịch phải DL 4 lần
 	DL = 0000 1010
 Đổi thành ký tự và đưa ra
 	DL = 0100 0010 = 42h ='B'
 Quay BX 4 lần về phía bên trái
 	BX = 1001 0100 1100 1010
 Chuyển BH vào DL
 	DL = 0011 1001 = 39h = '9'
 Quay BX 4 lần về bên trái
 	BX = 0100 1100 1010 1001 = Giá trị ban đầu.
```
------------------------------------------------------------------
END

