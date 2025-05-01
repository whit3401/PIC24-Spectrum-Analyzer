 /* 
 * File:   shared.h
 * Author: ethan
 *
 * Created on April 30, 2025, 8:17 PM
 */

#ifndef SHARED_H
#define SHARED_H

// declared so adcVals can be used in multiple source files without multiple declarations
// this was necessary for the magnitude function to work
extern volatile int adcVals[500];

#endif