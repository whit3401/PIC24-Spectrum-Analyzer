/* 
 * File:   oledDisplay_API_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:57 PM
 */

#ifndef I2C_LIBRARY_H
#define	I2C_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif

void lcd_setup(void);
void delay(int delay_in_ms);
void lcd_reset(void);
void lcd_cmd(char command);
void lcd_init(int LCDcontrast);
void display_setup();
void lcd_setCursor(char x, char y);
void lcd_printChar(char myChar);
void lcd_scroll();
void lcd_printStr(const char *str);
void lcd_clear();


#ifdef	__cplusplus
}
#endif

#endif	/* I2C_LIBRARY_H */

