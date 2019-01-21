#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import sys
import os
import json
from   log            import log
from   firebase_admin import credentials
from   firebase_admin import db
from   firebase_admin import initialize_app

# Add current directory to $PYTHONPATH
# os.path.abspath(__file__) = ~/PFE/example_calibration.py
# os.path.dirname()         = ~/PFE/
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from firebase.firebase_utils    import firebase_connect
from firebase.firebase_db_utils import update_weight

# -- MAIN EXECUTION ------------------------------------------------------------

# Initialize the app with a service account, granting admin privileges
app = firebase_connect()

# As an admin, the app has access to read and write all data, regradless of Security Rules
weights_db   = db.reference("/weights")
room_db      = db.reference("/room_patient")
patients_db  = db.reference("/patients")

weights_t   = weights_db.get()
room_t      = room_db.get()
patients_t  = patients_db.get()


