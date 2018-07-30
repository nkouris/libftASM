section .text
	global _ft_isdigit

_ft_isdigit:
	; integer copied to r10 for manipulation
	mov r10, rdi
	sub r10, 48
	cmp r10, 10
	ja not_digit
	jmp digit

digit:
	mov rax, 1
	jmp ft_done

not_digit:
	mov rax, 0

ft_done:
	ret
