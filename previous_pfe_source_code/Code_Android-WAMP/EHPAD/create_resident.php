<?php
 
/*
 * Following code will create a new product row
 * All product details are read from HTTP Post Request
 */
 
// array for JSON response
$response = array();
 /*isset($_POST['room']) && isset($_POST['name']) && isset($_POST['weight']) && isset($_POST['datetime']*/
// check for required fields
if (1>0) {
    
    define('DB_USER', "root"); // db user
define('DB_PASSWORD', ""); // db password (mention your db password here)
define('DB_DATABASE', "ehpad"); // database name
define('DB_SERVER', "localhost"); // db server

// connecting to db
       $mysqli = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    date_default_timezone_set('Europe/London');

    $room = $_GET['room'];
    $name = $_GET['name'];
    $weight = $_GET['weight'];
    $datetime = date('Y/m/d H:i:s');

    // include db connect class
    require_once __DIR__ . '/db_connect.php';
 
    
 
    // mysql inserting a new row
    $result = $mysqli->query("INSERT INTO resident(room, name, weight, datetime) VALUES('$room', '$name', '$weight', '$datetime')");
 
    // check if row inserted or not
    if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "Product successfully created.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // failed to insert row
        $response["success"] = 0;
        $response["message"] = "Oops! An error occurred.";
 
        // echoing JSON response
        echo json_encode($response);
    }
} else {
    // required field is missing
    $response["success"] = 0;
    $response["message"] = "Required field(s) is missing";
 
    // echoing JSON response
    echo json_encode($response);
}
?>

