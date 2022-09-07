INCLUDE Irvine32.inc




calPeri PROTO,
	myHeight:REAL4
	myWidth:REAL4
	



.data
rectWidth REAL4 ?
rectHeight REAL4 ?
rectArea REAL4 ?
areaPerimRatio REAL4 ?


msg1 BYTE "Please enter the rectangle width: ",0
msg2 BYTE "Please enter the rectangle height: ",0
msg3 BYTE "The area of the rectangle is: ", 0
msg4 BYTE "The perimeter of the rectangle is: ", 0
msg5 BYTE "The ratio of width/height is: ", 0


	
.code
main PROC
	FINIT
AskUser:
	mov edx,OFFSET msg1
	call WriteString
	
	call ReadFloat
	FLDZ
	FCOMP 
	FNSTSW ax
	SAHF
	jb StoreWidth
	FFREE ST(0)
	jmp AskUser


StoreWidth:
	call SHOWFPUSTACK
	FSTP rectWidth

	

AskAgain:
	mov edx,OFFSET msg2
	call WriteString
	call ReadFloat
	FLDZ
	FCOMIP ST(0),ST(1)
	jb StoreHeight
	FABS
	
	
	


StoreHeight:
	;call SHOWFPUSTACK
	FSTP rectHeight

	push rectHeight
	push rectWidth
	call calArea
	mov edx,OFFSET msg3
	call WriteString
	call WriteFloat
	call CRLF
	;FSTP rectArea
	

	



	

	
	
	exit
main ENDP

calArea PROC

	push ebp
	mov ebp,esp
	sub esp,4

	mov eax,DWORD PTR [ebp-4]
	FLD REAL4 PTR [ebp+8]
	FLD REAL4 PTR [ebp+12]

	FMUL

	pop ebp
	ret 8

calArea ENDP

calPeri PROC,
	myHeight:REAL4,
	myWidth:REAL4
LOCAL factor:DWORD
	 
	
	mov factor,2
	FLD myHeight
	
	
	FLD myWidth
	

	FADD
	
	



calPeri ENDP





END main