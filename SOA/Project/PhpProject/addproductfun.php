<?php
include 'ApiFun.php'; 
$user = getUserById($_GET['id']); 

$name = $_POST['name'];
$prix = $_POST['prix'];
$imagepath = $_POST['imagepath'];

$newProduct = array(
    "name" => $name,
    "prix" => $prix,
    "user" => $user,
    "imagePath" => $imagepath
);
$addedProduct = addProduct($newProduct);

if ($addedProduct) {
    header("Location: main.php?id={$_GET['id']}&msga=1");
    exit(); 
} else {
    header("Location: main.php?id={$_GET['id']}&msga=2");
    exit(); 
}

 ?>