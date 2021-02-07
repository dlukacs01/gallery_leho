<?php require("init.php");

$folder = new Folder();

if(isset($_POST['folder_id'])) {

	$folder->ajax_save_cover_image($_POST['photo_id'], $_POST['folder_id']);

	// echo "This is data from the server";

}

if(isset($_POST['sidebar_flag'])) {

	// echo "IT WORKS";

	Photo::display_sidebar_data($_POST['photo_id']);

}

?>