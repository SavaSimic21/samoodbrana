<?php
$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "video_streaming_platform";


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Konekcija nije uspela: " . $conn->connect_error);
}
?>
