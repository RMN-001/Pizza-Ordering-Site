<?php include('partials-front/menu.php'); ?>

    <section class="food-search text-center">
        <div class="container">
            
            <form action="<?php echo SITEURL; ?>food-search.php" method="POST">
                <input type="search" name="search" placeholder="Keresés" required>
                <input type="submit" name="submit" value="Keresés" class="btn btn-primary">
            </form>

        </div>
    </section>

    <?php 
        if(isset($_SESSION['rendelés']))
        {
            echo $_SESSION['rendelés'];
            unset($_SESSION['rendelés']);
        }
    ?>

    <section class="categories">
        <div class="container">
            <h2 class="text-center">Pizza típusok</h2>

            <?php 
                $sql = "SELECT * FROM tbl_category WHERE active='Yes' AND featured='Yes' ORDER BY id DESC LIMIT 3";
                $res = mysqli_query($conn, $sql);
                $count = mysqli_num_rows($res);

                if($count>0)
                {
                    while($row=mysqli_fetch_assoc($res))
                    {
                        $id = $row['id'];
                        $title = $row['title'];
                        $image_name = $row['image_name'];
                        ?>
                        
                        <a href="<?php echo SITEURL; ?>category-foods.php?category_id=<?php echo $id; ?>">
                            <div class="box-3 float-container">
                                <?php 
                                    if($image_name=="")
                                    {
                                        echo "<div class='error'>A kép nem elérhető!</div>";
                                    }
                                    else
                                    {
                                        ?>
                                        <img src="<?php echo SITEURL; ?>images/category/<?php echo $image_name; ?>" alt="Pizza" class="img-responsive img-curve">
                                        <?php
                                    }
                                ?>
                                <h3 class="float-text text-white" ><mark style="background-color:white;"><?php echo $title; ?></mark></h3>
                            </div>
                        </a>

                        <?php
                    }
                }
                else
                {
                    echo "<div class='error'>Az adott típus nem elérhető</div>";
                }
            ?>
            <div class="clearfix"></div>
        </div>
    </section>

    <section class="food-menu">
        <div class="container">

            <h2 class="text-center">Étlapunk</h2>

            <?php
            $sql2 = "SELECT * FROM tbl_food WHERE active='Yes' AND featured='Yes' LIMIT 6";
            $res2 = mysqli_query($conn, $sql2);
            $count2 = mysqli_num_rows($res2);

            if($count2>0)
            {
                while($row=mysqli_fetch_assoc($res2))
                {
                    $id = $row['id'];
                    $title = $row['title'];
                    $price = $row['price'];
                    $description = $row['description'];
                    $image_name = $row['image_name'];
                    ?>

                    <div class="food-menu-box">
                        <div class="food-menu-img">
                            <?php
                                if($image_name=="")
                                {
                                    echo "<div class='error'>A kép nem elérhető.</div>";
                                }
                                else
                                {
                                    ?>
                                    <img src="<?php echo SITEURL; ?>images/food/<?php echo $image_name; ?>" alt="Hawai Pizza" class="img-responsive img-curve">
                                    <?php
                                }
                            ?>
                            
                        </div>

                        <div class="food-menu-desc">
                            <h4><?php echo $title; ?></h4>
                            <p class="food-price"><?php echo $price; ?> FT</p>
                            <p class="food-detail">
                                <?php echo $description; ?>
                            </p>
                            <br>

                            <a href="<?php echo SITEURL; ?>order.php?food_id=<?php echo $id; ?>" class="btn btn-primary">Rendelés</a>
                        </div>
                    </div>

                    <?php
                }
            }
            else
            {
                echo "<div class='error'>Az adott pizza nem elérhető!</div>";
            }
            
            ?>
            <div class="clearfix"></div>
        </div>

        <p class="text-center">
            <!-- Át kellene ugorjon az étlap fülre -->
            <a href="<?php echo SITEURL; ?>foods.php">Összes pizza megjelenítése</a>
        </p>

    </section>

    
    <?php include('partials-front/footer.php'); ?>