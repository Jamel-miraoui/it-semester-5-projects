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

  <br> <br>
  <form method="post" action="index.php" id="myForm">
    <label for="filterNumRatV">NumRatV:</label>
    <input type="number" name="filterNumRatV" id="filterNumRatV" value="<?php echo $NumRatV ?>">

    <label for="filterMatProf">MatProf:</label>
    <input type="number" name="filterMatProf" id="filterMatProf" value="<?php echo $MatProf ?>">

    <label for="filterDateRat">DateRat:</label>
    <input type="date" name="filterDateRat" id="filterDateRat" value="<?php echo $DateRat ?>">

    <label for="filterSeance">Seance:</label>
    <input type="text" name="filterSeance" id="filterSeance" value="<?php echo $Seance ?>">

    <label for="filterSession">Session:</label>
    <input type="number" name="filterSession" id="filterSession" value="<?php echo $Session ?>">

    <label for="filterSalle">Salle:</label>
    <input type="text" name="filterSalle" id="filterSalle" value="<?php echo $Salle ?>">

    <label for="filterJour">Jour:</label>
    <input type="text" name="filterJour" id="filterJour" value="<?php echo $Jour ?>">

    <label for="filterCodeClasse">CodeClasse:</label>
    <input type="text" name="filterCodeClasse" id="filterCodeClasse" value="<?php echo $CodeClasse ?>">

    <label for="filterCodeMatiere">CodeMatiere:</label>
    <input type="text" name="filterCodeMatiere" id="filterCodeMatiere" value="<?php echo $CodeMatiere ?>">

    <label for="filterEtat">Etat:</label>
    <input type="text" name="filterEtat" value="<?php echo $Etat ?>">

    <input type="submit" onclick="test();" value="Reset" id = "reset">
    <input type="submit" value="Apply Change">
  </form>
  <script>
    function test(){
    var form  = document.getElementById("myForm");
    form[0].value = "" ;
    form[1].value = "" ; 
    form[2].value = "" ; 
    form[3].value = "" ; 
    form[4].value = "" ; 
    form[5].value = "" ; 
    form[6].value = "" ; 
    form[7].value = "" ; 
    form[8].value = "" ; 
    form[9].value = "" ;
    console.log(" test ") ; 
  }
  </script>
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