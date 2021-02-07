<?php include("includes/header.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

if(empty($_GET['id'])) {

    redirect("photos.php");

} else {

    $photo = Photo::find_by_id($_GET['id']);



    if(isset($_POST['update'])) {

        // echo "YES IT WORKS";

        if($photo) {

            $photo->title_hu = $_POST['title_hu'];
            $photo->title_en = $_POST['title_en'];
            //$photo->description = $_POST['description'];
            $photo->ordinal_number = $_POST['ordinal_number'];

            $photo->save();

            $session->message("A {$photo->filename} frissítve");

            redirect("photos.php?id={$photo->folder_id}");

        }

    }



}

// $photos = Photo::find_all();

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
                            <small>Szerkesztés</small>
                        </h1>                        

                        <!-- the default action is for this is to submitting for itself -->
                        <!-- action attr must be empty, because otherwise (edit_photo.php) we would lost the id ($_GET) -->
                        <form action="" method="post">

                            <div class="col-md-8"> <!-- 8 oszlop szélesség (8/12) -->
                                
                                <div class="form-group">
                                    
                                    <input type="text" name="title_hu" class="form-control" value="<?php echo $photo->title_hu; ?>">

                                </div>

                                <div class="form-group">
                                    
                                    <input type="text" name="title_en" class="form-control" value="<?php echo $photo->title_en; ?>">

                                </div>

                                <div class="form-group">
                                    
                                    <label for="ordinal_number">Sorszám</label>
                                    <input type="number" name="ordinal_number" class="form-control" value="<?php echo $photo->ordinal_number; ?>">

                                </div>

                                <div class="form-group">
                                    
                                    <a class="thumbnail" href="#"><img src="<?php echo $photo->picture_path(); ?>" alt=""></a>

                                </div>

                                <!--<div class="form-group">
                                    
                                    <label for="caption">Description</label>
                                    <textarea class="form-control" name="description" id="" cols="30" rows="10"><?php //echo $photo->description; ?></textarea>
                                </div>-->

                            </div>

                            <div class="col-md-4" > <!-- 4 oszlop szélesség (4/12) -->
                                <div  class="photo-info-box">
                                    <div class="info-box-header"> <!-- sidebar toggle click -->
                                       <h4>Save <span id="toggle" class="glyphicon glyphicon-menu-up pull-right"></span></h4>
                                    </div>
                                    <div class="inside">
                                      <div class="box-inner">
                                         <p class="text">
                                           <span class="glyphicon glyphicon-calendar"></span> Uploaded on: April 22, 2030 @ 5:26
                                          </p>
                                          <p class="text ">
                                            Photo Id: <span class="data photo_id_box">34</span>
                                          </p>
                                          <p class="text">
                                            Filename: <span class="data">image.jpg</span>
                                          </p>
                                         <p class="text">
                                          File Type: <span class="data">JPG</span>
                                         </p>
                                         <p class="text">
                                           File Size: <span class="data">3245345</span>
                                         </p>
                                      </div>
                                      <div class="info-box-footer clearfix">
                                        <div class="info-box-delete pull-left">
                                            <a  href="delete_photo.php?id=<?php echo $photo->id; ?>" class="btn btn-danger btn-lg ">Törlés</a>   
                                        </div>
                                        <div class="info-box-update pull-right ">
                                            <input type="submit" name="update" value="Szerkesztés" class="btn btn-primary btn-lg ">
                                        </div>   
                                      </div>
                                    </div>          
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