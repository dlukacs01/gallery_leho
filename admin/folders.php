<?php include("includes/header.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

//$folders = Folder::find_all();

$parent_id = isset($_GET['id']) ? $_GET['id'] : 0;
$folders = Folder::findChildren($parent_id);

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
                            Mappák
<!--                             <small>Subheading</small> -->
                        </h1>

                        <p class="bg-success">
                            <?php echo $message; ?>
                        </p>

                        <a href="add_folder.php" class="btn btn-primary">Új mappa</a>

                        <div class="col-md-12"> <!-- 100% szélesség -->
                            
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <!--<th>Id</th>-->
                                        <th>Sorszám</th>
                                        <th>Borítókép</th>
                                        <th>Cím</th>
                                        <th>Cím angolul</th>
                                        <th>Mappák száma</th>
                                        <th>Képek száma</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($folders as $folder) : ?>
                                                                        
                                        <tr>

                                            <!--<td><?php //echo $folder->id; ?></td>-->
                                            <td><?php echo $folder->ordinal_number; ?></td>

                                            <!-- TODO admin-user-thumbnail CSS itt kell? -->
                                            <td><img class="admin-user-thumbnail user_image" src="<?php echo $folder->cover_photo(); ?>" alt=""></td>

                                            <td><?php echo $folder->title_hu; ?>

                                                <div class="action_links">

                                                    <a class="delete_link" href="delete_folder.php?id=<?php echo $folder->id; ?>">Törlés</a>
                                                    <a href="edit_folder.php?id=<?php echo $folder->id; ?>">Szerkesztés</a>

                                                </div>

                                            </td>

                                            <td><?php echo $folder->title_en; ?></td>

                                            <td><a href="folders.php?id=<?php echo $folder->id; ?>"><?php echo count($folder->findChildren($folder->id)); ?></a></td>
                                            <td><?php echo count($folder->find_the_photos($folder->id)); ?></td>
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