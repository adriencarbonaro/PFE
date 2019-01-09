#! /usr/bin/env python3
# coding: utf-8

# -- IMPORTS ------------------------------------------------------------------- 

import sys                      # Librairie standard fonctions systeme
import os
import time                     # Librairie standard time
import datetime

import mysql.connector 
from mysql.connector import errorcode

import RPi.GPIO as GPIO         # Librairie de gestion des E/S de la Raspberry

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from HX711.HX711_Python3.hx711  import HX711
from calibration                import calibrate
from hx_loader                  import hx_load

# -- DB VARIABLES --------------------------------------------------------------

HOST    =  "localhost"
USER    =  "adrien"
PASSWD  =  "adrien"
DB      =  "EHPAD"

# -- FUNCTIONS -----------------------------------------------------------------

def sendDB(id_room, weight, timestamp):
    """Save measures to EHPAD DB with a timestamp and the room ID"""
    print("Opening EHPAD DB")
    cnx = mysql.connector.connect(host="localhost",user="adrien",password="adrien", database="EHPAD")
    cursor = cnx.cursor()
    add_mesure = ("INSERT INTO Weights "
                  "(id_room, weight, timestamp) "
                  "VALUES (%s, %s, %s)")
    data_mesure = (id_room, weight, timestamp)
    cursor.execute(add_mesure, data_mesure)
    cnx.commit()

# -- MAIN FUNCTION -------------------------------------------------------------

def main():
    hx = hx_load()

    weight = hx.get_weight_mean(10)
    timestamp = datetime.datetime.now()
    id_room = 1
    sendDB(id_room, weight, timestamp)

# -- MAIN EXECUTION ------------------------------------------------------------
if __name__ == "__main__":
    try:
        main()

    except (KeyboardInterrupt, SystemExit):
        print('\nDB_test: Keyboard Interruption: stopping program')

    except (RuntimeError):
        print("\nDB_test: Runtime Error during execution")

    except Exception as e:
        print("\nDB_test: Other exception: " + e)

    finally:
        GPIO.cleanup()
        sys.exit()
