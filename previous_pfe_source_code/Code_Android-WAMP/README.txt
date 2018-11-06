PFE - BEDSCALE

NEEDED

- WAMP (http://www.wampserver.com/) // LAMP/XAMP can be used to test 
- Android Studio (https://developer.android.com/studio/index.html)
- IDE: Netbeans // Sublime Text // ...

TO START

- Put EHPAD -> C:\wamp64\www 
- Start wamp
- Open bowser -> url = localhost -> phpmyadmin -> Import database.sql
- To test -> url = "localhost/EHPAD/get_all_resident_1.php" (If not worked, check database informations in php files like password)

You can replace "localhost" by the server IP's address (On Window -> command shell -> ipconfig)

- Open Android Studio
- Import PFE
- Change ip in url (Edit -> Find/Replace) in java/com.../MainActivity and java/com.../views/DetailsPatientActivity
- Run on a android connected to server's network

Change also IP address in raspberrys files -> PFE/examples.py or PFE/mesures.py



