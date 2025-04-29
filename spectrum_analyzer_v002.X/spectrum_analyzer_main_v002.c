/* 
 * File:   spectrum_analyzer_main_v002.c
 * Author: tysen
 *
 * Created on April 15, 2025, 9:47 PM
 */

#include "xc.h"
#include "ADC_microphone_library.h"
#include "FFT_library.h"
#include "oledDisplay_API_library.h"
#include "asmLib_v001.h"
#include "button_control_library.h"

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


void setup(void) {
    CLKDIVbits.RCDIV=0; // Fcy 16 MHz
    AD1PCFG = 0x9fff; // set all pins to digital by default, change pins as necessary in ADC library
    
    microphone_setup();
    lcd_init(0xA);
    OLED_Init();
    init_push_button();
    buzzer_pwm_setup();
}


int main(void) {
    setup();
    
    int firstPress = 1; // TEMP DEBUGGING VAR
    int firstUp = 0; // TEMP DEBUGGING VAR
    
    lcd_clear();
    lcd_printStr("Ready");
    
    while(1){
        
        firstPress = 1;
        while(is_button_pressed()) {
            
            // take and store audio sample
            int audioSignal = PORTAbits.RA0; // PLACEHOLDER
            if (firstPress){
                begin_sampling();
                lcd_clear();
                lcd_printStr("SAMPLING...");
                firstPress = 0;
                firstUp = 1;
            }
            
        }
        if(firstUp){
            end_sampling();
            lcd_clear();
            lcd_printStr("DONE");
            firstUp = 0;
        }
        
        
        if(is_sample_ready()){
            // transform audio data to frequency domain
                // the audio data will need to be put into a 2D array, with the audio data in the first row
                // and the second row will be all zeroes, later to be used for imaginary numbers.
                // this array will then be passed as a parameter to the fft function
            
            // update display with transformed output
            int x = 1; // TEMP FOR DEBUGGING
//            int abc = get_digital_signal_data(); // TEMP FOR DEBUGGING
        }
            
                
    }
        
    return 0;
}
