/* 
 * File:   button_control_library.c
 * Author: tysen
 *
 * Created on April 15, 2025, 10:24 PM
 */

#include "xc.h"
#include "button_control_library.h"

int is_button_pressed(void){
    return PORTBbits.RB4; //return RB4 status, the port is high only when the button is depressed
}

void init_push_button(){
    TRISBbits.TRISB4 |= 1; //set RP4 to input
}

