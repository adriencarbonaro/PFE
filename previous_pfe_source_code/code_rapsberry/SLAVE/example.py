import RPi.GPIO as GPIO
import time
import sys
import os
import json
import urllib
from hx711 import HX711
import socket

#Def socket
UDP_IP = "192.168.137.10"
UDP_PORT = 5005
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

def cleanAndExit():
    print "Cleaning..."
    GPIO.cleanup()
    print "Bye!"
    sys.exit()

time.sleep(5)

hx = HX711(21, 20)

# I've found out that, for some reason, the order of the bytes is not always the same between versions of python, numpy and the hx711 itself.
# Still need to figure out why does it change.
# If you're experiencing super random values, change these values to MSB or LSB until to get more stable values.
# There is some code below to debug and log the order of the bits and the bytes.
# The first parameter is the order in which the bytes are used to build the "long" value.
# The second paramter is the order of the bits inside each byte.
# According to the HX711 Datasheet, the second parameter is MSB so you shouldn't need to modify it.
hx.set_reading_format("LSB", "MSB")

# HOW TO CALCULATE THE REFFERENCE UNIT
# To set the reference unit to 1. Put 1kg on your sensor or anything you have and know exactly how much it weights.
# In this case, 92 is 1 gram because, with 1 as a reference unit I got numbers near 0 without any weight
# and I got numbers around 184000 when I added 2kg. So, according to the rule of thirds:
# If 2000 grams is 184000 then 1000 grams is 184000 / 2000 = 92.
#hx.set_reference_unit(113)
hx.set_reference_unit(-131)

hx.reset()
hx.tare()

room = "101"
name = "1011"
res_name = "Jean Dupont"

def check_start():
    url_value = 'http://192.168.137.1:80/EHPAD/get_get_value_by_room.php?room=%s' %(room)
        
    data = json.loads(urllib.urlopen(url_value).read())
    if(str(data["rpis"][0]["get_value"]) == "Yes"):
        print('Start')
        return True
    
def check_4_tare():
    url_tare = 'http://192.168.137.1:80/EHPAD/get_tare_by_room.php?room=%s' %(room)
        
    data = json.loads(urllib.urlopen(url_tare).read())
    if(str(data["rpis"][0]["tare"]) == "No" and str(data["rpis"][1]["tare"]) == "No" and str(data["rpis"][2]["tare"]) == "No" and str(data["rpis"][3]["tare"]) == "No"):
        return True

def rcv_tare():
    url_tare = 'http://192.168.137.1:80/EHPAD/get_tare_by_room.php?room=%s' %(room)
        
    data = json.loads(urllib.urlopen(url_tare).read())
    if(str(data["rpis"][1]["tare"]) == "Yes"):
        hx.tare()
        print('Tare success')
        time.sleep(1)
        url = 'http://192.168.137.1:80/EHPAD/update_rpi_tare_room.php?room="%s"&tare="No"' %(room)
        urllib.urlopen(url)
        while(check_4_tare() == False):
            print('Wait')

while True:
    try:
        # These three lines are usefull to debug wether to use MSB or LSB in the reading formats
        # for the first parameter of "hx.set_reading_format("LSB", "MSB")".
        # Comment the two lines "val = hx.get_weight(5)" and "print val" and uncomment the three lines to see what it prints.
        #np_arr8_string = hx.get_np_arr8_string()
        #binary_string = hx.get_binary_string()
        #print binary_string + " " + np_arr8_string
        rcv_tare()
        
        while(check_start()):
            rcv_tare()
        #url_ = 'http://192.168.137.1:80/EHPAD/get_get_value_by_room.php?room=%s' %(room)
        
        # Prints the weight. Comment if you're debbuging the MSB and LSB issue.
            val = hx.get_weight(5)/100.00
            print val
            string_val = str(val)

        #Ecriture des resultats dans un fichier txt
            fichier_val = open("/home/pi/PFE/mesures2.txt" , "w") #ouverture fichier
            fichier_val.write(str(val)) #ecriture dans txt
            fichier_val.close() #fermture fichier
        
        #Envoie de la mesure a la Rpi Master par socket UDP
        #os.system('sudo scp -v -i ~/.ssh/id_rsa /home/pi/PFE/mesures2.txt pi@192.168.137.10:/home/pi/PFE/Donnees_clients/')
        #os.system('./home/PFE/CommandeSend')
       
            sock.sendto(string_val,(UDP_IP, UDP_PORT))
        
        
        #Envoie de la mesure a l application
            #url = 'http://192.168.137.1:80/EHPAD/create_resident.php?room=%s&name=%s&weight=%s' %(room, res_name, str(val))
            #urllib.urlopen(url)
        
            time.sleep(1)
            hx.power_down()
            hx.power_up()
    except (KeyboardInterrupt, SystemExit):
        cleanAndExit()
