<?php
session_start();
include 'config.php';

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$current_username = $_SESSION['username'];
$update_success = false;
$update_message = "";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $update_sql = [];
    $new_username = "";
    $new_password = "";

    if (!empty($_POST['username'])) {
        $new_username = $conn->real_escape_string($_POST['username']);
        $update_sql[] = "username='$new_username'";
    }

    if (!empty($_POST['password']) && !empty($_POST['confirm_password'])) {
        if ($_POST['password'] === $_POST['confirm_password']) {
            $new_password = password_hash($conn->real_escape_string($_POST['password']), PASSWORD_DEFAULT);
            $update_sql[] = "password='$new_password'";
        } else {
            $update_message = "Lozinke se ne poklapaju.";
        }
    }

    if (empty($update_message) && !empty($update_sql)) {
        $sql = "UPDATE users SET " . implode(', ', $update_sql) . " WHERE username='$current_username'";

        if ($conn->query($sql) === TRUE) {
            if (!empty($new_username)) {
                $_SESSION['username'] = $new_username;
            }
            $update_success = true;
        } else {
            $update_message = "Greška: " . $conn->error;
        }
    } else {
        if (empty($update_message)) {
            $update_message = "Nema podataka za ažuriranje.";
        }
    }

    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ažuriranje Naloga</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('img/filmovipoz.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="settings.php" class="btn btn-secondary back-button">Povratak na podešavanja</a>
        <h2>Ažuriraj podatke</h2>
        <form action="update.php" method="post">
            <div class="form-group">
                <label for="username">Korisničko ime:</label>
                <input type="text" class="form-control" id="username" name="username" value="<?php echo htmlspecialchars($current_username); ?>">
            </div>
            <div class="form-group">
                <label for="password">Nova lozinka:</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Potvrdite novu lozinku:</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password">
            </div>
            <button type="submit" class="btn btn-primary">Ažuriraj</button>
        </form>

        <?php if (!empty($update_message)) : ?>
            <div class="alert alert-danger mt-3" role="alert">
                <?php echo htmlspecialchars($update_message); ?>
            </div>
        <?php endif; ?>
    </div>

    
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Uspeh</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Zatvori">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Vaši podaci su uspešno promenjeni.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="window.location.href='login.php'">OK</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    <script>
        <?php if ($update_success) : ?>
        $(document).ready(function() {
            $('#successModal').modal('show');
        });
        <?php endif; ?>
    </script>
</body>
</html>


