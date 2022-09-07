INCLUDE Irvine32.inc


.data

rNumber REAL4 ?
 msg1 BYTE "Please enter the foat value: ",0
 Positive1 BYTE 1,0
 Negative1 BYTE -1,0

.code
main PROC
	FINIT

	mov edx,OFFSET msg1
	call WriteString
	call ReadFloat
	call CRLF

	call SHOWFPUSTACK
	FSTP rnumber

	push rNumber
	call ConvertTOBinary

	exit
main ENDP

ConvertTOBinary PROC

	Enter 4,0

	FLD REAL4 PTR [ebp+8]
	;call WriteBin
	FLDZ
	FCOMP
	FNSTSW ax
	SAHF
	mov edx,REAL4 PTR [ebp+8]
	call WriteBin
	jb l1
	movsx eax,Negative1
	call WriteInt
	

l1:
	movsx eax,Positive1
	call WriteInt

	mov edx,REAL4 PTR [ebp+8]
	;call WriteBin
	call CRLF

	leave

ConvertTOBinary ENDP






END main