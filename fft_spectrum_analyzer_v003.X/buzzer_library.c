/* 
 * File:   buzzer_library.c
 * Author: alyannamack
 *
 * Created on April 25, 2025, 5:28 PM
 */

#include "xc.h"
#include "asmLib_v001.h"
#include "buzzer_library.h"

#define BUZZER_PIN LATBbits.LATB12


void buzzer_pwm_setup(void){
    // unlocking PPS
    __builtin_write_OSCCONL(OSCCON & 0xBF); // unlock PPS
    RPOR6bits.RP12R = 18;  // Use Pin RP12 for Output Compare 1 = "18" (Table 10-3)
    __builtin_write_OSCCONL(OSCCON | 0x40); // lock PPS
    
    TRISBbits.TRISB12 = 0; // sets RB12 as output mode
    
    // Configure Timer 2
    T2CON = 0;  //Stop and reset timer configuration
    T2CONbits.TCKPS = 0b00; //sets prescaler to 1:1
    TMR2 = 0;        // initialize to 0: Timer 3
    PR2 = 999; // random initial period
    T2CONbits.TON = 0;
    
    // set OC1 for servo PWM (1-2ms pulse in 20ms frame)
    
    OC1CON = 0;
    OC1R = PR2/2; //Set 50% Duty Cycle
    OC1RS = PR2/2; // Update shadow register as well
    OC1CONbits.OCM = 0b110; // PWM mode, fault pin disabled
    OC1CONbits.OCTSEL = 0; // set Timer 2 as clock source
}

void buzz(unsigned int freq) {
    
    unsigned int period = 16000000 / freq; // 16 MHz / freq = Period / Tcy
    
    T2CONbits.TCKPS = 0b00; //sets prescaler to 1:1
    
    if (period > 4000000) {
        T2CONbits.TCKPS = 0b11; //sets prescaler to 1:256
        period /= 256;
    }
    else if (period > 500000) {
        T2CONbits.TCKPS = 0b10; //sets prescaler to 1:64
        period /= 64;
    }
    else if (period > 62500) {
        T2CONbits.TCKPS = 0b01; //sets prescaler to 1:8
        period /= 8;
    }
    
//    PR2 = period - 1;
    PR2 = 36363;
    
    T2CONbits.TON = 1;
}

void stop_buzz(void){
    T2CONbits.TON = 0;
}

void setVolume(int volume){ //volume is a value 1-99
    OC1RS = PR2 * volume / 100; 
}



