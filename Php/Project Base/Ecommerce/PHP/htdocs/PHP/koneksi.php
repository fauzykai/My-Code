<?php
	$server = "localhost";
	//$username = "root";
	//$password = "root";
	$database = "dataphp";
	
	//koneksi dan memilih database di server
	mysql_connect($server, "root", "") or die("Gagal");
	mysql_select_db($database) or die("Database tidak ditemukan");
?>