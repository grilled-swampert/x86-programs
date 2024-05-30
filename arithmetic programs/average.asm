DATA SEGMENT
    NUMBERS DB 10, 20, 30, 40, 50, 60, 70, 80, 90, 100  ; Sample data
    RESULT DW ?     ; Variable to store the result
    COUNT DW 000AH     ; Number of elements   
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:
        MOV AX, @DATA   ; Initialize DS register
        MOV DS, AX
    
        MOV SI, OFFSET NUMBERS  ; Point SI to the start of numbers array
        MOV CX, COUNT   ; Set CX to the number of elements
        MOV BX, 0       ; Initialize BX to store sum
    
        ; Loop to calculate the sum
    SUM_LOOP:
        MOV AL, [SI]  ; Load the number into AL
        ADD BX, AX    ; Add AL to BX (sum)
        INC SI        ; Move to the next number
        LOOP SUM_LOOP ; Repeat for all numbers
    
        ; Calculate the average
        MOV AX, BX       ; Move the sum to AX
        MOV DX, 0        ; Clear DX for division
        DIV COUNT        ; Divide AX by count
        MOV RESULT, AX   ; Store the result in 'result' variable   
        MOV AH, 00
        MOV DX, AX
  
    
        ; Terminate the program
        MOV AH, 4Ch      ; DOS function to terminate program
        INT 21h
    CODE ENDS
END START