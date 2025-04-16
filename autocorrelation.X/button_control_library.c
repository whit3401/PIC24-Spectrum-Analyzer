/* 
 * File:   button_control_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 10:24 PM
 */

#include "xc.h"
#include "button_control_library.h"

int is_button_pressed(void){
    return PORTBbits.RB4; //return RB4 status, the port is high only when the button is depressed
}

void initPushButton(){
    TRISBbits.TRISB4 |= 1; //set RP4 to input
}