[BITS 64]

section .text
	[GLOBAL strncmp:]	; man strcmp
strncmp:
	push	rbp		; push to begin of the stack, so to be used in this scope
	mov	rbp, rsp	; set stack pointer

	xor	rcx, rcx
	xor	rax, rax
	cmp	rdx, 0
	je	end

repeat:
	cmp	rcx, rdx
	je	end
	mov	r10b, [rdi+rcx]		; copy 1 byte to r10b ( r10b <-- s1[i] )
	sub	r10b, [rsi+rcx]		; s1[i] -= s2[i]
	movsx	rax, r10b		; signed mov

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
