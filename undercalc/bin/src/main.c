#include <ti/getcsc.h>
#include <graphx.h>
#include <keypadc.h>
#include <compression.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include "gfx/gfx.h"

#define COLOR_WHITE 254
#define COLOR_YELLOW 253
#define COLOR_QUIT_TEXT 252
#define COLOR_GREY 251
#define ROWS 9
#define COLS 7
#define NAME_FADE_TIME (5UL * CLOCKS_PER_SEC)
#define QUIT_HOLD_TIME (2UL * CLOCKS_PER_SEC)
#define QUIT_FADE_TIME (CLOCKS_PER_SEC / 2)
#define OUAT_CHAR_TIME (CLOCKS_PER_SEC / 10)
#define OUAT_TEXT_PAUSE CLOCKS_PER_SEC
#define OUAT_EMPTY_PAUSE (CLOCKS_PER_SEC * 2)
#define OUAT_SLIDE_COUNT 12
#define OUAT_LAST_WAIT (CLOCKS_PER_SEC * 2)
#define OUAT_SCROLL_SPEED 60

const char layout[ROWS][COLS] = {
    {'A','B','C','D','E','F','G'},
    {'H','I','J','K','L','M','N'},
    {'O','P','Q','R','S','T','U'},
    {'V','W','X','Y','Z',' ',' '},
    {'a','b','c','d','e','f','g'},
    {'h','i','j','k','l','m','n'},
    {'o','p','q','r','s','t','u'},
    {'v','w','x','y','z',' ',' '},
    {'1',' ','2',' ',' ','3',' '}
};

char name[7] = "      ";
int nameLen = 0;
int cx = 0;
int cy = 0;
int gameState = -4;
int menuSel = 0;
int zoomTimer = 0;
int confirmSel = 1;
int ouatSlide = 0;
int ouat_current_y = 0; // State-saver for scroll location during transition
uint16_t ouat_frozen_chars = 0; // State-saver for visible letters count during skip

clock_t clearStart = 0;
clock_t fadeStart = 0;
clock_t ouatSlideStart = 0;
clock_t splashStart = 0;
clock_t skipStart = 0;

bool clearHeld = false;
bool restorePalette = false;
bool hardMode = false;
bool isSkipping = false;

gfx_sprite_t *ouatSprite = NULL;
gfx_sprite_t *windowSprite = NULL; // Temp sprite for safe scrolling

const uint8_t *const ouatCompressed[OUAT_SLIDE_COUNT] = {
    ouat0_compressed,
    ouat1_compressed,
    ouat2_compressed,
    ouat3_compressed,
    ouat4_compressed,
    ouat5_compressed,
    ouat6_compressed,
    ouat7_compressed,
    ouat8_compressed,
    ouat9_compressed,
    ouat10_compressed,
    ouatl_compressed
};

const char *const ouatText[OUAT_SLIDE_COUNT] = {
    "Long ago, two races ruled over Earth: HUMANS and MONSTERS.",
    "One day, war broke out between the two races.",
    "After a long battle, the humans were victorious.",
    "They sealed the monsters underground with a magic spell.",
    "Many years later...",
    "MT. EBOTT 201X",
    "Legends say that those who climb the mountain never return.",
    "",
    "",
    "",
    "",
    ""
};

// Player Structure
typedef struct {
    int x;
    int y;
    int width;
    int height;
    int speed;
    int walkFrame;  // 0 = idle, 1 = move1, 2 = idle, 3 = move2
    int walkTimer;  // Unused placeholder in favor of time-based clock ticks
    int facing;     // 0 = down, 1 = up, 2 = left, 3 = right
    bool isMoving;
} player_t;

// Initialize player data
player_t player = {150, 100, 16, 24, 2, 0, 0, 0, false};


int shake(void) {
    return (rand() % 3) - 1;
}

int get_x(int c) {
    return 45 + (c * 36);
}

int get_y(int r) {
    if (r < 4) return 75 + (r * 16);
    if (r < 8) return 85 + (r * 16);
    return 220;
}

void fade_screen_to_white(uint8_t amount) {
    uint16_t *pal_ptr = (uint16_t*)global_palette;
    for (int i = 0; i < 256; i++) {
        uint16_t orig = pal_ptr[i];

        if (i == COLOR_WHITE) {
            orig = gfx_RGBTo1555(255, 255, 255);
        } else if (i == COLOR_YELLOW) {
            orig = gfx_RGBTo1555(255, 255, 0);
        }

        int r = (orig >> 10) & 31;
        int g = (orig >> 5) & 31;
        int b = orig & 31;

        r += ((31 - r) * amount) / 255;
        g += ((31 - g) * amount) / 255;
        b += ((31 - b) * amount) / 255;

        gfx_palette[i] = (r << 10) | (g << 5) | b;
    }
}

void fade_palette_from_black(uint8_t amount) {
    uint16_t *pal_ptr = (uint16_t*)global_palette;
    for (int i = 0; i < 256; i++) {
        uint16_t orig = pal_ptr[i];

        if (i == COLOR_WHITE) {
            orig = gfx_RGBTo1555(255, 255, 255);
        } else if (i == COLOR_YELLOW) {
            orig = gfx_RGBTo1555(255, 255, 0);
        }

        int r = (orig >> 10) & 31;
        int g = (orig >> 5) & 31;
        int b = orig & 31;

        r = (r * amount) / 255;
        g = (g * amount) / 255; 
        b = (b * amount) / 255;

        gfx_palette[i] = (r << 10) | (g << 5) | b;
    }
}

void check_easter_eggs(
    const char *current_name,
    int len,
    const char **out_msg,
    bool *out_blocked,
    bool *out_hardmode
) {
    char n[7];

    strncpy(n, current_name, len);
    n[len] = '\0';

    for (int i = 0; i < len; i++) {
        if (n[i] >= 'A' && n[i] <= 'Z') {
            n[i] += 32;
        }
    }

    *out_msg = NULL;
    *out_blocked = false;
    *out_hardmode = false;

    if (strcmp(n, "sans") == 0) {
        *out_msg = "nope.";
        *out_blocked = true;
    } else if (strcmp(n, "gerson") == 0) {
        *out_msg = "Wah ha ha! Why not?";
    } else if (strcmp(n, "papyru") == 0) {
        *out_msg = "I'LL ALLOW IT!!!!!!!!!!!!";
    } else if (strcmp(n, "chara") == 0) {
        *out_msg = "the true name";
    } else if (strcmp(n, "frisk") == 0) {
        *out_hardmode = true;
        *out_msg = "WARNING: This name will make your life hell. Proceed anyway?";
    } else if (strcmp(n, "jerry") == 0) {
        *out_msg = "Jerry.";
    } else if (strcmp(n, "toriel") == 0) {
        *out_msg = "why not choose your own name, my child";
        *out_blocked = true;
    } else if (strcmp(n, "mett") == 0 || strcmp(n, "metta") == 0 || strcmp(n, "mtt") == 0) {
        *out_msg = "OOH! Are you supporting my brand?";
    } else if (strcmp(n, "undyne") == 0) {
        *out_msg = "NO! Get your own name!";
        *out_blocked = true;
    } else if (strcmp(n, "alphys") == 0) {
        *out_msg = "D-Don't do that!";
        *out_blocked = true;
    } else if (strcmp(n, "asriel") == 0) {
        *out_msg = "...";
        *out_blocked = true;
    } else if (strcmp(n, "asgore") == 0) {
        *out_msg = "You cannot.";
        *out_blocked = true;
    } else if (strcmp(n, "flowey") == 0) {
        *out_msg = "I already CHOSE that name";
        *out_blocked = true;
    } else if (strcmp(n, "aaron") == 0) {
        *out_msg = "Is this name correct? ;)";
    } else if (strcmp(n, "alphy") == 0) {
        *out_msg = "Uh.... OK?";
    } else if (strcmp(n, "napsta") == 0 || strcmp(n, "blooky") == 0) {
        *out_msg = "............ (They are powerless to stop you.)";
    } else if (strcmp(n, "bratty") == 0) {
        *out_msg = "Like, OK, I guess";
    } else if (strcmp(n, "shyren") == 0) {
        *out_msg = "...?";
    } else if (strcmp(n, "woshua") == 0) {
        *out_msg = "Clean name.";
    } else if (strcmp(n, "temmie") == 0) {
        *out_msg = "hOI!";
    } else if (strcmp(n, "catty") == 0) {
        *out_msg = "Bratty! Bratty! That's MY name!";
    } else if (strcmp(n, "murder") == 0 || strcmp(n, "mercy") == 0) {
        *out_msg = "That's a little on-the-nose, isn't it...?";
    } else if (strcmp(n, "bpants") == 0) {
        *out_msg = "Super deep down the barrel.";
    } else if (strcmp(n, "aaaaaa") == 0) {
        *out_msg = "not very creative...?";
	} else if (strcmp(n, "deez") == 0) {
        *out_msg = "nuts";
    }
}

void free_ouat_scene(void) {
    if (ouatSprite != NULL) {
        free(ouatSprite);
        ouatSprite = NULL;
    }
    if (windowSprite != NULL) {
        free(windowSprite);
        windowSprite = NULL;
    }
}

bool load_ouat_scene(void) {
    gfx_ZeroScreen();
    gfx_BlitBuffer();

    free_ouat_scene();

    // Allocate a larger buffer for the final slide to support taller scrolling images
    if (ouatSlide == OUAT_SLIDE_COUNT - 1) {
        ouatSprite = gfx_MallocSprite(160, 255); 
    } else {
        ouatSprite = gfx_MallocSprite(160, 120);
    }

    if (ouatSprite == NULL) {
        return false;
    }

    zx7_Decompress(ouatSprite, ouatCompressed[ouatSlide]);

    ouatSlideStart = clock();

    return true;
}

void draw_typewriter_text_centered(const char *text, uint16_t visibleChars) {
    int y = 194;
    const char *ptr = text;
    uint16_t chars_left = visibleChars;

    while (*ptr != '\0' && chars_left > 0) {
        const char *line_start = ptr;
        const char *line_end = ptr;
        const char *last_space = NULL;
        int line_width = 0;

        // Scan ahead to find what fits on a 300px width limit line
        while (*ptr != '\0') {
            char temp_char[2] = {*ptr, '\0'};
            int char_width = gfx_GetStringWidth(temp_char);

            if (*ptr == '\n') {
                ptr++; // Skip newline for next line
                break;
            }

            if (*ptr == ' ') {
                last_space = ptr;
            }

            if (line_width + char_width > 300) {
                // Word wrap logic: backup to the last space to avoid split words
                if (last_space != NULL) {
                    ptr = last_space + 1;
                    line_end = last_space;
                } else {
                    line_end = ptr; // Force wrap if single word is too long
                }
                break;
            }

            line_width += char_width;
            line_end = ptr + 1;
            ptr++;
        }

        int num_chars_to_print = line_end - line_start;
        if (num_chars_to_print > chars_left) {
            num_chars_to_print = chars_left;
        }

        if (num_chars_to_print > 0) {
            char line_buffer[128];
            if (num_chars_to_print >= (int)sizeof(line_buffer)) {
                num_chars_to_print = sizeof(line_buffer) - 1;
            }
            strncpy(line_buffer, line_start, num_chars_to_print);
            line_buffer[num_chars_to_print] = '\0';

            int print_width = gfx_GetStringWidth(line_buffer);
            int x = (320 - print_width) / 2;

            gfx_SetTextFGColor(COLOR_WHITE);
            gfx_PrintStringXY(line_buffer, x, y);
        }

        chars_left -= num_chars_to_print;
        y += 10; // Move to next line height
    }
}

bool next_ouat_scene(void) {
    ouatSlide++;

    if (ouatSlide >= OUAT_SLIDE_COUNT) {
        free_ouat_scene();
        // Restore standard palette and configure the grey text index
        gfx_SetPalette(global_palette, sizeof_global_palette, 0);
        gfx_palette[COLOR_WHITE] = gfx_RGBTo1555(255, 255, 255);
        gfx_palette[COLOR_YELLOW] = gfx_RGBTo1555(255, 255, 0);
        gfx_palette[COLOR_GREY] = gfx_RGBTo1555(128, 128, 128);
        splashStart = clock();
        gameState = -3; // Move on to Undertale Splash Screen
        return true;
    }

    return load_ouat_scene();
}

// Draws the scroll frame with an upper bound limit to hide anything below it with a black box
void draw_ouat_frame(int unscaled_y, int max_height) {
    if (windowSprite == NULL) return;

    memset(windowSprite->data, 0, 160 * 120); // Fill window with black

    int src_y = 0;
    int dst_y = unscaled_y;
    int copy_height = ouatSprite->height;

    if (dst_y < 0) {
        src_y = -dst_y;
        copy_height -= src_y;
        dst_y = 0;
    }

    // Limit copy height so it never exceeds the black box boundary (max_height)
    if (dst_y + copy_height > max_height) {
        copy_height = max_height - dst_y;
    }

    if (copy_height > 0 && src_y < ouatSprite->height && dst_y < max_height) {
        uint8_t *src = ouatSprite->data + (src_y * ouatSprite->width);
        uint8_t *dst = windowSprite->data + (dst_y * 160);
        int copy_width = ouatSprite->width > 160 ? 160 : ouatSprite->width;

        for (int r = 0; r < copy_height; r++) {
            memcpy(dst, src, copy_width);
            src += ouatSprite->width;
            dst += 160;
        }
    }

    gfx_ScaledSprite_NoClip(windowSprite, 0, 0, 2, 2);
}

void draw_ouat_intro(void) {
    const char *text = ouatText[ouatSlide];
    clock_t elapsed = clock() - ouatSlideStart;
    uint16_t textLength = strlen(text);

    // Calculate total slide duration to timing and configure fade-in/fade-out
    clock_t total_duration;
    if (ouatSlide == OUAT_SLIDE_COUNT - 1) {
        total_duration = (4UL * CLOCKS_PER_SEC) + (7UL * CLOCKS_PER_SEC) + (2UL * CLOCKS_PER_SEC); // 13s total
    } else if (textLength == 0) {
        total_duration = OUAT_EMPTY_PAUSE;
    } else {
        total_duration = (textLength * OUAT_CHAR_TIME) + OUAT_TEXT_PAUSE;
    }

    clock_t fade_duration = CLOCKS_PER_SEC / 2; // 0.5 seconds
    uint8_t fade_amount = 255;

    if (elapsed < fade_duration) {
        // Fade in
        fade_amount = (uint8_t)(((uint32_t)elapsed * 255) / fade_duration);
    } else if (elapsed > total_duration - fade_duration) {
        // Fade out
        if (elapsed >= total_duration) {
            fade_amount = 0;
        } else {
            fade_amount = (uint8_t)(((uint32_t)(total_duration - elapsed) * 255) / fade_duration);
        }
    }

    // Apply the corrected 16-bit color faded palette safely
    fade_palette_from_black(fade_amount);

    // Custom scrolling logic for the final slide (ouatl)
    if (ouatSlide == OUAT_SLIDE_COUNT - 1) {
        if (windowSprite == NULL) {
            windowSprite = gfx_MallocSprite(160, 120);
        }

        // Pushed up around 1/5th: only the bottom 70 pixels of the image are visible initially.
        int start_y = 70 - (int)ouatSprite->height;
        int current_y = start_y;
        clock_t scroll_delay = 4UL * CLOCKS_PER_SEC;      // Wait 4 seconds
        clock_t scroll_duration = 7UL * CLOCKS_PER_SEC;   // Take exactly 7 seconds to scroll

        if (elapsed >= scroll_delay) {
            clock_t scroll_elapsed = elapsed - scroll_delay;
            if (scroll_elapsed > scroll_duration) {
                scroll_elapsed = scroll_duration;
            }

            // Smooth linear interpolation to hit 0 precisely at 7 seconds
            current_y = start_y + (int)(((long)(0 - start_y) * scroll_elapsed) / scroll_duration);

            if (current_y >= 0) {
                current_y = 0;

                // Once fully scrolled, wait 2 more seconds before proceeding to splash screen
                if (elapsed >= scroll_delay + scroll_duration + (2UL * CLOCKS_PER_SEC)) {
                    free_ouat_scene();
                    // Restore standard palette and configure the grey text index
                    gfx_SetPalette(global_palette, sizeof_global_palette, 0);
                    gfx_palette[COLOR_WHITE] = gfx_RGBTo1555(255, 255, 255);
                    gfx_palette[COLOR_YELLOW] = gfx_RGBTo1555(255, 255, 0);
                    gfx_palette[COLOR_GREY] = gfx_RGBTo1555(128, 128, 128);
                    splashStart = clock();
                    gameState = -3; // Move on to Undertale Splash Screen
                    return;
                }
            }
        }

        gfx_ZeroScreen();
        // Limit drawing height to 70 to keep everything below it covered by the black box mask
        ouat_current_y = current_y; // Keep current y position updated for safe frozen frame skips
        draw_ouat_frame(current_y, 70);
        return;
    }

    gfx_ZeroScreen();

    if (ouatSprite != NULL) {
        gfx_ScaledSprite_NoClip(ouatSprite, 0, 0, 2, 2);
    }

    if (textLength == 0) {
        if (elapsed >= OUAT_EMPTY_PAUSE) {
            next_ouat_scene();
        }
        return;
    }

    uint16_t shownChars = elapsed / OUAT_CHAR_TIME;

    if (shownChars > textLength) {
        shownChars = textLength;
    }

    // Centered, full word-wrapping text rendering
    draw_typewriter_text_centered(text, shownChars);

    if (elapsed >= total_duration) {
        next_ouat_scene();
    }
}

void draw_instruction_screen(int sel) {
    gfx_ZeroScreen();
    gfx_SetTextFGColor(COLOR_WHITE);

    const char *title = "---Instruction---";

    gfx_PrintStringXY(title, (320 - gfx_GetStringWidth(title)) / 2, 20);
    gfx_PrintStringXY("[2nd] - Confirm", 60, 60);
    gfx_PrintStringXY("[Alpha] - Cancel", 60, 80);
    gfx_PrintStringXY("[Math] - Menu (In-game)", 60, 100);
    gfx_PrintStringXY("[Hold Clear] - quit", 60, 120);
    gfx_PrintStringXY("When HP is 0, you lose.", 60, 150);

    gfx_SetTextFGColor(sel == 0 ? COLOR_YELLOW : COLOR_WHITE);
    gfx_PrintStringXY("Begin game", 124, 190);

    gfx_SetTextFGColor(sel == 1 ? COLOR_YELLOW : COLOR_WHITE);
    gfx_PrintStringXY("Settings", 128, 210);
}

void draw_keyboard_screen(void) {
    gfx_ZeroScreen();

    gfx_SetTextFGColor(COLOR_WHITE);
    gfx_PrintStringXY("Name the fallen human.", 80, 20);

    for (int i = 0; i < 6; i++) {
        char buf[2] = {name[i], '\0'};
        gfx_PrintStringXY(buf, 140 + (i * 8), 45);
    }

    for (int r = 0; r < ROWS; r++) {
        for (int c = 0; c < COLS; c++) {
            char ch = layout[r][c];

            if (ch == ' ') {
                continue;
            }

            gfx_SetTextFGColor(
                (r == cy && c == cx) ? COLOR_YELLOW : COLOR_WHITE
            );

            if (ch == '1') {
                gfx_PrintStringXY("Quit", get_x(c), get_y(r));
            } else if (ch == '2') {
                gfx_PrintStringXY("Backspace", get_x(c), get_y(r));
            } else if (ch == '3') {
                gfx_PrintStringXY("Done", get_x(c), get_y(r));
            } else {
                char str[2] = {ch, '\0'};

                gfx_PrintStringXY(
                    str,
                    get_x(c) + shake(),
                    get_y(r) + shake()
                );
            }
        }
    }
}

void draw_confirm_screen(int *timer, int selection, bool showYesNo) {
    const char *secret_msg;
    bool is_blocked;
    bool is_hardmode;

    gfx_ZeroScreen();
    gfx_SetTextFGColor(COLOR_WHITE);

    check_easter_eggs(
        name,
        nameLen,
        &secret_msg,
        &is_blocked,
        &is_hardmode
    );

    const char *prompt = secret_msg != NULL
        ? secret_msg
        : "Is This Name Correct?";

    // FIXED: Safely wrap/split warning texts wider than 300px to prevent off-screen crash
    int prompt_width = gfx_GetStringWidth(prompt);
    if (prompt_width > 300) {
        char buf[128];
        strncpy(buf, prompt, sizeof(buf) - 1);
        buf[sizeof(buf) - 1] = '\0';
        
        int len = strlen(buf);
        int mid = len / 2;
        int split_idx = -1;
        
        // Locate closest space character to split the string on
        for (int i = 0; i < mid; i++) {
            if (mid + i < len && buf[mid + i] == ' ') {
                split_idx = mid + i;
                break;
            }
            if (mid - i >= 0 && buf[mid - i] == ' ') {
                split_idx = mid - i;
                break;
            }
        }
        
        if (split_idx != -1) {
            buf[split_idx] = '\0';
            const char *line1 = buf;
            const char *line2 = buf + split_idx + 1;
            gfx_PrintStringXY(line1, (320 - gfx_GetStringWidth(line1)) / 2, 20);
            gfx_PrintStringXY(line2, (320 - gfx_GetStringWidth(line2)) / 2, 32);
        } else {
            gfx_PrintStringXY(prompt, 10, 30); // Unsplittable fallback
        }
    } else {
        gfx_PrintStringXY(prompt, (320 - prompt_width) / 2, 30);
    }

    int scale = 1 + (*timer / 15);

    if (scale > 3) {
        scale = 3;
    }

    gfx_SetTextScale(scale, scale);

    if (*timer < 30) {
        (*timer)++;
    }

    int startCenterX = 140 + (nameLen * 8) / 2;
    int startCenterY = 49;

    int centerX = startCenterX +
        ((160 - startCenterX) * *timer / 30);

    int centerY = startCenterY +
        ((92 - startCenterY) * *timer / 30);

    int spacing = 8 * scale;
    int firstX = centerX - ((nameLen * spacing) / 2);
    int letterY = centerY - (4 * scale);

    for (int i = 0; i < nameLen; i++) {
        char buf[2] = {name[i], '\0'};

        gfx_PrintStringXY(
            buf,
            firstX + (i * spacing) + shake(),
            letterY + shake()
        );
    }

    gfx_SetTextScale(1, 1);

    if (!showYesNo) {
        return;
    }

    if (is_blocked) {
        gfx_SetTextFGColor(COLOR_YELLOW);
        gfx_PrintStringXY("Go back", 132, 180);
    } else {
        gfx_SetTextFGColor(
            selection == 0 ? COLOR_YELLOW : COLOR_WHITE
        );
        gfx_PrintStringXY("No", 100, 180);

        gfx_SetTextFGColor(
            selection == 1 ? COLOR_YELLOW : COLOR_WHITE
        );
        gfx_PrintStringXY("Yes", 200, 180);
    }
}

int main(void) {
    gfx_Begin();
    gfx_SetDrawBuffer();

    gfx_SetPalette(global_palette, sizeof_global_palette, 0);
    gfx_SetTransparentColor(0);

    gfx_palette[COLOR_WHITE] = gfx_RGBTo1555(255, 255, 255);
    gfx_palette[COLOR_YELLOW] = gfx_RGBTo1555(255, 255, 0);
    gfx_palette[COLOR_GREY] = gfx_RGBTo1555(128, 128, 128);

    if (!load_ouat_scene()) {
        gfx_End();
        return 1;
    }

    while (1) {
        kb_Scan();

        clock_t now = clock();

        if (kb_Data[6] & kb_Clear) {
            if (!clearHeld) {
                clearHeld = true;
                clearStart = now;
            }

            if (now - clearStart >= QUIT_HOLD_TIME) {
                break;
            }
        } else {
            clearHeld = false;
        }

        uint8_t kb = os_GetCSC();

        if (gameState == -4) {
            // Render the normal slide if we aren't currently fading out a skip
            if (!isSkipping) {
                draw_ouat_intro();

                // Handle synced skip triggers for both [2nd] and [Enter] keys
                if (kb == sk_2nd || kb == sk_Enter) {
                    isSkipping = true;
                    skipStart = now;

                    // Calculate and lock the exact number of characters shown on screen at this instant
                    clock_t slide_elapsed = now - ouatSlideStart;
                    uint16_t textLength = strlen(ouatText[ouatSlide]);
                    uint16_t current_shown = slide_elapsed / OUAT_CHAR_TIME;
                    if (current_shown > textLength) {
                        current_shown = textLength;
                    }
                    ouat_frozen_chars = current_shown;
                }
            } else {
                // Execute a clean, non-glitchy static frame fade-out to black
                clock_t skip_elapsed = now - skipStart;
                clock_t skip_fade_duration = CLOCKS_PER_SEC / 2;
                
                if (skip_elapsed >= skip_fade_duration) {
                    isSkipping = false;
                    free_ouat_scene();
                    
                    // Reset normal colors before entering state -3
                    gfx_SetPalette(global_palette, sizeof_global_palette, 0);
                    gfx_palette[COLOR_WHITE] = gfx_RGBTo1555(255, 255, 255);
                    gfx_palette[COLOR_YELLOW] = gfx_RGBTo1555(255, 255, 0);
                    gfx_palette[COLOR_GREY] = gfx_RGBTo1555(128, 128, 128);
                    
                    splashStart = clock();
                    gameState = -3;
                } else {
                    // Update and apply the palette fade factor
                    uint8_t current_fade = (uint8_t)(((skip_fade_duration - skip_elapsed) * 255) / skip_fade_duration);
                    fade_palette_from_black(current_fade);
                    
                    gfx_ZeroScreen();
                    
                    // Draw frozen frame representations statically (timerless)
                    if (ouatSlide == OUAT_SLIDE_COUNT - 1) {
                        draw_ouat_frame(ouat_current_y, 70);
                    } else {
                        if (ouatSprite != NULL) {
                            gfx_ScaledSprite_NoClip(ouatSprite, 0, 0, 2, 2);
                        }
                        const char *text = ouatText[ouatSlide];
                        // Render exactly the captured static character count instead of full string length
                        draw_typewriter_text_centered(text, ouat_frozen_chars);
                    }
                }
            }
        } else if (gameState == -3) {
            // --- UNDERTALE SPLASH SCREEN (5 seconds) ---
            clock_t elapsed = now - splashStart;
            
            gfx_ZeroScreen();
            
            // Displays 'undertale' sprite scaled 2x and centered on screen
            int sy = 0;
            if (undertale != NULL) {
                int sx = (320 - (undertale->width * 2)) / 2;
                sy = (240 - (undertale->height * 2)) / 2;
                gfx_ScaledSprite_NoClip(undertale, sx, sy, 2, 2);
            }

            // After 3 seconds, show "PRESS Z OR ENTER" below the logo
            if (elapsed >= 3UL * CLOCKS_PER_SEC) {
                const char *prompt_text = "PRESS Z OR ENTER";
                int text_x = (320 - gfx_GetStringWidth(prompt_text)) / 2;
                int text_y = sy + (undertale->height * 2) + 15;
                
                // Keep text in bounds if scaling forces it too low
                if (text_y > 225) {
                    text_y = 225;
                }

                gfx_SetTextFGColor(COLOR_GREY);
                gfx_PrintStringXY(prompt_text, text_x, text_y);
            }

            // Move on to the instruction screen after 5 seconds, or on a keypress
            if (elapsed >= 5UL * CLOCKS_PER_SEC || kb == sk_2nd || kb == sk_Enter) {
                gameState = -1;
            }
        } else if (gameState == -1) {
            draw_instruction_screen(menuSel);

            if (kb == sk_Up || kb == sk_Down) {
                menuSel = 1 - menuSel;
            }

            if (kb == sk_2nd || kb == sk_Enter) {
                gameState = menuSel == 0 ? 0 : -2;
            }
        } else if (gameState == -2) {
            gfx_ZeroScreen();
            gfx_SetTextFGColor(COLOR_WHITE);
            gfx_PrintStringXY("Settings Menu (WIP)", 100, 110);

            if (kb == sk_Alpha) {
                gameState = -1;
            }
        } else if (gameState == 0) {
            if (kb == sk_Right) {
                do {
                    cx = (cx + 1) % COLS;
                } while (layout[cy][cx] == ' ');
            }

            if (kb == sk_Left) {
                do {
                    cx--;

                    if (cx < 0) {
                        cx = COLS - 1;
                    }
                } while (layout[cy][cx] == ' ');
            }

            // Cleaned transition logic to avoid skipping row 7 (vwxyz)
            if (kb == sk_Down && cy < 8) {
                if (cy == 7) {
                    cy = 8;
                    if (cx <= 1) cx = 0;
                    else if (cx <= 4) cx = 2;
                    else cx = 5;
                } else {
                    cy++;
                }
            }

            if (kb == sk_Up && cy > 0) {
                if (cy == 8) {
                    if (cx == 0) {
                        cy = 7;
                        cx = 0;
                    } else if (cx == 2) {
                        cy = 7;
                        cx = 3;
                    } else {
                        cy = 6;
                        cx = 5;
                    }
                } else {
                    cy--;
                }
            }

            if (kb == sk_2nd || kb == sk_Enter) {
                char selected = layout[cy][cx];

                if (selected == '1') {
                    break;
                } else if (selected == '2') {
                    if (nameLen > 0) {
                        name[--nameLen] = ' ';
                    }
                } else if (selected == '3') {
                    if (nameLen > 0) {
                        gameState = 1;
                        zoomTimer = 0;
                        confirmSel = 1;
                    }
                } else if (nameLen < 6) {
                    name[nameLen++] = selected;

                    // FIXED: Gaster easter egg fully resets gamestate back to OUAT screen (gameState = -4)
                    if (nameLen == 6 &&
                        strncasecmp(name, "gaster", 6) == 0) {
                        gfx_ZeroScreen();
                        gfx_BlitBuffer();

                        for (int i = 0; i < 30; i++) {
                            gfx_BlitBuffer();
                        }

                        nameLen = 0;
                        memset(name, ' ', 6);
                        ouatSlide = 0;      // Reset cinematic slider index
                        load_ouat_scene();  // Reload first slide assets and timers
                        gameState = -4;     // Reset game state to start of intro
                    }
                }
            }

            if ((kb == sk_Alpha || kb == sk_Del) && nameLen > 0) {
                name[--nameLen] = ' ';
            }

            draw_keyboard_screen();
        } else if (gameState == 1) {
            draw_confirm_screen(&zoomTimer, confirmSel, false);

            if (zoomTimer >= 30) {
                gameState = 2;
            }
        } else if (gameState == 2) {
            const char *s;
            bool blocked;
            bool hard;

            check_easter_eggs(name, nameLen, &s, &blocked, &hard);
            draw_confirm_screen(&zoomTimer, confirmSel, true);

            if (blocked) {
                confirmSel = 0;

                if (kb == sk_2nd ||
                    kb == sk_Enter ||
                    kb == sk_Alpha) {
                    gameState = 0;
                }
            } else {
                if (kb == sk_Left || kb == sk_Right) {
                    confirmSel = 1 - confirmSel;
                }

                if (kb == sk_2nd || kb == sk_Enter) {
                    if (confirmSel == 1) {
                        gameState = 3;
                        hardMode = hard;
                        fadeStart = clock();
                    } else {
                        gameState = 0;
                    }
                }

                if (kb == sk_Alpha) {
                    gameState = 0;
                }
            }
        } else if (gameState == 3) {
            clock_t elapsed = clock() - fadeStart;
            uint8_t fadeAmount;

            draw_confirm_screen(&zoomTimer, confirmSel, true);

            if (elapsed >= NAME_FADE_TIME) {
                fadeAmount = 255;
            } else {
                fadeAmount = (uint8_t)(
                    ((uint32_t)elapsed * 255) / NAME_FADE_TIME
                );
            }

            fade_screen_to_white(fadeAmount);

            if (elapsed >= NAME_FADE_TIME) {
                restorePalette = true;
                gameState = 4;
            }
        } else if (gameState == 4) {
            if (restorePalette) {
                gfx_SetPalette(global_palette, sizeof_global_palette, 0);
                gfx_palette[COLOR_WHITE] = gfx_RGBTo1555(255, 255, 255);
                gfx_palette[COLOR_YELLOW] = gfx_RGBTo1555(255, 255, 0);
                gfx_palette[COLOR_GREY] = gfx_RGBTo1555(128, 128, 128);
                gfx_SetTransparentColor(0);

                restorePalette = false;
            }

            // --- MOVEMENT LOGIC ---
            player.isMoving = false;
            int dx = 0;
            int dy = 0;

            if (kb_Data[7] & kb_Down) {
                dy = player.speed;
                player.facing = 0; // Down
                player.isMoving = true;
            } else if (kb_Data[7] & kb_Up) {
                dy = -player.speed;
                player.facing = 1; // Up
                player.isMoving = true;
            }

            if (kb_Data[7] & kb_Left) {
                dx = -player.speed;
                player.isMoving = true;
                // Only change facing to Left if not moving vertically
                if (dy == 0) player.facing = 2; 
            } else if (kb_Data[7] & kb_Right) {
                dx = player.speed;
                player.isMoving = true;
                // Only change facing to Right if not moving vertically
                if (dy == 0) player.facing = 3;
            }

            // Apply movement
            player.x += dx;
            player.y += dy;

            // Keep player inside the screen bounds
            if (player.x < 0) player.x = 0;
            if (player.x > (320 - player.width)) player.x = 320 - player.width;
            if (player.y < 0) player.y = 0;
            if (player.y > (240 - player.height)) player.y = 240 - player.height;

            // --- TIME-BASED ANIMATION LOGIC ---
            static clock_t last_anim_time = 0;

            if (player.isMoving) {
                // Change frames exactly every 1/4 of a second (faster walk cycle speed)
                if (now - last_anim_time >= CLOCKS_PER_SEC / 4) { 
                    player.walkFrame = (player.walkFrame + 1) % 4;
                    last_anim_time = now;
                }
            } else {
                player.walkFrame = 0;
                last_anim_time = now; // Instantly start animation on keypress
            }

            // --- DRAW SPRITE WITH ACCURATE VERTICAL OFFSET ---
            gfx_sprite_t *playerSprite = friskidledown; // Default fallback
            int draw_y = player.y;

            if (player.facing == 0) { // Facing Down
                if (!player.isMoving || player.walkFrame == 0 || player.walkFrame == 2) {
                    playerSprite = friskidledown;
                } else if (player.walkFrame == 1) {
                    playerSprite = friskdownmove1;
                    draw_y -= 1; // Shifted 1 pixel up from baseline
                } else if (player.walkFrame == 3) {
                    playerSprite = friskdownmove2;
                    draw_y -= 1; // Shifted 1 pixel up from baseline
                }
            } else if (player.facing == 1) { // Facing Up
                if (!player.isMoving || player.walkFrame == 0 || player.walkFrame == 2) {
                    playerSprite = friskidleup;
                } else if (player.walkFrame == 1) {
                    playerSprite = friskupmove1;
                    draw_y -= 1; // Shifted 1 pixel up from baseline
                } else if (player.walkFrame == 3) {
                    playerSprite = friskupmove2;
                    draw_y -= 1; // Shifted 1 pixel up from baseline
                }
            } else if (player.facing == 2) { // Facing Left
                if (!player.isMoving || player.walkFrame == 0 || player.walkFrame == 2) {
                    playerSprite = friskidleleft;
                } else if (player.walkFrame == 1) {
                    playerSprite = friskleftmove1;
                } else if (player.walkFrame == 3) {
                    playerSprite = friskleftmove2;
                }
            } else if (player.facing == 3) { // Facing Right
                if (!player.isMoving || player.walkFrame == 0 || player.walkFrame == 2) {
                    playerSprite = friskidleright;
                } else if (player.walkFrame == 1) {
                    playerSprite = friskrightmove1;
                    draw_y -= 2; // Compensate for raw art being low (makes active frame exactly 1px up from idle)
                } else if (player.walkFrame == 3) {
                    playerSprite = friskrightmove2;
                    // No shift needed (raw art is already naturally 1px higher than idle)
                }
            }

            gfx_ZeroScreen();
            
            gfx_TransparentSprite(playerSprite, player.x, draw_y);

            if (hardMode) {
                gfx_SetTextFGColor(COLOR_WHITE);
                gfx_PrintStringXY("Hard Mode Activated!", 80, 50);
            }
        }

        if (clearHeld) {
            clock_t elapsed = clock() - clearStart;
            uint8_t bgIndex = gfx_GetPixel(10, 10);
            uint16_t bgColor = gfx_palette[bgIndex];

            int br = (bgColor >> 10) & 31;
            int bg = (bgColor >> 5) & 31;
            int bb = bgColor & 31;

            int target = (br + bg + bb) < 46 ? 31 : 0;
            uint8_t fadeAmount;

            if (elapsed >= QUIT_FADE_TIME) {
                fadeAmount = 255;
            } else {
                fadeAmount = (uint8_t)(
                    ((uint32_t)elapsed * 255) / QUIT_FADE_TIME
                );
            }

            int cr = br + ((target - br) * fadeAmount) / 255;
            int cg = bg + ((target - bg) * fadeAmount) / 255; 
            int cb = bb + ((target - bb) * fadeAmount) / 255;

            gfx_palette[COLOR_QUIT_TEXT] =
                gfx_RGBTo1555(cr << 3, cg << 3, cb << 3);

            gfx_SetTextFGColor(COLOR_QUIT_TEXT);

            if (elapsed < CLOCKS_PER_SEC / 2) {
                gfx_PrintStringXY("Quitting", 10, 10);
            } else if (elapsed < CLOCKS_PER_SEC) {
                gfx_PrintStringXY("Quitting.", 10, 10);
            } else if (elapsed < (CLOCKS_PER_SEC * 3) / 2) {
                gfx_PrintStringXY("Quitting..", 10, 10);
            } else {
                gfx_PrintStringXY("Quitting...", 10, 10);
            }
        }

        gfx_BlitBuffer();
    }

    free_ouat_scene();
    gfx_End();

    return 0;
}