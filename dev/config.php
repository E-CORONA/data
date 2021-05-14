<?php

$DB_SERVER = '//localhost/orcl';
$DB_USERNAME = 'ecoron';
$DB_PASSWORD = 'qwerty123'; 

$conn = oci_connect($DB_USERNAME, $DB_PASSWORD, $DB_SERVER);

if($conn === false){
    echo ("ERROR: Could not connect. " );
}
else{
    echo 'Success!'; 
}

oci_close($conn);

?>