#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import json
import  firebase_admin
from    firebase_admin import initialize_app
from    firebase_admin import credentials
from    firebase_admin import messaging

# -- CONSTANTS -----------------------------------------------------------------

CRED_FILE       = "/home/pi/PFE/firebase/firebase_cred.json"
DB_OPTIONS_FILE = "/home/pi/PFE/firebase/firebase_db_options.json"

# -- API TOKENS ----------------------------------------------------------------

# This registration token comes from the client FCM SDKs.
registration_token = 'fHl7ucWN6ls:APA91bFNufuUATOoAJItaFeogKTyemQmebFxXNP6JLFVYhQiisChtJAs_YB7PESSP11jOuC5_hye7AZucw7-aFmuOiRFmmImOb8VayGh9Fjyj6FGY-J_MdZfYgAwX-Yf5opnzcTsNPDK'
# registration_token = 'fqtRUhSOqUI:APA91bGSfdTkXsmiPlE1EGS99jLJZSj-IZMWrAX7oe4V3eCsjUZOwE0LryToG5-bqU2ECB7RUqL17xU_EwjhypvTE1Or679wzMG8W32EPqNB56SO0GpO7P4ABfdczTngxzkrFyi5BqIn'

# -- API FUNCTIONS -------------------------------------------------------------

##
# @brief    Connect to Firebase Admin API.
#           Necessary to send notifications.
def firebase_connect():
    with open(DB_OPTIONS_FILE) as f:
        options = json.load(f)

    cred = credentials.Certificate(CRED_FILE)
    app  = initialize_app(cred, options)

    return app

##
# @brief        Send a Notification.
#
# @param title          The notification headline.
# @param body           The notification message.
# @param notif_color    The notification color on the phone.
def send_notification(notif_title='default_title', notif_body='default_body', notif_color='#00FFFF'):
    # See documentation on defining a message payload.
    message = messaging.Message(
        android=messaging.AndroidConfig(
            notification=messaging.AndroidNotification(
                title=notif_title,
                body=notif_body,
                color=notif_color,
                # click_action="OPEN_ACTIVITY_1"
            ),
        ),
        token=registration_token
    )
    response = messaging.send(message)
    print('Successfully sent message:', response)
