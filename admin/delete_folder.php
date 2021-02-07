<?php include("includes/init.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

// echo "it works";

if(empty($_GET['id'])) {

    redirect("folders.php");

}

$folder = Folder::find_by_id($_GET['id']);

if($folder) {

    // $folder->delete(); // delete from db

	// 1) delete folder from db
	// 2) delete photos from db
	// 3) delete photos from server
    $folder->delete_folder_with_photos();

    // $user->delete_photo(); // delet from db and photo as well

	$session->message("A {$folder->title} mappa és a teljes tartalma törölve");

    redirect("folders.php");

} else {

    redirect("folders.php");

}

?>