<form action="masuk.php" methode=post>
<?	
  mysql_connect("localhost","root","");
  mysql_select_db("bank");
  $sql ="select password from login where username='$username'";
  $hasil=mysql_query($sql);
  $row=mysql_fetch_row($hasil);
  
  list($password)=$row;
  
  if ($password == $pass)
	{  echo "<center><font face=Arial Rounded MT size=4>Anda Berhasil Masuk, Klik Tombol Untuk Melanjutkan <br><br>"; 
    		echo "<tr><tdr><input type=submit  value=Masuk > ";
 	}
  else
    echo "<center><font face=Arial Rounded MT size=4>Password Salah, Silahkan Ulangi Lagi  , Klik Tanda Back di Browser Anda";
   
?>

