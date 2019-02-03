#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import sys
import os
import RPi.GPIO     as     GPIO     # import GPIO
from   time         import sleep
import pickle
from   calibration  import calibrate
from   hx_loader    import hx_load
from   firebase.firebase_utils     import firebase_connect
from   firebase.firebase_utils     import send_notification

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append("/home/pi/PFE/")

from HX711.HX711_Python3.hx711 import HX711    # import the class HX711

# -- HX OBJECT LOADING ---------------------------------------------------------
try:
    hx1 = hx_load(21, 20, "/home/pi/PFE/swap_file_1.swp")
    hx2 = hx_load(10, 9,  "/home/pi/PFE/swap_file_2.swp")

# -- MAIN EXECUTION ------------------------------------------------------------

    GPIO.setmode(GPIO.BCM)
    while(1):
        val1 = hx1.get_weight_mean()
        val2 = hx2.get_weight_mean()
        if (val1 < 0):
            val1 = 0
        if (val2 < 0):
            val2 = 0

        print("val1: " + str(val1) + " g")
        print("val2: " + str(val2) + " g")
        print()
        sleep(1)

except (KeyboardInterrupt, SystemExit):
    print('\ntest: Keyboard Interruption: stopping program')

except (RuntimeError):
    print("\ntest: Runtime Error during execution")

except Exception as e:
    print("\ntest: Other exception: " + str(e))

finally:
    GPIO.cleanup()


