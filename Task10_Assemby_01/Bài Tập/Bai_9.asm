.model  small
.stack  100h
.data
    message     db  "Ban hay nhap 3 chu cai dau: $"  
    CLRF db 13,10,'$'
    a   db   ?
    b   db   ?
    c   db   ?
.code
    Mov ax,@data
    Mov ds,ax
    
    ;xuat chuoi
    
    Lea dx,message
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
    
 ;DOS
  Mov ah,4ch
  Int 21h
end