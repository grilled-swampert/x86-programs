DATA SEGMENT
    SOURCE DB 'HELLO$'
DATA ENDS
        
ASSUME CS:CODE, DS:DATA

CODE SEGMENT
    START: 
        MOV AX, DATA
        MOV DS, AX
        
        MOV SI, OFFSET SOURCE
        MOV DI, 5400H
        MOV CX, 5
         
    COPY_LOOP:
        MOV AL, [SI]          
        MOV [DI], AL          
        INC SI                
        INC DI                           
        LOOP COPY_LOOP 
        JMP CONTINUE
    
    CONTINUE:
        MOV SI, 5400H
        MOV DI, 6400H
        MOV CX, 5
        MOV BX, 4        
        
    REVERSE_STRING:
        MOV AL, [SI+BX]
        MOV [DI], AL
        INC DI
        DEC BX
        LOOP REVERSE_STRING
        
        INT 20H
    CODE ENDS
END START    
