;Jayraj Patel
;Lab4a

INCLUDE Irvine32.inc
.data
msg1 BYTE "a+b= ",0     
msg2 BYTE "a-b= ",0
msg3 BYTE "Enter the number: ",0
a DWORD ?      ;int a
b DWORD ?      ;int b

.code
main PROC
mov edx, OFFSET msg3            ;System.out.println("Enter the number: ");
call WriteString
call ReadInt
mov a,eax
mov ebx,a                       ;a=in.nextln();
call WriteString
call ReadInt
mov b,eax                       ;b=in.nextln();
mov ecx,b
add ebx,ecx
mov edx,OFFSET msg1             ;System.out.println("a+b= ");
call WriteString
xchg eax,ebx
call WriteInt                   ;printing the a+b= result 
call Crlf

mov ebx,a
mov ecx,b
sub ebx,ecx
mov edx,OFFSET msg2             ;System.out.println("a-b= ");
call WriteString
xchg eax,ebx
call WriteInt                   ;printing the a+b= result 
call Crlf



	exit
main ENDP
END main