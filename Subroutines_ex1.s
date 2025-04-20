	PRESERVE8 
	THUMB
    AREA  RESET, DATA, READONLY
    EXPORT __Vectors
		
__Vectors
    DCD 0x20001000 
    DCD Reset_Handler
    ALIGN
SUMP  DCD SUM
SUMP2 DCD SUM2
N     DCD 5

    AREA MYDATA, DATA, READWRITE
SUM   DCD 0
SUM2  DCD 0
	AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
SUMUP PROC
	ADD  R0, R0, R1 ;Add number into R0 
	SUBS  R1, R1, #1;Decrement loop counter R1 
	BGT  SUMUP   
	;MOV  PC, LR 
	BX  LR 
	ENDP
Reset_Handler
	LDR  R1, N   
	MOV  R0, #0 
	BL SUMUP 
	LDR  R3, SUMP 
	STR  R0, [R3] 
	LDR  R4, [R3] 
	MOV R7, #8
	LDR R5, SUMP2
	STR R7, [R5]
	LDR R6, [R5]
STOP
	B STOP
	END
	 
