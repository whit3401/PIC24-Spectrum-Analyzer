//#include "xc.h"
//#include "autocorrelation_library.h"
//
//long int array [] = {0}; // array will take in the signal values
//int size = 0; 
//
//long int average (array [])  // FIX ME: name something different
//{
//    size = sizeof(array) / (sizeof array [0]);
//    // "sizeof" takes the size in bytes. It is an array of long ints, long ints are 8 bytes each, so it divides
//    // by the size of a single element to get the number of array elements
//    
//    long int sum = 0;
//    for (int i = 0; i < size; i++)
//    {
//        sum += array[i]; 
//    }
//    return sum; 
//}
//
//float autocorrelation (array []) // FIX ME: name something different
//{
//    float output [];  // output
//    for (int lag = 0; lag < size; lag++)  // introduces a lag for comparison
//    {
//        for (int i = 0; i + lag < size; i++)
//        {
//            output [lag] += array [i] * array [i+lag];  // does the autocorrelation, multiplying the signal
//                                                        // by the signal with a lag
//        }
//    }
//    return output; 
//}
//
//int main () 
//{
//    
//}
