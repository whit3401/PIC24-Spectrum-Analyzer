/* 
 * File:   ADC_microphone_library.c
 * Author: john
 *
 * Created on April 15, 2025, 9:59 PM
 */

#include "xc.h"
#include "ADC_microphone_library.h"

#define BUFFER_SIZE 500
#define SAMPLE_INTERVAL 1 //the time between each sample, currently placeholder value
volatile int buffer[BUFFER_SIZE];
volatile int sampleCount = 0; 
volatile int sampleReady = 0;


void begin_sampling(){
    //enable ADC interrupts
    sampleReady = 0;
    AD1CON1bits.ADON = 1;    // Turn on ADC
    _AD1IE = 1;
    init_buffer();
}

void end_sampling(){
    //disable ADC interrupts
    AD1CON1bits.ADON = 0;    // Turn off ADC
    _AD1IE = 0;
    sampleReady = 1;
}
/*
 * This array will return values between 0 and 1023, to convert to voltage, 
 * multiply by 3.3/1024 
 */
volatile int* get_digital_signal_data(){
    //return array of data samples ordered chronologically

    sampleReady = 0;
    return buffer;
}

int is_sample_ready(){
    return sampleReady;
}

int get_sample_size(){
    //return the length of the sample array
    return sampleCount;
}


//Initializes the ADC
void adc_init(void){
    
    TRISAbits.TRISA0 = 1;    // Set RA0/AN0 as input
    AD1PCFGbits.PCFG0 = 0;   // RA0/AN0 set to analog
    AD1CON1bits.FORM = 0;    // Integer output
    AD1CON1bits.SSRC = 2;    // Timer3 ends sampling, starts conversion
    AD1CON2bits.VCFG = 0;
    AD1CON1bits.ADON = 0;    // Turn off ADC
    AD1CON1bits.ASAM = 1;    // Auto-sample
    AD1CON2bits.SMPI = 0;    // Interrupt after every sample
    AD1CON3bits.ADCS = 63;   // ADC clock period (TAD) = (ADCS + 1) * Tcy
    AD1CON3bits.SAMC = 16;   // Auto-sample time (e.g., 16 TAD)
    _AD1IF = 0;
    _AD1IE = 0;
    
    T3CON = 0x0001;
    PR3 = 9999; 
    TMR3 = 0;
    T3CONbits.TON = 1;
}

void __attribute__((__interrupt__, auto_psv)) _ADC1Interrupt(void){
    //Interrupt for ADC
    IFS0bits.AD1IF = 0;
    put_val(ADC1BUF0);
}

void put_val(int newValue){
    buffer[sampleCount++] = newValue;
}

//sets all buffer values to zero, and resets sampleCount
void init_buffer(){
    for(int i = 0; i < BUFFER_SIZE; i++){
        buffer[i] = 0;
    }
    sampleCount = 0;
}

void microphone_setup(){
    adc_init();
    init_buffer();
}
