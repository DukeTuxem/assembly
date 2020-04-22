[BITS 64]

section .text
	[GLOBAL strchr:] ; C function

strchr:
	push	rcx
	xor	rcx, rcx
check:
	cmp	byte[rdi+rcx], 0
	je	end
loop:
	cmp	byte [rdi + rcx], 0
	je	end
	cmp	sil, [rdi + rcx]
	je	end
	inc	rcx
	jmp	loop
end:
	cmp	sil, [rdi+rcx]
	jne	err
	lea	rax, [rdi + rcx]
	pop	rcx
	ret
err:
	mov	rax, 0
	pop	rcx
	ret
