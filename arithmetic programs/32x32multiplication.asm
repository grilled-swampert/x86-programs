DATA SEGMENT
    A DW 0001H     ; Declare a word-sized variable A with initial value 0001H
    B DW 1111H     ; Declare a word-sized variable B with initial value 1111H
    C DW 3344H     ; Declare a word-sized variable C with initial value 3344H
    D DW 5566H     ; Declare a word-sized variable D with initial value 5566H
    RESULT DW 4 DUP (0) ; Declare a word-sized array RESULT with 4 elements, all initialized to 0
DATA ENDS

CODE SEGMENT
    START:
        ASSUME CS:CODE, DS:DATA  ; Assume that the code segment register (CS) points to CODE segment and data segment register (DS) points to DATA segment
        MOV AX, DATA             ; Move the offset of the DATA segment into the AX register
        MOV DS, AX               ; Move the content of AX into the DS register, thus setting DS to point to the DATA segment
        
        MOV AX, B                ; Move the value of B into the AX register
        MUL D                    ; Multiply the value in AX by the value of D
        MOV RESULT, AX           ; Move the result of the multiplication into the first element of the RESULT array
        MOV RESULT+2, DX         ; Move the remainder of the multiplication into the third element of the RESULT array
        
        MOV AX, A                ; Move the value of A into the AX register
        MUL D                    ; Multiply the value in AX by the value of D
        ADD RESULT+2, AX         ; Add the result of the multiplication to the third element of the RESULT array
        ADC RESULT+4, DX         ; Add the carry (if any) from the previous addition to the fifth element of the RESULT array
        
        MOV AX, B                ; Move the value of B into the AX register
        MUL C                    ; Multiply the value in AX by the value of C
        ADD RESULT+2, AX         ; Add the result of the multiplication to the third element of the RESULT array
        ADC RESULT+4, DX         ; Add the carry (if any) from the previous addition to the fifth element of the RESULT array
        
        MOV AX, A                ; Move the value of A into the AX register
        MUL C                    ; Multiply the value in AX by the value of C
        ADD RESULT+4, AX         ; Add the result of the multiplication to the fifth element of the RESULT array
        ADC RESULT+6, DX         ; Add the carry (if any) from the previous addition to the seventh element of the RESULT array
        
        INT 20H                  ; Generate an interrupt 20H, which typically terminates the program
        HLT                      ; Halt the processor
    CODE ENDS
END START
