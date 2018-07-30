section .text
	global _ft_bzero

_ft_bzero:
	push rbp
	mov rbp, rsp

	mov	qword [rbp - 8], rdi
	mov qword [rbp - 16], rsi
	mov qword [rbp - 24], 0
# on each iteration of the loop (which is a jump to the "for"
start_for1:
	mov	qword r10, [rbp - 24]
	cmp r10, [rbp - 16]
	jge	end_bzero
	mov	qword r11, [rbp - 8]
	mov byte [r10 + r11], 0
	add r10, 1
	mov	qword [rbp - 24], r10
	jmp start_for1
end_bzero:
	leave
	ret
