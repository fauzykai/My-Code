<?php
session_start();
$iduser=$_POST['username'];
$password=$_POST['password'];
include "koneksi.php";
$iduser = stripslashes($iduser);
$password = stripslashes($password);
$username = mysql_real_escape_string($iduser);
$password = mysql_real_escape_string($password);

$login=mysql_query("SELECT * FROM user WHERE username='$iduser'");
$ketemu=mysql_num_rows($login);
$data=mysql_fetch_array($login);
$atribut = mysql_fetch_assoc($login);

//echo $data[password];
	if (($data[$ketemu-1] == $iduser) and ($data[$ketemu]==$password))
	{
		//session_register("namauser");
		//session_register("passuser");
		$_SESSION['username'] = $data['username'];
		//echo  $_SESSION['status'];
		//
	    //exit;
		header("location:index.php");
	}
	else
	{
		
		header("location:login.php");
	}

?>
