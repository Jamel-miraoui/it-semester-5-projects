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

    if (!is_numeric($MatProf) || $MatProf > 32767 || $MatProf < -32767) {
        $errors[] = "MatProf is not within the valid range. You need to enter a number between -32767 and 32767.";
    }
    if (!strtotime($DateRat)) {
        $errors[] = "DateRat is not in a valid datetime format (YYYY-MM-DD HH:MM:SS).";
    }
    if (!is_numeric($Session) || $Session <= 0) {
        $errors[] = "Session should be a positive integer.";
    }
    if (strlen($Seance) > 10) {
        $errors[] = "Seance should not exceed 10 characters.";
    }
    if (strlen($Salle) > 10) {
        $errors[] = "Salle should not exceed 10 characters.";
    }
    if (strlen($Jour) > 10) {
        $errors[] = "Jour should not exceed 10 characters.";
    }
    if (strlen($CodeClasse) > 9) {
        $errors[] = "CodeClasse should not exceed 9 characters.";
    }
    if (strlen($CodeMatiere) > 10) {
        $errors[] = "CodeMatiere should not exceed 10 characters.";
    }

    if (!empty($errors)) {
        $errorMessages = implode(',', $errors);
        header("Location: editForm.php?errors=" . urlencode($errorMessages));
        exit;
    }
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
    echo "Invalid request method or status.";
}
?>
