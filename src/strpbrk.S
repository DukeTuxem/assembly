[BITS 64]

section .text
	[GLOBAL strpbrk:]
strpbrk:
	push	rbp
	mov	rbp, rsp
	xor	rcx, rcx
	xor	rax, rax
repeat:
	cmp	[rdi+rcx], byte 0
	jz	death
	xor	r11, r11
	jmp	loop
advance:
	inc	rcx
	jmp	repeat
loop:
	cmp	[rsi+r11], byte 0
	jz	advance
	mov	r10b, [rdi+rcx]
	sub	r10b, [rsi+r11]
	cmp	r10b, byte 0
	jz	end
	inc	r11
	jmp	loop
end:
	lea	rax, [rdi+rcx]
	pop	rbp
	ret
death:
	xor	rax, rax
	pop	rbp
	ret
