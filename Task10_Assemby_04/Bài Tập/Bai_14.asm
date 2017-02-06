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
