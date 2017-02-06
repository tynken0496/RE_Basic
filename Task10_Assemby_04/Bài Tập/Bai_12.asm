.model small
.stack  100h
.data
    
    msg_1   db  13,10,"Danh vao mot so nhi phan 8 chu so(thu nhat): $"
    msg_2   db  13,10,"Danh vào mot so nhi phan 8 chu so(thu hai): $"
    msg_3   db  13,10,"Tong cua chung dang nhi phan bang: $"
    msg_4   db  13,10,"Nhap sai!$"
    count_1   db  ?
    count_2   db  ? 
    count_3   db  ?
.code   
    
    Mov ax,@data
    Mov ds,ax
    
  messege_1:  
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h                
    xor bx,bx 
    
  nhap_1:    
    Mov ah,1
    Int 21h 
    cmp al,'1'
    je bin_1
    cmp al,'0'
    je bin_1
    cmp al,13
    je  messege_2
    
    mov count_1,0
    mov ah,9
    mov dx,offset msg_4
    Int 21h
    jmp messege_1   
     
    
  bin_1:
    and al,0Fh
    Shl bx,1
    or bl,al
    Inc count_1   
    cmp count_1,8
    je  messege_2
    jmp nhap_1       
    
  messege_2:
    mov ah,9
    mov dx,offset msg_2
    int 21h 
    xor dx,dx   
    
  nhap_2:
      
    Mov ah,1
    Int 21h 
    cmp al,'1'
    je bin_2
    cmp al,'0'
    je bin_2
    cmp al,13
    je  enter
    
    mov count_2,0
    mov ah,9
    mov dx,offset msg_4
    Int 21h
    jmp messege_2   
     
    
  bin_2:
    and al,0Fh
    Shl dx,1
    or dl,al
    Inc count_2   
    cmp count_2,8
    je  enter
    jmp nhap_2   
    
    
      
    
 enter:
    Add bx,dx
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
        
    Mov cx,19
 while:
    inc count_3
    cmp count_3,5
    je space
    shl bx,1
    jc  number_1    ;nhay neu CF=1
    jnc number_0    ; nhay neu CF=0
    
 space:
    Mov ah,2
    MOv dl,' '
    Int 21h
    Mov count_3,0
    loop while
    jmp DOS
 
 number_1:
    Mov ah,2
    Mov dl,'1'
    Int 21h
    loop while  
    
 number_0:
    Mov ah,2
    Mov dl,'0'
    Int 21h
    loop while  
    
    
 DOS:  
    Mov ah,4ch
    Int 21h   