 /* 
 * File:   shared.h
 * Author: ethan
 *
 * Created on April 30, 2025, 8:17 PM
 */

#ifndef SHARED_H
#define SHARED_H

#define ARRAY_SIZE 500

// declared so adcVals can be used in multiple source files without multiple declarations
// this was necessary for the magnitude function to work
extern int adcVals[ARRAY_SIZE];

#endif