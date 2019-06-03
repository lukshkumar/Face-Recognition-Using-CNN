<?php

require 'conn2.php';

$name= $_GET["name"];
$desc= $_GET["desc"];

if($name!='0'){

    $first= mysqli_query($conn, "SELECT * FROM criminal WHERE name='$name' ");
    $second= mysqli_fetch_array($first);
    
    $crim_id=$second["criminal_id"];
    $jail_id=$second["jail_id"];
    
    
    $first=mysqli_query($conn, "INSERT INTO notification VALUES (null, $crim_id, '$name','$desc','1') ");
    
    $first= mysqli_query($conn, "INSERT INTO activities_illegal VALUES (null, '$date_time','$crim_id','$jail_id') ");

}else{
    $first=mysqli_query($conn, "INSERT INTO notification VALUES (null, null, 'Unknown','$desc','1') ");
}

if($first){
    echo "success";
}else{
    echo "fail";
}

?>