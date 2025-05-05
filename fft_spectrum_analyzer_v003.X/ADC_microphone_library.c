/* 
 * File:   ADC_microphone_library.c
 * Author: john
 *
 * Created on April 15, 2025, 9:59 PM
 */

#include <p24FJ64GA002.h>

#include "xc.h"
#include "ADC_microphone_library.h"
#include "shared.h"

#define SAMPLE_INTERVAL 1 //the time between each sample, currently placeholder value

int adcVals[ARRAY_SIZE];
volatile int sampleCount = 0; 
volatile int sampleReady = 0;


void begin_sampling(){
    //enable ADC interrupts starting the sample
    sampleReady = 0;
    init_arr();
    AD1CON1bits.ADON = 1;    // Turn on ADC
    _AD1IE = 1;
    TMR1 = 0;
    T1CONbits.TON = 1;
}

void end_sampling(){
    //disables ADC interrupts ending the sample
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
    //returns 1 if sample is ready, 0 if not ready
    return sampleReady;
}

int get_sample_size(){
    //return the length of the sample array
    return sampleCount;
}

void timer1_init(void){
    //Timer 1 initialization, is used for sample time
    T1CON = 0x0000;
    T1CONbits.TCKPS = 0b10; //sets prescaler to 64
    TMR1 = 0;               //initializes timer1 to 0
    PR1 = 62499;            //sets timer1 period to 0.25 seconds
    _T1IF = 0;              //clears the interrupt flag
    _T1IE = 1;              //enables interrupts
    T1CONbits.TON = 0;      //initializes timer off so it doesn't buzz when initialized
}

//Initializes the ADC
void adc_init(void){
    //ADC and timer3 initialization
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
    
    timer1_init();
}

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void){
    //Interrupt for sampling end, ends after 0.25 seconds
    IFS0bits.T1IF = 0; 
    end_sampling();
}

void __attribute__((__interrupt__, auto_psv)) _ADC1Interrupt(void){
    //Interrupt for ADC1, puts the value at RA0 into adcVals array
    IFS0bits.AD1IF = 0;
    put_val(ADC1BUF0);
}

void put_val(int newValue){
    //puts the value into adcVals, used for sampling
    adcVals[sampleCount++] = newValue;
}

//sets all array values to zero, and resets sampleCount
void init_arr(){
    //Initializes the array, setting all values to 0.
    for(int i = 0; i < ARRAY_SIZE; i++){
        adcVals[i] = 0;
        adcVals[i] = 0;
    }
    sampleCount = 0;
}

void microphone_setup(){
    //initializes the adc 
    adc_init();
    init_arr();
}
