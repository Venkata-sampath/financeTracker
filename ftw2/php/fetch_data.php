<?php
session_start();
include "connection.php";

// Check if user is authenticated
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];

    try {
        // Initialize variables to store fetched data
        $username = '';
        $totalIncome = 0;
        $totalExpense = 0;
        $balance = 0;
        $categories = array();
        $transactions = array();

        // Fetch username
        $sql = "SELECT username FROM users WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $username = $row['username'];

        // Fetch Total Income, Total Expense, and Balance
        $sql = "SELECT 
                    COALESCE(SUM(CASE WHEN type = 'Income' THEN amount ELSE 0 END), 0) AS totalIncome,
                    COALESCE(SUM(CASE WHEN type = 'Expense' THEN amount ELSE 0 END), 0) AS totalExpense
                FROM transactions
                WHERE user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $totalIncome = floatval($row['totalIncome']);
        $totalExpense = floatval($row['totalExpense']);
        $balance = $totalIncome - $totalExpense;

        // Fetch Category-wise Expenses
        $sql = "SELECT 
                    category,
                    COALESCE(SUM(amount), 0) AS totalAmount
                FROM transactions
                WHERE user_id = ?
                AND type = 'Expense'
                GROUP BY category";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        while ($row = $result->fetch_assoc()) {
            $categories[$row['category']] = floatval($row['totalAmount']);
        }

        // Prepare SQL for fetching transactions with optional date range
        $sql = "SELECT * FROM transactions WHERE user_id = ?";
        $params = array("i", $user_id);

        // Check for optional date parameters (start_date and end_date)
        if (isset($_GET['start_date']) && isset($_GET['end_date'])) {
            $sql .= " AND date BETWEEN ? AND ?";
            $params[] = "ss";
            $params[] = $_GET['start_date'];
            $params[] = $_GET['end_date'];
        }

        $sql .= " ORDER BY date DESC";
        $stmt = $conn->prepare($sql);
        call_user_func_array(array($stmt, 'bind_param'), refValues($params)); // refValues is a helper function for binding parameters
        $stmt->execute();
        $result = $stmt->get_result();
        while ($row = $result->fetch_assoc()) {
            // Ensure 'amount' is a float
            $row['amount'] = floatval($row['amount']);
            $transactions[] = $row;
        }

        // Prepare data to send back to JavaScript
        $data = array(
            'totalIncome' => $totalIncome,
            'totalExpense' => $totalExpense,
            'balance' => $balance,
            'categories' => $categories,
            'transactions' => $transactions,
            'username' => $username
        );

        // Send JSON response
        header('Content-Type: application/json');
        echo json_encode($data);
    } catch (Exception $e) {
        // Handle exceptions
        http_response_code(500); // Internal Server Error
        echo json_encode(array('error' => 'Internal Server Error'));
        error_log('Error fetching data: ' . $e->getMessage());
    } finally {
        // Close prepared statement and database connection
        if (isset($stmt)) {
            $stmt->close();
        }
        $conn->close();
    }
} else {
    // Unauthorized access response
    http_response_code(403);
    echo json_encode(array('error' => 'Unauthorized access'));
}

// Helper function to bind parameters by reference
function refValues($arr) {
    if (strnatcmp(phpversion(), '5.3') >= 0) {
        $refs = array();
        foreach ($arr as $key => $value)
            $refs[$key] = &$arr[$key];
        return $refs;
    }
    return $arr;
}
?>
