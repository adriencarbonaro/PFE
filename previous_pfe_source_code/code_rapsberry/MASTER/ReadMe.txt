In the 'Donnees_clients' folder you can find the python code needed to properly run the RPi Master(the one receiving the data and sending to the data base)
The code is nammed 'mesures.py'
Make sure to allow it to run directly when the Rpi starts:
	edit the 'rc.local' script in /etc and add 'python /path/mesures.py' followed with 'exit 0'