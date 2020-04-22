[BITS 64]

section .text
	[GLOBAL strcspn:]
strcspn:
	push	rbp
	mov	rbp, rsp
	xor	rcx, rcx
repeat:
	cmp	[rdi], byte 0		; main loop which jumps to "loop" label next
	jz	end
	xor	r11, r11
	jmp	loop
reject:
	jmp	end
accept:
	inc	rdi
	inc	rcx
	jmp	repeat
loop:
	cmp	[rsi+r11], byte 0	; second loop which either (goes to) accept or reject
	jz	accept
	mov	r10b, [rdi]
	sub	r10b, [rsi+r11]
	inc	r11
	cmp	r10b, byte 0
	jz	reject
	jmp	loop
end:
	mov	rax, rcx
	pop	rbp
	ret
