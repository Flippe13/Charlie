<?php
// Inkludera konfigurationsfilen för databasanlutning
include_once 'config.php';

// Skapa en anslutning till databasen
$conn = new mysqli($servername, $username, $password, $dbname);

// Kontrollera om anslutningen lyckades
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Hämta data från formuläret
$email = $_POST['email'];
$product_number = $_POST['product_number'];
$issue_description = $_POST['issue_description'];

// Förbered SQL-fråga för att lägga till ärendet i databasen
$sql = "INSERT INTO issues (user_email, product_number, issue_description) VALUES ('$email', '$product_number', '$issue_description')";

// Utför SQL-frågan och hantera resultatet
if ($conn->query($sql) === TRUE) {
    $message = "Ärendet har skickats fram.";
} else {
    $message = "Fel: " . $sql . "<br>" . $conn->error;
}

// Stäng anslutningen till databasen
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ärendehanteringssystem - Resultat</title>
    <link rel="stylesheet" href="styless.css">
    <style>
        /* Stilmall för meddelande och återvändningsknapp */
        .message-container {
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .return-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }

        .return-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Anders Målarsupport</h1>
    </header>
    <div class="message-container">
        <!-- Visa meddelandet om ärendet har skickats rätt eller om ett fel uppstod -->
        <h2><?php echo $message; ?></h2>
        <p>Vänta på svar via e-post.</p>
        <a href="index.html" class="return-button">Återvänd till hem</a> <!-- Länk för att återvända till startsidan -->
    </div>
</body>
</html>
