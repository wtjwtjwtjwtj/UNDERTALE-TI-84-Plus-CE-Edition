/* generated from: obj/Undrtale.o */
#define HAS_INIT_ARRAY 0
#define HAS_FINI_ARRAY 0
#define HAS_CLOCK 1
#define HAS_ABORT 0
#define HAS_EXIT 0
#define HAS_C99__EXIT 0
#define HAS_RUN_PRGM 0
#define HAS_MAIN_ARGC_ARGV 0
#define HAS_ATEXIT 0
#ifdef __ASSEMBLER__
.macro LIBLOAD_LIBS
	.global __libload_library_GRAPHX
	.type __libload_library_GRAPHX, @object
__libload_library_GRAPHX:
	.db 0xC0, "GRAPHX", 0, 14
	.global _gfx_Begin
	.type _gfx_Begin, @function
_gfx_Begin:
	jp 0
	.global _gfx_End
	.type _gfx_End, @function
_gfx_End:
	jp 3
	.global _gfx_SetPalette
	.type _gfx_SetPalette, @function
_gfx_SetPalette:
	jp 12
	.global _gfx_GetPixel
	.type _gfx_GetPixel, @function
_gfx_GetPixel:
	jp 21
	.global _gfx_SetDraw
	.type _gfx_SetDraw, @function
_gfx_SetDraw:
	jp 27
	.global _gfx_Blit
	.type _gfx_Blit, @function
_gfx_Blit:
	jp 33
	.global _gfx_PrintStringXY
	.type _gfx_PrintStringXY, @function
_gfx_PrintStringXY:
	jp 54
	.global _gfx_SetTextFGColor
	.type _gfx_SetTextFGColor, @function
_gfx_SetTextFGColor:
	jp 63
	.global _gfx_GetStringWidth
	.type _gfx_GetStringWidth, @function
_gfx_GetStringWidth:
	jp 78
	.global _gfx_AllocSprite
	.type _gfx_AllocSprite, @function
_gfx_AllocSprite:
	jp 168
	.global _gfx_TransparentSprite
	.type _gfx_TransparentSprite, @function
_gfx_TransparentSprite:
	jp 174
	.global _gfx_ScaledSprite_NoClip
	.type _gfx_ScaledSprite_NoClip, @function
_gfx_ScaledSprite_NoClip:
	jp 186
	.global _gfx_SetTextScale
	.type _gfx_SetTextScale, @function
_gfx_SetTextScale:
	jp 222
	.global _gfx_SetTransparentColor
	.type _gfx_SetTransparentColor, @function
_gfx_SetTransparentColor:
	jp 225
	.global _gfx_ZeroScreen
	.type _gfx_ZeroScreen, @function
_gfx_ZeroScreen:
	jp 228
	.global __libload_library_KEYPADC
	.type __libload_library_KEYPADC, @object
__libload_library_KEYPADC:
	.db 0xC0, "KEYPADC", 0, 2
	.global _kb_Scan
	.type _kb_Scan, @function
_kb_Scan:
	jp 0
.endm
#endif
#define HAS_LIBLOAD 1
