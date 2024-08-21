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
            background-color: blue; 
            color: black; 
        }
    </style>
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container mt-5">
        <h2>Serije</h2>
        <div class="card-deck">
    <?php
    $result = $conn->query("SELECT * FROM series");
    while ($row = $result->fetch_assoc()) {
        echo '<div class="card mb-4">';
        if (!empty($row['image_path'])) {
            echo '<img src="' . $row['image_path'] . '" class="card-img-top" alt="' . $row['title'] . '" style="height: 250px; width: auto;">';
        }
        echo '<div class="card-body">';
        echo '<h5 class="card-title">' . $row['title'] . '</h5>';
        echo '<p class="card-text">' . $row['description'] . '</p>';
        echo '<p class="card-text"><small class="text-muted">' . $row['genre'] . ', ' . $row['release_year'] . '</small></p>';
        echo '</div>';
        echo '</div>';
    }
    ?>
</div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
