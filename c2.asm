global iloscCyfr

iloscCyfr:
	cmp rdi, 0
	je _liczbaZero

	mov rax, rdi
	xor edx, edx
	xor r13, r13
._loop:
	cmp eax, 0
	je ._ret
	
	xor edx, edx
	mov ebx, 10
	idiv ebx
	inc r13
	
	jmp ._loop
._ret:
	mov rax, r13
	ret
	
_liczbaZero:
	mov rax, 1
	ret

