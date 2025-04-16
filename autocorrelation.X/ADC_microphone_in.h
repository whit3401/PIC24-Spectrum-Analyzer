/* 
 * File:   ADC_microphone_in.h
 * Author: johng
 *
 * Created on April 16, 2025, 2:42 PM
 */

#ifndef ADC_MICROPHONE_IN_H
#define	ADC_MICROPHONE_IN_H

#ifdef	__cplusplus
extern "C" {
#endif

void putVal(int newValue);	// add a new value to the buffer
int getAvg();          	// average all buffer vals
void initBuffer();		// set all buffer vals to zero
void wait_1ms(void);
void timer1Init(void);
void adcInit(void);


#ifdef	__cplusplus
}
#endif

#endif	/* ADC_MICROPHONE_IN_H */

