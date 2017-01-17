global getMax

getMax:
	mov r14, rsi
	mov r15, rdi
	xor rax, rax
	mov eax, [r15]
._loop:
	cmp r14, 0
	je ._ret
	
	mov ebx, [r15]
	cmp ebx, eax
	jl ._next
	
	mov eax, ebx
	
._next:
	dec r14
	add r15, 4
	jmp ._loop
._ret:
	ret
