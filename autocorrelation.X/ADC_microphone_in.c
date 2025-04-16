/* 
 * File:   autocorrelation_library.h
 * Author: john
 *
 * Created on April 15, 2025, 9:59 PM
 */

#include "xc.h"
#include "ADC_microphone_in.h"

#define BUFFER_SIZE 1024
#define SAMPLE_INTERVAL 1 //the time between each sample, currently placeholder value
volatile long int buffer[1024];
volatile long int sampleCount = 0; 


/*
 * functions needed for main algorithm:
 * possible implementation structure crudely outlined
*/
void begin_sampling(){
    //enable ADC interrupts
    AD1CON1bits.ADON = 1;    // Turn on ADC
    initBuffer();
}

void end_sampling(){
    //disable ADC interrupts
    AD1CON1bits.ADON = 0;    // Turn on ADC
    
}

int* get_digital_signal_data(){
    //return array of data samples ordered chronologically
    static int arr[BUFFER_SIZE];

    for (int i = 0; i < sampleCount; i++) {
        arr[i] = buffer[i];
    }
    
    return arr;
}



int get_sample_size(){
    //return the length of the sample array
    return sampleCount;
}



void adcInit(void){
    //Initializes the ADC
    CLKDIVbits.RCDIV = 0;
    
    TRISAbits.TRISA0 = 1;
    AD1PCFGbits.PCFG0 = 0;   // RA0/AN0 set as analog input
    AD1CON1bits.FORM = 0;    // Integer output
    AD1CON1bits.SSRC = 2;    // Timer3 ends sampling, starts conversion
    AD1CON2bits.VCFG = 0;
    AD1CON1bits.ASAM = 1;    // Auto-sample
    AD1CON2bits.SMPI = 0;    // Interrupt after every sample
    AD1CON3bits.ADCS = 63;   // ADC clock period (TAD) = (ADCS + 1) * Tcy
    AD1CON3bits.SAMC = 16;   // Auto-sample time (e.g., 16 TAD)
    _AD1IF = 0;
    _AD1IE = 1;
    
    T3CON = 0x0010;
    PR3 = 15624; 
    TMR3 = 0;
    T3CONbits.TON = 1;
}

void __attribute__((__interrupt__, auto_psv)) _ADC1Interrupt(void){
    //Interrupt for ADC
    IFS0bits.AD1IF = 0;
    putVal(ADC1BUF0);
}

void putVal(int newValue){
    buffer[sampleCount++] = newValue;
}

void initBuffer(){
    for(int i = 0; i < BUFFER_SIZE; i++){
        buffer[i] = 0;
    }
    sampleCount = 0;
}
