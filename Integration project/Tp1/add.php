<?php
require "bdconnect.php";
$errors = [];
if ($statut == "succes" && $_SERVER["REQUEST_METHOD"] == "POST") {
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
    $header = "addForm";

    saisieControl($NumRatV,$MatProf,$DateRat,$Seance,$Session,$Salle,$Jour,$CodeClasse,$CodeMatiere,$header);
    
    $insertQuery = "INSERT INTO RatVol (NumRatV, MatProf, DateRat, Seance, Session, Salle, Jour, CodeClasse, CodeMatiere, Etat) 
        VALUES ('$NumRatV', '$MatProf', '$DateRat', '$Seance', '$Session', '$Salle', '$Jour', '$CodeClasse', '$CodeMatiere', b'$Etat')";
    if ($mysqli->query($insertQuery) === TRUE) {
        header("Location: index.php");
    } else {
        echo "Error adding record: " . $mysqli->error;
    }
} else {
    echo "Invalid request method or status.";
}
?>