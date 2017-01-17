global isTriangle

;r13 - najkrótszy bok
;r14 - średni bok
;r15 - najdłuższy bok

isTriangle:
	mov r13, rdi
	mov r14, rsi
	mov r15, rdx
	call ._sortuj
	
	mov rbx, r13
	add rbx, r14

	cmp rbx, r15
	ja ._returnTRUE
	
	;return false
	xor rax, rax
	ret
	
._sortuj:
	cmp r13, r14
	jna ._n1
	
	mov rax, r14
	mov r14, r13
	mov r13, rax
	
._n1:
	cmp r14, r15
	jna ._n2
	
	mov rax, r14
	mov r14, r15
	mov r15, rax
	
._n2:
	cmp r13, r14
	jna ._ret
	
	mov rax, r14
	mov r14, r13
	mov r13, rax

._ret:
	ret
	
._returnTRUE:
	mov rax, 1
	ret


