;Patel Jayraj

INCLUDE Irvine32.inc
SumColoumnOfArray PROTO,
	columns:BYTE,
	rows:BYTE,
	array1:SWORD,
	coloumnIndex:DWORD


.data
NUM_ROWS=3
NUM_COLS=3
array SWORD NUM_ROWS*NUM_COLS DUP(?)
pipe BYTE " | ",0
comma BYTE " , ",0
msg1 BYTE "Please enter columnindex(starting from 0) you want sum for ",0
msg2 BYTE "Sum of Elements: ",0

.code
main PROC
	call Randomize
	
	
	push NUM_COLS                  ;pushing the row and columns
	push NUM_ROWS                  
	;push OFFSET array
	call populateArray             ;calling the populateArray
	call CRLF
	
	
	push NUM_COLS                  ;pushing columns and rows
	push NUM_ROWS
	push OFFSET array              ;prserving the array
	call PrintArray                ;calling PrintArray
	call CRLF

	mov edx, OFFSET msg1           ;Asking the user for the column
	call WriteString
	call ReadDec                   ;Reading Decimal
	call Crlf
	INVOKE SumColoumnOfArray,NUM_COLS,NUM_ROWS, OFFSET array     ;invokin SumOfCOLOUMN
	
	mov edx,OFFSET msg2           ;printing"Sum of Element"
	call WriteString
	call WriteDec
	
	exit
main ENDP

populateArray PROC
	push ebp                       ;pushing ebp
	mov ebp,esp                    ;ebp=esp
	mov esi,0                      ;esi=0
	mov ecx,NUM_ROWS               ;moving to loop counter NUMS_ROWS
	
OutLoop: 
	push ecx                       ;pushing ecx
	mov edi,0                      ;edi=0
	mov ecx,NUM_COLS               ;mov ecx to NUM_COLS for loop counter

InnerLoop:
	mov eax,(125-(-125)+1)         ;Arranging the range -125 to 125 
	call RandomRange			   ;Calling RandomRange
	add eax,-125                   ;adding -125 to
	mov array[esi+edi],ax          ;base+index+displacement
	;call WriteInt
	;call CRLF
	
	
	add edi,TYPE SWORD              ;moving toward nexxt column
	loop InnerLoop
	
	
	add esi,edi
	pop ecx
	
	Loop OutLoop
	
	mov esp,ebp                      ;esp=ebp
	pop ebp
	ret 12                           ;return
populateArray ENDP 

PrintArray PROC
	push ebp                        ;pushing the ebp
	mov ebp,esp                     ;ebp=esp
	mov esi,[ebp+8]                 ;esi=ebp+8
	mov ecx,[ebp+12]                ;loop counter set to rows

Loop1:
	push ecx
	mov edi,0                       ;edi=0
	mov ecx,[ebp+16]                ;setting the loop counter
	dec ecx                         ;decrement ecx for the printing the last number without comma
	mov edx,OFFSET pipe             ;Printing the pipe
	call WriteString

Loop2:
	movsx eax,SWORD PTR [esi+edi]   ;Storing the array number in array 
	call WriteInt                   ;Printing them
	

	mov edx,OFFSET comma            ;Printing the comma
	call WriteString
	;call CRLF
	add edi,TYPE SWORD              ;coming to next column
	Loop Loop2
	
	movsx eax,SWORD PTR [esi+edi]    ;This statment is printing the number without the comma
	call WriteInt
	add edi,TYPE SWORD
	
	mov edx,OFFSET pipe
	call WriteString
	call CRLF
	
	add esi,edi
	pop ecx
	Loop Loop1

	mov esp,ebp
	pop ebp
	ret 12

PrintArray ENDP

SumColoumnOfArray PROC,            ; creating the named stack parameter
	columns: BYTE,
	rows:BYTE,
	array1:SWORD,
	columnIndex:DWORD
LOCAL totalofColoumn: DWORD



	push ebp
	mov ebp,esp
	sub esp,4

	movzx esi,SWORD PTR [array1]    ;pointin the array1 with esi
	movsx ecx,rows
	mov edx,columnIndex             ;edx=columnInden
	sub edx,columnIndex             ;edx=edx-columnIndex
	mov columnIndex,edx             ;coloumnindex=edx

loop1:
	push ecx
	mov edi,0                       ;mov edi=o

	movzx ecx,columns               ;Seting loop counter to coloumns

loop2:
	cmp ecx,columnIndex             ;cmp ecx to columnIndex

	JNE nextelement                 ; if index value doesnot get match jmp to nextelemnet

	add ax,SWORD PTR [esi+edi]      ;adding the number 
	movsx eax,ax
	mov totalOFColoumn,eax          ;moving to added number to eax
nextelement:
	add edi,TYPE SWORD              ;forwarding the next column
	Loop loop2
	
	add esi,edi
	pop ecx
	Loop loop1



	mov esp,ebp
	pop ebp
	ret

SumColoumnOfArray ENDP

END main
