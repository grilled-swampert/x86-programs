DATA SEGMENT                     ; Start of the data segment
    REV DB 20 DUP(?)            ; Define a byte array named REV with 20 elements, uninitialized
DATA ENDS                       ; End of the data segment

CODE SEGMENT                     ; Start of the code segment
    ASSUME CS:CODE, DS:DATA      ; Assume CS:CODE and DS:DATA for segment addressing
    START:                       ; Program entry point label
        MOV AX, DATA             ; Move the address of the data segment to AX
        MOV DS, AX               ; Set the data segment register DS to the address in AX
        
        MOV SI, OFFSET REV       ; Move the offset address of REV to the source index register SI
        MOV BL, 0                ; Initialize BL to 0 (will be used to count the number of characters read)

        READ:                    ; Label for the reading loop
            MOV AH, 01H           ; Set AH to 01H for reading a character from standard input
            INT 21H               ; Call interrupt 21H to read a character from standard input
            
            CMP AL, 0DH           ; Compare the read character to carriage return (ASCII value 0DH)
            JE REVERSE            ; Jump to REVERSE if the read character is a carriage return
            
            MOV [SI], AL          ; Move the read character into the memory location pointed to by SI
            INC SI                ; Increment SI to point to the next memory location
            INC BL                ; Increment BL to count the number of characters read
            JMP READ              ; Jump back to READ to continue reading characters
        
        REVERSE:                  ; Label for reversing the string
            MOV CL, BL            ; Move the count of characters (stored in BL) to CL
        
        DISPLAY:                  ; Label for displaying the reversed string
            DEC SI                ; Decrement SI to point to the last character of the string
            MOV DX, [SI]          ; Move the character at the memory location pointed to by SI to DX
            
            MOV AH, 02H           ; Set AH to 02H for displaying a character to standard output
            INT 21H               ; Call interrupt 21H to display the character in DX
            
            LOOP DISPLAY          ; Repeat the DISPLAY loop until CX (count of characters) becomes zero
            
            MOV AH, 4CH           ; Set AH to 4CH for terminating the program
            INT 21H               ; Call interrupt 21H to terminate the program
    CODE ENDS                     ; End of the code segment
END START                         ; End of the program with the specified entry point at START
