#!/usr/bin/python3

from hx711 import HX711
import RPi.GPIO as GPIO

try:
    hx = HX711(dout=21, pd_sck=20)

    hx.reset()   # Before we start, reset the HX711 (not obligate)
    while(1):
        c = hx.read_np_arr8()
        a = hx.get_binary_string()
        b = hx.get_np_arr8_string()
        
        print(c)
        print(a)
        print(b)
        # measures = hx.get_raw_data(num_measures=3)
        
        # print("Weight: " + str(measures))

finally:
    GPIO.cleanup()  # always do a GPIO cleanup in your scripts!

    print("\n".join(measures))
