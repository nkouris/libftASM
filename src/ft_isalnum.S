extern _ft_isdigit, _ft_isalpha
section .text
	global _ft_isalnum

_ft_isalnum:
	call _ft_isdigit
	cmp rax, 1
	je ft_done
	call _ft_isalpha

ft_done:
	ret
