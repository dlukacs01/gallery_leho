<?php include("includes/header.php"); ?>

<?php if(!$session->is_signed_in()) {redirect("login.php");} ?>

<?php

// find the first-level folders (master folders)
$folders = Folder::findChildren(0);

$folder = new Folder();

if(isset($_POST['create'])) {

    // echo "Hello";

    if($folder) {

        $folder->title_hu = $_POST['title_hu'];
        $folder->title_en = $_POST['title_en'];
        $folder->parent_id = $_POST['parent_id'];
        
        $folder->save(); // save to db
        $session->message("A mappa {$folder->title_hu} sikeresen létrehozva");
        redirect("folders.php");

    }

    // if($user) {

    //     $user->title = $_POST['title'];
    //     $user->caption = $_POST['caption'];
    //     $user->alternate_text = $_POST['alternate_text'];
    //     $user->description = $_POST['description'];

    //     $user->save();

    // }

}


// $users = user::find_all();

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
                            Mappák
                            <small>Új mappa létrehozása</small>
                        </h1>                        

                        <!-- the default action is for this is to submitting for itself -->
                        <!-- action attr must be empty, because otherwise (edit_user.php) we would lost the id ($_GET) -->
                        <form action="" method="post" enctype="multipart/form-data">

                            <!-- col-md-offset-3: bal margin növelése 3 oszlopnyival -->
                            <div class="col-md-6 col-md-offset-3"> <!-- 6 oszlop szélesség (6/12) -->
                                
                                <!--<div class="form-group">
                                    
                                    <input type="file" name="user_image">

                                </div>-->

                                <div class="form-group">
                                    
                                    <label for="title_hu">Cím</label>
                                    <input type="text" name="title_hu" class="form-control">

                                </div>

                                <div class="form-group">
                                    
                                    <label for="title_en">Cím angolul</label>
                                    <input type="text" name="title_en" class="form-control">

                                </div>

                                <div class="form-group">
                                  <label for="folder">Szülő mappa:</label>
                                  <select class="form-control" id="folder" name="parent_id">

                                    <option value="" selected disabled>Válassz szülő mappát</option>
                                    <option value="0">Nincs szülő (master szint)</option>
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
                                    
                                    <input type="submit" name="create" class="btn btn-primary pull-right">

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