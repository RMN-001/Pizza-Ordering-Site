<?php include('partials-front/menu.php'); ?>

<section class="food-search text-center">
        <div class="container">
            
            <form action="<?php echo SITEURL; ?>food-search.php" method="POST">
                <input type="search" name="search" placeholder="Pizza keresése" required>
                <input type="submit" name="submit" value="Keresés" class="btn btn-primary">
            </form>

        </div>
</section>



<?php include('partials-front/footer.php'); ?>