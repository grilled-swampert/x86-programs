DATA SEGMENT
    ARR DB 00, 01       ; Initialize the first two elements of the sequence
    FIBO DB 12 DUP(?)   ; Reserve space for Fibonacci sequence
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE      
    
    START:
        MOV AX, DATA
        MOV DS, AX      ; Initialize DS to point to the data segment
    
        MOV AL, [ARR]   ; AL now has the 1st number from the sequence
        LEA SI, FIBO    ; Making the SI point to the output location
        MOV [SI], AL    ; Moving 0 into the first position
        INC SI          ; Increment SI to point to the next memory location
    
        MOV AL, [ARR+1] ; Now, AL has the 2nd element of the sequence
        MOV [SI], AL    ; Moving 01H into the 2nd position
        INC SI          ; Increment SI to point to the next memory location
    
        MOV CX, 8H      ; Initialize CX with the number of iterations
    L1:
        MOV AL, [SI-1]  ; Moves the element in the (i-1)th position into AL
        ADD AL, [SI]    ; Moves the (i)th element with the (i-1)th element already present in AL
        INC SI          ; Increment SI to point to the next position
        MOV [SI], AL    ; Store the sum in the new position  
        MOV [SI-4], AL
        LOOP L1         ; Decrement CX and jump to L1 if CX is not zero
        
        MOV [SI-3], 0H
    
        INT 20H         ; DOS Interrupt
    
    CODE ENDS
END START

