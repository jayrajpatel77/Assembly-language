INCLUDE Irvine32.inc

.data
print BYTE " , ",0
number WORD 20 DUP(0)
count DWORD 1


.code
main PROC

	mov ebx,0                      ;ebx=0
	mov edi,1                      ;edi=1
	movsx ecx,number               ;i=number
	Loop1:
		add ebx,count              ;ebx=count
		mov number[edi],ax         
		inc count                  ;increment count++
		inc edi                    ;increment edi++
		loop Loop1

		mov edi,0
		movsx ecx,[number-1]       ;counter to[number-1]
		mov eax,0                  ;eax=0
		Loop2: 
			mov ax,number[edi]     ;storing the numbers in the ax to print
			call WriteDec          ;printing the number
			inc edi                ;edi++
			mov edx,OFFSET print   ;printing the comma
			call WriteString

			loop Loop2

			mov ax,number[edi]     ;printing the number that can print after the comma
			call WriteDec
			call Crlf

	exit

main ENDP

END main