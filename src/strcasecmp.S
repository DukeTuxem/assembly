[BITS 64]

section .text
        [GLOBAL strcasecmp:]	; change to -strcasecmp
strcasecmp:
	push	rbp
	mov	rbp, rsp

	xor	rax, rax 	; set return value (0)
	xor	rcx, rcx
	xor	r8, r8
	xor	r9, r9
	xor	r10, r10
	xor	r11, r11


lower_str1:
	mov	r8b, [rdi+rcx]
	cmp	r8b, byte 0
	je	lower_str2
check_above1:
	cmp	r8b, byte 65
	jae	check_below1		; greater or equal
	jmp	lower_str2
check_below1:
	cmp	r8b, byte 90
	jbe	transform_str1
	jmp	lower_str2
transform_str1:
	add	r8b, 32

lower_str2:
	mov	r9b, [rsi+rcx]
	cmp	r9b, byte 0
	je	compare
check_above2:
	cmp	r9b, byte 65
	jae	check_below2		; greater or equal
	jmp	compare
check_below2:
	cmp	r9b, byte 90
	jbe	transform_str2
	jmp	compare
transform_str2:
	add	r9b, 32

compare:
	xor	r10, r10
repeat:
	mov     r10b, r8b	; copy 1 byte to r10b ( r10b <-- s1[i] )
	sub     r10b, r9b	; s1[i] -= s2[i]
	movsx   rax, r10b	; signed mov (movsx)

	cmp     r8b, byte 0
	je      end
	cmp     r9b, byte 0
	je      end
	mov     r11b, r8b
	cmp     r11b, r9b
	jne     end
	inc     rcx
	jmp     lower_str1
end:
	pop	rbp
	ret
