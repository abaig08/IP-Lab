<!DOCTYPE html>
<html>
<head>
  <style>
    body{
      margin-top:125px;
      background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%, rgb(203, 165, 206) 0%, rgb(75, 194, 217) 100%);
    }
  </style>
    <title>Game Search</title>
</head>
<body align ="center">
    <form method="GET">
        <label for="gameName">Enter Game Name:</label>
        <input type="text" id="gameName" name="gameName">
        <input type="submit" value="Search">
    </form>

    <?php
    if (isset($_GET['gameName'])) {
        $gameName = $_GET['gameName'];

        $xml = simplexml_load_file('game.xml');

        // Find the game with the specified name
        $game = $xml->xpath("/gamelist/game[gamename='$gameName']");

        // Check if the game was found
        if (!empty($game)) {
            $game = $game[0]; // Get the first match

            // Retrieve the details
            $gamename = $game->gamename;
            $gameyear = $game->gameyear;
            $gametype = $game->gametype;
            $gamemode = $game->gamemode;
            $gameprice = $game->gameprice;

            // Display the details
            echo "<h2>Game Details:</h2>";
            echo "Game Name: $gamename<br>";
            echo "Game Year: $gameyear<br>";
            echo "Game Type: $gametype<br>";
            echo "Game Mode: $gamemode<br>";
            echo "Game Price: $gameprice<br>";
        } else {
            echo "Game not found.";
        }
    }
    ?>
</body>
</html>
