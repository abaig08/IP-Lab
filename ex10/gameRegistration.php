<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $gameName = $_POST['game_name'];
    $gameYear = $_POST['game_year'];
    $gameType = $_POST['game_type'];
    $gamePrice = $_POST['game_price'];
    $gameMode = $_POST['game_mode'];

    $errors = array();
    if (empty($gameName)) {
        $errors[] = "Game name is required";
    }
    if (empty($gameYear)) {
        $errors[] = "Game year is required";
    } elseif (!preg_match("/^[0-9]{4}$/", $gameYear)) {
        $errors[] = "Invalid game year format. Enter a valid 4-digit year.";
    }
    if (empty($gameType)) {
        $errors[] = "game type is required";
    }
    if (empty($gamePrice)) {
        $errors[] = "gamePrice is required";
    } elseif (!is_numeric($gamePrice)) {
        $errors[] = "Invalid gamePrice format. Enter a numeric value.";
    }
    if (empty($gameMode)) {
        $errors[] = "gameMode is required";
    }

    if (empty($errors)) {
        echo "<h2>Thank you for your submission!</h2>";
        echo "<p>Game Name: $gameName</p>";
        echo "<p>Game Year: $gameYear</p>";
        echo "<p>Game Type: $gameType</p>";
        echo "<p>Game Mode: $gameMode</p>";
        echo "<p>Game Price: $gamePrice</p>";

        try {
            $conn = new PDO("mysql:host=localhost:3306;dbname=gaming", "root", "");
            $sql = "INSERT INTO game_info (game_name, game_year, game_type, game_mode, game_price) VALUES (?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(1, $gameName);
            $stmt->bindParam(2, $gameYear);
            $stmt->bindParam(3, $gameType);
            $stmt->bindParam(4, $gamePrice);
            $stmt->bindParam(5, $gameMode);

            $rowsAffected = $stmt->execute();

            if ($rowsAffected > 0) {
                echo "<h1>Record inserted successfully</h1>";
            } else {
                echo "<h1>Error inserting record</h1>";
            }
        } catch (PDOException $e) {
            echo "<h1>Error: " . $e->getMessage() . "</h1>";
        } finally {
            if ($stmt !== null) {
                $stmt->closeCursor();
            }
            $conn = null;
        }
        exit;
    } else {
        foreach ($errors as $error) {
            echo "<p>$error</p>";
        }
    }
}

?>
