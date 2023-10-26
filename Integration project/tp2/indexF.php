<?php
if ($statut == "succes") {
  $NumRatV = $_POST["filterNumRatV"];
  $MatProf = $_POST["filterMatProf"];
  $DateRat = $_POST["filterDateRat"];
  $Seance = $_POST["filterSeance"];
  $Session = $_POST["filterSession"];
  $Salle = $_POST["filterSalle"];
  $Jour = $_POST["filterJour"];
  $CodeClasse = $_POST["filterCodeClasse"];
  $CodeMatiere = $_POST["filterCodeMatiere"];
  $Etat = $_POST["filterEtat"];
  $header = "addForm";

  $sqldate = "LIKE $DateRat ";

  function printResult()
  {
    $filterR = 0;
    $filter = [];
    global $mysqli;
    global $result, $MatProf, $DateRat, $Seance, $Session, $Salle, $Jour, $CodeClasse, $CodeMatiere, $Etat, $NumRatV;
    $table = [$NumRatV, $MatProf, $DateRat, $Seance, $Session, $Salle, $Jour, $CodeClasse, $CodeMatiere, $Etat];
    $tableNames = ["NumRatV", "MatProf", "DATE(DateRat)", "Seance", "Session", "Salle", "Jour", "CodeClasse", "CodeMatiere", "Etat"];
    for ($i = 0; $i < count($table); $i++) {
      if ($table[$i] !== "" && !is_null($table[$i])) {
        $filter[] = "$tableNames[$i]=$table[$i]";
        $filterR = 1;
      }
    }
    echo $filterR;
    foreach ($filter as $value) {
      echo $value . "<br>";
    }

    $filterCount = count($filter);

    if ($filterR == 1 && $filterCount == 1) {
      foreach ($filter as $champ) {
        $reqf =  "SELECT * FROM RatVol WHERE $champ ;";
      }
    }
    if ($filterR == 1 && $filterCount > 1) {
      $i = 0;
      $champs = "";
      foreach ($filter as $champ) {
        $i++;
        $champs .=  "$champ ";
        if ($i  == $filterCount) {
          break;
        }
        $champs .=  "AND ";
      }
    }

    $reqf = "SELECT * FROM RatVol WHERE $champs ;";
    echo $reqf;

    if ($filterR == 0) {
      $req = "SELECT * from RatVol";
    } else if ($filterR == 1 && $filterCount == 1) {
      $req =  "SELECT * FROM RatVol WHERE $champ ;";
    } else {
      $req = $reqf;
    }
    $result = $mysqli->query($req);
    while ($row = $result->fetch_assoc()) {
      echo "<tr>";
      echo "<td>" . $row['NumRatV'] . "</td>";
      echo "<td>" . $row['MatProf'] . "</td>";
      echo "<td>" . $row['DateRat'] . "</td>";
      echo "<td>" . $row['Seance'] . "</td>";
      echo "<td>" . $row['Session'] . "</td>";
      echo "<td>" . $row['Salle'] . "</td>";
      echo "<td>" . $row['Jour'] . "</td>";
      echo "<td>" . $row['CodeClasse'] . "</td>";
      echo "<td>" . $row['CodeMatiere'] . "</td>";
      echo "<td>" . $row['Etat'] . "</td>";
      echo '<td><a style="color: blue;" href="editForm.php?id=' . $row['NumRatV'] . '">Edit</a> | <a style="color: red;"  href="delete.php?id=' . $row['NumRatV'] . '">Delete</a></td>';
      echo "</tr>";
    }
  }
} else {
  echo $statut;
}
