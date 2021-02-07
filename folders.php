<?php include("includes/header.php"); ?>


<?php

// $folders = Folder::find_all();

$parent_id = isset($_GET['id']) ? $_GET['id'] : 0;
$folders = Folder::findChildren($parent_id);

?>

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-12"> <!-- 100% szélesség -->

                <div class="thumbnails row">
        
                    <?php foreach ($folders as $folder): ?>

                            <div class="col-xs-12 col-md-3">
                                
                                <div class="thumbnail">                                                                        

                                    <!--<a class="thumbnail" href="items.php?id=<?php //echo $folder->id; ?>">-->
                                    <a href="<?php echo $folder->generatePath(); ?>">

                                        <!--<img class="home_page_photo img-responsive" src="admin/<?php //echo $photo->picture_path(); ?>" alt="">-->
                                        <img class="home_page_photo img-thumbnail img-responsive" src="admin/<?php echo $folder->cover_photo(); ?>" alt="">

                                    </a>

                                    <div class="caption new-font">
                                        <p><?php echo $folder->{"title_".$_GET['lang']}; ?></p>
                                    </div>

                                </div>

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
