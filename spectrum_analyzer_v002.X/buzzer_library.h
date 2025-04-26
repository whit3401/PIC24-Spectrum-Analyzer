/* 
 * File:   buzzer_library.h
 * Author: alyannamack
 *
 * Created on April 25, 2025, 5:28 PM
 */

#ifndef BUZZER_LIBRARY_H
#define	BUZZER_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif
    
    void buzzer_pwm_setup(void);
    void pwm_frequency(unsigned int freq_hz);
    void pwm_tone(unsigned int frequency);


#ifdef	__cplusplus
}
#endif

#endif	/* BUZZER_LIBRARY_H */

