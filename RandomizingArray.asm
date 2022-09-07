include irvine32.inc

.data
array WORD 20 DUP(0)
sum WORD 1
space BYTE " ,",0

wVals WORD 1000h, 3456h, 0E4h, 9E4Fh
bVal1 BYTE 9Eh
dVals DWORD 215498EAh, 9382h, 12345678h

.code

main PROC

    mov eax, 0
	mov ax, wvals + 1101b
	call WriteHex
	exit
main ENDP

PopulateArray PROTO,
	ptrArray: DWORD,
	numRows: DWORD,
	numCols: DWORD

PopulateArray PROC,
	ptrArray:  DWORD,
	numRows: DWORD,
	numCols: DWORD

	pushad
	pushfd

	call Randomize

	mov esi, ptrArray
	mov ecx, numRows
OL:
	push ecx
	mov ecx, numCols
	
	mov edi, 0
IL:
	mov eax, 1000
	sub eax, -1000
	inc eax
	call RandomRange
	add eax, -1000

	mov [esi+edi], eax
	inc edi
	loop IL

	add esi, edi
	pop ecx
	loop OL

	popfd
	popad

	ret 12
PopulateArray ENDP
END main