.model small
.stack  100h
.data
    message_1   db  0Dh,0Ah,"**********$"
.code

    Mov ax,@data
    Mov ds,ax
    
    Mov cx,10
  Lap:
    Lea dx,message_1
    Mov ah,9
    Int 21h     
    loop Lap
    
    ;DOS
    thoat:
    Mov ah,4Ch
    Int 21h

end