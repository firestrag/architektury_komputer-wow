extern printf;
extern scanf;


;************************************************************
section .text;												*
;************************************************************
global main;												*
main:;														*
	call _pobierz;											*
	call _logic;											*
	jmp _exit;												*
;************************************************************


;************************************************************
_logic:;													*
	mov rax, [liczba];										*
	cmp eax, 0;												*
	jg _logic_wypisz_dodatnia;								*
	jl _logic_wypisz_ujemna;								*
	jmp _logic_wypisz_zero;									*
	jmp _logic_end;											*
;-----------------------------------------------------------*
_logic_wypisz_dodatnia:;									*
	mov rdi, dodatnia;										*
	mov rsi, format_out;									*
	xor rax, rax;											*
	call printf;											*
	jmp _logic_end;											*
;-----------------------------------------------------------*
_logic_wypisz_ujemna:;										*
	mov rdi, ujemna;										*
	mov rsi, format_out;									*
	xor rax, rax;											*
	call printf;											*
	jmp _logic_end;											*
;-----------------------------------------------------------*
_logic_wypisz_zero:;										*
	mov rdi, zero;											*
	mov rsi, format_out;									*
	xor rax, rax;											*
	call printf;											*
	jmp _logic_end;											*
;-----------------------------------------------------------*
_logic_end:;												*
	ret;													*
;************************************************************


;************************************************************
_pobierz:;													*
	mov rdi, format;										*
	mov rsi, liczba;										*
	xor rax, rax;											*
	call scanf;												*
	ret;													*
;************************************************************


;************************************************************
_exit:;														*
	mov rax, 1;												*
	mov rbx, 0;												*
	int 80h;												*
;************************************************************
	
;************************************************************
section .data
	dodatnia:	db	'Liczba jest dodatnia',10,0;	printf wypisuje aż do napotkania zera!
	ujemna:		db	'Liczba jest ujemna',10,0
	zero:		db	'Liczba jest zerem',10,0
	
	liczba:	dd	0
	format:	db	'%d',0
	format_out:	db '%s',0
	
