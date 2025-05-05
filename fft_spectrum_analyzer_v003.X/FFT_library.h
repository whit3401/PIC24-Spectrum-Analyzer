/* 
 * File:   FFT_library.h
 * Author: ethan
 *
 * Created on April 15, 2025, 9:48 PM
 */

// file fft.h
#ifndef FFT_LIBRARY
#define FFT_LIBRARY

// The arrays for the fft will be computed in place
// and thus your array will have the fft result
// written over your original data.
// We require an array of real and imaginary floats
// where they are both of length N
void fft(float data_re[], float data_im[], const unsigned int N);

// helper functions called by the fft
// data will first be rearranged then computed
// an array of  {1, 2, 3, 4, 5, 6, 7, 8} will be
// rearranged to {1, 5, 3, 7, 2, 6, 4, 8}
void rearrange(float data_re[], float data_im[], const unsigned int N);

void compute(float data_re[], float data_im[], const unsigned int N);

int find_fundamental_index(int array[]); 

void magnitude (float data_re [], float data_im [], int N); 
#endif

