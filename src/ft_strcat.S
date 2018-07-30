extern _ft_strlen
section .text
	global _ft_strcat

_ft_strcat:
	push rbp
	mov rbp, rsp

; stack init
	sub rsp, 32
	mov qword [rbp - 8], rdi ; s1 pointer
; END stack init

	call _ft_strlen
	mov [rbp - 16], rax ; len s1
	mov qword r10, [rbp - 8] ; create offset address for movsb start
	add r10, [rbp - 16]
	mov rdi, rsi

	call _ft_strlen
	mov [rbp - 24], rax ; len s2
	mov qword rdi, r10 ; set rdi for movsb instruction, rsi is good
	mov rcx, [rbp - 24] ; set number of iterations for rep

	rep movsb
	mov byte [rdi], 0 ; add null terminator
	mov rax, [rbp - 8]

	leave
	ret
