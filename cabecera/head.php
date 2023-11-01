<?php
$filename = basename($_SERVER['PHP_SELF']);
$filename = ucfirst(substr($filename,0,strpos($filename,'.')));
 echo '<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RealIsGamer - '.$filename.'</title>
        <link rel="icon" type="image/x-icon" href="images\favicon.ico">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">';

