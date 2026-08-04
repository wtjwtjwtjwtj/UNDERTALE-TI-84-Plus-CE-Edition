	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"llvm-link"
	.section	.text._shake,"ax",@progbits
	.globl	_shake                          ; -- Begin function shake
	.type	_shake,@function
_shake:                                 ; @shake
; %bb.0:
	call	_rand
	ld	bc, 3
	call	__irems
	dec	hl
	ret
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_shake, .Lfunc_end0-_shake
                                        ; -- End function
	.section	.text._get_x,"ax",@progbits
	.globl	_get_x                          ; -- Begin function get_x
	.type	_get_x,@function
_get_x:                                 ; @get_x
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	bc, 36
	ld	de, 45
	call	__imulu
	add	hl, de
	pop	ix
	ret
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_get_x, .Lfunc_end1-_get_x
                                        ; -- End function
	.section	.text._get_y,"ax",@progbits
	.globl	_get_y                          ; -- Begin function get_y
	.type	_get_y,@function
_get_y:                                 ; @get_y
; %bb.0:
	call	__frameset0
	ld	de, (ix + 6)
	ld	bc, 4
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB2_2
; %bb.1:
	ld	bc, 75
	jr	.LBB2_4
	.local	.LBB2_2
.LBB2_2:
	ld	bc, 8
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB2_5
; %bb.3:
	ld	bc, 85
	.local	.LBB2_4
.LBB2_4:
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	jr	.LBB2_6
	.local	.LBB2_5
.LBB2_5:
	ld	hl, 220
	.local	.LBB2_6
.LBB2_6:
	pop	ix
	ret
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_get_y, .Lfunc_end2-_get_y
                                        ; -- End function
	.section	.text._fade_screen_to_white,"ax",@progbits
	.globl	_fade_screen_to_white           ; -- Begin function fade_screen_to_white
	.type	_fade_screen_to_white,@function
_fade_screen_to_white:                  ; @fade_screen_to_white
; %bb.0:
	ld	hl, -20
	call	__frameset
	ld	hl, -1900032
	ld	(ix - 12), hl
	ld	hl, _global_palette
	ld	(ix - 9), hl
	ld	bc, 0
	ld	a, 10
	.local	.LBB3_1
.LBB3_1:                                ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	ld	de, 254
	or	a, a
	sbc	hl, de
	ld.sis	hl, 32767
                                        ; kill: def $hl killed $hl def $uhl
	jp	nz, .LBB3_3
	.local	.LBB3_2
.LBB3_2:                                ;   in Loop: Header=BB3_1 Depth=1
	ld	(ix - 6), hl
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	pop	hl
	ld	(ix - 15), bc
	ld	c, a
	call	__ishru
	ld	bc, 31
	call	__iand
	push	hl
	pop	iy
	push	de
	pop	hl
	ld	c, 5
	call	__ishru
	ld	bc, 31
	call	__iand
	ld	(ix - 3), hl
	ld	hl, (ix - 6)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sand
	ld	(ix - 17), l
	ld	(ix - 16), h
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	call	__sxor
	ld	c, (ix + 6)
	ld	(ix - 6), c
	ld	(ix - 5), b
	call	__smulu
	ld.sis	bc, 255
	call	__sdivu
	ld	e, l
	ld	d, h
	add	iy, de
	ld	(ix - 20), iy
	ld	iy, (ix - 3)
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld.sis	bc, 31
	call	__sxor
	ld	c, (ix - 6)
	ld	b, (ix - 5)
	call	__smulu
	ld.sis	bc, 255
	call	__sdivu
	ld	e, l
	ld	d, h
	add	iy, de
	ld	(ix - 3), iy
	push	hl
	ld	l, (ix - 17)
	ld	h, (ix - 16)
	ex	(sp), hl
	pop	iy
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld.sis	bc, 31
	call	__sxor
	ld	c, (ix - 6)
	ld	b, (ix - 5)
	call	__smulu
	ld.sis	bc, 255
	call	__sdivu
	ex.sis	de, hl
	add.sis	iy, de
	ld	hl, (ix - 20)
	ld	c, a
	call	__ishl
	ex	de, hl
	ld	hl, (ix - 3)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
                                        ; kill: def $hl killed $hl killed $uhl
	ld	c, iyl
	ld	b, iyh
	call	__sor
	ld	c, e
	ld	b, d
	call	__sor
	ld	bc, (ix - 15)
	ex.sis	de, hl
	ld	hl, (ix - 12)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	inc	bc
	ld	iy, (ix - 9)
	lea	iy, iy + 2
	ld	(ix - 9), iy
	push	hl
	pop	iy
	lea	iy, iy + 2
	ld	(ix - 12), iy
	jp	.LBB3_1
	.local	.LBB3_3
.LBB3_3:                                ;   in Loop: Header=BB3_1 Depth=1
	push	bc
	pop	hl
	ld	de, 256
	or	a, a
	sbc	hl, de
	jp	z, .LBB3_6
; %bb.4:                                ;   in Loop: Header=BB3_1 Depth=1
	push	bc
	pop	hl
	ld	de, 253
	or	a, a
	sbc	hl, de
	ld.sis	hl, 32736
                                        ; kill: def $hl killed $hl def $uhl
	jp	z, .LBB3_2
; %bb.5:                                ;   in Loop: Header=BB3_1 Depth=1
	ld	hl, (ix - 9)
	ld	hl, (hl)
	jp	.LBB3_2
	.local	.LBB3_6
.LBB3_6:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_fade_screen_to_white, .Lfunc_end3-_fade_screen_to_white
                                        ; -- End function
	.section	.text._fade_palette_from_black,"ax",@progbits
	.globl	_fade_palette_from_black        ; -- Begin function fade_palette_from_black
	.type	_fade_palette_from_black,@function
_fade_palette_from_black:               ; @fade_palette_from_black
; %bb.0:
	ld	hl, -17
	call	__frameset
	ld	iy, -1900032
	ld	hl, _global_palette
	ld	(ix - 6), hl
	ld	bc, 0
	ld	a, 10
	.local	.LBB4_1
.LBB4_1:                                ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	ld	de, 254
	or	a, a
	sbc	hl, de
	ld.sis	hl, 32767
                                        ; kill: def $hl killed $hl def $uhl
	jp	nz, .LBB4_3
	.local	.LBB4_2
.LBB4_2:                                ;   in Loop: Header=BB4_1 Depth=1
	ld	(ix - 12), hl
	ld	(ix - 3), iy
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	pop	hl
	ld	(ix - 9), bc
	ld	c, a
	call	__ishru
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	iy, 31
	ld	c, iyl
	ld	b, iyh
	call	__sand
	ld	(ix - 14), l
	ld	(ix - 13), h
	ex	de, hl
	ld	c, 5
	call	__ishru
                                        ; kill: def $hl killed $hl killed $uhl
	ld	c, iyl
	ld	b, iyh
	call	__sand
	ld	(ix - 17), l
	ld	(ix - 16), h
	ld	hl, (ix - 12)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sand
	ld	(ix - 12), l
	ld	(ix - 11), h
	ld	d, iyh
	ld	e, (ix + 6)
	ld	l, (ix - 14)
	ld	h, (ix - 13)
	ld	c, e
	ld	b, d
	call	__smulu
	ld.sis	iy, 255
	ld	c, iyl
	ld	b, iyh
	call	__sdivu
	ld	(ix - 14), l
	ld	(ix - 13), h
	ld	l, (ix - 17)
	ld	h, (ix - 16)
	ld	c, e
	ld	b, d
	call	__smulu
	ld	c, iyl
	ld	b, iyh
	call	__sdivu
                                        ; kill: def $hl killed $hl def $uhl
	ld	(ix - 17), hl
	ld	l, (ix - 12)
	ld	h, (ix - 11)
	ld	c, e
	ld	b, d
	call	__smulu
	ld	c, iyl
	ld	b, iyh
	call	__sdivu
	ex.sis	de, hl
	ld	l, (ix - 14)
	ld	h, (ix - 13)
	ld	c, a
	call	__sshl
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld	hl, (ix - 17)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, e
	ld	b, d
	call	__sor
	ld	c, iyl
	ld	b, iyh
	call	__sor
	ld	bc, (ix - 9)
	ld	iy, (ix - 3)
	ld	(iy), l
	ld	(iy + 1), h
	inc	bc
	ld	iy, (ix - 6)
	lea	iy, iy + 2
	ld	(ix - 6), iy
	ld	iy, (ix - 3)
	lea	iy, iy + 2
	jp	.LBB4_1
	.local	.LBB4_3
.LBB4_3:                                ;   in Loop: Header=BB4_1 Depth=1
	push	bc
	pop	hl
	ld	de, 256
	or	a, a
	sbc	hl, de
	jp	z, .LBB4_6
; %bb.4:                                ;   in Loop: Header=BB4_1 Depth=1
	push	bc
	pop	hl
	ld	de, 253
	or	a, a
	sbc	hl, de
	ld.sis	hl, 32736
                                        ; kill: def $hl killed $hl def $uhl
	jp	z, .LBB4_2
; %bb.5:                                ;   in Loop: Header=BB4_1 Depth=1
	ld	hl, (ix - 6)
	ld	hl, (hl)
	jp	.LBB4_2
	.local	.LBB4_6
.LBB4_6:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_fade_palette_from_black, .Lfunc_end4-_fade_palette_from_black
                                        ; -- End function
	.section	.text._check_easter_eggs,"ax",@progbits
	.globl	_check_easter_eggs              ; -- Begin function check_easter_eggs
	.type	_check_easter_eggs,@function
_check_easter_eggs:                     ; @check_easter_eggs
; %bb.0:
	ld	hl, -13
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	lea	bc, ix - 7
	ld	(ix - 10), bc
	push	de
	push	hl
	push	bc
	call	_strncpy
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 10)
	ld	bc, (ix + 9)
	add	hl, bc
	ld	(hl), 0
	ld	de, 1
	ld	(ix - 13), bc
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB5_2
; %bb.1:
	or	a, a
	sbc	hl, hl
	ld	(ix - 13), hl
	.local	.LBB5_2
.LBB5_2:
	ld	c, -65
	ld	b, 32
	ld	de, 0
	.local	.LBB5_3
.LBB5_3:                                ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 13)
	or	a, a
	sbc	hl, de
	jr	z, .LBB5_7
; %bb.4:                                ;   in Loop: Header=BB5_3 Depth=1
	ld	hl, (ix - 10)
	add	hl, de
	ld	h, (hl)
	ld	a, h
	add	a, c
	ld	l, a
	cp	a, 26
	jr	nc, .LBB5_6
; %bb.5:                                ;   in Loop: Header=BB5_3 Depth=1
	ld	iyl, c
	ld	a, h
	or	a, b
	ld	c, a
	ld	hl, (ix - 10)
	add	hl, de
	ld	(hl), c
	ld	c, iyl
	.local	.LBB5_6
.LBB5_6:                                ;   in Loop: Header=BB5_3 Depth=1
	inc	de
	jr	.LBB5_3
	.local	.LBB5_7
.LBB5_7:
	or	a, a
	sbc	hl, hl
	ld	iy, (ix + 12)
	ld	(iy), hl
	ld	hl, (ix + 15)
	ld	(hl), 0
	ld	hl, (ix + 18)
	ld	(hl), 0
	ld	hl, 5
	push	hl
	ld	hl, _.str.8
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_10
; %bb.8:
	ld	hl, _.str.9
	ld	iy, (ix + 12)
	ld	(iy), hl
	.local	.LBB5_9
.LBB5_9:
	ld	hl, (ix + 15)
	ld	(hl), 1
	jp	.LBB5_28
	.local	.LBB5_10
.LBB5_10:
	ld	hl, 7
	push	hl
	ld	hl, _.str.10
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_12
; %bb.11:
	ld	hl, (ix + 12)
	ld	de, _.str.11
	jp	.LBB5_27
	.local	.LBB5_12
.LBB5_12:
	ld	hl, 7
	push	hl
	ld	hl, _.str.12
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_14
; %bb.13:
	ld	hl, (ix + 12)
	ld	de, _.str.13
	jp	.LBB5_27
	.local	.LBB5_14
.LBB5_14:
	ld	hl, 6
	push	hl
	ld	hl, _.str.14
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_16
; %bb.15:
	ld	hl, (ix + 12)
	ld	de, _.str.15
	jp	.LBB5_27
	.local	.LBB5_16
.LBB5_16:
	ld	hl, 6
	push	hl
	ld	hl, _.str.16
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_18
; %bb.17:
	ld	hl, (ix + 18)
	ld	(hl), 1
	ld	hl, (ix + 12)
	ld	de, _.str.17
	jp	.LBB5_27
	.local	.LBB5_18
.LBB5_18:
	ld	hl, 6
	push	hl
	ld	hl, _.str.18
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_20
; %bb.19:
	ld	hl, (ix + 12)
	ld	de, _.str.19
	jp	.LBB5_27
	.local	.LBB5_20
.LBB5_20:
	ld	hl, 7
	push	hl
	ld	hl, _.str.20
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_23
; %bb.21:
	ld	hl, (ix + 12)
	ld	de, _.str.21
	.local	.LBB5_22
.LBB5_22:
	ld	(hl), de
	jp	.LBB5_9
	.local	.LBB5_23
.LBB5_23:
	ld	hl, 5
	push	hl
	ld	hl, _.str.22
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB5_26
; %bb.24:
	ld	hl, 6
	push	hl
	ld	hl, _.str.23
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB5_26
; %bb.25:
	ld	hl, 4
	push	hl
	ld	hl, _.str.24
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_29
	.local	.LBB5_26
.LBB5_26:
	ld	hl, (ix + 12)
	ld	de, _.str.25
	.local	.LBB5_27
.LBB5_27:
	ld	(hl), de
	.local	.LBB5_28
.LBB5_28:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB5_29
.LBB5_29:
	ld	hl, 7
	push	hl
	ld	hl, _.str.26
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_31
; %bb.30:
	ld	hl, (ix + 12)
	ld	de, _.str.27
	jp	.LBB5_22
	.local	.LBB5_31
.LBB5_31:
	ld	hl, 7
	push	hl
	ld	hl, _.str.28
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_33
; %bb.32:
	ld	hl, (ix + 12)
	ld	de, _.str.29
	jp	.LBB5_22
	.local	.LBB5_33
.LBB5_33:
	ld	hl, 7
	push	hl
	ld	hl, _.str.30
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_35
; %bb.34:
	ld	hl, (ix + 12)
	ld	de, _.str.31
	jp	.LBB5_22
	.local	.LBB5_35
.LBB5_35:
	ld	hl, 7
	push	hl
	ld	hl, _.str.32
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_37
; %bb.36:
	ld	hl, (ix + 12)
	ld	de, _.str.33
	jp	.LBB5_22
	.local	.LBB5_37
.LBB5_37:
	ld	hl, 7
	push	hl
	ld	hl, _.str.34
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_39
; %bb.38:
	ld	hl, (ix + 12)
	ld	de, _.str.35
	jp	.LBB5_22
	.local	.LBB5_39
.LBB5_39:
	ld	hl, 6
	push	hl
	ld	hl, _.str.36
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_41
; %bb.40:
	ld	hl, (ix + 12)
	ld	de, _.str.37
	jp	.LBB5_27
	.local	.LBB5_41
.LBB5_41:
	ld	hl, 6
	push	hl
	ld	hl, _.str.38
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_43
; %bb.42:
	ld	hl, (ix + 12)
	ld	de, _.str.39
	jp	.LBB5_27
	.local	.LBB5_43
.LBB5_43:
	ld	hl, 7
	push	hl
	ld	hl, _.str.40
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB5_45
; %bb.44:
	ld	hl, 7
	push	hl
	ld	hl, _.str.41
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_46
	.local	.LBB5_45
.LBB5_45:
	ld	hl, (ix + 12)
	ld	de, _.str.42
	jp	.LBB5_27
	.local	.LBB5_46
.LBB5_46:
	ld	hl, 7
	push	hl
	ld	hl, _.str.43
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_48
; %bb.47:
	ld	hl, (ix + 12)
	ld	de, _.str.44
	jp	.LBB5_27
	.local	.LBB5_48
.LBB5_48:
	ld	hl, 7
	push	hl
	ld	hl, _.str.45
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_50
; %bb.49:
	ld	hl, (ix + 12)
	ld	de, _.str.46
	jp	.LBB5_27
	.local	.LBB5_50
.LBB5_50:
	ld	hl, 7
	push	hl
	ld	hl, _.str.47
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_52
; %bb.51:
	ld	hl, (ix + 12)
	ld	de, _.str.48
	jp	.LBB5_27
	.local	.LBB5_52
.LBB5_52:
	ld	hl, 7
	push	hl
	ld	hl, _.str.49
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_54
; %bb.53:
	ld	hl, (ix + 12)
	ld	de, _.str.50
	jp	.LBB5_27
	.local	.LBB5_54
.LBB5_54:
	ld	hl, 6
	push	hl
	ld	hl, _.str.51
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_56
; %bb.55:
	ld	hl, (ix + 12)
	ld	de, _.str.52
	jp	.LBB5_27
	.local	.LBB5_56
.LBB5_56:
	ld	hl, 7
	push	hl
	ld	hl, _.str.53
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB5_58
; %bb.57:
	ld	hl, 6
	push	hl
	ld	hl, _.str.54
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_59
	.local	.LBB5_58
.LBB5_58:
	ld	hl, (ix + 12)
	ld	de, _.str.55
	jp	.LBB5_27
	.local	.LBB5_59
.LBB5_59:
	ld	hl, 7
	push	hl
	ld	hl, _.str.56
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_61
; %bb.60:
	ld	hl, (ix + 12)
	ld	de, _.str.57
	jp	.LBB5_27
	.local	.LBB5_61
.LBB5_61:
	ld	hl, 7
	push	hl
	ld	hl, _.str.58
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB5_63
; %bb.62:
	ld	hl, (ix + 12)
	ld	de, _.str.59
	jp	.LBB5_27
	.local	.LBB5_63
.LBB5_63:
	ld	hl, 5
	push	hl
	ld	hl, _.str.60
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB5_28
; %bb.64:
	ld	hl, (ix + 12)
	ld	de, _.str.61
	jp	.LBB5_27
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_check_easter_eggs, .Lfunc_end5-_check_easter_eggs
                                        ; -- End function
	.section	.text._free_ouat_scene,"ax",@progbits
	.globl	_free_ouat_scene                ; -- Begin function free_ouat_scene
	.type	_free_ouat_scene,@function
_free_ouat_scene:                       ; @free_ouat_scene
; %bb.0:
	ld	de, (_ouatSprite)
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB6_2
; %bb.1:
	push	de
	call	_free
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	(_ouatSprite), hl
	.local	.LBB6_2
.LBB6_2:
	ld	de, (_windowSprite)
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB6_4
; %bb.3:
	push	de
	call	_free
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	(_windowSprite), hl
	.local	.LBB6_4
.LBB6_4:
	ret
	.local	.Lfunc_end6
.Lfunc_end6:
	.size	_free_ouat_scene, .Lfunc_end6-_free_ouat_scene
                                        ; -- End function
	.section	.text._load_ouat_scene,"ax",@progbits
	.globl	_load_ouat_scene                ; -- Begin function load_ouat_scene
	.type	_load_ouat_scene,@function
_load_ouat_scene:                       ; @load_ouat_scene
; %bb.0:
	ld	hl, -3
	call	__frameset
	call	_gfx_ZeroScreen
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	call	_free_ouat_scene
	ld	hl, (_ouatSlide)
	ld	de, 11
	or	a, a
	sbc	hl, de
	jr	z, .LBB7_2
; %bb.1:
	ld	a, 0
	jr	.LBB7_3
	.local	.LBB7_2
.LBB7_2:
	ld	a, -1
	.local	.LBB7_3
.LBB7_3:
	ld	l, 120
	or	a, l
	ld	l, a
	ld	de, _malloc
	push	de
	push	hl
	ld	hl, 160
	push	hl
	call	_gfx_AllocSprite
	ex	de, hl
	pop	hl
	pop	hl
	pop	hl
	ld	(_ouatSprite), de
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB7_5
; %bb.4:
	ld	iy, _ouatCompressed
	ld	hl, (_ouatSlide)
	ld	bc, 3
	call	__imulu
	ld	(ix - 3), de
	ex	de, hl
	add	iy, de
	ld	hl, (iy)
	push	hl
	ld	hl, (ix - 3)
	push	hl
	call	_zx7_Decompress
	pop	hl
	pop	hl
	call	_clock
	ld	a, e
	ld	de, (ix - 3)
	ld	(_ouatSlideStart), hl
	ld	(_ouatSlideStart+3), a
	.local	.LBB7_5
.LBB7_5:
	sbc	hl, hl
	adc	hl, de
	jr	nz, .LBB7_7
; %bb.6:
	ld	a, 0
	jr	.LBB7_8
	.local	.LBB7_7
.LBB7_7:
	ld	a, -1
	.local	.LBB7_8
.LBB7_8:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end7
.Lfunc_end7:
	.size	_load_ouat_scene, .Lfunc_end7-_load_ouat_scene
                                        ; -- End function
	.section	.text._draw_typewriter_text_centered,"ax",@progbits
	.globl	_draw_typewriter_text_centered  ; -- Begin function draw_typewriter_text_centered
	.type	_draw_typewriter_text_centered,@function
_draw_typewriter_text_centered:         ; @draw_typewriter_text_centered
; %bb.0:
	ld	hl, -158
	call	__frameset
	ld	iy, (ix + 6)
	ld	hl, (ix + 9)
	ld	de, 194
	push	ix
	lea	ix, ix - 128
	ld	(ix - 15), de
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	de, ix - 6
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 21), de
	.local	.LBB8_1
.LBB8_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_4 Depth 2
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 12), iy
	pop	ix
	ld	e, (iy)
	ld	bc, 0
	ld	a, e
	or	a, a
	jp	z, .LBB8_28
; %bb.2:                                ;   in Loop: Header=BB8_1 Depth=1
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 9
	ld	(iy + 0), hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 9
	ld	hl, (iy + 0)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 9
	ld	hl, (iy + 0)
	jp	z, .LBB8_28
; %bb.3:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB8_1 Depth=1
	ld	c, l
	ld	b, h
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 24
	ld	(iy + 0), bc
	ld	bc, -140
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	inc	hl
	ld	bc, -146
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, hl
	ld	bc, -155
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	bc, -158
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	.local	.LBB8_4
.LBB8_4:                                ; %.preheader
                                        ;   Parent Loop BB8_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	a, e
	or	a, a
	jp	z, .LBB8_10
; %bb.5:                                ;   in Loop: Header=BB8_4 Depth=2
	ld	bc, -134
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e
	ld	de, -133
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), 0
	dec	de
	lea	iy, ix + 0
	add	iy, de
	pea	iy + 0
	call	_gfx_GetStringWidth
	push	hl
	pop	bc
	pop	hl
	ld	de, -146
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy - 1)
	cp	a, 10
	jp	z, .LBB8_11
; %bb.6:                                ;   in Loop: Header=BB8_4 Depth=2
	cp	a, 32
	jr	nz, .LBB8_8
; %bb.7:                                ;   in Loop: Header=BB8_4 Depth=2
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	dec	iy
	ld	de, -155
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	de, -146
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	.local	.LBB8_8
.LBB8_8:                                ;   in Loop: Header=BB8_4 Depth=2
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 30
	ld	de, (iy + 0)
	push	bc
	pop	iy
	add	iy, de
	lea	hl, iy + 0
	ld	de, 301
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB8_22
; %bb.9:                                ;   in Loop: Header=BB8_4 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 18)
	pop	ix
	ld	e, (hl)
	inc	hl
	push	ix
	lea	ix, ix - 128
	ld	(ix - 18), hl
	pop	ix
	ld	bc, -158
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), iy
	jp	.LBB8_4
	.local	.LBB8_10
.LBB8_10:                               ; %.loopexit.loopexit
                                        ;   in Loop: Header=BB8_1 Depth=1
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	dec	hl
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	jr	.LBB8_12
	.local	.LBB8_11
.LBB8_11:                               ;   in Loop: Header=BB8_1 Depth=1
	lea	hl, iy + 0
	dec	hl
	.local	.LBB8_12
.LBB8_12:                               ; %.loopexit
                                        ;   in Loop: Header=BB8_1 Depth=1
	ld	bc, -140
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	or	a, a
	sbc	hl, de
	push	hl
	pop	de
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 24
	ld	bc, (iy + 0)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	push	de
	pop	iy
	jp	m, .LBB8_14
; %bb.13:                               ; %.loopexit
                                        ;   in Loop: Header=BB8_1 Depth=1
	push	bc
	pop	iy
	.local	.LBB8_14
.LBB8_14:                               ; %.loopexit
                                        ;   in Loop: Header=BB8_1 Depth=1
	ex	de, hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB8_20
; %bb.15:                               ;   in Loop: Header=BB8_1 Depth=1
	lea	hl, iy + 0
	ld	de, 127
	or	a, a
	sbc	hl, de
	jr	c, .LBB8_17
; %bb.16:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	hl, 127
	push	hl
	pop	iy
	.local	.LBB8_17
.LBB8_17:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	de, -152
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	push	iy
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -149
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_strncpy
	pop	hl
	pop	hl
	pop	hl
	ld	bc, -149
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	pop	hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 24
	ld	bc, (iy + 0)
	add	hl, bc
	ld	(hl), 0
	push	de
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, 320
	or	a, a
	sbc	hl, de
	push	hl
	pop	iy
	add	hl, hl
	sbc	hl, hl
	add	hl, hl
	ccf
	sbc	hl, hl
	inc	hl
	ex	de, hl
	add	iy, de
	lea	hl, iy + 0
	call	__ishrs_1
	push	hl
	pop	de
	call	__ineg
	xor	a, a
	bit	0, a
	jr	nz, .LBB8_19
; %bb.18:                               ;   in Loop: Header=BB8_1 Depth=1
	ex	de, hl
	.local	.LBB8_19
.LBB8_19:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	de, -143
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -149
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	bc, -152
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	jr	.LBB8_21
	.local	.LBB8_20
.LBB8_20:                               ;   in Loop: Header=BB8_1 Depth=1
	lea	de, iy + 0
	.local	.LBB8_21
.LBB8_21:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	bc, -137
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
                                        ; kill: def $hl killed $hl def $uhl
	ld	de, 10
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 15)
	pop	ix
	add	iy, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 15), iy
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 18)
	jp	.LBB8_1
	.local	.LBB8_22
.LBB8_22:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	de, -155
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, d
	ld	l, 0
	jr	z, .LBB8_24
; %bb.23:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	a, l
	.local	.LBB8_24
.LBB8_24:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	dec	hl
	bit	0, a
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	(iy + 0), hl
	jr	nz, .LBB8_26
; %bb.25:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	de, -155
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	.local	.LBB8_26
.LBB8_26:                               ;   in Loop: Header=BB8_1 Depth=1
	bit	0, a
	jp	nz, .LBB8_12
; %bb.27:                               ;   in Loop: Header=BB8_1 Depth=1
	ld	bc, -155
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	inc	de
	ld	bc, -146
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	jp	.LBB8_12
	.local	.LBB8_28
.LBB8_28:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end8
.Lfunc_end8:
	.size	_draw_typewriter_text_centered, .Lfunc_end8-_draw_typewriter_text_centered
                                        ; -- End function
	.section	.text._next_ouat_scene,"ax",@progbits
	.globl	_next_ouat_scene                ; -- Begin function next_ouat_scene
	.type	_next_ouat_scene,@function
_next_ouat_scene:                       ; @next_ouat_scene
; %bb.0:
	ld	hl, (_ouatSlide)
	push	hl
	pop	de
	inc	de
	ld	(_ouatSlide), de
	ld	de, 11
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB9_2
; %bb.1:
	call	_free_ouat_scene
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 512
	push	hl
	ld	hl, _global_palette
	push	hl
	call	_gfx_SetPalette
	pop	hl
	pop	hl
	pop	hl
	ld.sis	hl, 32767
	ld	iy, -1899524
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 32736
	ld	iy, -1899526
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 16912
	ld	iy, -1899530
	ld	(iy), l
	ld	(iy + 1), h
	call	_clock
	ld	a, e
	ld	(_splashStart), hl
	ld	(_splashStart+3), a
	ld	a, 1
	ld	hl, -3
	ld	(_gameState), hl
	ret
	.local	.LBB9_2
.LBB9_2:
	call	_load_ouat_scene
	ret
	.local	.Lfunc_end9
.Lfunc_end9:
	.size	_next_ouat_scene, .Lfunc_end9-_next_ouat_scene
                                        ; -- End function
	.section	.text._draw_ouat_frame,"ax",@progbits
	.globl	_draw_ouat_frame                ; -- Begin function draw_ouat_frame
	.type	_draw_ouat_frame,@function
_draw_ouat_frame:                       ; @draw_ouat_frame
; %bb.0:
	ld	hl, -18
	call	__frameset
	ld	iy, (_windowSprite)
	lea	hl, iy + 0
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	z, .LBB10_20
; %bb.1:
	lea	hl, iy + 2
	ld	(ix - 6), iy
	ld	(iy + 2), 0
	push	hl
	pop	iy
	inc	iy
	ld	bc, 19199
	lea	de, iy + 0
	ld	(ix - 15), hl
	ldir
	ld	iy, (_ouatSprite)
	ld	(ix - 12), iy
	ld	a, (iy + 1)
	ld	iy, 0
	ld	bc, (ix + 6)
	push	bc
	pop	hl
	call	__ineg
	ld	(ix - 9), hl
	ld	de, 1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB10_3
; %bb.2:
	ld	bc, 0
	.local	.LBB10_3
.LBB10_3:
	ld	(ix - 3), bc
	lea	bc, iy + 0
	ld	c, a
	ld	de, 0
	ld	iy, (ix + 6)
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB10_5
; %bb.4:
	ld	iy, 0
	.local	.LBB10_5
.LBB10_5:
	ld	(ix - 18), bc
	add	iy, bc
	ld	hl, (ix + 6)
	ld	bc, 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	de, (ix - 3)
	jp	m, .LBB10_7
; %bb.6:
	or	a, a
	sbc	hl, hl
	ld	(ix - 9), hl
	.local	.LBB10_7
.LBB10_7:
	lea	hl, iy + 0
	add	hl, de
	push	hl
	pop	bc
	ld	hl, (ix + 9)
	or	a, a
	sbc	hl, de
	ex	de, hl
	ld	hl, (ix + 9)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB10_9
; %bb.8:
	lea	de, iy + 0
	.local	.LBB10_9
.LBB10_9:
	push	de
	pop	hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB10_18
; %bb.10:
	ld	hl, (ix - 3)
	ld	bc, (ix + 9)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB10_18
; %bb.11:
	ld	hl, (ix - 9)
	ld	bc, (ix - 18)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	iy, 0
	jp	p, .LBB10_19
; %bb.12:
	ld	(ix - 6), de
	ld	hl, (ix - 12)
	ld	a, (hl)
	ld	iyl, a
	ld	hl, (ix - 9)
	lea	bc, iy + 0
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 12)
	add	hl, de
	ld	(ix - 12), hl
	ld	hl, (ix - 3)
	ld	bc, 160
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 15)
	add	hl, de
	cp	a, c
	jr	c, .LBB10_14
; %bb.13:
	ld	a, -96
	.local	.LBB10_14
.LBB10_14:
	ld	iy, (ix - 12)
	lea	de, iy + 2
	ld	(ix - 3), de
	ld	de, 0
	ld	e, a
	ld	(ix - 9), de
	ld	de, (ix - 6)
	push	hl
	pop	iy
	.local	.LBB10_15
.LBB10_15:                              ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB10_17
; %bb.16:                               ;   in Loop: Header=BB10_15 Depth=1
	ld	hl, (ix - 9)
	push	hl
	ld	hl, (ix - 3)
	push	hl
	push	iy
	ld	(ix - 15), iy
	ld	(ix - 6), de
	call	_memcpy
	ld	iy, (ix - 15)
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (_ouatSprite)
	ld	a, (hl)
	ld	de, 0
	ld	e, a
	ld	hl, (ix - 3)
	add	hl, de
	ld	(ix - 3), hl
	ld	de, (ix - 6)
	ld	bc, 160
	add	iy, bc
	dec	de
	jr	.LBB10_15
	.local	.LBB10_17
.LBB10_17:
	ld	hl, (_windowSprite)
	ld	(ix - 6), hl
	.local	.LBB10_18
.LBB10_18:
	ld	iy, 0
	.local	.LBB10_19
.LBB10_19:
	ld	hl, 2
	push	hl
	push	hl
	push	iy
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix - 6)
	push	hl
	call	_gfx_ScaledSprite_NoClip
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB10_20
.LBB10_20:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end10
.Lfunc_end10:
	.size	_draw_ouat_frame, .Lfunc_end10-_draw_ouat_frame
                                        ; -- End function
	.section	.text._draw_ouat_intro,"ax",@progbits
	.globl	_draw_ouat_intro                ; -- Begin function draw_ouat_intro
	.type	_draw_ouat_intro,@function
_draw_ouat_intro:                       ; @draw_ouat_intro
; %bb.0:
	ld	hl, -20
	call	__frameset
	ld	iy, _ouatText
	ld	hl, (_ouatSlide)
	ld	bc, 3
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	hl, (iy)
	ld	(ix - 10), hl
	call	_clock
	ld	bc, (_ouatSlideStart)
	ld	a, (_ouatSlideStart+3)
	call	__lsub
	ld	(ix - 7), hl
	ld	(ix - 4), e                     ; 1-byte Folded Spill
	ld	hl, (ix - 10)
	push	hl
	call	_strlen
	ex	de, hl
	pop	hl
	ld	hl, (_ouatSlide)
	ld	bc, 11
	or	a, a
	sbc	hl, bc
	ld	(ix - 17), de
	jr	nz, .LBB11_2
; %bb.1:
	ld	hl, 425984
	jr	.LBB11_4
	.local	.LBB11_2
.LBB11_2:
	ex	de, hl
	ld	bc, 65535
	call	__iand
	push	hl
	pop	bc
	sbc	hl, hl
	adc	hl, bc
	jr	nz, .LBB11_5
; %bb.3:
	ld	hl, 65536
	.local	.LBB11_4
.LBB11_4:
	ld	(ix - 13), hl
	xor	a, a
	ld	(ix - 14), a                    ; 1-byte Folded Spill
	jr	.LBB11_6
	.local	.LBB11_5
.LBB11_5:
	ld	iy, 32768
	or	a, a
	sbc	hl, hl
	ld	e, l
	push	bc
	pop	hl
	ld	bc, 3276
	xor	a, a
	call	__lmulu
	lea	bc, iy + 0
	call	__ladd
	ld	(ix - 13), hl
	ld	(ix - 14), e                    ; 1-byte Folded Spill
	.local	.LBB11_6
.LBB11_6:
	ld	d, (ix - 4)                     ; 1-byte Folded Reload
	ld	iy, (ix - 7)
	lea	hl, iy + 0
	ld	e, d
	ld	bc, 16384
	call	__lcmpu
	jr	nc, .LBB11_9
; %bb.7:
	lea	hl, iy + 0
	ld	e, d
	ld	bc, 255
	.local	.LBB11_8
.LBB11_8:
	call	__lmulu
	push	hl
	pop	bc
	ld	a, e
	ld	l, 14
	call	__lshru
	jr	.LBB11_14
	.local	.LBB11_9
.LBB11_9:
	ld	bc, -16384
	ld	hl, (ix - 13)
	ld	e, (ix - 14)                    ; 1-byte Folded Reload
	ld	a, -1
	call	__ladd
	lea	bc, iy + 0
	ld	a, d
	call	__lcmpu
	jr	nc, .LBB11_12
; %bb.10:
	lea	hl, iy + 0
	ld	e, d
	ld	bc, (ix - 13)
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	call	__lcmpu
	jr	nc, .LBB11_13
; %bb.11:
	ld	hl, (ix - 13)
	ld	e, (ix - 14)                    ; 1-byte Folded Reload
	lea	bc, iy + 0
	ld	a, d
	call	__lsub
	ld	bc, 255
	xor	a, a
	jr	.LBB11_8
	.local	.LBB11_12
.LBB11_12:
	ld	bc, 255
	jr	.LBB11_14
	.local	.LBB11_13
.LBB11_13:
	ld	bc, 0
	.local	.LBB11_14
.LBB11_14:
	push	bc
	call	_fade_palette_from_black
	pop	hl
	ld	hl, (_ouatSlide)
	ld	de, 11
	or	a, a
	sbc	hl, de
	jp	nz, .LBB11_25
; %bb.15:
	ld	de, 131071
	ld	hl, (_windowSprite)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB11_17
; %bb.16:
	ld	hl, _malloc
	push	hl
	ld	hl, 120
	push	hl
	ld	hl, 160
	push	hl
	call	_gfx_AllocSprite
	pop	de
	pop	de
	pop	de
	ld	de, 131071
	ld	(_windowSprite), hl
	.local	.LBB11_17
.LBB11_17:
	ld	iy, (_ouatSprite)
	ld	a, (iy + 1)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, a
	ld	hl, 70
	ld	(ix - 13), bc
	sbc	hl, bc
	ld	(ix - 10), hl
	ex	de, hl
	ld	d, 0
	ld	e, d
	ld	iy, (ix - 7)
	lea	bc, iy + 0
	ld	a, (ix - 4)                     ; 1-byte Folded Reload
	call	__lcmpu
	jp	nc, .LBB11_29
; %bb.18:
	ld	bc, -70
	lea	hl, iy + 0
	ld	iy, (ix - 13)
	add	iy, bc
	ld	e, (ix - 4)                     ; 1-byte Folded Reload
	ld	bc, -131072
	ld	a, -1
	call	__ladd
	ld	bc, 229376
	ld	a, d
	call	__lcmpu
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	bit	0, a
	jr	nz, .LBB11_20
; %bb.19:
	ld	hl, 229376
	.local	.LBB11_20
.LBB11_20:
	bit	0, a
	jr	nz, .LBB11_22
; %bb.21:
	ld	e, 0
	.local	.LBB11_22
.LBB11_22:
	ld	(ix - 3), iy
	ld	a, (ix - 1)
	rlc	a
	sbc	a, a
	lea	bc, iy + 0
	call	__lmulu
	ld	bc, 229376
	xor	a, a
	call	__ldivu
	ex	de, hl
	ld	iy, (ix - 10)
	add	iy, de
	ld	de, 0
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB11_30
; %bb.23:
	ld	hl, 425983
	ld	e, a
	ld	bc, (ix - 7)
	ld	a, (ix - 4)                     ; 1-byte Folded Reload
	call	__lcmpu
	ld	iy, 0
	jp	nc, .LBB11_30
; %bb.24:
	call	_free_ouat_scene
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 512
	push	hl
	ld	hl, _global_palette
	push	hl
	call	_gfx_SetPalette
	pop	hl
	pop	hl
	pop	hl
	ld	hl, -1899524
	ld.sis	de, 32767
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, -1899526
	ld.sis	de, 32736
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, -1899530
	ld.sis	de, 16912
	ld	(hl), e
	inc	hl
	ld	(hl), d
	call	_clock
	ld	a, e
	ld	(_splashStart), hl
	ld	(_splashStart+3), a
	ld	hl, -3
	ld	(_gameState), hl
	jp	.LBB11_34
	.local	.LBB11_25
.LBB11_25:
	call	_gfx_ZeroScreen
	ld	de, (_ouatSprite)
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB11_27
; %bb.26:
	ld	hl, 2
	push	hl
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	push	de
	call	_gfx_ScaledSprite_NoClip
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB11_27
.LBB11_27:
	ld	de, (ix - 17)
	ex	de, hl
	ld	iy, 65535
	lea	bc, iy + 0
	call	__iand
	push	hl
	pop	bc
	sbc	hl, hl
	adc	hl, bc
	jr	nz, .LBB11_31
; %bb.28:
	lea	hl, iy + 0
	ld	e, 0
	ld	bc, (ix - 7)
	ld	a, (ix - 4)                     ; 1-byte Folded Reload
	call	__lcmpu
	call	c, _next_ouat_scene
	jp	.LBB11_34
	.local	.LBB11_29
.LBB11_29:
	ld	iy, (ix - 10)
	.local	.LBB11_30
.LBB11_30:
	ld	(ix - 10), iy
	call	_gfx_ZeroScreen
	ld	de, (ix - 10)
	ld	(_ouat_current_y), de
	ld	hl, 70
	push	hl
	push	de
	call	_draw_ouat_frame
	pop	hl
	pop	hl
	jp	.LBB11_34
	.local	.LBB11_31
.LBB11_31:
	ld	hl, (ix - 7)
	ld	e, (ix - 4)                     ; 1-byte Folded Reload
	ld	(ix - 20), bc
	ld	bc, 3276
	xor	a, a
	call	__ldivu
	push	hl
	pop	de
	lea	bc, iy + 0
	call	__iand
	push	hl
	pop	bc
	ld	hl, (ix - 20)
	or	a, a
	sbc	hl, bc
	jp	c, .LBB11_33
; %bb.32:
                                        ; kill: def $de killed $de killed $ude def $ude
	ld	(ix - 17), de
	.local	.LBB11_33
.LBB11_33:
	ld	hl, (ix - 17)
	push	hl
	ld	hl, (ix - 10)
	push	hl
	call	_draw_typewriter_text_centered
	pop	hl
	pop	hl
	ld	hl, (ix - 7)
	ld	e, (ix - 4)                     ; 1-byte Folded Reload
	ld	bc, (ix - 13)
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	call	__lcmpu
	call	nc, _next_ouat_scene
	.local	.LBB11_34
.LBB11_34:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end11
.Lfunc_end11:
	.size	_draw_ouat_intro, .Lfunc_end11-_draw_ouat_intro
                                        ; -- End function
	.section	.text._draw_instruction_screen,"ax",@progbits
	.globl	_draw_instruction_screen        ; -- Begin function draw_instruction_screen
	.type	_draw_instruction_screen,@function
_draw_instruction_screen:               ; @draw_instruction_screen
; %bb.0:
	call	__frameset0
	call	_gfx_ZeroScreen
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, _.str.62
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, 320
	or	a, a
	sbc	hl, de
	call	__ishru_1
	ld	de, 20
	push	de
	push	hl
	ld	hl, _.str.62
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 60
	push	hl
	push	hl
	ld	hl, _.str.63
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 80
	push	hl
	ld	hl, 60
	push	hl
	ld	hl, _.str.64
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 100
	push	hl
	ld	hl, 60
	push	hl
	ld	hl, _.str.65
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 120
	push	hl
	ld	hl, 60
	push	hl
	ld	hl, _.str.66
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 150
	push	hl
	ld	hl, 60
	push	hl
	ld	hl, _.str.67
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 6)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, -1
	ld	l, 0
	jr	z, .LBB12_2
; %bb.1:
	ld	a, l
	.local	.LBB12_2
.LBB12_2:
	ld	l, -2
	add	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 190
	push	hl
	ld	hl, 124
	push	hl
	ld	hl, _.str.68
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	de, 1
	ld	hl, (ix + 6)
	or	a, a
	sbc	hl, de
	ld	a, -1
	jr	z, .LBB12_4
; %bb.3:
	ld	a, 0
	.local	.LBB12_4
.LBB12_4:
	ld	l, -2
	add	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 210
	push	hl
	ld	hl, 128
	push	hl
	ld	hl, _.str.69
	push	hl
	call	_gfx_PrintStringXY
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end12
.Lfunc_end12:
	.size	_draw_instruction_screen, .Lfunc_end12-_draw_instruction_screen
                                        ; -- End function
	.section	.text._draw_keyboard_screen,"ax",@progbits
	.globl	_draw_keyboard_screen           ; -- Begin function draw_keyboard_screen
	.type	_draw_keyboard_screen,@function
_draw_keyboard_screen:                  ; @draw_keyboard_screen
; %bb.0:
	ld	hl, -22
	call	__frameset
	ld	hl, _name
	ld	(ix - 7), hl
	call	_gfx_ZeroScreen
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 20
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, _.str.70
	push	hl
	call	_gfx_PrintStringXY
	ld	iy, 140
	pop	hl
	pop	hl
	pop	hl
	ld	de, 188
	.local	.LBB13_1
.LBB13_1:                               ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB13_3
; %bb.2:                                ;   in Loop: Header=BB13_1 Depth=1
	ld	hl, (ix - 7)
	ld	a, (hl)
	ld	(ix - 2), a
	ld	(ix - 1), 0
	ld	hl, 45
	push	hl
	push	iy
	pea	ix - 2
	ld	(ix - 10), iy
	call	_gfx_PrintStringXY
	ld	iy, (ix - 10)
	pop	hl
	pop	hl
	pop	hl
	ld	de, 8
	add	iy, de
	ld	de, 188
	ld	hl, (ix - 7)
	inc	hl
	ld	(ix - 7), hl
	jr	.LBB13_1
	.local	.LBB13_3
.LBB13_3:
	ld	iy, 9
	ld	bc, 0
	push	bc
	pop	de
	push	de
	pop	hl
	ld	bc, _layout
	ld	(ix - 10), bc
	lea	bc, iy + 0
	.local	.LBB13_4
.LBB13_4:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB13_5 Depth 2
	ld	(ix - 7), hl
	or	a, a
	sbc	hl, bc
	ld	hl, 45
	push	hl
	pop	bc
	ex	de, hl
	jp	z, .LBB13_22
	.local	.LBB13_5
.LBB13_5:                               ; %.preheader
                                        ;   Parent Loop BB13_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 13), bc
	push	hl
	pop	de
	ld	bc, 7
	or	a, a
	sbc	hl, bc
	jp	z, .LBB13_21
; %bb.6:                                ;   in Loop: Header=BB13_5 Depth=2
	ld	iy, (ix - 10)
	add	iy, de
	ld	a, (iy)
	cp	a, 32
	ex	de, hl
	jp	z, .LBB13_19
; %bb.7:                                ;   in Loop: Header=BB13_5 Depth=2
	ld	(ix - 19), a                    ; 1-byte Folded Spill
	ld	de, (_cx)
	ld	(ix - 16), hl
	or	a, a
	sbc	hl, de
	ld	e, -1
	jr	z, .LBB13_9
; %bb.8:                                ;   in Loop: Header=BB13_5 Depth=2
	ld	e, 0
	.local	.LBB13_9
.LBB13_9:                               ;   in Loop: Header=BB13_5 Depth=2
	ld	bc, (_cy)
	ld	hl, (ix - 7)
	or	a, a
	sbc	hl, bc
	ld	a, -1
	jr	z, .LBB13_11
; %bb.10:                               ;   in Loop: Header=BB13_5 Depth=2
	ld	a, 0
	.local	.LBB13_11
.LBB13_11:                              ;   in Loop: Header=BB13_5 Depth=2
	and	a, e
	ld	l, a
	ld	b, 7
	call	__bshl
	rlc	a
	sbc	a, a
	ld	l, -2
	add	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	cp	a, 49
	jr	nz, .LBB13_13
; %bb.12:                               ;   in Loop: Header=BB13_5 Depth=2
	ld	hl, (ix - 7)
	push	hl
	call	_get_y
	pop	de
	push	hl
	ld	hl, (ix - 13)
	push	hl
	ld	hl, _.str.71
	jr	.LBB13_17
	.local	.LBB13_13
.LBB13_13:                              ;   in Loop: Header=BB13_5 Depth=2
	cp	a, 50
	ld	hl, (ix - 7)
	jr	nz, .LBB13_15
; %bb.14:                               ;   in Loop: Header=BB13_5 Depth=2
	push	hl
	call	_get_y
	pop	de
	push	hl
	ld	hl, (ix - 13)
	push	hl
	ld	hl, _.str.72
	jr	.LBB13_17
	.local	.LBB13_15
.LBB13_15:                              ;   in Loop: Header=BB13_5 Depth=2
	cp	a, 51
	jr	nz, .LBB13_20
; %bb.16:                               ;   in Loop: Header=BB13_5 Depth=2
	push	hl
	call	_get_y
	pop	de
	push	hl
	ld	hl, (ix - 13)
	push	hl
	ld	hl, _.str.73
	.local	.LBB13_17
.LBB13_17:                              ;   in Loop: Header=BB13_5 Depth=2
	push	hl
	.local	.LBB13_18
.LBB13_18:                              ;   in Loop: Header=BB13_5 Depth=2
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 16)
	.local	.LBB13_19
.LBB13_19:                              ;   in Loop: Header=BB13_5 Depth=2
	inc	hl
	ld	iy, (ix - 13)
	ld	de, 36
	add	iy, de
	lea	bc, iy + 0
	jp	.LBB13_5
	.local	.LBB13_20
.LBB13_20:                              ;   in Loop: Header=BB13_5 Depth=2
	ld	(ix - 4), a
	ld	(ix - 3), 0
	call	_shake
	ld	de, (ix - 13)
	add	hl, de
	ld	(ix - 19), hl
	ld	hl, (ix - 7)
	push	hl
	call	_get_y
	ld	(ix - 22), hl
	pop	hl
	call	_shake
	ld	de, (ix - 22)
	add	hl, de
	push	hl
	ld	hl, (ix - 19)
	push	hl
	pea	ix - 4
	jr	.LBB13_18
	.local	.LBB13_21
.LBB13_21:                              ;   in Loop: Header=BB13_4 Depth=1
	ld	hl, (ix - 7)
	inc	hl
	ld	iy, (ix - 10)
	lea	iy, iy + 7
	ld	(ix - 10), iy
	ld	de, 0
	ld	bc, 9
	jp	.LBB13_4
	.local	.LBB13_22
.LBB13_22:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end13
.Lfunc_end13:
	.size	_draw_keyboard_screen, .Lfunc_end13-_draw_keyboard_screen
                                        ; -- End function
	.section	.text._draw_confirm_screen,"ax",@progbits
	.globl	_draw_confirm_screen            ; -- Begin function draw_confirm_screen
	.type	_draw_confirm_screen,@function
_draw_confirm_screen:                   ; @draw_confirm_screen
; %bb.0:
	ld	hl, -157
	call	__frameset
	call	_gfx_ZeroScreen
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (_nameLen)
	pea	ix - 11
	pea	ix - 10
	pea	ix - 9
	push	hl
	ld	hl, _name
	push	hl
	call	_check_easter_eggs
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, (ix - 9)
	sbc	hl, hl
	adc	hl, de
	jr	nz, .LBB14_2
; %bb.1:
	ld	de, _.str.74
	.local	.LBB14_2
.LBB14_2:
	ld	bc, -145
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	ld	bc, -139
	lea	hl, ix + 0
	add	hl, bc
	ld	bc, -142
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	push	de
	call	_gfx_GetStringWidth
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 14)
	pop	ix
	ex	de, hl
	pop	hl
	ld	bc, 301
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB14_12
; %bb.3:
	ld	hl, 127
	lea	de, iy + 0
	ld	bc, -148
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	push	hl
	ld	bc, -145
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	push	de
	call	_strncpy
	pop	hl
	pop	hl
	pop	hl
	ld	(ix - 12), 0
	ld	de, -148
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_strlen
	push	hl
	pop	bc
	pop	hl
	push	bc
	pop	hl
	add	hl, hl
	sbc	hl, hl
	add	hl, hl
	ccf
	sbc	hl, hl
	inc	hl
	ex	de, hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 26
	ld	(iy + 0), bc
	push	bc
	pop	hl
	add	hl, de
	call	__ishrs_1
	push	hl
	pop	bc
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	push	bc
	pop	hl
	jp	p, .LBB14_5
; %bb.4:
	ld	de, 0
	ex	de, hl
	.local	.LBB14_5
.LBB14_5:
	ld	iy, 10
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), bc
	pop	ix
	push	bc
	pop	de
	.local	.LBB14_6
.LBB14_6:                               ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	z, .LBB14_15
; %bb.7:                                ;   in Loop: Header=BB14_6 Depth=1
	push	de
	pop	hl
	push	de
	pop	iy
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 26)
	pop	ix
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB14_9
; %bb.8:                                ;   in Loop: Header=BB14_6 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 20)
	pop	ix
	lea	de, iy + 0
	add	hl, de
	ld	a, (hl)
	cp	a, 32
	jr	z, .LBB14_14
	.local	.LBB14_9
.LBB14_9:                               ;   in Loop: Header=BB14_6 Depth=1
	ld	de, -157
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	pop	iy
	ld	de, 0
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB14_11
; %bb.10:                               ;   in Loop: Header=BB14_6 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 20)
	pop	ix
	lea	de, iy + 0
	add	hl, de
	ld	a, (hl)
	cp	a, 32
	jp	z, .LBB14_33
	.local	.LBB14_11
.LBB14_11:                              ;   in Loop: Header=BB14_6 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 29)
	pop	ix
	inc	de
	dec	iy
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), iy
	pop	ix
	push	bc
	pop	hl
	dec	hl
	ld	iy, 10
	jp	.LBB14_6
	.local	.LBB14_12
.LBB14_12:
	ld	hl, 320
	or	a, a
	sbc	hl, de
	call	__ishru_1
	ld	de, 30
	.local	.LBB14_13
.LBB14_13:
	push	de
	push	hl
	jr	.LBB14_16
	.local	.LBB14_14
.LBB14_14:
	ld	de, -1
	lea	bc, iy + 0
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	ld	iy, 10
	jp	nz, .LBB14_34
	.local	.LBB14_15
.LBB14_15:                              ; %.loopexit
	ld	hl, 30
	push	hl
	push	iy
	.local	.LBB14_16
.LBB14_16:
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 6)
	ld	hl, (hl)
	ld	bc, 15
	call	__idivs
	push	hl
	pop	bc
	ld	de, 2
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB14_18
; %bb.17:
	ld	bc, 2
	.local	.LBB14_18
.LBB14_18:
	push	bc
	pop	hl
	call	__inot
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	inc	bc
	push	bc
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	push	bc
	call	_gfx_SetTextScale
	pop	hl
	pop	hl
	ld	iy, (ix + 6)
	ld	de, (iy)
	push	de
	pop	hl
	ld	bc, 30
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB14_20
; %bb.19:
	inc	de
	ld	(iy), de
	.local	.LBB14_20
.LBB14_20:
	ld	hl, (_nameLen)
	ld	bc, -148
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 29
	ld	(iy + 0), bc
	ld	hl, 20
	or	a, a
	sbc	hl, bc
	push	de
	pop	bc
	call	__imulu
	ld	bc, 30
	call	__idivs
	push	hl
	pop	iy
	ex	de, hl
	ld	bc, 43
	call	__imulu
	ld	bc, 30
	call	__idivs
	ex	de, hl
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 17)
	pop	ix
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 20)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 26), bc
	pop	ix
	call	__imulu
	call	__ishrs_1
	push	hl
	pop	bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 23)
	pop	ix
	add	hl, hl
	add	hl, hl
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), hl
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 29)
	pop	ix
	add	iy, de
	ld	de, 140
	add	iy, de
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 20)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 17), hl
	pop	ix
	ld	de, 0
	.local	.LBB14_21
.LBB14_21:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	lea	bc, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	bc, -142
	lea	hl, ix + 0
	push	af
	add	hl, bc
	pop	af
	ld	iy, (hl)
	jp	p, .LBB14_23
; %bb.22:                               ;   in Loop: Header=BB14_21 Depth=1
	ld	hl, _name
	add	hl, de
	ld	a, (hl)
	ld	(iy + 0), a
	ld	(iy + 1), 0
	ld	bc, -148
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	call	_shake
	ld	bc, -145
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	add	hl, de
	ld	de, -157
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	call	_shake
	ex	de, hl
	ld	bc, -151
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	add	hl, de
	ld	de, 49
	add	hl, de
	push	hl
	ld	de, -157
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -142
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	ld	bc, -148
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	pop	hl
	pop	hl
	pop	hl
	inc	de
	ld	iy, (_nameLen)
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 17)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 26)
	pop	ix
	add	hl, bc
	push	ix
	lea	ix, ix - 128
	ld	(ix - 17), hl
	pop	ix
	jp	.LBB14_21
	.local	.LBB14_23
.LBB14_23:
	ld	hl, 1
	push	hl
	push	hl
	call	_gfx_SetTextScale
	pop	hl
	pop	hl
	bit	0, (ix + 12)
	jr	z, .LBB14_32
; %bb.24:
	bit	0, (ix - 10)
	jr	z, .LBB14_26
; %bb.25:
	ld	hl, 253
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 180
	push	hl
	ld	hl, 132
	push	hl
	ld	hl, _.str.75
	jr	.LBB14_31
	.local	.LBB14_26
.LBB14_26:
	ld	hl, (ix + 9)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, -1
	ld	l, 0
	jr	z, .LBB14_28
; %bb.27:
	ld	a, l
	.local	.LBB14_28
.LBB14_28:
	ld	l, -2
	add	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 180
	push	hl
	ld	hl, 100
	push	hl
	ld	hl, _.str.76
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 9)
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	a, -1
	jr	z, .LBB14_30
; %bb.29:
	ld	a, 0
	.local	.LBB14_30
.LBB14_30:
	ld	l, -2
	add	a, l
	ld	l, a
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 180
	push	hl
	ld	hl, 200
	push	hl
	ld	hl, _.str.77
	.local	.LBB14_31
.LBB14_31:
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB14_32
.LBB14_32:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB14_33
.LBB14_33:
	lea	bc, iy + 0
	.local	.LBB14_34
.LBB14_34:                              ; %.loopexit6
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 20
	ld	de, (iy + 0)
	push	de
	pop	hl
	add	hl, bc
	ld	(hl), 0
	inc	hl
	ld	bc, -145
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	push	de
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, 320
	or	a, a
	sbc	hl, de
	call	__ishru_1
	ld	de, 20
	push	de
	push	hl
	ld	de, -148
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, 320
	or	a, a
	sbc	hl, de
	call	__ishru_1
	ld	de, 32
	jp	.LBB14_13
	.local	.Lfunc_end14
.Lfunc_end14:
	.size	_draw_confirm_screen, .Lfunc_end14-_draw_confirm_screen
                                        ; -- End function
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	ld	hl, -31
	call	__frameset
	call	_gfx_Begin
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 512
	push	hl
	ld	hl, _global_palette
	push	hl
	call	_gfx_SetPalette
	pop	hl
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTransparentColor
	pop	hl
	ld.sis	hl, 32767
	ld	iy, -1899524
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 32736
	ld	iy, -1899526
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 16912
	ld	iy, -1899530
	ld	(iy), l
	ld	(iy + 1), h
	call	_load_ouat_scene
	bit	0, a
	jp	z, .LBB15_186
	.local	.LBB15_1
.LBB15_1:                               ; %.preheader
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_44 Depth 2
                                        ;     Child Loop BB15_14 Depth 2
                                        ;     Child Loop BB15_171 Depth 2
	call	_kb_Scan
	call	_clock
	ld	(ix - 8), hl
	ld	iyl, e
	ld	hl, -720868
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	6, a
	jr	nz, .LBB15_3
; %bb.2:                                ;   in Loop: Header=BB15_1 Depth=1
	xor	a, a
	ld	(_clearHeld), a
	jr	.LBB15_7
	.local	.LBB15_3
.LBB15_3:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (_clearHeld)
	bit	0, a
	ld	d, 0
	jr	z, .LBB15_5
; %bb.4:                                ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (_clearStart)
	ld	a, (_clearStart+3)
	ld	hl, (ix - 8)
	jr	.LBB15_6
	.local	.LBB15_5
.LBB15_5:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	a, 1
	ld	(_clearHeld), a
	ld	hl, (ix - 8)
	ld	(_clearStart), hl
	ld	a, iyl
	ld	(_clearStart+3), a
	push	hl
	pop	bc
	.local	.LBB15_6
.LBB15_6:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	e, iyl
	call	__lsub
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 65535
	ld	e, d
	call	__lcmpu
	jp	c, .LBB15_187
	.local	.LBB15_7
.LBB15_7:                               ;   in Loop: Header=BB15_1 Depth=1
	push	af
	ld	a, iyl
	ld	(ix - 11), a                    ; 1-byte Folded Spill
	pop	af
	call	_os_GetCSC
	ld	hl, (_gameState)
	ld	de, 4
	add	hl, de
	push	hl
	pop	de
	ld	bc, 9
	or	a, a
	sbc	hl, bc
	ld	iy, 1
	jp	nc, .LBB15_153
; %bb.8:                                ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, JTI15_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB15_9
.LBB15_9:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 14), a                    ; 1-byte Folded Spill
	ld	a, (_isSkipping)
	bit	0, a
	jp	z, .LBB15_66
; %bb.10:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (_skipStart)
	ld	a, (_skipStart+3)
	ld	hl, (ix - 8)
	ld	e, (ix - 11)                    ; 1-byte Folded Reload
	call	__lsub
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 16383
	ld	d, 0
	ld	e, d
	call	__lcmpu
	jp	nc, .LBB15_110
; %bb.11:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	a, d
	ld	(_isSkipping), a
	call	_free_ouat_scene
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 512
	push	hl
	ld	hl, _global_palette
	push	hl
	call	_gfx_SetPalette
	pop	hl
	pop	hl
	pop	hl
	ld.sis	hl, 32767
	ld	iy, -1899524
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 32736
	ld	iy, -1899526
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 16912
	ld	iy, -1899530
	ld	(iy), l
	ld	(iy + 1), h
	call	_clock
	ld	a, e
	ld	(_splashStart), hl
	ld	(_splashStart+3), a
	ld	hl, -3
	jp	.LBB15_23
	.local	.LBB15_12
.LBB15_12:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, (_cy)
	cp	a, 2
	ld	(ix - 14), a
	jp	nz, .LBB15_42
; %bb.13:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (_cx)
	.local	.LBB15_14
.LBB15_14:                              ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	de, 6
	jp	m, .LBB15_16
; %bb.15:                               ;   in Loop: Header=BB15_14 Depth=2
	dec	bc
	push	bc
	pop	de
	.local	.LBB15_16
.LBB15_16:                              ;   in Loop: Header=BB15_14 Depth=2
	lea	hl, iy + 0
	ld	bc, 7
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _layout
	add	hl, bc
	add	hl, de
	ld	a, (hl)
	cp	a, 32
	push	de
	pop	bc
	jr	z, .LBB15_14
	jp	.LBB15_45
	.local	.LBB15_17
.LBB15_17:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 14), a                    ; 1-byte Folded Spill
	call	_gfx_ZeroScreen
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 110
	push	hl
	ld	hl, 100
	push	hl
	ld	hl, _.str.79
	push	hl
	call	_gfx_PrintStringXY
	ld	iy, 1
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 48
	jp	z, .LBB15_30
	jp	.LBB15_153
	.local	.LBB15_18
.LBB15_18:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_menuSel)
	push	hl
	ld	(ix - 14), a                    ; 1-byte Folded Spill
	call	_draw_instruction_screen
	pop	hl
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 1
	jr	z, .LBB15_20
; %bb.19:                               ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 4
	jp	nz, .LBB15_106
	.local	.LBB15_20
.LBB15_20:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_menuSel)
	ld	iy, 1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	ld	(_menuSel), hl
	jp	.LBB15_153
	.local	.LBB15_21
.LBB15_21:                              ;   in Loop: Header=BB15_1 Depth=1
	call	_clock
	ld	bc, (_fadeStart)
	ld	a, (_fadeStart+3)
	call	__lsub
	ld	(ix - 8), hl
	ld	(ix - 11), e                    ; 1-byte Folded Spill
	ld	hl, (_confirmSel)
	ld	de, 1
	push	de
	push	hl
	ld	hl, _zoomTimer
	push	hl
	call	_draw_confirm_screen
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	ld	bc, (ix - 8)
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 163839
	ld	d, 0
	ld	e, d
	call	__lcmpu
	jp	nc, .LBB15_65
; %bb.22:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 255
	push	hl
	call	_fade_screen_to_white
	pop	hl
	ld	a, 1
	ld	(_restorePalette), a
	ld	hl, 4
	.local	.LBB15_23
.LBB15_23:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(_gameState), hl
	jp	.LBB15_152
	.local	.LBB15_24
.LBB15_24:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (_splashStart)
	ld	(ix - 14), a                    ; 1-byte Folded Spill
	ld	a, (_splashStart+3)
	ld	hl, (ix - 8)
	ld	e, (ix - 11)                    ; 1-byte Folded Reload
	call	__lsub
	ld	(ix - 8), hl
	ld	(ix - 11), e                    ; 1-byte Folded Spill
	call	_gfx_ZeroScreen
	ld	a, (_undertale_data)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	ld	hl, 320
	or	a, a
	sbc	hl, de
	call	__ishrs_1
	ex	de, hl
	ld	a, (_undertale_data+1)
	push	bc
	pop	hl
	ld	l, a
	add	hl, hl
	push	hl
	pop	bc
	ld	hl, 240
	or	a, a
	sbc	hl, bc
	call	__ishrs_1
	push	hl
	pop	bc
	ld	hl, 2
	push	hl
	push	hl
	ld	(ix - 17), bc
	push	bc
	push	de
	ld	hl, _undertale_data
	push	hl
	call	_gfx_ScaledSprite_NoClip
	ld	iy, 1
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 98303
	ld	e, iyh
	ld	bc, (ix - 8)
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__lcmpu
	jp	nc, .LBB15_28
; %bb.25:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _.str.78
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, 320
	or	a, a
	sbc	hl, de
	call	__ishru_1
	ld	(ix - 20), hl
	ld	a, (_undertale_data+1)
	ld	iy, 0
	ld	iyl, a
	add	iy, iy
	ld	de, (ix - 17)
	add	iy, de
	lea	hl, iy + 0
	ld	de, 210
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB15_27
; %bb.26:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, 210
	.local	.LBB15_27
.LBB15_27:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, 15
	add	iy, de
	ld	(ix - 17), iy
	ld	hl, 251
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 17)
	push	hl
	ld	hl, (ix - 20)
	push	hl
	ld	hl, _.str.78
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 163839
	ld	e, 0
	ld	bc, (ix - 8)
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__lcmpu
	ld	iy, 1
	jr	c, .LBB15_30
	.local	.LBB15_28
.LBB15_28:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 9
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	jr	z, .LBB15_30
; %bb.29:                               ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 54
	jp	nz, .LBB15_153
	.local	.LBB15_30
.LBB15_30:                              ;   in Loop: Header=BB15_1 Depth=1
	scf
	jp	.LBB15_117
	.local	.LBB15_31
.LBB15_31:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_confirmSel)
	ld	de, 0
	push	de
	push	hl
	ld	hl, _zoomTimer
	push	hl
	call	_draw_confirm_screen
	ld	iy, 1
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (_zoomTimer)
	ld	de, 30
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB15_153
; %bb.32:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 2
	jp	.LBB15_118
	.local	.LBB15_33
.LBB15_33:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 14), a                    ; 1-byte Folded Spill
	ld	hl, (_nameLen)
	pea	ix - 5
	pea	ix - 4
	pea	ix - 3
	push	hl
	ld	hl, _name
	push	hl
	call	_check_easter_eggs
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (_confirmSel)
	ld	de, 1
	push	de
	push	hl
	ld	hl, _zoomTimer
	push	hl
	call	_draw_confirm_screen
	pop	hl
	pop	hl
	pop	hl
	bit	0, (ix - 4)
	jp	z, .LBB15_71
; %bb.34:                               ;   in Loop: Header=BB15_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	(_confirmSel), hl
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 9
	ld	iy, 1
	jp	z, .LBB15_116
; %bb.35:                               ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 48
	jp	z, .LBB15_116
; %bb.36:                               ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 54
	jp	z, .LBB15_116
	jp	.LBB15_153
	.local	.LBB15_37
.LBB15_37:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (_restorePalette)
	bit	0, a
	jr	z, .LBB15_39
; %bb.38:                               ;   in Loop: Header=BB15_1 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 512
	push	hl
	ld	hl, _global_palette
	push	hl
	call	_gfx_SetPalette
	pop	hl
	pop	hl
	pop	hl
	ld.sis	hl, 32767
	ld	iy, -1899524
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 32736
	ld	iy, -1899526
	ld	(iy), l
	ld	(iy + 1), h
	ld.sis	hl, 16912
	ld	iy, -1899530
	ld	(iy), l
	ld	(iy + 1), h
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTransparentColor
	ld	iy, 1
	pop	hl
	xor	a, a
	ld	(_restorePalette), a
	.local	.LBB15_39
.LBB15_39:                              ;   in Loop: Header=BB15_1 Depth=1
	xor	a, a
	ld	(_player+24), a
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jp	nz, .LBB15_76
; %bb.40:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
                                        ; kill: def $l killed $l killed $hl
	bit	3, l
	ld	de, 0
	jp	z, .LBB15_78
; %bb.41:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_player+12)
	call	__ineg
	ex	de, hl
	lea	hl, iy + 0
	jp	.LBB15_77
	.local	.LBB15_42
.LBB15_42:                              ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 3
	jr	nz, .LBB15_46
; %bb.43:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_cx)
	.local	.LBB15_44
.LBB15_44:                              ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	inc	de
	ex	de, hl
	ld	bc, 7
	call	__irems
	ex	de, hl
	lea	hl, iy + 0
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _layout
	add	hl, bc
	add	hl, de
	ld	a, (hl)
	cp	a, 32
	jr	z, .LBB15_44
	.local	.LBB15_45
.LBB15_45:                              ; %.loopexit
                                        ;   in Loop: Header=BB15_1 Depth=1
	ld	(_cx), de
	.local	.LBB15_46
.LBB15_46:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 1
	jr	nz, .LBB15_52
; %bb.47:                               ;   in Loop: Header=BB15_1 Depth=1
	lea	hl, iy + 0
	ld	de, 8
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB15_52
; %bb.48:                               ;   in Loop: Header=BB15_1 Depth=1
	lea	hl, iy + 0
	ld	de, 7
	or	a, a
	sbc	hl, de
	jp	nz, .LBB15_119
; %bb.49:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 8
	ld	(_cy), hl
	ld	de, (_cx)
	push	de
	pop	hl
	ld	bc, 2
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB15_57
; %bb.50:                               ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	de, 5
	or	a, a
	sbc	hl, de
	jp	nc, .LBB15_175
; %bb.51:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 2
	jr	.LBB15_58
	.local	.LBB15_52
.LBB15_52:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 4
	jr	nz, .LBB15_59
; %bb.53:                               ;   in Loop: Header=BB15_1 Depth=1
	lea	hl, iy + 0
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB15_59
; %bb.54:                               ;   in Loop: Header=BB15_1 Depth=1
	lea	hl, iy + 0
	ld	de, 8
	or	a, a
	sbc	hl, de
	jp	nz, .LBB15_146
; %bb.55:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_cx)
	sbc	hl, hl
	adc	hl, de
	jp	nz, .LBB15_173
; %bb.56:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 7
	ld	(_cy), hl
	.local	.LBB15_57
.LBB15_57:                              ;   in Loop: Header=BB15_1 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB15_58
.LBB15_58:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(_cx), hl
	jp	.LBB15_148
	.local	.LBB15_59
.LBB15_59:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 9
	jr	z, .LBB15_61
; %bb.60:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 54
	jp	nz, .LBB15_148
	.local	.LBB15_61
.LBB15_61:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_cx)
	lea	hl, iy + 0
	ld	bc, 7
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _layout
	add	hl, bc
	add	hl, de
	ld	a, (hl)
	cp	a, 49
	jp	z, .LBB15_187
; %bb.62:                               ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 50
	jp	nz, .LBB15_143
; %bb.63:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_nameLen)
	push	de
	pop	hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB15_148
; %bb.64:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, _name
	add	iy, de
	dec	de
	ld	(_nameLen), de
	ld	(iy - 1), 32
	jp	.LBB15_148
	.local	.LBB15_65
.LBB15_65:                              ;   in Loop: Header=BB15_1 Depth=1
	push	bc
	pop	hl
	ld	e, a
	ld	bc, 255
	ld	a, d
	call	__lmulu
	ld	bc, 163840
	call	__ldivu
	push	hl
	call	_fade_screen_to_white
	jp	.LBB15_124
	.local	.LBB15_66
.LBB15_66:                              ;   in Loop: Header=BB15_1 Depth=1
	call	_draw_ouat_intro
	ld	iy, 1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 9
	jr	z, .LBB15_68
; %bb.67:                               ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 54
	jp	nz, .LBB15_153
	.local	.LBB15_68
.LBB15_68:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, 1
	ld	(_isSkipping), a
	ld	hl, (ix - 8)
	ld	(_skipStart), hl
	ld	e, (ix - 11)                    ; 1-byte Folded Reload
	ld	a, e
	ld	(_skipStart+3), a
	ld	bc, (_ouatSlideStart)
	ld	a, (_ouatSlideStart+3)
	call	__lsub
	ld	(ix - 8), hl
	ld	(ix - 11), e                    ; 1-byte Folded Spill
	ld	hl, (_ouatSlide)
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _ouatText
	add	hl, de
	ld	hl, (hl)
	push	hl
	call	_strlen
	push	hl
	pop	iy
	pop	hl
	ld	hl, (ix - 8)
	ld	e, (ix - 11)                    ; 1-byte Folded Reload
	ld	bc, 3276
	xor	a, a
	call	__ldivu
	ld	(ix - 8), hl
	ld	bc, 65535
	call	__iand
	ex	de, hl
	lea	hl, iy + 0
	call	__iand
	or	a, a
	sbc	hl, de
	jp	c, .LBB15_70
; %bb.69:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, (ix - 8)
                                        ; kill: def $iy killed $iy killed $uiy def $uiy
	.local	.LBB15_70
.LBB15_70:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _ouat_frozen_chars
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	pop	de
	jp	.LBB15_152
	.local	.LBB15_71
.LBB15_71:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	l, -2
	ld	a, (ix - 14)
	and	a, l
	ld	l, a
	cp	a, 2
	ld	iy, 1
	jr	nz, .LBB15_73
; %bb.72:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_confirmSel)
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	ld	(_confirmSel), hl
	.local	.LBB15_73
.LBB15_73:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 9
	jp	nz, .LBB15_112
	.local	.LBB15_74
.LBB15_74:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_confirmSel)
	ld	de, 1
	or	a, a
	sbc	hl, de
	jp	nz, .LBB15_114
; %bb.75:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 3
	ld	(_gameState), hl
	ld	a, (ix - 5)
	ld	(_hardMode), a
	call	_clock
	ld	iy, 1
	ld	a, e
	ld	(_fadeStart), hl
	ld	(_fadeStart+3), a
	jp	.LBB15_115
	.local	.LBB15_76
.LBB15_76:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+12)
	or	a, a
	sbc	hl, hl
	.local	.LBB15_77
.LBB15_77:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(_player+21), hl
	ld	a, 1
	ld	(_player+24), a
	.local	.LBB15_78
.LBB15_78:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 17), a
	ld	iy, -720866
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	1, a
	jr	nz, .LBB15_81
; %bb.79:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	2, a
	ld	bc, 0
	ld	a, (ix - 17)                    ; 1-byte Folded Reload
	jr	z, .LBB15_83
; %bb.80:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (_player+12)
	ld	a, 1
	ld	(_player+24), a
	sbc	hl, hl
	adc	hl, de
	ld	hl, 3
	jr	z, .LBB15_82
	jr	.LBB15_83
	.local	.LBB15_81
.LBB15_81:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_player+12)
	call	__ineg
	push	hl
	pop	bc
	ld	a, 1
	ld	(_player+24), a
	sbc	hl, hl
	adc	hl, de
	ld	hl, 2
	jr	nz, .LBB15_83
	.local	.LBB15_82
.LBB15_82:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(_player+21), hl
	.local	.LBB15_83
.LBB15_83:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, (_player)
	add	iy, bc
	ld	(_player), iy
	ld	hl, (_player+3)
	add	hl, de
	ld	(ix - 14), hl
	ld	(_player+3), hl
	lea	hl, iy + 0
	ld	de, 0
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	lea	bc, iy + 0
	ld	iy, 0
	jp	p, .LBB15_85
; %bb.84:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	(_player), iy
	lea	bc, iy + 0
	.local	.LBB15_85
.LBB15_85:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+6)
	ld	hl, 320
	or	a, a
	sbc	hl, de
	push	hl
	pop	de
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB15_87
; %bb.86:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	(_player), de
	.local	.LBB15_87
.LBB15_87:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (ix - 14)
	push	bc
	pop	hl
	ld	de, 0
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB15_89
; %bb.88:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	(_player+3), iy
	lea	bc, iy + 0
	.local	.LBB15_89
.LBB15_89:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+9)
	ld	hl, 240
	or	a, a
	sbc	hl, de
	push	hl
	pop	de
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	(ix - 14), bc
	jp	p, .LBB15_91
; %bb.90:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	(_player+3), de
	ld	(ix - 14), de
	.local	.LBB15_91
.LBB15_91:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 17), a                    ; 1-byte Folded Spill
	bit	0, a
	lea	hl, iy + 0
	ld	iyl, 0
	ld	d, (ix - 11)                    ; 1-byte Folded Reload
	jr	z, .LBB15_94
; %bb.92:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (_main.last_anim_time)
	ld	a, (_main.last_anim_time+3)
	ld	hl, (ix - 8)
	ld	e, d
	call	__lsub
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 8191
	ld	e, iyl
	call	__lcmpu
	jr	nc, .LBB15_95
; %bb.93:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_player+15)
	inc	hl
	ld	bc, 4
	call	__irems
	.local	.LBB15_94
.LBB15_94:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(_player+15), hl
	ld	hl, (ix - 8)
	ld	(_main.last_anim_time), hl
	ld	a, d
	ld	(_main.last_anim_time+3), a
	.local	.LBB15_95
.LBB15_95:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+21)
	push	de
	pop	hl
	ld	bc, 4
	or	a, a
	sbc	hl, bc
	jr	c, .LBB15_99
	.local	.LBB15_96
.LBB15_96:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _friskidledown_data
	.local	.LBB15_97
.LBB15_97:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 8), hl
	call	_gfx_ZeroScreen
	ld	hl, (_player)
	ld	de, (ix - 14)
	push	de
	push	hl
	ld	hl, (ix - 8)
	push	hl
	call	_gfx_TransparentSprite
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_hardMode)
	bit	0, a
	ld	iy, 1
	jp	z, .LBB15_153
; %bb.98:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 254
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, _.str.81
	push	hl
	call	_gfx_PrintStringXY
	ld	iy, 1
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB15_153
	.local	.LBB15_99
.LBB15_99:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, JTI15_1
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	ld	iy, (ix - 14)
	dec	iy
	jp	(hl)
	.local	.LBB15_100
.LBB15_100:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, (ix - 17)                    ; 1-byte Folded Reload
	jr	z, .LBB15_96
; %bb.101:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+15)
	push	de
	pop	hl
	ld	bc, -3
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, b
	jr	nz, .LBB15_103
; %bb.102:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, 0
	.local	.LBB15_103
.LBB15_103:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, a
	jp	z, .LBB15_96
; %bb.104:                              ;   in Loop: Header=BB15_1 Depth=1
	push	de
	pop	hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB15_181
; %bb.105:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 14), iy
	ld	hl, _friskdownmove1_data
	jp	.LBB15_97
	.local	.LBB15_106
.LBB15_106:                             ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 9
	ld	iy, 1
	jr	z, .LBB15_108
; %bb.107:                              ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 54
	jp	nz, .LBB15_153
	.local	.LBB15_108
.LBB15_108:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_menuSel)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, 0
	jr	z, .LBB15_118
; %bb.109:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, -2
	jr	.LBB15_118
	.local	.LBB15_110
.LBB15_110:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 16384
	ld	e, d
	call	__lsub
	ld	bc, 255
	ld	a, d
	call	__lmulu
	push	hl
	pop	bc
	ld	a, e
	ld	l, 14
	call	__lshru
	push	bc
	call	_fade_palette_from_black
	pop	hl
	call	_gfx_ZeroScreen
	ld	de, (_ouatSlide)
	push	de
	pop	hl
	ld	bc, 11
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB15_120
; %bb.111:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_ouat_current_y)
	ld	de, 70
	push	de
	push	hl
	call	_draw_ouat_frame
	jr	.LBB15_123
	.local	.LBB15_112
.LBB15_112:                             ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 48
	jr	z, .LBB15_116
; %bb.113:                              ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 54
	jp	z, .LBB15_74
	jp	.LBB15_153
	.local	.LBB15_114
.LBB15_114:                             ;   in Loop: Header=BB15_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	(_gameState), hl
	.local	.LBB15_115
.LBB15_115:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, 48
	jp	nz, .LBB15_153
	.local	.LBB15_116
.LBB15_116:                             ;   in Loop: Header=BB15_1 Depth=1
	or	a, a
	.local	.LBB15_117
.LBB15_117:                             ;   in Loop: Header=BB15_1 Depth=1
	sbc	hl, hl
	.local	.LBB15_118
.LBB15_118:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	(_gameState), hl
	jp	.LBB15_153
	.local	.LBB15_119
.LBB15_119:                             ;   in Loop: Header=BB15_1 Depth=1
	inc	iy
	jp	.LBB15_147
	.local	.LBB15_120
.LBB15_120:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	bc, (_ouatSprite)
	sbc	hl, hl
	adc	hl, bc
	jr	z, .LBB15_122
; %bb.121:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 2
	push	hl
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	push	bc
	call	_gfx_ScaledSprite_NoClip
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, (_ouatSlide)
	.local	.LBB15_122
.LBB15_122:                             ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _ouatText
	add	hl, de
	ld	bc, (hl)
	ld	hl, _ouat_frozen_chars
	ld	de, (hl)
	push	de
	push	bc
	call	_draw_typewriter_text_centered
	.local	.LBB15_123
.LBB15_123:                             ;   in Loop: Header=BB15_1 Depth=1
	pop	hl
	.local	.LBB15_124
.LBB15_124:                             ;   in Loop: Header=BB15_1 Depth=1
	pop	hl
	jp	.LBB15_152
	.local	.LBB15_125
.LBB15_125:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, (ix - 17)                    ; 1-byte Folded Reload
	jp	z, .LBB15_164
; %bb.126:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+15)
	push	de
	pop	hl
	ld	bc, -3
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, b
	jr	nz, .LBB15_128
; %bb.127:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, 0
	.local	.LBB15_128
.LBB15_128:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, a
	jp	z, .LBB15_164
; %bb.129:                              ;   in Loop: Header=BB15_1 Depth=1
	push	de
	pop	hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB15_177
; %bb.130:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _friskleftmove1_data
	jp	.LBB15_97
	.local	.LBB15_131
.LBB15_131:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, (ix - 17)                    ; 1-byte Folded Reload
	jp	z, .LBB15_165
; %bb.132:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+15)
	push	de
	pop	hl
	ld	bc, -3
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, b
	jr	nz, .LBB15_134
; %bb.133:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, 0
	.local	.LBB15_134
.LBB15_134:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, a
	jp	z, .LBB15_165
; %bb.135:                              ;   in Loop: Header=BB15_1 Depth=1
	push	de
	pop	hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB15_179
; %bb.136:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, -2
	ld	hl, (ix - 14)
	add	hl, de
	ld	(ix - 14), hl
	ld	hl, _friskrightmove1_data
	jp	.LBB15_97
	.local	.LBB15_137
.LBB15_137:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, (ix - 17)                    ; 1-byte Folded Reload
	jp	z, .LBB15_166
; %bb.138:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_player+15)
	push	de
	pop	hl
	ld	bc, -3
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, b
	jr	nz, .LBB15_140
; %bb.139:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	a, 0
	.local	.LBB15_140
.LBB15_140:                             ;   in Loop: Header=BB15_1 Depth=1
	bit	0, a
	jp	z, .LBB15_166
; %bb.141:                              ;   in Loop: Header=BB15_1 Depth=1
	push	de
	pop	hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB15_183
; %bb.142:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 14), iy
	ld	hl, _friskupmove1_data
	jp	.LBB15_97
	.local	.LBB15_143
.LBB15_143:                             ;   in Loop: Header=BB15_1 Depth=1
	cp	a, 51
	jp	nz, .LBB15_167
; %bb.144:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, (_nameLen)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB15_148
; %bb.145:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 1
	ld	(_gameState), hl
	ld	de, 0
	ld	(_zoomTimer), de
	ld	(_confirmSel), hl
	jr	.LBB15_148
	.local	.LBB15_146
.LBB15_146:                             ;   in Loop: Header=BB15_1 Depth=1
	dec	iy
	.local	.LBB15_147
.LBB15_147:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	(_cy), iy
	.local	.LBB15_148
.LBB15_148:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	l, -9
	ld	a, (ix - 14)
	and	a, l
	ld	l, a
	cp	a, 48
	jr	nz, .LBB15_151
; %bb.149:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_nameLen)
	push	de
	pop	hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB15_151
; %bb.150:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, _name
	add	iy, de
	dec	de
	ld	(_nameLen), de
	ld	(iy - 1), 32
	.local	.LBB15_151
.LBB15_151:                             ;   in Loop: Header=BB15_1 Depth=1
	call	_draw_keyboard_screen
	.local	.LBB15_152
.LBB15_152:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, 1
	.local	.LBB15_153
.LBB15_153:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	a, (_clearHeld)
	bit	0, a
	jp	z, .LBB15_163
; %bb.154:                              ;   in Loop: Header=BB15_1 Depth=1
	call	_clock
	ld	bc, (_clearStart)
	ld	a, (_clearStart+3)
	call	__lsub
	ld	(ix - 14), hl
	ld	(ix - 17), e                    ; 1-byte Folded Spill
	ld	hl, 10
	push	hl
	push	hl
	call	_gfx_GetPixel
	pop	hl
	pop	hl
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	ld	hl, -1900032
	add	hl, de
	ld	hl, (hl)
	ld	(ix - 20), hl
	push	bc
	pop	de
	ld	e, l
	ld	d, h
	push	de
	pop	hl
	ld	c, 10
	call	__ishru
	ld	(ix - 8), hl
	ld	iy, 31
	lea	bc, iy + 0
	call	__iand
	push	hl
	pop	iy
	ex	de, hl
	ld	c, 5
	call	__ishru
	ld	(ix - 23), hl
	ld	bc, 31
	call	__iand
	ex	de, hl
	ld	hl, (ix - 20)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sand
	ld	(ix - 25), l
	ld	(ix - 24), h
	ld	(ix - 28), de
	ld	a, e
	add	a, l
	ld	l, a
	lea	de, iy + 0
	ld	(ix - 31), de
	ld	a, l
	add	a, e
	ld	l, a
	cp	a, 46
	ld	iy, 31
	jr	c, .LBB15_156
; %bb.155:                              ;   in Loop: Header=BB15_1 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	.local	.LBB15_156
.LBB15_156:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 11), iy
	ld	hl, 16383
	ld	e, 0
	ld	bc, (ix - 14)
	ld	a, (ix - 17)                    ; 1-byte Folded Reload
	call	__lcmpu
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	push	bc
	pop	hl
	ld	iy, 255
	lea	bc, iy + 0
	call	__imulu
	ld	c, 14
	call	__ishru
	lea	bc, iy + 0
	call	__iand
	push	hl
	pop	bc
	ld	hl, (ix - 11)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	de, (ix - 31)
	or	a, a
	sbc.sis	hl, de
	bit	0, a
	jr	nz, .LBB15_158
; %bb.157:                              ;   in Loop: Header=BB15_1 Depth=1
	push	bc
	pop	iy
	.local	.LBB15_158
.LBB15_158:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	c, iyl
	ld	b, iyh
	call	__smulu
	ld	(ix - 31), iy
	ld.sis	de, 255
	ld	c, e
	ld	b, d
	call	__sdivs
	ld	c, l
	ld	b, h
	ld	a, b
	rlc	a
	sbc	hl, hl
	ex	de, hl
	ld	e, c
	ld	d, b
	ld	hl, (ix - 8)
	add	hl, de
	ld	(ix - 8), hl
	ld	hl, (ix - 11)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	de, (ix - 28)
	or	a, a
	sbc.sis	hl, de
	ld	c, iyl
	ld	b, iyh
	call	__smulu
	ld.sis	bc, 255
	call	__sdivs
	ld	c, l
	ld	b, h
	ld	a, b
	rlc	a
	sbc	hl, hl
	ex	de, hl
	ld	e, c
	ld	d, b
	ld	iy, (ix - 23)
	add	iy, de
	ld	hl, (ix - 11)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	e, (ix - 25)
	ld	d, (ix - 24)
	or	a, a
	sbc.sis	hl, de
	ld	bc, (ix - 31)
                                        ; kill: def $bc killed $bc killed $ubc
	call	__smulu
	ld.sis	bc, 255
	call	__sdivs
	ld	de, (ix - 20)
	add.sis	hl, de
	ld	(ix - 11), l
	ld	(ix - 10), h
	ld	hl, (ix - 8)
	ld	c, 10
	call	__ishl
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 31744
	call	__sand
	ex.sis	de, hl
	lea	hl, iy + 0
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 992
	call	__sand
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld	l, (ix - 11)
	ld	h, (ix - 10)
	ld.sis	bc, 31
	call	__sand
	ld	c, l
	ld	b, h
	add.sis	iy, bc
	add.sis	iy, de
	ld	hl, -1899528
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	pop	de
	ld	hl, 252
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	iy, (ix - 14)
	lea	hl, iy + 0
	ld	e, (ix - 17)                    ; 1-byte Folded Reload
	ld	bc, 16384
	xor	a, a
	call	__lcmpu
	ld	hl, _.str.82
	jr	c, .LBB15_162
; %bb.159:                              ;   in Loop: Header=BB15_1 Depth=1
	lea	hl, iy + 0
	ld	bc, 32768
	call	__lcmpu
	ld	hl, _.str.83
	jr	c, .LBB15_162
; %bb.160:                              ;   in Loop: Header=BB15_1 Depth=1
	lea	hl, iy + 0
	ld	bc, 49152
	call	__lcmpu
	ld	hl, _.str.84
	jr	c, .LBB15_162
; %bb.161:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _.str.85
	.local	.LBB15_162
.LBB15_162:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	de, 10
	push	de
	push	de
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	iy, 1
	.local	.LBB15_163
.LBB15_163:                             ;   in Loop: Header=BB15_1 Depth=1
	push	iy
	call	_gfx_Blit
	pop	hl
	jp	.LBB15_1
	.local	.LBB15_164
.LBB15_164:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _friskidleleft_data
	jp	.LBB15_97
	.local	.LBB15_165
.LBB15_165:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _friskidleright_data
	jp	.LBB15_97
	.local	.LBB15_166
.LBB15_166:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _friskidleup_data
	jp	.LBB15_97
	.local	.LBB15_167
.LBB15_167:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	de, (_nameLen)
	push	de
	pop	hl
	ld	bc, 6
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB15_148
; %bb.168:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _name
	add	hl, de
	inc	de
	ld	(_nameLen), de
	ld	(hl), a
	ex	de, hl
	ld	de, 6
	or	a, a
	sbc	hl, de
	jp	nz, .LBB15_148
; %bb.169:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 6
	push	hl
	ld	hl, _.str.80
	push	hl
	ld	hl, _name
	push	hl
	call	_strncasecmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB15_148
; %bb.170:                              ;   in Loop: Header=BB15_1 Depth=1
	call	_gfx_ZeroScreen
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	ld	hl, 30
	ex	de, hl
	.local	.LBB15_171
.LBB15_171:                             ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB15_185
; %bb.172:                              ;   in Loop: Header=BB15_171 Depth=2
	ld	hl, 1
	push	hl
	ld	(ix - 8), de
	call	_gfx_Blit
	ld	de, (ix - 8)
	pop	hl
	dec	de
	jr	.LBB15_171
	.local	.LBB15_173
.LBB15_173:                             ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	de, 2
	or	a, a
	sbc	hl, de
	jr	nz, .LBB15_176
; %bb.174:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 7
	ld	(_cy), hl
	ld	hl, 3
	jp	.LBB15_58
	.local	.LBB15_175
.LBB15_175:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	(_cx), de
	jp	.LBB15_148
	.local	.LBB15_176
.LBB15_176:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 6
	ld	(_cy), hl
	dec	hl
	jp	.LBB15_58
	.local	.LBB15_177
.LBB15_177:                             ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	de, 3
	or	a, a
	sbc	hl, de
	jp	nz, .LBB15_96
; %bb.178:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _friskleftmove2_data
	jp	.LBB15_97
	.local	.LBB15_179
.LBB15_179:                             ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	de, 3
	or	a, a
	sbc	hl, de
	jp	nz, .LBB15_96
; %bb.180:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, _friskrightmove2_data
	jp	.LBB15_97
	.local	.LBB15_181
.LBB15_181:                             ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	de, 3
	or	a, a
	sbc	hl, de
	ld	hl, _friskidledown_data
	jp	nz, .LBB15_97
; %bb.182:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 14), iy
	ld	hl, _friskdownmove2_data
	jp	.LBB15_97
	.local	.LBB15_183
.LBB15_183:                             ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	de, 3
	or	a, a
	sbc	hl, de
	ld	hl, _friskidledown_data
	jp	nz, .LBB15_97
; %bb.184:                              ;   in Loop: Header=BB15_1 Depth=1
	ld	(ix - 14), iy
	ld	hl, _friskupmove2_data
	jp	.LBB15_97
	.local	.LBB15_185
.LBB15_185:                             ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, 0
	ld	(_nameLen), iy
	ld	a, 32
	ld	(_name), a
	ld	bc, _name
	push	bc
	pop	hl
	inc	hl
	ex	de, hl
	push	bc
	pop	hl
	ld	bc, 5
	ldir
	ld	(_ouatSlide), iy
	call	_load_ouat_scene
	ld	hl, -4
	ld	(_gameState), hl
	jp	.LBB15_148
	.local	.LBB15_186
.LBB15_186:
	ld	hl, 1
	jr	.LBB15_188
	.local	.LBB15_187
.LBB15_187:
	call	_free_ouat_scene
	or	a, a
	sbc	hl, hl
	.local	.LBB15_188
.LBB15_188:
	ld	(ix - 8), hl
	call	_gfx_End
	ld	hl, (ix - 8)
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end15
.Lfunc_end15:
	.size	_main, .Lfunc_end15-_main
	.section	.rodata._main,"a",@progbits
JTI15_0:
	d24	.LBB15_9
	d24	.LBB15_24
	d24	.LBB15_17
	d24	.LBB15_18
	d24	.LBB15_12
	d24	.LBB15_31
	d24	.LBB15_33
	d24	.LBB15_21
	d24	.LBB15_37
JTI15_1:
	d24	.LBB15_100
	d24	.LBB15_137
	d24	.LBB15_125
	d24	.LBB15_131
                                        ; -- End function
	.section	.rodata._layout,"a",@progbits
	.balign	1
	.globl	_layout
_layout:
	.ascii	"ABCDEFG"
	.ascii	"HIJKLMN"
	.ascii	"OPQRSTU"
	.ascii	"VWXYZ  "
	.ascii	"abcdefg"
	.ascii	"hijklmn"
	.ascii	"opqrstu"
	.ascii	"vwxyz  "
	.ascii	"1 2  3 "

	.section	.data._name,"aw",@progbits
	.balign	1
	.globl	_name
_name:
	.asciz	"      "

	.section	.bss._nameLen,"aw",@nobits
	.balign	1
	.globl	_nameLen
_nameLen:
	.zero	3

	.section	.bss._cx,"aw",@nobits
	.balign	1
	.globl	_cx
_cx:
	.zero	3

	.section	.bss._cy,"aw",@nobits
	.balign	1
	.globl	_cy
_cy:
	.zero	3

	.section	.data._gameState,"aw",@progbits
	.balign	1
	.globl	_gameState
_gameState:
	d24	16777212                        ; 0xfffffc

	.section	.bss._menuSel,"aw",@nobits
	.balign	1
	.globl	_menuSel
_menuSel:
	.zero	3

	.section	.bss._zoomTimer,"aw",@nobits
	.balign	1
	.globl	_zoomTimer
_zoomTimer:
	.zero	3

	.section	.data._confirmSel,"aw",@progbits
	.balign	1
	.globl	_confirmSel
_confirmSel:
	d24	1                               ; 0x1

	.section	.bss._ouatSlide,"aw",@nobits
	.balign	1
	.globl	_ouatSlide
_ouatSlide:
	.zero	3

	.section	.bss._ouat_current_y,"aw",@nobits
	.balign	1
	.globl	_ouat_current_y
_ouat_current_y:
	.zero	3

	.section	.bss._ouat_frozen_chars,"aw",@nobits
	.balign	2
	.globl	_ouat_frozen_chars
_ouat_frozen_chars:
	.zero	2

	.section	.bss._clearStart,"aw",@nobits
	.balign	1
	.globl	_clearStart
_clearStart:
	.zero	4

	.section	.bss._fadeStart,"aw",@nobits
	.balign	1
	.globl	_fadeStart
_fadeStart:
	.zero	4

	.section	.bss._ouatSlideStart,"aw",@nobits
	.balign	1
	.globl	_ouatSlideStart
_ouatSlideStart:
	.zero	4

	.section	.bss._splashStart,"aw",@nobits
	.balign	1
	.globl	_splashStart
_splashStart:
	.zero	4

	.section	.bss._skipStart,"aw",@nobits
	.balign	1
	.globl	_skipStart
_skipStart:
	.zero	4

	.section	.bss._clearHeld,"aw",@nobits
	.balign	1
	.globl	_clearHeld
_clearHeld:
	.zero	1

	.section	.bss._restorePalette,"aw",@nobits
	.balign	1
	.globl	_restorePalette
_restorePalette:
	.zero	1

	.section	.bss._hardMode,"aw",@nobits
	.balign	1
	.globl	_hardMode
_hardMode:
	.zero	1

	.section	.bss._isSkipping,"aw",@nobits
	.balign	1
	.globl	_isSkipping
_isSkipping:
	.zero	1

	.section	.bss._ouatSprite,"aw",@nobits
	.balign	1
	.globl	_ouatSprite
_ouatSprite:
	.zero	3

	.section	.bss._windowSprite,"aw",@nobits
	.balign	1
	.globl	_windowSprite
_windowSprite:
	.zero	3

	.section	.data._ouat0_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat0_compressed
_ouat0_compressed:
	.ascii	"\240 x\000\002\017\020\000 1A\000\330\236 \243b\000A \330\237 \303`\000\20000\237\004\243\202b\202\243\ra\237\032\241\360\360\235\013bA!\000 b\243l\237\b\240\251\207G\273\235\t\320\000\2433\206\237\222\020\274\f\042*!\042 !\020\000\2022\204\237h\263\350\n\243l\236/\000\242\t@\245A\243\201\224\237.\004\tD\301\202!\214\000@A\306\237\020\210\216C \237b\234\231&\301\024\243\fa\237\017\204\261r\234\341\230\036\201\2207\207\237\022\016\034\376R\000b\006\020\237\202x\023\302\336\225\236m\241`u\237\004\2430\237\007A\202\274w\002W\301e\355\003\000\237qe\240\244\243\206\306\3009\221Vb\340P/\202\237\303\nA\237\243\034\221\266\340P3\004\237B\031\202x\026Z\3752\337\2109Ob\242P1\004\237\350u\243l\237\022b-\231\035\371\205\320\374\246\r\003\277I\356,\016\227|~\0163\276A\234\t\336\340\006E\237\305\265b \240P\224\360\007\341\377\255A\325\375,&b\324\b\000\fq\377N\000\202p\177\000x\301\030f\277\351\331\353*\042\353#\b&\201\227\237\342\202\235\346\000\342(c\342%$\234\274`q\237\016w\033\237\b\264+\243lE\n\373\377(\222\313\257\237\003\002\r\217\277+\013\003\237\2026\201c\237\371i\232\221T\366\341h\220\240E\202\202\237\202-\272P\202,n\377\22337\223\001a\245\360\005\021H\336\\(OD\013\002\317\237\343\223,\315M\361=\000\302\024\334\000\034(\340X\330@\265\237S\207\237\000\017\207\237\027\n\206\237\331\020-\335\277\225\263\215\275\362\001\007\232\327\243\b\216\376\347(\275\030\025\302\237\346\342V\276\227\003\002\207\001\237b\t\206\237\024\243\201d\237\042J\263b\334\206\303\237*\204\244\251\202!\340\005[\237\b\342\263\273\000\030\207\312\336{\351\270\370\200\207\237\004bu'u\203\204\236\013!\237\307\020\316t\227\310\243\042\336+\340,\303P\303/\004\237|s2\200\221\343\351\267\363%\254\340\004H\237B\003\351D\336\202\201t\237\034b`$\237\037\025\000\004E\336\264\357\377\313\002\302\237\341\207\036\2243\264\231\021\r\276\004\237\360&,\324\237&\277?v\000\017\354\373\f\341\237\n\n\277\202\b\217\376\343\032\003\236\033\005\235\377\205B\237\024\275\274\213\342\273,\f\235\b\030\002\237\022\324\210\361\226\214\303\033\223T\202\203\275\240\n\202c\237\r\242a+\225\206\001\237\243\202\237b\206\363\3642\t\243\f\201\237e\267K\001\202\314\211a\tY&\206\355\207\265)\303\241\000\265\234\201\214\337\246\000\342\b.\n\r\027\000\273\264\267+\202\b}\246\003\n\237\304\\\023u|\024\042\214rU\223H*\210\2203\005\237\310\002\3017yp\016\300\237f\367!\272\273\274\326\355\n\212 j\337+\000\207\312\337\360\031\231\232\037\240\nc\237T\243|\016\036A\000\370\237A\374\000\007\350\237@\305\000\007A\237\204\240\fH\000\000\000}r\000\000\001"

	.section	.data._ouat1_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat1_compressed
_ouat1_compressed:
	.ascii	"\240 x\000\0027\020\000\303h\000\242\202\310-<\237\004\304.U\343\b\344\242 \242S\035\024z\202\002\037\303\025\035\204`-U\277\026\304\236\004\202A*\031\202Hb\231\b\202\030\306\277\030\276\020a\000a\304B\243\253\033a\027X\343\245@\330\237\b\242\320\236p \004\260\330\244A\006@a\322\237\005\243\243\305\004\220\257a  'a\344\034\216\310$A\243\330\204\245\r\004\337\202O\202\004;\000 \000,!\242\240\001\304\344b A\026\347X\017\000\243\304\334*\343\042\017@\237\304\301\224!\204\241\200\025baA \243\210\351&\343\335E\000A7\300!\300\027\324\237\f\201\2019\004M\377\243*\006a\300\240AA\256\004\005(\211\024\243\027\243Z\344\232\270 \003\032[\277\237\f\322\371\003B\253U\006\343\005\210\205\234\242\004\202A\211!\266\325\272%\304A\202\237\202\0060\237\322\374\347\350\001V\202\002\300)\243\332\305p\240\223\000\300\030\264\227\320\200\343\243\260\233\326\277\0060\237)\201\202\236\260\234\356\003\000\313\341\n\235\2020\205\230\240<\007\321\247\264\005\242-\254.\261\244\f\304\026\242\343\201\204\237\022\242\005\226\335\005\000\024\346\341\237\262\267\202q\277\241\300\342\027\200\265\202!bA\302b\312\351\0068\377\306\275(\236+\000\017N\242\210\272\233\304\042\000 G\253\240\004A\211\224\324\276<\277\310\243\021\002\237@\223G\202x\000Z\274\332\232\304\305\0007\254\bl\330b\202\035\374@\243\216\237\020\232\000b\236\332,\237\023\202\245\201\245\202\n\271\304\027\333-\343g\236\004\202\t\340\237aR\201\201)a\000A \274\341\241\022\200\212!uJ\304\342X\332\3504\344h\265S\202\240\b\243S\237\013\232\013\000\232\373\042\204\301a\202\221\2034\003a9\371\023M\306\005\246\254\352\t\241\237S\003\214\263}\000\007\255\327\236\334m\325\225\335L\2166\270\323f\206\363\260#.\237\2643\331\000\336C\001\240e\344a\300C\325\242\231\202\bW\227J\336\226\004 \237Ya\324Q\365\304\004\2376\240\022>\000A2\t\033\257k\370>\004\336\225\0040\237\224\276{s\004\265\000\201\f\2477\000c\276\302\002@\236\343\302\334i\tC\237\347d\243\ta\237\240\007a\220\237(\2344\211\204\327\240\217\006A\300\261C\310=\350 \343\370\337\246\000\247\330\267\334A\201\b\237! {\271\301\342\343\024\351X\236&\343\250X?\237\f\223\042B\243\316\334\b\002\236\027\227\371\217\360\234\351\252\250\323\211\233(?\237\tJ\337!\000 \016-\2352\276\242\030\335yk\222\236\tf\251_\372\201\000\237<?\277b\202\240\332\276\032\341|\276\020\243\324\374%\202\331\372T\252\013Y\226[\017\302\2370\277ab\336\336\326\252\000\223\360\277\204\301\236\304\304\000\214\300\206\245\303\271RPW\201$\034\3776\2766\331U\267p\256\333\177\316y\3160\300\337F\007$M\241\367\002#\277N\375h h\335\253\233\341J\231\302\201\252\266]\366g\243\371sF\314\314\t\341\237\016\236\375\2439\343Ba\2377\316\341\233c\300\304\002\304\263\t\341\237\r\205\236\204\237a\336D\275\345X\032\240%b\201H\271\322\201\030\237$\274\273\372\330w\331<\302\261\243\231\313\321A\017\347\\\026\033\305\340\274\325\\\253@\230\237\020\350\275\330\240\264\242\236\211\262ov\247\250\261\300\351\266\304|\026#\nA\237,\000\020Z\270\202*\272\372\205N \240\013\3439\236\327\320\202,\004\237\020g\330\235Q%\336C\2518\240P\251K9B\301\304\302\236\005p\237\207\212\335\300\237A!\214\224\246\242\240\005b\304'\007b9\257\270@a\260\237\020\370\276\336\177\216\021\300\240 \265\244\2119\326\244\005\200\237AA\020\236G\336\274\342]4j\346 /\206`P\237\004\201\024\201\237!\243\037\367\273\345\345\342\3069\234\204\t\241\237\304\365\024\222\336!\021\272\274\2168\026\300\333\245\253\356\344\005\042\337\237\370a\331\200G\343\000\236\242\242b\342B\222\200p\241\201Q\277\256\000\013\202\237\226\243\225\241!\036\341P*\322\237A\370]\000)\237Y\373\206\031\212#\326\242\005{\277\274\000\273\341\244\210\250\337\204\334\000\243\030Y\332@\262\237\013\202\002\206Y\311 \n\202\237\304\376\236\355\035\335\340W\277\264\201\341\237;\312q\004\211\217\302\t\341\236\320\000\364\245  e\243\377\002\250\2378\202\000\357\247\307\213\000\224\227&\r\352\002}\026\000\254\341\031bb\303\042a\344\002\250\237\042\201\202\237\232\307_\214J\201\217\222\205\255\020\026\243\344\270\237*\344\302\337\343\233\324\243u\300PL-*\237A\336\345c\353\261i\201\201A>\017\020\202B\242\301\237\177\241L\310\243\247#\2435\332\002:\201\0050\237\302\207\316\311\376\000i\330\n\202\243tN\242\362\367\031\013\205\237\f\277\313\250E\206\330\006\330@\216\2774\332S\225\343t\351\243\276\272\bb\211\251\000c\336\242\271\002\262\223\200\237X^\000P\272\311\341\000\343;\344a\235\0029\337ZV\202\205\250\243}\004\214\345\005b\202\242h\304\254\250\343\344(\243b\340\264\030\243T\024u\304\341\276v\034\300. JE\360\201\030\337\273SW\373\004\002\252\034\005\304\344T\344\rz\177\344H\004B\027|\036\370\330A\274w@A\206\337\306\245\243\242\006\352\215K\242\236\357\b\022\203\361\277\201\r\000\343<\007$\303\b\000\000\177\362\000\000\001"

	.section	.data._ouat2_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat2_compressed
_ouat2_compressed:
	.ascii	"\240 x\000\0027\023\000\202\232\000\242\303\003\303\004\246\000\242M\243\232Z\004@\237\262N\243\304\n\200\200\343\304C\3048.\031\242\343\343 \242\243K\237\n\300\024\243\026\b\241\202a\243C\343\026\034J\243@\242\226\237\n\202q\206\306\256^\005\006q\241<\242 \000\240!\240\236\2018\337\261\300\020\304\243\243\311\257(a\215> $ \022! \310\001\202\304\\\236,\270'X\201\025\237L\242b\262\370X\\\313\224A\255 A\242aaA\036\202\343\243\005\331F\304\202\236\016!\021\024\277\032\346\017$\000\270U\022\316\377\306\234\026\211Z\274\025!\003\216a\3623ba\244\r\000\201\202\240A\254\021\322aQ\274\302\355\316\373\004\342\337\260\370\204C\234\000v\243l\215\032\002a*\000\254\020\261(\314\\\202#b\232s\007\204\233\t\241\237I\200\307Y\202\235\243\206\326\211\325!!\315E\205\237\315\021\022\205\325\256\003\242;v\265\201P\237,\337\270\003\347\303\265\000A\224\336p\240&!\300\030\264\000\242\355\262\002\260\237Z\204\\\003A\367\330\236$A\274\030\\\237)\022b(\304\037\243\201\007<\002\360\237[\307K\006\\t\n\204\331 \230\236#\023\200\322\031\367\023\343N\202\2768\252p\004/\205\237\334\000l\243\253a\200\022\000 \216\237\016\003\231\330b\254\242d\000\f \237\201\222fB\267GA\002\240A4\277W \007\032\236\026\303(\201\022B\237\022\356\t\312\254d\t!I\337L\213\027\030:\261\363&\204\262p\243 aF\237\004\242p\272\375\003]\304^\225\311\244\202\341\2408\273T\026\365\261\t\353\000FbI\230\357 I\277\027\201\000\t\246nA\274\024A\304\337\242\251%*\261?(@\204\221\211A\007`\237A\302\221<\332\241:\000\231\017\002\006\230\221-\334\273\016\f\343\026\370(\000\340\240Aa\360\237a\363\017\204\236\340\237A\271\006\202\237\262\361\302\236X\017\242\365\230\237%\270\224b\220Tx\377\177D@8\240!b\360\237\260\220\234\341\376|\016/\364&\351\270\221\277\273\t\236\b=\377;E\340l\200\276V!\2732k\t\274\324\273\236|\360\256 \0005\336\341\020\237\203\363\377\276\000H\037\375:\237\013\337\031/%\262\372\000\207\372\265\t\206\277&<\021\237\b>\3779\302\240\031\237\016\035\302\235p\236\301\225\243|\241\343H\303\2322\205\206D\243x\300\317\t\2404AC\237\013\200\004\201,\235\021\005\2473\256\245\243\236\013\024\322\203\262\335xAH\237\027A\005\002 \277\360\000\202\236\314\267\023\275\247K\n\007^\302\303P\303\232M\311\372\207\\'\275\263\021\000\025\n\0028\277\242\201\302\237P\261\227\312&\274Y\206\276\300\237\202\243\306\303P\257\324\b\202\260\265.\021\242\023\204\234\260\004#\215\277\305K\244\341\377\244;\374\314\374w\000P\325\243\365\000\236\373\032\007\301\032\322e\242<\353P\237J\314\023$\230\037l\377Y\207L\321\222\334g\003P\225DX\b\267\351\200\320x\241\022\243\343r\177\212\201\370\007\003\260\237\251\024\002\237\004\037\237\214\232\t\346dj\214\230\350\231\026\260\027\244\212\022D\242\r\350GH \b\202D\237\372^\215\253\375]b,r\361\371\034\237\021a\301\205\234\307\042\205\237$\323\b\001\237>a\244V\330Q\277\252-]\360\027i\250\237F\004\335\263/\223\325b\b\221\3041\347\201\f\237\021bQu\266{\331\\y%\030\035.\315\042\307s\344\214\264\007\241\bb<\337)C\366\243\030h\236'\360)\316\351>++\234b\302\237dS\201\036|\237\361V\350\000\201D\236\026 u \263\324\206\303\240\227\b\332\316\203\342\337Ba\341\240\036\303\317\201\243\344\237\004 /*g\371\022\277<\006\2254\000\300\n\204\237\026\243\322\334\277k\342\305\214\276\301\237\224\341,\353)bB\232\356\004\005~\317\3402\362\377&D\212\335\310P\277\271e\303\237\006\235\323b\212\331(\317\022A\374\270\301\236\240\005!\360\237:nD\356\211\356H\000\030\355$!\341\237\312\b\036\201\250\001D\2400\346\342\250n\277\313\331\f\252\b7\203\260\237J!\240\b\242\300\235Mak\024\302H \220\237\273\007\206\324ab\232\304,\242\241\237=KA6\350\237so'KbV9\201\303\n\036\227-\3738f\260\237\232\352\042\302\237Z\305\233C\003\237\353\340A\237\t\301\240\201$O,\341H \220\237\262\340\215\237\004b\241\237g\246\030\237\013A\236\b>\3775!\324\000H\340\237A\214\243Y\322\224\206\276,\237\042\203\302\357>\001q\376\216\236\nM\370+\376\201\004\237;s\227\004bX\237N\316p\240\237O#4\221L\321\022\311\005@UL\033\342,6b\304\202\004!\277\352q\000[]\310\034\224m\373j\004!|!0\237k\306\042\ba\023\000\260\254\3561I`\345b\303,A\303\304\2401E\237\n\257\3310]\367'\303\243r\215\237\013\3439B\250\027\240\013?\211\241\n\221\321\304\303A\002\020\237s\000\\R\005'z(\237\\\0354\237\034=e\000\300\372\243\304\242\203\370\377\212\300\024A\260a\260\237\042!B\237\bB\234\351\000U\303\002\024\377N\241\267\000\004\201\237P\b\340\235U\352\311%\333\005\301@\210\237\034E2\237\027\022\305 \215\277\303\007!\235a\237=T\3008\250\237\024\330\211\242\341z@\237\341\000b\332\344%\272\031\212\226\340\007T\277\021\242\242\202<yX\237\\p\360+\260\236Z\002 xV\021\306\277H|\350w\271x\316\3774\313!%\230\236\034p\241\201H\237&x\341\005\360\237\235\361\241 \237\340%\\\237\bBxx\042N*8\310&\202H\021\203\237O\235\200!\311\000\022\352x\007p\237-\240.&'\000\377\330\000\177\362\000\000\001"

	.section	.data._ouat3_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat3_compressed
_ouat3_compressed:
	.ascii	"\240 x\000\002\017\020\000 1A\000\330\236\023ab\r\000\202\242\202\002\243\002K\000\242L\344QYAa\320\2400 \227\236\000\210N\242\303\022?\000M\003\242\t\020Xb\042\207\237P\005\301\237\016\002\317\243\220\002\243&\002\237\202\241O\301\221\217\236\000!!A\242\2070,\236\2010\2378lh\240\006\243bA\215\037q\000\020\020Ah!\000\202l\236\b\243\202\022\303\237y\260\240B\243\313p\202\215\001a\202a\340\000\222\242\321\361bF\214!\270\021T\235,\334\246\3748\022\216\377\306\234\026\237\002b!L\000\227+\001\236\t\022\005a!\021\242c\372\244K\202\t\301\237\f\215\276%kA\237\b\251\000\202\261\206\314\020\344)\226\227\004\360\237\266\216B\242\013\205\321\000\325J\236\bA\360\237\233\022\042\306\322\322\233\347;\325x\024\302\237\353\237]\215\367;\177\230\236#B\240=\022ba\2509\365\300\254\237\026\204\227\003\030\236\013A\235\bl\2379B\035\020\242\007\300L\272\237\034\000\303\201\374\005w\nX\234F\244\200A\027Ab\274\307\325\0232a\255\002\350\237\\\000\341\204\036\236\016!\0178\237+\006\306\004ad\000\f \237b\230\214P\202\220\240G\207\237\007\306\022\330\000\303\300\220\237\004\000a.\275<\006\320\t\211\340q~+\261R\n\307/\207\243\003\002\230\237o\250\367\002Y^\n\224\343\241\214\022\3307\n\nT\000C@\357 \000\352\0004\213\270UMkA\036\314\\'\305\340\t\024\333\042\211\210A:\236\006 \376\250b\362\332\205\002\242P\234\230\221\023\202U\262\307\026T'\000p\240p\023v\337\\MP\240!a\360\237OA\260\177z\n\022\257\023\244\261H\237$b\013KbT\007m\277\\DL\345\335\017\205\237\257\254\003{\360\327\2147\032\342Hb\361\277\273\tT\203\302\337I\000O\303C\343\276-\000\272\tb\000\347\327\242\013\324\301}\323\317(\030\237\034\000\037\204\237\360H\351\375\324\042\255\222\205\230\377\204\340}\000N8\220\234\000y\377\317V\300\030\204\237\034I4\336Q)\037\202\303\237\307\376\002\323\021A\r\246\264\367(\240\031\232p\007!\204\237\243\236\f\005\235\234\200\351\247K\235/\272\313\023\244\211\361A\241\237:XA\004@\237\232\324!#\313\271\025\212\375h\316\312\332\322\200\202\237\177\311\273'&\3411X\000\021\006\277\222\3670\233'\311\331\326\275&\356k\003\337$\242\270\020\313\333\241T.C\202\332KAz\0046\201\030\237\042f\326\354\n\321\345\270\031\332\333&\245q\252\265\233\240\240\273\007\031\355\020\210&\035\271>B\314\350\b\207\350\312 \362\237\243\247\000\256\033\005\342dw\304\213\b\320\237\260\241\323\207\024\234\240#B\237\302\316\273\b \000@\243\214\237\021\177\363$wP\227k\206q\007\205\350\023\021\330\022\240X\260U\013IH\034\336\342P\243\201\000\237\032 U\243\355W\211\247q\271\\;t\000\013\354\032\312\223\303\324\034\013H\252M\007-@\275\367\255\254\322\025\302\341\237\360\020\005~\237\022PA\220U^\205\250\335\000e\325\020g\310\016\247\310\303\360\237\342\016\222\224B\350Ka\270X\226r,XF\276\331\206\301\360\277\363R\005\241\202\375\243\177\r\n\226\013[\230\253>\t\001$\334{\037\006\213\225N\022\352\242\373\230\b\224\365\337\243\007\r5\350\301\330\237Q\363\367@\217qV\000\r\202\211\270\016\016\302\247\266\362B\321\352\t\031\3422\222\204\303\334\032\233\271\346\225]\265gAAb\332\237\246aV\216\000E\243\004\236\305\022a!\005\210\324u\032\243\331\331\000\331_\005\0068\240N\237\t\243`\006@\277da,\240\023sZ\030\203\236\242\211\373\212\016\005\306\315d\370\342\000\201\314\242iH\242\303\237\r\273\344\226\000\017\302\237b\230\273\222\220\355\242b\000\226\fa\237\030\244\261!\305\204F\353P\247\264?\243\343\270a\2516\220 !\362\277\347\240\f\360'\000\212\240\b\224\226\302\230\306\271X\006\360\240\264\225\230\356j;\354\f\276eP\301\243!\007\201\237To\221\025K!\276\303$\355A\224\2300\237\230\300b\306\346\223=b]\252\274\327\273\245/\215hU!?\237\005!\215\262\334\202\341\236\302W!\240\234\375H\237$A\262\030\263\206\261\247\225\252\254\231$\236\t\320KA \204\237\337KrU\177\njf\027|1\375\305\007\237\007Q+\222\035\256\231\342\023\204\237\266H\007!\201\004\237\023!\004\226RWb=\202QA@\237!\263\216\213\237\tY\271\243K\332<B\305\343a\236\300\005\200\237\035y\315TQ\026\243\266\322\323\244\344P\237]\252\322\320\316\360r\255\210\\*\b\343\276(\355n3\2021\004@\237\256\325\211\237\n\327\331\236\257d\000A`\237N\3447\244\321+\324-\013\334@L\213\233\3606G!\204\237\201\240\335RYI[\200\374{Z}!4\2378)I\000ba\327$A\300\345\242\3526\217Pa#\207\237O.]\367\031\264Or\030\237\030\214\347\343(\237p\037\240\240P\260\305X\000\365\325\376\300\210\237\t!\345Q\300\030Bz~$ \031\237\n\034\234\231&\006\254(\360PA$\204\237\320X\224{L$\220\b\240\236DM\000\013\377\3120\234\250\bo\337<{\360_\214{p\237G\306\042\022\327\202y- 0a\237\013\022\211#\236\007\031\237\t\302\315\370(\n\025\202\237\221\330\242<y(\237\034\000*\235\037 \001\037\000\002\030\237Oe<x\265\232\307\f\004\237`\313B\241\236$\002\360\000*\212\277b\020x\205\002\237\332\351x\362\236\000x\034\024\001\237b\025dw\214pv\370\237T(\361&\301\237\002\200\277\327\307GL\334>\237\020\254\000\213\224\002\221\337C\220tX\237\020\201\000 \000\0022\000 \032\001\205a)t& l,\000>\271\000\000\000\200"

	.section	.data._ouat4_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat4_compressed
_ouat4_compressed:
	.ascii	"\240 x\000\000J\376\000\200\000@"

	.section	.data._ouat5_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat5_compressed
_ouat5_compressed:
	.ascii	"\240 x\000\002\017\020\000 1A\000\330\236\020\242\2430 \000\242\350\240\004 \243\303\f\b\000\243\000\246\240\237\024\243\243\242\000\243\200\226\237\000\243\202\202\201\377\000\004\000\242\b\t \237X\242\231L\240\030\241@H\006\237\236\023\341\000\2428\302\300E\004\237H\236N\304(\243\b\260\237B\202X\000\302\300D\005\237\214\264X\300\314\007\243\200\205\237\r\325\343B\236\246\r\247T\243\004\030\237#\242\206\275\301\235a%\000\004\244\017\341\237\316_\220\263\225\331\207\233\003:\000\202\007\340\237\226\224\223a\216\272\231\034\002n\000\343P=\202\237\243\206\256\271\001\005\302\237r\332\211\b\302\240\007\220\237\260\236\271\000\322\2000\274b\t\344\242\003\270\237k\231:\210\335\264\307\204\237H\241 \242t\237\n\326x\202\314\264\205\235\267\241 \240 \201\242q\237\004\242X\216B\301\237\026\241\b\243\033A\237\242+\311\305\f\300\361\017\341\241R\000\241\042\243\042\202\320\025\000t\237\030\364Cy\321\026\204\021U\225\013\005\243D\204\245\345\341S\226%\000\b\334A!!A\000\323\000AA\320S\242\243\267|\031\\\\\346s\020\224\3130\242\026\306\013\242\355\271\331\353!\301\000\360\237t\000\246(\243D\236,\330\370\033\303\347\207\003\240*KA\000-\311H)!@A\206\237\025\000tQ\201\310\243\223\264\371ma#r\326\212\302\245\035\240\f\222\256\343\323!\301\000\350\237&!S\253\\\354\352\216F\243\235\023$\360\260\033\203\252B\210\206A\270,\260\251\201\030\237$\202\b\200\244\272\206\210\216\256\000\306\304\343o\006\245\341\035\022\351\220\217*\034p\244@!\226\237\021S\000]m\007\224\363\343\263\307\017\310\000\3631\023\027\f\256\203\266$G\n\341\237Wuz)\355P\237K\0208\205F\214\260I\373X\220G\300\000\236\237\b!\253\005p\225\212g\013\214\000\271\020\306\251H\r\360\221@A\242\237\021%\227\022\3112$\201x\237N\304\023'|a\t\201\200\277eu\217\214K\242\016\001(\312\243\206\236\037\235\b\021\236\337q\221\204\201\237a)\361N\236\020R\000A\201\f\237\021!#\263\036\236\t!J\342d\203\226\005\nA\234A\002(\277\334\000y\373\306\004\241\263\357P\002\300\235B\260\026&\004\237y\374\306L\013\244\260\270\207p\000-\234\377\361e\363\000\314\022\270\020\371\346\300\276\237\026fA\204`\000\210\235`^\277hA\325#\206\305\340\024\042A\237!4\336C\343\274\003\300\237L\000 \203\361\265\213K@\000\003\377\220\000\000\b"

	.section	.data._ouat6_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat6_compressed
_ouat6_compressed:
	.ascii	"\240 x\000\002 W\000 \001\002\264Z\300\000!\201\202\202aBA\004\000! %\000\247\024!\027\246!a9\242\241\000\243\242\202\304\fq\042JP.x\237\t!X\000A\236B@\240!\2059\000\026\262\031\006a\202\\\000\236\032\303\000\242$/a\243\347\fZ@ \220\237\004\201a*\236\0213w\325\r\003:\037\20114\326\003\243\235\r\303\005\201>M\237\023\207\255&\300S\206\237\n!k\320Ja\240\274\304\f\255\362\t\252\013\201\000\301\323\201c\276 \242'\202M\354\034\257+C\035p\242\007\042\203\237\243j\316\302,\234'\032\271\f\206\211p\251\241\240\350y\232%\000\241\366\260\241\321\000a!\322a\255Z\025\004\243\004P\237: \202GMJa\203\225\006G\3319\240]\004\330\024\254\311\t\335\n\fK\004\000-\033,\242P\362\320\226c\335i\223\240W\242F\237\f\235,\305\345\237\007\243m\366`t\306_\177\003c\253*\212\364\n\324U\001;\356c\310)\224\311\022\024\237\024\317\337\003M\324\0056\b\205\337a\237@\364\243\222m\326\255\346Z\302$\202\307\346%\000\324\r\016\241\2371\365L\3221A\237u\036N\\\0068\b\202\277\201\354M\303\347\237\017l[\225\375,\212\042\006\276\327v\201\0058\237s\002\254\323x\237X\323\3130\0029\377\347\3029\337j^\201\255yC\226\003\271d\306\276\244\036\017\343|\346\2558\237(\225\3451@\201\216\237\026\313\232\000\201^k\300,\237;\006\337\210\261\276\273\033\006\370\005(l\2374\035!A\220\300\216\377y\333.\243\326el\346\b\313(\302\336\356\021\370;\017\301\bp\237)&\202<\000\b\342\277\243\251\314\234\237;\016\224\016r\021\336.xX\204\225\276\241p\237\347\002\276\030\022[\277\333$a@\237j\253\201\232\237\356gp\236\354 \202\042\205\273!<\007p\237O\260\260&\n\277\303\342\262f\300\342\377\254\\\272b\336\334\306\321\342zg\000\f\226\300\242\302\237\37010\023E\277\303\316~\340\367\277\211\202\226\235\347\004\236\013\203\b\221\274E!\204\237g\306\316\274\320&\r\277t\322\327\2166\315]\252\304\225\336\224\357`\237\\\000\374\t\003X\237\\>\2202&\216\277\201\223\311{\200S\254\226\263\005\274\351_\303\316\254\321\350\000a\023\302\237\262\214Q\300\230\236\b\242\201\246\265\234\276y\017'\025\236\bi\000\201\002\200\237%\303\000N\202\335R\204\217@\267\304\277\344\025\004 \236A\234\2378:\023\007\277\235X\300\237\214\276\033\356+\024\262\341\262\322\201\310\237\024\243\325\350a\220\237\343\004*\000\031r\340\207\200\237 A\347'4\201 \237;\000\201\351\372\365w\332\212\376>\031\332\317r\340\207\206\277p\324\3402D\237\005 V\220\234\037\001\002\024\237\021\343\276\214\270\363\206\302\na\237\025\023,)\325\331\002 \277\330\234P\236s\005\205\237OXd\022\336R,\265\026\002\237a\004a\277\260\237\362\003\344\232\201g\337H\300\237\225\235e\000\217\240\b\312\237@ \236\237\034[\301\2368\277\305W\231\0229\376\314\305\322\212\300A\034\277\030\217\320\340\tE\277\265\201\202\236\242\246\002\375\231.`\024[\006\237\tRsA\204\237P\240O\371\261c\277<\223]\323@\216\237\024\2757\2001\201\237\204\207\353\2558\322\314\2773$\203O\253\241A1\277\3708(\021A\237ab\251\243\215\237\013\305)\323\216\n\222s\236\341$\237'\253\371\241BO\237\250.\021C\237\273\030D\237\042g\000\237\013\276\030\324\202\222\005\243!B\237\242?\006\357\004W\337\272\000\236\004\201Y\337D\204\237\265\235q\002E\3378\272\320\337\307\325\263\300\022\226\237\026\377s\274\306K\340\334q\322\016\214\277\343\273Q\020%\374|\t\023k\321OBk\330\0021\377\333\312\316\2763M\\s0\237%a\257y\312\335p\231\261\323\250\003\361\277\245\257\230\361 I\237\t\306\276\177\241\322v\242Fw\004\237\203\304\023\2453}\306\204\266P\237J\322<\037\n\001\237\020\240\027s\372\262\242\336\362\342\372\373\177\005\006\235\301\254\312e\365\033\227\213;\212\237\004\201\222/\204\240\t\000\237\242\223\373\242\277\240u\367`\005\303\006QfC\300\334\023\002\2270\325\370\234z!\006a4\237\027\242?a\245\002C\337\310\2511)\364e\307#\361\362\006\205\215U\004!K\004\311\375\013\255\000\303\003\303|\005?`\237P\262_Q\032\300\007\217\377\025J\022\236\026\334x\230K\307\024\206\224\352Q)\000\243B\242\342}\310\000\202 \234\340E\202 - C\237\n\210\t\376\233Y\000!\343 x\037\272P\271J\24511u\361\r\240\237!K\202\037c\342\002(\277\254A\333\343\002\237\312\260\306\276\345l\000\215\220\013\r\206F\277\306\343\352\001\002\004P\237\211\232Y\237\315X\266\202\355\026\253p\213\2070\000\214\217\237\f\217\354\231-\246 I\337(\210\377\266\313\355r\373g\000C\201\341\237e\307\031\377\022<\366\255\341\002 \277\315\2002l\267\312\370\202\234\241 \204\277d\257X\340\237\210\000\201\030\237,\300v\247\273\005\254y_\266\020\267\245\206\016\361,\235#B\237\356\332d\000\201\b\241\237a\231A\230\204\222\321\335\f\034\346g\0200e\306\t\004\237\301\233\300\000\215\237\351A\222\314a\271\207\212\316S\360\234\241ap\237\233\312\340E\277\031\346\357\341ya\271\230\225#B\227\305\367\242q\026`\237 \260\237\237\306\340F\337.Pq\273F\243Z\000\021\242e\241\211\263\031\232\327C\346\220\266*\335\242\307\277\016\210\256\210\022\332\277`\244\273p\n\233\204\357\353\246\361\333\013\232\252l\237,\223\356-\323\272\024\212\277\030\024\003\237\200\236xu\363\237\375\270vW\000\240\016\001\347\002\276\t\206\3220\300x\r\023\202\237\302\240\312\263$\244,\277x\r\370\000\236\021+~\0228\342\r\222\200\302\227\004\360\237\302\362b\271\211\244\004\201\247\343q\rg\3704\006\263\026\2763A\023D\005\300\237\271e\226\364+\332\042\212\325'\035\003\235\030a9\311E\202\237A\004\200\237\210\000\214R\230\241*\335l\226.\013>\035`\236\213\324\373\312\370ML\000\002\312\000 \037\031\200\007\340`\000\000\020"

	.section	.data._ouat7_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat7_compressed
_ouat7_compressed:
	.ascii	"\240 x\000\002\021P\000!\022\240\226A\230\000a\202\001\242\303\243\242\202\201aL\n\201\005a!\263\000A\202\000\343\013U\000\201\022z\026\bA\373\0427\f\2731\025\370\0008\376\000P\004\020\237\374\\_\240\024\243\241\024\243\026\003\202\223|r\272zt\346\000\177\226\004N\022\006\371|-\247\024\000GA\204\236\037\204\237\365y\000\375lm\002\207\237\177rZ\205\212\205\202\317\004\000\374/\026\r\241\303$:\326&\315\034Mx\300\360\020x\237\027xA\241}\000\006Xd\236.\243r\302\2370\230W\242\000\365\006\034&\312+\313HA\200\236\263\206\264\004Ax\237\b\202\303\242;\237\013\214\tJ\275c\330\226pA\234\343pl\000\245l\315%!\260\321\347\005\027\345/\315\t\222\226r\345\320\b\243z\237\027S:\334D\312\000\340V\356Q<\022\013R\202I55\007\331\021\331K\031\304&\207\237W\240\b\303\374\237#\042s\203\240b\224\323\247\245\t\222\242q\260\216\371)\351\013\343bW\241\016\302\242\212\240\004\020\237\232\000 \307oo\3128\342\336\225\353\346\305(\300\235\225\007\243\307\b?\342%hCa;\237\t\317\343J\232\337.\n=\264\343\002\241)\261\242m$\2121\251F\242\272\342AX(<\237\t\370aF\252\201\347g\316(\232\036\037\236\023j\240\272\312\213\373\0338\252\000\342\251\336\332`\306\201\004\2378F\262\277\345c\r\273\311\222\242\245\031\272\306\211\320\271\356\367N\026\000[\0203\260\237\225\345\347\356\270?\337(\262\247\234\261f\236\032l\234\363\376zpp\207\341\004\313\000\265\273\004\226+\017N\377{\275\225\b\201wR\na\210-\264K\0204\b,\217\027\042q\000\323\024\f\342\036\262\277aR\243\213`Ha\255\266\2761Po\310\237!!\350\025<\3778\220\202\215\376\t\341\f\302\307\236\005\035\253\b=\237\370~~>\017\036\237\004!\017!\237\n\360 \0041\214\277&\367\b!f\032x\031\364\035!\t\340\237!\206\202\367tl!1|q\345\034\016!\201x\237$c\205.h\022\033\023\2113\216\323\030\021\002\237{\\\007\212\241\t\345\t\035\236\0216\036x\007\361\305\236*\004\020\237\210p\217\216\024!x\316\307M\022\007\032\3573@\032\222\237\020\261\323O\024\035\033\025\021\tT\037\006\363\033\204\342\036\005\237\302V\347\361\037\177\037\023\t\\\037\005b\033\201\004\003\377\215`\207\302\2406\022\021\035\2173\366\252\017\232\277:`\017\302\237<\324k\352\340\362\237\243\241_\260\240\217\236X\330\000\357.\334\322a \025\202\364\237\016\242\202T\216\242\033\243\270X\237\020A\230\240E\005\236\004\230\242\277a\203\260\237\017\243\243\202\303H\244\b#\237\b\323\333\207\002\237\202\226P\240 aa\364\2370D\242\243\303\303p\243D\317\204\3018\237E\275\211\215\276x\000U\237p\003|\237\030\236e\344\004\241\237\032\215\020\332\022aA\277\336[\201\007\275px\377t\2748\236Ca\237\013\324\2170\271\030\273\343\265\310O\236\027Y\007\313\237(\236pR\324\000*\215\030\201J\030a\241\243\213\242\333\220*\224\013\235\013Y\203\343\377\317\374\241^G\035\237\f\202*u \2039\rZ\356a\364\264\300\311?\201a\273\273\r\251\027B\364Q\274\203\346\277\273CF\207B\237\352!\004\261\t\255\363v\325\346\0067\274\177\336\025\243\007!\317R\016\243@\233\\\243\020\360\000|\237\b\201|\237&\240\t\261\003\234\224\326\371\f\303\203\020\242\202\232\024\256\006\013\242\266\004\200\237\225\210\340\204\2400\216\351\000\227\226\243\2471\224\000\215\021<\021#\264\023\264\023A\035\340\237 \201\214\337\245\241\t\013\325\002\302\213p\237\234\263W\243\240\023\234\356X\266P\351\332\254\301\330\237Ur\214\2250\2771\035\366q\321.\002\217\021\007\335G\353\204\200\243\275 \256\322\236D\215\306w\002\032\000\007\201\237hG\201n\236\244\004\342\005\311\317\303a\231 \250[\376]\000\205\250\361\032NE\345v\003\3650~\237\027W\017T\234X\236a\226g\335g\365u\333\316\n\376q\345\337\321T\231p\000~\237\b\201\263\377\217\246\371\372\355{x\345;\3249O\335\005\211\025\262\334\234\265g\237\013\000\203\360\237\344\000Q\204B\237q\271\273!\000\234\212,\315\257\3010\236\234\355\347\312\311\203\303\006\266\350\235\000\201\007\257\337r~\004\237#\326\265\b\317\035\177\024\234\034\000\347\350\032\033\242\230\356\342\245\000\302X>\277\0318Fp\355\341\276\343\261\332\214\177Z\243\222\316\326\363\f\251G\042\030\026\324Q7\342\007\205\337\345\256\204\362\363I\025\330\314\005\322S\336}\322\321\362\332\221\333\257N\242\034;\363\042\275\342UMF\214\336\344\344\201\203\301\277\223iI\211\206\033U\342\016n\021\nA\275\227\312\355\264\255\265\256\0063\305,\313\252,`\237\232\000\270\b\020?\377;\226\276\000b\251\244\f\242\313\2040\237N\3004\257\313\303\000\230\352\250\311d\016\237\306+\016\270\371\302\225k\004\250\016\003\017\302\237&\000\202\242Q\230\276x\000)\255\352\f\344m\3409\212\371c\342\261\320\260\320\342\000\222\200x\264\260\236\203\320\237\343B\021\000\303\226\000\3246\341ja\3768\266\231\253\024\006\227\230\264\013\242\221\000_\244{\202(\356T5\b\001\237\025\256\b\202\320\237\235\215\272\042\240\b\307\273\230\326.>>\000NN\030\344X\330H>\237\005A\204\346$\2762\024\343T\346\242\242\242\335\3435c\b\042\000*\343D\n!\035\202\237!IF\352\361\205\276\2428\237I\b8\220O\234q\343\277\037\000PK\216\241\301\340\237r\000\234\303\203\233f\346\201\230\316\355\261\246\303\314\332\354\335\242\262\264<\334\245\254\030_\336\340\364\337\247\241\013\000\223\331fg\274\r\226;\005\271y\376\300<\277\241\233\000S\237\212\020\000\000\377\344\000\000\002"

	.section	.data._ouat8_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat8_compressed
_ouat8_compressed:
	.ascii	"\240 x\000\0027\007\000\303\303\243\000\331\004\000\243\202\204\003\201aa\202\245\f\303\242\245\026\242\fB!\241\000A\202\202a*\000\201T\006A)\000\007\240\237\303\211\242\006\242\001a\234\240;\024\023-\202\242\025\202\013\007\237*a\240\031\000\002\240\237N\250<\004\300\222\243\237\025\177\370\004\003d\276a\020\240@a\232\237\n\243\326$\242H\241J\b\202\347\024\236\017\034\004Ba\300\237b\341\035@\241@a\224\237\013a\226\017h\220\b\221\263\313\330\002\220\310g\000BA\342\276\242\235!\201r\000N\007\241\ba\021\203\237=0ba\237\261\251\235\244m\n\243s\t\204\2400\375\177\000+\247/\243\275K3E\242\f\315\b\301\237V\000\347\222^cj\004\201\262\353\303\265\005\230\276\241q\276[\201\267c\262\234\201\203\374;\205\334\026\320\000%\004\237\347\3753\306P\233\\j6\2761G\371\370\007.\245y\003\342Y\231\307\214\302\b!\237\032\236\027\373\027\375\034\0076\375ia\316\370)\227m\314U\201;\034\240\020 \002\237bR\335\237\000\rU\242\001\225\355\303jC\276\t5\277\002\242\303<\240 \374\237,\340\247\241\t\244\\\016\220\242!\241\276Ba\316\336\202\270C\023\002\237Y\351\307\264\000\237\252'\361Da7\232H\201X\237(\376P\201'\214\277Di\262Y5\310\204\2366\375p\275\237x\000\350O\t\002\260\237K\345\210as\331#\002\2378\245\042B\265\004B\337\227\252\042B\236\212\271\321\211!\004c\276s7\302>p\000!\204\237\317\255<R\265\260\274\332>\2761\360\0003\204\237\210\r\303\\\236\030!\335\303\201\240\306F\300\000\203\377\bb\300\376\236~\035\335$\201\377\232\026\344S\334\317\t\200\237a\213\251y\347o\270\270|\374\370.\2130G\234\240 N\237\b\236d\000x\177'\3748}\353\340D\237\b\240\240\341P\261\277!A\2433\367@\201\270\237\004ab'm\n\302\374\243\336\367\022\230Ya7F\300\201\016\377,\366\343\202\240\024\235\256\231\357\243\274\277\207\336\340\004\360\237\341Y\004k\303&\340\367\030y\373A\243\t\224\346\n\341\237I\364\037\324\024\204\020\212\242\247b\271\025\242\364\237Y\370\345\200\t\f\277\260\017$T\237x\237c\250\036\234\266\2703\241 \242A\302\215\334t\201\b\301\237\021s\022\377h\243K\240\334b P\240\042\202c\t\311\346\202\002q\337Br\363\303\204A\240aM\274\\\002\036:\237\034\000\t\341\237\034\3002\264\277\221\000\327\272a\263K\237h&\242a\305\256A\005`\237D\202\312t\311\361\253\243T\024\242\023\224\3447\000\002q\3378a\002\344\203\221\310\332\242\002A5\336\354\237\023a,\246\243\244\n\332\310\202\004\320\237\341\0020\240\265\245\214\300\036$\307\326\205\t\022\205f\236\205\263\351\000\201,\337\243\013\343\265\030b\245\260\240\226\276\356\235e\201\004\201>\343P|\237\026\2723\264\304\330k\236\304\354\343}\245-b\241{\023\275Y\312\336\031\000\2014\237\042\242X\203\240\205\b\347\341\224\237-\246{\032\275\036\003\036\304h>\337$aH\277\304\365\205D}\214\205h\236\\\000\261\042s\255p\b*\024\337H\237#b~\235&\013%\201,\233\022\242\241\201a\243\027\042\n\004\240\t\253\237\032\311u\206P\210\300\254b\236\027\242\004E\334 \343\303k\235\0021\337B\337\242\026\2358\342\304\r\276M\224\332\005\235\332\242\302 \237\201\217\301\270\021\302\237\312\336&\246\227\242\304\221\203\215\256\002\242\317\371\0273\343\232\tf\204\023\267\030\262\335@\201\223\377\032Kb\342\005\001\237\243\037x\020\2766\241\t\242F\300\037\335~T\004\200\237\215\346{\253\030\343\336\260\217L\242\2768\237p\013\330\237S\325@\237\277q\251\210+\236sf\312\004\262\030\223L\2766\242\253\243\310h`\237 P\337\310\325\247\232\345#\232\323s\375\221\346\356\006<\205\343\022\205\005A\277CA\001\237\331\023\335N\336U\332\227\f\022\307\252\201\000\201\214\237$Z\262\274\204\032\223e\233\220\273.y\370\b\003J(\256\b\t\004\333\277\214\277\025\243\264\277|w\201\235\325\240\312\007z\242\232\317\3416\273\241\315\201T\237\023a\f\276|\377T\025\373\375\021\233w\r\t&\204\304\021\001\302\301^\371\337B!\240\235\306\344\305%\321\266\266\024\270\023L\370\305\341r\023\224\374\301\2460\305@\216\237\020\223\000b\237\016l\022\237\tZ\262\347u\241\013\304\271:\225\357\331\036\371\020\006\302\236\005\240\237\261\252\274\357\217\240\tQ{a|\000\022\265\262m\312,\b\350$\242\022\301\237a\031\t`\226\201\306\305>\363S\243\305z\316\000\364\350\303\233\b\013\235\275\270L\021\276\237.\t@\231\270\n\362\337\204\002\237\206\350$\226'\215M\000bo\201\330A\236@\246\337R\005\230\362[\b\345\341\235\356c\006\225:\237\317\000w\034\023\205\215\262\265\243j\t\026\224\304`V\3779\022\201a\321\213\213\007\201r\026\3006\273\022w\206\004\022\326\366\302<(\261\213d\026b\000\000?\371\000\000\000\200"

	.section	.data._ouat9_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat9_compressed
_ouat9_compressed:
	.ascii	"\240 x\000\0027\006\000A\242\303\000b\t!A\202bK\000a!\000\357\017\003\f\210\000\241\031\242\242\243\211\004\202\243\303\225\000\2431i;\202\25710\034u\243$N\337/?\035\372\r\000\fA\016\300\237a\243\241P\242!b\357gJ\202\000t\277Yi\005\371\003\017\202\240\253\006\031m\371n$\302\236I\r(\007\335&\000_b\r\0000\240&A(\302\300\017\004\277\202A\255S\005\303vy\241\022\217\216_\313\002\016J\000\242\267\036\000\301\222\202\022\2776\213\027\fs=\005\237JD\036\242\302\322@\237\3560 \017\003\237F\242\341\354B\231\252J\306\300p\237\377m\016\026\240\016kP\270\223z\005\355\025\000\242%z\3302\256\316\336W\021y\000\210\363Q\214\277\037\005\237\025\311W\177tZA\2479\340|\023\027\301\215C\276t\t\241\023\f\264\223-\f\247\303\260)\223\310\201Q\003\332\244\275\343\352\007\340\237A\227s[\264\201\230\340\251\250R\303\362n\020\213\267\243\007\204\245\000\250\0132\346/0\232\000\216\222\004C\377YA\267\314\216<m\341\2375\022\264\216\341\207\302\n\201\240 \303X\275\316\237\023xL\024\241J\346\320~\377lA\301\246\366N\005\345O\233y\202\240)\220a`\237\263\204\235\255\243\002\237\222\302\237\202\357\b=\237\t\017\272E\211q\256W\020(\236c\006\267 \316h\352f\030\265\330\266\355\213\337*\370\213\301j\372\f\240 B\237\n\240\016l\322\364s\315BA\203\263:\233\312\273\322N\004\244\226\344\263\035\207\\\001\267\330\345)a\2044\bA\b!\237\205\376\334\214\331t\255Km$\013*\330Q\243\324a\3235\253c\270e\3610\236\\\265\334\b\b@\237A\342Q\227\372\2709\370\no\361\300\205Z\304q\325\242\365\322\217 \275Wb\007\007\341\237\032\240\027dy\3567\013m\032\265\361\261\000M\3342\307\334\241Y\335]Q\300\000\220\237\035N\342\310\243x\273\236|&\266\343j\231B\343\234\237.\305\271!&\032\236\013\226\t\340\003F\237\t\002\240p\206\235\005\2420\237U\007}\277\335\035\023\334\031\210_\256\246\242\203\253\034\226\235\023a\024\336\375\225\002\b\237KI|Xfi\275N\237\027\267V\341\323,\203\227\350\237\335\002a\242y\020\352\315\316W\327\366\237\034\000\tA\237\024\3007\213\374tQ\332\315\245\230\206G\037\371%a\241R\004%\006a%\260\236\224\277~\005\t\004\360\237\260\371\276hq.\351g\340(A\233l\227\023b\032\357aT\245\354\007\236:\020\004\201L\237\023A\042i\242\272\372\211\314\243\024\350Q\304\374b\276\0003h\375\356\t\260\376\000\017\005\240\237\251\325\262\344\210\217\351^\361\362\347>\314\357\343(\241,\225\376\t\036\306\310\303\236\007\201t\237$\260\373\326(\341\257\205+\234\253\033\205\253\213N\001\340:\\\237\b\225\372\263\305\210\222X\377\237\213\016\266\304\251*J\345\354\000\336\240X\237\t\022\327&\000w\265\216\271k\000\250\374]\303\005\215\271,\220M\000\204\257h\237 AM\237\tB\240$\310Rb\274\301\343\314\274\327\201\203)\305N\230\020\330\237p\007+\007\237\b\020\f\202\232\226\346\200\n\002\232\036\023\237\004a\013!\237\307L\202\237ad\364\237\f\002\222\227\247\036\204\240\000[\237\b\262\327\210\200\016\013(\224d\201X\362\327\206\301\237A\002\250\277\306\204\237\341\220\316\013\301P\312\000b\005\300\237EA\204\237\341\240st@\013@\204\237\357\333\024\3001\306\355b\202@\237@!\344\237\bb)\237\004A\013\301\237\026\301\321\033\004\271Ax\237 AW\3779\312\3174\277`\210\237\020a,\007\237IpN\240\237!A\360\237\217\216\236?hS\027\n\337{ye\236\021\t\002\237\3470\236\b\022\302\237\347P`\213\213\033\002\213\022\201\344\237#\002\231yl\320hA\370\236@\276\237\021\345\333>l\030b\222p\013\201\237A\002\231\337G\244\200\212\263\242$\303b\036\202\202\336\224\357`V\277\030\300\240\220\t\243\243\257\005\231\343\206\245\036\237\004A\013\203\277\021\376\263\271\b\303\000a\020\360\237\226=\340K\\\277\030\300\2378A\243\374 \242b\177\237\bH\277SA\206\237\334X\236A \237M=9\336@\274\2773k\b\003\242\231\250\037A\237A\013\004\237\235\225\b\204\212*\315\321\260C0\r\277\300\000\376\237\020\373\277AX\237 A\\\237\b\340\240AAy\337p&\022\001\237\037\231Q\341\236\002h\237F\005\240\303n\341\237\300\004\332\237\021\275\202<\t0\237\021W\027\r\022=!\201\\\237\020!V\237\027\033\003x\237!!P\237\211\257\370\220\237CA\000\237!\200\203\237\bB\247`e\237\b\240\240\204\252\2562\t:\250g;\236DTN\000\000?\371\000\000\000\200"

	.section	.data._ouat10_compressed,"aw",@progbits
	.balign	1
	.globl	_ouat10_compressed
_ouat10_compressed:
	.ascii	"\240 x\000\000J\376\000\200\000@"

	.section	.data._ouatl_compressed,"aw",@progbits
	.balign	1
	.globl	_ouatl_compressed
_ouatl_compressed:
	.ascii	"\240!\257\000\302\000Kk@\000\214\314\324\2545\213l\007\265\006\000\336\265\214\214\005\266)\276\336\000\337T\000\005\377\206~\000\036\000\362\0031\230\265\3322\266\b\232\214\000\265\324\000\314\214\221[K\016\204\201\021\201\237\213\314{K\006\230W\352d_\371i\002\241\000\260\235\224\241:\003&\2547\327\026\266\240\f\232\350\033l\n\254S\340TF\237\rL\213 \304\345Z\324\265\017\200\003\020\236\021a\210\021\r\035\027=\023\002\240\230\254:\300W\214O\204\357\b\341\2370\304\251\324\000\265v\000\2161\341\235\214\306\260\016\230\321\245\337\350+\231\016\003\301\340\3240\273\300\220\237\024\352\030\276\361\000!\237\036\2753!\f\336\262\347Z\266\273^?\206S\234\376\b\301\237e\340\236\260\001\324\302\377R\336\264\000\276\\}*\206\232\275\306\005\302&\267\233\023\000\237\314\325\325@\254\222\237\252\214\004\246\304\210\237\013\240X\361\276\204\313\325\030\213#\220\330.A\300\237\324\326 \324\213G\237Y\003\237\361\n\364\013\275;\234\b]\233g\235Y\310\021\337\276\307\352\2569>b\340q\336\263h[k<\237\013\240\016C\360H\360\260\237\260\376\222f4\237\021\276\261\362\042\007\325B\005\266\266&\027\303\325\335~\211R\232\003\237\326N\264[\214\036\002\237j\300\237\254\254\265\236\302\360a\277\224\376\362\254\236x\242\b\205\276\3258\237\022\326\326\042\017\265B\266\311\337\265\367MI\000a\356e\340\002\b\237,\214\210\265\004\325\215\277\024\233\313\236\224\247L\357E\003\237\325\234\031\222\f\337\n\300\276`\237\2332\003(l\254\233,\243)\002\214\002\b\237=j@\270\244\304\031C\364\237\t\252\232\222\207p\237E\276\036\377\t\325T\326\005H\237N\255\025\031z\234\266-\230\214\333\354\303e\277\024\213\035\200\237jBbP\213\236m\273\337IRQ\262\300\232r\337\253mw\217\340)J\333\321\003\324\253\270u\241\217\3346S\310nK\325\003W\340\203\260\237cb\277\326K\253\351\200c\300-\237L\3006\211\227u1\340\042\337\345\205\326a\225\234\217\323\036\325\0033\367\301\335\227Jg\255\002\013\337\331\376\310\267+\314\201Ib\377_\237\356\000\210cY\261\377s\2248\246e\347;\333c\3476\021\036\230\270\374\332\262U\235@\214\213\237X\233H\321\222\004\250\230\235\230\260\237\231\350\342\352\2137\232\347\265Z\225[\371\211\276\242\342\373\212\335\353\235\236\b\021j\237S\256\347N\237\f\376,\231%\247\250k\357q\277\225\245k\257\345(\270\374_\232\233\331\250\253\326\335 G\277\032\215{\255>OS\376Y\214\304\315\347\220\256\324H\202\233\346\330\301\244\276\274\033\000\230\277d\276\034\2360\275\244\205\201$\337\273\267\263\256Y\314\236h\016\314\220\240\300\216\337\326B\337\342\304\276\347\036\314\252\000\260\247\356\272P\237\350N\336\252\000\004@\237S\254\300{Q\341\354\303\230\233\271U\254\brys\211\232\323\270T\240>\036\002\323\000\326\207\241*^A@N\324\251\244\370\005U\021C\237\357\t|\240l\232\273]\000Q\214\246r\000Xr\224\360\005\230\236c\273g\370\214\251F\000\235\0347\232\372\254\335\024\232PL\206\b%\337/\235\313\301x\220L\236\034\267Q\337si\375\247\302\000\203\276Q\357\334\313\303\272%\233a\237\357K\005\325\024\236\nS@\324\204\237\267B6\3400\213\365r\325^\021\336\213\230`\237\214\227\245\343\200\240\337\337\236\253\364\032\326\343\275!\207\323\371QK\325\276\201\237\265\254\323\000\343\360\r~\237\013 \237\017\340/I\005\244\324\302\365\307\276\005\311\352\232.\350a\2040\200X\223]\000\274\306\235\005\225a\2108\236H\253\226\274\226\204X\274\341\252\327QF[\002\020\277\330\362H\210_\2022\254\253\277\367\303\236\001\322\213\327\241\313\331f\203q\300\241\314\210\341z\376\310\200\236\260\237Q\325\372\330\300\321\003\326\265)\205pS!=\337U\342\217\276\206\325\007E\340A\370t\002\2072\336\310\221\021A\237\026\350\364\356|.\345\335 \237,\232\224\360\330\317\254\n\270\261\230\2378W?\277e\213\227\210G\252\007\324p\375\242\324u\252(\237\042\266\006\276\234\b\337\001X\237\042\265C\234\002Y\325\226\321\222\335\343g\373\323\002\274p\004\042\204\237\262\305j)Bk\226\352\326e\277\025\254\335\311\374\247@\240E\206\237\200\221\t\231k\226\225\353B\364\325\246\302\365\233\324`\234\213\247\002\254\002\002 \237L\000BtBZ\254\353\325\230{\003\271\202\342\016\301\240\337*\204Z\234\331\363\313\024\326%!\213\230\225h\215\230\244\201v\2309\377\322\005\364\322\236K\004\200\2372jA\350\317d\326\276V`\221\346\331\232\312\330\205q|A\240\024\237\023R\026\304\330\237u9\260y\367\353\rl\271l\237,\272{I\276\030\021\303\237\300\025a\376\367\200?\004i\330\007\244.\314{\215\340\266\026\237\026\277\334\b\365\270\205\231\365\035\005/A\237C\364r:\025\330\276\222\007b\201$\237\030b\300\331d\276\326i\340i\345}\207(\204a\246\024\340R\322\236\276\373\022\005\307_\006\261i|0\006\340\2566$\224\220a$\200\237aa\253\273d\304j\205\231\033\310\007\231\303\374\307\357\000\312'\241Z\021\227\375:\310\265\b\325X-\317P\300\257\232\312\242A\237j\002Y\377\333\243\366h\212\027\200v\314:\005\276e\241\373\023\017\277Y\262\334U\236\301\233\232(\277\265\314\036\254[/\343\221\214\213A\236\002[\277(b\237,\270l\250W\276\320\024\237\025\r\246\013\266\377:\242\016\031\306\300\177\267\356\031\272\354\237,\364d\000\213\235\t*\364\004r\337\262\210H\253\2656\2768\242vs\2155\326\027\200SE\352\007\264\016\024\237\022\305\024\004\237G\223\337\364\322\321@\226\237\027\003]\203vd\327V\237\t\324J\322#\205\262\353\374\024\020\301b\303\236\035\234\237.\370\021\314\240\237b\201\000\2378>\262\217\311Pj\253[\211l\232\000\316\352\312\310P\215\253\336F\325\007\237\030a\237\362\025\020:\330\254p\237\302\351J\362\201\024\237\021jk\355m\304\246g\213\275\033\213K\275\031_\341\004\242\374E\336\202\237\326\303\276%\257\331\226\263g\371\213\273\260kAAK\203\340\237H \226\021i\204\275\003\254[\\\214!\316\337\220{\177\244|\007\005\213\220\306\016\202\237\326P\237\260\266\220\320&\332yo\277\322\342ab\017\307\277P\235\346g\310\034\231\274\000\241\042A\237\325s\374\215\306\257\206\000R\020\204\237\343\275*\225N\237\023]\270\310T\367\036\375\301\370\277\310\220QA\237\215\312\022\334\214\326\241P\237\302\236\232\317\326\263E\243\354\t\223\023\377\013\276\326\000\221\2028\362\371\030%*\317R\333\260\246\236\375 \370\277h\314\242C\237\356\016\000\335\325\254-\215\334\374X\227\310\2332v\212\236\250\326\220\237\224\2352\374\241\356\260\237\220\236=\013\301\252<jMY\203\377\237\327\207L\211\3762bB\355\303\314\314p\3005wR\017\212\233\325\302\224\252\005\242\256\t\255\007\000\232\3045B\214\254J3:\232Mh\004=\277nR'\256i\336\355\267\273a\241+\300\033\316{\002\231\2130\226\354\013\230%\212B\326\266\266\354\346<\341\033\355\270\245\243@j\210\237\nK\220)\n\214A\276\253\002\226\fi\213\213\354\027\270n\315\356\005R\354\235\200$\3749B\206\211\312\213\330A\237N\276<\021\345\3354W\037F\377^\214\211\314BBA\307\204\021\231\236n\246\227\325\005.\366\026\326\276\237\034\005\207\367^3&\246\225\005u\033\042\316F\302\321\260\000z\337\375\211k\357!\333X\3619j\321UBn%\343\377\250v(\266\315\314v\3116\237\013\325\336.\000\346\243\307\351\006\260\272\261\276\346K\3744\214\t \237\213\234\360$\256<\276DAaj\215\275 \240X\225\333\343\312\240\035\t$\216\200\237\276\225\231d\216\005\314\005\237E\204\266\364\240\023\204\236\t \237B\323d\254\206\240\002a/Bb\245\352j\277\251\005\234\367\354\227$\355\312\b\242\331\224\277R\276\017\277$b\277\232\257,\n\237\016\003`\236\235\222\340@\377\202A\202\202\240T\200\251\000TVK\241\024\266W\2023\264\271B\203Q\f\265\325/\231\245k\353in\360\312\335\206\300\322\223U\351\210\237\016\017\017\002\237\302\240\336\222*T\356\000\327\323\213\r\3016\307\2713w\b\t\341\226\237\2653#\264W+\000r,\005\346%\317gI\244\022\236\020~\237\005Ab<\342\303\301\034\371\275l\334\215\240\230\336\232\244\245\000H\230\223u8\204\225\367)\b)\340j\345B\225?B\325P\377A\351\337R\221\337\223\306\204\230\300\250\213\237\256\323\314=\302J\005\373|\022\241\240%\042\332\037\346\341\2130\236%A?PB\246U\351A\370\237\042b\222\317 \367#\254\000\341\345\361y\212\334\336\316\356}\000\256\027\016\252\237C\373\302\226A\277\312\344\202\246\220'k~\237\bK\342\332mb\3053\t\232\256\037\376\221l!\243\245\000\325\300\027lw\363xy-\300\264\306\213\241/>\001\353SOB\231)J\230\017A\237B\025\255\262\334\302\340\236l\310\304\253\314\355\255\230\255x\213\253n\265\211\232\336F\276\303\237z\234\237>\027\000\346$\320\314\237'\000Yb\377 \214\364\237\042\036\212\334\335abZB\217L\376b\202b\202\201\241\266\363y}2\311lM\376U\232\226X\263\316\300\274\tf\324e\330\021\000\366\336E\213\203\300\237\234\215.\3667\341\306\273$\2600\000\202\202aa\301\241\254\355\352\002\216\254X\354\254\311\335\353\276u\212?\211\361\034\313\334\304B\240\000a\377\237\342\003\215U\260\366TB\006Ni\2748\235b\321\253\244\202J\314\354t\2156\006\276\270\221\234\320\246\334\b\244\276\212\237\016P\004P\237LjTa\213\276\032\214\n\001H\202\302\366\275\364\2767\323\224\237\013\232\257k\260\272#\230\372b\042\232\242J\305\301b\007\300\237K\222T*P\346\020j\321\365\253\347\002\2776\323\341\237%\262\321\360\327\260\336\373\316\304;\253\042a\333\376\274dKUN4\312\036\004\237x\236\042B\037\353\205\346\324\236\034\001\362w\206\237\263*\232\365u\254\304\353\315\257A\235\027\2577\333\222\246\202\273\222\212\300A\016\303\237Z\\b\252E\224\217\365l\232\231\336\042\253S\374\256\031\025\214\325\275\360_\253\026\n\367\000L>N\341a\013\213\232\230\202\245\004B\036\006\237\343\021\332\000`bji\232\312\327\210\225\204\227\377\260\237^\336\305B\240\237j\230\373i\207\361\345\251\275\226]\017\256\2773\000\235$aH\276\330\241G\005\201j\343\265\312\331\025\000DK&\203\306\033\373 \202R\237\004b\343\276A\210!\340F\375\261\215\305\344\360<\000K\034a\232\254\273\342\277b\201@\2374\354\234\207)\234r\002\253\213<\237!\310\000\227\345p\325\227\253\270\234\2018\2375\363Jb\306{\273\031\314\243\336D\267\275\026<y\022\207\237@\204\333\222\275a\2014\277u\237\267\356\303\245\273\034\336\221\324O\335\244\227(\240\004\214\232Y\356a\225\024\346\372C\213\307\301\200\310\023K\337\251\037\224\372\006\276\025\213\224\341C\246D\305\343\374\306\341\000\265\325\214\2538\240G\002\272j\277DBA\246X>\237\004Bp\276\232j\242\370\330\276\221\253\324`\237b\227\227\254\335bw\200\303u\253d\376G#$\026\240\025\311\327\237\272\247\240B\370\237#\251\236k\231\262a\253 \276\375]\221F\205\237\221\300KB\021\024o\303\202\313\214+\372b\006\344J\243Z\202\202pN|\337Q\302\300j\313P\202\314\375:\275d\314Q\317\331\340$Kw\347\004\375<\235-\202b9#I\370\033\246\356\003\303\361\337\020\242\243\202~\377q@\240b\320\315\202\303\026a\243\314\334\364\302(\314\256\366\260\227\263\373\321-b\024\213\202\263\341D\202%\220\304HZ\300j\336\214\210L\242b=\237\f\230bC\240\231\f\274}\000T\303O\334e\336\025\305\212jr\221\200d\203;\020\271\003\025\201\213\024\223\263\005\240}\263\234Nb\242O\b%\337\361JN\000\237\202m\243\004\303\000\242C\302\224\342^\345\252bzG\374\342%A\237k`\240\213\210\360)-F$a\310*O\202\241\302\203\360\237\337PbE\002%N7\273\000@\236\243\310\342\314\242\315\376\213\032\237\035u\362\006\000\022\320BE\256\266\242\211\300\031s\317\332+\253KO\354U\241 \374\237,\330\354\222\274O\2269QF\276\265\003\245\234\376\347{\262\341\231\344\256\261\255\317\365\201\272\204EjK#PRO\212\300\243\004:\237\266OK\211X\353\035\243\242Q\212\276\242\343\003B\237R\273\260\201\225\352\350\245+\313\324\214\237\263\n\300K\345\024\000\347\030\237\rN\202\007\343\2770\301\370H\224P\235N\2767\003>\335sz\217\232o5.\312\220j\302\250\206\275d\201\267\374\231\3077\336OB/\262\342B\004<\337\306\230\327\233\000\261\276\230\336\264\002\213V\322#b\251\305B0\250Z\237\322\312\314\261\263\252\347K^\036M\222\332\004]\377Xb\234L\375z\206D\004\237\342\230k\214\305\252\267\031\373\256\340*\247\221\254\242j\030\237\032Mj]'E\242\007\371\3375\000\022\334\242\342\374\306\276B\342\241\303\267\251\222\232\256\366#9\000\027\306\367\223\200\207\367\314:>\324N\300\022] \240a\366\002 \237IJ\212\277\242r\336\220\237\022K\302\361B8\276l\340\347\211Z\375=\241z\316X\242\307E\035\205-\274\254\246\225\361\002(\237Q\317,\243\276g\277\032\004Ij\344\023\224\256*\000j\321\200\314\351:.\213\366\364(\300^jO\346\bb\021\205\277ah\200\242\234\236,\376\322\303\314\227\220\035\300\237(b\237\037\242,\002\336*\364\304\205\267M\240\216\276M\253\201\f\237*\272\355\354g\276\031l\004\320\341\021\271F!3\ra\376\260\314\242\306\316\215.\027\252\312\205\276B\345T\377\002+\277/\243\313\242B\237\351\241je\244\017\035\000a\253.\236\214<A\215\243K\376\317>\326D\213\b`\237a\254\000\300b\212\336\324\236\202K\262\334\207\365\000(\243\341-\335\033\026-\343\274A\337\201\f\2372\327\261\200\204\003\237\205\264A\022\204\237\245\340\032\227\222\007\236Q\204\267\bG\377\\\306\242\346\005\275h\207\342\261\221\202p\237\261\300\342?f\025\370k\336x\021k\237\366F!\253}h\234\313,\237\b!\\\237,\374h\300k\237c\302\236F\370@ \206\237\n!\000\224\336\271i\343\0056\362H!L\251,\210\375\000\336U\243\352\021\001\236\323\330B\004\230\316`F\237\r\312;`\212no\354\000\312x_X\240>\006\002,\237(\236\360\241\262\340\234\241,\232(\241 B\237\t\246g\234YN\311q\277\343d\301\236!4\tp\237+b9>\251\276\226\000Z\237Oj7\002 \237W[\210\237\000h\214\212\353\244\r\007\237\000\030\237\0273W<\343T\246\023\002\236Bt6 \bm\277a\235~\235\242\205A\237!\307\001\002\237!(\237\027\242\003\320C\346Y\342]6\344\350\t@\237\202\351U\376l\342\220\202\260\237O\000\f\006\237\340Ob\022\233\t_\344\323x\2508\020\307\277]\220\342\257\243\345\236\t\302\2378\236\b !\231\r\302\237x\215\331.!\204c\377q\027\2608 \207\237Ww\303E\234\324\000\310Mp \237E\224\321\301\225\027\n0\237.\2022\351\016\311\243\306\365\017A\237 #\274Y\225P\230+bg\t\222l\362\347[b\004\205e\000\034\265*b\3352(\034\250x\276\301\351\337e\2600\237^\342\\\005\271\344!\264Ka\303\002U\000!$\211P\363\310\2706DA\213\335h\020A\237!a\225D\230\242\265\241\276\000\b0\237!\344\000A\225\311.\216\366\f\211\362\214\326\b\353\237\320?\225e\224Q\267{\300\314\n\337I\242\212\260\b\202\237\202\316D3\202\367\341\032\236\020~\277\311!K\335\000\260\240\322\2010\237 \204\236+\226m\264,\340\276\005\fu\277\201(\377\373\000\233\252\240\t6\305J\375\275\313\202\240\237\316\220\322\275f\357N!\336_\023\t\002(\237rO\013\300bg\247\336\272U\237\004a\025\007\237\000\330@\375\314\237\023U\3622\377 \004p\237\221\327$\226]\343\353\n\006\276\ro\nB\237h\005\220\237[\202\320 !L\237\013b^\242\301\362X\042\205\242\n\003\237(\217\237\017H\236\n\020@ \226\237\024\306\325\277\266\241\022Q\f\352pZZ\237\023\225\340\227\355\000\341J\341\002@\237nPbN\373\201\005\276j\tTvA\023\202\237b\357\006\233\346\022\251\304\266\322@A\214\237\031\356\341\234'\240\257bh\000\256\006\001\336\355\t\301\237a8\237P\221r\0134\316\234\302 \201\034\277h\355\352^\354f\301Sb$\213g\215\317\013-\202BA\237\316\005\272\322\177\337\006\300\001\222\377x\240E\007\237\007\334\006\n\305\260\n\\\000\027&\237\027\337Y\375\335\004F\244\242\260$\204\237\222\006\032\273\242\244\003\260Y.p \031\000\214\237\013\251Y>\337\307\300=\254\364\201 \237-\236\346\237\013\240\t\032\306\243\020\002\213S\341\214\025Ga\005\237\367\216\000XC\276\360\023$\206\237\366\022\315s\2047\263\364\341\365wr{\306\000\207\245\003\036\237\035\000\310\031\231\266\235\035\001\240\005AF\3779\371o_\236\336\371j\004\302\212\202\255t\013a\360*\240\237a\334f\370\202\267\334\264\205\250*\021\202\237*n\355qi\202T^\252\022\214\277\322\024\361\006\000\2230]\006)R4\271J\237\035\tq\306b \007\341\237\032\240\022\302\377a\\\360\231\241e\267\031\252\202^\000\020\346\025\270\031\25674\302\235\312\344\312\335\301\337\242\002\030\277\302#\300w\320E\256w\306a\227(\257\334\t\262\000\217\324\021\333\042\337\315\034+\273P\223K\336\224\203\352b%\203\343\377\236\361cC\240X\353\006`\002\251\f\313\324\024\226\tr\377\266\335\303\201:\234\354\252\023\313\324\003\345(\336\312\267\n\042\201@\237,\211b\206\311\276\246Y\b\242\r|\000\274P!\344\304%\211~\215\2646\275\311\243B\236\302\343\306\337\0040\237\205*\200\326\240\271lt\036\261`\237\346\f\007\260\207\240\220\257\324\234\326-\315n+\3736\004\026\241\363\201\023\337!@\237\246\300\221\3644\342\244\353\272\264\220\242%\235\036\013\\\300\263\357\230\301d\300^+q\346\237\214<\337\201T\237-\336\362\260J!\306\334\t\223\363-y\212\303\242q\302\224\332e\240[\243\232\320Y.\002\017W\363\201\024\277P!\200\235W~x!\325\310\214\024\2472\005\240\207\224\bU\035\0370\301\335\021\202\305b2\231f\354\376\023\017\302\237<\2409VV\377\344|\270\273\362;\016\226\221\352\000\347\036\020\332\255F\345\251%b.\003\235\f\236\252 E\237\tB\240k\242\232}\216\317\212\345\247\025\020\234\243\021\303w\016/S\245m\257\027\224\326\336\362@\006\214\237\025\000&\277\361\000\ny\303\250\031c\367\023\206S\000\202\347\373)O\363SC\204\237\271\213\264\302\t\001\237\214\256`\230\335z,\242\221\315\303\0022\000\026\330\222\036\b\303.\242\t$\331\246\270\224A\b\213\237e\340c\2743\272\313\340\326\211\311\242\326\2072\0000\260\035b=\335\357\337\005\210L\270<<\301\246\002\033\337\333\312\311\000\214\202h\203_\016zc\212\013\204\235\201\240u\315\254\211\357\324>\205\330\247p\027\042\222\337bA\273\226~$\2049\004\211\277\2023\321\316\305\321\243\315\205\210\201\304 a\306\003\005\237/\265\030\002\020\237a\370\317Ik2\240\363n\207\245\t}\361\306\006\214\277p\240[\301U\002g\327\0069\370\335\007@&\202\337T\264sXR\234F\225\301\357\313\026\036\236\266\3251\253\265n\316\242s!E\035\245\277\363\000,\030\036|\237\261\256&\261E\324\206z\213\305\022\321\242q\335\214%V\242D\201\212\202\300\031A\241\2029\206 b\360\237.\324n\257\342\202\215{\234\205\233\261\311\016\003&\321\347\350\311\302\272\254\f\217\344\347[\210\330?\337+\357[\356\013\332)a\000\350\351qb{m\311\177\260\025\036K\216<\013\350\307\243\203\305\237\235\352a\000\226\350j\370\256\024\030\331\311,\r\315\250\324\242n\3126H\213\336\351\030;\237\te\311\242\030\352rqi\314K\272S\350\016\r\316\267\266\000\177\232\033\025-\000\r\3326\315\262\020~\237\021o\273w\276*\016aG\370\252\266\341{\264\000\242\201\335\b\204\305\201\236w\302\007\253\237k\233\026\234\261\013t\243\302\031\201\242\202\r\254\2578\272\027\000\007\300\237\242\204\250z\334\255\252\323A_\332\227q\025\032nq\220\3025W\305\035D\314\042\343P|\2773\034\254Zm\202\302\224\207\265\261\311F\300\331\345\243/\256\317\000\344\312\255\244\302\024m\3615R4\303\bC\277\334_f\311\205\042\005\202\301\227A\310\022\3005\370=\035\302\322A5\000\2423\323\324;{\332L\200\222\314\214\037\007\237D=g\312b\236\262\006\227\343R\205\245\331\033\306\304\f\271\361\t-\365\n\032\374\242^U\b\017\303\237E\224\231%\257;l\265\231\230\372\347\236\013\216\231\301\240\202\042\006!p\240\205I\334\242vR\242\260x\237\026\375}F\313TZv\017\333\361\001\240R\rM\241\214\264h\301\350#Au\366\346\221(<\237U\242\330K\266\363\003]\222\327\007T~;\271X\276\361\003\207\372e\354h\036\202L\271n\b\3573\340+X\001\203\340\237\266\204\210\302:S\232\013\226\234\236\345\244\016j\260\225\217\300\033\234D\242\3617\241\247-GAH\373\337\331\317N\241\361\373\343K\3721\375\243\303\332\273T\200\221\335\244\313\013\236\210N\277\273\026\337(?\3778\355\271\215\344\231\021\342A\f\005\237\024\343\221\221\t\314\206\223\202\007\243\277r@BZ\267\212s\227\225\314\224\311.\236\026\244\253\243\271\256H0\206\256\f\340\030\376\277\361\240\232V\024\255\311\026\207\332\313\025\234\t\206\300h\202\277\251\232J\247\t\247X>\377;\300\032\001\204\362\244\\\351\235\351\345\362\216\002:\000D\243\355\000\200\356\002\042\354\255\240e\376\204b\037\325\237\304\250$\337W\3427\2121q\000\340\236 8b\303<\244\272\234\347.\261,\235 B\237\013\371[\2558\360\235\241\325\221\370!\260\236\274\343E\202=\325\316/\330\360#\205\237\202\233\243\024\304\333\320;\252\370\323\356\236\000\344\027\374\030\353\267\224\243$\361\250\020\202\237\242a^\337<\300e\242Z\254\270\200\223D \216\271\331\035!\307\003\005\327\310\016\2707\004\002\030\277\302\247\374.\366I\006\023\254\362]\267O\006\266~\033\274\020\224:\343\270\0020\237X\240wR\003\013M\203\374\255\231\314v\037\2647\007\017X\000\227/b\003\004Aa\370\237K\235X\235C8l\270\341\235\304'\220{a\242\360\236J\334]\264u\000\003\007\341\237:\362\303V\000\214\227\363\323\177\2122\031\034q\213\027\017\022\372y\377@\210\237\023!y\243\362\270\252({\261\300\215\250\233\203\310\321\272\211\241\b=\237\004a\362H\224\3415\352\221\201\200\031\037\207\204\022>\331F-\233\004\233\037\216\277\237}\000\315J\246QM\203S\004\303v\276\0005\202\023\025\360\324\227h\237p\000~\237\021\205\2169\247I\254\222\004\377\021\002\237b\343'\216\371b\332\264\000A\036\005\237-\341\361K\000\301\242(\237 \202\210\275z(D\237\315\042F\273 \236\020!\042\004\237X\242Y\354A\042\260\311\221\361%\323QD\243\272}\000\336A\330\237U\222\312\202\221\245\3478\245C\201\233m\315\027\307\232\000a<\235.\360\340\360\237/\2638\000\302\340\204A\245\243\t\f\266!'w\251\036\234\022l\217\036\007\237\271\234A\265IX<j2\250\020\230\230N\333S\264\256h\235 !\374\237'\240\tx\000f9\000\217\235\013\234\b!\237\b\000\004"

	.section	.rodata._ouatCompressed,"a",@progbits
	.balign	1
	.globl	_ouatCompressed
_ouatCompressed:
	d24	_ouat0_compressed
	d24	_ouat1_compressed
	d24	_ouat2_compressed
	d24	_ouat3_compressed
	d24	_ouat4_compressed
	d24	_ouat5_compressed
	d24	_ouat6_compressed
	d24	_ouat7_compressed
	d24	_ouat8_compressed
	d24	_ouat9_compressed
	d24	_ouat10_compressed
	d24	_ouatl_compressed

	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"Long ago, two races ruled over Earth: HUMANS and MONSTERS."

	.section	.rodata._.str.1,"a",@progbits
	.balign	1
	.local	_.str.1
_.str.1:
	.asciz	"One day, war broke out between the two races."

	.section	.rodata._.str.2,"a",@progbits
	.balign	1
	.local	_.str.2
_.str.2:
	.asciz	"After a long battle, the humans were victorious."

	.section	.rodata._.str.3,"a",@progbits
	.balign	1
	.local	_.str.3
_.str.3:
	.asciz	"They sealed the monsters underground with a magic spell."

	.section	.rodata._.str.4,"a",@progbits
	.balign	1
	.local	_.str.4
_.str.4:
	.asciz	"Many years later..."

	.section	.rodata._.str.5,"a",@progbits
	.balign	1
	.local	_.str.5
_.str.5:
	.asciz	"MT. EBOTT 201X"

	.section	.rodata._.str.6,"a",@progbits
	.balign	1
	.local	_.str.6
_.str.6:
	.asciz	"Legends say that those who climb the mountain never return."

	.section	.rodata._.str.7,"a",@progbits
	.balign	1
	.local	_.str.7
_.str.7:
	.zero	1

	.section	.rodata._ouatText,"a",@progbits
	.balign	1
	.globl	_ouatText
_ouatText:
	d24	_.str
	d24	_.str.1
	d24	_.str.2
	d24	_.str.3
	d24	_.str.4
	d24	_.str.5
	d24	_.str.6
	d24	_.str.7
	d24	_.str.7
	d24	_.str.7
	d24	_.str.7
	d24	_.str.7

	.section	.data._player,"aw",@progbits
	.balign	1
	.globl	_player
_player:
	d24	150                             ; 0x96
	d24	100                             ; 0x64
	d24	16                              ; 0x10
	d24	24                              ; 0x18
	d24	2                               ; 0x2
	d24	0                               ; 0x0
	d24	0                               ; 0x0
	d24	0                               ; 0x0
	db	0                               ; 0x0

	.section	.data._global_palette,"aw",@progbits
	.balign	1
	.globl	_global_palette
_global_palette:
	.ascii	"\000\000\201\000\002\001\203\001\004\002\205\002\346\202g\203\b\004\211\004\n\005\213\005\f\006\215\006\356\206o\207\020\b\221\b\022\t\222\t\023\n\224\n\365\212v\213\027\f\230\f\031\r\232\r\033\016\234\016\375\216~\217\000\220\201\220\002\221\203\221\004\222\205\222\006\023\207\023\b\224\211\224\n\225\213\225\f\226\215\226\016\027\217\027\020\230\221\230\022\231\222\231\023\232\224\232\025\033\226\033\027\234\230\234\031\235\232\235\033\236\234\236\035\037\236\037  \241 \042!\243!$\042\245\042\006\243\207\243($\251$*%\253%,&\255&\016\247\217\2470(\261(2)\262)3*\264*\025\253\226\2537,\270,9-\272-;.\274.\035\257\236\257 \260\241\260\042\261\243\261$\262\2452&3\2473(\264\251\264*\265\253\265,\266\2556.7\25770\270\261\2702\271\262\2713\272\264:5;\266;7\274\270\2749\275\272\275;\276\274>=?\276?@@\301@BA\303ADB\245\302&\303\247\303HD\311DJE\313ELF\255\306.\307\257\307PHWH\321H\330HRIYI\322I\332ISJ[J\264\312\274\3125\313=\313\266\313\276\313@\314\301\314B\315\303\315D\316\305NFO\307OH\320\311\320J\321\313\321L\322\315RNS\317SP\324\321\324R\325\322\325S\326\324VUW\326WW\330\330\330Y\331\332\331[\332\334Z][\336[`\\\341\\b]\343]d^\305\336F\337\307\337h`\351`ja\353alb\315\342N\343\317\343pd\361dre\362esf\324\346U\347\326\347wh\370hyi\372i{j\334\352]\353\336\353`\354\341\354b\355\343\355d\356\345nfo\347oh\360\351\360j\361\353\361l\362\355rns\357sp\364\361\364r\365\362\365s\366\364vuw\366ww\370\370\370y\371\372\371{\372\374z}{\376{"

	.section	.rodata._.str.8,"a",@progbits
	.balign	1
	.local	_.str.8
_.str.8:
	.asciz	"sans"

	.section	.rodata._.str.9,"a",@progbits
	.balign	1
	.local	_.str.9
_.str.9:
	.asciz	"nope."

	.section	.rodata._.str.10,"a",@progbits
	.balign	1
	.local	_.str.10
_.str.10:
	.asciz	"gerson"

	.section	.rodata._.str.11,"a",@progbits
	.balign	1
	.local	_.str.11
_.str.11:
	.asciz	"Wah ha ha! Why not?"

	.section	.rodata._.str.12,"a",@progbits
	.balign	1
	.local	_.str.12
_.str.12:
	.asciz	"papyru"

	.section	.rodata._.str.13,"a",@progbits
	.balign	1
	.local	_.str.13
_.str.13:
	.asciz	"I'LL ALLOW IT!!!!!!!!!!!!"

	.section	.rodata._.str.14,"a",@progbits
	.balign	1
	.local	_.str.14
_.str.14:
	.asciz	"chara"

	.section	.rodata._.str.15,"a",@progbits
	.balign	1
	.local	_.str.15
_.str.15:
	.asciz	"the true name"

	.section	.rodata._.str.16,"a",@progbits
	.balign	1
	.local	_.str.16
_.str.16:
	.asciz	"frisk"

	.section	.rodata._.str.17,"a",@progbits
	.balign	1
	.local	_.str.17
_.str.17:
	.asciz	"WARNING: This name will make your life hell. Proceed anyway?"

	.section	.rodata._.str.18,"a",@progbits
	.balign	1
	.local	_.str.18
_.str.18:
	.asciz	"jerry"

	.section	.rodata._.str.19,"a",@progbits
	.balign	1
	.local	_.str.19
_.str.19:
	.asciz	"Jerry."

	.section	.rodata._.str.20,"a",@progbits
	.balign	1
	.local	_.str.20
_.str.20:
	.asciz	"toriel"

	.section	.rodata._.str.21,"a",@progbits
	.balign	1
	.local	_.str.21
_.str.21:
	.asciz	"why not choose your own name, my child"

	.section	.rodata._.str.22,"a",@progbits
	.balign	1
	.local	_.str.22
_.str.22:
	.asciz	"mett"

	.section	.rodata._.str.23,"a",@progbits
	.balign	1
	.local	_.str.23
_.str.23:
	.asciz	"metta"

	.section	.rodata._.str.24,"a",@progbits
	.balign	1
	.local	_.str.24
_.str.24:
	.asciz	"mtt"

	.section	.rodata._.str.25,"a",@progbits
	.balign	1
	.local	_.str.25
_.str.25:
	.asciz	"OOH! Are you supporting my brand?"

	.section	.rodata._.str.26,"a",@progbits
	.balign	1
	.local	_.str.26
_.str.26:
	.asciz	"undyne"

	.section	.rodata._.str.27,"a",@progbits
	.balign	1
	.local	_.str.27
_.str.27:
	.asciz	"NO! Get your own name!"

	.section	.rodata._.str.28,"a",@progbits
	.balign	1
	.local	_.str.28
_.str.28:
	.asciz	"alphys"

	.section	.rodata._.str.29,"a",@progbits
	.balign	1
	.local	_.str.29
_.str.29:
	.asciz	"D-Don't do that!"

	.section	.rodata._.str.30,"a",@progbits
	.balign	1
	.local	_.str.30
_.str.30:
	.asciz	"asriel"

	.section	.rodata._.str.31,"a",@progbits
	.balign	1
	.local	_.str.31
_.str.31:
	.asciz	"..."

	.section	.rodata._.str.32,"a",@progbits
	.balign	1
	.local	_.str.32
_.str.32:
	.asciz	"asgore"

	.section	.rodata._.str.33,"a",@progbits
	.balign	1
	.local	_.str.33
_.str.33:
	.asciz	"You cannot."

	.section	.rodata._.str.34,"a",@progbits
	.balign	1
	.local	_.str.34
_.str.34:
	.asciz	"flowey"

	.section	.rodata._.str.35,"a",@progbits
	.balign	1
	.local	_.str.35
_.str.35:
	.asciz	"I already CHOSE that name"

	.section	.rodata._.str.36,"a",@progbits
	.balign	1
	.local	_.str.36
_.str.36:
	.asciz	"aaron"

	.section	.rodata._.str.37,"a",@progbits
	.balign	1
	.local	_.str.37
_.str.37:
	.asciz	"Is this name correct? ;)"

	.section	.rodata._.str.38,"a",@progbits
	.balign	1
	.local	_.str.38
_.str.38:
	.asciz	"alphy"

	.section	.rodata._.str.39,"a",@progbits
	.balign	1
	.local	_.str.39
_.str.39:
	.asciz	"Uh.... OK?"

	.section	.rodata._.str.40,"a",@progbits
	.balign	1
	.local	_.str.40
_.str.40:
	.asciz	"napsta"

	.section	.rodata._.str.41,"a",@progbits
	.balign	1
	.local	_.str.41
_.str.41:
	.asciz	"blooky"

	.section	.rodata._.str.42,"a",@progbits
	.balign	1
	.local	_.str.42
_.str.42:
	.asciz	"............ (They are powerless to stop you.)"

	.section	.rodata._.str.43,"a",@progbits
	.balign	1
	.local	_.str.43
_.str.43:
	.asciz	"bratty"

	.section	.rodata._.str.44,"a",@progbits
	.balign	1
	.local	_.str.44
_.str.44:
	.asciz	"Like, OK, I guess"

	.section	.rodata._.str.45,"a",@progbits
	.balign	1
	.local	_.str.45
_.str.45:
	.asciz	"shyren"

	.section	.rodata._.str.46,"a",@progbits
	.balign	1
	.local	_.str.46
_.str.46:
	.asciz	"...?"

	.section	.rodata._.str.47,"a",@progbits
	.balign	1
	.local	_.str.47
_.str.47:
	.asciz	"woshua"

	.section	.rodata._.str.48,"a",@progbits
	.balign	1
	.local	_.str.48
_.str.48:
	.asciz	"Clean name."

	.section	.rodata._.str.49,"a",@progbits
	.balign	1
	.local	_.str.49
_.str.49:
	.asciz	"temmie"

	.section	.rodata._.str.50,"a",@progbits
	.balign	1
	.local	_.str.50
_.str.50:
	.asciz	"hOI!"

	.section	.rodata._.str.51,"a",@progbits
	.balign	1
	.local	_.str.51
_.str.51:
	.asciz	"catty"

	.section	.rodata._.str.52,"a",@progbits
	.balign	1
	.local	_.str.52
_.str.52:
	.asciz	"Bratty! Bratty! That's MY name!"

	.section	.rodata._.str.53,"a",@progbits
	.balign	1
	.local	_.str.53
_.str.53:
	.asciz	"murder"

	.section	.rodata._.str.54,"a",@progbits
	.balign	1
	.local	_.str.54
_.str.54:
	.asciz	"mercy"

	.section	.rodata._.str.55,"a",@progbits
	.balign	1
	.local	_.str.55
_.str.55:
	.asciz	"That's a little on-the-nose, isn't it...?"

	.section	.rodata._.str.56,"a",@progbits
	.balign	1
	.local	_.str.56
_.str.56:
	.asciz	"bpants"

	.section	.rodata._.str.57,"a",@progbits
	.balign	1
	.local	_.str.57
_.str.57:
	.asciz	"Super deep down the barrel."

	.section	.rodata._.str.58,"a",@progbits
	.balign	1
	.local	_.str.58
_.str.58:
	.asciz	"aaaaaa"

	.section	.rodata._.str.59,"a",@progbits
	.balign	1
	.local	_.str.59
_.str.59:
	.asciz	"not very creative...?"

	.section	.rodata._.str.60,"a",@progbits
	.balign	1
	.local	_.str.60
_.str.60:
	.asciz	"deez"

	.section	.rodata._.str.61,"a",@progbits
	.balign	1
	.local	_.str.61
_.str.61:
	.asciz	"nuts"

	.section	.rodata._.str.62,"a",@progbits
	.balign	1
	.local	_.str.62
_.str.62:
	.asciz	"---Instruction---"

	.section	.rodata._.str.63,"a",@progbits
	.balign	1
	.local	_.str.63
_.str.63:
	.asciz	"[2nd] - Confirm"

	.section	.rodata._.str.64,"a",@progbits
	.balign	1
	.local	_.str.64
_.str.64:
	.asciz	"[Alpha] - Cancel"

	.section	.rodata._.str.65,"a",@progbits
	.balign	1
	.local	_.str.65
_.str.65:
	.asciz	"[Math] - Menu (In-game)"

	.section	.rodata._.str.66,"a",@progbits
	.balign	1
	.local	_.str.66
_.str.66:
	.asciz	"[Hold Clear] - quit"

	.section	.rodata._.str.67,"a",@progbits
	.balign	1
	.local	_.str.67
_.str.67:
	.asciz	"When HP is 0, you lose."

	.section	.rodata._.str.68,"a",@progbits
	.balign	1
	.local	_.str.68
_.str.68:
	.asciz	"Begin game"

	.section	.rodata._.str.69,"a",@progbits
	.balign	1
	.local	_.str.69
_.str.69:
	.asciz	"Settings"

	.section	.rodata._.str.70,"a",@progbits
	.balign	1
	.local	_.str.70
_.str.70:
	.asciz	"Name the fallen human."

	.section	.rodata._.str.71,"a",@progbits
	.balign	1
	.local	_.str.71
_.str.71:
	.asciz	"Quit"

	.section	.rodata._.str.72,"a",@progbits
	.balign	1
	.local	_.str.72
_.str.72:
	.asciz	"Backspace"

	.section	.rodata._.str.73,"a",@progbits
	.balign	1
	.local	_.str.73
_.str.73:
	.asciz	"Done"

	.section	.rodata._.str.74,"a",@progbits
	.balign	1
	.local	_.str.74
_.str.74:
	.asciz	"Is This Name Correct?"

	.section	.rodata._.str.75,"a",@progbits
	.balign	1
	.local	_.str.75
_.str.75:
	.asciz	"Go back"

	.section	.rodata._.str.76,"a",@progbits
	.balign	1
	.local	_.str.76
_.str.76:
	.asciz	"No"

	.section	.rodata._.str.77,"a",@progbits
	.balign	1
	.local	_.str.77
_.str.77:
	.asciz	"Yes"

	.section	.data._undertale_data,"aw",@progbits
	.balign	1
	.globl	_undertale_data
_undertale_data:
	.ascii	"\240x\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 JJssstJ\000\000\000ksssssJ\000Jtsssss!\000\000)tsssst)\000JJsssssssssstJ\000\000\000JJsssssssssst)\000kssssssssssssssJJ\000 JkssssssssssssstJ\000)JkssssssssssstJ\000)Jssssk\000\000\000\000\000\000\000\000!Jkssssssssssk\000!t)ksJ!s\266\377\377\377\377\265\000\000 \377\377\377\377\377\377\336\000\264\377\377\377\377\377\377)\000\000k\377\377\377\377\377\377J\000s\265\377\377\377\377\377\377\377\377\377\377\377\230\000\000 s\265\377\377\377\377\377\377\377\377\377\377\377s\000\376\377\377\377\377\377\377\377\377\377\377\377\377\377\377\265s\000!t\336\377\377\377\377\377\377\377\377\377\377\377\377\377\377\265\000k\264\377\377\377\377\377\377\377\377\377\377\377\377\377\230\000k\264\377\377\377\377\377 \000\000\000\000\000\000\000J\230\377\377\377\377\377\377\377\377\377\377\377\377\000 \264J\265\264\264)\336\377\377\377\377\377\230\000\000 \377\377\377\377\377\377\265\000\230\377\377\377\377\377\377tJ\000k\377\377\377\377\377\377J\000\336\377\377\377\377\377\377\377\377\377\377\377\377\376\336) \336\377\377\377\377\377\377\377\377\377\377\377\377k\000\336\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\336\000)\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\264\000\264\377\377\377\377\377\377\377\377\377\377\377\377\377\377t\000\265\377\377\377\377\377\376 \000\000\000\000\000\000\000s\377\377\377\377\377\377\377\377\377\377\377\377\376\000\000s)\230s\230)\377\377\377\377\377\377\264\000\000 \377\377\377\377\377\377\266\000\230\377\377\377\377\377\377\265t\000k\377\377\377\377\377\377J\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377J \377\377\377\377\377\377\377\377\377\377\377\377\377k\000\336\377\377\377\377\377\377\376\377\377\376\376\377\377\377\377\377\000J\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\264\000\265\377\377\377\377\377\377\377\377\377\377\377\377\377\377t\000\336\377\377\377\377\377\377 \000\000\000\000\000\000\000\230\377\377\377\377\377\377\377\377\377\377\377\377\376\000\000) ))))\377\377\377\377\377\377\264\000\000 \377\377\377\377\377\377\266\000\230\377\377\377\377\377\377\377\336\000k\377\377\377\377\377\377J\000\377\377\377\377\377\230\265\377\377\377\377\377\377\377\377) \377\377\377\377\377\377\377\377\377\377\377\377\377s\000\336\377\377\377\377\377\376\340\363\377\351\340\377\377\377\377\377\000J\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\264\000\265\377\377\377\377\377\377\377\377\377\377\377\377\377\377t\000\266\377\377\377\377\377\377 \000\000\000\000\000\000\000\230\377\377\377\377\377\377\377\377\377\377\377\377\377 \000\000\000\000\000\000)\377\377\377\377\377\377\264\000\000 \377\377\377\377\377\377\266\000\230\377\377\377\377\377\377\377\336\000k\377\377\377\377\377\377J\000\377\377\377\377\377kJ\230\336\377\377\377\377\377\377) \377\377\377\377\377\377\336\230\264\264\264\230\264J\000\336\377\377\377\377\377\376\340\351\365\351\340\377\377\377\377\377\000J\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\264\000\265\377\377\377\377\377\377\377\377\377\377\377\377\377\377t\000\266\377\377\377\377\377\377 \000\000\000\000\000\000\000\230\377\377\377\377\377\377\265\230\264\264\230\264t\000\000\000\000\000\000\000)\377\377\377\377\377\377\264\000\000 \377\377\377\377\377\377\266\000\230\377\377\377\377\377\377\377\336\000k\377\377\377\377\377\377J\000\377\377\377\377\377!\000\000s\377\377\377\377\377\377) \377\377\377\377\377\377\264\000\000\000\000\000\000\000\000\336\377\377\377\377\377\376\340\340\340\340\340\377\377\377\377\377\000J\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\265\000\265\377\377\377\377\377\377\377\377\377\377\377\377\377\377t\000\266\377\377\377\377\377\377 \000\000\000\000\000\000\000\230\377\377\377\377\377\377!\000\000\000\000\000\000\000\000\000\000\000\000\000)\377\377\377\377\377\377\264\000\000 \377\377\377\377\377\377\266\000\230\377\377\377\264\336\377\377\377\265\336\377\377\377\377\377\377J\000\377\377\377\377\377!\000\000t\377\377\377\377\377\377) \377\377\377\377\377\377\376\265\266\265\266\265k)\000\336\377\377\377\377\377\377\336\363\340\363\336\377\377\377\377\377  JJJJk\377\377\377\377\377\377\265JJJJ)\000\265\377\377\377\377\266\264JJ)\265\377\377\377\377t\000\266\377\377\377\377\377\377 \000\000\000\000\000\000\000\230\377\377\377\377\377\377\336\265\266\265\266sJ\000\000\000\000\000\000\000)\377\377\377\377\377\377\264\000\000!\377\377\377\377\377\377\266\000\230\377\377\376k\265\377\377\377\377\377\377\377\377\377\377\377J\000\377\377\377\377\377!\000\000t\377\377\377\377\377\377) \377\377\377\377\377\377\377\377\377\377\377\336tJ\000\336\377\377\377\377\377\377\377\365\340\336\377\377\377\377\377\377 \000\000\000\000\000)\377\377\377\377\377\377t\000\000\000\000\000\000\265\377\377\377\377\265s \000\000t\377\377\377\377t\000\266\377\377\377\377\377\377 \000\000\000\000\000\000\000\230\377\377\377\377\377\377\377\377\377\377\377\265k\000\000\000\000\000\000\000)\377\377\377\377\377\377\230\000Jt\377\377\377\377\377\377\266\000\230\377\377\336\000t\377\377\377\377\377\377\377\377\377\377\377J\000\377\377\377\377\377! k\265\377\377\377\377\377\377) \377\377\377\377\377\377\265\000\000\000\000\000\000\000\000\336\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377!\000\000\000\000\000)\377\377\377\377\377\377\230\000\000\000\000\000\000\265\377\377\377\377\377\377\377\377\377\377\377\377\377\377t\000\266\377\377\377\377\377\377\000\000\000\000\000\000\000\000\230\377\377\377\377\377\377)\000\000\000\000\000\000\000\000\000\000\000\000\000)\377\377\377\377\377\377\265J\230\265\377\377\377\377\377\377\266\000\230\377\377\336\000J\265\376\377\377\377\377\377\377\377\377\377J\000\377\377\377\377\377!!\265\336\377\377\377\377\377\377) \377\377\377\377\377\377\266JJJJJJ!\000\336\377\377\377\377\377\377\377\377\377\377\377\336\266\265\265\265 \000\000\000\000\000)\377\377\377\377\377\377\230\000\000\000\000\000\000\265\377\377\377\377\336\264\265\265\336\376\377\377\377\377t\000\266\377\377\377\377\377\377kJJJJJJ\000\230\377\377\377\377\377\377sJJJJJJ\000\000\000\000\000\000\000)\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\266\000\230\377\377\336\000\000\000\336\377\377\377\377\377\377\377\377\377J\000\377\377\377\377\377\000!\377\377\377\377\377\377\377\377) \377\377\377\377\377\377\377\377\377\377\377\377\377s\000\336\377\377\377\377\377\377\377\377\377\377\377tJ\000\000\000\000\000\000\000\000\000)\377\377\377\377\377\377\230\000\000\000\000\000\000\265\377\377\377\377J\000\000 s\266\377\377\377\377t\000\266\377\377\377\377\377\377\377\377\377\377\377\377\336\000\230\377\377\377\377\377\377\377\377\377\377\377\377\377 \000\000\000\000\000\000)\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\266\000\230\377\377\336\000\000\000Jk\377\377\377\377\377\377\377\377J\000\377\377\377\377\377\265\265\377\377\377\377\377\377\377\377) \377\377\377\377\377\377\377\377\377\377\377\377\377k\000\336\377\377\377\377\265\265\377\377\377\377\377\336\266\265\265\264 \000\000\000\000\000)\377\377\377\377\377\377\230\000\000\000\000\000\000\265\377\377\377\377k\000\000 !\264\377\377\377\377t\000\266\377\377\377\377\377\377\377\377\377\377\377\377\265\000\230\377\377\377\377\377\377\377\377\377\377\377\377\376\000\000\000\000\000\000\000)\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\265\000\230\377\377\266\000\000\000\000 \377\377\377\377\377\377\377\377J\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377) \377\377\377\377\377\377\377\377\377\377\377\377\377k\000\336\377\377\377\377\230s\377\377\377\377\377\377\377\377\377\377!\000\000\000\000\000)\377\377\377\377\377\377\230\000\000\000\000\000\000\265\377\377\377\377k\000\000\000\000t\377\377\377\377t\000\266\377\377\377\377\377\377\377\377\377\377\377\377\265\000\230\377\377\377\377\377\377\377\377\377\377\377\377\376\000\000\000\000\000\000\000)\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\336\000\264\377\377\336\000\000\000\000!\230\266\377\377\377\377\377\377J\000\377\377\377\377\377\377\377\377\377\377\377\377\377\264\000\000!\377\377\377\377\377\377\377\377\377\377\377\377\377s\000\376\377\377\377\377J\000!! \266\377\377\377\377\377\377!\000\000\000\000\000)\377\377\377\377\377\377\230\000\000\000\000\000\000\265\377\377\377\377k\000\000\000\000\230\377\377\377\377\230\000\336\377\377\377\377\377\377\377\377\377\377\377\377\336\000\264\377\377\377\377\377\377\377\377\377\377\377\377\377 \000\000\000\000\000\000!\265\265\265\265\265\265\265\265\265\265\265\265\265\265\265\266\230\000k\266\265\230\000\000\000\000 Jt\266\265\265\265\265\266J\000\265\265\265\265\265\265\265\265\265\265\265\265\266k\000\000 \265\265\265\265\265\265\265\265\265\265\265\265\266J\000\264\266\265\265\266!\000\000\000\000t\266\265\265\265\265\265 \000\000\000\000\000!\265\265\265\265\265\266k\000\000\000\000\000\000s\266\265\265\266J\000\000\000\000k\266\265\265\266k\000\230\266\265\265\265\265\265\265\265\265\265\265\266\230\000k\266\265\265\265\265\265\265\265\265\265\265\265\265"
	.zero	8167

	.section	.rodata._.str.78,"a",@progbits
	.balign	1
	.local	_.str.78
_.str.78:
	.asciz	"PRESS Z OR ENTER"

	.section	.rodata._.str.79,"a",@progbits
	.balign	1
	.local	_.str.79
_.str.79:
	.asciz	"Settings Menu (WIP)"

	.section	.rodata._.str.80,"a",@progbits
	.balign	1
	.local	_.str.80
_.str.80:
	.asciz	"gaster"

	.section	.bss._main.last_anim_time,"aw",@nobits
	.balign	1
	.local	_main.last_anim_time
_main.last_anim_time:
	.zero	4

	.section	.data._friskidledown_data,"aw",@progbits
	.balign	1
	.globl	_friskidledown_data
_friskidledown_data:
	.asciz	"\023\035\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@@@\000\000@@@@\345@@@@\345@@@@@@@\000\000@@@\345\345\345@@\345\345@@\345@@@@\000\000@@@\345\345\345\345\345\345\345\345\345\345\345@@@@@@@@\345\345\345\345\345\345\345\345\345\345\345@\345@@@@@@\345\000\000\345\345\345\345\000\000\345\345\345\345@@@@@\345\345\345\345\345\345\345\345\345\345\345\345\345@@@@@@\345\345\345\345\345\000\000\345\345\345\345\345@@@@@@@@\345\345\345\345\345\345\345\345\345@@@@@@@@@@@@\345\345\345\345\345\345@@@@@@@\000@\000@@@@@@\345\345@@@@@\000@\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000@\000\000\000\000\000\000\000\000\000\000@@@@@@@\000\000\000\000\000\000\000\000\000@@@]@@@@]@@@\000\000\000\000\000\000@]@]]]]]]]]@]@\000\000\000\000@]@\330\330\330\330\330\330\330\330\330@@]@\000\000\000@]@]]]]]]]]]]@]@\000\000\000@@@\330\330\330\330\330\330\330\330\330\330@@@\000\000\000@\345@]]]]]]]]]]@\345@\000\000\000@@@]]]]]]]]]]@@@\000\000\000\000\000@]]]@@@]]]]@\000\000\000\000\000\000\000@]]]@\000@]]]]@\000\000\000\000\000\000\000@@@@@\000@@@@@@\000\000\000\000\000\000\000\000\000@@@\000@@@@\000\000\000\000\000\000\000\000\000\000@@@@\000@@@@@\000\000\000"

	.section	.data._friskdownmove1_data,"aw",@progbits
	.balign	1
	.globl	_friskdownmove1_data
_friskdownmove1_data:
	.ascii	"\023\035\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@@@\000\000@@@@\345@@@@\345@@@@@@@\000\000@@@\345\345\345@@\345\345@@\345@@@@\000\000@@@\345\345\345\345\345\345\345\345\345\345\345@@@@@@@@\345\345\345\345\345\345\345\345\345\345\345@\345@@@@@@\345\000\000\345\345\345\345\000\000\345\345\345\345@@@@@\345\345\345\345\345\345\345\345\345\345\345\345\345@@@@@@\345\345\345\345\345\000\000\345\345\345\345\345@@@@@@@@\345\345\345\345\345\345\345\345\345@@@@@@@@@@@@\345\345\345\345\345\345@@@@@@@\000@\000@@@@@@\345\345@@@@@\000@\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000@\000\000\000\000\000\000\000\000\000\000@@@@@@@\000\000\000\000\000\000\000\000\000@@@]]@@@]@@@\000\000\000\000\000\000@]@]]]]]]]]@]@\000\000\000\000@]@\330\330\330\330\330\330\330\330\330@@]@\000\000\000@@@]]]]]]]]]]@@@\000\000\000@\345\345@\330\330\330\330\330\330\330\330\330@\345@\000\000\000@\345\345@]]]]]]]]]@@@\000\000\000@@@]]]]]@@@]]@\000\000\000\000\000\000\000@]]]@@@@@@]@\000\000\000\000\000\000\000\000@]]@\000@@@@@\000\000\000\000\000\000\000\000\000@@@@\000@@@@\000\000\000\000\000\000\000\000\000\000\000@@@\000\000@@@\000\000\000\000\000\000\000\000\000\000\000\000@@"
	.zero	10

	.section	.data._friskdownmove2_data,"aw",@progbits
	.balign	1
	.globl	_friskdownmove2_data
_friskdownmove2_data:
	.asciz	"\023\035\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@@@\000\000@@@@\345@@@@\345@@@@@@@\000\000@@@\345\345\345@@\345\345@@\345@@@@\000\000@@@\345\345\345\345\345\345\345\345\345\345\345@@@@@@@@\345\345\345\345\345\345\345\345\345\345\345@\345@@@@@@\345\000\000\345\345\345\345\000\000\345\345\345\345@@@@@\345\345\345\345\345\345\345\345\345\345\345\345\345@@@@@@\345\345\345\345\345\000\000\345\345\345\345\345@@@@@@@@\345\345\345\345\345\345\345\345\345@@@@@@@@@@@@\345\345\345\345\345\345@@@@@@@\000@\000@@@@@@\345\345@@@@@\000@\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000@\000\000\000\000\000\000\000\000\000\000@@@@@@@\000\000\000\000\000\000\000\000\000@@@]@@@]]@@@\000\000\000\000\000\000@]@]]]]]]]]@]@\000\000\000\000@]@@\330\330\330\330\330\330\330\330\330@]@\000\000\000@@@]]]]]]]]]]@@@\000\000\000@\345@\330\330\330\330\330\330\330\330\330@\345\345@\000\000\000@@@]]]]]]]]]@\345\345@\000\000\000\000\000@]]@@@]]]]]@@@\000\000\000\000\000@]@@@@@@]]]@\000\000\000\000\000\000\000\000@@@@@\000@]]@\000\000\000\000\000\000\000\000\000\000@@@@\000@@@@\000\000\000\000\000\000\000\000\000\000@@@\000\000@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@\000\000\000\000\000"

	.section	.data._friskidleup_data,"aw",@progbits
	.balign	1
	.globl	_friskidleup_data
_friskidleup_data:
	.asciz	"\023\035\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@@@@@@@\000\000@@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\000@\000@@@@@@@@@@@@@\000@\000\000\000\000@\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@@\000\000\000\000\000\000\000\000\000\000@@@]]]]]]@@@\000\000\000\000\000\000@]@]]]]]]]]@]@\000\000\000\000@]@@\330\330\330\330\330\330\330\330\330@]@\000\000\000@]@]]]]]]]]]]@]@\000\000\000@@@\330\330\330\330\330\330\330\330\330\330@@@\000\000\000@\345@]]]]]]]]]]@\345@\000\000\000@@@]]]]]]]]]]@@@\000\000\000\000\000@]]]]@@@]]]@\000\000\000\000\000\000\000@]]]]@\000@]]]@\000\000\000\000\000\000\000@@@@@@\000@@@@@\000\000\000\000\000\000\000\000\000@@@@\000@@@\000\000\000\000\000\000\000\000\000\000@@@@@\000@@@@@\000\000\000"

	.section	.data._friskupmove1_data,"aw",@progbits
	.balign	1
	.globl	_friskupmove1_data
_friskupmove1_data:
	.asciz	"\023\035\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@@@@@@@\000\000@@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\000@\000@@@@@@@@@@@@@\000@\000\000\000\000@\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@@\000\000\000\000\000\000\000\000\000\000@@@]]]]]]@@@\000\000\000\000\000\000@]@]]]]]]]]@]@\000\000\000\000@]@@\330\330\330\330\330\330\330\330\330@]@\000\000\000@@@]]]]]]]]]]@@@\000\000\000@\345@\330\330\330\330\330\330\330\330\330@\345\345@\000\000\000\000@@]]]]]]]]]@\345\345@\000\000\000\000\000@]]]]]]]]]]@@@\000\000\000\000\000@]]]]@@]@@]@\000\000\000\000\000\000\000\000@]]@@\000@@@@\000\000\000\000\000\000\000\000\000\000@@@@\000@@@@\000\000\000\000\000\000\000\000\000\000@@@\000\000@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@\000\000\000\000\000\000"

	.section	.data._friskupmove2_data,"aw",@progbits
	.balign	1
	.globl	_friskupmove2_data
_friskupmove2_data:
	.ascii	"\023\035\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@@@@@@@\000\000@@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\000@\000@@@@@@@@@@@@@\000@\000\000\000\000@\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@@\000\000\000\000\000\000\000\000\000\000@@@]]]]]]@@@\000\000\000\000\000\000@]@]]]]]]]]@]@\000\000\000\000@]@\330\330\330\330\330\330\330\330\330@@]@\000\000\000@@@]]]]]]]]]]@@@\000\000\000@\345\345@\330\330\330\330\330\330\330\330\330@\345@\000\000\000@\345\345@]]]]]]]]]@@\000\000\000\000@@@]]]]]]]]]]@\000\000\000\000\000\000\000@]@@]@@]]]]@\000\000\000\000\000\000\000\000@@@@\000@@]]@\000\000\000\000\000\000\000\000\000@@@@\000@@@@\000\000\000\000\000\000\000\000\000\000\000@@@\000\000@@@\000\000\000\000\000\000\000\000\000\000\000\000@@"
	.zero	11

	.section	.data._friskidleleft_data,"aw",@progbits
	.balign	1
	.globl	_friskidleleft_data
_friskidleleft_data:
	.ascii	"\024\036\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000@@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@@@\000\000\000\000@@@\345@\345@@@@@@@@@@@\000\000\000\000@@\345@\345\345@@@@@@@@@@\000\000\000\000@\345\345\345\345\345@@@@@@@@@@\000\000\000\000@\345\345\345\345\345@@\345\345@@@@@@\000\000\000\000@\345\000\000\345\345@\345\345\345@@@@@@\000\000\000@\345\345\345\345\345\345@\345\345@@@@@@@\000\000\000@\345\345\345\345\345\345\345\345@@@@@@@@\000\000\000@\000\000\345\345\345\345\345@@@@@@@@\000\000\000\000\000@\345\345\345\345\345\345@@@@@@\000@\000\000\000\000\000\000@@@@@\345\345@@\000@\000\000\000\000\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@]@@\000\000\000\000\000\000\000\000\000\000\000\000\000@]]]]@]@\000\000\000\000\000\000\000\000\000\000\000\000@\330\330@]@\330@\000\000\000\000\000\000\000\000\000\000\000@]]]@]@]@\000\000\000\000\000\000\000\000\000\000\000@\330\330\330@@@\330@\000\000\000\000\000\000\000\000\000\000\000@]]@\345\345@]@\000\000\000\000\000\000\000\000\000\000\000@]]@\345\345@]@\000\000\000\000\000\000\000\000\000\000\000\000@]]@@]]@\000\000\000\000\000\000\000\000\000\000\000\000\000@]]]]@\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@"
	.zero	9

	.section	.data._friskleftmove1_data,"aw",@progbits
	.balign	1
	.globl	_friskleftmove1_data
_friskleftmove1_data:
	.asciz	"\021\034\000\000\000\000@@@@@@@@@\000\000\000\000\000\000@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@\000\000@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@\000@@@\345@\345@@@@@@@@@@@\000@@\345@\345\345@@@@@@@@@@\000@\345\345\345\345\345@@@@@@@@@@\000@\345\345\345\345\345@@\345\345@@@@@@\000@\345@@\345\345@\345\345\345@@@@@@@\345\345\345\345\345\345@\345\345@@@@@@@@\345\345\345\345\345\345\345\345@@@@@@@@@\000\000\345\345\345\345\345@@@@@@@@\000\000@\345\345\345\345\345\345@@@@@@\000@\000\000\000@@@@@\345\345@@\000@\000\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000@@@]@@\000\000\000\000\000\000\000\000\000\000@]]]]@]@\000\000\000\000\000\000\000\000\000@\330\330@]@\330@\000\000\000\000\000\000\000\000@]]@@]@]@\000\000\000\000\000\000\000\000@\330@\345\345@@\330@\000\000\000\000\000\000\000\000@]@\345\345@]]@\000\000\000\000\000\000\000\000@]]@@]]]@\000\000\000\000\000\000\000\000\000@]]]]]@@\000\000\000\000\000\000@@\000@@@\000@@@@@\000\000\000\000\000\000@@@@@\000\000@@@@\000\000\000\000\000\000\000@@@\000\000@@@@\000\000\000\000"

	.section	.data._friskleftmove2_data,"aw",@progbits
	.balign	1
	.globl	_friskleftmove2_data
_friskleftmove2_data:
	.asciz	"\021\034\000\000\000\000@@@@@@@@@\000\000\000\000\000\000@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@\000\000@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@\000@@@\345@\345@@@@@@@@@@@\000@@\345@\345\345@@@@@@@@@@\000@\345\345\345\345\345@@@@@@@@@@\000@\345\345\345\345\345@@\345\345@@@@@@\000@\345@@\345\345@\345\345\345@@@@@@@\345\345\345\345\345\345@\345\345@@@@@@@@\345\345\345\345\345\345\345\345@@@@@@@@@\000\000\345\345\345\345\345@@@@@@@@\000\000@\345\345\345\345\345\345@@@@@@\000@\000\000\000@@@@@\345\345@@\000@\000\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000@@@]@@\000\000\000\000\000\000\000\000\000\000@]]]]@]@\000\000\000\000\000\000\000\000\000@\330\330@]@\330@\000\000\000\000\000\000\000\000@]]@@]@]@\000\000\000\000\000\000\000\000@\330@\345\345@@\330@\000\000\000\000\000\000\000\000@]@\345\345@]]@\000\000\000\000\000\000\000\000@]]@@]]]@\000\000\000\000\000\000\000\000\000@]]]]]@@\000\000\000\000\000\000@@\000@@@\000@@@@@\000\000\000\000\000\000@@@@@\000\000@@@@\000\000\000\000\000\000\000@@@\000\000@@@@\000\000\000\000"

	.section	.data._friskidleright_data,"aw",@progbits
	.balign	1
	.globl	_friskidleright_data
_friskidleright_data:
	.asciz	"\024\036\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000\000@@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@\345@\345@@@\000\000\000@@@@@@@@@@\345\345@\345@@\000\000\000\000@@@@@@@@@@\345\345\345\345\345@\000\000\000\000@@@@@@\345\345@@\345\345\345\345\345@\000\000\000\000@@@@@@\345\345\345@\345\345\000\000\345@\000\000\000\000@@@@@@@\345\345@\345\345\345\345\345\345@\000\000\000@@@@@@@@\345\345\345\345\345\345\345\345@\000\000\000\000@@@@@@@@\345\345\345\345\345\000\000@\000\000\000\000@\000@@@@@@\345\345\345\345\345\345@\000\000\000\000\000\000\000\000@\000@@\345\345@@@@@\000\000\000\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@]@@@\000\000\000\000\000\000\000\000\000\000\000\000\000@]@]]]]@\000\000\000\000\000\000\000\000\000\000\000\000@\330@]@\330\330@\000\000\000\000\000\000\000\000\000\000\000\000@]@]@]]]@\000\000\000\000\000\000\000\000\000\000\000@\330@@@\330\330\330@\000\000\000\000\000\000\000\000\000\000\000@]@\345\345@]]@\000\000\000\000\000\000\000\000\000\000\000@]@\345\345@]]@\000\000\000\000\000\000\000\000\000\000\000@]]@@]]@\000\000\000\000\000\000\000\000\000\000\000\000\000@]]]]@\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@\000\000\000\000\000\000"

	.section	.data._friskrightmove1_data,"aw",@progbits
	.balign	1
	.globl	_friskrightmove1_data
_friskrightmove1_data:
	.asciz	"\024\036\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000\000\000\000@@@@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@@@\000\000\000\000\000@@@@@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@@@\000\000\000@@@@@@@@@@@\345@\345@@@\000\000\000@@@@@@@@@@\345\345@\345@@\000\000\000\000@@@@@@@@@@\345\345\345\345\345@\000\000\000\000@@@@@@\345\345@@\345\345\345\345\345@\000\000\000\000@@@@@@\345\345\345@\345\345@@\345@\000\000\000\000@@@@@@@\345\345@\345\345\345\345\345\345@\000\000\000@@@@@@@@\345\345\345\345\345\345\345\345@\000\000\000\000@@@@@@@@\345\345\345\345\345@@@\000\000\000\000@\000@@@@@@\345\345\345\345\345\345@\000\000\000\000\000\000\000\000@\000@@\345\345@@@@@\000\000\000\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@@]@@@\000\000\000\000\000\000\000\000\000\000\000\000\000@]@]]]]@\000\000\000\000\000\000\000\000\000\000\000\000@\330@]@\330\330@\000\000\000\000\000\000\000\000\000\000\000\000@]@]@@]]@\000\000\000\000\000\000\000\000\000\000\000@\330@@\345\345@\330@\000\000\000\000\000\000\000\000\000\000\000@]]@\345\345@]@\000\000\000\000\000\000\000\000\000\000\000@]]]@@]]@\000\000\000\000\000\000\000\000\000\000\000@@]]]]]@\000\000\000\000\000\000\000\000\000\000\000@@@@@\000@@@\000@@\000\000\000\000\000\000\000\000@@@@\000\000@@@@@\000\000\000\000\000\000\000\000\000\000@@@@\000\000@@@\000\000\000\000"

	.section	.data._friskrightmove2_data,"aw",@progbits
	.balign	1
	.globl	_friskrightmove2_data
_friskrightmove2_data:
	.asciz	"\021\034\000\000\000\000@@@@@@@@@\000\000\000\000\000\000\000@@@@@@@@@@@@\000\000\000\000@@@@@@@@@@@@@@\000\000@@@@@@@@@@@@@@@@\000@@@@@@@@@@@@@@@@@@@@@@@@@@@\345@\345@@@@@@@@@@@@@\345\345@\345@@\000@@@@@@@@@@\345\345\345\345\345@\000@@@@@@\345\345@@\345\345\345\345\345@\000@@@@@@\345\345\345@\345\345@@\345@\000@@@@@@@\345\345@\345\345\345\345\345\345@@@@@@@@@\345\345\345\345\345\345\345\345@\000@@@@@@@@\345\345\345\345\345@@@\000@\000@@@@@@\345\345\345\345\345\345@\000\000\000\000\000@\000@@\345\345@@@@@\000\000\000\000\000\000\000\000\000@\345\345@\000\000\000\000\000\000\000\000\000\000\000\000\000@@@@\000\000\000\000\000\000\000\000\000\000\000\000@@]@@@\000\000\000\000\000\000\000\000\000\000@]@]]]]@\000\000\000\000\000\000\000\000\000@\330@]@\330\330@\000\000\000\000\000\000\000\000\000@]@]@@]]@\000\000\000\000\000\000\000\000@\330@@\345\345@\330@\000\000\000\000\000\000\000\000@]]@\345\345@]@\000\000\000\000\000\000\000\000@]]]@@]]@\000\000\000\000\000\000\000\000@@]]]]]@\000\000\000\000\000\000\000\000@@@@@\000@@@\000@@\000\000\000\000\000@@@@\000\000@@@@@\000\000\000\000\000\000\000@@@@\000\000@@@\000\000"

	.section	.rodata._.str.81,"a",@progbits
	.balign	1
	.local	_.str.81
_.str.81:
	.asciz	"Hard Mode Activated!"

	.section	.rodata._.str.82,"a",@progbits
	.balign	1
	.local	_.str.82
_.str.82:
	.asciz	"Quitting"

	.section	.rodata._.str.83,"a",@progbits
	.balign	1
	.local	_.str.83
_.str.83:
	.asciz	"Quitting."

	.section	.rodata._.str.84,"a",@progbits
	.balign	1
	.local	_.str.84
_.str.84:
	.asciz	"Quitting.."

	.section	.rodata._.str.85,"a",@progbits
	.balign	1
	.local	_.str.85
_.str.85:
	.asciz	"Quitting..."

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	__sdivs
	.extern	__ldivu
	.extern	_llvm.smin.i24
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_llvm.lifetime.end.p0
	.extern	_memcpy
	.extern	_llvm.umin.i32
	.extern	_gfx_SetPalette
	.extern	__ishru
	.extern	__sdivu
	.extern	__Unwind_SjLj_Unregister
	.extern	__sor
	.extern	_strncasecmp
	.extern	__idivs
	.extern	_kb_Scan
	.extern	_gfx_PrintStringXY
	.extern	__ineg
	.extern	_llvm.umin.i8
	.extern	_rand
	.extern	_llvm.memset.p0.i24
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_os_GetCSC
	.extern	_gfx_End
	.extern	__lsub
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_malloc
	.extern	__inot
	.extern	_llvm.frameaddress.p0
	.extern	__sand
	.extern	_llvm.stackrestore.p0
	.extern	__sxor
	.extern	_gfx_GetStringWidth
	.extern	__lcmpu
	.extern	_gfx_SetTextFGColor
	.extern	_gfx_SetTextScale
	.extern	_gfx_Begin
	.extern	__ladd
	.extern	_llvm.umin.i24
	.extern	_clock
	.extern	_gfx_AllocSprite
	.extern	_strncpy
	.extern	__irems
	.extern	_gfx_SetTransparentColor
	.extern	__ishru_1
	.extern	_llvm.smax.i24
	.extern	_llvm.eh.sjlj.lsda
	.extern	_free
	.extern	_strlen
	.extern	__frameset
	.extern	__iand
	.extern	__ishrs_1
	.extern	__imulu
	.extern	__setflag
	.extern	_zx7_Decompress
	.extern	_gfx_GetPixel
	.extern	_gfx_TransparentSprite
	.extern	_llvm.stacksave.p0
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.lifetime.start.p0
	.extern	_memcmp
	.extern	_gfx_ZeroScreen
	.extern	__lmulu
	.extern	__frameset0
	.extern	__Unwind_SjLj_Register
	.extern	__lshru
	.extern	__sshl
	.extern	__bshl
	.extern	__smulu
	.extern	_gfx_Blit
	.extern	_gfx_SetDraw
	.extern	__ishl
	.extern	_gfx_ScaledSprite_NoClip
