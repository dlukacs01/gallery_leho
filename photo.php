<?php include("includes/header.php"); ?>

<?php

require_once("admin/includes/init.php");

if(empty($_GET['id'])) {

    redirect("index.php");

}

$photo = Photo::find_by_id($_GET['id']);

// find id of next photo in the same folder
$next_id = $photo->findNext();

$previous_id = $photo->findPrevious();

// echo $photo->title;

if(isset($_POST['submit'])) {

    // echo "Hello";

    $author = trim($_POST['author']); // taking care of spaces (trim)
    $body = trim($_POST['body']);

    $new_comment = Comment::create_comment($photo->id, $author, $body);

    if($new_comment && $new_comment->save()) {

        redirect("photo.php?id={$photo->id}");

    } else {

        $message = "There was some problem saving";

    }

} else {

    $author = "";
    $body = "";

}

// a fotohoz tartozo kommentek lekerese
$comments = Comment::find_the_comments($photo->id);

?>


<div class="row">

    <div class="col-lg-12"> <!-- 100% szelesseg - kozepre igazitashoz -->

        <!-- Blog Post -->

        <!-- Title -->
        <!--<h1><?php //echo $photo->title; ?></h1>-->

        <!-- Author -->
        <!--<p class="lead">
            by <a href="#">Edwin Diaz</a>
        </p>-->

        <!--<hr>-->

        <!-- Date/Time -->
        <!--<p><span class="glyphicon glyphicon-time"></span> Posted on August 24, 2013 at 9:00 PM</p>-->

        <!--<hr>-->

        <!-- Preview Image -->
        <!-- <img class="img-responsive" src="http://placehold.it/900x300" alt=""> -->
        <br>
        <img class="img-responsive center-block" src="admin/<?php echo $photo->picture_path(); ?>" alt="">

        <!--<hr>-->

        <!-- Post Content -->
        <!--<p class="lead"><?php //echo $photo->caption; ?></p>-->
        <!--<p><?php //echo $photo->description; ?></p>-->

        <br>
        <p class="text-center new-font"><?php echo $photo->{"title_".$_GET['lang']}; ?></p>

          <ul class="pager">
            <?php if($previous_id): ?>
            <li class="previous"><a href="photo.php?id=<?php echo $previous_id; ?>&lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['Previous']; ?></a></li>
            <?php endif; ?>
            <?php if($next_id): ?>
            <li class="next"><a href="photo.php?id=<?php echo $next_id; ?>&lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['Next']; ?></a></li>
            <?php endif; ?>
          </ul>

        <!--<hr>-->

        <!-- Blog Comments -->

        <!-- Comments Form -->


        <!--<div class="well">
            <h4>Leave a Comment:</h4>
            <form role="form" method="post">
                <div class="form-group">
                    <label for="author">Author</label>
                    <input type="text" name="author" class="form-control">
                </div>
                <div class="form-group">
                    <textarea name="body" class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" name="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>-->




        <!--<hr>-->

        <!-- Posted Comments -->




        <!-- Comment -->

        <?php foreach ($comments as $comment) : ?>

        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object" src="http://placehold.it/64x64" alt="">
            </a>
            <div class="media-body">
                <h4 class="media-heading"><?php echo $comment->author; ?>
                    <small>August 25, 2014 at 9:30 PM</small>
                </h4>
                <?php echo $comment->body; ?>
            </div>
        </div>

        <?php endforeach; ?>


    </div>





        <!-- Blog Sidebar Widgets Column -->
    <!--     <div class="col-md-4"> -->

        
             <?php // include("includes/sidebar.php"); ?>



    <!-- </div> -->
    <!-- /.row -->

</div>

<?php include("includes/footer.php"); ?>

            