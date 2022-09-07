INCLUDE Irvine32.inc

.data 
array BYTE 25,0
sum DWORD ?
smallest DWORD ?
msg1 BYTE "The array has been populated with random number",0
msg2 BYTE "The sum of the array is ",0
msg3 BYTE "The average of the array is ",0
msg4 BYTE "The smallest element is ",0
.code
main PROC
	call Randomize
	mov ecx,LENGTHOF array
	mov esi,OFFSET  array
l1:
	mov eax,(80-15+1)
	call RandomRange
	add eax,15
	mov  BYTE PTR [esi],al
	add esi,TYPE BYTE
	loop l1

	mov edx,OFFSET msg1
	call WriteString 
	call CRLF

	mov ecx,LENGTHOF array
	movsx eax,array
l2:
	movsx eax,array[edi*TYPE BYTE]
	add sum,eax
	loop l2
	mov edx,OFFSET msg2
	call WriteString
	call WriteInt
	call CRLF

	mov edx,0
	mov edx,OFFSET msg3
	call WriteString
	push LENGTHOF array
	push sum
	call CalculateAverage
	call WriteInt
	call CRLF

l3:
    cmp eax,smallest
	JNB l4
	mov smallest,eax

l4:
	inc eax
	loop l3

	call SHOWFPUSTACK



	
	exit
main ENDP
CalculateAverage PROC,
	total:DWORD,
	count:DWORD

	FILD total
	FILD count
	FDIV
	ret 4

CalculateAverage ENDP

END main