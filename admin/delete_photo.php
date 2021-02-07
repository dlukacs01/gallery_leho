<?php include("includes/init.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

// echo "it works";

if(empty($_GET['id'])) {

    redirect("photos.php");

}

$photo = Photo::find_by_id($_GET['id']);

if($photo) {

    $photo->delete_photo();

    $session->message("A {$photo->filename} törölve");    

    redirect("photos.php?id={$photo->folder_id}");

} else {

    redirect("photos.php");

}

?>