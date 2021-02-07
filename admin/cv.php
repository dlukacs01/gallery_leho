<?php include("includes/header.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

// getting cv of logged in user
$user = User::find_by_id($_SESSION['user_id']);

if(isset($_POST['update'])) {

    if($user) {

        $user->cv_hu = $_POST['cv_hu'];
        $user->cv_en = $_POST['cv_en'];

        $user->save(); // ha nincs kép kiválasztva, akkor csak db mentés (update lesz)
        $session->message("Az életrajz frissítve lett"); // needs to be set BEFORE redirect
        redirect("cv.php");

    }

}

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
                            Életrajz
                            <small></small>
                        </h1>

                        <div class="row">

                            <div class="col-md-6"> <!-- it takes half of the screen / container -->
                                <p class="bg-success">
                                    <?php echo $message; ?>
                                </p>
                                <form action="cv.php" method="post" enctype="multipart/form-data">

                                    <div class="form-group">
                                        <label for="cv_hu">Magyar</label>
                                        <textarea class="form-control" name="cv_hu" id="cv_hu" cols="30" rows="30"><?php echo $user->cv_hu; ?></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="cv_en">Angol</label>
                                        <textarea class="form-control" name="cv_en" id="cv_en" cols="30" rows="30"><?php echo $user->cv_en; ?></textarea>
                                    </div>

                                    <!--<input type="submit" name="submit">-->
                                    <input type="submit" name="update" class="btn btn-primary pull-right" value="Frissítés">

                                </form>
                            </div>

                        </div><!-- End of Row -->

                        <!--<div class="row">
                            
                            <div class="col-lg-12">
                                
                                <form action="upload.php" class="dropzone"></form>

                            </div>

                        </div>-->

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->


        </div>
        <!-- /#page-wrapper -->

  <?php include("includes/footer.php"); ?>