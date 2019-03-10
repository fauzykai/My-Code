<?php
	session_start();
	session_destroy();
	header("location:tampil_logout.php");
?>