INCLUDE Irvine32.inc




.data
num BYTE ?                   ;int num
numBy2 WORD ?                ;int numBy2

msg1 BYTE "Original number: ",0
msg2 BYTE "Double Number: ",0
msg3 BYTE "Five times Original: ",0
msg4 BYTE "In binary, the original is: ",0
msg5 BYTE "In Hex, five times oringinal is: ",0


.code
main PROC

	mov edx,OFFSET msg1       ;System.out.println("Original number: ");
	call WriteString
	call ReadInt
	mov num,al                ;moving the al into the num variable
	add al,num                ;add by double = 2*num
	movsx ax,al
	mov numBy2,ax
	mov edx,OFFSET msg2       ;System.out.println("Double Number: ");
	call WriteString
	call WriteInt
	call crlf  
	add al,num                ;5*num
	add al,num
	add al,num
	mov edx ,OFFSET msg3      ;System.out.println("Five times Original: ")
	call WriteString
	call WriteInt
	call Crlf
	mov edx,OFFSET msg5       ;System.out.println("In Hex, five times oringinal is: ")
	call WriteString
	call Writehex
	call Crlf

	call Crlf

	mov al,num
	mov edx,OFFSET msg4       ;System.out.println("In Binary, the original is: ")
	call WriteString
	call WriteBin
	call Crlf
	mov al,num










	exit
main ENDP
End main