import time
import urllib
import json
import sys
import os
import socket

UDP_IP = "0.0.0.0"
UDP_PORT = 5005

valeur1 = float(0)
valeur2 = float(0)
valeur3 = float(0)
valeur4 = float(0)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))



room = "101"
name = "1010"
res_name = "Jean Dupont"

def check_start():
        url_value = 'http://192.168.137.1:80/EHPAD/get_get_value_by_room.php?room=%s' %(room)

        data = json.loads(urllib.urlopen(url_value).read())
        if(str(data["rpis"][0]["get_value"]) == "Yes"):
                print('Start')
                return True

def cleanAndExit():
        print "Cleaning..."
        print "Bye !"
        sys.exit()
        
while True :
        try:

                time.sleep(5)

                while(check_start()):
                        
                #jerry = open ("/home/pi/PFE/Donnees_clients/jerry.txt", "w")
                #jerry.write("100")
                #jerry.close()
                        
                        data, addr = sock.recvfrom(1024)
                        print "received message:", addr
                        if '192.168.137.12' in addr:
                                valeur4 = float(data)
                                print "val4"
                        elif '192.168.137.11' in addr:
                                valeur3 = float(data)
                                print "val3"

                
                #mesures1 = open ("/home/pi/PFE/Donnees_clients/mesures1.txt", "r")
                #mesures2 = open ("/home/pi/PFE/Donnees_clients/mesures2.txt", "r")
                

                #contenu1 = mesures1.read()
                #contenu2 = mesures2.read()
                #contenu3 = mesures3.read()

                #mesures1.close()
                #mesures2.close()

                #valeur1 = float(contenu1)
                #valeur2 = float(contenu2)
                #valeur3 = float(contenu3)

                        valeur = valeur1 + valeur2 + valeur3 + valeur4
                        print "Poids du resident : ", str(valeur)


                #mesures = open ("/home/pi/PFE/Donnees_clients/mesures.txt" , "w")

                        valeur_string = str(valeur)

                #mesures.write(valeur_string)

                #mesures.close()

                #os.system('sudo scp -i ~/.ssh/id_rsa pi@192.168.137.12:/home/pi/PFE/mesures2.txt /home/pi/PFE/Donnees_clients/')

                        url = 'http://192.168.137.1:80/EHPAD/create_resident.php?room=%s&name=%s&weight=%s' %(room, res_name, valeur_string)
                        urllib.urlopen(url)
                
                

        except (KeyboardInterrupt, SystemExit):
                cleanAndExit()
