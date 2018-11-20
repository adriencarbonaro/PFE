from hx711 import HX711
import time

hx = HX711(21, 20)

while(1):
    val = hx.get_weight(5)/100.0
    print("Weight: " + str(val))
    time.sleep(1)
