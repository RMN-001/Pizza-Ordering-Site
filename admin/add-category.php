<?php include('partials/menu.php'); ?>

    <div class="main-content">
        <div class="wrapper">

            <h1>Kategória hozzáadás</h1>

            <br><br>

            <?php 
            
                if(isset($_SESSION['add'])) {
                    echo $_SESSION['add'];
                    unset($_SESSION['add']);
                }

                if(isset($_SESSION['upload'])) {
                    echo $_SESSION['upload'];
                    unset($_SESSION['upload']);
                }
            
            ?>

            <br><br>
            
            <!-- Új elem feltöltése -->
            <form action="" method="POST" enctype="multipart/form-data">

                <table class="tbl-30">
                    <tr>
                        <td>Név: </td>
                        <td>
                            <input type="text" name="title" placeholder="Kategória neve">
                        </td>
                    </tr>

                    <tr>
                        <td>Kép kiválasztása: </td>
                        <td>
                            <input type="file" name="image">
                        </td>
                    </tr>

                    <tr>
                        <td>Featured: </td> <!-- biztos kell? -->
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
                            <input type="submit" name="submit" value="Kategória hozzáadás" class="btn-secondary">
                        </td>
                    </tr>

                </table>

            </form>

            <?php 
                //Elérhetőség ellenőrzés
                if(isset($_POST['submit'])) {
                    
                    $title = $_POST['title'];

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

                    //Kép ellenőrzés
                    if(isset($_FILES['image']['name'])) {
                        $image_name = $_FILES['image']['name'];
                        
                        if($image_name != "") {
                            $ext = end(explode('.', $image_name));
                            $image_name = "Pizza_Kategoria_".rand(000, 999).'.'.$ext; // pl. Pizza_Kategoria_834.jpg
                            $source_path = $_FILES['image']['tmp_name'];
                            $destination_path = "../images/category/".$image_name;
                            $upload = move_uploaded_file($source_path, $destination_path);

                            if($upload==false) {
                                $_SESSION['upload'] = "<div class='error'>A kép feltöltése sikertelen!</div>";
                                header('location:'.SITEURL.'admin/add-category.php');
                                die();
                            }
                        }
                    } else {
                        $image_name="";
                    }

                    //Kategória hozzáadása az adatbázishoz
                    $sql = "INSERT INTO tbl_category SET 
                        title='$title',
                        image_name='$image_name',
                        featured='$featured',
                        active='$active'
                    ";

                    $res = mysqli_query($conn, $sql);

                    if($res==true) {
                        $_SESSION['add'] = "<div class='success'>Kategória sikeresen hozzáadva!</div>";
                        header('location:'.SITEURL.'admin/manage-category.php');
                    } else {
                        $_SESSION['add'] = "<div class='error'>Kategória hozzáadás sikertelen!</div>";
                        header('location:'.SITEURL.'admin/add-category.php');
                    }
                }
            ?>

        </div>
    </div>

<?php include('partials/footer.php'); ?>