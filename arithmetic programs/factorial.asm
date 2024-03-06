DATA SEGMENT
    NUM DW 7        ; Input number whose factorial is to be found
    FACT DW ?       ; Variable to store the factorial result
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE      ; Set up data segment and code segment registers
    START:
        MOV AX, DATA             ; Load the data segment address into AX register
        MOV DS, AX               ; Move the data segment address into the DS register
    
        MOV AX, NUM              ; Load the input number into AX register
        MOV CX, AX               ; Initialize CX register with the input number
        MOV AX, 1                ; Initialize AX with 1 (starting value for factorial)
    
    CALCULATE_FACTORIAL:
        MUL CX                   ; Multiply AX by CX
        LOOP CALCULATE_FACTORIAL ; Decrement CX and loop until it becomes zero
    
        MOV FACT, AX             ; Store the factorial result in 'fact'
        INT 20H                  ; Call DOS interrupt 20h to terminate the program
    CODE ENDS

END START
