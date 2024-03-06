DATA SEGMENT
    NUM1 DW 0002H    ; Define a word-sized variable NUM1 with initial value 0002H
    NUM2 DW 0003H    ; Define a word-sized variable NUM2 with initial value 0003H
    QUO DW ?         ; Define a word-sized variable QUO to store quotient without initializing it
    REM DW ?         ; Define a word-sized variable REM to store remainder without initializing it
DATA ENDS

ASSUME CS:CODE, DS:DATA  ; Assume that the code segment register (CS) points to CODE segment and data segment register (DS) points to DATA segment

CODE SEGMENT
START:
    MOV AX, DATA     ; Move the offset of the DATA segment into the AX register
    MOV DS, AX       ; Move the contents of AX into the data segment register (DS)
    
    MOV AX, NUM1     ; Move the value of NUM1 into the AX register
    MOV BX, NUM2     ; Move the value of NUM2 into the BX register
    
    XOR DX, DX       ; Clear the DX register to prepare it for division
    
    MUL BX           ; Multiply AX by BX, result stored in DX:AX
    
    MOV QUO, AX      ; Move the quotient (in AX) into the QUO variable
    MOV REM, DX      ; Move the remainder (in DX) into the REM variable
    
    INT 20H          ; Generate an interrupt 20H, typically used to terminate the program
CODE ENDS

END START           ; End the program, indicating that execution should start at the 'START' label

