extern scanf

global getBinary

; r13 - ilość jedynek
; r14 - maska( 00000000 00000000 00000000 00000001 ) <- stan początkowy, mnożenie *2 przesuwa zapalony bit w lewo
; r15 - liczba
getBinary:
	xor r13, r13; ilość jedynek
	mov r14, 1;	maska
	call _scanf
	mov r15, rax
	
	call ._loop
	
	mov rax, r13
	ret


._loop:
	test r15, r14
	jz ._next
	
	inc r13
	
._next:
	
	mov rax, r14
	cmp eax, 0x80000000;
	je ._ret
	
	mov rax, r14
	mov ebx, 2
	imul eax, ebx
	mov r14, rax
	jmp ._loop

._ret:
	ret
	
	
_scanf:
	mov rdi, format_in
	mov rsi, tmp
	xor rax, rax
	call scanf
	xor rax, rax
	mov eax, [tmp]
	ret;
	
section .data
format_in: db '%d',0
tmp: dd 0
