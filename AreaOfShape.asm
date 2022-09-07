INCLUDE Irvine32.inc

.data
.code
main PROC
msg1 BYTE "Enter the edge length of the octahedron ",0
msg2 BYTE "The surface area of an octahedron with an edge length of ",0
msg3 BYTE " long is ",o 
msg4 BYTE "The volume of this octahedron is",0
a REAL4 ?
surfaceArea REAL4 ?
volume REAL4 ?
	exit
	FINIT
askuser
	mov edx,OFFSET msg1
	call WriteString
	call ReadFloat
	FLDZ
	FCOMP
	FNSTSW ax
	SAHF
	jb a1
	jmp askuser
a1:
	FSTP a
	call CRLF

main ENDP
CalculateArea PROC
	push ebp
	mov ebp,esp
	sub esp,4

	mov esi,[ebp+8]
	mov ecx,[ebp+12]




END main