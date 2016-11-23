extern printf;
extern scanf;

;************************************************************
section .text;												*
;************************************************************
global main;												*
main:;														*
	call _pobierz;											*
	call _czy_podzielna;									*
	call _reszta;											*
	jmp _exit;												*
;************************************************************

;************************************************************
_reszta:;													*
	xor edx, edx; 	pierwsza czesc liczby					*
;					prez którą jest dzielone( równa 0)		*
	mov ebx, 7;		druga część liczby						*
;					przez którą jest dzielone				*
	mov eax, [liczba];	dzielona liczba						*
	idiv ebx;		dzielenie								*
;															*
	cmp edx, 2;												*
	je _reszta_rowna;										*
	jmp _reszta_rozna;										*
;-----------------------------------------------------------*
_reszta_rowna:;												*
	mov rax, reszta_rowna;									*
	call _wypisz;											*
	jmp _reszta_koniec;										*
;															*
_reszta_rozna:;												*
	mov rax, reszta_rozna;									*
	call _wypisz;											*
	jmp _reszta_koniec;										*
;-----------------------------------------------------------*
_reszta_koniec:;											*
	ret;													*
;************************************************************

;************************************************************
_czy_podzielna:;											*
	xor edx, edx; 	pierwsza czesc liczby					*
;					prez którą jest dzielone( równa 0)		*
	mov ebx, 3;		druga część liczby						*
;					przez którą jest dzielone				*
	mov eax, [liczba];	dzielona liczba						*
	idiv ebx;		dzielenie								*
;															*
	cmp edx, 0;												*
	je _wypisz_podzielna;									*
	jmp _wypisz_nie_podzielna;								*
;-----------------------------------------------------------*
_wypisz_podzielna:;											*
	mov rax, podzielna;										*
	call _wypisz;											*
	jmp _wypisz_podzielna_koniec;							*
;															*
_wypisz_nie_podzielna:;										*
	mov rax, nie_podzielna;									*
	call _wypisz;											*
	jmp _wypisz_podzielna_koniec;							*
;-----------------------------------------------------------*
_wypisz_podzielna_koniec:;									*
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
; rax - co wypisać								 			*
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

section .data	

	liczba:	dd	0
	
	format:	db	'%d',0
	format_out:	db	'%s',10,0
		
	podzielna: db 'Liczba jest podzielna przez 3', 10, 0
	nie_podzielna: db 'Liczba jest nie podzielna przez 3', 10, 0
	
	reszta_rowna: db 'Reszta z dzielania przez 7 wynosi 2', 10, 0
	reszta_rozna: db 'Reszta z dzielenia przez 7 jest różna od 2', 10, 0
	
	
