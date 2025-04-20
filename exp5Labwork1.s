	PRESERVE8 
	THUMB
INITIAL_MSP EQU 0x20001000 ; Initial Main Stack Pointer Value   
    AREA  RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD INITIAL_MSP 
    DCD Reset_Handler
    ALIGN
string  DCB "ARMassemblylanguageisimportanttolearn!", 0

    AREA MYDATA, DATA, READWRITE
vowelCount  DCD 0
nonVowelCount DCD 0

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
is_vowel PROC  
	PUSH {R0, R1, R5}
    MOV R4, #0             ; Assume not a vowel

    ; Check lowercase and uppercase vowels
    MOV R5, #'A'
    CMP R1, R5
    BEQ isv
    MOV R5, #'E'
    CMP R1, R5
    BEQ isv
    MOV R5, #'I'
    CMP R1, R5
    BEQ isv
    MOV R5, #'O'
    CMP R1, R5
    BEQ isv
    MOV R5, #'U'
    CMP R1, R5
    BEQ isv
    MOV R5, #'a'
    CMP R1, R5
    BEQ isv
    MOV R5, #'e'
    CMP R1, R5
    BEQ isv
    MOV R5, #'i'
    CMP R1, R5
    BEQ isv
    MOV R5, #'o'
    CMP R1, R5
    BEQ isv
    MOV R5, #'u'
    CMP R1, R5
    BEQ isv
    B notv

isv
    MOV R4, #1             ; It's a vowel

notv
    POP {R0, R1, R5}
    BX LR
	ENDP
Reset_Handler
    LDR R0, =string        ; R0 points to the string
    MOV R2, #0             ; R2 = vowel counter
    MOV R3, #0             ; R3 = non-vowel counter

next_char
    LDRB R1, [R0], #1      ; Load next character into R1 and increment R0
    CMP R1, #0             ; Check for null terminator
    BEQ done               ; If zero, end of string

    BL  is_vowel           ; Check if R1 is a vowel, result in R4

    CMP R4, #1             ; If R4 == 1, it's a vowel
    ADDNE R3, R3, #1       ; Else increment non-vowel count
    ADDEQ R2, R2, #1       ; If vowel, increment vowel count

    B next_char

done
    LDR R5, =vowelCount
    STR R2, [R5]           ; Store vowel count
    LDR R6, =nonVowelCount
    STR R3, [R6]           ; Store non-vowel count
STOP
    B STOP
    END
