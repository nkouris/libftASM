section .text
	global _ft_isascii

_ft_isascii:
	sub r10, r10
	cmp rdi, 127
	cmova rax, r10
	ret
