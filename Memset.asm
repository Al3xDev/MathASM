; void experimentalMEMSET(void*,char,int);

experimentalMEMSET:

	mov rax,rsi
	mov rbx,rax
	mov rcx,8
loop_gen_8Bytes:
	sal rax,8
	add rax,rbx
	dec rcx
	jnz loop_gen_8Bytes

	push rax

	mov rax,rdx
	mov rdx,0
	mov rbx,8

	div rbx

	pop rbx

	cmp rax,0
	je end_set8Bytes
	
	mov rcx,rax
loop_set8Bytes:
	mov [rdi],rbx
	add rdi,8
	dec rcx
	jnz loop_set8Bytes
end_set8Bytes:
	
	cmp rdx,0
	je end_set1Bytes
	mov rcx,rdx
loop_set1Bytes:
	mov [rdi],bl
	inc rdi
	dec rcx
	jnz loop_set1Bytes
end_set1Bytes:
	ret
