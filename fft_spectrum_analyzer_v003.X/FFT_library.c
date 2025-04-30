
/* File:   FFT_library.c
 * Author: ethan
 *
 * Created on April 24, 2025, 11:19 AM
 */

// Template followed for this implementation:
// https://www.youtube.com/watch?v=I5N8ZzPSO4s  

#include "FFT_library.h"
#include <math.h>
#include <stdio.h>

#define PI 3.14159265358979
#define ARRAY_SIZE 600

// Function to calculate the magnitude of a complex number
float magnitude(float real, float imag) {
    return sqrt(real * real + imag * imag);
}

// Function to perform the bit-reversal permutation
void bit_reversal(float data[ARRAY_SIZE][2]) {
    int j = 0;
    for (int i = 1; i < ARRAY_SIZE; i++) 
    {
        int bit = ARRAY_SIZE >> 1;
        while (j >= bit) 
        {
            j -= bit;
            bit >>= 1;
        }
        j += bit;

        if (i < j) 
        {
            float temp_real = data[i][0];
            float temp_imag = data[i][1];
            data[i][0] = data[j][0];
            data[i][1] = data[j][1];
            data[j][0] = temp_real;
            data[j][1] = temp_imag;
        }
    }
}

// Function to perform the FFT iteratively
void fft(float data[ARRAY_SIZE][2]) 
{
    bit_reversal(data);

    int log2N = 0;
    int N = ARRAY_SIZE;
    while ((1 << log2N) < N) 
    {
        log2N++;
    }

    for (int stage = 1; stage <= log2N; stage++) 
    {
        int m = 1 << stage;
        int m2 = m >> 1;
        float W_real = 1.0;
        float W_imag = 0.0;
        float theta = -2 * PI / m;

        for (int k = 0; k < m2; k++) 
        {
            for (int i = k; i < ARRAY_SIZE; i += m) 
            {
                int i2 = i + m2;
                float temp_real = data[i2][0] * W_real - data[i2][1] * W_imag;
                float temp_imag = data[i2][0] * W_imag + data[i2][1] * W_real;

                data[i2][0] = data[i][0] - temp_real;
                data[i2][1] = data[i][1] - temp_imag;

                data[i][0] += temp_real;
                data[i][1] += temp_imag;
            }

            float W_temp_real = W_real * cos(theta) - W_imag * sin(theta);
            float W_temp_imag = W_real * sin(theta) + W_imag * cos(theta);
            W_real = W_temp_real;
            W_imag = W_temp_imag;
        }
    }
}

// Function to perform the FFT on the input data
void perform_fft(float adcVals[ARRAY_SIZE]) {
    float data[ARRAY_SIZE][2];

    // Initialize the data array with real parts from adcVals and imaginary parts as 0
    for (int i = 0; i < ARRAY_SIZE; i++) {
        data[i][0] = adcVals[i];
        data[i][1] = 0.0;
    }

    // Perform the FFT
    fft(data);

    // Calculate the magnitude of the FFT results
    for (int i = 0; i < ARRAY_SIZE; i++) {
        adcVals[i] = magnitude(data[i][0], data[i][1]);
    }
}

// Function to find the fundamental frequency
int find_fundamental(float adcVals[ARRAY_SIZE]) {
    int fundamental = 0;
    
    for (int i = 1; i < ARRAY_SIZE; i++) 
    {
        if (adcVals[i] > fundamental) 
        {
            fundamental = i; // possibly multiply by 4 for bin width of 4 Hz
        }
    }
    return fundamental; 
}

//#include "FFT_library.h"
//#include <math.h>
//#include <stdio.h>
//
//#define PI 3.14159265358979
//#define ARRAY_SIZE 500
//
//// Global arrays for even and odd data
//float data_even[ARRAY_SIZE/2][2];
//float data_odd[ARRAY_SIZE/2][2];
//
//// Function to calculate the magnitude of a complex number
//float magnitude(float real, float imag) 
//{
//    return sqrt(real * real + imag * imag);
//}
//
//// Function to perform the FFT
//void fft(float data[ARRAY_SIZE][2], int size) 
//{
//    if (size <= 2) 
//    {
//        // BASE CASE
//        // Perform the basic size 2 DFT butterfly
//        float d0_real = data[0][0];
//        float d0_imag = data[0][1];
//        float d1_real = data[1][0];
//        float d1_imag = data[1][1];
//        
//        data[0][0] = d0_real + d1_real;
//        data[0][1] = d0_imag + d1_imag;
//        data[1][0] = d0_real - d1_real;
//        data[1][1] = d0_imag - d1_imag;
//        return;
//    }
//
//    // Split the data into even and odd indexed elements
//    for (int i = 0; i < size / 2; i++) 
//    {
//        data_even[i][0] = data[2 * i][0];
//        data_even[i][1] = data[2 * i][1];
//        data_odd[i][0] = data[2 * i + 1][0];
//        data_odd[i][1] = data[2 * i + 1][1];
//    }
//
//    // Recursively perform the FFT on the even and odd parts
//    fft(data_even, size / 2);
//    fft(data_odd, size / 2);
//
//    // Combine the results
//    for (int k = 0; k < size / 2; k++) 
//    {
//        float W_real = cos(2 * PI * k / size);
//        float W_imag = sin(2 * PI * k / size);
//
//        float temp_real = data_odd[k][0] * W_real - data_odd[k][1] * W_imag;
//        float temp_imag = data_odd[k][0] * W_imag + data_odd[k][1] * W_real;
//
//        data[k][0] = data_even[k][0] + temp_real;
//        data[k][1] = data_even[k][1] + temp_imag;
//
//        data[k + size / 2][0] = data_even[k][0] - temp_real;
//        data[k + size / 2][1] = data_even[k][1] - temp_imag;
//    }
//}
//
//// Function to perform the FFT on the input data
//void perform_fft(float adcVals[ARRAY_SIZE]) 
//{
//    float data[ARRAY_SIZE][2];
//
//    // Initialize the data array with real parts from adcVals and imaginary parts as 0
//    for (int i = 0; i < ARRAY_SIZE; i++) 
//    {
//        data[i][0] = adcVals[i];
//        data[i][1] = 0.0;
//    }
//
//    // Perform the FFT
//    fft(data, ARRAY_SIZE);
//
//    // Calculate the magnitude of the FFT results
//    for (int i = 0; i < ARRAY_SIZE; i++) 
//    {
//        adcVals[i] = magnitude(data[i][0], data[i][1]);
//    }
//}
//
//// Function to find the fundamental frequency
//int find_fundamental(float adcVals[ARRAY_SIZE]) {
//    int fundamental = 0;
//    
//    for (int i = 1; i < ARRAY_SIZE; i++) 
//    {
//        if (adcVals[i] > fundamental) 
//        {
//            fundamental = i; // possibly multiply by 4 for bin width of 4 Hz
//        }
//    }
//    return fundamental; 
//}