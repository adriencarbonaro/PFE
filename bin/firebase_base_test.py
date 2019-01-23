#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import sys
import os
from   datetime import datetime

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append("/home/pi/PFE/")

from   firebase.firebase_utils   import firebase_connect
from   firebase.firebase_utils   import send_notification
from   firebase.firebase_utils   import send_notification_color
from   firebase.firebase_db_utils import add_weight
from   firebase.firebase_db_utils import get_weights

# -- MAIN EXECUTION ------------------------------------------------------------

app = firebase_connect()
# send_notification_color("#FF0000")
add_weight(0, str(datetime.now()), 77)
weights = get_weights()
for i in weights:
    print(weights[i])
# get_weights("value")
# get_weights("timestamp_weight")

