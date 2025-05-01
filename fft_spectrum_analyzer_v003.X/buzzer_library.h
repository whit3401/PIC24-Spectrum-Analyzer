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
    void buzz(unsigned int freq);
    void stop_buzz(void);
    void buzz_for_5_seconds(unsigned int freq);

#ifdef	__cplusplus
}
#endif

#endif	/* BUZZER_LIBRARY_H */

