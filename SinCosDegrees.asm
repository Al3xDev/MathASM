; ~$ nasm -f elf64 SinCosDegrees.asm
; extern "C" float experimentalSIN(int); /// degrees
; extern "C" float experimentalCOS(int); /// degrees
; gcc -o main main.cpp SinCosDegrees.o


	global experimentalSIN
	global experimentalCOS


section .text

experimentalSIN:

	mov rax,rdi
	cdq
	mov ecx,360 
	idiv ecx

	cmp edx,0
	jg end_if_1 
	add edx,360
end_if_1: 	
	
	mov rax,0
	mov eax,edx

	push rax

	cwd
	mov cx,90
	div cx


	sal al,7
	cmp rax,0
	jp end_if_2 
	mov ecx,edx
	mov edx,90
	sub edx,ecx
end_if_2:

	pop rax	
	cmp eax,180
	jle end_if_3
	movss xmm0,[sin]
	subss xmm0,[sin+edx*4]
	ret
end_if_3:
	movss xmm0,[sin+edx*4]	
	ret

experimentalCOS:

	mov rax,rdi
	cdq
	mov ecx,360 
	idiv ecx

	cmp edx,0
	jg end_if_6 	
	add edx,360
end_if_6: 		

	mov rax,0
	mov eax,edx

	push rax	

	cwd
	mov cx,90
	div cx


	sal al,7
	cmp rax,0
	jnp end_if_4 
	mov ecx,edx
	mov edx,90
	sub edx,ecx
end_if_4:

	pop rax


	mov rcx,90 
	sub rcx,rax
	sub rax,270
	and rax,rcx
	jns end_if_5
	movss xmm0,[sin]
	subss xmm0,[sin+edx*4]
	ret
end_if_5:
	movss xmm0,[sin+edx*4]	
	ret

section .data

sin dd 0, 0.0174524, 0.0348995, 0.052336, 0.0697565, 0.0871557, 0.104528, 0.121869, 0.139173, 0.156434, 0.173648, 0.190809, 0.207912, 0.224951, 0.241922, 0.258819, 0.275637, 0.292372, 0.309017, 0.325568, 0.34202, 0.358368, 0.374607, 0.390731, 0.406737, 0.422618, 0.438371, 0.45399, 0.469472, 0.48481, 0.5, 0.515038, 0.529919, 0.544639, 0.559193, 0.573576, 0.587785, 0.601815, 0.615661, 0.62932, 0.642788, 0.656059, 0.669131, 0.681998, 0.694658, 0.707107, 0.71934, 0.731354, 0.743145, 0.75471, 0.766044, 0.777146, 0.788011, 0.798636, 0.809017, 0.819152, 0.829038, 0.838671, 0.848048, 0.857167, 0.866025, 0.87462, 0.882948, 0.891007, 0.898794, 0.906308, 0.913545, 0.920505, 0.927184, 0.93358, 0.939693, 0.945519, 0.951057, 0.956305, 0.961262, 0.965926, 0.970296, 0.97437, 0.978148, 0.981627, 0.984808, 0.987688, 0.990268, 0.992546, 0.994522, 0.996195, 0.997564, 0.99863, 0.999391, 0.999848, 1.0
