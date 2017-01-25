.model small
.stack  100h
.data
    msg_1   db  "Danh vao mot so hex(0..FFFF): $"
    msg_2   db  13,10,"Chu so hex khong hop le, hay nhap vao lai: $"                   
    msg_3   db  13,10,"Duoi dang nhi phan no bang: $"
count   db  ?
.code

    Mov ax,@data
    Mov ds,ax
    
    Mov ah,9
    Mov dx,offset msg_1
    Int 21h

WHILE_1:    
    XOR BX,BX	           ; xoa bx
	MOV CL,4	
	MOV AH,1	
	INT 21H		
WHILE_:
	CMP AL,0DH 	           ;enter
	JE	END_WHILE          

	CMP AL,39H 
	JG	LETTER	           ; nhay neu lon hon  

	AND AL,0FH 
	JMP SHIFT 
LETTER:
	CMP AL,60H
	JG  LETTER_1
	SUB AL,37H
	
    
SHIFT:
	SHL	BX,CL              ; gianh cho cho gia tri moi

	OR BL,Al               ; chen 
	INT 21H
	JMP WHILE_ 

LETTER_1:
    Mov ah,9
    Mov dx,offset msg_2
    Int 21h
    
    jmp WHILE_1:
    

	
END_WHILE:
    Mov ah,9
    Mov dx,offset msg_3
    Int 21h

    xor cx,cx
    Mov cx,19

WHILE_2:
    inc count
    cmp count,5
    je  SPACE    
    SHL bx,1
    jc  NUMBER_1  ; nhay neu co nho 1
    jnc NUMBER_0  ; nhay neu co nho 0
    
SPACE:
    Mov ah,2
    Mov dl,' '
    Int 21h
    mov count,0
    loop WHILE_2 
        
NUMBER_0:
    Mov ah,2
    Mov dl,'0'
    Int 21h
    loop WHILE_2
      
NUMBER_1:
    Mov ah,2
    Mov dl,'1'
    Int 21h
    loop WHILE_2   

   

DOS:
    Mov ah,4ch
    Int 21h