/* 
 * File:   ADC_microphone_in.h
 * Author: tysen
 *
 * Created on April 15, 2025, 10:00 PM
 */

#ifndef ADC_MICROPHONE_IN_H
#define	ADC_MICROPHONE_IN_H

#ifdef	__cplusplus
extern "C" {
#endif


    int is_sample_ready(void);
    void begin_sampling(void);
    void end_sampling();
    int* get_digital_signal_data();

#ifdef	__cplusplus
}
#endif

#endif	/* ADC_MICROPHONE_IN_H */

