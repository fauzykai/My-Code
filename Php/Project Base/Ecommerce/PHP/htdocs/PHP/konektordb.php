<?php
$server="localhost";
$database="dataphp";
mysql_connect($server,"root","") or die("gagal");
mysql_select_db($database) or die("database tidak ditemukan")
?>
