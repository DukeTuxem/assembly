[BITS 64]

section .text
	[GLOBAL memmove:]

my_memmove:
	push    rbp
	mov     rbp, rsp
	xor     rcx, rcx

test_overlap:
	cmp     rdi, rsi
	jb      gere_overlapping
	je      end
	jmp     gere_overlapping

loop:
	cmp     rcx, rdx
	jz      end
	mov     r10b, [rsi+rcx]
	mov     [rdi+rcx], r10b
	inc     rcx
	jmp     loop

gere_overlapping:
	mov     rdx, rcx
	cmp     rcx, rdx
	jz      end
	mov     r10b, [rsi+rcx]
	mov     [rdi+rcx], r10b
	dec     rcx
	jmp     gere_overlapping

end:
	mov     rax, rdi
	pop     rbp
	ret
