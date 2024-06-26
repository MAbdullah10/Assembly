org 100h
.DATA
STARS DB 0
SPACE DW 1
COUNT DW 0
.CODE     

MOV AH,1 
INT 21H
MOV STARS,AL  

MOV AH,2
MOV DL,0DH
INT 21H

LOOP4: 
MOV AL,STARS
MOV AH,0   
SUB AX,30H
MOV CX,AX
           
LOOP1: 
MOV AH,2
MOV DL,'*'
INT 21H
LOOP LOOP1

MOV CX,SPACE
LOOP2:
MOV AH,2
MOV DL,' '
INT 21H 
LOOP LOOP2

MOV AL,STARS
MOV AH,0   
SUB AX,30H
MOV CX,AX
LOOP3: 
MOV AH,2
MOV DL,'*'
INT 21H
LOOP LOOP3 

MOV AH,2
MOV DL,0DH
INT 21H
MOV AH,2
MOV DL,0AH
INT 21H

DEC STARS
ADD SPACE,2
INC COUNT
CMP COUNT,5
JL LOOP4

RET




org 100h
.DATA
STARS DW ?

.CODE  
MOV AH,1
INT 21H
MOV AH,0
MOV STARS,AX
SUB STARS,30H 

MOV AH,2
MOV DL,0X0A
INT 21H
MOV AH,2
MOV DL,0X0D
INT 21H
   
MOV BX,0
MOV CX,0

LOOP1:
CMP BX,STARS
JL LOOP2
JMP EXIT

LOOP2:
CMP CX,BX
JLE PRINT
MOV AH,2
MOV DL,0X0A
INT 21H
MOV AH,2
MOV DL,0X0D
INT 21H
MOV CX,0
INC BX
JMP LOOP1   

PRINT:
MOV AH,2
MOV DL,'*'
INT 21H
inc CX
JMP LOOP2

EXIT:
RET



ORG 100H
.DATA
STARS DW 1
SPACE DW 1
A DW 1
B DW 1  
Lines dw 0
.CODE

MOV SPACE,5
LOOP1:
MOV AH,2
MOV DL,' '
INT 21H 
MOV BX,SPACE
CMP A,BX
JGE LOOP2
INC A
JMP LOOP1  

LOOP2:
MOV AH,2
MOV DL,'*'
INT 21H 
MOV AX,STARS
CMP B,AX
JGE LOOP3  
INC B  
XOR AX,AX
JMP LOOP2

LOOP3:
MOV AH,2
MOV DL,0X0A
INT 21H
MOV AH,2
MOV DL,0X0D
INT 21H
DEC SPACE
INC STARS
mov a,1
mov b,1  

INC Lines
CMP Lines,5
JL LOOP1

EXIT:
RET



ORG 100H
.DATA
STARS DW 1
SPACE DW 1
A DW 1
B DW 1  
Lines dw 0
.CODE

MOV STARS,5
LOOP1:
MOV AH,2
MOV DL,'*'
INT 21H 
MOV BX,STARS
CMP A,BX
JGE LOOP2
INC A
JMP LOOP1  

LOOP2:
MOV AH,2
MOV DL,' '
INT 21H 
MOV AX,SPACE
CMP B,AX
JGE LOOP3  
INC B  
XOR AX,AX
JMP LOOP2

LOOP3:
MOV AH,2
MOV DL,0X0A
INT 21H
MOV AH,2
MOV DL,0X0D
INT 21H
DEC STARS
INC SPACE
mov a,1
mov b,1  

INC Lines
CMP Lines,5
JL LOOP1

EXIT:
RET


 ORG 100H
.DATA
STARS DW 5
SPACE DW 1
A DW 1
B DW 1
LINES DW 1

.CODE 

LOOP1:
MOV AH,2
MOV DL,"*"
INT 21H
MOV AX,STARS
CMP A,AX
JGE LOOP2
INC A
JMP LOOP1

LOOP2:
MOV AH,2
MOV DL,0X0A
INT 21H
MOV AH,2
MOV DL,0X0D
INT 21H 
JMP LOOP3

LOOP3:
MOV AH,2
MOV DL," "
INT 21H
MOV BX,SPACE
CMP B,BX 
INC B
JL LOOP3
DEC STARS
INC SPACE
MOV A,1
MOV B,1
INC LINES
CMP LINES,5
JLE LOOP1

EXIT:
RET


ORG 100H
.DATA
HEIGHT DB 50
COUNT DB 1

.CODE
CALL NEWLINE
CALL NEWLINE

LOOP1:      
MOV CH,0  
MOV CL,COUNT    
LOOP2:
CALL PRINT
LOOP LOOP2
CALL NEWLINE
CALL MULT  
MOV CL,HEIGHT
CMP COUNT,CL
JLE LOOP1
RET

PRINT PROC
    MOV AH,2
    MOV DL,"*"
    INT 21H
    RET
MULT PROC
    SHL COUNT,1
    RET
NEWLINE PROC
    MOV AH,2
    MOV DL,0X0A
    INT 21H     
    MOV AH,2
    MOV DL,0X0D
    INT 21H
    RET

