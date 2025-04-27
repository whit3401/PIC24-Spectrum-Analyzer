/* 
 * File:   FFT_library.c
 * Author: ethan
 *
 * Created on April 24, 2025, 11:19 AM
 */

// Template followed for this implementation:
// https://www.youtube.com/watch?v=I5N8ZzPSO4s 


#include "xc.h"
#include "FFT_library.h"

#define pi 3.14159265358979
#define e 2.718281828459
#define BUFFER_SIZE 2048 

// might need these, not sure yet: 
// frequency
// int w = (2*pi)/SAMPLE_INTERVAL; 
// int k = 0; 


// even and odd data output arrays
//float data_even [BUFFER_SIZE/2][2]; 
//float data_odd [BUFFER_SIZE/2][2]; //ERROR TOO MUCH MEMORY
//float fft_output [BUFFER_SIZE/2][2]; 

// this parameter will be the data intake given by john's ADC
//float fft (float data_input [][2])
//{
//    // INFO:
//    // the second array dimension (2) helps us to represent the real and imaginary parts of the data
//    // data [][0] contains the real part
//    // data [][1] contains the imaginary part
//    
//    // do the N<=2 check here
//    
//    // fill in the even and odd arrays from the input array
//    for (int r = 0; r < BUFFER_SIZE/2; r++)
//    {
//        // we will only fill in the real part at this time, since we only received real input data
//        // hence, the imaginary part (data[][1]) will be all zeroes
//        data_even [r][0] = data_input [2*r][0];
//        data_even [r][1] = 0.0; 
//        data_odd [r][0] = data_input [2r+1][0]; 
//        data_odd [r][1] = data_input [2r+1][1]; 
//        
//        // recursively treat the even and odd indexed input arrays as BUFFER_SIZE/2 DFT's
//        // FIX ME: fill in the code for this
//        
//        
//        // Once even and odd DFT's are done calculating and have been returned, do the FFT math
//        // X(k) = even(k) + W(N/BUFFER_SIZE*k%N) * odd(k)
//        
//        // k is each frequency in the frequency range
//        // only need to iterate BUFFER_SIZE/2 amount of times since the lower half will be the same
//        // as the upper half
//        for (int k = 0; k < BUFFER_SIZE/2; k++)
//        {
//            // index for the W vector being multiplied with the odd array
//            
//            // FIX ME: uncomment this when actually coding (commented just for push)
//            // int W_index = N/BUFFER_SIZE*k; 
//            
//            // array for holding multiplication output of W vector and odd array
//            float WxOdd [2]; 
//            // WxOdd[0] = 
//            // WxOdd[1] = 
//            fft_output [k][0] = data_even [k][0] + WxOdd [0]; 
//            fft_output [k][1] = data_even [k][1] + WxOdd [1]; 
//            fft_output [k+BUFFER_SIZE/2][0] = data_even [k][0] - WxOdd [0]; 
//            fft_output [k+BUFFER_SIZE/2][1] = data_even [k][1] - WxOdd [1]; 
//        }
//    }
//    
//    return fft_output; 
//}