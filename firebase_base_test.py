#!/usr/bin/env python3

import sys
import os
from   firebase_utils   import firebase_connect
from   firebase_utils   import send_notification
from   firebase_utils   import send_notification_color

# -- MAIN EXECUTION ------------------------------------------------------------

firebase_connect()
send_notification_color("#ff0000")

