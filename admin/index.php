<?php include("includes/header.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

// getting all folders from db
// $folders = Folder::find_all();

// find the first-level folders (master folders)
$folders = Folder::findChildren(0);

$message = "";

if(isset($_POST['submit'])) { // regular form upload
// if(isset($_FILES['file'])) { // for dropzone

    // echo "<h1>HELLO</h1>";

    $photo = new Photo();

    $photo->user_id = $_SESSION['user_id'];
    $photo->folder_id = $_POST['folder_id']; // setting folder_id (form properties)

    $photo->title_hu = $_POST['title_hu']; // setting title (form properties)
    $photo->title_en = $_POST['title_en'];

    $photo->set_file($_FILES['file_upload']); // setting upload properties REGULAR
    // $photo->set_file($_FILES['file']); // setting upload properties DROPZONE

    if($photo->save()) {

        $message = "Kép sikeresen feltöltve";

    } else {

        $message = join("<br>", $photo->errors); // displaying the errors

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
                            Feltöltés
                            <small></small>
                        </h1>

                        <div class="row">

                            <div class="col-md-6"> <!-- it takes half of the screen / container -->
                                <?php echo $message; ?>
                                <form action="index.php" method="post" enctype="multipart/form-data">
                                    
                                    <div class="form-group">
                                        <label for="title_hu">Cím:</label>
                                        <input type="text" name="title_hu" class="form-control" id="title_hu">
                                    </div>

                                    <div class="form-group">
                                        <label for="title_en">Cím angolul:</label>
                                        <input type="text" name="title_en" class="form-control" id="title_en">
                                    </div>

                                    <div class="form-group">
                                      <label for="folder">Mappa:</label>
                                      <select class="form-control" id="folder" name="folder_id">

                                        <option value="" selected disabled>Válassz mappát</option>
                                        <?php foreach ($folders as $folder): ?>
                                            <option value="<?php echo $folder->id; ?>"><?php echo $folder->title_hu; ?></option>

                                            <?php $children_folders = Folder::findChildren($folder->id); ?>
                                            <?php foreach ($children_folders as $children_folder): ?>
                                                <option value="<?php echo $children_folder->id; ?>"><?php echo "--".$children_folder->title_hu; ?></option>
                                            <?php endforeach; ?>

                                        <?php endforeach; ?>

                                      </select>
                                    </div>

                                    <div class="form-group">
                                        <input type="file" name="file_upload"> <!-- regular form upload -->
                                        <!--<input type="file" name="file">--> <!-- for dropzone -->
                                    </div>

                                    <input type="submit" name="submit">

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