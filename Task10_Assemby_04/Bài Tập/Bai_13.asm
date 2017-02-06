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
