/* 
 * File:   lcdDisplay_API_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:57 PM
 */

#ifndef LCDDISPLAY_API_LIBRARY_H
#define	LCDDISPLAY_API_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif

void lcd_reset(void);
void lcd_cmd(char command);
void lcd_init(int LCDcontrast);
void lcd_display_setup();
void lcd_setCursor(char x, char y);
void lcd_printChar(char myChar);
void lcd_scroll();
void lcd_printStr(const char *str);
void lcd_clear();


#ifdef	__cplusplus
}
#endif

#endif	/* LCDDISPLAY_API_LIBRARY_H */

