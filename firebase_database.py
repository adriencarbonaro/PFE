#!/usr/bin/env python3

import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_utils import firebase_connect

cred = credentials.Certificate('./firebase_admin_sdk.json')

# Initialize the app with a service account, granting admin privileges
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://detect-n-alert.firebaseio.com/'
})

# As an admin, the app has access to read and write all data, regradless of Security Rules
ref = db.reference('restricted_access/secret_document')
print(ref.get())
