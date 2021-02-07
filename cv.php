<?php include("includes/header.php"); ?>


<?php

// PAGINATION

// (int) makes sure that it is an integer
$page = !empty($_GET['page']) ? (int)$_GET['page'] : 1; // setting initial value

$items_per_page = 4; // (LIMIT in SQL)

$items_total_count = Photo::count_all(); // how many photos we have

$paginate = new Paginate($page, $items_per_page, $items_total_count);

$sql = "SELECT * FROM photos ";
$sql .= "LIMIT {$items_per_page} ";
$sql .= "OFFSET {$paginate->offset()}";

$photos = Photo::find_by_query($sql);

// PAGINATION

// $photos = Photo::find_all();

$user = User::find_by_id(1);

?>

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-12"> <!-- 100% szélesség -->

                <?php echo $user->{"cv_".$_SESSION['lang']}; ?>

            </div>



            <!-- Blog Sidebar Widgets Column -->
            <!-- <div class="col-md-4"> -->

            
                 <?php // include("includes/sidebar.php"); ?>



        </div>
        <!-- /.row -->

        <?php include("includes/footer.php"); ?>
