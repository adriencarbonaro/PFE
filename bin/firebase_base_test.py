#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import sys
import os
from   datetime import date

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append("/home/pi/PFE/")

from   firebase.firebase_utils   import firebase_connect
from   firebase.firebase_utils   import send_notification
from   firebase.firebase_db_utils import add_weight
from   firebase.firebase_db_utils import get_weights

# -- MAIN EXECUTION ------------------------------------------------------------

app = firebase_connect()
add_weight(0, int(date.today().strftime("%Y%m%d")), 77.89)
weights = get_weights()
for i in weights:
    print(weights[i])
# get_weights("value")
# get_weights("timestamp_weight")

