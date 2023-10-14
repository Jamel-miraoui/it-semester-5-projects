<?php
$host = "localhost"; 
$user = "root"; 
$password = "root"; 
$database = "Scolarite";
$mysqli = new mysqli($host,$user,$password,$database);
$statut = "Not Connected";
// Check connection
if ($mysqli -> connect_errno) {
  $statut =  "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
} else {$statut = "succes" ; }

?>
