#!/usr/bin/env python3

import sys
import os
import RPi.GPIO     as     GPIO     # import GPIO
from   time         import sleep
import pickle
from   calibration      import calibrate
from   hx_loader        import hx_load
from   firebase_utils   import firebase_connect
from   firebase_utils   import send_notification
from   firebase_utils   import send_notification_2

# Add HX711 directory to sys.path.
# Allows to find module hx711.
#
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from HX711.HX711_Python3.hx711 import HX711    # import the class HX711

# -- HX OBJECT LOADING ---------------------------------------------------------
try:
    hx = hx_load()

# -- MAIN EXECUTION ------------------------------------------------------------

    GPIO.setmode(GPIO.BCM)
    val = hx.get_weight_mean(10)
    print(str(val) + " g")
    firebase_connect()
    send_notification()

except (KeyboardInterrupt, SystemExit):
    print('\ntest: Keyboard Interruption: stopping program')

except (RuntimeError):
    print("\ntest: Runtime Error during execution")

except Exception as e:
    print("\ntest: Other exception: " + e)

finally:
    GPIO.cleanup()

