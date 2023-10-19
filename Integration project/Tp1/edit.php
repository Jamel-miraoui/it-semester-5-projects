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
    $header = "editForm";

    saisieControl($NumRatV,$MatProf,$DateRat,$Seance,$Session,$Salle,$Jour,$CodeClasse,$CodeMatiere,$header);
    
    $updateQuery = "UPDATE RatVol SET
        MatProf = '$MatProf' , 
        Seance = '$Seance',
        DateRat = '$DateRat',
        Session = '$Session'  ,
        Salle = '$Salle' , 
        Jour = '$Jour' , 
        CodeClasse = '$CodeClasse' , 
        CodeMatiere = '$CodeMatiere',
        Etat = b'$Etat'
        WHERE NumRatV = $NumRatV";

    if ($mysqli->query($updateQuery) === TRUE) {
        header("Location: index.php");
    } else {
        echo "Error updating record: " . $mysqli->error;
    }
} else {
    echo $statut;
}
?>
