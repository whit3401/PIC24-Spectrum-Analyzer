/* 
 * File:   spectrum_analyzer_main_v003.c
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


void setup(void) 
{
    /* Initialize PIC24 */
    CLKDIVbits.RCDIV=0; // Fcy set to 16 MHz
    AD1PCFG = 0x9fff; // set all pins to digital by default, change pins as necessary in ADC library
    
    /* Call all setup and initialization functions from libraries */
    microphone_setup();
    i2c_setup();
    lcd_init(0xA);
    OLED_Init();
    init_push_button();
    buzzer_pwm_setup();
}

int main(void) {
    setup();
    
    // array for real data in FFT
    float realVals [ARRAY_SIZE] = {0}; 
    // array for imaginary data in FFT
    float imagVals [ARRAY_SIZE] = {0}; 
    
    
    lcd_clear(); // Clear the LCD display
    OLED_SetContrast(0xFF); // Set OLED display to maximum contrast
    OLED_ClearDisplay(); // Clear the OLED display
    
    
    /* 
     * Create Initialized Output for OLED Display 
     *  also useful for display debugging
     */
    int sample_fft_out[500];
    for(int i = 0; i < 500; i++){
        sample_fft_out[i] = 0;
    }

    /* Initialize Array for Displaying to the OLED */
    int display_freq_array[128];
    
    resize_freq_array(sample_fft_out, display_freq_array, 100); // Fits the sample output array data to the display array

    OLED_WriteFFT(display_freq_array); // Write the display array to the OLED as an FFT graph
    OLED_Update(); // Refresh the OLED display with changes
    
    
    int firstPress = 1; // BOOL, is this the first consecutive detection of a button press
    int firstUp = 0; // BOOL, is this the first consecutive detection of a button press being released
    
    lcd_printStr("Ready"); // Write to the LCD screen that the spectrum analyzer is ready for use
    
    while(1){
        
        firstPress = 1; // Reset for next press
        while(is_button_pressed()) {

            // take and store audio sample
            if (firstPress){ // do repeat on consecutive press detections
                begin_sampling(); // Fill the adcVals array with time domain microphone data
                lcd_clear();
                lcd_printStr("SAMPLING..."); // show on the LCD display that the spectrum analyzer is sampling
                firstPress = 0; // this is no longer the first consecutive press detection
                firstUp = 1; // the next release will be the first of consecutive release detections
            }
            
        }
        
        if(firstUp){
            lcd_clear();
            lcd_printStr("DONE"); // show on the LCD display that the spectrum analyzer is finished sampling
            firstUp = 0; // reset for next release
        }
        
        if(is_sample_ready()){ // when sampling is finished and button is not being held
            
            /* FFT will be called using the format:
               FFT (realVals[] , imaginaryVals [], number of vals / size of array) */
            
            for (int i = 0; i < ARRAY_SIZE; i++)
            {
                /* 
                 * Convert from volatile int to float so it can be
                 * used by the FFT function with the correct parameter type
                 * and store in the array of real FFT values
                 */ 
                realVals [i] = (float)adcVals[i]; 
            }
            
            fft(realVals, imagVals, ARRAY_SIZE); // perform FFT
            
            /* Gets the magnitudes of the FFT output and reuses adcVals to store result to save memory */
            magnitude(realVals, imagVals, ARRAY_SIZE);
            
            
            /* 
             * Clear frequencies which are too small for detection
             *  Sample duration is 0.15 seconds, which means frequencies with periods
             *  longer than this would not have enough time to complete a full cycle
             *  and be accurately represented. 1/0.15 = 6.66 Hz, thus the first 2 bins
             *  must be eliminated
             */
            adcVals[0] = 0;
            adcVals[1] = 0;
                    
            /* Get the index of the frequency of strongest magnitude */
            int fundamental_index = find_fundamental_index(adcVals);
            
            /* Play the fundamental frequency on the buzzer */
            buzz(fundamental_index * 4.8); 
            
            /* Write the FFT output to the OLED display as a frequency domain graph */
            resize_freq_array(adcVals, display_freq_array, adcVals[fundamental_index]); // fit the data to the display array
            OLED_WriteFFT(display_freq_array); // update the display with the graphed array
            OLED_Update(); // refresh the screen with updates
            
            /* Reset arrays so old data does not affect new inputs */
            for (int i = 0; i < ARRAY_SIZE; i++)
            {
                realVals[i] = 0; 
                imagVals[i] = 0; 
                adcVals[i] = 0; 
            }
            
        }            
                
    }
        
    return 0;
}
