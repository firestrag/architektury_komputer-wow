 extern scanf
extern printf

global main

section .data

format: db '%d',0
format_out: db '%s',10,0
zma: dd 2
tabwsk: dq _jeden,_dwa,_trzy,_cztery,_piec,_szesc,_siedem,_def

poniedzialek: db '1-poniedzialek',10,0
wtorek: db '2-wtorek',10,0
sroda: db '3-sroda',10,0
czwartek: db '4-czwartek',10,0
piatek: db '5-piatek',10,0
sobota: db 'szosty dzien tygodnia',10,0
niedziela: db '7-niedziela',10,0
error: db 'Nie moge przypisac dnia',10,0

section .text
main:
call _pobierz
mov ebx,[zma]
cmp ebx,1
jb _def
cmp ebx,7
ja _def
jmp [tabwsk+8*ebx-8]

_jeden:
mov rax,poniedzialek
jmp _exit
_dwa:
mov rax,wtorek
jmp _exit
_trzy:
mov rax,sroda
jmp _exit
_cztery:
mov rax,czwartek
jmp _exit
_piec:
mov rax,piatek
jmp _exit
_szesc:
mov rax,sobota
jmp _exit
_siedem:
mov rax,niedziela
jmp _exit

_def:
mov rax,error
jmp _exit

_exit:
mov rdi,format_out
mov rsi,rax
mov rax,0
call printf
mov rax,1
mov rbx,0
int 80h

_pobierz:
mov rdi,format
mov rsi,zma
mov rax,0
call scanf
ret

