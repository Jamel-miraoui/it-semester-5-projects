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

?>