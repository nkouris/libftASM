section .text
	global _ft_memcpy

_ft_memcpy:
	push rbp
	mov rbp, rsp

	sub rsp, 16
	mov [rbp - 8], rdi
	mov rcx, rdx
	rep movsb

	mov rax, [rbp - 8]
	leave
	ret
