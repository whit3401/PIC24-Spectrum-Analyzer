/*
 * File:   oledDisplay_API_library.h
 * Author: tysen
 * Created on April 28, 2025, 5:56 PM
 * 
 * This library used as reference: github.com/xpress-embedo/OLED
 * 
 */

#include "xc.h"
#include "oledDisplay_API_library.h"
#include "I2C_library.h"
#include "shared.h"

#define FFT_BIN_WIDTH 4.8

/*Display Buffer*/
static char buffer[1024];

/**
 * @brief abs
 *
 * Gets the absolute value of a number
 * @param value to make positive
 * @return absolute value of input
 */
int abs(int value) {
    if (value >= 0) return value;
    else return value * -1;
}

/**
 * @brief rounds a float to the closest int
 * 
 * adds .5 to a float, then casts to truncate it. Thus if it is closer than .5 to the ceiling, it will be rounded up.
 *
 * @param val: some float to be rounded
 */
int round_num(float val)
{
    return (int)(val + 0.5);
}

/**
 * @brief Hardware reset OLED display
 *
 * Reset OLED
 */
void oled_reset(void) {
    delay_ms(1);
    LATBbits.LATB7 = 0; //set RB7 low, reset display
    delay_ms(1);
    LATBbits.LATB7 = 1; //set RB7 high, !reset pin is high
    delay_ms(1);
}

/**
 * @brief Send Command to OLED
 *
 * @param command: command to be transmitted to OLED
 */
void oled_cmd(char command )
{
  i2c_start(); //send start command
  i2c_send(0x3D << 1); //transmit slave address and R/nW
  i2c_send(0x00); //transmit control byte, Co = 0, D/C = 0
  i2c_send(command); //transmit command byte
  i2c_stop(); //send stop command
}

/**
 * @brief Initialize OLED
 */
void oled_init( void )
{
  oled_reset();
    
  delay_ms(100);
  oled_cmd(SSD1306_DISPLAY_OFF);
  oled_cmd(SSD1306_SET_DISPLAY_CLOCK_DIV_RATIO);
  oled_cmd(0x80);
  oled_cmd(SSD1306_SET_MULTIPLEX_RATIO );
  oled_cmd(63); // screen height - 1
  oled_cmd(SSD1306_SET_DISPLAY_OFFSET );
  oled_cmd(0x00);
  oled_cmd(SSD1306_SET_START_LINE|0x00);  // Line: 0
  oled_cmd(SSD1306_CHARGE_PUMP );
  oled_cmd(0x14);
  oled_cmd(SSD1306_MEMORY_ADDR_MODE );
  oled_cmd(0x00);  //Horizontal Addressing Mode is Used
  oled_cmd(SSD1306_SET_SEGMENT_REMAP| 0x01);
  oled_cmd(SSD1306_COM_SCAN_DIR_DEC );
  
  oled_cmd(SSD1306_SET_COM_PINS);
  oled_cmd(0x12);
  oled_cmd(SSD1306_SET_CONTRAST_CONTROL);
  oled_cmd(0xCF);
  
  oled_cmd(SSD1306_SET_PRECHARGE_PERIOD);
  oled_cmd(0xF1);
  oled_cmd(SSD1306_SET_VCOM_DESELECT);
  oled_cmd(0x40);
  oled_cmd(SSD1306_DISPLAY_ALL_ON_RESUME);
  oled_cmd(SSD1306_NORMAL_DISPLAY);
  oled_cmd(SSD1306_DEACTIVATE_SCROLL);
  oled_cmd(SSD1306_DISPLAY_ON);

  delay_ms(100);
  oled_refresh();
}

/**
 * @brief Refresh Display
 *
 * Transmits the display buffer data to the display.
 */
void oled_refresh(void)
{
  oled_cmd(SSD1306_SET_COLUMN_ADDR);
  oled_cmd(0);   // Column start address (0 = reset)
  oled_cmd(127); // Column end address (127 = reset)

  oled_cmd(SSD1306_SET_PAGE_ADDR);
  oled_cmd(0); // Page start address (0 = reset)
  oled_cmd(7); // Page end address

  for (int i=0; i < (1024); i++)
  {
    // Send data for Transmission
    i2c_start(); // send start command
    i2c_send(0x3D << 1); // slave address and R/nW
    i2c_send(0x40); // control byte set for data
    for (int x = 0; x < 16; x++)
    {
      i2c_send(buffer[i]);
      i++;
    }
    i--;
    i2c_stop();
  }
}

/**
 * @brief Sets Contrast
 *
 * @param contrast: contrast value, ranges 0x00 to 0xFF
 */
void oled_setContrast(int contrast)
{
  oled_cmd(SSD1306_SET_CONTRAST_CONTROL);
  oled_cmd(contrast);
}

/**
 * @brief Clears Display
 *
 * Set all pixels black.
 */
void oled_clear(void)
{
    for (int i = 0; i <= 127; i++) {
        oled_drawLine(63, i, 0);
    }
}

/**
 * @brief Draws a Pixel
 *
 * Sets a a corresponding pixel coordinate in the display buffer to the specified color.
 * @param x: x coordinate with valid values: 0..127
 * @param y: y coordinate with valid values: 0..63
 * @param color: 0 for black, 1 for white
 */
void oled_drawPixel(int x, int y, int color)
{
  if ( (x < 0) || (x >= 128) || (y < 0) || (y >= 64))
    return;

  switch (color)
  {
    case 1:   buffer[x + (y/8)*128] |=  (1 << (y&7)); break;
    case 0:   buffer[x + (y/8)*128] &= ~(1 << (y&7)); break;
  }
}

/**
 * @brief Draw a Vertical Line
 *
 * Draw vertical line from the top of the screen, with a specified height and color, at the specified column
 *
 * @param height: height of the line. Valid values: 0..63
 * @param column: horizontal position. Valid values: 0..127
 * @param color: 0 for black, 1 for white
 */
void oled_drawLine(int height, int column, int color)
{
  for (int i = 63-height; i <= 63; i++) {
      oled_drawPixel(column, i, color);
  }
}

/**
 * @brief display FFT graph
 * 
 * writes a frequency domain graph on the display
 *
 * @param data: an array of size 128 with values ranging 0-63
 */
void oled_writeFFT(int data[128])
{   
    oled_clear();
    for (int i = 0; i < 128; i++){
        oled_drawLine(data[i], i, 1);
    }
}

/**
 * @brief fit frequency array to screen dimensions
 * 
 * prepares an array for display by resizing to a length of 128, and changing to a logarithmic scale of bin widths
 * by method of fitting bins logarithmically and uses weighted means of fractional bin inclusions
 * 
 * @param inputArray[]: an array of size inputSize(500) with a linear bin width of inputBin(4.8 Hz), total range 2.4 kHz
 * @param outputArray[]: the output display array of size 128, to be overwritten
 */
void resize_freq_array(int inputArray[], int outputArray[], int fundamental){
    int inputSize = ARRAY_SIZE; //size of the input array
    float inputBin = FFT_BIN_WIDTH; //bin width of the input array
    float inputRange = inputBin * inputSize; // total frequency range of the input array
    int triNumber = (128*127)/2; // 128 + 127 + ... + 1, for computation
    float widthMultiplier = (inputRange - 128 * inputBin) / triNumber; //the bin width increase of the output per index of the input
    
    float curFreq = 0; // current frequency of interest
    float curInputIdxLowerFrac = 0; // the fraction of the lower index which is included in the current bin of interest
    int curBinLowerIdx = 0; // the index of the lowest input bin which is included in the current output bin of interest
    float curInputIdxUpperFrac = 0; // the fraction of the highest index which is included in the current bin of interest
    int curBinUpperIdx = 0; // the index of the highest input bin which is included in the current output bin of interest
    float curOutBinWidth = 0; // the bin width of the current output bin of interests
    float upperWeight = 0; // the weight, for weighted mean, of the highest included input bin
    float lowerWeight = 0; // the weight, for weighted mean, of the lowest included input bin
    float totalWeight = 0; // a running total of the weights for weighted mean
    float weightedSum = 0; // the weighted sum of all values of the included bins
    float weightedAvg = 0; // the weight mean, or weighted average, to be placed in the output bin
    
    for (int curOutputIdx = 0; curOutputIdx < 128; curOutputIdx++){
        weightedSum = 0;
        weightedAvg = 0;
        totalWeight = 0;
        
        curInputIdxLowerFrac = curFreq / 4.8; // get a fractional representation of the lowest included bin's index, the lower the decimal value, the more that bin is included
        curOutBinWidth = curOutputIdx * widthMultiplier; // get the bin width of the current bin of interest
        curFreq += 4.8 + curOutBinWidth; // keep track of the current frequency of interest, which increases logarithmically
        curInputIdxUpperFrac = curFreq / 4.8; // get a fractional representation of the highest included bin's index, the higher the decimal value, the more that bin is included
        
        curBinUpperIdx = (int) curInputIdxUpperFrac;
        curBinLowerIdx = (int) curInputIdxLowerFrac;
        
        upperWeight = curInputIdxUpperFrac - curBinUpperIdx; // the weight of the highest included bin, a measure of how "included" that input bin is to the output bin
        lowerWeight = 1 - (curInputIdxLowerFrac - curBinLowerIdx);// the weight of the lowest included bin, a measure of how "included" that input bin is to the output bin
        totalWeight += upperWeight+lowerWeight; // update the total running weight for weighted mean
        
        weightedSum += inputArray[curBinLowerIdx] * lowerWeight; // update running weighted sum for weighted mean with lowest included bin
        weightedSum += inputArray[curBinUpperIdx] * upperWeight; // update running weighted sum for weighted mean with highest included bin
        
        // update running weighted sum and weight for intermediary included bins, all of which are entirely included and thus have a weight of 1
        for (int curInputIdx = curBinLowerIdx + 1; curInputIdx < curBinUpperIdx; curInputIdx++) {
            weightedSum += inputArray[curInputIdx];
            totalWeight += 1;
        }
        
        weightedAvg = weightedSum / totalWeight; // compute weighted average/mean
        
        
        if (curOutputIdx < 2){
            outputArray[curOutputIdx] = 0; //cut out frequencies too low to detect
        } else {
            outputArray[curOutputIdx] = round_num(weightedAvg * 63 / fundamental); // update output array bin with weighted average/mean scaled to 0-63 for fitting to display height
        }
    }
}