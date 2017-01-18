extern printf;
extern scanf;

global main;

section .text

; r13 - wczytana liczba
; r14 - ilość liczb do wczytania, decrementowana
; r15 - najmniejsza liczba

main:
	call _wczytaj
	mov r14, r13
	
	test r14, 0xFFFFFFFFFFFFFFFF;
	jz _exit
	
	call _wczytaj
	mov r15, r13
	sub r14, 1
	
	call ._loop
	
	call _wypisz
	
	jmp _exit
._loop:
	cmp r14, 0
	je ._ret
	
	sub r14, 1
	
	call _wczytaj
	cmp r15, r13
	jl ._loop
	
	mov r15, r13
	jmp ._loop
._ret:
	ret

_wczytaj:
	xor rax, rax
	mov rdi, format_in
	mov rsi, number
	call scanf
	mov r13, [number]
	ret
	
_wypisz:
	xor rax, rax
	mov rdi, format_out
	mov rsi, r15
	call printf
	ret
	
_exit:
	mov rax, 1
	mov rbx, 0
	int 80h



section .data
	format_in: db "%d",0
	format_out: db "%d",10,0
	number: dd 0
