experimentalMEMCPY:
	mov rax,rdx
	mov rdx,0
	mov rcx,8
	div rcx

	; QWORD TRANSFER

	cmp rax,0
	je loop_for8_end

	mov rcx,rax
loop_for8:
	mov rax,[rsi]
	mov [rdi],rax
	add rdi,8
	add rsi,8
	loop loop_for8
loop_for8_end:

	cmp rdx,0
	je end_memcpy

	; BYTE TRANSFER
	mov ecx,edx
loop_for1:
	mov al,[rsi]
	mov [rdi],al
	inc rdi
	inc rsi
	loop loop_for1
end_memcpy:

ret
