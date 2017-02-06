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
    
  