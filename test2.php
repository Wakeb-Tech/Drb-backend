<?php 

$array = array(
    array(
            'id' => 2,
            'name' => 'Jane Smith',
            'email' => 'jane@example.com',
    ),
    array(
            'id' => 3,
            'name' => 'Jack Smith',
            'email' => 'Jack@example.com',
    ),
    array(
            'id' => 1,
            'name' => 'John Smith',
            'email' => 'john@example.com',
    ),
);

function cmp_by_optionNumber($a, $b) {
  return $b["id"] - $a["id"];
}
usort($array, "cmp_by_optionNumber");

var_dump($array);

?>
