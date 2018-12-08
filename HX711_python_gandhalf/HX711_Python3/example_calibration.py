#!/usr/bin/env python3

from   hx711    import HX711    # import the class HX711
import RPi.GPIO as     GPIO     # import GPIO
from   time     import sleep

try:
    # Create an object hx which represents your real hx711 chip
    # Required input parameters are only 'dout_pin' and 'pd_sck_pin'
    # If you do not pass any argument 'gain_channel_A' then the default value is 128
    # If you do not pass any argument 'set_channel' then the default value is 'A'
    # you can set a gain for channel A even though you want to currently select channel B
    hx = HX711(dout_pin=21, pd_sck_pin=20, gain_channel_A=64)
    cpt = 0     
    result = hx.reset()         # Before we start, reset the hx711 ( not necessary)
    
    if result:                  # you can check if the reset was successful
        print('Ready to use')
    else:
        print('not ready')

    # measure tare and save the value as offset for current channel
    # and gain selected.
    result = hx.zero(times=10)

    while(1):
        wei = hx.get_weight_mean(10)
        print(str(wei) + " g")
        sleep(1)

except (KeyboardInterrupt, SystemExit):
    print('Bye :)')

finally:
    GPIO.cleanup()


