<?php
include "koneksi.php";
	$kodedaftar =$_GET['id'];
	
	$login=mysql_query("SELECT * FROM t_tempdaftar WHERE KodeDaftar='$kodedaftar'");
	$ketemu=mysql_num_rows($login);
	$data=mysql_fetch_array($login);
	$atribut = mysql_fetch_assoc($login);
	$idUser="M".$kodedaftar;
	$password=$kodedaftar."M";
	$status="MEMBER";
	$statusToko=$data['Status'];
	$namaLengkap = $data['NamaLengkap'];
	$noKTP = $data["NoKTP"];
	$tglLahir = $data["TglLahir"];
	$jk = $data["JenisKelamin"];
	$alamat = $data["Alamat"].",".$data["Kota"].",".$data["KodePos"];
	$noTlp = $data["NoTelepon"];
	$email = $data["Email"];
	$kodeToko = $data["KodeToko"];
	$jenisBarang = $data["JenisBarang"];
	$idToko = $kodeToko;
	$namaToko = $data['NamaToko'];
	$alamatToko = substr($idToko,1);
	
	mysql_query("INSERT INTO ttoko(KodeToko, NamaToko, AlamatToko, IdUser) VALUES ('$idToko','$namaToko','$alamatToko', '$idUser')");
	
	mysql_query("INSERT INTO tuser (IdUser, Password, NamaUser, JenisKelamin, Alamat, TanggalLahir, Status, StatusToko, NoKTP, NoTelp, Email, KodeToko, JenisBarang)
	VALUES ('$idUser', '$password', '$namaLengkap', '$jk', '$alamat', '$tglLahir', '$status', '$statusToko', '$noKTP', '$noTlp', '$email', '$idToko', '$jenisBarang')");

	mysql_query("UPDATE T_DetailToko SET StatusIsi='Y' WHERE KodeToko='$idToko'");
	
	$query=mysql_query("delete from t_tempdaftar where KodeDaftar='$kodedaftar'");
	if($query)
	{
	header("location:tampil_admin.php");
	}
    else
    {
	echo "gagal hapus data";
	}
	
?>