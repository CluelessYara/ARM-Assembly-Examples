	PRESERVE8 
	THUMB
INITIAL_MSP EQU 0x20001000 ; Initial Main Stack Pointer Value   
    AREA  RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD INITIAL_MSP 
    DCD Reset_Handler
    ALIGN
SUMP  DCD SUM
SUMP2  DCD SUM2
N DCD 5

    AREA MYDATA, DATA, READWRITE
SUM   DCD 0
SUM2  DCD 0

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
function1 PROC  
	PUSH  {R5,LR}       
	MOV R5,#8
delay 
	SUBS R5, R5, #1 
	BNE delay 
	POP {R5,PC} 
	ENDP
Reset_Handler
	MOV  R0, #0x75 
	MOV  R3, #5 
	PUSH {R0, R3}  
	MOV  R0, #6 
	MOV  R3, #7 
	POP {R0, R3}  
Loop 
	ADD R0, R0, #1 
	CMP R0, #0x80 
	BNE Loop 
	MOV  R5, #9 ;; prepare for function call 
	BL  function1 
	MOV  R3, #12
STOP
    B STOP
    END
