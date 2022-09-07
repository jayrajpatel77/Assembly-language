INCLUDE Irvine32.inc

.data

msg1 BYTE "Enter the first integer: ",0
msg2 BYTE "Enter the second integer: ",0
msg3 BYTE "Zero cannot be used.",0
msg4 BYTE "For the numbers ",0
an   BYTE " and ",0
msg5 BYTE " the greatest common divisor is: ",0
msg6 BYTE "GOODBYE",0
val1 DWORD ?                
val2 DWORD ?
num1 DWORD ?
num2 DWORD ?
remainder DWORD ?



.code
main PROC

	mov val1,0					;int val1=0
	mov val2,0					;int val2=0

do:                       
	mov edx,OFFSET msg1			;System.out.print("Enter the first number: ");
	call WriteString
	call ReadInt
	mov val1,eax                ;val1=input.nextInt();
	call Crlf
	mov edx,OFFSET msg2         ;System.out.print("Enter the second number: ");
	call WriteString
	call ReadInt
	mov val2,eax                ;val2=input.nextInt();
	call Crlf
	
L1:
	cmp val1,0                  ;if(val1==0||val2==0)
	OR val2,0
	JNE l2                      ;jump not equal
	mov edx,OFFSET msg4         ;System.out.print("Zero cannot be used");
	call WriteString
	
l2:
	mov edx, OFFSET msg4        ;System.out.println("for the numbers ")
	call WriteString
	mov eax,val1                ;+val1
	call writeInt   
	
	mov edx,OFFSET an           ;System.out.println("and")
	call WriteString
	
	mov eax,val2                ;
	call WriteInt
	mov edx,0

	mov edx,OFFSET msg5         ;System.out.print("the greatest common divisor: ")
	call WriteString
l3:	push val1
	push val2
	call findGCD                ;findGCD(val1,val2)
	call WriteInt
	pop val2
	pop val1
	
	call CRlf
Wh:                            ;while(val1!=0&&val1!=0)
	cmp val1,0
    val2,0
	JNE do
	mov edx,OFFSET msg6        ;System.out.print("GOODBYE")
	call WriteString


	

	exit
main ENDp

findGCD PROC USES ebx ecx edx esi edi


	mov ebx,num1                ;ebx=num1
	mov ecx,num2                ;ecx=num2  

	xor ebx,ebx                 ;Math.abs(num1)
	xor ecx,ecx                 ;Math.abs(num2)
do1: 
	xor ebx,ecx                 ;num1%num2
	div ebx
	push ebx
	mov ebx,remainder           ;remainder=num1%num2
	mov ebx,ecx                 ;num1=num2
	push ecx
	mov ecx,remainder           ;num2=remainder
	pop ecx
	pop ebx

wh:
	cmp num2,0                  ;while(num2>0)
	JA do1

	ret                         ;ret num2


findGCD ENDP





END MAIN2