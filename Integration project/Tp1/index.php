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
  <link rel="stylesheet" href="index.css">
</head>

<body class="index-page">
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
    <?php
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
    ?>
  </tbody>
</table>
<button class="add-button"><a href="addForm.php">Add</a></button>
  </div>
  <a  href=""></a>
  

</body>

</html>