/* 
 * File:   ADC_microphone_library.c
 * Author: john
 *
 * Created on April 15, 2025, 9:59 PM
 */

#include <p24FJ64GA002.h>

#include "xc.h"
#include "ADC_microphone_library.h"

#define ARRAY_SIZE 800 // array size changed from 2048 to 800 to accoodate PIC24's memory space
#define SAMPLE_INTERVAL 1 //the time between each sample, currently placeholder value
volatile int adcVals[ARRAY_SIZE];
volatile int sampleCount = 0; 
volatile int sampleReady = 0;


void begin_sampling(){
    //enable ADC interrupts
    sampleReady = 0;
    init_arr();
    AD1CON1bits.ADON = 1;    // Turn on ADC
    _AD1IE = 1;
    T1CONbits.TON = 1;
    TMR1 = 0;
}

void end_sampling(){
    //disable ADC interrupts
    AD1CON1bits.ADON = 0;    // Turn off ADC
    _AD1IE = 0;
    T1CONbits.TON = 0; //Turns off timer when sampling is off
    sampleReady = 1;
}
/*
 * This array will return values between 0 and 1023, to convert to voltage, 
 * multiply by 3.3/1024 
 */
    //ERROR:  !! THIS NEEDS TO BE CHANGED TO ACCOMODATE NEW ARRAY SIZE ^^ !!

volatile int* get_digital_signal_data(){
    //return array of data samples ordered chronologically

    sampleReady = 0;
    return adcVals;
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
    
    T3CON = 0x0000;
    T3CONbits.TCKPS = 0b00;
    PR3 = 4999; //0.25 seconds sample time, 3200 samples per second (3.2KHz)
    TMR3 = 0;
    T3CONbits.TON = 1;
}

void timer1_init(void){
    T1CON = 0x0000;
    T1CONbits.TCKPS = 0b10;
    TMR1 = 0;
    PR1 = 62499;
    _T1IF = 0;
    _T1IE = 1;
    T1CONbits.TON = 0;
}

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void){
    //Interrupt for ADC
    IFS0bits.T1IF = 0; 
    end_sampling();
}

void __attribute__((__interrupt__, auto_psv)) _ADC1Interrupt(void){
    //Interrupt for ADC
    IFS0bits.AD1IF = 0;
    put_val(ADC1BUF0);
}

void put_val(int newValue){
    adcVals[sampleCount++] = newValue;
}

//sets all array values to zero, and resets sampleCount
void init_arr(){
    for(int i = 0; i < ARRAY_SIZE; i++){
        adcVals[i] = 0;
        adcVals[i] = 0;
    }
    sampleCount = 0;
}

void microphone_setup(){
    adc_init();
    init_arr();
}
