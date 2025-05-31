	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 4
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	mov	x9, sp
	sub	x8, x29, #5
	str	x8, [x9]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_scanf
	ldursb	w8, [x29, #-5]
	subs	w8, w8, #45
	b.ne	LBB0_2
	b	LBB0_1
LBB0_1:
	mov	x9, sp
	sub	x8, x29, #12
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	_scanf
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldur	w8, [x29, #-12]
	subs	w8, w8, #200
	str	w8, [sp, #16]
	ldr	w8, [sp, #16]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x8, [x9]
	bl	_printf
	b	LBB0_2
LBB0_2:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%c"

l_.str.1:                               ; @.str.1
	.asciz	"%d"

.subsections_via_symbols
