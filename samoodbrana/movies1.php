<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
include 'config.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Serije</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: black;
        }

        .card {
            background-color: blue; /
            color: black; 
        }
        h2 {
            color: white; 
        }
        .table{
            background: blue;
        }
    </style>
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container mt-5">
    <h2>Filmovi</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Slika</th>
                <th>Titula</th>
                <th>Opis</th>
                <th>Žanr</th>
                <th>Godina izdanja</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $result = $conn->query("SELECT * FROM movies");
            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>';
                if (!empty($row['slika'])) {
                    echo '<img src="' . $row['slika'] . '" alt="' . $row['title'] . '" style="height: 100px; width: auto;">';
                }
                echo '</td>';
                echo '<td>' . htmlspecialchars($row['title']) . '</td>';
                echo '<td>' . htmlspecialchars($row['description']) . '</td>';
                echo '<td>' . htmlspecialchars($row['genre']) . '</td>';
                echo '<td>' . htmlspecialchars($row['release_year']) . '</td>';
                echo '</tr>';
            }
            ?>
        </tbody>
    </table>
</div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

