<?php
 
/*
 * Following code will get single user details
 * A user is identified by user id (pid)
 */
 
// array for JSON response
$response = array();
 
// include db connect class
require_once __DIR__ . '/db_connect.php';
 
// connecting to db
define('DB_USER', "root"); // db user
define('DB_PASSWORD', ""); // db password (mention your db password here)
define('DB_DATABASE', "ehpad"); // database name
define('DB_SERVER', "localhost"); // db server

// connecting to db
        
// check for post data
if (isset($_GET["user"])) {
    $user = $_GET['user'];
    
    $mysqli = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
    // get a user from user table
    $result = $mysqli->query("SELECT * FROM 'user' WHERE user = '$user'");
    
 
    if (!empty($result)) {
        // check for empty result
        if (mysqli_num_rows($result) > 0) {
 
            $result = mysqli_fetch_array($result);
 
            $user = array();
            $user["id"] = $result["id"];
            $user["user"] = $result["user"];
            $user["pass"] = $result["pass"];
            $user["name"] = $result["name"];
            // success
            $response["success"] = 1;
 
            // user node
            $response["user"] = array();
 
            array_push($response["user"], $user);
 
            // echoing JSON response
            echo json_encode($response);
        } else {
            // no user found
            $response["success"] = 0;
            $response["message"] = "No user found";
 
            // echo no users JSON
            echo json_encode($response);
        }
    } else {
        // no user found
        $response["success"] = 0;
        $response["message"] = "No user found";
 
        // echo no users JSON
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

<p>Bonjour <?php echo $result . ' ' . $user; ?> !</p>
