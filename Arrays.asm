ORG 100H
.DATA
ARR DW 12DUP(0)

.CODE   
MOV [ARR],0
MOV [ARR+1],1
MOV BX,2
MOV CX,12

DISPLAY:
MOV AX,[ARR+BX-1]
ADD AX,[ARR+BX-2]
MOV [ARR+BX],AX
INC BX
LOOP DISPLAY 
RET


ORG 100H
.data
 ARR Dw 7,5,11,9
 count dw 0
 size dw 0x4

.code
 DEC size
 
 LOOP1:
 LEA BX,ARR
 MOV CX,size
 XOR AX,AX
 MOV DX,0
 CMP count,CX
 JL LOOP2
 JMP EXIT
 
 LOOP2:
 MOV AX,[BX+2]
 CMP [BX],AX
 JG SWAP

 NEXT:
 ADD BX,2
 LOOP LOOP2 
 INC count
 JMP LOOP1
 
 SWAP:
 PUSH [BX]
 PUSH [BX+2]
 POP [BX]
 POP [BX+2]
 JMP NEXT
 
 EXIT:
 Ret


ORG 100H
.DATA
ARR DW 10DUP(0)     

.CODE
XOR AX,AX
XOR BX,BX
XOR CX,CX
XOR DX,DX
XOR SI,SI

MOV SI,0
MOV CX,10
INPUT:
MOV AH,1
INT 21H
MOV AH,0 
MOV [ARR+SI],AX
ADD SI,2
CMP AX,8 
JE EXIT
LOOP INPUT

XOR AX,AX
MOV CX,10
ADD:
ADD AX,[ARR+SI]
ADD SI,2
LOOP ADD
EXIT:
RET
