#!/usr/bin/env python3

import  firebase_admin
from    firebase_admin import credentials
from    firebase_admin import messaging

# This registration token comes from the client FCM SDKs.
registration_token = 'dTahG-Pwjf4:APA91bFMd7bSWwO0EBHrOl3nunkWNqrITzBUTY-FUOicWWouEO5BuvKSz-Y2haRG5GazGYCp6YPAA6ucs2RmBhW3WEPNlX2gwCbjBemghGD-SLpXfdly-yCFWPU-ObuXzBA21--xjeyC'
# registration_token = 'fqtRUhSOqUI:APA91bGSfdTkXsmiPlE1EGS99jLJZSj-IZMWrAX7oe4V3eCsjUZOwE0LryToG5-bqU2ECB7RUqL17xU_EwjhypvTE1Or679wzMG8W32EPqNB56SO0GpO7P4ABfdczTngxzkrFyi5BqIn'

##
# @brief    Connect to Firebase Admin API.
#           Necessary to send notifications.
def firebase_connect():
    cred = credentials.Certificate('./firebase_admin_sdk.json')
    default_app = firebase_admin.initialize_app(cred)

##
# @brief        Send a Notification.
#
# @param title  The notification headline.
# @param body   The notification message.
def send_notification(notif_title='default_title', notif_body='default_body'):
    # See documentation on defining a message payload.
    message = messaging.Message(
        notification=messaging.Notification(
            title=notif_title,
            body=notif_body,
        ),
        token=registration_token
    )

    response = messaging.send(message)
    
    print('Successfully sent message:', response)
