<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="add.css">
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body class="add-page">
    <form action="add.php" method="post">
        <label for="NumRatV">NumRatV :</label>
        <input type="number" name="NumRatV" id="NumRatV" value="<?php echo $_GET['NumRatV'] ; ?>"/> <br>
        <label for="MatProf">MatProf :</label>
        <input type="number" name="MatProf" id="MatProf" required value="<?php echo $_GET['MatProf'] ; ?>" /> <br>
        <label for="DateRat">DateRat :</label>
        <input type="datetime-local" name="DateRat" id="DateRat" required value="<?php echo $_GET['DateRat'] ; ?>" /> <br>
        <label for="Seance">Seance :</label>
        <input type="text" name="Seance" id="Seance" required value="<?php echo $_GET['Seance'] ; ?>"/> <br>
        <label for="Session">Session :</label>
        <input type="number" name="Session" id="Session" required value="<?php echo $_GET['Session'] ; ?>" /> <br>
        <label for="Salle">Salle :</label>
        <input type="text" name="Salle" id="Salle" required value="<?php echo $_GET['Salle'] ; ?>"/> <br>
        <label for="Jour">Jour :</label>
        <input type="text" name="Jour" id="Jour" required value="<?php echo $_GET['Jour'] ; ?>"/> <br>
        <label for="CodeClasse">Code Classe :</label>
        <input type="text" name="CodeClasse" id="CodeClasse" value="<?php echo $_GET['CodeClasse'] ; ?>"/> <br>
        <label for="CodeMatiere">Code Matiere :</label>
        <input type="text" name="CodeMatiere" id="CodeMatiere" value="<?php echo $_GET['CodeMatiere'] ; ?>"/> <br>
        <label>Etat: </label>
        <input type="radio" name="Etat" value="0" <?php echo $_GET['Etat'] == '0' ? 'checked' : ''; ?>> 0
        <input type="radio" name="Etat" value="1" <?php echo $_GET['Etat'] == '1' ? 'checked' : ''; ?>> 1
        <input type="radio" name="Etat" value="" style="display: none;" required> <br>
        <input type="submit" value="Add" />
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

