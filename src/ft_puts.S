extern _ft_strlen

section .text
	global _ft_puts

_ft_puts:
	push rbp
	mov rbp, rsp

; print of string - no concat, just printing newline at end
	sub rsp, 16 ; move for variable rdi
	mov qword [rbp - 8], rdi ; store var rdi in stack
	mov byte [rbp - 9], 10 ; put newline char on stack for use
	call _ft_strlen ; get len
	mov r12, rax ; save len in temp reg
	mov rax, 0x2000004
	mov rdi, 1
	mov rsi, [rbp - 8]
	mov rdx, r12
	syscall
; check for sys write failure
	cmp rax, r12
	jne ft_fail
; jump to newline write
	jmp ft_newline

ft_newline:
	mov rax, 0x2000004 ; queue syscall 
	lea rsi, [rbp - 9]
	mov rdi, 1 ; fd in first param
	mov rdx, 1 ; len in third param
	syscall
; check for failure
	cmp rax, 1
	jne ft_fail
	mov rax, -1
	jmp ft_done

ft_fail:
	mov rax, 4

ft_done:	
	leave
	ret
