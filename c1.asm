global iloraz

section text

iloraz:
	mov rbx, rsi
	mov rax, rdi
	xor edx, edx
	idiv ebx
	mov ecx, eax
	xor rax, rax
	mov eax, ecx
	ret
