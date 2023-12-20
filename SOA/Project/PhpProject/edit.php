<?php
include 'ApiFun.php' ; 
$ref = $_GET['id'];
$produit = getProduitByRef($ref) ;
 ?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="icon" type="image/x-icon" href="icon.png">
    <link rel="stylesheet" href="edit.css">
</head>
<br><br><br>
<body class="edit-page">
    <form action="editfun.php" method="post">
        <label for="ref" id="pm">Ref : <?php echo $produit['reference']; ?></label>
            <input type="number" name="ref" id="ref" value="<?php echo $produit['reference']; ?>" hidden/> <br>
        <label for="name">Name : </label>
            <input type="text" name="name" id="name" value="<?php echo $produit['name']; ?>" required /> <br>
        <label for="prix">Prix :</label>
            <input type="number" id="prix" name="prix" value="<?php echo $produit['prix'];  ?>" required /> <br>
        <label for="imagepath">Image Path :</label>
            <input type="text" name="imagepath" id="imagepath" value="<?php echo $produit['imagePath']; ?>" required /> <br>

        <input type="submit" value="Edit" /> 
    </form>
</body>
</html>