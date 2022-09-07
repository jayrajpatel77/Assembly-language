INCLUDE Irvine32.inc



.data
msg1 BYTE "Array1 has been filed with the random number: ",0
array1 BYTE 12 DUP(?)
array2 BYTE 12 DUP(?)
msg2 BYTE " [ ",0
msg3 BYTE " ] ",0
msg4 BYTE " , ",0
.code
main PROC
	call Randomize

	mov ecx,LENGTHOF array1
	mov edi,0
	Loop1:
		mov eax,101
		call RandomRange
		mov array1[edi*TYPE array1],al
		inc edi
		loop Loop1

	mov edx,OFFSET msg1
	call WriteString
	call Crlf

	mov ecx,LENGTHOF array1
	mov esi,OFFSET array1
	call printArray


	mov edi ,OFFSET array2
	mov esi ,OFFSET array1
	mov ecx,LENGTHOF array2
	call reserveArray





 exit

main ENDP


printArray PROC

	mov edx,OFFSET msg2
	call WriteString

	l2:
		movsx eax, BYTE ptr [esi]
		call WriteDec
		add esi,TYPE BYTE
		mov edx,OFFSET msg4
		call WriteString
		loop l2
		

	mov edx,OFFSET msg3
	call WriteString

	ret
printArray Endp


reserveArray PROC
	
	add edi,[ecx*TYPE array2]
	dec edi
	mov eax,[edi]
	call WriteDec

	push esi
	push edi





	pop edi
	pop esi

	ret
reserveArray ENDP
	

END main