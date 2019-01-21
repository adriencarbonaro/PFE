#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import sys
import os

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from   firebase.firebase_utils   import firebase_connect
from   firebase.firebase_utils   import send_notification
from   firebase.firebase_utils   import send_notification_color

# -- MAIN EXECUTION ------------------------------------------------------------

firebase_connect()
send_notification_color("#FF0000")

