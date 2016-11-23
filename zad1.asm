;************************************************************
; ZNAKI ASCII												*
; ZAKRES LICZBOWY [ 0 - 127 ]  - część podstawowa tablicy	*
;								kodów znaków ASCII			*
; ZNAKI o numerach [ 0 - 31 ] - znaki niedrukowalne			*
; ZNAK o numerze 32 - SPACJA								*
; ZNAK o numerze 127 - znak specjalny(niedrukowalny)		*
;************************************************************

;************************************************************
extern printf;												*
;************************************************************

;************************************************************
section .text;												*
;-----------------------------------------------------------*
global main;												*
main:;														*
;-----------------------------------------------------------*
_loop:;														*
	mov rax, [liczba]	; pobranie aktualnej wartości		*
	call _wypisz		; wypisanie (zeruje rejestr RAX)	*
;															*
	mov eax, [liczba]	; pobranie aktualnej wartości		*
	inc eax				; zwiększenie o jeden				*
	mov [liczba], eax	; zapisanie aktualnej wartośći		*
;															*
	cmp eax, 127; dopóki wartość mniejsza od 256			*
	jne _loop;												*
;															*
	jmp _exit;												*
;************************************************************
	

;************************************************************
; rax - liczba do wypisania(wartość)			 			*
;-----------------------------------------------------------*	
_wypisz:;													*
	mov rsi, rax;											*
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

;************************************************************
section .data;												*
	liczba: dd 33;	poniżej znaki niedrukowalne, 32 - spacja*
	format_out: db '%c',10,0;								*
;************************************************************
	
