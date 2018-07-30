extern _read, _ft_bzero, _malloc, _read

section .text
	global _ft_cat

_ft_cat:
	push rbp
	mov rbp, rsp

	sub rsp, 288
	mov [rbp - 8], rdi ; save fd
	mov rdi, 256; set malloc size

	call _malloc
	mov [rbp - 16], rax ; save pointer to buff

ft_for1:
	mov rdi, [rbp - 16] ; pointer for zeroing
	mov rsi, 256 ; sizeof

	call _ft_bzero
	mov rdi, [rbp - 8] ; fd
	mov rsi, [rbp - 16] ; buffer
	mov rdx, 256 ; size to read
    ; mov rax, 0x2000003 syscall read, but strange behavior
	call _read ; syscall could be used, but blocks and doesn't return error?
	;syscall

	; EOF or error
	cmp rax, 0
	jle ft_done

	; write the buffer
	mov rdi, 1
	mov rdx, rax ; number of bytes read
	mov rax, 0x2000004 ; syscall write
	syscall

	; write failure
	cmp rax, -1
	je ft_fail
	jmp ft_for1

ft_fail:
ft_done:
	leave
	ret
