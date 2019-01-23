#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import  firebase_admin
from    firebase_admin import credentials
from    firebase_admin import db

# -- API FUNCTIONS -------------------------------------------------------------

def add_weight(id_card, timestamp_weight, value):
    # Get Firebase Realtime Database.
    weights_db = db.reference("/weights")
    weights_t = get_weights()
    
    # Get last id_weight to increment it.
    last_id_weight = 0
    for i in weights_t:
        if (weights_t[i]["id_weight"] > last_id_weight):
            last_id_weight = weights_t[i]["id_weight"]

    # Push data to Firebase Realtime Database.
    weights_db.push({
        "id_weight": (last_id_weight + 1),
        "id_card": id_card,
        "timestamp_weight": timestamp_weight,
        "value": value
    })

def get_weights(sort="id_weight"):
    weights_db = db.reference("/weights")
    if (sort == "id_weight"):
        weights_t = weights_db.order_by_child('id_weight').get()
    elif (sort == "timestamp_weight"):
        weights_t = weights_db.order_by_child('timestamp_weight').get()
    elif (sort == "value"):
        weights_t = weights_db.order_by_child('value').get()

    return weights_t
