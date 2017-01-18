
.model small
.stack 100h
.data
    msg db "Nhap A or B: $"
kytu db ?
.code

    Mov ax,data
    Mov ds,ax   
    ;xuat msg
    Lea dx,msg
    Mov ah,9
    Int 21h 
    ;nhap kytu
    Mov ah,1
    Int 21h
    Mov kytu,AL
             
  Case_ss:
    cmp kytu,'A'
    je A
     
    cmp kytu,'B'
    je B
        
        
  A:
    mov ah,2
    mov dl,0Ah
    int 21h
    jmp Thoat
     
  B:
    mov ah,2
    mov dl,0Dh
    int 21h
    jmp Thoat
      
      ;Hien thi dau va cuoi dong   
    Thoat:
    Mov ah,1
    Int 21h
       ;DOS 
    Mov ah,4Ch
    Int 21h

end