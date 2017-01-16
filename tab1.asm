extern printf;
extern scanf;

global main;

section .text

main:
	
	call _wczytaj;
	call _wypisz;
	
	jmp _exit
	
_wypisz:
	mov r13, 0
	mov r14, array
._loop:
	; 10 liczb, rozmiar liczby 4 bajty => 9 * 4 = 36
	cmp r13, 40
	je ._ret;
	
	mov rax, r13
	add rax, r14
	mov eax, [rax]
	
	call _print	
	
	add r13, 4;	// rozmiar liczby 4 bajty
	jmp ._loop;
._ret:
	ret;
	
_wczytaj:
	mov r13, 0
	mov r14, array
._loop:
	; 10 liczb, rozmiar liczby 4 bajty => 9 * 4 = 36
	cmp r13, 40
	je ._ret;
	
	mov rax, r13
	add rax, r14
	
	call _pobierz	
	
	add r13, 4;	// rozmiar liczby 4 bajty
	jmp ._loop;
._ret:
	ret;
		
_exit:
	mov rax, 1
	mov rbx, 0
	int 80h
	
; rax - adres
_pobierz:
	mov rdi, format_in
	mov rsi, rax
	xor rax, rax;
	call scanf;
	ret;
	
; rax - wartość/wskaźnik na łańcuch znakóœ
_print:
	mov rdi, format_out
	mov rsi, rax
	xor rax, rax
	call printf
	ret
	

section .data
	array: times 10 dd  0
	format_in: db "%d",0;
	format_out: db"%d",10,0
	
	
	
	
	
	
