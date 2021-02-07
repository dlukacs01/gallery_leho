<?php include("includes/header.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

if(empty($_GET['id'])) {

    redirect("folders.php");

}

$folder = Folder::find_by_id($_GET['id']);

?>

<?php include("includes/photo_library_modal.php"); ?>

<?php

if(isset($_POST['update'])) {

    if($folder) {

        $folder->title_hu = $_POST['title_hu'];
        $folder->title_en = $_POST['title_en'];
        $folder->ordinal_number = $_POST['ordinal_number'];

        $folder->save(); // ha nincs kép kiválasztva, akkor csak db mentés (update lesz)
        $session->message("A mappa frissítve lett"); // needs to be set BEFORE redirect
        redirect("folders.php");

    }

}

// $users = user::find_all();

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
                            <small>Mappa szerkesztése</small>
                        </h1>                        

                        <div class="col-md-6 user_image_box"> <!-- half of the screen -->

                            <a href="#photo-library" data-toggle="modal"> <!--data-target is the id-->

                                <!--<img class="img-responsive" src="<?php //echo $user->image_path_and_placeholder(); ?>" alt="">-->
                                <img class="img-responsive" src="<?php echo $folder->cover_photo(); ?>" alt="">

                            </a>
                            
                        </div>

                        <!-- the default action is for this is to submitting for itself -->
                        <!-- action attr must be empty, because otherwise (edit_user.php) we would lost the id ($_GET) -->
                        <form action="" method="post" enctype="multipart/form-data">

                            <!-- col-md-offset-3: bal margin növelése 3 oszlopnyival -->
                            <!-- <div class="col-md-6 col-md-offset-3"> --> <!-- 6 oszlop szélesség (6/12) -->
                            
                            <div class="col-md-6">

                                <div class="form-group">
                                    
                                    <label for="title_hu">Cím magyarul</label>
                                    <input type="text" name="title_hu" class="form-control" value="<?php echo $folder->title_hu; ?>">

                                </div>

                                <div class="form-group">
                                    
                                    <label for="title_en">Cím angolul</label>
                                    <input type="text" name="title_en" class="form-control" value="<?php echo $folder->title_en; ?>">

                                </div>

                                <div class="form-group">
                                    
                                    <label for="ordinal_number">Sorszám</label>
                                    <input type="number" name="ordinal_number" class="form-control" value="<?php echo $folder->ordinal_number; ?>">

                                </div>

                                <div class="form-group">
                                    
                                    <a id="folder-id" class="btn btn-danger" href="delete_folder.php?id=<?php echo $folder->id; ?>">Törlés</a>

                                    <input type="submit" name="update" class="btn btn-primary pull-right" value="Szerkesztés">

                                </div>

                            </div>

                        </form>


                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->


        </div>
        <!-- /#page-wrapper -->

  <?php include("includes/footer.php"); ?>