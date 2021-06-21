<?php
function pre($arr = [], $quit = false) {
    echo "<pre>";
    print_r($arr);
    echo "</pre>";

    if($quit) exit;
}