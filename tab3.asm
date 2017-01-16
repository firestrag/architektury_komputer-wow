extern printf
extern scanf

global main

section .text
main:
	
	call _pobierz
	mov r13, rax
	mov r14, r13
	
	mov r15, array
	call ._get
	
	mov r15, array
	call ._out
	
	jmp _exit
	
._get:

	cmp r13, 0
	je ._ret

	call _pobierz
	
	mov [r15],eax
	add r15, 4
	
	dec r13
	jmp ._get	
	
._out:
	cmp r14, 0
	je ._ret
	
	xor rax, rax
	mov eax, [r15];
	test eax, 1
	jne ._next
	
	call _wypisz
	
._next:
	dec r14
	add r15, 4
	jmp ._out

._ret:
	ret;
	

_wypisz:
	mov rdi, format_out
	mov rsi, rax
	xor rax, rax
	call printf
	ret
	
_pobierz:
	mov rdi, format_in
	mov rsi, tmp
	xor rax, rax
	call scanf
	xor rax, rax
	mov eax, [tmp]
	ret;
	
_exit:
	mov rax, 1
	xor rbx, rbx
	int 80h
	
section .data
array: times 1000 dd 0
tmp: dd 0
format_in: db '%d',0
format_out: db '%d',10,0
