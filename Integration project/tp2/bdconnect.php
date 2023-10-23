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

function saisieControl($NumRatV, $MatProf, $DateRat, $Session, $Seance, $Salle, $Jour, $CodeClasse, $CodeMatiere, $header)
{
  $id = $NumRatV;
  $errors = array();
  if (!is_numeric($MatProf) || $MatProf > 32767 || $MatProf < -32767) {
    $errors[] = "MatProf :You need to enter a number between -32767 and 32767";
  }
  if (!strtotime($DateRat)) {
    $errors[] = "DateRat is not valid format";
  }
  if (!is_numeric($Session) || $Session <= 0 || $Session > 2147483647) {
    $errors[] = "Session need to be a positive int and less then 2147483647";
  }
  if (strlen($Seance) > 10) {
    $errors[] = "Seance should < 10 characters";
  }
  if (strlen($Salle) > 10) {
    $errors[] = "Salle should < 10 characters";
  }
  if (strlen($Jour) > 10) {
    $errors[] = "Jour should < 10 characters";
  }
  if (strlen($CodeClasse) > 9) {
    $errors[] = "CodeClasse should < 9 characters";
  }
  if (strlen($CodeMatiere) > 10) {
    $errors[] = "CodeMatiere should < 10 characters";
  }
  if (!empty($errors)) {
    $errorMessages = implode(',', $errors);
    header("Location: $header.php?errors=" . urlencode($errorMessages) . "&id=" . urlencode($id));
    exit;
  }
}

function returnParam($errorMessages, $NumRatV, $MatProf, $DateRat, $Seance, $Session,  $Salle, $Jour, $CodeClasse, $CodeMatiere, $Etat, $header)
{
  header("Location: $header.php?errors=" . urlencode($errorMessages) . "&NumRatV=" . urlencode($NumRatV) . "&MatProf=" . urlencode($MatProf) . "&DateRat="
    . urlencode($DateRat) . "&Seance=" . urlencode($Seance) . "&Session=" . urlencode($Session) . "&Salle=" . urlencode($Salle) . "&Jour=" . urlencode($Jour)
    . "&CodeClasse=" . urlencode($CodeClasse) . "&CodeMatiere=" . urlencode($CodeMatiere) . "&Etat=" . urlencode($Etat));
}
