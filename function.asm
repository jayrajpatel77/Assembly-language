INCLUDE Irvine32.inc

.data

msg1 BYTE "Enter the n value for the func(n) or negative to terminate: ",0
goodbye BYTE "Good Bye!",0
funcname BYTE "func( ",0
msg2     BYTE " )= ",0
num DWORD ?


.code
main PROC

	mov num,0                      ;int num=0
	

do:                              ;do{
	mov edx,OFFSET msg1
	call WriteString
	call ReadInt
	mov num,eax
	mov eax,0
		
	cmp num,1                    ;if(num==1)
	JE l1
	mov eax,3                    ;int eax=3

l1:
		cmp num,2                   ;else
		
		JNE l2
		mov eax,2

l2:
		cmp num,2                    ;num==2
		JGE wh
		mov eax,num                  ;eax=func(num)
		call func
		
		

		mov edx,OFFSET funcname      ;System.out.print("fun( ");
		call WriteString
		mov eax,num
		call WriteInt
			
		mov edx,0
		mov edx,OFFSET msg2          ;System.out.print(" (= ");
		call WriteString
		

		mov edx,0
		mov eax,num
		call WriteInt
		call Crlf

wh:
		cmp num,0                    ;while(num>=0)
		JGE do
		mov edx,OFFSET goodbye       ;System.out.print("GoodBye! ")
		call WriteString
		call Crlf






	exit
main ENDP

func PROC USES ebx edx esi edi     ;public static int func(int eax)

	mov ebx,0                             ;int ebx=0 
	mov edx,3                             ;int edx=3
	mov esi,2                             ;int esi=2
	add edi,esi                           ;edi=edi+esi
	add edi,esi                           ;edi=edi+esi
	sub edi,ebx                           ;edi=2*esi-ebx

	mov ecx,eax                           ;int ecx=eax

l4:
	cmp ecx,3
	JNG l5
	mov ebx,edx                           ;ebx=edx
	mov edx,esi                           ;edx=esi
	mov esi,edi                           ;esi=edi
	add edi,esi                           ;edi=edi+esi
	add edi,esi                           ;edi=edi+esi
	sub edi,ebx                           ;edi=2*esi-ebx
	dec ecx								  ;ecx--
	JMP l4
	

l5:
	mov eax,edi                           ;eax=edi
	ret 

func Endp




End Main