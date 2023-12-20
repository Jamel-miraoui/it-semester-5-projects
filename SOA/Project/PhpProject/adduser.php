<?php
include 'ApiFun.php' ; 
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST["user"];
    $password = $_POST["psw"];
    $addUserResult = addUser($user, $password);
    if (isset($addUserResult['fullName'])) {
        header('Location: index.php?msg=1');
    } else {
        header('Location: index.php?msg=2');
    }
}
?>