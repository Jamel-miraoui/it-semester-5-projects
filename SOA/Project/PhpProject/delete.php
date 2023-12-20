<?php
include 'ApiFun.php' ; 
$ref = $_GET["id"]; 
$produit = getProduitByRef($ref) ;

$deletedProduct = deleteProduct($ref);

if($deletedProduct) {
    header("Location: main.php?id={$produit['user']['userId']}&msgd=1");
    exit();
}
else { 
    header("Location: main.php?id={$produit['user']['userId']}&msgd=2");
    exit();
}
?>