global change

change:
	mov r15, rdi
._loop:
	mov al, [r15]
	cmp al, 0
	je ._ret;
	
	cmp al, 65
	jl ._next
	cmp al, 90
	jl ._naWieksze
	
	cmp al, 97
	jl ._next
	cmp al, 123
	jl ._naMniejsze
	
	jmp ._next
	 
._naMniejsze:
	sub al, 32
	mov [r15], al
	jmp ._next 
	
._naWieksze:
	add al, 32
	mov [r15], al
	jmp ._next

._next:
	inc r15
	jmp ._loop
._ret:
	ret;
