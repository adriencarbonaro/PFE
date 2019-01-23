#!/usr/bin/env python3

# -- IMPORTS -------------------------------------------------------------------

import sys
import os
import RPi.GPIO as     GPIO     # import GPIO
from   time     import sleep
import pickle                   # Saving the hx object

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from HX711.HX711_Python3.hx711 import HX711    # import the class HX711


# -- CONSTANTS -----------------------------------------------------------------

swap_file_name = '/home/pi/PFE/swap_file.swp'


# -- FUNCTIONS -----------------------------------------------------------------

def calibrate():
    # Create an object hx which represents your real hx711 chip
    # Required input parameters are only 'dout_pin' and 'pd_sck_pin'
    # If you do not pass any argument 'gain_channel_A' then the default value is 128
    # If you do not pass any argument 'set_channel' then the default value is 'A'
    # you can set a gain for channel A even though you want to currently select channel B
    GPIO.setmode(GPIO.BCM)
    hx = HX711(dout_pin=21, pd_sck_pin=20, gain_channel_A=64)
    cpt = 0
    result = hx.reset()         # Before we start, reset the hx711

    if not result:
        print('Ready to use')
    else:
        print('not ready')

    # Measure tare and save the value as offset for current channel and gain selected.
    result = hx.zero(readings=10)
    # print("zero value : " + str(hx.get_data_mean(10)))

    # Calibrate using a known 50g weight.
    input('Put calibrating weight (60g) on the scale the press Enter')
    weight_60grams = hx.get_data_mean(10)
    print("60g value  : " + str(weight_60grams))
    hx.set_scale_ratio(scale_ratio=weight_60grams / 60.0)
    
    # This is how you can save the ratio and offset in order to load it later.
    # If Raspberry Pi unexpectedly powers down, load the settings.
    # print('Saving the HX711 state to swap file on persistant memory')
    with open(swap_file_name, 'wb') as swap_file:
        pickle.dump(hx, swap_file)
        swap_file.flush()
        os.fsync(swap_file.fileno())
        # you have to flush, fsynch and close the file all the time.
        # This will write the file to the drive. It is slow but safe.
    input('Calibration OK (press Enter)')
    return hx

if __name__ == '__main__':
    calibrate()

