<?php
 
/*
 * Following code will create a new product row
 * All product details are read from HTTP Post Request
 */
 
// array for JSON response
$response = array();
 
// check for required fields
if (1>0) {
 
    /*$user = $_POST['user'];
    $pass = $_POST['pass'];
    $name = $_POST['name'];*/
    
    define('DB_USER', "root"); // db user
define('DB_PASSWORD', ""); // db password (mention your db password here)
define('DB_DATABASE', "ehpad"); // database name
define('DB_SERVER', "localhost"); // db server
    
    $user = $_GET['user'];
    $pass = $_GET['pass'];
    $name = $_GET['name'];
 
    // include db connect class
    require_once __DIR__ . '/db_connect.php';
    
        $mysqli = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

 
 
    // mysql inserting a new row
    $result = $mysqli->query("INSERT INTO user(user, pass, name) VALUES('$user', '$pass', '$name')");
    
 
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

<p>Bonjour <?php echo $_GET['user'] . ' ' . $_GET['pass']; ?> !</p>
