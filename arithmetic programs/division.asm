DATA SEGMENT
    NUM1 DW 000CH           ; Define a word (16-bit) variable NUM1 with initial value
    NUM2 DW 0005H           ; Define a word (16-bit) variable NUM2 with initial value
    QUO DW ?                ; Define a word variable quo without initializing it (for quotient)
    REM DW ?                ; Define a word variable rem without initializing it (for remainder)
DATA ENDS

ASSUME CS:CODE, DS:DATA

CODE SEGMENT
    START:                  ; Label indicating the start of the code
        MOV AX, DATA        ; Move the address of the data segment into the AX register
        MOV DS, AX          ; Move the contents of AX into the data segment register (DS)

        MOV AX, NUM1        ; Move the value of NUM1 into the AX register
        MOV BX, NUM2        ; Move the value of NUM2 into the BX register

        XOR DX, DX          ; Clear the DX register to prepare for the 16-bit by 16-bit division

        DIV BX              ; Divide the contents of DX:AX by the contents of BX
                            ; The quotient will be stored in AX, and the remainder in DX

        MOV QUO, AX         ; Move the quotient (in AX) into the variable QUO
        MOV REM, DX         ; Move the remainder (in DX) into the variable REM

        INT 20H             ; Generate an interrupt to terminate the program
    CODE ENDS
END START
