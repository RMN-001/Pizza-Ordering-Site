<?php include('config/constants.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza Pozzo</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <section class="navbar">
        <div class="container">

            <div class="logo">
                <a href="#" title="Logo">
                    <img src="images/logo2.png" alt="Pizzeria logo" class="img-responsive">
                </a>
            </div>

            <div class="menu text-right">
                <ul>
                    <li>
                        <a href="<?php echo SITEURL; ?>">Kezdőlap</a>
                    </li>
                    <li>
                        <a href="<?php echo SITEURL; ?>categories.php">Kategóriák</a>
                    </li>
                    <li>
                        <a href="<?php echo SITEURL; ?>foods.php">Étlap</a>
                    </li>
                    <li>
                        <!-- ide egy plsuz oldal?-->
                        <a href="#">Kapcsolat</a> 
                    </li>
                </ul>
            </div>

            <div class="clearfix"></div>
        </div>
    </section>