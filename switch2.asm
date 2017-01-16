extern printf
extern scanf

global main

section .data
zma: dd 0
liczba1: dd 0
liczba2: dd 0
format: db '%d',0
formatc: db '%c',0
format_out: db '%d',10,0
tabwsk: dq _dwa,_trzy,_def1,_piec,_def2,_siedem


section .text
main:

mov rax,zma
call _pobierzc

mov rax,liczba1
call _pobierz

mov rax,liczba2
call _pobierz

mov rdx,0
mov eax,[zma]
sub eax,40
;mov [zma],eax
cmp eax,2
jb _def1
cmp eax,7
ja _def2
jmp [tabwsk+8*eax-16]

_dwa:
mov rax,[liczba1]
mov rbx,[liczba2]
imul rax,rbx
mov rdx,0
jmp _exit

_trzy:
mov rax,[liczba1]
mov rbx,[liczba2]
add rax,rbx
mov rdx,0
jmp _exit

_def1:
mov rax,[liczba1]
jmp _exit

_piec:
mov rax,[liczba1]
mov rbx,[liczba2]
sub rax,rbx
mov rdx,0
jmp _exit

_def2:
mov rax,[liczba2]
jmp _exit

_siedem:
mov eax,[liczba1]
mov ebx,[liczba2]
idiv ebx
jmp _exit

_exit:
mov rdi,format_out
mov rsi,rax
mov rax,0
call printf

mov rax,1
mov rbx,0
int 80h


_pobierzc:
mov rdi,formatc
mov rsi,rax
mov rax,0
call scanf
ret

_pobierz:
mov rdi,format
mov rsi,rax
mov rax,0
call scanf
ret
