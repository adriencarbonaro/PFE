#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import  sys
import  os
import  decimal
import  RPi.GPIO    as     GPIO     # import GPIO
from    time        import sleep
from    datetime    import date

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
from calibration                import calibrate
from hx_loader                  import hx_load
from HX711.HX711_Python3.hx711  import HX711    # import the class HX711
from firebase.firebase_utils    import firebase_connect
from firebase.firebase_utils    import send_notification
from firebase.firebase_db_utils import get_weights
from firebase.firebase_db_utils import add_weight

# -- CONSTANTS -----------------------------------------------------------------
ROOM_NB           = 0
WEIGHT_DIFF_LIMIT = 2.0
LED_PIN           = 26

# -- HX OBJECT LOADING ---------------------------------------------------------
try:
    hx1 = hx_load(21, 20, "/home/pi/PFE/swap_file_1.swp")
    hx2 = hx_load(11, 10, "/home/pi/PFE/swap_file_2.swp")

# -- MAIN EXECUTION ------------------------------------------------------------

    GPIO.setmode(GPIO.BCM)
    GPIO.setup(LED_PIN, GPIO.OUT)
    GPIO.output(LED_PIN, True)
    val1  = hx1.get_weight_mean()
    val2  = hx2.get_weight_mean()
    GPIO.output(LED_PIN, False)
    if (val1 < 0):
        val1 = 0
    if (val2 < 0):
        val2 = 0
    val = ( val1 + val2 ) / 2
    round_val = float(decimal.Decimal(val).quantize(decimal.Decimal('.01'), rounding = decimal.ROUND_DOWN))
    new_weight = round_val / 1000

    print(str(round_val) + " g")
    print(str(new_weight) + " kg")
   
    # Get weights database.
    app = firebase_connect()
    weights_t = get_weights()

    # Get last weight for room with number ROOM_NB.
    last_id_weight = 0
    last_weight    = 0
    for i in weights_t:
        if (weights_t[i]["id_card"] == ROOM_NB and weights_t[i]["id_weight"] > last_id_weight):
            last_id_weight = weights_t[i]["id_weight"]
            last_weight    = weights_t[i]["value"]

    # Check difference with previous weight.
    # Send notification if difference is above limit.
    if (abs(new_weight - last_weight) > WEIGHT_DIFF_LIMIT):
        send_notification("Large weight difference", str(new_weight) + " kg (room " + str(ROOM_NB) + ")")
    else:
        print(abs(new_weight - last_weight))

    # Add weight to database
    add_weight(ROOM_NB, int(date.today().strftime("%Y%m%d")), new_weight)
    

except (KeyboardInterrupt, SystemExit):
    print('\ntest: Keyboard Interruption: stopping program')

except (RuntimeError):
    print("\ntest: Runtime Error during execution")

except Exception as e:
    print("\ntest: Other exception: " + str(e))

finally:
    GPIO.cleanup()

