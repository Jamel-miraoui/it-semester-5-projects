<?php

function addUser($user, $password) {
    // Replace the following with your actual API endpoint and logic
    $apiEndpoint = 'http://localhost:8080/api/users';

    // Create an array with the data to send to your API
    $postData = array(
        'fullName' => $user,
        'password' => $password
    );

    // Initialize cURL session
    $ch = curl_init($apiEndpoint);

    // Set cURL options
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

    // Execute cURL session and get the response
    $response = curl_exec($ch);

    // Close cURL session
    curl_close($ch);

    // Decode the JSON response
    $responseData = json_decode($response, true);

    // Return the added user details from the API response
    return $responseData;
}

function checkPassword($fullName, $password) {
    // Replace the following with your actual API endpoint and logic
    $apiEndpoint = 'http://localhost:8080/api/users/checkPassword';

    // Create an array with the data to send to your API
    $postData = array(
        'fullName' => $fullName,
        'password' => $password
    );

    // Initialize cURL session
    $ch = curl_init($apiEndpoint);

    // Set cURL options
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

    // Execute cURL session and get the response
    $response = curl_exec($ch);

    // Close cURL session
    curl_close($ch);

    // Decode the JSON response
    $responseData = json_decode($response, true);

    // Return the boolean value from the API response
    return $responseData;
}

function getUserById($id){
    $apiEndpoint = "http://localhost:8080/api/users/{$id}";

    // Make the request to the API endpoint
    $response = file_get_contents($apiEndpoint);

    // Decode the JSON response
    $user = json_decode($response, true);

    return $user;
}

function getProduitByRef($id){
    $apiEndpoint = "http://localhost:8080/api/produits/{$id}";

    // Make the request to the API endpoint
    $response = file_get_contents($apiEndpoint);

    // Decode the JSON response
    $produit = json_decode($response, true);

    return $produit;
}

function updateProduit($reference, $updatedProduit) {
    // Replace the following with your actual API endpoint
    $apiEndpoint = "http://localhost:8080/api/produits/{$reference}";

    // Initialize cURL session
    $ch = curl_init($apiEndpoint);

    // Set cURL options
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($updatedProduit));
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

    // Execute cURL session and get the response
    $response = curl_exec($ch);

    // Close cURL session
    curl_close($ch);

    // Decode the JSON response
    $updated = json_decode($response, true);

    // Return the updated product data
    return $updated;
}

function deleteProduct($reference) {
    // Replace the following with your actual API endpoint
    $apiEndpoint = "http://localhost:8080/api/produits/{$reference}";

    // Initialize cURL session
    $ch = curl_init($apiEndpoint);

    // Set cURL options
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');

    // Execute cURL session and get the response
    $response = curl_exec($ch);

    // Get the HTTP status code
    $httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    // Close cURL session
    curl_close($ch);

    // Check if the response contains the message indicating successful deletion
    $deletedSuccessfully = strpos($response, 'deleted successfully') !== false;

    // Return true if the status code is 200 and the message indicates successful deletion
    return $httpStatus == 200 && $deletedSuccessfully;
}

function addProduct($NewProduit){
    $apiEndpoint = "http://localhost:8080/api/produits";

    // Initialize cURL session
    $ch = curl_init($apiEndpoint);

    // Set cURL options
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($NewProduit));
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

    // Execute cURL session and get the response
    $response = curl_exec($ch);

    // Close cURL session
    curl_close($ch);

    // Decode the JSON response
    $added = json_decode($response, true);

    // Return the updated product data
    return $added;
}

?>