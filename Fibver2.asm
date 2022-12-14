;TITLE   Fibonacc i Version 1 - Using Register Parameters  (FibVer1.asm)
; This is a recursive version of Fibonacci
; using registers for parameter passing
;Patel Jayraj


INCLUDE Irvine32.INC

.data
prompt	BYTE	"Enter value n for fib(n): ", 0
msg1a	BYTE	"Calculating fib(", 0
msg1b	BYTE	") - please wait...", 0dh, 0ah, 0
msg2a	BYTE	"Fib(", 0
msg2b	BYTE	") = ", 0
		
n		DWORD	10

.code

main PROC
	mov	edx, OFFSET prompt
	call WriteString
	call ReadDec
	mov n, eax
    
	mov	edx, OFFSET msg1a
	call WriteString
	call WriteDec
	mov edx, OFFSET msg1b
	call WriteString

	mov eax, n
	push n
	call Fib

	mov edx, OFFSET msg2a
	call WriteString
	mov ebx, n
	xchg eax, ebx
	call WriteDec
	mov edx, OFFSET msg2b
	call WriteString
	xchg eax, ebx
	call WriteDec
	call Crlf

	exit
main ENDP

;****************************************************************
Fib PROC 
; Receives: EAX is N
; Internally, ebx used to hold an interim value
; Returns: EAX is Fib(n-1)+Fib(n-2), Fib(0) = 0, Fib(1) = 1
;****************************************************************
	Enter 4,0
							;push ebp
							;mov ebp,esp
							;sub esp,4
	mov eax,[ebp+8]
	
	cmp eax, 1				; base case: n=0 or n=1, jmp to end and return n	
	jbe fibEnd			

	
	dec DWORD PTR [ebp+8]				; n-1
	push [ebp+8]			; save current eax = n-1
	call Fib			    ; calculate Fib(n-1)

	mov [ebp-4], eax		; use ebx to hold Fib(n-1)

							; restore eax = n-1
	dec DWORD PTR [ebp+8]	; n-2
	push [ebp+8]
	call Fib				; calculate Fib(n-2)

	add eax, [ebp-4]		; add Fib(n-1) to Fib(n-2)

fibEnd:	
	leave
		
							;mov esp,ebp
							;pop ebp
	ret 4					; return answer in eax
fib ENDP

END main