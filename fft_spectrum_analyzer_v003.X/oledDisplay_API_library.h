/*
 * File:   oledDisplay_API_library.h
 * Author: tysen
 * Created on April 28, 2025, 5:56 PM
 * 
 * This library used as reference: github.com/xpress-embedo/OLED
 * 
 */

#ifndef OLEDDISPLAY_API_LIBRARY_H
#define	OLEDDISPLAY_API_LIBRARY_H

#include "I2C_library.h"

#ifdef	__cplusplus
extern "C"
{
#endif

/* SSD1306 Command Set*/
// Fundamental Commands
#define SSD1306_SET_CONTRAST_CONTROL                    0x81
#define SSD1306_DISPLAY_ALL_ON_RESUME                   0xA4
#define SSD1306_DISPLAY_ALL_ON                          0xA5
#define SSD1306_NORMAL_DISPLAY                          0xA6
#define SSD1306_INVERT_DISPLAY                          0xA7
#define SSD1306_DISPLAY_OFF                             0xAE
#define SSD1306_DISPLAY_ON                              0xAF
#define SSD1306_NOP                                     0xE3
// Scrolling Commands
#define SSD1306_HORIZONTAL_SCROLL_RIGHT                 0x26
#define SSD1306_HORIZONTAL_SCROLL_LEFT                  0x27
#define SSD1306_HORIZONTAL_SCROLL_VERTICAL_AND_RIGHT    0x29
#define SSD1306_HORIZONTAL_SCROLL_VERTICAL_AND_LEFT     0x2A
#define SSD1306_DEACTIVATE_SCROLL                       0x2E
#define SSD1306_ACTIVATE_SCROLL                         0x2F
#define SSD1306_SET_VERTICAL_SCROLL_AREA                0xA3
// Addressing Setting Commands
#define SSD1306_SET_LOWER_COLUMN                        0x00
#define SSD1306_SET_HIGHER_COLUMN                       0x10
#define SSD1306_MEMORY_ADDR_MODE                        0x20
#define SSD1306_SET_COLUMN_ADDR                         0x21
#define SSD1306_SET_PAGE_ADDR                           0x22
// Hardware Configuration Commands
#define SSD1306_SET_START_LINE                          0x40
#define SSD1306_SET_SEGMENT_REMAP                       0xA0
#define SSD1306_SET_MULTIPLEX_RATIO                     0xA8
#define SSD1306_COM_SCAN_DIR_INC                        0xC0
#define SSD1306_COM_SCAN_DIR_DEC                        0xC8
#define SSD1306_SET_DISPLAY_OFFSET                      0xD3
#define SSD1306_SET_COM_PINS                            0xDA
#define SSD1306_CHARGE_PUMP                             0x8D
// Timing & Driving Scheme Setting Commands
#define SSD1306_SET_DISPLAY_CLOCK_DIV_RATIO             0xD5
#define SSD1306_SET_PRECHARGE_PERIOD                    0xD9
#define SSD1306_SET_VCOM_DESELECT                       0xDB

/* Function Declarations */
int abs(int value);
int round_num(float val);
void oled_reset(void);
void oled_cmd(char command);
void oled_init(void);
void oled_refresh(void);
void oled_setContrast(int contrast);
void oled_clear(void);
void oled_drawPixel(int x, int y, int color);
void oled_drawLine(int height, int x_pos, int color);
void oled_writeFFT(int data[]);
void resize_freq_array(int inputArray[], int outputArray[], int fundamental);


#ifdef	__cplusplus
}
#endif

#endif	/* OLEDDISPLAY_API_LIBRARY_H */