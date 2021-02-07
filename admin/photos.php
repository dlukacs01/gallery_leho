<?php include("includes/header.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

// $photos = Photo::find_all();

// find photos related to specific folder
$photos = Folder::find_the_photos($_GET['id']);
$folder = Folder::find_by_id($_GET['id']);

?>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            


        <?php include("includes/top_nav.php"); ?>




            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->



        <?php include("includes/side_nav.php"); ?>


            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">


            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Képek
                            <small><?php echo $folder->title_hu; ?></small>
                        </h1>                        

                        <p class="bg-success">
                            <?php echo $message; ?>
                        </p>

                        <div class="col-md-12"> <!-- 100% szélesség -->
                            
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Kép</th>
                                        <th>Sorszám</th>
                                        <th>Fájlnév</th>
                                        <th>Cím</th>
                                        <th>Cím angolul</th>
                                        <th>Fájlméret</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($photos as $photo) : ?>
                                                                        
                                        <tr>

                                            <!-- <td><img src="http://placehold.it/62x62" alt=""></td> -->

                                            <td><img class="admin-photo-thumbnail" src="<?php echo $photo->picture_path(); ?>" alt="">

                                                <div class="action_links">

                                                    <a class="delete_link" href="delete_photo.php?id=<?php echo $photo->id; ?>">Törlés</a>
                                                    <a href="edit_photo.php?id=<?php echo $photo->id; ?>">Szerkesztés</a>
                                                    <!--<a href="../photo.php?id=<?php //echo $photo->id; ?>">View</a>-->

                                                </div>

                                            </td>
                                            <td><?php echo $photo->ordinal_number; ?></td>
                                            <td><?php echo $photo->filename; ?></td>
                                            <td><?php echo $photo->title_hu; ?></td>
                                            <td><?php echo $photo->title_en; ?></td>
                                            <td><?php echo $photo->size; ?></td>
                                        </tr>

                                    <?php endforeach; ?>

                                </tbody>
                            </table> <!-- End of Table -->

                        </div>

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->


        </div>
        <!-- /#page-wrapper -->

  <?php include("includes/footer.php"); ?>