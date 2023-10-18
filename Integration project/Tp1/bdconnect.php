<?php
$host = "localhost";
$user = "root";
$password = "root";
$database = "Scolarite";
$mysqli = new mysqli($host, $user, $password, $database);
$statut = "Not Connected";

if ($mysqli->connect_errno) {
  $statut =  "Failed to connect to MySQL: " . $mysqli->connect_error;
  exit();
} else {
  $statut = "succes";
}

function saisieControl($NumRatV,$MatProf, $DateRat, $Session, $Seance, $Salle, $Jour, $CodeClasse, $CodeMatiere , $header)
{
  $id = $NumRatV ; 
  $errors = array();
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
    header("Location: $header.php?errors=" . urlencode($errorMessages) . "&id=" . urlencode($id));
    exit;
  }
}

?>