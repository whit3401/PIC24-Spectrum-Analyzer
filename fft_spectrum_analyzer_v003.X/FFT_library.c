
/* File:   FFT_library.c
 * Author: ethan
 *
 * Created on April 24, 2025, 11:19 AM
 */

#include "FFT_library.h"
#include "ADC_microphone_library.h"
#include <math.h>
#include <stdio.h>
#include "shared.h"

#define ARRAY_SIZE 500

/* NOTE: 
    fft has not been taught yet, so knowledge is limited. 
    Not all functions can be thoroughly explained due to complexity of the algorithm
    code is explained to the extent of knowledge of the programmer
*/ 


// calculates the magnitude of the real and imaginary part of the fft output array
void magnitude (float data_re [], float data_im [], int N)
{
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        // magnitude equation
        adcVals [i] = sqrt ((data_re[i]) * (data_re [i]) + (data_im [i]) * (data_im [i])); 
    }
}

// fft function broken into two steps, rearranging the data with bit inversions and computing the fft output array
void fft (float data_re[], float data_im[], const unsigned int N)
{
    rearrange (data_re, data_im, N);
    compute (data_re, data_im, N);
}

// performs bit inversion calculations and moves indices around into their proper place
    // for when they are calculated later in the compute function
void rearrange (float data_re[], float data_im [], const unsigned int N)
{
    // implements the butterfly rearrangement method
    unsigned int target = 0;
    for (unsigned int position = 0; position < N; position ++)
    {
        if (target > position)
        {
            const float temp_re = data_re [target]; 
            const float temp_im = data_im [target]; 
            data_re[target] = data_re [position]; 
            data_im [target] = data_im [position]; 
            data_re [position] = temp_re; 
            data_im [position] = temp_im; 
        }
        unsigned int mask = N; 
        while (target & (mask >>= 1))
        target &= ~mask;
        target |= mask;
    }
}

// computes the 2D fft output array once the butterfly rearrangement is completed
void compute (float data_re [], float data_im [], const unsigned int N)
{
    const float pi = -3.14159265358979323846;
    for (unsigned int step = 1; step < N; step <<=1)
    {
        const unsigned int jump = step << 1;
        const float step_d = (float) step;
        float twiddle_re = 1.0; 
        float twiddle_im = 0.0; 
        for (unsigned int group = 0; group < step; group++)
        {
            for (unsigned int pair = group; pair < N; pair += jump)
            {
                const unsigned int match = pair + step;
                const float product_re = twiddle_re * data_re [match] - twiddle_im * data_im [match]; // real product
                const float product_im = twiddle_im * data_re [match] + twiddle_re * data_im [match]; // imaginary product
                data_re [match] = data_re [pair] - product_re; 
                data_im [match] = data_im [pair] - product_im; 
                data_re [pair] += product_re; 
                data_im [pair] += product_im; 
            }
            
        // we need the factors below for the next iteration
        // if we don't iterate, then we don't compute
        if (group + 1 == step)
        {
            continue;
        }
        
            float angle = pi*((float) group+1)/step_d; 
            twiddle_re = cos (angle); // real twiddle factor
            twiddle_im = sin (angle); // imaginary twiddle factor
        }
    }
}

// finds the index of the fundamental frequency in the computed FFT array
int find_fundamental_index(int array[])
{
    // index of the fundamental frequency
    int fundamentalIdx = 0; 
    
    // magnitude of the fundamental frequency
    int maxVal = 0;
    
    // ignoring the first two because they are always returning as the fundamental index
    // needed to ignore based on results from testing
    for (int i = 2; i < ARRAY_SIZE; i++)
    {
        if (array [i] > maxVal)
        {
            maxVal = array[i];
            fundamentalIdx = i; 
        }
    }
    return fundamentalIdx; 
}