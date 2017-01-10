.model small
.stack
.data
    message_1   db  "Nhap 1 ky tu: $"
    message_2   db  "Ky tu da nhap: $"  
    message_3   db 0Dh,0Ah,"Nhap vao ky tu hoa : $"  
    message_4   db 0Dh,0Ah,"Chuyen sang ky tu thuong la: $"
kytu db ?
kytuhoa db  ?

.code
    Mov ax,@data
    Mov ds,ax
    
    ;Xuat message_1
    
    Lea dx,message_1
    Mov ah,9
    Int 21h
    
    ;Nhap 
    
    Mov ah,1
    Int 21h
    Mov kytu,al
    
    ; Xuong dong 
    
    mov ah,2
    mov dl,0Ah
    int 21h
    
    ;Xuat message_2 
    
    Lea dx,message_2
    Mov ah,9
    Int 21h
    
    ;Hien ky tu 
    
    Mov ah,2
    Mov dl,kytu
    Int 21h   
             
    ;Xuat message_3
    Lea dx,message_3
    Mov ah,9
    Int 21h  
    

    ;Nhap vao 1 ki tu hoa va doi thanh ki tu thuong
             
    Mov ah,1
    Int 21h ; Doc 1 ki tu hoa va luu vao AL
    Add al,20h ; Doi thanh ki tu thuong
    Mov kytuhoa,al
    
    ;Xuat ky tu thuong    
    Lea dx,message_4
    Mov ah,9
    Int 21h
    Mov ah,2
    Mov dl,kytuhoa
    Int 21h
    
    ;DOS
    Mov ah,4Ch
    Int 21h

end