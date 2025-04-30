/* 
 * File:   FFT_library.h
 * Author: ethan
 *
 * Created on April 15, 2025, 9:48 PM
 */

#ifndef FFT_LIBRARY_H
#define	FFT_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif

    void fft (float data_input [][2], int size); 
    int find_fundamental(float adcVals[]); 
    void perform_fft(float adcVals[]); 
    float magnitude(float real, float imag);
    


#ifdef	__cplusplus
}
#endif

#endif	/* FFT_LIBRARY_H */

