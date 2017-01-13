.Model small
.Stack 100h
.Data
    message_1   db  "Ban nhap vao mot chu so hex(A-F): $"
    message_2   db  0DH,0Ah,"Dang thap phan cua no la: $"
    message_3   db  "10$"
    message_4   db  "11$"
    message_5   db  "12$"
    message_6   db  "13$"
    message_7   db  "14$"
    message_8   db  "15$"
    message_9   db  "16$"
.Code 

    Mov ax,@data
    Mov ds,ax
      
    Lea dx,message_1
    Mov ah,9
    Int 21h 
    
    Mov ah,1
    int 21h
   ;A->10 
    cmp al,'A'
    je  D_10  
    
    cmp al,'a'
    je  D_10
    

   
   ;B->11 
    cmp al,'B'
    je  D_11
    
    cmp al,'b'
    je  D_11
        
   ;C->12
    cmp al,'C'
    je  D_12   
    
    cmp al,'c'
    je  D_12
    
   
   ;D->13
    cmp al,'D'
    je  D_13
    
    cmp al,'d'
    je  D_13
   
   ;E->14   
    cmp al,'E'
    je  D_14
    
    cmp al,'e'
    je  D_14
   
   ;F->15
    cmp al,'F'
    je  D_15
    
    cmp al,'F'
    je  D_15
    
   ;In ra ket qua
    
    D_10:
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    Lea dx,message_3
    Mov ah,9
    Int 21h
    jmp thoat 
    
    
    D_11:
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    Lea dx,message_4
    Mov ah,9
    Int 21h
    jmp thoat
    
    D_12:
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    Lea dx,message_5
    Mov ah,9
    Int 21h
    jmp thoat 
    
    D_13:
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    Lea dx,message_6
    Mov ah,9
    Int 21h
    jmp thoat 
    
    D_14:
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    Lea dx,message_7
    Mov ah,9
    Int 21h
    jmp thoat 
    
    D_15:
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    Lea dx,message_8
    Mov ah,9
    Int 21h
    jmp thoat 
    
    

    ;DOS
    thoat:
    Mov ah,4Ch
    Int 21h

end