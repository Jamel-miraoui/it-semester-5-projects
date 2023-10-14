<?php
require "bdconnect.php";
if ($statut == "succes") {
  $req = "SELECT * from RatVol";
  $result = $mysqli->query($req);
} else {
  echo $statut;
}

?>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>

<body>
<?php
  echo "<table> <tr><td>NumRatV</td> <td>MatProf</td> <td>DateRat</td> <td>Seance</td> <td>Session</td> <td>Salle</td> <td>Jour</td> <td>CodeClasse</td> <td>CodeMatiere</td> <td>Etat</td> </tr>   ";
  while ($row = $result->fetch_assoc()) {
    echo "<tr><td>" . $row['NumRatV'] . "</td>";
    echo "<td>" . $row['MatProf'] . "</td>";
    echo "<td>" . $row['DateRat'] . "</td>";
    echo "<td>" . $row['Seance'] . "</td>";
    echo "<td>" . $row['Session'] . "</td>";
    echo "<td>" . $row['Salle'] . "</td>";
    echo "<td>" . $row['Jour'] . "</td>";
    echo "<td>" . $row['CodeClasse'] . "</td>";
    echo "<td>" . $row['CodeMatiere'] . "</td>";
    echo "<td>" . $row['Etat'] . "</td>";
    echo '<td><a href="edit.php?id=' . $row['NumRatV'] . '">Edit</a></td>';
    echo '<td><a href="delete.php?id=' . $row['NumRatV'] . '">Delete</a></td>';
    echo "</tr>";
  }
  echo "</table>";
  ?>
</body>

</html>