extern _malloc, _ft_strlen, _ft_memcpy
section .text
	global _ft_strdup

_ft_strdup:
	push rbp
	mov rbp, rsp

	sub rsp, 32
	mov [rbp - 8], rdi

	call _ft_strlen
	inc rax ; len + 1 for null terminator
	mov qword [rbp - 16], rax
	; set register for malloc call
	mov qword rdi, [rbp - 16] ; sizeof str

	call _malloc
	mov qword [rbp - 24], rax ; new mem loc
	; set registers for memcpy call
	mov rdi, rax ; dst
	mov qword rsi, [rbp - 8] ; src
	mov qword rdx, [rbp - 16] ; size

	call _ft_memcpy
	mov qword rax, [rbp - 24] ; malloc'ed loc

	leave
	ret
