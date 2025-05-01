#include <xc.h>

// Define the song: notes and durations
const unsigned int notes[] = {
    440, 494, 523, 587, 659, 698, 784, 0   // A4, B4, C5, D5, E5, F5, G5, (end)
};
const unsigned int durations[] = {
    200, 200, 200, 200, 200, 200, 400, 0    // ms for each note
};

volatile int current_note = 0;
volatile int note_timer = 0;

void initAudio(void)
{
    // Unlock PPS
    __builtin_write_OSCCONL(OSCCON & 0xBF);

    // Map OC1 output to RB6
    RPOR2bits.RP4R = 18; // 18 = OC1

    // Lock PPS
    __builtin_write_OSCCONL(OSCCON | 0x40);

    // Initialize Timer3
    T3CON = 0x8000;  // Timer3 on, prescale 1:1
    PR3 = 1000 - 1;  // dummy starting period

    _T3IF = 0;       // Clear interrupt flag
    _T3IE = 1;       // Enable Timer3 interrupt

    // Initialize Output Compare 1
    OC1R = OC1RS = PR3 / 2;
    OC1CON = 0x000E; // PWM mode, Timer3 source
}

void playNote(unsigned int freq)
{
    if (freq == 0)
    {
        // Silence
        OC1CONbits.OCM = 0; // Turn off PWM
        return;
    }

    // Compute new PR3 for desired frequency
    unsigned int period = 4000000UL / freq;  // Fcy = 4MHz
    PR3 = period - 1;
    OC1RS = PR3 / 2;  // 50% duty

    // Make sure PWM is on
    OC1CONbits.OCM = 0b110; // PWM mode
}

void __attribute__((interrupt, no_auto_psv)) _T3Interrupt(void)
{
    note_timer++;

    if (note_timer >= durations[current_note])
    {
        note_timer = 0;
        current_note++;

        if (notes[current_note] == 0)
        {
            // End of song, optionally restart
            current_note = 0;
        }

        playNote(notes[current_note]);
    }

    _T3IF = 0; // Clear Timer3 interrupt flag
}

//int main(void)
//{
//    initAudio();
//    playNote(notes[0]);  // Start first note
//
//    while (1)
//    {
//        // Main loop idle
//    }
//
//    return 0;
//}
