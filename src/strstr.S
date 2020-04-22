[BITS 64]

section .text
	[GLOBAL strstr:]
strstr:
	push	rbp
	mov	rbp, rsp

	lea	rax, [rdi]
	xor	rcx, rcx
	xor	r10, r10

	cmp	[rdi+0], byte 0
	je	end
	cmp	[rsi+0], byte 0
	je	end
repeat:
	cmp	[rdi+rcx], byte 0
	je	fail
	xor	r10, r10
	mov	r11b, [rsi+r10]
	cmp	[rdi+rcx], r11b
	je	search
	inc	rcx
	jmp	repeat
search:
	cmp	[rsi+r10], byte 0
	jz	success
	mov	r11b, [rsi+r10]
	cmp	[rdi+rcx], r11b
	jne	repeat
	inc	rcx
	inc	r10
	jmp	search
success:
	sub	rcx, r10
	lea	rax, [rdi+rcx]
end:
	pop	rbp
	ret
fail:
	xor	rax, rax
	jmp	end
