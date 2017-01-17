extern printf
extern scanf

global main

section .text

; r13 - ilość liczb
main:
	
	
	call _pobierz
	;inc r13
	call _srednia
	call _suma
	call _suma_kwadratow
	
	jmp _exit
	
	
; rax - suma
; r14 - licznik, dekrementacja
; r15 - wskaźnik na tablice
_srednia:
	xor rax, rax
	mov r14, r13
	mov r15, array
._loop:
	cmp r14, 0
	je ._ret
	add rax, [r15]
	add r15, 4
	dec r14
	jmp ._loop
._ret:
	xor edx, edx
	mov rbx, r13
	idiv ebx
	call _printf
	ret
	
	
; rax - suma_kwadratów
; r14 - licznik, dekrementacja
; r15 - wskaźnik na tablice
_suma_kwadratow:
	xor rax, rax
	mov r14, r13
	mov r15, array
._loop:
	cmp r14, 0
	je ._ret
	mov rbx, [r15]
	imul rbx, rbx
	add rax, rbx
	add r15, 4
	dec r14
	jmp ._loop
._ret:
	call _printf
	ret	
	
; rax - suma
; r14 - licznik, dekrementacja
; r15 - wskaźnik na tablice
_suma:
	xor rax, rax
	mov r14, r13
	mov r15, array
._loop:
	cmp r14, 0
	je ._ret
	add rax, [r15]
	add r15, 4
	dec r14
	jmp ._loop
._ret:
	call _printf
	ret
	
_pobierz:
	xor r13, r13
	mov r15, array
._loop:
	cmp r13, 10
	je ._ret
	
	call _scanf
	test eax, 0xFFFFFFFF
	jz ._ret
	
	inc r13
	mov [r15], eax
	add r15, 4
	jmp ._loop
._ret:
	ret


_printf:
	push rbx
	push rcx
	push rdx
	mov rdi, format_out
	mov rsi, rax
	xor rax, rax
	call printf
	pop rdx
	pop rcx
	pop rdx
	ret;
	
_scanf:
	push rbx
	push rcx
	push rdx
	mov rdi, format_in
	mov rsi, tmp
	xor rax, rax
	call scanf
	xor rax, rax
	mov eax, [tmp]
	pop rdx
	pop rcx
	pop rdx
	ret;
	

_exit:
	mov rax, 1
	xor rbx, rbx
	int 80h
	
section .data
format_in: db '%d',0
format_out: db '%d',10,0
tmp: dd 0
array: times 10 dd 0
