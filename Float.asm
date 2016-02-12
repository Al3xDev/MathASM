      global experimentalFABS
      global experimentalFloatToInt
      
      
section .text

experimentalFABS:
	movss [rsp-4],xmm0
	mov eax,[rsp-4]
	mov rbx,1
	not rbx
	ror ebx,1
	and eax,ebx
	mov [rsp-4],eax
	movss xmm0,[rsp-4]
	ret
	
experimentalFloatToInt:
	 movss [rsp-4],xmm0
	 mov ch,[rsp-1]
	 and ch,0b10000000
	 mov bx,[rsp-2]
	 sal bx,1
	 sub bh,0x7f
	 cmp bh,0
	 jl end_is_0
	 mov cl,bh
	 mov rbx,1
	 sal rbx,32
	 mov eax,[rsp-4]
	 sal eax,9
	 add rax,rbx
	 sal rax,cl
	 sar rax,32
	 cmp ch,0
	 je end_unsigned
	 mov rbx,rax
	 mov rax,0
	 sub rax,rbx
end_unsigned:
	 ret
end_is_0:
	mov rax,0
	ret
