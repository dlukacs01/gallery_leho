<?php //include("includes/header.php"); ?>


<!--HEADER-->

<?php //require_once("admin/includes/init.php"); ?> <!-- to bring in our classes -->
<?php //include("includes/lang_selector.php"); ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lehoczky Krisztina festőművész</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/blog-home.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- our own custom CSS file -->
    <link href="css/styles.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>

        body{
            background-image:url(kepresz1.jpg);
            background-repeat:no-repeat;
            background-position:50% top;
        }

        /* kis fuggoleges vonalhoz */
        p {
            font-size: 20px;
            font-weight:bold;
            color: #ddd;
        }

        p a{
            font-size: 16px;
            font-weight:lighter;
            color: inherit !important;
            text-decoration: none !important;
        }

    </style>

</head>

<body>



    <!-- Navigation -->
<?php //include("navigation.php"); ?>

    <!-- Page Content -->
    <div class="container">

<!--HEADER-->





        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-12"> <!-- 100% szélesség -->

                <?php //echo $user->{"cv_".$_SESSION['lang']}; ?>

                <img src="name8.png" alt="">

                <p class="text-right">
                    <a href="folders.php?lang=hu">belépés</a>
                    &nbsp;&nbsp;&#124;&nbsp;&nbsp;
                    <a href="folders.php?lang=en">enter</a>
                </p>

            </div>



            <!-- Blog Sidebar Widgets Column -->
            <!-- <div class="col-md-4"> -->

            
                 <?php // include("includes/sidebar.php"); ?>



        </div>
        <!-- /.row -->

        <?php //include("includes/footer.php"); ?>

<!--FOOTER-->



        <!--<hr>-->

        <!-- Footer -->

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>






<!--FOOTER-->
