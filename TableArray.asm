;Patel Jayraj 
INCLUDE Irvine32.inc



.data

NUM_ROWS=5
NUM_COLS=8
Array SWORD NUM_ROWS*NUM_COLS DUP(?)
plus BYTE " + ",0
equal BYTE " = ",0
msg1 BYTE "DONE",0

.code
main PROC
	call Randomize



	push NUM_COLS
	push NUM_ROWS
	push OFFSET Array
	call popRandom

	push NUM_COLS
	push NUM_ROWS
	push OFFSET Array
	call totalRows

	mov edx,OFFSET msg1
	call WriteString
	call Crlf
	exit
main ENDP
	
popRandom PROC

	push ebp
	mov ebp,esp
	sub esp,4

	mov esi,[ebp+8]
	mov ecx,[ebp+12]                ;Countering the loop by the number of rows
	
Firstloop:
	push ecx
	mov edi,0
	mov ecx,[ebp+16]               ;Countering the loop by the numbert of columns
SecondLoop: 
	
	mov eax,(200-(-100)+1)
	call RandomRange
	add eax,-100
	mov [esi+edi],ax              ;base + index
	;call WriteInt
	;call Crlf
	
	
	add edi,TYPE SWORD 

	loop SecondLoop

	add esi,edi
	pop ecx
	loop FirstLoop
	
	mov esp,ebp
	pop ebp
	ret 12

popRandom ENDP
	
totalRows PROC
	Enter 4,0

	mov esi,[ebp+8]
	mov ecx,[ebp+12]

OutLoop:
	push ecx
	mov SWORD PTR [ebp-4],0
	mov edi,0
	mov ecx,[ebp+16]
	dec ecx							  ;that will eliminate the last item for perfect formating
InnerLoop:
	movsx eax,  SWORD PTR [esi+edi]	  ;System.out.print(array[i][j])
	
	call WriteInt

	mov edx,OFFSET plus
	call WriteString
	
	add [ebp-4],eax                     ;total
	add edi,TYPE SWORD

	loop InnerLoop
	movsx eax,  SWORD PTR [esi+edi]	   ;System.out.print(array[i][j])
	
	call WriteInt
	add edi,TYPE SWORD	

	add [ebp-4],eax                    ;total

	mov edx,OFFSET equal
	call WriteString
	mov eax,[ebp-4]
	call WriteInt
	call Crlf

	add esi,edi
	pop ecx
	loop OutLoop

	leave
	
totalRows ENDP




END main