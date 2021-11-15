#ifndef ESCAPE_H
#define ESCAPE_H 1

#include <stdio.h>

#define ESC_CSI     "\e["
#define ESC_SS2     "\eN"
#define ESC_SS3     "\eO"
#define ESC_SCI     "\eZ"
#define ESC_ROI     "\e%"

#define ESC_SAVE    ESC_CSI "s"
#define ESC_RESTORE ESC_CSI "u"
#define ESC_HOME    ESC_CSI "H"
#define ESC_CLRSCR  ESC_CSI "1J"
#define ESC_CLEAR   ESC_CSI "2K"
#define ESC_UP      ESC_CSI "A"
#define ESC_DOWN    ESC_CSI "B"
#define ESC_FRWD    ESC_CSI "C"
#define ESC_BKWD    ESC_CSI "D"
#define ESC_END     ESC_CSI "F"
#define ESC_INSERT  ESC_CSI "2~"
#define ESC_DELETE  ESC_CSI "3~"
#define ESC_PGUP    ESC_CSI "5~"
#define ESC_PGDOWN  ESC_CSI "6~"

// F1 to F4 are special
#define ESC_F1      ESC_SS3 "P"
#define ESC_F2      ESC_SS3 "Q"
#define ESC_F3      ESC_SS3 "R"
#define ESC_F4      ESC_SS3 "S"
#define ESC_S_F1    ESC_CSI "1;2P"
#define ESC_S_F2    ESC_CSI "1;2Q"
#define ESC_S_F3    ESC_CSI "1;2R"
#define ESC_S_F4    ESC_CSI "1;2S"
#define ESC_C_F1    ESC_CSI "1;5P"
#define ESC_C_F2    ESC_CSI "1;5Q"
#define ESC_C_F3    ESC_CSI "1;5R"
#define ESC_C_F4    ESC_CSI "1;5S"

#define ESC_F5      ESC_CSI "15~"
#define ESC_F6      ESC_CSI "17~"
#define ESC_F7      ESC_CSI "18~"
#define ESC_F8      ESC_CSI "19~"
#define ESC_F9      ESC_CSI "20~"
#define ESC_F10     ESC_CSI "21~"
#define ESC_F11     ESC_CSI "23~"
#define ESC_F12     ESC_CSI "24~"

#define ESC_S_F5    ESC_CSI "15;2~"
#define ESC_S_F6    ESC_CSI "17;2~"
#define ESC_S_F7    ESC_CSI "18;2~"
#define ESC_S_F8    ESC_CSI "19;2~"
#define ESC_S_F9    ESC_CSI "20;2~"
#define ESC_S_F10   ESC_CSI "21;2~"
#define ESC_S_F11   ESC_CSI "23;2~"
#define ESC_S_F12   ESC_CSI "24;2~"

#define ESC_C_F5    ESC_CSI "15;5~"
#define ESC_C_F6    ESC_CSI "17;5~"
#define ESC_C_F7    ESC_CSI "18;5~"
#define ESC_C_F8    ESC_CSI "19;5~"
#define ESC_C_F9    ESC_CSI "20;5~"
#define ESC_C_F10   ESC_CSI "21;5~"
#define ESC_C_F11   ESC_CSI "23;5~"
#define ESC_C_F12   ESC_CSI "24;5~"

#define ESC_HIDE    ESC_CSI "?25l"
#define ESC_SHOW    ESC_CSI "?25h"

#define ESC_NORMAL  ESC_CSI "0m"
#define ESC_BOLD    ESC_CSI "1m"
#define ESC_UNDERL  ESC_CSI "4m"
#define ESC_BLINK   ESC_CSI "5m"
#define ESC_INVERS  ESC_CSI "7m"
#define ESC_FRAMED  ESC_CSI "51m"
#define ESC_CIRCLED ESC_CSI "52m"
#define ESC_OVERL   ESC_CSI "53m"

#define ESC_TBLACK  ESC_CSI "30m"
#define ESC_TRED    ESC_CSI "38;2;255;0;0m"
#define ESC_TGREEN  ESC_CSI "38;2;0;255;0m"
#define ESC_TYELLOW ESC_CSI "38;2;255;255;0m"
#define ESC_TBLUE   ESC_CSI "38;2;0;0;255m"
#define ESC_TMAGENTA ESC_CSI "38;2;255;0;255m"
#define ESC_TCYAN   ESC_CSI "38;2;0;255;255m"
#define ESC_TWHITE  ESC_CSI "37m"

#define ESC_BBLACK  ESC_CSI "40m"
#define ESC_BRED    ESC_CSI "48;2;255;0;0m"
#define ESC_BGREEN  ESC_CSI "48;2;0;255;0m"
#define ESC_BYELLOW ESC_CSI "48;2;255;255;0m"
#define ESC_BBLUE   ESC_CSI "48;2;0;0;255m"
#define ESC_BMAGENTA ESC_CSI "48;2;255;0;255m"
#define ESC_BCYAN   ESC_CSI "48;2;0;255;255m"
#define ESC_BWHITE  ESC_CSI "47m"

#define ESC_BLIGHTGREY ESC_CSI "48;2;220;220;220m"
#define ESC_BGREY      ESC_CSI "48;2;128;128;128m"


enum { esc_top = 1, esc_bottom = 2, esc_left = 4, esc_right = 8, };

#define ESC_BORDER                                      \
((char const*const[]){                                  \
[0] = " ",                                              \
  [esc_top] = "━",                                      \
  [esc_bottom] = "━",                                   \
  [esc_bottom | esc_top] = "━",                         \
  [esc_left] = "┃",                                     \
  [esc_left | esc_top] = "┏",                           \
  [esc_left | esc_bottom] = "┗",                        \
  [esc_left | esc_bottom | esc_top] = "┣",              \
  [esc_right] = "┃",                                    \
  [esc_right | esc_top] = "┓",                          \
  [esc_right | esc_bottom] = "┛",                       \
  [esc_right | esc_bottom | esc_top] = "┫",             \
  [esc_right | esc_left] = "┃",                         \
  [esc_right | esc_left | esc_top] = "┳",               \
  [esc_right | esc_left | esc_bottom] = "┻",            \
  [esc_right | esc_left | esc_bottom | esc_top] = "╋",  \
  })

enum { esc_nw = 1, esc_ne = 2, esc_sw = 4, esc_se = 8, };

#define ESC_BLOCK                               \
((char const*const[]){                          \
[0] = " ",                                      \
  [esc_nw] = "▘",                               \
  [esc_ne] = "▝",                               \
  [esc_ne | esc_nw] = "▀",                      \
  [esc_sw] = "▖",                               \
  [esc_sw | esc_nw] = "▌",                      \
  [esc_sw | esc_ne] = "▞",                      \
  [esc_sw | esc_ne | esc_nw] = "▛",             \
  [esc_se] = "▗",                               \
  [esc_se | esc_nw] = "▚",                      \
  [esc_se | esc_ne] = "▐",                      \
  [esc_se | esc_ne | esc_nw] = "▜",             \
  [esc_se | esc_sw] = "▄",                      \
  [esc_se | esc_sw | esc_nw] = "▙",             \
  [esc_se | esc_sw | esc_ne] = "▟",             \
  [esc_se | esc_sw | esc_ne | esc_nw] = "█",    \
  })

/**
 ** @brief relative cursor movement
 **/
void esc_move(FILE* f, int vert, int hori);

/**
 ** @brief asolute cursor movement
 **/
void esc_goto(FILE* f, unsigned vert, unsigned hori);

#endif
