<?php

$host = "localhost"; 
$user = "root"; 
$password = "root"; 
$database = "Scolarite";
$mysqli = new mysqli($host,$user,$password,$database);
// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
} else {echo "succes" ; }
// PHP code goes here
?>
