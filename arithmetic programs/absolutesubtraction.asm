DATA SEGMENT             ; Start of the data segment
    NUM1 DW 0008H         ; Define a word variable NUM1 and initialize it with 0005H (5 in decimal)
    NUM2 DW 0005H         ; Define a word variable NUM2 and initialize it with 0013H (13 in decimal)
    RESULT DW ?            ; Define a word variable RESULT without initializing it
DATA ENDS                ; End of the data segment

ASSUME CS:CODE, DS:DATA  ; Set the code segment to CS and the data segment to DS

CODE SEGMENT             ; Start of the code segment
    START:               ; Entry point of the program
        MOV AX, DATA     ; Move the address of the data segment into the AX register
        MOV DS, AX       ; Move the contents of AX (address of the data segment) into the DS register
        
        MOV AX, NUM1     ; Move the value of NUM1 into the AX register
        CMP AX, NUM2     ; Compare NUM1 with NUM2
        JNC SUBTRACT     ; Jump if NUM2 is less than NUM1
        
        MOV AX, NUM2     ; Move NUM2 into AX if NUM2 is greater than NUM1
        SUB AX, NUM1     ; Subtract NUM1 from AX(NUM2)
        JMP DONE         ; Jump to the end
        
    SUBTRACT:
        MOV AX, NUM1     ; Move NUM2 into AX if NUM1 is greater than NUM2
        SUB AX, NUM2     ; Subtract NUM1 from AX
        
    DONE:
        MOV RESULT, AX   ; Move the result into the RESULT variable
        
        INT 20H          ; Interrupt to terminate the program
    END START            ; End of the program
CODE ENDS                ; End of the code segment
