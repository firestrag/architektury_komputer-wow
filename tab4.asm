extern printf 

global main

section .text
main:

	mov r13, 0
	mov r14, 0
	mov r15, 0
	
	call _loop
	
	mov rax, r13
	call _wypisz

	jmp _exit
	
_loop:
	call _getChar

	cmp al, 10
	je ._ret
	
	cmp al, 'a'
	jne ._next
	
	inc r13	
	
._next:
	jmp _loop
._ret:
	ret
	
_getChar:
	mov rax, 3
	mov rbx, 1
	mov rcx, tmp
	mov rdx, 1
	int 80h
	xor rax, rax
	mov al, [tmp]
	ret
	
	
_wypisz:
	mov rsi, rax
	mov rdi, format_out
	xor rax, rax
	call printf
	ret;
	
_exit:
	mov rax, 1
	xor rbx, rbx
	int 80h
	
section .data
tmp: db 0
format_out: db '%d',10,0

