;************************************************************
extern scanf;												*
;************************************************************

;************************************************************
section .text;												*
;-----------------------------------------------------------*
global main;												*
main:;														*
	call _get;												*
	mov eax, [count];										*
	mov [size], eax;										*
	call _square;											*
	jmp _exit;												*
;************************************************************

;************************************************************
_square:;													*
	call ._top_line;										*
	call ._medium;											*
	call ._bottom_line;										*
	ret;													*
;-----------------------------------------------------------*
._bottom_line:;												*
	mov eax, [count];										*
	cmp eax, 1;												*
	jne ._end;												*
	mov eax, [size];										*
	mov bl, '*';											*
	call _write;											*
	mov eax, 1;												*
	mov bl, 10;												*
	call _write;											*
	ret;													*
;-----------------------------------------------------------*
._medium:;													*
	mov eax, [count];										*
	sub eax, 1;												*
	cmp eax, 0;												*
	je ._end;												*
	jl ._end;												*
	call ._one_medium_line;									*
	mov eax, [count];										*
	dec eax;												*
	mov [count], eax;										*
	jmp ._medium;											*
;-----------------------------------------------------------*
._top_line:;												*
	mov bl, '*';											*
	mov eax, [count];										*
	call _write;;											*
	mov eax, [count];										*
	dec eax;												*
	mov [count], eax;										*
	mov bl, 10; \n											*
	mov eax, 1;												*
	call _write;											*
	ret;													*
;-----------------------------------------------------------*
._one_medium_line:;											*
	mov eax, [size];										*
	sub eax, 2;												*
	cmp eax, 0;												*
	je ._end;												*
	jl ._end;												*
	mov bl, '*';											*
	mov eax, 1;												*
	call _write;											*
	mov bl, ' ';											*
	mov eax, [size];										*
	sub eax, 2;												*
	call _write;											*
	mov bl, '*';											*
	mov eax, 1;												*
	call _write;											*
	mov bl, 10; \n											*
	mov eax, 1;												*
	call _write;											*
	ret;													*
;-----------------------------------------------------------*
._end:;														*
	ret;													*
;************************************************************

;************************************************************
; eax - ilość powtórzeń										*
; bl - znak													*
;-----------------------------------------------------------*
_write:;													*
	mov [write_tmp_char], bl;								*
	mov [write_tmp_count], eax;								*
;-----------------------------------------------------------*
._write_char:;												*
	mov eax, [write_tmp_count];								*
	cmp eax, 0;												*
	je ._write_end;											*
	jl ._write_end;											*
	mov eax, [write_tmp_count];								*
	dec eax;												*
	mov [write_tmp_count], eax;								*
	call ._write_putChar;									*
	jmp ._write_char;										*
;-----------------------------------------------------------*
._write_putChar:;											*
	mov rax, 4;												*
	mov rbx, 1;												*
	mov rcx, write_tmp_char;								*
	mov rdx, 1;												*
	int 80h;												*
	ret;													*
;-----------------------------------------------------------*
._write_end:;												*
	ret;													*
;************************************************************

;************************************************************
_get:;														*
	xor rax, rax;											*
	mov rsi, count;											*
	mov rdi, format_in;										*
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
section .data;												*
;-----------------------------------------------------------*
	count:	dd 0;											*
	size: dd 0;												*
	format_in:	db	'%d',0;									*
	write_tmp_char: db 0;									*
	write_tmp_count: dd 0;									*
;************************************************************

