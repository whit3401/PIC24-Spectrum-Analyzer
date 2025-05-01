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
#include "buzzer_library.h"
#include "I2C_library.h"
#include "shared.h"

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

#define ARRAY_SIZE 500

void setup(void) 
{
    CLKDIVbits.RCDIV=0; // Fcy 16 MHz
    AD1PCFG = 0x9fff; // set all pins to digital by default, change pins as necessary in ADC library
    
    microphone_setup();
    i2c_setup();
    lcd_init(0xA);
    OLED_Init();
    init_push_button();
    buzzer_pwm_setup();
}


int main(void) {
    setup();
    
    int firstPress = 1; // TEMP DEBUGGING VAR
    int firstUp = 0; // TEMP DEBUGGING VAR
        
    
    // array for real data in fft
    float realVals [ARRAY_SIZE]; 
    // array for imaginary data in fft
    float imagVals [ARRAY_SIZE] = {0}; 
    
    
    lcd_clear();
    lcd_printStr("Ready");
    OLED_SetContrast(0xFF);
    OLED_DrawPixel(64, 32, 1);
    OLED_V_Line( 2, 40, 5, 1);
//    OLED_InvertDisplay(1);
    OLED_ClearDisplay();
    
    int sample_fft_out[500] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 50, 50, 50, 50, 50, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };

    int sample_freq_array[128];
    
    resize_freq_array(sample_fft_out, sample_freq_array, 50);

    OLED_WriteFFT(sample_freq_array);
    OLED_Update();
    
    //buzz(523); //C5
    // buzz_for_3_seconds(523); //C5

    
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
//            end_sampling();
            lcd_clear();
            lcd_printStr("DONE");
            firstUp = 0;
            buzz(250);
        }
        
        
        if(is_sample_ready()){
            // fft will be called using the format:
            // fft (realVals[] , imaginaryVals [], number of vals / size of array)
            
            // converting adcVals into main
            volatile int* adcVals = get_digital_signal_data(); 
            
            for (int i = 0; i < ARRAY_SIZE; i++)
            {
                // converting from volatile int  to float so it can be used by the fft function with the correct parameter type
                realVals [i] = (float)adcVals[i]; 
            }
            
            fft (realVals, imagVals, ARRAY_SIZE); 
            
            magnitude (realVals, imagVals, ARRAY_SIZE); 
                    
            int fundamental = find_fundamental ((int*)realVals);
            
            buzz (fundamental); 
            
        }
        int ab = 0;
        ab++;
            
                
    }
        
    return 0;
}
