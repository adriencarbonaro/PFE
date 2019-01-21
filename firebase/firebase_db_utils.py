#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import  firebase_admin
from    firebase_admin import credentials
from    firebase_admin import db

# -- API FUNCTIONS -------------------------------------------------------------

def add_weight(weight_db, id_weight, id_card, timestamp_weight, value):
    weight_db.set({
        "id_weight": id_weight,
        "id_card": id_card,
        "timestamp_weight": timestamp_weight,
        "value": value
    })
