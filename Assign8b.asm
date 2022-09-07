;Patel Jayraj

INCLUDE Irvine32.inc

PrintArray PROTO,
	ArrayS:SDWORD,
	arraysize:BYTE


.data

choose BYTE "Choose the option from the menu given below",0
msg1 BYTE "1: Populate the array with the random number ",0

msg2 BYTE "2: Shift the array value bits a specified ",0
msg3 BYTE "3: Multiply the array with a user provided multipler",0
msg4 BYTE "4: Print the array ",0
msg5 BYTE "5: exit",0

msg6 BYTE "Enter the positive number to SHIFT right and negative to left: ",0 
msg7 BYTE "Please enter the multiplier:  ",0


array SDWORD -100, -100, -100, -100, -100, -100, -100, -100, -100, -100, 0
openBracket BYTE  " [ ",0
closeBracket BYTE " ] ",0
arraySize DWORD ?

.code
main PROC

call Randomize                                  ;calling randomize

Appropriate:
	mov edx,OFFSET choose                       ;System.out.print("Choose the option from the given below")
	call WriteString
	
	call CRLF

	mov edx,OFFSET msg1                         ;System.out.println("1: Populate the array with the random number")
	call WriteString
	call CRLF

	mov edx,OFFSET msg2                         ;System.out.println("2: Shift the array value bits a specified ")
	call WriteString
	call CRLF

	mov edx,OFFSET msg3                         ;System.out.println("3: Multiply the array with a user provided multipler")
	call WriteString
	call CRLF

	mov edx,OFFSET msg4							;System.out.println("4: Print the array")
	call WriteString
	call CRLF

	mov edx,OFFSET msg5                         ;System.out.println("5: exit")
	call WriteString
	call CRLF
	call ReadDec

	

	

l1: cmp eax,1                                  ;cmp eax to 1 when user choose 1 option they will get random number
	jne l2                                     ;Jump if not equal to 1 to l2
	push array                                 ;storing in array
	mov eax, arraysize                         ;eax=arraysize
	push eax                                   ;reserving eax
	call populateRandomNum                     ;calling populateRandomNum procedure

l2:
	cmp eax,2                                  ;cmp eax to 2 when the user will choose the option 2 to he will get the shifting the right to left number
	jne l3									   ;Jump if not equal to 2 to l3
	mov edx,OFFSET msg6                        ;Asking the user for the number
	call WriteString
	call ReadInt
	call CRLF
l3:
	cmp eax,3                                  ;cmp eax to 3 when th user will choose the option 3 

	jne l4                                     ;Jump if not equal to 3 to l3
	mov ebx,OFFSET array                       ;mov ebx to offset of the array
	push ebx
	push arraysize
	push eax
	mov edx,OFFSET msg7                        ;Asking user to give the multplier
	call WriteString
	call ReadInt
	call MultiplierNumber                      ;calling MultiplierNumber
	call CRLF

l4:
	cmp eax,4                                  ;cmp eax to 4 when the user choose the option 4
	jne l5                                     ;Jump if not equal to 4 to l3
	INVOKE PrintArray ,array ,arraysize        ;calling the procedure PrintArray
l5:
	cmp eax,0                                  ;cmp eax to 0 when th user choose the option 4  
	jne Appropriate                            ;Jump if not equal to 0 to Appropriate






	exit
main ENDP
;***************************************************************************
;***************************************************************************
populateRandomNum PROC
 

;***************************************************************************
;***************************************************************************
	push ebp                             ;pushing ebp
	mov esp,ebp                          ;ebp=esp 
	sub esp,4                            ;esp-4=esp

	mov eax,[ebp+8]                      ;eax=unnamed Stack parameter
	mov [ebp-4],eax                      ;[ebp-4]=eax
	mov ecx,[ebp-4]

	mov esi,[ebp+12]                     ;pointing the esi to DWORD parameter
Looop:
	mov eax,300000                       ;Range between -100000 to 300000
	sub eax,-100000
	call RandomRange                     ;calling RandomRange
	call WriteInt                        ;Printing the number
	mov esi, eax
	add esi,TYPE DWORD                   ;adding the pointer to the 

	call CRLF               
	Loop Looop

	pop ebp                              ;preserving the ebp
	mov ebp,esp                          ;ebp=esp
	ret 4

populateRandomNum ENDP

ShiftNumber PROC,

	;shiftingnum:DWORD
;LOCAL temp:DWORD



	;mov eax,shiftingnum
	;mov temp,eax
	;mov cl,[ebp+16]









ShiftNumber ENDP


MultiplierNumber PROC

	Enter 4,0							 ;this will push ebp moving ebp to esp subtracting it by 4
	mov eax,[ebp+8]                      ;eax=[ebp+8]
	mov ecx,[ebp-4]

	mov esi,SDWORD ptr [ebp+8]           ;SDWORD pointing to ebp
	mov ebx,[ebp+8]                      ; storing the parameter to ebx for multiplier
mu:
	mov eax,[esi]                        ;eax=esi
	mul ebx                              ;multiplying ebx

	mov [esi],eax                       ;esi=eax
	add esi,TYPE SDWORD                 ;adding esi,[ebp+8]
	call CRLF
	Loop mu                      

	leave

	ret 4






MultiplierNumber ENDP


PrintArray PROC,
	ArrayS:SDWORD
	count:BYTE

	mov ecx,count                         ;generating the loop counter
	dec count                             ;count--
	mov esi,0                             ;esi==0
	mov eax,0                             ;eax==0

	mov edx,OFFSET openBracket            ;printing the openBracket
	call WriteString
L2:
	mov eax, ArrayS[esi*TYPE ArrayS]      ;creating the offset array
	call WriteInt                         ;printing the arrays
	inc esi                               ;esi++
	mov al,','                            ;Printing the comma
	call WriteChar
	mov eax,0                             ;mov eax,0
	loop L2
	mov eax,ArrayS[esi*TYPE DWORD]
	call WriteInt
	mov edx,OFFSET closeBracket          ;Closing Bracket
	call WriteString
	call Crlf
	ret





	


PrintArray ENDP







END main
