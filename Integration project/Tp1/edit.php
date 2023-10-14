<?php
require "bdconnect.php";
if ($statut == "succes") {
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $query = "SELECT * FROM RatVol WHERE NumRatV = $id";
        $result = $mysqli->query($query);
    
        if ($result) {
            $row = $result->fetch_assoc();
        } else {
            echo "Error: " . $mysqli->error;
        }
    } else {
        echo "No 'id' parameter provided.";
    }
} else {
  echo $statut;
}
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>