#!/usr/bin/env python3

# -- IMPORTS ------------------------------------------------------------------- 

import json
import  firebase_admin
from    firebase_admin import initialize_app
from    firebase_admin import credentials
from    firebase_admin import messaging

# -- API TOKENS ----------------------------------------------------------------

# This registration token comes from the client FCM SDKs.
registration_token = 'fqDqjh8MnLw:APA91bGQ-PVtnRPGij6PaHGq6BCq_F6Tq9C8mZJVzfiUpdp9ezmdIJNvjXu2raZ0Uqq7agScuo9K7AAq7VQeufhvrWLWegJXRF-inMIImAzZtz9wHeaZVtdLGKF52_ZqaFsX0Mbh2tyl'
# registration_token = 'fqtRUhSOqUI:APA91bGSfdTkXsmiPlE1EGS99jLJZSj-IZMWrAX7oe4V3eCsjUZOwE0LryToG5-bqU2ECB7RUqL17xU_EwjhypvTE1Or679wzMG8W32EPqNB56SO0GpO7P4ABfdczTngxzkrFyi5BqIn'

# -- API FUNCTIONS -------------------------------------------------------------

##
# @brief    Connect to Firebase Admin API.
#           Necessary to send notifications.
def firebase_connect():
    with open('firebase/firebase_db_options.json') as f:
        options = json.load(f)

    cred = credentials.Certificate('firebase/firebase_cred.json')
    app  = initialize_app(cred, options)

    return app

##
# @brief        Send a Notification.
#
# @param title  The notification headline.
# @param body   The notification message.
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

##
# @brief        Send a Notification with a custom icon color.
#
# @param title  The notification headline.
# @param body   The notification message.
def send_notification_color(notif_title='default_title', notif_body='default_body', notif_color="#FF0000"):
    message = messaging.Message(
        android=messaging.AndroidConfig(
            notification=messaging.AndroidNotification(
                title=notif_title,
                body=notif_body,
                color=notif_color,
                click_action="OPEN_ACTIVITY_1"
            ),
        ),
        token=registration_token
    )
    response = messaging.send(message)
    print('Successfully sent message:', response)
