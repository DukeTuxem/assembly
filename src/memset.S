section .text
	[GLOBAL memset:]

memset:
	push	rbp
	mov	rsp, rbp
init:
	mov	rax, rdi
	xor	rcx, rcx
check:
	cmp	rdx, 0
	je	end
repeat:
	cmp	rcx, rdx
	jne	end
	mov	[rdi+rcx], rsi
	inc	rcx
	jmp	repeat
end:
	pop	rbp
	ret
