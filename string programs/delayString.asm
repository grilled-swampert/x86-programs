DATA SEGMENT                ; Start of the data segment
    MSG1 DB "DARTH", 13, 10, '$'  ; Define MSG1 with the string "DARTH" followed by carriage return (13), line feed (10), and null terminator ('$')
    MSG2 DB "VADER", 13, 10, '$'  ; Define MSG2 with the string "VADER" followed by carriage return (13), line feed (10), and null terminator ('$')
DATA ENDS                   ; End of the data segment

CODE SEGMENT                ; Start of the code segment
    ASSUME CS:CODE, DS:DATA ; Assume CS is CODE segment and DS is DATA segment
START:                      ; Start of the main program
    MOV AX, DATA            ; Move the address of the DATA segment to AX
    MOV DS, AX              ; Move the address of the DATA segment to DS
    
    MOV AH, 09H             ; Set AH register to 09H for printing string
    
    ; Display MSG1
    LEA DX, MSG1            ; Load effective address of MSG1 into DX
    INT 21H                 ; Call interrupt 21H to print MSG1 

    ; Display MSG2 without delay
    LEA DX, MSG2            ; Load effective address of MSG2 into DX
    INT 21H                 ; Call interrupt 21H to print MSG2

    ; Display MSG1
    LEA DX, MSG1            ; Load effective address of MSG1 into DX
    INT 21H                 ; Call interrupt 21H to print MSG1 
    
    CALL DELAY 
    
    ; Display MSG2 with delay
    LEA DX, MSG2            ; Load effective address of MSG2 into DX
    INT 21H                 ; Call interrupt 21H to print MSG2

    MOV AH, 4Ch             ; Set AH register to 4Ch for program termination
    INT 21H                 ; Call interrupt 21H to terminate the program

DELAY PROC
    MOV CX, 1000H           ; Set delay count
BACK:
    LOOP BACK               ; Loop for delay
    RET
DELAY ENDP

CODE ENDS                   ; End of the code segment
END START                   ; End of the main program
