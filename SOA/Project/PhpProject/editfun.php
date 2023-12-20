<?php 
include 'ApiFun.php' ;

$reference = $_POST['ref']; 
$name = $_POST['name'];
$prix = $_POST['prix'];
$imagepath = $_POST['imagepath'];
$produit = getProduitByRef($reference) ;

$updatedProduit = array(
    "name" => $name,
    "prix" => $prix,
    "user" => $produit['user'],
    "imagePath" => $imagepath
);
$updatedProduct = updateProduit($reference, $updatedProduit);

if ($updatedProduct) {
    header("Location: main.php?id={$produit['user']['userId']}&msge=1");
    exit(); 
} else {
    header("Location: main.php?id={$produit['user']['userId']}&msge=2");
    exit(); 
}
?>