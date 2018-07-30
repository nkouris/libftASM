extern _ft_memset
section .text
	global _ft_bzero

_ft_bzero:
	mov rdx, rsi
	xor rsi, rsi
	call _ft_memset
	ret
