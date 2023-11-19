<?php
require "bdconnect.php";
if ($statut == "succes") {
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $sql = "DELETE FROM RatVol WHERE NumRatV = $id";
        if ($mysqli->query($sql) === TRUE) {
            header("Location: index.php"); 
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    } else {
        echo "ID parameter is missing.";
    }
} else {
    echo $statut;
}
?>