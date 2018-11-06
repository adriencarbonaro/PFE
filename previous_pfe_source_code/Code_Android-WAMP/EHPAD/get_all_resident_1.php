<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>

<?php
 
/*
 * Following code will list all the products
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

$mysqli = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
 
// get all products from products table
$result = $mysqli->query("SELECT *FROM resident ORDER BY room") or die(mysqli_error());
 
// check for empty result
if (mysqli_num_rows($result) > 0) {
    // looping through all results
    // products node
    $response["residents"] = array();
 
    while ($row = mysqli_fetch_array($result)) {
        // temp user array
        $product = array();
        $resident["id"] = $row["id"];
        $resident["room"] = $row["room"];
        $resident["name"] = $row["name"];
        $resident["weight"] = $row["weight"];
        $resident["datetime"] = $row["datetime"];
 
        // push single product into final response array
        array_push($response["residents"], $resident);
    }
    // success
    $response["success"] = 1;
 
    // echoing JSON response
    json_encode($response);
} else {
    // no products found
    $response["success"] = 0;
    $response["message"] = "No products found";
 
    // echo no users JSON
    echo json_encode($response);
}
?>

<table class="table table-striped">
            <?php
            $cpt = 0;
            echo '<tr>';
            echo '<th class="col-md-2"><div class="text-center"> ID  </div></th>';
            echo '<th class="col-md-2"><div class="text-center"> ROOM  </div></th>';
            echo '<th class="col-md-2"><div class="text-center"> NAME  </div></th>';
            echo '<th class="col-md-2"><div class="text-center"> WEIGHT  </div></th>';
            echo '<th class="col-md-2"><div class="text-center"> DATETIME  </div></th>';
            echo '</tr>';
            foreach ($response["residents"] as $value) {
                echo '<tr>';
                    echo '<td><div class="text-center">' . $response["residents"][$cpt]['id'] . ' </div></td>';
                    echo '<td><div class="text-center">' . $response["residents"][$cpt]['room'] . ' </div></td>';
                    echo '<td><div class="text-center">' . $response["residents"][$cpt]['name'] . ' </div></td>';
                    echo '<td><div class="text-center">' . $response["residents"][$cpt]['weight'] . ' </div></td>';
                    echo '<td><div class="text-center">' . $response["residents"][$cpt]['datetime'] . ' </div></td>';
                    echo '</tr>';
                $cpt++;
            }
            ?>
</table>



