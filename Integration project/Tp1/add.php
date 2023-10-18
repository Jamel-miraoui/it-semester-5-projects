<?php
require "bdconnect.php";
if ($statut == "succes") {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $NumRatV = $_POST["NumRatV"];
        $MatProf = $_POST["MatProf"];
        $DateRat = $_POST["DateRat"];
        $Seance = $_POST["Seance"];
        $Session = $_POST["Session"];
        $Salle = $_POST["Salle"];
        $Jour = $_POST["Jour"];
        $CodeClasse = $_POST["CodeClasse"];
        $CodeMatiere = $_POST["CodeMatiere"];
        $Etat = $_POST["Etat"];
        if (32767 < $MatProf || -32767 > $MatProf){
            header("Location: index.php"); 
            echo "MatProf is  a small int  you need to enter a number betwenn 32767 and -32767"; 
        }
        $insertQuery = "INSERT INTO RatVol (NumRatV, MatProf, DateRat, Seance, Session, Salle, Jour, CodeClasse, CodeMatiere, Etat) 
            VALUES ('$NumRatV', '$MatProf', '$DateRat', '$Seance', '$Session', '$Salle', '$Jour', '$CodeClasse', '$CodeMatiere', b'$Etat')";
        if ($mysqli->query($insertQuery) === TRUE) {
            header("Location: index.php"); 
        } else {
            echo "Error adding record: " . $mysqli->error;
        }
    } else {
        echo "Invalid request method. This page should be accessed via a POST request.";
    }
} else {
    echo $statut;
}
?>