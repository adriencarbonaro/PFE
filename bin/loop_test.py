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
    hx = hx_load()

# -- MAIN EXECUTION ------------------------------------------------------------

    GPIO.setmode(GPIO.BCM)
    while(1):
        val = hx.get_weight_mean(10)
        if (val < 0):
            val = 0

        print(str(val) + " g")
        sleep(1)

except (KeyboardInterrupt, SystemExit):
    print('\ntest: Keyboard Interruption: stopping program')

except (RuntimeError):
    print("\ntest: Runtime Error during execution")

except Exception as e:
    print("\ntest: Other exception: " + e)

finally:
    GPIO.cleanup()


