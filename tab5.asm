extern printf
extern scanf

global main
section .text
; r13 - ilość liczb
main:
	call _pobierz
	mov r13, rax
	
	call _pobieraj
	call _out

	jmp _exit
	
; r14 - kwadrat
; r15 - wskaźnik
; rbx - aktualny index
; rcx - licznik dla r14
_out:
	mov r14, 1
	mov r15, array
	xor rbx, rbx
	mov rcx, 1
._loop:
	cmp rbx, r13
	je ._ret

	cmp r14, rbx
	jne ._next
	
	; wypisznie
	xor rax, rax
	mov rax, [r15]
	call _wypisz
	
	;mov rax, r14
	;call _wypisz
	
	; kolejny kwadrat
	inc rcx
	mov r14, rcx
	imul r14, r14


._next:
	inc rbx
	add r15, 4
	jmp ._loop
	
._ret:
	ret
	
;r14 - ilość zmiennych do pobrania
;r15 - wskaźnik na dane
_pobieraj:
	mov r14, r13
	mov r15, array
._loop:

	cmp r14, 0
	je ._ret
	
	call _pobierz
	mov [r15], eax
	
	dec r14
	add r15, 4	

	jmp ._loop
._ret:
	ret
	
_wypisz:
	push rbx
	push rcx
	mov rdi, format_out
	mov rsi, rax
	xor rax, rax
	call printf
	pop rcx
	pop rbx
	ret
	
_pobierz:
	push rbx
	push rcx
	mov rdi, format_in
	mov rsi, tmp
	xor rax, rax
	call scanf
	xor rax, rax
	mov eax, [tmp]
	pop rcx
	pop rbx
	ret;
	

_exit:
	mov rax, 1
	xor rbx, rbx
	int 80h

section .data
array: times 1000 dd 0
format_in: db '%d',0
format_out: db '%d',10,0
tmp: dd 0
