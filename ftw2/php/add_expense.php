<?php
session_start();
include "connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_SESSION['user_id'])) {
    $amount = $_POST['amount'];
    $date = $_POST['date'];
    $category = $_POST['category']; // Category input as radio button value
    $description = $_POST['description'];
    $user_id = $_SESSION['user_id'];
    $type = "Expense"; // Fixed type for expense

    // Insert into transactions table using prepared statement
    $sql = "INSERT INTO transactions (user_id, type, amount, category, date, description) 
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isdsss", $user_id, $type, $amount, $category, $date, $description);

    if ($stmt->execute()) {
        // Success
        header("Location: ../home.html");
        exit;
    } else {
        // Error handling
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
