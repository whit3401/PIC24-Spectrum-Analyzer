/* 
 * File:   autocorrelation_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:47 PM
 */

#include "xc.h"
#include "ADC_microphone_in.h"
#include "autocorrelation_library.h"
#include "oledDisplay_API_library.h"
#include "whit3401_asmLib_v001.h"

// CW1: FLASH CONFIGURATION WORD 1 (see PIC24 Family Reference Manual 24.1)
#pragma config ICS = PGx1          // Comm Channel Select (Emulator EMUC1/EMUD1 pins are shared with PGC1/PGD1)
#pragma config FWDTEN = OFF        // Watchdog Timer Enable (Watchdog Timer is disabled)
#pragma config GWRP = OFF          // General Code Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF           // General Code Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF        // JTAG Port Enable (JTAG port is disabled)


// CW2: FLASH CONFIGURATION WORD 2 (see PIC24 Family Reference Manual 24.1)
#pragma config I2C1SEL = PRI       // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF       // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = ON       // Primary Oscillator I/O Function (CLKO/RC15 functions as I/O pin)
#pragma config FCKSM = CSECME      // Clock Switching and Monitor (Clock switching is enabled, 
                                       // Fail-Safe Clock Monitor is enabled)
#pragma config FNOSC = FRCPLL      // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))


void delay(int delay_in_ms) { // FOR TESTING PURPOSES, aim for non-polling final design, especially in libraries as it could cause issues
    for (int i=0; i<delay_in_ms; i++) wait_1ms();
}

void setup(void) {
    
}


int main(void) {
    setup();
    
    
    while(1){
        
        while(is_button_pressed()) {
            
            // take and store audio sample
            
        }
        
        if(is_sample_ready()){
            // transform audio data to frequency domain
            // update display with transformed output
        }
            
                
    }
        
    return 0;
}