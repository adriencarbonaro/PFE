#!/usr/bin/env python3

import sys
import os
import RPi.GPIO as     GPIO     # import GPIO
from   time     import sleep

# Add HX711 directory to sys.path.
# Allows to find module hx711.
#
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from HX.HX711_Python3.hx711 import HX711    # import the class HX711

def calibrate():
    # Create an object hx which represents your real hx711 chip
    # Required input parameters are only 'dout_pin' and 'pd_sck_pin'
    # If you do not pass any argument 'gain_channel_A' then the default value is 128
    # If you do not pass any argument 'set_channel' then the default value is 'A'
    # you can set a gain for channel A even though you want to currently select channel B
    hx = HX711(dout_pin=21, pd_sck_pin=20, gain_channel_A=64)
    cpt = 0
    result = hx.reset()         # Before we start, reset the hx711

    if result:
        print('Ready to use')
    else:
        print('not ready')

    # Measure tare and save the value as offset for current channel and gain selected.
    result = hx.zero(times=10)
    print("zero value : " + str(hx.get_data_mean(10)))

    # Calibrate using a known 50g weight.
    input('Put calibrating weight (60g) on the scale the press Enter')
    weight_60grams = hx.get_data_mean(10)
    print("60g value  : " + str(weight_60grams))
    hx.set_scale_ratio(scale_ratio=weight_60grams / 60.0)
    
    return hx
