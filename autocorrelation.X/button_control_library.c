/* 
 * File:   button_control_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 10:24 PM
 */

#include "xc.h"
#include "button_control_library.h"

volatile int isButtonPressed = 0;



int is_button_pressed(void){
    return isButtonPressed;
}