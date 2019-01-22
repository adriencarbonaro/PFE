#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import  firebase_admin
from    firebase_admin import credentials
from    firebase_admin import db

# -- API FUNCTIONS -------------------------------------------------------------

def add_weight(id_weight, id_card, timestamp_weight, value):
    weights_db = db.reference("/weights")

    weights_db.push({
        "id_weight": id_weight,
        "id_card": id_card,
        "timestamp_weight": timestamp_weight,
        "value": value
    })

def get_weights():
    weights_db = db.reference("/weights")

    weights_t = weights_db.get()

    for i in weights_t:
        print(weights_t[i])
