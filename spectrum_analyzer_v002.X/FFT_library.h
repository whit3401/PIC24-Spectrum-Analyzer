/* 
 * File:   FFT_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:48 PM
 */

#ifndef FFT_LIBRARY_H
#define	FFT_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif

    float magnitude(float real, float imag); 
    void fft(float data[][2], int size);
    void perform_fft(float adcVals[]);
    void find_fundamental(float adcVals[], int *fundamental); 
    


#ifdef	__cplusplus
}
#endif

#endif	/* FFT_LIBRARY_H */

