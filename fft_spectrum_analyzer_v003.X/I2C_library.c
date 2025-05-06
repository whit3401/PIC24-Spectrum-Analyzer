/* 
 * File:   I2C_library.c
 * Author: tysen
 *
 * Created on April 15, 2025, 9:57 PM
 */

#include "xc.h"
#include "asmLib_v001.h"
#include "I2C_library.h"


void delay_ms(int delay_in_ms) {
    for (int i = 0; i < delay_in_ms; i++) {
        wait_1ms();
    }
}

void i2c_setup(void){
    
    I2C1CON = 0;
    
    I2C1CONbits.I2CEN = 0;
    _MI2C1IF = 0;
    I2C1BRG = 157; //set BRG = Fcy/Fscl-Fcy/10,000,000-1 = (16MHz/100kHz-16MHz/10,000,000)-1 = 158.4
    I2C1CONbits.I2CEN = 1;
    
    TRISB |= 0x0003; //set port B inputs
    TRISB &= 0xfc9f; //set port B outputs
    
}

void i2c_start(){
  _MI2C1IF = 0; //reset I2C flag
    
  LATBbits.LATB5 = 1; //set RB5 high, heartbeat led on
    
  I2C1CONbits.SEN = 1; //send start command
  while (I2C1CONbits.SEN == 1); //wait for start to finish
}

void i2c_send(char message){
  _MI2C1IF = 0;
  I2C1TRN = message; //transmit message
  while (_MI2C1IF == 0); //wait for ACK
}

void i2c_stop(){
  I2C1CONbits.PEN = 1; //send stop command
  while (I2C1CONbits.PEN == 1); //wait for stop to finish
    
  LATBbits.LATB5 = 0; //set RB5 low, heartbeat led off
}