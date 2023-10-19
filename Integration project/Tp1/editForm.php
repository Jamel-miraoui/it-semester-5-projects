<?php
require "bdconnect.php";
if ($statut == "succes") {
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $query = "SELECT * FROM RatVol WHERE NumRatV = $id";
        $result = $mysqli->query($query);
        if ($result) {
            $row = $result->fetch_assoc();
        } else {
            echo "Error: " . $mysqli->error;
        }
    } else {
        echo "No 'id' parameter provided.";
    }
} else {
    echo $statut;
}
?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="add.css">
    <style>
        .error {
            color: red;
        }
    </style>
</head>

<body class="edit-page">
    <form action="edit.php" method="post">
        <label for="NumRatV" id="pm">NumRatV : <?php echo $row['NumRatV']; ?></label>
        <input type="number" name="NumRatV" id="NumRatV" value="<?php echo $row['NumRatV']; ?>" hidden/> <br>
        <label for="MatProf">MatProf : </label>
        <input type="number" name="MatProf" id="MatProf" value="<?php echo $row['MatProf']; ?>" required /> <br>
        <label for="DateRat">DateRat :</label>
        <input type="datetime-local" name="DateRat" id="DateRat" value="<?php echo $row['DateRat'];  ?>" required /> <br>
        <label for="Seance">Seance :</label>
        <input type="number" name="Seance" id="Seance" value="<?php echo $row['Seance']; ?>" required /> <br>
        <label for="Session">Session :</label>
        <input type="text" name="Session" id="Session" value="<?php echo $row['Session']; ?>" required /> <br>
        <label for="Salle">Salle :</label>
        <input type="text" name="Salle" id="Salle" value="<?php echo $row['Salle']; ?>" required /> <br>
        <label for="Jour">Jour :</label>
        <input type="text" name="Jour" id="Jour" value="<?php echo $row['Jour']; ?>" required /> <br>
        <label for="CodeClasse">Code Classe :</label>
        <input type="text" name="CodeClasse" id="CodeClasse" value="<?php echo $row['CodeClasse']; ?>" /> <br>
        <label for="CodeMatiere">Code Matiere :</label>
        <input type="text" name="CodeMatiere" id="CodeMatiere" value="<?php echo $row['CodeMatiere']; ?>" /> <br>
        <label>Etat: </label>
        <input type="radio" name="Etat" value="0" <?php echo $row['Etat'] == '0' ? 'checked' : ''; ?>> 0
        <input type="radio" name="Etat" value="1" <?php echo $row['Etat'] == '1' ? 'checked' : ''; ?>> 1
        <input type="radio" name="Etat" value="" style="display: none;" required> <br>
        <input type="submit" value="Edit" /> 
    </form>
    <?php
    if (isset($_GET['errors'])) {
        $errorMessages = explode(',', urldecode($_GET['errors']));
        foreach ($errorMessages as $errorMessage) {
            echo '<p class="error">' . $errorMessage . '</p>';
        }
    }
    ?>
</body>

</html>