        PRESERVE8
        THUMB
        AREA RESET, DATA, READONLY
        EXPORT __Vectors

__Vectors
        DCD 0x20001000        ; Stack pointer
        DCD Reset_Handler     ; Reset vector
        ALIGN

        AREA MYCODE, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler
factorial PROC
        PUSH    {R1, LR}      ; Save R1 and return address

        CMP     R1, #1
        BLE     base_case     ; if R1 <= 1, return 1

        SUB     R1, R1, #1    ; R1 = R1 - 1
        BL      factorial     ; Recursive call: result returned in R0
        POP     {R1}          ; Restore original R1 (n)
        MUL     R0, R0, R1    ; R0 = R0 * n
        POP     {PC}

base_case
        MOV     R0, #1     
        BX      LR
        ENDP

Reset_Handler
        MOV     R1, #5        
        BL      factorial     ; Call factorial subroutine
STOP
		B STOP
		END
