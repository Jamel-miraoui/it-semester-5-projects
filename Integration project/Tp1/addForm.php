<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="add.php" method="post">
        <label for="NumRatV">NumRatV :</label>
        <input type="number" name="NumRatV" id="NumRatV" /> <br>
        <label for="MatProf">MatProf :</label>
        <input type="text" name="MatProf" id="MatProf" required /> <br>
        <label for="DateRat">DateRat :</label>
        <input type="datetime-local" name="DateRat" id="DateRat" required /> <br>
        <label for="Seance">Seance :</label>
        <input type="text" name="Seance" id="Seance" required /> <br>
        <label for="Session">Session :</label>
        <input type="text" name="Session" id="Session" required /> <br>
        <label for="Salle">Salle :</label>
        <input type="text" name="Salle" id="Salle" required /> <br>
        <label for="Jour">Jour :</label>
        <input type="text" name="Jour" id="Jour" required /> <br>
        <label for="CodeClasse">Code Classe :</label>
        <input type="text" name="CodeClasse" id="CodeClasse" /> <br>
        <label for="CodeMatiere">Code Matiere :</label>
        <input type="text" name="CodeMatiere" id="CodeMatiere" /> <br>
        <label>Etat:</label>
        <input type="radio" name="Etat" value="0" required> 0 <br>
        <input type="radio" name="Etat" value="1"> 1
        <input type="submit" value="Add" />
    </form>
</body>

</html>