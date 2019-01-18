#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import  firebase_admin
from    firebase_admin import credentials
from    firebase_admin import db

# -- API FUNCTIONS -------------------------------------------------------------

def update_weight(ref, patient="patient_1", weight="60"):
    ref.child(patient).update({
        "weight": weight
    })
