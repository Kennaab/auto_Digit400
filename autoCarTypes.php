<ul>
<?php
    require_once("config.php");
    $year = htmlspecialchars($_GET["li"]);
    $contents = REST_PATH . "/db/auto-queries/carTypes.xql";
    $result = file_get_contents($contents);
    echo $result;
?>
</ul>