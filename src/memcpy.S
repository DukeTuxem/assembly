[BITS 64]

section .text
	[GLOBAL memcpy:]

memcpy:
	push	rbp
	mov	rbp, rsp
	xor	rcx, rcx
loop:
	cmp	rcx, rdx
	jz	end
	mov	r10b, [rsi+rcx]
	mov	[rdi+rcx], r10b
	inc	rcx
	jmp	loop
end:
	mov	rax, rdi
	pop	rbp
	ret
