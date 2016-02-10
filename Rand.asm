
	global experimentalRAND

section .text

experimentalRAND:

	mov rbx,0
	mov rbx,rsi
	sub rbx,rdi

	cmp rbx,0
	jne end_div0
	mov rbx,1
end_div0:

	rdtsc
	mov rdx,0

	div rbx

	mov rax,rdx
	add rax,rdi

	ret
