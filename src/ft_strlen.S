section .text
	global _ft_strlen

_ft_strlen:
	push rbp
	mov rbp, rsp

	mov qword [rbp - 8], rdi ; save pointer
	mov rcx, -1
	mov al, 0
	repne scasb
	not rcx
	lea rax, [rcx - 1]
	leave
	ret
