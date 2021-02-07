<?php

if (isset($_GET['lang']) && !empty($_GET['lang'])) {

    $lang_param = $_GET['lang'];
    $lang = parse_ini_file("lang/".$lang_param.".ini");

    $_SESSION['lang'] = $lang_param;

} else {

    $lang_param = "hu";
    $lang = parse_ini_file("lang/".$lang_param.".ini");

    $_SESSION['lang'] = $lang_param;

}

?>