[BITS 64]

section .text
	[GLOBAL rindex:]

rindex:
	push	rbp
	mov	rbp, rsp

	xor	rax, rax
	xor	rcx, rcx
repeat:
	cmp	[rdi+rcx], sil
	je	last_occurence
	cmp	[rdi+rcx], byte 0
	je	end
	inc	rcx
	jmp	repeat

last_occurence:
	lea	rax, [rdi+rcx]
	cmp	[rdi+rcx], byte 0
	je	end
	inc	rcx
	jmp	repeat

end:
	pop	rbp
	ret
