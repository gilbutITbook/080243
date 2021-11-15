#ifndef TERMIN_H
#define TERMIN_H 1

#include <limits.h>
#include <stddef.h>
#include "esc.h"

/**
 ** @brief Set a terminal on stdin to raw mode.
 **
 ** This uses termios.h underneath, so it probably only works on POSIX
 ** systems.
 **
 ** The terminal is automatically reset to its original state on @c
 ** exit or @c quick_exit by means of ::termin_reset.
 **/
void termin_unbuffered(void);

/**
 ** @brief Reset the terminal to its original state.
 **/
void termin_reset(void);

/**
 ** @brief The translation table for escape sequences.
 **
 ** An application that wants to use this module has to provide this
 ** symbol.
 **
 ** @see ::termin_translate
 **/
extern char const*const termin_trans[UCHAR_MAX+1];

/**
 ** @brief Translate and escape sequence to a simple character.
 **
 ** This supposes that you assign a simple character for each escape
 ** sequence that you want to translate.
 **
 ** If an exact match for an escape sequence is fount in
 ** ::termin_trans, its position in the table is the translation.
 **
 ** @see ::termin_trans
 **/
char termin_translate(char const* command);

/**
 ** @brief Read an escape sequence into @a command.
 **
 ** This reads from @c stdin and supposes that the escape character is
 ** already stored in @c command[0].
 **/
char const* termin_read_esc(size_t len, char command[len]);

#endif
