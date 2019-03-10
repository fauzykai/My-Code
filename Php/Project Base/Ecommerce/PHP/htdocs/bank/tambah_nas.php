<? 
mysql_connect("localhost","root","");
mysql_select_db("bank");
$sql ="insert into tnasabah
 values ('$Rekening','$Nama','$Jeniskelamin','$TTL','$Fakultas','$Jurusan','$Alamat','$Telp')";
$hasil=mysql_query($sql);
echo "Data telah disimpan ";
?>