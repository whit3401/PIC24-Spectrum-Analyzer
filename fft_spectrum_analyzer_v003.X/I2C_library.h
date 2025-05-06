/* 
 * File:   I2C_library.h
 * Author: tysen
 *
 * Created on April 15, 2025, 9:57 PM
 */

#ifndef I2C_LIBRARY_H
#define	I2C_LIBRARY_H

#ifdef	__cplusplus
extern "C" {
#endif

void delay_ms(int delay_in_ms);

void i2c_setup();
void i2c_start();
void i2c_send(char message);
void i2c_stop();

#ifdef	__cplusplus
}
#endif

#endif	/* I2C_LIBRARY_H */

