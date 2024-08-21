<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FILMIX</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: black;
            color: white;
        }

        .carousel,
        .carousel-inner,
        .carousel-item {
            width: 100%;
            height: 60vh; 
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: contain; 
        }

        .table-dark {
            background-color: #343a40;
        }

        .table-dark th,
        .table-dark td {
            color: white;
        }

        .table-dark img {
            width: 100px;
            height: auto;
        }
    </style>
</head>
<body>
    <?php include 'navbar.php'; ?>

    <div class="container-fluid p-0">
        <h1 class="text-center my-4">Dobrodošli, <?php echo $_SESSION['username']; ?>!</h1>
        <p class="text-center">Izaberite kategoriju iz menija iznad da biste videli filmove ili serije.</p>
        
       
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/king.jpg" class="d-block w-100" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img src="img/ciro2.jpg" class="d-block w-100" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img src="img/dina2.jpg" class="d-block w-100" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                
            </a>
        </div>
    </div>

    <div class="container mt-5">
        <h2 class="text-white">Na osnovu vaših preferenci</h2>
        <table class="table table-dark table-striped">
            <thead>
                <tr>
                    <th>Slika</th>
                    <th>Naslov</th>
                    <th>Do koje epizode ste stigli</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="img/got2.jpg" alt="Game of Thrones"></td>
                    <td>Game of Thrones</td>
                    <td>Sezona 8, Epizoda 3</td>
                </tr>
                <tr>
                    <td><img src="img/ciro2.jpg" alt="Gomorra"></td>
                    <td>Gomorra</td>
                    <td>Sezona 4, Epizoda 10</td>
                </tr>
                <tr>
                    <td><img src="img/eup2.jpg" alt="Euphoria"></td>
                    <td>Euphoria</td>
                    <td>Sezona 2, Epizoda 5</td>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>