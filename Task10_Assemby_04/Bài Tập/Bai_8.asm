.model  small
.stack 100h
.data
    msg_1   db  "Danh vao mot ky tu: $"
    msg_2   db  13,10,"Ma ASCII cua ky tu duoi dang nhi phan la : $"
    msg_3   db  13,10,"So cac bit 1 la: $"
    a   db  ? 
    b   db  ?
.code 

    MOV ax,@data
    MOV ds,ax
    
    ;Nhap
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h
    
    Mov ah,1
    Int 21h 
    Mov a,al
    
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    ;xu ly 
    
      
    
    Mov bl,a
    Mov b,0
    Mov cx,9    ; Vi dich 8 bit + 1 bit khoang trang
  lap:   
    Shl bl,1    ; dich trau 1 bit
    Jc  inso_1  ; Neu CF = 1 thi nhay den inso_1
    cmp cx,5    ; Khi da in ra 4 bit thi cach
    je space
    Mov ah,2    ; In so 0
    Mov dl,'0'
    Int 21h   
    loop lap
    jmp In_Tong
    
    
  inso_1:
    Inc b       ; Tang b len 1 
    Mov ah,2    ; in so 1
    Mov dl,'1'
    Int 21h
    cmp cx,0
    je  In_Tong
    loop lap
  
  space:       ; in ra khoang trang
    Mov ah,2
    Mov dl,' '
    Int 21h
    cmp cx,0
    je  In_Tong
    loop lap 
    
    ; in msg_3
  In_Tong:  
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h
       
    Mov bl,b            ; bao nhieu lan hien so 1 thi xuat ra
    Add bl,48
    Mov ah,2
    Mov dl,bl
    
    Int 21h
    
    DOS:
    Mov ah,4ch
    Int 21h
    
end    
    
    