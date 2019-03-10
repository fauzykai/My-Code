<html>
 <h3>
 <center>
 Masuk Data Mahasiswa
 </h3>
 <form method="post" action="masuk.php">
 <hr>
 <center>
 <table border=0>
 <tr><td>NIM <td><input name=nim size=10>
 <tr><td>Nama <td><input name=nama size=30>
 <tr><td>Alamat <td><input name=alamat size=50>
 <tr><td>Kota <td><input name=kota size=30>
 <tr><td>Telepon <td><input name=telp size=20>
 </table>
 <hr>
 <input type=submit value=Proses name=submit>
 <input type=reset>
 <?
 if($submit)
 {
 include "koneksi.php";
 if($nim!='')
 {
 if($conn)
 {
 mysql_query("insert into mahasiswa values
('$nim','$nama','$alamat','$kota','$telp')");
 echo "<br><br>Masukan data Sukses";
 mysql_close($conn);
 }
 else
 {
 echo "<br><br>Simpan Data Error";
 }
 }
 else
 {
 echo "<br><br>NIM harus diisi";
 }
 }
 ?>
