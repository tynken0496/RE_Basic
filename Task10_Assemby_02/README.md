#Báo cáo Task 10_2

#Lập Trình Hợp Ngữ(Assembly)

	Tài liệu tham khảo : internet

	Thực hiện:  Nguyễn Văn Thành

	Cập nhật lần cuối: 

###Mục Lục
[1. Các thanh ghi con trỏ và chỉ số](#1)

 - [1.1. Thanh ghi SP](#1.1) 

 - [1.2. Thanh ghi BP](#1.2) 

 - [1.3. Thanh ghi IP](#1.3) 

 - [1.4. Thanh ghi chỉ số SI và DI](#1.4) 

[2. Các thanh ghi dữ liệu công dụng chung (AX, BX, CX, DX)](#2)

[3. Các thanh ghi đoạn](#3)

[4. Thanh ghi cờ](#4)
 
 - [4.1. Các cờ trạng thái](#4.1)

 - [4.2. Cờ nhớ - CF](#4.2)

 - [4.3. Cờ chẵn lẻ - PF](#4.3)

 - [4.4. Cờ nhớ phụ - AF](#4.4)

 - [4.5. Cờ Zero - ZF](#4.5)

 - [4.6. Cờ dấu - SF](#4.6)

 - [4.7. Cờ tràn - OF](#4.7)

 - [4.8. Cờ ngắt](#4.8)

 - [4.9. Cờ hướng](#4.9)

[5. Hiện tượng tràn](#5)

 - [5.1. Tràn không dấu](#5.1)

 - [5.2. Tràn có dấu](#5.2)

[6. Sự liên quan giữa tràn và thanh ghi cờ](#6)


#### 1.Thanh ghi cờ<a name="1"></a>



#####1.1. Thanh ghi SP<a name="1.1"></a>

 - Thanh ghi SP (con trỏ ngăn xếp - Stack Poiter): Thanh ghi này luôn trỏ đến đỉnh hiện thời của stack - ngăn xếp.

![thanhghi_SP](http://i.imgur.com/LaViIeV.png)

#####1.2. Thanh ghi BP<a name="1.2"></a>

 - Thanh ghi BP (con trỏ cơ sở - Base Poiter): Thanh ghi này được sử dụng để truy nhập dữ liệu trong ngăn xếp. Tuy nhiên khác với thanh ghi SP, thanh ghi này còn được sử dụng để truy nhập dữ liệu trong đoạn khác.
 
![thanhghi_BP](http://i.imgur.com/A1TBzJH.png)

#####1.3. Thanh ghi IP<a name="1.3"></a>

 - Thanh ghi IP (con trỏ chỉ dẫn - Instruction Pointer): Đây là một thanh ghi rất quan trọng, nó được cập nhật mỗi khi có một lệnh được thực hiện, giá trị của thanh ghi này luôn trỏ đến câu lệnh tiếp theo sẽ được thực hiện. Khác với các thanh ghi khác, thanh ghi IP không thể bị tác động trực tiếp bởi các lệnh, do vậy trong các lệnh chúng ta sẽ không thấy sự có mặt của thanh ghi IP như một toán hạng.

![thanhghi_IP](http://i.imgur.com/0pxiUqc.png)



#####1.4. Thanh ghi chỉ số SI và DI<a name="1.4"></a>
 
 - Hai thanh ghi SI (Chỉ số nguồn - Source Index) và DI (Chỉ số đích - Destination Index) thường được sử dụng trong các thao tác làm việc với chuỗi hoặc mảng.

![thanhghi_SI](http://i.imgur.com/CNcXi1F.png)

![thanhghi_DI](http://i.imgur.com/LaViIeV.png)


####2. Các thanh ghi dữ liệu công dụng chung (AX, BX, CX, DX)<a name="2"></a>

 - Đây là 4 thanh ghi đa năng 16 bit, đặc biệt khi ta cần chứa dữ liệu 8 bit, các thanh ghi này có thể tách ra thành 2 thanh ghi 8 **bit cao và thấp** để làm việc, đó là **AX** tách thành **AH**(cao) và **AL**(thấp), **BX** tách thành **BH** và **BL**, **CX** tách thành **CH** và **CL**, **DX** tách thành **DH** và**DL**. Dữ liệu sẽ được lưu hết ở các thanh ghi chứa **bit thấp**(bit 0 đến bit 7) sau đó mới đến thanh ghi **bit cao**(bit 8 đến bit 15).

 - Ngoài ý nghĩa là thanh ghi dữ liệu công dụng chung thì các thanh ghi còn có chức năng riêng như sau:
<ul>
 <li>**Thanh ghi AX (thanh ghi chứa - accumulator)**: Thường được sử dụng trong các lệnh số học, logic và chuyển dữ liệu. Trong các thao tác nhân chia thường sử dụng đến thanh ghi này.</li>
 <li>**Thanh ghi BX (thanh ghi cơ sở - base)**: Đóng vai trò là thanh ghi địa chỉ.</li>
 <li>**Thanh ghi CX (thanh ghi đếm - counter)**: Thanh ghi này thường được sử dụng như một biến đếm trong các vòng lặp hoặc các lệnh dịch hoặc quay các bit.</li>
 <li>**Thanh ghi DX (thanh ghi dữ liệu - data)**: Thanh ghi thường được sử dụng để lưu dữ liệu và thanh ghi này cùng với thanh ghi AX tham gia vào thao tác của phép nhân hoặc phép chia, nó cùng thường được sử dụng trong các thao tác vào ra.</li>
</ul>

####3. Các thanh ghi đoạn<a name="3"></a>
 - **CS (Đoạn mã lệnh - Code Segment)**: Lưu địa chỉ phân đoạn mã lệnh.

 - **DS (Đoạn dữ liệu - Data Segment)**: Lưu địa chỉ phân đoạn dữ liệu.

 - **ES (Đoạn dữ liệu bổ sung - Extra Data Segment)**: Lưu địa chỉ phân đoạn dữ liệu bổ sung.

 - **SS (Đoạn ngăn xếp - Stack Segment)**: Lưu địa chỉ phân đoạn ngăn xếp.





####4. Các thanh ghi con trỏ và chỉ số <a name="1"></a>

![thanhghi](http://i.imgur.com/d42zGXE.png)

##### 4.1. Các cờ trạng thái <a name="2.1"></a>

 - Bộ xử lý sử dụng cờ trạng thái để phản ánh kết quả của một phép tính, chẳng hạn khi lệnh SUB AX,AX được thực hiện cờ ZF sẽ được thiết lập 1 nhờ vậy nó chỉ rằng kết quả bằng 0 đã được tạo. Bây giờ chúng ta hãy xem các cờ trạng thái.

##### 4.2.  Cờ nhớ - CF <a name="1.2"></a>

 - **CF** (Cờ nhớ - Carry Flag): Cờ này được thiết lập khi có nhớ từ bit msb trong phép cộng hay có vay vào bit msb.


##### 4.3. Cờ chẵn lẻ - PF<a name="4.3"></a>

 - **PF** (Cờ chẵn lẻ - Parity Flag): Cờ này bật khi kết quả của phép tính vừa thực hiện có chẵn bit 1. Nó bằng 0 nếu byte thấp có số lẻ bit 1(parity lẻ). Ví dụ kết quả của một phép cộng các word là FFFEh, như vậy byte thấp có 7 bit 1 do đó PF=0.

##### 4.4. Cờ nhớ phụ - AF<a name="4.4"></a>
 
 - **AF** (Cờ nhớ phụ - Auxilary Flag): Cờ này được thiết lập 1 nếu có nhớ bit 3 trong phép cộng hoặc có vay nào bit 3 trong phép trừ. Cờ AF được sử dụng trong các thao tác với số thập phân mã hóa nhị phân(số BCD).  

##### 4.5. Cờ Zero - ZF<a name="4.5"></a>
 
 - **ZF** (Cờ 0 - Zero Flag): Cờ này được bật khi kết quả của phép tính vừa thực hiện là 0.


##### 4.6. Cờ dấu - SF<a name="4.6"></a>

 - **SF** (Cờ dấu - Sign Flag): Cờ này được thiết lập 1 khi bit msb của kết quả bằng 1 có nghĩ là kết quả là âm nếu bạn làm việc với số có dấu. Ngược lại SF=0 nếu bit msb của kết quả bằng 0.

##### 4.7. Cờ tràn - OF <a name="4.7"></a> 

 - **OF** (Cờ tràn - Overflow Flag): Cờ này bật khi phép tính vừa thực hiện gây ra tràn số.

##### 4.8. Cờ ngắt <a name="4."></a>

 - **IF** (Cờ ngắt - Interrupt Flag): Cờ này bật để cho phép các ngắt xảy ra.

##### 4.9. Cờ hướng <a name="4."></a>

 - **DF** (Cờ hướng - Direction Flag): Cờ này bật để chọn chế độ giảm chỉ số tự động khi làm việc với mảng or làm việc với chuỗi ký tự từ phải sang trái.


#### 5. Hiện tượng tràn <a name ="5"></a>
 
 - Hiện tượng tràn gắn liền với một sự thật là phạm vi của các số biểu diễn trong máy tính có **giới hạn**.

 - Cụ thể: Phạm vi của các số thập phân có dấu có thể biểu diễn bằng word 16 bit là từ -32768 đến 32767, với một byte 8 bit thì phạm vi -128 đến 127

 - Đối với cá số không dấu thì phạm vi là từ 0 đến 65535 cho một word và từ 0 đến 255 cho một byte. Nếu kết quả của một phép tính nằm ngoài phạm vi này thì hiện tượng tràn sẽ xảy ra và kết quả nhận được bị cắt bớt sẽ không phải là kết quả đúng.

### Bộ xử lý lập cờ OF =1 để báo có hiện tượng tràn có dấu và CF=1 để báo có hiện tượng tràn không dấu: 

#####5.1. Tràn không dấu <a name="5.1"></a>

 - Khi thực hiện phép cộng, hiện tượng tràn xảy ra khi có nhớ từ bit msb. Có nghĩa là kết quả đúng của phép tính lớn hơn số không dấu lớn nhất có thể biểu diễn, đó là FFFFh cho một word và FFh cho một byte. Khi thực hiện phép trừ hiện tượng tràn không dấu xảy ra khi có sự vay vào bit msb, có nghĩa là kết quả nhỏ hơn 0.

#####5.2 Tràn có dấu<a name="5.2"></a>
 
 - Trong phép cộng các số cùng dấu, hiện tượng tràn có dấu xảy ra khi tổng nhận dược có dấu khác với dấu của 2 số dương 7FFFFh nhưng lại nhận được kết quả là một số âm FFFEh.

 - Phép trừ các số khác dấu cũng giống như phép cộng các số cùng dấu. Hiện tượng tràn xảy ra khi kết quả có dấu khác ới dấu chung ta chờ đợi.

 - Phép cộng 2 số khác dấy hiện tượng tràn là không thể xảy ra vì A+(-B)=A-B và bởi vì A và B là 2 số đủ nhỏ để chứa trong toán hạng đích thì hiệu của chúng tất nhiên không thể vượt ra ngoài phạm vi của nó được. Cũng vì lý do như vậy mà phép trừ 2 số cùng dấu cũng không thể gây ra hiện tượng tràn.

####6. Sự liên quan giữa tràn và thanh ghi cờ<a name="6"></a>

 - Thực ra bộ xử lý sử dụng phương pháp sau để thiết lập cờ OF:

Nếu việc nhớ vào bit msb và việc nhớ ra từ nó không đồng thời, có nghĩa là có nhớ vào msb nhưng không có nhớ ra từ nó, hay nó nhớ ra từ nó mà không có nhớ vào thì hiện tượng tràn có dấu xuất hiện và OF được lập 1.

-------------------------------------------------------------------------------------------------------------------------------------------------
END