<?php

//öröklés a Db_object Class-tól
class Folder extends Db_object {

	protected static $db_table = "folders";

	// CRUD-hoz ezek kellenek (db fields)
	protected static $db_table_fields = array('id', 'title_hu', 'title_en', 'parent_id', 'photo_id', 'ordinal_number');

	// property names must match db column names
	public $id;
	public $title_hu;
	public $title_en;
	public $parent_id;
	public $photo_id;
	public $ordinal_number;

	public $image_placeholder = "images/160x160&text=image.png";

	// find cover_photo related to specific folder
	public function cover_photo() {
		
		$cover_photo = Photo::find_by_id($this->photo_id);

		// senbd back cover photo img path if it is set already
		return !empty($cover_photo) ? $cover_photo->picture_path() : $this->image_placeholder;
		
	}

	// to find the photos related to a specific folder_id
	public static function find_the_photos($folder_id=0) {

		global $database;

		$sql = "SELECT * FROM photos ";
		$sql .= "WHERE folder_id = " . $database->escape_string($folder_id) . " ORDER BY ordinal_number";

		return $photos = Photo::find_by_query($sql);

	}

	// for selecting the cover photo
	public static function find_the_photos_deep($folder_id=0) {

		$photos = array();

		$photos[] = self::find_the_photos($folder_id);

		$subfolders = self::findChildren($folder_id);

		if($subfolders) {
			foreach ($subfolders as $subfolder) {
				$photos[] = self::find_the_photos($subfolder->id);
			}
		}

		$photos_merged = array_merge(...$photos);

		return $photos_merged;

	}

	public function delete_folder_with_photos() {

		if($this->delete()) { // 1) delete folder from db

			// 2) find the subfolders related to that folder
			$subfolders = self::findChildren($this->id);

			// 3) if we have subfolders, run delete for all of them
			if($subfolders) {
				foreach ($subfolders as $subfolder) {
					$subfolder->delete_folder_with_photos();
				}
			}

			$photos = self::find_the_photos($this->id); // 4) find all photos related to that folder

			// 5) delete all those photos from db AND from the server as well
			foreach ($photos as $photo) {
				$photo->delete_photo();
			}

			//$target_path = SITE_ROOT . DS . 'admin' . DS . $this->upload_directory . DS . $this->user_image; // admin/images/filename

			//return unlink($target_path) ? true : false; // delete file

		} else {

			return false;

		}

	}

	public static function findChildren($parent_id=0){

		global $database;

		$sql = "SELECT * FROM " . self::$db_table . " ";
		$sql .= "WHERE parent_id = " . $parent_id . " ORDER BY ordinal_number";

		return $children = Folder::find_by_query($sql);

	}

	public function generatePath(){

		if(self::findChildren($this->id)){
			return "folders.php?id=".$this->id."&lang=".$_SESSION['lang']."";
		} else {
			return "items.php?id=".$this->id."&lang=".$_SESSION['lang']."";
		}

	}

	public function generatePathAdmin(){

		if(self::findChildren($this->id)){
			return "select_folder.php?id=".$this->id."";
		} else {
			return "photos.php?id=".$this->id."";
		}

	}

	public function ajax_save_cover_image($photo_id, $folder_id) {

		global $database;

		$photo_id = $database->escape_string($photo_id);
		$folder_id = $database->escape_string($folder_id);

		$this->photo_id = $photo_id;
		$this->id = $folder_id;

		// updating only user image column so the rest of user data wont get lost
		$sql = "UPDATE " . self::$db_table . " SET photo_id = {$this->photo_id} ";
		$sql .= " WHERE id = {$this->id}";
		$update_image = $database->query($sql);

		echo $this->cover_photo(); // echo cover image path

	}

} // End of Class User


?>