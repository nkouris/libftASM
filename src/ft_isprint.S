section .text
	global _ft_isprint

_ft_isprint:
	push rbp
	mov rbp, rsp

	; integer is in rdi and copied to r10 for manip
	mov r10, rdi
	sub r10, 32
	cmp r10, 94
	ja not_print

print:
	mov rax, 1
	jmp ft_done

not_print:
	mov rax, 0

ft_done:
	leave
	ret
