[BITS 64]

section .text
	[GLOBAL strcmp:]	; man strcmp
strcmp:
	push	rbp
	mov	rbp, rsp
	xor	rcx, rcx
repeat:
	mov	r10b, [rdi+rcx]		; copy 1 byte to r10b ( r10b <-- s1[i] )
	sub	r10b, [rsi+rcx]		; s1[i] -= s2[i]
	movsx	rax, r10b		; signed mov (movsx)

	cmp	byte [rdi+rcx], 0
	je	end
	mov	r11b, [rdi+rcx]
	cmp	r11b, [rsi+rcx]
	jne	end
	inc	rcx
	jmp	repeat
end:
	pop	rbp
	ret
