#!/usr/bin/python3

from hx711 import HX711
import RPi.GPIO as GPIO

try:
    hx = HX711(dout=21, pd_sck=20)

    hx.reset()   # Before we start, reset the HX711 (not obligate)

    measures = hx.get_raw_data(num_measures=3)

finally:
    GPIO.cleanup()  # always do a GPIO cleanup in your scripts!

    print("\n".join(measures))
