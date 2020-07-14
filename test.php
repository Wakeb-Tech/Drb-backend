<?php


$string = ' #hashtag #ali  برشلونه#';

preg_match_all('/#([^\s]+)/', $string, $matches);
$hashs = [];
foreach ($matches[0] as $hashtag)
     $hashs[] = $hashtag;
 var_dump($hashs);
    
// preg_match("/#(\\w+)/", $string, $matches);
// $hash = $matches[0];
// var_dump( $hash);

