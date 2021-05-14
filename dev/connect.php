<?php
// Create connection to Oracle
$conn = oci_connect("ecoron", "qwerty123", "//localhost/orcl");
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {
   print "Connected to Oracle!";
}
// Close the Oracle connections
oci_close($conn);
?>