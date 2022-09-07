INCLUDE Irvine32.inc

.data
	array SWORD 75 DUP(?)
	sum DWORD ?
	largest SWORD ?

	popMssg BYTE "The array has been populated with random numbers!", 0
	sumMssg BYTE "The sum of the array is ", 0
	avgMssg BYTE "The average of the array is ", 0
	lrgMssg BYTE "The largest element is ", 0

.code
main PROC
	call Randomize

	mov ecx, LENGTHOF array
	mov esi, OFFSET array
L1:
	mov eax, 450
	sub eax, -125
	inc eax
	call RandomRange
	add eax, -125

	mov SWORD PTR [esi], ax
	add esi, TYPE SWORD
	loop L1

	mov edx, OFFSET popMssg
	call WriteString
	call CrLf

	mov ecx, LENGTHOF array
	mov edi, 0
	movsx eax, array
	mov largest, ax
L2:
	movsx eax, array[edi * TYPE SWORD]
	add sum, eax

	cmp ax, largest
	jna skip
	mov largest, ax

skip:
	inc edi
	loop L2

	mov edx, OFFSET sumMssg
	call WriteString
	mov eax, sum
	call WriteInt
	call CrLf

	mov edx, OFFSET avgMssg
	call WriteString
	push LENGTHOF array
	push sum
	call CalculateAverage
	call WriteFloat
	FFREE ST(0)
	call CrLf

	mov edx, OFFSET lrgMssg
	call WriteString
	movzx eax, largest
	call WriteInt

	call ShowFPUStack
	exit
main ENDP

CalculateAverage PROC,
	total: DWORD,
	count: DWORD

	FILD count
	FILD total

	FDIV

	ret 4
CalculateAverage ENDP
end MAIN