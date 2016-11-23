extern printf;
extern scanf;

;************************************************************
section .text
;************************************************************
global main;												*
main:;														*
	mov rax, liczba1;										*
	call _pobierz;											*
	mov rax, liczba2;										*
	call _pobierz;											*
	mov rax, liczba3;										*
	call _pobierz;											*
;															*
	mov eax, liczba1;										*
	mov ebx, liczba2;										*
	call _porownaj;											*
	mov eax, liczba2;										*
	mov ebx, liczba3;										*
	call _porownaj;											*
	mov eax, liczba1;										*
	mov ebx, liczba2;										*
	call _porownaj;											*
;															*
	mov rax, [liczba1];										*
	call _wypisz;											*
	mov rax, [liczba2];										*
	call _wypisz;											*
	mov rax, [liczba3];										*
	call _wypisz;											*
;															*	
	jmp _exit;												*
;************************************************************

;************************************************************	
; rax - wskaźnik na pierwszą liczbę do zamiany				*
; rax - wskaźnik na drugą liczbę do zamiany					*
; jeśli liczba1 > liczba2 to je zamienia					*
;-----------------------------------------------------------*
_porownaj:;													*
	mov ecx, [rax];											*
	mov edx, [rbx];											*
	cmp ecx, edx;											*
	jg _change;												*
	ret;													*
;************************************************************
	
	
;************************************************************	
; rax - wskaźnik na pierwszą liczbę do zamiany				*
; rax - wskaźnik na drugą liczbę do zamiany					*
;-----------------------------------------------------------*
_change:;													*
	mov ecx, [eax];											*
	mov edx, [ebx];											*
	mov [eax], edx;											*
	mov [ebx], ecx;											*
	ret;													*
;************************************************************
	


;************************************************************
; rax - wskaźnik do pamięci gdzie ma zostać zapisana liczba *
;-----------------------------------------------------------*
_pobierz:;													*
	mov rdi, format;										*
	mov rsi, rax;											*
	xor rax, rax;											*
	call scanf;												*
	ret;													*
;************************************************************

;************************************************************
; rax - liczba do wypisania(wartość)			 			*
;-----------------------------------------------------------*	
_wypisz:;													*
	mov rsi, rax;										*
	mov rdi, format_out;									*
	xor rax, rax;											*
	call printf;											*
	ret;													*
;************************************************************

;************************************************************
_exit:;														*
	mov rax, 1;												*
	mov rbx, 0;												*
	int 80h;												*
;************************************************************

section .data	

	liczba1:	dd	0
	liczba2:	dd	0
	liczba3:	dd 0
	
	format:	db	'%d',0
	format_out:	db	'%d',10,0
		
	
	
	
