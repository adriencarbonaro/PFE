#!/usr/bin/env python3

# -- IMPORTS -------------------------------------------------------------------

import sys
import os
import RPi.GPIO     as     GPIO     # import GPIO
from   time         import sleep
import pickle
from   calibration  import calibrate
# Add HX711 directory to sys.path.
# Allows to find module hx711.
#
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from HX711.HX711_Python3.hx711 import HX711    # import the class HX711

# -- HX OBJECT LOADING ---------------------------------------------------------
def hx_load():
    try:
        # Create an object hx which represents your real hx711 chip
        # Required input parameters are only 'dout_pin' and 'pd_sck_pin'
        # If you do not pass any argument 'gain_channel_A' then the default value is 128
        # If you do not pass any argument 'set_channel' then the default value is 'A'
        # you can set a gain for channel A even though you want to currently select channel B
        GPIO.setmode(GPIO.BCM)
        hx = HX711(dout_pin=21, pd_sck_pin=20, gain_channel_A=64)
        # Check if we have swap file. If yes that suggest that the program was not
        # terminated proprly (power failure). We load the latest state.
        swap_file_name = 'swap_file.swp'
        if os.path.isfile(swap_file_name):
            with open(swap_file_name, 'rb') as swap_file:
                # now we loaded the state before the Pi restarted.
                hx = pickle.load(swap_file)
        else:
            hx = calibrate()

        return hx

    except (KeyboardInterrupt, SystemExit):
        print('\nhx_loader: Keyboard Interruption: stopping program')

    except (RuntimeError):
        print("\nhx_loader: Runtime Error during execution")

    except Exception as e:
        print("\nhx_loader: Other exception: " + e)
