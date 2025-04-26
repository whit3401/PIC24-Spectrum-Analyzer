

#include "xc.h"
#include "asmLib_v001.h"
#include "buzzer_library.h"

#define BUZZER_PIN LATBbits.LATB12


void buzzer_pwm_setup(void){
    // unlocking PPS
    CLKDIVbits.RCDIV = 0;  //Set RCDIV=1:1 (default 2:1) 32MHz or FCY/2=16M
    __builtin_write_OSCCONL(OSCCON & 0xBF); // unlock PPS
    RPOR6bits.RP12R = 18;  // Use Pin RP12 for Output Compare 1 = "18" (Table 10-3)
    __builtin_write_OSCCONL(OSCCON | 0x40); // lock PPS
    
    TRISBbits.TRISB4 = 0; // sets RB4 as output mode
    
    // Configure Timer 3 for 20ms period
    T3CON = 0;  //Stop Timer
    T3CONbits.TCKPS = 0b01; //sets 8 prescale
    TMR3 = 0;        // initialize to 0: Timer 3
    PR3 = 999; // 2kHz PWM frequency (not accurate)
    T3CONbits.TON = 0;
    
    // set OC1 for servo PWM (1-2ms pulse in 20ms frame)
    
    OC1R = PR3/2; //50%
    OC1RS = PR3/2; 
    OC1CON = 0;
    OC1CONbits.OCM = 0b110; // PWM mode, fault pin disabled
    OC1CONbits.OCTSEL = 1; // set Timer 3 as clock source
}



