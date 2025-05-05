/* 
 * File:   I2C_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:57 PM
 */

#ifndef I2C_LIBRARY_H
#define	I2C_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif

void delay_ms(int delay_in_ms);
void lcd_reset(void);
void lcd_cmd(char command);
void lcd_init(int LCDcontrast);
void lcd_display_setup();
void lcd_setCursor(char x, char y);
void lcd_printChar(char myChar);
void lcd_scroll();
void lcd_printStr(const char *str);
void lcd_clear();

void i2c_setup();

void I2C_Start();
void I2C_Send(uint8_t message);
void I2C_Stop();

#ifdef	__cplusplus
}
#endif

#endif	/* I2C_LIBRARY_H */

