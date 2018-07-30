section .text
	global _ft_memset

_ft_memset:
; rdi is already set correctly
	mov qword rax, rsi ; set al for store string elem
	mov rcx, rdx ; set rcx for movsb iteration id
	rep stosb
	ret
