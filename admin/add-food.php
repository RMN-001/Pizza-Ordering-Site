<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">

        <h1>Pizza hozzáadás</h1>

        <br><br>

        <?php 
            if(isset($_SESSION['upload']))
            {
                echo $_SESSION['upload'];
                unset($_SESSION['upload']);
            }
        ?>

        <!-- Új elem feltöltése -->
        <form action="" method="POST" enctype="multipart/form-data">
        
            <table class="tbl-30">

                <tr>
                    <td>Név: </td>
                    <td>
                        <input type="text" name="title" placeholder="A pizza neve:">
                    </td>
                </tr>

                <tr>
                    <td>Feltétek: </td>
                    <td>
                        <textarea name="description" cols="30" rows="5" placeholder="A pizzán lévő szósz és feltétek:"></textarea>
                    </td>
                </tr>

                <tr>
                    <td>Ár: </td>
                    <td>
                        <input type="number" name="price">
                    </td>
                </tr>

                <tr>
                    <td>Kép kiválasztás: </td>
                    <td>
                        <input type="file" name="image">
                    </td>
                </tr>

                <tr>
                    <td>Kategória: </td>
                    <td>
                        <select name="category">

                            <?php 
                                //Lehetséges kategóriák kiválasztása
                                $sql = "SELECT * FROM tbl_category WHERE active='Yes'";
                                $res = mysqli_query($conn, $sql);
                                $count = mysqli_num_rows($res);

                                if($count>0) {
                                    while($row=mysqli_fetch_assoc($res)) {
                                        $id = $row['id'];
                                        $title = $row['title'];

                                        ?>
                                        <!-- ezek biztos jól állnak? -->
                                        <option value="<?php echo $id; ?>"><?php echo $title; ?></option>

                                        <?php
                                    }
                                } else {
                                    ?>
                                    <option value="0">Nem létező kategória</option>
                                    <?php
                                }
                            
                            ?>

                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Featured: </td>
                    <td>
                        <input type="radio" name="featured" value="Yes"> Igen 
                        <input type="radio" name="featured" value="No"> Nem
                    </td>
                </tr>

                <tr>
                    <td>Elérhető: </td>
                    <td>
                        <input type="radio" name="active" value="Yes"> Igen 
                        <input type="radio" name="active" value="No"> Nem
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit" value="Pizza hozzáadás" class="btn-secondary">
                    </td>
                </tr>

            </table>

        </form>

        
        <?php 
            //Feltöltés véglegesítése
            if(isset($_POST['submit'])) {
                $title = $_POST['title'];
                $description = $_POST['description'];
                $price = $_POST['price'];
                $category = $_POST['category'];

                if(isset($_POST['featured'])) {
                    $featured = $_POST['featured'];
                } else {
                    $featured = "No";
                }

                if(isset($_POST['active'])) {
                    $active = $_POST['active'];
                } else {
                    $active = "No";
                }

                if(isset($_FILES['image']['name'])) {
                    $image_name = $_FILES['image']['name'];

                    if($image_name!="") {
                        $ext = end(explode('.', $image_name));
                        $image_name = rand(0000,9999) . "." . $ext; //új pizza : pl. vegetarianus.jpeg
                        $src = $_FILES['image']['tmp_name'];
                        $dst = "../images/food/".$image_name;
                        $upload = move_uploaded_file($src, $dst);

                        if($upload==false) {
                            $_SESSION['upload'] = "<div class='error'>A kép feltöltés sikertelen!</div>";
                            header('location:'.SITEURL.'admin/add-food.php');
                            die();
                        }
                    }
                } else {
                    $image_name = "";
                }

                //Pizza hozzáadsá az adatbázishoz
                $sql2 = "INSERT INTO tbl_food SET 
                    title = '$title',
                    description = '$description',
                    price = $price,
                    image_name = '$image_name',
                    category_id = $category,
                    featured = '$featured',
                    active = '$active'
                ";

                $res2 = mysqli_query($conn, $sql2);

                if($res2 == true) {
                    $_SESSION['add'] = "<div class='success'>Pizza hozzáadása sikeres!</div>";
                    header('location:'.SITEURL.'admin/manage-food.php');
                } else {
                    $_SESSION['add'] = "<div class='error'>Pizza hozzáadás sikertelen!</div>";
                    header('location:'.SITEURL.'admin/manage-food.php');
                } 
            }

        ?>

    </div>
</div>

<?php include('partials/footer.php'); ?>