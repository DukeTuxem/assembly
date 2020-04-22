[BITS 64]

section .text
	[GLOBAL strlen:]

strlen:
	push rcx		; save rcx current value to the stack
	xor rcx, rcx		; set rcx counter to 0
next:
	cmp [rdi], byte 0	; compare rsi address to null BYTE
	jz  end			;  if eq goes to end
	inc rcx			;  inc compteur
	inc rdi			;  inc str so go to next char
	jmp next		;  redo
end:
	mov rax, rcx		; save counter in rax
	pop rcx			; restore rcx value from stack to rcx register
	ret
