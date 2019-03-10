<?php
session_start();
$iduser=$_POST['iduser'];
$password=$_POST['password'];
include "koneksi.php";
$iduser = stripslashes($iduser);
$password = stripslashes($password);
$username = mysql_real_escape_string($iduser);
$password = mysql_real_escape_string($password);

$login=mysql_query("SELECT * FROM tuser WHERE IdUser='$iduser'");
$ketemu=mysql_num_rows($login);
$data=mysql_fetch_array($login);
$atribut = mysql_fetch_assoc($login);

//echo $data[password];
	if (($data[$ketemu-1] == $iduser) and ($data[$ketemu]==$password))
	{
		//session_register("namauser");
		//session_register("passuser");
		$_SESSION['iduser'] = $data['IdUser'];
		$_SESSION['namauser']=$data['NamaUser'];
		$_SESSION['passuser']=$data['Password'];
		$_SESSION['alamattoko'] =$data['KodeToko'];
		$_SESSION['status'] =$data['Status'];
		//echo  $_SESSION['status'];
		if($data['Status']=='ADMIN')
		{
			$status='ADMIN';
			header("location:tampil_admin.php");
		}
		else if($data['Status']=='OWNER')
		{
			$status='OWNER';
			header("location:tampil_owner.php");
		}
		else if($data['Status']=='MEMBER')
		{
			$status='MEMBER';
			header("location:tampil_member.php");
		}
		//
	    //exit;
	}
	else
	{
		
		header("location:index.php");
	}

?>
