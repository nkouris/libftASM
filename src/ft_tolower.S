section .text
	global _ft_tolower

_ft_tolower:
	mov r11, rdi
	sub r11, 65
	cmp r11, 25
	ja ft_done
	or rdi, 32

ft_done:
	mov rax, rdi
	ret
