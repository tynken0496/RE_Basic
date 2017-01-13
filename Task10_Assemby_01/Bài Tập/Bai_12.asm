.model  small         
.stack  100h          
.data             
 message_1 db "Cau a.$"
 message_2 db 0Dh,0Ah,'?$'
 message_3  db  0Dh,0Ah,"Cau b.$"
 message_4     db  0Dh,0Ah,"Ban hay nhap 3 chu cai dau: $"
 message_5  db  0Dh,0Ah,"Cau c.$"
 message_6 db "*$"
   
 CLRF db 13,10,'$'
 a   db   ?
 b   db   ?
 c   db   ?
 
.code

    Mov ax,@data
    Mov ds,ax  
    
 ;Cau a
    Lea dx,message_1       
    Mov ah,9             
    Int 21h 
    
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
 ;Cau b
    Lea dx,message_3
    Mov ah,9
    Int 21h
    
    Lea dx,message_4
    Mov ah,9
    Int 21h
    
    ;Nhap
    
    Mov ah,1
    Int 21h
    Mov a,AL
    
    Mov ah,1
    Int 21h
    Mov b,AL
    
    Mov ah,1
    Int 21h
    Mov c,AL     
    
    ;Xuat KQ 
    ; Xuong dong va ve dau dong     
    Lea dx,CLRF  
    Mov ah,9
    Int 21h
    
    ;Xuat a
    Mov ah,2
    Mov dl,a
    Int 21h   
    
    ; Xuong dong va ve dau dong     
    Lea dx,CLRF  
    Mov ah,9
    Int 21h
    
    ;Xuat b
    Mov ah,2
    Mov dl,b
    Int 21h   
    
    ; Xuong dong va ve dau dong     
    Lea dx,CLRF  
    Mov ah,9
    Int 21h
    
    ;Xuat c
    Mov ah,2
    Mov dl,c
    Int 21h  
    
 ;Cau c 
       Lea dx,message_5
       Mov ah,9
       Int 21h
       
       Lea dx,CLRF
       Mov ah,9
       Int 21h
   
       Mov cx,0    ;Reset cx = 0
                               
     Lap_1:
        Add cl,1           ;Tang thanh ghi cl+1
        Lea dx,message_6   ;In
        Mov ah,9
        Int 21h
        Cmp cl,10            ;So sanh, neu cl=10 nhay
        Jg Xuong_dong
        Jmp Lap_1
        
        
        ; Xuong dong
        Xuong_dong:
        Mov ah,2
        Mov dl,0Dh
        Int 21h
        Mov ah,2
        Mov dl,0Ah
        Int 21h
        
        Add Bx,1          ;Gan gia tri cho bx de so sanh nhay
        Cmp bx,10
        Jg  Thoat 
        Mov cx,0
        Jmp Lap_1 
    
    ;DOS 
    Thoat:
    Mov AH,4Ch             
    Int 21h

end