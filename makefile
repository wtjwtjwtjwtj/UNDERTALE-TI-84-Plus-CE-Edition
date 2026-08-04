# ----------------------------
# Makefile Options
# ----------------------------

NAME        = Undrtale
ICON        = icon.png
DESCRIPTION = "Undertale CE Port"
COMPRESSED  = YES

# ----------------------------
# Graphics Configuration
# ----------------------------

# Change the toolchain's internal graphics directory variable
GFXDIR = gfx

# ----------------------------
# Include the CEdev makefile
# ----------------------------

# This must remain at the very bottom
include $(shell cedev-config --makefile)
