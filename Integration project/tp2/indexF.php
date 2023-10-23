<?php
if ($statut == "succes") {
  $req = "SELECT * from RatVol";
  $result = $mysqli->query($req);
  function printResult(){
    global $result ; 
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
?>
