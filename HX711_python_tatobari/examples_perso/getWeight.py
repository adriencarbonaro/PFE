#!/usr/bin/python3

# TODO: find out the functioning of HX711() and get_weight

from hx712 import HX711
import time

hx = HX711(21, 20)

while(1):
    val = hx.get_weight(5)
    print("Weight: " + str(val))
    time.sleep(1)
