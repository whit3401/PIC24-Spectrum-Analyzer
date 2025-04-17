/* 
 * File:   ADC_microphone_library.h
 * Author: johng
 *
 * Created on April 16, 2025, 2:42 PM
 */

#ifndef ADC_MICROPHONE_LIBRARY_H
#define	ADC_MICROPHONE_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif


    void begin_sampling(void);
    void end_sampling();
    long int* get_digital_signal_data(); //returns an array of all the samples taken
    int get_sample_size(); //returns the size of the array
    int is_sample_ready();

    void putVal(int newValue);	// add a new value to the buffer
    void initBuffer();		// set all buffer vals to zero
    void adcInit(void);


#ifdef	__cplusplus
}
#endif

#endif	/* ADC_MICROPHONE_LIBRARY_H */
