.code
 MOV CX,'6' 
CMP CX,97
JGE CONDITION_1
 
CMP CX,65
JGE  CONDITION_2   
        
MOV AX,0
JMP EXIT
        
CONDITION_1:
  CMP CX,122
  JLE CONDITION_3     
  
  MOV AX,0
  JMP EXIT
     
CONDITION_2:
  CMP CX,90
  JLE CONDITION_4
   
  MOV AX,0
  JMP EXIT
CONDITION_3:      
  MOV AX,-1 
  JMP EXIT
                  
CONDITION_4:
  MOV AX,1   
  JMP EXIT
   
EXIT:
