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
    volatile int* get_digital_signal_data(); //returns an array of all the samples taken
    int get_sample_size(); //returns the size of the array
    int is_sample_ready();

    void put_val(int newValue);	// add a new value to the buffer
    void init_buffer();		// set all buffer vals to zero
    void adc_init(void);
    void microphone_setup(void);


#ifdef	__cplusplus
}
#endif

#endif	/* ADC_MICROPHONE_LIBRARY_H */
