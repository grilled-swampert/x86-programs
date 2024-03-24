DATA SEGMENT                  ; Start of the data segment
    ORIGINAL_DATA DB 10, 20, 30, 40, 50 ; Define an array named ORIGINAL_DATA with values 10, 20, 30, 40, 50
DATA ENDS                     ; End of the data segment

CODE SEGMENT                  ; Start of the code segment
    ASSUME CS:CODE, DS:DATA   ; Assume the code segment (CS) is CODE and the data segment (DS) is DATA
    START:                    ; Start of the program
        MOV AX, DATA          ; Move the address of the data segment into AX register
        MOV DS, AX            ; Move the value in AX (address of data segment) to the DS register (data segment register)

        MOV SI, 0000H         ; Move the immediate value 0000H (offset of ORIGINAL_DATA) into SI register (source index)
        MOV DI, 0060H         ; Move the immediate value 0060H (offset where data will be copied) into DI register (destination index)
        MOV CX, 5             ; Move the immediate value 5 into CX register (loop counter, number of elements to copy)

    COPY_LOOP:                ; Label for the copy loop
        MOV AL, [SI]          ; Move the byte at memory address pointed by SI into AL register (source)
        MOV [DI], AL          ; Move the byte in AL register to the memory location pointed by DI (destination)
        INC SI                ; Increment SI to point to the next element in the source array
        INC DI                ; Increment DI to point to the next location in the destination array
        LOOP COPY_LOOP        ; Decrement CX (loop counter), if not zero, jump to COPY_LOOP label

        MOV AH,4CH            ; Move the immediate value 4CH (terminate program) into AH register (function code)
        INT 21H               ; Call interrupt 21H (DOS interrupt) to terminate the program

    CODE ENDS                 ; End of the code segment
END START                     ; End of the program, indicating START as the entry point
