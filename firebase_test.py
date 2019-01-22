#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import sys
import os
import decimal
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

# -- CONSTANTS -----------------------------------------------------------------
ROOM_NB      = 0
WEIGHT_LIMIT = 3000.0

# -- HX OBJECT LOADING ---------------------------------------------------------
try:
    hx = hx_load()

# -- MAIN EXECUTION ------------------------------------------------------------

    GPIO.setmode(GPIO.BCM)

    val       = hx.get_weight_mean(10)
    round_val = decimal.Decimal(val).quantize(decimal.Decimal('.01'), rounding = decimal.ROUND_DOWN)

    print(str(round_val) + " g")
    print(str(round_val / 1000) + " kg")

    app = firebase_connect()

    if ( val < WEIGHT_LIMIT):
        send_notification("Weight too low", str(round_val / 1000) + " kg (room " + str(ROOM_NB) + ")")

    add_weight(2, ROOM_NB, "22012019", round_val / 1000)
    

except (KeyboardInterrupt, SystemExit):
    print('\ntest: Keyboard Interruption: stopping program')

except (RuntimeError):
    print("\ntest: Runtime Error during execution")

except Exception as e:
    print("\ntest: Other exception: " + e)

finally:
    GPIO.cleanup()

