<?php
require "bdconnect.php";
require "indexF.php";
if ($statut == "succes") {
} else {
  echo $statut;
}
?>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" type="image/x-icon" href="icon.png">
  <title>Document</title>
  <link rel="stylesheet" href="index.css">
</head>

<body class="index-page">
  <form method="post" action="index.php">
  <label for="filterNumRatV">NumRatV:</label>
  <input type="text" name="filterNumRatV" id="filterNumRatV">
  
  <label for="filterMatProf">MatProf:</label>
  <input type="text" name="filterMatProf" id="filterMatProf">

  <label for="filterDateRat">DateRat:</label>
  <input type="date" name="filterDateRat" id="filterDateRat">
  
  <label for="filterSeance">Seance:</label>
  <input type="text" name="filterSeance" id="filterSeance">

  <label for="filterSession">Session:</label>
  <input type="text" name="filterSession" id="filterSession"> 
  <label for="filterSalle">Salle:</label>
  <input type="text" name="filterSalle" id="filterSalle">

  <label for="filterJour">Jour:</label>
  <input type="text" name="filterJour" id="filterJour">

  <label for="filterCodeClasse">CodeClasse:</label>
  <input type="text" name="filterCodeClasse" id="filterCodeClasse">

  <label for="filterCodeMatiere">CodeMatiere:</label>
  <input type="text" name="filterCodeMatiere" id="filterCodeMatiere">

  <label for="filterEtat">Etat:</label>
  <input type="text" name="filterEtat" id="filterEtat">

  <input type="submit" value="Apply Change">
</form>

  <div>
    <table>
      <thead>
        <tr>
          <th>NumRatV</th>
          <th>MatProf</th>
          <th>DateRat</th>
          <th>Seance</th>
          <th>Session</th>
          <th>Salle</th>
          <th>Jour</th>
          <th>CodeClasse</th>
          <th>CodeMatiere</th>
          <th>Etat</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <?php printResult();  ?>
      </tbody>
    </table>
    <button class="add-button"><a href="addForm.php">Add</a></button>
  </div>
  <a href=""></a>
</body>

</html>