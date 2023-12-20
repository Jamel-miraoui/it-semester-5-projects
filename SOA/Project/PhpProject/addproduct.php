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
    <form action="addproductfun.php?id=<?php echo $_GET['id']; ?>" method="post">
        <h1 id="pm">Add new product</h1>
        <label for="name">Name : </label>
            <input type="text" name="name" id="name"  required /> <br>
        <label for="prix">Prix :</label>
            <input type="number" id="prix" name="prix"  required /> <br>
        <label for="imagepath">Image Path :</label>
            <input type="text" name="imagepath" id="imagepath" required /> <br>
        <input type="submit" value="Add" /> 
    </form>
</body>
</html>