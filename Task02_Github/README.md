#Tìm hiểu hoạt động của Github

> Thực hiện: Nguyễn Văn Thành
>
> Tham khảo: Internet
>Cập nhật lần cuối: 05/01/2017

### Mục lục
[1. Tổng quan về Github](#1)

 - [1.1. Git là gì?](#1.1)
 - [1.2. Github là gì?](#1.2)

[2. Cài đặt Git và thiết lập ban đầu](#2)

 - [2.1. Cài đặt Git](#2.1)
<ul>
<li>[2.1.1. Ubuntu ](#2.1.1)</li>
<li>[2.1.2. Mac OS](#2.1.2)</li>
<li>[2.1.3. Windows](#2.1.2)</li>
</ul>

 - [2.2 Thiết lập chứng thực cá nhân](#2.2)


[3. Cách tạo một repository](#3)

 - [3.1. Tạo local repository](#3.1)

 - [3.2. Tạo repository trên Github và làm việc](#3.2)

[4. Git Log và Undo Commit](#4)

 - [4.1. Xem git log](#4.1)

 - [4.2. Lọc log với _--pretty_](#4.2)

 - [4.3. Thủ thuật xem log đẹp hơn](#4.3)

 - [4.4. Undo Commit](#4.4)

####1. Tổng quan về Github <a name="1"></a>

#####1.1 Git là gì? <a name ="1.1"></a>

  - **Git** là tên gọi của một **Hệ thống quản lý phiên bản phân tán** (Distributed Version Control System – DVCS) là một trong những hệ thống quản lý phiên bản phân tán phổ biến nhất hiện nay. DVCS nghĩa là hệ thống giúp mỗi máy tính có thể lưu trữ nhiều phiên bản khác nhau của một mã nguồn được nhân bản (**clone**) từ một kho chứa mã nguồn (**repository**), mỗi thay đổi vào mã nguồn trên máy tính sẽ có thể ủy thác (**commit**) rồi đưa lên máy chủ nơi đặt kho chứa chính. Và một máy tính khác (nếu họ có quyền truy cập) cũng có thể clone lại mã nguồn từ kho chứa hoặc clone lại một tập hợp các thay đổi mới nhất trên máy tính kia. Trong Git, thư mục làm việc trên máy tính gọi là **Working Tree**. Đại loại là như vậy.

![](http://i.imgur.com/wQHfh2i.png)

`Mô hình hoạt động của DVCS`

 - Ngoài ra, có một cách hiểu khác về Git đơn giản hơn đó là nó sẽ giúp bạn lưu lại các phiên bản của những lần thay đổi vào mã nguồn và có thể dễ dàng khôi phục lại dễ dàng mà không cần copy lại mã nguồn rồi cất vào đâu đó. Và một người khác có thể xem các thay đổi của bạn ở từng phiên bản,  họ cũng có thể đối chiếu các thay đổi của bạn rồi gộp phiên bản của bạn vào phiên bản của họ. Cuối cùng là tất cả có thể đưa các thay đổi vào mã nguồn của mình lên một kho chứa mã nguồn.

- Cơ chế lưu trữ phiên bản của Git là nó sẽ tạo ra một “_ảnh chụp_” (**snapshot**) trên mỗi tập tin và thư mục sau khi **commit**, từ đó nó có thể cho phép bạn tái sử dụng lại một ảnh chụp nào đó mà bạn có thể hiểu đó là một phiên bản. Đây cũng chính là lợi thế của Git so với các DVCS khác khi nó không “_lưu cứng_” dữ liệu mà sẽ lưu với dạng **snapshot**.

#####1.2 Github là gì? <a name="1.2"></a>

- **GitHub** là một dịch vụ cung cấp kho lưu trữ mã nguồn Git dựa trên nền web cho các dự án phát triển phần mềm. GitHub cung cấp cả phiên bản trả tiền lẫn miễn phí cho các tài khoản. Các dự án mã nguồn mở sẽ được cung cấp kho lưu trữ miễn phí. Tính đến tháng 4 năm 2016, GitHub có hơn 14 triệu người sử dụng với hơn 35 triệu kho mã nguồn, làm cho nó trở thành máy chủ chứa mã nguồn lớn trên thế giới.

- **Github** đã trở thành một yếu có sức ảnh hưởng trong cộng đồng phát triển mã nguồn mở. Thậm chí nhiều nhà phát triển đã bắt đầu xem nó là một sự thay thế cho sơ yếu lý lịch và một số nhà tuyển dụng yêu cầu các ứng viên cung cấp một liên kết đến tài khoản Github để đánh giá ứng viên


####2. Cài đặt Git và thiết lập ban đầu <a name="2"></a>

#####2.1. Cài đặt Git <a name="2.1"></a>

#####2.1.1. Ubuntu<a name="2.1.1"></a>

 `Vào terminal > sudo apt-get install git`

 ![](http://i.imgur.com/ESNKvaI.png)

####2.1.2. Mac OS<a name="2.1.2"></a>

 - Đối với Mac, bạn có thể sử dụng file installer tải tại địa chỉ http://git-scm.com/download/mac để cài đặt.

####2.1.3. Windows <a name="2.1.3"</a>

 - Nếu bạn dùng **Windows** thì có thể tải file .exe cài đặt Git tại địa chỉ http://git-scm.com/download/win. Khi cài bạn có thể để nguyên tùy chọn mặc định mà không cần tùy chỉnh gì thêm nếu bạn chưa hiểu về nó.

 - Sau khi cài đặt Git vào Windows, bạn sẽ cần mở ứng dụng Git Bash lên để bắt đầu sử dụng các dòng lệnh của Git.

####2.2.Thiết lập chứng thực cá nhân <a name="2.2"></a>

 - Sau khi cài Git xong, việc đầu tiên bạn nên làm là khai báo tên và địa chỉ email vào trong file cấu hình của Git trên máy. Để làm điều này bạn sẽ cần sử dụng hai lệnh sau đây để thiết lập tên và email.

```javascrypt
$ git config --global user.name "Tyn Ken"
$ git config --global user.email "tynken0496@gmail.com"
```

 - Sau khi thiết lập xong, bạn có thể kiểm tra thông tin chứng thực trên user của bạn bằng cách xem tập tin `~/.gitconfig` (nhắc lại rằng dấu **~** nghĩa là thư mục gốc của user).

```javascrypt
$ cat ~/.gitconfig
[user]
 name = Tyn Ken
 email = tynken0496@gmail.com
```

 - Hoặc bạn cũng có thể dùng lệnh git `config --list` để ghi danh sách các thiết lập hiện tại mà bạn đã làm.

 - Như vậy là bạn đã xong bước ban đầu đó là cài đặt Git và thiết lập tên và email của mình vào Git để bắt đầu làm việc. Ở phần sau, mình sẽ hướng dẫn cách bạn tạo ra một local repository (kho chứa trên máy cá nhân) để xem Git hoạt động thế nào.


####3. Cách tạo một repository<a name="3"></a>

#####3.1. Tạo local repository<a name="3.1"></a>

 - Trước hết, để tạo một **repository** thì bạn cần truy cập vào thư mục của mã nguồn với lệnh `cd`, sau đó sử dụng lệnh `git init `để khởi tạo repository trong thư mục đó. Ở ví dụ này, mình sẽ tạo tạo ra một thư mục mới để chứa code sau này và khởi tạo repository cho nó, mình sẽ dùng lệnh `git init tên_folder` để nó tự khởi tạo thư mục.

```javascrypt
 $ git init git_example
Initialized empty Git repository in /home/tynken/git_example/.git/
```

 - Ở đoạn trên, nó hiển thị dòng thông báo mình đã khởi tạo một kho Git trống tại đường dẫn như trên. Lưu ý rằng thư mục ẩn `.git/` là nơi nó sẽ chứa các thiết lập về Git cũng như lưu lại toàn bộ thông tin về kho chứa, bạn không cần đụng chạm gì vào thư mục `.git/` này.

 - Nếu kho chứa của bạn đã có sẵn mã nguồn thì bạn cần phải đưa các tập tin về trạng thái Tracked nhằm có thể làm việc được với Git. Để làm việc này, bạn sẽ cần sử dụng lệnh `git add tên_fil`e, có thể sử dụng dấu `*` để gom toàn bộ. Sau đó có thể sử dụng lệnh `git status` để xem danh sách các tập tin đã được tracked.

```javascrypt
$ git add readme.txt
$ git status
On branch master
```

`Initial commit`

```javascrypt
Changes to be committed:
 (use "git rm --cached <file>..." to unstage)
```

`new file: readme.txt`

 - Và sau khi tập tin đã được đưa vào trạng thái tracked và nếu một tập tin đã tracked thì nó phải được đưa vào lại Staging Area (giải thích ở bài sau) cũng bằng lệnh `git add` thì bạn mới có thể tiến hành ủy thác (commit) nhằm lưu lại bản chụp các thay đổi. Lệnh commit sẽ có cấu trúc `git commit -m "Lời nhắn"`, lúc này tất cả các tập đang trong trạng thái tracked (file mới) hoặc một tập tin đã được tracked nhưng có một sự thay đổi mới thì sẽ được commit.

```javascrypt
$ git commit -m "First Commit"
[master (root-commit) 799db56] First Commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 readme.txt
```

 - Bây giờ thì bạn đã hoàn thành việc commit lần đầu tiên các tập tin mà bạn đã đưa vào kho, mình sẽ nói kỹ hơn về việc commit ở các bài sau. Tóm lại là tới đây bạn đã có một kho chứa mã nguồn Git trên máy của bạn.

#####3.2. Tạo repository trên Github và làm việc <a name="3.2"></a>

 - Trước tiên bạn cần đăng nhập vào <a href="https://github.com/">Github</a>, sau đó ấn vào dấu + trên menu và chọn New repository.

 ![](http://i.imgur.com/vT9IIRT.png)

 ![](http://i.imgur.com/3XEMiNX.png)

 - Bạn sẽ cần đặt tên cho kho chứa của bạn. Bạn có thể chọn loại kho chứa là **Public** (ai cũng có thể clone) và **Private** (chỉ có những người được cấp quyền mới có thể clone).

![](http://i.imgur.com/aphmp4q.png)
`Điền thông tin khi tạo Repository trên Github`

 - Khi tạo xong nó sẽ dẫn bạn tới trang hướng dẫn làm việc với kho chứa vừa tạo. Và kho chứa của bạn bây giờ sẽ có địa chỉ là **https://github.com/$user-name/$repository**, ví dụ https://github.com/tynken0496/Github.git

![](http://i.imgur.com/TAr031t.png)

 - Việc của bạn bây giờ là hãy clone cái kho chứa này về máy của mình bằng lệnh git clone địa_chỉ.

```javascrypt
$ git clone https://github.com/tynken0496/Github.git
Cloning into 'Github'...
warning: You appear to have cloned an empty repository.
Checking connectivity... done
```

 - Bây giờ hãy truy cập vào thư mục working tree (thư mục vừa clone repository về) và thử tạo ra một file tên là README.md, sau đó dùng lệnh **git add** để đưa file này vào Staging Area.

```javascrypt
$ cd Github
$ echo "# Github" > README.md
$ git add README.md
$ git commit -m "First commit on Github"
[master (root-commit) 6e729a4] First commit on Github
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
```

 - Tuy nhiên sau khi **commit** xong, tập tin đã được commit sẽ vẫn không thể xuất hiện trong kho chứa trên Github mà bạn phải làm thêm một việc nữa đó là dùng lệnh `git push` để đẩy các tập tin đã được commit lên **Github**. Lưu ý rằng bạn sẽ cần nhập tài khoản và mật khẩu Github.

`$ git push origin master`

 - Sau đó truy cập vào <a href="https://github.com/">Kiểm tra</a> để xem đã có chưa.

####4. Git Log và Undo Commit <a name="4"></a>
#####4.1. Xem git log <a name="4.1"></a>

 - Để xem lịch sử của các lần commit trước đó, bạn sử dụng lệnh `git log` là sẽ thấy.

 `$ git log`

 Ngoài ra, bạn có thể chèn thêm tham số `-p` vào để hiển thị chi tiết của mỗi lần commit.

 `$ git log -p`

#####4.2. Lọc log với _--pretty_ <a name="4.2"></a>

 - Tham số **--pretty** rất có ích nếu bạn muốn lọc xem một đối tượng nào đó trong lịch sử **commit**, ví dụ như chỉ xem lời nhắn commit hoặc chỉ xem email của người commit.

 - Cách sử dụng tham số **--pretty** là bạn phải viết kèm các tag của nó như sau:

`$ git log --pretty="%tag"`

 - Danh sách các **%tag**:
<ul>
<li>**%H** –  Commit hash</li>
<li>**%h** – Abbreviated commit hash</li>
<li>**%T** – Tree hash</li>
<li>**%t** – Abbreviated tree hash</li>
<li>**%P** – Parent hashes</li>
<li>**%p** – Abbreviated parent hashes</li>
<li>**%an** – Author name</li>
<li>**%ae** – Author e-mail</li>
<li>**%ad** – Author date (format respects the –date=option)</li>
<li>**%ar** – Author date, relative</li>
<li>**%cn** – Committer name</li>
<li>**%ce** – Committer email</li>
<li>**%cd** – Committer date</li>
<li>**%cr**– Committer date, relative</li>
<li>%s – Subj</li>
</ul>


#####4.3. Thủ thuật xem **log** đẹp hơn<a name="4.3"> </a>


 - Bạn có thể thấy mỗi khi gõ git log mà không có các tham số kèm theo thì nó hiện ra rất khó nhìn. Tuy nhiên có một cách để bạn có thể làm gọn cái log mặc định, và thêm màu sắc cho nó để bạn dễ nhìn hơn.

 - Trước tiên bạn copy lệnh này để thiết lập.

 	>$git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#####4.4 Undo Commit <a name="4.4"></a>

 - Nếu bạn cần xóa bỏ lần **commit** trước và cần **undo** để commit lại thì có thể sử dụng tham số **--amend** trong lệnh `git commit`.

```javascrypt
 $ git log --pretty="%s"
Hihi
First commit on Github
$ git commit --amend -m "Hehe"
[master 3682e56] Hehe
 Date: Tue Apr 21 17:16:37 2015 -0700
 2 files changed, 1 insertion(+), 1 deletion(-)
 create mode 100644 Github.html
$ git log --pretty="%s"
Hehe
First commit on Github
```

 - Lưu ý rằng undo nghĩa là bạn quay trở lại bước commit lần trước, do vậy nếu cần bổ sung tập tin nào vào để commit thì hãy đưa tập tin đó vào Staging Area trước.

 ------------------------------------------------------------------------------------------------------------------------------------------------

#THE AND