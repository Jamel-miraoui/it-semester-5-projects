<?php
include 'ApiFun.php' ; 
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Call the function to check the password in your API
    $loginResult = checkPassword($username, $password);

    if ($loginResult != false) {
        header("Location: main.php?id={$loginResult}");
    } else {
        header('Location: index.php?msg1=1');
    }
}
?>