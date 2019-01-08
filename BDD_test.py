#! /usr/bin/env python3
# coding: utf-8

# ---------------  LIBRAIRIES  --------------------------------------- 
import sys                      # Librairie standard fonctions systeme
import os
import time                     # Librairie standard time
import datetime

import mysql.connector 
from mysql.connector import errorcode

import RPi.GPIO as GPIO         # Librairie de gestion des E/S de la Raspberry

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from HX.HX711_Python3.hx711     import HX711
from calibration                import calibrate

# -- DB variables ----------------------------------------------------------------

HOST    =  "localhost"
USER    =  "adrien"
PASSWD  =  "adrien"
DB      =  "EHPAD"

# -- Fonctions -------------------------------------------------------------------

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

# -- Main function ------------------------------------------------------------

def main():
    hx = calibrate()

    print("Main loop")
    while True:
        val = hx.get_weight_mean(10)
        timestamp = datetime.datetime.now()
        sendDB(id_room, weight, timestamp)

# -- Main execution ------------------------------------------------------------
if __name__ == "__main__":
    try:
        main()
    except(KeyboardInterrupt, SystemExit):
        print("\nEnd of execution") 
    finally:
        GPIO.cleanup()
        sys.exit()
