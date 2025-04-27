/* 
 * File:   oledDisplay_API_library.c
 * Author: tysen
 *
 * Created on April 15, 2025, 9:57 PM
 */

#include "xc.h"
#include "asmLib_v001.h"
#include "oledDisplay_API_library.h"


/*
 * NOTE:
 * Currently this library is configured for the lcd display
 * for testing purposes before we can receive and implement
 * functionality for the OLED display which will be used
*/


void delay(int delay_in_ms) {
    for (int i = 0; i < delay_in_ms; i++) {
        wait_1ms();
    }
}


void lcd_reset(void) {
    delay(1);
    LATBbits.LATB6 = 0; //set RB6 low, reset display
    delay(1);
    LATBbits.LATB6 = 1; //set RB6 high, !reset pin is high
    delay(1);
}

void lcd_cmd(char command) {

    _MI2C1IF = 0; //reset I2C flag
    
    LATBbits.LATB5 = 1; //set RB5 high, heartbeat led on
    
    I2C1CONbits.SEN = 1; //send start command
    while (I2C1CONbits.SEN == 1); //wait for start to finish
    
    _MI2C1IF = 0;
    I2C1TRN = 0b01111000; //transmit slave address and R/nW
    while (_MI2C1IF == 0); //wait for ACK
    
    _MI2C1IF = 0;
    I2C1TRN = 0b00000000; //transmit control byte
    while (_MI2C1IF == 0); //wait for ACK
    
    _MI2C1IF = 0;
    I2C1TRN = command; //transmit command byte
    while (_MI2C1IF == 0); //wait for ACK
    
    I2C1CONbits.PEN = 1; //send stop command
    while (I2C1CONbits.PEN == 1); //wait for stop to finish
    
    LATBbits.LATB5 = 0; //set RB5 low, heartbeat led off
    
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
}

// Configure display for double height text
void display_setup() {
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

void lcd_setup(void){
    
    I2C1CON = 0;
    
    I2C1CONbits.I2CEN = 0;
    _MI2C1IF = 0;
    I2C1BRG = 157; //set BRG = Fcy/Fscl-Fcy/10,000,000-1 = (16MHz/100kHz-16MHz/10,000,000)-1 = 158.4
    I2C1CONbits.I2CEN = 1;
    
    TRISB |= 0x0003; //set port B inputs
    TRISB &= 0xfc9f; //set port B outputs
    
    lcd_init(0xA);
    display_setup();
}

void lcd_setCursor(char x, char y) {
    
    /*DB7 is high to indicate a set cursor command. Address is calculated and ORed*/
    lcd_cmd( 0x80 | (0x20*y+x) );
}

void lcd_printChar(char myChar) {

    _MI2C1IF = 0;
    
    LATBbits.LATB5 = 1; //set RB5 high, heartbeat led on
    
    I2C1CONbits.SEN = 1; //send start command
    while (I2C1CONbits.SEN == 1); //wait for start to finish
    
    _MI2C1IF = 0;
    I2C1TRN = 0b01111000; //transmit slave address and R/nW
    while (_MI2C1IF == 0); //wait for ACK
    
    _MI2C1IF = 0;
    I2C1TRN = 0b01000000; //transmit control byte
    while (_MI2C1IF == 0); //wait for ACK
    
    _MI2C1IF = 0;
    I2C1TRN = myChar; //transmit write byte
    while (_MI2C1IF == 0); //wait for ACK
    
    I2C1CONbits.PEN = 1; //send stop command
    while (I2C1CONbits.PEN == 1); //wait for stop to finish
    
    LATBbits.LATB5 = 0; //set RB5 low, heartbeat led off
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
