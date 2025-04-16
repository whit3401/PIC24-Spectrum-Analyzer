/* 
 * File:   autocorrelation_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:59 PM
 */

#include "xc.h"
#include "ADC_microphone_in.h"

#define SAMPLE_INTERVAL 1 //time between samples

int isSampleReady = 0;

int is_sample_ready(void){
    return isSampleReady;
}

void begin_sampling(){
    isSampleReady = 0;
    //enable ADC interrupts
}

void end_sampling(){
    //disable ADC interrupts
    isSampleReady = 1;
}

int* get_digital_signal_data(){
    //return array of data samples ordered chronologically
    return 0;
}