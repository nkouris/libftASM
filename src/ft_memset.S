section .text
	global _ft_memset

_ft_memset:
; rdi is already set correctly
	push rbp
	mov rbp, rsp

	sub rsp, 16
	mov qword [rbp - 8], rdi
	mov qword rax, rsi ; set al for store string elem
	mov rcx, rdx ; set rcx for movsb iteration id
	rep stosb

	mov qword rax, [rbp - 8]
	leave
	ret
