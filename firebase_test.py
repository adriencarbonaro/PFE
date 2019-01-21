#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import sys
import os
import RPi.GPIO     as     GPIO     # import GPIO
from   time         import sleep
import pickle
from   calibration      import calibrate
from   hx_loader        import hx_load

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from HX711.HX711_Python3.hx711 import HX711    # import the class HX711
from firebase.firebase_utils   import firebase_connect
from firebase.firebase_utils   import send_notification
from firebase.firebase_utils   import send_notification_color
from firebase.firebase_db_utils import add_weight

# -- HX OBJECT LOADING ---------------------------------------------------------
try:
    hx = hx_load()

# -- MAIN EXECUTION ------------------------------------------------------------

    GPIO.setmode(GPIO.BCM)
    val = hx.get_weight_mean(10)
    print(str(val) + " g")
    app = firebase_connect()
    send_notification()
    add_weight(2, 0, "22012019", val)
    

except (KeyboardInterrupt, SystemExit):
    print('\ntest: Keyboard Interruption: stopping program')

except (RuntimeError):
    print("\ntest: Runtime Error during execution")

except Exception as e:
    print("\ntest: Other exception: " + e)

finally:
    GPIO.cleanup()

