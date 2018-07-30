section .text
	global _ft_toupper

_ft_toupper:
	mov r11, rdi
	sub r11, 97
	cmp r11, 25
	ja ft_done
	xor rdi, 32

ft_done:
	mov rax, rdi
	ret
