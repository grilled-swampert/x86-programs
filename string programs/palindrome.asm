DATA SEGMENT                                 ; Start of data segment
    MSG1 DB "ENTER THE STRING: $"            ; Define string constant for input prompt
    MSG2 DB "ENTERED STRING: $"              ; Define string constant for displaying entered string
    MSG3 DB " IS A PALINDROME.$"             ; Define string constant for palindrome message
    MSG4 DB " IS NOT A PALINDROME.$"         ; Define string constant for not palindrome message
    
    STR DB 10 DUP (?)                        ; Define buffer to store the input string
    
    DISPLAY MACRO MSG                        ; Macro to display a string
        LEA DX, MSG                          ; Load effective address of the message into DX
        MOV AH, 09H                          ; Set AH to 09H (Display String Function)
        INT 21H                              ; Call interrupt to display the message
    ENDM
    
    INPUT MACRO VAR                          ; Macro to read a character from input
        MOV AH, 01H                          ; Set AH to 01H (Read Character from Standard Input)
        INT 21H                              ; Call interrupt to read character
        MOV VAR, AL                          ; Move the input character to the specified variable
    ENDM
DATA ENDS                                   ; End of data segment

CODE SEGMENT                                ; Start of code segment
    ASSUME DS:DATA, CS:CODE                 ; Set up segment registers
    
    START:                                  ; Start of program
        MOV AX, DATA                        ; Move the address of the data segment to AX
        MOV DS, AX                          ; Set DS to the address of the data segment
        
        DISPLAY MSG1                        ; Display input prompt
        
        MOV SI, 0                           ; Initialize SI to 0 for string index
        
        READ_INPUT:                         ; Read input loop
            INPUT AL                         ; Read a character from input
            
            CMP AL, 0DH                      ; Compare the read character to carriage return
            JE OUTPUT                        ; If carriage return, jump to output
            
            MOV [STR+SI], AL                 ; Move the input character to the string buffer
            INC SI                           ; Increment SI for next character
            JMP READ_INPUT                   ; Continue reading input
        
        OUTPUT:                              ; Output section
            MOV [STR+SI], "$"                ; Add null terminator to the end of the string
            DISPLAY MSG2                     ; Display entered string message
            DISPLAY STR                      ; Display the entered string
            
            DEC SI                            ; Decrement SI to last character index
            MOV DI, 0                         ; Initialize DI to 0 for string index
        
        TEST_STRINGS:                        ; Test palindrome loop
            MOV AL, [STR+SI]                  ; Move character from end of string to AL
            MOV BL, [STR+DI]                  ; Move character from start of string to BL
            CMP AL, BL                        ; Compare characters
            JNE NOT_PALINDROME                ; If not equal, jump to not palindrome
            
            INC DI                            ; Increment DI for next character from start
            DEC SI                            ; Decrement SI for next character from end
            CMP SI, 0                         ; Compare if end of string is reached
            JG TEST_STRINGS                   ; If greater than 0, continue testing
            
            DISPLAY MSG3                      ; Display palindrome message
            JMP EXIT                          ; Jump to program exit
         
        NOT_PALINDROME:                      ; Not palindrome message
            DISPLAY MSG4                      ; Display not palindrome message
        
        EXIT:                                 ; Program exit
            MOV AH, 4CH                       ; Set AH to 4CH (Terminate with Return Code)
            INT 21H                           ; Call interrupt to terminate program
    CODE ENDS                                ; End of code segment
END START                                   ; End of program
