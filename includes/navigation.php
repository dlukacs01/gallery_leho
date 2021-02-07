    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="folders.php?lang=<?php echo $_SESSION['lang']; ?>">LEHOCZKY KRISZTINA</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="cv.php?lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['Biography']; ?></a>
                    </li>
                    <li>
                        <a href="folders.php?lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['Gallery']; ?></a>
                    </li>
                    <li>
                        <a href="news.php?lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['News']; ?></a>
                    </li>
                    <li>
                        <a href="bibliography.php?lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['Bibliography']; ?></a>
                    </li>
                    <li>
                        <a href="links.php?lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['Links']; ?></a>
                    </li>
                    <li>
                        <a href="contact.php?lang=<?php echo $_SESSION['lang']; ?>"><?php echo $lang['Contact']; ?></a>
                    </li>
                    <!--<li>
                        <a href="admin"><?php //echo $lang['Admin']; ?></a>
                    </li>-->
                </ul>
                <ul class="nav navbar-nav navbar-right">

                    <?php

                    $url = $_SERVER['PHP_SELF']; // get current URL (no params)

                    $params = $_GET; // get all params from current URL

                    $params['lang'] = 'hu'; // add extra param
                    printf('<li><a href="%s?%s"><img src="lang/hu.gif" alt=""></a></li>', $url, http_build_query($params)); // build final URL

                    $params['lang'] = 'en';
                    printf('<li><a href="%s?%s"><img src="lang/en.gif" alt=""></a></li>', $url, http_build_query($params));

                    ?>

                    <!--<li><a href="<?php //echo $url_hu; ?>"><img src="lang/hu.gif" alt=""></a></li>-->
                    <!--<li><a href="<?php //echo $url_en; ?>"><img src="lang/en.gif" alt=""></a></li>-->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>