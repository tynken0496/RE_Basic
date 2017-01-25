.model normal
.stack 100h
.data
    msg_1   db  "Danh vao mot ky tu: $"
    msg_2   db  13,10,"Ma ASCII cua ky tu duoi dang hex la: $"
    dem db  ?
    a   dw  ?
.code

    Mov ax,@data
    Mov ds,ax
    
    ;nhap
    
    Mov ah,9
    Mov dx, offset msg_1
    Int 21h
    
    XOR BX,BX	           ; xoa bx
	MOV CL,4	
	MOV AH,1	
	INT 21H		
WHILE_:
	CMP AL,0DH 	           ;enter
	JE	END_WHILE

	CMP AL,39H 
	JG	LETTER	

	AND AL,0FH 
	JMP SHIFT 
LETTER:
	SUB AL,37H
SHIFT:
	SHL	BX,CL              ; gianh cho cho gia tri moi

	OR BL,Al               ; chen 
	INT 21H
	JMP WHILE_ 

	
END_WHILE:
    
    Mov ah,9
    Mov dx, offset msg_2
    Int 21h
    
    Mov cx,4
WHILE_1:
 
    Xor dx,dx

CONTINEU:

    shl bx,1
    rcl dl,1
    inc dh
    cmp dh,4
    jb CONTINEU
    cmp dl,9
    ja WORD
    or dl,30h
    jmp OUTPUT
WORD:
    add dl,37h
OUTPUT: 
    mov ah,2
    int 21h
    loop WHILE_1
    int 20h
 
    Mov ah,4ch
    Int 21h   