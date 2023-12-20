<?php
include 'ApiFun.php';
$user = getUserById($_GET['id']);
$user['fullName'];
function printResult()
{
    $userId = $_GET['id'];
    // Replace with the actual user ID you want to fetch products for
    $apiEndpoint = "http://localhost:8080/api/produits/user/{$userId}";

    // Make the request to the API endpoint
    $response = file_get_contents($apiEndpoint);

    // Decode the JSON response
    $produitsByUserId = json_decode($response, true);

    // Check if the decoding was successful
    if ($produitsByUserId === null) {
        echo 'Empty';
        exit();
    }
    foreach ($produitsByUserId as $produit) {
        echo '<tr>';
        echo '<td>' . $produit['reference'] . '</td>';
        echo '<td>' . $produit['name'] . '</td>';
        echo '<td>' . $produit['prix'] . '</td>';
        echo '<td>' . $produit['imagePath'] . '</td>';
        echo '<td>
                <a style="color: blue;" href="edit.php?id=' . $produit['reference'] .  '">Edit</a> | 
                <a style="color: red;" href="delete.php?id=' . $produit['reference'] . '">Delete</a>
              </td>';
        echo '</tr>';
    }
}
?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <title>Product List</title>
</head>

<body class="index-page">
    <div class="container">
        <center>
            <h1>Product List Of <?php echo $user['fullName'];   ?></h1>
        </center>
        <center>
            <h3 style="color: green;">
                <?php
                if (isset($_GET['msge']) && $_GET['msge'] == 1) {
                    echo "<p>Product edit With success</p>";
                }
                ?>
            </h3>
            <h3 style="color: red;" >
                <?php
                if (isset($_GET['msge']) && $_GET['msge'] == 2) {
                    echo "<p>Failed to edit the product</p>";
                }
                ?>
            </h3>
            <h3 style="color: green;">
                <?php
                if (isset($_GET['msgd']) && $_GET['msgd'] == 1) {
                    echo "<p>Product deleted With success</p>";
                }
                ?>
            </h3>
            <h3 style="color: red;" >
                <?php
                if (isset($_GET['msgd']) && $_GET['msgd'] == 2) {
                    echo "<p>Failed to delet the product</p>";
                }
                ?>
            </h3>
            <h3 style="color: green;">
                <?php
                if (isset($_GET['msga']) && $_GET['msga'] == 1) {
                    echo "<p>Product addes With success</p>";
                }
                ?>
            </h3>
            <h3 style="color: red;" >
                <?php
                if (isset($_GET['msga']) && $_GET['msga'] == 2) {
                    echo "<p>Failed to add the product</p>";
                }
                ?>
            </h3>
        </center>
        <table>
            <thead>
                <tr>
                    <th>Reference</th>
                    <th>Name</th>
                    <th>Prix</th>
                    <th>ImagePath</th>
                    <th class="actions-header">Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php printResult(); ?>
            </tbody>
        </table>
        <button class="add-button"><a href="addproduct.php?id=<?php echo $_GET['id'] ?>">Add</a></button>
    </div>
</body>
</html>