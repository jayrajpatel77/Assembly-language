INCLUDE Irvine32.inc

.data
msg1 BYTE "Please enter the lower number: ",0
msg2 BYTE "Please enter the Upper number: ",0
msg3 BYTE "Random number between the lower number and upper number is: ",0
lowernumber DWORD ?
uppernumber DWORD ?

.code
	main PROC 
	call Randomize                       ;call Randmize number so it can create the random number
	mov edx,OFFSET msg1                  ;Printing the msg1
	call WriteString      
	call ReadInt                         
	
	mov lowernumber,eax                 ;mov im the output in the lowernumber
	call Crlf

	mov edx,OFFSET msg2                ;Printing the number of uppernumber
	call WriteString
	call ReadInt
	mov ebx,eax
	mov uppernumber,ebx                ;moving the uppernumber in ebx
	call Crlf
	

	mov eax,lowernumber              
	mov ebx,uppernumber


	mov ecx,5                         ;i=5

	loop1:
		push eax                      ;reserving eax
		push ebx                      ;reserving ebx

		call BetterRandomRange

		pop ebx
		pop eax
		Loop loop1

	exit
main ENDP

BetterRandomRange PROC                ;Creatinng the main Procedure
	
	mov eax,uppernumber               ;(Math.Random)*(Upper-lower+1)
	sub eax,lowernumber
	inc eax
	call RandomRange
	mov edx,OFFSET msg3               ;Printing the msg3
	call WriteString
	call WriteDec                     ;Printing the RandomNumber

	call Crlf

	BetterRandomRange ENDP
	
END main