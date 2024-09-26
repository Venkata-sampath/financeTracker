<?php
session_start();
include "connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $amount = $_POST['amount'];
    $date = $_POST['date'];
    $category = $_POST['category'];
    $description = $_POST['description'];

    // Insert into transactions table
    $sql = "INSERT INTO transactions (user_id, type, amount, category, date, description) 
            VALUES (?, 'Income', ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("idsss", $user_id, $amount, $category, $date, $description);

    if ($stmt->execute()) {
        // Redirect to home page or wherever needed
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
