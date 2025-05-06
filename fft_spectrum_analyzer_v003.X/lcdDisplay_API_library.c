/* 
 * File:   lcdDisplay_API_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:57 PM
 */

#include "xc.h"
#include "I2C_library.h"
#include "lcdDisplay_API_library.h"

void lcd_reset(void) {
    delay_ms(1);
    LATBbits.LATB6 = 0; //set RB6 low, reset display
    delay_ms(1);
    LATBbits.LATB6 = 1; //set RB6 high, !reset pin is high
    delay_ms(1);
}

void lcd_cmd(char command) {

    i2c_start();
    
    i2c_send(0x3C << 1); //transmit slave address and R/nW
    i2c_send(0x00); //transmit control byte
    i2c_send(command); //transmit command byte
    
    i2c_stop();
    
}

void lcd_init(int LCDcontrast) {
    lcd_reset();
    
    lcd_cmd(0x3A); //8 bit bus, RE=1, REV=0
    lcd_cmd(0x09); //4 line display
    lcd_cmd(0x06); //display from bottom view
    lcd_cmd(0x1E); //BS1 = 1
    lcd_cmd(0x39); // 8 bit bus, RE=0, IS=1
    lcd_cmd(0x1B); // BS0 = 1, Bias = 1/6
    lcd_cmd(0x6E); // set divider on and set internal resistor ratio
    lcd_cmd(0x56); //booster on and set adjustable contrast
    lcd_cmd(0x70 | LCDcontrast); //set contrast from parameter
    lcd_cmd(0x38); //8 bit bus, RE=0, IS=0
    lcd_cmd(0x0C); //display on, cursor off, blink off
    
    lcd_display_setup();
}

// Configure display for double height text
void lcd_display_setup() {
    /* Function set (RE=1 version) */
    lcd_cmd(0x3a); /* DL, N, ~BE, enter extended mode RE=1, ~REV */ 
    /* Extended function set (assumes RE=1) */
    lcd_cmd(0x09); /* NW, ~FW, ~B/W */
    /* Double-height/bias/dot-shift (assumes RE=1) */
    lcd_cmd(0x1a); /* UD2, ~UD1, BS1, ~DH? */
    /* Function set (RE=0 version, IS=0) */
    lcd_cmd(0x3c); /* DL, N, DH, return to RE=0, ~IS */

    lcd_cmd(0x01); //clear display
}

void lcd_setCursor(char x, char y) {
    
    /*DB7 is high to indicate a set cursor command. Address is calculated and ORed*/
    lcd_cmd( 0x80 | (0x20*y+x) );
}

void lcd_printChar(char myChar) {

    i2c_start();
    
    i2c_send(0x3C << 1); //transmit slave address and R/nW
    i2c_send(0b01000000); //transmit control byte
    i2c_send(myChar); //transmit write byte
    
    i2c_stop();
}

void lcd_scroll(){
    lcd_cmd(0x18); //scroll display left
}
    
void lcd_printStr(const char *str) {
    for (int i = 0; str[i] != 0;) {
        lcd_printChar(str[i++]);
    }
    
}

void lcd_clear(){
    lcd_cmd(0x01); //clear display
}
