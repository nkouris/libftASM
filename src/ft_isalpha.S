section .text
	global _ft_isalpha

_ft_isalpha:
	; integer is in rdi and copied to r10 for manip
	mov r10, rdi
	sub r10, 65
	cmp r10, 25
	jbe alpha

not_low:
	sub rdi, 97
	cmp rdi, 25
	ja not_alpha

alpha:
	mov rax, 1
	jmp ft_done

not_alpha:
	mov rax, 0

ft_done:
	ret
