section .text
	global _ft_memcpy

_ft_memcpy:
	mov rcx, rdx
	rep movsb
	ret
