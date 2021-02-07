<?php include("includes/header.php"); ?>


<?php

if(empty($_GET['id'])) {

    redirect("folders.php");

}

$photos = Folder::find_the_photos($_GET['id']);

?>

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-12"> <!-- 100% szélesség -->

                <div class="thumbnails row">
        
                    <?php foreach ($photos as $photo): ?>

                            <!--<div class="col-xs-6 col-md-3">-->
                            <div class="col-md-4">

                                <a class="thumbnail" href="photo.php?id=<?php echo $photo->id.'&lang='.$_SESSION['lang']; ?>">
                                    <img class="item_photo img-responsive" src="admin/<?php echo $photo->picture_path(); ?>" alt="">

                                    <div class="caption new-font">
                                        <?php echo $photo->{"title_".$_GET['lang']}; ?>
                                    </div>

                                </a>

                            </div>


                    <?php endforeach; ?>

                </div>


            </div>



            <!-- Blog Sidebar Widgets Column -->
            <!-- <div class="col-md-4"> -->

            
                 <?php // include("includes/sidebar.php"); ?>



        </div>
        <!-- /.row -->

        <?php include("includes/footer.php"); ?>
