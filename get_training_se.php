<?php

require 'conn2.php';

$first= mysqli_query($conn, "SELECT * FROM criminal");

$i=1;

while($row=mysqli_fetch_array($first)){
    $name=$row["name"];
    $location=$row["url"];
    
    $array[0][0]=mysqli_num_rows($first);
    
    $array[$i][0]=$name;
    $array[$i][1]=$location;
    
    $i++;
}

echo json_encode($array);

?>