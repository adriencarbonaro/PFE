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

with open('firebase/firebase_db_options.json') as f:
    data = json.load(f)

cred     =  credentials.Certificate('firebase/firebase_cred.json')
options  =  data

# Initialize the app with a service account, granting admin privileges
initialize_app(cred, options)

# As an admin, the app has access to read and write all data, regradless of Security Rules
ref = db.reference("/patients")

update_weight(ref, weight=79)

patient_table = ref.get()

for i in patient_table:
    log(patient_table[i]["first_name"] + " " + patient_table[i]["name"] + " :", str(patient_table[i]["weight"]) + " kg")
    print()
