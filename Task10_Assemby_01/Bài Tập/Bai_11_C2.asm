.model  small
.stack  100h
.data
    message_1   db  "*$" 
.code
    Mov ax,@data
    Mov ds,ax
     
        Mov cx,0    ;Reset cx = 0
                               
     Lap_1:
        Add cl,1           ;Tang thanh ghi cl+1
        Lea dx,message_1   ;In
        Mov ah,9
        Int 21h
        Cmp cl,9            ;So sanh, neu cl=9 nhay
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
        Cmp bx,9
        Jg  Thoat 
        Mov cx,0
        Jmp Lap_1   
       
       
   ;DOS 
    Thoat:
    Mov ah,4Ch
    Int 21h
    
end
    