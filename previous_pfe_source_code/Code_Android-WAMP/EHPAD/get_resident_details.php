<?php
 
/*
 * Following code will get single resident details
 * A resident is identified by resident id (pid)
 */
 
// array for JSON response
$response = array();
 
// include db connect class
require_once __DIR__ . '/db_connect.php';

define('DB_USER', "root"); // db user
define('DB_PASSWORD', ""); // db password (mention your db password here)
define('DB_DATABASE', "ehpad"); // database name
define('DB_SERVER', "localhost"); // db server
 
// connecting to db
    $mysqli = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
 
// check for post data
if (isset($_GET["room"])) {
    $room = $_GET['room'];
 
    // get a resident from resident table
    $result = $mysqli->query("SELECT *FROM resident WHERE room = $room");
 
    if (!empty($result)) {
        // check for empty result
        if (mysqli_num_rows($result) > 0) {
 
            $result = mysqli_fetch_array($result);
 
            $resident = array();
            $resident["id"] = $result["id"];
            $resident["room"] = $result["room"];
            $resident["name"] = $result["name"];
            $resident["weight"] = $result["weight"];
            $resident["datetime"] = $result["datetime"];

            // success
            $response["success"] = 1;
 
            // resident node
            $response["resident"] = array();
 
            array_push($response["resident"], $resident);
 
            // echoing JSON response
            echo json_encode($response);
        } else {
            // no resident found
            $response["success"] = 0;
            $response["message"] = "No resident found";
 
            // echo no residents JSON
            echo json_encode($response);
        }
    } else {
        // no resident found
        $response["success"] = 0;
        $response["message"] = "No resident found";
 
        // echo no residents JSON
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
