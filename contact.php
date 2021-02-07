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

                <!--<h3>Lehoczky Krisztina</h3>-->

                <p class="new-font">Lehoczky Krisztina <?php echo $lang['artist']; ?></p>
                <p class="new-font"><span style="padding-right:10px" class="glyphicon glyphicon-envelope"></span><a href="mailto:<?php echo $user->email; ?>"><?php echo $user->email; ?></a></p>
                <p class="new-font"><span style="padding-right:10px" class="glyphicon glyphicon-earphone"></span><?php echo $user->phone; ?></p>

                <br>
                <br>
                <br>
                <br>
                <br>

                <p class="new-font"><?php echo $lang['Developer']; ?>: Lukács Dávid</p>
                <p class="new-font"><span style="padding-right:10px" class="glyphicon glyphicon-envelope"></span><a href="mailto:lukacs.dvid@gmail.com">lukacs.dvid@gmail.com</a></p>
                <p class="new-font"><span style="padding-right:10px" class="glyphicon glyphicon-earphone"></span>+36 20 249 18 25</p>

            </div>



            <!-- Blog Sidebar Widgets Column -->
            <!-- <div class="col-md-4"> -->

            
                 <?php // include("includes/sidebar.php"); ?>



        </div>
        <!-- /.row -->

        <?php include("includes/footer.php"); ?>
