DATA SEGMENT
    NUMBERS DB 01H, 02H, 03H, 04H, 05H, 06H, 07H, 08H, 09H, 0AH
    RESULT DW 0  
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:
        MOV AX, @DATA
        MOV DS, AX
        
        MOV CX, 10          ; NUMBER OF ELEMENTS TO ADD
        LEA SI, NUMBERS     ; LOAD ADDRESS OF NUMBERS ARRAY
        XOR AX, AX          ; CLEAR AX REGISTER
        
    ADD_LOOP:
        ADD AL, [SI]        ; ADD THE VALUE AT SI TO AL
        ADC AH, 0           ; ADD CARRY TO AH
        INC SI              ; MOVE TO NEXT NUMBER
        LOOP ADD_LOOP       ; REPEAT FOR ALL NUMBERS
        
        MOV BX, AX        ; STORE RESULT IN MEMORY
        
        MOV AH, 4CH         ; EXIT PROGRAM
        INT 21H
    CODE ENDS
END START
